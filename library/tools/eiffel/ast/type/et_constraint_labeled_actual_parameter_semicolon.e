note

	description:

		"Eiffel labeled actual parameters followed by a semicolon, that %
		%appear in constraints of formal generic parameters. The names %
		%of the types have not been resolved yet, they may be names of %
		%classes or of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER_SEMICOLON

inherit

	ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_parameter: like actual_parameter; a_semicolon: like semicolon) is
			-- Create a new labeled actual parameter followed by a semicolon.
		require
			a_parameter_not_void: a_parameter /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			actual_parameter := a_parameter
			semicolon := a_semicolon
		ensure
			actual_parameter_set: actual_parameter = a_parameter
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	actual_parameter: ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER
			-- Actual parameter in comma-separated list

	semicolon: ET_SEMICOLON_SYMBOL
			-- Semicolon

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
			Result := a_parser.resolved_constraint_labeled_actual_parameter_semicolon (Current, a_type)
		end

invariant

	semicolon_not_void: semicolon /= Void

end
