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

	ET_LIKE_IDENTIFIER
		rename
			make as make_like_identifier
		redefine
			same_syntactical_type, base_type,
			deep_cloned_type, process
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_feature_id: INTEGER) is
			-- Create a new 'like feature' type.
		require
			a_name_not_void: a_name /= Void
			a_feature_id_positive: a_feature_id > 0
		do
			like_keyword := tokens.like_keyword
			name := a_name
			feature_id := a_feature_id
		ensure
			name_set: name = a_name
			feature_id_set: feature_id = a_feature_id
		end

feature -- Access

	feature_id: INTEGER
			-- Feature ID of one of the seeds of the
			-- feature associated with current type

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

feature -- Conversion

	base_type (a_feature: ET_FEATURE; a_type: ET_CLASS_TYPE): ET_TYPE is
			-- Type, in the context of `a_feature' in `a_type',
			-- only made up of class names and generic formal parameters
			-- when `a_type' in a generic type not fully derived
			-- (Definition of base type in ETL2 p. 198)
		local
			a_class: ET_CLASS
			seeded_features: DS_HASH_TABLE [ET_FEATURE, INTEGER]
			seeded_feature: ET_FEATURE
			a_query: ET_QUERY
		do
			a_class := a_type.base_class
			if not a_class.has_flatten_error then
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
			create Result.make (name, feature_id)
			Result.set_like_keyword (like_keyword)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_like_feature (Current)
		end

invariant

	feature_id_positive: feature_id > 0

end
