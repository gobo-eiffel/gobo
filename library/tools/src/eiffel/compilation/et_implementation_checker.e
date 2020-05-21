note

	description:

		"Eiffel implementation checkers for features and invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_IMPLEMENTATION_CHECKER

inherit

	ET_CLASS_PROCESSOR
		rename
			make as make_class_processor
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_class
		end

	ET_SHARED_FEATURE_NAME_TESTER
		export {NONE} all end

create

	make, make_with_feature_checker

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new implementation checker for given classes.
		require
			a_system_processor_not_void: a_system_processor /= Void
		local
			l_feature_checker: like feature_checker
		do
			create l_feature_checker.make (a_system_processor)
			make_with_feature_checker (l_feature_checker)
		ensure
			system_processor_set: system_processor = a_system_processor
		end

	make_with_feature_checker (a_feature_checker: like feature_checker)
			-- Create a new implementation checker for given classes
			-- using `a_feature_checker' to check the feature implementation
			-- and their assertions.
		require
			a_feature_checker_not_void: a_feature_checker /= Void
		local
			l_suppliers: DS_HASH_SET [ET_NAMED_CLASS]
		do
			make_class_processor (a_feature_checker.system_processor)
			feature_checker := a_feature_checker
			create named_features.make_map (400)
			named_features.set_key_equality_tester (feature_name_tester)
			create feature_adaptation_resolver.make (system_processor)
			create dotnet_feature_adaptation_resolver.make (system_processor)
			create signature_checker.make (system_processor)
			create parent_checker3.make (system_processor)
			create precursor_procedures.make (10)
			create precursor_queries.make (10)
			create l_suppliers.make (10000)
			create supplier_builder.make
			supplier_builder.set (current_class, l_suppliers)
			create no_suppliers.make (0)
		ensure
			feature_checker_set: feature_checker = a_feature_checker
		end

feature -- Status report

	flat_mode: BOOLEAN
			-- Should the inherited features be processed
			-- again in `current_class'?
		do
			Result := system_processor.flat_mode
		end

	flat_dbc_mode: BOOLEAN
			-- Should the inherited pre- and postconditions be
			-- processed again in the redeclaration of features
			-- in `current_class'?
		do
			Result := system_processor.flat_dbc_mode
		end

	suppliers_enabled: BOOLEAN
			-- Should suppliers of `current_class' be computed?
		do
			Result := system_processor.suppliers_enabled
		end

