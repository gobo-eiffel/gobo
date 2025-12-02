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
			i, nb: INTEGER
			l_argument: ET_FORMAL_ARGUMENT
			l_splitter: ST_SPLITTER
			l_index: INTEGER
			l_nested_type_context: ET_NESTED_TYPE_CONTEXT
			l_clients: ET_CLIENT_LIST
			l_target_base_type: ET_BASE_TYPE
		do
			create l_nested_type_context.make_with_capacity (current_class, 1)
			l_nested_type_context.put_last (target_type)
			a_string.append_string (tokens.create_keyword.text)
			if attached l_nested_type_context.base_class.creators as l_creators then
				create l_clients.make_with_capacity (10)
				l_creators.add_creation_clients_to (name, l_clients)
				if l_clients.is_none then
					a_string.append_character (' ')
					a_string.append_character ('{')
					a_string.append_string (tokens.none_class_name.upper_name)
					a_string.append_character ('}')
				elseif not l_clients.is_any then
					a_string.append_character (' ')
					a_string.append_character ('{')
					nb := l_clients.count
					from i := 1 until i > nb loop
						if i /= 1 then
							a_string.append_character (',')
							a_string.append_character (' ')
						end
						a_string.append_string (l_clients.client (i).name.upper_name)
						i := i + 1
					end
					a_string.append_character ('}')
				end
			end
			a_string.append_string ("%N%T")
			a_string.append_character ('{')
			l_target_base_type := target_type.base_type (current_class)
			l_target_base_type.append_canonical_to_string (a_string)
			a_string.append_character ('}')
			a_string.append_character ('.')
			a_string.append_string (call_feature.lower_name)
			if attached call_feature.alias_names as l_alias_names then
				nb := l_alias_names.count
				from i := 1 until i > nb loop
					a_string.append_character (' ')
					a_string.append_string (l_alias_names.item (i).alias_lower_name)
					i := i + 1
				end
			end
			if attached call_feature.arguments as l_arguments and then not l_arguments.is_empty then
				a_string.append_character (' ')
				a_string.append_character ('(')
				nb := l_arguments.count
				from i := 1 until i > nb loop
					if i /= 1 then
						a_string.append_character (';')
						a_string.append_character (' ')
					end
					l_argument := l_arguments.formal_argument (i)
					a_string.append_string (l_argument.name.lower_name)
					a_string.append_character (':')
					a_string.append_character (' ')
					l_argument.type.named_type (l_nested_type_context).append_canonical_with_leading_type_mark_to_string (a_string)
					i := i + 1
				end
				a_string.append_character (')')
			end
			if attached call_feature.type as l_type then
				a_string.append_character (':')
				a_string.append_character (' ')
				l_type.named_type (l_nested_type_context).append_canonical_with_leading_type_mark_to_string (a_string)
			end
			if attached call_feature.implementation_feature.header_break as l_header_break then
				create l_splitter.make_with_separators ("%N%R")
				across l_splitter.split (l_header_break.text) as l_line loop
					l_index := l_line.index_of ('-', 1)
					if l_index > 0 then
						l_line.remove_head (l_index - 1)
						a_string.append_string ("%N%T%T%T")
						a_string.append_string (l_line)
					end
				end
			end
			if l_target_base_type.base_class /= call_feature.implementation_class then
				a_string.append_string ("%N%T%T%T-- (from class ")
				a_string.append_string (call_feature.implementation_class.upper_name)
				a_string.append_character (')')
			end
		end

end
