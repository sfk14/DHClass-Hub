<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
   
    <!-- RJP:2016-10-14: Basic Skeleton

<pattern>
	<rule context="the element or attribute and any defining characteristics if the element/attribute is used in varying ways in the XML">
		<assert test="condition on the above context that is being verified returns false"> </assert>
	</rule>
	<rule context="the element or attribute and any defining characteristics if the element/attribute is used in varying ways in the XML">
		<report test="condition on the above context that is being verified returns true"> </report>
	</rule>
</pattern>

    -->
    <pattern>
        <rule context="gameResults">
            
            <assert test="first gt second">
                The first-place score must be greater than the second-place score.
            </assert>
            <report test="not(number(second) gt number(third))"> 
                The second-place score must be greater than the  third-place score.
            </report><!-- RJP:2016-10-14: Remember in XPath if we wanted a node to be read as a string we used the string() function; similarly we can use the number() function to declare the node as a number. Notice in the above assert the schematron recognizes the contents of first and second as numbers and this is usually the case; however, you can specify like we have in the above report. -->
            
            
            <!-- RJP:2016-10-14: Let's imagine that there is a limit on the total points. How would you write a rule that declares the numbers cannot add up to be any more than 50? -->
            
           <!-- <assert test="sum(child::*) le 50">
                The sum of the game results cannot add up to be more than 50!
            </assert>-->
            
        </rule>
    </pattern>
</sch:schema>