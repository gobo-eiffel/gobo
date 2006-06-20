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

	make (a_cluster: like current_cluster; a_names: like group_names) is
			-- Create a dependence constraint for `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
		do
			current_cluster := a_cluster
			group_names := a_names
		ensure
			current_cluster_set: current_cluster = a_cluster
			group_names_set: group_names = a_names
		end

feature -- Status report

	has_group (a_group: ET_GROUP): BOOLEAN is
			-- Is `a_group' or one of its ancestors part of
			-- the current dependence constraint?
		require
			a_group_not_void: a_group /= Void
		local
			l_name: STRING
			i, nb: INTEGER
			l_parent: ET_GROUP
		do
			if a_group = current_cluster then
				Result := True
			else
				nb := group_names.count
				if nb > 0 then
					l_name := a_group.full_name ('.')
					from i := 1 until i > nb loop
						if STRING_.same_case_insensitive (group_names.item (i), l_name) then
							Result := True
							i := nb + 1
						else
							i := i + 1
						end
					end
				end
				if not Result then
					l_parent := a_group.parent
					if l_parent /= Void then
						Result := has_group (l_parent)
					end
				end
			end
		end

feature -- Access

	current_cluster: ET_CLUSTER
			-- Current cluster for which `group_names'
			-- have been specified

	group_names: DS_ARRAYED_LIST [STRING]
			-- Names of groups that should be the only providers
			-- or the only dependants of `current_cluster'

invariant

	current_cluster_not_void: current_cluster /= Void
	group_names_not_void: group_names /= Void
	no_void_group_name: not group_names.has (Void)

end
