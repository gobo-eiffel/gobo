indexing

	description:

		"Eiffel labeled actual parameters that appear in constraints of formal %
		%generic parameters. The names of the types have not been resolved yet, %
		%they may be names of classes or of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER

inherit

	ET_CONSTRAINT_ACTUAL_PARAMETER
		redefine
			type
		end

create

	make

feature {NONE} -- Initialization

	make (a_label: like label; a_colon: like colon; a_type: like type) is
			-- Create a new labeled actual parameter.
		require
			a_label_not_void: a_label /= Void
			a_type_not_void: a_type /= Void
		do
			label := a_label
			colon := a_colon
			type := a_type
		ensure
			label_set: label = a_label
			colon_set: colon = a_colon
			type_set: type = a_type
		end

feature -- Access

	label: ET_IDENTIFIER
			-- Label of actual parameter
			-- Useful when part of a labeled tuple, Void if no label

	colon: ET_SYMBOL
			-- Colon

	type: ET_CONSTRAINT_TYPE
			-- Type

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := label.position
		end

feature -- Conversion

	resolved_syntactical_constraint_with_type (a_type: ET_TYPE;
		a_parser: ET_EIFFEL_PARSER_SKELETON): ET_LABELED_ACTUAL_PARAMETER is
			-- Version of current actual parameter, where its type has
			-- been replaced by `a_type'
		do
			Result := a_parser.resolved_constraint_labeled_actual_parameter (Current, a_type)
		end

invariant

	label_not_void: label /= Void

end
