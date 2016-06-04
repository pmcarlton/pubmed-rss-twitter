#!/bin/bash

while read TEXT; do
  echo $TEXT | $(HOME)/bin/ttytter.pl -keyf=$(HOME)/$KEYFILE -script ;
  sleep 2
  echo $TEXT >> $(HOME)/logs/5hmclog.txt
  date >> $(HOME)/logs/5hmclog.txt
  done

exit 0
