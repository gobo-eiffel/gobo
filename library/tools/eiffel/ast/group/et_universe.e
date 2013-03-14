note

	description:

	"[
		Eiffel class universes.
		An Eiffel universe is a set of classes, some declared locally
		(in the universe's clusters), some imported from other universes
		(from other libraries or assemblies). No two classes have the same
		name. All local classes (declared locally) should only depend on
		classes of the universe. The classes imported from other universes
		are those which are declared locally in these universes and whose
		group is not marked as hidden. Renaming (or class name prefixing)
		is available to resolve name clashes between classes imported from
		different universes.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/09/15 $"
	revision: "$Revision: #18 $"

deferred class ET_UNIVERSE

inherit

	ET_ADAPTED_UNIVERSE
		rename
			make as make_adapted
		end

	HASHABLE

	ET_SHARED_CLASS_NAME_TESTER
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

	ET_IMPORTED_AGENT_ROUTINES
			export {NONE} all end

	KL_SHARED_FILE_SYSTEM

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make_from_system (a_name: STRING; a_system: ET_SYSTEM)
			-- Create a new universe as being part of `a_system'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_system_not_void: a_system /= Void
		do
			current_system := a_system
			initialize
			set_default_class_mapping
			set_kernel_types
			make_adapted (a_name, Current)
		ensure
			name_set: name = a_name
			current_system_set: current_system = a_system
		end

	initialize
			-- Initialize universe.
		do
			create master_classes.make_map (3000)
			master_classes.set_key_equality_tester (class_name_tester)
		end

feature -- Initialization

	reset_classes
			-- Reset classes (declared locally in current universe)
			-- as they were just after they were last parsed, or as
			-- they were when they were last preparsed if there was
			-- a syntax error (so that the syntax error will be
			-- reported again if the class is processed again).
			-- Overridden and ignored classes are also taken into account.
			-- Do nothing on classes which are not parsed yet.
		do
			master_classes_do_all (agent {ET_MASTER_CLASS}.local_classes_do_all (agent {ET_CLASS}.reset_after_parsed_and_errors))
		end

	reset_classes_recursive
			-- Reset classes (declared in current universe and
			-- recursively in universes it depends on)
			-- as they were just after they were last parsed, or as
			-- they were when they were last preparsed if there was
			-- a syntax error (so that the syntax error will be
			-- reported again if the class is processed again).
			-- Overridden and ignored classes are also taken into account.
			-- Do nothing on classes which are not parsed yet.
		do
			master_classes_do_recursive (agent {ET_MASTER_CLASS}.local_classes_do_all (agent {ET_CLASS}.reset_after_parsed_and_errors))
		end

	reset_classes_incremental_recursive
			-- Reset parts of the classes (declared in current universe and recursively in universes
			-- it depends on) which may not be valid anymore because of changes in other
			-- classes. Re-processing these classes will not affect the parts which didn't
			-- need to be reset. This allows to perform incremental code analysis or
			-- compilation when only a few classes have been modified.
			--
			-- For example, when a class have been modified, we need to
			-- reparse that class, but not necessarily the other classes.
			-- When a class has been reparsed, we need to rebuild its ancestor
			-- table as well as the ancestor table of its descendant classes.
			-- When the ancestor table of a class have been rebuilt, we need
			-- to rebuild the feature table for this class. When the feature
			-- table of a class has been rebuilt, we need to recheck the validity
			-- of the feature calls in the clients of this class.
		local
			l_ancestors_status_checker: ET_ANCESTORS_STATUS_CHECKER
			l_flattening_status_checker: ET_FLATTENING_STATUS_CHECKER
			l_interface_status_checker: ET_INTERFACE_STATUS_CHECKER
			l_implementation_status_checker: ET_IMPLEMENTATION_STATUS_CHECKER
		do
				-- Start by taking care of classes containing errors, and
				-- also reset overridden and ignored classes as they were when last parsed.
			master_classes_do_recursive (agent {ET_MASTER_CLASS}.local_classes_do_unless_actual (agent {ET_CLASS}.reset_after_parsed_and_errors))
				-- Classes that had a syntax error need to be reparsed.
			classes_do_if_recursive (agent {ET_CLASS}.reset_after_preparsed, agent {ET_CLASS}.has_syntax_error)
				-- Classes that had an ancestor error need to be reprocessed.
			classes_do_if_recursive (agent {ET_CLASS}.reset_after_parsed, agent {ET_CLASS}.has_ancestors_error)
				-- We mark classes with an ancestor error here to indicate that
				-- we need to check whether they are still correct. If the error
				-- is confirmed (because the class processing has become
				-- invalid due to other classes having been modified or
				-- recursively made invalid), then the class will be reset
				-- to the previous processing step. Otherwise the error
				-- flag will be cleared.
			classes_do_if_recursive (agent {ET_CLASS}.set_ancestors_error, agent {ET_CLASS}.ancestors_built)
				-- Classes that had a flattening error need to be reprocessed.
			classes_do_if_recursive (agent {ET_CLASS}.reset_after_ancestors_built, agent {ET_CLASS}.has_flattening_error)
				-- We mark classes with a flattening error here to indicate that
				-- we need to check whether they are still correct. If the error
				-- is confirmed (because the class processing has become
				-- invalid due to other classes having been modified or
				-- recursively made invalid), then the class will be reset
				-- to the previous processing step. Otherwise the error
				-- flag will be cleared.
			classes_do_if_recursive (agent {ET_CLASS}.set_flattening_error, agent {ET_CLASS}.features_flattened)
				-- Classes that had an interface error need to be reprocessed.
			classes_do_if_recursive (agent {ET_CLASS}.reset_after_features_flattened, agent {ET_CLASS}.has_interface_error)
				-- We mark classes with an interface error here to indicate that
				-- we need to check whether they are still correct. If the error
				-- is confirmed (because the class processing has become
				-- invalid due to other classes having been modified or
				-- recursively made invalid), then the class will be reset
				-- to the previous processing step. Otherwise the error
				-- flag will be cleared.
			classes_do_if_recursive (agent {ET_CLASS}.set_interface_error, agent {ET_CLASS}.interface_checked)
				-- It is possible to check the implementation of features
				-- individiually without setting ET_CLASS.implementation_checked.
				-- It is safer to force a reset just in case we are in this situation.
			classes_do_if_recursive (agent {ET_CLASS}.reset_after_interface_checked, agent {ET_CLASS}.not_implementation_checked)
				-- Classes that had an implementation error need to be reprocessed.
			classes_do_if_recursive (agent {ET_CLASS}.reset_after_interface_checked, agent {ET_CLASS}.has_implementation_error)
				-- We mark classes with an implementation error here to indicate that
				-- we need to check whether they are still correct. If the error
				-- is confirmed (because the class processing has become
				-- invalid due to other classes having been modified or
				-- recursively made invalid), then the class will be reset
				-- to the previous processing step. Otherwise the error
				-- flag will be cleared.
			classes_do_if_recursive (agent {ET_CLASS}.set_implementation_error, agent {ET_CLASS}.implementation_checked)
				-- Reset ancestors building.
			create l_ancestors_status_checker.make
			classes_do_if_recursive (agent l_ancestors_status_checker.process_class, agent {ET_CLASS}.ancestors_built)
				-- Reset feature flattening.
			create l_flattening_status_checker.make
			classes_do_if_recursive (agent l_flattening_status_checker.process_class, agent {ET_CLASS}.features_flattened)
				-- Reset interface checking.
			create l_interface_status_checker.make
			classes_do_if_recursive (agent l_interface_status_checker.process_class, agent {ET_CLASS}.interface_checked)
				-- Reset implementation checking.
			create l_implementation_status_checker.make
			classes_do_if_recursive (agent l_implementation_status_checker.process_class, agent {ET_CLASS}.implementation_checked)
				-- Reset the modified status of all classes.
			master_classes_do_recursive (agent {ET_MASTER_CLASS}.set_modified (False))
		end

	reset_errors
			-- Reset classes (declared locally in current universe) as they were
			-- before their first error was reported.
			-- Errors will be reported again if classes are processed again.
		do
			master_classes_do_all (agent {ET_MASTER_CLASS}.local_classes_do_all (agent {ET_CLASS}.reset_errors))
		end

	reset_errors_recursive
			-- Reset classes (declared in current universe and recursively in universes
			-- it depends on) as they were before their first error was reported.
			-- Errors will be reported again if classes are processed again.
		local
			l_reparse_needed: UT_TRISTATE
		do
			create l_reparse_needed.make_false
			master_classes_do_if_recursive (agent master_class_actions.call (?, agent l_reparse_needed.set_true), agent master_class_actions.conjuncted (?, agent {ET_MASTER_CLASS}.is_preparsed, agent {ET_MASTER_CLASS}.has_syntax_error))
			master_classes_do_recursive (agent {ET_MASTER_CLASS}.local_classes_do_all (agent {ET_CLASS}.reset_errors))
			if l_reparse_needed.is_true then
					-- Some classes which had a syntax error will be reparsed.
					-- As a consequence, it is wiser to incrementally reset
					-- the classes that depend on them.
				reset_classes_incremental_recursive
			end
		end

feature -- Status report

	has_master_class (a_name: ET_CLASS_NAME): BOOLEAN
			-- Is there a class named `a_name' when viewed from current universe?
			-- Take into account both locally declared classes and
			-- classes imported from other universes.
		require
			a_name_not_void: a_name /= Void
		local
			l_class: ET_MASTER_CLASS
		do
			master_classes.search (a_name)
			if master_classes.found then
				l_class := master_classes.found_item
				Result := l_class.is_preparsed
			end
		ensure
			is_preparsed: Result implies master_class (a_name).is_preparsed
		end

	has_master_class_recursive (a_name: ET_CLASS_NAME): BOOLEAN
			-- Is there a class named `a_name' when viewed from current universe,
			-- or recursively from one of the universes it depends on?
			-- Take into account both locally declared classes and
			-- classes imported from other universes.
		require
			a_name_not_void: a_name /= Void
		local
			l_result: UT_TRISTATE
		do
			create l_result.make_false
			universes_do_if_recursive_until (agent universe_actions.call (?, agent l_result.set_true), agent {ET_UNIVERSE}.has_master_class (a_name), agent l_result.is_true)
			Result := l_result.is_true
		end

	has_class (a_name: ET_CLASS_NAME): BOOLEAN
			-- Is there a class named `a_name' declared locally in current universe?
			-- Do not take into account overridden classes.
		require
			a_name_not_void: a_name /= Void
		local
			l_class: ET_MASTER_CLASS
		do
			master_classes.search (a_name)
			if master_classes.found then
				l_class := master_classes.found_item
				if not l_class.is_mapped and l_class.actual_class.universe = Current then
					Result := True
				end
			end
		end

	has_class_recursive (a_name: ET_CLASS_NAME): BOOLEAN
			-- Is there a class named `a_name' declared locally in current universe,
			-- or recursively in one of the universes it depends on?
			-- Do not take into account overridden classes.
		require
			a_name_not_void: a_name /= Void
		local
			l_result: UT_TRISTATE
		do
			create l_result.make_false
			universes_do_if_recursive_until (agent universe_actions.call (?, agent l_result.set_true), agent {ET_UNIVERSE}.has_class (a_name), agent l_result.is_true)
			Result := l_result.is_true
		end

	has_group_by_name (a_names: ARRAY [STRING]): BOOLEAN
			-- Is there a group named `a_names' starting from within current universe
			-- and recursively traversing dependent universes if needed?
			-- Do not take into account missing implicit subclusters.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		deferred
		end

feature -- Access

	master_classes: DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME]
			-- Classes visible from current universe.
			-- Contains both locally declared classes and
			-- classes imported from other universes.

	master_class (a_name: ET_CLASS_NAME): ET_MASTER_CLASS
			-- Class named `a_name' when viewed from current universe.
			-- Add this class to universe if not found,
			-- in which case it will refer to the unknown class.
			--
			-- Note that the master class not only gives access to
			-- the class named `a_name' that will be taken into account
			-- from current universe (using its query 'actual_class')
			-- but also to other classes with the same name in the universe
			-- that are not taken into account because of the name
			-- clash (see features of class ET_MASTER_CLASS).
		require
			a_name_not_void: a_name /= Void
		do
			master_classes.search (a_name)
			if master_classes.found then
				Result := master_classes.found_item
			else
				create Result.make (a_name, Current)
				master_classes.force_last_new (Result, a_name)
			end
		ensure
			master_class_not_void: Result /= Void
		end

	master_class_by_name (a_name: STRING): ET_MASTER_CLASS
			-- Class named `a_name' when viewed from current universe.
			-- Take into account both locally declared classes and
			-- classes imported from other universes.
			-- Void if not such class
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			l_class_name: ET_IDENTIFIER
		do
			create l_class_name.make (a_name)
			master_classes.search (l_class_name)
			if master_classes.found then
				Result := master_classes.found_item
			end
		end

	master_classes_by_name_recursive (a_name: STRING): DS_ARRAYED_LIST [ET_MASTER_CLASS]
			-- Classes named `a_name' when viewed from current universe,
			-- or recursively from one of the universes it depends on.
			-- Take into account both locally declared classes and
			-- classes imported from other universes.
			-- Create a new list at each call.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			create Result.make (initial_universes_capacity)
			universes_do_recursive (agent {ET_UNIVERSE}.do_master_class_by_name (a_name, agent Result.force_last))
		ensure
			classes_not_void: Result /= Void
			no_void_class: not Result.has_void
		end

	class_by_name (a_name: STRING): ET_CLASS
			-- Class named `a_name' declared locally in current universe.
			-- Do not take into account overridden classes.
			-- Void if not such class
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			l_master_class: ET_MASTER_CLASS
			l_class: ET_CLASS
		do
			l_master_class := master_class_by_name (a_name)
			if l_master_class /= Void and then not l_master_class.is_mapped then
				l_class := l_master_class.actual_class
				if l_class.universe = Current then
					Result := l_class
				end
			end
		ensure
			local_class: Result /= Void implies Result.universe = Current
		end

	classes_by_name_recursive (a_name: STRING): DS_ARRAYED_LIST [ET_CLASS]
			-- Class named `a_name' declared locally in current universe
			-- or recursively in one of the universes it depends on.
			-- Do not take into account overridden classes.
			-- Create a new list at each call.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			create Result.make (initial_universes_capacity)
			universes_do_recursive (agent {ET_UNIVERSE}.do_class_by_name (a_name, agent Result.force_last))
		ensure
			classes_not_void: Result /= Void
			no_void_class: not Result.has_void
		end

	classes_in_group (a_group: ET_GROUP): DS_ARRAYED_LIST [ET_CLASS]
			-- Classes declared locally in current universe which are in `a_group'.
			-- Overridden and ignored classes are also taken into account.
			-- Create a new list at each call.
		require
			a_group_not_void: a_group /= Void
		do
			create Result.make (initial_classes_in_group_capacity)
			master_classes_do_all (agent {ET_MASTER_CLASS}.local_classes_do_if (agent Result.force_last, agent {ET_CLASS}.is_in_group (a_group)))
		ensure
			classes_not_void: Result /= Void
			no_void_class: not Result.has_void
		end

	classes_in_group_recursive (a_group: ET_GROUP): DS_ARRAYED_LIST [ET_CLASS]
			-- Classes declared locally in current in universe which are in `a_group'
			-- or recursively in one of its subgroups.
			-- Overridden and ignored classes are also taken into account.
			-- Create a new list at each call.
		require
			a_group_not_void: a_group /= Void
		do
			create Result.make (initial_classes_in_group_capacity)
			master_classes_do_all (agent {ET_MASTER_CLASS}.local_classes_do_if (agent Result.force_last, agent {ET_CLASS}.is_in_group_recursive (a_group)))
		ensure
			classes_not_void: Result /= Void
			no_void_class: not Result.has_void
		end

	classes_by_groups: DS_HASH_TABLE [DS_ARRAYED_LIST [ET_CLASS], ET_GROUP]
			-- Classes, indexed by groups, declared locally in current universe.
			-- Overridden and ignored classes are also taken into account.
			-- Create a new data structure at each call.
		do
			create Result.make_map (initial_classes_by_groups_capacity)
			master_classes_do_all (agent {ET_MASTER_CLASS}.local_classes_do_all (agent {ET_CLASS}.add_by_group (Result)))
		ensure
			classes_not_void: Result /= Void
			no_void_list: not Result.has_void_item
			no_void_group: not Result.has_void
			no_void_class: not Result.there_exists (agent {DS_ARRAYED_LIST [ET_CLASS]}.has_void)
		end

	classes_by_groups_recursive: DS_HASH_TABLE [DS_ARRAYED_LIST [ET_CLASS], ET_GROUP]
			-- Classes, indexed by groups, declared locally in current universe
			-- and recursively in universes it depends on.
			-- Overridden and ignored classes are also taken into account.
			-- Create a new data structure at each call.
		do
			create Result.make_map (initial_classes_by_groups_capacity)
			master_classes_do_recursive (agent {ET_MASTER_CLASS}.local_classes_do_all (agent {ET_CLASS}.add_by_group (Result)))
		ensure
			classes_not_void: Result /= Void
			no_void_list: not Result.has_void_item
			no_void_group: not Result.has_void
			no_void_class: not Result.there_exists (agent {DS_ARRAYED_LIST [ET_CLASS]}.has_void)
		end

	group_by_name (a_names: ARRAY [STRING]): ET_GROUP
			-- Group named `a_names' starting from within current universe
			-- and recursively traversing dependent universes if needed
			--
			-- Add missing implicit subclusters if needed.
			-- Void if not such group.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		deferred
		ensure
			not_void_if_has: has_group_by_name (a_names) implies Result /= Void
		end

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system

	adapted_universe (a_universe: ET_UNIVERSE): ET_ADAPTED_UNIVERSE
			-- Adapted version of `a_universe' viewed from current universe
			-- when it depends on it, Void otherwise
			--
			-- `a_universe' may be a library or assembly from which the current
			-- universe imports classes. Note that `a_universe' may be imported
			-- twice by the current universe. Return one of them in that case.
		require
			a_universe_not_void: a_universe /= Void
		do
		ensure
			consistent: Result /= Void implies Result.universe = a_universe
		end

	shortest_path (a_other: ET_UNIVERSE): DS_ARRAYED_LIST [ET_ADAPTED_UNIVERSE]
			-- One of the shortest paths from current universe to `a_other' if
			-- it recursively depends on `a_other', empty otherwise
		require
			a_other_not_void: a_other /= Void
		local
			l_depths: DS_HASH_TABLE [INTEGER, ET_UNIVERSE]
			l_cursor: DS_HASH_TABLE_CURSOR [INTEGER, ET_UNIVERSE]
			l_universe: ET_UNIVERSE
			l_adapted_universe: ET_ADAPTED_UNIVERSE
			l_count: INTEGER
			l_found: BOOLEAN
		do
			if a_other = Current then
				create Result.make (0)
			else
					-- First, we try to collect in `l_depths' the shortest distance from
					-- `Current' to the given universes. We stop populating `l_depths' when
					-- the shortest distance from `Current' to `a_other' is known.
				create l_depths.make_map (20)
				l_count := 1
				l_depths.force_last (l_count, Current)
				l_cursor := l_depths.new_cursor
				from l_cursor.start until l_cursor.after loop
