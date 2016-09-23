#Relax-NG Exam Solution Explained

We need to start somewhere; this document is missing a starting point:
   **Correct:** `start = article`
    
  `article = element article {mixed {head, body}}` This is not a formedness error; the element article only contains elements (no free-floating text) and therefore does not need the mixed syntax:
  **Correct:** `article = element article {head, body}`
    
  `head = element head (title, by, date)` The parentheses need to be curly braces.
  **Correct:** `head = element head {title, by, date}`
    
  `title = attribute title {mixed {persName*}}` Title is an element, not an attribute.
  **Correct:** `title = element title {mixed {persName*}}`
    
  `persName = element persName {candidate*, text}` Since not all people are candidates there may or may not be a candidate attribute, but the asterisk does not make sense because there is no way for there to be more than one candidate attribute in proper XML on a persName element.
  **Correct:** `persName = element persName {candidate?, text}`
    
  `candidate = attribute candidate {"rep","dem","indep"}` The comma doesn't make sense; no one can run as a republican, independent, AND a democrat. Attribute values should represent distinct choices.
  **Correct:** candidate = attribute candidate {"rep" | "dem" | "indep"}
    
  There was nothing wrong with the rule for the `<by>` element.
  **Correct:** `by = element by {mixed {persName+}}`
    
  `date = element date {when, text}` Date is a self-closing element.
  **Correct:** `date = element date {when, empty}`
    
  `when = attribute when {text}` This is not a formedness error; text is acceptable, and so is "2016-01-26", but the best solution is to use a datatype.
  **Correct:** `when = attribute when {xsd:date}`
    
  `body = element body {p*}` This is not a formedness error; The best solution is to use a plus repetition indicator because at least one paragraph is expected within a body of text.
  **Correct:** `body = element body {p+}`
    
  `p = element p {mixed {(persName,percent)*}}` The comma seperator is incorrect; this implies that the specific order of `<persName>` AND THEN `<percent>` may or may not appear anywhere within the mixed content of element `<p>`.
  **Correct:** `p = element p {mixed {(persName | percent)*}}`
    
  `percent = element percont {value, text}` The element name is misspelled.
  **Correct:** `percent = element percent {value, text}`
    
  `value = attribute value {"xsd:int"}` Technically, text is acceptable, and so is listing out all of the given values, but the best solution is to use a datatype; however, the datatype is not supposed to be wrapped in quotation marks like other attribute values.
  **Correct:** `value = attribute value {xsd:int}`