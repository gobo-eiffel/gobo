indexing

	description:

		"Eiffel labeled actual generic parameters whose label is followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LABELED_COMMA_ACTUAL_PARAMETER

inherit

	ET_LABELED_ACTUAL_PARAMETER
		redefine
			break, last_leaf, process
		end

create

	make

feature -- Access

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := label_item.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := label_item.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_labeled_comma_actual_parameter (Current)
		end

end
