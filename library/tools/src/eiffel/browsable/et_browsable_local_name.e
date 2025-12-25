note

	description:

		"Browsable names of local variables"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_BROWSABLE_LOCAL_NAME

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
			-- Create a new browsable local variable name.
		require
			a_name_not_void: a_name /= Void
			a_name_is_local: a_name.is_local
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
			-- AST node corresponding to the local name

	local_variable: detachable ET_LOCAL_VARIABLE
			-- Local variable, if any
		local
			l_seed: INTEGER
		do
			if attached current_closure as l_closure and then attached l_closure.locals as l_locals then
				l_seed := name.seed
				if l_seed >= 1 and l_seed <= l_locals.count then
					Result := l_locals.local_variable (l_seed)
				end
			end
		end

feature -- Basic operations

	build_definition (a_builder: ET_BROWSABLE_DEFINITION_BUILDER)
			-- Build list of definitions.
		do
			if attached local_variable as l_local_variable then
				a_builder.add_local_variable (l_local_variable, Current)
			end
		end

	build_type_definition (a_builder: ET_BROWSABLE_TYPE_DEFINITION_BUILDER)
			-- Build list of type definitions.
		local
			l_base_class: ET_CLASS
		do
			if attached local_variable as l_local_variable then
				l_base_class := l_local_variable.type.base_class (current_class)
				a_builder.add_class (l_base_class, Current)
			end
		end

feature -- Output

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		do
			if attached local_variable as l_local_variable then
				append_local_variable_description_to_string (l_local_variable, a_string)
			end
		end

invariant

	name_is_local: name.is_local

end