feature -- Processing

	process_class (a_class: ET_CLASS)
			-- Check interface of `a_class' is not already done.
			-- Then check the implementation of the immediate and redeclared features
			-- of `a_class' and its invariants after having done so for its parent
			-- classes recursively. Also check the inherited features (and inherited
			-- assertions) if `flat_mode' (and `flat_dbc_mode') is set.
			-- Note that if `a_class' had already been checked in non-flat mode,
			-- the feature `a_class.reset_implementation_checked' needs to be called
			-- before checking it again in flat mode. No incrementality is provided
			-- between non-flat and flat modes.
			--
			-- Note that in multi-threaded mode, when several system processors
			-- are processing a Eiffel system together, the implementation of
			-- `a_class' may still not be checked at the end of this routine if
			-- it is currently being processed by another system processor.
		local
			a_processor: like Current
		do
			if a_class.is_none then
				process_none_class (a_class)
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
			implementation_checked: not {PLATFORM}.is_thread_capable implies a_class.implementation_checked
			suppliers_set: a_class.implementation_checked and suppliers_enabled implies a_class.suppliers /= Void
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS)
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			if suppliers_enabled and then a_class.suppliers = Void then
				a_class.set_suppliers (no_suppliers)
			end
			a_class.set_implementation_error
		ensure
			implementation_checked: a_class.implementation_checked
			has_implementation_error: a_class.has_implementation_error
			suppliers_set: suppliers_enabled implies a_class.suppliers /= Void
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS)
			-- Check interface of `a_class' is not already done.
			-- Then check the implementation of the immediate and redeclared features
			-- of `a_class' and its invariants after having done so for its parent
			-- classes recursively. Also check the inherited features (and inherited
			-- assertions) if `flat_mode' (and `flat_dbc_mode') is set.
			-- Note that if `a_class' had already been checked in non-flat mode,
			-- the feature `a_class.reset_implementation_checked' needs to be called
			-- before checking it again in flat mode. No incrementality is provided
			-- between non-flat and flat modes.
			--
			-- Note that in multi-threaded mode, when several system processors
			-- are processing a Eiffel system together, the implementation of
			-- `a_class' may still not be checked at the end of this routine if
			-- it is currently being processed by another system processor.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
			a_parent_class: ET_CLASS
			a_error_in_parent: BOOLEAN
			l_suppliers: detachable DS_HASH_SET [ET_NAMED_CLASS]
			l_suppliers2: DS_HASH_SET [ET_NAMED_CLASS]
			i1, nb1: INTEGER
			i2, nb2: INTEGER
			l_parent_clause: ET_PARENT_LIST
			l_parent_not_checked: BOOLEAN
		do
			old_class := current_class
			current_class := a_class
			if not {PLATFORM}.is_thread_capable or else current_class.processing_mutex.try_lock then
					-- No other thread is processing `current_class'.
					-- Got exclusive access for its processing.
				if current_class.is_checking_implementation then
						-- Internal error: this is a recursive call because of a cycle
						-- in the parents. It should have already been reported in
						-- ET_ANCESTOR_BUILDER.
					set_fatal_error (current_class)
					error_handler.report_giaaa_error
				elseif not current_class.implementation_checked then
						-- Check interface of `current_class' if not already done.
					current_class.process (system_processor.interface_checker)
					if current_class.interface_checked_successfully then
						current_class.set_checking_implementation (True)
							-- Process parents first.
						nb1 := current_class.parents_count
						from i1 := 1 until i1 > nb1 loop
							l_parent_clause := current_class.parents (i1)
							nb2 := l_parent_clause.count
							from i2 := 1 until i2 > nb2 loop
								a_parent_class := l_parent_clause.parent (i2).type.base_class
								process_parent_class (a_parent_class)
								if a_parent_class.implementation_checked then
									if a_parent_class.has_implementation_error then
										a_error_in_parent := True
									end
								else
									l_parent_not_checked := True
								end
								i2 := i2 + 1
							end
							i1 := i1 + 1
						end
						if l_parent_not_checked then
								-- When some parents have not been fully checked yet,
								-- then we postpone the processing of `current_class'.
							system_processor.report_class_postponed (current_class)
						else
							error_handler.report_compilation_status (Current, current_class, system_processor)
							pre_action
							if a_error_in_parent then
								set_fatal_error (current_class)
							end
							if not current_class.is_dotnet then
									-- No need to check validity of .NET classes.
								check_parents_validity
							end
							if not current_class.redeclared_signatures_checked then
									-- An error occurred when checking the conformance of
									-- redeclared signatures in the feature flattener. This
									-- could have been caused by the fact that qualified types
									-- could not be resolved yet. Check the conformance of
									-- signatures again, and this time reports valid errors
									-- if any.
								check_signatures_validity
							end
							if suppliers_enabled then
								l_suppliers := supplier_builder.supplier_classes
								supplier_builder.set (current_class, l_suppliers)
							end
							check_features_validity (a_error_in_parent)
							check_invariants_validity (a_error_in_parent)
							if l_suppliers /= Void then
								if not current_class.has_implementation_error then
									create l_suppliers2.make (l_suppliers.count)
									l_suppliers2.extend (l_suppliers)
									current_class.set_suppliers (l_suppliers2)
								else
									current_class.set_suppliers (no_suppliers)
								end
								l_suppliers.wipe_out
							end
							current_class.set_implementation_checked
							post_action
							system_processor.report_class_processed (current_class)
						end
						current_class.set_checking_implementation (False)
					else
						set_fatal_error (current_class)
					end
				end
				current_class.processing_mutex.unlock
			end
			current_class := old_class
		ensure
			implementation_checked: not {PLATFORM}.is_thread_capable implies a_class.implementation_checked
			suppliers_set: a_class.implementation_checked and suppliers_enabled implies a_class.suppliers /= Void
		end

	process_parent_class (a_class: ET_CLASS)
			-- Same as `process_class', except that this is a controlled
			-- recursive call where `a_class' is a parent of `current_class'.
		require
			a_class_not_void: a_class /= Void
		do
			if a_class.is_none then
				process_none_class (a_class)
			elseif a_class.is_unknown then
				set_fatal_error (a_class)
				error_handler.report_giaaa_error
			elseif not a_class.is_preparsed then
					-- Internal error: the VTCT error should have already been
					-- reported in ET_ANCESTOR_BUILDER.
				set_fatal_error (a_class)
				error_handler.report_giaaa_error
			else
				internal_process_class (a_class)
			end
		ensure
			implementation_checked: not {PLATFORM}.is_thread_capable implies a_class.implementation_checked
			suppliers_set: a_class.implementation_checked and suppliers_enabled implies a_class.suppliers /= Void
		end

	process_none_class (a_class: ET_CLASS)
			-- Process class "NONE".
		require
			a_class_not_void: a_class /= Void
			a_class_is_none: a_class.is_none
		do
			if not {PLATFORM}.is_thread_capable or else a_class.processing_mutex.try_lock then
				if not a_class.implementation_checked then
					if suppliers_enabled and then a_class.suppliers = Void then
						a_class.set_suppliers (no_suppliers)
					end
					a_class.set_implementation_checked
					system_processor.report_class_processed (a_class)
				end
				a_class.processing_mutex.unlock
			end
		ensure
			implementation_checked: not {PLATFORM}.is_thread_capable implies a_class.implementation_checked
			suppliers_set: a_class.implementation_checked and suppliers_enabled implies a_class.suppliers /= Void
		end

	pre_action
			-- Action executed before processing `current_class'.
		do
		end

	post_action
			-- Action executed after processing `current_class'.
		do
		end

