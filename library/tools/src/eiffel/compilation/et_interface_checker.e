note

	description:

		"Eiffel class interface checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INTERFACE_CHECKER

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

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new interface checker for given classes.
		do
			precursor (a_system_processor)
			create classes_to_be_processed.make (10)
			create parent_checker3.make (a_system_processor)
			parent_checker3.set_classes_to_be_processed (classes_to_be_processed)
			create qualified_anchored_type_checker.make (a_system_processor)
			create named_features.make_map (400)
			named_features.set_key_equality_tester (feature_name_tester)
			create feature_adaptation_resolver.make (a_system_processor)
			create dotnet_feature_adaptation_resolver.make (a_system_processor)
			create signature_checker.make (a_system_processor)
			create unfolded_tuple_actual_parameters_resolver.make (a_system_processor)
		end

feature -- Processing

	process_class (a_class: ET_CLASS)
			-- Flatten features of `a_class' if not already done.
			-- Then check validity of qualified anchored types appearing
			-- in signatures, and check signature conformance in case of
			-- redeclaration if this could not be done already.
			-- Then check validity of the constraint creations of
			-- formal parameters of `a_class' and of the actual
			-- paramaters of its parents after having done
			-- so for its parent classes recursively.
		local
			a_processor: like Current
		do
			if a_class.is_none then
				a_class.set_interface_checked
			elseif not current_class.is_unknown then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaaa_error
				create a_processor.make (system_processor)
				a_processor.process_class (a_class)
			elseif a_class.is_unknown then
				if not a_class.interface_checked or else not a_class.has_interface_error then
					set_fatal_error (a_class)
					error_handler.report_giaaa_error
				end
			elseif not a_class.is_preparsed then
				set_fatal_error (a_class)
			else
				internal_process_class (a_class)
			end
		ensure then
			interface_checked: a_class.interface_checked
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS)
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.set_interface_checked
			a_class.set_interface_error
		ensure
			interface_checked: a_class.interface_checked
			has_interface_error: a_class.has_interface_error
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS)
			-- Flatten features of `a_class' if not already done.
			-- Then check validity of qualified anchored types appearing
			-- in signatures, and check signature conformance in case of
			-- redeclaration if this could not be done already.
			-- Then check validity of the constraint creations of
			-- formal parameters of `a_class' and of the actual
			-- paramaters of its parents after having done
			-- so for its parent classes recursively.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
			a_parent_class: ET_CLASS
			i, nb: INTEGER
			j, nb2: INTEGER
			l_parent_clause: ET_PARENT_LIST
			l_other_class: ET_CLASS
		do
			old_class := current_class
			current_class := a_class
			if not current_class.interface_checked then
					-- Flatten features of `current_class' if not already done.
				current_class.process (system_processor.feature_flattener)
				if current_class.features_flattened and then not current_class.has_flattening_error then
					current_class.set_interface_checked
						-- Process parents first.
					nb := current_class.parents_count
					from i := 1 until i > nb loop
						l_parent_clause := current_class.parents (i)
						nb2 := l_parent_clause.count
						from j := 1 until j > nb2 loop
							a_parent_class := l_parent_clause.parent (j).type.base_class
							if not a_parent_class.is_preparsed then
									-- Internal error: the VTCT error should have already been
									-- reported in ET_ANCESTOR_BUILDER.
								set_fatal_error (current_class)
								error_handler.report_giaaa_error
							else
									-- This is a controlled recursive call to `internal_process_class'.
								internal_process_class (a_parent_class)
								if a_parent_class.has_interface_error then
									set_fatal_error (current_class)
								end
							end
							j := j + 1
						end
						i := i + 1
					end
					if not current_class.has_interface_error then
						error_handler.report_compilation_status (Current, current_class, system_processor)
						check_qualified_anchored_signatures_validity
						resolve_signatures_unfolded_tuple_actual_parameters
						if not current_class.redeclared_signatures_checked then
								-- An error occurred when checking the conformance of
								-- redeclared signatures in the feature flattener. This
								-- could have been caused by the fact that qualified types
								-- could not be resolved yet. Check the conformance of
								-- signatures again, and this time reports valid errors
								-- if any.
							check_signatures_validity
						end
						if not current_class.is_dotnet then
								-- No need to check validity of .NET classes.
							check_constraint_creations_validity
							check_parents_validity
						end
					end
				else
					set_fatal_error (current_class)
				end
			end
			current_class := old_class
			from
			until
				classes_to_be_processed.is_empty
			loop
				l_other_class := classes_to_be_processed.last
				classes_to_be_processed.remove (l_other_class)
				process_class (l_other_class)
			end
		ensure
			interface_checked: a_class.interface_checked
		end

