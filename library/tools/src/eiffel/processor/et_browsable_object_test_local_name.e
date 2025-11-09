note

	description:

		"Browsable names of object test locals"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_OBJECT_TEST_LOCAL_NAME

inherit

	ET_BROWSABLE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_type: like type; a_object_test: like object_test; a_class: like current_class)
			-- Create a new browsable object test local name.
		require
			a_name_not_void: a_name /= Void
			a_name_is_object_test_local: a_name.is_object_test_local
			a_type_not_void: a_type /= Void
			a_object_test_not_void: a_object_test /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			type := a_type
			object_test := a_object_test
			current_class := a_class
		ensure
			name_set: name = a_name
			type_set: type = a_type
			object_test_not_void: object_test = a_object_test
			current_class_not_void: current_class = a_class
		end

feature -- Access

	name: ET_IDENTIFIER
			-- AST node corresponding to the local name

	type: ET_TYPE
			-- Type of `name`

	object_test: ET_OBJECT_TEST
			-- Object test

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			a_string.append_string (tokens.attached_keyword.text)
			a_string.append_character (' ')
			a_string.append_string (name.lower_name)
			a_string.append_character (':')
			a_string.append_character (' ')
			type.named_type (current_class).append_canonical_with_leading_type_mark_to_string (a_string)
		end

invariant

	name_is_object_test_local: name.is_object_test_local
	type_not_void: type /= Void
	object_test_not_void: object_test /= Void

end
