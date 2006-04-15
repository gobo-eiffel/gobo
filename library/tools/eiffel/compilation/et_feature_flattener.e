indexing

	description:

		"Eiffel class feature flatteners"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2005, Eric Bezault and others"
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
		export {NONE} all end

	ET_SHARED_ALIAS_NAME_TESTER
		export {NONE} all end

	ET_SHARED_CLASS_NAME_TESTER
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new feature flattener for classes in `a_universe'.
		do
			precursor (a_universe)
			create named_features.make_map (400)
			create queries.make (400)
			create procedures.make (400)
			named_features.set_key_equality_tester (feature_name_tester)
			create aliased_features.make_map (50)
			aliased_features.set_key_equality_tester (alias_name_tester)
			create clients_list.make (20)
			create client_names.make (20)
			client_names.set_equality_tester (class_name_tester)
			create feature_adaptation_resolver.make (a_universe)
			create identifier_type_resolver.make (a_universe)
			create anchored_type_checker.make (a_universe)
			create signature_checker.make (a_universe)
			create parent_checker.make (a_universe)
			create formal_parameter_checker.make (a_universe)
			create precursor_checker.make (a_universe)
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
				error_handler.report_giaaa_error
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
				if current_class.ancestors_built and then not current_class.has_ancestors_error then
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
						if not current_class.has_flattening_error then
							flatten_features
						end
					end
				else
					set_fatal_error (current_class)
				end
			end
			current_class := old_class
		ensure
			features_flattened: a_class.features_flattened
		end

feature -- Features

	named_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]
			-- Features indexed by name

	aliased_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_ALIAS_NAME]
			-- Features indexed by alias name

	queries: DS_ARRAYED_LIST [ET_QUERY]
			-- Queries

	procedures: DS_ARRAYED_LIST [ET_PROCEDURE]
			-- Procedures

feature {NONE} -- Feature adaptation

	feature_adaptation_resolver: ET_FEATURE_ADAPTATION_RESOLVER
			-- Feature adaptation resolver

	resolve_feature_adaptations is
			-- Resolve the feature adaptations of the inheritance clause of
			-- `current_class' and put resulting features in `named_features'.
		do
			feature_adaptation_resolver.resolve_feature_adaptations (current_class, named_features)
			if feature_adaptation_resolver.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

