indexing
   description:"Objects representing a XML-attribute"
   status:		"See notice at end of class."
   author:		"Andreas Leitner"

deferred class
   XI_ATTRIBUTE

inherit
   XI_NAMED_NODE

feature {ANY} -- Access
   value: UC_STRING is
	 -- the value of the attribute.
      deferred
      end

invariant
   value_not_void: value /= Void
end -- class XI_ATTRIBUTE

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
