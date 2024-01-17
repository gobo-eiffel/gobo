note

	description:

		"Eiffel qualified anchored type checkers when they appear in signatures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2019, Eric Bezault and others"
	license: "MIT License"

class ET_QUALIFIED_ANCHORED_TYPE_CHECKER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_class,
			process_class_type,
			process_like_feature,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new qualified anchored type checker.
		do
			precursor (a_system_processor)
			current_class_impl := current_class
			create adapted_base_class_checker.make (a_system_processor)
			adapted_base_class_checker.set_feature_flattening_error_only (True)
			create adapted_base_classes.make (20)
			create target_context.make_with_capacity (current_class, 10)
			create other_context.make_with_capacity (current_class, 10)
			create classes_to_be_processed.make (0)
		end

feature -- Validity checking

	check_signatures_validity (a_class: ET_CLASS)
			-- Check validity of qualified anchored types involved in
			-- the types of all signatures of `a_class'.
			-- Resolve identifiers in qualified anchored types (such as in
			-- 'like a.identifier' and 'like {A}.identifier') if not already done.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			i, nb: INTEGER
			j, nb2: INTEGER
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
			had_error: BOOLEAN
			l_type: ET_TYPE
			l_previous_type: detachable ET_TYPE
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			old_class_impl := current_class_impl
			l_queries := current_class.queries
			nb := l_queries.count
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				current_class_impl := l_query.implementation_class
				l_query.type.process (Current)
				had_error := had_error or has_fatal_error
				if attached l_query.arguments as args then
					nb2 := args.count
					from j := 1 until j > nb2 loop
						l_type := args.formal_argument (j).type
						if l_type /= l_previous_type then
							l_type.process (Current)
							had_error := had_error or has_fatal_error
							l_previous_type := l_type
						end
						j := j + 1
					end
					l_previous_type := Void
				end
				i := i + 1
			end
			l_procedures := current_class.procedures
			nb := l_procedures.count
			from i := 1 until i > nb loop
				l_procedure := l_procedures.item (i)
				current_class_impl := l_procedure.implementation_class
				if attached l_procedure.arguments as args then
					nb2 := args.count
					from j := 1 until j > nb2 loop
						l_type := args.formal_argument (j).type
						if l_type /= l_previous_type then
							l_type.process (Current)
							had_error := had_error or has_fatal_error
							l_previous_type := l_type
						end
						j := j + 1
					end
					l_previous_type := Void
				end
				i := i + 1
			end
			reset_fatal_error (had_error)
			current_class := old_class
			current_class_impl := old_class_impl
		end

feature {NONE} -- Type validity

	check_like_feature_validity (a_type: ET_LIKE_FEATURE)
			-- Check validity of `a_type' when it appears in a qualified anchored type.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			l_seed: INTEGER
			args: detachable ET_FORMAL_ARGUMENT_LIST
			l_index: INTEGER
		do
			if in_qualified_anchored_type and then system_processor.qualified_anchored_types_cycle_detection_enabled then
				l_seed := a_type.seed
				if l_seed /= 0 then
						-- Anchored type already resolved.
					if a_type.is_like_argument then
						if attached current_class.seeded_feature (l_seed) as l_feature then
							args := l_feature.arguments
							l_index := a_type.index
							if args /= Void and then l_index <= args.count then
								if args.item (l_index).type.depends_on_qualified_anchored_type (current_class) then
										-- Error: the type of the anchor appearing in a qualified
										-- anchored type should not depend on a qualified anchored type.
										-- This is a way to avoid cycles in qualified anchored types.
									set_fatal_error
									error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
								end
							else
									-- Internal error: it was already checked in previous compilation
									-- pass that we had enough arguments. Even if this is a redeclaration,
									-- signature conformance of the redeclaration imposes that the
									-- number of arguments does not change.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						else
								-- Internal error: if we got a seed, then `l_feature' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					else
						if attached current_class.seeded_query (l_seed) as l_query then
							if  l_query.type.depends_on_qualified_anchored_type (current_class) then
									-- Error: the type of the anchor appearing in a qualified
									-- anchored type should not depend on a qualified anchored type.
									-- This is a way to avoid cycles in qualified anchored types.
								set_fatal_error
								error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
							end
						else
								-- Internal error: if we got a seed, then `l_query' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
				else
						-- Internal error: the anchored type should have been resolved by the feature flattener.
					set_fatal_error
					error_handler.report_giaaa_error
				end
			end
		end

	check_qualified_like_identifier_validity (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Check validity of qualified anchored types involved in `a_type'.
			-- Resolve 'identifier' in 'like a.identifier' and 'like {A}.identifier' if not already done.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			l_target_type: ET_TYPE
			l_class: ET_CLASS
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
			old_in_qualified_anchored_type: BOOLEAN
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			i, nb: INTEGER
			l_first_context: detachable ET_NESTED_TYPE_CONTEXT
			l_first_adapted_base_class: detachable ET_ADAPTED_CLASS
			l_first_query: detachable ET_QUERY
			l_target_context_count: INTEGER
		do
			has_fatal_error := False
			old_in_qualified_anchored_type := in_qualified_anchored_type
			in_qualified_anchored_type := True
			l_name := a_type.name
			l_seed := a_type.seed
			l_target_type := a_type.target_type
				-- The target type may also be made up of qualified anchored types.
			l_target_type.process (Current)
			l_adapted_base_classes := adapted_base_classes
			if not has_fatal_error then
				add_adapted_base_classes_to_list (l_adapted_base_classes, l_target_type, current_class_impl, current_class)
					-- Make sure that any error will be reported.
					-- For that, we need to force the interface
					-- of all adapted base classes to be checked.
				nb := l_adapted_base_classes.count
				from i := 1 until i > nb loop
					l_class := l_adapted_base_classes.item (i).base_class
					if not l_class.interface_checked then
						classes_to_be_processed.force_last (l_class)
					end
					i := i + 1
				end
				l_has_multiple_constraints := nb > 1
				target_context.set (l_target_type, current_class)
				l_target_context_count := target_context.count
				adapted_base_class_checker.check_adapted_base_classes_validity (l_name, l_adapted_base_classes, target_context, current_class, current_class_impl)
			end
			if adapted_base_class_checker.has_fatal_error then
				set_fatal_error
			elseif l_seed = 0 then
				l_adapted_base_class := l_adapted_base_classes.first
				l_class := l_adapted_base_class.base_class
					-- Not resolved yet. It needs to be resolved
					-- in the implementation class first.
				if current_class /= current_class_impl then
						-- Internal error: it should have been resolved in
						-- the implementation class.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif attached l_adapted_base_class.named_query (l_name) as l_query then
						-- The fact that the signature of `l_query' is valid
						-- or not (e.g. conformance of redeclared signature),
						-- and hence its type, will be checked later on (by
						-- ET_TYPE_CHECKER.check_type_validity) when, while
						-- checking (in ET_FEATURE_CHECKER) the implementation
						-- of feature whose signature contains `a_type', we
						-- will check the validity of its signature again.
					a_type.resolve_identifier_type (l_query.first_seed)
-- TODO: check that `l_query' is exported to `current_class'.
					if system_processor.qualified_anchored_types_cycle_detection_enabled then
						if l_query.type.depends_on_qualified_anchored_type (l_class) then
								-- Error: the type of the anchor appearing in a qualified
								-- anchored type should not depend on a qualified anchored type.
								-- This is a way to avoid cycles in qualified anchored types.
							set_fatal_error
							error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
						end
					end
				else
						-- Error: there is no query with this final name.
					set_fatal_error
					error_handler.report_vtat1c_error (current_class, a_type, l_class)
				end
			elseif l_adapted_base_classes.is_empty then
					-- Internal error: the seed was already computed in a proper ancestor
					-- (or in another generic derivation) of `current_class' where this
					-- type was written. So, if we got a seed, there should be a query
					-- for this seed.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				nb := l_adapted_base_classes.count
				from i := 1 until i > nb loop
					l_adapted_base_class := l_adapted_base_classes.item (i)
					l_class := l_adapted_base_class.base_class
					if attached l_class.seeded_query (l_seed) as l_query then
							-- The fact that the signature of `l_query' is valid
							-- or not (e.g. conformance of redeclared signature),
							-- and hence its type, will be checked later on (by
							-- ET_TYPE_CHECKER.check_type_validity) when, while
							-- checking (in ET_FEATURE_CHECKER) the implementation
							-- of feature whose signature contains `a_type', we
							-- will check the validity of its signature again.
-- TODO: check that `l_query' is exported to `current_class'.
						if system_processor.qualified_anchored_types_cycle_detection_enabled then
							if l_query.type.depends_on_qualified_anchored_type (l_class) then
									-- Error: the type of the anchor appearing in a qualified
									-- anchored type should not depend on a qualified anchored type.
									-- This is a way to avoid cycles in qualified anchored types.
								set_fatal_error
								error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
							end
						end
						adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, target_context)
						target_context.force_last (l_query.type)
						if l_first_context /= Void and l_first_adapted_base_class /= Void and l_first_query /= Void then
							if not target_context.same_named_context (l_first_context) then
									-- Two queries with the same seed and different result types.
								set_fatal_error
								error_handler.report_vgmc0e_error (current_class, current_class_impl, l_name, l_first_query, l_first_adapted_base_class, l_query, l_adapted_base_class)
							end
						elseif nb > 1 then
							l_first_context := other_context
							l_first_context.copy_type_context (target_context)
							l_first_adapted_base_class := l_adapted_base_class
							l_first_query := l_query
						end
						target_context.keep_first (l_target_context_count)
					elseif l_class.is_none then