-- Workaround for the bug:
-- "[Compiler #16375] [er] Bug in finalized mode involving agents and generics"
-- reported to ISE.
--					l_cursor.key.universes_do_if (agent l_depths.force_last (l_cursor.item + 1, ?), agent universe_actions.negated (?, agent l_depths.has))
					l_cursor.key.universes_do_if (agent insert_in_hash_table (l_depths, l_cursor.item + 1, ?), agent universe_actions.negated (?, agent l_depths.has))
					if l_depths.has (a_other) then
						l_found := True
						l_cursor.go_after
					else
						l_cursor.forth
					end
				end
				if not l_found then
						-- We didn't find a path from `Current' to `a_other'.
					create Result.make (0)
				else
						-- Now, start from `a_other' and reconstruct the path from `Current'.
					from
						l_cursor.finish
						l_count := l_cursor.item
						create Result.make (l_count - 1)
						l_cursor.back
						l_universe := a_other
					until
						l_cursor.before
					loop
						if l_cursor.item /= l_count then
							l_adapted_universe := l_cursor.key.adapted_universe (l_universe)
							if l_adapted_universe /= Void then
								Result.force_first (l_adapted_universe)
								l_universe := l_cursor.key
								l_count := l_cursor.item
							end
						end
						l_cursor.back
					end
				end
			end
		ensure
			path_not_void: Result /= Void
			no_void_object: not Result.has (Void)
			last: not Result.is_empty implies Result.last.universe = a_other
		end

	relative_name (a_universe: ET_UNIVERSE; a_separator: CHARACTER): STRING
			-- Name of current universe relative to another universe
			-- (use `a_separator' as separator between universes' names)
			--
			-- Use one of the shortest paths between these two universes,
			-- and if no such path exists then return `name'.
		require
			a_universe_not_void: a_universe /= Void
		local
			l_adapted_universe: ET_ADAPTED_UNIVERSE
			l_shortest_path: DS_ARRAYED_LIST [ET_ADAPTED_UNIVERSE]
			i, nb: INTEGER
		do
			if a_universe = Current then
				Result := name
			else
				l_adapted_universe := a_universe.adapted_universe (Current)
				if l_adapted_universe /= Void then
					Result := l_adapted_universe.name
				else
					l_shortest_path := a_universe.shortest_path (Current)
					if l_shortest_path.is_empty then
						Result := name
					else
						nb := l_shortest_path.count
						create Result.make (10 * nb)
						from i := 1 until i > nb loop
							if not Result.is_empty then
								Result.append_character (a_separator)
							end
							Result := STRING_.appended_string (Result, l_shortest_path.item (i).name)
							i := i + 1
						end
					end
				end
			end
		ensure
			relative_name_not_void: Result /= Void
			relative_name_not_empty: Result.count > 0
		end

	relative_lower_name (a_universe: ET_UNIVERSE; a_separator: CHARACTER): STRING
			-- Lower-name of current universe relative to another universe
			-- (use `a_separator' as separator between universes' names)
			--
			-- Use one of the shortest paths between these two universes,
			-- and if no such path exists then return `lower_name'.
		require
			a_universe_not_void: a_universe /= Void
		local
			l_adapted_universe: ET_ADAPTED_UNIVERSE
			l_shortest_path: DS_ARRAYED_LIST [ET_ADAPTED_UNIVERSE]
			i, nb: INTEGER
		do
			if a_universe = Current then
				Result := lower_name
			else
				l_adapted_universe := a_universe.adapted_universe (Current)
				if l_adapted_universe /= Void then
					Result := l_adapted_universe.lower_name
				else
					l_shortest_path := a_universe.shortest_path (Current)
					if l_shortest_path.is_empty then
						Result := lower_name
					else
						nb := l_shortest_path.count
						create Result.make (10 * nb)
						from i := 1 until i > nb loop
							if not Result.is_empty then
								Result.append_character (a_separator)
							end
							Result := STRING_.appended_string (Result, l_shortest_path.item (i).lower_name)
							i := i + 1
						end
					end
				end
			end
		ensure
			relative_lower_name_not_void: Result /= Void
			relative_lower_name_not_empty: Result.count > 0
			definition: Result.same_string (relative_name (a_universe, a_separator).as_lower)
		end

	full_name (a_separator: CHARACTER): STRING
			-- Full name, which is the name relative to `current_system'
			-- (use `a_separator' as separator between universes' names)
		do
			Result := relative_name (current_system, a_separator)
		ensure
			full_name_not_void: Result /= Void
			full_name_not_empty: Result.count > 0
		end

	full_lower_name (a_separator: CHARACTER): STRING
			-- Full lower-name, which is the name relative to `current_system'
			-- (use `a_separator' as separator between universes' names)
		do
			Result := relative_lower_name (current_system, a_separator)
		ensure
			full_lower_name_not_void: Result /= Void
			full_lower_name_not_empty: Result.count > 0
			definition: Result.same_string (full_name (a_separator).as_lower)
		end

	hash_code: INTEGER
			-- Hash value
		do
			Result := name.hash_code
		end

	kind_name: STRING
			-- Name of the kind of universe (e.g. "library", "assembly", etc.)
		once
			Result := "universe"
		ensure
			kind_name_not_void: Result /= Void
		end

