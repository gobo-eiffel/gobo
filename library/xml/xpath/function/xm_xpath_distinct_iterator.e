note

	description:

		"Objects that support implementation of the XPath distinct-values() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DISTINCT_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

	XM_XPATH_SHARED_COMPARISON_KEY_TESTER
		export {NONE} all end

create {XM_XPATH_DISTINCT_VALUES, XM_XPATH_DISTINCT_ITERATOR}

	make

feature {NONE} -- Initialization

	make (a_base_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; an_atomic_comparer: XM_XPATH_ATOMIC_SORT_COMPARER) is
			-- Establish invariant.
		require
			base_sequence_not_before: a_base_sequence /= Void and then not a_base_sequence.is_error and then a_base_sequence.before
			atomic_comparer_not_void: an_atomic_comparer /= Void
		do
			base_sequence := a_base_sequence
			atomic_comparer := an_atomic_comparer
			create values_seen.make_default
			values_seen.set_equality_tester (comparison_key_tester)
		ensure
			base_sequence_set: base_sequence = a_base_sequence
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
			an_item: XM_XPATH_ITEM
			a_comparison_key: XM_XPATH_COMPARISON_KEY
		do
			index := index + 1
			if base_sequence.before then
				base_sequence.start
			else
				base_sequence.forth -- can't be after - see `after'
			end
			if base_sequence.is_error then
				set_last_error (base_sequence.error_value)
			else
				item := Void
				from
				until
					base_sequence.is_error or else base_sequence.after or else item /= Void
				loop
					an_item := base_sequence.item
					if an_item.is_error then
						item := an_item
					else
						check
							item_is_atomic: an_item.is_atomic_value
							-- static typing in XM_XPATH_DISTINCT_VALUES
						end
						a_comparison_key := atomic_comparer.comparison_key (an_item.as_atomic_value)
						if values_seen.has (a_comparison_key) then
							if not base_sequence.after then
								base_sequence.forth
							end
						else
							values_seen.force_new (a_comparison_key)
							item := an_item.as_atomic_value
						end
					end
				end
				if base_sequence.is_error then
					set_last_error (base_sequence.error_value)
				end
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
		do
			create Result.make (base_sequence.another, atomic_comparer)
		end

feature {NONE} -- Implementation

	base_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Sequence of atomic values to be searched

	atomic_comparer: XM_XPATH_ATOMIC_SORT_COMPARER
			-- Atomic comparer

	values_seen: DS_HASH_SET [XM_XPATH_COMPARISON_KEY]
			-- Values already seen

invariant

	base_sequence_not_void: base_sequence /= Void
	atomic_comparer_not_void: atomic_comparer /= Void
	values_seen_not_void: values_seen /= Void

end
	
