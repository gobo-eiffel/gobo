indexing

	description:

		"ECF targets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_TARGET

inherit

	ANY

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name: STRING) is
			-- Create a new ECF target.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			create variables.make
		ensure
			name_set: name = a_name
		end

feature -- Access

	name: STRING
			-- Name

	clusters: ET_ECF_CLUSTERS
			-- Clusters

	libraries: ET_ECF_ADAPTED_LIBRARIES
			-- Libraries

	parent: ET_ECF_TARGET
			-- Parent, if any

	root: ET_ECF_ROOT
			-- Root class name, creation procedure name, etc.

	variables: ET_ECF_VARIABLES
			-- Variables visible from current target

	file_rules: ET_ECF_FILE_RULES
			-- File rules

feature -- Setting

	set_clusters (a_clusters: like clusters) is
			-- Set `clusters' to `a_clusters'.
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

	set_libraries (a_libraries: like libraries) is
			-- Set `libraries' to `a_libraries'.
		do
			libraries := a_libraries
		ensure
			libraries_set: libraries = a_libraries
		end

	set_parent (a_parent: like parent) is
			-- Set `parent' to `a_parent'.
		require
			-- no_cycle: no cycle introduced
		do
			parent := a_parent
			if parent /= Void then
				variables.set_secondary_variables (parent.variables)
			else
				variables.set_secondary_variables (Execution_environment)
			end
		ensure
			parent_set: parent = a_parent
		end

	set_root (a_root: like root) is
			-- Set `root' to `a_root'.
		do
			root := a_root
		ensure
			root_set: root = a_root
		end

	set_file_rules (a_file_rules: like file_rules) is
			-- Set `file_rules' to `a_file_rules'.
		do
			file_rules := a_file_rules
		ensure
			file_rules_set: file_rules = a_file_rules
		end

feature -- Basic operations

	update_state (a_state: ET_ECF_STATE) is
			-- Update `a_state' with information found in
			-- `parent' if any, and overridden by information
			-- found in current target.
		require
			a_state_not_void: a_state /= Void
		do
			if parent /= Void then
				parent.update_state (a_state)
			end
-- TODO
		end

	fill_universe (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE) is
			-- Add to `a_universe' the clusters and libraries of current target,
			-- and recursive its parent target if any, whose conditions satisfy
			-- `a_state'.
		require
			a_universe_not_void: a_universe /= Void
			a_state_not_void: a_state /= Void
		local
			l_universe_clusters: ET_CLUSTERS
			l_universe_libraries: ET_ADAPTED_LIBRARIES
			l_cluster: ET_ECF_CLUSTER
			l_library: ET_ECF_ADAPTED_LIBRARY
			i, nb: INTEGER
		do
			if parent /= Void then
				parent.fill_universe (a_universe, a_state)
			end
			if clusters /= Void then
				l_universe_clusters := a_universe.clusters
				nb := clusters.count
				from i := 1 until i > nb loop
					l_cluster := clusters.cluster (i)
					if l_cluster.is_enabled (a_state) then
						if l_universe_clusters = Void then
							create l_universe_clusters.make (l_cluster)
							a_universe.set_clusters (l_universe_clusters)
						else
							l_universe_clusters.put_last (l_cluster)
						end
						l_cluster.fill_subclusters (a_state)
						l_cluster.fill_file_rules (Current, a_state)
					end
					i := i + 1
				end
			end
			if libraries /= Void then
				l_universe_libraries := a_universe.libraries
				nb := libraries.count
				from i := 1 until i > nb loop
					l_library := libraries.library (i)
					if l_library.is_enabled (a_state) then
						if l_universe_libraries = Void then
							create l_universe_libraries.make (l_library)
							a_universe.set_libraries (l_universe_libraries)
						else
							l_universe_libraries.put_last (l_library)
						end
					end
					i := i + 1
				end
			end
		end

	fill_root (a_system: ET_ECF_SYSTEM) is
			-- Fill `a_system' with root information.
		require
			a_system_not_void: a_system /= Void
		do
			if root /= Void then
				root.fill_root (a_system)
			elseif parent /= Void then
				parent.fill_root (a_system)
			end
		end

	fill_file_rules (a_file_rules: ET_ECF_FILE_RULES; a_state: ET_ECF_STATE) is
			-- Add to `a_file_rules' the file rules current target, and recursive
			-- its parent target if any, whose conditions satisfy `a_state'.
		require
			a_file_rules_not_void: a_file_rules /= Void
			a_state_not_void: a_state /= Void
		do
			if parent /= Void then
				parent.fill_file_rules (a_file_rules, a_state)
			end
			if file_rules /= Void then
				file_rules.fill_file_rules (a_file_rules, a_state)
			end
		end

invariant

	name_not_void: name /= Void
--	no_cycle_in_parent: no cycle in parent
	variables_not_void: variables /= Void

end