feature -- Measurement

	class_count: INTEGER
			-- Number of classes declared locally in current universe.
			-- Do not take into account overridden classes.
		local
			l_counter: UT_COUNTER
		do
			create l_counter.make (0)
			classes_do_all (agent class_actions.call (?, agent l_counter.increment))
			Result := l_counter.item
		ensure
			class_count_not_negative: Result >= 0
		end

	class_count_recursive: INTEGER
			-- Number of classes declared locally in current universe
			-- and recursively in the universes it depends on.
			-- Do not take into account overridden classes.
		local
			l_counter: UT_COUNTER
		do
			create l_counter.make (0)
			classes_do_recursive (agent class_actions.call (?, agent l_counter.increment))
			Result := l_counter.item
		ensure
			class_count_not_negative: Result >= 0
		end

	parsed_class_count: INTEGER
			-- Number of classes parsed locally in current universe.
			-- Do not take into account overridden classes.
		local
			l_counter: UT_COUNTER
		do
			create l_counter.make (0)
			classes_do_if (agent class_actions.call (?, agent l_counter.increment), agent {ET_CLASS}.is_parsed)
			Result := l_counter.item
		ensure
			parsed_class_count_not_negative: Result >= 0
		end

	parsed_class_count_recursive: INTEGER
			-- Number of classes parsed locally in current universe
			-- and recursively in the universes it depends on.
			-- Do not take into account overridden classes.
		local
			l_counter: UT_COUNTER
		do
			create l_counter.make (0)
			classes_do_if_recursive (agent class_actions.call (?, agent l_counter.increment), agent {ET_CLASS}.is_parsed)
			Result := l_counter.item
		ensure
			parsed_class_count_not_negative: Result >= 0
		end

