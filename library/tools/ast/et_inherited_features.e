indexing

	description:

		"Eiffel inherited features"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INHERITED_FEATURES

inherit

	KL_IMPORTED_FIXED_ARRAY_TYPE [ET_FEATURE]
		rename
			FIXED_ARRAY_TYPE as FIXED_FEATURE_ARRAY_TYPE
		end

creation

	make

feature {NONE} -- Initialization

	make (a_class: like current_class) is
			-- Create a new inherited features.
		require
			a_class_not_void: a_class /= Void
		do
			current_class := a_class
			!! features.make (200)
			!! feature_table.make (200)
		ensure
			current_class_set: current_class = a_class
		end

feature -- Access

	current_class: ET_CLASS
			-- Current class

	features: DS_HASH_TABLE [DS_LINKED_LIST [ET_INHERITED_FEATURE], ET_FEATURE_NAME]
			-- Features indexed by name

	feature_table: DS_HASH_TABLE [ET_REPLICABLE_FEATURE, ET_FEATURE]
			-- Features indexed by seed

feature -- Setting

	set_current_class (a_class: like current_class) is
			-- Set `current_class' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			current_class := a_class
			features.wipe_out
			feature_table.wipe_out
		ensure
			current_class_set: current_class = a_class
		end

feature -- Element change

	add_inherited_features (a_parent: ET_PARENT) is
			-- Add features inherited from `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		local
			a_class: ET_CLASS
			a_rename_table: like Shared_rename_table
			a_redefine_table: like Shared_redefine_table
			an_undefine_table: like Shared_undefine_table
			a_select_table: like Shared_select_table
			a_cursor: DS_HASH_TABLE_CURSOR [ET_FEATURE, ET_FEATURE_NAME]
			a_list: DS_LINKED_LIST [ET_INHERITED_FEATURE]
			a_feature: ET_INHERITED_FEATURE
			a_name: ET_FEATURE_NAME
			a_rename: ET_RENAME
			nb: INTEGER
		do
			a_class := a_parent.type.base_class
			if a_class.feature_table = Void then
				a_class.flatten
			end
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
				if features.has (a_name) then
					a_list := features.item (a_name)
				else
					!! a_list.make
					features.put (a_list, a_name)
				end
				a_list.put_last (a_feature)
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
			replicable_feature: ET_REPLICABLE_FEATURE
			class_features: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE_NAME]
			class_feature_table: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE]
			a_cursor: DS_HASH_TABLE_CURSOR [ET_FEATURE, ET_FEATURE_NAME]
			a_feature: ET_FEATURE
			a_name: ET_FEATURE_NAME
			nb: INTEGER
		do
			class_features := current_class.features
			!! class_feature_table.make (class_features.count * 2)
			a_cursor := class_features.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_name := a_cursor.key
				a_feature := a_cursor.item
				if features.has (a_name) then
					process_redeclared_feature (a_feature, features.item (a_name))
					features.remove (a_name)
				else
					class_feature_table.put (a_feature, a_feature)
				end
				a_cursor.forth
			end
			nb := class_features.count + features.count
			if class_features.capacity < nb then
				class_features.resize (nb)
			end
			from features.start until features.after loop
				process_inherited_feature (features.item_for_iteration)
				features.forth
			end
			features.wipe_out
			nb := class_feature_table.count
			from feature_table.start until feature_table.after loop
				replicable_feature := feature_table.item_for_iteration
				replicable_feature.set_seeds (current_class)
				nb := nb + replicable_feature.inherited_features.count
				feature_table.forth
			end
			if class_feature_table.capacity < nb then
				class_feature_table.resize (nb)
			end
			from feature_table.start until feature_table.after loop
				feature_table.item_for_iteration.register_seeded_features (class_feature_table)
				feature_table.forth
			end
			current_class.set_feature_table (class_feature_table)
			feature_table.wipe_out
		ensure
			feature_table_set: current_class.feature_table /= Void
		end

