note

	description:

		"Receivers that can accept XM_XPATH_ITEMs."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XPATH_SEQUENCE_RECEIVER

inherit

	XM_XPATH_RECEIVER

feature -- Events

	append_item (an_item: XM_XPATH_ITEM)
			-- Output an item (atomic value or node) to the sequence.
		require
			item_not_void: an_item /= Void
		deferred
		end

	open
			-- Notify start of event stream.
		do
			previous_atomic := False
			is_open := True
		end

	start_document
			-- New document
		do
			is_document_started := True
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING)
			-- Notify an unparsed entity URI.
		do
			-- do nothing
		end

feature {NONE} -- Implementation

	previous_atomic: BOOLEAN

end

