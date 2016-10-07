## In-Class Example 2016-10-07 on the Digital Mitford Site Index  
  
Open URL in oXygen.  
Go to File -> Open URL -> `http://digitalmitford.org/si.xml`  
  
Want to know all the elements that have sex attribute.  
`//*[@sex]` 800 results  
Get a count of these elements.  
`count(//*[@sex])` 800 in Window  
What are those element names?  
`//*[@sex]/name()` 800 results  
  
  
Want to know all elements that have type attribute.  
`//*[@type]/name()`  
Get rid of the repeats and just get the **distinct values**.  
`distinct-values(//*[@type]/name())`  
