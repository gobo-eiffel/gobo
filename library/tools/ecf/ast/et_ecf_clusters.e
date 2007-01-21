indexing

	description:

		"ECF Eiffel cluster lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_CLUSTERS

inherit

	ET_CLUSTERS
		redefine
			cluster
		end

create

	make, make_empty

feature -- Access

	cluster (i: INTEGER): ET_ECF_CLUSTER is
			-- `i'-th cluster
		do
			Result := clusters.item (i)
		end

end
