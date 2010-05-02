note

	description:

		"Eiffel conversion functions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONVERT_FUNCTION

inherit

	ET_CONVERT_FEATURE
		redefine
			is_convert_to
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_types: like types)
			-- Create a new conversion function.
		require
			a_name_not_void: a_name /= Void
			a_types_not_void: a_types /= Void
		do
			name := a_name
			types := a_types
			colon := tokens.colon_symbol
		ensure
			name_set: name = a_name
			types_set: types = a_types
		end

feature -- Status report

	is_convert_to: BOOLEAN = True
			-- Is it a conversion to another type?

feature -- Access

	colon: ET_SYMBOL
			-- Colon symbol


	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := types.last_leaf
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := types.break
		end

feature -- Setting

	set_colon (a_colon: like colon)
			-- Set `colon' to `a_colon'.
		require
			a_colon_not_void: a_colon /= Void
		do
			colon := a_colon
		ensure
			colon_set: colon = a_colon
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_convert_function (Current)
		end

invariant

	colon_not_void: colon /= Void

end
