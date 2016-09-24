**Class Example 2016-09-23**
*The Shunned House by H.P. Lovecraft*
  
  
Removed excess Project Gutenberg metadata from beginning and end.  
Adjusted odd line spacing interrupting title.  
Search for reserved XML characters (found one `&` and replaced with `&amp;`).  
   
Remove extra line spaces to make uniform text in preparation to wrap chunks of text in p elements.  
	**Find:** `\n{3,}`  
	**Replace:** `\n\n`  
  
Wrap paragraphs using "close-open strategy"  
	**Find:** `\n\n` (92 results)  
	**Replace:** `</p>\n\n<p>` 
*Remove the erroneous closing `</p>` from beginning and add it to last paragraph in document that is missing one.   
  
**Notice this put `<p>` elements around parts of the document that might not necessarily be paragraphs; however, the `<p>` tags on those other document parts give us handles to grab on to and will be easily removed later.**  
  
Wrap numbered sections using "close-open strategy"  
	**Find:** `<p>(\d)</p>` (4 results)  
	**Replace:** '</section><section n="\1">`  
*Add `<section n="1">` after first two blocks of text wrapped in `<p>` tags, and add `</section>` at the end of the document before the "Transcriber's Note". While doing this manually surround the beginning two paragraphs in `<preface>` element, and adjust the "Transcriber's Note" into a single paragraph with an appropriate label. I used `<note>`  
  
Might as well also add in the `<title> and `<byline>` elements too!  
  
Prepare to create self-closing element for ampersand divisions and removing excess white space at the start of any paragraph elements.  
	**Find:** `(<p>)\s+`  
	**Return:** `\1`  
  
Remove ampersand division and replace with self-closing element to mark divisions.  
	**Find:** `<p>\*.+</p>$` (8 results)  
	**Return** `<anchor type="division" subtype="asterisk"/>` 
  
Just some clean-up:  
	Removing extra whitespace at line starts  
		**Find:** `^\s+`  
		**Replace:** --leave blank--  
  
Add root element, save as XML, and re-open document to check for formedness issues!
  
##Extra Challenge:
**Notice there are indications of illustrations sitting inside of square brackets that we have erroneously surrounded in `<p>` elements. How could we remove the bracket pseudo-markup and re-tag those?**	
