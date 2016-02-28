note

	description:

		"Cluster SCM mappings"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLUSTER_SCM_MAPPING

inherit

	HASHABLE

feature -- Access

	current_cluster: ET_CLUSTER
			-- Current cluster for which the SCM mapping
			-- have been specified

	hash_code: INTEGER
			-- Hash code value
		do
			Result := current_cluster.hash_code
		end

invariant

	current_cluster_not_void: current_cluster /= Void

end
