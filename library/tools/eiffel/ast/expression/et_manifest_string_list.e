note

	description:

		"Eiffel comma-separated lists of manifest strings"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_MANIFEST_STRING_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_MANIFEST_STRING_ITEM]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of manifest strings.
		do
			precursor
			left_parenthesis := tokens.left_parenthesis_symbol
			right_parenthesis := tokens.right_parenthesis_symbol
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new lits of manifest strings with capacity `nb'.
		do
			precursor (nb)
			left_parenthesis := tokens.left_parenthesis_symbol
			right_parenthesis := tokens.right_parenthesis_symbol
		end

feature -- Access

	manifest_string (i: INTEGER): ET_MANIFEST_STRING
			-- Manifest string at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).manifest_string
		ensure
			key_not_void: Result /= Void
		end

	left_parenthesis: ET_SYMBOL
			-- Left parenthesis

	right_parenthesis: ET_SYMBOL
			-- Right parenthesis

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := left_parenthesis.position
			if Result.is_null and not is_empty then
				Result := item (1).position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := left_parenthesis
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := right_parenthesis
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := right_parenthesis.break
		end

feature -- Setting

	set_left_parenthesis (l: like left_parenthesis)
			-- Set `left_parenthesis' to `l'.
		require
			l_not_void: l /= Void
		do
			left_parenthesis := l
		ensure
			left_parenthesis_set: left_parenthesis = l
		end

	set_right_parenthesis (r: like right_parenthesis)
			-- Set `right_parenthesis' to `r'.
		require
			r_not_void: r /= Void
		do
			right_parenthesis := r
		ensure
			right_parenthesis_set: right_parenthesis = r
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_manifest_string_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_MANIFEST_STRING_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis_not_void: right_parenthesis /= Void

end
