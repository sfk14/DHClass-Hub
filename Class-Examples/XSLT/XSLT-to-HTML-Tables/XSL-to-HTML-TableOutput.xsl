<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <!--2016-10-23 ebb: First, when creating HTML from XML, we have to start with a template match on the document node, so we convert the root element and everything in a *one-to-one relationship with the root*. This is where we map the outer/higher level of the document organization. -->
        <html>
            <head>
                <title>Info Tables about Digital Mitford Site Index People and Organizations</title>
            </head>
            <body>
                <h1>Info about the Digital Mitford Site Index ListPersons</h1>
<!--2017-10-20 ebb: Here's where we set up our first table with information about the listPerson elements holding the different lists of persons (historical, fictional, etc.) in the Site Index: 
                Notice where we position the table header row, and the <xsl:apply-templates/>, and how we set the @select attribute to point out what part of the tree we're going to process to fill out the table rows.
                -->
                <table>
                    <tr>
                        <th>ListPerson Key</th>
                        <th>Count of Males</th>
                        <th>Count of Females</th>
                        <th>Count of Unmarked</th>
                        <th>Total Count of Persons</th>
                    </tr>
                    <xsl:apply-templates select="descendant::listPerson"/>
                </table>
                
         <!--ebb: Here's a second table, with information about the listBibl elements, holding the different bibliography lists in the Site Index. -->
                <table>
                    <tr>
                        <th>ListBibl Key</th>
                        <th>Count of Different Authors</th>
                        <th>Count of Different Publishers</th>
                        <th>Total Count of Publications</th>
                    </tr>
                    <xsl:apply-templates select="descendant::listBibl"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="listPerson">
        <!-- ebb: This template rule processes the listPerson element that we asked for in our apply-templates on the first table. We set a single table row to group information as it's processed for every listPerson element in the document. Notice that we use <xsl:value-of> here to output anything that we must calculate (because this takes us off the XML tree).-->
        <tr>
            <td>
                <xsl:apply-templates select="@sortKey"/>
            </td>
            <td>
                <xsl:value-of select="count(person[@sex='1'])"/>
            </td>
            <td>
                <xsl:value-of select="count(child::person[@sex='2'])"/>
            </td>
            <td>
                <xsl:value-of select="count(child::person[not(@sex)])"/>
            </td>
            <td>
                <xsl:value-of select="count(child::person)"/>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="listBibl">
      <!--ebb: This where we process the listBibl elements, as we selected them in our apply-templates for the second table. -->  
        <tr>
            <td><xsl:apply-templates select="@sortKey"/></td>
            <td><xsl:value-of select="count(distinct-values(descendant::author))"/></td>
            <td><xsl:value-of select="count(distinct-values(descendant::publisher))"/></td>
            <td><xsl:value-of select="count(child::bibl)"/></td>
        </tr>
        
    </xsl:template>

</xsl:stylesheet>
