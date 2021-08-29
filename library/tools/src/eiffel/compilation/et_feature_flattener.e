note

	description:

		"Eiffel class feature flatteners"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_FLATTENER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_class
		end

	ET_SHARED_FEATURE_NAME_TESTER
		export {NONE} all end

	ET_SHARED_ALIAS_NAME_TESTER
		export {NONE} all end

	ET_SHARED_CLASS_NAME_TESTER
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new feature flattener for given classes.
		do
			precursor (a_system_processor)
			create named_features.make_map (400)
			named_features.set_key_equality_tester (feature_name_tester)
			create queries.make (400)
			create procedures.make (400)
			create aliased_features.make_map (50)
			aliased_features.set_key_equality_tester (alias_name_tester)
			create clients_list.make (20)
			create client_classes.make_map (20)
			create feature_adaptation_resolver.make (a_system_processor)
			create dotnet_feature_adaptation_resolver.make (a_system_processor)
			create identifier_type_resolver.make (a_system_processor)
			create unfolded_tuple_actual_parameters_resolver.make (a_system_processor)
			create anchored_type_checker.make (a_system_processor)
			create signature_checker.make (a_system_processor)
			create parent_checker.make (a_system_processor)
			create formal_parameter_checker.make (a_system_processor)
			create builtin_feature_checker.make (a_system_processor)
			create precursor_checker.make (a_system_processor)
			create precursors.make_map (20)
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS)
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.set_flattening_error
		ensure
			features_flattened: a_class.features_flattened
			has_flattening_error: a_class.has_flattening_error
		end

feature -- Processing

	process_class (a_class: ET_CLASS)
			-- Build ancestors of `a_class' if not already done.
			-- Then run second pass of the formal generic parameters
			-- validity check of `a_class', and the second pass of
			-- the parent validity check. And finally, flatten the
			-- feature table of `a_class'.
		local
			a_processor: like Current
		do
			if a_class.is_none then
				a_class.set_features_flattened
			elseif not current_class.is_unknown then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaaa_error
				create a_processor.make (system_processor)
				a_processor.process_class (a_class)
			elseif a_class.is_unknown then
				set_fatal_error (a_class)
				error_handler.report_giaaa_error
			elseif not a_class.is_preparsed then
				set_fatal_error (a_class)
			else
				internal_process_class (a_class)
			end
		ensure then
			features_flattened: a_class.features_flattened
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS)
			-- Build ancestors of `a_class' if not already done.
			-- Then run second pass of the formal generic parameters
			-- validity check of `a_class', and the second pass of
			-- the parent validity check. And finally, flatten the
			-- feature table of `a_class'.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
			a_parent_class: ET_CLASS
			i1, nb1: INTEGER
			i2, nb2: INTEGER
			l_parent_clause: ET_PARENT_LIST
		do
			old_class := current_class
			current_class := a_class
			if not current_class.features_flattened then
					-- Build ancestors of `current_class' if not already done.
				current_class.process (system_processor.ancestor_builder)
				if current_class.ancestors_built_successfully then
					current_class.set_features_flattened
						-- Process parents first.
					nb1 := current_class.parents_count
					from i1 := 1 until i1 > nb1 loop
						l_parent_clause := current_class.parents (i1)
						nb2 := l_parent_clause.count
						from i2 := 1 until i2 > nb2 loop
							a_parent_class := l_parent_clause.parent (i2).type.base_class
							if not a_parent_class.is_preparsed then
									-- Internal error: the VTCT error should have already been
									-- reported in ET_ANCESTOR_BUILDER.
								set_fatal_error (current_class)
								error_handler.report_giaaa_error
							else
									-- This is a controlled recursive call to `internal_process_class'.
								internal_process_class (a_parent_class)
								if a_parent_class.has_flattening_error then
									set_fatal_error (current_class)
								end
							end
							i2 := i2 + 1
						end
						i1 := i1 + 1
					end
					if not current_class.has_flattening_error then
						error_handler.report_compilation_status (Current, current_class, system_processor)
							-- Check validity rules of the parents and of formal
							-- generic parameters of `current_class'.
						if not current_class.is_dotnet then
								-- No need to check validity of .NET classes.
							check_formal_parameters_validity
							check_parents_validity
						end
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

feature {NONE} -- Features

	named_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]
			-- Features indexed by name

	aliased_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_ALIAS_NAME]
			-- Features indexed by alias name

	queries: DS_ARRAYED_LIST [ET_QUERY]
			-- Queries

	procedures: DS_ARRAYED_LIST [ET_PROCEDURE]
			-- Procedures

	precursors: DS_HASH_TABLE [ET_FEATURE, INTEGER]
			-- Precursor features (when inheriting without explicit redeclaration), indexed by version

feature {NONE} -- Feature adaptation

	feature_adaptation_resolver: ET_FEATURE_ADAPTATION_RESOLVER
			-- Feature adaptation resolver

	dotnet_feature_adaptation_resolver: ET_DOTNET_FEATURE_ADAPTATION_RESOLVER
			-- Feature adaptation resolver for .NET classes

	resolve_feature_adaptations
			-- Resolve the feature adaptations of the inheritance clause of
			-- `current_class' and put resulting features in `named_features'.
		do
			if current_class.is_dotnet then
				dotnet_feature_adaptation_resolver.resolve_feature_adaptations (current_class, named_features)
				if dotnet_feature_adaptation_resolver.has_fatal_error then
					set_fatal_error (current_class)
				end
			else
				feature_adaptation_resolver.resolve_feature_adaptations (current_class, named_features)
				if feature_adaptation_resolver.has_fatal_error then
					set_fatal_error (current_class)
				end
			end
		end

