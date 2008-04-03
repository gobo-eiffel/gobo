indexing

	description:

		"Eiffel implementation checkers for features and invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2008, Eric Bezault and others"
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
			make as make_class_processor
		undefine
			make_class_processor
		redefine
			process_class
		end

create

	make, make_with_feature_checker

feature {NONE} -- Initialization

	make is
			-- Create a new implementation checker for given classes.
		local
			l_feature_checker: ET_FEATURE_CHECKER
		do
			create l_feature_checker.make
			make_with_feature_checker (l_feature_checker)
		end

	make_with_feature_checker (a_feature_checker: like feature_checker) is
			-- Create a new implementation checker for given classes
			-- using `a_feature_checker' to check the feature implementation
			-- and their assertions.
		require
			a_feature_checker_not_void: a_feature_checker /= Void
		local
			l_suppliers: DS_HASH_SET [ET_CLASS]
		do
			make_class_processor
			feature_checker := a_feature_checker
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

	flat_dbc_mode: BOOLEAN
			-- Should the inherited pre- and postconditions be
			-- processed again in the redeclaration of features
			-- in `current_class'?

	short_mode: BOOLEAN
			-- Process short form of `current_class'

	suppliers_enabled: BOOLEAN
			-- Should suppliers of `current_class' be computed?

feature -- Status setting

	set_flat_mode (b: BOOLEAN) is
			-- Set `flat_mode' to `b'.
		do
			flat_mode := b
		ensure
			flat_mode_set: flat_mode = b
		end

	set_flat_dbc_mode (b: BOOLEAN) is
			-- Set `flat_dbc_mode' to `b'.
		do
			flat_dbc_mode := b
		ensure
			flat_dbc_mode_set: flat_dbc_mode = b
		end

	set_short_mode (b: BOOLEAN) is
			-- Set `short_mode' to `b'.
		do
			short_mode := b
		ensure
			short_mode_set: short_mode = b
		end

	set_suppliers_enabled (b: BOOLEAN) is
			-- Set `suppliersproviders_enabled' to `b'.
		do
			suppliers_enabled := b
		ensure
			suppliers_enabled_set: suppliers_enabled = b
		end

