indexing

	description:

		"Eiffel features being processed through the Feature_adaptation clause"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ADAPTED_FEATURE

inherit

	ET_FEATURE
		redefine
			type, arguments, is_inherited, is_selected,
			replicated_seeds, seeded_feature,
			selected_feature, replicated_features
		end

feature -- Status report

	is_flattened: BOOLEAN is False
			-- Is current feature flattened?

	is_inherited: BOOLEAN is True
			-- Is current feature being inherited?

	is_selected: BOOLEAN
			-- Has an inherited feature been selected
			-- to solve a replication conflict?

feature -- Access

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		do
			Result := flattened_feature.type
		ensure then
			definition: Result = flattened_feature.type
		end

	arguments: ET_FORMAL_ARGUMENT_LIST is
			-- Formal arguments;
			-- Void if not a routine or a routine with no arguments
		do
			Result := flattened_feature.arguments
		ensure then
			definition: Result = flattened_feature.arguments
		end

	flattened_feature: ET_FLATTENED_FEATURE
			-- Feature resulting after feature adaptation

	parent_feature: ET_FEATURE is
			-- Feature in `parent'
		deferred
		ensure
			parent_feature_not_void: Result /= Void
			parent_feature_inherited: Result.is_inherited
			parent_feature_not_redeclared: not Result.is_redeclared
		end

	seeded_feature (a_seed: INTEGER): ET_FEATURE is
			-- Either current feature or one of its merged or joined
			-- features whose precursor feature has `a_seed' as seed
		local
			a_feature: ET_FEATURE
		do
			from
				a_feature := parent_feature
			until
				Result /= Void
			loop
				if a_feature.precursor_feature.has_seed (a_seed) then
					Result := a_feature
				else
					a_feature := a_feature.merged_feature
				end
			end
		end

	selected_feature: ET_FEATURE is
			-- Either current feature or one of its merged or
			-- joined features that appears in a Select clause?
		local
			a_feature: ET_FEATURE
		do
			from
				a_feature := parent_feature
			until
				a_feature = Void
			loop
				if a_feature.has_select then
					Result := a_feature
					a_feature := Void -- Jump out of the loop.
				else
					a_feature := a_feature.merged_feature
				end
			end
		end

	adapted_feature: ET_ADAPTED_FEATURE is
			-- Version of current feature where none of its
			-- inherited components are flattened
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	replicated_seeds: ET_FEATURE_IDS
			-- Seeds involved when current feature has been replicated

	replicated_features: DS_LINKED_LIST [ET_FEATURE]
			-- Features which had the same seed as current feature
			-- in their parents but which have been replicated in
			-- current class

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := flattened_feature.break
		end

feature -- Status setting

	set_replicated (a_seed: INTEGER) is
			-- Set `is_replicated' to True.
			-- `a_seed' is the seed which needs replication.
		require
			has_seed: has_seed (a_seed)
		do
			if replicated_seeds = Void then
				create replicated_seeds.make (a_seed)
			elseif not replicated_seeds.has (a_seed) then
				replicated_seeds.put (a_seed)
			end
		ensure
			is_replicated: is_replicated
		end

	set_selected is
			-- Set `is_selected' to True.
		do
			is_selected := True
		ensure
			is_selected: is_selected
		end

feature -- Element change

	add_replicated_feature (a_feature: ET_FEATURE) is
			-- Add `a_feature' to `replicated_features'.
		require
			is_inherited: is_inherited
			is_selected: is_selected
			a_feature_not_void: a_feature /= Void
			a_feature_inherited: a_feature.is_inherited
			a_feature_not_redeclared: not a_feature.is_redeclared
		do
			if replicated_features = Void then
				create replicated_features.make
			end
			replicated_features.force_last (a_feature)
		end

feature -- Type processing

	resolve_inherited_signature (a_parent: ET_PARENT) is
			-- Resolve arguments and type inherited from `a_parent'.
			-- Resolve any formal generic parameters of declared types
			-- with the corresponding actual parameters in `a_parent',
			-- and duplicate identifier anchored types (and clear their
			-- base types).
		do
			flattened_feature.resolve_inherited_signature (a_parent)
		end

feature -- Conversion

	undefined_feature (a_name: like name): ET_DEFERRED_ROUTINE is
			-- Undefined version of current feature
		do
			Result := flattened_feature.undefined_feature (a_name)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			flattened_feature.process (a_processor)
		end

invariant

	not_flattened: not is_flattened
	is_inherited: is_inherited

end
