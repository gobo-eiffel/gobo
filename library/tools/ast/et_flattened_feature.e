indexing

	description:

		"Eiffel features being flattened"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FLATTENED_FEATURE

creation

	make, make_inherited

feature {NONE} -- Initialization

	make (a_feature: like current_feature; a_class: like current_class) is
			-- Create a new flattened feature and set
			-- `current_feature' to `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			name := a_feature.name
			current_feature := a_feature
			current_class := a_class
			!! inherited_features.make
			seeds := current_feature.seeds
		ensure
			current_feature_set: current_feature = a_feature
			current_class_set: current_class = a_class
		end

	make_inherited (a_feature: ET_INHERITED_FEATURE; a_class: like current_class) is
			-- Create a new flattened feature and add
			-- `a_feature' to `inherited_features'.
		require
			a_feature_not_void: a_feature /= Void
		do
			name := a_feature.name
			current_class := a_class
			!! inherited_features.make
			put_inherited_feature (a_feature)
		ensure
			current_class_set: current_class = a_class
		end

feature -- Access

	name: ET_FEATURE_NAME
			-- Feature name

	current_feature: ET_FEATURE
			-- Feature declared in current class

	inherited_features: DS_LINKED_LIST [ET_INHERITED_FEATURE]
			-- Features inherited from parents

	seeds: ET_FEATURE_SEEDS
			-- Seeds

	current_class: ET_CLASS
			-- Class where current feature is flattened

	flattened_feature: ET_FEATURE
			-- Feature resulting from current feature adaptation;
			-- Void if not computed yet or if an error occurred
			-- during compilation

feature -- Status report

	is_selected: BOOLEAN
			-- Has an inherited feature been selected?

	is_replicated: BOOLEAN
			-- Has current feature been replicated?

	is_inherited: BOOLEAN is
			-- Is current feature inherited from a parent?
		do
			Result := not inherited_features.is_empty
		ensure
			definition: Result = not inherited_features.is_empty
		end

feature -- Status setting

	set_replicated (a_seed: INTEGER) is
			-- Set `is_replicated' to true.
			-- `a_seed' is the seed which needs replication.
		require
			has_seed: seeds.has (a_seed)
		local
			need_twin: BOOLEAN
		do
			is_replicated := True
			feature_id := current_class.universe.next_feature_id
			need_twin := (seeds = inherited_features.first.inherited_feature.seeds)
			if need_twin then
				seeds := clone (seeds)
			end
			seeds.replace (a_seed, feature_id)
		ensure
			is_replicated: is_replicated
		end

feature -- Element change

	put_inherited_feature (a_feature: ET_INHERITED_FEATURE) is
			-- Add `a_feature' to `inherited_features'.
		require
			a_feature_not_void: a_feature /= Void
			same_name: a_feature.name.same_feature_name (name)
		local
			other_seeds: like seeds
			a_seed: INTEGER
			i, nb: INTEGER
			need_twin: BOOLEAN
		do
			if inherited_features.is_empty then
				seeds := a_feature.inherited_feature.seeds
			else
				need_twin := (seeds = inherited_features.first.inherited_feature.seeds)
				other_seeds := a_feature.inherited_feature.seeds
				nb := other_seeds.count
				from i := 1 until i > nb loop
					a_seed := other_seeds.item (i)
					if not seeds.has (a_seed) then
						if need_twin then
							seeds := clone (seeds)
							need_twin := False
						end
						seeds.put (a_seed)
					end
					i := i + 1
				end
			end
			inherited_features.put_last (a_feature)
			if a_feature.is_selected then
				if is_selected then
						-- Error: two selected features.
				end
				is_selected := True
			end
		end

