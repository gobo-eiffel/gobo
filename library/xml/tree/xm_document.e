indexing

	description:

		"Objects that represent XML documents"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

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
			-- Root element of this document.
		do
			Result := implementation.root_element
		end

	process (x: XM_NODE_PROCESSOR) is
			-- Processing procedure for visitor pattern.
		do
			x.process_document (Current)
		end

feature {DP_IMPLEMENTATION, DP_INTERFACE} -- Implementation

	implementation: XI_DOCUMENT

end -- class XM_DOCUMENT
