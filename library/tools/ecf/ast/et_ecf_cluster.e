indexing

	description:

		"ECF Eiffel clusters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_CLUSTER

inherit

	ET_CLUSTER
		redefine
			parent, subclusters,
			full_pathname, full_unix_pathname,
			is_valid_eiffel_filename,
			is_valid_directory_name,
			universe
		end

	ET_ECF_CONDITIONED

	UT_SHARED_ECF_VERSIONS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname; a_universe: ET_ECF_INTERNAL_UNIVERSE) is
			-- Create a new cluster.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_universe_not_void: a_universe /= Void
		local
			l_ecf_version: UT_VERSION
		do
			name := a_name
			pathname := a_pathname
			is_relative := (a_pathname = Void)
			universe := a_universe
			set_scm_mapping_constraint_enabled (True)
			l_ecf_version := universe.ecf_version
			if l_ecf_version /= Void and then l_ecf_version <= ecf_1_4_0 then
				set_use_obsolete_syntax (True)
			end
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
			universe_set: universe = a_universe
			prefixed_name_set: prefixed_name = a_name
			is_relative: is_relative = (a_pathname = Void)
			scm_mapping_constraint_enabled: scm_mapping_constraint_enabled
		end

feature -- Access

	name: STRING
			-- Name

	pathname: STRING
			-- Directory pathname (may be Void)

	full_pathname: STRING is
			-- Full directory pathname
		local
			a_pathname: STRING
			parent_pathname: STRING
			a_basename: STRING
			l_relative: BOOLEAN
			l_ecf_universe: ET_ECF_INTERNAL_UNIVERSE
			l_ecf_filename: STRING
			i, nb: INTEGER
		do
			a_pathname := pathname
			if a_pathname /= Void then
					-- Get rid of '|' as directory separator.
				if a_pathname.has ('|') then
					a_pathname := a_pathname.twin
					nb := a_pathname.count
					from i := 1 until i > nb loop
						if a_pathname.item (i) = '|' then
							a_pathname.put ('/', i)
						end
						i := i + 1
					end
				end
					-- Process special case where the pathname starts with "$/..."
					-- or "$\...". The '$' sign will be replaced by the full pathname
					-- of the parent cluster if any.
				if a_pathname.count > 2 and then a_pathname.item (1) = '$' then
					inspect a_pathname.item (2)
					when '/', '\' then
						a_pathname := a_pathname.substring (3, a_pathname.count)
						l_relative := True
					else
						-- Not relative.
					end
				end
					-- Expanded variables of the form $NAME or ${NAME}.
				a_pathname := Execution_environment.interpreted_string (a_pathname)
					-- Make sure that the directory separator symbol is the
					-- one of the current file system. We take advantage of
					-- the fact that `windows_file_system' accepts both '\'
					-- and '/' as directory separator.
				a_pathname := file_system.pathname_from_file_system (a_pathname, windows_file_system)
			end
			if (is_relative or l_relative) and parent /= Void then
				parent_pathname := parent.full_pathname
				if a_pathname /= Void and then a_pathname.count > 0 then
					a_basename := a_pathname
				else
					a_basename := name
				end
				Result := file_system.pathname (parent_pathname, a_basename)
			else
				if a_pathname /= Void and then a_pathname.count > 0 then
					Result := a_pathname
				else
					Result := name
				end
				if file_system.is_relative_pathname (Result) then
					l_ecf_universe ?= universe
					if l_ecf_universe /= Void then
						l_ecf_filename := l_ecf_universe.filename
						Result := file_system.pathname (file_system.dirname (l_ecf_filename), Result)
					end
				end
			end
		end

	full_unix_pathname: STRING is
			-- Full Unix directory pathname
		do
			Result := unix_file_system.pathname_from_file_system (full_pathname, file_system)
		end

	file_rules: ET_ECF_FILE_RULES
			-- File rules

	ecf_file_rules: ET_ECF_FILE_RULES
			-- File rules as they appear in the ECF file;
			-- Some of them might not be included in `file_rules'
			-- depending on their associated condition, whereas
			-- some others from parent clusters or targets may be
			-- included in `file_rules'.

	universe: ET_ECF_INTERNAL_UNIVERSE
			-- Surrounding universe

feature -- Status report

	is_valid_eiffel_filename (a_filename: STRING): BOOLEAN is
			-- Is `a_filename' an Eiffel filename which has
			-- not been excluded?
		do
			if precursor (a_filename) then
				Result := (file_rules = Void or else file_rules.is_included (unix_file_system.pathname (full_unix_pathname, a_filename)))
			end
		end

	is_valid_directory_name (a_dirname: STRING): BOOLEAN is
			-- Is `a_dirname' a directory name other than "." and
			-- ".." and which has not been excluded?
		do
			if precursor (a_dirname) then
				Result := (file_rules = Void or else file_rules.is_included (unix_file_system.pathname (full_unix_pathname, a_dirname)))
			end
		end

feature -- Nested

	parent: ET_ECF_CLUSTER
			-- Parent cluster

	subclusters: ET_ECF_CLUSTERS
			-- Subclusters

	ecf_subclusters: ET_ECF_CLUSTERS
			-- Subclusters as they appear in the ECF file;
			-- Some of them might not be included in `subclusters'
			-- depending on their associated condition.

