indexing

	description:

		"Eiffel class feature flatteners"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_FLATTENER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make,
			process_class
		end

	ET_SHARED_FEATURE_NAME_TESTER

	ET_SHARED_CLASS_NAME_TESTER

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new feature flattener for classes in `a_universe'.
		do
			precursor (a_universe)
			create named_features.make_map (400)
			named_features.set_key_equality_tester (feature_name_tester)
			create rename_table.make (10)
			rename_table.set_key_equality_tester (feature_name_tester)
			create undefine_table.make (10)
			undefine_table.set_equality_tester (feature_name_tester)
			create redefine_table.make (10)
			redefine_table.set_equality_tester (feature_name_tester)
			create select_table.make (10)
			select_table.set_equality_tester (feature_name_tester)
			create replicable_features.make_map (400)
			create clients_list.make (20)
			create client_names.make (20)
			client_names.set_equality_tester (class_name_tester)
			create identifier_type_resolver.make (a_universe)
			create anchored_type_checker.make (a_universe)
			create parent_checker.make (a_universe)
			create formal_parameter_checker.make (a_universe)
			create precursor_checker.make (a_universe)
			create parent_context.make_with_capacity (a_universe.any_class, 1)
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		do
			a_class.set_features_flattened
			a_class.set_flattening_error
		ensure then
			features_flattened: a_class.features_flattened
			has_flattening_error: a_class.has_flattening_error
		end

feature -- Processing

	process_class (a_class: ET_CLASS) is
			-- Build ancestors of `a_class' if not already done.
			-- Then run second pass of the formal generic parameters
			-- validity check of `a_class', and the second pass of
			-- the parent validity check. And finally, flatten the
			-- feature table of `a_class'.
		local
			a_processor: like Current
		do
			if a_class = none_class then
				a_class.set_features_flattened
			elseif current_class /= unknown_class then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaab_error
				create a_processor.make (universe)
				a_processor.process_class (a_class)
			elseif a_class /= unknown_class then
				internal_process_class (a_class)
			else
				set_fatal_error (a_class)
			end
		ensure then
			features_flattened: a_class.features_flattened
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS) is
			-- Build ancestors of `a_class' if not already done.
			-- Then run second pass of the formal generic parameters
			-- validity check of `a_class', and the second pass of
			-- the parent validity check. And finally, flatten the
			-- feature table of `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			old_class: ET_CLASS
			a_parents: ET_PARENT_LIST
			a_parent_class: ET_CLASS
			i, nb: INTEGER
		do
			old_class := current_class
			current_class := a_class
			if not current_class.features_flattened then
					-- Build ancestors of `current_class' if not already done.
				current_class.process (universe.ancestor_builder)
				if not current_class.has_ancestors_error then
					current_class.set_features_flattened
						-- Process parents first.
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
								-- This is a controlled recursive call to `internal_process_class'.
							a_parent_class := a_parents.parent (i).type.direct_base_class (universe)
							internal_process_class (a_parent_class)
							if a_parent_class.has_flattening_error then
								set_fatal_error (current_class)
							end
							i := i + 1
						end
					end
					if not current_class.has_flattening_error then
						error_handler.report_compilation_status (Current, current_class)
							-- Check validity rules of the parents and of formal
							-- generic parameters of `current_class'.
						check_formal_parameters_validity
						check_parents_validity
					end
					if not current_class.has_flattening_error then
						add_current_features
						if a_parents /= Void then
							from i := 1 until i > nb loop
								add_inherited_features (a_parents.parent (i))
								i := i + 1
							end
						end
						flatten_features
							-- Clean up.
						free_parent_feature := parent_feature_list
						free_inherited_feature := inherited_feature_list
						free_redeclared_feature := redeclared_feature_list
					end
				else
					set_fatal_error (current_class)
				end
			end
			current_class := old_class
		ensure
			features_flattened: a_class.features_flattened
		end

feature {NONE} -- Feature recording

	named_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]
			-- Features indexed by name

	declared_feature_count: INTEGER
			-- Number of features which appear in one
			-- of the feature clauses of `current_class'

	add_current_features is
			-- Add to `named_features' features declared in `current_class'.
		local
			a_feature: ET_FEATURE
			other_feature: ET_FLATTENED_FEATURE
			a_name: ET_FEATURE_NAME
			class_features: ET_FEATURE_LIST
			i, nb: INTEGER
		do
			class_features := current_class.features
			nb := current_class.declared_feature_count
			if named_features.capacity < nb then
				named_features.resize (nb)
			end
			from i := 1 until i > nb loop
				a_feature := class_features.item (i)
				a_name := a_feature.name
				named_features.search (a_name)
				if named_features.found then
					other_feature := named_features.found_item
					set_fatal_error (current_class)
					error_handler.report_vmfn0a_error (current_class, other_feature.flattened_feature, a_feature)
				else
					named_features.put_last (a_feature, a_name)
				end
				i := i + 1
			end
			declared_feature_count := named_features.count
		end

	add_inherited_features (a_parent: ET_PARENT) is
			-- Add to `named_features' features inherited from `a_parent'.
			-- Also process the Feature_adaptation clause of `a_parent'.
			-- `a_parent' is one of the parents, explicit or implicit
			-- (i.e. ANY), of `current_class'.
		require
			a_parent_not_void: a_parent /= Void
		local
			a_class: ET_CLASS
			has_rename: BOOLEAN
			has_redefine: BOOLEAN
			has_undefine: BOOLEAN
			has_select: BOOLEAN
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
			a_class := a_parent.type.direct_base_class (universe)
			class_features := a_class.features
			nb := class_features.count + named_features.count
			if named_features.capacity < nb then
				named_features.resize (nb)
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
						a_parent_feature.set_new_name (a_rename)
						a_name := a_rename.new_name
					end
				end
				if has_undefine then
					undefine_table.search (a_name)
					if undefine_table.found then
						a_parent_feature.set_undefine_name (undefine_table.found_item)
						undefine_table.remove_found_item
					end
				end
				if has_redefine then
					redefine_table.search (a_name)
					if redefine_table.found then
						a_parent_feature.set_redefine_name (redefine_table.found_item)
						redefine_table.remove_found_item
					end
				end
				if has_select then
					select_table.search (a_name)
					if select_table.found then
						a_parent_feature.set_select_name (select_table.found_item)
						select_table.remove_found_item
					end
				end
				named_features.search (a_name)
				if named_features.found then
					a_named_feature := named_features.found_item
					if a_named_feature.is_immediate then
						a_redeclared_feature := new_redeclared_feature (a_named_feature.immediate_feature, a_parent_feature)
						named_features.replace_found_item (a_redeclared_feature)
					elseif a_named_feature.is_redeclared then
						a_redeclared_feature := a_named_feature.redeclared_feature
						a_redeclared_feature.put_parent_feature (a_parent_feature)
					elseif a_named_feature.is_inherited then
						an_inherited_feature := a_named_feature.inherited_feature
						an_inherited_feature.put_parent_feature (a_parent_feature)
					end
				else
					an_inherited_feature := new_inherited_feature (a_parent_feature)
					named_features.put_last (an_inherited_feature, a_name)
				end
				i := i + 1
			end
			if not rename_table.is_empty then
				from rename_table.start until rename_table.after loop
					a_rename := rename_table.item_for_iteration
					set_fatal_error (current_class)
					error_handler.report_vhrc1a_error (current_class, a_parent, a_rename)
					rename_table.forth
				end
				rename_table.wipe_out
			end
			if not undefine_table.is_empty then
				from undefine_table.start until undefine_table.after loop
					a_name := undefine_table.item_for_iteration
					set_fatal_error (current_class)
					error_handler.report_vdus1a_error (current_class, a_parent, a_name)
					undefine_table.forth
				end
				undefine_table.wipe_out
			end
			if not redefine_table.is_empty then
				from redefine_table.start until redefine_table.after loop
					a_name := redefine_table.item_for_iteration
					set_fatal_error (current_class)
					error_handler.report_vdrs1a_error (current_class, a_parent, a_name)
					redefine_table.forth
				end
				redefine_table.wipe_out
			end
			if not select_table.is_empty then
				from select_table.start until select_table.after loop
					a_name := select_table.item_for_iteration
					set_fatal_error (current_class)
					error_handler.report_vmss1a_error (current_class, a_parent, a_name)
					select_table.forth
				end
				select_table.wipe_out
			end
		end

feature {NONE} -- Feature adaptation

	rename_table: DS_HASH_TABLE [ET_RENAME, ET_FEATURE_NAME]
			-- Rename table

	undefine_table: DS_HASH_SET [ET_FEATURE_NAME]
			-- Undefine table

	redefine_table: DS_HASH_SET [ET_FEATURE_NAME]
			-- Redefine table

	select_table: DS_HASH_SET [ET_FEATURE_NAME]
			-- Select table

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
					if not rename_table.found_item.new_name.same_feature_name (a_rename.new_name) then
							-- The two Rename_pairs have a different `new_name'.
							-- The flatten process will have to fail.
						set_fatal_error (current_class)
					end
					error_handler.report_vhrc2a_error (current_class, a_parent, rename_table.found_item, a_rename)
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
					undefine_table.put_new (a_name)
				else
						-- Feature name `a_name' appears twice in the
						-- Undefine clause. This is not considered as
						-- a fatal error by gelint.
					error_handler.report_vdus4a_error (current_class, a_parent, undefine_table.found_item, a_name)
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
					redefine_table.put_new (a_name)
				else
						-- Feature name `a_name' appears twice in the
						-- Redefine clause. This is not considered as
						-- a fatal error by gelint.
					error_handler.report_vdrs3a_error (current_class, a_parent, redefine_table.found_item, a_name)
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
					select_table.put_new (a_name)
				else
						-- Feature name `a_name' appears twice in the
						-- Select clause. This is not considered as
						-- a fatal error by gelint.
					error_handler.report_vmss2a_error (current_class, a_parent, select_table.found_item, a_name)
				end
				i := i + 1
			end
		end

feature {NONE} -- Feature flattening

	flatten_features is
			-- Flatten inherited features into `current_class'.
		local
			class_features: ET_FEATURE_LIST
			a_named_feature: ET_FLATTENED_FEATURE
			a_feature: ET_FEATURE
			a_deferred_feature: ET_FLATTENED_FEATURE
			i, nb: INTEGER
		do
			process_replication
			if not current_class.has_flattening_error then
				nb := named_features.count
				create class_features.make_with_capacity (nb)
				from named_features.finish until named_features.before loop
					a_named_feature := named_features.item_for_iteration
					flatten_feature (a_named_feature)
					class_features.put_first (a_named_feature.flattened_feature)
					named_features.back
				end
				current_class.set_features (class_features, declared_feature_count)
				nb := declared_feature_count
				from i := 1 until i > nb loop
					a_feature := class_features.item (i)
						-- Resolve identifier types and check argument
						-- names in signature of features written in
						-- `current_class'. Those features inherited
						-- without being redeclared in `current_class'
						-- have already had their signature resolved
						-- when processing the parents of `current_class'.
					resolve_identifier_signature (a_feature)
					i := i + 1
				end
				check_anchored_signatures
				from named_features.start until named_features.after loop
					a_named_feature := named_features.item_for_iteration
					if a_deferred_feature = Void then
						if a_named_feature.flattened_feature.is_deferred then
							a_deferred_feature := a_named_feature
						end
					end
					has_qualified_type := False
					check_signature_validity (a_named_feature)
					if has_qualified_type and not current_class.has_flattening_error then
							-- There is a qualified anchored type in (or reachable
							-- from) the signature of `a_feature'. We will have to
							-- check the signature of this feature again after the
							-- features of the corresponding classes have been
							-- flattened.
					end
					named_features.forth
				end
				if a_deferred_feature /= Void then
					current_class.set_has_deferred_features (True)
					if not current_class.has_deferred_mark then
							-- `current_class' has deferred features
							-- but is not marked as deferred. This is
							-- not considered as a fatal error here.
							-- We just consider the class as deferred
							-- from now on.
						if a_deferred_feature.is_inherited then
							error_handler.report_vcch1b_error (current_class, a_deferred_feature.inherited_feature)
						else
							error_handler.report_vcch1a_error (current_class, a_deferred_feature.flattened_feature)
						end
					end
				else
					current_class.set_has_deferred_features (False)
					if current_class.has_deferred_mark then
							-- `current_class' is marked as deferred but
							-- has no deferred feature. This is not
							-- considered as a fatal error here. We just
							-- consider the class as deferred from now on.
						error_handler.report_vcch2a_error (current_class)
					end
				end
				check_creators_validity
				check_convert_validity
			end
			declared_feature_count := 0
			named_features.wipe_out
		ensure
			named_features_wiped_out: named_features.is_empty
		end

