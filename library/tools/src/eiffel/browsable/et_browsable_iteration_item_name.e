note

	description:

		"Browsable names of iteration items"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_ITERATION_ITEM_NAME

inherit

	ET_BROWSABLE_UNQUALIFIED_NAME
		rename
			make as make_browsable_unqualified_name
		redefine
			name
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_type: like type; a_closure: like current_closure; a_class: like current_class)
			-- Create a new browsable iteration item name.
		require
			a_name_not_void: a_name /= Void
			a_name_is_iteration_item: a_name.is_iteration_item
			a_type_not_void: a_type /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			type := a_type
			current_closure := a_closure
			current_class := a_class
		ensure
			name_set: name = a_name
			type_set: type = a_type
			current_closure_set: current_closure = a_closure
			current_class_set: current_class = a_class
		end

feature -- Access

	name: ET_IDENTIFIER
			-- AST node corresponding to the iteration item name

	type: ET_TYPE
			-- Type of `name`

	iteration_component: detachable ET_ITERATION_COMPONENT
			-- Iteration component, if any
		local
			l_seed: INTEGER
		do
			if attached current_closure as l_closure and then attached l_closure.iteration_components as l_iteration_components then
				l_seed := name.seed
				if l_seed >= 1 and l_seed <= l_iteration_components.count then
					Result := l_iteration_components.iteration_component (l_seed)
				end
			end
		end

feature -- Basic operations

	build_definition (a_builder: ET_BROWSABLE_DEFINITION_BUILDER)
			-- Build list of definitions.
		do
			if attached iteration_component as l_iteration_component then
				a_builder.add_iteration_item (l_iteration_component, Current)
			end
		end

	build_type_definition (a_builder: ET_BROWSABLE_TYPE_DEFINITION_BUILDER)
			-- Build list of type definitions.
		local
			l_base_class: ET_CLASS
		do
			l_base_class := type.base_class (current_class)
			a_builder.add_class (l_base_class, Current)
		end

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

invariant

	name_is_iteration_item: name.is_iteration_item
	type_not_void: type /= Void

end
