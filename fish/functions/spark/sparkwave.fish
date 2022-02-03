function sparkwave
      for i in (seq 100)
         for j in (seq (math $COLUMNS - 1))
             math "ceil(6 * cos(($i + $j) * pi / 5))"
         end | spark | read sparks
         echo -n $sparks\r && sleep .05
      end
      echo
end