feature -- Kernel types

	any_type: ET_CLASS_TYPE
			-- Class type "ANY", with implicit 'attached' type mark

	detachable_any_type: ET_CLASS_TYPE
			-- Class type "detachable ANY"

	any_parent: ET_PARENT
			-- Default parent

	any_parents: ET_PARENT_LIST
			-- Default parents

	any_clients: ET_CLIENT_LIST
			-- Default client clause

	array_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "ARRAY [ANY]", with implicit 'attached' type mark

	array_detachable_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "ARRAY [detachable ANY]", with implicit 'attached' type mark

	boolean_type: ET_CLASS_TYPE
			-- Class type "BOOLEAN"

	character_type: ET_CLASS_TYPE
			-- Class type "CHARACTER"

	character_8_type: ET_CLASS_TYPE
			-- Class type "CHARACTER_8"

	character_32_type: ET_CLASS_TYPE
			-- Class type "CHARACTER_32"

	double_type: ET_CLASS_TYPE
			-- Class type "DOUBLE"

	function_type: ET_GENERIC_CLASS_TYPE
			-- Class type "FUNCTION [ANY, TUPLE, ANY]", with implicit 'attached' type mark

	integer_type: ET_CLASS_TYPE
			-- Class type "INTEGER"

	integer_8_type: ET_CLASS_TYPE
			-- Class type "INTEGER_8"

	integer_16_type: ET_CLASS_TYPE
			-- Class type "INTEGER_16"

	integer_32_type: ET_CLASS_TYPE
			-- Class type "INTEGER_32"

	integer_64_type: ET_CLASS_TYPE
			-- Class type "INTEGER_64"

	iterable_detachable_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "ITERABLE [detachable ANY]", with implicit 'attached' type mark

	natural_type: ET_CLASS_TYPE
			-- Class type "NATURAL"

	natural_8_type: ET_CLASS_TYPE
			-- Class type "NATURAL_8"

	natural_16_type: ET_CLASS_TYPE
			-- Class type "NATURAL_16"

	natural_32_type: ET_CLASS_TYPE
			-- Class type "NATURAL_32"

	natural_64_type: ET_CLASS_TYPE
			-- Class type "NATURAL_64"

	none_type: ET_CLASS_TYPE
			-- Class type "NONE", with implicit 'attached' type mark

	detachable_none_type: ET_CLASS_TYPE
			-- Class type "detachable NONE"

	pointer_type: ET_CLASS_TYPE
			-- Class type "POINTER"

	predicate_type: ET_GENERIC_CLASS_TYPE
			-- Class type "PREDICATE [ANY, TUPLE]", with implicit 'attached' type mark

	procedure_type: ET_GENERIC_CLASS_TYPE
			-- Class type "PROCEDURE [ANY, TUPLE]", with implicit 'attached' type mark

	real_type: ET_CLASS_TYPE
			-- Class type "REAL"

	real_32_type: ET_CLASS_TYPE
			-- Class type "REAL_32"

	real_64_type: ET_CLASS_TYPE
			-- Class type "REAL_64"

	routine_type: ET_GENERIC_CLASS_TYPE
			-- Class type "ROUTINE [ANY, TUPLE]", with implicit 'attached' type mark

	special_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "SPECIAL [ANY]", with implicit 'attached' type mark

	special_detachable_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "SPECIAL [detachable ANY]", with implicit 'attached' type mark

	string_type: ET_CLASS_TYPE
			-- Class type "STRING", with implicit 'attached' type mark

	string_8_type: ET_CLASS_TYPE
			-- Class type "STRING_8", with implicit 'attached' type mark

	string_32_type: ET_CLASS_TYPE
			-- Class type "STRING_32", with implicit 'attached' type mark

	system_object_type: ET_CLASS_TYPE
			-- Type "SYSTEM_OBJECT" (in Eiffel for .NET), with implicit 'attached' type mark

	system_object_parents: ET_PARENT_LIST
			-- Default parents for .NET classes

	system_string_type: ET_CLASS_TYPE
			-- Class type "SYSTEM_STRING" (in Eiffel for .NET), with implicit 'attached' type mark

	tuple_type: ET_TUPLE_TYPE
			-- Type "TUPLE", with implicit 'attached' type mark

	detachable_tuple_type: ET_TUPLE_TYPE
			-- Type "detachable TUPLE"

	type_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "TYPE [ANY]"

	type_detachable_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "TYPE [detachable ANY]"

	detachable_type_detachable_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "detachable TYPE [detachable ANY]"

	typed_pointer_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "TYPED_POINTER [ANY]"

	wide_character_type: ET_CLASS_TYPE
			-- Class type "WIDE_CHARACTER"

	set_kernel_types
			-- Set kernel types.
		do
				-- Note: make sure to call `set_any_type' before calling `set_array_type',
				-- `set_function_type', `set_predicate_type', `set_procedure_type',
				-- `set_routine_type', `set_special_type', `set_type_type' and
				-- `set_typed_pointer_type', otherwise `any_type' is still Void when
				-- `set_kernel_types' is called from the creation procedure.
			set_any_type
				-- Note: make sure to call `set_tuple_type' before calling `set_function_type',
				-- `set_predicate_type', `set_procedure_type' and `set_routine_type', otherwise
				-- `tuple_type' is still Void when `set_kernel_types' is called from the
				-- creation procedure.
			set_tuple_type
			set_array_type
			set_boolean_type
			set_character_type
			set_character_8_type
			set_character_32_type
			set_double_type
			set_function_type
			set_integer_type
			set_integer_8_type
			set_integer_16_type
			set_integer_32_type
			set_integer_64_type
			set_iterable_type
			set_natural_type
			set_natural_8_type
			set_natural_16_type
			set_natural_32_type
			set_natural_64_type
			set_none_type
			set_pointer_type
			set_predicate_type
			set_procedure_type
			set_real_type
			set_real_32_type
			set_real_64_type
			set_routine_type
			set_special_type
			set_string_8_type
			set_string_32_type
			set_string_type
			set_system_object_type
			set_system_string_type
			set_type_type
			set_typed_pointer_type
			set_wide_character_type
		end

	set_any_type
			-- Set type "ANY".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_any_client: ET_CLIENT
		do
			l_name := tokens.any_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create any_type.make (tokens.implicit_attached_type_mark, l_name, l_master_class)
			create detachable_any_type.make (tokens.detachable_keyword, l_name, l_master_class)
				-- Implicit parent "ANY".
			create any_parent.make (any_type, Void, Void, Void, Void, Void)
			create any_parents.make_with_capacity (1)
			any_parents.put_first (any_parent)
				-- Implicit client clause.
			create any_clients.make_with_capacity (1)
			create l_any_client.make (l_name, l_master_class)
			any_clients.put_first (l_any_client)
		end

	set_array_type
			-- Set type with base class "ARRAY".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_name := tokens.array_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
				-- Type "ARRAY [ANY]".
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (any_type)
			create array_any_type.make (tokens.implicit_attached_type_mark, l_name, l_parameters, l_master_class)
				-- Type "ARRAY [detachable ANY]".
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (detachable_any_type)
			create array_detachable_any_type.make (tokens.implicit_attached_type_mark, l_name, l_parameters, l_master_class)
		end

	set_boolean_type
			-- Set type "BOOLEAN".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.boolean_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create boolean_type.make (Void, l_name, l_master_class)
		end

	set_character_type
			-- Set type "CHARACTER".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.character_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create character_type.make (Void, l_name, l_master_class)
		end

	set_character_8_type
			-- Set type "CHARACTER_8".
			-- Update `character_8_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.character_8_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create character_8_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create character_8_convert_feature.make (character_8_type)
		end

	set_character_32_type
			-- Set type "CHARACTER_32".
			-- Update `character_32_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.character_32_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create character_32_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create character_32_convert_feature.make (character_32_type)
		end

	set_double_type
			-- Set type "DOUBLE".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.double_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create double_type.make (Void, l_name, l_master_class)
		end

	set_function_type
			-- Set type with base class "FUNCTION".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_name := tokens.function_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create l_parameters.make_with_capacity (3)
			l_parameters.put_first (any_type)
			l_parameters.put_first (tuple_type)
			l_parameters.put_first (any_type)
			create function_type.make (tokens.implicit_attached_type_mark, l_name, l_parameters, l_master_class)
		end

	set_integer_type
			-- Set type "INTEGER".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.integer_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create integer_type.make (Void, l_name, l_master_class)
		end

	set_integer_8_type
			-- Set type "INTEGER_8".
			-- Update `integer_8_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.integer_8_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create integer_8_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create integer_8_convert_feature.make (integer_8_type)
		end

	set_integer_16_type
			-- Set type "INTEGER_16".
			-- Update `integer_16_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.integer_16_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create integer_16_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create integer_16_convert_feature.make (integer_16_type)
		end

	set_integer_32_type
			-- Set type "INTEGER_32".
			-- Update `integer_32_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.integer_32_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create integer_32_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create integer_32_convert_feature.make (integer_32_type)
		end

	set_integer_64_type
			-- Set type "INTEGER_64".
			-- Update `integer_64_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.integer_64_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create integer_64_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create integer_64_convert_feature.make (integer_64_type)
		end

	set_iterable_type
			-- Set type with base class "ITERABLE".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_name := tokens.iterable_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
				-- Type "ITERABLE [detachable ANY]".
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (detachable_any_type)
			create iterable_detachable_any_type.make (tokens.implicit_attached_type_mark, l_name, l_parameters, l_master_class)
		end

	set_natural_type
			-- Set type "NATURAL".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.natural_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create natural_type.make (Void, l_name, l_master_class)
		end

	set_natural_8_type
			-- Set type "NATURAL_8".
			-- Update `natural_8_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.natural_8_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create natural_8_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create natural_8_convert_feature.make (natural_8_type)
		end

	set_natural_16_type
			-- Set type "NATURAL_16".
			-- Update `natural_16_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.natural_16_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create natural_16_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create natural_16_convert_feature.make (natural_16_type)
		end

	set_natural_32_type
			-- Set type "NATURAL_32".
			-- Update `natural_32_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.natural_32_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create natural_32_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create natural_32_convert_feature.make (natural_32_type)
		end

	set_natural_64_type
			-- Set type "NATURAL_64".
			-- Update `natural_64_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.natural_64_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create natural_64_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create natural_64_convert_feature.make (natural_64_type)
		end

	set_none_type
			-- Set type "NONE".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_none_class: ET_MASTER_CLASS
		do
			l_name := tokens.none_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create none_type.make (tokens.implicit_attached_type_mark, l_name, l_master_class)
			create detachable_none_type.make (tokens.detachable_keyword, l_name, l_master_class)
			l_none_class := current_system.master_class (l_name)
			l_master_class.add_first_imported_class (l_none_class)
		end

	set_pointer_type
			-- Set type "POINTER".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.pointer_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create pointer_type.make (Void, l_name, l_master_class)
		end

	set_predicate_type
			-- Set type with base class "PREDICATE".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_name := tokens.predicate_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create l_parameters.make_with_capacity (2)
			l_parameters.put_first (tuple_type)
			l_parameters.put_first (any_type)
			create predicate_type.make (tokens.implicit_attached_type_mark, l_name, l_parameters, l_master_class)
		end

	set_procedure_type
			-- Set type with base class "PROCEDURE".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_name := tokens.procedure_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create l_parameters.make_with_capacity (2)
			l_parameters.put_first (tuple_type)
			l_parameters.put_first (any_type)
			create procedure_type.make (tokens.implicit_attached_type_mark, l_name, l_parameters, l_master_class)
		end

	set_real_type
			-- Set type "REAL".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.real_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create real_type.make (Void, l_name, l_master_class)
		end

	set_real_32_type
			-- Set type "REAL_32".
			-- Update `real_32_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.real_32_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create real_32_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create real_32_convert_feature.make (real_32_type)
		end

	set_real_64_type
			-- Set type "REAL_64".
			-- Update `real_64_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.real_64_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create real_64_type.make (Void, l_name, l_master_class)
				-- Built-in conversion feature.
			create real_64_convert_feature.make (real_64_type)
		end

	set_routine_type
			-- Set type with base class "ROUTINE".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_name := tokens.routine_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create l_parameters.make_with_capacity (2)
			l_parameters.put_first (tuple_type)
			l_parameters.put_first (any_type)
			create routine_type.make (tokens.implicit_attached_type_mark, l_name, l_parameters, l_master_class)
		end

	set_special_type
			-- Set type with base class "SPECIAL".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_name := tokens.special_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
				-- Type "SPECIAL [ANY]".
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (any_type)
			create special_any_type.make (tokens.implicit_attached_type_mark, l_name, l_parameters, l_master_class)
				-- Type "SPECIAL [detachable ANY]".
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (detachable_any_type)
			create special_detachable_any_type.make (tokens.implicit_attached_type_mark, l_name, l_parameters, l_master_class)
		end

	set_string_type
			-- Set type "STRING".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.string_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create string_type.make (tokens.implicit_attached_type_mark, l_name, l_master_class)
		end

	set_string_8_type
			-- Set type "STRING_8".
			-- Update `string_8_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.string_8_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create string_8_type.make (tokens.implicit_attached_type_mark, l_name, l_master_class)
				-- Built-in conversion feature.
			create string_8_convert_feature.make (string_8_type)
		end

	set_string_32_type
			-- Set type "STRING_32".
			-- Update `string_32_convert_feature' accordingly.
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.string_32_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create string_32_type.make (tokens.implicit_attached_type_mark, l_name, l_master_class)
				-- Built-in conversion feature.
			create string_32_convert_feature.make (string_32_type)
		end

	set_system_object_type
			-- Set type "SYSTEM_OBJECT".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_parent: ET_PARENT
		do
			l_name := tokens.system_object_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create system_object_type.make (tokens.implicit_attached_type_mark, l_name, l_master_class)
				-- Implicit parent "SYSTEM_OBJECT".
			create l_parent.make (system_object_type, Void, Void, Void, Void, Void)
			create system_object_parents.make_with_capacity (1)
			system_object_parents.put_first (l_parent)
		end

	set_system_string_type
			-- Set type "SYSTEM_STRING".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.system_string_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create system_string_type.make (tokens.implicit_attached_type_mark, l_name, l_master_class)
		end

	set_tuple_type
			-- Set type "TUPLE".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.tuple_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create tuple_type.make (tokens.implicit_attached_type_mark, Void, l_master_class)
			create detachable_tuple_type.make (tokens.detachable_keyword, Void, l_master_class)
		end

	set_type_type
			-- Set type with base class "TYPE".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_name := tokens.type_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (any_type)
			create type_any_type.make (Void, l_name, l_parameters, l_master_class)
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (detachable_any_type)
			create type_detachable_any_type.make (Void, l_name, l_parameters, l_master_class)
			create detachable_type_detachable_any_type.make (tokens.detachable_keyword, l_name, l_parameters, l_master_class)
		end

	set_typed_pointer_type
			-- Set type with base class "TYPED_POINTER".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			l_name := tokens.typed_pointer_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (any_type)
			create typed_pointer_any_type.make (Void, l_name, l_parameters, l_master_class)
		end

	set_wide_character_type
			-- Set type "WIDE_CHARACTER".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
		do
			l_name := tokens.wide_character_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create wide_character_type.make (Void, l_name, l_master_class)
		end

