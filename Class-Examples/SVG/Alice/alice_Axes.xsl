<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">   
    <xsl:output method="xml" indent="yes"/> 
  
<!--ebb: Variables to calculate the X and Y axis lengths. I want to find the largest possible values
        on the X and Y axes, and I want there to be a reasonable space in between each value 
        for my graph to be legible.-->
<!--X Axis variables-->    
    <xsl:variable name="numChapters" select="count(//chapter)"/>   
       <!--ebb: This gives me a count of the total number of chapters, to help me plot my X axis -->
    <xsl:variable name="xSpacer" select="70"/>
    <xsl:variable name="max_Xval" select="$numChapters * $xSpacer"/>
    
 <!--Y Axis variables-->   
        <xsl:variable name="maxSpeeches" select="max(//chapter/count(.//q[@sp='alice']))"/>
    <!--ebb: Reading from the inside out, this takes a count of quotes by Alice inside each chapter, 
        and then finds the maximum value of those counts. I need to know this to calculate my Y axis.-->
     <xsl:variable name="Yspacer" select="10"/>
 <xsl:variable name="max_Yval" select="$maxSpeeches * $Yspacer"/>
    
    <xsl:template match="/">
      
        <svg width="850" height="850" viewBox="0 0 1000 1000">
        <!--2016-11-08 ebb: Since people are reporting having trouble seeing my X-axis on output, 
            I'm redefining the viewport (the width and height attributes) in literal pixel units, and 
            I'm adding a viewBox attribute here to help ensure the output is fully visible in the browser window. 
        The viewBox attribute sets the visible area we can see on a screen. 
        -->
        <g transform="translate(50 750)" >
      <!--ebb: I want to offset this by an x value to push it over horizontally, 
          and a y value to set a little lower than the base of my graph. 
          Here a "0" y value will be translated down to 750 for the origin point of my X and Y axes, and a "0" x value
          will be translated to the right by 50. 
      To figure out how long to draw my axes, I'll make some calculations to determine the count of the chapters, 
      and the max count of Alice's speeches, and store these in global variables. 
      Just to study the numbers, I like making a comment tags in my output 
      before I start plotting SVG elements, so I give myself a sense of the dimensions I want.  
      -->   
     <xsl:comment>The total number of chapters is <xsl:value-of select="$numChapters"/>.
         The max X value is <xsl:value-of select="$max_Xval"/></xsl:comment>
      <xsl:comment>The max count of speeches is: <xsl:value-of select="$maxSpeeches"/> 
          The max Y value is: <xsl:value-of select="$max_Yval"/></xsl:comment> 
    
        <!--ebb: Having made those calculations, I'm now ready to draw my axes.-->
 <!--X axis-->           
     <line x1="30" y1="0" x2="{$max_Xval + $xSpacer}" y2="-10" stroke="black" stroke-width="1"/>
 <!--Y axis-->
            <line x1="30" y1="0" x2="30" y2="{-$max_Yval - 100}" stroke="black" stroke-width="1"/>
 
            <!--Calculate Hash Marks on Y Axis-->
             <xsl:for-each select="1 to 7">
                <xsl:variable name="yAxis_HashLocator" select=".* 100"/>
                <xsl:variable name="yAxis_HashName" select=". * 10"/>
                <text x="15" y="-{$yAxis_HashLocator}" text-anchor="middle">
                    <xsl:value-of select="$yAxis_HashName"/>
                </text>
        
            <line x1="30" x2="{$max_Xval + $xSpacer}" y1="{-$yAxis_HashLocator}" y2="{-$yAxis_HashLocator}" stroke="green" stroke-width=".5" stroke-dasharray="10"/>
            </xsl:for-each>                
        
    <!--Working chapter by chapter...start with chapter hashes on X axis...-->    
        <xsl:for-each select="descendant::chapter">
            <xsl:variable name="xPos" select="@which * $xSpacer"/>
            
            <text x="{$xPos}" y="15" text-anchor="end" transform="rotate(-45 {$xPos}, 15)">
                Ch. <xsl:value-of select="@which"/>
            </text>
    
        </xsl:for-each>
        
        </g>  
    </svg>  
    
  </xsl:template>  
    
</xsl:stylesheet>