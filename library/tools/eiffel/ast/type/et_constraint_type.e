note

	description:

		"Eiffel types which appear in constraints of formal %
		%generic parameters. The names of the types have not %
		%been resolved yet, they may be names of classes or %
		%of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CONSTRAINT_TYPE

inherit

	ET_CONSTRAINT_ACTUAL_PARAMETER
		redefine
			type
		end

feature -- Access

	type: ET_CONSTRAINT_TYPE
			-- Type
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

feature -- Conversion

	resolved_syntactical_constraint (a_formals: ET_FORMAL_PARAMETER_LIST;
		a_class: ET_CLASS; a_parser: ET_EIFFEL_PARSER_SKELETON): ET_TYPE
			-- Version of current type, appearing in the constraint of one
			-- of the formal generic parameters in `a_formals' of `a_class',
			-- where class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		require
			a_formals_not_void: a_formals /= Void
			a_class_not_void: a_class /= Void
			a_parser_not_void: a_parser /= Void
		deferred
		end

	resolved_syntactical_constraint_with_type (a_type: ET_TYPE;
		a_parser: ET_EIFFEL_PARSER_SKELETON): ET_TYPE
			-- Version of current actual parameter, where its type has
			-- been replaced by `a_type'
		do
			Result := a_type
		end

end