feature -- Class mapping

	set_default_class_mapping
			-- Set sized basic types (STRING, CHARACTER, WIDE_CHARACTER,
			-- INTEGER, NATURAL, REAL, DOUBLE) to be aliased to their default.
		do
				-- Class "CHARACTER" mapped to "CHARACTER_8".
			set_character_class_mapping (tokens.character_8_class_name)
				-- Class "CHARACTER_REF" mapped to "CHARACTER_8_REF".
			set_character_ref_class_mapping (tokens.character_8_ref_class_name)
				-- Class "DOUBLE" mapped to "REAL_64".
			set_double_class_mapping (tokens.real_64_class_name)
				-- Class "DOUBLE_REF" mapped to "REAL_64_REF".
			set_double_ref_class_mapping (tokens.real_64_ref_class_name)
				-- Class "INTEGER" mapped to "INTEGER_32".
			set_integer_class_mapping (tokens.integer_32_class_name)
				-- Class "INTEGER_REF" mapped to "INTEGER_32_REF".
			set_integer_ref_class_mapping (tokens.integer_32_ref_class_name)
				-- Class "NATURAL" mapped to "NATURAL_32".
			set_natural_class_mapping (tokens.natural_32_class_name)
				-- Class "NATURAL_REF" mapped to "NATURAL_32_REF".
			set_natural_ref_class_mapping (tokens.natural_32_ref_class_name)
				-- Class "REAL" mapped to "REAL_32".
			set_real_class_mapping (tokens.real_32_class_name)
				-- Class "REAL_REF" mapped to "REAL_32_REF".
			set_real_ref_class_mapping (tokens.real_32_ref_class_name)
				-- Class "STRING" mapped to "STRING_8".
			set_string_class_mapping (tokens.string_8_class_name)
				-- Class "WIDE_CHARACTER" mapped to "CHARACTER_32".
			set_wide_character_class_mapping (tokens.character_32_class_name)
				-- Class "WIDE_CHARACTER_REF" mapped to "CHARACTER_32_REF".
			set_wide_character_ref_class_mapping (tokens.character_32_ref_class_name)
		end

	set_character_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "CHARACTER" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.character_class_name, a_class_name)
		end

	set_character_ref_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "CHARACTER_REF" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.character_ref_class_name, a_class_name)
		end

	set_double_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "DOUBLE" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.double_class_name, a_class_name)
		end

	set_double_ref_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "DOUBLE_REF" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.double_ref_class_name, a_class_name)
		end

	set_integer_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "INTEGER" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.integer_class_name, a_class_name)
		end

	set_integer_ref_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "INTEGER_REF" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.integer_ref_class_name, a_class_name)
		end

	set_natural_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "NATURAL" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.natural_class_name, a_class_name)
		end

	set_natural_ref_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "NATURAL_REF" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.natural_ref_class_name, a_class_name)
		end

	set_real_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "REAL" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.real_class_name, a_class_name)
		end

	set_real_ref_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "REAL_REF" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.real_ref_class_name, a_class_name)
		end

	set_string_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "STRING" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.string_class_name, a_class_name)
		end

	set_wide_character_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "WIDE_CHARACTER" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.wide_character_class_name, a_class_name)
		end

	set_wide_character_ref_class_mapping (a_class_name: ET_CLASS_NAME)
			-- Map class "WIDE_CHARACTER_REF" to `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			set_class_mapping (tokens.wide_character_ref_class_name, a_class_name)
		end

	set_class_mapping (a_alias_name, a_class_name: ET_CLASS_NAME)
			-- Map class `a_alias_name' to `a_class_name'.
			--
			-- For example:
			--    a_alias_name = INTEGER
			--    a_class_name = INTEGER_32
		require
			a_alias_name_not_void: a_alias_name /= Void
			a_class_name_not_void: a_class_name /= Void
		local
			l_master_class: ET_MASTER_CLASS
		do
			l_master_class := master_class (a_alias_name)
			l_master_class.set_mapped_class (master_class (a_class_name))
		end

