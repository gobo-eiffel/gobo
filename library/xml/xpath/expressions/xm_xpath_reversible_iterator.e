indexing

	description:

		"Sequence iterators than can find the last position in the sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_REVERSIBLE_ITERATOR [G-> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]

feature -- Access

	reverse_iterator: XM_XPATH_SEQUENCE_ITERATOR [G] is
		deferred
		ensure
			iterator_not_void: Result /= Void
		end
end
