indexing
   description: "common heir for xml-nodes that consist of character data"
   status:			"See notice at end of class.";
   author:			"Andreas Leitner";

class 
   XT_CHARACTER_DATA

inherit
   XI_CHARACTER_DATA
   XT_NODE

creation
   make

feature {NONE} -- Initialisation
   make (a_parent: XM_COMPOSITE; c: UC_STRING) is
	 -- Make a new object from a string.
      require
	 a_parent_not_void: a_parent /= Void
	 c_not_void: c /= Void
      do
	 parent := a_parent
	 content := c
      ensure
	 content_set: equal (content, c)
      end

feature {ANY} -- Access

   content: UC_STRING
	 -- the actual character data of this node.
   
feature {ANY} -- Element change

   append_content (other: XM_CHARACTER_DATA) is
	 -- append the content of 'other' to 
	 -- the content of Current
      do
	 content.append_ucstring (other.content)
      end

end -- XT_CHARACTER_DATA

--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolkit
--| Copyright (C) 1999  Andreas Leitner and others
--| See the file forum.txt included in this package for licensing info.
--|
--| Comments, Questions, Additions to this library? please contact:
--|
--| Andreas Leitner
--| Arndtgasse 1/3/5
--| 8010 Graz
--| Austria
--| email: andreas.leitner@chello.at
--| www: http://exml.dhs.org
--|-------------------------------------------------------------------------
