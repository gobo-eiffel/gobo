indexing

	description:

		"Eiffel feature adaptation resolvers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_ADAPTATION_RESOLVER

inherit

	ET_SHARED_FEATURE_NAME_TESTER

	ET_SHARED_CLASS_NAME_TESTER

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new feature adaptation resolver for classes in `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
			current_class := a_universe.unknown_class
			create rename_table.make_map (10)
			rename_table.set_key_equality_tester (feature_name_tester)
			create export_table.make (10)
			export_table.set_equality_tester (feature_name_tester)
			create undefine_table.make_map (10)
			undefine_table.set_key_equality_tester (feature_name_tester)
			create redefine_table.make_map (10)
			redefine_table.set_key_equality_tester (feature_name_tester)
			create select_table.make_map (10)
			select_table.set_key_equality_tester (feature_name_tester)
			create replicable_features.make_map (400)
		ensure
			universe_set: universe = a_universe
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Error handling

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when checking
			-- validity of last feature adaptations?

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := universe.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Feature adaptation resolving

	resolve_feature_adaptations (a_class: ET_CLASS; a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]) is
			-- Resolve the feature adaptations of the inheritance clause
			-- of `a_class' and put resulting features in `a_features'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_class_not_void: a_class /= Void
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
		local
			old_class: ET_CLASS
			a_parents: ET_PARENT_LIST
			i, nb: INTEGER
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			add_current_features (a_features)
			a_parents := current_class.parents
			if a_parents = Void or else a_parents.is_empty then
				if current_class = universe.general_class then
					a_parents := Void
				elseif current_class = universe.any_class then
						-- ISE Eiffel has no GENERAL class anymore.
						-- Use ANY as class root now.
					a_parents := Void
				else
					a_parents := universe.any_parents
				end
			end
			if a_parents /= Void then
				nb := a_parents.count
				from i := 1 until i > nb loop
					add_inherited_features (a_parents.parent (i), a_features)
					i := i + 1
				end
			end
			process_replication (a_features)
				-- Clean up.
			free_parent_feature := parent_feature_list
			free_inherited_feature := inherited_feature_list
			free_redeclared_feature := redeclared_feature_list
			current_class := old_class
		ensure
			no_void_feature: not a_features.has_item (Void)
		end