feature {NONE} -- Signature validity

	check_signatures_validity
			-- Check signature validity for redeclarations and joinings
			-- for all features of `current_class'.
		do
			resolve_feature_adaptations
			if not current_class.has_interface_error then
				from named_features.start until named_features.after loop
					check_signature_validity (named_features.item_for_iteration)
					named_features.forth
				end
			end
			named_features.wipe_out
		ensure
			named_features_wiped_out: named_features.is_empty
		end

	check_signature_validity (a_feature: ET_FLATTENED_FEATURE)
			-- Check signature validity for redeclarations and joinings for `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			signature_checker.check_signature_validity (a_feature, current_class, True)
			if signature_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	signature_checker: ET_SIGNATURE_CHECKER
			-- Signature validity checker

feature {NONE} -- Feature adaptation

	feature_adaptation_resolver: ET_FEATURE_ADAPTATION_RESOLVER
			-- Feature adaptation resolver

	dotnet_feature_adaptation_resolver: ET_DOTNET_FEATURE_ADAPTATION_RESOLVER
			-- Feature adaptation resolver for .NET classes

	named_features: DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME]
			-- Features indexed by name

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
			resolve_inherited_features (current_class.queries)
			resolve_inherited_features (current_class.procedures)
		end

	resolve_inherited_features (a_feature_list: ET_FEATURE_LIST)
			-- We have to reconstruct `flattened_feature' and `flattened_parent'
			-- objects of type ET_INHERITED_FEATURE (these are non-redeclared
			-- inherited features) as they were when this was first done in
			-- ET_FEATURE_FLATTENER. In order to achieve that, we made sure
			-- in ET_FEATURE_FLATTENER that:
			-- flattened_feature.first_precursor = flattened_parent.precursor_feature.
		require
			a_feature_list_not_void: a_feature_list /= Void
		local
			l_feature: ET_FEATURE
			i, nb: INTEGER
			l_parent_feature: detachable ET_PARENT_FEATURE
			l_first_precursor: detachable ET_FEATURE
		do
			from
					-- Non-redeclared inherited features are listed from
					-- `declared_count + 1' to `count' in the feature list.
				i := a_feature_list.declared_count + 1
				nb := a_feature_list.count
			until
				i > nb
			loop
				l_feature := a_feature_list.item (i)
				named_features.search (l_feature.name)
				if named_features.found then
					if attached {ET_INHERITED_FEATURE} named_features.found_item as l_inherited_feature then
						l_inherited_feature.set_flattened_feature (l_feature)
						l_parent_feature := l_inherited_feature.parent_feature
						if l_parent_feature.merged_feature = Void then
							l_inherited_feature.set_flattened_parent (l_parent_feature)
						else
							from
								l_first_precursor := l_feature.first_precursor
							until
								l_parent_feature = Void
							loop
								if l_parent_feature.precursor_feature = l_first_precursor then
									l_inherited_feature.set_flattened_parent (l_parent_feature)
									l_parent_feature := Void
								else
									l_parent_feature := l_parent_feature.merged_feature
								end
							end
						end
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Parents validity

	check_parents_validity
			-- Check validity of parents of `current_class'.
		do
			parent_checker3.check_parents_validity (current_class)
			if parent_checker3.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	parent_checker3: ET_PARENT_CHECKER3
			-- Parent validity checker (third pass)

feature {NONE} -- Feature validity

	check_features_validity (an_error_in_parent: BOOLEAN)
			-- Check validity of immediate and redeclared features
			-- of `current_class' and check validity of inherited features
			-- of `current_class' if in flat mode (unless `an_error_in_parent' is True).
		local
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			old_supplier_handler: detachable ET_SUPPLIER_HANDLER
			i, nb: INTEGER
		do
			if suppliers_enabled then
				old_supplier_handler := feature_checker.supplier_handler
				feature_checker.set_supplier_handler (supplier_builder)
			end
			l_queries := current_class.queries
			nb := l_queries.declared_count
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				l_query.reset_validity_checked
				if attached l_query.preconditions as l_preconditions then
					l_preconditions.reset_validity_checked
				end
				if attached l_query.postconditions as l_postconditions then
					l_postconditions.reset_validity_checked
				end
				check_query_validity (l_query, an_error_in_parent)
				i := i + 1
			end
			if flat_mode and not an_error_in_parent then
				i := nb + 1
				nb := l_queries.count
				from until i > nb loop
					l_query := l_queries.item (i)
					check_query_validity (l_query, an_error_in_parent)
					i := i + 1
				end
			end
			l_procedures := current_class.procedures
			nb := l_procedures.declared_count
			from i := 1 until i > nb loop
				l_procedure := l_procedures.item (i)
				l_procedure.reset_validity_checked
				if attached l_procedure.preconditions as l_preconditions then
					l_preconditions.reset_validity_checked
				end
				if attached l_procedure.postconditions as l_postconditions then
					l_postconditions.reset_validity_checked
				end
				check_procedure_validity (l_procedure, an_error_in_parent)
				i := i + 1
			end
			if flat_mode and not an_error_in_parent then
				i := nb + 1
				nb := l_procedures.count
				from until i > nb loop
					l_procedure := l_procedures.item (i)
					check_procedure_validity (l_procedure, an_error_in_parent)
					i := i + 1
				end
			end
			if suppliers_enabled then
				feature_checker.set_supplier_handler (old_supplier_handler)
			end
		end

	check_query_validity (a_query: ET_QUERY; an_error_in_parent: BOOLEAN)
			-- Check validity of `a_query' and, if in flat mode (unless
			-- `an_error_in_parent' is True), recusively of the queries
			-- associated with its precursor expressions if any.
		require
			a_query_not_void: a_query /= Void
		do
			if flat_mode and not an_error_in_parent then
				feature_checker.set_precursor_queries (precursor_queries)
			end
			check_assertions_validity (a_query, a_query, an_error_in_parent)
			feature_checker.check_feature_validity (a_query, current_class)
			feature_checker.set_precursor_queries (Void)
			if feature_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
			if flat_mode and not an_error_in_parent then
				from precursor_queries.start until precursor_queries.after loop
					check_precursor_query_validity (precursor_queries.item_for_iteration, an_error_in_parent)
					precursor_queries.forth
				end
				precursor_queries.wipe_out
			end
		end

	check_procedure_validity (a_procedure: ET_PROCEDURE; an_error_in_parent: BOOLEAN)
			-- Check validity of `a_procedure' and, if in flat mode (unless
			-- `an_error_in_parent' is True), recusively of the procedures
			-- associated with its precursor instructions if any.
		require
			a_procedure_not_void: a_procedure /= Void
		do
			if flat_mode and not an_error_in_parent then
				feature_checker.set_precursor_procedures (precursor_procedures)
			end
			check_assertions_validity (a_procedure, a_procedure, an_error_in_parent)
			feature_checker.check_feature_validity (a_procedure, current_class)
			feature_checker.set_precursor_procedures (Void)
			if feature_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
			if flat_mode and not an_error_in_parent then
				from precursor_procedures.start until precursor_procedures.after loop
					check_precursor_procedure_validity (precursor_procedures.item_for_iteration, an_error_in_parent)
					precursor_procedures.forth
				end
				precursor_procedures.wipe_out
			end
		end

	feature_checker: ET_FEATURE_CHECKER
			-- Feature checker

