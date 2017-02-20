<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    
    <pattern id="occupations">
        <!--ebb: I totally am not sure how to write this so I'm gonna hang out in this comment tag for a while until I gain courage!-->
        <rule context="tei:occupation">
            <report test="contains(., ' ')">Hey, people!! NEVER use more than one word inside an occupation tag! HOW MANY TIMES DO I HAVE TO TELL YOU?!!!</report>
            
        </rule>
    </pattern>
    <!--ebb: This is the solution to number 3 that we struggled through at the end of class together! It's a freebie for you.-->
    <pattern id="xmlIds_as_lastNames">
        <rule context="tei:person">
            <assert test="starts-with(@xml:id, .//tei:surname[@type='paternal']) or starts-with(@xml:id, .//tei:surname[@type='married'])">
                Let's make sure the xml:id begins with the last name.
            </assert>
        </rule>
        <rule context="tei:person[.//tei:surname[not(@type)]]">
        <assert test="starts-with(@xml:id, .//tei:surname)">
            Let's make sure the xml:id begins with the last name.
        </assert>
        </rule>
    </pattern>
    
    
</schema>