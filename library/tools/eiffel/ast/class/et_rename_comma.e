note

	description:

		"Eiffel rename pairs followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_RENAME_COMMA

inherit

	ET_RENAME
		rename
			make as make_rename
		redefine
			break, last_leaf, process
		end

create

	make

feature {NONE} -- Initialization

	make (o: like old_name; n: like new_name; a_comma: like comma)
			-- Create a new rename pair.
		require
			o_not_void: o /= Void
			n_not_void: n /= Void
			a_comma_not_void: a_comma /= Void
		do
			make_rename (o, n)
			comma := a_comma
		ensure
			old_name_set: old_name = o
			new_name_set: new_name = n
			comma_set: comma = a_comma
		end

feature -- Access

	comma: ET_SYMBOL
			-- Comma separator

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := comma
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := comma.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_rename_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
