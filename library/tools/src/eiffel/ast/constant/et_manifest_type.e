note

	description:

		"Eiffel manifest types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2024, Eric Bezault and others"
	license: "MIT License"

class ET_MANIFEST_TYPE

inherit

	ET_CONSTANT
		redefine
			reset,
			is_type_constant
		end

	ET_BRACED_TYPE
		redefine
			reset,
			process
		end

create

	make

feature -- Initialization

	reset
			-- Reset expression as it was when it was last parsed.
		do
			precursor {ET_CONSTANT}
			precursor {ET_BRACED_TYPE}
		end

feature -- Status report

	is_type_constant: BOOLEAN = True
			-- Is current constant a TYPE constant?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_manifest_type (Current)
		end

end
