note

	description:

		"Eiffel feature adaptation resolvers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_ADAPTATION_RESOLVER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		end

	ET_SHARED_CALL_NAME_TESTER

	ET_SHARED_CLASS_NAME_TESTER

	ET_SHARED_ALIAS_NAME_TESTER

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new feature adaptation resolver for given classes.
		do
			precursor (a_system_processor)
			create rename_table.make_map (10)
			rename_table.set_key_equality_tester (call_name_tester)
			create export_table.make (10)
			export_table.set_equality_tester (call_name_tester)
			create undefine_table.make_map (10)
			undefine_table.set_key_equality_tester (call_name_tester)
			create redefine_table.make_map (10)
			redefine_table.set_key_equality_tester (call_name_tester)
			create select_table.make_map (10)
			select_table.set_key_equality_tester (call_name_tester)
			create alias_mapping.make_map (50)
			alias_mapping.set_key_equality_tester (alias_name_tester)
			create replicable_features.make_map (400)
		end

feature -- Feature adaptation resolving

	resolve_feature_adaptations (a_class: ET_CLASS; a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME])
			-- Resolve the feature adaptations of the inheritance clause
			-- of `a_class' and put resulting features in `a_features'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_void_item
		local
			old_class: ET_CLASS
			l_parent_clause: detachable ET_PARENT_LIST
			i1, nb1: INTEGER
			i2, nb2: INTEGER
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			add_current_features (a_features)
			nb1 := current_class.parents_count
			from i1 := 1 until i1 > nb1 loop
				l_parent_clause := current_class.parents (i1)
				nb2 := l_parent_clause.count
				from i2 := 1 until i2 > nb2 loop
					add_inherited_features (l_parent_clause.parent (i2), a_features)
					i2 := i2 + 1
				end
				i1 := i1 + 1
			end
			process_replication (a_features)
				-- Clean up.
			alias_mapping.wipe_out
			free_parent_feature := parent_feature_list
			free_inherited_feature := inherited_feature_list
			free_redeclared_feature := redeclared_feature_list
			current_class := old_class
		ensure
			no_void_feature: not a_features.has_void_item
		end

