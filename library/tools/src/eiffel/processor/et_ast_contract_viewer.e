note

	description:

	"[
		Eiffel AST flat contract viewers. Do not print feature implementations, only
		exported features (even inherited features) with their assertions.
		Use UTF-8 encoding. Note that the byte order mark (BOM) for UTF-8 is not
		printed unless it was found in the class file when parsing the class text
		and `bom_enabled' is True, or it is explicitly printed by calling `print_bom'.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_AST_CONTRACT_VIEWER

inherit

	ET_AST_TYPED_PRETTY_PRINTER
		redefine
			make,
			reset,
			process_alias_name,
			process_assign_feature_name,
			process_attribute,
			process_class,
			process_class_type,
			process_constant_attribute,
			process_creator_list,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_procedure,
			process_dotnet_function,
			process_dotnet_procedure,
			process_extended_attribute,
			process_extended_feature_name,
			process_external_function,
			process_external_procedure,
			process_identifier,
			process_manifest_type,
			process_once_function,
			process_once_procedure,
			process_feature_name,
			process_features,
			process_tuple_type,
			process_type,
			process_unique_attribute
		end

	ET_SHARED_FEATURE_SORTER_BY_NAME
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file; a_system_processor: like system_processor)
			-- Create a new flat contract viewer, using `a_file' as output file.
		do
			precursor (a_file, a_system_processor)
			create unused_feature_lists.make (200)
			create non_exported_feature_call_finder.make (a_system_processor)
			create precursors.make (100)
			creation_procedures := new_feature_list
			create feature_clauses.make_map (200)
			create features.make_map (200)
			features.set_key_equality_tester (case_insensitive_string_equality_tester)
			create string_buffer.make (200)
			set_comments_ignored (True)
			set_flat_enabled (True)
		ensure then
			flat_enabled: flat_enabled
		end

feature -- Initialization

	reset
			-- Reset for another flat contract view.
		do
			precursor
			set_comments_ignored (True)
			precursors.wipe_out
			creation_procedures.wipe_out
			feature_clauses.wipe_out
			from features.start until features.after loop
				free_feature_list (features.item_for_iteration)
				features.forth
			end
			features.wipe_out
		end

feature -- Status report

	flat_enabled: BOOLEAN
			-- Should inherited features be printed?

feature -- Status setting

	set_flat_enabled (b: BOOLEAN)
			-- Set `flat_enabled` to `b`.
		do
			flat_enabled := b
		ensure
			flat_enabled_set: flat_enabled = b
		end

feature {ET_AST_NODE} -- Processing

	process_alias_name (a_name: ET_ALIAS_NAME)
			-- Process `a_name'.
		do
			tokens.alias_keyword.process (Current)
			print_space
			a_name.alias_string.process (Current)
			if a_name.convert_keyword /= Void then
				print_space
				tokens.convert_keyword.process (Current)
			end
		end

	process_all_invariants (a_class: ET_CLASS)
			-- Process all invariants of `a_class`.
			-- Do not print assertions which contain non-exported
			-- feature calls.
		require
			a_class_not_void: a_class /= Void
		local
			l_ancestors: ET_BASE_TYPE_LIST
			l_base_class: ET_CLASS
			i: INTEGER
			j, nb2: INTEGER
			l_assertion: ET_ASSERTION
			l_has_assertion: BOOLEAN
			l_has_invariants: BOOLEAN
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			l_old_closure_impl := current_closure_impl
			l_old_class_impl := current_class_impl
			if flat_enabled then
				l_ancestors := a_class.ancestors
				from i := l_ancestors.count until i = 0 loop
					l_base_class := l_ancestors.item (i).base_class
					if attached l_base_class.invariants as l_invariants and then not l_invariants.are_all_true then
						l_has_assertion := False
						current_closure := l_invariants
						current_closure_impl := l_invariants.implementation_feature
						current_class_impl := l_invariants.implementation_class
						nb2 := l_invariants.count
						from j := 1 until j > nb2 loop
							l_assertion := l_invariants.assertion (j)
							if not has_non_exported_feature_calls (l_assertion) then
								if not l_has_invariants then
									tokens.invariant_keyword.process (Current)
									print_new_line
									print_new_line
									indent
									l_has_invariants := True
								end
								if not l_has_assertion then
									indent
									print_comment_text (once "-- from class {" + l_base_class.upper_name  + "}")
									print_new_line
									dedent
									l_has_assertion := True
								end
								l_assertion.process (Current)
								print_new_line
							end
							j := j + 1
						end
						if l_has_assertion then
							print_new_line
						end
					end
					i := i - 1
				end
			end
			if attached a_class.invariants as l_invariants and then not l_invariants.are_all_true then
				l_has_assertion := False
				current_closure := l_invariants
				current_closure_impl := l_invariants.implementation_feature
				current_class_impl := l_invariants.implementation_class
				nb2 := l_invariants.count
				from j := 1 until j > nb2 loop
					l_assertion := l_invariants.assertion (j)
					if not has_non_exported_feature_calls (l_assertion) then
						if not l_has_invariants then
							tokens.invariant_keyword.process (Current)
							print_new_line
							print_new_line
							indent
							l_has_invariants := True
						end
						if not l_has_assertion then
							if flat_enabled then
								indent
								print_comment_text (once "-- from class {" + a_class.upper_name  + "}")
								print_new_line
								dedent
							end
							l_has_assertion := True
						end
						l_assertion.process (Current)
						print_new_line
					end
					j := j + 1
				end
				if l_has_assertion then
					print_new_line
				end
			end
			if l_has_invariants then
				dedent
			end
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_all_postconditions (a_feature: ET_FEATURE)
			-- Process all postconditions of `a_feature`.
			-- Do not print assertions which contain non-exported
			-- feature calls.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_precursors: like precursors
			l_precursor: ET_FEATURE
			i, nb: INTEGER
			l_assertion: ET_ASSERTION
			l_has_assertion: BOOLEAN
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			l_old_class_impl := current_class_impl
			l_precursors := precursors
			l_precursors.wipe_out
			a_feature.add_precursors_impl (l_precursors)
			l_precursors.force_last (a_feature.implementation_feature)
			from l_precursors.start until l_precursors.after loop
				l_precursor := l_precursors.item_for_iteration
				if attached l_precursor.postconditions as l_postconditions and then not l_postconditions.are_all_true then
					l_has_assertion := False
					current_closure_impl := l_precursor.implementation_feature
					current_class_impl := l_precursor.implementation_class
					nb := l_postconditions.count
					from i := 1 until i > nb loop
						l_assertion := l_postconditions.assertion (i)
						if not has_non_exported_feature_calls (l_assertion) then
							if not l_has_assertion then
								tokens.ensure_keyword.process (Current)
								if l_postconditions.then_keyword /= Void then
									print_space
									tokens.then_keyword.process (Current)
								end
								if current_class_impl /= current_class then
									print_space
									print_comment_text (once "-- from class {" + current_class_impl.upper_name  + "}")
								end
								print_new_line
								l_has_assertion := True
							end
							indent
							l_assertion.process (Current)
							print_new_line
							dedent
						end
						i := i + 1
					end
				end
				l_precursors.forth
			end
			l_precursors.wipe_out
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_all_preconditions (a_feature: ET_FEATURE)
			-- Process all preconditions of `a_feature`.
			-- Note the in valid Eiffel code, a precondition of an exported
			-- feature cannot contain non-exported feature calls (validity
			-- rule VAPE). So no need to take that case into account here.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_precursors: like precursors
			l_precursor: ET_FEATURE
			l_is_first: BOOLEAN
			l_first_precursor: ET_FEATURE
			l_class: ET_CLASS
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			l_old_class_impl := current_class_impl
			l_precursors := precursors
			l_precursors.wipe_out
			a_feature.add_precursors_impl (l_precursors)
			l_precursors.force_last (a_feature.implementation_feature)
			l_is_first := True
			from l_precursors.start until l_precursors.after loop
				l_precursor := l_precursors.item_for_iteration
				if l_is_first then
					l_first_precursor := l_precursor
					l_is_first := False
				end
				if attached l_precursor.preconditions as l_preconditions and then not l_preconditions.are_all_true then
					if l_first_precursor /= Void then
						if l_first_precursor /= l_precursor then
							tokens.require_keyword.process (Current)
							l_class := l_first_precursor.implementation_class
							if l_class /= current_class then
								print_space
								print_comment_text (once "-- from class {" + l_class.upper_name  + "}")
							end
							print_new_line
							indent
							tokens.true_keyword.process (Current)
							dedent
							print_new_line
						end
						l_first_precursor := Void
					end
					current_closure_impl := l_precursor.implementation_feature
					current_class_impl := l_precursor.implementation_class
					tokens.require_keyword.process (Current)
					if l_preconditions.else_keyword /= Void then
						print_space
						tokens.else_keyword.process (Current)
					end
					if current_class_impl /= current_class then
						print_space
						print_comment_text (once "-- from class {" + current_class_impl.upper_name  + "}")
					end
					print_new_line
					indent
					process_assertions (l_preconditions)
					dedent
				end
				l_precursors.forth
			end
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_assign_feature_name (an_assigner: ET_ASSIGN_FEATURE_NAME)
			-- Process `an_assigner'.
		do
			tokens.assign_keyword.process (Current)
			print_space
			set_current_target
			process_feature_name (an_assigner.feature_name)
			set_target (Void)
		end

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_base_type (a_type: ET_BASE_TYPE)
			-- Process `a_type'.
		local
			l_base_class: ET_CLASS
		do
			l_base_class := a_type.base_class
			if attached a_type.type_mark as l_type_mark then
				if not l_type_mark.is_expanded_mark and not l_base_class.is_expanded then
					if l_type_mark.is_detachable_mark and l_base_class.current_system.attachment_type_conformance_mode then
						tokens.detachable_keyword.process (Current)
						print_space
					end
				end
				if l_type_mark.is_expanded_mark and not l_base_class.is_expanded then
					tokens.expanded_keyword.process (Current)
					print_space
				end
				if l_type_mark.is_reference_mark and l_base_class.is_expanded then
					tokens.reference_keyword.process (Current)
					print_space
				end
				if l_base_class.current_system.scoop_mode and l_type_mark.is_separate_mark and not l_base_class.is_separate then
					tokens.separate_keyword.process (Current)
					print_space
				end
			end
			process_name_of_named_class (l_base_class.name, l_base_class)
			if attached a_type.actual_parameters as l_actual_parameters and then not l_actual_parameters.is_empty then
				print_space
				l_actual_parameters.process (Current)
			end
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		local
			l_old_class: ET_CLASS
			l_obsolete_string: ET_MANIFEST_STRING
		do
			if use_as_type then
				process_name_of_named_class (a_class.name, a_class)
				if attached a_class.formal_parameters as l_formal_parameters and then not l_formal_parameters.is_empty then
					print_space
					l_formal_parameters.process (Current)
				end
			else
				l_old_class := current_class
				current_class := a_class
				if bom_enabled and then a_class.has_utf8_bom then
					print_bom
				end
				if attached a_class.first_note_clause as l_note_clause then
					l_note_clause.process (Current)
					print_new_line
					print_new_line
				end
				if a_class.frozen_keyword /= Void then
					tokens.frozen_keyword.process (Current)
					print_space
				end
				if attached a_class.class_mark as l_class_mark then
					l_class_mark.process (Current)
					print_space
				end
				if a_class.external_keyword /= Void then
					tokens.external_keyword.process (Current)
					print_space
				end
				tokens.class_keyword.process (Current)
				print_space
				tokens.interface_keyword.process (Current)
				print_space
				process_name_of_named_class (a_class.name, a_class)
				if attached a_class.formal_parameters as l_formal_parameters and then not l_formal_parameters.is_empty then
					print_space
					l_formal_parameters.process (Current)
				end
				print_new_line
				print_new_line
				if attached a_class.obsolete_message as l_obsolete_message then
					tokens.obsolete_keyword.process (Current)
					print_new_line
					print_new_line
					indent
					l_obsolete_string := l_obsolete_message.manifest_string
					l_obsolete_string.process (Current)
					dedent
					print_new_line
					print_new_line
				end
				if attached a_class.creators as l_creators then
					l_creators.process (Current)
				end
				if attached a_class.convert_features as l_convert_features then
					l_convert_features.process (Current)
					print_new_line
					print_new_line
				end
				process_features (a_class)
				process_all_invariants (a_class)
				if attached a_class.second_note_clause as l_note_clause then
					l_note_clause.process (Current)
					print_new_line
					print_new_line
				end
				a_class.end_keyword.process (Current)
				print_new_line
				current_class := l_old_class
			end
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			process_base_type (a_type)
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_creator_list (a_list: ET_CREATOR_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			j, nb2: INTEGER
			l_creator: ET_CREATOR
			l_is_exported: BOOLEAN
			l_any_class: ET_CLASS
		do
			l_any_class := current_class.current_system.any_type.base_class
			nb := a_list.count
			from i := 1 until i > nb loop
				l_creator := a_list.item (i)
				l_is_exported := not attached l_creator.clients_clause as l_clients or else l_clients.has_class (l_any_class)
				if l_is_exported then
					nb2 := l_creator.count
					from j := 1 until j > nb2 loop
						if attached current_class.seeded_procedure (l_creator.feature_name (j).seed) as l_procedure then
							creation_procedures.force_last (l_procedure)
						end
						j := j + 1
					end
				end
				i := i + 1
			end
			if not creation_procedures.is_empty then
				tokens.create_keyword.process (Current)
				print_new_line
				print_new_line
				indent
				creation_procedures.sort (feature_sorter_by_name)
				nb := creation_procedures.count
				from i := 1 until i > nb loop
					creation_procedures.item (i).process (Current)
					print_new_line
					i := i + 1
				end
				dedent
			end
			creation_procedures.wipe_out
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_extended_feature_name (a_extended_feature_name: ET_EXTENDED_FEATURE_NAME)
			-- Process `a_extended_feature_name'.
		local
			l_feature_name: ET_FEATURE_NAME
		do
			l_feature_name := a_extended_feature_name.feature_name
			print_string (l_feature_name.lower_name)
			if attached a_extended_feature_name.alias_names as l_alias_names and then not l_alias_names.is_empty then
				print_space
				l_alias_names.process (Current)
			end
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_feature (a_feature: ET_FEATURE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_obsolete_string: ET_MANIFEST_STRING
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_feature
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_feature.implementation_feature
			l_old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			if a_feature.frozen_keyword /= Void then
				tokens.frozen_keyword.process (Current)
				print_space
			end
			process_extended_feature_name_of_feature (a_feature)
			if attached a_feature.arguments as l_arguments and then not l_arguments.is_empty then
				print_space
				l_arguments.process (Current)
			end
			if attached a_feature.type as l_type then
				tokens.colon_symbol.process (Current)
				print_space
				process_type (l_type)
			end
			if attached {ET_QUERY} a_feature as l_query then
				if attached l_query.assigner as l_assigner then
					print_space
					l_assigner.process (Current)
				end
				if attached {ET_CONSTANT_ATTRIBUTE} l_query as l_constant_attribute then
					print_space
					tokens.equal_symbol.process (Current)
					print_space
					l_constant_attribute.constant.process (Current)
				elseif attached {ET_UNIQUE_ATTRIBUTE} l_query as l_unique_attribute then
					print_space
					tokens.equal_symbol.process (Current)
					print_space
					tokens.unique_keyword.process (Current)
				end
			end
			print_new_line
			indent
			if a_feature.has_non_empty_header_comment then
				indent
				process_header_comment (a_feature)
				if current_class /= a_feature.implementation_class then
					print_comment_text (once "-- (from class {" + a_feature.implementation_class.upper_name  + "})")
				end
				print_new_line
				dedent
			end
			if attached a_feature.first_note as l_note then
				process_note_clause (l_note, False)
				print_new_line
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				tokens.obsolete_keyword.process (Current)
				print_new_line
				indent
				l_obsolete_string := l_obsolete_message.manifest_string
				l_obsolete_string.process (Current)
				print_new_line
				dedent
			end
			process_all_preconditions (a_feature)
			process_all_postconditions (a_feature)
			dedent
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	process_feature_name (a_feature_name: ET_FEATURE_NAME)
			-- Process `a_feature_name'.
		local
			l_feature_name: ET_FEATURE_NAME
		do
			l_feature_name := a_feature_name
			if a_feature_name.is_feature_name then
				if attached target_class as l_target_class then
					if attached l_target_class.seeded_feature (a_feature_name.seed) as l_feature then
						l_feature_name := l_feature.name
					end
				end
			end
			l_feature_name.process (Current)
		end

	process_features (a_class: ET_CLASS)
			-- Process features of `a_class'.
		local
			l_feature_clause: ET_FEATURE_CLAUSE
			l_queries: ET_QUERY_LIST
			l_query: detachable ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: detachable ET_PROCEDURE
			i, nb: INTEGER
			l_name: STRING_8
			l_feature_list: DS_ARRAYED_LIST [ET_FEATURE]
			l_any_class: ET_CLASS
		do
			if attached a_class.feature_clauses as l_feature_clauses then
				nb := l_feature_clauses.count
				from i := 1 until i > nb loop
					l_feature_clause := l_feature_clauses.item (i)
					l_name := feature_clause_name (l_feature_clause)
					feature_clauses.force_last (l_name, l_feature_clause)
					if not features.has (l_name) then
						features.force_last (new_feature_list, l_name)
					end
					i := i + 1
				end
			end
			l_any_class := a_class.current_system.any_type.base_class
			l_queries := a_class.queries
			nb := if flat_enabled then l_queries.count else l_queries.declared_count end
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				if l_query.is_exported_to (l_any_class, system_processor) then
					if attached l_query.feature_clause as l_query_feature_clause then
						if attached feature_clauses.value (l_query_feature_clause) as l_feature_clause_name then
							l_name := l_feature_clause_name
						else
							l_name := feature_clause_name (l_query_feature_clause)
							feature_clauses.force_last (l_name, l_query_feature_clause)
						end
					else
						l_name := once ""
					end
					if attached features.value (l_name) as l_list then
						l_feature_list := l_list
					else
						l_feature_list := new_feature_list
						features.force_last (l_feature_list, l_name)
					end
					l_feature_list.force_last (l_query)
				end
				i := i + 1
			end
			l_procedures := a_class.procedures
			nb := if flat_enabled then l_procedures.count else l_procedures.declared_count end
			from i := 1 until i > nb loop
				l_procedure := l_procedures.item (i)
				if l_procedure.is_exported_to (l_any_class, system_processor) then
					if attached l_procedure.feature_clause as l_procedure_feature_clause then
						if attached feature_clauses.value (l_procedure_feature_clause) as l_feature_clause_name then
							l_name := l_feature_clause_name
						else
							l_name := feature_clause_name (l_procedure_feature_clause)
							feature_clauses.force_last (l_name, l_procedure_feature_clause)
						end
					else
						l_name := once ""
					end
					if attached features.value (l_name) as l_list then
						l_feature_list := l_list
					else
						l_feature_list := new_feature_list
						features.force_last (l_feature_list, l_name)
					end
					l_feature_list.force_last (l_procedure)
				end
				i := i + 1
			end
			from features.start until features.after loop
				l_name := features.key_for_iteration
				l_feature_list := features.item_for_iteration
				if not l_feature_list.is_empty then
					tokens.feature_keyword.process (Current)
					if not l_name.is_empty then
						print_space
						print_comment_text (once "-- " + l_name)
					end
					print_new_line
					print_new_line
					indent
					l_feature_list.sort (feature_sorter_by_name)
					nb := l_feature_list.count
					from i := 1 until i > nb loop
						l_feature_list.item (i).process (Current)
						print_new_line
						i := i + 1
					end
					dedent
				end
				features.forth
			end
			feature_clauses.wipe_out
			from features.start until features.after loop
				free_feature_list (features.item_for_iteration)
				features.forth
			end
			features.wipe_out
		end

	process_header_comment (a_feature: ET_FEATURE)
			-- Process header commend of `a_feature` if any.
			-- Replace "-- <Precursor>" with the header comment of the precursors
			-- of `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_splitter: ST_SPLITTER
			l_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_index: INTEGER
			l_precursors: DS_HASH_SET [ET_FEATURE]
			i, nb: INTEGER
		do
			if attached a_feature.header_break as l_header_break then
				create l_regexp.make
				l_regexp.compile ("(?i)--\s*<precursor/?>")
				create l_splitter.make_with_separators ("%N%R")
				across l_splitter.split (l_header_break.text) as l_line loop
					l_index := l_line.index_of ('-', 1)
					if l_index > 0 then
						l_line.remove_head (l_index - 1)
						l_line.right_adjust
						if l_regexp.recognizes (l_line) then
							if attached a_feature.other_precursors as l_other_precursors then
								create l_precursors.make (l_other_precursors.count + 1)
								if attached a_feature.first_precursor as l_first_precursor then
									l_precursors.put_last (l_first_precursor.implementation_feature)
								end
								nb := l_other_precursors.count
								from i := 1 until i > nb loop
									l_precursors.put_last (l_other_precursors.item (i).implementation_feature)
									i := i + 1
								end
								across l_precursors as l_precursor loop
									process_header_comment (l_precursor)
								end
							elseif attached a_feature.first_precursor as l_first_precursor then
								process_header_comment (l_first_precursor.implementation_feature)
							end
						else
							print_comment_text (l_line)
						end
					end
				end
			end
		end

	process_identifier (a_identifier: ET_IDENTIFIER)
			-- Process `a_identifer`.
		local
			l_seed: INTEGER
		do
			l_seed := a_identifier.seed
			if a_identifier.is_argument and then attached {ET_FEATURE} current_closure as l_current_feature and then attached l_current_feature.arguments as l_arguments and then (l_seed >= 1 and l_seed <= l_arguments.count) then
				print_string (l_arguments.formal_argument (l_seed).name.lower_name)
			else
				precursor (a_identifier)
			end
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE)
			-- Process `an_expression'.
		do
			an_expression.left_brace.process (Current)
			process_type (an_expression.type)
			an_expression.right_brace.process (Current)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			process_base_type (a_type)
		end

	process_type (a_type: ET_TYPE)
			-- Process `a_type`.
		local
			l_named_type: ET_NAMED_TYPE
			l_old_use_as_type: BOOLEAN
		do
			l_named_type := a_type.named_type (current_class)
			if not attached {ET_BASE_TYPE} l_named_type and then attached l_named_type.type_mark as l_type_mark then
				if l_type_mark.is_detachable_mark then
					tokens.detachable_keyword.process (Current)
					print_space
				end
				if l_type_mark.is_expanded_mark then
					tokens.expanded_keyword.process (Current)
					print_space
				end
				if l_type_mark.is_reference_mark then
					tokens.reference_keyword.process (Current)
					print_space
				end
				if l_type_mark.is_separate_mark then
					tokens.separate_keyword.process (Current)
					print_space
				end
			end
			l_old_use_as_type := use_as_type
			set_use_as_type (True)
			l_named_type.process (Current)
			set_use_as_type (l_old_use_as_type)
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_feature (a_feature)
		end

feature {NONE} -- Implementation

	new_feature_list: DS_ARRAYED_LIST [ET_FEATURE]
			-- New empty list of features
		do
			if not unused_feature_lists.is_empty then
				Result := unused_feature_lists.last
				unused_feature_lists.remove_last
				Result.wipe_out
			else
				create Result.make (200)
			end
		ensure
			new_feature_list_not_void: Result /= Void
			is_empty: Result.is_empty
		end

	free_feature_list (a_feature_list: DS_ARRAYED_LIST [ET_FEATURE])
			-- Free `a_feature_list' so that it can be reused.
		require
			a_feature_list_not_void: a_feature_list /= Void
		do
			a_feature_list.wipe_out
			unused_feature_lists.force_last (a_feature_list)
		end

	unused_feature_lists: DS_ARRAYED_LIST [DS_ARRAYED_LIST [ET_FEATURE]]
			-- Feature lists that are not currently used

	creation_procedures: DS_ARRAYED_LIST [ET_FEATURE]
			-- Exported creation procedures

	precursors: DS_HASH_SET [ET_FEATURE]
			-- Feature precursors used to build inherited assertions

	feature_clauses: DS_HASH_TABLE [STRING_8, ET_FEATURE_CLAUSE]
			-- Mapping between feature clauses and their names

	features: DS_HASH_TABLE [DS_ARRAYED_LIST [ET_FEATURE], STRING_8]
			-- Features indexed by feature clause names

	feature_clause_name (a_feature_clause: ET_FEATURE_CLAUSE): STRING_8
			-- Name of `a_feature_clause`
		require
			a_feature_clause_not_void: a_feature_clause /= Void
		do
			string_buffer.wipe_out
			a_feature_clause.append_first_line_comment_to_string (once "", string_buffer)
			string_buffer.left_adjust
			string_buffer.right_adjust
			if string_buffer.starts_with (once "--") then
				string_buffer.remove_head (2)
				string_buffer.left_adjust
			end
			create Result.make_from_string (string_buffer)
			string_buffer.wipe_out
		ensure
			feature_clause_name_not_void: Result /= Void
		end

	has_non_exported_feature_calls (a_assertion: ET_ASSERTION): BOOLEAN
			-- Does `a_assertion` contain some non-exported feature calls?
		require
			a_assertion_not_void: a_assertion /= Void
		do
			non_exported_feature_call_finder.find_non_exported_feature_calls_in_ast_node (a_assertion, current_closure_impl, current_closure, current_class_impl, current_class)
			Result := non_exported_feature_call_finder.has_non_exported_feature_calls
		end

	non_exported_feature_call_finder: ET_NON_EXPORTED_FEATURE_CALL_FINDER
			-- Finder of non-exported feature calls

	string_buffer: STRING_8
			-- Buffer used to build strings

invariant

	creation_procedures_not_void: creation_procedures /= Void
	no_void_creation_procedure: not creation_procedures.has_void
	precursors_not_void: precursors /= Void
	no_void_precursor: not precursors.has_void
	feature_clauses_not_void: feature_clauses /= Void
	no_void_feature_clause: not feature_clauses.has_void
	not_void_feature_clause_name: not feature_clauses.has_void_item
	non_exported_feature_call_finder_not_void: non_exported_feature_call_finder /= Void
	string_buffer_not_void: string_buffer /= Void
	unused_feature_lists_not_void: unused_feature_lists /= Void
	no_void_unused_feature_list: not unused_feature_lists.has_void
	all_unused_feature_list_empty: across unused_feature_lists as l_list all l_list.is_empty end

end
