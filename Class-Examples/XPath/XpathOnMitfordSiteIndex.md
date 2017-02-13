## In-Class Example 2017-02-13 on the Digital Mitford Site Index  
  
Open URL in oXygen.  
Go to File -> Open URL -> `http://digitalmitford.org/si.xml`  
  
  
Want to know all the elements **that have** a sex attribute.  
`//*[@sex]`  
  
Get a count of these elements.  
`count(//*[@sex])`  
  
What are those element names?  
`//*[@sex]/name()`  

What’s the XPath to return the parent elements (whatever they are) of @sex?  
`//@sex/parent::* or //@sex/..`  
  
Modify the previous to just get the parent names.  
`//*[@type]/name() or //@type/../name()`  
    
Want to know the name of all elements that have type attribute.  
`//*[@type]/name()`  
  
Want a list to be rid of the repeat returns (a.k.a. just get the **distinct values**).  
`distinct-values(//*[@type]/name())`  
  
Let's get all the people that have more than 1 surname...  
`//persName[count(surname) gt 1]`  
  
How about all the people that have 3 or more surnames...  
`//person//persName[count(descendant::surname) ge 3]`  
  
Now get a count of the people with 2 or less surnames...  
`count(//person//persName[count(descendant::surname) le 2])`  
  
    
`//persName[count(forename) gt 1][count(surname) gt 1]` -- people with more than 1 forename and more than one surname  
`(//persName[count(forename) gt 1][count(surname) gt 1])[last()]` -- only the last person with more than one forename and more than one surname (_notice we use parenthesis to group_)  
  
`(//persName[count(forename) ge 2][count(surname) ge 2])[1]/surname[1]/text()` -- just the text of the surname of the first person with 2 or more forenames and 2 or more surnames  
  
`(//persName[count(forename) ge 2][count(surname) ge 2])[1]/descendant::*/name()` -- the descendant elements of the first persName with 2 or more forenames and 2 or more surnames descendants  
  
`distinct-values((//persName[count(forename) ge 2][count(surname) ge 2])[1]/descendant::*/name())` -- a **distinct values** list of those previous elements  
