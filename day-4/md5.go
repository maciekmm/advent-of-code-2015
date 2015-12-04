package main

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"hash"
	"io"
	"runtime"
	"strconv"
)

const (
	Batch = 1000
)

type Worker struct {
	Prefix    string
	Starting  uint64
	ToExecute uint64
	Result    chan *Result
	Checked   string
	Md5       hash.Hash
}

type Result struct {
	Worker *Worker
	Result uint64
}

func (w *Worker) Start() {
	go func() {
		var i uint64
		outer:
		for ;i < w.ToExecute; i++ {
			io.WriteString(w.Md5, w.Prefix)
			io.WriteString(w.Md5, strconv.FormatUint(w.Starting+i,10))
			// Convert to string
			res := hex.EncodeToString(w.Md5.Sum(nil))
			// Check if right prefix
			if res[:(len(w.Checked))] != w.Checked {
				w.Md5.Reset()
				continue outer
			}
			w.Result <- &Result{w, w.Starting + i}
			return
		}
		w.Result <- &Result{w, 0}
	}()
}

func main() {
	var prefix string
	//omitting error checking
	fmt.Scanf("%s", &prefix)

	var checkedPrefix string
	//omitting error checking
	fmt.Scanf("%s", &checkedPrefix)

	var min uint64
	var workers []*Worker
	var current uint64

	result := make(chan *Result, runtime.NumCPU())

	for i := 0; i < runtime.NumCPU(); i++ {
		worker := &Worker{Prefix: prefix, Result: result, Checked: checkedPrefix, Md5: md5.New()}
		workers = append(workers, worker)
		result <- &Result{Worker: worker} //Set this up later
	}

	for {
		select {
		case res := <-result:
			//If current is not found and result is not found
			if min == 0 && res.Result == 0 {
				res.Worker.Starting = current
				current += Batch
				res.Worker.ToExecute = Batch
				res.Worker.Start()
				//If found smaller number than current one or the first one was found
			} else if (res.Result < min || min == 0) && res.Result != 0 {
				min = res.Result
			}
			
			if min != 0 && (res.Result == 0 || res.Result == min) {
				for k, v := range workers {
					if v == res.Worker {
						// We have results, no need to process further
						workers = append(workers[:k], workers[k+1:]...)
						break
					}
				}
			}

			// Print the solution
			if len(workers) == 0 {
				fmt.Println(min)
				return
			}
		}
	}

}
