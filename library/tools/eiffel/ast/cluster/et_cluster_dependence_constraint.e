indexing

	description:

		"Cluster dependence constraints"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLUSTER_DEPENDENCE_CONSTRAINT

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_cluster: like current_cluster; a_names: like cluster_names) is
			-- Create a dependence constraint for `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
		do
			current_cluster := a_cluster
			cluster_names := a_names
		ensure
			current_cluster_set: current_cluster = a_cluster
			cluster_names_set: cluster_names = a_names
		end

feature -- Status report

	has_cluster (a_cluster: ET_CLUSTER): BOOLEAN is
			-- Is `a_cluster' or one of its ancestors part of
			-- the current dependence constraint?
		require
			a_cluster_not_void: a_cluster /= Void
		local
			l_name: STRING
			i, nb: INTEGER
			l_parent: ET_CLUSTER
		do
			if a_cluster = current_cluster then
				Result := True
			else
				nb := cluster_names.count
				if nb > 0 then
					l_name := a_cluster.full_name ('.')
					from i := 1 until i > nb loop
						if STRING_.same_case_insensitive (cluster_names.item (i), l_name) then
							Result := True
							i := nb + 1
						else
							i := i + 1
						end
					end
				end
				if not Result then
					l_parent := a_cluster.parent
					if l_parent /= Void then
						Result := has_cluster (l_parent)
					end
				end
			end
		end

feature -- Access

	current_cluster: ET_CLUSTER
			-- Current cluster for which `cluster_names'
			-- have been specified

	cluster_names: DS_ARRAYED_LIST [STRING]
			-- Names of cluster that should be the only providers
			-- or the only dependants of `current_cluster'

invariant

	current_cluster_not_void: current_cluster /= Void
	cluster_names_not_void: cluster_names /= Void
	no_void_cluster_name: not cluster_names.has (Void)

end
