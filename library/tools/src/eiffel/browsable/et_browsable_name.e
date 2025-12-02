note

	description:

		"Names in the AST which can point to browsable information"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class ET_BROWSABLE_NAME

inherit

	ANY

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

feature -- Access

	current_class: ET_CLASS
			-- Class whose text contains the browsable name

	name: ET_AST_NODE
			-- AST node corresponding to the browsable name
		deferred
		ensure
			name_not_void: Result /= Void
		end

feature -- Output

	description: STRING_8
			-- Description of current browsable name
		do
			create Result.make (15)
			append_description_to_string (Result)
		ensure
			description_not_void: Result /= Void
			description_is_string_8: Result.same_type ({STRING_8} "")
			valid_utf8: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
		end

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		deferred
		end

invariant

	current_class_not_void: current_class /= Void

end
