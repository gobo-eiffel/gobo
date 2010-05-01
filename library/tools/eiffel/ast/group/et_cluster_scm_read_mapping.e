note

	description:
	"[
		Cluster SCM mappings where only read access is provided.
		The content of the cluster and its subclusters corresponds to what
		can be found in the SCM repository. Information about the corresponding
		files can be fetched. The classes can be synchronized with the versions
		in the SCM repository. But no check-out, check-in, etc. operations are
		provided to update the version of these classes in the repository. Use
		ET_CLUSTER_SCM_WRITE_MAPPING for that.
	]"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLUSTER_SCM_READ_MAPPING

inherit

	ET_CLUSTER_SCM_MAPPING

feature -- Access

	scm_write_mappings: DS_HASH_SET [ET_CLUSTER_SCM_WRITE_MAPPING]
			-- SCM write mapping whose `master_cluster' have
			-- `Current' as SCM read mapping

invariant

	scm_write_mappings_not_void: scm_write_mappings /= Void
	not_void_scm_write_mapping: not scm_write_mappings.has_void

end
