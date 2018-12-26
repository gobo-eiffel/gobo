note

	description:

		"Eiffel AST leaf nodes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AST_LEAF

inherit

	ET_AST_NODE
		undefine
			last_position
		redefine
			first_position,
			break
		end

	ET_COMPRESSED_POSITION
		rename
			make as make_with_position,
			make_default as make,
			is_null as is_null_position,
			to_text as position_to_text,
			append_to_string as append_position_to_string,
			append_to_string_with_filename as append_position_to_string_with_filename
		end

feature -- Status report

	is_null: BOOLEAN
			-- Is current leaf node empty?
		do
			-- Result := False
		end

feature -- Access

	position: ET_POSITION
			-- Position of first character of current node in source code,
			-- or of a subsequent subnode if the position had not been set
		do
			Result := Current
		end

	first_position: ET_POSITION
			-- Position of first character of current node in source code;
			-- Null position if current node is empty or the position had not been set
		do
			Result := Current
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := Current
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := Current
		end

	break: detachable ET_BREAK
			-- Break which appears just after current node

feature -- Setting

	set_break (a_break: like break)
			-- Set `break' to `a_break'.
		do
			break := a_break
		ensure
			break_set: break = a_break
		end

end
