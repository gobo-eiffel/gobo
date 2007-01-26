indexing

	description:

		"Iterators that can be realized as an XM_XPATH_VALUE"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_REALIZABLE_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]
		redefine
			is_realizable_iterator, as_realizable_iterator
		end

feature -- Access

	last_realized_value: XM_XPATH_VALUE
			-- Result fromm calling `realize'

	is_realizable_iterator: BOOLEAN is
			-- Is `Current' a realizable iterator?
		do
			Result := True
		end

	as_realizable_iterator: XM_XPATH_REALIZABLE_ITERATOR [G] is
			-- `Current' seen as a realizable iterator
		do
			Result := Current			
		end

feature -- Evaluation

	realize is
			-- Realize the sequence as a value.
		deferred
		ensure
			realized_value_not_void: last_realized_value /= Void
			not_a_closure: not last_realized_value.is_closure
		end

end
