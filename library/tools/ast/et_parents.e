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

feature -- Compilation status

	ancestors_computed: BOOLEAN is
			-- Have ancestors of parent classes already
			-- been computed?
		local
			a_parent: ET_PARENT
		do
			Result := True
			from a_parent := parents until a_parent = Void loop
				if not a_parent.type.base_class.ancestors_computed then
					Result := False
					a_parent := Void  -- Jump out of the loop.
				else
					a_parent := a_parent.next
				end
			end
		end

	is_flattened: BOOLEAN is
			-- Has features of parent classes been flattened?
		local
			a_parent: ET_PARENT
		do
			Result := True
			from a_parent := parents until a_parent = Void loop
				if not a_parent.is_flattened then
					Result := False
					a_parent := Void  -- Jump out of the loop.
				else
					a_parent := a_parent.next
				end
			end
		end

	flatten_error: BOOLEAN is
			-- Has a fatal error occurred during feature flattening?
		local
			a_parent: ET_PARENT
		do
			Result := True
			from a_parent := parents until a_parent = Void loop
				if not a_parent.flatten_error then
					Result := False
					a_parent := Void  -- Jump out of the loop.
				else
					a_parent := a_parent.next
				end
			end
		end

feature -- Compilation

	add_to_ancestors (anc: DS_HASH_SET [ET_CLASS]) is
		local
			a_parent: ET_PARENT
		do
			from a_parent := parents until a_parent = Void loop
				a_parent.type.base_class.add_to_ancestors (anc)
				a_parent := a_parent.next
			end
		end

	ancestors: DS_HASH_SET [ET_CLASS] is
		local
			a_parent: ET_PARENT
			a_class: ET_CLASS
		do
			!! Result.make (10)
			from a_parent := parents until a_parent = Void loop
				a_class := a_parent.type.base_class
				if not Result.has (a_class) then
					Result.force (a_class)
					Result.union (a_class.ancestors)
				end
				a_parent := a_parent.next
			end
		end


	add_ancestors (a_class: ET_CLASS) is
			-- Add current parents classes and their
			-- ancestors to `a_class's ancestors.
			-- Detect possible inheritance graph cycles.
		require
			a_class_not_void: a_class /= Void
			ancestors_not_void: a_class.ancestors /= Void
			valid_class: a_class.parents = Current
		local
			a_parent: ET_PARENT
		do
			from a_parent := parents until a_parent = Void loop
				a_parent.type.base_class.add_ancestors (a_class)
				a_parent := a_parent.next
			end
		end

	add_cyclic_ancestors (anc: ET_ANCESTORS) is
			-- Add current parents classes and their
			-- ancestors to `anc'.
		require
			anc_not_void: anc /= Void
			valid_anc: anc.current_class.parents = Current
		local
			a_parent: ET_PARENT
		do
			from a_parent := parents until a_parent = Void loop
				anc.add_parent (a_parent.type.base_class)
				a_parent := a_parent.next
			end
		end

	flatten is
			-- Flatten feature tables of current parents.
		local
			a_parent: ET_PARENT
		do
			from a_parent := parents until a_parent = Void loop
				a_parent.flatten
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
			no_flatten_error: not flatten_error
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
