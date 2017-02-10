2017-02-08 IN CLASS EXAMPLE

Find all poems:
//div[@type=“poem"]

First poem:
//div[@type="poem"][1]

First poem, first lg:
//div[@type=“poem"][1]/lg[1] 
OR
//div[@type="poem"]/child::lg[1]

First poem, first lg, first l:
//div[@type=“poem"][1]/lg[1]/l[1]
OR
//div[@type="poem"][1]/child::lg[1]/child::l[1]
OR
//div[@type=“poem"][1]/lg[1]/l[@n=“1"]

Any elements that come before the first lg:
//div[@type="poem"]/lg[1]/preceding-sibling::*

Finding Attributes on Elements:
//div[@type=“poem”/lg/attribute::*

Counting:
count(//div[@type=“poem”])

Find all instances of an element in an entire document:
//-ELEMENT NAME-
EG. //rdg[@wit='#fh’]

Finding parents of elements:
//div[@type=“poem”]/parent::*


2017-02-10 IN CLASS EXAMPLES

Difference between:
//div[@type="poem"]//rdg[1]
and
(//div[@type="poem"]//rdg)[1]
The top one is looking at the first rdg in every poem. The second is looking at the first rdg inside the first poem.


Functions:
last() - Finds the last of anything
name() - Finds the names of elements or attributes
count() - When it wraps around an expression, gives a count of what you’re searching for
not () - Finds where something doesn't happen
distinct-values()
