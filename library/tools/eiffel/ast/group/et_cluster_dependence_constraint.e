indexing

	description:

		"Cluster dependence constraints"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2009/06/22 $"
	revision: "$Revision: #4 $"

class ET_CLUSTER_DEPENDENCE_CONSTRAINT

inherit

	ANY

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make,
	make_with_pathnames

feature {NONE} -- Initialization

	make (a_cluster: like current_cluster; a_names: like group_names) is
			-- Create a dependence constraint for `a_cluster'.
			-- `a_names' are the names of groups that should be the
			-- only providers or the only dependants of `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has_void
		do
			current_cluster := a_cluster
			group_names := a_names
			create group_pathnames.make_map (0)
			group_pathnames.set_key_equality_tester (string_equality_tester)
			create pathname_buffer.make (pathname_buffer_initial_capacity)
		ensure
			current_cluster_set: current_cluster = a_cluster
			group_names_set: group_names = a_names
		end

	make_with_pathnames (a_cluster: like current_cluster; a_pathnames: DS_ARRAYED_LIST [STRING]) is
			-- Create a dependence constraint for `a_cluster'.
			-- `a_pathnames' are the pathnames, possibly with wildcards,
			-- of groups that should be the only providers or the only
			-- dependants of `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_pathnames_not_void: a_pathnames /= Void
			no_void_pathname: not a_pathnames.has_void
		local
			l_wildcard: LX_DFA_WILDCARD
			i, nb: INTEGER
			l_pathname: STRING
			l_is_windows: BOOLEAN
			l_trailing_slash: BOOLEAN
		do
			current_cluster := a_cluster
			create pathname_buffer.make (pathname_buffer_initial_capacity)
			l_is_windows := operating_system.is_windows
			nb := a_pathnames.count
			create group_names.make (0)
			create group_pathnames.make_map (nb)
			group_pathnames.set_key_equality_tester (string_equality_tester)
			from i := 1 until i > nb loop
				l_pathname := Execution_environment.interpreted_string (a_pathnames.item (i))
				if file_system.is_relative_pathname (l_pathname) then
					l_pathname := file_system.pathname (a_cluster.absolute_pathname, l_pathname)
				end
				l_trailing_slash := not l_pathname.is_empty and then ((l_pathname.item (l_pathname.count) = '/') or (l_pathname.item (l_pathname.count) = '\'))
				l_pathname := file_system.canonical_pathname (l_pathname)
				l_pathname := l_pathname.twin
				replace_backslashes (l_pathname)
				if l_trailing_slash then
					l_pathname.append_character ('/')
				end
				create l_wildcard.compile (l_pathname, l_is_windows)
				group_pathnames.put_last (l_wildcard, a_pathnames.item (i))
				i := i + 1
			end
		ensure
			current_cluster_set: current_cluster = a_cluster
		end

feature -- Status report

	has_group (a_group: ET_GROUP): BOOLEAN is
			-- Is `a_group' or one of its ancestors part of
			-- the current dependence constraint?
		require
			a_group_not_void: a_group /= Void
		local
			l_parent: ET_GROUP
			l_library: ET_LIBRARY
			l_library_name: STRING
		do
				-- Note that we check first whether `group_pathnames' and `group_names' are
				-- empty to avoid spending to too much time and creating too much unnecessary
				-- memory garbage getting the pathname and full name of `a_group'.
			if a_group = current_cluster then
				Result := True
			elseif not group_pathnames.is_empty and then group_pathnames.there_exists (agent matches_pathname (a_group, group_pathname (a_group), ?)) then
				Result := True
			elseif not group_names.is_empty and then group_names.there_exists (agent STRING_.same_case_insensitive (?, a_group.full_name ('/'))) then
				Result := True
			elseif not group_names.is_empty and then group_names.there_exists (agent STRING_.same_case_insensitive (?, a_group.full_name ('.'))) then
				Result := True
			else
				l_parent := a_group.parent
				if l_parent /= Void then
					Result := has_group (l_parent)
				elseif not group_names.is_empty then
					l_library ?= a_group.universe
					if l_library /= Void then
						l_library_name := l_library.name
						if l_library_name /= Void and then not l_library_name.is_empty then
							Result := group_names.there_exists (agent STRING_.same_case_insensitive (?, l_library_name))
						end
					end
				end
			end
		end

feature -- Access

	current_cluster: ET_CLUSTER
			-- Current cluster for which `group_names' and/or `group_pathnames'
			-- have been specified

	group_names: DS_ARRAYED_LIST [STRING]
			-- Names of groups that should be the only providers
			-- or the only dependants of `current_cluster' (in addition
			-- to those specified in `group_pathnames').

	group_pathnames: DS_HASH_TABLE [LX_WILDCARD, STRING]
			-- Pathnames, possibly with wildcards, of groups that should be
			-- the only providers or the only dependants of `current_cluster'
			-- (in addition to those specified in `group_names')
			--
			-- The keys are the pathnames as specified by the user.

feature {NONE} -- Implementation

	matches_pathname (a_group: ET_GROUP; a_pathname: STRING; a_wildcard: LX_WILDCARD): BOOLEAN is
			-- Does `a_wildcard' match `a_pathname', where `a_pathname' is the unix
			-- equivalent of the pathname of `a_group?
		require
			a_group_not_void: a_group /= Void
			a_pathname_not_void: a_pathname /= Void
			a_wildcard_not_void: a_wildcard /= Void
		local
			l_pattern: STRING
			l_pathname: STRING
			l_slash_added: BOOLEAN
		do
			if a_wildcard.is_compiled then
				l_pathname := a_pathname
				l_pattern := a_wildcard.pattern
				if l_pattern /= Void and then not l_pattern.is_empty and then l_pattern.item (l_pattern.count) = '/' then
					if not l_pathname.is_empty and then l_pathname.item (l_pathname.count) /= '/' then
						if a_group.is_cluster then
							if l_pathname = pathname_buffer then
								l_pathname.append_character ('/')
								l_slash_added := True
							else
								l_pathname := l_pathname + "/"
							end
						end
					end
				end
				Result := a_wildcard.recognizes (l_pathname)
				if l_slash_added then
					l_pathname.remove_tail (1)
				end
			end
		end

	replace_backslashes (a_string: STRING) is
			-- Replace all '\' characters in `a_string' by '/' characters.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
		do
			nb := a_string.count
			from i := 1 until i > nb loop
				if a_string.item (i) = '\' then
					a_string.put ('/', i)
				end
				i := i + 1
			end
		end

	group_pathname (a_group: ET_GROUP): STRING is
			-- Absolute pathname of `a_group' where all '\' characters have been replaced by '/'
			--
			-- Note: Always return the same object, only its characters are changed
			-- to represent the new result.
		require
			a_group_not_void: a_group /= Void
		do
			STRING_.wipe_out (pathname_buffer)
			Result := pathname_buffer
			Result.append_string (a_group.absolute_pathname)
			replace_backslashes (Result)
		ensure
			group_pathname_not_void: Result /= Void
			shared_object: Result = pathname_buffer
		end

	pathname_buffer: STRING
			-- Buffer used to handle pathnames

feature {NONE} -- Constants

	pathname_buffer_initial_capacity: INTEGER is 512
			-- Initial capacity for `pathname_buffer'

invariant

	current_cluster_not_void: current_cluster /= Void
	group_names_not_void: group_names /= Void
	no_void_group_name: not group_names.has_void
	group_pathnames_not_void: group_pathnames /= Void
	no_void_group_pathname: not group_pathnames.has_void
	no_void_wildcard: not group_pathnames.has_void_item
	pathname_buffer_not_void: pathname_buffer /= Void

end
