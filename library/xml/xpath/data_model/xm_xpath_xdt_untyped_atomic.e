indexing

	description:

		"xdt: untypedAtomic values"

		library: "Gobo Eiffel XML Library"
		copyright: "Copyright (c) 2003, Colin Adams and others"
		license: "Eiffel Forum License v2 (see forum.txt)"
		date: "$Date$"
		revision: "$Revision$"

class XM_XPATH_XDT_UNTYPED_ATOMIC

inherit

	XM_XPATH_ANY_ATOMIC_VALUE

creation

	make

feature -- Initialization

	make (value: STRING) is
			-- Establish invariant
		do
			string_value := value
		ensure
			string_value_set: string_value = value
		end

feature -- Access

	string_value: STRING
			-- Value as string
	
end

