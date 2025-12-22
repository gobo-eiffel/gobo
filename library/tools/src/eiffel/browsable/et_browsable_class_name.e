note

	description:

		"Browsable names of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_CLASS_NAME

inherit

	ET_BROWSABLE_NAMED_TYPE
		redefine
			append_description_to_string,
			definition_ast_node,
			type_definition_ast_node
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_actual_class: like actual_class; a_current_class: like current_class)
			-- Create a new browsable class name.
		require
			a_name_not_void: a_name /= Void
			a_actual_class_not_void: a_actual_class /= Void
			a_current_class_not_void: a_current_class /= Void
		do
			name := a_name
			actual_class := a_actual_class
			current_class := a_current_class
		ensure
			name_set: name = a_name
			actual_class_set: actual_class = a_actual_class
			current_class_set: current_class = a_current_class
		end

feature -- Access

	name: ET_CLASS_NAME
			-- AST node corresponding to the class name

	actual_class: ET_CLASS
			-- Class corresponding to `name'

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			if not actual_class.is_unknown then
				append_class_description_to_string (actual_class, a_string)
			end
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		do
			if not actual_class.is_unknown then
				Result := [actual_class.name, actual_class]
			end
		end

	type_definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the type of the current browsable name is defined
		do
			if not actual_class.is_unknown then
				Result := [actual_class.name, actual_class]
			end
		end

invariant

	actual_class_not_void: actual_class /= Void

end
