note

	description:

		"Browsable names of qualified calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_CREATION_CALL_NAME

inherit

	ET_BROWSABLE_QUALIFIED_CALL_NAME
		redefine
			name,
			append_description_to_string
		end

create

	make

feature -- Access

	name: ET_FEATURE_NAME
			-- AST node corresponding to the creation procedure name

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		local
			l_nested_type_context: ET_NESTED_TYPE_CONTEXT
			l_target_base_type: ET_BASE_TYPE
		do
			create l_nested_type_context.make_with_capacity (current_class, 1)
			l_nested_type_context.put_last (target_type)
			a_string.append_string (tokens.create_keyword.text)
			call_feature.append_canonical_client_clause_to_string (" ", a_string)
			a_string.append_string ("%N%T")
			a_string.append_character ('{')
			l_target_base_type := target_type.base_type (current_class)
			l_target_base_type.append_canonical_to_string (a_string)
			a_string.append_character ('}')
			a_string.append_character ('.')
			call_feature.append_canonical_signature_to_string (l_nested_type_context, a_string)
			call_feature.implementation_feature.append_header_comment_to_string ("%N%T%T%T", a_string)
			if l_target_base_type.base_class /= call_feature.implementation_class then
				a_string.append_string ("%N%T%T%T-- (from class ")
				a_string.append_string (call_feature.implementation_class.upper_name)
				a_string.append_character (')')
			end
		end

end
