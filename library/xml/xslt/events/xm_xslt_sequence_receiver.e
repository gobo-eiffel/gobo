indexing

	description:

		"Receivers that can accept XM_XPATH_ITEMs."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XSLT_SEQUENCE_RECEIVER

inherit

	XM_XPATH_RECEIVER

feature -- Events

	append_item (an_item: XM_XPATH_ITEM) is
			-- Output an item (atomic value or node) to the sequence.
		require
			item_not_void: an_item /= Void
		deferred
		end

end
	
