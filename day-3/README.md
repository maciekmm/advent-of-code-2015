Day 3:
======
- Language chosen: [bash](https://www.gnu.org/software/bash/)
- Description: http://pastebin.com/mchTzsQM
- Input: http://pastebin.com/MKPhezYW

## Tasks:

1. I wanted to avoid using two-dimensional array. I ended up using associative one with "x y" as a key and number of visits as value (not required by the task itself). Also reading character by character is really slow for some reason, I could probably fix that by reading whole input at once. Solution in: [houses.sh](houses.sh)
2. I reused pieces of code from task #1, added some logic for robo-santa. Solution in: [robo.sh](robo.sh)

## Execution

This only works with **bash** shell, thus you have to have one.
1. Give execute chmod to files `chmod +x ./*.sh`
2. Create input file with your favorite text editor or download one from [here](http://pastebin.com/MKPhezYW)
3. Execute scripts `./houses.sh < input` or `./robo.sh < input`.

You can't use `sh house.sh` as it will make the `bash` hashbang being ignored.
