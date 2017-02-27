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
            <head><title>Decameron People</title></head>
            <body>
                <h1>People in the Decameron Project: From the outer narrative vs. the inner narratives</h1>
                <h2>People from the Outer Narrative:</h2>
                <ol>
                   <xsl:apply-templates select="//body//persName[not(ancestor::floatingText)]"/>
                    
                   
                </ol>
                
                <h2>People from the Inner Narratives:</h2>
                
                <ol>
                    
                 <xsl:apply-templates select="//floatingText//persName"/>
                    
                </ol>
                
            </body>
        </html>
        
    </xsl:template>
 
    <xsl:template match="persName[not(ancestor::floatingText)]">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <xsl:template match="persName[ancestor::floatingText]">
        <li><xsl:apply-templates/></li>
    </xsl:template>
  
    
</xsl:stylesheet>