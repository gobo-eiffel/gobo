indexing

	description:

		"Eiffel conversion procedures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONVERT_PROCEDURE

inherit

	ET_CONVERT_FEATURE
		redefine
			is_convert_from
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_types: like types) is
			-- Create a new conversion procedure.
		require
			a_name_not_void: a_name /= Void
			a_types_not_void: a_types /= Void
		do
			name := a_name
			types := a_types
			left_parenthesis := tokens.left_parenthesis_symbol
			right_parenthesis := tokens.right_parenthesis_symbol
		ensure
			name_set: name = a_name
			types_set: types = a_types
		end

feature -- Status report

	is_convert_from: BOOLEAN is True
			-- Is it a conversion from another type?

feature -- Access

	left_parenthesis: ET_SYMBOL
			-- Left parenthesis symbol

	right_parenthesis: ET_SYMBOL
			-- Left parenthesis symbol

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := right_parenthesis
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_parenthesis.break
		end

feature -- Setting

	set_left_parenthesis (a_parenthesis: like left_parenthesis) is
			-- Set `left_parenthesis' to `a_parenthesis'.
		require
			a_parenthesis_not_void: a_parenthesis /= Void
		do
			left_parenthesis := a_parenthesis
		ensure
			left_parenthesis_set: left_parenthesis = a_parenthesis
		end

	set_right_parenthesis (a_parenthesis: like right_parenthesis) is
			-- Set `right_parenthesis' to `a_parenthesis'.
		require
			a_parenthesis_not_void: a_parenthesis /= Void
		do
			right_parenthesis := a_parenthesis
		ensure
			right_parenthesis_set: right_parenthesis = a_parenthesis
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_convert_procedure (Current)
		end

invariant

	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis_not_void: right_parenthesis /= Void

end
