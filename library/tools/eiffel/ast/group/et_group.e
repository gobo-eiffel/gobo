indexing

	description:

		"Groups of Eiffel classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_GROUP

inherit

	HASHABLE
	DEBUG_OUTPUT
	KL_IMPORTED_ANY_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_FILE_SYSTEM

feature -- Status report

	is_cluster: BOOLEAN is
			-- Is current group a cluster?
		do
			-- Result := False
		end

	is_dotnet_assembly: BOOLEAN is
			-- Is current group a .NET assembly?
		do
			-- Result := False
		end

	is_none: BOOLEAN is
			-- Is current group a built-in group for class "NONE"?
		do
			-- Result := False
		end

	is_unknown: BOOLEAN is
			-- Is current group a built-in group for class "*UNKNOWN*"?
		do
			-- Result := False
		end

	is_override: BOOLEAN is
			-- Is current group an override group?
			-- In other words, do classes in this group and other override
			-- groups take precedence over classes with same names but in
			-- non-override group? (see 'override_cluster' in ISE's LACE.)
		deferred
		end

	is_read_only: BOOLEAN is
			-- Is current group a read-only group?
			-- In other words, are changes in this group and in its classes
			-- not taken into account when repreparsing or reparsing
			-- the universe? (see 'library' in ISE's LACE.)
		deferred
		end

	use_obsolete_syntax: BOOLEAN
			-- Do the classes in the current group use an obsolete syntax
			-- (e.g. using 'attribute' and 'note' as identifiers instead of
			-- keywords)?

	is_preparsed: BOOLEAN is
			-- Has current group already been traversed to look for its classes?
		deferred
		end

	has_subgroup (a_group: ET_GROUP): BOOLEAN is
			-- Is `a_group' (recursively) one of the subgroups
			-- of current group?
		require
			a_group_not_void: a_group /= Void
		local
			l_parent: ET_GROUP
		do
			from
				l_parent := a_group.parent
			until
				l_parent = Void or Result
			loop
				Result := l_parent = Current
				l_parent := l_parent.parent
			end
		end

feature -- Access

	universe: ET_UNIVERSE is
			-- Surrounding universe
		deferred
		ensure
			universe_not_void: Result /= Void
		end

	current_system: ET_SYSTEM is
			-- Surrounding Eiffel system
		do
			Result := universe.current_system
		ensure
			current_system_not_void: Result /= Void
		end

	name: STRING is
			-- Name
		deferred
		ensure
			name_not_void: Result /= Void
			name_not_empty: Result.count > 0
		end

	lower_name: STRING is
			-- Lower-name of group
			-- (May return the same object as `name' if already in lower case.)
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			Result := name
			nb := Result.count
			from i := 1 until i > nb loop
				c := Result.item (i)
				if c >= 'A' and c <= 'Z' then
					Result := Result.as_lower
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			lower_name_not_void: Result /= Void
			lower_name_not_empty: Result.count > 0
			definition: Result.same_string (name.as_lower)
		end

	prefixed_name: STRING is
			-- Group name with possible prefixes
		do
			Result := name
		ensure
			prefixed_name_not_void: Result /= Void
			prefixed_name_not_empty: Result.count > 0
		end

	pathname: STRING is
			-- Directory pathname (may be Void)
		deferred
		end

	relative_name (a_universe: ET_UNIVERSE; a_separator: CHARACTER): STRING is
			-- Name of current group relative its parents and its universe down to `a_universe'
			-- (use `a_separator' as separator between parents' and universes' names)
			--
			-- If `a_universe' is `universe' then return the name relative to its
			-- parents only. Otherwise use one of the shortest paths between
			-- `a_universe' and `universe', and if no such path exists then return
			-- the name relative to its parents only.
		require
			a_universe_not_void: a_universe /= Void
		local
			l_universe_name: STRING
			l_group_name: STRING
		do
			if a_universe = universe then
				Result := name
			else
				l_universe_name := universe.relative_name (a_universe, a_separator)
				l_group_name := relative_name (universe, a_separator)
				Result := STRING_.new_empty_string (l_universe_name, l_universe_name.count + l_group_name.count + 1)
				Result.append_string (l_universe_name)
				Result.append_character (a_separator)
				Result := STRING_.appended_string (Result, l_group_name)
			end
		ensure
			relative_name_not_void: Result /= Void
			relative_name_not_empty: Result.count > 0
		end

	relative_lower_name (a_universe: ET_UNIVERSE; a_separator: CHARACTER): STRING is
			-- Lower-name of current group relative its parents and its universe down to `a_universe'
			-- (use `a_separator' as separator between parents' and universes' names)
			--
			-- If `a_universe' is `universe' then return the name relative to its
			-- parents only. Otherwise use one of the shortest paths between
			-- `a_universe' and `universe', and if no such path exists then return
			-- the name relative to its parents only.
		require
			a_universe_not_void: a_universe /= Void
		local
			l_universe_name: STRING
			l_group_name: STRING
		do
			if a_universe = universe then
				Result := lower_name
			else
				l_universe_name := universe.relative_lower_name (a_universe, a_separator)
				l_group_name := relative_lower_name (universe, a_separator)
				Result := STRING_.new_empty_string (l_universe_name, l_universe_name.count + l_group_name.count + 1)
				Result.append_string (l_universe_name)
				Result.append_character (a_separator)
				Result := STRING_.appended_string (Result, l_group_name)
			end
		ensure
			relative_lower_name_not_void: Result /= Void
			relative_lower_name_not_empty: Result.count > 0
			definition: Result.same_string (relative_name (a_universe, a_separator).as_lower)
		end

	full_name (a_separator: CHARACTER): STRING is
			-- Full name, which is the name relative to `current_system'
			-- (use `a_separator' as separator between parents' and universes' names)
		do
			Result := relative_name (current_system, a_separator)
		ensure
			full_name_not_void: Result /= Void
			full_name_not_empty: Result.count > 0
		end

	full_lower_name (a_separator: CHARACTER): STRING is
			-- Full lower-name, which is the name relative to `current_system'
			-- (use `a_separator' as separator between parents' and universes' names)
		do
			Result := relative_lower_name (current_system, a_separator)
		ensure
			full_lower_name_not_void: Result /= Void
			full_lower_name_not_empty: Result.count > 0
			definition: Result.same_string (full_name (a_separator).as_lower)
		end

	full_pathname: STRING is
			-- Full directory pathname
		local
			a_pathname: STRING
		do
			a_pathname := pathname
			if a_pathname /= Void and then a_pathname.count > 0 then
				Result := a_pathname
			else
				Result := name
			end
		ensure
			full_pathname_not_void: Result /= Void
			full_pathname_not_empty: Result.count > 0
		end

	full_unix_pathname: STRING is
			-- Full Unix directory pathname
		local
			a_pathname: STRING
		do
			a_pathname := pathname
			if a_pathname /= Void and then a_pathname.count > 0 then
				Result := a_pathname
			else
				Result := name
			end
		ensure
			full_unix_pathname_not_void: Result /= Void
			full_unix_pathname_not_empty: Result.count > 0
		end

	absolute_pathname: STRING is
			-- Canonical absolute pathname of current group where
			-- environment variables have been resolved
		do
			Result := Execution_environment.interpreted_string (full_pathname)
			if Result.is_empty then
				Result := name
			end
			Result := file_system.absolute_pathname (Result)
			Result := file_system.canonical_pathname (Result)
		ensure
			aboslute_pathname_not_void: Result /= Void
			aboslute_pathname_not_empty: Result.count > 0
		end

	cluster: ET_CLUSTER is
			-- Current group viewed as a cluster
		require
			is_cluster: is_cluster
		do
			check is_cluster: is_cluster end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	dotnet_assembly: ET_DOTNET_ASSEMBLY is
			-- Current group viewed as a .NET assembly
		require
			is_dotnet_assembly: is_dotnet_assembly
		do
			check is_dotnet_assembly: is_dotnet_assembly end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	kind_name: STRING is
			-- Name of the kind of group (e.g. "cluster", "assembly", etc.)
		once
			Result := "group"
		ensure
			kind_name_not_void: Result /= Void
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := name.hash_code
		end

	data: ANY
			-- Arbitrary user data

feature -- Nested

	parent: ET_GROUP is
			-- Parent group
		deferred
		end

feature -- Status setting

	set_use_obsolete_syntax (b: BOOLEAN) is
			-- Set `use_obsolete_syntax' to `b'.
		do
			use_obsolete_syntax := b
		ensure
			use_obsolete_syntax_set: use_obsolete_syntax = b
		end

feature -- Setting

	set_data (a_data: like data) is
			-- Set `data' to `a_data'.
		do
			data := a_data
		ensure
			data_set: data = a_data
		end

feature -- Output

	debug_output: STRING is
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := full_name ('/')
		end

end
