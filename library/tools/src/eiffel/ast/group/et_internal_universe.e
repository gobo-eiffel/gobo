note

	description:
	"[
		Eiffel class universes whose classes can be found locally
		in clusters, or imported from libraries or .NET assemblies.
	]"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2008-12-23 16:09:12 +0100 (Tue, 23 Dec 2008) $"
	revision: "$Revision: 6570 $"

deferred class ET_INTERNAL_UNIVERSE

inherit

	ET_UNIVERSE
		redefine
			initialize,
			preparse,
			preparse_recursive,
			parse_all,
			parse_all_recursive,
			import_classes,
			add_universe_recursive,
			universes_do_all,
			universes_do_if,
			adapted_universe
		end

feature {NONE} -- Initialization

	initialize
			-- Initialize universe.
		do
			precursor
			create libraries.make_empty
			create clusters.make_empty
			create dotnet_assemblies.make_empty
		end

feature -- Status report

	has_group_by_name (a_names: ARRAY [STRING]): BOOLEAN
			-- Is there a group named `a_names' starting from within current universe
			-- and recursively traversing dependent universes if needed?
			-- Do not take into account missing implicit subclusters.
		do
			Result := has_group_by_name_at_index (a_names, a_names.lower)
		end

	has_cluster (a_cluster: ET_CLUSTER): BOOLEAN
			-- Is `a_cluster' one of the clusters or recursively
			-- subclusters of current universe?
		do
			if a_cluster.universe = Current then
				Result := clusters.has_subcluster (a_cluster)
			end
		end

	has_cluster_recursive (a_cluster: ET_CLUSTER): BOOLEAN
			-- Is `a_cluster' one of the clusters or recursively
			-- subclusters of current universe or recursively in
			-- one of the universes it depends on?
		do
			Result := internal_universes_there_exists (agent {ET_INTERNAL_UNIVERSE}.has_cluster (a_cluster))
		end

	has_cluster_by_name (a_names: ARRAY [STRING]): BOOLEAN
			-- Is there a cluster named `a_names' in universe?
			-- Do not take into account missing implicit subclusters.
		require
			a_names_not_void: a_names /= Void
-- Does not compile in void-safe mode:
--			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		do
			Result := clusters.has_subcluster_by_name (a_names)
		end

	has_cluster_by_name_recursive (a_names: ARRAY [STRING]): BOOLEAN
			-- Is there a cluster named `a_names' in universe
			-- or recursively in one of the universes it depends on?
			-- Do not take into account missing implicit subclusters.
		require
			a_names_not_void: a_names /= Void
-- Does not compile in void-safe mode:
--			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		do
			Result := internal_universes_there_exists (agent {ET_INTERNAL_UNIVERSE}.has_cluster_by_name (a_names))
		end

	has_cluster_with_absolute_pathname (a_pathname: STRING): BOOLEAN
			-- Is there a cluster with absolute pathname `a_pathname' in universe?
			--
			-- `a_pathname' is expected to be a canonical absolute pathname.
			-- Do not take into account missing implicit subclusters.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_absolute: file_system.is_absolute_pathname (a_pathname)
		do
			Result := clusters.has_subcluster_with_absolute_pathname (a_pathname)
		end

	has_cluster_with_absolute_pathname_recursive (a_pathname: STRING): BOOLEAN
			-- Is there a cluster with absolute pathname `a_pathname' in universe
			-- or recursively in one of the universes it depends on?
			--
			-- `a_pathname' is expected to be a canonical absolute pathname.
			-- Do not take into account missing implicit subclusters.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_absolute: file_system.is_absolute_pathname (a_pathname)
		do
			Result := internal_universes_there_exists (agent {ET_INTERNAL_UNIVERSE}.has_cluster_with_absolute_pathname (a_pathname))
		end

feature {ET_INTERNAL_UNIVERSE} -- Status report

	has_group_by_name_at_index (a_names: ARRAY [STRING]; a_index: INTEGER): BOOLEAN
			-- Is there a group named `a_names', ignoring the entries before `a_index',
			-- starting from within current universe and recursively traversing
			-- dependent universes if needed?
			-- Do not take into account missing implicit subclusters.
		require
			a_names_not_void: a_names /= Void
