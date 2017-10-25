<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xhtml" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Skyrim CSS</title>
                <link rel="stylesheet" type="text/css" href="Skyrim-XSLT-4c-css.css"/>
            </head>
            <body>
                <h1>
                    <xsl:apply-templates select="//title"/>
                </h1>
                <h2>
                    <em><xsl:apply-templates select="//attribution"/></em>
                </h2>
                <h3>
                    <xsl:apply-templates select="//subtitle"/>
                </h3>
             
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="paragraph">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="QuestEvent">
        <span class="QuestEvent">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="QuestItem">
        <span class="QuestItem">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="character">
        <span class="character">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="epithet">
        <span class="epithet">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="faction">
        <span class="faction">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="location">
        <span class="location">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
    <!-- In the header (the <cast> element) some factions are described (with an @alignment attribute) as evil, good, or neutral. You can write a matching rule that will dereference the @ref attribute on, say, <faction ref="MythicDawn">assassins</faction>, look up whether this is an evil, good, or neutral faction, and set the @class value of the HTML <span> that you are creating accordingly. You could make all good factions one color and all evil factions a different color, letting XPath look up the moral alignment of a faction for you. You can deference (‘look up’) an in-line <faction> with a @ref attribute value of blades by looking up the <faction> element inside the <cast> that has an @id attribute with the same value, and you can then retrieve the value of the @alignment attribute associated with that entry. 
        This template matches any <faction> element and creates an HTML <span> element with a @class attribute. The value of the @class attribute is determined by retrieving all of the <faction> elements in the <cast> and finding the one whose @id attribute matches the @ref attribute of the inline <faction> element (in the <body>) currently being processed. We have to use the XSLT current() function to refer to the inline <faction> element in the <body> currently being processed, rather than the dot, because the dot gets the current XPath context, and within the XPath we’re evaluating, that’s one or another <faction> element in the <cast> element. The current() function, on the other hand, returns the current XSLT context, which is the inline <faction> element that our template has matched, and a <faction> element that has a @ref attribute must be in the <body>. -->
    <xsl:template match="faction">
        <span class="{//cast/faction[@id = current()/@ref]/@alignment}"/>
    </xsl:template>
    
    <!-- This template matches all <faction> elements in the input XML, regardless of the value of their @ref attribute, and converts them into HTML <span> elements with a @class attribute. It determines the value of the @class attribute by copying it from the @ref attribute of the input <faction> element. 
    <xsl:template match="faction">
        <span class="{@ref}">
            <xsl:apply-templates/>
        </span>
    </xsl:template> -->

    <!-- Our XSLT above has separate rules for six types of in-line elements that all do the same thing: they create an HTML <span> element with a @class attribute, the value of which is the same as the generic identifier (GI, or name) of the element that was matched in the original XML. For example, a <QuestEvent> element in the input XML is converted to <span class="QuestEvent"> in the output HTML. Using attribute value templates (AVT; see http://dh.obdurodon.org/avt.xhtml), we can exploit the similarities and consolidate those six rules into one, replacing the six separate rules with the following one:
    <xsl:template match="QuestEvent | QuestItem | character | epithet | faction | location">
        <span class="{name()}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    -->


</xsl:stylesheet>
