indexing

	description:

		"Eiffel 'like feature' types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LIKE_FEATURE

inherit

	ET_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_like: like like_keyword; a_name: like name; a_feature_id: INTEGER) is
			-- Create a new 'like feature' type.
		require
			a_like_not_void: a_like /= Void
			a_name_not_void: a_name /= Void
			a_feature_id_positive: a_feature_id > 0
		do
			like_keyword := a_like
			name := a_name
			feature_id := a_feature_id
		ensure
			like_keyword_set: like_keyword = a_like
			name_set: name = a_name
			feature_id_set: feature_id = a_feature_id
		end

feature -- Access

	like_keyword: ET_TOKEN
			-- 'like' keyword

	name: ET_IDENTIFIER
			-- Name of the feature associated
			-- with current type

	feature_id: INTEGER
			-- Feature ID of one of the seeds of the
			-- feature associated with current type

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := like_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := name.break
		end

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

	base_type (a_feature: ET_FEATURE; a_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_type',
			-- only made up of class names and generic formal parameters
			-- when `a_type' in a generic type not fully derived
			-- (Definition of base type in ETL2 p. 198)
		local
			seeded_features: DS_HASH_TABLE [ET_FEATURE, INTEGER]
			seeded_feature: ET_FEATURE
			a_query: ET_QUERY
		do
			seeded_features := a_type.base_class.seeded_features
			seeded_features.search (feature_id)
			if seeded_features.found then
				seeded_feature := seeded_features.found_item
				a_query ?= seeded_feature
				if a_query /= Void then
						-- `a_type.base_class' has been flattened and no
						-- error occurred, so there is no loop in
						-- anchored types.
					Result := a_query.type.base_type (a_feature, a_type)
				else
-- TODO:
-- ERROR
					Result := Current
				end
			else
-- TODO:
-- ERROR
				Result := Current
			end
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		do
			!! Result.make (like_keyword, name, feature_id)
		end

feature -- Output

	append_to_string (a_string: STRING) is
			-- Append textual representation of
			-- current type to `a_string'.
		do
			a_string.append_string (like_space)
			a_string.append_string (name.name)
		end

feature {NONE} -- Constants

	like_space: STRING is "like "
			-- Eiffel keywords

invariant

	like_keyword_not_void: like_keyword /= Void
	name_not_void: name /= Void
	feature_id_positive: feature_id > 0

end
