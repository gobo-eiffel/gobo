indexing

	description:

		"Eiffel class parents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENT

inherit

	ET_PARENT_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_renames: like renames; an_exports: like exports;
		an_undefines: like undefines; a_redefines: like redefines;
		a_selects: like selects; an_end: like end_keyword) is
			-- Create a new parent clause.
		require
			a_type_not_void: a_type /= Void
			a_renames_constraint: a_renames /= Void implies an_end /= Void
			an_exports_constraint: an_exports /= Void implies an_end /= Void
			an_undefines_constraint: an_undefines /= Void implies an_end /= Void
			a_redefines_constraint: a_redefines /= Void implies an_end /= Void
			a_selects_constraint: a_selects /= Void implies an_end /= Void
		do
			type := a_type
			renames := a_renames
			exports := an_exports
			undefines := an_undefines
			redefines := a_redefines
			selects := a_selects
			end_keyword := an_end
		ensure
			type_set: type = a_type
			renames_set: renames = a_renames
			exports_set: exports = an_exports
			undefines_set: undefines = an_undefines
			redefines_set: redefines = a_redefines
			selects_set: selects = a_selects
			end_keyword_set: end_keyword = an_end
		end

feature -- Access

	type: ET_CLASS_TYPE
			-- Class type

	renames: ET_RENAMES
			-- Rename clause

	exports: ET_EXPORTS
			-- Export clause

	undefines: ET_KEYWORD_FEATURE_NAME_LIST
			-- Undefine clause

	redefines: ET_KEYWORD_FEATURE_NAME_LIST
			-- Redefine clause

	selects: ET_KEYWORD_FEATURE_NAME_LIST
			-- Select clause

	end_keyword: ET_TOKEN
			-- 'end' keyword

	parent: ET_PARENT is
			-- Class parent in semicolon-separated list
		do
			Result := Current
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := type.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if end_keyword /= Void then
				Result := end_keyword.break
			else
				Result := type.break
			end
		end

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
			a_generic_class_type: ET_GENERIC_CLASS_TYPE
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
					an_heir.error_handler.report_gagp_error (an_heir, anc_type, type)
					an_heir.set_ancestors_error
				end
			else
				anc.force_new (type, a_class_id)
					-- Find out whether formal parameters have
					-- been given actual derivations.
				a_generic_class_type ?= type
				if a_generic_class_type /= Void then
					generics := a_generic_class_type.generic_parameters
					if generics /= Void and then generics.has_derived_parameters then
						actual_parameters := generics
					end
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
							an_heir.set_ancestors_error
							a_cursor.go_after -- Jump out of the loop.
						else
							a_cursor.forth
						end
					else
						anc.force_new (a_type, a_class_id)
						a_cursor.forth
					end
				end
			end
		end

	check_generic_derivation (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current parent is valid
			-- generic derivation. Report errors if
			-- not valid.
		require
			an_heir_not_void: an_heir /= Void
		do
			Result := type.check_parent_validity (an_heir)
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

feature -- Exports

	add_clients_to (a_feature_name: ET_FEATURE_NAME; a_clients_list: DS_ARRAYED_LIST [ET_CLASS_NAME_LIST]) is
			-- Add client clauses relevant to `a_feature_name' to
			-- `a_clients_list'. Try to avoid adding client clauses
			-- when overridden by other client clauses in the list.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_clients_list_not_void: a_clients_list /= Void
			no_void_clients: not a_clients_list.has (Void)
		local
			i, nb: INTEGER
			an_export: ET_EXPORT
			a_clients: ET_CLIENTS
		do
			if exports /= Void then
				nb := exports.count
				from i := 1 until i > nb loop
					an_export := exports.item (i)
					if an_export.has_feature_name (a_feature_name) then
						a_clients := an_export.clients (a_feature_name)
						a_clients_list.force_last (a_clients)
					end
					i := i + 1
				end
			end
		end

invariant

	type_not_void: type /= Void
	renames_constraint: renames /= Void implies end_keyword /= Void
	exports_constraint: exports /= Void implies end_keyword /= Void
	undefines_constraint: undefines /= Void implies end_keyword /= Void
	redefines_constraint: redefines /= Void implies end_keyword /= Void
	selects_constraint: selects /= Void implies end_keyword /= Void

end
