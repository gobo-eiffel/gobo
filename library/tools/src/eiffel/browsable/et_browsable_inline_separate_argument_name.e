note

	description:

		"Browsable names of inline separate arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_INLINE_SEPARATE_ARGUMENT_NAME

inherit

	ET_BROWSABLE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_type: like type; a_inline_separate_argument: like inline_separate_argument; a_class: like current_class)
			-- Create a new browsable inline separate argument name.
		require
			a_name_not_void: a_name /= Void
			a_name_is_inline_separate_argument: a_name.is_inline_separate_argument
			a_type_not_void: a_type /= Void
			a_inline_separate_argument_not_void: a_inline_separate_argument/= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			type := a_type
			inline_separate_argument := a_inline_separate_argument
			current_class := a_class
		ensure
			name_set: name = a_name
			type_set: type = a_type
			inline_separate_argument_not_void: inline_separate_argument = a_inline_separate_argument
			current_class_not_void: current_class = a_class
		end

feature -- Access

	name: ET_IDENTIFIER
			-- AST node corresponding to the inline separate argument name

	type: ET_TYPE
			-- Type of `name`

	inline_separate_argument: ET_INLINE_SEPARATE_ARGUMENT
			-- Inline separate argument

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			a_string.append_string (tokens.separate_keyword.text)
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
			Result := [inline_separate_argument.name, current_class]
		end

invariant

	name_is_inline_separate_argument: name.is_inline_separate_argument
	type_not_void: type /= Void
	inline_separate_argument_not_void: inline_separate_argument /= Void

end
