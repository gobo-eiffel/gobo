indexing

	description:

		"Eiffel class universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_UNIVERSE

inherit

	ET_UNIVERSE
		redefine
			clusters, dotnet_assemblies
		end

create

	make, make_standard, make_with_factory

feature -- Access

	clusters: ET_LACE_CLUSTERS
			-- Clusters

	dotnet_assemblies: ET_LACE_DOTNET_ASSEMBLIES
			-- .NET assemblies

end