-- Does not compile in void-safe mode:
--			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		local
			nb: INTEGER
		do
			nb := a_names.upper
			if a_index <= nb then
				if attached library_by_name (a_names.item (a_index)) as l_library then
					if a_index = nb then
						Result := True
					else
						Result := l_library.has_group_by_name_at_index (a_names, a_index + 1)
					end
				elseif attached dotnet_assembly_by_name (a_names.item (a_index)) as l_dotnet_assembly then
					if a_index = nb then
						Result := True
					else
						Result := l_dotnet_assembly.has_group_by_name_at_index (a_names, a_index + 1)
					end
				else
					Result := clusters.has_subcluster_by_name_at_index (a_names, a_index)
				end
			end
		end

feature -- Access

	clusters: ET_CLUSTERS
			-- Clusters

	libraries: ET_ADAPTED_LIBRARIES
			-- Libraries that current universe depends on

	dotnet_assemblies: ET_ADAPTED_DOTNET_ASSEMBLIES
			-- .NET assemblies that current universe depends on

	cluster_by_name (a_names: ARRAY [STRING]): detachable ET_CLUSTER
			-- Cluster named `a_names' in current universe
			--
			-- Add missing implicit subclusters if needed.
			-- Void if not such cluster.
		require
			a_names_not_void: a_names /= Void
-- Does not compile in void-safe mode:
--			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		do
			Result := clusters.subcluster_by_name (a_names)
		ensure
			not_void_if_has: has_cluster_by_name (a_names) implies Result /= Void
		end

	library_by_name (a_name: STRING): detachable ET_LIBRARY
			-- Library with name `a_name';
			-- Void if not such library
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			if attached libraries.library_by_name (a_name) as l_adapted_library then
				Result := l_adapted_library.library
			end
		end

	dotnet_assembly_by_name (a_name: STRING): detachable ET_DOTNET_ASSEMBLY
			-- .NET assembly with name `a_name';
			-- Void if not such .NET assembly
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			if attached dotnet_assemblies.dotnet_assembly_by_name (a_name) as l_adapted_dotnet_assembly then
				Result := l_adapted_dotnet_assembly.dotnet_assembly
			end
		end

	group_by_name (a_names: ARRAY [STRING]): detachable ET_GROUP
			-- Group named `a_names' starting from within current universe
			-- and recursively traversing dependent universes if needed
			--
			-- Add missing implicit subclusters if needed.
			-- Void if not such group.
		do
			Result := group_by_name_at_index (a_names, a_names.lower)
		end

	cluster_with_absolute_pathname (a_pathname: STRING): detachable ET_CLUSTER
			-- Cluster with absolute pathname `a_pathname' in current universe
			--
			-- `a_pathname' is expected to be a canonical absolute pathname.
			-- Add missing implicit subclusters if needed.
			-- Void if not such cluster.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_absolute: file_system.is_absolute_pathname (a_pathname)
		do
			Result := clusters.subcluster_with_absolute_pathname (a_pathname)
		ensure
			not_void_if_has: has_cluster_with_absolute_pathname (a_pathname) implies Result /= Void
		end

	cluster_with_absolute_pathname_recursive (a_pathname: STRING): detachable ET_CLUSTER
			-- Cluster with absolute pathname `a_pathname' in current universe
			-- or recursively in one of the universes it depends on.
			--
			-- `a_pathname' is expected to be a canonical absolute pathname.
			-- Add missing implicit subclusters if needed.
			-- Void if not such cluster.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_absolute: file_system.is_absolute_pathname (a_pathname)
		local
			l_cell: DS_CELL [detachable ET_CLUSTER]
		do
			create l_cell.make (Void)
			internal_universes_do_recursive (agent {ET_INTERNAL_UNIVERSE}.do_cluster_with_absolute_pathname (a_pathname, agent l_cell.put ({ET_CLUSTER}?)))
			Result := l_cell.item
		ensure
			not_void_if_has: has_cluster_with_absolute_pathname_recursive (a_pathname) implies Result /= Void
		end

	adapted_universe (a_universe: ET_UNIVERSE): detachable ET_ADAPTED_UNIVERSE
			-- Adapted version of `a_universe' viewed from current universe
			-- when it depends on it, Void otherwise
			--
			-- `a_universe' may be a library or assembly from which the current
			-- universe imports classes. Note that `a_universe' may be imported
			-- twice by the current universe. Return one of them in that case.
		do
			if attached {ET_LIBRARY} a_universe as l_library then
				Result := libraries.adapted_library (l_library)
			elseif attached {ET_DOTNET_ASSEMBLY} a_universe as l_dotnet_assembly then
				Result := dotnet_assemblies.adapted_dotnet_assembly (l_dotnet_assembly)
			end
		end

feature {ET_INTERNAL_UNIVERSE} -- Access

	group_by_name_at_index (a_names: ARRAY [STRING]; a_index: INTEGER): detachable ET_GROUP
			-- Group named `a_names', ignoring the entries before `a_index',
			-- starting from within current universe and recursively traversing
			-- dependent universes if needed
			--
			-- Add missing implicit subclusters if needed.
			-- Void if not such group.
		require
			a_names_not_void: a_names /= Void