feature {NONE} -- Feature processing

	flatten_feature (a_feature: ET_FLATTENED_FEATURE) is
			-- Flatten `a_feature' and process its feature adaptation clause.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_adapted_feature: ET_ADAPTED_FEATURE
		do
			if a_feature.is_immediate then
				flatten_immediate_feature (a_feature.immediate_feature)
			else
				an_adapted_feature := a_feature.adapted_feature
				if an_adapted_feature.has_selected_feature and not an_adapted_feature.is_selected then
						-- This is not a fatal error for gelint.
					error_handler.report_vmss3a_error (current_class, an_adapted_feature.selected_feature)
				end
				if a_feature.is_redeclared then
					flatten_redeclared_feature (a_feature.redeclared_feature)
				elseif a_feature.is_inherited then
					flatten_inherited_feature (a_feature.inherited_feature)
				end
			end
		end

	flatten_immediate_feature (a_feature: ET_FEATURE) is
			-- Flatten `a_feature' and process its feature adaptation clause.
			-- `a_feature' has been introduced in `current_class' (ETL2, p. 56).
		require
			a_feature_not_void: a_feature /= Void
		do
			-- Do nothing.
		end

	flatten_redeclared_feature (a_feature: ET_REDECLARED_FEATURE) is
			-- Flatten `a_feature' and process its feature adaptation clause.
			-- `a_feature' is an inherited feature which has been given a new
			-- declaration in `current_class'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_flattened_feature: ET_FEATURE
			l_parent_feature: ET_PARENT_FEATURE
			l_has_redefine: BOOLEAN
			l_preconditions: ET_PRECONDITIONS
			l_postconditions: ET_POSTCONDITIONS
			nb_precursors: INTEGER
			l_precursor: ET_FEATURE
			l_first_precursor: ET_FEATURE
			l_other_precursors: ET_FEATURE_LIST
			l_found: BOOLEAN
			i, nb: INTEGER
		do
			l_flattened_feature := a_feature.flattened_feature
			if a_feature.is_replicated then
				process_replicated_seeds (a_feature, l_flattened_feature.id)
			end
			l_flattened_feature.set_first_seed (a_feature.first_seed)
			l_flattened_feature.set_other_seeds (a_feature.other_seeds)
				-- Check Feature_adaptation clause.
			from
				l_parent_feature := a_feature.parent_feature
				l_precursor := l_parent_feature.precursor_feature
			until
				l_parent_feature = Void
			loop
				if not l_parent_feature.precursor_feature.same_version (l_precursor) then
					nb_precursors := nb_precursors + 1
				end
				if l_parent_feature.has_redefine then
					if l_has_redefine then
						-- Warning: feature redefined twice.
						-- Could not find which validity rule was violated
						-- and none of the Eiffel compilers complains...
					end
					l_has_redefine := True
				end
				l_parent_feature := l_parent_feature.merged_feature
			end
			from
				l_parent_feature := a_feature.parent_feature
			until
				l_parent_feature = Void
			loop
				check_redeclaration_validity (l_parent_feature, l_flattened_feature, l_has_redefine)
				l_precursor := l_parent_feature.precursor_feature
				if l_first_precursor = Void then
					l_first_precursor := l_precursor
				elseif not l_precursor.same_version (l_first_precursor) then
					from i := 1 until i > nb loop
						if l_precursor.same_version (l_other_precursors.item (i)) then
							l_found := True
							i := nb + 1
						else
							i := i + 1
						end
					end
					if not l_found then
						if l_other_precursors = Void then
							create l_other_precursors.make_with_capacity (nb_precursors)
						end
						l_other_precursors.put_first (l_precursor)
						nb := nb + 1
					end
				end
				l_parent_feature := l_parent_feature.merged_feature
			end
			l_flattened_feature.set_first_precursor (l_first_precursor)
			l_flattened_feature.set_other_precursors (l_other_precursors)
			l_preconditions := l_flattened_feature.preconditions
			if l_preconditions /= Void and then not l_preconditions.is_require_else then
					-- This is not a fatal error.
				error_handler.report_vdrd3a_error (current_class, l_preconditions, l_flattened_feature)
			end
			l_postconditions := l_flattened_feature.postconditions
			if l_postconditions /= Void and then not l_postconditions.is_ensure_then then
					-- This is not a fatal error.
				error_handler.report_vdrd3b_error (current_class, l_postconditions, l_flattened_feature)
			end
			check_precursor_validity (a_feature)
		end

	flatten_inherited_feature (a_feature: ET_INHERITED_FEATURE) is
			-- Flatten `a_feature' and process its feature adaptation clause.
			-- `a_feature' is an inherited feature which has not been given
			-- a new declaration in `current_class'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_flattened_feature: ET_FEATURE
			l_parent_feature: ET_PARENT_FEATURE
			l_effective, l_deferred: ET_PARENT_FEATURE
			l_first_seed: INTEGER
			l_other_seeds: ET_FEATURE_IDS
			l_keep_same_version: BOOLEAN
			l_duplication_needed: BOOLEAN
			l_feature_found: BOOLEAN
			l_duplicated: BOOLEAN
			l_name: ET_FEATURE_NAME
			l_parent: ET_PARENT
			l_clients: ET_CLASS_NAME_LIST
			nb_precursors: INTEGER
			l_precursor: ET_FEATURE
			l_first_precursor: ET_FEATURE
			l_other_precursors: ET_FEATURE_LIST
			l_found: BOOLEAN
			i, nb: INTEGER
		do
			l_clients := inherited_clients (a_feature)
			l_first_seed := a_feature.first_seed
			l_other_seeds := a_feature.other_seeds
			l_duplication_needed := a_feature.is_replicated
			l_keep_same_version := not a_feature.is_replicated
				-- Check Feature_adaptation clause.
			from
				l_parent_feature := a_feature.parent_feature
				l_precursor := l_parent_feature.precursor_feature
			until
				l_parent_feature = Void
			loop
				check_no_redeclaration_validity (l_parent_feature)
				if not l_parent_feature.precursor_feature.same_version (l_precursor) then
						-- Not sharing.
					l_keep_same_version := False
					l_duplication_needed := True
					nb_precursors := nb_precursors + 1
				end
				if not l_parent_feature.is_deferred then
					if l_effective /= Void and then not l_parent_feature.same_version (l_effective) then
							-- Error: two effective features which are not shared.
						set_fatal_error (current_class)
						error_handler.report_vmfn0c_error (current_class, l_effective, l_parent_feature)
					end
					if not l_feature_found then
						l_effective := l_parent_feature
						if not l_duplication_needed then
								-- Trying to choose one which would avoid duplication.
							if
								not l_effective.has_rename and then
								l_effective.first_seed = l_first_seed and then
								l_effective.other_seeds = l_other_seeds and then
								l_effective.parent.actual_parameters = Void and then
								l_effective.clients.same_class_names (l_clients)
							then
								l_feature_found := True
							end
						end
					end
				end
				l_parent_feature := l_parent_feature.merged_feature
			end
			from
				l_parent_feature := a_feature.parent_feature
			until
				l_parent_feature = Void
			loop
				if l_effective = Void then
					if not l_feature_found then
						l_deferred := l_parent_feature
						if not l_duplication_needed then
								-- Trying to choose one which would avoid duplication.
							if
								not l_deferred.has_rename and then
								not l_deferred.has_undefine and then
								l_deferred.first_seed = l_first_seed and then
								l_deferred.other_seeds = l_other_seeds and then
								l_deferred.parent.actual_parameters = Void and then
								l_deferred.clients.same_class_names (l_clients)
							then
								l_feature_found := True
							end
						end
					end
				end
				l_precursor := l_parent_feature.precursor_feature
				if l_first_precursor = Void then
					l_first_precursor := l_precursor
				elseif not l_precursor.same_version (l_first_precursor) then
					from i := 1 until i > nb loop
						if l_precursor.same_version (l_other_precursors.item (i)) then
							l_found := True
							i := nb + 1
						else
							i := i + 1
						end
					end
					if not l_found then
						if l_other_precursors = Void then
							create l_other_precursors.make_with_capacity (nb_precursors)
						end
						l_other_precursors.put_first (l_precursor)
						nb := nb + 1
					end
				end
				l_parent_feature := l_parent_feature.merged_feature
			end
			if l_effective /= Void then
				l_parent_feature := l_effective
			else
				l_parent_feature := l_deferred
			end
			l_flattened_feature := l_parent_feature.precursor_feature
			l_name := l_parent_feature.name
			l_parent := l_parent_feature.parent
			if l_parent_feature.has_undefine then
				l_flattened_feature := l_flattened_feature.undefined_feature (l_name)
				l_flattened_feature.reset_preconditions
				l_flattened_feature.reset_postconditions
				l_flattened_feature.set_implementation_feature (l_flattened_feature)
				l_flattened_feature.set_implementation_class (current_class)
				l_flattened_feature.set_first_precursor (l_first_precursor)
				l_flattened_feature.set_other_precursors (l_other_precursors)
				l_duplicated := True
			elseif l_duplication_needed or not l_feature_found then
				l_flattened_feature := l_flattened_feature.renamed_feature (l_name)
				if l_other_precursors /= Void then
						-- Merge or Join.
						-- Otherwise it would have been a simple inheritance or sharing
						-- and `l_flattened_feature' would have been duplicated just
						-- because of renaming, or export status change, or signature
						-- resolving.
					l_flattened_feature.reset_preconditions
					l_flattened_feature.reset_postconditions
					l_flattened_feature.set_first_precursor (l_first_precursor)
					l_flattened_feature.set_other_precursors (l_other_precursors)
				end
				l_duplicated := True
			end
			if l_duplicated then
				universe.register_feature (l_flattened_feature)
				if a_feature.is_replicated then
					process_replicated_seeds (a_feature, l_flattened_feature.id)
				elseif l_keep_same_version then
					l_flattened_feature.set_version (l_parent_feature.precursor_feature.version)
				end
				l_flattened_feature.resolve_inherited_signature (l_parent)
				l_flattened_feature.set_clients (l_clients)
				l_flattened_feature.set_first_seed (a_feature.first_seed)
				l_flattened_feature.set_other_seeds (a_feature.other_seeds)
			end
			a_feature.set_flattened_feature (l_flattened_feature)
			a_feature.set_flattened_parent (l_parent_feature)
		end

feature {NONE} -- Replication

	replicable_features: DS_HASH_TABLE [ET_REPLICABLE_FEATURE, INTEGER]
			-- Table of potentially replicable features, indexed by seed

	process_replication is
			-- Take care of selected features and replication.
		local
			l_feature: ET_FLATTENED_FEATURE
			l_adapted_feature: ET_ADAPTED_FEATURE
			l_replicable_feature: ET_REPLICABLE_FEATURE
			l_other_seeds: ET_FEATURE_IDS
			l_seed: INTEGER
			i, nb: INTEGER
		do
			from named_features.start until named_features.after loop
				l_feature := named_features.item_for_iteration
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
				named_features.forth
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
				set_fatal_error (current_class)
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
				set_fatal_error (current_class)
				error_handler.report_vmrc2b_error (current_class, a_parent_features)
			end
		end

	process_replicated_seeds (a_feature: ET_ADAPTED_FEATURE; a_new_seed: INTEGER) is
			-- Process the seeds of replicated feature `a_feature'.
			-- Remove seeds in `a_feature.replicated_seeds' and
			-- add `a_new_seed'.
		require
			a_feature_not_void: a_feature /= Void
			replicated_feature: a_feature.is_replicated
			a_new_seed_positive: a_new_seed > 0
		local
			i, nb: INTEGER
			l_need_twin: BOOLEAN
			l_seed: INTEGER
			l_first_seed: INTEGER
			l_other_seeds: ET_FEATURE_IDS
			l_replicated_seeds: ET_FEATURE_IDS
			l_seeds_done: BOOLEAN
		do
				-- Remove replicated seeds and add the new seed.
			l_first_seed := a_feature.first_seed
			l_other_seeds := a_feature.other_seeds
			check
					-- See postcondition of `is_replicated' in
					-- class ET_FEATURE.
				is_replicated: a_feature.replicated_seeds /= Void
			end
			l_replicated_seeds := a_feature.replicated_seeds
			nb := l_replicated_seeds.count
			if l_other_seeds /= Void then
				if l_replicated_seeds.has (l_first_seed) then
					if nb = 1 then
							-- There was only the first seed to be removed.
						l_seeds_done := True
					elseif nb = l_other_seeds.count + 1 then
							-- All the seeds (first and others) needed
							-- to be removed.
						l_other_seeds := Void
						l_seeds_done := True
					else
							-- There are still seeds to be removed from
							-- `l_other_seeds'. We already took care of
							-- `l_first_seed'.
						l_replicated_seeds.remove (l_first_seed)
						nb := nb - 1
					end
					l_first_seed := a_new_seed
				elseif nb = l_other_seeds.count then
						-- All other seeds need to be removed.
					create l_other_seeds.make (a_new_seed)
					l_seeds_done := True
				end
				if not l_seeds_done then
					l_need_twin := a_feature.is_other_seeds_shared
					if l_need_twin then
						l_other_seeds := clone (l_other_seeds)
					end
					i := 1
					if l_first_seed /= a_new_seed then
							-- The new seed has not been added yet.
							-- Do it now.
						l_other_seeds.replace (l_replicated_seeds.first, a_new_seed)
						i := i + 1
					end
						-- Remove the remaining seeds listed in
						-- `l_replicated_seeds'. Thanks to the test
						-- made a few lines above (those which set
						-- or not `l_seeds_done'), we know that we
						-- will not completely empty `l_other_seeds'.
					from until i > nb loop
						l_seed := l_replicated_seeds.item (i)
						l_other_seeds.remove (l_seed)
						i := i + 1
					end
				end
			else
					-- There was only one seed. So this is the
					-- one to be replace by the new seed.
				l_first_seed := a_new_seed
			end
			a_feature.set_first_seed (l_first_seed)
			a_feature.set_other_seeds (l_other_seeds)
		end

feature {NONE} -- Clients

	clients_list: DS_ARRAYED_LIST [ET_CLASS_NAME_LIST]
			-- List of client clauses

	client_names: DS_HASH_SET [ET_CLASS_NAME]
			-- Client class names

	inherited_clients (a_feature: ET_INHERITED_FEATURE): ET_CLASS_NAME_LIST is
			-- Clients inherited by the not redeclared feature `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_parent_feature: ET_PARENT_FEATURE
			l_clients: ET_CLASS_NAME_LIST
			l_parent: ET_PARENT
			l_exports: ET_EXPORT_LIST
			l_export: ET_EXPORT
			l_name: ET_FEATURE_NAME
			l_overridden: BOOLEAN
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			from
				l_parent_feature := a_feature.parent_feature
			until
				l_parent_feature = Void
			loop
				l_overridden := False
				l_name := l_parent_feature.name
				l_parent := l_parent_feature.parent
				l_exports := l_parent.exports
				if l_exports /= Void then
					nb := l_exports.count
					from i := 1 until i > nb loop
						l_export := l_exports.item (i)
						if l_export.has_feature_name (l_name) then
							clients_list.force_last (l_export.clients (l_name))
							l_overridden := True
						end
						i := i + 1
					end
				end
				if not l_overridden then
					clients_list.force_last (l_parent_feature.precursor_feature.clients)
				end
				l_parent_feature := l_parent_feature.merged_feature
			end
			Result := clients_list.first
			nb := clients_list.count
			from i := 1 until i > nb loop
				l_clients := clients_list.item (i)
				if l_clients.is_none then
					clients_list.remove (i)
					nb := nb - 1
				else
					nb2 := l_clients.count
					from j := 1 until j > nb2 loop
						client_names.force (l_clients.class_name (j))
						j := j + 1
					end
					i := i + 1
				end
			end
			if clients_list.is_empty then
				-- Keep `Result'.
			elseif clients_list.count = 1 then
				Result := clients_list.first
			else
				Result := Void
				nb2 := client_names.count
				nb := clients_list.count
				from i := 1 until i > nb loop
					l_clients := clients_list.item (i)
					if l_clients.count >= nb2 then
						Result := l_clients
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
				if Result /= Void then
					from client_names.start until client_names.after loop
						if not Result.has (client_names.item_for_iteration) then
							Result := Void
							client_names.go_after -- Jump out of the loop.
						else
							client_names.forth
						end
					end
				end
				if Result = Void then
					create Result.make_with_capacity (nb2)
					from client_names.finish until client_names.before loop
						Result.put_first (client_names.item_for_iteration)
						client_names.back
					end
				end
			end
			client_names.wipe_out
			clients_list.wipe_out
		end

feature {NONE} -- Feature adaptation validity

	check_redeclaration_validity (a_parent_feature: ET_PARENT_FEATURE;
		a_redeclared_feature: ET_FEATURE; has_redefine: BOOLEAN) is
			-- Check validity when `a_parent_feature' has been
			-- given a new declaration `a_redeclared_feature' in
			-- `current_class'. `has_redefine' indicates whether the
			-- feature has been listed in one of the Redefine clauses
			-- or not.
		require
			a_parent_feature_not_void: a_parent_feature /= Void
			a_redeclared_feature_not_void: a_redeclared_feature /= Void
		do
			check_rename_clause_validity (a_parent_feature)
			check_undefine_clause_validity (a_parent_feature)
			check_redefine_clause_validity (a_parent_feature)
			if a_parent_feature.has_redefine then
				if a_redeclared_feature.is_deferred /= a_parent_feature.is_deferred then
					if a_redeclared_feature.is_deferred then
							-- Error: Used 'redefine' instead of 'undefine'.
							-- Need to use 'undefine' to redeclare an
							-- effective feature to a deferred feature.
							-- (Not considered as a fatal error by gelint.)
						error_handler.report_vdrd5a_error (current_class, a_parent_feature, a_redeclared_feature)
					else
							-- Error: No need to 'redefine' to redeclare
							-- a deferred feature to an effective feature.
							-- (Not considered as a fatal error by gelint.)
						error_handler.report_vdrs4b_error (current_class, a_parent_feature, a_redeclared_feature)
					end
				end
			elseif a_redeclared_feature.is_deferred then
				if a_parent_feature.is_deferred then
					if not has_redefine then
							-- Error: Need 'redefine' to redeclare a
							-- deferred feature to a deferred feature.
							-- (Not considered as a fatal error by gelint.)
						error_handler.report_vdrd4a_error (current_class, a_parent_feature, a_redeclared_feature)
					end
				else
						-- Error: need 'undefine' and 'redefine' to
						-- redeclare an effective feature to a deferred
						-- feature.
					set_fatal_error (current_class)
					error_handler.report_vmfn0b_error (current_class, a_parent_feature, a_redeclared_feature)
					error_handler.report_vdrd4c_error (current_class, a_parent_feature, a_redeclared_feature)
				end
			elseif not a_parent_feature.is_deferred then
					-- Error: need 'redefine' to redeclare an effective
					-- feature to an effective feature.
				set_fatal_error (current_class)
				error_handler.report_vmfn0b_error (current_class, a_parent_feature, a_redeclared_feature)
				error_handler.report_vdrd4b_error (current_class, a_parent_feature, a_redeclared_feature)
			end
		end

	check_no_redeclaration_validity (a_parent_feature: ET_PARENT_FEATURE) is
			-- Check validity when `a_parent_feature' has not been given a new
			-- declaration in `current_class'.
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		do
			check_rename_clause_validity (a_parent_feature)
			check_undefine_clause_validity (a_parent_feature)
			check_redefine_clause_validity (a_parent_feature)
			if a_parent_feature.has_redefine then
					-- Error: Not a redefinition.
				set_fatal_error (current_class)
				error_handler.report_vdrs4a_error (current_class, a_parent_feature)
			end
		end

	check_rename_clause_validity (a_parent_feature: ET_PARENT_FEATURE) is
			-- Check validity of rename clause for `a_parent_feature'.
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		local
			l_precursor_feature: ET_FEATURE
			l_name: ET_FEATURE_NAME
		do
			if a_parent_feature.has_rename then
				l_precursor_feature := a_parent_feature.precursor_feature
				l_name := a_parent_feature.new_name.new_name
				if l_name.is_infix then
					if not l_precursor_feature.is_infixable then
						set_fatal_error (current_class)
						error_handler.report_vhrc5a_error (current_class, a_parent_feature.parent, a_parent_feature.new_name, l_precursor_feature)
					end
				elseif l_name.is_prefix then
					if not l_precursor_feature.is_prefixable then
						set_fatal_error (current_class)
						error_handler.report_vhrc4a_error (current_class, a_parent_feature.parent, a_parent_feature.new_name, l_precursor_feature)
					end
				end
			end
		end

	check_undefine_clause_validity (a_parent_feature: ET_PARENT_FEATURE) is
			-- Check validity of undefine clause for `a_parent_feature'.
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		local
			l_precursor_feature: ET_FEATURE
		do
			if a_parent_feature.has_undefine then
				l_precursor_feature := a_parent_feature.precursor_feature
				if l_precursor_feature.is_deferred then
						-- This is not a fatal error for gelint.
					error_handler.report_vdus3a_error (current_class, a_parent_feature.parent, a_parent_feature.undefine_name)
				end
				if l_precursor_feature.is_frozen then
					set_fatal_error (current_class)
					error_handler.report_vdus2a_error (current_class, a_parent_feature.parent, a_parent_feature.undefine_name)
				end
				if
					l_precursor_feature.is_attribute or
					l_precursor_feature.is_unique_attribute or
					l_precursor_feature.is_constant_attribute
				then
					set_fatal_error (current_class)
					error_handler.report_vdus2b_error (current_class, a_parent_feature.parent, a_parent_feature.undefine_name)
				end
			end
		end

	check_redefine_clause_validity (a_parent_feature: ET_PARENT_FEATURE) is
			-- Check validity of redefine clause for `a_parent_feature'.
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		local
			l_precursor_feature: ET_FEATURE
		do
			if a_parent_feature.has_redefine then
				l_precursor_feature := a_parent_feature.precursor_feature
				if l_precursor_feature.is_frozen then
					set_fatal_error (current_class)
					error_handler.report_vdrs2a_error (current_class, a_parent_feature.parent, a_parent_feature.redefine_name)
				end
				if
					l_precursor_feature.is_unique_attribute or
					l_precursor_feature.is_constant_attribute
				then
					set_fatal_error (current_class)
					error_handler.report_vdrs2b_error (current_class, a_parent_feature.parent, a_parent_feature.redefine_name)
				end
			end
		end

feature {NONE} -- Precursor validity

	check_precursor_validity (a_feature: ET_REDECLARED_FEATURE) is
			-- Check validity of Precursor constructs in `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			precursor_checker.check_feature_validity (a_feature, current_class)
		end

	precursor_checker: ET_PRECURSOR_CHECKER
			-- Precursor validity checker

feature {NONE} -- Signature resolving

	resolve_identifier_signature (a_feature: ET_FEATURE) is
			-- Resolve identifier types (e.g. "like identifier"
			-- or "BIT identifier") in signature of `a_feature'
			-- in `current_class'. Do not try to resolve qualified
			-- anchored types other than those of the form
			-- 'like Current.b'. This is done after the features
			-- of the corresponding classes have been flattened.
			-- Also check whether an argument name does not appear
			-- twice and whether none of the argument names are
			-- the final name of a feature in `current_class'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_registered: a_feature.is_registered
		local
			a_type, previous_type: ET_TYPE
			args: ET_FORMAL_ARGUMENT_LIST
			an_arg, other_arg: ET_FORMAL_ARGUMENT
			other_feature: ET_FEATURE
			a_name: ET_IDENTIFIER
			i, j, nb: INTEGER
		do
			a_type := a_feature.type
			if a_type /= Void then
				identifier_type_resolver.resolve_type (a_type, a_feature, current_class)
				if identifier_type_resolver.has_fatal_error then
					set_fatal_error (current_class)
				end
			end
			args := a_feature.arguments
			if args /= Void then
				nb := args.count
				from i := 1 until i > nb loop
					an_arg := args.formal_argument (i)
					a_type := an_arg.type
					if a_type /= previous_type then
							-- Not resolved yet.
						identifier_type_resolver.resolve_type (a_type, a_feature, current_class)
						if identifier_type_resolver.has_fatal_error then
							set_fatal_error (current_class)
						end
						previous_type := a_type
					end
					a_name := an_arg.name
						-- A negative seed upto -arguments.count means
						-- that it is an argument, below that it is a
						-- local variable. Positive seeds are for feature
						-- names.
					a_name.set_seed (-i)
					from j := 1 until j >= i loop
						other_arg := args.formal_argument (j)
						if other_arg.name.same_identifier (a_name) then
								-- Two arguments with the same name.
							set_fatal_error (current_class)
							error_handler.report_vreg0a_error (current_class, other_arg, an_arg, a_feature)
						end
						j := j + 1
					end
					if named_features.has (a_name) then
							-- This argument has the same name as the
							-- final name of a feature in `current_class'.
						other_feature := named_features.item (a_name).flattened_feature
						set_fatal_error (current_class)
						error_handler.report_vrfa0a_error (current_class, an_arg, a_feature, other_feature)
					end
					i := i + 1
				end
			end
		end

	identifier_type_resolver: ET_IDENTIFIER_TYPE_RESOLVER
			-- Identifier type resolver

feature {NONE} -- Signature validity

	check_anchored_signatures is
			-- Check whether there is no cycle in the anchored types
			-- held in the types of all signatures of `current_class'.
			-- Do not try to follow qualified anchored types other
			-- than those of the form 'like Current.b'. This is done
			-- after the features of the corresponding classes have
			-- been flattened.
		do
			anchored_type_checker.check_signatures (current_class)
		end

	anchored_type_checker: ET_ANCHORED_TYPE_CHECKER
			-- Anchored type checker

	check_signature_validity (a_feature: ET_FLATTENED_FEATURE) is
			-- Check signature validity for redeclarations and joinings.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_flattened_feature: ET_FEATURE
			an_inherited_flattened_feature: ET_PARENT_FEATURE
			a_redeclared_feature: ET_REDECLARED_FEATURE
			an_inherited_feature: ET_INHERITED_FEATURE
			a_parent_feature: ET_PARENT_FEATURE
			an_adapted_feature: ET_ADAPTED_FEATURE
			a_replicated_features: DS_LINKED_LIST [ET_PARENT_FEATURE]
			a_cursor: DS_LINKED_LIST_CURSOR [ET_PARENT_FEATURE]
		do
			if a_feature.is_redeclared then
					-- Redeclaration.
				a_redeclared_feature := a_feature.redeclared_feature
				from
					a_parent_feature := a_redeclared_feature.parent_feature
				until
					a_parent_feature = Void
				loop
					check_redeclared_signature_validity (a_redeclared_feature, a_parent_feature)
					a_parent_feature := a_parent_feature.merged_feature
				end
			elseif a_feature.is_inherited then
				an_inherited_feature := a_feature.inherited_feature
				a_flattened_feature := an_inherited_feature.flattened_feature
				an_inherited_flattened_feature := an_inherited_feature.flattened_parent
				if a_flattened_feature.is_deferred then
						-- Joining (merging deferred features together).
					from
						a_parent_feature := an_inherited_feature.parent_feature
					until
						a_parent_feature = Void
					loop
						if not a_parent_feature.same_version (an_inherited_flattened_feature) then
							check_joined_signature_validity (an_inherited_feature, a_parent_feature)
						end
						a_parent_feature := a_parent_feature.merged_feature
					end
				else
						-- Redeclaration (merging deferred features into an effective one).
					from
						a_parent_feature := an_inherited_feature.parent_feature
					until
						a_parent_feature = Void
					loop
						if a_parent_feature.is_deferred then
							check_redeclared_signature_validity (an_inherited_feature, a_parent_feature)
						end
						a_parent_feature := a_parent_feature.merged_feature
					end
				end
			else
				check_immediate_signature_validity (a_feature.flattened_feature)
			end
			if a_feature.is_adapted then
				an_adapted_feature := a_feature.adapted_feature
				if an_adapted_feature.is_selected then
					a_replicated_features := an_adapted_feature.replicated_features
					if a_replicated_features /= Void then
						a_cursor := a_replicated_features.new_cursor
						from a_cursor.start until a_cursor.after loop
							check_selected_signature_validity (an_adapted_feature, a_cursor.item)
							a_cursor.forth
						end
					end
				end
			end
		end

	check_immediate_signature_validity (a_feature: ET_FEATURE) is
			-- Check whether `a_feature' has correctly been declared
			-- as having arguments which can possibly be redefined
			-- covariantly in descendant classes?
		require
			a_feature_not_void: a_feature /= Void
		local
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			if universe.anchored_cat_features then
				if not universe.all_cat_features and not a_feature.is_cat then
					an_arguments := a_feature.arguments
					if an_arguments /= Void then
						nb := an_arguments.count
						from i := 1 until i > nb loop
							a_type := an_arguments.formal_argument (i).type
							if a_type.has_anchored_type (current_class, universe) then
								if universe.searching_cat_features then
									a_feature.set_cat_keyword (tokens.cat_keyword)
									universe.set_cat_feature_count (universe.cat_feature_count + 1)
									i := nb + 1 -- Jump out of the loop.
								else
									set_fatal_error (current_class)
-- TODO:
									error_handler.report_error_message ("Feature " + current_class.name.name + "." + a_feature.name.name + " should be marked as covariant")
								end
							end
							i := i + 1
						end
					end
				end
			end
		end

	check_redeclared_signature_validity (a_feature: ET_ADAPTED_FEATURE; other: ET_PARENT_FEATURE) is
			-- Check whether the signature of `a_feature' conforms
			-- to the signature of `other'. This check has to be done
			-- when `a_feature' is a redeclaration in `current_class'
			-- of the inherited feature `other', or when the inherited
			-- feature `other' is deferred and is merged to the other
			-- inherted feature `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			other_not_void: other /= Void
		local
			a_type: ET_TYPE
			other_type: ET_TYPE
			other_precursor: ET_FEATURE
			a_flattened_feature: ET_FEATURE
			a_parent_feature: ET_PARENT_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			other_arguments: ET_FORMAL_ARGUMENT_LIST
			a_resolver: ET_AST_PROCESSOR
			b: BOOLEAN
			i, nb: INTEGER
			l_cat: BOOLEAN
			l_other_cat: BOOLEAN
			l_mark_cat: BOOLEAN
			l_mark_other_cat: BOOLEAN
			an_ancestors: ET_BASE_TYPE_LIST
			an_ancestor: ET_CLASS
			a_cat_feature: ET_FEATURE
			a_seeds: ET_FEATURE_IDS
			j, nb2: INTEGER
		do
				-- We don't want the qualified anchored types in signatures to be resolved yet.
			a_resolver := universe.qualified_signature_resolver
			universe.set_qualified_signature_resolver (universe.null_processor)
			a_flattened_feature := a_feature.flattened_feature
			a_type := a_flattened_feature.type
			parent_context.set (other.parent.type, current_class)
			other_precursor := other.precursor_feature
			other_type := other_precursor.type
			if a_type = Void then
				if other_type /= Void then
					set_fatal_error (current_class)
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
					end
				end
			elseif other_type = Void then
				set_fatal_error (current_class)
				if a_feature.is_inherited then
					a_parent_feature := a_feature.inherited_feature.flattened_parent
					error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
				else
					error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
				end
			elseif not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
				if
					a_type.has_qualified_type (current_class, universe) or
					other_type.has_qualified_type (parent_context, universe)
				then
						-- We have to delay until qualified
						-- anchored types have been resolved.
					has_qualified_type := True
				else
					set_fatal_error (current_class)
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
					end
				end
			end
			an_arguments := a_flattened_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments = Void or else an_arguments.is_empty then
				if other_arguments /= Void and then not other_arguments.is_empty then
					set_fatal_error (current_class)
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
					end
				end
			elseif other_arguments = Void or else other_arguments.count /= an_arguments.count then
				set_fatal_error (current_class)
				error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
			else
				l_cat := universe.all_cat_features or a_flattened_feature.is_cat
				l_other_cat := universe.all_cat_features or other_precursor.is_cat
				nb := an_arguments.count
				from i := 1 until i > nb loop
					a_type := an_arguments.formal_argument (i).type
					if universe.anchored_cat_features then
						if not l_cat and a_feature.is_redeclared then
							if a_type.has_anchored_type (current_class, universe) then
								if universe.searching_cat_features then
									l_mark_cat := True
									l_cat := True
								else
									set_fatal_error (current_class)
-- TODO:
									error_handler.report_error_message ("Feature " + current_class.name.name + "." + a_flattened_feature.name.name + " should be marked as covariant")
								end
							end
						end
					end
					other_type := other_arguments.formal_argument (i).type
					if not l_other_cat then
						if universe.searching_cat_features then
							if l_cat then
								l_mark_other_cat := True
								l_other_cat := True
							elseif not a_type.same_named_type (other_type, parent_context, current_class, universe) then
								l_mark_other_cat := True
								l_other_cat := True
							end
						else
							if l_cat then
								set_fatal_error (current_class)
-- TODO:
								error_handler.report_error_message ("Feature " + current_class.name.name + "." + a_flattened_feature.name.name + " is marked as covariant but is the redeclaration of an no-variant feature")
							end
							if not a_type.same_named_type (other_type, parent_context, current_class, universe) then
								if
									a_type.has_qualified_type (current_class, universe) or
									other_type.has_qualified_type (parent_context, universe)
								then
										-- We have to delay until qualified
										-- anchored types have been resolved.
									has_qualified_type := True
								else
									set_fatal_error (current_class)
									if a_feature.is_inherited then
										a_parent_feature := a_feature.inherited_feature.flattened_parent
										error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
									else
										error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
									end
								end
							end
						end
					end
					if l_other_cat then
						if not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
							if
								a_type.has_qualified_type (current_class, universe) or
								other_type.has_qualified_type (parent_context, universe)
							then
									-- We have to delay until qualified
									-- anchored types have been resolved.
								has_qualified_type := True
							else
								set_fatal_error (current_class)
								if a_feature.is_inherited then
									a_parent_feature := a_feature.inherited_feature.flattened_parent
									error_handler.report_vdrd2b_error (current_class, a_parent_feature, other)
								else
									error_handler.report_vdrd2a_error (current_class, a_flattened_feature, other)
								end
							end
						elseif universe.searching_dog_types then
								-- Force the redeclared type to be non-cat when the two
								-- types are the same except for their cat-ness. This
								-- trick may prevent this feature from having to be
								-- marked as cat.
							b := a_type.same_syntactical_type (other_type, parent_context, current_class, universe)
						end
					end
					i := i + 1
				end
				if l_mark_cat then
					a_flattened_feature.set_cat_keyword (tokens.cat_keyword)
					universe.set_cat_feature_count (universe.cat_feature_count + 1)
					an_ancestors := current_class.ancestors
					nb := an_ancestors.count
					from i := 1 until i > nb loop
						an_ancestor := an_ancestors.item (i).direct_base_class (universe)
						a_cat_feature := an_ancestor.seeded_feature (a_flattened_feature.first_seed)
						if a_cat_feature /= Void and then not a_cat_feature.is_cat then
							a_cat_feature.set_cat_keyword (tokens.cat_keyword)
							universe.set_cat_feature_count (universe.cat_feature_count + 1)
						end
						a_seeds := a_flattened_feature.other_seeds
						if a_seeds /= Void then
							nb2 := a_seeds.count
							from j := 1 until j > nb2 loop
								a_cat_feature := an_ancestor.seeded_feature (a_seeds.item (j))
								if a_cat_feature /= Void and then not a_cat_feature.is_cat then
									a_cat_feature.set_cat_keyword (tokens.cat_keyword)
									universe.set_cat_feature_count (universe.cat_feature_count + 1)
								end
								j := j + 1
							end
						end
						i := i + 1
					end
				elseif l_mark_other_cat then
					other_precursor.set_cat_keyword (tokens.cat_keyword)
					universe.set_cat_feature_count (universe.cat_feature_count + 1)
					an_ancestors := other.parent.type.direct_base_class (universe).ancestors
					nb := an_ancestors.count
					from i := 1 until i > nb loop
						an_ancestor := an_ancestors.item (i).direct_base_class (universe)
						a_cat_feature := an_ancestor.seeded_feature (other_precursor.first_seed)
						if a_cat_feature /= Void and then not a_cat_feature.is_cat then
							a_cat_feature.set_cat_keyword (tokens.cat_keyword)
							universe.set_cat_feature_count (universe.cat_feature_count + 1)
						end
						a_seeds := other_precursor.other_seeds
						if a_seeds /= Void then
							nb2 := a_seeds.count
							from j := 1 until j > nb2 loop
								a_cat_feature := an_ancestor.seeded_feature (a_seeds.item (j))
								if a_cat_feature /= Void and then not a_cat_feature.is_cat then
									a_cat_feature.set_cat_keyword (tokens.cat_keyword)
									universe.set_cat_feature_count (universe.cat_feature_count + 1)
								end
								j := j + 1
							end
						end
						i := i + 1
					end
				end
			end
			universe.set_qualified_signature_resolver (a_resolver)
		end

	check_selected_signature_validity (a_feature: ET_ADAPTED_FEATURE; other: ET_PARENT_FEATURE) is
			-- Check whether the signature of `a_feature' conforms
			-- to the signature of `other'. This check has to be done
			-- when `a_feature' is the selected version in `current_class'
			-- of the inherited replicated feature `other'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_selected: a_feature.is_selected
			other_not_void: other /= Void
		local
			a_type: ET_TYPE
			other_type: ET_TYPE
			other_precursor: ET_FEATURE
			a_flattened_feature: ET_FEATURE
			a_parent_feature: ET_PARENT_FEATURE
			an_arguments: ET_FORMAL_ARGUMENT_LIST
			other_arguments: ET_FORMAL_ARGUMENT_LIST
			a_resolver: ET_AST_PROCESSOR
			b: BOOLEAN
			i, nb: INTEGER
			l_cat: BOOLEAN
			l_other_cat: BOOLEAN
			l_mark_cat: BOOLEAN
			l_mark_other_cat: BOOLEAN
			an_ancestors: ET_BASE_TYPE_LIST
			an_ancestor: ET_CLASS
			a_cat_feature: ET_FEATURE
			a_seeds: ET_FEATURE_IDS
			j, nb2: INTEGER
		do
				-- We don't want the qualified anchored types in signatures to be resolved yet.
			a_resolver := universe.qualified_signature_resolver
			universe.set_qualified_signature_resolver (universe.null_processor)
			a_flattened_feature := a_feature.flattened_feature
			a_type := a_flattened_feature.type
			parent_context.set (other.parent.type, current_class)
			other_precursor := other.precursor_feature
			other_type := other_precursor.type
			if a_type = Void then
				if other_type /= Void then
					set_fatal_error (current_class)
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
					end
				end
			elseif other_type = Void then
				set_fatal_error (current_class)
				if a_feature.is_inherited then
					a_parent_feature := a_feature.inherited_feature.flattened_parent
					error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
				else
					error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
				end
			elseif not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
				if
					a_type.has_qualified_type (current_class, universe) or
					other_type.has_qualified_type (parent_context, universe)
				then
						-- We have to delay until qualified
						-- anchored types have been resolved.
					has_qualified_type := True
				else
					set_fatal_error (current_class)
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
					end
				end
			end
			an_arguments := a_flattened_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments = Void or else an_arguments.is_empty then
				if other_arguments /= Void and then not other_arguments.is_empty then
					set_fatal_error (current_class)
					if a_feature.is_inherited then
						a_parent_feature := a_feature.inherited_feature.flattened_parent
						error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
					else
						error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
					end
				end
			elseif other_arguments = Void or else other_arguments.count /= an_arguments.count then
				set_fatal_error (current_class)
				if a_feature.is_inherited then
					a_parent_feature := a_feature.inherited_feature.flattened_parent
					error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
				else
					error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
				end
			else
				l_cat := universe.all_cat_features or a_flattened_feature.is_cat
				l_other_cat := universe.all_cat_features or other_precursor.is_cat
				nb := an_arguments.count
				from i := 1 until i > nb loop
					a_type := an_arguments.formal_argument (i).type
					other_type := other_arguments.formal_argument (i).type
					if not l_other_cat then
						if universe.searching_cat_features then
							if l_cat then
								l_mark_other_cat := True
								l_other_cat := True
							elseif not a_type.same_named_type (other_type, parent_context, current_class, universe) then
								l_mark_other_cat := True
								l_other_cat := True
							end
						else
							if l_cat then
								set_fatal_error (current_class)
-- TODO:
								error_handler.report_error_message ("Feature " + current_class.name.name + "." + a_flattened_feature.name.name + " is marked as covariant but is the redeclaration of an no-variant feature")
							end
							if not a_type.same_named_type (other_type, parent_context, current_class, universe) then
								if
									a_type.has_qualified_type (current_class, universe) or
									other_type.has_qualified_type (parent_context, universe)
								then
										-- We have to delay until qualified
										-- anchored types have been resolved.
									has_qualified_type := True
								else
									set_fatal_error (current_class)
									if a_feature.is_inherited then
										a_parent_feature := a_feature.inherited_feature.flattened_parent
										error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
									else
										error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
									end
								end
							end
						end
					end
					if l_other_cat then
						if not a_type.conforms_to_type (other_type, parent_context, current_class, universe) then
							if
								a_type.has_qualified_type (current_class, universe) or
								other_type.has_qualified_type (parent_context, universe)
							then
									-- We have to delay until qualified
									-- anchored types have been resolved.
								has_qualified_type := True
							else
								set_fatal_error (current_class)
								if a_feature.is_inherited then
									a_parent_feature := a_feature.inherited_feature.flattened_parent
									error_handler.report_vdrd2d_error (current_class, a_parent_feature, other)
								else
									error_handler.report_vdrd2c_error (current_class, a_flattened_feature, other)
								end
							end
						elseif universe.searching_dog_types then
								-- Force the redeclared type to be non-cat when the two
								-- types are the same except for their cat-ness. This
								-- trick may prevent this feature from having to be
								-- marked as cat.
							b := a_type.same_syntactical_type (other_type, parent_context, current_class, universe)
						end
					end
					i := i + 1
				end
				if l_mark_cat then
					a_flattened_feature.set_cat_keyword (tokens.cat_keyword)
					universe.set_cat_feature_count (universe.cat_feature_count + 1)
					an_ancestors := current_class.ancestors
					nb := an_ancestors.count
					from i := 1 until i > nb loop
						an_ancestor := an_ancestors.item (i).direct_base_class (universe)
						a_cat_feature := an_ancestor.seeded_feature (a_flattened_feature.first_seed)
						if a_cat_feature /= Void and then not a_cat_feature.is_cat then
							a_cat_feature.set_cat_keyword (tokens.cat_keyword)
							universe.set_cat_feature_count (universe.cat_feature_count + 1)
						end
						a_seeds := a_flattened_feature.other_seeds
						if a_seeds /= Void then
							nb2 := a_seeds.count
							from j := 1 until j > nb2 loop
								a_cat_feature := an_ancestor.seeded_feature (a_seeds.item (j))
								if a_cat_feature /= Void and then not a_cat_feature.is_cat then
									a_cat_feature.set_cat_keyword (tokens.cat_keyword)
									universe.set_cat_feature_count (universe.cat_feature_count + 1)
								end
								j := j + 1
							end
						end
						i := i + 1
					end
				elseif l_mark_other_cat then
					other_precursor.set_cat_keyword (tokens.cat_keyword)
					universe.set_cat_feature_count (universe.cat_feature_count + 1)
					an_ancestors := other.parent.type.direct_base_class (universe).ancestors
					nb := an_ancestors.count
					from i := 1 until i > nb loop
						an_ancestor := an_ancestors.item (i).direct_base_class (universe)
						a_cat_feature := an_ancestor.seeded_feature (other_precursor.first_seed)
						if a_cat_feature /= Void and then not a_cat_feature.is_cat then
							a_cat_feature.set_cat_keyword (tokens.cat_keyword)
							universe.set_cat_feature_count (universe.cat_feature_count + 1)
						end
						a_seeds := other_precursor.other_seeds
						if a_seeds /= Void then
							nb2 := a_seeds.count
							from j := 1 until j > nb2 loop
								a_cat_feature := an_ancestor.seeded_feature (a_seeds.item (j))
								if a_cat_feature /= Void and then not a_cat_feature.is_cat then
									a_cat_feature.set_cat_keyword (tokens.cat_keyword)
									universe.set_cat_feature_count (universe.cat_feature_count + 1)
								end
								j := j + 1
							end
						end
						i := i + 1
					end
				end
			end
			universe.set_qualified_signature_resolver (a_resolver)
		end

	check_joined_signature_validity (a_feature: ET_INHERITED_FEATURE; other: ET_PARENT_FEATURE) is
			-- Check that `a_feature' and `other' have the same signature
			-- when viewed from `current_class'. This check has to be done
			-- when joining two or more deferred features, the `a_feature'
			-- being the result of the join in `current_class' and `other'
			-- being one of the other deferred features inherited from a
			-- parent of `current_class'. (See ETL2 page 165 about Joining.)
		require
			a_feature_not_void: a_feature /= Void
			other_not_void: other /= Void
		local
			a_joined_feature: ET_FEATURE
			other_precursor: ET_FEATURE
			an_arguments, other_arguments: ET_FORMAL_ARGUMENT_LIST
			a_type, other_type: ET_TYPE
			i, nb: INTEGER
		do
			a_joined_feature := a_feature.flattened_feature
			a_type := a_joined_feature.type
			other_precursor := other.precursor_feature
			other_type := other_precursor.type
			parent_context.set (other.parent.type, current_class)
			if a_type = Void then
				if other_type /= Void then
					set_fatal_error (current_class)
					error_handler.report_vdjr0c_error (current_class, a_feature.flattened_parent, other)
				end
			elseif other_type = Void then
				set_fatal_error (current_class)
				error_handler.report_vdjr0c_error (current_class, a_feature.flattened_parent, other)
			elseif not a_type.same_syntactical_type (other_type, parent_context, current_class, universe) then
				if
					a_type.has_qualified_type (current_class, universe) or
					other_type.has_qualified_type (parent_context, universe)
				then
						-- We have to delay until qualified
						-- anchored types have been resolved.
					has_qualified_type := True
				else
					set_fatal_error (current_class)
					error_handler.report_vdjr0c_error (current_class, a_feature.flattened_parent, other)
				end
			end
			an_arguments := a_joined_feature.arguments
			other_arguments := other_precursor.arguments
			if an_arguments = Void or else an_arguments.is_empty then
				if other_arguments /= Void and then not other_arguments.is_empty then
					set_fatal_error (current_class)
					error_handler.report_vdjr0a_error (current_class, a_feature.flattened_parent, other)
				end
			elseif other_arguments = Void or else other_arguments.count /= an_arguments.count then
				set_fatal_error (current_class)
				error_handler.report_vdjr0a_error (current_class, a_feature.flattened_parent, other)
			else
-- TODO: if one of the joined features is not argument covariant, then the
-- feature resulting of the join should be no argument covariant as well.
				nb := an_arguments.count
				from i := 1 until i > nb loop
					if not an_arguments.formal_argument (i).type.same_syntactical_type (other_arguments.formal_argument (i).type, parent_context, current_class, universe) then
						if
							a_type.has_qualified_type (current_class, universe) or
							other_type.has_qualified_type (parent_context, universe)
						then
								-- We have to delay until qualified
								-- anchored types have been resolved.
							has_qualified_type := True
						else
							set_fatal_error (current_class)
							error_handler.report_vdjr0b_error (current_class, a_feature.flattened_parent, other, i)
						end
					end
					i := i + 1
				end
			end
		end

	parent_context: ET_NESTED_TYPE_CONTEXT
			-- Parent context for type conformance checking

	has_qualified_type: BOOLEAN
			-- Is there a qualified anchored type in (or reachable
			-- from) the signature of the feature being analyzed?
			-- If this is the case we will have to check again the
			-- signature of this feature after the features of the
			-- corresponding classes have been flattened.

feature {NONE} -- Formal parameters validity

	check_formal_parameters_validity is
			-- Check validity of formal parameters of `current_class'.
		do
			formal_parameter_checker.check_formal_parameters_validity (current_class)
			if formal_parameter_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	formal_parameter_checker: ET_FORMAL_PARAMETER_CHECKER2
			-- Formal parameter validity checker

feature {NONE} -- Parents validity

	check_parents_validity is
			-- Check validity of parents of `current_class'.
		do
			parent_checker.check_parents_validity (current_class)
			if parent_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	parent_checker: ET_PARENT_CHECKER2
			-- Parent validity checker

feature {NONE} -- Creators validity

	check_creators_validity is
			-- Check validity of creators of `current_class'.
		local
			a_creators: ET_CREATOR_LIST
			a_creator, other_creator: ET_CREATOR
			a_name, other_name: ET_FEATURE_NAME
			i, j, nb: INTEGER
			k, h, nb2, nb3: INTEGER
			a_feature: ET_FEATURE
		do
			a_creators := current_class.creators
			if a_creators /= Void and then not a_creators.is_empty then
				if current_class.is_deferred then
					set_fatal_error (current_class)
					error_handler.report_vgcp1a_error (current_class, a_creators.first)
				end
				nb := a_creators.count
				from i := 1 until i > nb loop
					a_creator := a_creators.item (i)
					nb2 := a_creator.count
					from k := 1 until k > nb2 loop
						a_name := a_creator.feature_name (k)
						from h := 1 until h >= k loop
							other_name := a_creator.feature_name (h)
							if other_name.same_feature_name (a_name) then
									-- Feature name appears twice in Creation clause.
									-- This is not considered as a fatal error.
								error_handler.report_vgcp3a_error (current_class, other_name, a_name)
							end
							h := h + 1
						end
						from j := 1 until j >= i loop
							other_creator := a_creators.item (j)
							nb3 := other_creator.count
							from h := 1 until h > nb3 loop
								other_name := other_creator.feature_name (h)
								if other_name.same_feature_name (a_name) then
										-- Feature name appears twice in Creation clauses.
										-- Note that it appears in two different clauses.
										-- This case is not covered by ETL2 but ISE reports
										-- this error anyway.
										-- This is not considered as a fatal error.
									error_handler.report_vgcp3b_error (current_class, other_name, a_name)
								end
								h := h + 1
							end
							j := j + 1
						end
						named_features.search (a_name)
						if named_features.found then
							a_feature := named_features.found_item.flattened_feature
							if a_feature.is_procedure then
								if a_feature.is_once then
									set_fatal_error (current_class)
									error_handler.report_vgcc6a_error (current_class, a_name, a_feature)
								else
										-- We finally got a valid creation
										-- procedure. Record its seed.
									a_name.set_seed (a_feature.first_seed)
								end
							else
									-- This feature is not a procedure.
								set_fatal_error (current_class)
								error_handler.report_vgcp2b_error (current_class, a_name, a_feature)
							end
						else
								-- This name is not the final name of
								-- a feature on `current_class'.
							set_fatal_error (current_class)
							error_handler.report_vgcp2a_error (current_class, a_name)
						end
						k := k + 1
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- Convert validity

	check_convert_validity is
			-- Check validity of convert clause of `current_class'.
		local
			a_convert_features: ET_CONVERT_FEATURE_LIST
			a_convert_feature: ET_CONVERT_FEATURE
			i, nb: INTEGER
			a_name: ET_FEATURE_NAME
			a_feature: ET_FEATURE
		do
			a_convert_features := current_class.convert_features
			if a_convert_features /= Void then
				nb := a_convert_features.count
				from i := 1 until i > nb loop
					a_convert_feature := a_convert_features.convert_feature (i)
					a_name := a_convert_feature.name
					named_features.search (a_name)
					if named_features.found then
						a_feature := named_features.found_item.flattened_feature
-- TODO: check whether this feature is valid as a convert feature.
						a_name.set_seed (a_feature.first_seed)
					else
							-- This name is not the final name of
							-- a feature on `current_class'.
						set_fatal_error (current_class)
-- TODO: report error message
					end
					i := i + 1
				end
			end
		end

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

	named_features_not_void: named_features /= Void
	no_void_named_feature: not named_features.has_item (Void)
	declared_feature_count_positive: declared_feature_count >= 0
	declared_feature_count_small_enough: declared_feature_count <= named_features.count
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
	client_names_not_void: client_names /= Void
	no_void_client_name: not client_names.has (Void)
	replicable_features_not_void: replicable_features /= Void
	no_void_replicable_feature: not replicable_features.has_item (Void)
	identifier_type_resolver_not_void: identifier_type_resolver /= Void
	anchored_type_checker_not_void: anchored_type_checker /= Void
	parent_checker_not_void: parent_checker /= Void
	formal_parameter_checker_not_void: formal_parameter_checker /= Void
	precursor_checker_not_void: precursor_checker /= Void
	parent_context_not_void: parent_context /= Void

end