feature {NONE} -- Processing

	process_redeclared_feature (a_feature: ET_FEATURE; inherited: DS_LINKED_LIST [ET_INHERITED_FEATURE]) is
			-- Process an inherited feature which has been
			-- given a new declaration in `current_class'.
		require
			a_feature_not_void: a_feature /= Void
			inherited_not_void: inherited /= Void
			inherited_not_empty: not inherited.is_empty
			no_void_inherited_feature: not inherited.has (Void)
		local
			inherited_feature, effective: ET_INHERITED_FEATURE
			is_deferred: BOOLEAN
			new_seeds: DS_ARRAYED_LIST [ET_FEATURE]
			seeds, max_seeds: like FIXED_FEATURE_ARRAY_TYPE
			a_seed: ET_FEATURE
			i, nb: INTEGER
		do
			!! new_seeds.make (2)
			is_deferred := a_feature.is_deferred
			from inherited.start until inherited.after loop
				inherited_feature := inherited.item_for_iteration
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
				if not a_feature.signature_conforms_to (inherited_feature.precursor_feature) then
					-- Error
				end
				seeds := inherited_feature.precursor_feature.seeds
				i := seeds.count
				if i > nb then
					max_seeds := seeds
					nb := i
				end
				from i := i - 1 until i < 0 loop
					a_seed := seeds.item (i)
					if not new_seeds.has (a_seed) then
						new_seeds.force_last (a_seed)
					end
					i := i - 1
				end
				inherited.forth
			end
			if new_seeds.count = nb then
				seeds := max_seeds
			else
				nb := new_seeds.count
				seeds := FIXED_FEATURE_ARRAY_.make (nb)
				from i := 1 until i > nb loop
					seeds.put (new_seeds.item (i), i - 1)
					i := i + 1
				end
			end
			a_feature.set_seeds (seeds)
			put_seeded_feature (a_feature, inherited)
		end

	process_inherited_feature (inherited: DS_LINKED_LIST [ET_INHERITED_FEATURE]) is
			-- Process an inherited feature which has not been
			-- given a new declaration in `current_class'.
		require
			inherited_not_void: inherited /= Void
			inherited_not_empty: not inherited.is_empty
			no_void_inherited_feature: not inherited.has (Void)
		local
			inherited_feature, a_feature: ET_INHERITED_FEATURE
			adapted_feature: ET_FEATURE
			same_version: BOOLEAN
			is_deferred: BOOLEAN
			new_seeds: DS_ARRAYED_LIST [ET_FEATURE]
			seeds, max_seeds: like FIXED_FEATURE_ARRAY_TYPE
			a_seed: ET_FEATURE
			i, nb: INTEGER
		do
			same_version := True
			from inherited.start until inherited.after loop
				inherited_feature := inherited.item_for_iteration
				inherited_feature.check_undefine_clause (current_class)
				inherited_feature.check_redefine_clause (current_class)
				if inherited_feature.is_redefined then
					-- Error
				end
				if a_feature = Void then
					a_feature := inherited_feature
				elseif a_feature.same_version (inherited_feature) then
					-- Sharing.
				elseif inherited_feature.is_deferred then
					same_version := False
					if a_feature.is_deferred and not a_feature.signature_conforms_to (inherited_feature) then
						a_feature := inherited_feature
					end
				elseif a_feature.is_deferred then
					same_version := False
					a_feature := inherited_feature
				else
					same_version := False
						-- Error.
				end
				inherited.forth
			end
			adapted_feature := a_feature.adapted_feature (current_class)
			if not same_version then
				if adapted_feature.base_class /= current_class then
					adapted_feature := adapted_feature.renamed_feature (adapted_feature.name, current_class)
				end
				adapted_feature.set_version (adapted_feature)
				!! new_seeds.make (2)
				is_deferred := a_feature.is_deferred
				from inherited.start until inherited.after loop
					inherited_feature := inherited.item_for_iteration
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
					seeds := inherited_feature.precursor_feature.seeds
					i := seeds.count
					if i > nb then
						max_seeds := seeds
						nb := i
					end
					from i := i - 1 until i < 0 loop
						a_seed := seeds.item (i)
						if not new_seeds.has (a_seed) then
							new_seeds.force_last (a_seed)
						end
						i := i - 1
					end
					inherited.forth
				end
				if new_seeds.count = nb then
					seeds := max_seeds
				else
					nb := new_seeds.count
					seeds := FIXED_FEATURE_ARRAY_.make (nb)
					from i := 1 until i > nb loop
						seeds.put (new_seeds.item (i), i - 1)
						i := i + 1
					end
				end
				adapted_feature.set_seeds (seeds)
			end
			current_class.features.force (adapted_feature, adapted_feature.name)
			put_seeded_feature (adapted_feature, inherited)
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

	put_seeded_feature (a_feature: ET_FEATURE; inherited: DS_LINKED_LIST [ET_INHERITED_FEATURE]) is
			-- Add `a_feature' to `feature_table'.
		require
			a_feature_not_void: a_feature /= Void
			inherited_not_void: inherited /= Void
			inherited_not_empty: not inherited.is_empty
			no_void_inherited_feature: not inherited.has (Void)
		local
			seeds: like FIXED_FEATURE_ARRAY_TYPE
			a_seed: ET_FEATURE
			inherited_feature: ET_INHERITED_FEATURE
			selected_feature: ET_INHERITED_FEATURE
			seeded_feature: ET_INHERITED_FEATURE
			replicable_feature: ET_REPLICABLE_FEATURE
			i: INTEGER
		do
			from inherited.start until inherited.after loop
				inherited_feature := inherited.item_for_iteration
				if inherited_feature.is_selected then
					if selected_feature = Void then
						selected_feature := inherited_feature
					else
							-- Error: two selected features.
					end
				else
					seeded_feature := inherited_feature
				end
				inherited.forth
			end
			if selected_feature /= Void then
				seeded_feature := selected_feature
			end
			seeded_feature.set_precursor_feature (a_feature)
			seeds := a_feature.seeds
			from i := seeds.count - 1 until i < 0 loop
				a_seed := seeds.item (i)
				if feature_table.has (a_seed) then
					replicable_feature := feature_table.item (a_seed)
					replicable_feature.put_feature (seeded_feature)
				else
					!! replicable_feature.make (a_seed, seeded_feature)
					feature_table.force (replicable_feature, a_seed)
				end
				i := i - 1
			end
		end

	old_put_seeded_feature (a_feature: ET_FEATURE; inherited: DS_LINKED_LIST [ET_INHERITED_FEATURE]) is
			-- Add `a_feature' to `feature_table'.
		require
			a_feature_not_void: a_feature /= Void
			inherited_not_void: inherited /= Void
			inherited_not_empty: not inherited.is_empty
			no_void_inherited_feature: not inherited.has (Void)
		local
			seeds: like FIXED_FEATURE_ARRAY_TYPE
			a_seed: ET_FEATURE
			inherited_feature: ET_INHERITED_FEATURE
			selected_feature: ET_INHERITED_FEATURE
			seeded_feature: ET_INHERITED_FEATURE
			replicable_feature: ET_REPLICABLE_FEATURE
			seeded_features: DS_ARRAYED_LIST [ET_INHERITED_FEATURE]
			i, nb: INTEGER
		do
			seeds := a_feature.seeds
			nb := seeds.count
			!! seeded_features.make (nb)
			from i := nb - 1 until i < 0 loop
				a_seed := seeds.item (i)
				seeded_feature := Void
				selected_feature := Void
				from inherited.start until inherited.after loop
					inherited_feature := inherited.item_for_iteration
					if inherited_feature.has_seed (a_seed) then
						if inherited_feature.is_selected then
							if selected_feature = Void then
								selected_feature := inherited_feature
							else
									-- Error: two selected features.
							end
						else
							seeded_feature := inherited_feature
						end
					end
					inherited.forth
				end
				if selected_feature /= Void then
					seeded_feature := selected_feature
				end
				if feature_table.has (a_seed) then
					replicable_feature := feature_table.item (a_seed)
					replicable_feature.put_feature (seeded_feature)
				else
					!! replicable_feature.make (a_seed, seeded_feature)
					feature_table.force (replicable_feature, a_seed)
				end
				seeded_features.put_last (seeded_feature)
				i := i - 1
			end
			from i := 1 until i > nb loop
				seeded_features.item (i).set_precursor_feature (a_feature)
				i := i + 1
			end
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

	FIXED_FEATURE_ARRAY_: KL_FIXED_ARRAY_ROUTINES [ET_FEATURE] is
			-- Routines that ought to be in FIXED_ARRAY
		once
			!! Result
		ensure
			fixed_feature_array_not_void: Result /= Void
		end

invariant

	current_class_not_void: current_class /= Void
	features_not_void: features /= Void
	feature_table_not_void: feature_table /= Void

end -- class ET_INHERITED_FEATURES
