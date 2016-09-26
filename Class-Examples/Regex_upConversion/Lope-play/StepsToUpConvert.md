#Steps to Converting a Lope Play in Plain Text into XML  
  
  1. Check for reserved XML characters (0 results)  
  
  2. Remove excess whitespace at start and end of lines =  
  **Find:** `^\s+` (292 results)     **Replace:** none  
  **Find:** `\s*$` (2569 results)    **Replace:** none  
  
  3. Surround every line in a `<l>` element =  
  **Find:** `.+` (1498 results)     **Replace:** `<l>\0</l>`  
  
  4. Grab line numbers and place them inside of `<l>` elements =  
First need to find line numbers that are sitting on line below line of dialogue  
  **Find:** `<l>(.+)</l>\n<l>(\d+)</l>` (16 results)  
  **Replace:** `<l n="\2">\1</l>`  
Then need to find other lines containing line numbers  
  **Find:** `(\d+)</l>` (193 results)  
  **Replace:** `<n>\1</n></l>`  
  **Find:** `<l>(.+)<n>(.+)</n></l>` (193 results)  
  **Replace:** `<l n="\2">\1</l>`  
  **Find:** `\s+(</l>)` (193 results)  
  **Replace:** `\1`  
  
  5. Grab speakers =  
  **Find:** <l>[A-Z]+</l> (161 results) -- not catching all speakers  
  Need to create a specific character set that includes Spanish accent marks  
  **Find:** `<l>([A-Z¡…Õ”⁄—‹]+)</l>` (255 results)  
  **Replace:** `</sp>\n<sp><speaker>\1</speaker>`  
  Take `</sp>` element from first speech (on oXygen line 26) and place after the final speech (oXygen line 1737)  
  
  