feature -- Compilation options

	attachment_type_conformance_mode: BOOLEAN
			-- Should attachment status be taken into account when checking
			-- conformance of types in current universe?

	implicit_attachment_type_mark: ET_TYPE_MARK
			-- Implicit attachment type mark when a type in a class of the
			-- current universe is declared with no explicit attachment type mark

	target_type_attachment_mode: BOOLEAN
			-- Should the attachment status of the target of qualified calls
			-- be checked at compile time?

feature -- Compilation options setting

	set_attachment_type_conformance_mode (b: BOOLEAN)
			-- Set `attachment_type_conformance_mode' to `b'.
		do
			attachment_type_conformance_mode := b
		ensure
			attachment_type_conformance_mode_set: attachment_type_conformance_mode = b
		end

	set_implicit_attachment_type_mark (a_type_mark: like implicit_attachment_type_mark)
			-- Set `implicit_attachment_type_mark' to `a_type_mark'.
		do
			implicit_attachment_type_mark := a_type_mark
		ensure
			implicit_attachment_type_mark_set: implicit_attachment_type_mark = a_type_mark
		end

	set_target_type_attachment_mode (b: BOOLEAN)
			-- Set `target_type_attachment_mode' to `b'.
		do
			target_type_attachment_mode := b
		ensure
			target_type_attachment_mode_set: target_type_attachment_mode = b
		end

feature -- Built-in convert features

	character_8_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to CHARACTER_8

	character_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to CHARACTER_32

	integer_8_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_8

	integer_16_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_16

	integer_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_32

	integer_64_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_64

	natural_8_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to NATURAL_8

	natural_16_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to NATURAL_16

	natural_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to NATURAL_32

	natural_64_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to NATURAL_64

	real_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to REAL_32

	real_64_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to REAL_64

	string_8_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to STRING_8

	string_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to STRING_32

