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
		redefine
			resolved_syntactical_constraint
		end

creation

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

	cat_keyword: ET_KEYWORD
			-- 'cat' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if cat_keyword /= Void then
				Result := cat_keyword.position
			else
				Result := type.position
			end
		end

feature -- Setting

	set_cat_keyword (a_cat: like cat_keyword) is
			-- Set `cat_keyword' to `a_cat'.
		do
			cat_keyword := a_cat
		ensure
			cat_keyword_set: cat_keyword = a_cat
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