feature {NONE} -- Feature recording

	add_current_features (a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]) is
			-- Add to `a_features' features declared in `current_class'.
		require
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
		local
			a_feature: ET_FEATURE
			other_feature: ET_FLATTENED_FEATURE
			a_name: ET_FEATURE_NAME
			class_features: ET_FEATURE_LIST
			i, nb: INTEGER
		do
			class_features := current_class.features
			nb := current_class.declared_feature_count
			if a_features.capacity < nb then
				a_features.resize (nb)
			end
			from i := 1 until i > nb loop
				a_feature := class_features.item (i)
				a_name := a_feature.name
				a_features.search (a_name)
				if a_features.found then
					set_fatal_error
					other_feature := a_features.found_item
					error_handler.report_vmfn0a_error (current_class, other_feature.flattened_feature, a_feature)
				else
					a_features.put_last (a_feature, a_name)
				end
				i := i + 1
			end
		ensure
			no_void_feature: not a_features.has_item (Void)
		end

	add_inherited_features (a_parent: ET_PARENT; a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]) is
			-- Add to `a_features' features inherited from `a_parent'.
			-- Also process the Feature_adaptation clause of `a_parent'.
			-- `a_parent' is one of the parents, explicit or implicit
			-- (i.e. ANY), of `current_class'.
		require
			a_parent_not_void: a_parent /= Void
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
		local
			a_class: ET_CLASS
			has_rename: BOOLEAN
			has_export: BOOLEAN
			has_redefine: BOOLEAN
			has_undefine: BOOLEAN
			has_select: BOOLEAN
			nb_redefine: INTEGER
			nb_undefine: INTEGER
			nb_select: INTEGER
			class_features: ET_FEATURE_LIST
			a_feature: ET_FEATURE
			a_named_feature: ET_FLATTENED_FEATURE
			a_redeclared_feature: ET_REDECLARED_FEATURE
			an_inherited_feature: ET_INHERITED_FEATURE
			a_parent_feature: ET_PARENT_FEATURE
			a_name: ET_FEATURE_NAME
			a_rename: ET_RENAME
			i, nb: INTEGER
		do
			if a_parent.renames /= Void then
				fill_rename_table (a_parent)
				has_rename := not rename_table.is_empty
			end
			if a_parent.exports /= Void then
				fill_export_table (a_parent)
				has_export := not export_table.is_empty
			end
			if a_parent.undefines /= Void then
				fill_undefine_table (a_parent)
				nb_undefine := undefine_table.count
				has_undefine := nb_undefine > 0
			end
			if a_parent.redefines /= Void then
				fill_redefine_table (a_parent)
				nb_redefine := redefine_table.count
				has_redefine := nb_redefine > 0
			end
			if a_parent.selects /= Void then
				fill_select_table (a_parent)
				nb_select := select_table.count
				has_select := nb_select > 0
			end
			a_class := a_parent.type.direct_base_class (universe)
			class_features := a_class.features
			nb := class_features.count + a_features.count
			if a_features.capacity < nb then
				a_features.resize (nb)
			end
			nb := class_features.count
			from i := 1 until i > nb loop
				a_feature := class_features.item (i)
				a_parent_feature := new_parent_feature (a_feature, a_parent)
				a_name := a_feature.name
				if has_rename then
					rename_table.search (a_name)
					if rename_table.found then
						a_rename := rename_table.found_item
						rename_table.remove_found_item
						has_rename := not rename_table.is_empty
						a_parent_feature.set_new_name (a_rename)
						a_name := a_rename.new_name.feature_name
					end
				end
				if has_export then
					export_table.search (a_name)
					if export_table.found then
						export_table.remove_found_item
						has_export := not export_table.is_empty
					end
				end
				if has_undefine then
					undefine_table.search (a_name)
					if undefine_table.found then
						a_parent_feature.set_undefine_name (undefine_table.found_key)
						if not undefine_table.found_item then
							undefine_table.replace_found_item (True)
							nb_undefine := nb_undefine - 1
						end
					end
				end
				if has_redefine then
					redefine_table.search (a_name)
					if redefine_table.found then
						a_parent_feature.set_redefine_name (redefine_table.found_key)
						if not redefine_table.found_item then
							redefine_table.replace_found_item (True)
							nb_redefine := nb_redefine - 1
						end
					end
				end
				if has_select then
					select_table.search (a_name)
					if select_table.found then
						a_parent_feature.set_select_name (select_table.found_key)
						if not select_table.found_item then
							select_table.replace_found_item (True)
							nb_select := nb_select - 1
						end
					end
				end
				a_features.search (a_name)
				if a_features.found then
					a_named_feature := a_features.found_item
					if a_named_feature.is_immediate then
						a_redeclared_feature := new_redeclared_feature (a_named_feature.immediate_feature, a_parent_feature)
						a_features.replace_found_item (a_redeclared_feature)
					elseif a_named_feature.is_redeclared then
						a_redeclared_feature := a_named_feature.redeclared_feature
						a_redeclared_feature.put_parent_feature (a_parent_feature)
					elseif a_named_feature.is_inherited then
						an_inherited_feature := a_named_feature.inherited_feature
						an_inherited_feature.put_parent_feature (a_parent_feature)
					end
				else
					an_inherited_feature := new_inherited_feature (a_parent_feature)
					a_features.put_last (an_inherited_feature, a_name)
				end
				i := i + 1
			end
			if has_rename then
				from rename_table.start until rename_table.after loop
					set_fatal_error
					a_rename := rename_table.item_for_iteration
					error_handler.report_vhrc1a_error (current_class, a_parent, a_rename)
					rename_table.forth
				end
				rename_table.wipe_out
			end
			if has_export then
				from export_table.start until export_table.after loop
					set_fatal_error
					a_name := export_table.item_for_iteration
					error_handler.report_vlel2a_error (current_class, a_parent, a_name)
					export_table.forth
				end
				export_table.wipe_out
			end
			if has_undefine then
				if nb_undefine > 0 then
					from undefine_table.start until undefine_table.after loop
						if not undefine_table.item_for_iteration then
							set_fatal_error
							a_name := undefine_table.key_for_iteration
							error_handler.report_vdus1a_error (current_class, a_parent, a_name)
						end
						undefine_table.forth
					end
				end
				undefine_table.wipe_out
			end
			if has_redefine then
				if nb_redefine > 0 then
					from redefine_table.start until redefine_table.after loop
						if not redefine_table.item_for_iteration then
							set_fatal_error
							a_name := redefine_table.key_for_iteration
							error_handler.report_vdrs1a_error (current_class, a_parent, a_name)
						end
						redefine_table.forth
					end
				end
				redefine_table.wipe_out
			end
			if has_select then
				if nb_select > 0 then
					from select_table.start until select_table.after loop
						if not select_table.item_for_iteration then
							set_fatal_error
							a_name := select_table.key_for_iteration
							error_handler.report_vmss1a_error (current_class, a_parent, a_name)
						end
						select_table.forth
					end
				end
				select_table.wipe_out
			end
		ensure
			no_void_feature: not a_features.has_item (Void)
		end

feature {NONE} -- Feature adaptation

	rename_table: DS_HASH_TABLE [ET_RENAME, ET_FEATURE_NAME]
			-- Rename table

	export_table: DS_HASH_SET [ET_FEATURE_NAME]
			-- Export table

	undefine_table: DS_HASH_TABLE [BOOLEAN, ET_FEATURE_NAME]
			-- Undefine table (the boolean indicates whether a feature with that name has been found)

	redefine_table: DS_HASH_TABLE [BOOLEAN, ET_FEATURE_NAME]
			-- Redefine table (the boolean indicates whether a feature with that name has been found)

	select_table: DS_HASH_TABLE [BOOLEAN, ET_FEATURE_NAME]
			-- Select table (the boolean indicates whether a feature with that name has been found)

	fill_rename_table (a_parent: ET_PARENT) is
			-- Fill `rename_table' with rename pairs of `a_parent'
			-- indexed by their old_name.
		require
			a_parent_not_void: a_parent /= Void
			renames_not_void: a_parent.renames /= Void
		local
			i, nb: INTEGER
			a_renames: ET_RENAME_LIST
			a_rename: ET_RENAME
			a_name: ET_FEATURE_NAME
		do
			a_renames := a_parent.renames
			nb := a_renames.count
			if rename_table.capacity < nb then
				rename_table.resize (nb)
			end
			from i := 1 until i > nb loop
				a_rename := a_renames.rename_pair (i)
				a_name := a_rename.old_name
				rename_table.search (a_name)
				if not rename_table.found then
					rename_table.put (a_rename, a_name)
				else
						-- Feature name `a_name' appears twice on the
						-- left-hand-side of a Rename_pair in the Rename
						-- clause.
					if not rename_table.found_item.new_name.same_extended_feature_name (a_rename.new_name) then
							-- The two Rename_pairs have a different `new_name'.
							-- The flatten process will have to fail.
						set_fatal_error
					end
					error_handler.report_vhrc2a_error (current_class, a_parent, rename_table.found_item, a_rename)
				end
				i := i + 1
			end
		end

	fill_export_table (a_parent: ET_PARENT) is
			-- Fill `export_table' with export feature names of `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			exports_not_void: a_parent.exports /= Void
		local
			i, nb: INTEGER
			an_exports: ET_EXPORT_LIST
			an_export: ET_EXPORT
			an_all_export: ET_ALL_EXPORT
			other_all_export: ET_ALL_EXPORT
			a_feature_export: ET_FEATURE_EXPORT
			j, nb2: INTEGER
			new_count: INTEGER
			a_name: ET_FEATURE_NAME
		do
			an_exports := a_parent.exports
			nb := an_exports.count
			from i := 1 until i > nb loop
				an_export := an_exports.item (i)
				an_all_export ?= an_export
				if an_all_export /= Void then
					if other_all_export /= Void then
							-- Two 'all' export clauses for this parent.
							-- This is not considered as a fatal error by gelint.
						error_handler.report_vlel1a_error (current_class, a_parent, other_all_export, an_all_export)
					else
						other_all_export := an_all_export
					end
				else
					a_feature_export ?= an_export
					if a_feature_export /= Void then
						nb2 := a_feature_export.count
						new_count := new_count + nb2
						if export_table.capacity < new_count then
							 export_table.resize (new_count)
						end
						from j := 1 until j > nb2 loop
							a_name := a_feature_export.feature_name (j)
							export_table.search (a_name)
							if not export_table.found then
								export_table.put_new (a_name)
							else
									-- Feature name `a_name' appears twice in the Export clause.
									-- This is not considered as a fatal error by gelint.
								error_handler.report_vlel3a_error (current_class, a_parent, export_table.found_item, a_name)
							end
							j := j + 1
						end
					end
				end
				i := i + 1
			end
		end

	fill_undefine_table (a_parent: ET_PARENT) is
			-- Fill `undefine_table' with undefined names of `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			undefines_not_void: a_parent.undefines /= Void
		local
			i, nb: INTEGER
			a_undefines: ET_KEYWORD_FEATURE_NAME_LIST
			a_name: ET_FEATURE_NAME
		do
			a_undefines := a_parent.undefines
			nb := a_undefines.count
			if undefine_table.capacity < nb then
				undefine_table.resize (nb)
			end
			from i := 1 until i > nb loop
				a_name := a_undefines.feature_name (i)
				undefine_table.search (a_name)
				if not undefine_table.found then
					undefine_table.put_new (False, a_name)
				else
						-- Feature name `a_name' appears twice in the
						-- Undefine clause. This is not considered as
						-- a fatal error by gelint.
					error_handler.report_vdus4a_error (current_class, a_parent, undefine_table.found_key, a_name)
				end
				i := i + 1
			end
		end

	fill_redefine_table (a_parent: ET_PARENT) is
			-- Fill `redefine_table' with redefined names of `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			redefines_not_void: a_parent.redefines /= Void
		local
			i, nb: INTEGER
			a_redefines: ET_KEYWORD_FEATURE_NAME_LIST
			a_name: ET_FEATURE_NAME
		do
			a_redefines := a_parent.redefines
			nb := a_redefines.count
			if redefine_table.capacity < nb then
				redefine_table.resize (nb)
			end
			from i := 1 until i > nb loop
				a_name := a_redefines.feature_name (i)
				redefine_table.search (a_name)
				if not redefine_table.found then
					redefine_table.put_new (False, a_name)
				else
						-- Feature name `a_name' appears twice in the
						-- Redefine clause. This is not considered as
						-- a fatal error by gelint.
					error_handler.report_vdrs3a_error (current_class, a_parent, redefine_table.found_key, a_name)
				end
				i := i + 1
			end
		end

	fill_select_table (a_parent: ET_PARENT) is
			-- Fill `select_table' with selected names of `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			selects_not_void: a_parent.selects /= Void
		local
			i, nb: INTEGER
			a_selects: ET_KEYWORD_FEATURE_NAME_LIST
			a_name: ET_FEATURE_NAME
		do
			a_selects := a_parent.selects
			nb := a_selects.count
			if select_table.capacity < nb then
				select_table.resize (nb)
			end
			from i := 1 until i > nb loop
				a_name := a_selects.feature_name (i)
				select_table.search (a_name)
				if not select_table.found then
					select_table.put_new (False, a_name)
				else
						-- Feature name `a_name' appears twice in the
						-- Select clause. This is not considered as
						-- a fatal error by gelint.
					error_handler.report_vmss2a_error (current_class, a_parent, select_table.found_key, a_name)
				end
				i := i + 1
			end
		end

feature {NONE} -- Replication

	replicable_features: DS_HASH_TABLE [ET_REPLICABLE_FEATURE, INTEGER]
			-- Table of potentially replicable features, indexed by seed

	process_replication (a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]) is
			-- Take care of selected features and replication
			-- in `a_features'.
		require
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
		local
			l_feature: ET_FLATTENED_FEATURE
			l_adapted_feature: ET_ADAPTED_FEATURE
			l_replicable_feature: ET_REPLICABLE_FEATURE
			l_other_seeds: ET_FEATURE_IDS
			l_seed: INTEGER
			i, nb: INTEGER
		do
			from a_features.start until a_features.after loop
				l_feature := a_features.item_for_iteration
				if l_feature.is_adapted then
					l_adapted_feature := l_feature.adapted_feature
					l_seed := l_adapted_feature.first_seed
					record_replicable_feature (l_adapted_feature, l_seed)
					l_other_seeds := l_adapted_feature.other_seeds
					if l_other_seeds /= Void then
						nb := l_other_seeds.count
						from i := 1 until i > nb loop
							l_seed := l_other_seeds.item (i)
							record_replicable_feature (l_adapted_feature, l_seed)
							i := i + 1
						end
					end
				end
				a_features.forth
			end
			from replicable_features.start until replicable_features.after loop
				l_replicable_feature := replicable_features.item_for_iteration
				if l_replicable_feature.has_replication then
					l_seed := replicable_features.key_for_iteration
					process_replicated_feature (l_replicable_feature.replicated_feature, l_seed)
				elseif l_replicable_feature.selected_count /= 0 then
					-- There is still a chance that this feature was
					-- listed in the Select subclause to resolve a
					-- replication conflict with another seed. Wait
					-- until all possible replications have been processed.
					-- The actual check is done in `flatten_feature'.
				end
				replicable_features.forth
			end
			replicable_features.wipe_out
		end

	record_replicable_feature (a_feature: ET_ADAPTED_FEATURE; a_seed: INTEGER) is
			-- Record `a_feature' with seed `a_seed' in `replicable_features'.
		require
			a_feature_not_void: a_feature /= Void
			valid_seed: a_feature.has_seed (a_seed)
		local
			other_feature: ET_ADAPTED_FEATURE
			a_replicable_feature: ET_REPLICABLE_FEATURE
			a_replicated_feature: ET_REPLICATED_FEATURE
		do
			replicable_features.search (a_seed)
			if replicable_features.found then
				a_replicable_feature := replicable_features.found_item
				if a_replicable_feature.has_replication then
					a_replicated_feature := a_replicable_feature.replicated_feature
					a_replicated_feature.put_feature (a_feature)
				else
					other_feature := a_replicable_feature.first_feature
					create a_replicated_feature.make (other_feature, a_feature)
					replicable_features.replace_found_item (a_replicated_feature)
				end
			else
				replicable_features.force_new (a_feature, a_seed)
			end
		end

	process_replicated_feature (a_feature: ET_REPLICATED_FEATURE; a_seed: INTEGER) is
			-- Process replicated feature `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_replicated_features: DS_LINKED_LIST [ET_ADAPTED_FEATURE]
			a_parent_features: DS_ARRAYED_LIST [ET_PARENT_FEATURE]
			a_parent_feature: ET_PARENT_FEATURE
			a_replicated_feature: ET_ADAPTED_FEATURE
			a_selected_feature: ET_ADAPTED_FEATURE
		do
			a_replicated_features := a_feature.features
			inspect a_feature.selected_count
			when 0 then
				create a_parent_features.make (a_replicated_features.count)
				from a_replicated_features.start until a_replicated_features.after loop
					a_replicated_feature := a_replicated_features.item_for_iteration
					a_parent_feature := a_replicated_feature.seeded_feature (a_seed)
					a_parent_features.put_last (a_parent_feature)
					a_replicated_features.forth
				end
				set_fatal_error
				error_handler.report_vmrc2a_error (current_class, a_parent_features)
			when 1 then
					-- OK.
				from a_replicated_features.start until a_replicated_features.after loop
					a_replicated_feature := a_replicated_features.item_for_iteration
					if not a_replicated_feature.has_selected_feature then
						a_replicated_feature.set_replicated (a_seed)
					else
						a_replicated_feature.set_selected
						a_selected_feature := a_replicated_feature
					end
					a_replicated_features.forth
				end
				from a_replicated_features.start until a_replicated_features.after loop
					a_replicated_feature := a_replicated_features.item_for_iteration
					if not a_replicated_feature.has_selected_feature then
						from
							a_parent_feature := a_replicated_feature.parent_feature
						until
							a_parent_feature = Void
						loop
							if a_parent_feature.has_seed (a_seed) then
								a_selected_feature.add_replicated_feature (a_parent_feature)
							end
							a_parent_feature := a_parent_feature.merged_feature
						end
					end
					a_replicated_features.forth
				end
			else
				create a_parent_features.make (a_replicated_features.count)
				from a_replicated_features.start until a_replicated_features.after loop
					a_replicated_feature := a_replicated_features.item_for_iteration
					if a_replicated_feature.has_selected_feature then
						a_replicated_feature.set_selected
						a_parent_feature := a_replicated_feature.selected_feature
						a_parent_features.put_last (a_parent_feature)
					end
					a_replicated_features.forth
				end
				set_fatal_error
				error_handler.report_vmrc2b_error (current_class, a_parent_features)
			end
		end

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

