<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    
    <xsl:output method="xml" indent="yes"/> 
    
    <!--VARIABLES FOR TOTALS-->
    <xsl:variable name="lotTotal" select="count(//lot)"/>
    <xsl:variable name="occTotal" select="count(//occupant)"/>
    
    <!--IMPORTANT COMMENTS-->
    
    <xsl:template match="/">
        <xsl:comment>TOTALS</xsl:comment>
        <xsl:comment>The total number of lots is: <xsl:value-of select="$lotTotal"/>.</xsl:comment>
        <xsl:comment>The total number of occupants is: <xsl:value-of select="$occTotal"/>.</xsl:comment>
        <xsl:comment>DATA POINTS</xsl:comment>
        <xsl:for-each select="//lot">
            <xsl:comment>There are <xsl:value-of select="count(descendant::occupant)"/> occupants for lot #<xsl:value-of select="@number"/>.</xsl:comment>
        </xsl:for-each>
        <xsl:comment>HOW TO CHART ON THE CIRCLE</xsl:comment>
        <xsl:comment>To make a pie chart, the data has to be proportional to 360, because a circle has 360 degrees.
        1. Find the totals for each slice you want to display.
        2. Add all the slices totats up to make an overall total.
        3. Now divide each slice by the total to get a percentage.
        4. Multiply this percentage by 360 to be know the angle of each slice.
        5. Plot each slice and make sure they all fit the circle properly.</xsl:comment>
        
        <!--ANGLE VARIABLES-->
        <!--Check the output window and count the number of times a value appers
            for these individual slices (these are the numbers being divided).-->
        <xsl:variable name="occ2slice" select="(2 div $lotTotal) * 360"/>
        <xsl:variable name="occ3slice" select="(1 div $lotTotal) * 360"/>
        <xsl:variable name="occ4slice" select="(2 div $lotTotal) * 360"/>
        <xsl:variable name="occ5slice" select="(2 div $lotTotal) * 360"/>
        <xsl:variable name="occ6slice" select="(1 div $lotTotal) * 360"/>
        <xsl:variable name="occ9slice" select="(1 div $lotTotal) * 360"/>
        
        <!--SVG OUTPUT VIEW WINDOW-->
        <svg width="100%" height="100%">
            <g transform="translate(350 350)" >
                <circle cx="0" cy="0" r="250" style="stroke:black; stroke-width:3; fill:none"/>
                <path d="M0,0
                    L250,0
                    A250,250 0 0,1 200,100
                    Z"
                    style="stroke:black; stroke-width:3; fill: none"/>
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>