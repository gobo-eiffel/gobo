indexing

	description:

		"Eiffel local variables whose names are followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LOCAL_COMMA_VARIABLE

inherit

	ET_LOCAL_VARIABLE
		redefine
			break, last_leaf, process
		end

create

	make

feature -- Access

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := name_item.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := name_item.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_local_comma_variable (Current)
		end

end
