note

	description:

		"Groups of Eiffel classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_GROUP

inherit

	ET_ADAPTED_GROUP
	HASHABLE
	DEBUG_OUTPUT
	KL_IMPORTED_ANY_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_FILE_SYSTEM

feature -- Initialization

	reset_absolute_pathname
			-- Force the computation of `absolute_pathname' next time
			-- it will be called. This is useful when the values of the
			-- environment variables have changed or when the cluster
			-- hierarchy has changed. Otherwise the result of
			-- `absolute_pathname' is cached to avoid having to
			-- compute its value at each call (like a once-per-object).
		do
			cached_absolute_pathname := Void
		ensure
			absolute_pathname_reset: cached_absolute_pathname = Void
		end

feature -- Status report

	is_primary: BOOLEAN
			-- Is current group a primary group?
		do
			-- Result := False
		end

	is_secondary: BOOLEAN
			-- Is current group a secondary group?
		do
			-- Result := False
		end

	is_cluster: BOOLEAN
			-- Is current group a cluster?
		do
			-- Result := False
		end

	is_library: BOOLEAN
			-- Is current group a library?
		do
			-- Result := False
		end

	is_dotnet_assembly: BOOLEAN
			-- Is current group a .NET assembly?
		do
			-- Result := False
		end

	is_none: BOOLEAN
			-- Is current group a built-in group for class "NONE"?
		do
			-- Result := False
		end

	is_unknown: BOOLEAN
			-- Is current group a built-in group for class "*UNKNOWN*"?
		do
			-- Result := False
		end

	is_override: BOOLEAN
			-- Is current group an override group?
			-- In other words, do classes in this group and other override
			-- groups take precedence over classes with same names but in
			-- non-override group? (see 'override_cluster' in ISE's LACE.)
		deferred
		end

	is_read_only: BOOLEAN
			-- Is current group a read-only group?
			-- In other words, are changes in this group and in its classes
			-- not taken into account when repreparsing or reparsing
			-- the universe? (see 'library' in ISE's LACE.)
		deferred
		end

	is_hidden: BOOLEAN
			-- Should the classes of current group not be exported when part of a library?
			-- See ET_ADAPTED_UNIVERSE.export_classes.
		do
			-- Result := False
		end

	use_obsolete_syntax: BOOLEAN
			-- Do the classes in the current group use an obsolete syntax
			-- (e.g. using 'attribute' and 'note' as identifiers instead of
			-- keywords)?

	is_preparsed: BOOLEAN
			-- Has current group already been traversed to look for its classes?
		deferred
		end

	has_subgroup (a_group: ET_GROUP): BOOLEAN
			-- Is `a_group' (recursively) one of the subgroups
			-- of current group?
		require
			a_group_not_void: a_group /= Void
		local
			l_parent: detachable ET_GROUP
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

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Is `a_class' part of current group?
		require
			a_class_not_void: a_class /= Void
		deferred
		end

	has_class_recursive (a_class: ET_CLASS): BOOLEAN
			-- Is `a_class' part of current group
			-- or recusively one of its subgroups?
		require
			a_class_not_void: a_class /= Void
		do
			Result := has_class (a_class)
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe
		deferred
		ensure
			universe_not_void: Result /= Void
		end

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system
		do
			Result := universe.current_system
		ensure
			current_system_not_void: Result /= Void
		end

	prefixed_name: STRING
			-- Group name with possible prefixes
		do
			Result := name
		ensure
			prefixed_name_not_void: Result /= Void
			prefixed_name_not_empty: Result.count > 0
		end

	pathname: detachable STRING
			-- Directory pathname (may be Void)
		deferred
		end

	relative_name (a_universe: ET_UNIVERSE; a_separator: CHARACTER): STRING
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

	relative_lower_name (a_universe: ET_UNIVERSE; a_separator: CHARACTER): STRING
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

	full_name (a_separator: CHARACTER): STRING
			-- Full name, which is the name relative to `current_system'
			-- (use `a_separator' as separator between parents' and universes' names)
		do
			Result := relative_name (current_system, a_separator)
		ensure
			full_name_not_void: Result /= Void
			full_name_not_empty: Result.count > 0
		end

	full_lower_name (a_separator: CHARACTER): STRING
			-- Full lower-name, which is the name relative to `current_system'
			-- (use `a_separator' as separator between parents' and universes' names)
		do
			Result := relative_lower_name (current_system, a_separator)
		ensure
			full_lower_name_not_void: Result /= Void
			full_lower_name_not_empty: Result.count > 0
			definition: Result.same_string (full_name (a_separator).as_lower)
		end

	full_pathname: STRING
			-- Full directory pathname
		do
			if attached pathname as l_pathname and then l_pathname.count > 0 then
				Result := l_pathname
			else
				Result := name
			end
		ensure
			full_pathname_not_void: Result /= Void
			full_pathname_not_empty: Result.count > 0
		end

	full_unix_pathname: STRING
			-- Full Unix directory pathname
		do
			if attached pathname as l_pathname and then l_pathname.count > 0 then
				Result := l_pathname
			else
				Result := name
			end
		ensure
			full_unix_pathname_not_void: Result /= Void
			full_unix_pathname_not_empty: Result.count > 0
		end

	absolute_pathname: STRING
			-- Canonical absolute pathname of current group where
			-- environment variables have been resolved
			--
			-- Note that the result is cached to avoid having to
			-- compute its value at each call (like a once-per-object).
			-- Call `reset_absolute_pathname' first to force the
			-- computation again, for example when the values of the
			-- environment variables have changed and when the cluster
			-- hierarchy has changed.
		do
			if attached cached_absolute_pathname as l_cached_absolute_pathname then
				Result := l_cached_absolute_pathname
			else
				Result := Execution_environment.interpreted_string (full_pathname)
				if Result.is_empty then
					Result := name
				end
				Result := file_system.absolute_pathname (Result)
				Result := file_system.canonical_pathname (Result)
				cached_absolute_pathname := Result
			end
		ensure
			aboslute_pathname_not_void: Result /= Void
			aboslute_pathname_not_empty: Result.count > 0
		end

	kind_name: STRING
			-- Name of the kind of group (e.g. "cluster", "assembly", "library", etc.)
		once
			Result := "group"
		ensure
			kind_name_not_void: Result /= Void
		end

	kind_lower_name: STRING
			-- Lower-name of the kind of group (e.g. "cluster", "assembly", "library", etc.)
			-- (May return the same object as `kind_name' if already in lower case.)
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			Result := kind_name
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
			kind_lower_name_not_void: Result /= Void
			kind_lower_name_not_empty: Result.count > 0
			definition: Result.same_string (kind_name.as_lower)
		end

	kind_capitalized_name: STRING
			-- Capitalized name of the kind of group (e.g. "Cluster", "Assembly", "Library", etc.)
			-- (May return the same object as `kind_name' if already capitalized.)
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			Result := kind_name
			nb := Result.count
			c := Result.item (1)
			if c >= 'a' and c <= 'z' then
				Result := Result.as_lower
				Result.put (c.as_upper, 1)
			else
				from i := 2 until i > nb loop
					c := Result.item (i)
					if c >= 'A' and c <= 'Z' then
						Result := Result.as_lower
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		ensure
			kind_capitalized_name_not_void: Result /= Void
			kind_capitalized_name_not_empty: Result.count > 0
		end

	kind_name_plural: STRING
			-- Plural form of name of the kind of group (e.g. "clusters", "assemblies", "libraries", etc.)
		do
			Result := kind_name + "s"
		ensure
			kind_name_plural_not_void: Result /= Void
		end

	kind_lower_name_plural: STRING
			-- Lower-name of the kind of group (e.g. "clusters", "assemblies", "libraries", etc.)
			-- (May return the same object as `kind_name_plural' if already in lower case.)
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			Result := kind_name_plural
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
			kind_lower_name_plural_not_void: Result /= Void
			kind_lower_name_plural_not_empty: Result.count > 0
			definition: Result.same_string (kind_lower_name_plural.as_lower)
		end

	kind_capitalized_name_plural: STRING
			-- Capitalized name of the kind of group (e.g. "Clusters", "Assemblies", "Libraries", etc.)
			-- (May return the same object as `kind_name_plural' if already capitalized.)
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			Result := kind_name_plural
			nb := Result.count
			c := Result.item (1)
			if c >= 'a' and c <= 'z' then
				Result := Result.as_lower
				Result.put (c.as_upper, 1)
			else
				from i := 2 until i > nb loop
					c := Result.item (i)
					if c >= 'A' and c <= 'Z' then
						Result := Result.as_lower
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		ensure
			kind_capitalized_name_plural_not_void: Result /= Void
			kind_capitalized_name_plural_not_empty: Result.count > 0
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := name.hash_code
		end

	data: detachable ANY
			-- Arbitrary user data

	group: ET_GROUP
			-- Group being adapted
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

feature -- Measurement

	class_count: INTEGER
			-- Number of classes which are part of current group
		deferred
		ensure
			class_count_not_negative: Result >= 0
		end

	class_count_recursive: INTEGER
			-- Number of classes which are part of current group
			-- or recursively one of its subgroups
		do
			Result := class_count
		ensure
			class_coun_recursivet_not_negative: Result >= 0
		end

feature -- Conversion

	as_primary: ET_PRIMARY_GROUP
			-- Current group viewed as a primary group
		require
			is_primary: is_primary
		do
			check is_primary: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	as_secondary: ET_SECONDARY_GROUP
			-- Current group viewed as a secondary group
		require
			is_secondary: is_secondary
		do
			check is_secondary: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	cluster: ET_CLUSTER
			-- Current group viewed as a cluster
		require
			is_cluster: is_cluster
		do
			check is_cluster: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	library: ET_LIBRARY
			-- Current group viewed as a library
		require
			is_library: is_library
		do
			check is_library: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	dotnet_assembly: ET_DOTNET_ASSEMBLY
			-- Current group viewed as a .NET assembly
		require
			is_dotnet_assembly: is_dotnet_assembly
		do
			check is_dotnet_assembly: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

feature -- Nested

	parent: detachable ET_GROUP
			-- Parent group
		deferred
		end

	root: attached like parent
			-- Either current group if it has no parent, or the
			-- ancestor of current group which has no parent
		do
			if attached parent as l_parent then
				Result := l_parent.root
			else
				Result := Current
			end
		ensure
			root_not_void: Result /= Void
			is_root: Result.parent = Void
			is_subgroup: Result = Current or else Result.has_subgroup (Current)
		end

feature -- Status setting

	set_use_obsolete_syntax (b: BOOLEAN)
			-- Set `use_obsolete_syntax' to `b'.
		do
			use_obsolete_syntax := b
		ensure
			use_obsolete_syntax_set: use_obsolete_syntax = b
		end

feature -- Setting

	set_data (a_data: like data)
			-- Set `data' to `a_data'.
		do
			data := a_data
		ensure
			data_set: data = a_data
		end

	fill_options (a_class: ET_CLASS)
			-- Fill `a_class' with option information.
		require
			a_class_not_void: a_class /= Void
		do
		end

feature -- Iteration

	classes_do_all (an_action: PROCEDURE [ET_CLASS])
			-- Apply `an_action' on all classes which are part of current group.
		require
			an_action_not_void: an_action /= Void
		deferred
		end

	classes_do_if (an_action: PROCEDURE [ET_CLASS]; a_test: FUNCTION [ET_CLASS, BOOLEAN])
			-- Apply `an_action' on all classes which are part of current group
			-- that satisfy `a_test'.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		deferred
		end

	classes_do_recursive (an_action: PROCEDURE [ET_CLASS])
			-- Apply `an_action' on all classes which are part of current group
			-- or recursively one of its subgroups.
		require
			an_action_not_void: an_action /= Void
		do
			classes_do_all (an_action)
		end

	classes_do_if_recursive (an_action: PROCEDURE [ET_CLASS]; a_test: FUNCTION [ET_CLASS, BOOLEAN])
			-- Apply `an_action' on all classes which are part of current group
			-- or recursively one of its subgroups and which satisfy `a_test'.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			classes_do_if (an_action, a_test)
		end

feature -- Output

	debug_output: STRING
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := full_name ('/')
		end

feature {NONE} -- Implementation

	cached_absolute_pathname: detachable STRING
			-- Cached value of `absolute_pathname'

end
