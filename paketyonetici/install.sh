#!/bin/bash

echo "Paket Yoneticisine Hos Geldin!"

if [ "$1" == "kur" ]; then
   shift
    for pkg in "$@"; do
   echo  "Paketiniz kuruluyor: $pkg"
     sudo apt install -y "$pkg"
    done 
  elif [ "$1" == "kaldir" ]; then
shift 
     for pkg in "$@"; do
      echo "Paketiniz Kaldiriliyor: $pkg"
      sudo apt remove -y "$pkg"
    done 
  
     else 
      echo " Kullanim: ./install.sh kur <paket> | kaldir <paket>"
fi
