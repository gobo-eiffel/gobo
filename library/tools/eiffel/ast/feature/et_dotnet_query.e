indexing

	description:

		"Queries (functions or attributes) implemented in .NET"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DOTNET_QUERY

inherit

	ET_QUERY
		undefine
			is_frozen, is_dotnet,
			overloaded_extended_name
		end

	ET_DOTNET_FEATURE
		undefine
			type
		end

end
