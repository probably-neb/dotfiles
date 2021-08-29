#!/usr/bin/bash

   if [ $(ifconfig wlan0 | grep UP | wc -l) -eq 1 ]
   then
     _linkQual="`iwconfig wlan0 | grep Quality | cut -d'=' -f2 | cut -d' ' -f1 | cut -d'/' -f1`"
 
     if [ $_linkQual -gt 52 ] # >75% link qual
     then
       _linkSparked=$(spark 1 2 3 4)
     elif [ $_linkQual -gt 35 ] # >50% link qual
     then
       _linkSparked=$(spark 1 2 3 0)
     elif [ $_linkQual -gt 17 ] # 25% link qual
     then
       _linkSparked=$(spark 1 2 0 0)
     elif [ $_linkQual -gt 7 ] # 25% link qual
     then
       _linkSparked=$(spark 1 0 0 0)
     else # < 25%
       _linkSparked=$(spark 0 0 0 0)
     fi

     echo $_linkSparked
   fi

