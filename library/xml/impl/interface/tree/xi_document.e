indexing

	description:

		"Objects that represent XML documents"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XI_DOCUMENT

inherit

	XI_COMPOSITE

feature {ANY} -- Access
	
	-- document_type: XM_DOCUMENT_TYPE
		-- TODO: Implement!

	root_element: XM_ELEMENT is
			-- Root element of this document.
		do
				-- Since a document must havee exactly one child element it is
				-- safe to take the first one.
			Result := first_element
		end

feature {NONE} -- Implementation

	first_element: XM_ELEMENT is
			-- First (and only) element.
			-- But there may be PIs etc.
		local
			cs: like new_cursor
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off or Result /= Void
			loop
				Result ?= cs.item
				cs.forth
			end
		end

end -- class XI_DOCUMENT
