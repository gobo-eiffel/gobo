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

	check_parent_validity1 (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when
			-- it appears in parent clause of `an_heir'.
			-- Do not check conformance to generic
			-- constraints. Report errors if not valid.
		do
			Result := False
			an_heir.error_handler.report_vhpr3_error (an_heir, Current)
		end

	check_constraint_validity (a_class: ET_CLASS): BOOLEAN is
			-- Check whether current type is valid when it
			-- appears in a constraint of a formal generic
			-- parameter of class `a_class'. Report errors
			-- if not valid.
		do
			Result := False
			a_class.error_handler.report_vcfg3_error (a_class, Current)
		end

feature -- Conversion

	actual_type (a_feature: ET_FEATURE; a_base_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_base_type',
			-- only made up of class names and generic formal parameters
			-- when `a_base_type' in a generic type not fully derived
		do
				-- `a_base_type' has been flattened and no
				-- error occurred, so there is no loop in
				-- anchored types.
			Result := a_base_type.actual_type (a_feature, a_base_type)
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			!! Result.make (position)
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (like_keyword)
			a_string.append_character (' ')
			a_string.append_string (current_keyword)
		end

feature {NONE} -- Constants

	like_keyword: STRING is "like"
	current_keyword: STRING is "Current"
			-- Eiffel keywords

end -- class ET_LIKE_CURRENT
