note

	description:

		"Browsable names of unqualified calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_UNQUALIFIED_CALL_NAME

inherit

	ET_BROWSABLE_UNQUALIFIED_NAME
		redefine
			name,
			build_implementation
		end

create

	make

feature -- Access

	name: ET_CALL_NAME
			-- AST node corresponding to the name

	call_feature: detachable ET_FEATURE
			-- Feature of the call, if any
		local
			l_seed: INTEGER
		do
			if attached {ET_CALL_NAME} name as l_call_name then
				l_seed := l_call_name.seed
				if l_seed /= 0 then
					Result := current_class.seeded_feature (l_seed)
				end
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
			l_base_class: ET_CLASS
		do
			if not attached call_feature as l_feature then
				-- No type definition.
			elseif attached l_feature.type as l_type then
				l_base_class := l_type.base_class (current_class)
				a_builder.add_class (l_base_class, Current)
			end
		end

	build_implementation (a_builder: ET_BROWSABLE_IMPLEMENTATION_BUILDER)
			-- Build list of implementations.
		do
			if attached call_feature as l_feature then
				build_feature_implementations (l_feature, current_class, a_builder)
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
