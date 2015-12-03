#!/bin/bash

declare -A visited

visited=( ["0 0"]=1 )

function getX {
    ([[ "$1" == ">" ]] && echo 1) || ([[ "$1" == "<" ]] && echo -1) || echo 0
}

function getY {
    ([[ "$1" == "^" ]] && echo 1) || ([[ "$1" == "v" ]] && echo -1) || echo 0
}

#santa coords
X=0
Y=0

#Reading is ultra slow here
while read -r -n1 char || [[ -n "$char" ]]; do
    X=$(($X + $(getX "$char") ))
    Y=$(($Y + $(getY "$char") ))
    visited["$X $Y"]=$(( ${visited["$X $Y"]} + 1 ))
done

echo ${#visited[@]}
