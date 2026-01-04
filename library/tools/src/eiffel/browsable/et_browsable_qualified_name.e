note

	description:

		"Browsable qualified names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

deferred class ET_BROWSABLE_QUALIFIED_NAME

inherit

	ET_BROWSABLE_NAME

feature {NONE} -- Initialization

	make (a_name: like name; a_target_type: like target_type; a_class: like current_class)
			-- Create a new browsable qualified name.
		require
			a_name_not_void: a_name /= Void
			a_target_type_not_void: a_target_type /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			target_type := a_target_type
			current_class := a_class
		ensure
			name_set: name = a_name
			target_type_set: target_type = a_target_type
			current_class_set: current_class = a_class
		end

feature -- Access

	name: ET_CALL_NAME
			-- AST node corresponding to the name

	target_type: ET_TYPE
			-- Base type of target

feature -- Basic operations

	build_completion (a_builder: ET_BROWSABLE_COMPLETION_BUILDER)
			-- Build list of completion suggestions.
		local
			l_base_class: ET_CLASS
			i, nb: INTEGER
			l_features: ET_FEATURE_LIST
			l_feature: ET_FEATURE
		do
			if not is_completion_disabled then
				l_base_class := target_type.base_class (current_class)
				if not is_only_procedure_expected and not is_only_creation_procedure_expected then
					l_features := l_base_class.queries
					nb := l_features.count
					from i := 1 until i > nb loop
						l_feature := l_features.item (i)
						if not l_feature.is_exported_to (current_class, tokens.null_system_processor) then
							-- Do nothing.
						elseif not is_only_static_call_expected or else l_feature.is_static then
							a_builder.add_query (l_features.item (i), Current)
						end
						i := i + 1
					end
					if
						not is_only_static_call_expected and then
						l_base_class.is_tuple_class and then
						attached target_type.base_type (current_class).actual_parameters as l_actual_parameters
					then
						nb := l_actual_parameters.count
						from i := 1 until i > nb loop
							if attached {ET_LABELED_ACTUAL_PARAMETER} l_actual_parameters.actual_parameter (i) as l_labeled_parameter then
								a_builder.add_tuple_label (l_labeled_parameter, Current)
							end
							i := i + 1
						end
					end
				end
				if not is_only_query_expected then
					l_features := l_base_class.procedures
					nb := l_features.count
					from i := 1 until i > nb loop
						l_feature := l_features.item (i)
						if is_only_creation_procedure_expected then
							if l_feature.is_creation_exported_to (current_class, l_base_class, tokens.null_system_processor) then
								a_builder.add_creation_procedure (l_feature, Current)
							end
						elseif not is_non_exported_feature_allowed and not l_feature.is_exported_to (current_class, tokens.null_system_processor) then
							-- Do nothing.
						elseif not is_only_static_call_expected or else l_feature.is_static then
							a_builder.add_procedure (l_feature, Current)
						end
						i := i + 1
					end
				end
			end
		end

feature -- Output

	append_feature_description_to_string (a_feature: ET_FEATURE; a_string: STRING_8)
			-- Append description of `a_feature` to `a_string'.
		local
			l_nested_type_context: ET_NESTED_TYPE_CONTEXT
			l_target_base_type: ET_BASE_TYPE
			l_creation_clients: ET_CLIENT_LIST
		do
			create l_nested_type_context.make_with_capacity (current_class, 1)
			l_nested_type_context.put_last (target_type)
			l_target_base_type := target_type.base_type (current_class)
			if is_only_creation_procedure_expected then
				a_string.append_string (tokens.create_keyword.text)
				create l_creation_clients.make_with_capacity (20)
				a_feature.add_creation_clients_to (l_creation_clients, l_target_base_type.base_class, tokens.null_system_processor)
				l_creation_clients.append_canonical_client_clause_to_string (" ", a_string)
			else
				a_string.append_string (tokens.feature_keyword.text)
				a_feature.append_canonical_client_clause_to_string (" ", a_string)
			end
			a_string.append_string ("%N%T")
			a_string.append_character ('{')
			l_target_base_type.append_canonical_to_string (a_string)
			a_string.append_character ('}')
			a_string.append_character ('.')
			a_feature.append_canonical_signature_to_string (l_nested_type_context, a_string)
			a_feature.implementation_feature.append_header_comment_to_string ("%N%T%T%T", a_string)
			if l_target_base_type.base_class /= a_feature.implementation_class then
				a_string.append_string ("%N%T%T%T-- (from class ")
				a_string.append_string (a_feature.implementation_class.upper_name)
				a_string.append_character (')')
			end
		end

	append_tuple_label_description_to_string (a_tuple_label: ET_LABELED_ACTUAL_PARAMETER; a_string: STRING_8)
			-- Append description of `a_tuple_label` to `a_string'.
		do
			a_string.append_string (tokens.tuple_class_name.upper_name)
			a_string.append_character (' ')
			a_string.append_character ('[')
			a_string.append_character (' ')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character (' ')
			a_string.append_string (a_tuple_label.label.lower_name)
			a_string.append_character (':')
			a_string.append_character (' ')
			a_tuple_label.type.named_type (current_class).append_canonical_with_leading_type_mark_to_string (a_string)
			a_string.append_character (' ')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character ('.')
			a_string.append_character (' ')
			a_string.append_character (']')
		end

	append_formal_agument_description_to_string (a_argument: ET_FORMAL_ARGUMENT; a_string: STRING_8)
			-- Append description of `a_argument` to `a_string'.
		do
		end

	append_local_variable_description_to_string (a_local_variable: ET_LOCAL_VARIABLE; a_string: STRING_8)
			-- Append description of `a_local_variable` to `a_string'.
		do
		end

	append_class_description_to_string (a_class: ET_CLASS; a_string: STRING_8)
			-- Append description of `a_class` to `a_string'.
		do
		end

	append_formal_parameter_description_to_string (a_formal_parameter: ET_FORMAL_PARAMETER; a_string: STRING_8)
			-- Append description of `a_formal_parameter` to `a_string'.
		do
		end

invariant

	target_type_not_void: target_type /= Void

end