-- TODO: "NONE" conforms to all reference types.
						set_fatal_error
						error_handler.report_giaaa_error
					else
							-- Internal error: the seed was already computed in a proper ancestor
							-- (or in another generic derivation) of `current_class' where this
							-- type was written. So, if we got a seed, there should be a query
							-- for this seed.
						set_fatal_error
						error_handler.report_giaaa_error
					end
					i := i + 1
				end
			end
			target_context.reset (tokens.unknown_class)
			other_context.reset (tokens.unknown_class)
			l_adapted_base_classes.wipe_out
			in_qualified_anchored_type := old_in_qualified_anchored_type
		end

	check_actual_parameters_validity (a_parameters: ET_ACTUAL_PARAMETERS)
			-- Check validity of qualified anchored types involved in `a_parameters'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_parameters_not_void: a_parameters /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
			nb := a_parameters.count
			from i := 1 until i > nb loop
				a_parameters.type (i).process (Current)
				had_error := had_error or has_fatal_error
				i := i + 1
			end
			reset_fatal_error (had_error)
		end

	add_adapted_base_classes_to_list (a_list: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]; a_type: ET_TYPE; a_class_impl: ET_CLASS; a_context: ET_TYPE_CONTEXT)
			-- Add to `a_list' the base class of `a_type' appearing in `a_class_impl' and viewed
			-- from one of its descendants `a_context' (possibly itself), or the adapted base classes
			-- of the constraints (in the same order they appear in 'constraint_base_types') in case
			-- of a formal parameter.
		require
			a_list_not_void: a_list /= Void
			no_void_adapted_base_class: not a_list.has_void
			a_type_not_void: a_type /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_context_not_formal_parameter: not a_context.named_type_is_formal_type
			-- no_cycle: no cycle in anchored types involved.
		local
			l_seed: INTEGER
			l_name: ET_FEATURE_NAME
			l_target_type: ET_TYPE
			l_index: INTEGER
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_adapted_base_class: detachable ET_ADAPTED_CLASS
			l_has_multiple_constraints: BOOLEAN
			l_current_class: ET_CLASS
		do
			if attached {ET_QUALIFIED_LIKE_IDENTIFIER} a_type as l_qualified_anchored_type then
				l_current_class := a_context.base_class
				if not l_current_class.interface_checked then
						-- Make sure that any error will be reported.
						-- For that, we need to force the interface
						-- of `l_current_class' (and as a consequence of
						-- its ancestor class `a_class_impl') to be checked.
					classes_to_be_processed.force_last (l_current_class)
				end
				l_name := l_qualified_anchored_type.name
				l_seed := l_qualified_anchored_type.seed
				l_target_type := l_qualified_anchored_type.target_type
				l_adapted_base_classes := adapted_base_classes
				add_adapted_base_classes_to_list (l_adapted_base_classes, l_target_type, a_class_impl, a_context)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				a_context.copy_to_type_context (target_context)
				target_context.force_last (l_target_type)
				adapted_base_class_checker.check_adapted_base_classes_validity (l_name, l_adapted_base_classes, target_context, l_current_class, a_class_impl)
				if not l_adapted_base_classes.is_empty then
					l_adapted_base_class := l_adapted_base_classes.first
				end
				l_adapted_base_classes.wipe_out
				if adapted_base_class_checker.has_fatal_error then
						-- Cannot go further.
					a_list.force_last (tokens.unknown_class)
				elseif l_adapted_base_class = Void then
						-- Internal error: either we don't have a seed and we should have
						-- gotten exactly one adapted class, or the seed was already computed
						-- in a proper ancestor (or in another generic derivation) of
						-- `l_current_class' where this type was written. So, if we got a
						-- seed, there should be a query for this seed.
					a_list.force_last (tokens.unknown_class)
				elseif l_seed = 0 then
						-- Not resolved yet. It needs to be resolved
						-- in the implementation class first.
					if l_current_class /= a_class_impl then
							-- Internal error: it should have been resolved in
							-- the implementation class.
						a_list.force_last (tokens.unknown_class)
					elseif attached l_adapted_base_class.named_query (l_name) as l_query then
						adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, target_context)
						add_adapted_base_classes_to_list (a_list, l_query.type, l_query.implementation_class, target_context)
					else
							-- The error will be reported later, when checking the
							-- interface of `l_current_class'
						a_list.force_last (tokens.unknown_class)
					end
				else
					if attached l_adapted_base_class.base_class.seeded_query (l_seed) as l_query then
						adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, target_context)
						add_adapted_base_classes_to_list (a_list, l_query.type, l_query.implementation_class, target_context)
					else
							-- Internal error: the seed was already computed in a proper ancestor
							-- (or in another generic derivation) of `l_current_class' where this
							-- type was written. So, if we got a seed, there should be a query
							-- for this seed.
						a_list.force_last (tokens.unknown_class)
					end
				end
				target_context.reset (tokens.unknown_class)
			elseif attached {ET_LIKE_FEATURE} a_type as l_anchored_type then
				l_current_class := a_context.base_class
				l_current_class.process (system_processor.feature_flattener)
				l_seed := l_anchored_type.seed
				if l_seed = 0 then
						-- Anchored type could not resolved.
					a_list.force_last (tokens.unknown_class)
				elseif l_anchored_type.is_like_argument then
					l_index := l_anchored_type.index
					if not l_current_class.features_flattened_successfully then
						a_list.force_last (tokens.unknown_class)
					elseif attached l_current_class.seeded_feature (l_seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
						add_adapted_base_classes_to_list (a_list, l_args.item (l_index).type, l_feature.implementation_class, a_context)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						a_list.force_last (tokens.unknown_class)
					end
				else
					if not l_current_class.features_flattened_successfully then
						a_list.force_last (tokens.unknown_class)
					elseif attached l_current_class.seeded_query (l_seed) as l_query then
						add_adapted_base_classes_to_list (a_list, l_query.type, l_query.implementation_class, a_context)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we resolved
							-- current anchored type.
						a_list.force_last (tokens.unknown_class)
					end
				end
			else
				a_type.add_adapted_base_classes_to_list (a_list, a_context)
			end
		ensure
			at_least_one_more: a_list.count > old a_list.count
			no_void_adapted_base_class: not a_list.has_void
		end

feature {NONE} -- Multiple generic constraints

	adapted_base_class_checker: ET_ADAPTED_BASE_CLASS_CHECKER
			-- Adapted base class checker

	adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			-- List of adapted base classes

feature {ET_AST_NODE} -- Type processing

	process_class (a_type: ET_CLASS)
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.actual_parameters as a_parameters then
				check_actual_parameters_validity (a_parameters)
			end
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		do
			check_like_feature_validity (a_type)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			check_qualified_like_identifier_validity (a_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			check_qualified_like_identifier_validity (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.actual_parameters as a_parameters then
				check_actual_parameters_validity (a_parameters)
			end
		end

feature {NONE} -- Access

	current_class_impl: ET_CLASS
			-- Class where the type being processed has been written

	target_context: ET_NESTED_TYPE_CONTEXT
			-- Context for type conformance checking

	other_context: ET_NESTED_TYPE_CONTEXT
			-- Context for type conformance checking

	in_qualified_anchored_type: BOOLEAN
			-- Is the type being checked contained in a qualified anchored type?

	classes_to_be_processed: DS_HASH_SET [ET_CLASS]
			-- Classes that need to be processed
			-- Classes that need their interface to be checked as a result of processing `current_class';
			-- `current_class' will not be fully valid unless these classes are also successfully processed.

feature {ET_INTERFACE_CHECKER} -- Access

	set_classes_to_be_processed (a_classes: like classes_to_be_processed)
			-- Set `classes_to_be_processed' to `a_classes'.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class_to_be_processed: not a_classes.has_void
		do
			classes_to_be_processed := a_classes
		ensure
			classes_to_be_processed_set: classes_to_be_processed = a_classes
		end

invariant

	current_class_impl_not_void: current_class_impl /= Void
	adapted_base_class_checker_not_void: adapted_base_class_checker /= Void
	adapted_baes_classes_not_void: adapted_base_classes /= Void
	no_void_adapted_base_class: not adapted_base_classes.has_void
	target_context_not_void: target_context /= Void
	other_context_not_void: other_context /= Void
	classes_to_be_processed_not_void: classes_to_be_processed /= Void
	no_void_class_to_be_processed: not classes_to_be_processed.has_void

end
