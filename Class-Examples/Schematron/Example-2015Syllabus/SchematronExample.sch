<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>

    <pattern id="notes">
        <!--RJP:2016-10-13: patterns help separate long schemas into sections.-->
        <rule context="tei:note">

            <!--RJP:2016-10-13: Uncomment this rule and see what happens to the document.-->
           <!-- <assert test=".[@resp]">Every note element must have a resp attribute that indicates the person responsible for the note.</assert>-->

            <report test="./string-length() gt max(//tei:p/string-length())">
                Notes need to be short and direct! This note is longer than the longest paragraph in the document; please revise! 
            </report>
            <!-- RJP:2016-10-13: What if instead of using the longest paragraph we wanted to use the shortest paragraph? How would your write that rule instead? What does this show you about the document? -->
            
        </rule>

    </pattern>

    <pattern>
        <!--RJP:2016-10-13: Notice patterns don't NEED to have an @id; in fact, all of your rules can sit in a single pattern. -->
        <rule context="tei:div[@type = 'day'][preceding-sibling::tei:div[@type = 'day']]">
            <assert test="xs:date(.//tei:date/@when) gt xs:date(preceding-sibling::tei:div[@type = 'day'][1]//tei:date/@when)">
                The date inside a div designating a day on this syllabus must be later than the immediately preceding day on the syllabus.
            </assert>
        </rule>
        <rule context="tei:ref">
            <report test="not(@target)">
                If a ref does not have an @target then the element needs to be changed into a note element. @ref is reserved for links.
            </report>
        </rule>
        <rule context="tei:list">
            <report test="count(child::tei:item) &lt; 2">
                All lists need to have more than one item; otherwise, your list is simply a paragraph or note.
            </report>
        </rule>
    </pattern>
</schema>
