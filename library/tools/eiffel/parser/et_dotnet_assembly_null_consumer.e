indexing

	description:

		"Null consumers of .NET assemblies"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_ASSEMBLY_NULL_CONSUMER

inherit

	ET_DOTNET_ASSEMBLY_CONSUMER

create

	make

feature {ET_DOTNET_ASSEMBLY} -- Consuming

	consume_assembly (an_assembly: ET_DOTNET_ASSEMBLY) is
			-- Consume `an_assembly' and put the classes in `universe'.
		do
			-- Do nothing.
		end

	consume_gac_assembly (an_assembly: ET_DOTNET_GAC_ASSEMBLY) is
			-- Consume `an_assembly' and put the classes in `universe'.
		do
			-- Do nothing.
		end

end