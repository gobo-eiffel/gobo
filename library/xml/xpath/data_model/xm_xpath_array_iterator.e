indexing

	description:

		"Objects that iterate over a slice of an array of items"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ARRAY_ITERATOR [G -> XM_XPATH_ITEM]

inherit

	XM_XPATH_REVERSIBLE_ITERATOR [G]
		redefine
			before
		end

	XM_XPATH_LAST_POSITION_FINDER [G]
		undefine
			before
		end

	KL_SHARED_STANDARD_FILES

creation

	make

		-- N.B. All items in the array should be non-void
		-- This is not specifically checked, but forth will fail it's post-condition
		-- if any item in the range is `Void'

feature {NONE} -- Initialization

	make (an_array: ARRAY [G]; a_start, an_end: INTEGER) is
		require
			array_not_void: an_array /= Void
			first_item: a_start >= 1 and then a_start <= an_array.count
			last_item: an_end >= a_start and then an_end <= an_array.count
		do
			items := an_array
			first_item := a_start
			last_item := an_end
		ensure
			array_set: items = an_array
			first_item_set: first_item = a_start
			last_item_set: last_item = an_end
		end
	
feature -- Access

	item: G is
			-- Value or node at the current position
		do
			Result := items.item (index)
		end

	reverse_iterator: XM_XPATH_SEQUENCE_ITERATOR [G] is
		do
			-- TODO
			todo ("reverse-iterator", False)
		end

	last_position: INTEGER is
			-- Last position (= number of items in sequence)
		do
			Result := last_item
		end

feature -- Status report

	before: BOOLEAN is
		do
			Result := index < first_item
		end

	after: BOOLEAN is
			-- Are there no more items in the sequence?
		do
			Result := index > last_item
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			if index = 0 then
				index := first_item
			else
				index := index + 1
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original;
			-- The new iterator will be repositioned at the start of the sequence
		do
			create Result.make (items, first_item, last_item)
		end

feature {NONE} -- Implementation

	items: ARRAY [G]
			-- Underlying array

	first_item: INTEGER
			-- First item in slice

	last_item: INTEGER
			-- Last item in slice

	todo (a_routine_name: STRING; is_partially_done: BOOLEAN) is
			-- Write a TODO message.
		require
			routine_name_not_void: a_routine_name /= Void and then a_routine_name.count > 2
		do
			std.error.put_string ("TODO: {")
			std.error.put_string (generating_type)
			std.error.put_string ("}.")
			std.error.put_string (a_routine_name)
			if is_partially_done then
				std.error.put_string (" is only partly written")
			else
				std.error.put_string (" needs to be written")
			end
			std.error.put_new_line
			end

invariant

	array_not_void: items /= Void
	first_item: first_item >= 1 and then first_item <= items.count
	last_item: last_item >= first_item and then last_item <= items.count
	
end
	
