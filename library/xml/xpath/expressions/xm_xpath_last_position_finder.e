indexing

	description:

		"Sequence iterators than can find the last position in the sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_LAST_POSITION_FINDER [G-> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]

feature -- Access

	last_position: INTEGER is
			-- Last position (= number of items in sequence)
		deferred
		ensure
			positive_result: Result >= 0
		end
end

	
