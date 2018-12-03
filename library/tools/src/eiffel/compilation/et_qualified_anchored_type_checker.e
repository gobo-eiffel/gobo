note

	description:

		"Eiffel qualified anchored type checkers when they appear in signatures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
			if in_qualified_anchored_type then
				l_seed := a_type.seed
				if l_seed /= 0 then
						-- Anchored type already resolved.
					if a_type.is_like_argument then
						if attached current_class.seeded_feature (l_seed) as l_feature then
							args := l_feature.arguments
							l_index := a_type.index
							if args /= Void and then l_index <= args.count then
								if system_processor.qualified_anchored_types_cycle_detection_enabled then
									if args.item (l_index).type.depends_on_qualified_anchored_type (current_class) then
											-- Error: the type of the anchor appearing in a qualified
											-- anchored type should not depend on a qualified anchored type.
											-- This is a way to avoid cycles in qualified anchored types.
										set_fatal_error
										error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
									end
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
							if system_processor.qualified_anchored_types_cycle_detection_enabled then
								if  l_query.type.depends_on_qualified_anchored_type (current_class) then
										-- Error: the type of the anchor appearing in a qualified
										-- anchored type should not depend on a qualified anchored type.
										-- This is a way to avoid cycles in qualified anchored types.
									set_fatal_error
									error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
								end
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
			l_seed: INTEGER
			old_in_qualified_anchored_type: BOOLEAN
		do
			has_fatal_error := False
			old_in_qualified_anchored_type := in_qualified_anchored_type
			in_qualified_anchored_type := True
			l_target_type := a_type.target_type
				-- The target type may also be made up of qualified anchored types.
			l_target_type.process (Current)
			if not has_fatal_error then
				l_class := base_class (l_target_type, current_class_impl, current_class)
				l_class.process (system_processor.feature_flattener)
				if not l_class.features_flattened or else l_class.has_flattening_error then
					set_fatal_error
				else
					l_seed := a_type.seed
					if l_seed = 0 then
							-- Not resolved yet. It needs to be resolved
							-- in the implementation class first.
						if current_class /= current_class_impl then
								-- Internal error: it should have been resolved in
								-- the implementation class.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							if attached l_class.named_query (a_type.name) as l_query then
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
									if  l_query.type.depends_on_qualified_anchored_type (l_class) then
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
						end
					else
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
								if  l_query.type.depends_on_qualified_anchored_type (l_class) then
										-- Error: the type of the anchor appearing in a qualified
										-- anchored type should not depend on a qualified anchored type.
										-- This is a way to avoid cycles in qualified anchored types.
									set_fatal_error
									error_handler.report_vtat2b_error (current_class, current_class_impl, a_type)
								end
							end
						else
								-- Internal error: if we got a seed, then `l_query' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
				end
			end
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

	base_class (a_type: ET_TYPE; a_class_impl: ET_CLASS; a_context: ET_TYPE_CONTEXT): ET_CLASS
			-- Base class of `a_type' appearing in `a_class_impl' and viewed
			-- from one of its descendants `a_context' (possibly itself).
			-- (Definition of base class in ETL2 page 198).
			-- Return "*UNKNOWN*" class if identifier types could not be resolved,
			-- or in case of unmatched formal generic parameter.
		require
			a_type_not_void: a_type /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			l_seed: INTEGER
			l_class: ET_CLASS
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
			l_index: INTEGER
		do
			if attached {ET_QUALIFIED_LIKE_IDENTIFIER} a_type as l_qualified_anchored_type then
				l_target_type := l_qualified_anchored_type.target_type
				if a_class_impl.interface_checked then
					l_seed := l_qualified_anchored_type.seed
				else
						-- Qualified anchored type not resolved yet.
					l_class := base_class (l_target_type, a_class_impl, a_class_impl)
					l_class.process (system_processor.feature_flattener)
					if l_class.features_flattened_successfully and then attached l_class.named_query (l_qualified_anchored_type.name) as l_query then
						l_seed := l_query.first_seed
					else
							-- Make sure that the error will be reported.
							-- For that, we need to force the interface
							-- of `a_class_impl' to be checked.
						classes_to_be_processed.force_last (a_class_impl)
					end
				end
				if l_seed = 0 then
						-- Qualified anchored type could not resolved.
					Result := tokens.unknown_class
				else
					l_class := base_class (l_target_type, a_class_impl, a_context)
					l_class.process (system_processor.feature_flattener)
					if not l_class.features_flattened_successfully then
						Result := tokens.unknown_class
					elseif attached l_class.seeded_query (l_seed) as l_query then
						l_target_context := a_context.as_nested_type_context
						l_target_context.force_last (l_target_type)
						Result := base_class (l_query.type, l_query.implementation_class, l_target_context)
						l_target_context.remove_last
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we resolved
							-- current qualified anchored type.
						Result := tokens.unknown_class
					end
				end
			elseif attached {ET_LIKE_FEATURE} a_type as l_anchored_type then
				a_class_impl.process (system_processor.feature_flattener)
				l_seed := l_anchored_type.seed
				if l_seed = 0 then
						-- Anchored type could not resolved.
					Result := tokens.unknown_class
				elseif l_anchored_type.is_like_argument then
					l_class := a_context.base_class
					l_index := l_anchored_type.index
					if not l_class.features_flattened_successfully then
						Result := tokens.unknown_class
					elseif attached l_class.seeded_feature (l_seed) as l_feature and then attached l_feature.arguments as l_args and then l_index <= l_args.count then
						Result := base_class (l_args.item (l_index).type, l_feature.implementation_class, a_context)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we relsolved
							-- current anchored type.
						Result := tokens.unknown_class
					end
				else
					l_class := a_context.base_class
					l_class.process (system_processor.feature_flattener)
					if not l_class.features_flattened_successfully then
						Result := tokens.unknown_class
					elseif attached l_class.seeded_query (l_seed) as l_query then
						Result := base_class (l_query.type, l_query.implementation_class, a_context)
					else
							-- Internal error: an inconsistency has been
							-- introduced in the AST since we resolved
							-- current anchored type.
						Result := tokens.unknown_class
					end
				end
			else
				Result := a_type.base_class (a_context)
			end
		ensure
			base_class_not_void: Result /= Void
		end

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
	classes_to_be_processed_not_void: classes_to_be_processed /= Void
	no_void_class_to_be_processed: not classes_to_be_processed.has_void

end
