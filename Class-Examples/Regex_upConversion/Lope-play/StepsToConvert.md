# Upconverting Lope De Vega Play  
  
Surround every line in a `<l>` element =  
  **Find:** `.+` (1498 results) **Replace:** `<l>\0</l>`  
  
Grabbing line numbers and placing them inside of `<l>` elements =  
First need to find line numbers that are sitting on line below line of dialogue  
  **Find:** `<l>(.+)</l>\n<l>(\d+)</l>` (16 results)  
  **Replace:** `<l n="\2">\1</l>`  
Then need to find other lines containing line numbers  
  **Find:** `(\d+)</l>` (193 results)  
  **Replace:** `<n>\1</n></l>`  
  **Find:** `<l>(.+)<n>(.+)</n></l>` (193 results)  
  **Replace:** `<l n="\2">\1</l>`  
Remove extra whitespace inside of <l> elements *(only at the end of line elements)  
  **Find:** `\s+(</l>)` (193 results)  
  **Replace:** `\1`  
  
Finding character names -- *except those in cast list* (make sure case sensitive is checked!)  
  Find: `<l>([A-ZÉÁÑÍÚ]+)(\s*[A-ZÉÁÑÍÚ]*)\s*</l>` (256 results)  
  Replace: `<spkr>\1\2</spkr>`  
  
  
### Find all text inside of square brackets:  
`\[.+?\]` (64 results)  
  
Determine what each text in square brackets indicate.  
  
Scene Separation: `\[Escena.+?\]` -- (25 results)  
  **Find:** `<l>\[Escena\s*([IXV]+)\]</l>`  
  **Replace:** `</scene><scene n="\1">`  
Manually move closing </scene> tag from beginning to end.  
  
Verse Form Indicators: `\[.+\.\]` -- (16 results)  
NOTE: [Vanse.] has been mismarked by the pseudo-markup and is actually a stage direction (other stage directions are in parenthesis)  
  **Find:** `<l>\[(.+)\.\]</l>` Change square brackets around two instances of [Vanse.] to parenthesis  
  **Find:** `<l>\[(.+)\.\]</l>` -- (14 results)  
  **Replace:** `<anchor type="\1"/>`  
*NOTE: some of the verse forms have whitespaces because of multiple words; this introduces whitespace into attribute values and will need attention later*  
  
Determine what else is in square brackets.  
  **Find:** `\[(.+)\]`  
Notice another instance of stage direction in square brackets: `[Aparte.]` -- meaning aside  
  **Find:** `\s*\[(Aparte.)+\]` -- (5 results)  
  **Replace:** `(\1)`  
  
Determine what else is in square brackets.  
  **Find:** `\[(.+)\]` -- (18 results)  
Notice there are a few instances where character names have been surrounded by square brackets: [UN PINTOR] and [GENTE] and part of SAN[CHO]
We can manually fix those by removing the square brackets.  
  
The rest of the text in square brackets seem to be the pseudo-markup indicating something was incorrectly transribed or missing. We are going to change these to be contained inside of <sic> elements.  
  **Find:** `\[(.+)\]` -- (15 results)  
  **Replace:** `<sic>\1</sic>`  
  
Do a final search for square brackets  
  **Find:** `\[` -- (0 results)  
  
### Finding Stage Directions and Text in Parenthesis  
  
Determine contents inside of parenthesis.  
  **Find:** `\(.+?\)`  *dot matches all checked*  
*NOTE: Parenthesis surround stage directions (but there seems to be instances where there are stage directions missing the parenthesis that are separated with interesting line returns and whitespace we captured in empty <l> elements from beginning steps). Parenthesis also surround dialogue that is said as an aside.  
  
Find stage directions surrounded by parenthesis that span only a single line since the text in parentheis seems to indicate the dialogue that is said aside and should be grabbed differently.  
  **Find:** `<l>\s*\((.+)\)\s*</l>`  *dot matches all NOT checked*
  **Replace:** <stageDirection>\1</stageDirection>  
  
Now `\(.+?\)`  *dot matches all checked*  finds only the text that is said as an aside. There are 5 results. If we want to grab all of the aside lines and put them in a lg (line group) need to capture <l> elements. Note: There is one aside dialogue that has a starting line element that has a number attribute on it; need to manually surround these lines with line group and remove parenthesis or do a find for the line that has an n attribute. Since only one I did this manually and then found the other 4 results:  
  **Find:** `(<l>)\((.+?)\)(</l>)`  *dot matches all checked*
  **Replace:** `<lg type="aside">\1\2\3</lg>`  
  
Finding stage directions that were not surrounded in parenthesis but are marked with empty `<l>` elements and line returns.  
First grabbing and removing empty `<l>` elements that are before stage directions already marked.  
  **Find:** `<l>\s*</l>\s*(<stageDirection>)`  
  **Replace:** `\1`  
Then grabbing and removing empty `<l>` elements that are before verse form anchors already marked.  
  **Find:** `<l></l>\n*(<anchor)`  
  **Replace:** `\1`  
Then grabbing and removing empty `<l>` elements that are before closing scene elements anchors already marked.  
  **Find:** `<l></l>\n*(</scene)`  
  **Replace:** `\1`  
Finding stage directions not in parenthesis based off of unique line returns and empty `<l>` elements  
  **Find:** `<l></l>\n<l>(.+)</l>\n{2}`  
  **Replace:** `<stageDirection>\1</stageDirection>`  
Clean up other instances of empty line elements now that they are not needed.  
  **Find:** `<l>\s*</l>`  
  **Replace:** --nothing--  
Clean up extra line returns now that they are not needed.  
  **Find:** `\n{2,}`  
  **Replace:** --nothing--  
  
### Finishing Up  
  
MANUALLY, insert a root element.  
Save as .xml, close, and re-open in oXygen to check for well-formedness.  
  
Noticed, from outline view in oXygen, there are parts of the document still in `<l>` elements that are not lines of dialogue.  
MANUALLY, edit the last line of act (Fin del Primer Acto) to be inside of <note> element instead of `<l>` element.  
MANUALLY, edit the author, title, and other beginning lines: `<title type="play">Peribez y el Comendador de Ocaa</title><author>Lope de Vega</author><note>Arriba Abajo</note><title type="act" n="1">Acto I</title>`  
MANUALLY, put character list in a `<characterList>` element, and change declaration line to a note element: `<note>Figuras del primer acto</note>`  
Then need to remove <l> elements around characters and roles. Tag appropriately:  
  **Find:** `<l>([A-ZÉÁÑÍÚ]+\s*[A-ZÉÁÑÍÚ]*\s*[A-ZÉÁÑÍÚ]*\s*[A-ZÉÁÑÍÚ]*),\s+([a-z]+\s*[a-z]*)\.</l>` *gets characters with roles after name*  
  **Replace:** `<character>\1</character> <role>\2</role>`  
  **Find:** `<l>([A-ZÉÁÑÍÚ]+\s*[A-ZÉÁÑÍÚ])*\.</l>` *gets characters without roles*  
  **Replace:** `<character>\1</character>`  
Realized didn't grab two. Manually fixed!
All is well-formed and looks good in outline view; huzzah!