feature {NONE} -- Precursor validity

	check_precursor_query_validity (a_query: ET_QUERY; an_error_in_parent: BOOLEAN)
			-- Check validity of `a_query' when associated with a precursor
			-- expression appearing in a query of `current_class'.
		require
			a_query_not_void: a_query /= Void
		do
			if flat_mode and not an_error_in_parent then
				feature_checker.set_precursor_queries (precursor_queries)
			end
			feature_checker.check_precursor_feature_validity (a_query, current_class)
			feature_checker.set_precursor_queries (Void)
			if feature_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
				-- No need to check assertions, this has already been done
				-- when checking the inherited assertions of the query where
				-- the precursor expression appeared.
		end

	check_precursor_procedure_validity (a_procedure: ET_PROCEDURE; an_error_in_parent: BOOLEAN)
			-- Check validity of `a_procedure' when associated with a precursor
			-- instruction appearing in a procedure of `current_class'.
		require
			a_procedure_not_void: a_procedure /= Void
		do
			if flat_mode and not an_error_in_parent then
				feature_checker.set_precursor_procedures (precursor_procedures)
			end
			feature_checker.check_precursor_feature_validity (a_procedure, current_class)
			feature_checker.set_precursor_procedures (Void)
			if feature_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
				-- No need to check assertions, this has already been done
				-- when checking the inherited assertions of the procedure
				-- where the precursor instruction appeared.
		end

	precursor_procedures: DS_HASH_SET [ET_PROCEDURE]
			-- Procedures associated with precursor instructions that appear
			-- in the last feature processed

	precursor_queries: DS_HASH_SET [ET_QUERY]
			-- Queries associated with precursor expressions that appear
			-- in the last feature processed