feature -- Compilation

	process_flattened_feature is
			-- Process current feature adaptation and
			-- put the result in `flattened_feature'.
		do
			if inherited_features.is_empty then
				process_immediate_feature
			elseif current_feature = Void then
				process_inherited_feature
			else
				process_redeclared_feature
			end
		end

feature {NONE} -- Compilation

	process_immediate_feature is
			-- Process feature that aas been introduced
			-- in `current_class' (ETL2, p. 56).
		require
			immediate_feature: inherited_features.is_empty
		do
			flattened_feature := current_feature
		end

	process_redeclared_feature is
			-- Process an inherited feature which has been
			-- given a new declaration in `current_class'.
		require
			inherited_feature: not inherited_features.is_empty
			redeclared_feature: current_feature /= Void
		local
			inherited_feature, effective: ET_INHERITED_FEATURE
			is_deferred: BOOLEAN
		do
			is_deferred := current_feature.is_deferred
			from inherited_features.start until inherited_features.after loop
				inherited_feature := inherited_features.item_for_iteration
				inherited_feature.check_undefine_clause (current_class)
				inherited_feature.check_redefine_clause (current_class)
				if inherited_feature.is_redefined then
					if is_deferred /= inherited_feature.is_deferred then
						if is_deferred then
							-- Error
						else
							-- Error
						end
					end
				elseif is_deferred then
					if inherited_feature.is_deferred then
						-- Error
					else
						-- Error
					end
				elseif not inherited_feature.is_deferred then
					-- Error
				end
				if not inherited_feature.is_deferred then
					if effective = Void then
						effective := inherited_feature
					elseif not effective.same_version (inherited_feature) then
							-- Error.
					end
				end
				if not current_feature.signature_conforms_to (inherited_feature.inherited_feature) then
					-- Error
				end
				inherited_features.forth
			end
			flattened_feature := current_feature
			flattened_feature.set_seeds (seeds)
		end

	process_inherited_feature is
			-- Process an inherited feature which has not been
			-- given a new declaration in `current_class'.
		require
			inherited_feature: current_feature = Void
		local
			inherited_feature, a_feature: ET_INHERITED_FEATURE
			same_version: BOOLEAN
			is_deferred: BOOLEAN
		do
			same_version := True
			from inherited_features.start until inherited_features.after loop
				inherited_feature := inherited_features.item_for_iteration
				inherited_feature.check_undefine_clause (current_class)
				inherited_feature.check_redefine_clause (current_class)
				if inherited_feature.is_redefined then
					-- Error
				end
				if a_feature = Void then
					a_feature := inherited_feature
				elseif a_feature.same_version (inherited_feature) then
						-- Sharing.
						-- Trying to choose one which is not renamed
						-- to avoid duplication.
					if a_feature.is_renamed then
						a_feature := inherited_feature
					end
				elseif inherited_feature.is_deferred then
					same_version := False
					if a_feature.is_deferred and not a_feature.signature_conforms_to (inherited_feature) then
						a_feature := inherited_feature
					end
				elseif a_feature.is_deferred then
					same_version := False
					a_feature := inherited_feature
				else
						-- Error.
					same_version := False
					a_feature := inherited_feature
				end
				inherited_features.forth
			end
			if is_replicated then
				flattened_feature := a_feature.replicated_feature (feature_id, current_class)
			else
				flattened_feature := a_feature.adapted_feature (not same_version, current_class)
			end
			flattened_feature.set_seeds (seeds)
			if not same_version then
				is_deferred := a_feature.is_deferred
				from inherited_features.start until inherited_features.after loop
					inherited_feature := inherited_features.item_for_iteration
					if is_deferred then
						if not a_feature.same_signature (inherited_feature) then
								-- Error
							if not a_feature.signature_conforms_to (inherited_feature) then
								-- Error
							end
						end
					elseif not a_feature.signature_conforms_to (inherited_feature) then
							-- Error
					end
					inherited_features.forth
				end
			end
		end

feature {ET_REPLICABLE_FEATURE} -- Replication

	feature_id: INTEGER
			-- New feature ID when feature is replicated
--		require
--			is_replicated: is_replicated
--		ensure
--			id_positive: Result >= 0

invariant

	inherited_features_not_void: inherited_features /= Void
	no_void_inherited_feature: not inherited_features.has (Void)
	at_least_one: current_feature /= Void or else not inherited_features.is_empty
	current_class_not_void: current_class /= Void
	seeds_not_void: seeds /= Void

end -- class ET_FLATTENED_FEATURE
