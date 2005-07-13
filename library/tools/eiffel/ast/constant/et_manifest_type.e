indexing

	description:

		"Eiffel manifest types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_MANIFEST_TYPE

inherit

	ET_CONSTANT
		undefine
			reset
		redefine
			is_type_constant
		end

	ET_BRACED_TYPE
		redefine
			process
		end

create

	make

feature -- Status report

	is_type_constant: BOOLEAN is True
			-- Is current constant a TYPE constant?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_manifest_type (Current)
		end

end
