<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0"> <!-- To use the following shallow-copy declaration you need to have version 3.0 here instead of version 2.0 which is what comes in on default -->
    <xsl:mode on-no-match="shallow-copy"/>
    <!-- <xsl:strip-space elements="*"/>
        rjp: This removes extra whitespaces in between all elements. Notice this removes the pretty printing in your XML code -->
    <xsl:template match="line">
        <l n="{count(preceding::line)+1}"><xsl:apply-templates/></l>
    </xsl:template>
    
</xsl:stylesheet>