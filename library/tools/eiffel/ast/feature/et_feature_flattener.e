indexing

	description:

		"Eiffel feature flatteners"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_FLATTENER

inherit

	ET_SHARED_FEATURE_NAME_TESTER

creation

	make

feature {NONE} -- Initialization

	make (a_class: like current_class) is
			-- Create a new feature flattener for class `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			!! named_features.make (200)
			named_features.set_key_equality_tester (feature_name_tester)
			!! rename_table.make (10)
			rename_table.set_key_equality_tester (feature_name_tester)
			!! undefine_table.make (10)
			undefine_table.set_equality_tester (feature_name_tester)
			!! redefine_table.make (10)
			redefine_table.set_equality_tester (feature_name_tester)
			!! select_table.make (10)
			select_table.set_equality_tester (feature_name_tester)
			!! replicable_features.make_map (400)
			!! clients_list.make (20)
			set_current_class (a_class)
		ensure
			current_class_set: current_class = a_class
		end

feature -- Access

	current_class: ET_CLASS
			-- Class being flattened

	named_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]
			-- Features indexed by name

	nb_seeded_features: INTEGER
			-- Number of seeded features after replication
			-- has been processed

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := current_class.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Setting

	set_current_class (a_class: like current_class) is
			-- Set `current_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			a_feature: ET_FLATTENED_FEATURE
			class_named_features: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE_NAME]
			a_cursor: DS_HASH_TABLE_CURSOR [ET_FEATURE, ET_FEATURE_NAME]
			nb: INTEGER
		do
			current_class := a_class
			named_features.wipe_out
			nb_seeded_features := 0
			has_flatten_error := False
			class_named_features := current_class.named_features
			if class_named_features /= Void then
				nb := class_named_features.count
				if named_features.capacity < nb then
					named_features.resize (nb)
				end
				a_cursor := class_named_features.new_cursor
				from a_cursor.start until a_cursor.after loop
					!! a_feature.make (a_cursor.item, current_class)
					named_features.put_last (a_feature, a_feature.name)
					a_cursor.forth
				end
			end
		ensure
			current_class_set: current_class = a_class
		end

