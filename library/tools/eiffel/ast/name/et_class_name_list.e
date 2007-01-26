indexing

	description:

		"Eiffel comma-separated lists of class names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLASS_NAME_LIST

inherit

	ET_HEAD_LIST [ET_CLASS_NAME_ITEM]
		export
			{ET_CLASS_NAME_LIST} storage
		end
		
	ET_SHARED_TOKEN_CONSTANTS

create

	make, make_with_capacity

feature -- Access

	class_name (i: INTEGER): ET_CLASS_NAME is
			-- Class name at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).class_name
		ensure
			class_name_not_void: Result /= Void
		end

feature -- Status report

	is_none: BOOLEAN is
			-- Does current client list only contain the
			-- class name "NONE" or is empty?
		do
			if count = 1 then
				Result := storage.item (0).class_name.is_none
			elseif count = 0 then
				Result := True
			end
		end

	has_any: BOOLEAN is
			-- Does current client list contain at least
			-- the class name "ANY"?
		do
			Result := has_class_name (tokens.any_class_name)
		end

	has_class_name (a_name: like class_name): BOOLEAN is
			-- Does `a_name' appear in current list?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if a_name.same_class_name (storage.item (i).class_name) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_class (a_class: ET_CLASS): BOOLEAN is
			-- Does the name of `a_class' appear in current list?
		require
			a_class_not_void: a_class /= Void
		do
			Result := has_class_name (a_class.name)
		end

	has_descendant (a_class: ET_CLASS; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is `a_class' a descendant of any of classes in list?
			-- True if `a_class' is NONE, even if current list is empty.
			-- (Note: Use `a_universe.ancestor_builder' on the classes whose ancestors
			-- need to be built in order to check for descendants.)
		require
			a_class_not_void: a_class /= Void
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
			a_name: ET_CLASS_NAME
		do
			if a_class = a_universe.none_class then
					-- NONE is a descendant of all classes.
				Result := True
			else
					-- Search ancestors of `a_class' first to make sure that if
					-- `a_class' is a descendant of any class in list then this
					-- class is in the universe (it is possible to specify class
					-- names in client clauses which are not in the universe).
				if not a_class.is_preparsed then
					a_universe.preparse
				end
				if not a_class.is_preparsed then
					Result := has_class (a_class)
				else
					a_class.process (a_universe.ancestor_builder)
					if a_class.ancestors_built and then not a_class.has_ancestors_error then
						nb := count - 1
						from i := 0 until i > nb loop
							a_name := storage.item (i).class_name
							if a_universe.has_class (a_name) then
								if a_class.has_ancestor (a_universe.eiffel_class (a_name), a_universe) then
									Result := True
									i := nb + 1 -- Jump out of the loop.
								else
									i := i + 1
								end
							else
								i := i + 1
							end
						end
					end
				end
			end
		end

feature -- Comparison

	same_class_names (other: ET_CLASS_NAME_LIST): BOOLEAN is
			-- Do current list and `other' contain the same set of class names?
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			other_storage: like storage
		do
			if other = Current then
				Result := True
			else
				Result := True
				nb := count - 1
				from i := 0 until i > nb loop
					if not other.has_class_name (storage.item (i).class_name) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
				if Result then
					other_storage := other.storage
					nb := other.count - 1
					from i := 0 until i > nb loop
						if not has_class_name (other_storage.item (i).class_name) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
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
			other_storage: like storage
		do
			other_storage := other.storage
			nb := other.count - 1
			from i := 0 until i > nb loop
				put_first (other_storage.item (i))
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_CLASS_NAME_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

end
