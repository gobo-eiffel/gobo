note

	description:

		"Eiffel types (with actual generic parameters) which %
		%appear in constraints of formal generic parameters. %
		%The names of the types have not been resolved yet, they %
		%may be names of classes or of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2025, Eric Bezault and others"
	license: "MIT License"

class ET_CONSTRAINT_GENERIC_NAMED_TYPE

inherit

	ET_CONSTRAINT_NAMED_TYPE
		rename
			make as make_constraint_named_type
		redefine
			resolved_syntactical_constraint
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like name; a_parameters: like actual_parameters)
			-- Create a new generic constraint type.
		require
			a_name_not_void: a_name /= Void
			a_parameters_not_void: a_parameters /= Void
		do
			type_mark := a_type_mark
			name := a_name
			actual_parameters := a_parameters
		ensure
			type_mark_set: type_mark = a_type_mark
			name_set: name = a_name
			actual_parameters_set: actual_parameters = a_parameters
		end

feature -- Access

	actual_parameters: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
			-- Actual generic parameters

feature -- Conversion

	resolved_syntactical_constraint (a_formals: ET_FORMAL_PARAMETER_LIST;
		a_parser: ET_EIFFEL_PARSER_SKELETON): detachable ET_TYPE
			-- Version of current type, appearing in the constraint of one
			-- of the formal generic parameters in `a_formals',
			-- where class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		do
			Result := a_parser.resolved_constraint_generic_named_type (Current, a_formals)
		end

invariant

	actual_parameters_not_void: actual_parameters /= Void

end