feature -- Iteration

	classes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]])
			-- Apply `an_action' on all classes declared locally in current universe.
			-- Do not take into account overridden classes.
		require
			an_action_not_void: an_action /= Void
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME]
			l_master_class: ET_MASTER_CLASS
			l_class: ET_CLASS
		do
			l_cursor := master_classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_master_class := l_cursor.item
				if not l_master_class.is_mapped then
					l_class := l_master_class.actual_class
					if l_class.universe = Current then
						an_action.call ([l_class])
					end
				end
				l_cursor.forth
			end
		end

	classes_do_until (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' on all classes declared locally in current universe.
			-- Do not take into account overridden classes.
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME]
			l_master_class: ET_MASTER_CLASS
			l_class: ET_CLASS
		do
			if a_stop_request = Void then
				classes_do_all (an_action)
			elseif not a_stop_request.item ([]) then
				l_cursor := master_classes.new_cursor
				from l_cursor.start until l_cursor.after loop
					if a_stop_request.item ([]) then
						l_cursor.go_after
					else
						l_master_class := l_cursor.item
						if not l_master_class.is_mapped then
							l_class := l_master_class.actual_class
							if l_class.universe = Current then
								an_action.call ([l_class])
							end
						end
						l_cursor.forth
					end
				end
			end
		end

	classes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN])
			-- Apply `an_action' on all classes declared locally in current universe
			-- that satisfy `a_test'.
			-- Do not take into account overridden classes.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME]
			l_master_class: ET_MASTER_CLASS
			l_class: ET_CLASS
		do
			l_cursor := master_classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_master_class := l_cursor.item
				if not l_master_class.is_mapped then
					l_class := l_master_class.actual_class
					if l_class.universe = Current then
						if a_test.item ([l_class]) then
							an_action.call ([l_class])
						end
					end
				end
				l_cursor.forth
			end
		end

	classes_do_if_until (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' on all classes declared locally in current universe
			-- that satisfy `a_test'.
			-- Do not take into account overridden classes.
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME]
			l_master_class: ET_MASTER_CLASS
			l_class: ET_CLASS
		do
			if a_stop_request = Void then
				classes_do_if (an_action, a_test)
			elseif not a_stop_request.item ([]) then
				l_cursor := master_classes.new_cursor
				from l_cursor.start until l_cursor.after loop
					if a_stop_request.item ([]) then
						l_cursor.go_after
					else
						l_master_class := l_cursor.item
						if not l_master_class.is_mapped then
							l_class := l_master_class.actual_class
							if l_class.universe = Current then
								if a_test.item ([l_class]) then
									an_action.call ([l_class])
								end
							end
						end
						l_cursor.forth
					end
				end
			end
		end

	classes_do_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]])
			-- Apply `an_action' on all classes declared locally in current universe
			-- as well as on the classes that are declared in the universes it depends
			-- on recursively.
			-- Do not take into account overridden classes.
		require
			an_action_not_void: an_action /= Void
		do
			universes_do_recursive (agent {ET_UNIVERSE}.classes_do_all (an_action))
		end

	classes_do_recursive_until (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' on all classes declared locally in current universe
			-- as well as on the classes that are declared in the universes it depends
			-- on recursively.
			-- Do not take into account overridden classes.
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		do
			if a_stop_request = Void then
				universes_do_recursive (agent {ET_UNIVERSE}.classes_do_all (an_action))
			else
				universes_do_recursive_until (agent {ET_UNIVERSE}.classes_do_until (an_action, a_stop_request), a_stop_request)
			end
		end

	classes_do_if_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN])
			-- Apply `an_action' on all classes that satisfy `a_test', declared
			-- locally in current universe as well as on the classes that are
			-- declared in the universes it depends on recursively.
			-- Do not take into account overridden classes.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			universes_do_recursive (agent {ET_UNIVERSE}.classes_do_if (an_action, a_test))
		end

	classes_do_if_recursive_until (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' on all classes that satisfy `a_test', declared
			-- locally in current universe as well as on the classes that are
			-- declared in the universes it depends on recursively.
			-- Do not take into account overridden classes.
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			if a_stop_request = Void then
				universes_do_recursive (agent {ET_UNIVERSE}.classes_do_if (an_action, a_test))
			else
				universes_do_recursive_until (agent {ET_UNIVERSE}.classes_do_if_until (an_action, a_test, a_stop_request), a_stop_request)
			end
		end

	master_classes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_MASTER_CLASS]])
			-- Apply `an_action' on all classes in `master_classes'.
		require
			an_action_not_void: an_action /= Void
		do
			master_classes.do_all (an_action)
		end

	master_classes_do_until (an_action: PROCEDURE [ANY, TUPLE [ET_MASTER_CLASS]]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' on all classes in `master_classes'.
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME]
		do
			if a_stop_request = Void then
				master_classes_do_all (an_action)
			elseif not a_stop_request.item ([]) then
				l_cursor := master_classes.new_cursor
				from l_cursor.start until l_cursor.after loop
					if a_stop_request.item ([]) then
						l_cursor.go_after
					else
						an_action.call ([l_cursor.item])
						l_cursor.forth
					end
				end
			end
		end

	master_classes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_MASTER_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_MASTER_CLASS], BOOLEAN])
			-- Apply `an_action' on all classes in `master_classes'
			-- that satisfy `a_test'.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			master_classes.do_if (an_action, a_test)
		end

	master_classes_do_if_until (an_action: PROCEDURE [ANY, TUPLE [ET_MASTER_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_MASTER_CLASS], BOOLEAN]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' on all classes in `master_classes'
			-- that satisfy `a_test'.
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME]
			l_class: ET_MASTER_CLASS
		do
			if a_stop_request = Void then
				master_classes_do_if (an_action, a_test)
			elseif not a_stop_request.item ([]) then
				l_cursor := master_classes.new_cursor
				from l_cursor.start until l_cursor.after loop
					if a_stop_request.item ([]) then
						l_cursor.go_after
					else
						l_class := l_cursor.item
						if a_test.item ([l_class]) then
							an_action.call ([l_class])
						end
						l_cursor.forth
					end
				end
			end
		end

	master_classes_do_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_MASTER_CLASS]])
			-- Apply `an_action' on all classes in `master_classes' as well as on the classes
			-- of the universes it depends on recursively.
		require
			an_action_not_void: an_action /= Void
		do
			universes_do_recursive (agent {ET_UNIVERSE}.master_classes_do_all (an_action))
		end

	master_classes_do_recursive_until (an_action: PROCEDURE [ANY, TUPLE [ET_MASTER_CLASS]]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' on all classes in `master_classes' as well as on the classes
			-- of the universes it depends on recursively.
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		do
			if a_stop_request = Void then
				universes_do_recursive (agent {ET_UNIVERSE}.master_classes_do_all (an_action))
			else
				universes_do_recursive_until (agent {ET_UNIVERSE}.master_classes_do_until (an_action, a_stop_request), a_stop_request)
			end
		end

	master_classes_do_if_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_MASTER_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_MASTER_CLASS], BOOLEAN])
			-- Apply `an_action' on all classes that satisfy `a_test' in `master_classes'
			-- as well as in the classes of the universes it depends on recursively.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			universes_do_recursive (agent {ET_UNIVERSE}.master_classes_do_if (an_action, a_test))
		end

	master_classes_do_if_recursive_until (an_action: PROCEDURE [ANY, TUPLE [ET_MASTER_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_MASTER_CLASS], BOOLEAN]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' on all classes that satisfy `a_test' in `master_classes'
			-- as well as in the classes of the universes it depends on recursively.
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			if a_stop_request = Void then
				universes_do_recursive (agent {ET_UNIVERSE}.master_classes_do_if (an_action, a_test))
			else
				universes_do_recursive_until (agent {ET_UNIVERSE}.master_classes_do_if_until (an_action, a_test, a_stop_request), a_stop_request)
			end
		end

	universes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]])
			-- Apply `an_action' to every universe that current universe depends on.
		require
			an_action_not_void: an_action /= Void
		do
		end

	universes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]; a_test: FUNCTION [ANY, TUPLE [ET_UNIVERSE], BOOLEAN])
			-- Apply `an_action' to every universe that current universe depends on and
			-- which satisfies `a_test'.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
		end

	universes_do_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]])
			-- Apply `an_action' on current universe and recursively on
			-- the universes it depends on.
		require
			an_action_not_void: an_action /= Void
		local
			l_visited: DS_HASH_SET [ET_UNIVERSE]
		do
			create l_visited.make (initial_universes_capacity)
			add_universe_recursive (l_visited)
			l_visited.do_all (an_action)
		end

	universes_do_if_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]; a_test: FUNCTION [ANY, TUPLE [ET_UNIVERSE], BOOLEAN])
			-- Apply `an_action' on current universe and recursively on
			-- the universes it depends on which satisfies `a_test'.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			l_visited: DS_HASH_SET [ET_UNIVERSE]
		do
			create l_visited.make (initial_universes_capacity)
			add_universe_recursive (l_visited)
			l_visited.do_if (an_action, a_test)
		end

	universes_do_recursive_until (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' on current universe and recursively on
			-- the universes it depends on.
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		local
			l_visited: DS_HASH_SET [ET_UNIVERSE]
		do
			if a_stop_request = Void then
				universes_do_recursive (an_action)
			elseif not a_stop_request.item ([]) then
				create l_visited.make (initial_universes_capacity)
				add_universe_recursive (l_visited)
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

	universes_do_if_recursive_until (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]; a_test: FUNCTION [ANY, TUPLE [ET_UNIVERSE], BOOLEAN]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' on current universe and recursively on
			-- the universes it depends on which satisfies `a_test'.
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			l_visited: DS_HASH_SET [ET_UNIVERSE]
			l_universe: ET_UNIVERSE
		do
			if a_stop_request = Void then
				universes_do_if_recursive (an_action, a_test)
			elseif not a_stop_request.item ([]) then
				create l_visited.make (initial_universes_capacity)
				add_universe_recursive (l_visited)
				from l_visited.start until l_visited.after loop
					l_universe := l_visited.item_for_iteration
					if a_stop_request.item ([]) then
						l_visited.go_after
					else
						if a_test.item ([l_universe]) then
							an_action.call ([l_universe])
						end
						l_visited.forth
					end
				end
			end
		end

