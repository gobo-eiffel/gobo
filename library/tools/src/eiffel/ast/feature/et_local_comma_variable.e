﻿note

	description:

		"Eiffel local variables whose names are followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"

class ET_LOCAL_COMMA_VARIABLE

inherit

	ET_LOCAL_VARIABLE
		redefine
			is_last_entity,
			last_leaf, process
		end

create

	make

feature -- Status report

	is_last_entity: BOOLEAN
			-- Is current entity the last entity in an
			-- entity declaration group?
		do
			Result := False
		end

feature -- Access

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := name_item.last_leaf
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_local_comma_variable (Current)
		end

end
