<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math ="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs math"
    version="2.0">
    <xsl:output method="xml" indent="yes"/> 
    <xsl:template match="/"> 
       <xsl:comment>Pi in the w3c: <xsl:value-of select="math:pi()"/></xsl:comment>
    
        <svg width="100%" height="100%">
            <g transform="translate(350 350) rotate(-90)">
                <xsl:variable name="radius" select="80"/>
                <circle cx="0" cy="0" r="{$radius}" style="stroke:black; stroke-width:3; fill:none"/>
                
                <xsl:variable name="angle_wedge1" select="2 * math:pi() * (1 div 15)"/>   
                <xsl:variable name="angle_w1_degs" select="360 * (25 div 100)"/>
                <xsl:comment>Angle: <xsl:value-of select="$angle_wedge1"/> radians = 
                    <xsl:value-of select="$angle_w1_degs"/> degrees.
                </xsl:comment>
                
                <xsl:variable name="x_wedge1" select="math:cos($angle_wedge1) * $radius"/>   
                <xsl:variable name="y_wedge1" select="math:sin($angle_wedge1) * $radius"/>
                           
                <xsl:comment>X value of wedge 1: <xsl:value-of select="$x_wedge1"/></xsl:comment>
                <xsl:comment>Y value of wedge 1: <xsl:value-of select="$y_wedge1"/></xsl:comment>
       
                <!--ebb: Draw the first wedge, with a line starting at 3 o'clock, running 0,0 to 0,250
                 Draw a circular arc with A{$radius},{$radius} 0 0,1, out to the new set of wedge coordinates 
                 calculated with math:sin() and math:cos(), and close the path with Z.
                -->
                <path id="wedge1" d="M0,0
                    L {$radius},0
                    A{$radius},{$radius} 0 0,1 {$x_wedge1},{$y_wedge1}
                    Z"
                    style="stroke:black; stroke-width:2; fill: green"/>
     <xsl:variable name="angle_wedge2" select="2 * math:pi() * (2 div 8)"/>
                <xsl:variable name="x_wedge2" select="math:cos($angle_wedge2) * $radius"/>
                <xsl:variable name="y_wedge2" select="math:sin($angle_wedge2) * $radius"/>
    <!--ebb: Draw the second wedge, 
        starting with a line running from 0,0 to the end-point of the last set of x, y coordinates from wedge 1.
    Make the same kind of arc as before, and draw the new arc and path to the new set of wedge coordinates,
    and close the path with Z.
    --> 
                
        <path id="wedge2" d="M0,0 
            L{$x_wedge1},{$y_wedge1} A{$radius},{$radius} 0, 0,1 {$x_wedge2},{$y_wedge2} Z"
            style="stroke:black; stroke-width:2; fill: purple"/>        
                
  <!--ebb: Just for fun, if want to plot counterclockwise from 3pm, we can plot backwards by changing the following:
      arc flags from 0,1 to 0,0
      set a negative sign in front of the $y_wedge values -${$y_wedge1}
     
     But a MUCH easier way is to rotate the entire pie chart, using transform="rotate()"
      See http://tutorials.jenkov.com/svg/svg-transformation.html#rotate
      In the g element, here's how that rotate would look set in the transform attribute next to the translate coordinates:
       <g transform="translate(350 350) rotate(-90)"> 
          ...
      </g>
     This will rotate the pie chart counterclockwise by 90 degrees so the wedges start plotting downwards from NOON
     One weirdness of this is that SVG trasnform="rotate()" reads in degrees, while the XPath functions math:sin() and math:cos()
     calculate in radians on pi units. I guess we just live with this weirdness, but if you're curious, setting the rotation in CSS
     gives you more options on units: Search for the word "radians" on this page https://css-tricks.com/transforms-on-svg-elements/
  -->              
            </g>
        </svg>
    
    
    
    </xsl:template>
    
</xsl:stylesheet>