feature -- Processing

	process_class (a_class: ET_CLASS) is
			-- Check interface of `a_class' is not already done.
			-- Then check the implementation of the immediate and redeclared features
			-- of `a_class' and its invariants after having done so for its parent
			-- classes recursively. Also check the inherited features (and inherited
			-- assertions) if `flat_mode' (and `flat_dbc_mode') is set.
			-- Note that if `a_class' had already been checked in non-flat mode,
			-- the feature `a_class.reset_implementation_checked' needs to be called
			-- before checking it again in flat mode. No incrementality is provided
			-- between non-flat and flat modes.
		local
			a_processor: like Current
		do
			if a_class.is_none then
				a_class.set_implementation_checked
			elseif not current_class.is_unknown then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaaa_error
				create a_processor.make
				a_processor.set_flat_mode (flat_mode)
				a_processor.set_flat_dbc_mode (flat_dbc_mode)
				a_processor.set_short_mode (short_mode)
				a_processor.set_suppliers_enabled (suppliers_enabled)
				a_processor.process_class (a_class)
			elseif a_class.is_unknown then
				set_fatal_error (a_class)
			elseif not a_class.is_preparsed then
				set_fatal_error (a_class)
			else
				internal_process_class (a_class)
			end
			if suppliers_enabled and then a_class.suppliers = Void then
				a_class.set_suppliers (no_suppliers)
			end
		ensure then
			implementation_checked: a_class.implementation_checked
			suppliers_set: suppliers_enabled implies a_class.suppliers /= Void
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.set_implementation_checked
			a_class.set_implementation_error
		ensure
			implementation_checked: a_class.implementation_checked
			has_implementation_error: a_class.has_implementation_error
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS) is
			-- Check interface of `a_class' is not already done.
			-- Then check the implementation of the immediate and redeclared features
			-- of `a_class' and its invariants after having done so for its parent
			-- classes recursively. Also check the inherited features (and inherited
			-- assertions) if `flat_mode' (and `flat_dbc_mode') is set.
			-- Note that if `a_class' had already been checked in non-flat mode,
			-- the feature `a_class.reset_implementation_checked' needs to be called
			-- before checking it again in flat mode. No incrementality is provided
			-- between non-flat and flat modes.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
			a_parents: ET_PARENT_LIST
			a_parent_class: ET_CLASS
			a_error_in_parent: BOOLEAN
			l_suppliers, l_suppliers2: DS_HASH_SET [ET_CLASS]
			i, nb: INTEGER
		do
			old_class := current_class
			current_class := a_class
			if not current_class.implementation_checked then
					-- Check interface of `current_class' if not already done.
				current_class.process (current_system.interface_checker)
				if current_class.interface_checked and then not current_class.has_interface_error then
					current_class.set_implementation_checked
						-- Process parents first.
					a_parents := current_class.parents
					if a_parents = Void or else a_parents.is_empty then
						if current_class = current_system.any_class then
								-- "ANY" has no implicit parents.
							a_parents := Void
						else
							a_parents := current_system.any_parents
						end
					end
					if a_parents /= Void then
						nb := a_parents.count
						from i := 1 until i > nb loop
							a_parent_class := a_parents.parent (i).type.base_class
							if not a_parent_class.is_preparsed then
									-- Internal error: the VTCT error should have already been
									-- reported in ET_ANCESTOR_BUILDER.
								a_error_in_parent := True
								set_fatal_error (current_class)
							else
									-- This is a controlled recursive call to `internal_process_class'.
								internal_process_class (a_parent_class)
								if a_parent_class.has_implementation_error then
									a_error_in_parent := True
									set_fatal_error (current_class)
								end
							end
							i := i + 1
						end
					end
					error_handler.report_compilation_status (Current, current_class)
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
				else
					set_fatal_error (current_class)
				end
			end
			current_class := old_class
		ensure
			implementation_checked: a_class.implementation_checked
			suppliers_set: suppliers_enabled implies a_class.suppliers /= Void
		end

