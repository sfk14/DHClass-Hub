<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
<!--ebb: OPEN THE FILE IN oXygen, and show how/where to add to xmlns element. Discuss namespaces and namespace prefixes in XML processing.-->    
    <pattern>
        <!-- Change the attribute to point the element being the context of the assert expression. -->
        <rule context="geo">
            <!--<assert test="true()">Error message.</assert>-->
            
            <assert test="matches(., '[0-9.]+\s[\-0-9+]+')">Hey team! Every geo element must contain a latitude followed by a longitude ccordinate, and the two are separated by a white space. This must not be separated properly!</assert>
            
            <!-- model a report test as well!-->
        </rule>
    </pattern>
</schema>