indexing

	description:

		"Eiffel class parents"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
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

feature -- Compilation

	flatten is
			-- Flatten feature table of current parent.
		do
			type.base_class.flatten
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