-- Does not compile in void-safe mode:
--			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		local
			nb: INTEGER
		do
			nb := a_names.upper
			if a_index <= nb then
				if attached library_by_name (a_names.item (a_index)) as l_library then
					if a_index = nb then
						Result := l_library
					else
						Result := l_library.group_by_name_at_index (a_names, a_index + 1)
					end
				elseif attached dotnet_assembly_by_name (a_names.item (a_index)) as l_dotnet_assembly then
					if a_index = nb then
						Result := l_dotnet_assembly
					else
						Result := l_dotnet_assembly.group_by_name_at_index (a_names, a_index + 1)
					end
				else
					Result := clusters.subcluster_by_name_at_index (a_names, a_index)
				end
			end
		ensure
			not_void_if_has: has_group_by_name_at_index (a_names, a_index) implies Result /= Void
		end

feature -- Measurement

	cluster_count: INTEGER
			-- Number of non-abstract clusters and recursively subclusters in current universe
		do
			Result := clusters.count_recursive
		ensure
			cluster_count_not_negavite: Result >= 0
		end

	cluster_count_recursive: INTEGER
			-- Number of non-abstract clusters and recursively subclusters in current universe
			-- and recursively in the universes it depends on
		local
			l_visited: DS_HASH_SET [ET_INTERNAL_UNIVERSE]
		do
			create l_visited.make (initial_universes_capacity)
			add_internal_universe_recursive (l_visited)
			from l_visited.start until l_visited.after loop
				Result := Result + l_visited.item_for_iteration.cluster_count
				l_visited.forth
			end
		ensure
			cluster_count_not_negavite: Result >= 0
		end

	override_cluster_count: INTEGER
			-- Number of non-abstract non-read-only override clusters and recursively subclusters
			-- in current universe; 0 if current universe is read only
		do
			if not is_read_only then
				Result := clusters.override_count_recursive
			end
		ensure
			override_cluster_count_not_negavite: Result >= 0
		end

	override_cluster_count_recursive: INTEGER
			-- Number of non-abstract non-read-only override clusters and recursively subclusters
			-- in current universe and recursively in the universes it depends on
		local
			l_visited: DS_HASH_SET [ET_INTERNAL_UNIVERSE]
		do
			create l_visited.make (initial_universes_capacity)
			add_internal_universe_recursive (l_visited)
			from l_visited.start until l_visited.after loop
				Result := Result + l_visited.item_for_iteration.override_cluster_count
				l_visited.forth
			end
		ensure
			override_cluster_count_not_negavite: Result >= 0
		end

	read_write_cluster_count: INTEGER
			-- Number of non-abstract non-read-only clusters and recursively subclusters
			-- in current universe; 0 if current universe is read only
		do
			if not is_read_only then
				Result := clusters.read_write_count_recursive
			end
		ensure
			read_write_cluster_count_not_negavite: Result >= 0
		end

	read_write_cluster_count_recursive: INTEGER
			-- Number of non-abstract non-read-only clusters and recursively subclusters
			-- in current universe and recursively in the universes it depends on
		local
			l_visited: DS_HASH_SET [ET_INTERNAL_UNIVERSE]
		do
			create l_visited.make (initial_universes_capacity)
			add_internal_universe_recursive (l_visited)
			from l_visited.start until l_visited.after loop
				Result := Result + l_visited.item_for_iteration.read_write_cluster_count
				l_visited.forth
			end
		ensure
			read_write_cluster_count_not_negavite: Result >= 0
		end

