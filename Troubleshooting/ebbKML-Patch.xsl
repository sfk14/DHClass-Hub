<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"   xpath-default-namespace="http://www.opengis.net/kml/2.2"    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.opengis.net/kml/2.2"
    version="3.0"> 
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>
  <!--2017-03-15 ebb: An identity transformation XSLT to repair the "braided" output KML of XQuery Ex 3, so that the name and description elements are produced in the proper valid order for KML.
  -->  
    <xsl:template match="Placemark">
        <Placemark>
           <xsl:apply-templates select="name"/>
        <xsl:apply-templates select="description"/>
        <xsl:apply-templates select="name/following-sibling::*"/>
        </Placemark>
    </xsl:template>
    
</xsl:stylesheet> 
