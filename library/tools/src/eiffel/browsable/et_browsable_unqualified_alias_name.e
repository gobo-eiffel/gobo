note

	description:

		"Browsable feature aliases"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_UNQUALIFIED_ALIAS_NAME

inherit

	ET_BROWSABLE_UNQUALIFIED_NAME
		redefine
			name
		end

create

	make

feature -- Access

	name: ET_MANIFEST_STRING
			-- AST node corresponding to the name

feature -- Basic operations

	build_definition (a_builder: ET_BROWSABLE_DEFINITION_BUILDER)
			-- Build list of definitions.
		local
			l_feature_impl: ET_FEATURE
		do
			if attached {ET_FEATURE} current_closure as l_feature then
				l_feature_impl := l_feature.implementation_feature
				a_builder.add_feature (l_feature_impl, Current)
			end
		end

	build_type_definition (a_builder: ET_BROWSABLE_TYPE_DEFINITION_BUILDER)
			-- Build list of type definitions.
		local
			l_base_class: ET_CLASS
		do
			if not attached {ET_FEATURE} current_closure as l_feature then
				-- No type definition.
			elseif attached l_feature.type as l_type then
				l_base_class := l_type.base_class (current_class)
				a_builder.add_class (l_base_class, Current)
			end
		end
feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			if attached {ET_FEATURE} current_closure as l_feature then
				append_feature_description_to_string (l_feature, a_string)
			end
		end

end
