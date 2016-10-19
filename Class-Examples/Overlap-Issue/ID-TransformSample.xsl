<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://audreyHunker.newtfire.org"
    xmlns="http://audreyHunker.newtfire.org"
    exclude-result-prefixes="xs"
    version="3.0">
    <!--<xsl:strip-space elements="*"/>--> 
    <!--ebb: This removes white space in between elements in my output. I don't like it because it destroys pretty-printing! And I like pretty-printing!
    -->
    <xsl:mode on-no-match="shallow-copy"/>
     
<xsl:template match="line">
    <drB n="{count(preceding-sibling::line) + 1}"><xsl:apply-templates/></drB>
</xsl:template>

</xsl:stylesheet>