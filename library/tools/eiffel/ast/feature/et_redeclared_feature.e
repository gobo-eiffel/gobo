indexing

	description:

		"Eiffel redeclared features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_REDECLARED_FEATURE

inherit

	ET_FEATURE
		redefine
			type, arguments, is_inherited, is_redeclared,
			precursor_feature, selected_feature, seeded_feature,
			redeclared_feature, flattened_feature, is_selected,
			replicated_seeds, is_other_seeds_shared, is_feature_shared,
			set_first_seed, set_other_seeds
		end

creation

	make

feature {NONE} -- Initialization

	make (a_feature: like current_feature; a_precursor: like precursor_feature) is
			-- Create a new redeclared feature.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_not_inherited: not a_feature.is_inherited
			a_precursor_not_void: a_precursor /= Void
			a_precursor_inherited: a_precursor.is_inherited
			a_precursor_not_redeclared: not a_precursor.is_redeclared
		do
			current_feature := a_feature
			precursor_feature := a_precursor
			parent := a_precursor.parent
			id := a_feature.id
			name_item := a_feature.name_item
			version := a_feature.version
			clients := a_feature.clients
			implementation_class := a_feature.implementation_class
			first_seed := a_precursor.first_seed
			other_seeds := a_precursor.other_seeds
			frozen_keyword := a_feature.frozen_keyword
		ensure
			current_feature_set: current_feature = a_feature
			precursor_feature_set: precursor_feature = a_precursor
			registered: id = a_feature.id
		end

feature -- Access

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		do
			Result := current_feature.type
		end

	arguments: ET_FORMAL_ARGUMENT_LIST is
			-- Formal arguments;
			-- Void if not a routine or a routine with no arguments
		do
			Result := current_feature.arguments
		end

	current_feature: ET_FEATURE
			-- Feature being redeclared

	precursor_feature: ET_FEATURE
			-- Feature inherited from `parent'

	redeclared_feature: ET_REDECLARED_FEATURE is
			-- Current feature viewed as a redeclared feature
		do
			Result := Current
		end

	selected_feature: ET_FEATURE is
			-- Either precursor feature or one of its merged or
			-- joined features that appears in a Select clause?
		local
			a_feature: ET_FEATURE
		do
			from
				a_feature := precursor_feature
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

	seeded_feature (a_seed: INTEGER): ET_FEATURE is
			-- Either precursor feature or one of its merged or joined
			-- features whose precursor feature has `a_seed' as seed
		local
			a_feature: ET_FEATURE
		do
			from
				a_feature := precursor_feature
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

	flattened_feature: ET_FEATURE is
			-- Feature resulting from feature adaptation
		do
			Result := current_feature
		ensure then
			definition: Result = current_feature
		end

	replicated_seeds: ET_FEATURE_IDS
			-- Seeds involved when current feature has been replicated

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := current_feature.break
		end

feature -- Setting

	set_first_seed (a_seed: INTEGER) is
			-- Set `first_seed' to `a_seed'.
		do
			first_seed := a_seed
			precursor_feature.set_first_seed (a_seed)
		end

	set_other_seeds (a_seeds: like other_seeds) is
			-- Set `other_seeds' to `a_seeds'.
		do
			other_seeds := a_seeds
			precursor_feature.set_other_seeds (a_seeds)
		end

feature -- Status report

	is_redeclared: BOOLEAN is True
			-- Is current feature being redeclared?

	is_inherited: BOOLEAN is True
			-- Is current feature being inherited?

	is_selected: BOOLEAN
			-- Has an inherited feature been selected
			-- to solve a replication conflict?

	is_feature_shared: BOOLEAN is False
			-- Is current feature object shared with `parent'?
			-- (If shared, then we need to duplicate this feature
			-- before modifying it in current heir.)

	is_other_seeds_shared: BOOLEAN is
			-- Is `other_seeds' object shared with one of
			-- the precursors? (If shared, then we need to
			-- clone it before modifying it.)
		do
			Result := precursor_feature.is_other_seeds_shared
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

feature -- Duplication

	new_synonym (a_name: like name_item): like Current is
			-- Synonym feature
		do
			create Result.make (current_feature.new_synonym (a_name), precursor_feature)
		end

feature -- Conversion

	renamed_feature (a_name: like name): like Current is
			-- Renamed version of current feature
		do
			create Result.make (current_feature.renamed_feature (a_name), precursor_feature)
		end

	undefined_feature (a_name: like name): ET_DEFERRED_ROUTINE is
			-- Undefined version of current feature
		do
			Result := current_feature.undefined_feature (a_name)
		end

feature -- Type processing

	resolve_inherited_signature (a_parent: ET_PARENT) is
			-- Resolve arguments and type inherited from `a_parent'.
			-- Resolve any formal generic parameters of declared types
			-- with the corresponding actual parameters in `a_parent',
			-- and duplicate identifier anchored types (and clear their
			-- base types).
		do
			current_feature.resolve_inherited_signature (a_parent)
		end

feature -- Element change

	put_inherited_feature (a_feature: ET_FEATURE) is
			-- Add `a_feature' to the inherited features.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_inherited: a_feature.is_inherited
			a_feature_not_redeclared: not a_feature.is_redeclared
			a_feature_not_merged: a_feature.merged_feature = Void
			same_name: a_feature.name.same_feature_name (name)
		local
			an_inherited_feature: ET_INHERITED_FEATURE
		do
			if precursor_feature.is_feature_shared then
				an_inherited_feature := a_feature.inherited_feature
				an_inherited_feature.put_inherited_feature (precursor_feature)
			else
				an_inherited_feature := precursor_feature.inherited_feature
				an_inherited_feature.put_inherited_feature (a_feature)
			end
			precursor_feature := an_inherited_feature
			first_seed := precursor_feature.first_seed
			other_seeds := precursor_feature.other_seeds
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			current_feature.process (a_processor)
		end

invariant

	is_redeclared: is_redeclared
	is_inherited: is_inherited
	not_feature_shared: not is_feature_shared
	current_feature_not_void: current_feature /= Void
	current_feature_not_inherited: not current_feature.is_inherited
	precursor_feature_inherited: precursor_feature.is_inherited
	first_seed_set: first_seed = precursor_feature.first_seed
	other_seeds_set: other_seeds = precursor_feature.other_seeds

end