feature -- Setting

	set_file_rules (a_file_rules: like file_rules) is
			-- Set `file_rules' to `a_file_rules'.
		do
			file_rules := a_file_rules
		ensure
			file_rules_set: file_rules = a_file_rules
		end

	set_ecf_file_rules (a_file_rules: like ecf_file_rules) is
			-- Set `ecf_file_rules' to `a_file_rules'.
		do
			ecf_file_rules := a_file_rules
		ensure
			ecf_file_rules_set: ecf_file_rules = a_file_rules
		end

	set_ecf_subclusters (a_subclusters: like ecf_subclusters) is
			-- Set `ecf_subclusters' to `a_subclusters'.
		do
			if ecf_subclusters /= Void then
				ecf_subclusters.set_parent (Void)
			end
			ecf_subclusters := a_subclusters
			if ecf_subclusters /= Void then
				ecf_subclusters.set_parent (Current)
			end
		ensure
			ecf_subclusters_set: ecf_subclusters = a_subclusters
		end

feature -- Element change

	fill_subclusters (a_state: ET_ECF_STATE) is
			-- Make sure that clusters in `ecf_subclusters' whose conditions
			-- satisfy `a_state' are included in `subclusters'.
			-- Process recursively the clusters in `subclusters'.
		require
			a_state_not_void: a_state /= Void
		local
			i, nb: INTEGER
			l_cluster: ET_ECF_CLUSTER
		do
			if ecf_subclusters /= Void then
				nb := ecf_subclusters.count
				from i := 1 until i > nb loop
					l_cluster := ecf_subclusters.cluster (i)
					if l_cluster.is_enabled (a_state) then
						add_subcluster (l_cluster)
						l_cluster.fill_subclusters (a_state)
					end
					i := i + 1
				end
			end
		end

	fill_file_rules (a_target: ET_ECF_TARGET; a_state: ET_ECF_STATE) is
			-- Make sure that file rules in `a_target', in `parent' if any,
			-- and in `ecf_file_rules' whose conditions satisfy `a_state'
			-- are included in `file_rules'.
			-- Process recursively the clusters in `subclusters'.
		require
			a_target_not_void: a_target /= Void
			a_state_not_void: a_state /= Void
		local
			l_parent_file_rules: ET_ECF_FILE_RULES
		do
			if file_rules = Void then
				create file_rules.make_empty
			end
			a_target.fill_file_rules (file_rules, a_state)
			if parent /= Void then
				l_parent_file_rules := parent.file_rules
				if l_parent_file_rules /= Void then
					l_parent_file_rules.fill_file_rules (file_rules, a_state)
				end
			end
			if ecf_file_rules /= Void then
				ecf_file_rules.fill_file_rules (file_rules, a_state)
			end
			if subclusters /= Void then
				subclusters.do_all (agent {ET_ECF_CLUSTER}.fill_file_rules (a_target, a_state))
			end
		end

feature {NONE} -- Implementation

	new_recursive_cluster (a_name: STRING): like Current is
			-- New recursive cluster
		do
			create Result.make (a_name, Void, universe)
			Result.set_parent (Current)
			Result.set_file_rules (file_rules)
			Result.set_recursive (True)
			Result.set_implicit (True)
			Result.set_override (is_override)
			Result.set_read_only (is_read_only)
			Result.set_use_obsolete_syntax (use_obsolete_syntax)
		end

end
