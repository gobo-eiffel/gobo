indexing

	description:

		"Eiffel built-in conversion features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_BUILTIN_CONVERT_FEATURE

inherit

	ET_CONVERT_FEATURE

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new built-in conversion feature.
		do
			create {ET_IDENTIFIER} name.make ("_builtin_")
			create {ET_BRACED_TYPE_LIST} types.make
		end

feature -- Access

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := types.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			-- Do nothing.
		end

end
