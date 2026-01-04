note

	description:

		"Browsable unqualified names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

deferred class ET_BROWSABLE_UNQUALIFIED_NAME

inherit

	ET_BROWSABLE_NAME

feature {NONE} -- Initialization

	make (a_name: like name; a_closure: like current_closure; a_class: like current_class)
			-- Create a new browsable unqualified name.
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			current_closure := a_closure
			current_class := a_class
		ensure
			name_set: name = a_name
			current_closure_set: current_closure = a_closure
			current_class_set: current_class = a_class
		end

feature -- Access

	name: ET_AST_NODE
			-- AST node corresponding to the name

	current_closure: detachable ET_CLOSURE
			-- Encloding closure, if any

feature -- Basic operations

	build_completion (a_builder: ET_BROWSABLE_COMPLETION_BUILDER)
			-- Build list of completion suggestions.
		local
			i, nb: INTEGER
			l_features: ET_FEATURE_LIST
			l_feature: ET_FEATURE
		do
			if not is_completion_disabled then
				if not is_only_procedure_expected and not is_only_creation_procedure_expected then
					l_features := current_class.queries
					nb := l_features.count
					from i := 1 until i > nb loop
						l_feature := l_features.item (i)
						a_builder.add_query (l_features.item (i), Current)
						i := i + 1
					end
				end
				if not is_only_query_expected then
					l_features := current_class.procedures
					nb := l_features.count
					from i := 1 until i > nb loop
						l_feature := l_features.item (i)
						a_builder.add_procedure (l_feature, Current)
						i := i + 1
					end
				end
				if not is_only_feature_name_expected then
					if attached current_closure as l_closure then
						if not is_only_procedure_expected and then not is_only_creation_procedure_expected then
							if attached l_closure.arguments as l_arguments then
								nb := l_arguments.count
								from i := 1 until i > nb loop
									a_builder.add_formal_argument (l_arguments.formal_argument (i), Current)
									i := i + 1
								end
							end
							if attached l_closure.locals as l_locals then
								nb := l_locals.count
								from i := 1 until i > nb loop
									a_builder.add_local_variable (l_locals.local_variable (i), Current)
									i := i + 1
								end
							end
							if attached l_closure.object_tests as l_object_tests then
								nb := l_object_tests.count
								from i := 1 until i > nb loop
									a_builder.add_object_test_local (l_object_tests.object_test (i), Current)
									i := i + 1
								end
							end
							if attached l_closure.iteration_components as l_iteration_components then
								nb := l_iteration_components.count
								from i := 1 until i > nb loop
									a_builder.add_iteration_item (l_iteration_components.iteration_component (i), Current)
									i := i + 1
								end
							end
							if attached l_closure.inline_separate_arguments as l_inline_separate_arguments then
								nb := l_inline_separate_arguments.count
								from i := 1 until i > nb loop
									a_builder.add_inline_separate_argument (l_inline_separate_arguments.argument (i), Current)
									i := i + 1
								end
							end
							if attached {ET_QUERY} l_closure then
									-- Warning: not valid in preconditions.
								a_builder.add_keyword (tokens.result_keyword, Current)
							end
								-- Warning: valid only in postconditions.
							a_builder.add_keyword (tokens.class_keyword, Current)
							a_builder.add_keyword (tokens.old_keyword, Current)
						end
						if attached {ET_FEATURE} l_closure as l_closure_feature and then l_closure_feature.first_precursor /= Void then
							a_builder.add_keyword (tokens.precursor_keyword, Current)
						end
					end
					if not is_only_procedure_expected and then not is_only_creation_procedure_expected then
						a_builder.add_keyword (tokens.agent_keyword, Current)
						a_builder.add_keyword (tokens.attached_keyword, Current)
						a_builder.add_keyword (tokens.current_keyword, Current)
						a_builder.add_keyword (tokens.false_keyword, Current)
						a_builder.add_keyword (tokens.not_keyword, Current)
						a_builder.add_keyword (tokens.once_keyword, Current)
						a_builder.add_keyword (tokens.true_keyword, Current)
						a_builder.add_keyword (tokens.void_keyword, Current)
					end
					if not is_only_query_expected then
						a_builder.add_keyword (tokens.check_keyword, Current)
						a_builder.add_keyword (tokens.debug_keyword, Current)
						a_builder.add_keyword (tokens.else_keyword, Current)
						a_builder.add_keyword (tokens.elseif_keyword, Current)
						a_builder.add_keyword (tokens.end_keyword, Current)
						a_builder.add_keyword (tokens.ensure_keyword, Current)
						a_builder.add_keyword (tokens.rescue_keyword, Current)
						a_builder.add_keyword (tokens.retry_keyword, Current)
						a_builder.add_keyword (tokens.separate_keyword, Current)
					end
					a_builder.add_keyword (tokens.across_keyword, Current)
					a_builder.add_keyword (tokens.create_keyword, Current)
					a_builder.add_keyword (tokens.from_keyword, Current)
					a_builder.add_keyword (tokens.if_keyword, Current)
					a_builder.add_keyword (tokens.inspect_keyword, Current)
				end
			end
		end

