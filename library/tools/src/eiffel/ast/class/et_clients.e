note

	description:

		"Eiffel client lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLIENTS

inherit

	ET_AST_NODE

	ET_CLIENT_LIST
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new empty client list.
		do
			left_brace := tokens.left_brace_symbol
			right_brace := tokens.right_brace_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty client list with capacity `nb'.
		do
			left_brace := tokens.left_brace_symbol
			right_brace := tokens.right_brace_symbol
			precursor (nb)
		end

feature -- Access

	left_brace: ET_SYMBOL
			-- '{' symbol

	right_brace: ET_SYMBOL
			-- '}' symbol

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := left_brace.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := left_brace
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := right_brace
		end

feature -- Setting

	set_left_brace (l: like left_brace)
			-- Set `left_brace' to `l'.
		require
			l_not_void: l /= Void
		do
			left_brace := l
		ensure
			left_brace_set: left_brace = l
		end

	set_right_brace (r: like right_brace)
			-- Set `right_brace' to `r'.
		require
			r_not_void: r /= Void
		do
			right_brace := r
		ensure
			right_brace_set: right_brace = r
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_clients (Current)
		end

invariant

	left_brace_not_void: left_brace /= Void
	right_brace_not_void: right_brace /= Void

end