feature {NONE} -- Feature flattening

	flatten_features
			-- Flatten inherited features into `current_class'.
		local
			a_named_feature: ET_FLATTENED_FEATURE
			a_feature: ET_FEATURE
			a_deferred_feature: detachable ET_FLATTENED_FEATURE
			i, nb: INTEGER
			a_type: ET_TYPE
			l_feature_name: ET_FEATURE_NAME
			l_other_feature: ET_FLATTENED_FEATURE
			l_other_alias_name: ET_ALIAS_NAME
			l_parent_feature: ET_PARENT_FEATURE
			l_other_parent_feature: ET_PARENT_FEATURE
			l_queries: ET_QUERY_LIST
			l_procedures: ET_PROCEDURE_LIST
			l_declared_query_count: INTEGER
			l_declared_procedure_count: INTEGER
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_alias_name: ET_ALIAS_NAME
			l_alias_names: detachable ET_ALIAS_NAME_LIST
			j, l_alias_names_count: INTEGER
		do
			has_signature_error := False
			resolve_feature_adaptations
			if not current_class.has_flattening_error then
				nb := named_features.count
				from named_features.finish until named_features.before loop
					a_named_feature := named_features.item_for_iteration
					flatten_feature (a_named_feature)
					a_feature := a_named_feature.flattened_feature
					if attached {ET_PROCEDURE} a_feature as l_flattened_procedure then
						procedures.force_last (l_flattened_procedure)
					elseif attached {ET_QUERY} a_feature as l_flattened_query then
						queries.force_last (l_flattened_query)
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
					check_signature_vtct_validity (l_query)
					resolve_signature_unfolded_tuple_actual_parameters (l_query)
					if l_query.is_deferred and then l_query.is_frozen then
							-- A feature cannot be both deferred and frozen.
						set_fatal_error (current_class)
						error_handler.report_vffd4a_error (current_class, l_query)
					end
						-- Check validity of 'alias "..."' names.
					l_feature_name := l_query.name
					l_alias_names := l_query.alias_names
					if l_alias_names /= Void then
						l_alias_names_count := l_alias_names.count
						from j := 1 until j > l_alias_names_count loop
							l_alias_name := l_alias_names.item (j)
							if l_alias_name.is_bracket then
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_query'.
									set_fatal_error (current_class)
									error_handler.report_vfav4a_error (current_class, l_query, l_alias_name)
								elseif not l_query.is_bracketable then
										-- A feature with a Bracket alias should be
										-- a function with one or more arguments.
									set_fatal_error (current_class)
									error_handler.report_vfav2a_error (current_class, l_query, l_alias_name)
								end
							elseif l_alias_name.is_parenthesis then
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_query'.
									set_fatal_error (current_class)
									error_handler.report_vfav4b_error (current_class, l_query, l_alias_name)
								elseif not l_query.is_parenthesisable then
										-- A feature with a Parenthesis alias should be
										-- a feature with one or more arguments.
									set_fatal_error (current_class)
									error_handler.report_vfav3a_error (current_class, l_query, l_alias_name)
								end
							elseif l_query.is_prefixable then
								if l_alias_name.is_prefixable then
									l_alias_name.set_prefix
								end
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_query'.
									set_fatal_error (current_class)
									error_handler.report_vfav4c_error (current_class, l_query, l_alias_name)
								elseif not l_alias_name.is_prefixable then
										-- A feature with a binary Operator alias should be
										-- a query with exactly one argument.
									set_fatal_error (current_class)
									error_handler.report_vfav1a_error (current_class, l_query, l_alias_name)
								end
							elseif l_query.is_infixable then
								if l_alias_name.is_infixable then
									l_alias_name.set_infix
								end
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_query'.
									set_fatal_error (current_class)
									error_handler.report_vfav4d_error (current_class, l_query, l_alias_name)
								elseif not l_alias_name.is_infixable then
										-- A feature with a unary Operator alias should be
										-- a query with no argument.
									set_fatal_error (current_class)
									error_handler.report_vfav1b_error (current_class, l_query, l_alias_name)
								end
							elseif l_alias_name.is_infixable and l_alias_name.is_prefixable then
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_query'.
									set_fatal_error (current_class)
									error_handler.report_vfav4d_error (current_class, l_query, l_alias_name)
								else
										-- A feature with an Operator alias which can be either unary
										-- or binary should be a query with no argument or exactly
										-- one argument.
									set_fatal_error (current_class)
									error_handler.report_vfav1k_error (current_class, l_query, l_alias_name)
								end
							elseif l_alias_name.is_infix then
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_query'.
									set_fatal_error (current_class)
									error_handler.report_vfav4d_error (current_class, l_query, l_alias_name)
								else
										-- A feature with a binary Operator alias should be
										-- a query with exactly one argument.
									set_fatal_error (current_class)
									error_handler.report_vfav1a_error (current_class, l_query, l_alias_name)
								end
							elseif l_alias_name.is_prefix then
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_query'.
									set_fatal_error (current_class)
									error_handler.report_vfav4c_error (current_class, l_query, l_alias_name)
								else
										-- A feature with a unary Operator alias should be
										-- a query with no argument.
									set_fatal_error (current_class)
									error_handler.report_vfav1b_error (current_class, l_query, l_alias_name)
								end
							else
									-- Internal error: no other kind of alias name.
								set_fatal_error (current_class)
								error_handler.report_giaaa_error
							end
							if l_alias_name.convert_keyword /= Void and then not l_alias_name.is_infix then
									-- When the 'convert' mark is specified, the alias
									-- should be a binary operator alias.
								set_fatal_error (current_class)
								error_handler.report_vfav5a_error (current_class, l_alias_name)
							end
							j := j + 1
						end
					end
					if l_query.is_once and then not l_query.is_once_per_object then
						a_type := l_query.type
							-- The type of a once function should not contain
							-- a formal generic parameter or an anchored type.
						if a_type.has_unqualified_anchored_type then
							set_fatal_error (current_class)
							error_handler.report_vffd7a_error (current_class, l_query)
						elseif a_type.has_formal_types (current_class) then
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
					check_signature_vtct_validity (l_procedure)
					resolve_signature_unfolded_tuple_actual_parameters (l_procedure)
					if l_procedure.is_deferred and then l_procedure.is_frozen then
							-- A feature cannot be both deferred and frozen.
						set_fatal_error (current_class)
						error_handler.report_vffd4a_error (current_class, l_procedure)
					end
						-- Check validity of 'alias "..."' names.
					l_feature_name := l_procedure.name
					l_alias_names := l_procedure.alias_names
					if l_alias_names /= Void then
						l_alias_names_count := l_alias_names.count
						from j := 1 until j > l_alias_names_count loop
							l_alias_name := l_alias_names.item (j)
							if l_alias_name.is_bracket then
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_procedure'.
									set_fatal_error (current_class)
									error_handler.report_vfav4a_error (current_class, l_procedure, l_alias_name)
								else
										-- A feature with a Bracket alias should be
										-- a function with one or more arguments.
									set_fatal_error (current_class)
									error_handler.report_vfav2a_error (current_class, l_procedure, l_alias_name)
								end
							elseif l_alias_name.is_parenthesis then
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_procedure'.
									set_fatal_error (current_class)
									error_handler.report_vfav4b_error (current_class, l_procedure, l_alias_name)
								elseif not l_procedure.is_parenthesisable then
										-- A feature with a Parenthesis alias should be
										-- a feature with one or more arguments.
									set_fatal_error (current_class)
									error_handler.report_vfav3a_error (current_class, l_procedure, l_alias_name)
								end
							elseif l_alias_name.is_infixable and l_alias_name.is_prefixable then
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_procedure'.
									set_fatal_error (current_class)
									error_handler.report_vfav4d_error (current_class, l_procedure, l_alias_name)
								else
										-- A feature with an Operator alias which can be either unary
										-- or binary should be a query with no argument or exactly
										-- one argument.
									set_fatal_error (current_class)
									error_handler.report_vfav1k_error (current_class, l_procedure, l_alias_name)
								end
							elseif l_alias_name.is_infix then
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_procedure'.
									set_fatal_error (current_class)
									error_handler.report_vfav4d_error (current_class, l_procedure, l_alias_name)
								else
										-- A feature with a binary Operator alias should be
										-- a function with exactly one argument.
									set_fatal_error (current_class)
									error_handler.report_vfav1a_error (current_class, l_procedure, l_alias_name)
								end
							elseif l_alias_name.is_prefix then
								if l_alias_names.head_has_alias_name (l_alias_name, j - 1) then
										-- Alias name `l_alias_name' appears twice in the name of `l_procedure'.
									set_fatal_error (current_class)
									error_handler.report_vfav4c_error (current_class, l_procedure, l_alias_name)
								else
										-- A feature with a unary Operator alias should be
										-- a query with no argument.
									set_fatal_error (current_class)
									error_handler.report_vfav1b_error (current_class, l_procedure, l_alias_name)
								end
							else
									-- Internal error: no other kind of alias name.
								set_fatal_error (current_class)
								error_handler.report_giaaa_error
							end
							if l_alias_name.convert_keyword /= Void and then not l_alias_name.is_infix then
									-- When the 'convert' mark is specified, the alias
									-- should be a binary operator alias.
								set_fatal_error (current_class)
								error_handler.report_vfav5a_error (current_class, l_alias_name)
							end
							j := j + 1
						end
					end
					i := i + 1
				end
				check_anchored_signatures
				current_class.set_redeclared_signatures_checked (True)
				from named_features.start until named_features.after loop
					a_named_feature := named_features.item_for_iteration
						-- Check that two features have not the same alias. Take into account
						-- the infix and prefix properties to differentiate two alias names.
					a_feature := a_named_feature.flattened_feature
					l_alias_names := a_feature.alias_names
					if l_alias_names /= Void then
						l_alias_names_count := l_alias_names.count
						from j := 1 until j > l_alias_names_count loop
							l_alias_name := l_alias_names.item (j)
							aliased_features.search (l_alias_name)
							if aliased_features.found and then aliased_features.found_item /= a_named_feature then
								set_fatal_error (current_class)
								l_other_feature := aliased_features.found_item
								l_other_alias_name := aliased_features.found_key
								if l_other_feature.is_inherited then
									l_other_parent_feature := l_other_feature.inherited_feature.flattened_parent
									if a_named_feature.is_inherited then
											-- Both features are inherited with no redeclaration in current class.
										l_parent_feature := a_named_feature.inherited_feature.flattened_parent
										if l_alias_name.is_bracket then
											error_handler.report_vfav2d_error (current_class, l_parent_feature, l_alias_name, l_other_parent_feature, l_other_alias_name)
										elseif l_alias_name.is_parenthesis then
											error_handler.report_vfav3d_error (current_class, l_parent_feature, l_alias_name, l_other_parent_feature, l_other_alias_name)
										elseif l_alias_name.is_prefix then
											error_handler.report_vfav1e_error (current_class, l_parent_feature, l_alias_name, l_other_parent_feature, l_other_alias_name)
										elseif l_alias_name.is_infix then
											error_handler.report_vfav1h_error (current_class, l_parent_feature, l_alias_name, l_other_parent_feature, l_other_alias_name)
										else
												-- Internal error: no other kind of alias name.
											error_handler.report_giaaa_error
										end
									else
											-- Only `l_other_feature' is inherited with no redeclaration in current class.
										if l_alias_name.is_bracket then
											error_handler.report_vfav2c_error (current_class, a_feature, l_alias_name, l_other_parent_feature, l_other_alias_name)
										elseif l_alias_name.is_parenthesis then
											error_handler.report_vfav3c_error (current_class, a_feature, l_alias_name, l_other_parent_feature, l_other_alias_name)
										elseif l_alias_name.is_prefix then
											error_handler.report_vfav1d_error (current_class, a_feature, l_alias_name, l_other_parent_feature, l_other_alias_name)
										elseif l_alias_name.is_infix then
											error_handler.report_vfav1g_error (current_class, a_feature, l_alias_name, l_other_parent_feature, l_other_alias_name)
										else
												-- Internal error: no other kind of alias name.
											error_handler.report_giaaa_error
										end
									end
								elseif a_named_feature.is_inherited then
										-- Only `a_named_feature' is inherited with no redeclaration in current class.
									l_parent_feature := a_named_feature.inherited_feature.flattened_parent
									if l_alias_name.is_bracket then
										error_handler.report_vfav2c_error (current_class, l_other_feature.flattened_feature, l_other_alias_name, l_parent_feature, l_alias_name)
									elseif l_alias_name.is_parenthesis then
										error_handler.report_vfav3c_error (current_class, l_other_feature.flattened_feature, l_other_alias_name, l_parent_feature, l_alias_name)
									elseif l_alias_name.is_prefix then
										error_handler.report_vfav1d_error (current_class, l_other_feature.flattened_feature, l_other_alias_name, l_parent_feature, l_alias_name)
									elseif l_alias_name.is_infix then
										error_handler.report_vfav1g_error (current_class, l_other_feature.flattened_feature, l_other_alias_name, l_parent_feature, l_alias_name)
									else
											-- Internal error: no other kind of alias name.
										error_handler.report_giaaa_error
									end
								else
										-- Both features are either immediate or redeclared in current class.
									if l_alias_name.is_bracket then
										error_handler.report_vfav2b_error (current_class, a_feature, l_alias_name, l_other_feature.flattened_feature, l_other_alias_name)
									elseif l_alias_name.is_parenthesis then
										error_handler.report_vfav3b_error (current_class, a_feature, l_alias_name, l_other_feature.flattened_feature, l_other_alias_name)
									elseif l_alias_name.is_prefix then
										error_handler.report_vfav1c_error (current_class, a_feature, l_alias_name, l_other_feature.flattened_feature, l_other_alias_name)
									elseif l_alias_name.is_infix then
										error_handler.report_vfav1f_error (current_class, a_feature, l_alias_name, l_other_feature.flattened_feature, l_other_alias_name)
									else
											-- Internal error: no other kind of alias name.
										error_handler.report_giaaa_error
									end
								end
							end
							aliased_features.force_last_new (a_named_feature, l_alias_name)
							j := j + 1
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
				check_assigners_validity
				check_creators_validity
				check_convert_validity
				check_kernel_features_validity
			end
			named_features.wipe_out
		ensure
			named_features_wiped_out: named_features.is_empty
			aliased_features_wiped_out: aliased_features.is_empty
		end

