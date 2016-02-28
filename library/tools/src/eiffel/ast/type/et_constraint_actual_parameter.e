note

	description:

		"Eiffel actual parameters which appear in constraints of formal %
		%generic parameters. The names of the types have not %
		%been resolved yet, they may be names of classes or %
		%of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CONSTRAINT_ACTUAL_PARAMETER

inherit

	ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		redefine
			resolved_syntactical_constraint_with_type
		end

feature -- Access

	actual_parameter: ET_CONSTRAINT_ACTUAL_PARAMETER
			-- Actual parameter
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

feature -- Conversion

	resolved_syntactical_constraint_with_type (a_type: detachable ET_TYPE;
		a_parser: ET_EIFFEL_PARSER_SKELETON): detachable ET_ACTUAL_PARAMETER
			-- Version of current actual parameter, where its type has
			-- been replaced by `a_type'
		deferred
		end

end
