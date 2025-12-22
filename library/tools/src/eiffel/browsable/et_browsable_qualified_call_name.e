note

	description:

		"Browsable qualified call names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_QUALIFIED_CALL_NAME

inherit

	ET_BROWSABLE_QUALIFIED_NAME

create

	make

feature -- Access

	call_feature: detachable ET_FEATURE
			-- Feature of the call, if any
		local
			l_seed: INTEGER
		do
			l_seed := name.seed
			if l_seed /= 0 then
				Result := target_type.base_class (current_class).seeded_feature (l_seed)
			end
		end

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			if attached call_feature as l_feature then
				append_feature_description_to_string (l_feature, a_string)
			end
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		local
			l_feature_impl: ET_FEATURE
		do
			if attached call_feature as l_feature then
				l_feature_impl := l_feature.implementation_feature
				Result := [l_feature_impl.name, l_feature_impl.implementation_class]
			end
		end

	type_definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the type of the current browsable name is defined
		local
			l_nested_type_context: ET_NESTED_TYPE_CONTEXT
			l_base_class: ET_CLASS
		do
			if not attached call_feature as l_feature then
				-- No type definition.
			elseif attached l_feature.type as l_type then
				create l_nested_type_context.make_with_capacity (current_class, 1)
				l_nested_type_context.put_last (target_type)
				l_base_class := l_type.base_class (l_nested_type_context)
				Result := [l_base_class.name, l_base_class]
			end
		end

end