feature {NONE} -- Assertion validity

	check_assertions_validity (a_feature_impl, a_feature: ET_FEATURE; an_error_in_parent: BOOLEAN)
			-- Check validity of pre- and postconditions of `a_feature_impl' in `current_class'.
			-- `a_feature' is the version of `a_feature_impl' in `current_class' (useful
			-- when processing inherited assertions).
		require
			a_feature_impl_not_void: a_feature_impl /= Void
			a_feature_not_void: a_feature /= Void
		local
			a_class_impl: ET_CLASS
			i, nb: INTEGER
		do
			a_class_impl := a_feature_impl.implementation_class
			if attached a_feature_impl.preconditions as a_preconditions then
				feature_checker.check_preconditions_validity (a_preconditions, a_feature_impl, a_feature, current_class)
				if feature_checker.has_fatal_error then
					set_fatal_error (current_class)
				end
			end
			if attached a_feature_impl.postconditions as a_postconditions then
				feature_checker.check_postconditions_validity (a_postconditions, a_feature_impl, a_feature, current_class)
				if feature_checker.has_fatal_error then
					set_fatal_error (current_class)
				end
			end
			if (flat_dbc_mode or flat_mode) and not an_error_in_parent then
				if attached a_feature_impl.first_precursor as l_first_precursor then
					check_assertions_validity (l_first_precursor, a_feature, an_error_in_parent)
					if attached a_feature_impl.other_precursors as l_other_precursors then
						nb := l_other_precursors.count
						from i := 1 until i > nb loop
							check_assertions_validity (l_other_precursors.item (i), a_feature, an_error_in_parent)
							i := i + 1
						end
					end
				end
			end
		end

	check_invariants_validity (an_error_in_parent: BOOLEAN)
			-- Check validity of invariants of `current_class',
			-- and of its proper ancestors in flat mode (unless `an_error_in_parent' is True).
		local
			an_ancestors: ET_BASE_TYPE_LIST
			an_ancestor: ET_CLASS
			old_supplier_handler: detachable ET_SUPPLIER_HANDLER
			i, nb: INTEGER
		do
			if suppliers_enabled then
				old_supplier_handler := feature_checker.supplier_handler
				feature_checker.set_supplier_handler (supplier_builder)
			end
			if attached current_class.invariants as an_invariants then
				an_invariants.reset_validity_checked
				feature_checker.check_invariants_validity (an_invariants, current_class)
				if feature_checker.has_fatal_error then
					set_fatal_error (current_class)
				end
			end
			if suppliers_enabled then
				feature_checker.set_supplier_handler (old_supplier_handler)
			end
			if flat_mode and not an_error_in_parent then
				an_ancestors := current_class.ancestors
				nb := an_ancestors.count
				from i := 1 until i > nb loop
					an_ancestor := an_ancestors.item (i).base_class
					if attached an_ancestor.invariants as an_invariants then
						feature_checker.check_invariants_validity (an_invariants, an_ancestor)
						if feature_checker.has_fatal_error then
							set_fatal_error (current_class)
						end
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- Suppliers

	supplier_builder: ET_SUPPLIER_BUILDER
			-- Supplier builder

	no_suppliers: DS_HASH_SET [ET_NAMED_CLASS]
			-- Empty set of supplier classes

invariant

	named_features_not_void: named_features /= Void
	no_void_named_feature: not named_features.has_void_item
	feature_adaptation_resolver_not_void: feature_adaptation_resolver /= Void
	dotnet_feature_adaptation_resolver_not_void: dotnet_feature_adaptation_resolver /= Void
	signature_checker_not_void: signature_checker /= Void
	parent3_checker_not_void: parent_checker3 /= Void
	feature_checker_not_void: feature_checker /= Void
	supplier_builder_not_void: supplier_builder /= Void
	no_suppliers_not_void: no_suppliers /= Void
	no_suppliers_empty: no_suppliers.is_empty
	precursor_procedures_not_void: precursor_procedures /= Void
	no_void_precursor_procedure: not precursor_procedures.has_void
	precursor_queries_not_void: precursor_queries /= Void
	no_void_precursor_query: not precursor_queries.has_void

end
