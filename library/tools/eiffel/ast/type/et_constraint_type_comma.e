indexing

	description:

		"Eiffel types that appear in constraints of formal %
		%generic parameters, followed by a comma. The names %
		%of the types have not been resolved yet, they may %
		%be names of classes or of formal generic parameters."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTRAINT_TYPE_COMMA

inherit

	ET_CONSTRAINT_TYPE_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_comma: like comma) is
			-- Create a new type-comma.
		require
			a_type_not_void: a_type /= Void
			a_comma_not_void: a_comma /= Void
		do
			type := a_type
			comma := a_comma
		ensure
			type_set: type = a_type
			comma_set: comma = a_comma
		end

feature -- Access

	type: ET_CONSTRAINT_TYPE
			-- Type in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := type.position
		end

feature -- Conversion

	resolved_syntactical_constraint (a_formals: ET_FORMAL_PARAMETER_LIST;
		a_parser: ET_EIFFEL_PARSER_SKELETON): ET_TYPE_ITEM is
			-- Version of current type, appearing in the constraint of
			-- one of the formal generic parameters in `a_formals', where
			-- class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		local
			a_type: ET_TYPE
		do
			a_type := type.resolved_syntactical_constraint (a_formals, a_parser)
			if a_type /= Void then
				Result := a_parser.ast_factory.new_type_comma (a_type, comma)
			end
		end

end
