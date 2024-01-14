note

	description:

		"Eiffel actual parameters which appear in a comma-separated list %
		%of types in constraints of formal generic parameters. %
		%The names of the types have not been resolved yet, they %
		%may be names of classes or of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2013, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM

feature -- Access

	actual_parameter: ET_CONSTRAINT_ACTUAL_PARAMETER
			-- Actual parameter in comma-separated list
		deferred
		ensure
			actual_parameter_not_void: Result /= Void
		end

	type: ET_CONSTRAINT_TYPE
			-- Type of actual parameter
		do
			Result := actual_parameter.type
		ensure
			type_not_void: Result /= Void
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		deferred
		ensure
			position_not_void: Result /= Void
		end

feature -- Conversion

	resolved_syntactical_constraint_with_type (a_type: detachable ET_TYPE;
		a_parser: ET_EIFFEL_PARSER_SKELETON): detachable ET_ACTUAL_PARAMETER_ITEM
			-- Version of current actual parameter, where its type has
			-- been replaced by `a_type'
		require
			a_parser_not_void: a_parser /= Void
		deferred
		end

end
