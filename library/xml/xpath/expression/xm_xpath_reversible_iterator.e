indexing

	description:

		"Objects that iterate a sequence in reverse order"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_REVERSIBLE_ITERATOR [G-> XM_XPATH_ITEM]

inherit

	XM_XPATH_SEQUENCE_ITERATOR [G]
		redefine
			is_reversible_iterator, as_reversible_iterator
		end

feature -- Access

	reverse_iterator: XM_XPATH_SEQUENCE_ITERATOR [G] is
		deferred
		ensure
			iterator_not_void: Result /= Void
		end

	is_reversible_iterator: BOOLEAN is
			-- Does `Current' yield a reversible_sequence?
		do
			Result := True
		end

	as_reversible_iterator: XM_XPATH_REVERSIBLE_ITERATOR [G] is
			-- `Current' seen as a reversible iterator
		do
			Result := Current
		end

end
