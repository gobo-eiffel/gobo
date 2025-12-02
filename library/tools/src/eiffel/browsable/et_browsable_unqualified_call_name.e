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
		do
			a_string.append_string (tokens.feature_keyword.text)
			call_feature.append_canonical_client_clause_to_string (" ", a_string)
			a_string.append_string ("%N%T")
			call_feature.append_canonical_signature_to_string (current_class, a_string)
			call_feature.implementation_feature.append_header_comment_to_string ("%N%T%T%T", a_string)
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
