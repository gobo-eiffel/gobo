indexing

	description:

		"Eiffel class parent lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENTS

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_PARENT_ITEM]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (an_inherit: like inherit_keyword) is
			-- Create a new class parent list.
		require
			an_inherit_not_void: an_inherit /= Void
		do
			inherit_keyword := an_inherit
			make_ast_list
		ensure
			inherit_keyword_set: inherit_keyword = an_inherit
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (an_inherit: like inherit_keyword; nb: INTEGER) is
			-- Create a new class parent list with capacity `nb'.
		require
			an_inherit_not_void: an_inherit /= Void
			nb_positive: nb >= 0
		do
			inherit_keyword := an_inherit
			make_ast_list_with_capacity (nb)
		ensure
			inherit_keyword_set: inherit_keyword = an_inherit
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	parent (i: INTEGER): ET_PARENT is
			-- Class parent at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).parent
		ensure
			parent_not_void: Result /= Void
		end

	inherit_keyword: ET_KEYWORD
			-- 'inherit' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := inherit_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if is_empty then
				Result := inherit_keyword.break
			else
				Result := item (count).break
			end
		end

feature -- Setting

	set_inherit_keyword (an_inherit: like inherit_keyword) is
			-- Set `inherit_keyword' to `an_inherit'.
		require
			an_inherit_not_void: an_inherit /= Void
		do
			inherit_keyword := an_inherit
		ensure
			inherit_keyword_set: inherit_keyword = an_inherit
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current parents.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				parent (i).type.add_to_system
				i := i + 1
			end
		end

feature -- Genealogy status

	ancestors_searched: BOOLEAN is
			-- Have ancestors of parent classes already
			-- been searched?
		local
			i, nb: INTEGER
		do
			nb := count
			Result := True
			from i := 1 until i > nb loop
				if not parent (i).ancestors_searched then
					Result := False
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_ancestors_error: BOOLEAN is
			-- Has a fatal error occurred during
			-- ancestors searching?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if parent (i).has_ancestors_error then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Genealogy

	add_to_sorter (an_heir: ET_CLASS;
		a_sorter: DS_TOPOLOGICAL_SORTER [ET_CLASS]) is
			-- Add current parents and their ancestors to `a_sorter'
			-- if not already done and if their ancestors have
			-- not been searched yet. `an_heir' is the class
			-- where current parents appear.
		require
			an_heir_not_void: an_heir /= Void
			a_sorter_not_void: a_sorter /= Void
		local
			i, nb: INTEGER
			a_type: ET_CLASS_TYPE
			a_class: ET_CLASS
		do
			nb := count
			from i := 1 until i > nb loop
				a_type := parent (i).type
				a_class := a_type.base_class
				a_class.add_to_sorter (a_type, an_heir, a_sorter)
				if not a_class.ancestors_searched then
					a_sorter.force_relation (a_class, an_heir)
				end
				i := i + 1
			end
		end

	set_ancestors_of (an_heir: ET_CLASS) is
			-- Set proper ancestors of `an_heir'.
		require
			an_heir_not_void: an_heir /= Void
			ancestors_searched: ancestors_searched
		local
			anc: DS_HASH_TABLE [ET_CLASS_TYPE, INTEGER]
			a_class: ET_CLASS
			a_type: ET_CLASS_TYPE
			a_parent: ET_PARENT
			i, nb: INTEGER
		do
			!! anc.make_map (10)
			an_heir.set_ancestors (anc)
			nb := count
			from i := 1 until i > nb loop
				a_parent := parent (i)
				a_type := a_parent.type
				a_class := a_type.base_class
				if a_class.has_ancestors_error then
					an_heir.set_ancestors_error
					i := nb + 1 -- Jump out of the loop.
				else
					a_parent.add_to_ancestors (an_heir, anc)
					if an_heir.has_ancestors_error then
						i := nb + 1 -- Jump out of the loop.
					else
							-- Do not call ET_TYPE.check_parent_validity
							-- here because checking conformance to generic
							-- constraints now may lead to infinite loop if
							-- `an_heir' is involved in a generic constraint
							-- or an actual generic parameter. Example:
							--
							--   class BAR [G]
							--   inherit
							--      FOO [BAR [G]]
							--      COMPARABLE
							--
							--   class FOO [G -> COMPARABLE]
							--
						i := i + 1
					end
				end
			end
		ensure
			heir_ancestors_searched: an_heir.ancestors_searched
		end

	set_ancestors_error is
			-- Set `has_ancestors_error' to true to current
			-- parents (and recursively to their parents)
			-- whose ancestors have not been searched yet.
		local
			i, nb: INTEGER
			a_class: ET_CLASS
			grand_parents: ET_PARENTS
		do
			nb := count
			from i := 1 until i > nb loop
				a_class := parent (i).type.base_class
				if not a_class.ancestors_searched then
					a_class.set_ancestors_error
					grand_parents := a_class.parents
					if grand_parents = Void then
						grand_parents := a_class.universe.any_parents
					end
					grand_parents.set_ancestors_error
				end
				i := i + 1
			end
		end

	add_descendant (an_heir: ET_CLASS) is
			-- Add `an_heir' to the list of descendant classes
			-- of current parents.
		require
			an_heir_not_void: an_heir /= Void
			ancestors_searched: an_heir.ancestors_searched
			no_ancestors_error: not an_heir.has_ancestors_error
		local
			i, nb: INTEGER
			a_class: ET_CLASS
		do
			nb := count
			from i := 1 until i > nb loop
				a_class := parent (i).type.base_class
				a_class.add_descendant (an_heir)
				i := i + 1
			end
		end

	check_generic_derivation (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current parents are valid
			-- generic derivations. Report errors if
			-- not valid.
		require
			an_heir_not_void: an_heir /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			Result := True
			from i := 1 until i > nb loop
				if not parent (i).check_generic_derivation (an_heir) then
					Result := False
				end
				i := i + 1
			end
		end

feature -- Flattening status

	is_flattened: BOOLEAN is
			-- Have features of parent classes been flattened?
		local
			i, nb: INTEGER
		do
			nb := count
			Result := True
			from i := 1 until i > nb loop
				if not parent (i).is_flattened then
					Result := False
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_flatten_error: BOOLEAN is
			-- Has a fatal error occurred during feature flattening?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if parent (i).has_flatten_error then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Feature flattening

	flatten is
			-- Flatten feature tables of current parents.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				parent (i).type.base_class.flatten
				i := i + 1
			end
		ensure
			is_flattened: is_flattened
		end

	add_inherited_features (a_flattener: ET_FEATURE_FLATTENER) is
			-- Add features inherited from current parents
			-- to `a_flattener'.
		require
			a_flattener_not_void: a_flattener /= Void
			is_flattened: is_flattened
			no_flatten_error: not has_flatten_error
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				a_flattener.add_inherited_features (parent (i))
				i := i + 1
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_parents (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_PARENT_ITEM] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	inherit_keyword_not_void: inherit_keyword /= Void

end