feature -- Relations

	add_universe_recursive (a_visited: DS_HASH_SET [ET_UNIVERSE])
			-- Add current universe to `a_visited' and
			-- recursively the universes it depends on.
		require
			a_visited_not_void: a_visited /= Void
		do
			if not a_visited.has (Current) then
				a_visited.force_last (Current)
			end
		end

feature -- Actions

	do_master_class_by_name (a_name: STRING; a_action: PROCEDURE [ANY, TUPLE [ET_MASTER_CLASS]])
			-- Execute `a_action' on class named `a_name' when viewed from current universe, if any.
			-- Take into account both locally declared classes and
			-- classes imported from other universes.
			-- Do nothing if not such class.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_action_not_void: a_action /= Void
		local
			l_class: ET_MASTER_CLASS
		do
			l_class := master_class_by_name (a_name)
			if l_class /= Void then
				a_action.call ([l_class])
			end
		end

	do_class_by_name (a_name: STRING; a_action: PROCEDURE [ANY, TUPLE [ET_CLASS]])
			-- Execute `a_action' on class named `a_name' declared locally in current universe.
			-- Do not take into account overridden classes.
			-- Do nothing if not such class.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_action_not_void: a_action /= Void
		local
			l_class: ET_CLASS
		do
			l_class := class_by_name (a_name)
			if l_class /= Void then
				a_action.call ([l_class])
			end
		end

feature -- Parsing

	is_preparsed: BOOLEAN
			-- Have the classes declared locally in current universe already
			-- been preparsed? This means that we already have a mapping between
			-- class names and their filenames, and that `master_classes' has been
			-- populated, even if the classes have not been parsed yet.

	preparse
			-- Build a mapping between class names and their filenames and
			-- populate `master_classes', even if the classes have not been
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
			is_preparsed := True
		ensure
			preparsed: is_preparsed
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
		do
			preparse
			import_classes
		ensure
			preparsed: is_preparsed
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
			is_preparsed := True
		ensure
			preparsed: is_preparsed
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
		do
			parse_all
			import_classes
		ensure
			preparsed: is_preparsed
		end

feature {ET_UNIVERSE} -- Parsing

	import_classes
			-- Import classes made available (i.e. exported) by other universes.
		do
		end

feature {NONE} -- Parsing

	classes_modified_recursive: BOOLEAN
			-- Has a class (declared locally or in a universe that the current
			-- universe recursively depends on) been modified or removed?
			-- This would require classes from the current universe and from
			-- universes that recursively depend on it to be reprocessed accordingly.
		local
			l_modified: UT_TRISTATE
		do
			create l_modified.make_false
			master_classes_do_if_recursive_until (agent any_actions.call ({ET_MASTER_CLASS} ?, agent l_modified.set_true), agent {ET_MASTER_CLASS}.is_modified, agent l_modified.is_true)
			Result := l_modified.is_true
		end

feature {NONE} -- Constants

	initial_universes_capacity: INTEGER
			-- Initial capacity for containers containing universes
		once
			Result := 10
		ensure
			capacity_positive: Result > 0
		end

	initial_classes_in_group_capacity: INTEGER
			-- Initial capacity for `classes_in_group'
		once
			Result := 20
		ensure
			capacity_positive: Result > 0
		end

	initial_classes_by_groups_capacity: INTEGER
			-- Initial capacity for `classes_by_groups'
		once
			Result := 500
		ensure
			capacity_positive: Result > 0
		end

feature {NONE} -- Implementation

	insert_in_hash_table (a_hash_table: DS_HASH_TABLE [INTEGER, ET_UNIVERSE]; a_value: INTEGER; a_key: ET_UNIVERSE)
			-- This routine is a workaround for the bug:
			-- "[Compiler #16375] [er] Bug in finalized mode involving agents and generics"
			-- reported to ISE.
		require
			a_hash_table_not_void: a_hash_table /= Void
		do
			a_hash_table.force_last (a_value, a_key)
		end

invariant

	current_system_not_void: current_system /= Void
	master_classes_not_void: master_classes /= Void
	no_void_master_class: not master_classes.has_void_item
		-- Kernel types.
	any_type_not_void: any_type /= Void
	detachable_any_type_not_void: detachable_any_type /= Void
	any_parent_not_void: any_parent /= Void
	any_parents_not_void: any_parents /= Void
	any_clients_not_void: any_clients /= Void
	array_any_type_not_void: array_any_type /= Void
	array_detachable_any_type_not_void: array_detachable_any_type /= Void
	character_8_type_not_void: character_8_type /= Void
	character_32_type_not_void: character_32_type /= Void
	function_type_not_void: function_type /= Void
	integer_8_type_not_void: integer_8_type /= Void
	integer_16_type_not_void: integer_16_type /= Void
	integer_32_type_not_void: integer_32_type /= Void
	integer_64_type_not_void: integer_64_type /= Void
	iterable_detachable_any_type_not_void: iterable_detachable_any_type /= Void
	natural_8_type_not_void: natural_8_type /= Void
	natural_16_type_not_void: natural_16_type /= Void
	natural_32_type_not_void: natural_32_type /= Void
	natural_64_type_not_void: natural_64_type /= Void
	none_type_not_void: none_type /= Void
	detachable_none_type_not_void: detachable_none_type /= Void
	pointer_type_not_void: pointer_type /= Void
	predicate_type_not_void: predicate_type /= Void
	procedure_type_not_void: procedure_type /= Void
	real_32_type_not_void: real_32_type /= Void
	real_64_type_not_void: real_64_type /= Void
	routine_type_not_void: routine_type /= Void
	special_any_type_not_void: special_any_type /= Void
	special_detachable_any_type_not_void: special_detachable_any_type /= Void
	string_8_type_not_void: string_8_type /= Void
	string_32_type_not_void: string_32_type /= Void
	system_object_type_not_void: system_object_type /= Void
	system_object_parents_not_void: system_object_parents /= Void
	system_string_type_not_void: system_string_type /= Void
	tuple_type_not_void: tuple_type /= Void
	detachable_tuple_type_not_void: detachable_tuple_type /= Void
	type_any_type_not_void: type_any_type /= Void
	typed_pointer_any_type_not_void: typed_pointer_any_type /= Void
		-- Class mapping.
	boolean_type_not_void: boolean_type /= Void
	character_type_not_void: character_type /= Void
	double_type_not_void: double_type /= Void
	integer_type_not_void: integer_type /= Void
	natural_type_not_void: natural_type /= Void
	real_type_not_void: real_type /= Void
	string_type_not_void: string_type /= Void
	wide_character_type_not_void: wide_character_type /= Void
		-- Built-in convert features.
	character_8_convert_feature_not_void: character_8_convert_feature /= Void
	character_32_convert_feature_not_void: character_32_convert_feature /= Void
	integer_8_convert_feature_not_void: integer_8_convert_feature /= Void
	integer_16_convert_feature_not_void: integer_16_convert_feature /= Void
	integer_32_convert_feature_not_void: integer_32_convert_feature /= Void
	integer_64_convert_feature_not_void: integer_64_convert_feature /= Void
	natural_8_convert_feature_not_void: natural_8_convert_feature /= Void
	natural_16_convert_feature_not_void: natural_16_convert_feature /= Void
	natural_32_convert_feature_not_void: natural_32_convert_feature /= Void
	natural_64_convert_feature_not_void: natural_64_convert_feature /= Void
	real_32_convert_feature_not_void: real_32_convert_feature /= Void
	real_64_convert_feature_not_void: real_64_convert_feature /= Void
	string_8_convert_feature_not_void: string_8_convert_feature /= Void
	string_32_convert_feature_not_void: string_32_convert_feature /= Void

end
