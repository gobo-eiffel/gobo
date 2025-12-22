note

	description:

		"Browsable feature aliases"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_UNQUALIFIED_ALIAS_NAME

inherit

	ET_BROWSABLE_UNQUALIFIED_NAME
		redefine
			name
		end

create

	make

feature -- Access

	name: ET_MANIFEST_STRING
			-- AST node corresponding to the name

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			if attached {ET_FEATURE} current_closure as l_feature then
				append_feature_description_to_string (l_feature, a_string)
			end
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		local
			l_feature_impl: ET_FEATURE
		do
			if attached {ET_FEATURE} current_closure as l_feature then
				l_feature_impl := l_feature.implementation_feature
				Result := [l_feature_impl.name, l_feature_impl.implementation_class]
			end
		end

	type_definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the type of the current browsable name is defined
		local
			l_base_class: ET_CLASS
		do
			if not attached {ET_FEATURE} current_closure as l_feature then
				-- No type definition.
			elseif attached l_feature.type as l_type then
				l_base_class := l_type.base_class (current_class)
				Result := [l_base_class.name, l_base_class]
			end
		end

end
