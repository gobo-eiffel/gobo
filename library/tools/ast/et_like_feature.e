indexing

	description:

		"Eiffel 'like feature' types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LIKE_FEATURE

inherit

	ET_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_feature_id: INTEGER; p: like position) is
			-- Create a new 'like feature' type.
		require
			a_name_not_void: a_name /= Void
			a_feature_id_positive: a_feature_id >= 0
			p_not_void: p /= Void
		do
			name := a_name
			feature_id := a_feature_id
			position := p
		ensure
			name_set: name = a_name
			feature_id_set: feature_id = a_feature_id
			position_set: position = p
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name of the feature associated
			-- with current type

	feature_id: INTEGER
			-- Feature ID of one of the seeds of the
			-- feature associated with current type

	position: ET_POSITION
			-- Position of current type in source code

feature -- Status report

	same_syntactical_type (other: ET_TYPE): BOOLEAN is
			-- Are current type and `other' syntactically
			-- the same type (e.g. do not try to resolve
			-- anchored types)?
		local
			a_like: ET_LIKE_FEATURE
		do
			a_like ?= other
			if a_like /= Void then
				Result := (a_like.feature_id = feature_id)
			end
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

	actual_type (a_feature: ET_FEATURE; a_base_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_base_type',
			-- only made up of class names and generic formal parameters
			-- when `a_base_type' in a generic type not fully derived
		local
			seeds: DS_HASH_TABLE [ET_FEATURE, INTEGER]
			seeded_feature: ET_FEATURE
			a_query: ET_QUERY
		do
			seeds := a_base_type.base_class.seeds
			if seeds.has (feature_id) then
				seeded_feature := seeds.item (feature_id)
				a_query ?= seeded_feature
				if a_query /= Void then
						-- `a_base_type' has been flattened and no
						-- error occurred, so there is no loop in
						-- anchored types.
					Result := a_query.type.actual_type (a_feature, a_base_type)
				else
-- ERROR
					Result := Current
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
			!! Result.make (name, feature_id, position)
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
	feature_id_positive: feature_id >= 0

end -- class ET_LIKE_FEATURE
