indexing

	description:

		"Eiffel feature flatteners"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FEATURE_FLATTENER

creation

	make

feature {NONE} -- Initialization

	make (a_class: like current_class) is
			-- Create a new feature flattener for class `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			!! features.make (200)
			!! seeds.make (200)
			set_current_class (a_class)
		ensure
			current_class_set: current_class = a_class
		end

feature -- Access

	current_class: ET_CLASS
			-- Class being flattened

	features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]
			-- Features indexed by name

	seeds: DS_HASH_TABLE [ET_FLATTENED_FEATURE, INTEGER]
			-- Features indexed by seed

feature -- Setting

	set_current_class (a_class: like current_class) is
			-- Set `current_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			a_feature: ET_FLATTENED_FEATURE
			a_cursor: DS_HASH_TABLE_CURSOR [ET_FEATURE, ET_FEATURE_NAME]
			nb: INTEGER
		do
			current_class := a_class
			features.wipe_out
			seeds.wipe_out
			nb := current_class.features.count
			if features.capacity < nb then
				features.resize (nb)
			end
			a_cursor := current_class.features.new_cursor
			from a_cursor.start until a_cursor.after loop
				!! a_feature.make (a_cursor.item, current_class)
				features.put (a_feature, a_feature.name)
				a_cursor.forth
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
			no_flatten_error: not a_parent.flatten_error
		local
			a_class: ET_CLASS
			a_rename_table: like Shared_rename_table
			a_redefine_table: like Shared_redefine_table
			an_undefine_table: like Shared_undefine_table
			a_select_table: like Shared_select_table
			a_cursor: DS_HASH_TABLE_CURSOR [ET_FEATURE, ET_FEATURE_NAME]
			a_feature: ET_INHERITED_FEATURE
			a_flattened_feature: ET_FLATTENED_FEATURE
			a_name: ET_FEATURE_NAME
			a_rename: ET_RENAME
			nb: INTEGER
		do
			a_class := a_parent.type.base_class
			if a_parent.renames /= Void then
				a_rename_table := Shared_rename_table
				fill_rename_table (a_rename_table, a_parent)
			end
			if a_parent.redefines /= Void then
				a_redefine_table := Shared_redefine_table
				fill_redefine_table (a_redefine_table, a_parent)
			end
			if a_parent.undefines /= Void then
				an_undefine_table := Shared_undefine_table
				fill_undefine_table (an_undefine_table, a_parent)
			end
			if a_parent.selects /= Void then
				a_select_table := Shared_select_table
				fill_select_table (a_select_table, a_parent)
			end
			nb := a_class.features.count + features.count
			if features.capacity < nb then
				features.resize (nb)
			end
			a_cursor := a_class.features.new_cursor
			from a_cursor.start until a_cursor.after loop
				!! a_feature.make (a_cursor.item, a_parent)
				a_name := a_cursor.key
				if a_rename_table /= Void and then a_rename_table.has (a_name) then
					a_rename := a_rename_table.item (a_name)
					a_rename_table.remove (a_name)
					a_feature.set_new_name (a_rename)
					a_name := a_rename.new_name
				end
				if an_undefine_table /= Void and then an_undefine_table.has (a_name) then
					a_feature.set_undefine_name (an_undefine_table.key (a_name))
					an_undefine_table.replace (True, a_name)
				end
				if a_redefine_table /= Void and then a_redefine_table.has (a_name) then
					a_feature.set_redefine_name (a_redefine_table.key (a_name))
					a_redefine_table.replace (True, a_name)
				end
				if a_select_table /= Void and then a_select_table.has (a_name) then
					a_feature.set_select_name (a_select_table.key (a_name))
					a_select_table.replace (True, a_name)
				end
				if features.has (a_name) then
					a_flattened_feature := features.item (a_name)
					a_flattened_feature.put_inherited_feature (a_feature)
				else
					!! a_flattened_feature.make_inherited (a_feature, current_class)
					features.put (a_flattened_feature, a_name)
				end
				a_cursor.forth
			end
			if a_rename_table /= Void and then not a_rename_table.is_empty then
					-- Error
				a_rename_table.wipe_out
			end
			if an_undefine_table /= Void then
				from an_undefine_table.start until an_undefine_table.after loop
					if not an_undefine_table.item_for_iteration then
						-- Error
					end
					an_undefine_table.forth
				end
				an_undefine_table.wipe_out
			end
			if a_redefine_table /= Void then
				from a_redefine_table.start until a_redefine_table.after loop
					if not a_redefine_table.item_for_iteration then
						-- Error
					end
					a_redefine_table.forth
				end
				a_redefine_table.wipe_out
			end
			if a_select_table /= Void then
				from a_select_table.start until a_select_table.after loop
					if not a_select_table.item_for_iteration then
						-- Error
					end
					a_select_table.forth
				end
				a_select_table.wipe_out
			end
		end

