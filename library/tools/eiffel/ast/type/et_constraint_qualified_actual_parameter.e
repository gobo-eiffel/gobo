indexing

	description:

		"Eiffel actual parameters which appear in constraints of formal %
		%generic parameters, with qualifiers. The names of the types have not %
		%been resolved yet, they may be names of classes or %
		%of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTRAINT_QUALIFIED_ACTUAL_PARAMETER

inherit

	ET_CONSTRAINT_ACTUAL_PARAMETER

create

	make

feature {NONE} -- Initialization

	make (a_type: ET_CONSTRAINT_TYPE) is
			-- Create a new qualified actual parameter.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
		ensure
			type_set: type = a_type
		end

feature -- Access

	type: ET_CONSTRAINT_TYPE
			-- Type of actual parameter

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := type.position
		end

feature -- Conversion

	resolved_syntactical_constraint (a_formals: ET_FORMAL_PARAMETER_LIST;
		a_parser: ET_EIFFEL_PARSER_SKELETON): ET_ACTUAL_PARAMETER is
			-- Version of current actual parameter, appearing in the constraint
			-- of one of the formal generic parameters in `a_formals', where
			-- class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		do
			Result := a_parser.resolved_constraint_qualified_actual_parameter (Current, a_formals)
		end

end
