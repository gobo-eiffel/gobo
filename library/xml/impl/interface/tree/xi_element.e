indexing
   description: "objects representing a element";
   status:			"See notice at end of class.";
   author:			"Andreas Leitner";

deferred class
   XI_ELEMENT

inherit
   XI_COMPOSITE

   XI_NAMED_NODE

feature {ANY} -- Access

feature {ANY} -- Element Change

   add_attributes (a_attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]; a_parent: XM_ELEMENT) is
	 -- Add `a_attributes' to this element.
	 -- `parent' is the parent of all attribute nodes added
      require
	 a_attributes_not_void: a_attributes /= Void
	 a_parent_not_void: a_parent /= Void
      deferred
      end

end -- XI_ELEMENT

--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolkit
--| Copyright (C) 1999  Andreas Leitner and others
--| See the file forum.txt included in this package for licensing info.
--|
--| Comments, Questions, Additions to this library? please contact:
--|
--| Andreas Leitner
--| Jakominiguertel 6/2
--| 8010 Graz
--| Austria
--| email: nozone@sbox.tu-graz.ac.at
--| www: http://exml.dhs.org
--|-------------------------------------------------------------------------

