# SVG Exercise 2 (Mitford Letter Timeline Part 1)  
  
````
xquery version "3.0";

declare default element namespace "http://www.w3.org/2000/svg"; 

declare namespace tei="http://www.tei-c.org/ns/1.0"; 
declare variable $mitfordColl := collection ('/db/mitford');
declare variable $lettersColl := collection('/db/mitford/letters');

declare variable $letterFiles := $lettersColl/*;
declare variable $letterDates := $lettersColl//tei:teiHeader//tei:msDesc//tei:head/tei:date/@when/tokenize(string(), '-')[1];

declare variable $distinctYears := distinct-values($letterDates);
declare variable $countYears := count($distinctYears);
declare variable $maxYear := xs:integer(max($distinctYears));

declare variable $minYear := xs:integer(min($distinctYears));

declare variable $countingYears := $maxYear - $minYear;

declare variable $dayInterval := $countingYears * 365;
declare variable 
$ThisFileContent :=

<svg width="500" height="3000">
   
<g transform="translate(30, 100)">
     
<line x1="100" y1="0" x2="100" y2="{$dayInterval}" style="stroke-width:50; stroke:#646F58"/>
  
      
    
         	{
	for $i in (0 to $countingYears)

             			let $hashInterval := $i * 365
             
				let $date := $i + $minYear
 
		       	 	let $lettersLink := $letterDates[xs:integer(tokenize(string(),'-')[1]) = $date]
             
				let $countLetters := count($lettersLink)
             
				return
                
<g>
                
<line x1="50" y1="{$hashInterval}" x2="200" y2="{$hashInterval}" style="stroke-width:5; stroke:black"/>
                
	<text x="10" y="{$hashInterval}">{$date}</text>
                
	<circle cx="100" cy="{$hashInterval}" r="{$countLetters}" fill="#FFFFFF"/>
                
	<text x="210" y="{$hashInterval}">Letters Coded in {$date} = {$countLetters}</text>
                
</g>

			}
       
</g>

</svg>;

let $filename := "Parker_timeline.svg"
let $doc-db-uri := xmldb:store("/db/rParker", $filename, $ThisFileContent)

return $doc-db-uri
````