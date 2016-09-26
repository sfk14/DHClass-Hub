#Steps to Converting a Lope Play in Plain Text into XML  
  
Check for reserved XML characters (0 results)  
  
Remove excess whitespace at start and end of lines =  
  **Find:** `^\s+` (292 results)     **Replace:** none  
  **Find:** `\s*$` (2569 results)    **Replace:** none  
  
Surround every line in a `<l>` element =  
  **Find:** `.+` (1498 results)     **Replace:** `<l>\0</l>`  
  
Grabbing line numbers and placing them inside of `<l>` elements =  
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
  