feature -- Output

	append_feature_description_to_string (a_feature: ET_FEATURE; a_string: STRING_8)
			-- Append description of `a_feature` to `a_string'.
		local
			l_creation_clients: ET_CLIENT_LIST
		do
			if is_only_creation_procedure_expected then
				a_string.append_string (tokens.create_keyword.text)
				create l_creation_clients.make_with_capacity (20)
				a_feature.add_creation_clients_to (l_creation_clients, current_class, tokens.null_system_processor)
				l_creation_clients.append_canonical_client_clause_to_string (" ", a_string)
			else
				a_string.append_string (tokens.feature_keyword.text)
				a_feature.append_canonical_client_clause_to_string (" ", a_string)
			end
			a_string.append_string ("%N%T")
			a_feature.append_canonical_signature_to_string (current_class, a_string)
			a_feature.implementation_feature.append_header_comment_to_string ("%N%T%T%T", a_string)
			if current_class /= a_feature.implementation_class then
				a_string.append_string ("%N%T%T%T-- (from class ")
				a_string.append_string (a_feature.implementation_class.upper_name)
				a_string.append_character (')')
			end
		end

	append_tuple_label_description_to_string (a_tuple_label: ET_LABELED_ACTUAL_PARAMETER; a_string: STRING_8)
			-- Append description of `a_tuple_label` to `a_string'.
		do
		end

	append_formal_agument_description_to_string (a_argument: ET_FORMAL_ARGUMENT; a_string: STRING_8)
			-- Append description of `a_argument` to `a_string'.
		do
			a_string.append_character ('f')
			a_string.append_character (' ')
			a_string.append_character ('(')
			a_string.append_character (' ')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character (' ')
			a_string.append_string (a_argument.name.lower_name)
			a_string.append_character (':')
			a_string.append_character (' ')
			a_argument.type.named_type (current_class).append_canonical_with_leading_type_mark_to_string (a_string)
			a_string.append_character (' ')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character (' ')
			a_string.append_character (')')
		end

	append_local_variable_description_to_string (a_local_variable: ET_LOCAL_VARIABLE; a_string: STRING_8)
			-- Append description of `a_local_variable` to `a_string'.
		do
			a_string.append_string (tokens.local_keyword.text)
			a_string.append_character (' ')
			a_string.append_string (a_local_variable.name.lower_name)
			a_string.append_character (':')
			a_string.append_character (' ')
			a_local_variable.type.named_type_with_type_mark (tokens.detachable_keyword, current_class).append_canonical_with_leading_type_mark_to_string (a_string)
		end

	append_class_description_to_string (a_class: ET_CLASS; a_string: STRING_8)
			-- Append description of `a_class` to `a_string'.
		do
		end

	append_formal_parameter_description_to_string (a_formal_parameter: ET_FORMAL_PARAMETER; a_string: STRING_8)
			-- Append description of `a_formal_parameter` to `a_string'.
		do
		end

end