feature {NONE} -- Feature processing

	flatten_feature (a_feature: ET_FLATTENED_FEATURE)
			-- Flatten `a_feature' and process its feature adaptation clause.
		require
			a_feature_not_void: a_feature /= Void
		local
			an_adapted_feature: ET_ADAPTED_FEATURE
		do
			if a_feature.is_immediate then
				flatten_immediate_feature (a_feature.immediate_feature)
			else
				if not current_class.is_dotnet then
					an_adapted_feature := a_feature.adapted_feature
					if attached an_adapted_feature.selected_feature as l_selected_feature and not an_adapted_feature.is_selected then
						check has_selected_feature: an_adapted_feature.has_selected_feature end
							-- This is not a fatal error for gelint.
						error_handler.report_vmss3a_error (current_class, l_selected_feature)
					end
				end
				if a_feature.is_redeclared then
					flatten_redeclared_feature (a_feature.redeclared_feature)
				elseif a_feature.is_inherited then
					flatten_inherited_feature (a_feature.inherited_feature)
				end
			end
		end

	flatten_immediate_feature (a_feature: ET_FEATURE)
			-- Flatten `a_feature' and process its feature adaptation clause.
			-- `a_feature' has been introduced in `current_class' (ETL2, p. 56).
		require
			a_feature_not_void: a_feature /= Void
		do
			if a_feature.implementation_class /= current_class then
