indexing

	description:

		"Eiffel 'like Current' types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LIKE_CURRENT

inherit

	ET_TYPE

creation

	make

feature {NONE} -- Initialization

	make (p: like position) is
			-- Create a new 'like Current' type.
		require
			p_not_void: p /= Void
		do
			position := p
		ensure
			position_set: position = p
		end

feature -- Access

	position: ET_POSITION
			-- Position of current type in source code

feature -- Status report

	same_syntactical_type (other: ET_TYPE): BOOLEAN is
			-- Are current type and `other' syntactically
			-- the same type (e.g. do not try to resolve
			-- anchored types)?
		local
			a_current: ET_LIKE_CURRENT
		do
			a_current ?= other
			Result := a_current /= Void
		end

feature -- Validity

	check_parent_validity (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Report errors if not valid.
		do
			Result := False
			an_heir.error_handler.report_vhpr3_error (an_heir, Current)
		end

	check_constraint_validity (a_formal: ET_FORMAL_GENERIC_PARAMETER; a_class: ET_CLASS;
		a_sorter: DS_TOPOLOGICAL_SORTER [ET_FORMAL_GENERIC_PARAMETER]): BOOLEAN is
			-- Check whether current type is valid when it
			-- appears in a constraint of the formal generic
			-- parameter `a_formal' in class `a_class'.
			-- `a_sorter' is used to find possible cycle in
			-- formal generic parameter declaration.
			-- Report errors if not valid.
		do
			Result := False
			a_class.error_handler.report_vcfg3_error (a_class, Current)
		end

feature -- Conversion

	base_type (a_feature: ET_FEATURE; a_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_type',
			-- only made up of class names and generic formal parameters
			-- when `a_type' in a generic type not fully derived
			-- (Definition of base type in ETL2 p. 198)
		do
				-- `a_type.base_class' has been flattened and no
				-- error occurred, so there is no loop in
				-- anchored types.
			Result := a_type.base_type (a_feature, a_type)
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			Result := Current
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (like_space_current)
		end

feature {NONE} -- Constants

	like_space_current: STRING is "like Current"
			-- Eiffel keywords

end -- class ET_LIKE_CURRENT
