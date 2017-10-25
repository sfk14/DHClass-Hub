<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>
    <!--
    <pattern>
        <rule context="the element or attribute and any defining characteristics if the element/attribute is used in varying ways in the XML">
            <assert test="condition on the above context that is being verified returns false"> </assert>
        </rule>
        <rule context="the element or attribute and any defining characteristics if the element/attribute is used in varying ways in the XML">
            <report test="condition on the above context that is being verified returns true"> </report>
        </rule>
    </pattern> -->
    
 <!--  <pattern id="whitespace_in_elementStart">
        
        <rule context="tei:*">
            <assert test="starts-with(., ' ')">Uh oh! The contents of this element ends with a
                whitespace. Be careful not to include extra whitespace inside of elements.</assert>
        </rule>
    </pattern>-->

    
   <!-- <pattern>    
        <rule context="tei:zgeo[@select]">
            <let name="tokens" value="for $w in tokenize(., '\s+') return substring-before($w, '°')"/>
            <assert test="every $token in $tokens satisfies $token = //tei:TEI//tei:geo//@select">
                 >.</assert>
        </rule>
    </pattern>-->
  <pattern>
        <!-- Change the attribute to point the element being the context of the assert expression. -->
        <rule context="tei:geo">
            <!--<assert test="true()">Error message.</assert>-->
            
            <assert test="matches(., '[0-9.]+\s[\-0-9+]+')">Hey team! Every geo element must contain a latitude followed by a longitude ccordinate, and the two are separated by a white space. This must not be separated properly!</assert>
            
            <!-- model a report test as well!-->
        </rule>
    </pattern>
    <pattern>
 
        <rule context="tei:geo[@select='lon']">
         
            <report test="matches(., '[NS]+')">Yo! A latitude measurement must indicate if it is north or south of the equator!</report>

        </rule>
    </pattern>
    
</schema>