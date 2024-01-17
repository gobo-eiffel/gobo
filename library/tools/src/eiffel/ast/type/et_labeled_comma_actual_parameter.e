note

	description:

		"Eiffel labeled actual generic parameters whose label is followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2014, Eric Bezault and others"
	license: "MIT License"

class ET_LABELED_COMMA_ACTUAL_PARAMETER

inherit

	ET_LABELED_ACTUAL_PARAMETER
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
			Result := label_item.last_leaf
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_labeled_comma_actual_parameter (Current)
		end

end
