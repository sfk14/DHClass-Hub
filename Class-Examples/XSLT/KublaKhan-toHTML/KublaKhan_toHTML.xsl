<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xhtml" encoding="utf-8" 
        omit-xml-declaration="yes"/>  
    
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="descendant::title"/>
                </title>
        <!--ebb: This is also where you'd add your <link> element for associating your CSS file!-->    
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="descendant::title"/>
                </h1> 
                <xsl:apply-templates select="descendant::line"/>
            </body>  
        </html>
    </xsl:template>
    
    <xsl:template match="line">
        <xsl:apply-templates/><br/>
    </xsl:template>  
  
</xsl:stylesheet>