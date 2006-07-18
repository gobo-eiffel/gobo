indexing

	description:

		"Procedures implemented in .NET"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DOTNET_PROCEDURE

inherit

	ET_PROCEDURE

	ET_DOTNET_FEATURE
		undefine
			obsolete_message,
			arguments,
			preconditions,
			postconditions,
			reset_preconditions,
			reset_postconditions
		end

end
