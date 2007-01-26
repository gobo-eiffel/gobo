indexing

	description:

		"Objects that support implementation of the XPath remove() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REMOVE_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

create {XM_XPATH_REMOVE, XM_XPATH_REMOVE_ITERATOR}

	make

feature {NONE} -- Initialization

	make (a_base_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_removal_position: INTEGER) is
			-- Establish invariant.
		require
			base_sequence_before: a_base_sequence /= Void and then not a_base_sequence.is_error and then a_base_sequence.before
		do
			base_sequence := a_base_sequence
			removal_position := a_removal_position
		ensure
			base_sequence_set: base_sequence = a_base_sequence
			position_set: removal_position = a_removal_position
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
		do
			index := index + 1
			if base_sequence.before then
				base_sequence.start
			else
				base_sequence.forth -- can't be after - see `after'
			end
			if base_sequence.is_error then
				set_last_error (base_sequence.error_value)
			elseif not base_sequence.after then
				if index = removal_position then
					base_sequence.forth
					if base_sequence.is_error then
						set_last_error (base_sequence.error_value)
					elseif not base_sequence.after then
						item := base_sequence.item
					else
						item := Void
					end
				else
					item := base_sequence.item
				end
			else
				item := Void
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
		do
			create Result.make (base_sequence.another, removal_position)
		end

feature {NONE} -- Implementation

	base_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Sequence of atomic values to be searched

	removal_position: INTEGER
			-- Position of item to remove

invariant

	base_sequence_not_void: base_sequence /= Void

end
	
