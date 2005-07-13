indexing

	description:

		"Eiffel formal arguments whose names are followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_COMMA_ARGUMENT

inherit

	ET_FORMAL_ARGUMENT
		redefine
			break, process
		end

create

	make

feature -- Access

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
