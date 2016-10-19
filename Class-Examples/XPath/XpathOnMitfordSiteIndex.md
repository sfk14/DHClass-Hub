## In-Class Example 2016-10-07 on the Digital Mitford Site Index  
  
Open URL in oXygen.  
Go to File -> Open URL -> `http://digitalmitford.org/si.xml`  
  
  
Want to know all the elements that have sex attribute.  
`//*[@sex]` 
Get a count of these elements.  
`count(//*[@sex])` #800 in Window  
What are those element names?  
`//*[@sex]/name()`  
  
  
Want to know all elements that have type attribute.  
`//*[@type]/name()`  
Want a list rid of the repeat a.k.a. just get the **distinct values**.  
`distinct-values(//*[@type]/name())`  
