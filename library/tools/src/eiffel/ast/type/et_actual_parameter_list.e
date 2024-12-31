note

	description:

		"Eiffel lists of actual generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2024, Eric Bezault and others"
	license: "MIT License"

class ET_ACTUAL_PARAMETER_LIST

inherit

	ET_ACTUAL_PARAMETERS

	ET_HEAD_LIST [ET_ACTUAL_PARAMETER_ITEM]
		export
			{ET_ACTUAL_PARAMETER_LIST} storage
		undefine
			is_empty
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create an empty actual generic parameter list.
		do
			left_bracket := tokens.left_bracket_symbol
			right_bracket := tokens.right_bracket_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create an empty actual generic parameter list with capacity `nb'.
		do
			left_bracket := tokens.left_bracket_symbol
			right_bracket := tokens.right_bracket_symbol
			precursor (nb)
		end

feature -- Access

	actual_parameter (i: INTEGER): ET_ACTUAL_PARAMETER
			-- Actual parameter of `i'-th item in list
		do
			Result := item (i).actual_parameter
		end

	type (i: INTEGER): ET_TYPE
			-- Type of `i'-th item in list
		do
			Result := item (i).type
		end

	left_bracket: ET_SYMBOL
			-- Left bracket

	right_bracket: ET_SYMBOL
			-- Right bracket

	first_symbol: detachable ET_SYMBOL
			-- Colon or semicolon before the first actual parameter, if any

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := left_bracket.position
			if Result.is_null then
				if not is_empty then
					Result := item (1).position
				elseif attached first_symbol as l_first_symbol then
					Result := l_first_symbol.position
				end
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := left_bracket
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := right_bracket
		end

feature -- Setting

	set_left_bracket (l: like left_bracket)
			-- Set `left_bracket' to `l'.
		require
			l_not_void: l /= Void
		do
			left_bracket := l
		ensure
			left_bracket_set: left_bracket = l
		end

	set_right_bracket (r: like right_bracket)
			-- Set `right_bracket' to `r'.
		require
			r_not_void: r /= Void
		do
			right_bracket := r
		ensure
			right_bracket_set: right_bracket = r
		end

	set_first_symbol (a_first_symbol: like first_symbol)
			-- Set `first_symbol' to `a_first_symbol'.
		do
			first_symbol := a_first_symbol
		ensure
			first_symbol_set: first_symbol = a_first_symbol
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_actual_parameter_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	left_bracket_not_void: left_bracket /= Void
	right_bracket_not_void: right_bracket /= Void

end
