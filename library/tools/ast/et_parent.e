indexing

	description:

		"Eiffel class parents"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_PARENT

inherit

	KL_IMPORTED_ARRAY_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_renames: like renames; an_exports: like exports;
		an_undefines: like undefines; a_redefines: like redefines; a_selects: like selects) is
			-- Create a new parent clause.
			
		require
			a_type_not_void: a_type /= Void
			no_void_rename: a_renames /= Void implies not ANY_ARRAY_.has (a_renames, Void)
			no_void_export: an_exports /= Void implies not ANY_ARRAY_.has (an_exports, Void)
			no_void_undefine: an_undefines /= Void implies not ANY_ARRAY_.has (an_undefines, Void)
			no_void_redefine: a_redefines /= Void implies not ANY_ARRAY_.has (a_redefines, Void)
			no_void_select: a_selects /= Void implies not ANY_ARRAY_.has (a_selects, Void)
		do
			type := a_type
			renames := a_renames
			exports := an_exports
			undefines := an_undefines
			redefines := a_redefines
			selects := a_selects
		ensure
			type_set: type = a_type
			renames_set: renames = a_renames
			exports_set: exports = an_exports
			undefines_set: undefines = an_undefines
			redefines_set: redefines = a_redefines
			selects_set: selects = a_selects
		end

feature -- Access

	type: ET_CLASS_TYPE
			-- Class type

	renames: ARRAY [ET_RENAME]
			-- Rename clause

	exports: ARRAY [ET_EXPORT]
			-- Export clause

	undefines: ARRAY [ET_FEATURE_NAME]
			-- Undefine clause

	redefines: ARRAY [ET_FEATURE_NAME]
			-- Redefine clause

	selects: ARRAY [ET_FEATURE_NAME]
			-- Select clause

	next: ET_PARENT
			-- Next parent in parent list

feature -- Genealogy status

	ancestors_searched: BOOLEAN is
			-- Have ancestors of parent class already
			-- been searched?
		do
			Result := type.base_class.ancestors_searched
		end

	has_ancestors_error: BOOLEAN is
			-- Has a fatal error occurred during
			-- ancestors searching?
		do
			Result := type.base_class.has_ancestors_error
		end

feature -- Genealogy

	add_to_ancestors (an_heir: ET_CLASS;
		anc: DS_HASH_TABLE [ET_CLASS_TYPE, INTEGER]) is
			-- Add current parent and its ancestors to the
			-- list of ancestors `anc' of class `an_heir'.
		require
			an_heir_not_void: an_heir /= Void
			anc_not_void: anc /= Void
			no_void_ancestor: not anc.has_item (Void)
			ancestors_searched: ancestors_searched
			no_ancestors_error: not has_ancestors_error
		local
			a_class: ET_CLASS
			a_class_id: INTEGER
			a_type, anc_type: ET_CLASS_TYPE
			has_error: BOOLEAN
			an_actual: ET_TYPE
			a_formal: ET_FORMAL_GENERIC_TYPE
			generics: ET_ACTUAL_GENERIC_PARAMETERS
			actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS_TYPE, INTEGER]
		do
				-- Add current parent to the ancestors
				-- of `an_heir'.
			a_class := type.base_class
			a_class_id := a_class.id
			anc.search (a_class_id)
			if anc.found then
				anc_type := anc.found_item
				if not anc_type.same_syntactical_type (type) then
					has_error := True
					an_heir.error_handler.report_gagp_error (an_heir, anc_type, type)
				end
			end
			if not has_error then
				anc.force (type, a_class_id)
					-- Find out whether formal parameters have
					-- been given actual derivations.
				generics := type.generic_parameters
				if generics /= Void and then generics.has_derived_parameters then
					actual_parameters := generics
				end
					-- Add proper ancestors of current parent
					-- to the ancestors of `an_heir'.
				a_cursor := a_class.ancestors.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_type := a_cursor.item
					if actual_parameters /= Void and then a_type.has_formal_parameters (actual_parameters) then
						a_type := a_type.deep_cloned_type
						a_type := a_type.resolved_formal_parameters (actual_parameters)
					end
					a_class_id := a_type.base_class.id
					anc.search (a_class_id)
					if anc.found then
						anc_type := anc.found_item
						if not anc_type.same_syntactical_type (a_type) then
							an_heir.error_handler.report_gagp_error (an_heir, anc_type, a_type)
							has_error := True
							a_cursor.go_after -- Jump out of the loop.
						end
					end
					if not has_error then
						anc.force (a_type, a_class_id)
						a_cursor.forth
					end
				end
			end
			if has_error then
				an_heir.set_ancestors_error (True)
			end
		end

feature -- Generic derivation

	check_generic_derivation (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current parent is valid
			-- generic derivations. Report errors if
			-- not valid.
		require
			an_heir_not_void: an_heir /= Void
		do
			Result := type.check_parent_validity2 (an_heir)
		end

feature -- Flattening status

	is_flattened: BOOLEAN is
			-- Have features of parent class been flattened?
		do
			Result := type.base_class.is_flattened
		end

	has_flatten_error: BOOLEAN is
			-- Has a fatal error occurred during feature flattening?
		do
			Result := type.base_class.has_flatten_error
		end

feature -- Setting

	set_next (a_parent: like next) is
			-- Set `next' to `a_parent'.
		do
			next := a_parent
		ensure
			next_set: next = a_parent
		end

invariant

	type_not_void: type /= Void
	no_void_rename: renames /= Void implies not ANY_ARRAY_.has (renames, Void)
	no_void_export: exports /= Void implies not ANY_ARRAY_.has (exports, Void)
	no_void_undefine: undefines /= Void implies not ANY_ARRAY_.has (undefines, Void)
	no_void_redefine: redefines /= Void implies not ANY_ARRAY_.has (redefines, Void)
	no_void_select: selects /= Void implies not ANY_ARRAY_.has (selects, Void)

end -- class ET_PARENT