feature {NONE} -- Feature recording

	add_current_features (a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME])
			-- Add to `a_features' features declared in `current_class'.
		require
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_void_item
		local
			l_query: ET_QUERY
			l_queries: ET_QUERY_LIST
			l_procedure: ET_PROCEDURE
			l_procedures: ET_PROCEDURE_LIST
			other_feature: ET_FLATTENED_FEATURE
			a_name: ET_FEATURE_NAME
			l_alias_name: detachable ET_ALIAS_NAME
			i, nb, nb2, nb3: INTEGER
		do
			l_queries := current_class.queries
			l_procedures := current_class.procedures
			nb := l_queries.declared_count
			nb2 := l_procedures.declared_count
			nb3 := nb + nb2 + a_features.count
			if a_features.capacity < nb3 then
				a_features.resize (nb3)
			end
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				a_name := l_query.name
				a_features.search (a_name)
				if a_features.found then
					set_fatal_error
					other_feature := a_features.found_item
					error_handler.report_vmfn0a_error (current_class, other_feature.flattened_feature, l_query)
				else
					a_features.put_last_new (l_query, a_name)
					l_alias_name := l_query.alias_name
					if l_alias_name /= Void then
						if l_query.is_infixable then
							if l_alias_name.is_infixable then
								l_alias_name.set_infix
							end
						elseif l_query.is_prefixable then
							if l_alias_name.is_prefixable then
								l_alias_name.set_prefix
							end
						end
						if current_system.alias_transition_mode then
							if not alias_mapping.has (l_alias_name) then
								alias_mapping.force_last_new (a_name, l_alias_name)
							else
								-- Error: there is already a feature with the same alias.
								-- This error will be reported later in ET_FEATURE_FLATTENER.
							end
						end
					end
				end
				i := i + 1
			end
			from i := 1 until i > nb2 loop
				l_procedure := l_procedures.item (i)
				a_name := l_procedure.name
				a_features.search (a_name)
				if a_features.found then
					set_fatal_error
					other_feature := a_features.found_item
					error_handler.report_vmfn0a_error (current_class, other_feature.flattened_feature, l_procedure)
				else
					a_features.put_last_new (l_procedure, a_name)
				end
				i := i + 1
			end
		ensure
			no_void_feature: not a_features.has_void_item
		end

	add_inherited_features (a_parent: ET_PARENT; a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME])
			-- Add to `a_features' features inherited from `a_parent'.
			-- Also process the Feature_adaptation clause of `a_parent'.
			-- `a_parent' is one of the parents, explicit or implicit
			-- (i.e. ANY), of `current_class'.
		require
			a_parent_not_void: a_parent /= Void
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_void_item
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
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			a_named_feature: ET_FLATTENED_FEATURE
			a_redeclared_feature: ET_REDECLARED_FEATURE
			an_inherited_feature: ET_INHERITED_FEATURE
			a_parent_feature: ET_PARENT_FEATURE
			a_name: ET_FEATURE_NAME
			a_rename: ET_RENAME
			i, nb, nb2, nb3: INTEGER
			l_alias_name: detachable ET_ALIAS_NAME
			l_feature_name: ET_FEATURE_NAME
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
			a_class := a_parent.type.base_class
			l_queries := a_class.queries
			l_procedures := a_class.procedures
			nb := l_queries.count
			nb2 := l_procedures.count
			nb3 := nb + nb2 + a_features.count
			if a_features.capacity < nb3 then
				a_features.resize (nb3)
			end
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				a_parent_feature := new_parent_feature (l_query, a_parent)
				a_name := l_query.name
				l_alias_name := l_query.alias_name
				if has_rename then
					rename_table.search (a_name)
					if current_system.alias_transition_mode then
						if not rename_table.found and then l_alias_name /= Void then
							rename_table.search (l_alias_name)
						end
					end
					if rename_table.found then
						a_rename := rename_table.found_item
						rename_table.remove_found_item
						has_rename := not rename_table.is_empty
						a_parent_feature.set_new_name (a_rename)
						a_rename.old_name.set_seed (l_query.first_seed)
						a_name := a_rename.new_name.feature_name
						a_name.set_seed (l_query.first_seed)
						l_alias_name := a_rename.new_name.alias_name
						if l_alias_name /= Void then
							if l_query.is_infixable then
								if l_alias_name.is_infixable then
									l_alias_name.set_infix
								end
							elseif l_query.is_prefixable then
								if l_alias_name.is_prefixable then
									l_alias_name.set_prefix
								end
							end
						end
					end
				end
				if has_export then
					export_table.search (a_name)
					if current_system.alias_transition_mode then
						if not export_table.found and then l_alias_name /= Void then
							export_table.search (l_alias_name)
						end
					end
					if export_table.found then
						l_feature_name := export_table.found_item.feature_name
						l_feature_name.set_seed (l_query.first_seed)
						export_table.remove_found_item
						has_export := not export_table.is_empty
					end
				end
				if has_undefine then
					undefine_table.search (a_name)
					if current_system.alias_transition_mode then
						if not undefine_table.found and then l_alias_name /= Void then
							undefine_table.search (l_alias_name)
						end
					end
					if undefine_table.found then
						l_feature_name := undefine_table.found_key.feature_name
						l_feature_name.set_seed (l_query.first_seed)
						a_parent_feature.set_undefine_name (l_feature_name)
						if not undefine_table.found_item then
							undefine_table.replace_found_item (True)
							nb_undefine := nb_undefine - 1
						end
					end
				end
				if has_redefine then
					redefine_table.search (a_name)
					if current_system.alias_transition_mode then
						if not redefine_table.found and then l_alias_name /= Void then
							redefine_table.search (l_alias_name)
						end
					end
					if redefine_table.found then
						l_feature_name := redefine_table.found_key.feature_name
						l_feature_name.set_seed (l_query.first_seed)
						a_parent_feature.set_redefine_name (l_feature_name)
						if not redefine_table.found_item then
							redefine_table.replace_found_item (True)
							nb_redefine := nb_redefine - 1
						end
					end
				end
				if has_select then
					select_table.search (a_name)
					if current_system.alias_transition_mode then
						if not select_table.found and then l_alias_name /= Void then
							select_table.search (l_alias_name)
						end
					end
					if select_table.found then
						l_feature_name := select_table.found_key.feature_name
						l_feature_name.set_seed (l_query.first_seed)
						a_parent_feature.set_select_name (l_feature_name)
						if not select_table.found_item then
							select_table.replace_found_item (True)
							nb_select := nb_select - 1
						end
					end
				end
				a_features.search (a_name)
				if current_system.alias_transition_mode then
					if not a_features.found and then l_alias_name /= Void then
						alias_mapping.search (l_alias_name)
						if alias_mapping.found then
							if {KL_ANY_ROUTINES}.same_objects (l_alias_name, a_name) = not {KL_ANY_ROUTINES}.same_objects (alias_mapping.found_key, alias_mapping.found_item) then
									-- The test above is trying to express the following:
									--     'infix "+"' matches 'f alias "+"'
									--     'f alias "+"' matches 'infix "+"'
									--     'f alias "+"' does not match 'g alias "+"'
								a_features.search (alias_mapping.found_item)
							end
						end
					end
				end
				if a_features.found then
					a_named_feature := a_features.found_item
					if a_named_feature.is_immediate then
						a_redeclared_feature := new_redeclared_feature (a_named_feature.immediate_feature, a_parent_feature)
						a_features.replace_found_item (a_redeclared_feature)
					else
						a_named_feature.adapted_feature.put_parent_feature (a_parent_feature)
					end
				else
					an_inherited_feature := new_inherited_feature (a_parent_feature)
					a_features.put_last_new (an_inherited_feature, a_name)
					if current_system.alias_transition_mode then
						if l_alias_name /= Void then
							if not alias_mapping.has (l_alias_name) then
								alias_mapping.force_last_new (a_name, l_alias_name)
							else
								-- Error: there is already a feature with the same alias.
								-- This error will be reported later in ET_FEATURE_FLATTENER.
							end
						end
					end
				end
				i := i + 1
			end
			from i := 1 until i > nb2 loop
				l_procedure := l_procedures.item (i)
				a_parent_feature := new_parent_feature (l_procedure, a_parent)
				a_name := l_procedure.name
				if has_rename then
					rename_table.search (a_name)
					if rename_table.found then
						a_rename := rename_table.found_item
						rename_table.remove_found_item
						has_rename := not rename_table.is_empty
						a_parent_feature.set_new_name (a_rename)
						a_rename.old_name.set_seed (l_procedure.first_seed)
						a_name := a_rename.new_name.feature_name
						a_name.set_seed (l_procedure.first_seed)
					end
				end
				if has_export then
					export_table.search (a_name)
					if export_table.found then
						l_feature_name := export_table.found_item.feature_name
						l_feature_name.set_seed (l_procedure.first_seed)
						export_table.remove_found_item
						has_export := not export_table.is_empty
					end
				end
				if has_undefine then
					undefine_table.search (a_name)
					if undefine_table.found then
						l_feature_name := undefine_table.found_key.feature_name
						l_feature_name.set_seed (l_procedure.first_seed)
						a_parent_feature.set_undefine_name (l_feature_name)
						if not undefine_table.found_item then
							undefine_table.replace_found_item (True)
							nb_undefine := nb_undefine - 1
						end
					end
				end
				if has_redefine then
					redefine_table.search (a_name)
					if redefine_table.found then
						l_feature_name := redefine_table.found_key.feature_name
						l_feature_name.set_seed (l_procedure.first_seed)
						a_parent_feature.set_redefine_name (l_feature_name)
						if not redefine_table.found_item then
							redefine_table.replace_found_item (True)
							nb_redefine := nb_redefine - 1
						end
					end
				end
				if has_select then
					select_table.search (a_name)
					if select_table.found then
						l_feature_name := select_table.found_key.feature_name
						l_feature_name.set_seed (l_procedure.first_seed)
						a_parent_feature.set_select_name (l_feature_name)
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
					else
						a_named_feature.adapted_feature.put_parent_feature (a_parent_feature)
					end
				else
					an_inherited_feature := new_inherited_feature (a_parent_feature)
					a_features.put_last_new (an_inherited_feature, a_name)
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
					a_name := export_table.item_for_iteration.feature_name
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
							a_name := undefine_table.key_for_iteration.feature_name
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
							a_name := redefine_table.key_for_iteration.feature_name
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
							a_name := select_table.key_for_iteration.feature_name
							error_handler.report_vmss1a_error (current_class, a_parent, a_name)
						end
						select_table.forth
					end
				end
				select_table.wipe_out
			end
		ensure
			no_void_feature: not a_features.has_void_item
		end

feature {NONE} -- Feature adaptation

	rename_table: DS_HASH_TABLE [ET_RENAME, ET_CALL_NAME]
			-- Rename table
			--
			-- Note: use ET_CALL_NAME instead of ET_FEATURE_NAME in order
			-- to make it work when in 'alias_transition_mode'. But all
			-- objects are feature names anyway.

	export_table: DS_HASH_SET [ET_CALL_NAME]
			-- Export table
			--
			-- Note: use ET_CALL_NAME instead of ET_FEATURE_NAME in order
			-- to make it work when in 'alias_transition_mode'. But all
			-- objects are feature names anyway.

	undefine_table: DS_HASH_TABLE [BOOLEAN, ET_CALL_NAME]
			-- Undefine table (the boolean indicates whether a feature with that name has been found)
			--
			-- Note: use ET_CALL_NAME instead of ET_FEATURE_NAME in order
			-- to make it work when in 'alias_transition_mode'. But all
			-- objects are feature names anyway.

	redefine_table: DS_HASH_TABLE [BOOLEAN, ET_CALL_NAME]
			-- Redefine table (the boolean indicates whether a feature with that name has been found)
			--
			-- Note: use ET_CALL_NAME instead of ET_FEATURE_NAME in order
			-- to make it work when in 'alias_transition_mode'. But all
			-- objects are feature names anyway.

	select_table: DS_HASH_TABLE [BOOLEAN, ET_CALL_NAME]
			-- Select table (the boolean indicates whether a feature with that name has been found)
			--
			-- Note: use ET_CALL_NAME instead of ET_FEATURE_NAME in order
			-- to make it work when in 'alias_transition_mode'. But all
			-- objects are feature names anyway.

	fill_rename_table (a_parent: ET_PARENT)
			-- Fill `rename_table' with rename pairs of `a_parent'
			-- indexed by their old_name.
		require
			a_parent_not_void: a_parent /= Void
			renames_not_void: a_parent.renames /= Void
		local
			i, nb: INTEGER
			a_rename: ET_RENAME
			a_name: ET_FEATURE_NAME
		do
			check precondition: attached a_parent.renames as l_renames then
				nb := l_renames.count
				if rename_table.capacity < nb then
					rename_table.resize (nb)
				end
				from i := 1 until i > nb loop
					a_rename := l_renames.rename_pair (i)
					a_name := a_rename.old_name
					rename_table.search (a_name)
					if not rename_table.found then
						rename_table.put_new (a_rename, a_name)
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
		end

	fill_export_table (a_parent: ET_PARENT)
			-- Fill `export_table' with export feature names of `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			exports_not_void: a_parent.exports /= Void
		local
			i, nb: INTEGER
			an_export: ET_EXPORT
			other_all_export: detachable ET_ALL_EXPORT
			j, nb2: INTEGER
			new_count: INTEGER
			a_name: ET_FEATURE_NAME
		do
			check precondition: attached a_parent.exports as l_exports then
				nb := l_exports.count
				from i := 1 until i > nb loop
					an_export := l_exports.item (i)
					if attached {ET_ALL_EXPORT} an_export as an_all_export then
						if other_all_export /= Void then
								-- Two 'all' export clauses for this parent.
								-- This is not considered as a fatal error by gelint.
							error_handler.report_vlel1a_error (current_class, a_parent, other_all_export, an_all_export)
						else
							other_all_export := an_all_export
						end
					elseif attached {ET_FEATURE_EXPORT} an_export as a_feature_export then
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
								error_handler.report_vlel3a_error (current_class, a_parent, export_table.found_item.feature_name, a_name)
							end
							j := j + 1
						end
					end
					i := i + 1
				end
			end
		end

	fill_undefine_table (a_parent: ET_PARENT)
			-- Fill `undefine_table' with undefined names of `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			undefines_not_void: a_parent.undefines /= Void
		local
			i, nb: INTEGER
			a_name: ET_FEATURE_NAME
		do
			check precondition: attached a_parent.undefines as l_undefines then
				nb := l_undefines.count
				if undefine_table.capacity < nb then
					undefine_table.resize (nb)
				end
				from i := 1 until i > nb loop
					a_name := l_undefines.feature_name (i)
					undefine_table.search (a_name)
					if not undefine_table.found then
						undefine_table.put_new (False, a_name)
					else
							-- Feature name `a_name' appears twice in the
							-- Undefine clause. This is not considered as
							-- a fatal error by gelint.
						error_handler.report_vdus4a_error (current_class, a_parent, undefine_table.found_key.feature_name, a_name)
					end
					i := i + 1
				end
			end
		end

	fill_redefine_table (a_parent: ET_PARENT)
			-- Fill `redefine_table' with redefined names of `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			redefines_not_void: a_parent.redefines /= Void
		local
			i, nb: INTEGER
			a_name: ET_FEATURE_NAME
		do
			check precondition: attached a_parent.redefines as l_redefines then
				nb := l_redefines.count
				if redefine_table.capacity < nb then
					redefine_table.resize (nb)
				end
				from i := 1 until i > nb loop
					a_name := l_redefines.feature_name (i)
					redefine_table.search (a_name)
					if not redefine_table.found then
						redefine_table.put_new (False, a_name)
					else
							-- Feature name `a_name' appears twice in the
							-- Redefine clause. This is not considered as
							-- a fatal error by gelint.
						error_handler.report_vdrs3a_error (current_class, a_parent, redefine_table.found_key.feature_name, a_name)
					end
					i := i + 1
				end
			end
		end

	fill_select_table (a_parent: ET_PARENT)
			-- Fill `select_table' with selected names of `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			selects_not_void: a_parent.selects /= Void
		local
			i, nb: INTEGER
			a_name: ET_FEATURE_NAME
		do
			check precondition: attached a_parent.selects as l_selects then
				nb := l_selects.count
				if select_table.capacity < nb then
					select_table.resize (nb)
				end
				from i := 1 until i > nb loop
					a_name := l_selects.feature_name (i)
					select_table.search (a_name)
					if not select_table.found then
						select_table.put_new (False, a_name)
					else
							-- Feature name `a_name' appears twice in the
							-- Select clause. This is not considered as
							-- a fatal error by gelint.
						error_handler.report_vmss2a_error (current_class, a_parent, select_table.found_key.feature_name, a_name)
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- Transition infix/prefix -> alias

	alias_mapping: DS_HASH_TABLE [ET_FEATURE_NAME, ET_ALIAS_NAME]
			-- Mapping between alias names and feature names
			--
			-- Used for the transition from infix/prefix to alias

feature {NONE} -- Replication

	replicable_features: DS_HASH_TABLE [ET_REPLICABLE_FEATURE, INTEGER]
			-- Table of potentially replicable features, indexed by seed

	process_replication (a_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME])
			-- Take care of selected features and replication
			-- in `a_features'.
		require
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_void_item
		local
			l_feature: ET_FLATTENED_FEATURE
			l_adapted_feature: ET_ADAPTED_FEATURE
			l_replicable_feature: ET_REPLICABLE_FEATURE
			l_other_seeds: detachable ET_FEATURE_IDS
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
					-- The actual check is done in ET_FEATURE_FLATTENER.flatten_feature.
				end
				replicable_features.forth
			end
			replicable_features.wipe_out
		end

	record_replicable_feature (a_feature: ET_ADAPTED_FEATURE; a_seed: INTEGER)
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

	process_replicated_feature (a_feature: ET_REPLICATED_FEATURE; a_seed: INTEGER)
			-- Process replicated feature `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_replicated_features: DS_LINKED_LIST [ET_ADAPTED_FEATURE]
			a_parent_features: DS_ARRAYED_LIST [ET_PARENT_FEATURE]
			a_parent_feature: detachable ET_PARENT_FEATURE
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
					-- Make the compiler happy by initializing `a_selected_feature',
					-- even if it's not necessarily the first one which has been
					-- selected. The first loop below will find the feature which
					-- has actually been selected.
				a_selected_feature := a_feature.first_feature
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
					if attached a_replicated_feature.selected_feature as l_selected_feature then
						check has_selected_feature: a_replicated_feature.has_selected_feature end
						a_replicated_feature.set_selected
						a_parent_features.put_last (l_selected_feature)
					end
					a_replicated_features.forth
				end
				set_fatal_error
				error_handler.report_vmrc2b_error (current_class, a_parent_features)
			end
		end

