indexing

	description:

		"Root object for a XML Document"

	status:  "See notice at end of class."
	author:  "Andreas Leitner"

class XM_DOCUMENT

inherit

	XM_COMPOSITE
		redefine
			implementation
		end

creation

	make_from_implementation

feature {NONE} -- Initialisation

	make_default is
		do
				-- needed by gobo 2.0
				-- TODO: make a empty but valid document
		end

feature {ANY} -- Access
		-- document_type: XM_DOCUMENT_TYPE
		-- TODO: Implement!

	root_element: XM_ELEMENT is
			-- root element of document.
		do
			Result := implementation.root_element
		end

	process (x: XM_NODE_PROCESSOR) is
		do
			x.process_document (Current)
		end

feature {DP_IMPLEMENTATION, DP_INTERFACE} -- Implementation

	implementation: XI_DOCUMENT

end -- XM_DOCUMENT

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
