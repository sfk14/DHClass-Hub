##In-Class Example from 2017-02-15  
###Using ForsterGeorgComplete.xml  
  
get placeName elements with contents that do not start with a capital letter - `//placeName[matches(.,"^[a-z]")]`  
  
get paragraphs with the word "sail" somewhere in the contents - '//p[contains(.,"sail")]`  
  
get a string-joined list of all the placeNames separated by a comma and a whitespace - `string-join(//placeName,", ")`  
  
get the first paragraph with more than one placeName and create a string-joined list of the distinct-values of the chidlren placeNames separated by a comman and a whitespace - `(//p[count(placeName) gt 1])[1]/string-join(distinct-values(placeName),", ")`
Notice this expression `(//p[count(placeName) gt 1])[1]/string-join(distinct-values(descendant::placeName),", ")` gets you the distinct-values of all the descendant placeNames  