feature {NONE} -- Implementation

	new_parent_feature (a_feature: ET_FEATURE; a_parent: ET_PARENT): ET_PARENT_FEATURE
			-- New parent feature
		require
			a_feature_not_void: a_feature /= Void
			a_parent_not_void: a_parent /= Void
		do
			if attached free_parent_feature as l_free_parent_feature then
				Result := l_free_parent_feature
				Result.reset (a_feature, a_parent)
				free_parent_feature := l_free_parent_feature.next
			else
				create Result.make (a_feature, a_parent)
				Result.set_next (parent_feature_list)
				parent_feature_list := Result
			end
		ensure
			parent_feature_not_void: Result /= Void
		end

	new_inherited_feature (a_parent_feature: ET_PARENT_FEATURE): ET_INHERITED_FEATURE
			-- New inherited feature
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		do
			if attached free_inherited_feature as l_free_inherited_feature then
				Result := l_free_inherited_feature
				Result.reset (a_parent_feature)
				free_inherited_feature := l_free_inherited_feature.next
			else
				create Result.make (a_parent_feature)
				Result.set_next (inherited_feature_list)
				inherited_feature_list := Result
			end
		ensure
			inherited_feature_not_void: Result /= Void
		end

	new_redeclared_feature (a_feature: ET_FEATURE; a_parent_feature: ET_PARENT_FEATURE): ET_REDECLARED_FEATURE
			-- New redeclared feature.
		require
			a_feature_not_void: a_feature /= Void
			a_parent_feature_not_void: a_parent_feature /= Void
		do
			if attached free_redeclared_feature as l_free_redeclared_feature then
				Result := l_free_redeclared_feature
				Result.reset (a_feature, a_parent_feature)
				free_redeclared_feature := l_free_redeclared_feature.next
			else
				create Result.make (a_feature, a_parent_feature)
				Result.set_next (redeclared_feature_list)
				redeclared_feature_list := Result
			end
		ensure
			redeclared_feature_not_void: Result /= Void
		end

	parent_feature_list: detachable ET_PARENT_FEATURE
			-- Parent feature free list

	free_parent_feature: detachable ET_PARENT_FEATURE
			-- First available parent feature in free list

	inherited_feature_list: detachable ET_INHERITED_FEATURE
			-- Inherited feature free list

	free_inherited_feature: detachable ET_INHERITED_FEATURE
			-- First available inherited feature in free list

	redeclared_feature_list: detachable ET_REDECLARED_FEATURE
			-- Redeclared feature free list

	free_redeclared_feature: detachable ET_REDECLARED_FEATURE
			-- First available redeclared feature in free list

