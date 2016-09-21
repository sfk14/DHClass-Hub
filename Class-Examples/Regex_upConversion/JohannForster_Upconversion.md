## Upconverting the table of contents of Johann Forster's Journal of the Voyage round the world (1778)

### Document Analysis

First, survey the document to decide how we want to tag it. We want a structure like this:
````
<xml>
    <title>Title of the Book</title>
    <chapter>
       <heading>Chapter heading</heading>
            <section>
              <heading>Section heading</heading>
                   <subSec>Subsection</subSec>
                   <subSec>Subsection</subSec>
                   <subSec>Subsection</subSec>
               </section>
      </chapter>
     ...   
</xml>
````
### Regex Up-Conversion Steps

1. In oXygen, go to Options, Preferences, and choose Editor, and check the options to show TAB, NBSP, EOL, EOF marks, and to Show whitespaces.  

2. Open the Find & Replace window, select "Regular expression." We'll work on this from the "inside out". Since there are more section headings than anything else, we'll tag every line as that. The dot (or period) matches *any* character including white spaces. We'll turn off "Dot matches all" for this, because want to isolate the lines of text and NOT match on hard returns.
**Find:** `^.+$`
**Replace:** `<subSec>\0</subSec>`
  
**Note:** 
* caret and dollar sign bring up the start and the end of a line, respectively. They're not actually characters, so they aren't ever replaced, but they are sort of like flags. 
* \0 means capture the *entire expression*. 
Now all of the lines are wrapped in `<item>` tags.   

3. We'll manually tag the top line as the `<title>` and remove the `<item>` tags around it, since there's only one of it. We'll pop some <lb/> elements in to preserve those interesting line breaks.  

4. Let's find and wrap the sections in their <section> element, and remove some of the extra <item> elements. Remember, we need to wrap the *entire* section list, with all its items inside. We typically use a "close-open" strategy for this kind of thing, so we *only* have to find the start of each section in order to find the end of the previous one.   

**Note:** That "close-open" strategy is always going to create a little tangle: at the top of each section list will be an extra closing `<section/>` tag, that's missing at the end. That's okay--we just have to remember to clean that up in a later stage, when we deal with the chapter div "wrapper" elements.

We begin to use *capturing groups* with parentheses here, to hold *only* the part of the regular expression we want to keep in the Replace. We use \1, \2, \3 to refer to the first, second, and third set of parentheses in a sequence. (In this example, we'll use just one capturing group.)

**Find:** `<subSec>(Sect\.\s\d.+)</subSec>$`

**Replace:** `</section><section><head>\1</head>`

 See how we *close* a previous section and *open* a new section at the same time that we open a new one? We also wrapped the capturing group in its own `<head>` element, to hold the title of the section. That tag opens first and then closes since it's fully contained within our single line.
 
5. Let's work on wrapping the chapters now, and we can clean up the issue with placement of closing section tags, too. Remember, literal characters are perfectly viable regular expressions when they are used regularly! We are using a character set to match on the Roman numerals in the chapter headings.

**Find:** `<subSec>C H A P T E R [IVX]+\.</subSec>`

This finds each chapter title. Let's keep going to see if we can grab the heading right after it. To help with this, we're turning on "Dot matches all" so we can match any character at all, including newline characters. We'll use **`.+?`** as a "lookahead" to match up to the first `</subSec>` we see, and keep going to hunt for those extra `</section>` tags. 

**Find:** 
`<subSec>C H A P T E R [IVX]+\.</subSec>.+?</subSec>\n</section>`

Let's work on our capturing groups! What do we want to keep and what do we want to exclude? Keep what we want inside parentheses, and separate them based on what we want to enclose in tags:

**Find:** 
`<subSec>(C H A P T E R [IVX]+\.)</subSec>(.+?)</subSec>\n</section>`

**Replace:** `</section></chapter><chapter><head>\1<lb/>\2</head>`

Notice how we cleaned up our `</section>` tag mess here, by effectively moving those tags to where they belong. Then we wrap our chapters using our close-open strategy, and wrap their titles in a head tag. We used a `<lb/> to separate out the parts of the chapter heading.

6. Our chapter headings still have <subSec> tags in them. We can use a regular expression match to remove those:

**Find:** `<chapter><head>.+?<subSec>.+?</head>`

Wrap the parts we want to keep in capturing groups, and replace:

**Find:** `(<chapter><head>.+?)<subSec>(.+?</head>)`

**Replace:** `\1\2`

7. Time to put an xml root element on this, save it. 
Close the file and reopen it so oXygen will read it as an XML file, and see if it validates! 
It doesn't, but we can repair the problems by hand. There are still some extra tags we need to remove from the start of the document and some close tags to add ot hte end of it. 
We should also clean out the tabs (which were "pseudomarkup" in the original document) in front of the subsection headings. 
We don't need those in the text, since the element tags perform the same function and are "real" markup now. 
To clean out the tabs in front of the numbered subsections, look for \s+, the regular expression for one or more white-space characters, and replace with nothing:

**Find:** `(<subSec>)\s+(\d)`
**Replace:** `\1\2`

At this point, pretty print the document to admire the XML nested hierarchies we've created!
Voila! We have up-converted a complex table of contents file from plain text with pseudomarkup into XML using regular expression matching! 

