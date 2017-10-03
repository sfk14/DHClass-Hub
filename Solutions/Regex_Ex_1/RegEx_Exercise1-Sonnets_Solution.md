## Solution to Regex Exercise 1: Up-Converting Shakespeare's Sonnets ##
### Step-by-Step explanation: ###
  
In oXygen, go to `Options-->Preferences-->Editor` and mark the box for
showing tabs, whitespaces, etc.
  
For the purpose of this assignment, we began by removing the boilerplate information from project Gutenberg, as well as the "meta" information at the top, which could be easily reintroduced and manually tagged later, before beginning our autotagging.
  
1. Look for special characters: `&`, `<`, and `>`.
  
2. Look for `\n+` and replace with `\n`. This means I've removed all extra
hard returns, so there's only one return after each line.
  
3. Find `^\s+(.+)$` to find each line of text. Replace: `<line>\1</line>` in
order to wrap every line in `<line>`. We'll remove the extra <line>
elements later.
  
4. Now I need to find the Roman numerals, so I can use these to
distinguish each sonnet from the others. Find: `<line>([IVXLC]+)</line>`
Replace: `</sonnet><sonnet n="\1">` This wraps each sonnet in its
own sonnet element, using our "close-open" strategy. I've also chosen to
put the roman numeral as an attribute value.
  
5. At this point, I'm nearly ready to save this as XML. I'll first move
the extra `</sonnet>` from the top of the file to the end where it's missing. 
Then I'll wrap the Title and Author in tags, and wrap the entire file in a root element, 
which I decided should just be `<xml>`.
  
6. I save the file with a `.xml` extension, close it, and reopen it, and wait to see if 
oXygen gives it the green square for well-formed XML. (If it's not well-formed at this point, see 
what's wrong, and see if you can correct it with regex Find & Replace!) 


##Alternate Outside-In Solution:
    
  1. Mannually entered the `<title'>` tag and the `<root>` tag.
  
  2. To wrap roman numerals:  
  **search:** `(^[A-Z]+)\n`  
  **replace with:** `<numerals>\1</numerals>\n`  
  
  3. To wrap sonnets:  
  **search:** `(<numerals>.+</numerals>\n)`  
  **replace:** `</sonnet>\n<sonnet>\1`  
  manually delete `</sonnet>` at the top of the document  
  manually insert `</sonnet>` at the end of document  
  
  4. To wrap lines:  
  **search:** `(^[[A-z]|'].+)`  
  **replace:** `<line>\1</line>`
