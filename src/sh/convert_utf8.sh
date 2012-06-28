#!/bin/bash
for(( i=1 ; i <= 4000 ; i++ )) {
  nkf -w --overwrite $i.xml
}

for(( i=1 ; i <= 4000 ; i++ )) {
  nkf -g $i.xml
}
