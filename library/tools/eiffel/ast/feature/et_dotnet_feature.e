indexing

	description:

		"Features implemented in .NET"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DOTNET_FEATURE

inherit

	ET_FEATURE
		redefine
			is_dotnet
		end

feature -- Status report

	is_dotnet: BOOLEAN is True
			-- Is current feature a .NET feature?

end