feature {NONE} -- Feature flattening

	flatten_features is
			-- Flatten inherited features into `current_class'.
		local
			a_named_feature: ET_FLATTENED_FEATURE
			a_feature: ET_FEATURE
			a_deferred_feature: ET_FLATTENED_FEATURE
			i, nb: INTEGER
			a_type: ET_TYPE
			l_alias_name: ET_ALIAS_NAME
			l_feature_name: ET_FEATURE_NAME
			l_other_feature: ET_FLATTENED_FEATURE
			l_parent_feature: ET_PARENT_FEATURE
			l_other_parent_feature: ET_PARENT_FEATURE
			l_queries: ET_QUERY_LIST
			l_procedures: ET_PROCEDURE_LIST
			l_declared_query_count: INTEGER
			l_declared_procedure_count: INTEGER
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
		do
			resolve_feature_adaptations
			if not current_class.has_flattening_error then
				nb := named_features.count
				from named_features.finish until named_features.before loop
					a_named_feature := named_features.item_for_iteration
					flatten_feature (a_named_feature)
					a_feature := a_named_feature.flattened_feature
					l_procedure ?= a_feature
					if l_procedure /= Void then
						procedures.force_last (l_procedure)
					else
						l_query ?= a_feature
						if l_query /= Void then
							queries.force_last (l_query)
						end
					end
					named_features.back
				end
				nb := queries.count
				l_declared_query_count := current_class.queries.declared_count
				if l_declared_query_count > nb then
						-- Internal error: the number of queries declared in
						-- `current_class' should be less than or equal to the
						-- total number of queries in `current_class'.
					set_fatal_error (current_class)
					error_handler.report_giaaa_error
					l_declared_query_count := nb
				end
				if l_declared_query_count < nb then
						-- Sort inherited queries by decreasing first seed values.
					query_sorter.subsort (queries, 1, nb - l_declared_query_count)
				end
				create l_queries.make_with_capacity (nb)
				from i := 1 until i > nb loop
					l_queries.put_first (queries.item (i))
					i := i + 1
				end
				l_queries.set_declared_count (l_declared_query_count)
				current_class.set_queries (l_queries)
				queries.wipe_out
				nb := procedures.count
				l_declared_procedure_count := current_class.procedures.declared_count
				if l_declared_procedure_count > nb then
						-- Internal error: the number of procedures declared in
						-- `current_class' should be less than or equal to the
						-- total number of procedures in `current_class'.
					set_fatal_error (current_class)
					error_handler.report_giaaa_error
					l_declared_procedure_count := nb
				end
				if l_declared_procedure_count < nb then
						-- Sort inherited procedures by decreasing first seed values.
					procedure_sorter.subsort (procedures, 1, nb - l_declared_procedure_count)
				end
				create l_procedures.make_with_capacity (nb)
				from i := 1 until i > nb loop
					l_procedures.put_first (procedures.item (i))
					i := i + 1
				end
				l_procedures.set_declared_count (l_declared_procedure_count)
				current_class.set_procedures (l_procedures)
				procedures.wipe_out
				nb := l_declared_query_count
				from i := 1 until i > nb loop
					l_query := l_queries.item (i)
						-- Resolve identifier types and check argument
						-- names in signature of features written in
						-- `current_class'. Those features inherited
						-- without being redeclared in `current_class'
						-- have already had their signature resolved
						-- when processing the parents of `current_class'.
					resolve_identifier_signature (l_query)
					if l_query.is_deferred and then l_query.is_frozen then
							-- A feature cannot be both deferred and frozen.
						set_fatal_error (current_class)
						error_handler.report_vffd4a_error (current_class, l_query)
					end
						-- Check validity of 'infix "..."', 'prefix "..."'
						-- and 'alias "..."' names.
					l_feature_name := l_query.name
					if l_feature_name.is_prefix then
						if not l_query.is_prefixable then
								-- A feature with a Prefix name should be either
								-- an attribute or a function with no argument.
							set_fatal_error (current_class)
							error_handler.report_vffd5a_error (current_class, l_query)
						end
					elseif l_feature_name.is_infix then
						if not l_query.is_infixable then
								-- A feature with a Infix name should be 
								-- a function with exactly one argument.
							set_fatal_error (current_class)
							error_handler.report_vffd6a_error (current_class, l_query)
						end
					else
						l_alias_name := l_query.alias_name
						if l_alias_name /= Void then
							if l_alias_name.is_bracket then
								if not l_query.is_bracketable then
										-- A feature with a Bracket alias should be 
										-- a function with one or more argument.
									set_fatal_error (current_class)
									error_handler.report_vfav2a_error (current_class, l_query)
								end
							elseif l_query.is_prefixable then
								if l_alias_name.is_prefixable then
									l_alias_name.set_prefix
								else
										-- A feature with a binary Operator alias should be 
										-- a function with exactly one argument.
									set_fatal_error (current_class)
									error_handler.report_vfav1a_error (current_class, l_query)
								end
							elseif l_query.is_infixable then
								if l_alias_name.is_infixable then
									l_alias_name.set_infix
								else
										-- A feature with a unary Operator alias should be 
										-- a query with no argument.
									set_fatal_error (current_class)
									error_handler.report_vfav1b_error (current_class, l_query)
								end
							elseif l_alias_name.is_infix then
									-- A feature with a binary Operator alias should be 
									-- a function with exactly one argument.
								set_fatal_error (current_class)
								error_handler.report_vfav1a_error (current_class, l_query)
							else
								check is_prefix: l_alias_name.is_prefix end
									-- A feature with a unary Operator alias should be 
									-- a query with no argument.
								set_fatal_error (current_class)
								error_handler.report_vfav1b_error (current_class, l_query)
							end
						end
					end
					if l_query.is_once then
						a_type := l_query.type
							-- The type of a once function should not contain
							-- a formal generic parameter or an anchored type.
						if a_type.has_anchored_type (current_class, universe) then
							set_fatal_error (current_class)
							error_handler.report_vffd7a_error (current_class, l_query)
						elseif a_type.has_formal_types (current_class, universe) then
							set_fatal_error (current_class)
							error_handler.report_vffd7b_error (current_class, l_query)
						end
					end
					i := i + 1
				end
				nb := l_declared_procedure_count
				from i := 1 until i > nb loop
					l_procedure := l_procedures.item (i)
						-- Resolve identifier types and check argument
						-- names in signature of features written in
						-- `current_class'. Those features inherited
						-- without being redeclared in `current_class'
						-- have already had their signature resolved
						-- when processing the parents of `current_class'.
					resolve_identifier_signature (l_procedure)
					if l_procedure.is_deferred and then l_procedure.is_frozen then
							-- A feature cannot be both deferred and frozen.
						set_fatal_error (current_class)
						error_handler.report_vffd4a_error (current_class, l_procedure)
					end
						-- Check validity of 'infix "..."', 'prefix "..."'
						-- and 'alias "..."' names.
					l_feature_name := l_procedure.name
					if l_feature_name.is_prefix then
							-- A feature with a Prefix name should be either
							-- an attribute or a function with no argument.
						set_fatal_error (current_class)
						error_handler.report_vffd5a_error (current_class, l_procedure)
					elseif l_feature_name.is_infix then
							-- A feature with a Infix name should be 
							-- a function with exactly one argument.
						set_fatal_error (current_class)
						error_handler.report_vffd6a_error (current_class, l_procedure)
					else
						l_alias_name := l_procedure.alias_name
						if l_alias_name /= Void then
							if l_alias_name.is_bracket then
									-- A feature with a Bracket alias should be 
									-- a function with one or more argument.
								set_fatal_error (current_class)
								error_handler.report_vfav2a_error (current_class, l_procedure)
							elseif l_alias_name.is_infix then
									-- A feature with a binary Operator alias should be 
									-- a function with exactly one argument.
								set_fatal_error (current_class)
								error_handler.report_vfav1a_error (current_class, l_procedure)
							else
								check is_prefix: l_alias_name.is_prefix end
									-- A feature with a unary Operator alias should be 
									-- a query with no argument.
								set_fatal_error (current_class)
								error_handler.report_vfav1b_error (current_class, l_procedure)
							end
						end
					end
					i := i + 1
				end
				check_anchored_signatures
				from named_features.start until named_features.after loop
					a_named_feature := named_features.item_for_iteration
						-- Check that two features have not the same alias. Take into account
						-- the infix and prefix properties to differentiate two alias names.
						-- See VFAV-1 and VFAV-2, ECMA p.42.
					a_feature := a_named_feature.flattened_feature
					l_alias_name := a_feature.alias_name
					if l_alias_name /= Void then
						aliased_features.search (l_alias_name)
						if aliased_features.found then
							set_fatal_error (current_class)
							l_other_feature := aliased_features.found_item
							if l_other_feature.is_inherited then
								l_other_parent_feature := l_other_feature.inherited_feature.flattened_parent
								if a_named_feature.is_inherited then
										-- Both features are inherited with no redeclaration in current class.
									l_parent_feature := a_named_feature.inherited_feature.flattened_parent
									if l_alias_name.is_bracket then
										error_handler.report_vfav2d_error (current_class, l_parent_feature, l_other_parent_feature)
									elseif l_alias_name.is_prefix then
										error_handler.report_vfav1e_error (current_class, l_parent_feature, l_other_parent_feature)
									else
										error_handler.report_vfav1h_error (current_class, l_parent_feature, l_other_parent_feature)
									end
								else
										-- Only `l_other_feature' is inherited with no redeclaration in current class.
									if l_alias_name.is_bracket then
										error_handler.report_vfav2c_error (current_class, a_feature, l_other_parent_feature)
									elseif l_alias_name.is_prefix then
										error_handler.report_vfav1d_error (current_class, a_feature, l_other_parent_feature)
									else
										error_handler.report_vfav1g_error (current_class, a_feature, l_other_parent_feature)
									end
								end
							elseif a_named_feature.is_inherited then
									-- Only `a_named_feature' is inherited with no redeclaration in current class.
								l_parent_feature := a_named_feature.inherited_feature.flattened_parent
								if l_alias_name.is_bracket then
									error_handler.report_vfav2c_error (current_class, l_other_feature.flattened_feature, l_parent_feature)
								elseif l_alias_name.is_prefix then
									error_handler.report_vfav1d_error (current_class, l_other_feature.flattened_feature, l_parent_feature)
								else
									error_handler.report_vfav1g_error (current_class, l_other_feature.flattened_feature, l_parent_feature)
								end
							else
									-- Both features are either immediate or redeclared in current class.
								if l_alias_name.is_bracket then
									error_handler.report_vfav2b_error (current_class, a_feature, l_other_feature.flattened_feature)
								elseif l_alias_name.is_prefix then
									error_handler.report_vfav1c_error (current_class, a_feature, l_other_feature.flattened_feature)
								else
									error_handler.report_vfav1f_error (current_class, a_feature, l_other_feature.flattened_feature)
								end
							end
						else
							aliased_features.force_last (a_named_feature, l_alias_name)
						end
					end
					if a_deferred_feature = Void then
						if a_feature.is_deferred then
							a_deferred_feature := a_named_feature
						end
					end
					check_signature_validity (a_named_feature)
					named_features.forth
				end
				aliased_features.wipe_out
				if a_deferred_feature /= Void then
					current_class.set_has_deferred_features (True)
					if not current_class.has_deferred_mark then
							-- `current_class' has deferred features
							-- but is not marked as deferred. This is
							-- not considered as a fatal error here.
							-- We just consider the class as deferred
							-- from now on.
						if a_deferred_feature.is_inherited then
								-- Try to find a deferred feature which is not inherited.
							from named_features.start until named_features.after loop
								a_named_feature := named_features.item_for_iteration
								if a_named_feature.flattened_feature.is_deferred and not a_named_feature.is_inherited then
									a_deferred_feature := a_named_feature
									named_features.go_after
								else
									named_features.forth
								end
							end
						end
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
			named_features.wipe_out
		ensure
			named_features_wiped_out: named_features.is_empty
			aliased_features_wiped_out: aliased_features.is_empty
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
			l_alias_name: ET_ALIAS_NAME
			l_parent_alias_name: ET_ALIAS_NAME
			l_feature_found: BOOLEAN
			l_duplicated: BOOLEAN
			l_clients: ET_CLASS_NAME_LIST
			nb_precursors: INTEGER
			l_precursor: ET_FEATURE
			l_first_precursor: ET_FEATURE
			l_other_precursors: ET_FEATURE_LIST
			l_found: BOOLEAN
			i, nb: INTEGER
			l_extended_name: ET_EXTENDED_FEATURE_NAME
			l_identifier: ET_IDENTIFIER
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
			if l_parent_feature.has_undefine then
				l_extended_name := l_parent_feature.undefine_name
				l_alias_name := l_parent_feature.alias_name
				if l_alias_name /= Void then
					l_identifier ?= l_parent_feature.undefine_name
					if l_identifier /= Void then
						create {ET_ALIASED_FEATURE_NAME} l_extended_name.make (l_identifier, l_alias_name)
					end
				end
				l_flattened_feature := l_flattened_feature.undefined_feature (l_extended_name)
				l_flattened_feature.reset_preconditions
				l_flattened_feature.reset_postconditions
				l_flattened_feature.set_implementation_feature (l_flattened_feature)
				l_flattened_feature.set_implementation_class (current_class)
				l_flattened_feature.set_first_precursor (l_first_precursor)
				l_flattened_feature.set_other_precursors (l_other_precursors)
				l_duplicated := True
			elseif l_duplication_needed or not l_feature_found then
				l_flattened_feature := l_flattened_feature.renamed_feature (l_parent_feature.extended_name)
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
				l_flattened_feature.resolve_inherited_signature (l_parent_feature.parent)
				l_flattened_feature.set_clients (l_clients)
				l_flattened_feature.set_first_seed (a_feature.first_seed)
				l_flattened_feature.set_other_seeds (a_feature.other_seeds)
			end
			a_feature.set_flattened_feature (l_flattened_feature)
			a_feature.set_flattened_parent (l_parent_feature)
				-- Check validity of alias name.
			if a_feature.parent_feature.merged_feature /= Void then
					-- Joining/Merging or Sharing.
				from
					l_parent_feature := a_feature.parent_feature
					l_alias_name := l_parent_feature.alias_name
					l_parent_feature := l_parent_feature.merged_feature
				until
					l_parent_feature = Void
				loop
					l_parent_alias_name := l_parent_feature.alias_name
					if l_alias_name = Void then
						if l_parent_alias_name /= Void then
							set_fatal_error (current_class)
							if l_other_precursors = Void then
									-- Sharing.
								error_handler.report_vmfn2a_error (current_class, l_parent_feature, a_feature.parent_feature)
							elseif l_flattened_feature.is_deferred then
									-- Joining/Merging.
								error_handler.report_vdjr2a_error (current_class, l_parent_feature, a_feature.parent_feature)
							end
						end
					elseif l_parent_alias_name = Void then
						set_fatal_error (current_class)
						if l_other_precursors = Void then
								-- Sharing.
							error_handler.report_vmfn2a_error (current_class, a_feature.parent_feature, l_parent_feature)
						else
								-- Joining/Merging.
							error_handler.report_vdjr2a_error (current_class, a_feature.parent_feature, l_parent_feature)
						end
					elseif not l_alias_name.same_alias_name (l_parent_alias_name) then
						set_fatal_error (current_class)
						if l_other_precursors = Void then
								-- Sharing.
							error_handler.report_vmfn2b_error (current_class, l_parent_feature, a_feature.parent_feature)
						else
								-- Joining/Merging
							error_handler.report_vdjr2b_error (current_class, l_parent_feature, a_feature.parent_feature)
						end
					end
					l_parent_feature := l_parent_feature.merged_feature
				end
			end
		end

