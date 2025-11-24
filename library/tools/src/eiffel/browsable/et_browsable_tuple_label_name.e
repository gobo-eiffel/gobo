note

	description:

		"Browsable names of tuple labels"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_TUPLE_LABEL_NAME

inherit

	ET_BROWSABLE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_labeled_parameter: like labeled_parameter; a_class: like current_class)
			-- Create a new browsable local variable name.
		require
			a_name_not_void: a_name /= Void
			a_name_is_tuple_label: a_name.is_tuple_label
			a_labeled_parameter_not_void: a_labeled_parameter /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			labeled_parameter := a_labeled_parameter
			current_class := a_class
		ensure
			name_set: name = a_name
			labeled_parameter_not_void: labeled_parameter = a_labeled_parameter
			current_class_not_void: current_class = a_class
		end

feature -- Access

	name: ET_IDENTIFIER
			-- AST node corresponding to the tuple label name

	labeled_parameter: ET_LABELED_ACTUAL_PARAMETER
			-- Labeled actual generic parameter

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			a_string.append_string (tokens.tuple_class_name.upper_name)
			a_string.append_character (' ')
			a_string.append_character ('[')
			a_string.append_string (name.lower_name)
			a_string.append_character (':')
			a_string.append_character (' ')
			labeled_parameter.type.named_type (current_class).append_canonical_with_leading_type_mark_to_string (a_string)
			a_string.append_character (']')
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		do
			Result := [labeled_parameter.label, labeled_parameter.implementation_class]
		end

invariant

	name_is_tuple_label: name.is_tuple_label
	labeled_parameter_not_void: labeled_parameter /= Void

end
