# In-Class Example 2016-10-12  
  
*Using the [2015 Coding and Digital Archives Syllabus](http://www.newtfire.org/dh/dhCDA-2015.xml)*  
  
**Understanding Arguments:**  
`distinct-values(//div/@type)` -- distinct-values(arg+)  
The function distinct-values wraps the entire argument.  
  
**Some string functions take multiple arguments:**  
Make a list of the disinct-values of the `@type` attributes of the `<div>` elements separated with `!?`  
`string-join(distinct-values(//div/@type),"!?")` -- string-join(arg+,"text separator")  
  
**"Haystack and Needle" Functions**  
function(haystack arg, "needle arg")  
Let's find the paragraphs when the letters `ed` are used together.  
Two options and they both take two arguments:  
`//p[contains(.,"ed")]` -- contains(arg, "literal string")  
`//p[matches(.,"\d+ed")]` -- matches(arg, "regular expression")  
Find dates formated yyyy-mm-dd  
`//date[matches(@when, "\d{4}-\d{2}-\d{2}")]`  
  
**Working with picture strings of data types**  
path/format type(data type(arg+), 'picture strings to format arg string')  
`//date/format-date(xs:date(@when), '[FN]/ [MNn]/ [Dwo] / [YWw]')`  
What this has done is formatted the text in the document to match your defined pattern in the picture strings.  
  
Now how could you use this string to search for something specific like a certain day of the week or Month?  
  
Let's find all the dates that have Wednesdays:  
`//date/format-date(xs:date(@when), '[FN]/ [MNn]/ [Dwo] / [YWw]')[contains(., "WEDNESDAY")]` -- get 15 results  