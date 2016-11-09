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
        <xsl:variable name="maxSpeeches_A" select="max(//chapter/count(.//q[@sp='alice']))"/>
    <xsl:variable name="maxSpeeches_N" select="max(//chapter/count(.//q[@sp and not(@sp='alice')]))"/>
    <!--ebb: Reading from the inside out, this takes a count of quotes by Alice inside each chapter, 
        and then finds the maximum value of those counts. I need to know this to calculate my Y axis.-->
     <xsl:variable name="Yspacer" select="10"/>
 <xsl:variable name="max_Yval" select="$maxSpeeches_N * $Yspacer"/>
    
    <xsl:template match="/">
      
    <svg width="100%" height="100%">
        
        <g transform="translate(50 850)" >
      <!--ebb; I want to offset this by an x value to push it over horizontally, 
          and a y value to set a little lower than the base of my graph. 
          Here a "0" y value will be translated to 700 for the origin point of my X and Y axes.
      To figure out how long to draw my axes, I'll make some calculations to determine the count of the chapters, 
      and the max count of Alice's speeches, and store these in global variables. 
      Just to study the numbers, I like making a comment tags in my output 
      before I start plotting SVG elements, so I give myself a sense of the dimensions I want.  
      -->   
     <xsl:comment>The total number of chapters is <xsl:value-of select="$numChapters"/>.
         The max X value is <xsl:value-of select="$max_Xval"/></xsl:comment>
      <xsl:comment>The max count of speeches by Alice is: <xsl:value-of select="$maxSpeeches_A"/>
          The max count of speeches by others is <xsl:value-of select="$maxSpeeches_N"/>. 
          The max Y value is: <xsl:value-of select="$max_Yval"/></xsl:comment> 
    
            <!--ebb: Having made those calculations, I'm now ready to draw my axes.-->
 <!--X axis-->           
     <line x1="30" y1="0" x2="{$max_Xval + $xSpacer}" y2="0" stroke="black" stroke-width="1"/>
 <!--Y axis-->
            <line x1="30" y1="0" x2="30" y2="{-$max_Yval - 50}" stroke="black" stroke-width="1"/>
   <!--Calculate Hash Marks on Y Axis-->
            
            <xsl:for-each select="1 to 8">
                <xsl:variable name="yAxis_HashLocator" select=".* 100"/>
                <xsl:variable name="yAxis_HashName" select=". * 10"/>
                <text x="15" y="-{$yAxis_HashLocator}" text-anchor="middle"><xsl:value-of select="$yAxis_HashName"/></text>
           
            <line x1="30" x2="{$max_Xval + $xSpacer}" y1="{-$yAxis_HashLocator}" y2="{-$yAxis_HashLocator}" stroke="green" stroke-width=".5" stroke-dasharray="10"/>
            </xsl:for-each>
            
      <xsl:for-each select="//chapter">
          <xsl:variable name="xPos" select="@which * $xSpacer"/>
          <xsl:variable name="yPos_Alice" select="count(descendant::q[@sp='alice']) * -$Yspacer"/>
          <xsl:variable name="yPos_Others" select="count(descendant::q[@sp and not(@sp='alice')]) * -$Yspacer"/>
          
          <text x="{$xPos}" y="15" text-anchor="end" transform="rotate(-45 {$xPos}, 15)">Ch. <xsl:value-of select="@which"/></text>
          <circle fill="red" r="5" cx="{$xPos}" cy="{$yPos_Alice}"/>        
          <circle fill="blue" r="5" cx="{$xPos}" cy="{$yPos_Others}"/>
  
          <xsl:if test="following-sibling::chapter">
              <xsl:variable name="xPosNext" select="following-sibling::chapter[1]/@which * $xSpacer"/>
              <xsl:variable name="yPosNext_A" select="count(following-sibling::chapter[1]//q[@sp='alice']) *-$Yspacer"/>
              <xsl:variable name="yPosNext_N" select="count(following-sibling::chapter[1]//q[@sp and not(@sp='alice')]) * -$Yspacer"/>
              
              <line class="aliceLine" x1="{$xPos}" y1="{$yPos_Alice}" x2="{$xPosNext}" y2="{$yPosNext_A}" stroke="red" stroke-width="1"/>
         
              <line class="othersLine" x1="{$xPos}" y1="{$yPos_Others}" x2="{$xPosNext}" y2="{$yPosNext_N}" stroke="blue" stroke-width="1"/>    
        
          </xsl:if>
          
      </xsl:for-each>      
      
          
          
          
        </g>
        
    </svg>  
      
      
  </xsl:template>  
  
    
</xsl:stylesheet>