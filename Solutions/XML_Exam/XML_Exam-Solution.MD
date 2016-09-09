# XML Exam Solution  
**Assigned to find 10 of the 14 formedness errors for 1 point each.**  
*This is a list of all the formedness errors in the order that they appear in the XML Exam Document.*  
  
1. There is no ROOT element: all XML documents must have a single root element.  
2. The closing tag for the `<name>` element is a self-closing element (`<name/>`) instead of closing tag (`</name>`).  
3. There are tangled tags (`</title></date>`) because the `<date>` element needs to close before `<title>` element.  
4. The start tag for the `<list>` element is missing.  
5. The closing `</list` tag is missing the closing angle bracket (`</list>`).  
6. `<div type=articleBody>` is an improper attribute format because it is missing the quotation marks around the attribute value (`<div type="articleBody">`).  
7. After the word "shop-girl" there is the use of a reserved, special character (`&`), which needs to be escaped with `&amp;`.  
8. Mismatched start tag and closing tag `<m type="noun">list</w>`.  
9. This element's start tag does not match its end tag (`<placeName ref="#WLMC" type="address">218 State street</place>`).  
10. `<type="noun">eyes</w>` is missing the start tag's element name.  
11. `<hi rend "double">` is an improper attribute format because it is missing the equal sign between the attribute name and the attribute value.
12. After the words "Cost per copy is" there is the use of a reserved, special character (`<`), which needs to be escaped with `&lt;`.  
13. The closing `</note>` tag on second `<note>` element is missing.  
14. The closing `</p>` tag for the final `<p>` element is missing.  
