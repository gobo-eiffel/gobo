indexing

	description:

		"Eiffel 'BIT feature' types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_BIT_FEATURE

inherit

	ET_BIT_TYPE
		rename
			make as make_bit_type
		redefine
			check_parent_validity,
			check_constraint_validity,
			deep_cloned_type,
			append_to_string
		end

creation

	make

feature {NONE} -- Initialization

	make (a_constant: like constant; a_name: like name;
		a_feature_id: INTEGER; p: like position) is
			-- Create a new 'BIT feature' type.
		require
			a_constant_not_void: a_constant /= Void
			a_name_not_void: a_name /= Void
			a_feature_id_positive: a_feature_id >= 0
			p_not_void: p /= Void
		do
			constant := a_constant
			name := a_name
			feature_id := a_feature_id
			position := p
			size := No_size
		ensure
			constant_set: constant = a_constant
			name_set: name = a_name
			feature_id_set: feature_id = a_feature_id
			position_set: position = p
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name of the feature associated with
			-- current type and which is supposed
			-- to be an integer constant attribute

	feature_id: INTEGER
			-- Feature ID of one of the seeds of the
			-- feature associated with current type

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

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			!! Result.make (constant, name, feature_id, position)
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (bit_keyword)
			a_string.append_character (' ')
			a_string.append_string (name.name)
		end

invariant

	name_not_void: name /= Void
	feature_id_positive: feature_id >= 0

end -- class ET_BIT_FEATURE