feature -- Element change

	add_inherited_features (a_parent: ET_PARENT) is
			-- Add features inherited from `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			a_parent_flattened: a_parent.is_flattened
			no_flatten_error: not a_parent.has_flatten_error
		local
			a_class: ET_CLASS
			has_rename: BOOLEAN
			has_redefine: BOOLEAN
			has_undefine: BOOLEAN
			has_select: BOOLEAN
			class_named_features: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE_NAME]
			a_cursor: DS_HASH_TABLE_CURSOR [ET_FEATURE, ET_FEATURE_NAME]
			a_feature: ET_INHERITED_FEATURE
			a_flattened_feature: ET_FLATTENED_FEATURE
			a_name: ET_FEATURE_NAME
			a_rename: ET_RENAME
			nb: INTEGER
		do
			if a_parent.renames /= Void then
				has_rename := True
				fill_rename_table (a_parent)
			end
			if a_parent.redefines /= Void then
				has_redefine := True
				fill_redefine_table (a_parent)
			end
			if a_parent.undefines /= Void then
				has_undefine := True
				fill_undefine_table (a_parent)
			end
			if a_parent.selects /= Void then
				has_select := True
				fill_select_table (a_parent)
			end
			a_class := a_parent.type.base_class
			class_named_features := a_class.named_features
			if class_named_features /= Void then
				nb := class_named_features.count + named_features.count
				if named_features.capacity < nb then
					named_features.resize (nb)
				end
				a_cursor := class_named_features.new_cursor
				from a_cursor.start until a_cursor.after loop
					!! a_feature.make (a_cursor.item, a_parent)
					a_name := a_cursor.key
					if has_rename then
						rename_table.search (a_name)
						if rename_table.found then
							a_rename := rename_table.found_item
							rename_table.remove_found_item
							a_feature.set_new_name (a_rename)
							a_name := a_rename.new_name
						end
					end
					if has_undefine then
						undefine_table.search (a_name)
						if undefine_table.found then
							a_feature.set_undefine_name (undefine_table.found_item)
							undefine_table.remove_found_item
						end
					end
					if has_redefine then
						redefine_table.search (a_name)
						if redefine_table.found then
							a_feature.set_redefine_name (redefine_table.found_item)
							redefine_table.remove_found_item
						end
					end
					if has_select then
						select_table.search (a_name)
						if select_table.found then
							a_feature.set_select_name (select_table.found_item)
							select_table.remove_found_item
						end
					end
					named_features.search (a_name)
					if named_features.found then
						a_flattened_feature := named_features.found_item
						a_flattened_feature.put_inherited_feature (a_feature)
					else
						!! a_flattened_feature.make_inherited (a_feature, current_class)
						named_features.put_last (a_flattened_feature, a_name)
					end
					a_cursor.forth
				end
			end
			if not rename_table.is_empty then
				from rename_table.start until rename_table.after loop
					a_rename := rename_table.item_for_iteration
					error_handler.report_vhrc1_error (current_class, a_parent, a_rename)
					rename_table.forth
				end
				rename_table.wipe_out
				set_flatten_error
			end
			if not undefine_table.is_empty then
				from undefine_table.start until undefine_table.after loop
					a_name := undefine_table.item_for_iteration
					error_handler.report_vdus1_error (current_class, a_parent, a_name)
					undefine_table.forth
				end
				undefine_table.wipe_out
				set_flatten_error
			end
			if not redefine_table.is_empty then
				from redefine_table.start until redefine_table.after loop
					a_name := redefine_table.item_for_iteration
					error_handler.report_vdrs1_error (current_class, a_parent, a_name)
					redefine_table.forth
				end
				redefine_table.wipe_out
				set_flatten_error
			end
			if not select_table.is_empty then
				from select_table.start until select_table.after loop
					a_name := select_table.item_for_iteration
					error_handler.report_vmss1_error (current_class, a_parent, a_name)
					select_table.forth
				end
				select_table.wipe_out
				set_flatten_error
			end
		end

feature -- Status

	has_flatten_error: BOOLEAN
			-- Has fatal error occurred during last
			-- feature flattening?

feature -- Compilation

	flatten is
			-- Flatten inherited features into `current_class'.
		local
			class_named_features: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE_NAME]
			class_seeded_features: DS_HASH_TABLE [ET_FEATURE, INTEGER]
			a_named_feature: ET_FLATTENED_FEATURE
			a_feature_seeds: ET_FEATURE_IDS
			a_feature: ET_FEATURE
			a_seed: INTEGER
			i, nb: INTEGER
		do
			process_replication
			if not has_flatten_error then
				!! class_seeded_features.make_map (nb_seeded_features)
				nb := named_features.count
				class_named_features := current_class.named_features
				if class_named_features /= Void then
					class_named_features.wipe_out
					if class_named_features.capacity < nb then
						class_named_features.resize (nb)
					end
				else
					!! class_named_features.make_map (nb)
					class_named_features.set_key_equality_tester (feature_name_tester)
					current_class.set_named_features (class_named_features)
				end
				from named_features.start until named_features.after loop
					a_named_feature := named_features.item_for_iteration
					a_named_feature.process_flattened_feature (Current)
					a_feature := a_named_feature.flattened_feature
					class_named_features.put_last (a_feature, a_feature.name)
					a_feature_seeds := a_feature.seeds
					if a_feature_seeds = Void then
						a_seed := a_feature.first_seed
						class_seeded_features.put_new (a_feature, a_seed)
					else
						nb := a_feature_seeds.count
						from i := 1 until i > nb loop
							a_seed := a_feature_seeds.item (i)
							class_seeded_features.put_new (a_feature, a_seed)
							i := i + 1
						end
					end
					named_features.forth
				end
				current_class.set_seeded_features (class_seeded_features)
				from named_features.start until named_features.after loop
					a_named_feature := named_features.item_for_iteration
					a_named_feature.resolve_identifier_types
					if not a_named_feature.check_signature_validity then
						set_flatten_error
					end
					named_features.forth
				end
			end
			if has_flatten_error then
				current_class.set_flatten_error
			end
			named_features.wipe_out
		ensure
			flattened: current_class.is_flattened
		end

