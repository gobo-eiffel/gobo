indexing

	description:

		"Eiffel qualified creation instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_QUALIFIED_CREATION_INSTRUCTION

inherit

	ET_CREATION_INSTRUCTION

feature -- Access

	dot: ET_SYMBOL
			-- Dot symbol

	procedure_name: ET_FEATURE_NAME
			-- Name of creation procedure

	arguments: ET_ACTUAL_ARGUMENTS
			-- Arguments

invariant

	procedure_name_not_void: procedure_name /= Void
	dot_not_void: dot /= Void

end
