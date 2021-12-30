note

	description:

		"Eiffel clusters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLUSTER

inherit

	ET_PRIMARY_GROUP
		redefine
			is_cluster, cluster,
			relative_name, relative_lower_name,
			full_pathname, full_unix_pathname,
			kind_name,
			has_class_recursive,
			class_count_recursive,
			classes_do_recursive,
			classes_do_if_recursive
		end

	ET_IMPORTED_AGENT_ROUTINES
		export {NONE} all end

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname; a_universe: like universe)
			-- Create a new cluster.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_universe_not_void: a_universe /= Void
		do
			name := a_name
			pathname := a_pathname
			is_relative := (a_pathname = Void)
			universe := a_universe
			set_scm_mapping_constraint_enabled (True)
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
			universe_set: universe = a_universe
			is_relative: is_relative = (a_pathname = Void)
			scm_mapping_constraint_enabled: scm_mapping_constraint_enabled
		end

feature -- Status report

	is_cluster: BOOLEAN = True
			-- Is current group a cluster?

	is_abstract: BOOLEAN
			-- Is there no classes in current cluster?
			-- (i.e. 'abstract' keyword in HACT's LACE.)

	is_fully_abstract: BOOLEAN
			-- Are current cluster and recursively all its
			-- subclusters abstract?
		local
			i, nb: INTEGER
			a_cluster_list: DS_ARRAYED_LIST [ET_CLUSTER]
		do
			if is_abstract then
				Result := True
				if attached subclusters as l_subclusters then
					a_cluster_list := l_subclusters.clusters
					nb := a_cluster_list.count
					from i := 1 until i > nb loop
						if not a_cluster_list.item (i).is_fully_abstract then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

	is_recursive: BOOLEAN
			-- Is current cluster recursive, in other words
			-- should subdirectories be considered as subclusters?
			-- (i.e. 'all' or 'library' keywords in ISE's LACE.)

	is_relative: BOOLEAN
			-- Is the pathname of current cluster relative to the
			-- pathname of its parent cluster?

	is_relative_to (a_cluster: ET_CLUSTER): BOOLEAN
			-- Is the pathname of current cluster relative to the
			-- pathname of its ancestor `a_cluster'?
		require
			a_cluster_not_void: a_cluster /= Void
			a_cluster_is_ancestor: has_ancestor (a_cluster)
		local
			l_parent: detachable ET_CLUSTER
		do
			if a_cluster = Current then
				Result := True
			else
				from
					l_parent := parent
					Result := is_relative
				until
					l_parent = Void
				loop
					if not l_parent.is_recursive then
						Result := False
						l_parent := Void
					elseif l_parent = a_cluster then
						l_parent := Void
					elseif l_parent.is_relative then
						l_parent := l_parent.parent
					else
						Result := False
						l_parent := Void
					end
				end
			end
		end

	is_override: BOOLEAN
			-- Is current cluster an override cluster?
			-- In other words, do classes in this cluster and other override
			-- clusters take precedence over classes with same names but in
			-- non-override cluster? (see 'override_cluster' in ISE's LACE.)

	is_read_only: BOOLEAN
			-- Is current cluster a read-only cluster?
			-- In other words, are changes in this cluster and in its classes
			-- not taken into account when repreparsing or reparsing
			-- the universe? (see 'library' in ISE's LACE.)

	is_preparsed: BOOLEAN
			-- Has current group already been traversed to look for its classes?

	is_implicit: BOOLEAN
			-- Has current cluster not been explicitly declared
			-- but is instead the result of the fact that its
			-- parent (or recursively the parent of its parent)
			-- is a recursive cluster?

	has_ancestor (a_cluster: ET_CLUSTER): BOOLEAN
			-- Is `a_cluster' the current cluster itself,
			-- or recursively one of its parents?
		require
			a_cluster_not_void: a_cluster /= Void
		local
			l_parent: detachable ET_CLUSTER
		do
			if a_cluster = Current then
				Result := True
			else
				from
					l_parent := parent
				until
					l_parent = Void
				loop
					if l_parent = a_cluster then
						Result := True
						l_parent := Void
					else
						l_parent := l_parent.parent
					end
				end
			end
		end

	has_subcluster (a_cluster: ET_CLUSTER): BOOLEAN
			-- Is `a_cluster' (recursively) one of the subclusters
			-- of current cluster?
		require
			a_cluster_not_void: a_cluster /= Void
		local
			l_parent: detachable ET_GROUP
		do
			from
				l_parent := a_cluster.parent
			until
				l_parent = Void or Result
			loop
				Result := l_parent = Current
				l_parent := l_parent.parent
			end
		end

	has_cluster_by_name (a_names: ARRAY [STRING]): BOOLEAN
			-- Is there a subcluster (recursively) named `a_names',
			-- or True if `a_names' is empty?
			-- Do not take into account missing implicit subclusters.
		require
			a_names_not_void: a_names /= Void
			no_void_name: across a_names as l_name all l_name /= Void end
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		do
			if a_names.is_empty then
				Result := True
			elseif attached subclusters as l_subclusters then
				Result := l_subclusters.has_subcluster_by_name (a_names)
			end
		end

	has_cluster_with_absolute_pathname (a_pathname: STRING): BOOLEAN
			-- Does current cluster or one of its subclusters (recursively)
			-- have the absolute pathname `a_pathname'?
			--
			-- `a_pathname' is expected to be a canonical absolute pathname.
			-- Do not take into account missing implicit subclusters.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_absolute: file_system.is_absolute_pathname (a_pathname)
		do
			if file_system.same_pathnames (a_pathname, absolute_pathname) then
				Result := True
			elseif attached subclusters as l_subclusters then
				Result := l_subclusters.has_subcluster_with_absolute_pathname (a_pathname)
			end
		end

	is_valid_eiffel_filename (a_filename: STRING): BOOLEAN
			-- Is `a_filename' an Eiffel filename which has
			-- not been excluded?
		require
			a_filename_not_void: a_filename /= Void
		do
			Result := has_eiffel_extension (a_filename)
		end

	is_valid_directory_name (a_dirname: STRING): BOOLEAN
			-- Is `a_dirname' a directory name other than "." and
			-- ".." and which has not been excluded?
		require
			a_dirname_not_void: a_dirname /= Void
		do
			Result := a_dirname.count > 0 and
				not STRING_.same_string (a_dirname, dot_directory_name) and
				not STRING_.same_string (a_dirname, dot_dot_directory_name)
		end

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Is current cluster the primary group of `a_class'?
			-- Do not take into account overridden classes.
		do
			Result := a_class.is_in_group (Current) and then not a_class.is_overridden
		end

	has_class_recursive (a_class: ET_CLASS): BOOLEAN
			-- Has `a_class' been declared in current cluster or recursively
			-- in one of its subclusters?
			-- Do not take into account overridden classes.
		do
			Result := a_class.is_in_group_recursive (Current) and then not a_class.is_overridden
		end

feature -- Access

	name: STRING
			-- Name

	relative_name (a_universe: ET_UNIVERSE; a_separator: CHARACTER): STRING
			-- Name of current group relative its parents and its universe down to `a_universe'
			-- (use `a_separator' as separator between parents' and universes' names)
			--
			-- If `a_universe' is `universe' then return the name relative to its
			-- parents only. Otherwise use one of the shortest paths between
			-- `a_universe' and `universe', and if no such path exists then return
			-- the name relative to its parents only.
		local
			l_parent_name: STRING
			l_basename: STRING
		do
			if a_universe = universe then
				if attached parent as l_parent then
					l_parent_name := l_parent.relative_name (l_parent.universe, a_separator)
					l_basename := name
					Result := STRING_.new_empty_string (l_parent_name, l_parent_name.count + l_basename.count + 1)
					Result.append_string (l_parent_name)
					Result.append_character (a_separator)
					Result := STRING_.appended_string (Result, l_basename)
				else
					Result := name
				end
			else
				Result := precursor (a_universe, a_separator)
			end
		end

	relative_lower_name (a_universe: ET_UNIVERSE; a_separator: CHARACTER): STRING
			-- Lower-name of current group relative its parents and its universe down to `a_universe'
			-- (use `a_separator' as separator between parents' and universes' names)
			--
			-- If `a_universe' is `universe' then return the name relative to its
			-- parents only. Otherwise Use one of the shortest paths between
			-- `a_universe' and `universe', and if no such path exists then return
			-- the name relative to its parents only.
		local
			l_parent_name: STRING
			l_basename: STRING
		do
			if a_universe = universe then
				if attached parent as l_parent then
					l_parent_name := l_parent.relative_lower_name (l_parent.universe, a_separator)
					l_basename := lower_name
					Result := STRING_.new_empty_string (l_parent_name, l_parent_name.count + l_basename.count + 1)
					Result.append_string (l_parent_name)
					Result.append_character (a_separator)
					Result := STRING_.appended_string (Result, l_basename)
				else
					Result := lower_name
				end
			else
				Result := precursor (a_universe, a_separator)
			end
		end

	implicit_relative_name (a_separator: CHARACTER): STRING
			-- Name of current cluster relative its explicit ancestor
			-- (use `a_separator' as separator between parents' and universes' names)
		require
			is_implicit: is_implicit
		local
			l_parent_name: STRING
			l_basename: STRING
		do
			if attached parent as l_parent and then l_parent.is_implicit then
				l_parent_name := l_parent.implicit_relative_name (a_separator)
				l_basename := name
				Result := STRING_.new_empty_string (l_parent_name, l_parent_name.count + l_basename.count + 1)
				Result.append_string (l_parent_name)
				Result.append_character (a_separator)
				Result := STRING_.appended_string (Result, l_basename)
			else
				Result := name
			end
		ensure
			implicit_relative_name_not_void: Result /= Void
			implicit_relative_name_not_empty: Result.count > 0
		end

	implicit_relative_lower_name (a_separator: CHARACTER): STRING
			-- Lower-name of current cluster relative its explicit ancestor
			-- (use `a_separator' as separator between parents' and universes' names)
		require
			is_implicit: is_implicit
		local
			l_parent_name: STRING
			l_basename: STRING
		do
			if attached parent as l_parent and then l_parent.is_implicit then
				l_parent_name := l_parent.implicit_relative_lower_name (a_separator)
				l_basename := lower_name
				Result := STRING_.new_empty_string (l_parent_name, l_parent_name.count + l_basename.count + 1)
				Result.append_string (l_parent_name)
				Result.append_character (a_separator)
				Result := STRING_.appended_string (Result, l_basename)
			else
				Result := lower_name
			end
		ensure
			implicit_relative_lower_name_not_void: Result /= Void
			implicit_relative_lower_name_not_empty: Result.count > 0
			definition: Result.same_string (implicit_relative_name (a_separator).as_lower)
		end

	pathname: detachable STRING
			-- Directory pathname (may be Void)

	full_pathname: STRING
			-- Full directory pathname
		local
			parent_pathname: STRING
			a_basename: STRING
		do
			if is_relative and attached parent as l_parent then
				parent_pathname := l_parent.full_pathname
				if attached pathname as l_pathname and then l_pathname.count > 0 then
					a_basename := l_pathname
				else
					a_basename := name
				end
				Result := file_system.pathname (parent_pathname, a_basename)
			elseif attached pathname as l_pathname and then l_pathname.count > 0 then
				Result := l_pathname
			else
				Result := name
			end
		end

	full_unix_pathname: STRING
			-- Full Unix directory pathname
		local
			parent_pathname: STRING
			a_basename: STRING
		do
			if is_relative and attached parent as l_parent then
				parent_pathname := l_parent.full_unix_pathname
				if attached pathname as l_pathname and then l_pathname.count > 0 then
					a_basename := l_pathname
				else
					a_basename := name
				end
				Result := unix_file_system.pathname (parent_pathname, a_basename)
			elseif attached pathname as l_pathname and then l_pathname.count > 0 then
				Result := l_pathname
			else
				Result := name
			end
		end

	universe: ET_UNIVERSE
			-- Surrounding universe

	cluster: ET_CLUSTER
			-- Current group viewed as a cluster
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	kind_name: STRING
			-- Name of the kind of group (e.g. "cluster", "assembly", etc.)
		once
			Result := "cluster"
		end

feature -- Nested

	parent: detachable ET_CLUSTER
			-- Parent cluster

	cluster_by_name (a_names: ARRAY [STRING]): detachable ET_CLUSTER
			-- Current cluster if `a_names' is empty, otherwise
			-- (recursively) subcluster named `a_names'
			--
			-- Add missing implicit subclusters if needed.
			-- Void if not such cluster.
		require
			a_names_not_void: a_names /= Void
			no_void_name: across a_names as i_name all i_name /= Void end
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		local
			l_name: STRING
		do
			if a_names.is_empty then
				Result := Current
			elseif attached subclusters as l_subclusters then
				Result := l_subclusters.subcluster_by_name_with_parent (a_names, Current)
			elseif is_recursive then
				l_name := a_names.item (a_names.lower)
				if is_valid_directory_name (l_name) then
					add_recursive_cluster (l_name)
					if attached subclusters as l_subclusters then
						Result := l_subclusters.subcluster_by_name_with_parent (a_names, Current)
					else
						check
								-- Postcondition of `add_recursive_cluster'.
							subclusters_not_void: False
						end
					end
				end
			end
		ensure
			not_void_if_has: has_cluster_by_name (a_names) implies Result /= Void
			has_ancestor: Result /= Void implies Result.has_ancestor (Current)
		end

	cluster_with_absolute_pathname (a_pathname: STRING): detachable ET_CLUSTER
			-- Cluster with absolute pathname `a_pathname' in either current cluster
			-- or one of its subclusters (recursively)
			--
			-- `a_pathname' is expected to be a canonical absolute pathname.
			-- Add missing implicit subclusters if needed.
			-- Void if not such cluster.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_absolute: file_system.is_absolute_pathname (a_pathname)
		local
			l_pathname, l_current_pathname: KI_PATHNAME
		do
			if file_system.same_pathnames (a_pathname, absolute_pathname) then
				Result := Current
			elseif is_recursive then
				l_pathname := file_system.string_to_pathname (a_pathname)
				l_current_pathname := file_system.string_to_pathname (absolute_pathname)
				if l_current_pathname.is_case_insensitive_subpathname (l_pathname) then
					Result := cluster_by_name (l_current_pathname.trailing_items (l_pathname))
				end
			elseif attached subclusters as l_subclusters then
				Result := l_subclusters.subcluster_with_absolute_pathname (a_pathname)
			end
		ensure
			not_void_if_has: has_cluster_with_absolute_pathname (a_pathname) implies Result /= Void
			has_ancestor: Result /= Void implies Result.has_ancestor (Current)
		end

	cluster_with_relative_pathname_to (a_cluster, a_ancestor: ET_CLUSTER): detachable ET_CLUSTER
			-- Cluster in either current cluster or one of its subclusters (recursively)
			-- whose relative pathname to current cluster is the same as the relative
			-- pathname between `a_cluster' and `a_ancestor'
			--
			-- Add missing implicit subclusters if needed.
			-- Void if not such cluster.
		require
			a_cluster_not_void: a_cluster /= Void
			a_ancestor_not_void: a_ancestor /= Void
			a_ancestor_is_ancestor: a_cluster.has_ancestor (a_ancestor)
			a_cluster_is_relative: a_cluster.is_relative_to (a_ancestor)
		local
			l_cluster_pathname, l_ancestor_pathname: KI_PATHNAME
			l_trailing_items: ARRAY [STRING]
			l_full_pathname: STRING
		do
			if a_ancestor = Current then
				Result := a_cluster
			else
				l_cluster_pathname := file_system.string_to_pathname (a_cluster.absolute_pathname)
				l_ancestor_pathname := file_system.string_to_pathname (a_ancestor.absolute_pathname)
				l_trailing_items := l_ancestor_pathname.trailing_items (l_cluster_pathname)
				if l_trailing_items.is_empty then
					Result := Current
				elseif is_recursive then
					Result := cluster_by_name (l_trailing_items)
				else
					l_full_pathname := file_system.nested_pathname (absolute_pathname, l_trailing_items)
					if attached cluster_with_absolute_pathname (l_full_pathname) as l_cluster and then l_cluster.is_relative_to (Current) then
						Result := l_cluster
					end
				end
			end
		ensure
			has_ancestor: Result /= Void implies Result.has_ancestor (Current)
			is_relative: Result /= Void implies Result.is_relative_to (Current)
		end

	subclusters: detachable ET_CLUSTERS
			-- Subclusters

feature -- Dependence constraints

	provider_constraint: detachable ET_CLUSTER_DEPENDENCE_CONSTRAINT
			-- Clusters that are the only allowed providers of current cluster;
			-- No such constraint if `provider_constraint' is Void.
			-- If a file 'providers.txt' is found in current cluster's directory,
			-- then `provider_constraint' is filled with current cluster and the
			-- clusters whose names are listed in this file (separated by spaces,
			-- tabs or newlines). Otherwise `provider_constraint' is set to be the
			-- `provider_constraint' of current cluster's parent cluster if any.

	dependant_constraint: detachable ET_CLUSTER_DEPENDENCE_CONSTRAINT
			-- Clusters that are the only allowed dependants of current cluster;
			-- No such constraint if `dependant_constraint' is Void.
			-- If a file 'dependants.txt' is found in current cluster's directory,
			-- then `dependant_constraint' is filled with current cluster and the
			-- clusters whose names are listed in this file (separated by spaces,
			-- tabs or newlines). Otherwise `dependant_constraint' is set to be the
			-- `dependant_constraint' of current cluster's parent cluster if any.

	overridden_constraint_enabled: BOOLEAN
			-- When overriding, should classes of current cluster (and recursively
			-- of its subclusters) be considered as part of the cluster of their
			-- overridden classes when dealing with provider/dependant constraints?

	scm_mapping_constraint_enabled: BOOLEAN
			-- When a SCM write mapping is applicable to current cluster, should
			-- its classes be considered as part of the corresponding cluster
			-- relative to the master cluster when dealing with provider/dependant
			-- constraints?

feature -- SCM mappings

	scm_read_mapping: detachable ET_CLUSTER_SCM_READ_MAPPING
			-- SCM read mapping declared in current cluster
			--
			-- See class ET_CLUSTER_SCM_READ_MAPPING for explanations
			-- about SCM read mappings.

	scm_write_mapping: detachable ET_CLUSTER_SCM_WRITE_MAPPING
			-- SCM write mapping declared in current cluster
			--
			-- See class ET_CLUSTER_SCM_WRITE_MAPPING for explanations
			-- about SCM write mappings.

	scm_read_mapping_recursive: detachable ET_CLUSTER_SCM_READ_MAPPING
			-- SCM read mapping applicable to current cluster;
			-- It is either `scm_read_mapping' if not Void, or recursively
			-- the version from the parent cluster if the current cluster is relative
			-- (i.e. if its pathname is relative to the pathname of its parent cluster).
		do
			if scm_read_mapping /= Void then
				Result := scm_read_mapping
			elseif attached parent as l_parent and is_relative then
				Result := l_parent.scm_read_mapping_recursive
			end
		ensure
			has_ancestor: Result /= Void implies has_ancestor (Result.current_cluster)
			is_relative: Result /= Void implies is_relative_to (result.current_cluster)
		end

	scm_write_mapping_recursive: detachable ET_CLUSTER_SCM_WRITE_MAPPING
			-- SCM write mapping applicable to current cluster;
			-- It is either `scm_write_mapping' if not Void, or recursively
			-- the version from its parent cluster if the current cluster is relative
			-- (i.e. if its pathname is relative to the pathname of its parent cluster).
		do
			if scm_write_mapping /= Void then
				Result := scm_write_mapping
			elseif attached parent as l_parent and is_relative then
				Result := l_parent.scm_write_mapping_recursive
			end
		ensure
			has_ancestor: Result /= Void implies has_ancestor (Result.current_cluster)
			is_relative: Result /= Void implies is_relative_to (result.current_cluster)
		end

	scm_mapping_recursive: detachable ET_CLUSTER_SCM_MAPPING
			-- SCM read or write mapping applicable to current cluster;
			-- It is either `scm_write_mapping' if not Void, or else
			-- `scm_read_mapping' if not Void, or recursively the version
			-- from its parent cluster if the current cluster is relative
			-- (i.e. if its pathname is relative to the pathname of its
			-- parent cluster).
		do
			if scm_write_mapping /= Void then
				Result := scm_write_mapping
			elseif scm_read_mapping /= Void then
				Result := scm_read_mapping
			elseif attached parent as l_parent and is_relative then
				Result := l_parent.scm_mapping_recursive
			end
		ensure
			has_ancestor: Result /= Void implies has_ancestor (Result.current_cluster)
			is_relative: Result /= Void implies is_relative_to (result.current_cluster)
		end

feature -- Measurement

	count_recursive: INTEGER
			-- Number (recursively) of non-abstract clusters,
			-- including current cluster
		do
			if not is_abstract then
				Result := 1
			end
			if attached subclusters as l_subclusters then
				Result := Result + l_subclusters.count_recursive
			end
		ensure
			count_recursive_not_negative: Result >= 0
		end

	override_count_recursive: INTEGER
			-- Number (recursively) of non-abstract non-read-only override clusters,
			-- including current cluster
		do
			if not is_read_only and not is_abstract and is_override then
				Result := 1
			end
			if attached subclusters as l_subclusters then
				Result := Result + l_subclusters.override_count_recursive
			end
		ensure
			override_count_not_negative: Result >= 0
		end

	read_write_count_recursive: INTEGER
			-- Number (recursively) of non-abstract non-read-only clusters,
			-- including current cluster
		do
			if not is_read_only and not is_abstract then
				Result := 1
			end
			if attached subclusters as l_subclusters then
				Result := Result + l_subclusters.read_write_count_recursive
			end
		ensure
			read_write_count_recursive_not_negative: Result >= 0
		end

	class_count: INTEGER
			-- Number of classes which have been declared in
			-- current cluster or recursively in one of its subclusters.
			-- Do not take into account overridden classes.
		local
			l_counter: UT_COUNTER
		do
			create l_counter.make (0)
			classes_do_all (agent class_actions.call (?, agent l_counter.increment))
			Result := l_counter.item
		end

	class_count_recursive: INTEGER
			-- Number of classes with current cluster as primary group.
			-- Do not take into account overridden classes.
		local
			l_counter: UT_COUNTER
		do
			create l_counter.make (0)
			classes_do_recursive (agent class_actions.call (?, agent l_counter.increment))
			Result := l_counter.item
		end

feature -- Status setting

	set_abstract (b: BOOLEAN)
			-- Set `is_abstract' to `b'.
		do
			is_abstract := b
		ensure
			abstract_set: is_abstract = b
		end

	set_recursive (b: BOOLEAN)
			-- Set `is_recursive' to `b'.
		do
			is_recursive := b
		ensure
			recursive_set: is_recursive = b
		end

	set_relative (b: BOOLEAN)
			-- Set `is_relative' to `b'.
		do
			is_relative := b
		ensure
			relative_set: is_relative = b
		end

	set_override (b: BOOLEAN)
			-- Set `is_override' to `b'.
		do
			is_override := b
		ensure
			override_set: is_override = b
		end

	set_read_only (b: BOOLEAN)
			-- Set `is_read_only' to `b'.
		do
			is_read_only := b
		ensure
			read_only_set: is_read_only = b
		end

	set_preparsed (b: BOOLEAN)
			-- Set `is_preparsed' to `b'.
		do
			is_preparsed := b
		ensure
			preparsed_set: is_preparsed = b
		end

	set_implicit (b: BOOLEAN)
			-- Set `is_implicit' to `b'.
		do
			is_implicit := b
		ensure
			implicit_set: is_implicit = b
		end

	set_overridden_constraint_enabled (b: BOOLEAN)
			-- Set `overridden_constraint_enabled' to `b'.
		do
			if b then
				scm_mapping_constraint_enabled := False
			end
			overridden_constraint_enabled := b
			if attached subclusters as l_subclusters then
				l_subclusters.set_overridden_constraint_enabled (b)
			end
		ensure
			overridden_constraint_enabled_set: overridden_constraint_enabled = b
		end

	set_scm_mapping_constraint_enabled (b: BOOLEAN)
			-- Set `scm_mapping_constraint_enabled' to `b'.
		do
			if b then
				overridden_constraint_enabled := False
			end
			scm_mapping_constraint_enabled := b
			if attached subclusters as l_subclusters then
				l_subclusters.set_scm_mapping_constraint_enabled (b)
			end
		ensure
			scm_mapping_constraint_enabled_set: scm_mapping_constraint_enabled = b
		end

feature -- Setting

	set_subclusters (a_subclusters: like subclusters)
			-- Set `subclusters' to `a_subclusters'.
		do
			if attached subclusters as l_subclusters then
				l_subclusters.set_parent (Void)
			end
			subclusters := a_subclusters
			if a_subclusters /= Void then
				a_subclusters.set_parent (Current)
			end
		ensure
			subclusters_set: subclusters = a_subclusters
		end

	set_provider_constraint (a_constraint: like provider_constraint)
			-- Set `provider_constraint' to `a_constraint'.
		do
			provider_constraint := a_constraint
			if attached subclusters as l_subclusters then
				l_subclusters.set_provider_constraint (a_constraint)
			end
		ensure
			provider_constraint_set: provider_constraint = a_constraint
		end

	set_dependant_constraint (a_constraint: like dependant_constraint)
			-- Set `dependant_constraint' to `a_constraint'.
		do
			dependant_constraint := a_constraint
			if attached subclusters as l_subclusters then
				l_subclusters.set_dependant_constraint (a_constraint)
			end
		ensure
			dependant_constraint_set: dependant_constraint = a_constraint
		end

	set_scm_read_mapping (a_scm_mapping: like scm_read_mapping)
			-- Set `scm_read_mapping' to `a_scm_mapping'.
		do
			scm_read_mapping := a_scm_mapping
		ensure
			scm_read_mapping_set: scm_read_mapping = a_scm_mapping
		end

	set_scm_write_mapping (a_scm_mapping: like scm_write_mapping)
			-- Set `scm_write_mapping' to `a_scm_mapping'.
		do
			scm_write_mapping := a_scm_mapping
		ensure
			scm_write_mapping_set: scm_write_mapping = a_scm_mapping
		end

feature -- Element change

	add_subcluster (a_cluster: attached like parent)
			-- Add `a_cluster' to the list of subsclusters.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			l_subclusters: like subclusters
		do
			l_subclusters := subclusters
			if l_subclusters = Void then
				create l_subclusters.make_empty
				set_subclusters (l_subclusters)
			end
			l_subclusters.put_last (a_cluster)
			a_cluster.set_parent (Current)
		ensure
			subclusters_not_void: subclusters /= Void
		end

	add_recursive_cluster (a_name: STRING)
			-- Add recursive cluster named `s' to `subclusters'
			-- if not present yet.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			a_cluster: ET_CLUSTER
			a_cluster_list: DS_ARRAYED_LIST [ET_CLUSTER]
			found: BOOLEAN
			i, nb: INTEGER
		do
			if attached subclusters as l_subclusters then
				a_cluster_list := l_subclusters.clusters
				nb := a_cluster_list.count
				from i := 1 until i > nb loop
					a_cluster := a_cluster_list.item (i)
					if a_cluster.is_implicit then
						if STRING_.same_case_insensitive (a_name, a_cluster.name) then
							found := True
							i := nb + 1 -- Jump out of the loop.
						end
					end
					i := i + 1
				end
			end
			if not found then
				add_subcluster (new_recursive_cluster (a_name))
			end
		ensure
			subclusters_not_void: subclusters /= Void
		end

	add_implicit_subclusters
			-- Add (recursively) implicit subclusters to current cluster if it is recursive.
			-- Note that these subclusters will otherwise be added when running one of
			-- the `preparse*' or `parse_all*' routines of ET_UNIVERSE.
		local
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
		do
			if not is_abstract and is_recursive then
				dir_name := Execution_environment.interpreted_string (full_pathname)
				create dir.make (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if not has_eiffel_extension (s) and is_valid_directory_name (s) then
							if file_system.directory_exists (file_system.pathname (dir_name, s)) then
								add_recursive_cluster (s)
							end
						end
						dir.read_entry
					end
					dir.close
				else
					-- The cluster does not exist on disk or is not readable.
					-- Just ignore it.
				end
			end
			if attached subclusters as l_subclusters then
				l_subclusters.add_implicit_subclusters
			end
		end

feature -- Iteration

	classes_do_all (an_action: PROCEDURE [ET_CLASS])
			-- Apply `an_action' on all classes with current cluster as primary group.
			-- Do not take into account overridden classes.
		do
			universe.classes_do_if (an_action, agent {ET_CLASS}.is_in_group (Current))
		end

	classes_do_if (an_action: PROCEDURE [ET_CLASS]; a_test: FUNCTION [ET_CLASS, BOOLEAN])
			-- Apply `an_action' on all classes with current cluster as primary group,
			-- and which satisfy `a_test'.
			-- Do not take into account overridden classes.
		do
			universe.classes_do_if (an_action, agent class_actions.conjuncted_semistrict (?, agent {ET_CLASS}.is_in_group (Current), a_test))
		end

	classes_do_recursive (an_action: PROCEDURE [ET_CLASS])
			-- Apply `an_action' on all classes which have been declared in
			-- current cluster or recursively in one of its subclusters.
			-- Do not take into account overridden classes.
		do
			universe.classes_do_if (an_action, agent {ET_CLASS}.is_in_group_recursive (Current))
		end

	classes_do_if_recursive (an_action: PROCEDURE [ET_CLASS]; a_test: FUNCTION [ET_CLASS, BOOLEAN])
			-- Apply `an_action' on all classes which have been declared in
			-- current cluster or recursively in one of its subclusters,
			-- and which satisfy `a_test'.
			-- Do not take into account overridden classes.
		do
			universe.classes_do_if (an_action, agent class_actions.conjuncted_semistrict (?, agent {ET_CLASS}.is_in_group_recursive (Current), a_test))
		end

feature {ET_CLUSTER, ET_CLUSTERS} -- Setting

	set_parent (a_parent: like parent)
			-- Set `parent' to `a_parent'.
		do
			parent := a_parent
			if a_parent /= Void then
				set_provider_constraint (a_parent.provider_constraint)
				set_dependant_constraint (a_parent.dependant_constraint)
			else
				set_provider_constraint (Void)
				set_dependant_constraint (Void)
			end
		ensure
			parent_set: parent = a_parent
		end

feature {NONE} -- Implementation

	new_recursive_cluster (a_name: STRING): like Current
			-- New recursive cluster
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			create Result.make (a_name, Void, universe)
			Result.set_parent (Current)
			Result.set_recursive (True)
			Result.set_implicit (True)
			Result.set_override (is_override)
			Result.set_read_only (is_read_only)
			Result.set_use_obsolete_syntax (use_obsolete_syntax)
		ensure
			cluster_not_void: Result /= Void
			name_set: Result.name = a_name
			parent_set: Result.parent = Current
			recursive: Result.is_recursive
			implicit: Result.is_implicit
		end

	has_eiffel_extension (a_filename: STRING): BOOLEAN
			-- Has `a_filename' an Eiffel extension (.e)?
		require
			a_filename_not_void: a_filename /= Void
		local
			nb: INTEGER
			c: CHARACTER
		do
			nb := a_filename.count
			if nb > 2 and then a_filename.item (nb - 1) = '.' then
				c := a_filename.item (nb)
				if c = 'e' then
					Result := True
				elseif operating_system.is_windows and then c = 'E' then
					Result := True
				end
			end
		ensure
			definition: Result = (a_filename.count > 2 and then
				((a_filename.item (a_filename.count) = 'e' or
				(operating_system.is_windows and then
				a_filename.item (a_filename.count) = 'E')) and
				a_filename.item (a_filename.count - 1) = '.'))
		end

feature {NONE} -- Constants

	dot_directory_name: STRING = "."
	dot_dot_directory_name: STRING = ".."
			-- Directory names

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		require
			a_processor_not_void: a_processor /= Void
		do
			a_processor.process_cluster (Current)
		end

invariant

	is_cluster: is_cluster
	not_both_constraints_enabled: not (scm_mapping_constraint_enabled and overridden_constraint_enabled)

end
