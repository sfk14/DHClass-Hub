<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"  xmlns="http://www.w3.org/1999/xhtml" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>    
  
<!--2016-10-23 ebb: This XSLT is designed to process the ForsterGeorgComplete.xml file and output an HTML file  containing a list of the chapter heads in Book I only.
    The results of this are saved as ForsterContentsBook1.html in the Class Examples XSLT directory alongside this Stylesheet on the DHClassHub.--> 
    
    <xsl:template match="/">
 <!--2016-10-23 ebb: First, when creating HTML from XML, we have to start with a template match on the document node, so we convert the root element and everything in a *one-to-one relationship with the root*. This is where we map the outer/higher level of the document organization. -->
        <html>
            <head>
                <title>Georg Forster's Voyage to the Pacific, Book 1</title>
            </head>
            <body>                   
                <xsl:apply-templates select="//div[@type='book'][1]"/> 
            <!--ebb: Remember, if you use the @select attribute, it is always a literal XPath, stepping down from the context node set in the template match. You don't have to use @select, but when you do, you're CHOOSING which portion of your document to transform, and telling XSLT to ignore the others.-->
            </body>       
        </html>   
    </xsl:template>  
       
    <xsl:template match="div[@type='book']">
     <!--ebb: This is an XPath pattern, and would apply to any div[@type='book'] in this document. But it's ONLY going to fire on //div[@type='book'][1] because that's what we told it to **select** in the template on the document node. 
     This means if I want to change this stylesheet to output the same stuff for Book 2, I only have to change the value of that @select attribute up in the document node template. I don't need to change the context of these template rules! -->
     <h1><xsl:apply-templates select="head"/></h1>
     <ul><xsl:apply-templates select=".//div[@type='chapter']/head"/></ul>
<!--ebb: Here, at the level of the book, I'm creating just one <ul> element. Then I take a literal XPath down from the div[@type='book'] match, down into chapter heads. Notice that I NEED TO USE A DOT here to indicate that we're stepping down from the context node! Otherwise it'll process all the chapters starting at the document node, including chapters that I don't want from other Books outside book 1. 
     Here's another (actually much better) way I could write this: 
     <xsl:apply-templates select="descendant::div[@type='chapter']/head"/>
    That's even better to use the literal axis name, because that means you DEFINITELY go DOWN the tree from this point, and don't have to remember to designate the self:: axis first with .//  Because we need to know the dot notation and it's shorter to write, and we have to apply it sometimes, we're using it here so you remember how to write it and why we use it. -->
    </xsl:template>  
    
    <xsl:template match="div[@type='chapter']/head">
        <li><xsl:apply-templates select="l"/></li> 
      <!--ebb: This template rule stops at each chapter head and outputs its contents inside an HTML <li> element. I decided to add one more processing rule on the child <l> elements inside the head, so I used @select one more time.-->
    </xsl:template>
    
 <!--ebb: The chapter heads in this Forster file each contain <l> elements to separate the chapter number from descriptions of the contents, and sometimes these run to multiple lines. If I just use <xsl:apply-templates/> on the rule above the head comes out as one blob of text inside the <li> list items. If I want line breaks, I decided to write a rule that'll process each <l> and apply a <br/> element afterwards. -->   
    <xsl:template match="l">
        <xsl:apply-templates/><br/>
    </xsl:template>
  <!--ebb: Notice how each rule *could* in theory apply to any <l> element in the source XML document! But because we are using @select attributes on <xsl:apply-templates select="//SomeSpecificPathDown"/> we are selecting only the pieces of the source document that we want to process.-->  
</xsl:stylesheet>