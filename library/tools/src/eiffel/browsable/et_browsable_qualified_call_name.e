note

	description:

		"Browsable names of qualified calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_QUALIFIED_CALL_NAME

inherit

	ET_BROWSABLE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_call_feature: like call_feature; a_target_type: like target_type; a_class: like current_class)
			-- Create a new browsable unqualified call name.
		require
			a_name_not_void: a_name /= Void
			a_call_feature_not_void: a_call_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			call_feature := a_call_feature
			target_type := a_target_type
			current_class := a_class
		ensure
			name_set: name = a_name
			call_feature_not_void: call_feature = a_call_feature
			target_type_set: target_type = a_target_type
			current_class_not_void: current_class = a_class
		end

feature -- Access

	name: ET_AST_NODE
			-- AST node corresponding to the call name

	call_feature: ET_FEATURE
			-- Feature of the call

	target_type: ET_TYPE
			-- Base type of target of the call

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		local
			l_nested_type_context: ET_NESTED_TYPE_CONTEXT
			l_target_base_type: ET_BASE_TYPE
		do
			create l_nested_type_context.make_with_capacity (current_class, 1)
			l_nested_type_context.put_last (target_type)
			a_string.append_string (tokens.feature_keyword.text)
			call_feature.append_canonical_client_clause_to_string (" ", a_string)
			a_string.append_string ("%N%T")
			a_string.append_character ('{')
			l_target_base_type := target_type.base_type (current_class)
			l_target_base_type.append_canonical_to_string (a_string)
			a_string.append_character ('}')
			a_string.append_character ('.')
			call_feature.append_canonical_signature_to_string (l_nested_type_context, a_string)
			call_feature.implementation_feature.append_header_comment_to_string ("%N%T%T%T", a_string)
			if l_target_base_type.base_class /= call_feature.implementation_class then
				a_string.append_string ("%N%T%T%T-- (from class ")
				a_string.append_string (call_feature.implementation_class.upper_name)
				a_string.append_character (')')
			end
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		local
			l_feature: ET_FEATURE
		do
			l_feature := call_feature.implementation_feature
			Result := [l_feature.name, l_feature.implementation_class]
		end

	type_definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the type of the current browsable name is defined
		local
			l_nested_type_context: ET_NESTED_TYPE_CONTEXT
			l_base_class: ET_CLASS
		do
			if attached call_feature.type as l_type then
				create l_nested_type_context.make_with_capacity (current_class, 1)
				l_nested_type_context.put_last (target_type)
				l_base_class := l_type.base_class (l_nested_type_context)
				Result := [l_base_class.name, l_base_class]
			end
		end

invariant

	call_feature_not_void: call_feature /= Void
	target_type_not_void: target_type /= Void

end
