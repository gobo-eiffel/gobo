indexing

	description:

		"Objects that support implementation of the XPath index-of() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INDEX_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

create {XM_XPATH_INDEX_OF, XM_XPATH_INDEX_ITERATOR}

	make

feature {NONE} -- Initialization

	make (a_base_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_search_value: XM_XPATH_ATOMIC_VALUE; an_atomic_comparer: XM_XPATH_ATOMIC_COMPARER) is
			-- Establish invariant.
		require
			base_sequence_before: a_base_sequence /= Void and then not a_base_sequence.is_error and then a_base_sequence.before
			search_value_not_void: a_search_value /= Void
			atomic_comparer_not_void: an_atomic_comparer /= Void
		do
			base_sequence := a_base_sequence
			search_value := a_search_value
			atomic_comparer := an_atomic_comparer
		ensure
			base_sequence_set: base_sequence = a_base_sequence
			search_value_set: search_value = a_search_value
			comparer_set: atomic_comparer = an_atomic_comparer
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Value or node at the current position

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := base_sequence.after or else item = Void
		end
feature -- Cursor movement

	forth is
			-- Move to next position
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_item: XM_XPATH_ITEM
		do
			index := index + 1
			if base_sequence.before then
				base_sequence.start
			else
				base_sequence.forth -- can't be after - see `after'
			end
			item := Void
			if base_sequence.is_error then
				set_last_error (base_sequence.error_value) 
			else
				from
				until
					base_sequence.is_error or else base_sequence.after or else item /= Void
				loop
					last_position_index := last_position_index + 1
					an_item := base_sequence.item
					if an_item.is_error then
						item := an_item
					else
						check
							item_is_atomic: an_item.is_atomic_value
							-- static typing in XM_XPATH_INDEX_OF
						end
						an_atomic_value := an_item.as_atomic_value
						if not atomic_comparer.are_comparable (an_atomic_value, search_value) then
							create {XM_XPATH_INVALID_ITEM} item.make_from_string ("Items are not comparable", Xpath_errors_uri, "FOTY0012", Dynamic_error)
						elseif atomic_comparer.three_way_comparison (an_atomic_value, search_value) = 0 then
							create {XM_XPATH_MACHINE_INTEGER_VALUE} item.make (last_position_index)
						else
							if not base_sequence.after then
								base_sequence.forth
								if base_sequence.is_error then
									set_last_error (base_sequence.error_value)
								end
							end
						end
					end
				end
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
		do
			create Result.make (base_sequence.another, search_value, atomic_comparer)
		end

feature {NONE} -- Implementation

	base_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Sequence of atomic values to be searched

	search_value: XM_XPATH_ATOMIC_VALUE
			-- Search value

	atomic_comparer: XM_XPATH_ATOMIC_COMPARER
			-- Atomic comparer

	last_position_index: INTEGER
			-- Position within `base_sequence' of currently matched value

invariant

	base_sequence_not_void: base_sequence /= Void
	search_value_not_void: search_value /= Void
	atomic_comparer_not_void: atomic_comparer /= Void

end
	