feature -- Setting

	set_clusters (a_clusters: like clusters)
			-- Set `a_clusters' to `clusters'.
		require
			a_clusters_not_void: a_clusters /= Void
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

	set_libraries (a_libraries: like libraries)
			-- Set `a_libraries' to `libraries'.
		require
			a_libraries_not_void: a_libraries /= Void
		do
			libraries := a_libraries
		ensure
			libraries_set: libraries = a_libraries
		end

	set_dotnet_assemblies (a_assemblies: like dotnet_assemblies)
			-- Set `a_assemblies' to `dotnet_assemblies'.
		require
			a_assemblies_not_void: a_assemblies /= Void
		do
			dotnet_assemblies := a_assemblies
		ensure
			dotnet_assemblies_set: dotnet_assemblies = a_assemblies
		end

feature -- Element change

	add_implicit_subclusters
			-- Add to current universe implicit subclusters (recursively) when clusters are recursive.
			-- Note that these subclusters will otherwise be added when running
			-- one of the `preparse*' or `parse_all*' routines.
		do
			clusters.add_implicit_subclusters
		end

	add_implicit_subclusters_recursive
			-- Add to current universe and recursively the universes it depends on
			-- implicit subclusters (recursively) when clusters are recursive.
			-- Note that these subclusters will otherwise be added when running
			-- one of the `preparse*' or `parse_all*' routines.
		do
			internal_universes_do_recursive (agent {ET_INTERNAL_UNIVERSE}.add_implicit_subclusters)
		end