feature {NONE} -- Replication

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
						l_other_seeds := l_other_seeds.cloned_object
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
			l_ise: BOOLEAN
			l_has_all: BOOLEAN
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			l_ise := universe.is_ise
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
					if l_ise then
							-- The ISE semantics follows what is described in ETL2:
							-- 'export {CLIENT} all' are not taken into account if
							-- the feature name appears in another export clause.
						from i := 1 until i > nb loop
							l_export := l_exports.item (i)
							if l_export.is_all then
								l_has_all := True
							else
								if l_export.has_feature_name (l_name) then
									clients_list.force_last (l_export.clients (l_name))
									l_overridden := True
								end
							end
							i := i + 1
						end
						if not l_overridden and l_has_all then
							from i := 1 until i > nb loop
								l_export := l_exports.item (i)
								if l_export.is_all then
									clients_list.force_last (l_export.clients (l_name))
									l_overridden := True
								end
								i := i + 1
							end
						end
					else
						from i := 1 until i > nb loop
							l_export := l_exports.item (i)
							if l_export.has_feature_name (l_name) then
								clients_list.force_last (l_export.clients (l_name))
								l_overridden := True
							end
							i := i + 1
						end
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
						if not Result.has_class_name (client_names.item_for_iteration) then
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
		local
			l_precursor_feature: ET_FEATURE
			l_parent_alias_name: ET_ALIAS_NAME
			l_alias_name: ET_ALIAS_NAME
		do
			check_rename_clause_validity (a_parent_feature)
			check_undefine_clause_validity (a_parent_feature)
			check_redefine_clause_validity (a_parent_feature)
				-- Check VDRD-7, ECMA p.68.
			l_alias_name := a_redeclared_feature.alias_name
			l_parent_alias_name := a_parent_feature.alias_name
			if l_alias_name = Void then
				if l_parent_alias_name /= Void then
					set_fatal_error (current_class)
					error_handler.report_vdrd7b_error (current_class, a_parent_feature, a_redeclared_feature)
				end
			elseif l_parent_alias_name = Void then
				set_fatal_error (current_class)
				error_handler.report_vdrd7a_error (current_class, a_parent_feature, a_redeclared_feature)
			elseif not l_alias_name.same_alias_name (l_parent_alias_name) then
				set_fatal_error (current_class)
				error_handler.report_vdrd7c_error (current_class, a_parent_feature, a_redeclared_feature)
			end
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
			l_precursor_feature := a_parent_feature.precursor_feature
			if l_precursor_feature.is_attribute then
				if not a_redeclared_feature.is_attribute then
						-- An attribute can only be redeclared to another attribute.
					set_fatal_error (current_class)
					error_handler.report_vdrd6a_error (current_class, a_parent_feature, a_redeclared_feature)
				end
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
			l_extended_name: ET_EXTENDED_FEATURE_NAME
			l_name: ET_FEATURE_NAME
			l_alias_name: ET_ALIAS_NAME
		do
			if a_parent_feature.has_rename then
				l_precursor_feature := a_parent_feature.precursor_feature
				l_extended_name := a_parent_feature.new_name.new_name
				l_name := l_extended_name.feature_name
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
				else
					l_alias_name := l_extended_name.alias_name
					if l_alias_name /= Void then
							-- Check VHRC-4, ECMA p. 46.
						if l_alias_name.is_bracket then
							if not l_precursor_feature.is_bracketable then
									-- A feature with a Bracket alias should be 
									-- a function with one or more argument.
								set_fatal_error (current_class)
								error_handler.report_vhrc4b_error (current_class, a_parent_feature.parent, a_parent_feature.new_name, l_precursor_feature)
							end
						elseif l_precursor_feature.is_prefixable then
							if l_alias_name.is_prefixable then
								l_alias_name.set_prefix
							else
									-- A feature with a binary Operator alias should be 
									-- a function with exactly one argument.
								set_fatal_error (current_class)
								error_handler.report_vhrc4c_error (current_class, a_parent_feature.parent, a_parent_feature.new_name, l_precursor_feature)
							end
						elseif l_precursor_feature.is_infixable then
							if l_alias_name.is_infixable then
								l_alias_name.set_infix
							else
									-- A feature with a unary Operator alias should be 
									-- a query with no argument.
								set_fatal_error (current_class)
								error_handler.report_vhrc4d_error (current_class, a_parent_feature.parent, a_parent_feature.new_name, l_precursor_feature)
							end
						elseif l_alias_name.is_infix then
								-- A feature with a binary Operator alias should be 
								-- a function with exactly one argument.
							set_fatal_error (current_class)
							error_handler.report_vhrc4c_error (current_class, a_parent_feature.parent, a_parent_feature.new_name, l_precursor_feature)
						else
							check is_prefix: l_alias_name.is_prefix end
								-- A feature with a unary Operator alias should be 
								-- a query with no argument.
							set_fatal_error (current_class)
							error_handler.report_vhrc4d_error (current_class, a_parent_feature.parent, a_parent_feature.new_name, l_precursor_feature)
						end
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
			if precursor_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	precursor_checker: ET_PRECURSOR_CHECKER
			-- Precursor validity checker

