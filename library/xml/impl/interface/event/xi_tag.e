indexing

	description:

		"Objects representing a XML-tag"

	status:  "See notice at end of class."
	author:  "Andreas Leitner"

deferred class XI_TAG

inherit

	DP_IMPLEMENTATION

feature -- Access

	name: UC_STRING is
			-- stores the tag-name
		deferred
		end

	position: XM_POSITION is
			-- position of tag in xml-document
			-- may be void if information is not available
		deferred
		end

invariant

	name_not_void: name /= Void

end -- class XI_TAG
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

