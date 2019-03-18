note

	description:

		"Lace Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_SYSTEM

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

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