-- TODO: error: this can happen when processing .NET features.
			else
				check_builtin_feature_validity (a_feature)
			end
		end

	flatten_redeclared_feature (a_feature: ET_REDECLARED_FEATURE)
			-- Flatten `a_feature' and process its feature adaptation clause.
			-- `a_feature' is an inherited feature which has been given a new
			-- declaration in `current_class'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_flattened_feature: ET_FEATURE
			l_parent_feature: detachable ET_PARENT_FEATURE
			l_has_redefine: BOOLEAN
			l_preconditions: detachable ET_PRECONDITIONS
			l_postconditions: detachable ET_POSTCONDITIONS
			nb_precursors: INTEGER
			l_precursor: ET_FEATURE
			l_first_precursor: detachable ET_FEATURE
			l_other_precursors: detachable ET_FEATURE_LIST
			l_found: BOOLEAN
			l_dotnet: BOOLEAN
			i, nb: INTEGER
		do
			l_flattened_feature := a_feature.flattened_feature
			check_builtin_feature_validity (l_flattened_feature)
			l_dotnet := (current_class.is_dotnet and then l_flattened_feature.is_dotnet)
			if l_dotnet then
				if
					l_flattened_feature.implementation_class /= current_class and then
					l_flattened_feature.implementation_feature = l_flattened_feature
				then
-- TODO: error
				end
			else
				if a_feature.is_replicated then
					process_replicated_seeds (a_feature, l_flattened_feature.id)
				end
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
				if not l_dotnet then
					check_redeclaration_validity (l_parent_feature, l_flattened_feature, l_has_redefine)
				end
				l_precursor := l_parent_feature.precursor_feature
				if l_first_precursor = Void then
					l_first_precursor := l_precursor
				elseif not l_precursor.same_version (l_first_precursor) then
					if l_other_precursors /= Void then
						from i := 1 until i > nb loop
							if l_precursor.same_version (l_other_precursors.item (i)) then
								l_found := True
								i := nb + 1
							else
								i := i + 1
							end
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
			l_flattened_feature.set_clients (redeclared_clients (a_feature))
			if not l_dotnet then
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
		end

	flatten_inherited_feature (a_feature: ET_INHERITED_FEATURE)
			-- Flatten `a_feature' and process its feature adaptation clause.
			-- `a_feature' is an inherited feature which has not been given
			-- a new declaration in `current_class'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_flattened_feature: ET_FEATURE
			l_parent_feature: detachable ET_PARENT_FEATURE
			l_effective, l_deferred: detachable ET_PARENT_FEATURE
			l_first_seed: INTEGER
			l_other_seeds: detachable ET_FEATURE_IDS
			l_keep_same_version: BOOLEAN
			l_duplication_needed: BOOLEAN
			l_alias_names: detachable ET_ALIAS_NAME_LIST
			l_parent_alias_names: detachable ET_ALIAS_NAME_LIST
			l_feature_found: BOOLEAN
			l_duplicated: BOOLEAN
			l_clients: ET_CLIENT_LIST
			l_precursor: ET_FEATURE
			l_first_precursor: ET_FEATURE
			l_other_precursors: detachable ET_FEATURE_LIST
			nb: INTEGER
			l_extended_name: ET_EXTENDED_FEATURE_NAME
			l_has_effective: BOOLEAN
		do
			l_clients := inherited_clients (a_feature)
			l_first_seed := a_feature.first_seed
			l_other_seeds := a_feature.other_seeds
			l_duplication_needed := a_feature.is_replicated
			l_keep_same_version := not a_feature.is_replicated
				-- Check Feature_adaptation clause.
			from
				l_parent_feature := a_feature.parent_feature
			until
				l_parent_feature = Void
			loop
				check_no_redeclaration_validity (l_parent_feature)
				l_precursor := l_parent_feature.precursor_feature
				precursors.force_last (l_precursor, l_precursor.version)
				if not l_parent_feature.is_deferred then
					l_has_effective := True
				end
				l_parent_feature := l_parent_feature.merged_feature
			end
			if precursors.count > 1 then
					-- Not sharing.
				l_duplication_needed := True
			end
			if l_has_effective then
				from
					l_parent_feature := a_feature.parent_feature
				until
					l_parent_feature = Void
				loop
					if not l_parent_feature.is_deferred then
						if l_effective /= Void and then not l_parent_feature.same_version (l_effective) then
								-- Error: two effective features which are not shared.
							set_fatal_error (current_class)
							error_handler.report_vmfn0c_error (current_class, l_effective, l_parent_feature)
						end
						if not l_feature_found then
							l_effective := l_parent_feature
							if l_duplication_needed then
								l_feature_found := True
							else
									-- Trying to choose one which would avoid duplication.
								if
									not l_effective.has_rename and then
									l_effective.first_seed = l_first_seed and then
									l_effective.other_seeds = l_other_seeds and then
									l_effective.clients.same_clients (l_clients)
								then
									l_feature_found := True
								end
							end
						end
					end
					l_parent_feature := l_parent_feature.merged_feature
				end
			else
				from
					l_parent_feature := a_feature.parent_feature
				until
					l_parent_feature = Void
				loop
					if not l_feature_found then
						l_deferred := l_parent_feature
						l_parent_feature := l_parent_feature.merged_feature
						if l_duplication_needed then
							if not l_deferred.has_undefine then
								l_feature_found := True
								l_parent_feature := Void
							end
						else
								-- Trying to choose one which would avoid duplication.
							if
								not l_deferred.has_rename and then
								not l_deferred.has_undefine and then
								l_deferred.first_seed = l_first_seed and then
								l_deferred.other_seeds = l_other_seeds and then
								l_deferred.clients.same_clients (l_clients)
							then
								l_feature_found := True
								l_parent_feature := Void
							end
						end
					end
				end
			end
			if l_effective /= Void then
				l_parent_feature := l_effective
				l_first_precursor := l_effective.precursor_feature
			elseif l_deferred /= Void then
				l_parent_feature := l_deferred
				l_first_precursor := l_deferred.precursor_feature
			else
					-- Internal error: at this stage either `l_effective' or `l_deferred'
					-- should be non-void.
				set_fatal_error (current_class)
				error_handler.report_giaaa_error
					-- Make the compiler happy in void-safe mode.
				l_parent_feature := a_feature.parent_feature
				l_first_precursor := l_parent_feature.precursor_feature
			end
				-- There is a caveat here with precursors. Only features with the
				-- same version are supposed to be able to be shared. But in the
				-- example below:
				--
				--   class A
				--   inherit
				--       ANY
				--       COMPARABLE
				--          undefine
				--              is_equal
				--          end
				--   feature
				--   ...
				--   end
				--
				--   class B
				--   inherit
				--       ANY
				--   feature
				--   ...
				--   end
				--
				--   class C
				--   inherit
				--      A
				--      B
				--   feature
				--   ...
				--   end
				--
				-- we want feature 'is_equal' from class A and B to be shared in
				-- class C before it is the same version from ANY. But the version
				-- of 'is_equal' from class A is not exactly the same version: it
				-- has extra postcondition inherited from COMPARABLE. This will
				-- cause problem (e.g. missing assertions) when we will traverse
				-- `first_precursor' and `other_precursors' from ET_FEATURE in order
				-- to determine the inherited assertions of a feature. On the other
				-- hand, should we decide that feature 'is_equal' from A and B
				-- are not the same version of the feature, then we would have a
				-- compilation error in class C! So the current implementation
				-- will miss assertions rather than erroneously reporting
				-- compilation errors.
			precursors.remove (l_first_precursor.version)
			nb := precursors.count
			if nb > 0 then
				create l_other_precursors.make_with_capacity (nb)
				from precursors.start until precursors.after loop
					l_other_precursors.put_first (precursors.item_for_iteration)
					precursors.forth
				end
				precursors.wipe_out
			end
			l_flattened_feature := l_parent_feature.precursor_feature
			if attached l_parent_feature.undefine_name as l_undefine_name then
				check has_undefine: l_parent_feature.has_undefine end
				l_extended_name := l_undefine_name
				l_alias_names := l_parent_feature.alias_names
				if l_alias_names /= Void and then not l_alias_names.is_empty then
					if attached {ET_IDENTIFIER} l_parent_feature.undefine_name as l_identifier then
						create {ET_ALIASED_FEATURE_NAME} l_extended_name.make (l_identifier, l_alias_names)
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
				current_class.register_feature (l_flattened_feature)
				if l_keep_same_version then
					l_flattened_feature.set_version (l_parent_feature.precursor_feature.version)
				else
					l_flattened_feature.set_version (l_flattened_feature.id)
					if a_feature.is_replicated then
						process_replicated_seeds (a_feature, l_flattened_feature.id)
					end
				end
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
					l_alias_names := l_parent_feature.alias_names
					l_parent_feature := l_parent_feature.merged_feature
				until
					l_parent_feature = Void
				loop
					l_parent_alias_names := l_parent_feature.alias_names
					if l_alias_names = Void or else l_alias_names.is_empty then
						if l_parent_alias_names /= Void and then not l_parent_alias_names.is_empty then
							set_fatal_error (current_class)
							if l_other_precursors = Void then
									-- Sharing.
								error_handler.report_vmfn2a_error (current_class, l_parent_feature, a_feature.parent_feature)
							elseif l_flattened_feature.is_deferred then
									-- Joining/Merging.
								error_handler.report_vdjr2a_error (current_class, l_parent_feature, a_feature.parent_feature)
							end
						end
					elseif l_parent_alias_names = Void or else l_parent_alias_names.is_empty then
						set_fatal_error (current_class)
						if l_other_precursors = Void then
								-- Sharing.
							error_handler.report_vmfn2a_error (current_class, a_feature.parent_feature, l_parent_feature)
						else
								-- Joining/Merging.
							error_handler.report_vdjr2a_error (current_class, a_feature.parent_feature, l_parent_feature)
						end
					elseif not l_alias_names.same_alias_names (l_parent_alias_names) then
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

	process_replicated_seeds (a_feature: ET_ADAPTED_FEATURE; a_new_seed: INTEGER)
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
			l_other_seeds: detachable ET_FEATURE_IDS
			l_replicated_seeds: detachable ET_FEATURE_IDS
			l_seeds_done: BOOLEAN
		do
				-- Remove replicated seeds and add the new seed.
			l_first_seed := a_feature.first_seed
			l_other_seeds := a_feature.other_seeds
			l_replicated_seeds := a_feature.replicated_seeds
			if l_replicated_seeds = Void then
				check
						-- See postcondition of `is_replicated' in class ET_FEATURE.
					is_replicated: False
				end
			elseif l_other_seeds /= Void then
				nb := l_replicated_seeds.count
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
				if l_other_seeds /= Void and not l_seeds_done then
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

	clients_list: DS_ARRAYED_LIST [ET_CLIENT_LIST]
			-- List of client clauses

	client_classes: DS_HASH_TABLE [ET_CLIENT, ET_CLASS]
			-- Clients indexed by classes

	inherited_clients (a_feature: ET_INHERITED_FEATURE): ET_CLIENT_LIST
			-- Clients inherited by the non-redeclared feature `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			add_inherited_clients_to_list (a_feature, clients_list)
			Result := aggregated_clients (clients_list)
			clients_list.wipe_out
		ensure
			inherited_clients_not_void: Result /= Void
		end

	redeclared_clients (a_feature: ET_REDECLARED_FEATURE): ET_CLIENT_LIST
			-- Clients of redeclared feature `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			clients_list.force_last (a_feature.flattened_feature.clients)
			add_inherited_clients_to_list (a_feature, clients_list)
			Result := aggregated_clients (clients_list)
			clients_list.wipe_out
		ensure
			redeclared_clients_not_void: Result /= Void
		end

	add_inherited_clients_to_list (a_feature: ET_ADAPTED_FEATURE; a_list: DS_ARRAYED_LIST [ET_CLIENT_LIST])
			-- Add to `a_list' the clients inherited by feature `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			a_list_not_void: a_list /= Void
			no_void_client_list: not a_list.has_void
		local
			l_parent_feature: detachable ET_PARENT_FEATURE
			l_parent: ET_PARENT
			l_export: ET_EXPORT
			l_name: ET_FEATURE_NAME
			l_ise: BOOLEAN
			l_has_all: BOOLEAN
			l_has_feature_name: BOOLEAN
			i, nb: INTEGER
		do
			l_ise := system_processor.is_ise
			from
				l_parent_feature := a_feature.parent_feature
			until
				l_parent_feature = Void
			loop
				clients_list.force_last (l_parent_feature.precursor_feature.clients)
				l_name := l_parent_feature.name
				l_parent := l_parent_feature.parent
				if attached l_parent.exports as l_exports then
					nb := l_exports.count
					if l_ise then
							-- The ISE semantics follows what is described in ETL2:
							-- 'export {CLIENT} all' are not taken into account if
							-- the feature name appears in another export clause.
						l_has_feature_name := False
						l_has_all := False
						from i := 1 until i > nb loop
							l_export := l_exports.item (i)
							if l_export.is_all then
								l_has_all := True
							else
								if l_export.has_feature_name (l_name) then
									clients_list.force_last (l_export.clients (l_name))
									l_has_feature_name := True
								end
							end
							i := i + 1
						end
						if not l_has_feature_name and l_has_all then
							from i := 1 until i > nb loop
								l_export := l_exports.item (i)
								if l_export.is_all then
									clients_list.force_last (l_export.clients (l_name))
								end
								i := i + 1
							end
						end
					else
						from i := 1 until i > nb loop
							l_export := l_exports.item (i)
							if l_export.has_feature_name (l_name) then
								clients_list.force_last (l_export.clients (l_name))
							end
							i := i + 1
						end
					end
				end
				l_parent_feature := l_parent_feature.merged_feature
			end
		ensure
			a_list_not_empty: not a_list.is_empty
			no_void_client_list: not a_list.has_void
		end

	aggregated_clients (a_list: DS_ARRAYED_LIST [ET_CLIENT_LIST]): ET_CLIENT_LIST
			-- Client list made up of all classes contained in `a_list'
		require
			a_list_not_void: a_list /= Void
			a_list_not_empty: not a_list.is_empty
			no_void_client_list: not a_list.has_void
		local
			l_clients: ET_CLIENT_LIST
			l_client: ET_CLIENT
			i, nb: INTEGER
			j, nb2: INTEGER
			l_nb_not_none: INTEGER
			l_largest_clients: detachable ET_CLIENT_LIST
		do
			nb := a_list.count
			if nb = 1 then
				Result := a_list.first
			else
				from i := 1 until i > nb loop
					l_clients := a_list.item (i)
					if not l_clients.is_none then
						l_nb_not_none := l_nb_not_none + 1
						nb2 := l_clients.count
						from j := 1 until j > nb2 loop
							l_client := l_clients.client (j)
							client_classes.force (l_client, l_client.base_class)
							j := j + 1
						end
							-- Find the largest client clause.
						if l_largest_clients = Void or else l_largest_clients.count < nb2 then
							l_largest_clients := l_clients
						end
					end
					i := i + 1
				end
				if l_largest_clients = Void then
						-- "{NONE}"
					Result := a_list.first
				elseif l_nb_not_none = 1 then
					Result := l_largest_clients
				elseif l_largest_clients.count >= client_classes.count and then client_classes.keys.for_all (agent l_largest_clients.has_class) then
						-- The largest client clause contains all client classes.
					Result := l_largest_clients
				else
					create Result.make_with_capacity (client_classes.count)
					from client_classes.finish until client_classes.before loop
						Result.put_first (client_classes.item_for_iteration)
						client_classes.back
					end
				end
				client_classes.wipe_out
			end
		ensure
			aggregated_clients_not_void: Result /= Void
		end

feature {NONE} -- Feature adaptation validity

	check_redeclaration_validity (a_parent_feature: ET_PARENT_FEATURE;
		a_redeclared_feature: ET_FEATURE; has_redefine: BOOLEAN)
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
			l_parent_alias_names: detachable ET_ALIAS_NAME_LIST
			l_alias_names: detachable ET_ALIAS_NAME_LIST
		do
			check_rename_clause_validity (a_parent_feature)
			check_undefine_clause_validity (a_parent_feature)
			check_redefine_clause_validity (a_parent_feature)
				-- Check VDRD-7, ECMA p.68.
			l_alias_names := a_redeclared_feature.alias_names
			l_parent_alias_names := a_parent_feature.alias_names
			if l_alias_names = Void or else l_alias_names.is_empty then
				if l_parent_alias_names /= Void and then not l_parent_alias_names.is_empty then
					set_fatal_error (current_class)
					error_handler.report_vdrd7b_error (current_class, a_parent_feature, a_redeclared_feature)
				end
			elseif l_parent_alias_names = Void or else l_parent_alias_names.is_empty then
				set_fatal_error (current_class)
				error_handler.report_vdrd7a_error (current_class, a_parent_feature, a_redeclared_feature)
			elseif not l_alias_names.same_alias_names (l_parent_alias_names) then
				set_fatal_error (current_class)
				error_handler.report_vdrd7c_error (current_class, a_parent_feature, a_redeclared_feature)
			end
			if a_parent_feature.has_redefine then
				if a_redeclared_feature.is_deferred /= a_parent_feature.is_deferred then
					if a_redeclared_feature.is_deferred then
						if not a_parent_feature.has_other_deferred then
								-- Error: Used 'redefine' instead of 'undefine'.
								-- Need to use 'undefine' to redeclare an
								-- effective feature to a deferred feature.
								-- (Not considered as a fatal error by gelint.)
							error_handler.report_vdrd5a_error (current_class, a_parent_feature, a_redeclared_feature)
						end
					else
						if not a_parent_feature.has_other_effective then
								-- Error: No need to 'redefine' to redeclare
								-- a deferred feature to an effective feature.
								-- (Not considered as a fatal error by gelint.)
							if not system_processor.older_ise_version (ise_19_01_0) then
									-- ISE Eiffel did not report this error before 19.01.
								error_handler.report_vdrs4b_error (current_class, a_parent_feature, a_redeclared_feature)
							end
						end
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

	check_no_redeclaration_validity (a_parent_feature: ET_PARENT_FEATURE)
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

	check_rename_clause_validity (a_parent_feature: ET_PARENT_FEATURE)
			-- Check validity of rename clause for `a_parent_feature'.
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		local
			l_precursor_feature: ET_FEATURE
			l_extended_name: ET_EXTENDED_FEATURE_NAME
			l_name: ET_FEATURE_NAME
			l_alias_names: detachable ET_ALIAS_NAME_LIST
			l_alias_name: ET_ALIAS_NAME
			i, nb: INTEGER
		do
			if attached a_parent_feature.new_name as l_new_name then
				check has_rename: a_parent_feature.has_rename end
				l_precursor_feature := a_parent_feature.precursor_feature
				l_extended_name := l_new_name.new_name
				l_name := l_extended_name.feature_name
				l_alias_names := l_extended_name.alias_names
				if l_alias_names /= Void then
					nb := l_alias_names.count
					from i := 1 until i > nb loop
						l_alias_name := l_alias_names.item (i)
						if l_alias_name.is_bracket then
							if l_alias_names.head_has_alias_name (l_alias_name, i - 1) then
									-- Alias name `l_alias_name' appears twice on the
									-- right-hand-side of the rename pair `l_new_name'.
								set_fatal_error (current_class)
								error_handler.report_vfav4e_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name)
							elseif not l_precursor_feature.is_bracketable then
									-- A feature with a Bracket alias should be
									-- a function with one or more arguments.
								set_fatal_error (current_class)
								error_handler.report_vfav2e_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name, l_precursor_feature)
							end
						elseif l_alias_name.is_parenthesis then
							if l_alias_names.head_has_alias_name (l_alias_name, i - 1) then
									-- Alias name `l_alias_name' appears twice on the
									-- right-hand-side of the rename pair `l_new_name'.
								set_fatal_error (current_class)
								error_handler.report_vfav4f_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name)
							elseif not l_precursor_feature.is_parenthesisable then
									-- A feature with a Parenthesis alias should be
									-- a function with one or more arguments.
								set_fatal_error (current_class)
								error_handler.report_vfav3e_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name, l_precursor_feature)
							end
						elseif l_precursor_feature.is_prefixable then
							if l_alias_name.is_prefixable then
								l_alias_name.set_prefix
							end
							if l_alias_names.head_has_alias_name (l_alias_name, i - 1) then
									-- Alias name `l_alias_name' appears twice on the
									-- right-hand-side of the rename pair `l_new_name'.
								set_fatal_error (current_class)
								error_handler.report_vfav4g_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name)
							elseif not l_alias_name.is_prefixable then
									-- A feature with a binary Operator alias should be
									-- a function with exactly one argument.
								set_fatal_error (current_class)
								error_handler.report_vfav1m_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name, l_precursor_feature)
							end
						elseif l_precursor_feature.is_infixable then
							if l_alias_name.is_infixable then
								l_alias_name.set_infix
							end
							if l_alias_names.head_has_alias_name (l_alias_name, i - 1) then
									-- Alias name `l_alias_name' appears twice on the
									-- right-hand-side of the rename pair `l_new_name'.
								set_fatal_error (current_class)
								error_handler.report_vfav4h_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name)
							elseif not l_alias_name.is_infixable then
									-- A feature with a unary Operator alias should be
									-- a query with no argument.
								set_fatal_error (current_class)
								error_handler.report_vfav1n_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name, l_precursor_feature)
							end
						elseif l_alias_name.is_infixable and l_alias_name.is_prefixable then
							if l_alias_names.head_has_alias_name (l_alias_name, i - 1) then
									-- Alias name `l_alias_name' appears twice on the
									-- right-hand-side of `l_rename_pair'.
								set_fatal_error (current_class)
								error_handler.report_vfav4h_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name)
							else
									-- A feature with an Operator alias which can be either unary or binary
									-- should be a query with no argument or exactly one argument.
								set_fatal_error (current_class)
								error_handler.report_vfav1p_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name, l_precursor_feature)
							end
						elseif l_alias_name.is_infix then
							if l_alias_names.head_has_alias_name (l_alias_name, i - 1) then
									-- Alias name `l_alias_name' appears twice on the
									-- right-hand-side of the rename pair `l_new_name'.
								set_fatal_error (current_class)
								error_handler.report_vfav4h_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name)
							else
									-- A feature with a binary Operator alias should be
									-- a function with exactly one argument.
								set_fatal_error (current_class)
								error_handler.report_vfav1m_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name, l_precursor_feature)
							end
						elseif l_alias_name.is_prefix then
							if l_alias_names.head_has_alias_name (l_alias_name, i - 1) then
									-- Alias name `l_alias_name' appears twice on the
									-- right-hand-side of the rename pair `l_new_name'.
								set_fatal_error (current_class)
								error_handler.report_vfav4g_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name)
							else
									-- A feature with a unary Operator alias should be
									-- a query with no argument.
								set_fatal_error (current_class)
								error_handler.report_vfav1n_error (current_class, a_parent_feature.parent.type, l_new_name, l_alias_name, l_precursor_feature)
							end
						else
								-- Internal error: no other kind of alias name.
							set_fatal_error (current_class)
							error_handler.report_giaaa_error
						end
						if l_alias_name.convert_keyword /= Void and then not l_alias_name.is_infix then
								-- When the 'convert' mark is specified, the alias
								-- should be a binary operator alias.
							set_fatal_error (current_class)
							error_handler.report_vfav5a_error (current_class, l_alias_name)
						end
						i := i + 1
					end
				end
			end
		end

	check_undefine_clause_validity (a_parent_feature: ET_PARENT_FEATURE)
			-- Check validity of undefine clause for `a_parent_feature'.
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		local
			l_precursor_feature: ET_FEATURE
		do
			if attached a_parent_feature.undefine_name as l_undefine_name then
				check has_undefine: a_parent_feature.has_undefine end
				l_precursor_feature := a_parent_feature.precursor_feature
				if l_precursor_feature.is_deferred then
						-- This is not a fatal error for gelint.
					error_handler.report_vdus3a_error (current_class, a_parent_feature.parent, l_undefine_name)
				end
				if l_precursor_feature.is_frozen then
					set_fatal_error (current_class)
					error_handler.report_vdus2a_error (current_class, a_parent_feature.parent, l_undefine_name)
				end
				if
					l_precursor_feature.is_attribute or
					l_precursor_feature.is_unique_attribute or
					l_precursor_feature.is_constant_attribute
				then
					set_fatal_error (current_class)
					error_handler.report_vdus2b_error (current_class, a_parent_feature.parent, l_undefine_name)
				end
			end
		end

	check_redefine_clause_validity (a_parent_feature: ET_PARENT_FEATURE)
			-- Check validity of redefine clause for `a_parent_feature'.
		require
			a_parent_feature_not_void: a_parent_feature /= Void
		local
			l_precursor_feature: ET_FEATURE
		do
			if attached a_parent_feature.redefine_name as l_redefine_name then
				check has_redefine: a_parent_feature.has_redefine end
				l_precursor_feature := a_parent_feature.precursor_feature
				if l_precursor_feature.is_frozen then
					set_fatal_error (current_class)
					error_handler.report_vdrs2a_error (current_class, a_parent_feature.parent, l_redefine_name)
				end
				if
					l_precursor_feature.is_unique_attribute or
					l_precursor_feature.is_constant_attribute
				then
					set_fatal_error (current_class)
					error_handler.report_vdrs2b_error (current_class, a_parent_feature.parent, l_redefine_name)
				end
			end
		end

