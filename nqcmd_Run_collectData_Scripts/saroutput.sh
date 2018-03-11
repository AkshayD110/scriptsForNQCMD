#!/bin/bash
#collects sar network output for 30mins

sar -n DEV 5 360 > ${1}/sarouts/${2}