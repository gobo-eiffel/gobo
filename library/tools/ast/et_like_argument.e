indexing

	description:

		"Eiffel 'like argument' types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LIKE_ARGUMENT

inherit

	ET_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; an_index: INTEGER; p: like position) is
			-- Create a new 'like argument' type.
		require
			a_name_not_void: a_name /= Void
			an_index_positive: an_index >= 1
			p_not_void: p /= Void
		do
			name := a_name
			index := an_index
			position := p
		ensure
			name_set: name = a_name
			index_set: index = an_index
			position_set: position = p
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name of the argument associated
			-- with current type

	index: INTEGER
			-- Index in the argument list of the
			-- argument associated with current type

	position: ET_POSITION
			-- Position of current type in source code

feature -- Status report

	same_syntactical_type (other: ET_TYPE): BOOLEAN is
			-- Are current type and `other' syntactically
			-- the same type (e.g. do not try to resolve
			-- anchored types)?
		local
			a_like: ET_LIKE_ARGUMENT
		do
			a_like ?= other
			if a_like /= Void then
				Result := (a_like.index = index)
			end
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
		local
			a_routine: ET_ROUTINE
			args: ET_FORMAL_ARGUMENTS
		do
			a_routine ?= a_feature
			if a_routine /= Void then
				args := a_routine.arguments
				if args = Void or else index > args.count then
-- ERROR
					Result := Current
				else
						-- `a_base_type' has been flattened and no
						-- error occurred, so there is no loop in
						-- anchored types.
					Result := args.item (index).type.actual_type (a_feature, a_base_type)
				end
			else
-- ERROR
				Result := Current
			end
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			!! Result.make (name, index, position)
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (like_keyword)
			a_string.append_character (' ')
			a_string.append_string (name.name)
		end

feature {NONE} -- Constants

	like_keyword: STRING is "like"
			-- Eiffel keywords

invariant

	name_not_void: name /= Void
	index_positive: index >= 1

end -- class ET_LIKE_ARGUMENT
