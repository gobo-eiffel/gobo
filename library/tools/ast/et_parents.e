indexing

	description:

		"Eiffel class parent lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
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

feature -- Compilation

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
		end

	add_inherited_features (a_features: ET_INHERITED_FEATURES) is
			-- Add features inherited from current parents
			-- to `inherited_features'.
		require
			a_features_not_void: a_features /= Void
		local
			a_parent: ET_PARENT
		do
			from a_parent := parents until a_parent = Void loop
				a_features.add_inherited_features (a_parent)
				a_parent := a_parent.next
			end
		end

invariant

	parents_not_void: parents /= Void

end -- class ET_PARENTS
