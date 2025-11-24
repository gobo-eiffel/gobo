note

	description:

		"Browsable names of unqualified calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_UNQUALIFIED_CALL_NAME

inherit

	ET_BROWSABLE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_call_feature: like call_feature; a_class: like current_class)
			-- Create a new browsable unqualified call name.
		require
			a_name_not_void: a_name /= Void
			a_call_feature_not_void: a_call_feature /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			call_feature := a_call_feature
			current_class := a_class
		ensure
			name_set: name = a_name
			call_feature_not_void: call_feature = a_call_feature
			current_class_not_void: current_class = a_class
		end

feature -- Access

	name: ET_AST_NODE
			-- AST node corresponding to the call name

	call_feature: ET_FEATURE
			-- Feature of the call

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		local
			i, nb: INTEGER
			l_argument: ET_FORMAL_ARGUMENT
			l_splitter: ST_SPLITTER
			l_index: INTEGER
			l_clients: ET_CLIENT_LIST
		do
			a_string.append_string (tokens.feature_keyword.text)
			l_clients := call_feature.clients
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
			a_string.append_string ("%N%T")
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
					l_argument.type.named_type (current_class).append_canonical_with_leading_type_mark_to_string (a_string)
					i := i + 1
				end
				a_string.append_character (')')
			end
			if attached call_feature.type as l_type then
				a_string.append_character (':')
				a_string.append_character (' ')
				l_type.named_type (current_class).append_canonical_with_leading_type_mark_to_string (a_string)
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
			if current_class /= call_feature.implementation_class then
				a_string.append_string ("%N%T%T%T-- (from class ")
				a_string.append_string (call_feature.implementation_class.upper_name)
				a_string.append_character (')')
			end
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		local
			l_feature: ET_FEATURE
		do
			l_feature := call_feature.implementation_feature
			Result := [l_feature.name, l_feature.implementation_class]
		end

invariant

	call_feature_not_void: call_feature /= Void

end
