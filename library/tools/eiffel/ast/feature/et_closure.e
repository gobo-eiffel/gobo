indexing

	description:

		"Eiffel closures, e.g. features, invariants, inline agents"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLOSURE

inherit

	ANY

feature -- Access

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		do
		end

	arguments: ET_FORMAL_ARGUMENT_LIST is
			-- Formal arguments;
			-- Void if no arguments
		do
		end

	locals: ET_LOCAL_VARIABLE_LIST is
			-- Local variables;
			-- Void if no local variables
		do
		end

end
