note

	description:

		"Browsable names of formal parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_FORMAL_PARAMETER_NAME

inherit

	ET_BROWSABLE_NAMED_TYPE
		redefine
			append_description_to_string,
			definition_ast_node
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_formal_parameter: like formal_parameter; a_class: like current_class)
			-- Create a new browsable formal parameter name.
		require
			a_name_not_void: a_name /= Void
			a_formal_parameter_not_void: a_formal_parameter /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			formal_parameter := a_formal_parameter
			current_class := a_class
		ensure
			name_set: name = a_name
			formal_parameter_set: formal_parameter = a_formal_parameter
			current_class_set: current_class = a_class
		end

feature -- Access

	name: ET_IDENTIFIER
			-- AST node corresponding to the formal parameter

	formal_parameter: ET_FORMAL_PARAMETER
			-- Formal parameter

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			append_formal_parameter_description_to_string (formal_parameter, a_string)
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		do
			Result := [formal_parameter.name, current_class]
		end

invariant

	formal_parameter_not_void: formal_parameter /= Void

end
