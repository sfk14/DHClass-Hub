**What it means to set a pattern?**  
rule context --- The context is any node in the document wherever it is that matches on what is specified in the context; whereas, in the XPath window you need to jump down into the hierarchy with the slashes before calling on an element/attribute.  
  
So if we want to write a rule on the rdg that have a parent app just write the XPath pattern that gets those: `<rule context="app/rdg">`  
What if we want to write a rule involving the attribute name so that would look like: `<rule context="@name">`  
  
The test on the assert or report gives the conditions being placed on what is being grabbed by the XPath pattern in the rule context.  
  
**So writing these rules:**  
  
Every speaker needs a who attribute:  
`<rule context="speaker">` the rule context says grab all of the speaker elements wherever they sit in the document; this is your Xpath Pattern.  
`<report test="not(@who)">` now this reports when we are not seeing an @who on those speaker elements  
  
  
Check to see if there are any empty rdg elements anywhere in sp (for speeches):  
`<rule context="sp">` the rule context gets us into the speeches wherever they sit in the document; this is your Xpath Pattern.  
`<report test="descendant::app/rdg[not(text())]` now this gets us down into the rdg elements from the speech rule context and into the text node and reports when those rdg elements do not have a text node

**Just a reminder here is the basic structure:**

````
<pattern>
    <rule context="XPath pattern to grab all elements/attributes writing rule on">
        <assert test="conditions being tested working down into the document in relation to the context pattern">
            Here you write your note to your coders!
        </assert> 
        <report test="conditions being tested working down into the document in relation to the context pattern">
            Here you write your note to your coders!
        </report> 
    </rule>
</pattern> 
````
