<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>

    <!-- Examples given in class (2017-02-20). -->
    <pattern id="occupations">
        <rule context="tei:occupation">
            <!-- RJP:2017-02-20: This context checks any occupation element anywhere in the associated XML document; notice we are not walking the XML tree. Also, notice how we have called on our TEI namespace with the "tei:" prefix. -->
            <report test="contains(., ' ')">Never use more than one word inside an occupation
                tag.</report>
        </rule>
        <!-- RJP:2017-02-21: Below is an alternative way to have written the above rule using matches() instead of contains().
            <rule context="tei:occupation">
                 <assert test="matches(., '^\w+$')">Never use more than one word inside an occupation tag.</assert>
            </rule>-->
    </pattern>
    <!-- Question #3 given in class. -->
    <pattern id="xmlIDs_as_lastNames">
        <rule context="tei:person">
            <assert
                test="starts-with(@xml:id, descendant::tei:surname[@type = 'paternal']) or starts-with(@xml:id, descendant::tei:surname[@type = 'married'])"
                >Make sure every xml:id begins with the person's last name used most frequently by
                Mitford.</assert>
        </rule>
    </pattern>
    <!-- End of Examples given in class. -->

    <pattern id="whitespace_in_elementStart">
        <!-- Question #1 -->
        <rule context="tei:*">
            <report test="starts-with(., ' ')">Uh oh! The contents of this element begins with a
                whitespace. Be careful not to include extra whitespace inside of elements.</report>
        </rule>
    </pattern>
    <pattern>
        <!-- Question #2 -->
        <rule context="tei:person">
            <assert test="@sex and @xml:id">Be sure each person element has both a sex attribute
                and a xml:id attribute.</assert>
            <assert test="@sex = ('1', '2', '0', '9')">The values of @sex must be 1 (male), 2
                (female), 0 (unknown), or 9 (N/A).</assert>
        </rule>
    </pattern>
    <pattern id="capitalizationProperNames">
        <!-- Question #4 -->
        <rule
            context="tei:forename | tei:surname | tei:placeName | tei:persName[not(descendant::*)]">
            <report test="matches(., '^[a-z]')">All proper names should begin with a capital
                letter.</report>
        </rule>
    </pattern>
    <pattern id="checkingDates">
        <!-- Questions #5 and #6 -->
        <rule context="tei:date[@from]">
            <assert test="@to gt @from">Be sure the @from year is before the @to year.</assert>
        </rule>
        <rule context="*[@notBefore and @notAfter]">
            <report test="@notAfter lt @notBefore">Be sure the @notBefore value is before the
                @notAfter value.</report>
        </rule>
        <rule context="tei:birth[@when]">
            <assert
                test="tokenize(@when, '-')[1] lt following-sibling::tei:death/tokenize(@when, '-')[1]"
                >Be sure the death date is later than the birth date.</assert>
        </rule>
        <rule context="tei:birth[@notAfter]">
            <assert test="@notAfter lt following-sibling::tei:death/tokenize(@when, '-')[1]">Be sure
                the death date is later than the birth date.</assert>
        </rule>
        <rule context="tei:birth[@notBefore]">
            <assert test="@notBefore lt following-sibling::tei:death/tokenize(@when, '-')[1]">Be
                sure the death date is later than the birth date.</assert>
        </rule>
    </pattern>
    <pattern id="xmlIds">
        <!-- Question #7 -->
        <rule context="@xml:id">
            <report test="matches(., '\s+')"> @xml:id values shouldn't contain white spaces! </report>
            <report test="starts-with(., '#')"> @xml:id values shouldn't begin with a hashtags.
            </report>
        </rule>
        <!-- RJP:2017-02-21: Notice the above two rules are redundant because the TEI schema associated already checks to be sure the value of any @xml:id does not have characters like hashtags (or according to the error "colons") as well as "multiple tokens" (aka whitespace separated characters). -->
        <!-- EBB:2017-02-21: Yes, that is something the TEI takes care of, but for those working outside the TEI in your own XML, you have to write rules like this if you want to work with xml:ids this way. (It's good to learn how to write it.) -->
    </pattern>
    <pattern>
        <!-- Question #8 -->
        <let name="si" value="doc('http://digitalmitford.org/si.xml')//@xml:id"/>

        <rule context="@ref | @resp">

            <let name="tokens"
                value="
                    for $w in tokenize(., '\s+')
                    return
                        substring-after($w, '#')"/>
            <assert
                test="
                    every $token in $tokens
                        satisfies $token = //tei:text//@xml:id | $si"
                > The value of @ref and @corresp (after the REQUIRED hasthtag, #) must match a
                defined @xml:id some where else in this file.</assert>
        </rule>
    </pattern>
    <pattern id="persName_fullnameCheck">
        <!-- BONUS Question! -->
        <rule context="tei:persName[not(descendant::*)]">
            <let name="nameTokens"
                value="
                    for $i in tokenize(., '\s+')
                    return
                        $i"/>
            <assert
                test="
                    every $nameToken in $nameTokens
                        satisfies matches($nameToken, '^[A-Z]')"
                > All parts (forename, surname, etc.) of each person's name inside a persName
                element must be capitalized. </assert>
        </rule>
    </pattern>

</schema>
