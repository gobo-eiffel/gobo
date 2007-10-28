indexing

	description:

		"Sequence iterators than can find the last position in the sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_LAST_POSITION_FINDER [G-> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]
		redefine
			is_last_position_finder, as_last_position_finder
		end

feature -- Access

	last_position: INTEGER is
			-- Last position (= number of items in sequence)
		deferred
		ensure
			positive_result: Result >= 0
		end

	is_last_position_finder: BOOLEAN is
			-- Can `Current' find the last position?
		do
			Result := True
		end

	as_last_position_finder: XM_XPATH_LAST_POSITION_FINDER [G] is
			-- `Current' seen as a node iterator
		do
			Result := Current
		end

end

	
