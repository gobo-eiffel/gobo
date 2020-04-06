note

	description:

		"ECF Eiffel clusters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_CLUSTER

inherit

	ET_CLUSTER
		rename
			make as make_cluster
		undefine
			lower_name
		redefine
			parent,
			subclusters,
			pathname,
			full_pathname,
			full_unix_pathname,
			is_hidden,
			is_valid_eiffel_filename,
			is_valid_directory_name,
			new_recursive_cluster,
			universe
		end

	ET_ECF_GROUP

	UT_SHARED_ECF_VERSIONS
		export {NONE} all end

create

	make, make_relative

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname; a_universe: like universe; a_target: like target)
			-- Create a new cluster.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_pathname_not_void: a_pathname /= Void
			a_universe_not_void: a_universe /= Void
			a_target_not_void: a_target /= Void
		do
			name := a_name
			pathname := a_pathname
			is_relative := a_pathname.count > 2 and then a_pathname.item (1) = '$' and then (once "|/\").has (a_pathname.item (2))
			universe := a_universe
			target := a_target
			set_scm_mapping_constraint_enabled (True)
			if attached universe.ecf_version as l_ecf_version and then l_ecf_version <= ecf_1_4_0 then
				set_use_obsolete_syntax (True)
			end
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
			universe_set: universe = a_universe
			target_set: target = a_target
			prefixed_name_set: prefixed_name = a_name
			is_relative: is_relative = (a_pathname.count > 2 and then a_pathname.item (1) = '$' and then (once "|/\").has (a_pathname.item (2)))
			scm_mapping_constraint_enabled: scm_mapping_constraint_enabled
		end

	make_relative (a_name: like name; a_universe: like universe; a_target: like target)
			-- Create a new cluster whose pathname is its name relative to its parent cluster if any.		
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_universe_not_void: a_universe /= Void
			a_target_not_void: a_target /= Void
		do
			name := a_name
			pathname := a_name
			is_relative := True
			universe := a_universe
			target := a_target
			set_scm_mapping_constraint_enabled (True)
			if attached universe.ecf_version as l_ecf_version and then l_ecf_version <= ecf_1_4_0 then
				set_use_obsolete_syntax (True)
			end
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_name
			universe_set: universe = a_universe
			target_set: target = a_target
			prefixed_name_set: prefixed_name = a_name
			is_relative: is_relative
			scm_mapping_constraint_enabled: scm_mapping_constraint_enabled
		end

feature -- Access

	pathname: STRING
			-- Directory pathname

	full_pathname: STRING
			-- Full directory pathname
		local
			a_pathname: STRING
			parent_pathname: STRING
			a_basename: STRING
			l_root_dir: STRING
			i, nb: INTEGER
		do
			a_pathname := pathname
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
				else
					-- Not relative.
				end
			end
				-- Expanded variables of the form $NAME or ${NAME}.
			a_pathname := target.variables.interpreted_string (a_pathname)
				-- Make sure that the directory separator symbol is the
				-- one of the current file system. We take advantage of
				-- the fact that `windows_file_system' accepts both '\'
				-- and '/' as directory separator.
			a_pathname := file_system.pathname_from_file_system (a_pathname, windows_file_system)
			if is_relative and attached parent as l_parent then
				parent_pathname := l_parent.full_pathname
				if a_pathname.count > 0 then
					a_basename := a_pathname
				else
					a_basename := name
				end
				Result := file_system.pathname (parent_pathname, a_basename)
			else
				if a_pathname.count > 0 then
					Result := a_pathname
				else
					Result := name
				end
				if file_system.is_relative_pathname (Result) then
					if attached target.settings.value ({ET_ECF_SETTING_NAMES}.library_root_setting_name) as l_library_root then
						l_root_dir := l_library_root
					else
						l_root_dir := file_system.dirname (target.system_config.filename)
					end
					Result := file_system.pathname (l_root_dir, Result)
				end
			end
		end

	full_unix_pathname: STRING
			-- Full Unix directory pathname
		do
			Result := unix_file_system.pathname_from_file_system (full_pathname, file_system)
		end

	file_rules: detachable ET_ECF_FILE_RULES
			-- File rules

	conditioned_file_rules: detachable ET_ECF_FILE_RULES
			-- File rules as they appear in the ECF file;
			-- Some of them might not be included in `file_rules'
			-- depending on their associated condition, whereas
			-- some others from parent clusters or targets may be
			-- included in `file_rules'.

	classname_prefix: detachable STRING
			-- Prefix for class names when using classes of current group
			-- (may be Void)

	class_renamings: detachable DS_HASH_TABLE [STRING, STRING]
			-- Class renaming, indexed by old class names in upper-case,
			-- when using classes of current group
			-- (may be Void)

	class_mappings: detachable DS_HASH_TABLE [STRING, STRING]
			-- Class mapping, indexed by old class names in upper-case
			-- (e.g. STRING mapped to STRING_32, old_name = STRING, new_anme = STRING_32)
			-- (may be Void)

	visible_classes: detachable DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS]
			-- Classes and features accessible from other languages

	overridden_group: detachable STRING
			-- Name of the group current cluster overrides, if specified.
			-- Meaningful only when `is_override' is True

	provider_groups: detachable DS_ARRAYED_LIST [STRING]
			-- Names of the groups that current cluster depends on, if specified

	universe: ET_ECF_INTERNAL_UNIVERSE
			-- Surrounding universe

feature -- Status report

	is_hidden: BOOLEAN
			-- Should the classes of current group not be exported when part of a library?
			-- See ET_ADAPTED_UNIVERSE.export_classes.

	is_valid_eiffel_filename (a_filename: STRING): BOOLEAN
			-- Is `a_filename' an Eiffel filename which has
			-- not been excluded?
		local
			l_pathname: STRING
		do
			if precursor (a_filename) then
				if attached file_rules as l_file_rules then
					if is_implicit then
						l_pathname := "/" + unix_file_system.pathname (implicit_relative_name ('/'), a_filename)
					else
						l_pathname := "/" + a_filename
					end
					Result := l_file_rules.is_included (l_pathname)
				else
					Result := True
				end
			end
		end

	is_valid_directory_name (a_dirname: STRING): BOOLEAN
			-- Is `a_dirname' a directory name other than "." and
			-- ".." and which has not been excluded?
		local
			l_pathname: STRING
		do
			if precursor (a_dirname) then
				if attached file_rules as l_file_rules then
					if is_implicit then
						l_pathname := "/" + unix_file_system.pathname (implicit_relative_name ('/'), a_dirname)
					else
						l_pathname := "/" + a_dirname
					end
					Result := l_file_rules.is_included (l_pathname)
				else
					Result := True
				end
			end
		end

feature -- Nested

	parent: detachable ET_ECF_CLUSTER
			-- Parent cluster

	subclusters: detachable ET_ECF_CLUSTERS
			-- Subclusters

	conditioned_subclusters: detachable ET_ECF_CLUSTERS
			-- Subclusters as they appear in the ECF file;
			-- Some of them might not be included in `subclusters'
			-- depending on their associated condition.

feature -- Setting

	set_file_rules (a_file_rules: like file_rules)
			-- Set `file_rules' to `a_file_rules'.
		do
			file_rules := a_file_rules
		ensure
			file_rules_set: file_rules = a_file_rules
		end

	set_conditioned_file_rules (a_file_rules: like conditioned_file_rules)
			-- Set `conditioned_file_rules' to `a_file_rules'.
		do
			conditioned_file_rules := a_file_rules
		ensure
			conditioned_file_rules_set: conditioned_file_rules = a_file_rules
		end

	set_conditioned_subclusters (a_subclusters: like conditioned_subclusters)
			-- Set `conditioned_subclusters' to `a_subclusters'.
		do
			if attached conditioned_subclusters as l_conditioned_subclusters then
				l_conditioned_subclusters.set_parent (Void)
			end
			conditioned_subclusters := a_subclusters
			if a_subclusters /= Void then
				a_subclusters.set_parent (Current)
			end
		ensure
			conditioned_subclusters_set: conditioned_subclusters = a_subclusters
		end

	set_classname_prefix (a_prefix: like classname_prefix)
			-- Set `classname_prefix' to `a_prefix'.
		do
			classname_prefix := a_prefix
		ensure
			classname_prefix_set: classname_prefix = a_prefix
		end

	set_class_renamings (a_renamings: like class_renamings)
			-- Set `class_renamings' to `a_renamings'.
		require
			no_void_new_class_renaming: a_renamings /= Void implies not a_renamings.has_void
			no_void_old_class_renaming: a_renamings /= Void implies not a_renamings.has_void_item
		do
			class_renamings := a_renamings
		ensure
			class_renamings_set: class_renamings = a_renamings
		end

	set_class_mappings (a_mappings: like class_mappings)
			-- Set `class_mappings' to `a_mappings'.
		require
			no_void_old_class_mapping: a_mappings /= Void implies not a_mappings.has_void
			no_void_new_class_mapping: a_mappings /= Void implies not a_mappings.has_void_item
		do
			class_mappings := a_mappings
		ensure
			class_mappings_set: class_mappings = a_mappings
		end

	set_visible_classes (a_visible_classes: like visible_classes)
			-- Set `visible_classes' to `a_visible_classes'.
		require
			no_void_visible_class: a_visible_classes /= Void implies not a_visible_classes.has_void
		do
			visible_classes := a_visible_classes
		ensure
			visible_classes_set: visible_classes = a_visible_classes
		end

feature -- Status setting

	set_hidden (b: BOOLEAN)
			-- Set `is_hidden' to `b'.
		do
			is_hidden := b
		ensure
			hidden_set: is_hidden = b
		end

	set_overridden_group (a_overridden_group: like overridden_group)
			-- Set `overridden_group' to `a_overridden_group'.
		do
			overridden_group := a_overridden_group
		ensure
			overridden_group_set: overridden_group = a_overridden_group
		end

	set_provider_groups (a_provider_groups: like provider_groups)
			-- Set `provider_groups' to `a_provider_groups'.
		require
			no_void_group: a_provider_groups /= Void implies not a_provider_groups.has_void
		do
			provider_groups := a_provider_groups
		ensure
			provider_groups_set: provider_groups = a_provider_groups
		end

feature -- Element change

	fill_subclusters (a_state: ET_ECF_STATE)
			-- Make sure that clusters in `conditioned_subclusters' whose conditions
			-- satisfy `a_state' are included in `subclusters'.
			-- Process recursively the clusters in `subclusters'.
		require
			a_state_not_void: a_state /= Void
		local
			i, nb: INTEGER
			l_cluster: ET_ECF_CLUSTER
		do
			if attached conditioned_subclusters as l_conditioned_subclusters then
				nb := l_conditioned_subclusters.count
				from i := 1 until i > nb loop
					l_cluster := l_conditioned_subclusters.cluster (i)
					if l_cluster.is_enabled (a_state) then
						add_subcluster (l_cluster)
						l_cluster.fill_subclusters (a_state)
					end
					i := i + 1
				end
			end
		end

	fill_file_rules (a_target: ET_ECF_TARGET; a_state: ET_ECF_STATE)
			-- Make sure that file rules in `a_target', in `parent' if any,
			-- and in `conditioned_file_rules' whose conditions satisfy `a_state'
			-- are included in `file_rules'.
			-- Process recursively the clusters in `subclusters'.
		require
			a_target_not_void: a_target /= Void
			a_state_not_void: a_state /= Void
		local
			l_file_rules: detachable ET_ECF_FILE_RULES
		do
			l_file_rules := file_rules
			if l_file_rules = Void then
				create l_file_rules.make_empty
				file_rules := l_file_rules
			end
			a_target.fill_file_rules (l_file_rules, a_state)
			if attached parent as l_parent then
				if attached l_parent.file_rules as l_parent_file_rules then
					l_parent_file_rules.fill_file_rules (l_file_rules, a_state)
				end
			end
			if attached conditioned_file_rules as l_conditioned_file_rules then
				l_conditioned_file_rules.fill_file_rules (l_file_rules, a_state)
			end
			if attached subclusters as l_subclusters then
				l_subclusters.do_all (agent {ET_ECF_CLUSTER}.fill_file_rules (a_target, a_state))
			end
		end

feature {NONE} -- Implementation

	new_recursive_cluster (a_name: STRING): like Current
			-- New recursive cluster
		do
			create Result.make_relative (a_name, universe, target)
			Result.set_parent (Current)
			Result.set_file_rules (file_rules)
			Result.set_recursive (True)
			Result.set_implicit (True)
			Result.set_override (is_override)
			Result.set_read_only (is_read_only)
			Result.set_hidden (is_hidden)
			Result.set_use_obsolete_syntax (use_obsolete_syntax)
			Result.set_classname_prefix (classname_prefix)
			Result.set_class_renamings (class_renamings)
			Result.set_class_mappings (class_mappings)
			Result.set_options (options)
			Result.set_class_options (class_options)
			Result.set_visible_classes (visible_classes)
			Result.set_provider_groups (provider_groups)
			Result.set_overridden_group (overridden_group)
		end

invariant

	no_void_old_class_renaming: attached class_renamings as l_class_renamings implies not l_class_renamings.has_void
	no_void_new_class_renaming: attached class_renamings as l_class_renamings implies not l_class_renamings.has_void_item
	no_void_new_class_mapping: attached class_mappings as l_class_mappings implies not l_class_mappings.has_void
	no_void_old_class_mapping: attached class_mappings as l_class_mappings implies not l_class_mappings.has_void_item
	no_void_visible_class: attached visible_classes as l_visible_classes implies not l_visible_classes.has_void
	no_void_provider_group: attached provider_groups as l_provider_groups implies not l_provider_groups.has_void

end