feature {NONE} -- Precursor validity

	check_precursor_validity (a_feature: ET_REDECLARED_FEATURE)
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

	resolve_identifier_signature (a_feature: ET_FEATURE)
			-- Resolve identifier types (e.g. "like identifier") in signature
			-- of `a_feature' in `current_class'. Do not try to resolve
			-- qualified anchored types. This is done after the features
			-- of the corresponding classes have been flattened.
			-- Also check whether an argument name does not appear
			-- twice and whether none of the argument names are
			-- the final name of a feature in `current_class'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_registered: a_feature.is_registered
		local
			a_type, previous_type: detachable ET_TYPE
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
			if attached a_feature.arguments as args then
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
					if not current_class.is_dotnet and then named_features.has (a_name) then
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

	resolve_signature_unfolded_tuple_actual_parameters (a_feature: ET_FEATURE)
			-- Resolve Tuple-type-unfolding types in signature of `a_feature'
			-- in `current_class'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_type, previous_type: detachable ET_TYPE
			an_arg: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
		do
			a_type := a_feature.type
			if a_type /= Void then
				unfolded_tuple_actual_parameters_resolver.resolve_type (a_type, current_class)
			end
			if attached a_feature.arguments as args then
				nb := args.count
				from i := 1 until i > nb loop
					an_arg := args.formal_argument (i)
					a_type := an_arg.type
					if a_type /= previous_type then
							-- Not resolved yet.
						unfolded_tuple_actual_parameters_resolver.resolve_type (a_type, current_class)
						previous_type := a_type
					end
					i := i + 1
				end
			end
		end

	unfolded_tuple_actual_parameters_resolver: ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS_RESOLVER1
			-- Tuple-type-unfolding type resolver

feature {NONE} -- Signature validity

	check_anchored_signatures
			-- Check whether there is no cycle in the anchored types
			-- held in the types of all signatures of `current_class'.
			-- Do not try to follow qualified anchored types. This is done
			-- after the features of the corresponding classes have
			-- been flattened.
		do
			anchored_type_checker.check_signatures (current_class)
			if anchored_type_checker.has_fatal_error then
				set_fatal_error (current_class)
				has_signature_error := True
			end
		end

	anchored_type_checker: ET_ANCHORED_TYPE_CHECKER
			-- Anchored type checker

	check_signature_vtct_validity (a_feature: ET_FEATURE)
			-- Check whether the types in the signature of `a_feature'
			-- (declared in `current_class') are based on known classes.
		require
			a_feature_not_void: a_feature /= Void
		do
			signature_checker.check_signature_vtct_validity (a_feature, current_class)
			if signature_checker.has_fatal_error then
				set_fatal_error (current_class)
				has_signature_error := True
			end
		end

	check_signature_validity (a_feature: ET_FLATTENED_FEATURE)
			-- Check signature validity for redeclarations and joinings.
		require
			a_feature_not_void: a_feature /= Void
		do
			if not has_signature_error then
					-- Errors will not be reported at this stage.
					-- This is postponed to the next compilation pass if the signature
					-- of some features contains qualified types (e.g. of the form 'like a.b')
					-- requiring features from other classes to be flattened (e.g. to determine
					-- the type of feature 'b' in the base class of 'like a').
					-- For simplicity, all validity errors related to signature conformance
					-- are reported during the interface checking compilation pass.
				signature_checker.check_signature_validity (a_feature, current_class, False)
				if signature_checker.has_fatal_error then
					current_class.set_redeclared_signatures_checked (False)
				end
			end
		end

	signature_checker: ET_SIGNATURE_CHECKER
			-- Signature validity checker

	has_signature_error: BOOLEAN
			-- Has an error been found in the signature of one of the features of
			-- `current_class' that prevents us from calling `check_signature_validity'?
			--
			-- It can be a cycle in anchored types which will result in an infinite
			-- loop should we try to check the signature conformance of redeclared
			-- features. It can also be that the signature of one of the features of
			-- `current_class' is based on an unknown class.

feature {NONE} -- Built-in feature validity

	check_builtin_feature_validity (a_feature: ET_FEATURE)
			-- Check whether `a_feature' is a known built-in feature,
			-- and if yes, check the validity of its signature.
		require
			a_feature_not_void: a_feature /= Void
		do
			builtin_feature_checker.check_feature_validity (a_feature)
			if builtin_feature_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	builtin_feature_checker: ET_BUILTIN_FEATURE_CHECKER
			-- Built-in feature validity checker

