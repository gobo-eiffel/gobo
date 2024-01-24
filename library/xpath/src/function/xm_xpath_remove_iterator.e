note

	description:

		"Objects that support implementation of the XPath remove() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_REMOVE_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES

create {XM_XPATH_REMOVE, XM_XPATH_REMOVE_ITERATOR}

	make

feature {NONE} -- Initialization

	make (a_base_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_removal_position: INTEGER)
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
		do
			check preocndition_not_off: attached internal_item as l_internal_item then
				Result := l_internal_item
			end
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := base_sequence.after or else internal_item = Void
		end

feature -- Cursor movement

	forth
			-- Move to next position
		do
			index := index + 1
			if base_sequence.before then
				base_sequence.start
			else
				base_sequence.forth -- can't be after - see `after'
			end
			if attached base_sequence.error_value as l_error_value then
				check is_error: base_sequence.is_error end
				set_last_error (l_error_value)
			elseif not base_sequence.after then
				if index = removal_position then
					base_sequence.forth
					if attached base_sequence.error_value as l_error_value then
						check is_error: base_sequence.is_error end
						set_last_error (l_error_value)
					elseif not base_sequence.after then
						internal_item := base_sequence.item
					else
						internal_item := Void
					end
				else
					internal_item := base_sequence.item
				end
			else
				internal_item := Void
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original;
		do
			create Result.make (base_sequence.another, removal_position)
		end

feature {NONE} -- Implementation

	base_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Sequence of atomic values to be searched

	removal_position: INTEGER
			-- Position of item to remove

	internal_item: detachable XM_XPATH_ITEM
			-- Value or node at the current position

invariant

	base_sequence_not_void: base_sequence /= Void

end

