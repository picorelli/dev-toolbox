#!/usr/bin/env bash
# Quick benchmark: run a command N times and report avg duration
N="${1:-5}"
CMD="${@:2}"
total=0
for i in $(seq 1 $N); do
  start=$(date +