indexing
   description:"Objects representing a XML-attribute"
   status:		"See notice at end of class."
   author:		"Andreas Leitner"

class
   XT_ATTRIBUTE

inherit
   XI_ATTRIBUTE
   XT_NAMED_NODE
creation
   make
feature {NONE} -- Initialisation
   make (a_name, a_prefix, a_value: UC_STRING; a_parent: XM_ELEMENT) is
      do
	 name := a_name
	 ns_prefix := a_prefix
	 value := a_value
	 parent := a_parent
      end
feature {ANY} -- Access

   value: UC_STRING

feature {ANY} -- Basic Routines
	
	set_value (v: UC_STRING) is
		do
			value := v
		ensure
			value_set: value.is_equal (v)
		end
	
end -- class XT_ATTRIBUTE

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