feature -- Iteration

	clusters_do_explicit (an_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]])
			-- Apply `an_action' to every non-implicit cluster of current universe
			-- and recursively their subclusters.
			-- (Semantics not guaranteed if `an_action' adds or removes clusters.)
		do
			clusters.do_explicit (an_action)
		end

	clusters_do_explicit_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]])
			-- Apply `an_action' to every non-implicit cluster of current universe
			-- and recursively their subclusters, as well as on the clusters and
			-- subclusters that are declared in the universes it depends on recursively.
			-- (Semantics not guaranteed if `an_action' adds or removes clusters.)
		do
			internal_universes_do_recursive (agent {ET_INTERNAL_UNIVERSE}.clusters_do_explicit (an_action))
		end

	universes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]])
			-- Apply `an_action' to every universe that current universe depends on.
		do
			libraries.universes_do_all (an_action)
			dotnet_assemblies.universes_do_all (an_action)
		end

	universes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]; a_test: FUNCTION [ANY, TUPLE [ET_UNIVERSE], BOOLEAN])
			-- Apply `an_action' to every universe that current universe depends on and
			-- which satisfies `a_test'.
		do
			libraries.universes_do_if (an_action, a_test)
			dotnet_assemblies.universes_do_if (an_action, a_test)
		end

	internal_universes_do_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_INTERNAL_UNIVERSE]])
			-- Apply `an_action' on current universe and recursively on
			-- the internal universes it depends on.
		require
			an_action_not_void: an_action /= Void
		local
			l_visited: DS_HASH_SET [ET_INTERNAL_UNIVERSE]
		do
			create l_visited.make (initial_universes_capacity)
			add_internal_universe_recursive (l_visited)
			l_visited.do_all (an_action)
		end

	internal_universes_do_recursive_until (an_action: PROCEDURE [ANY, TUPLE [ET_INTERNAL_UNIVERSE]]; a_stop_request: detachable FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' on current universe and recursively on
			-- the internal universes it depends on.
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		local
			l_visited: DS_HASH_SET [ET_INTERNAL_UNIVERSE]
		do
			if a_stop_request = Void then
				internal_universes_do_recursive (an_action)
			elseif not a_stop_request.item ([]) then
				create l_visited.make (initial_universes_capacity)
				add_internal_universe_recursive (l_visited)
				from l_visited.start until l_visited.after loop
					if a_stop_request.item ([]) then
						l_visited.go_after
					else
						an_action.call ([l_visited.item_for_iteration])
						l_visited.forth
					end
				end
			end
		end

	internal_universes_there_exists (a_test: FUNCTION [ANY, TUPLE [ET_INTERNAL_UNIVERSE], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least current universe or recursively one
			-- of the internal universes it depends on?
		require
			a_test_not_void: a_test /= Void
		local
			l_visited: DS_HASH_SET [ET_INTERNAL_UNIVERSE]
		do
			create l_visited.make (initial_universes_capacity)
			add_internal_universe_recursive (l_visited)
			from l_visited.start until l_visited.after loop
				if a_test.item ([l_visited.item_for_iteration]) then
					Result := True
						-- Jump out of the loop.
					l_visited.go_after
				else
					l_visited.forth
				end
			end
		end

	dotnet_assemblies_do_all (a_action: PROCEDURE [ANY, TUPLE [ET_DOTNET_ASSEMBLY]])
			-- Apply `a_action' to every .NET assembly of `dotnet_assemblies', from first to last.
			-- (Semantics not guaranteed if `a_action' changes the list.)
		require
			a_action_not_void: a_action /= Void
		do
			dotnet_assemblies.do_all (a_action)
		end

	dotnet_assemblies_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_DOTNET_ASSEMBLY]]; a_test: FUNCTION [ANY, TUPLE [ET_DOTNET_ASSEMBLY], BOOLEAN])
			-- Apply `an_action' to every .NET assembly  of `dotnet_assemblies'
			-- that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			dotnet_assemblies.do_if (an_action, a_test)
		end

feature -- Relations

	add_universe_recursive (a_visited: DS_HASH_SET [ET_UNIVERSE])
			-- Add current universe to `a_visited' and
			-- recursively the universes it depends on.
		do
			if not a_visited.has (Current) then
				a_visited.force_last (Current)
				libraries.do_all (agent {ET_LIBRARY}.add_universe_recursive (a_visited))
				dotnet_assemblies.do_all (agent {ET_DOTNET_ASSEMBLY}.add_universe_recursive (a_visited))
			end
		end

	add_internal_universe_recursive (a_visited: DS_HASH_SET [ET_INTERNAL_UNIVERSE])
			-- Add current universe to `a_visited' and
			-- recursively the internal universes it depends on.
		require
			a_visited_not_void: a_visited /= Void
		do
			if not a_visited.has (Current) then
				a_visited.force_last (Current)
				libraries.do_all (agent {ET_LIBRARY}.add_internal_universe_recursive (a_visited))
			end
		end

feature -- Actions

	do_cluster_with_absolute_pathname (a_pathname: STRING; a_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]])
			-- Execute `a_action' on cluster with absolute pathname `a_pathname' in current universe.
			-- Do nothing if not such cluster.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_absolute: file_system.is_absolute_pathname (a_pathname)
			a_action_not_void: a_action /= Void
		do
			if attached cluster_with_absolute_pathname (a_pathname) as l_cluster then
				a_action.call ([l_cluster])
			end
		end

feature -- Parsing

	preparse
			-- Build a mapping between class names and their filenames and
			-- populate `classes', even if the classes have not been
			-- parsed yet. If current universe had already been preparsed,
			-- then rebuild the mapping between class names and filenames:
			-- modified classes are reset and left unparsed and new classes
			-- are added to `master_classes', but are not parsed.
			--
			-- Note that only classes declared locally will be taken into
			-- account. Classes from other universes will be imported later,
			-- when they will have been preparsed as well.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
		do
			if not is_preparsed then
				is_preparsed := True
				clusters.do_all (agent {ET_CLUSTER}.process (current_system.eiffel_preparser))
			elseif not is_read_only then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				master_classes_do_all (agent {ET_MASTER_CLASS}.reset_local_modified_classes)
				master_classes_do_all (agent {ET_MASTER_CLASS}.remove_unknown_local_classes)
				clusters.do_all (agent {ET_CLUSTER}.process (current_system.eiffel_preparser))
			end
		end

	preparse_recursive
			-- Build a mapping between class names and their filenames and
			-- populate `master_classes', even if the classes have not been
			-- parsed yet. If current universe had already been preparsed,
			-- then rebuild the mapping between class names and filenames:
			-- modified classes are reset and left unparsed and new classes
			-- are added to `master_classes', but are not parsed.
			--
			-- Note that both locally declared classes and classes imported
			-- from other universes (after having themselves been preparsed
			-- recursively) will be taken into account.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
		local
			l_assembly_set: DS_HASH_SET [ET_DOTNET_ASSEMBLY]
			l_assemblies: ET_DOTNET_ASSEMBLIES
		do
				-- First preparse locally all dependent universes.
			create l_assembly_set.make (dotnet_assemblies.count)
			internal_universes_do_recursive (agent {ET_INTERNAL_UNIVERSE}.dotnet_assemblies_do_if (agent l_assembly_set.force_last, agent {ET_DOTNET_ASSEMBLY}.is_consumable))
			create l_assemblies.make_empty
			l_assembly_set.do_all (agent l_assemblies.put_last)
			current_system.dotnet_assembly_consumer.consume_assemblies (l_assemblies)
			dotnet_assemblies.do_recursive (agent {ET_DOTNET_ASSEMBLY}.preparse)
			libraries.do_recursive (agent {ET_LIBRARY}.preparse)
			preparse
				-- Then for each universe, import classes from other universes.
			dotnet_assemblies.do_recursive (agent {ET_DOTNET_ASSEMBLY}.import_classes)
			libraries.do_recursive (agent {ET_LIBRARY}.import_classes)
			import_classes
				-- Reset incrementally all classes that may have been
				-- affected by changes made above.
			if classes_modified_recursive then
				reset_classes_incremental_recursive
			end
		end

	parse_all
			-- Parse all classes declared locally in the current universe.
			-- There is no need to call one of the preparse routines
			-- beforehand since the current routine will traverse all
			-- clusters and parse all Eiffel files anyway. The mapping
			-- between class names and their filenames will be done during
			-- this process and `master_classes' will be populated.
			-- If current universe had already been preparsed, then rebuild
			-- the mapping between class names and filenames and reparse
			-- the classes that have been modified or were not parsed yet.
			--
			-- Note that only classes declared locally will be taken into
			-- account. Classes from other universes will be imported later,
			-- when they will have been (pre)parsed as well.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
		do
			if not is_preparsed then
				is_preparsed := True
				clusters.do_all (agent {ET_CLUSTER}.process (current_system.eiffel_parser))
			elseif not is_read_only then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				master_classes_do_all (agent {ET_MASTER_CLASS}.reset_local_modified_classes)
				master_classes_do_all (agent {ET_MASTER_CLASS}.remove_unknown_local_classes)
				clusters.do_all (agent {ET_CLUSTER}.process (current_system.eiffel_parser))
			end
		end

	parse_all_recursive
			-- Parse all classes declared locally in the current universe,
			-- and recursively those that are declared in universes it
			-- depends on. There is no need to call one of the preparse
			-- routines beforehand since the current routine will traverse
			-- all clusters and parse all Eiffel files anyway. The mapping
			-- between class names and their filenames will be done during
			-- this process and `master_classes' will be populated (both with
			-- classes declared locally and those imported from other universes
			-- which have themselves been parsed recursively during this call).
			-- If current universe had already been preparsed, then rebuild
			-- the mapping between class names and filenames and reparse
			-- the classes that have been modified or were not parsed yet.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
		local
			l_assembly_set: DS_HASH_SET [ET_DOTNET_ASSEMBLY]
			l_assemblies: ET_DOTNET_ASSEMBLIES
		do
				-- First preparse locally all dependent universes.
			create l_assembly_set.make (dotnet_assemblies.count)
			internal_universes_do_recursive (agent {ET_INTERNAL_UNIVERSE}.dotnet_assemblies_do_if (agent l_assembly_set.force_last, agent {ET_DOTNET_ASSEMBLY}.is_consumable))
			create l_assemblies.make_empty
			l_assembly_set.do_all (agent l_assemblies.put_last)
			current_system.dotnet_assembly_consumer.consume_assemblies (l_assemblies)
			dotnet_assemblies.do_recursive (agent {ET_DOTNET_ASSEMBLY}.parse_all)
			libraries.do_recursive (agent {ET_LIBRARY}.parse_all)
			parse_all
				-- Then for each universe, import classes from other universes.
			dotnet_assemblies.do_recursive (agent {ET_DOTNET_ASSEMBLY}.import_classes)
			libraries.do_recursive (agent {ET_LIBRARY}.import_classes)
			import_classes
				-- Reset incrementally all classes that may have been
				-- affected by changes made above.
			if classes_modified_recursive then
				reset_classes_incremental_recursive
			end
		end

feature {ET_UNIVERSE} -- Parsing

	import_classes
			-- Import classes made available (i.e. exported) by other universes.
		local
			l_old_obsolete_routine_type_mode: BOOLEAN
		do
			master_classes_do_all (agent {ET_MASTER_CLASS}.remove_unknown_imported_classes)
			libraries.do_adapted (agent {ET_ADAPTED_LIBRARY}.export_classes (Current))
			dotnet_assemblies.do_adapted (agent {ET_ADAPTED_DOTNET_ASSEMBLY}.export_classes (Current))
			if function_type.base_class.formal_parameter_count = 2 then
				l_old_obsolete_routine_type_mode := obsolete_routine_type_mode
				obsolete_routine_type_mode := True
				function_type.resolve_unfolded_tuple_actual_parameters_1 (Current)
				obsolete_routine_type_mode := l_old_obsolete_routine_type_mode
			end
			if predicate_like_current_type.base_class.formal_parameter_count = 1 then
				l_old_obsolete_routine_type_mode := obsolete_routine_type_mode
				obsolete_routine_type_mode := True
				predicate_like_current_type.resolve_unfolded_tuple_actual_parameters_1 (Current)
				obsolete_routine_type_mode := l_old_obsolete_routine_type_mode
			end
			if procedure_like_current_type.base_class.formal_parameter_count = 1 then
				l_old_obsolete_routine_type_mode := obsolete_routine_type_mode
				obsolete_routine_type_mode := True
				procedure_like_current_type.resolve_unfolded_tuple_actual_parameters_1 (Current)
				obsolete_routine_type_mode := l_old_obsolete_routine_type_mode
			end
			if routine_type.base_class.formal_parameter_count = 1 then
				l_old_obsolete_routine_type_mode := obsolete_routine_type_mode
				obsolete_routine_type_mode := True
				routine_type.resolve_unfolded_tuple_actual_parameters_1 (Current)
				obsolete_routine_type_mode := l_old_obsolete_routine_type_mode
			end
		end

invariant

	libraries_not_void: libraries /= Void
	clusters_not_void: clusters /= Void
	dotnet_assemblies_not_void: dotnet_assemblies /= Void

end
