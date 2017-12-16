note

	description:
	"[
		Cluster SCM mappings which gives write access to the repository.
		The current cluster is associated with another cluster, the master cluster.
		The content of the master cluster and its subclusters corresponds to what
		can be found in the SCM repository. Information about the corresponding
		files can be fetched that way. But contrary to ET_CLUSTER_SCM_READ_MAPPING,
		check-out, check-in, etc. operations are provided to update the version of
		these classes in the repository. These operations will be applied to classes
		in the current cluster.
		Typically the master and current clusters will actually be the same cluster.
		This is how most SCMs work. But it is also possible to have two different
		clusters. In that case the current cluster is likely to be an override
		cluster. Checked-out classes will be added to the current cluster and
		hence override the version in the master cluster. After having been checked-in,
		these classes will be removed from the current cluster, so it will be necessary
		to resynchronize the master cluster to match the version in the SCM repository
		in order to pick up the modifications.
	]"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLUSTER_SCM_WRITE_MAPPING

inherit

	ET_CLUSTER_SCM_MAPPING

feature -- Access

	master_cluster: ET_CLUSTER
			-- Cluster containing the master copy of the classes
			-- that will be checked-out to and checked-in from
			-- `current_cluster'

invariant

	master_cluster_not_void: master_cluster /= Void

end
