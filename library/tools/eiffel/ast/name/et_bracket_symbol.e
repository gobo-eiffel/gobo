indexing

	description:

		"Eiffel '[' symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_BRACKET_SYMBOL

inherit

	ET_SYMBOL
		rename
			make_left_bracket as make
		redefine
			process
		end

	ET_CALL_NAME
		undefine
			first_position, last_position,
			is_semicolon
		redefine
			is_bracket
		end

create

	make

feature -- Access

	name: STRING is
			-- Name of feature call
		do
			Result := tokens.alias_bracket_name
		end

	lower_name: STRING is
			-- Lower-name of feature call
			-- (May return the same object as `name' if already in lower case.)
		do
			Result := name
		end

	hash_code: INTEGER is
			-- Hash code
		do
			Result := tokens.alias_bracket_code.code
		end

feature -- Status report

	is_bracket: BOOLEAN is True
			-- Is current feature name of the form 'alias "[]"'?

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN is
			-- Are `Current' and `other' the same feature call name?
			-- (case insensitive)
		do
			if Current = other then
				Result := True
			else
				Result := other.is_bracket
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_bracket_symbol (Current)
		end

invariant

	is_bracket: is_bracket
	is_left_bracket: is_left_bracket

end
