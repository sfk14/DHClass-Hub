<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" doctype-system="about:legacy-compat" 
  omit-xml-declaration="yes"/> 
    
    <xsl:template match="/">
        <html>
            <!--2017-02-27 ebb: For this version of the stylesheet, we used xsl:for-each to match on distinct-values() of all the names and output a list.   -->
            <head><title>Decameron People</title></head>
            <body>
                <h1>People in the Decameron Project: From the outer narrative vs. the inner narratives</h1>
                <h2>People from the Outer Narrative:</h2>
                <ol>
                   <!--<xsl:apply-templates select="//body//persName[not(ancestor::floatingText)]"/> -->
                    <xsl:for-each select="distinct-values(//body//persName[not(ancestor::floatingText)])">
                        
                   <li><xsl:value-of select="current()"/></li>     
                    </xsl:for-each>
                    
                   
                </ol>
                
                <h2>People from the Inner Narratives:</h2>
                
                <ol>
                    
                 <!-- <xsl:apply-templates select="//floatingText//persName"/> --> 
                    
                    <xsl:for-each select="distinct-values(//floatingText//persName)">
                        
                        <li><xsl:value-of select="current()"/></li>     
                    </xsl:for-each>
                </ol>
                
            </body>
        </html>
        
    </xsl:template>
 
    
  
    
</xsl:stylesheet>