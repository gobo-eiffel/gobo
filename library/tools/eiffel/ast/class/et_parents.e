indexing

	description:

		"Eiffel class parent lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_PARENTS

creation

	make

feature {NONE} -- Initialization

	make (a_parent: like parents) is
			-- Create a new parent list with initially
			-- one parent `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		do
			parents := a_parent
		ensure
			parents_set: parents = a_parent
		end

feature -- Access

	parents: ET_PARENT
			-- Parents

feature -- Element change

	put_first (a_parent: like parents) is
			-- Add `a_parent' to the list of parents.
		require
			a_parent_not_void: a_parent /= Void
		do
			a_parent.set_next (parents)
			parents := a_parent
		ensure
			one_more: parents.next = old parents
			parent_added: parents = a_parent
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current parents.
		local
			a_parent: ET_PARENT
		do
			from a_parent := parents until a_parent = Void loop
				a_parent.type.add_to_system
				a_parent := a_parent.next
			end
		end

feature -- Genealogy status

	ancestors_searched: BOOLEAN is
			-- Have ancestors of parent classes already
			-- been searched?
		local
			a_parent: ET_PARENT
		do
			Result := True
			from a_parent := parents until a_parent = Void loop
				if not a_parent.ancestors_searched then
					Result := False
					a_parent := Void -- Jump out of the loop.
				else
					a_parent := a_parent.next
				end
			end
		end

	has_ancestors_error: BOOLEAN is
			-- Has a fatal error occurred during
			-- ancestors searching?
		local
			a_parent: ET_PARENT
		do
			from a_parent := parents until a_parent = Void loop
				if a_parent.has_ancestors_error then
					Result := True
					a_parent := Void -- Jump out of the loop.
				else
					a_parent := a_parent.next
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
			a_parent: ET_PARENT
			a_type: ET_CLASS_TYPE
			a_class: ET_CLASS
		do
			from a_parent := parents until a_parent = Void loop
				a_type := a_parent.type
				a_class := a_type.base_class
				a_class.add_to_sorter (a_type, an_heir, a_sorter)
				if not a_class.ancestors_searched then
					a_sorter.force_relation (a_class, an_heir)
				end
				a_parent := a_parent.next
			end
		end

	set_ancestors_of (an_heir: ET_CLASS) is
			-- Set proper ancestors of `an_heir'.
		require
			an_heir_not_void: an_heir /= Void
			ancestors_searched: ancestors_searched
		local
			anc: DS_HASH_TABLE [ET_CLASS_TYPE, INTEGER]
			a_parent: ET_PARENT
			a_class: ET_CLASS
			a_type: ET_CLASS_TYPE
		do
			!! anc.make_map (10)
			an_heir.set_ancestors (anc)
			from a_parent := parents until a_parent = Void loop
				a_type := a_parent.type
				a_class := a_type.base_class
				if a_class.has_ancestors_error then
					an_heir.set_ancestors_error
					a_parent := Void -- Jump out of the loop.
				else
					a_parent.add_to_ancestors (an_heir, anc)
					if an_heir.has_ancestors_error then
						a_parent := Void -- Jump out of the loop.
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
						a_parent := a_parent.next
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
			a_parent: ET_PARENT
			a_class: ET_CLASS
			grand_parents: ET_PARENTS
		do
			from a_parent := parents until a_parent = Void loop
				a_class := a_parent.type.base_class
				if not a_class.ancestors_searched then
					a_class.set_ancestors_error
					grand_parents := a_class.parents
					if grand_parents = Void then
						grand_parents := a_class.universe.any_parents
					end
					grand_parents.set_ancestors_error
				end
				a_parent := a_parent.next
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
			a_parent: ET_PARENT
			a_class: ET_CLASS
		do
			from a_parent := parents until a_parent = Void loop
				a_class := a_parent.type.base_class
				a_class.add_descendant (an_heir)
				a_parent := a_parent.next
			end
		end

	check_generic_derivation (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current parents are valid
			-- generic derivations. Report errors if
			-- not valid.
		require
			an_heir_not_void: an_heir /= Void
		local
			a_parent: ET_PARENT
		do
			Result := True
			from a_parent := parents until a_parent = Void loop
				if not a_parent.check_generic_derivation (an_heir) then
					Result := False
				end
				a_parent := a_parent.next
			end
		end

feature -- Flattening status

	is_flattened: BOOLEAN is
			-- Have features of parent classes been flattened?
		local
			a_parent: ET_PARENT
		do
			Result := True
			from a_parent := parents until a_parent = Void loop
				if not a_parent.is_flattened then
					Result := False
					a_parent := Void -- Jump out of the loop.
				else
					a_parent := a_parent.next
				end
			end
		end

	has_flatten_error: BOOLEAN is
			-- Has a fatal error occurred during feature flattening?
		local
			a_parent: ET_PARENT
		do
			from a_parent := parents until a_parent = Void loop
				if a_parent.has_flatten_error then
					Result := True
					a_parent := Void -- Jump out of the loop.
				else
					a_parent := a_parent.next
				end
			end
		end

feature -- Feature flattening

	flatten is
			-- Flatten feature tables of current parents.
		local
			a_parent: ET_PARENT
		do
			from a_parent := parents until a_parent = Void loop
				a_parent.type.base_class.flatten
				a_parent := a_parent.next
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
			a_parent: ET_PARENT
		do
			from a_parent := parents until a_parent = Void loop
				a_flattener.add_inherited_features (a_parent)
				a_parent := a_parent.next
			end
		end

invariant

	parents_not_void: parents /= Void

end -- class ET_PARENTS
