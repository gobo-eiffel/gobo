note

	description:

		"[
        Objects that merge a sequence of sequences into a single flat sequence.
        The resulting sequence is never longer than the number of input sequences.
      ]"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ITEM_MAPPING_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

create

	make

feature {NONE} -- Initialization

	make (a_base_iterator: like base_iterator; a_mapping_function: like mapping_function) is
			-- Establish invariant.
		require
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			mapping_function_not_void: a_mapping_function /= Void
		do
			base_iterator := a_base_iterator
			mapping_function := a_mapping_function
		ensure
			base_set: base_iterator = a_base_iterator
			mapping_function_set: mapping_function = a_mapping_function
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Value or node at the current position

feature -- Status report

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := not base_iterator.before and then base_iterator.after
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			from
				item := Void
			until
				item /= Void or after
			loop
				if base_iterator.before then
					base_iterator.start
				else
					base_iterator.forth
				end
				if base_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} item.make (base_iterator.error_value)
					set_last_error (item.error_value)
				elseif base_iterator.after then
					item := Void
				else
					item := mapping_function.mapped_item (base_iterator.item)
				end
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (base_iterator.another, mapping_function)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- The underlying iterator

	mapping_function: XM_XPATH_ITEM_MAPPING_FUNCTION
			-- The mapping function

invariant

	base_iterator_not_void: base_iterator /= Void
	mapping_function_not_void: mapping_function /= Void

end
