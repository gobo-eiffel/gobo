indexing

	description:

		"Eiffel comma-separated lists of class names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CLASS_NAME_LIST

inherit

	ET_AST_LIST [ET_CLASS_NAME_ITEM]

creation

	make, make_with_capacity

feature -- Access

	class_name (i: INTEGER): ET_CLASS_NAME is
			-- Class name at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).class_name_item
		ensure
			class_name_not_void: Result /= Void
		end

feature -- Status report

	is_none: BOOLEAN is
			-- Does current client list only contain the
			-- class name "NONE"?
		do
			if count = 1 then
				Result := class_name (1).same_class_name (none_class_name)
			end
		end

	has_descendant (a_class: ET_CLASS): BOOLEAN is
			-- Is `a_class' a descendant of any of classes in list?
		require
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			a_name: ET_CLASS_NAME
			a_universe: ET_UNIVERSE
		do
			a_universe := a_class.universe
			if a_class = a_universe.none_class then
					-- NONE is a descendant of all classes.
				Result := not is_empty
			else
					-- Search ancestors of `a_class' first to make sure that if
					-- `a_class' is a descendant of any class in list then this
					-- class is in the universe (it is possible to specify class
					-- names in client clauses which are not in the universe).
				if a_class.is_parsed and then not a_class.has_syntax_error then
					a_class.search_ancestors
					if not a_class.has_ancestors_error then
						nb := count
						from i := 1 until i > nb loop
							a_name := class_name (i)
							if a_universe.has_class (a_name) then
								if a_class.has_ancestor (a_universe.eiffel_class (a_name)) then
									Result := True
									i := nb + 1 -- Jump out of the loop.
								else
									i := i + 1
								end
							end
						end
					end
				end
			end
		end

feature -- Element change

	extend_first (other: ET_CLASS_NAME_LIST) is
			-- Add class names of `other' to current list.
		require
			other_not_void: other /= Void
			not_full: count + other.count <= capacity
		local
			i, nb: INTEGER
		do
			nb := other.count
			from i := 1 until i > nb loop
				put_first (other.item (i))
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_CLASS_NAME_ITEM] is
			-- Fixed array routines
		once
			!! Result
		end

feature {NONE} -- Implementation

	none_class_name: ET_CLASS_NAME is
			-- "NONE" class name
		once
			!ET_IDENTIFIER! Result.make ("NONE")
		ensure
			none_class_name_not_void: Result /= Void
		end

end -- class ET_CLASS_NAME_LIST
