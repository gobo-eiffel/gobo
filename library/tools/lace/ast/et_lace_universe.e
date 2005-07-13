indexing

	description:

		"Eiffel class universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_UNIVERSE

inherit

	ET_UNIVERSE
		redefine
			clusters
		end

create

	make, make_standard, make_with_factory

feature -- Access

	clusters: ET_LACE_CLUSTERS
			-- Clusters

end