feature -- Compilation

	flatten is
			-- Flatten inherited features into `current_class'.
		local
			class_features: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE_NAME]
			class_seeds: DS_HASH_TABLE [ET_FEATURE, INTEGER]
			a_feature: ET_FEATURE
			a_seed: INTEGER
			nb: INTEGER
		do
			process_seeded_features
			from features.start until features.after loop
				features.item_for_iteration.process_flattened_feature
				features.forth
			end
			class_features := current_class.features
			class_features.wipe_out
			nb := features.count
			if class_features.capacity < nb then
				class_features.resize (nb)
			end
			from features.start until features.after loop
				a_feature := features.item_for_iteration.flattened_feature
				class_features.put (a_feature, a_feature.name)
				features.forth
			end
			features.wipe_out
			!! class_seeds.make (seeds.count)
			from seeds.start until seeds.after loop
				a_feature := seeds.item_for_iteration.flattened_feature
				a_seed := seeds.key_for_iteration
				class_seeds.put (a_feature, a_seed)
				seeds.forth
			end
			current_class.set_seeds (class_seeds)
			seeds.wipe_out
		ensure
			seeds_set: current_class.seeds /= Void
		end

feature {NONE} -- Processing

	process_seeded_features is
			-- Put features in `seeds', indexed by seeds.
			-- Take care of selected features and replication.
		local
			a_feature: ET_FLATTENED_FEATURE
			feature_seeds: ET_FEATURE_SEEDS
			a_replicable_feature: ET_REPLICABLE_FEATURE
			replicable_features: DS_HASH_TABLE [ET_REPLICABLE_FEATURE, INTEGER]
			a_seed: INTEGER
			i, nb: INTEGER
			nb_seeds: INTEGER
			inherited: BOOLEAN
		do
			nb := features.count
			!! replicable_features.make (2 * nb)
			if seeds.capacity < nb then
				seeds.resize (nb)
			end
			from features.start until features.after loop
				a_feature := features.item_for_iteration
				inherited := a_feature.is_inherited
				feature_seeds := a_feature.seeds
				nb := feature_seeds.count
				from i := 1 until i > nb loop
					a_seed := feature_seeds.item (i)
					if not inherited then
						seeds.put (a_feature, a_seed)
						nb_seeds := nb_seeds + 1
					elseif replicable_features.has (a_seed) then
						a_replicable_feature := replicable_features.item (a_seed)
						a_replicable_feature.put_feature (a_feature)
					else
						!! a_replicable_feature.make (a_seed, a_feature)
						replicable_features.force (a_replicable_feature, a_seed)
						nb_seeds := nb_seeds + 1
					end
					i := i + 1
				end
				features.forth
			end
			if seeds.capacity < nb_seeds then
				seeds.resize (nb_seeds)
			end
			from replicable_features.start until replicable_features.after loop
				replicable_features.item_for_iteration.register_seeded_features (seeds)
				replicable_features.forth
			end
		end

