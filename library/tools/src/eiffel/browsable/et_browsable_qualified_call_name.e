note

	description:

		"Browsable qualified call names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_QUALIFIED_CALL_NAME

inherit

	ET_BROWSABLE_QUALIFIED_NAME
		redefine
			build_implementation
		end

create

	make

feature -- Access

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

	build_implementation (a_builder: ET_BROWSABLE_IMPLEMENTATION_BUILDER)
			-- Build list of implementations.
		do
			if attached call_feature as l_feature then
				build_feature_implementations (l_feature, target_type, a_builder)
			end
		end

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			if attached call_feature as l_feature then
				append_feature_description_to_string (l_feature, a_string)
			end
		end

end
