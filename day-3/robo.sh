#!/bin/bash

declare -A visited

visited=( ["0 0"]=0 )

function getX {
    ([[ "$1" == ">" ]] && echo 1) || ([[ "$1" == "<" ]] && echo -1) || echo 0
}

function getY {
    ([[ "$1" == "^" ]] && echo 1) || ([[ "$1" == "v" ]] && echo -1) || echo 0
}

#santa coordinates, we can omit declaration
X=0
Y=0

#robo coordinates, we can omit declaration
roboX=0
roboY=0

#who moves now
currentMove=1

#Reading is ultra slow here
while read -r -n1 char || [[ -n "$char" ]]; do
    [[ $currentMove == 1 ]] && {
        X=$(($X + $(getX "$char") ))
        Y=$(($Y + $(getY "$char") ))
        visited["$X $Y"]=$(( ${visited["$X $Y"]} + 1 ))
        currentMove=0
    } || {
        roboX=$(($roboX + $(getX "$char") ))
        roboY=$(($roboY + $(getY "$char") ))
        visited["$roboX $roboY"]=$(( ${visited["$roboX $roboY"]} + 1 ))
        currentMove=1
    }
done

echo ${#visited[@]}