feature {NONE} -- Element change

	fill_rename_table (a_table: like Shared_rename_table; a_parent: ET_PARENT) is
			-- Fill `a_table' with rename pairs of `a_parent'
			-- indexed by their old_name.
		require
			a_table_not_void: a_table /= Void
			a_table_empty: a_table.is_empty
			a_parent_not_void: a_parent /= Void
			renames_not_void: a_parent.renames /= Void
		local
			i, nb: INTEGER
			a_renames: ARRAY [ET_RENAME]
			a_rename: ET_RENAME
			a_name: ET_FEATURE_NAME
		do
			a_renames := a_parent.renames
			nb := a_renames.count
			if a_table.capacity < nb then
				a_table.resize (nb)
			end
			from until i = nb loop
				a_rename := a_renames.item (i)
				a_name := a_rename.old_name
				if not a_table.has (a_name) then
					a_table.put (a_rename, a_name)
				else
					-- Error
				end
				i := i + 1
			end
		ensure
			no_void_rename_pair: not a_table.has_item (Void)
		end

	fill_redefine_table (a_table: like Shared_redefine_table; a_parent: ET_PARENT) is
			-- Fill `a_table' with redefined names of `a_parent'.
		require
			a_table_not_void: a_table /= Void
			a_table_empty: a_table.is_empty
			a_parent_not_void: a_parent /= Void
			redefines_not_void: a_parent.redefines /= Void
		local
			i, nb: INTEGER
			a_redefines: ARRAY [ET_FEATURE_NAME]
			a_name: ET_FEATURE_NAME
		do
			a_redefines := a_parent.redefines
			nb := a_redefines.count
			if a_table.capacity < nb then
				a_table.resize (nb)
			end
			from until i = nb loop
				a_name := a_redefines.item (i)
				if not a_table.has (a_name) then
					a_table.put (False, a_name)
				else
					-- Error
				end
				i := i + 1
			end
		ensure
			no_used_redefine_name: not a_table.has_item (True)
		end

	fill_undefine_table (a_table: like Shared_undefine_table; a_parent: ET_PARENT) is
			-- Fill `a_table' with undefined names of `a_parent'.
		require
			a_table_not_void: a_table /= Void
			a_table_empty: a_table.is_empty
			a_parent_not_void: a_parent /= Void
			undefines_not_void: a_parent.undefines /= Void
		local
			i, nb: INTEGER
			a_undefines: ARRAY [ET_FEATURE_NAME]
			a_name: ET_FEATURE_NAME
		do
			a_undefines := a_parent.undefines
			nb := a_undefines.count
			if a_table.capacity < nb then
				a_table.resize (nb)
			end
			from until i = nb loop
				a_name := a_undefines.item (i)
				if not a_table.has (a_name) then
					a_table.put (False, a_name)
				else
					-- Error
				end
				i := i + 1
			end
		ensure
			no_used_undefine_name: not a_table.has_item (True)
		end

	fill_select_table (a_table: like Shared_select_table; a_parent: ET_PARENT) is
			-- Fill `a_table' with selected names of `a_parent'.
		require
			a_table_not_void: a_table /= Void
			a_table_empty: a_table.is_empty
			a_parent_not_void: a_parent /= Void
			selects_not_void: a_parent.selects /= Void
		local
			i, nb: INTEGER
			a_selects: ARRAY [ET_FEATURE_NAME]
			a_name: ET_FEATURE_NAME
		do
			a_selects := a_parent.selects
			nb := a_selects.count
			if a_table.capacity < nb then
				a_table.resize (nb)
			end
			from until i = nb loop
				a_name := a_selects.item (i)
				if not a_table.has (a_name) then
					a_table.put (False, a_name)
				else
					-- Error
				end
				i := i + 1
			end
		ensure
			no_used_select_name: not a_table.has_item (True)
		end

feature {NONE} -- Implementation

	Shared_rename_table: DS_HASH_TABLE [ET_RENAME, ET_FEATURE_NAME] is
			-- Shared rename table
		once
			!! Result.make (10)
		ensure
			renamed_table_not_void: Result /= Void
		end

	Shared_redefine_table: DS_HASH_TABLE [BOOLEAN, ET_FEATURE_NAME] is
			-- Shared redefine table
		once
			!! Result.make (10)
		ensure
			redefine_table_not_void: Result /= Void
		end

	Shared_undefine_table: DS_HASH_TABLE [BOOLEAN, ET_FEATURE_NAME] is
			-- Shared undefine table
		once
			!! Result.make (10)
		ensure
			undefine_table_not_void: Result /= Void
		end

	Shared_select_table: DS_HASH_TABLE [BOOLEAN, ET_FEATURE_NAME] is
			-- Shared select table
		once
			!! Result.make (10)
		ensure
			select_table_not_void: Result /= Void
		end

invariant

	current_class_not_void: current_class /= Void
	features_not_void: features /= Void
	seeds_not_void: seeds /= Void

end -- class ET_FEATURE_FLATTENER