feature {NONE} -- Feature validity

	check_features_validity (an_error_in_parent: BOOLEAN) is
			-- Check validity of immediate and redeclared features
			-- of `current_class' and check validity of inherited features
			-- of `current_class' if in flat mode (unless `an_error_in_parent' is True).
		local
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			old_supplier_handler: ET_SUPPLIER_HANDLER
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
				l_query.reset_implementation_checked
				l_query.reset_assertions_checked
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
				l_procedure.reset_implementation_checked
				l_procedure.reset_assertions_checked
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

	check_query_validity (a_query: ET_QUERY; an_error_in_parent: BOOLEAN) is
			-- Check validity of `a_query' and, if in flat mode (unless
			-- `an_error_in_parent' is True), recusively of the queries
			-- associated with its precursor expressions if any.
		require
			a_query_not_void: a_query /= Void
		do
			if flat_mode and not an_error_in_parent then
				feature_checker.set_precursor_queries (precursor_queries)
			end
			feature_checker.check_feature_validity (a_query, current_class)
			feature_checker.set_precursor_queries (Void)
			if feature_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
			check_assertions_validity (a_query, a_query, an_error_in_parent)
			if flat_mode and not an_error_in_parent then
				from precursor_queries.start until precursor_queries.after loop
					check_precursor_query_validity (precursor_queries.item_for_iteration, an_error_in_parent)
					precursor_queries.forth
				end
				precursor_queries.wipe_out
			end
		end

	check_procedure_validity (a_procedure: ET_PROCEDURE; an_error_in_parent: BOOLEAN) is
			-- Check validity of `a_procedure' and, if in flat mode (unless
			-- `an_error_in_parent' is True), recusively of the procedures
			-- associated with its precursor instructions if any.
		require
			a_procedure_not_void: a_procedure /= Void
		do
			if flat_mode and not an_error_in_parent then
				feature_checker.set_precursor_procedures (precursor_procedures)
			end
			feature_checker.check_feature_validity (a_procedure, current_class)
			feature_checker.set_precursor_procedures (Void)
			if feature_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
			check_assertions_validity (a_procedure, a_procedure, an_error_in_parent)
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

	check_precursor_query_validity (a_query: ET_QUERY; an_error_in_parent: BOOLEAN) is
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

	check_precursor_procedure_validity (a_procedure: ET_PROCEDURE; an_error_in_parent: BOOLEAN) is
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

	check_assertions_validity (a_feature_impl, a_feature: ET_FEATURE; an_error_in_parent: BOOLEAN) is
			-- Check validity of pre- and postconditions of `a_feature_impl' in `current_class'.
			-- `a_feature' is the version of `a_feature_impl' in `current_class' (useful
			-- when processing inherited assertions).
		require
			a_feature_impl_not_void: a_feature_impl /= Void
			a_feature_not_void: a_feature /= Void
		local
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
			a_class_impl: ET_CLASS
			had_error: BOOLEAN
			l_first_precursor: ET_FEATURE
			l_other_precursors: ET_FEATURE_LIST
			i, nb: INTEGER
		do
			a_class_impl := a_feature_impl.implementation_class
			a_preconditions := a_feature_impl.preconditions
			if a_preconditions /= Void then
				feature_checker.check_preconditions_validity (a_preconditions, a_feature_impl, a_feature, current_class)
				if feature_checker.has_fatal_error then
					had_error := True
					set_fatal_error (current_class)
				end
			end
			a_postconditions := a_feature_impl.postconditions
			if a_postconditions /= Void then
				feature_checker.check_postconditions_validity (a_postconditions, a_feature_impl, a_feature, current_class)
				if feature_checker.has_fatal_error then
					had_error := True
					set_fatal_error (current_class)
				end
			end
			if current_class = a_class_impl then
				a_feature.set_assertions_checked
				if had_error then
					a_feature.set_assertions_error
				end
			end
			if (flat_dbc_mode or flat_mode) and not an_error_in_parent then
				l_first_precursor := a_feature_impl.first_precursor
				if l_first_precursor /= Void then
					check_assertions_validity (l_first_precursor, a_feature, an_error_in_parent)
					l_other_precursors := a_feature_impl.other_precursors
					if l_other_precursors /= Void then
						nb := l_other_precursors.count
						from i := 1 until i > nb loop
							check_assertions_validity (l_other_precursors.item (i), a_feature, an_error_in_parent)
							i := i + 1
						end
					end
				end
			end
		end

	check_invariants_validity (an_error_in_parent: BOOLEAN) is
			-- Check validity of invariants of `current_class',
			-- and of its proper ancestors in flat mode (unless `an_error_in_parent' is True).
		local
			an_invariants: ET_INVARIANTS
			an_ancestors: ET_BASE_TYPE_LIST
			an_ancestor: ET_CLASS
			old_supplier_handler: ET_SUPPLIER_HANDLER
			i, nb: INTEGER
		do
			if suppliers_enabled then
				old_supplier_handler := feature_checker.supplier_handler
				feature_checker.set_supplier_handler (supplier_builder)
			end
			an_invariants := current_class.invariants
			if an_invariants /= Void then
				an_invariants.reset_assertions_checked
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
					an_invariants := an_ancestor.invariants
					if an_invariants /= Void then
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

	no_suppliers: DS_HASH_SET [ET_CLASS]
			-- Empty set of supplier classes

invariant

	feature_checker_not_void: feature_checker /= Void
	supplier_builder_not_void: supplier_builder /= Void
	no_suppliers_not_void: no_suppliers /= Void
	no_suppliers_empty: no_suppliers.is_empty
	precursor_procedures_not_void: precursor_procedures /= Void
	no_void_precursor_procedure: not precursor_procedures.has (Void)
	precursor_queries_not_void: precursor_queries /= Void
	no_void_precursor_query: not precursor_queries.has (Void)

end
