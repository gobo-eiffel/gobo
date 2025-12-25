note

	description:

		"Browsable names of precursor calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_PRECURSOR_NAME

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

	make (a_name: like name; a_target_type: like target_type; a_closure: like current_closure; a_class: like current_class)
			-- Create a new browsable precursor name.
		require
			a_name_not_void: a_name /= Void
			a_target_type_not_void: a_target_type /= Void
			a_class_not_void: a_class /= Void
		do
			name := a_name
			target_type := a_target_type
			current_closure := a_closure
			current_class := a_class
		ensure
			name_set: name = a_name
			target_type_set: target_type = a_target_type
			current_closure_set: current_closure = a_closure
			current_class_set: current_class = a_class
		end

feature -- Access

	name: ET_PRECURSOR_KEYWORD
			-- AST node corresponding to the name

	target_type: ET_TYPE
			-- Base type of target

	call_feature: detachable ET_FEATURE
			-- Feature of the call, if any
		local
			l_seed: INTEGER
		do
			l_seed := name.seed
			if l_seed /= 0 then
				Result := target_type.base_class (current_class).seeded_feature (l_seed)
			end
		end

feature -- Basic operations

	build_definition (a_builder: ET_BROWSABLE_DEFINITION_BUILDER)
			-- Build list of definitions.
		local
			l_feature_impl: ET_FEATURE
		do
			if attached call_feature as l_feature then
				l_feature_impl := l_feature.implementation_feature
				a_builder.add_feature (l_feature_impl, Current)
			end
		end

	build_type_definition (a_builder: ET_BROWSABLE_TYPE_DEFINITION_BUILDER)
			-- Build list of type definitions.
		local
			l_nested_type_context: ET_NESTED_TYPE_CONTEXT
			l_base_class: ET_CLASS
		do
			if not attached call_feature as l_feature then
				-- No type definition.
			elseif attached l_feature.type as l_type then
				create l_nested_type_context.make_with_capacity (current_class, 1)
				l_nested_type_context.put_last (target_type)
				l_base_class := l_type.base_class (l_nested_type_context)
				a_builder.add_class (l_base_class, Current)
			end
		end

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			if attached call_feature as l_feature then
				append_precursor_description_to_string (l_feature, a_string)
			end
		end

	append_precursor_description_to_string (a_feature: ET_FEATURE; a_string: STRING_8)
			-- Append description of `a_feature` to `a_string'.
		require
			a_feature_not_void: a_feature /= Void
			a_string_not_void: a_string /= Void
		local
			l_nested_type_context: ET_NESTED_TYPE_CONTEXT
			l_target_base_type: ET_BASE_TYPE
		do
			create l_nested_type_context.make_with_capacity (current_class, 1)
			l_nested_type_context.put_last (target_type)
			a_string.append_string (tokens.feature_keyword.text)
			a_feature.append_canonical_client_clause_to_string (" ", a_string)
			a_string.append_string ("%N%T")
			a_string.append_character ('{')
			l_target_base_type := target_type.base_type (current_class)
			l_target_base_type.append_canonical_to_string (a_string)
			a_string.append_character ('}')
			a_string.append_character ('.')
			a_feature.append_canonical_signature_to_string (l_nested_type_context, a_string)
			a_feature.implementation_feature.append_header_comment_to_string ("%N%T%T%T", a_string)
			if l_target_base_type.base_class /= a_feature.implementation_class then
				a_string.append_string ("%N%T%T%T-- (from class ")
				a_string.append_string (a_feature.implementation_class.upper_name)
				a_string.append_character (')')
			end
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

end
