note

	description:

		"Browsable names of local variables"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_LOCAL_NAME

inherit

	ET_BROWSABLE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_local_variable: like local_variable; a_class: like current_class)
			-- Create a new browsable local variable name.
		require
			a_name_not_void: a_name /= Void
			a_name_is_local: a_name.is_local
			a_local_variable_not_void: a_local_variable /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			local_variable := a_local_variable
			current_class := a_class
		ensure
			name_set: name = a_name
			local_variable_not_void: local_variable = a_local_variable
			current_class_not_void: current_class = a_class
		end

feature -- Access

	name: ET_IDENTIFIER
			-- AST node corresponding to the local name

	local_variable: ET_LOCAL_VARIABLE
			-- Local variable

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			a_string.append_string (tokens.local_keyword.text)
			a_string.append_character (' ')
			a_string.append_string (name.lower_name)
			a_string.append_character (':')
			a_string.append_character (' ')
			local_variable.type.named_type_with_type_mark (tokens.detachable_keyword, current_class).append_canonical_with_leading_type_mark_to_string (a_string)
		end

invariant

	name_is_local: name.is_local
	local_variable_not_void: local_variable /= Void

end
