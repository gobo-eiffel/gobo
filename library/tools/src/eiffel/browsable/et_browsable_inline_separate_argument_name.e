note

	description:

		"Browsable names of inline separate arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_INLINE_SEPARATE_ARGUMENT_NAME

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
			-- Create a new browsable inline separate argument name.
		require
			a_name_not_void: a_name /= Void
			a_name_is_inline_separate_argument: a_name.is_inline_separate_argument
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
			-- AST node corresponding to the inline separate argument name

	type: ET_TYPE
			-- Type of `name`

	inline_separate_argument: detachable ET_INLINE_SEPARATE_ARGUMENT
			-- Inline separate argument, if any
		local
			l_seed: INTEGER
		do
			if attached current_closure as l_closure and then attached l_closure.inline_separate_arguments as l_inline_separate_arguments then
				l_seed := name.seed
				if l_seed >= 1 and l_seed <= l_inline_separate_arguments.count then
					Result := l_inline_separate_arguments.argument (l_seed)
				end
			end
		end

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
			if attached inline_separate_argument as l_inline_separate_argument then
				Result := [l_inline_separate_argument.name, current_class]
			end
		end

	type_definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the type of the current browsable name is defined
		local
			l_base_class: ET_CLASS
		do
			l_base_class := type.base_class (current_class)
			Result := [l_base_class.name, l_base_class]
		end

invariant

	name_is_inline_separate_argument: name.is_inline_separate_argument
	type_not_void: type /= Void

end
