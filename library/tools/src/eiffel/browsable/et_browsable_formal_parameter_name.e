note

	description:

		"Browsable names of formal parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_FORMAL_PARAMETER_NAME

inherit

	ET_BROWSABLE_NAME

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
			formal_parameter_not_void: formal_parameter = a_formal_parameter
			current_class_not_void: current_class = a_class
		end

feature -- Access

	name: ET_IDENTIFIER
			-- AST node corresponding to the formal parameter

	formal_parameter: ET_FORMAL_PARAMETER
			-- Formal parameter

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		local
			l_printer: ET_AST_PRETTY_PRINTER
			l_stream: KL_STRING_OUTPUT_STREAM
		do
			a_string.append_character ('[')
			a_string.append_character (' ')
			a_string.append_string (name.upper_name)
			a_string.append_character (' ')
			a_string.append_string (tokens.arrow_symbol.text)
			a_string.append_character (' ')
			if attached formal_parameter.constraint as l_constraint then
				create l_stream.make (a_string)
				create l_printer.make (l_stream)
				l_constraint.process (l_printer)
				if attached formal_parameter.creation_procedures as l_creation_procedures then
					a_string.append_character (' ')
					l_creation_procedures.process (l_printer)
				end
			else
				a_string.append_string (tokens.detachable_keyword.text)
				a_string.append_character (' ')
				a_string.append_string (tokens.separate_keyword.text)
				a_string.append_character (' ')
				a_string.append_string (tokens.any_class_name.upper_name)
			end
			a_string.append_character (' ')
			a_string.append_character (']')
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		do
			Result := [formal_parameter.name, current_class]
		end

	type_definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the type of the current browsable name is defined
		do
		end

invariant

	formal_parameter_not_void: formal_parameter /= Void

end
