#!/bin/sh

/usr/bin/aticonfig --adapter=0 --od-enable
/usr/bin/aticonfig --adapter=0 --od-setclocks=300,200
/usr/bin/aticonfig --adapter=0 --od-commitclocks
/usr/bin/aticonfig --adapter=0 --od-getclocks
/usr/bin/aticonfig --adapter=0 --od-gettemperature