feature {NONE} -- Kernel feature validity

	check_kernel_features_validity
			-- Check validity of kernel features declared in `current_class'.
			-- Keep track of their seeds if needed.
		local
			l_class: ET_CLASS
			l_feature: ET_FEATURE
		do
			l_class := current_class
			if l_class.is_any_class then
					-- ANY.default_create.
				named_features.search (tokens.default_create_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_procedure then
						current_system.set_default_create_seed (l_feature.first_seed)
					else
						set_fatal_error (l_class)
						error_handler.report_gvkfe4a_error (l_class, l_feature)
						current_system.set_default_create_seed (0)
					end
				else
					set_fatal_error (l_class)
					error_handler.report_gvkfe1a_error (l_class, tokens.default_create_feature_name)
					current_system.set_default_create_seed (0)
				end
					-- ANY.copy.
				named_features.search (tokens.copy_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_procedure then
						current_system.set_copy_seed (l_feature.first_seed)
					else
						set_fatal_error (l_class)
						error_handler.report_gvkfe4a_error (l_class, l_feature)
						current_system.set_copy_seed (0)
					end
				else
					set_fatal_error (l_class)
					error_handler.report_gvkfe1a_error (l_class, tokens.copy_feature_name)
					current_system.set_copy_seed (0)
				end
					-- ANY.twin.
				named_features.search (tokens.twin_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_query then
						current_system.set_twin_seed (l_feature.first_seed)
					else
						set_fatal_error (l_class)
						error_handler.report_gvkfe5a_error (l_class, l_feature)
						current_system.set_twin_seed (0)
					end
				else
					set_fatal_error (l_class)
					error_handler.report_gvkfe1a_error (l_class, tokens.copy_feature_name)
					current_system.set_twin_seed (0)
				end
					-- ANY.is_equal.
				named_features.search (tokens.is_equal_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_query then
						current_system.set_is_equal_seed (l_feature.first_seed)
					else
						set_fatal_error (l_class)
						error_handler.report_gvkfe5a_error (l_class, l_feature)
						current_system.set_is_equal_seed (0)
					end
				else
					set_fatal_error (l_class)
					error_handler.report_gvkfe1a_error (l_class, tokens.is_equal_feature_name)
					current_system.set_is_equal_seed (0)
				end
			elseif l_class.is_routine_class then
					-- ROUTINE.call.
				named_features.search (tokens.call_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_procedure then
						current_system.set_routine_call_seed (l_feature.first_seed)
					else
						current_system.set_routine_call_seed (0)
					end
				else
					current_system.set_routine_call_seed (0)
				end
			elseif l_class.is_function_class then
					-- FUNCTION.item.
				named_features.search (tokens.item_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_query then
						current_system.set_function_item_seed (l_feature.first_seed)
					else
						current_system.set_function_item_seed (0)
					end
				else
					current_system.set_function_item_seed (0)
				end
			elseif l_class.is_disposable_class then
					-- DISPOSABLE.dispose.
				named_features.search (tokens.dispose_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_procedure then
						current_system.set_dispose_seed (l_feature.first_seed)
					else
						current_system.set_dispose_seed (0)
					end
				else
					current_system.set_dispose_seed (0)
				end
			elseif l_class.is_iterable_class then
					-- ITERABLE.new_cursor.
				named_features.search (tokens.new_cursor_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_query then
						current_system.set_iterable_new_cursor_seed (l_feature.first_seed)
					else
						current_system.set_iterable_new_cursor_seed (0)
					end
				else
					current_system.set_iterable_new_cursor_seed (0)
				end
			elseif l_class.is_iteration_cursor_class then
					-- ITERATION_CUREOR.item.
				named_features.search (tokens.item_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_query then
						current_system.set_iteration_cursor_item_seed (l_feature.first_seed)
					else
						current_system.set_iteration_cursor_item_seed (0)
					end
				else
					current_system.set_iteration_cursor_item_seed (0)
				end
					-- ITERATION_CUREOR.after.
				named_features.search (tokens.after_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_query then
						current_system.set_iteration_cursor_after_seed (l_feature.first_seed)
					else
						current_system.set_iteration_cursor_after_seed (0)
					end
				else
					current_system.set_iteration_cursor_after_seed (0)
				end
					-- ITERATION_CUREOR.forth.
				named_features.search (tokens.forth_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_procedure then
						current_system.set_iteration_cursor_forth_seed (l_feature.first_seed)
					else
						current_system.set_iteration_cursor_forth_seed (0)
					end
				else
					current_system.set_iteration_cursor_forth_seed (0)
				end
			elseif l_class.is_special_class then
					-- SPECIAL.item.
				named_features.search (tokens.item_feature_name)
				if named_features.found then
					l_feature := named_features.found_item.flattened_feature
					if l_feature.is_query then
						current_system.set_special_item_seed (l_feature.first_seed)
					else
						current_system.set_special_item_seed (0)
					end
				else
					current_system.set_special_item_seed (0)
				end
			end
		end

feature {NONE} -- Formal parameters validity

	check_formal_parameters_validity
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

	check_parents_validity
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

	check_creators_validity
			-- Check validity of creators of `current_class'.
		local
			a_creators: detachable ET_CREATOR_LIST
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

	check_convert_validity
			-- Check validity of convert clause of `current_class'.
		local
			a_convert_feature: ET_CONVERT_FEATURE
			i, nb: INTEGER
			a_name: ET_FEATURE_NAME
			a_feature: ET_FEATURE
		do
-- TODO: check the conversion type.
			if attached current_class.convert_features as a_convert_features then
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

feature -- Assigner validity

	check_assigners_validity
			-- Check validity of assigner clauses of queries of `current_class'.
		local
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_feature_name: ET_FEATURE_NAME
			l_query_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			l_procedure_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
			j, nb_args: INTEGER
			l_arg_offset: INTEGER
			l_type, l_other_type: ET_TYPE
			l_seed: INTEGER
		do
			l_queries := current_class.queries
				-- Process queries declared or redeclared in `current_class'.
			nb := l_queries.declared_count
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				if attached l_query.assigner as l_assigner then
					l_feature_name := l_assigner.feature_name
					named_features.search (l_feature_name)
					if not named_features.found then
						set_fatal_error (current_class)
						error_handler.report_vfac1a_error (current_class, l_feature_name, l_query)
					else
						if not attached {ET_PROCEDURE} named_features.found_item.flattened_feature as l_procedure then
							set_fatal_error (current_class)
							error_handler.report_vfac1b_error (current_class, l_feature_name, l_query)
						else
							l_feature_name.set_seed (l_procedure.first_seed)
							l_procedure_arguments := l_procedure.arguments
							if l_procedure_arguments = Void then
								set_fatal_error (current_class)
								error_handler.report_vfac2a_error (current_class, l_feature_name, l_query, l_procedure)
							elseif l_procedure_arguments.count /= l_query.arguments_count + 1 then
								set_fatal_error (current_class)
								error_handler.report_vfac2a_error (current_class, l_feature_name, l_query, l_procedure)
							else
								l_type := l_query.type
								if current_class.is_dotnet then
										-- Under .NET the value is passed as the last argument of the assigner.
									l_other_type := l_procedure_arguments.formal_argument (l_procedure_arguments.count).type
									l_arg_offset := 0
								else
									l_other_type := l_procedure_arguments.formal_argument (1).type
									l_arg_offset := 1
								end
								if system_processor.is_ise then
										-- ECMA 367-2 says that the type of the query and of the first formal argument
										-- of the assigner procedure should have the same deanchored form.
										-- But EiffelStudio 6.8.8.6542 actually only checks that the type of the
										-- formal argument of the assigner procedure conforms to the type of the query.
										-- The conformance in the other direction is checked in the client code,
										-- which is not what ECMA 367-2 suggests (see rules VFAC-3 and VBAC-1).
									if not l_other_type.conforms_to_type (l_type, current_class, current_class, system_processor) then
										set_fatal_error (current_class)
										error_handler.report_vfac3a_error (current_class, l_query.implementation_class, l_feature_name, l_query, l_procedure)
									end
								else
									if not l_type.same_named_type (l_other_type, current_class, current_class) then
										set_fatal_error (current_class)
										error_handler.report_vfac3a_error (current_class, l_query.implementation_class, l_feature_name, l_query, l_procedure)
									end
								end
								l_query_arguments := l_query.arguments
								if l_query_arguments /= Void then
									nb_args := l_query_arguments.count
									from j := 1 until j > nb_args loop
										l_type := l_query_arguments.formal_argument (j).type
										l_other_type := l_procedure_arguments.formal_argument (j + l_arg_offset).type
										if not l_type.same_named_type (l_other_type, current_class, current_class) then
											set_fatal_error (current_class)
											error_handler.report_vfac4a_error (current_class, l_query.implementation_class, l_feature_name, l_query, l_procedure, j)
										end
										j := j + 1
									end
								end
							end
						end
					end
				end
				i := i + 1
			end
				-- Process queries inherited without redeclaration.
			nb := l_queries.count
			from until i > nb loop
				l_query := l_queries.item (i)
				if attached l_query.assigner as l_assigner then
					l_feature_name := l_assigner.feature_name
					l_seed := l_feature_name.seed
					if l_seed = 0 then
							-- Internal error: the seed should have been resolved
							-- in the ancestor class where this assigner has been
							-- declared.
						set_fatal_error (current_class)
						error_handler.report_giaaa_error
					else
						if not attached current_class.seeded_procedure (l_seed) as l_procedure then
							if not current_class.has_flattening_error then
									-- Internal error: if the assigner was valid
									-- in the ancestor class and there was no error
									-- when flattening the features of current class
									-- then we should get a procedure here.
								set_fatal_error (current_class)
								error_handler.report_giaaa_error
							end
						else
							l_procedure_arguments := l_procedure.arguments
							if l_procedure_arguments = Void then
								if not current_class.has_flattening_error then
										-- Internal error: if the assigner was valid
										-- in the ancestor class and there was no error
										-- when flattening the features of current class
										-- then we should have the expected number of
										-- arguments here.
									set_fatal_error (current_class)
									error_handler.report_giaaa_error
								end
							elseif l_procedure_arguments.count /= l_query.arguments_count + 1 then
								if not current_class.has_flattening_error then
										-- Internal error: if the assigner was valid
										-- in the ancestor class and there was no error
										-- when flattening the features of current class
										-- then we should have the expected number of
										-- arguments here.
									set_fatal_error (current_class)
									error_handler.report_giaaa_error
								end
							else
								l_type := l_query.type
								if l_query.implementation_class.is_dotnet then
										-- Under .NET the value is passed as the last argument of the assigner.
									l_other_type := l_procedure_arguments.formal_argument (l_procedure_arguments.count).type
									l_arg_offset := 0
								else
									l_other_type := l_procedure_arguments.formal_argument (1).type
									l_arg_offset := 1
								end
								if system_processor.is_ise then
										-- ECMA 367-2 says that the type of the query and of the first formal argument
										-- of the assigner procedure should have the same deanchored form.
										-- But EiffelStudio 6.8.8.6542 actually only checks that the type of the
										-- formal argument of the assigner procedure conforms to the type of the query.
										-- The conformance in the other direction is checked in the client code,
										-- which is not what ECMA 367-2 suggests (see rules VFAC-3 and VBAC-1).
									if not l_other_type.conforms_to_type (l_type, current_class, current_class, system_processor) then
										set_fatal_error (current_class)
										error_handler.report_vfac3a_error (current_class, l_query.implementation_class, l_feature_name, l_query, l_procedure)
									end
								else
									if not l_type.same_named_type (l_other_type, current_class, current_class) then
										set_fatal_error (current_class)
										error_handler.report_vfac3a_error (current_class, l_query.implementation_class, l_feature_name, l_query, l_procedure)
									end
								end
								l_query_arguments := l_query.arguments
								if l_query_arguments /= Void then
									nb_args := l_query_arguments.count
									from j := 1 until j > nb_args loop
										l_type := l_query_arguments.formal_argument (j).type
										l_other_type := l_procedure_arguments.formal_argument (j + l_arg_offset).type
										if not l_type.same_named_type (l_other_type, current_class, current_class) then
											set_fatal_error (current_class)
											error_handler.report_vfac4a_error (current_class, l_query.implementation_class, l_feature_name, l_query, l_procedure, j)
										end
										j := j + 1
									end
								end
							end
						end
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Constants

	query_sorter: DS_QUICK_SORTER [ET_QUERY]
			-- Query sorter by increasing first seed values
		local
			l_comparator: ET_SEEDED_QUERY_COMPARATOR
		once
			create l_comparator.make
			create Result.make (l_comparator)
		ensure
			query_sorter_not_void: Result /= Void
		end

	procedure_sorter: DS_QUICK_SORTER [ET_PROCEDURE]
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
	no_void_named_feature: not named_features.has_void_item
	aliased_features_not_void: aliased_features /= Void
	no_void_aliased_feature: not aliased_features.has_void_item
	queries_not_void: queries /= Void
	no_void_query_not_void: not queries.has_void
	procedures_not_void: procedures /= Void
	no_void_procedure_not_void: not procedures.has_void
	clients_list_not_void: clients_list /= Void
	not_void_clients: not clients_list.has_void
	client_classes_not_void: client_classes /= Void
	no_void_client_class: not client_classes.has_void
	no_void_clients: not client_classes.has_void_item
	feature_adaptation_resolver_not_void: feature_adaptation_resolver /= Void
	dotnet_feature_adaptation_resolver_not_void: dotnet_feature_adaptation_resolver /= Void
	identifier_type_resolver_not_void: identifier_type_resolver /= Void
	unfolded_tuple_actual_parameters_resolver_not_void: unfolded_tuple_actual_parameters_resolver /= Void
	anchored_type_checker_not_void: anchored_type_checker /= Void
	signature_checker_not_void: signature_checker /= Void
	parent_checker_not_void: parent_checker /= Void
	formal_parameter_checker_not_void: formal_parameter_checker /= Void
	builtin_feature_checker_not_void: builtin_feature_checker /= Void
	precursor_checker_not_void: precursor_checker /= Void
	precursors_not_void: precursors /= Void
	no_void_precursor: not precursors.has_void_item

end
