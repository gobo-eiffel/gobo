indexing

	description:

		"Xace HACT components"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_COMPONENT

create

	make

feature {NONE} -- Initialization

	make (a_cluster_name: like cluster_name; a_pathname: like pathname) is
			-- Create a new component.
		require
			a_cluster_name_not_void: a_cluster_name /= Void
			a_cluster_name_not_empty: a_cluster_name.count > 0
			a_pathname_not_void: a_pathname /= Void
		do
			cluster_name := a_cluster_name
			pathname := a_pathname
		ensure
			cluster_name_set: cluster_name = a_cluster_name
			pathname_set: pathname = a_pathname
		end

feature -- Access

	cluster_name: STRING
			-- Cluster name

	pathname: STRING
			-- Pathname

invariant

	cluster_name_not_void: cluster_name /= Void
	cluster_name_not_empty: cluster_name.count > 0
	pathname_not_void: pathname /= Void

end