feature {NONE} -- Signature resolving

	resolve_identifier_signature (a_feature: ET_FEATURE) is
			-- Resolve identifier types (e.g. "like identifier"
			-- or "BIT identifier") in signature of `a_feature'
			-- in `current_class'.
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
					a_name.set_argument (True)
					a_name.set_seed (i)
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
		do
			anchored_type_checker.check_signatures (current_class)
		end

	anchored_type_checker: ET_ANCHORED_TYPE_CHECKER
			-- Anchored type checker

	check_signature_validity (a_feature: ET_FLATTENED_FEATURE) is
			-- Check signature validity for redeclarations and joinings.
		require
			a_feature_not_void: a_feature /= Void
		do
			signature_checker.check_signature_validity (a_feature, current_class)
			if signature_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	signature_checker: ET_SIGNATURE_CHECKER
			-- Signature validity checker

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

feature {NONE} -- Constants

	query_sorter: DS_QUICK_SORTER [ET_QUERY] is
			-- Query sorter by increasing first seed values
		local
			l_comparator: ET_SEEDED_QUERY_COMPARATOR
		once
			create l_comparator.make
			create Result.make (l_comparator)
		ensure
			query_sorter_not_void: Result /= Void
		end

	procedure_sorter: DS_QUICK_SORTER [ET_PROCEDURE] is
			-- Procedure sorter by increasing first seed values
		local
			l_comparator: ET_SEEDED_PROCEDURE_COMPARATOR
		once
			create l_comparator.make
			create Result.make (l_comparator)
		ensure
			procedure_sorter_not_void: Result /= Void
		end

invariant

	named_features_not_void: named_features /= Void
	no_void_named_feature: not named_features.has_item (Void)
	aliased_features_not_void: aliased_features /= Void
	no_void_aliased_feature: not aliased_features.has_item (Void)
	queries_not_void: queries /= Void
	no_void_query_not_void: not queries.has (Void)
	procedures_not_void: procedures /= Void
	no_void_procedure_not_void: not procedures.has (Void)
	clients_list_not_void: clients_list /= Void
	not_void_clients: not clients_list.has (Void)
	client_names_not_void: client_names /= Void
	no_void_client_name: not client_names.has (Void)
	feature_adaptation_resolver_not_void: feature_adaptation_resolver /= Void
	identifier_type_resolver_not_void: identifier_type_resolver /= Void
	anchored_type_checker_not_void: anchored_type_checker /= Void
	signature_checker_not_void: signature_checker /= Void
	parent_checker_not_void: parent_checker /= Void
	formal_parameter_checker_not_void: formal_parameter_checker /= Void
	precursor_checker_not_void: precursor_checker /= Void

end