feature {NONE} -- Access

	current_class: ET_CLASS
			-- Class being processed

feature {NONE} -- Implementation

	new_parent_feature (a_feature: ET_FEATURE; a_parent: ET_PARENT): ET_PARENT_FEATURE is
			-- New parent feature
		require
			a_feature_not_void: a_feature /= Void
			a_parent_not_void: a_parent /= Void
		do
			if free_parent_feature /= Void then
				Result := free_parent_feature
				Result.reset (a_feature, a_parent)
				free_parent_feature := free_parent_feature.next
			else
				create Result.make (a_feature, a_parent)
				Result.set_next (parent_feature_list)
				parent_feature_list := Result
			end
		ensure
			parent_feature_not_void: Result /= Void
		end

	new_inherited_feature (a_parent_feature: ET_PARENT_FEATURE): ET_INHERITED_FEATURE is
			-- New inherited feature
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		do
			if free_inherited_feature /= Void then
				Result := free_inherited_feature
				Result.reset (a_parent_feature)
				free_inherited_feature := free_inherited_feature.next
			else
				create Result.make (a_parent_feature)
				Result.set_next (inherited_feature_list)
				inherited_feature_list := Result
			end
		ensure
			inherited_feature_not_void: Result /= Void
		end

	new_redeclared_feature (a_feature: ET_FEATURE; a_parent_feature: ET_PARENT_FEATURE): ET_REDECLARED_FEATURE is
			-- Reset redeclared feature.
		require
			a_feature_not_void: a_feature /= Void
			a_parent_feature_not_void: a_parent_feature /= Void
		do
			if free_redeclared_feature /= Void then
				Result := free_redeclared_feature
				Result.reset (a_feature, a_parent_feature)
				free_redeclared_feature := free_redeclared_feature.next
			else
				create Result.make (a_feature, a_parent_feature)
				Result.set_next (redeclared_feature_list)
				redeclared_feature_list := Result
			end
		ensure
			redeclared_feature_not_void: Result /= Void
		end

	parent_feature_list: ET_PARENT_FEATURE
			-- Parent feature free list

	free_parent_feature: ET_PARENT_FEATURE
			-- First available parent feature in free list

	inherited_feature_list: ET_INHERITED_FEATURE
			-- Inherited feature free list

	free_inherited_feature: ET_INHERITED_FEATURE
			-- First available inherited feature in free list

	redeclared_feature_list: ET_REDECLARED_FEATURE
			-- Redeclared feature free list

	free_redeclared_feature: ET_REDECLARED_FEATURE
			-- First available redeclared feature in free list

invariant

	universe_not_void: universe /= Void
	current_class_not_void: current_class /= Void
	rename_table_not_void: rename_table /= Void
	no_void_rename: not rename_table.has_item (Void)
	no_void_rename_old_name: not rename_table.has (Void)
	export_table_not_void: export_table /= Void
	no_void_export: not export_table.has (Void)
	undefine_table_not_void: undefine_table /= Void
	no_void_undefine: not undefine_table.has (Void)
	redefine_table_not_void: redefine_table /= Void
	no_void_redefine: not redefine_table.has (Void)
	select_table_not_void: select_table /= Void
	no_void_select: not select_table.has (Void)
	replicable_features_not_void: replicable_features /= Void
	no_void_replicable_feature: not replicable_features.has_item (Void)

end
