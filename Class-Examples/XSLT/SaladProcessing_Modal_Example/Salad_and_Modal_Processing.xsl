<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
  
<xsl:template match="/">
    <html>
        <head><title>Processing Stuff in an XML Letter File Not Once, but Twice, using Modal XSLT</title></head>
        
        
        <body>
      <h1>Fun with Modal XSLT and a Tossed Salad of Elements</h1>
      <h2>List of People's Hashtag Ids in This Letter</h2>      
            <ol>
                <xsl:apply-templates select="//text/body/div[@type='letter']" mode="list"/>             
            </ol>
        <h2>Read The Body Paragraphs of This Letter</h2> 
            <xsl:apply-templates select="//text/body/div[@type='letter']" mode="pars"/>      
        </body>
      
    </html>   
</xsl:template>
    
    <xsl:template match="div[@type='letter']" mode="list">
        <xsl:for-each select="distinct-values(descendant::persName/@ref)">
            <li><xsl:value-of select="current()"/></li>           
        </xsl:for-each>
        
    </xsl:template>
    <xsl:template match="div[@type='letter']" mode="pars">
        <xsl:apply-templates select="descendant::p" mode="pars"/>
    </xsl:template>
    <xsl:template match="p" mode="pars">
       <p><xsl:apply-templates mode="pars"/></p>
    </xsl:template>
    <!--2016-10-26 ebb: Here's where I work with the "tossed salad" inside the paragraphs-->
    <xsl:template match="persName" mode="pars">
        <span class="people"><xsl:apply-templates mode="pars"/></span>
      <!--ebb: Once I wrap these in spans, I can grab hold of them in CSS to style them! -->
    </xsl:template>

</xsl:stylesheet>