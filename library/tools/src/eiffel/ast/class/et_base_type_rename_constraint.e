note

	description:

	"[
		Eiffel constraints on formal generic parameters where the 
		actual generic parameters need to conform to just one type,
		which is a base type), and with a rename clause.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BASE_TYPE_RENAME_CONSTRAINT

inherit

	ET_BASE_TYPE_CONSTRAINT
		undefine
			renames,
			is_formal_parameter
		redefine
			type
		end

	ET_TYPE_RENAME_CONSTRAINT
		undefine
			type_constraint
		redefine
			type,
			process
		end

create

	make

feature -- Access

	type: ET_BASE_TYPE
			-- Type to which the actual generic parameters
			-- will need to conform

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_base_type_rename_constraint (Current)
		end

end
