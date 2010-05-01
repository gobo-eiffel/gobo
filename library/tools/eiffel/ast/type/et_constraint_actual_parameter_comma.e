note

	description:

		"Eiffel actual parameters that appear in constraints of formal %
		%generic parameters, followed by a comma. The names %
		%of the types have not been resolved yet, they may %
		%be names of classes or of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTRAINT_ACTUAL_PARAMETER_COMMA

inherit

	ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_parameter: like actual_parameter; a_comma: like comma) is
			-- Create a new actual_parameter-comma.
		require
			a_parameter_not_void: a_parameter /= Void
			a_comma_not_void: a_comma /= Void
		do
			actual_parameter := a_parameter
			comma := a_comma
		ensure
			actual_parameter_set: actual_parameter = a_parameter
			comma_set: comma = a_comma
		end

feature -- Access

	actual_parameter: ET_CONSTRAINT_ACTUAL_PARAMETER
			-- Actual parameter in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := actual_parameter.position
		end

feature -- Conversion

	resolved_syntactical_constraint_with_type (a_type: ET_TYPE;
		a_parser: ET_EIFFEL_PARSER_SKELETON): ET_ACTUAL_PARAMETER_ITEM is
			-- Version of current actual parameter, where its type has
			-- been replaced by `a_type'
		do
			Result := a_parser.resolved_constraint_actual_parameter_comma (Current, a_type)
		end

invariant

	comma_not_void: comma /= Void

end
