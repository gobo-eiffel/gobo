note

	description:

		"Browsable names of iteration items"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_ITERATION_ITEM_NAME

inherit

	ET_BROWSABLE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_type: like type; a_iteration_component: like iteration_component; a_class: like current_class)
			-- Create a new browsable iteration item name.
		require
			a_name_not_void: a_name /= Void
			a_name_is_iteration_item: a_name.is_iteration_item
			a_type_not_void: a_type /= Void
			a_iteration_component_not_void: a_iteration_component /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			type := a_type
			iteration_component := a_iteration_component
			current_class := a_class
		ensure
			name_set: name = a_name
			type_set: type = a_type
			iteration_component_not_void: iteration_component = a_iteration_component
			current_class_not_void: current_class = a_class
		end

feature -- Access

	name: ET_IDENTIFIER
			-- AST node corresponding to the iteration item name

	type: ET_TYPE
			-- Type of `name`

	iteration_component: ET_ITERATION_COMPONENT
			-- Iteration component

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			a_string.append_string (tokens.across_keyword.text)
			a_string.append_character (' ')
			a_string.append_string (name.lower_name)
			a_string.append_character (':')
			a_string.append_character (' ')
			type.named_type (current_class).append_canonical_with_leading_type_mark_to_string (a_string)
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		do
			Result := [iteration_component.item_name, current_class]
		end

invariant

	name_is_iteration_item: name.is_iteration_item
	type_not_void: type /= Void
	iteration_component_not_void: iteration_component /= Void

end
