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
			make_default
		end

creation

	make

feature {NONE} -- Initialisation

	make is
			-- Initialize root node.
		do
			make_composite
		end
		
	make_default is
		do
			make
				-- needed by gobo 2.0
				-- TODO: make a empty but valid document
		end

feature {ANY} -- Access
		-- document_type: XM_DOCUMENT_TYPE
		-- TODO: Implement!

	root_element: XM_ELEMENT
			-- Root element of this document.
		
	process (x: XM_NODE_PROCESSOR) is
			-- Processing procedure for visitor pattern.
		do
			x.process_document (Current)
		end

feature {XM_PARSER}

	set_root_element (a: XM_ELEMENT) is
			-- Set root element.
		do
			root_element := a
			-- composite
			wipe_out
			force_last (a)
		ensure
			set: root_element = a
			last: last = a
			count: count = 1
		end
		
end -- class XM_DOCUMENT