invariant

	rename_table_not_void: rename_table /= Void
	no_void_rename: not rename_table.has_void_item
	no_void_rename_old_name: not rename_table.has_void
	renamed_feature_names: rename_table.keys.for_all (agent {ET_CALL_NAME}.is_feature_name)
	export_table_not_void: export_table /= Void
	no_void_export: not export_table.has_void
	exported_feature_names: export_table.for_all (agent {ET_CALL_NAME}.is_feature_name)
	undefine_table_not_void: undefine_table /= Void
	no_void_undefine: not undefine_table.has_void
	undefined_feature_names: undefine_table.keys.for_all (agent {ET_CALL_NAME}.is_feature_name)
	redefine_table_not_void: redefine_table /= Void
	no_void_redefine: not redefine_table.has_void
	redefined_feature_names: redefine_table.keys.for_all (agent {ET_CALL_NAME}.is_feature_name)
	select_table_not_void: select_table /= Void
	no_void_select: not select_table.has_void
	selected_feature_names: select_table.keys.for_all (agent {ET_CALL_NAME}.is_feature_name)
	replicable_features_not_void: replicable_features /= Void
	no_void_replicable_feature: not replicable_features.has_void_item
	alias_mapping_not_void: alias_mapping /= Void
	no_void_mapped_alias: not alias_mapping.has_void
	no_void_mapped_feature_name: not alias_mapping.has_void_item

end
