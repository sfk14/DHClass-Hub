#Regular Expressions Exam  
**Question 1:**  
  Find `^[A-Z][A-Z .]{2,}[^A-Za-z\[]:` - this  finds (176) speakers  
  Find `^([A-Z][A-Z .]{2,}[^A-Za-z\[]):` - this adds a capturing group before the colon to remove the colon pseudo-markup  
  Replace `<spkr>\1</spkr>` -  wraps the speakers  
  
**Bonus:**  
Find `^([A-Z][A-Z .]{2,}[^A-Za-z\[]):` - this  finds (176) speakers
Replace `</sp>\n<sp>\n<spkr>\1</spkr>\n` - wraps whole speeches in <sp> elements (but need to fix the first and last, much like when we wrapped whole chapters and books) and grabs the speaker too wrapping it separately in a <spkr> element. Adds a blank line between the end of one speech and the start of the next. Also adds a blank line after the speaker. The blank lines aren't necessary but might help in future regex steps by clearly marking the division of speeches with the extra space.  
  
**Question 2:**  
  Find `\(.+?\)` - this finds (62) stage directions  
  Find `\((.+?)\)` - this adds the capturing group  
  Replace `<sd>\1</sd>` - wraps the stage directions in <sd> elements removing the pseudo-markup a.k.a. the parentheses