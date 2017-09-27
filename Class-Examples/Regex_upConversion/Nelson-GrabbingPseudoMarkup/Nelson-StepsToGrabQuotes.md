#Marking Quotation Marks in an Already Upconverted File  
  
In real life project work sometimes you think you have finished marking up a file and then realize their is more to markup. Sometimes it is best to start the upconverting process over again. Sometimes you can continue upconversion even after the document is turned into XML.  
  
For this example use this file: *NelsonProject-BarkleyS1.xml*    
  
The file already has the major structural divisions: headlines, title, section, paragraphs, and pagebreaks when decide to also mark and remove quotation marks.  

The following is the step-by-step thinking process to mark quotation marks without marking quotation marks used in elements' attributes:  
  
First needed to determine how many instances of text inside quotation marks  
**Find:** `".+?"` -- dot matches all checked -- (95 results)  
  
Need to separate out different instances where quoted text occurs: beginning of paragraphs, inside paragraphs, as part of attributes.  
  
Finding quoted material starting at paragraph beginnings  
**Find:**  `<p>"(.+?)"` -- dot matches all checked -- (50 out of 95)  
**Replace:** `\1<q>\2</q>`  
  
Finding quoted material inside of paragraphs that are not attribute related  
**Find:** `\s+(?<!=)"(.+?)"` -- dot matches all checked -- (12 out of 95)  
So now have found 62 of the quoted material out of the original 95.  
**Replace:** `<q>\1</q>`  
  
Finding quotation marks as part of attributes to check the number of results is the remaining 33 of original 95.  
**Find:** `".+?"` -- dot matches all checked -- (33 results)  
  
Huzzah, success!  

  