feature {NONE} -- Signature resolving

	resolve_signatures_unfolded_tuple_actual_parameters
			-- Resolve Tuple-type-unfolding types in signature of features declared
			-- in `current_class'.
		local
			l_queries: ET_QUERY_LIST
			l_procedures: ET_PROCEDURE_LIST
			i, nb: INTEGER
		do
			l_queries := current_class.queries
			nb := l_queries.declared_count
			from i := 1 until i > nb loop
				resolve_signature_unfolded_tuple_actual_parameters (l_queries.item (i))
				i := i + 1
			end
			l_procedures := current_class.procedures
			nb := l_procedures.declared_count
			from i := 1 until i > nb loop
				resolve_signature_unfolded_tuple_actual_parameters (l_procedures.item (i))
				i := i + 1
			end
		end

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

	unfolded_tuple_actual_parameters_resolver: ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS_RESOLVER2
			-- Tuple-type-unfolding type resolver

feature {NONE} -- Signature validity

	check_qualified_anchored_signatures_validity
			-- Check validity of qualified anchored types involved in
			-- the types of all signatures of `current_class'.
			-- Resolve identifiers in qualified anchored types (such as in
			-- 'like a.identifier' and 'like {A}.identifier') if not already done.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			qualified_anchored_type_checker.check_signatures_validity (current_class)
			if qualified_anchored_type_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	qualified_anchored_type_checker: ET_QUALIFIED_ANCHORED_TYPE_CHECKER
			-- Qualified anchored type checker

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

feature {NONE} -- Constraint creation validity

	check_constraint_creations_validity
			-- Check validity of the constraint creations
			-- of `current_class' if any.
		local
			i, nb: INTEGER
		do
			if attached current_class.formal_parameters as a_formals then
				nb := a_formals.count
				from i := 1 until i > nb loop
					check_constraint_creation_validity (a_formals.formal_parameter (i))
					i := i + 1
				end
			end
		end

	check_constraint_creation_validity (a_formal: ET_FORMAL_PARAMETER)
			-- Check validity of the constraint creation
			-- of `a_formal' if any.
		require
			a_formal_not_void: a_formal /= Void
		local
			a_name, other_name: ET_FEATURE_NAME
			a_class: ET_CLASS
			i, j, nb: INTEGER
		do
			if attached a_formal.creation_procedures as a_creator then
				if attached a_formal.constraint_base_type as a_base_type then
					a_class := a_base_type.base_class
				else
						-- We know that the constraint is not
						-- void since we have a creation clause.
						-- So we must have something like that:
						-- "[G -> H create make end, H -> G]".
						-- We consider that the base class of the
						-- constraint is 'ANY' in that case.
					a_class := current_universe.detachable_any_type.base_class
				end
					-- Build the feature table.
				a_class.process (system_processor.feature_flattener)
				if not a_class.features_flattened or else a_class.has_flattening_error then
					set_fatal_error (current_class)
				else
					nb := a_creator.count
					from i := 1 until i > nb loop
						a_name := a_creator.feature_name (i)
						from j := 1 until j >= i loop
							other_name := a_creator.feature_name (j)
							if other_name.same_feature_name (a_name) then
									-- Feature name appears twice in Creation clause.
									-- This is not considered as a fatal error.
								error_handler.report_vgcp3c_error (current_class, other_name, a_name)
							end
							j := j + 1
						end
						if attached a_class.named_procedure (a_name) as a_procedure then
								-- We finally got a valid creation
								-- procedure. Record its seed.
							a_name.set_seed (a_procedure.first_seed)
						elseif attached a_class.named_query (a_name) as a_query then
								-- This feature is not a procedure.
							set_fatal_error (current_class)
							error_handler.report_vtgc0b_error (current_class, a_name, a_query, a_class)
						else
								-- This name is not the final name of
								-- a feature on `current_class'.
							set_fatal_error (current_class)
							error_handler.report_vtgc0a_error (current_class, a_name, a_class)
						end
						i := i + 1
					end
				end
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

feature {NONE} -- Access

	classes_to_be_processed: DS_HASH_SET [ET_CLASS]
			-- Classes that need to be processed as a result of processing `current_class';
			-- Typically, we already discovered that `current_class' was not valid because
			-- these classes that it depends on were not valid themselves. But we need to
			-- force the processing of these classes in order for the corresponding validity
			-- errors to be properly reported.

invariant

	parent3_checker_not_void: parent_checker3 /= Void
	qualified_anchored_type_checker_not_void: qualified_anchored_type_checker /= Void
	named_features_not_void: named_features /= Void
	no_void_named_feature: not named_features.has_void_item
	feature_adaptation_resolver_not_void: feature_adaptation_resolver /= Void
	dotnet_feature_adaptation_resolver_not_void: dotnet_feature_adaptation_resolver /= Void
	signature_checker_not_void: signature_checker /= Void
	unfolded_tuple_actual_parameters_resolver_not_void: unfolded_tuple_actual_parameters_resolver /= Void
	classes_to_be_processed_not_void: classes_to_be_processed /= Void
	no_void_class_to_be_processed: not classes_to_be_processed.has_void

end