feature {ET_REPLICABLE_FEATURE, ET_FLATTENED_FEATURE} -- Compilation

	set_flatten_error is
			-- Set `has_flatten_error' to True.
		do
			has_flatten_error := True
		ensure
			has_flatten_error: has_flatten_error
		end

feature {NONE} -- Processing

	process_replication is
			-- Take care of selected features and replication.
		local
			a_feature: ET_FLATTENED_FEATURE
			feature_seeds: ET_FEATURE_IDS
			a_replicable_feature: ET_REPLICABLE_FEATURE
			a_seed: INTEGER
			i, nb: INTEGER
			inherited: BOOLEAN
		do
			replicable_features.wipe_out
			from named_features.start until named_features.after loop
				a_feature := named_features.item_for_iteration
				inherited := a_feature.is_inherited
				feature_seeds := a_feature.seeds
				if feature_seeds = Void then
					a_seed := a_feature.first_seed
					if not inherited then
						nb_seeded_features := nb_seeded_features + 1
					elseif replicable_features.has (a_seed) then
						a_replicable_feature := replicable_features.item (a_seed)
						a_replicable_feature.put_feature (a_feature)
					else
						!! a_replicable_feature.make (a_seed, a_feature)
						replicable_features.force_new (a_replicable_feature, a_seed)
					end
				else
					nb := feature_seeds.count
					from i := 1 until i > nb loop
						a_seed := feature_seeds.item (i)
						if not inherited then
							nb_seeded_features := nb_seeded_features + 1
						elseif replicable_features.has (a_seed) then
							a_replicable_feature := replicable_features.item (a_seed)
							a_replicable_feature.put_feature (a_feature)
						else
							!! a_replicable_feature.make (a_seed, a_feature)
							replicable_features.force_new (a_replicable_feature, a_seed)
						end
						i := i + 1
					end
				end
				named_features.forth
			end
			from replicable_features.start until replicable_features.after loop
				a_replicable_feature := replicable_features.item_for_iteration
				a_replicable_feature.process_replication (Current)
				nb_seeded_features := nb_seeded_features + a_replicable_feature.nb_seeded_features
				replicable_features.forth
			end
			replicable_features.wipe_out
		end

feature {NONE} -- Element change

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
			rename_table.wipe_out
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
					error_handler.report_vhrc2_error (current_class, a_parent, rename_table.found_item, a_rename)
					if not rename_table.found_item.new_name.same_feature_name (a_rename.new_name) then
							-- The two Rename_pairs have a different `new_name'.
							-- The flatten process will have to fail.
						set_flatten_error
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
			undefine_table.wipe_out
			a_undefines := a_parent.undefines
			nb := a_undefines.count
			if undefine_table.capacity < nb then
				undefine_table.resize (nb)
			end
			from i := 1 until i > nb loop
				a_name := a_undefines.feature_name (i)
				undefine_table.search (a_name)
				if not undefine_table.found then
					undefine_table.put_new (a_name)
				else
					error_handler.report_vdus4_error (current_class, a_parent, undefine_table.found_item, a_name)
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
			redefine_table.wipe_out
			a_redefines := a_parent.redefines
			nb := a_redefines.count
			if redefine_table.capacity < nb then
				redefine_table.resize (nb)
			end
			from i := 1 until i > nb loop
				a_name := a_redefines.feature_name (i)
				redefine_table.search (a_name)
				if not redefine_table.found then
					redefine_table.put_new (a_name)
				else
					error_handler.report_vdrs3_error (current_class, a_parent, redefine_table.found_item, a_name)
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
			select_table.wipe_out
			a_selects := a_parent.selects
			nb := a_selects.count
			if select_table.capacity < nb then
				select_table.resize (nb)
			end
			from i := 1 until i > nb loop
				a_name := a_selects.feature_name (i)
				select_table.search (a_name)
				if not select_table.found then
					select_table.put_new (a_name)
				else
					error_handler.report_vmss2_error (current_class, a_parent, select_table.found_item, a_name)
				end
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	rename_table: DS_HASH_TABLE [ET_RENAME, ET_FEATURE_NAME]
			-- Rename table

	undefine_table: DS_HASH_SET [ET_FEATURE_NAME]
			-- Undefine table

	redefine_table: DS_HASH_SET [ET_FEATURE_NAME]
			-- Redefine table

	select_table: DS_HASH_SET [ET_FEATURE_NAME]
			-- Select table

	replicable_features: DS_HASH_TABLE [ET_REPLICABLE_FEATURE, INTEGER]
			-- Table of potentially replicable features, indexed by seed

feature {ET_FLATTENED_FEATURE} -- Implementation

	clients_list: DS_ARRAYED_LIST [ET_CLASS_NAME_LIST]
			-- List of client clauses

invariant

	current_class_not_void: current_class /= Void
	named_features_not_void: named_features /= Void
	no_void_named_feature: not named_features.has_item (Void)
	nb_seeded_features_positive: nb_seeded_features >= 0
	rename_table_not_void: rename_table /= Void
	no_void_rename: not rename_table.has_item (Void)
	no_void_rename_old_name: not rename_table.has (Void)
	undefine_table_not_void: undefine_table /= Void
	no_void_undefine: not undefine_table.has (Void)
	redefine_table_not_void: redefine_table /= Void
	no_void_redefine: not redefine_table.has (Void)
	select_table_not_void: select_table /= Void
	no_void_select: not select_table.has (Void)
	clients_list_not_void: clients_list /= Void
	not_void_clients: not clients_list.has (Void)
	replicable_features_not_void: replicable_features /= Void
	no_void_replicable_feature: not replicable_features.has_item (Void)

end
