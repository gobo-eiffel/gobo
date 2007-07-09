indexing

	description:

		"Eiffel formal arguments whose names are followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_COMMA_ARGUMENT

inherit

	ET_FORMAL_ARGUMENT
		redefine
			is_last_entity,
			break, last_leaf, process
		end

create

	make

feature -- Status report

	is_last_entity: BOOLEAN is
			-- Is current entity the last entity in an
			-- entity declaration group?
		do
			Result := False
		end

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
			a_processor.process_formal_comma_argument (Current)
		end

end
