indexing

	description:

		"Lace Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_SYSTEM

inherit

	ET_SYSTEM
		redefine
			clusters
		end

create

	make

feature -- Access

	clusters: ET_LACE_CLUSTERS
			-- Clusters

end
