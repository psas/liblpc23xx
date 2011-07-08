#!/bin/bash

for i in *.c; do
    echo $i.$$
    ./tolib.sed < $i > /tmp/$i.$$
    mv /tmp/$i.$$ $i
done

echo done
