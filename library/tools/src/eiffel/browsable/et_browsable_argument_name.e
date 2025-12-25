note

	description:

		"Browsable names of formal arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_ARGUMENT_NAME

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

	make (a_name: like name; a_closure: like current_closure; a_class: like current_class)
			-- Create a new browsable formal argument name.
		require
			a_name_not_void: a_name /= Void
			a_name_is_argument: a_name.is_argument
			a_class_not_void: a_class /= Void
		do
			name := a_name
			current_closure := a_closure
			current_class := a_class
		ensure
			name_set: name = a_name
			current_closure_set: current_closure = a_closure
			current_class_set: current_class = a_class
		end

feature -- Access

	name: ET_IDENTIFIER
			-- AST node corresponding to the formal argument name

	formal_argument: detachable ET_FORMAL_ARGUMENT
			-- Formal argument, if any
		local
			l_seed: INTEGER
		do
			if attached current_closure as l_closure and then attached l_closure.arguments as l_arguments then
				l_seed := name.seed
				if l_seed >= 1 and l_seed <= l_arguments.count then
					Result := l_arguments.formal_argument (l_seed)
				end
			end
		end

feature -- Basic operations

	build_definition (a_builder: ET_BROWSABLE_DEFINITION_BUILDER)
			-- Build list of definitions.
		do
			if attached formal_argument as l_formal_argument then
				a_builder.add_formal_argument (l_formal_argument, Current)
			end
		end

	build_type_definition (a_builder: ET_BROWSABLE_TYPE_DEFINITION_BUILDER)
			-- Build list of type definitions.
		local
			l_base_class: ET_CLASS
		do
			if attached formal_argument as l_formal_argument then
				l_base_class := l_formal_argument.type.base_class (current_class)
				a_builder.add_class (l_base_class, Current)
			end
		end

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			if attached formal_argument as l_formal_argument then
				append_formal_agument_description_to_string (l_formal_argument, a_string)
			end
		end

invariant

	name_is_argument: name.is_argument

end
