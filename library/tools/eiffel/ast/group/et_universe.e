indexing

	description:

	"[
		Eiffel class universes.
		An Eiffel universe is a set if classes, some declared locally
		(in the universe's clusters), some exported by other universes
		(by other libraries or assemblies). No two classes have the same
		name. All local classes (declared locally) should only depend on
		classes of the universe. The classes exported by other universes
		are those which are declared locally in these universes and whose
		group is not marked as hidden. Renaming (or class name prefixing)
		is available to resolve name clashes between classes exported by
		different universes.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_UNIVERSE

inherit

	HASHABLE

	ET_SHARED_CLASS_NAME_TESTER
			export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
			export {NONE} all end

	KL_SHARED_FILE_SYSTEM
			export {NONE} all end

feature {NONE} -- Initialization

	make_from_system (a_system: ET_SYSTEM) is
			-- Create a new universe as being part of `a_system'.
		require
			a_system_not_void: a_system /= Void
		do
			current_system := a_system
			initialize
			set_default_class_mapping
		ensure
			current_system_set: current_system = a_system
		end

	initialize is
			-- Initialize universe.
		do
			create classes.make_map (3000)
			classes.set_key_equality_tester (class_name_tester)
			create mapped_classes.make_map (mappable_class_count)
			mapped_classes.set_key_equality_tester (class_name_tester)
		end

feature -- Initialization

	reset_classes is
			-- Reset classes as they were just after they were last parsed.
			-- Do nothing if not parsed.
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
		do
			l_cursor := classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				from
					l_class := l_cursor.item
				until
					l_class = Void
				loop
					l_class.reset_after_parsed
					l_class := l_class.overridden_class
				end
				l_cursor.forth
			end
		end

	reset_classes_incremental is
			-- Reset parts of the classes which may not be valid anymore
			-- because of changes in other classes. Re-processing these
			-- classes will not affect the parts which didn't need to be reset.
			-- This allows to perform incremental code analysis or compilation
			-- when only a few classes have been modified.
			--
			-- For example, when a class have been modified, we need to
			-- reparse that class, but not necessarily the other classes.
			-- When a class has been reparsed, we need to rebuild its ancestors
			-- as well as the ancestors of its descendant classes. When the
			-- ancestors of a class have been rebuilt, we need to rebuild
			-- the feature table for this class. When the feature table of
			-- a class has been rebuild, we need to recheck the validity
			-- of the feature calls in the clients of this class.
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
			l_ancestors_status_checker: ET_ANCESTORS_STATUS_CHECKER
			l_flattening_status_checker: ET_FLATTENING_STATUS_CHECKER
			l_interface_status_checker: ET_INTERFACE_STATUS_CHECKER
			l_implementation_status_checker: ET_IMPLEMENTATION_STATUS_CHECKER
		do
				-- Start by taking care of classes containing errors, and
				-- also reset overridden class as they were when last parsed.
			l_cursor := classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.ancestors_built then
					if l_class.has_ancestors_error then
							-- This class had an error, so we need to reprocess it.
						l_class.reset_after_parsed
					else
							-- We mark this class with an error here to indicate that
							-- we need to check whether it is still correct. If the error
							-- is confirmed (because the class processing has become
							-- invalid due to other classes having been modified or
							-- recursively made invalid), then the class will be reset
							-- to the previous processing step. Otherwise the error
							-- flag will be cleared.
						l_class.set_ancestors_error
					end
				end
				if l_class.features_flattened then
					if l_class.has_flattening_error then
							-- This class had an error, so we need to reprocess it.
						l_class.reset_after_ancestors_built
					else
							-- We mark this class with an error here to indicate that
							-- we need to check whether it is still correct. If the error
							-- is confirmed (because the class processing has become
							-- invalid due to other classes having been modified or
							-- recursively made invalid), then the class will be reset
							-- to the previous processing step. Otherwise the error
							-- flag will be cleared.
						l_class.set_flattening_error
					end
				end
				if l_class.interface_checked then
					if not l_class.implementation_checked then
							-- It is possible to check the implementation of features
							-- individiually without setting ET_CLASS.implementation_checked.
							-- It is safer to force a reset just in case we are in this
							-- situation.
						l_class.reset_after_interface_checked
					end
					if l_class.has_interface_error then
							-- This class had an error, so we need to reprocess it.
						l_class.reset_after_features_flattened
					else
							-- We mark this class with an error here to indicate that
							-- we need to check whether it is still correct. If the error
							-- is confirmed (because the class processing has become
							-- invalid due to other classes having been modified or
							-- recursively made invalid), then the class will be reset
							-- to the previous processing step. Otherwise the error
							-- flag will be cleared.
						l_class.set_interface_error
					end
				end
				if l_class.implementation_checked then
					if l_class.has_implementation_error then
							-- This class had an error, so we need to reprocess it.
						l_class.reset_after_interface_checked
					else
							-- We mark this class with an error here to indicate that
							-- we need to check whether it is still correct. If the error
							-- is confirmed (because the class processing has become
							-- invalid due to other classes having been modified or
							-- recursively made invalid), then the class will be reset
							-- to the previous processing step. Otherwise the error
							-- flag will be cleared.
						l_class.set_implementation_error
					end
				end
					-- Reset overridden class as they were when last parsed.
				from
					l_class := l_class.overridden_class
				until
					l_class = Void
				loop
					l_class.reset_after_parsed
					l_class := l_class.overridden_class
				end
				l_cursor.forth
			end
				-- Reset ancestors building.
			create l_ancestors_status_checker.make
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.ancestors_built then
					l_class.process (l_ancestors_status_checker)
				end
				l_cursor.forth
			end
				-- Reset feature flattening.
			create l_flattening_status_checker.make
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.features_flattened then
					l_class.process (l_flattening_status_checker)
				end
				l_cursor.forth
			end
				-- Reset interface checking.
			create l_interface_status_checker.make
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.interface_checked then
					l_class.process (l_interface_status_checker)
				end
				l_cursor.forth
			end
				-- Reset implementation checking.
			create l_implementation_status_checker.make
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.implementation_checked then
					l_class.process (l_implementation_status_checker)
				end
				l_cursor.forth
			end
		end

	reset_errors is
			-- Reset classes as they were before their first error was reported.
			-- Errors will be reported again if classes are processed again.
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
			l_reparse_needed: BOOLEAN
		do
			l_cursor := classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				from
					l_class := l_cursor.item
					if l_class.is_parsed and then l_class.has_syntax_error then
						l_reparse_needed := True
					end
				until
					l_class = Void
				loop
					l_class.reset_errors
					l_class := l_class.overridden_class
				end
				l_cursor.forth
			end
			if l_reparse_needed then
					-- Some classes which had a syntax error will be reparsed.
					-- As a consequence, it is wiser to incrementally reset
					-- the classes that depend on them.
				reset_classes_incremental
			end
		end

feature -- Status report

	has_class (a_name: ET_CLASS_NAME): BOOLEAN is
			-- Is there a class named `a_name' in current universe?
			-- Take into account both locally declared classes and
			-- classes exported by other universe.
		require
			a_name_not_void: a_name /= Void
		local
			l_class: ET_CLASS
		do
			classes.search (a_name)
			if classes.found then
				l_class := classes.found_item
				Result := l_class.is_preparsed
			else
				mapped_classes.search (a_name)
				if mapped_classes.found then
					l_class := mapped_classes.found_item
					Result := l_class.is_preparsed
				end
			end
		ensure
			is_preparsed: Result implies eiffel_class (a_name).is_preparsed
		end

feature -- Access

	classes: DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME]
			-- Classes in current universe;
			-- Contains both locally declared classes and
			-- classes exported by other universe.

	eiffel_class (a_name: ET_CLASS_NAME): ET_CLASS is
			-- Class named `a_name' in universe;
			-- add this class to universe if not found
		require
			a_name_not_void: a_name /= Void
		do
			classes.search (a_name)
			if classes.found then
				Result := classes.found_item
			else
				mapped_classes.search (a_name)
				if mapped_classes.found then
					Result := mapped_classes.found_item
				else
					create Result.make (a_name)
					current_system.register_class (Result)
					classes.force_last (Result, a_name)
				end
			end
		ensure
			eiffel_class_not_void: Result /= Void
		end

	class_by_name (a_name: STRING): ET_CLASS is
			-- Class named `a_name' in universe;
			-- Void if not such class
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			a_class_name: ET_IDENTIFIER
		do
			create a_class_name.make (a_name)
			classes.search (a_class_name)
			if classes.found then
				Result := classes.found_item
			else
				mapped_classes.search (a_class_name)
				if mapped_classes.found then
					Result := mapped_classes.found_item
				end
			end
		end

	classes_in_group (a_group: ET_GROUP): DS_ARRAYED_LIST [ET_CLASS] is
			-- Classes in universe which are in `a_group';
			-- Create a new list at each call
		require
			a_group_not_void: a_group /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
		do
			create Result.make (initial_classes_in_group_capacity)
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				from
					a_class := a_cursor.item
				until
					a_class = Void
				loop
					if a_class.group = a_group then
						Result.force_last (a_class)
					end
					a_class := a_class.overridden_class
				end
				a_cursor.forth
			end
		ensure
			classes_not_void: Result /= Void
			no_void_class: not Result.has (Void)
		end

	classes_in_group_recursive (a_group: ET_GROUP): DS_ARRAYED_LIST [ET_CLASS] is
			-- Classes in universe which are in `a_group'
			-- or recursively in one of its subgroups;
			-- Create a new list at each call
		require
			a_group_not_void: a_group /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
		do
			create Result.make (initial_classes_in_group_capacity)
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				from
					a_class := a_cursor.item
				until
					a_class = Void
				loop
					if a_class.is_in_group_recursive (a_group) then
						Result.force_last (a_class)
					end
					a_class := a_class.overridden_class
				end
				a_cursor.forth
			end
		ensure
			classes_not_void: Result /= Void
			no_void_class: not Result.has (Void)
		end

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system
			-- (Note: there is a frozen feature called `system' in
			-- class GENERAL of SmartEiffel 1.0)

	hash_code: INTEGER is
			-- Hash value
		do
			Result := 1
		end

feature -- Measurement

	class_count: INTEGER is
			-- Number of classes declared locally in current universe
			-- and recursively in the universes it depends on
		do
			Result := class_count_recursive
		ensure
			definition: Result = class_count_recursive
		end

	class_count_local: INTEGER is
			-- Number of classes declared locally in current universe
		local
			l_counter: UT_COUNTER
		do
			create l_counter.make (0)
			classes_do_local (agent {ET_CLASS}.increment_counter (l_counter))
			Result := l_counter.item
		ensure
			class_count_not_negative: Result >= 0
		end

	class_count_recursive: INTEGER is
			-- Number of classes declared locally in current universe
			-- and recursively in the universes it depends on
		local
			l_counter: UT_COUNTER
		do
			create l_counter.make (0)
			classes_do_recursive (agent {ET_CLASS}.increment_counter (l_counter))
			Result := l_counter.item
		ensure
			class_count_not_negative: Result >= 0
		end

	parsed_class_count: INTEGER is
			-- Number of classes parsed locally in current universe
			-- and recursively in the universes it depends on
		do
			Result := parsed_class_count_recursive
		ensure
			definition: Result = parsed_class_count_recursive
		end

	parsed_class_count_local: INTEGER is
			-- Number of classes parsed locally in current universe
		local
			l_counter: UT_COUNTER
		do
			create l_counter.make (0)
			classes_do_if_local (agent {ET_CLASS}.increment_counter (l_counter), agent {ET_CLASS}.is_parsed)
			Result := l_counter.item
		ensure
			parsed_class_count_not_negative: Result >= 0
		end

	parsed_class_count_recursive: INTEGER is
			-- Number of classes parsed locally in current universe
			-- and recursively in the universes it depends on
		local
			l_counter: UT_COUNTER
		do
			create l_counter.make (0)
			classes_do_if_recursive (agent {ET_CLASS}.increment_counter (l_counter), agent {ET_CLASS}.is_parsed)
			Result := l_counter.item
		ensure
			parsed_class_count_not_negative: Result >= 0
		end

feature -- Class mapping

	mapped_classes: DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME]
			-- Mapping between sized basic type names (e.g. INTEGER, STRING)
			-- and their actual classes (which are stored in `classes' under
			-- their actual names) when aliased

	character_class: ET_CLASS
			-- Class "CHARACTER"

	character_ref_class: ET_CLASS
			-- Class "CHARACTER_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	character_type: ET_CLASS_TYPE
			-- Class type "CHARACTER"
			-- (To be used instead of `character_class' when the name of the type
			-- matters, in error messages for example where it will display "CHARACTER"
			-- instead of say "CHARACTER_8" if it is mapped this way.)

	double_class: ET_CLASS
			-- Class "DOUBLE"

	double_ref_class: ET_CLASS
			-- Class "DOUBLE_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	double_type: ET_CLASS_TYPE
			-- Class type "DOUBLE"
			-- (To be used instead of `double_class' when the name of the type
			-- matters, in error messages for example where it will display "DOUBLE"
			-- instead of say "REAL_64" if it is mapped this way.)

	integer_class: ET_CLASS
			-- Class "INTEGER"

	integer_ref_class: ET_CLASS
			-- Class "INTEGER_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	integer_type: ET_CLASS_TYPE
			-- Class type "INTEGER"
			-- (To be used instead of `integer_class' when the name of the type
			-- matters, in error messages for example where it will display "INTEGER"
			-- instead of say "INTEGER_32" if it is mapped this way.)

	natural_class: ET_CLASS
			-- Class "NATURAL"

	natural_ref_class: ET_CLASS
			-- Class "NATURAL_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	natural_type: ET_CLASS_TYPE
			-- Class type "NATURAL"
			-- (To be used instead of `natural_class' when the name of the type
			-- matters, in error messages for example where it will display "NATURAL"
			-- instead of say "NATURAL_32" if it is mapped this way.)

	real_class: ET_CLASS
			-- Class "REAL"

	real_ref_class: ET_CLASS
			-- Class "REAL_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	real_type: ET_CLASS_TYPE
			-- Class type "REAL"
			-- (To be used instead of `real_class' when the name of the type
			-- matters, in error messages for example where it will display "REAL"
			-- instead of say "REAL_32" if it is mapped this way.)

	string_class: ET_CLASS
			-- Class "STRING"

	string_type: ET_CLASS_TYPE
			-- Class type "STRING"
			-- (To be used instead of `string_class' when the name of the type
			-- matters, in error messages for example where it will display "STRING"
			-- instead of say "STRING_8" if it is mapped this way.)

	wide_character_class: ET_CLASS
			-- Class "WIDE_CHARACTER"

	wide_character_ref_class: ET_CLASS
			-- Class "WIDE_CHARACTER_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	set_default_class_mapping is
			-- Set sized basic types (STRING, CHARACTER, WIDE_CHARACTER,
			-- INTEGER, NATURAL, REAL, DOUBLE) to be aliased to their default.
		local
			l_name: ET_CLASS_NAME
		do
			mapped_classes.wipe_out
				-- Class "CHARACTER" mapped to "CHARACTER_8".
			l_name := tokens.character_class_name
			character_class := current_system.character_8_class
			mapped_classes.force_last (character_class, l_name)
			create character_type.make (Void, l_name, character_class)
				-- Class "CHARACTER_REF" mapped to "CHARACTER_8_REF".
			l_name := tokens.character_ref_class_name
			character_ref_class := current_system.character_8_ref_class
			mapped_classes.force_last (character_ref_class, l_name)
				-- Class "DOUBLE" mapped to "REAL_64".
			l_name := tokens.double_class_name
			double_class := current_system.real_64_class
			mapped_classes.force_last (double_class, l_name)
			create double_type.make (Void, l_name, double_class)
				-- Class "DOUBLE_REF" mapped to "REAL_64_REF".
			l_name := tokens.double_ref_class_name
			double_ref_class := current_system.real_64_ref_class
			mapped_classes.force_last (double_ref_class, l_name)
				-- Class "INTEGER" mapped to "INTEGER_32".
			l_name := tokens.integer_class_name
			integer_class := current_system.integer_32_class
			mapped_classes.force_last (integer_class, l_name)
			create integer_type.make (Void, l_name, integer_class)
				-- Class "INTEGER_REF" mapped to "INTEGER_32_REF".
			l_name := tokens.integer_ref_class_name
			integer_ref_class := current_system.integer_32_ref_class
			mapped_classes.force_last (integer_ref_class, l_name)
				-- Class "NATURAL" mapped to "NATURAL_32".
			l_name := tokens.natural_class_name
			natural_class := current_system.natural_32_class
			mapped_classes.force_last (natural_class, l_name)
			create natural_type.make (Void, l_name, natural_class)
				-- Class "NATURAL_REF" mapped to "NATURAL_32_ref".
			l_name := tokens.natural_ref_class_name
			natural_ref_class := current_system.natural_32_ref_class
			mapped_classes.force_last (natural_ref_class, l_name)
				-- Class "REAL" mapped to "REAL_32".
			l_name := tokens.real_class_name
			real_class := current_system.real_32_class
			mapped_classes.force_last (real_class, l_name)
			create real_type.make (Void, l_name, real_class)
				-- Class "REAL_REF" mapped to "REAL_32_REF".
			l_name := tokens.real_ref_class_name
			real_ref_class := current_system.real_32_ref_class
			mapped_classes.force_last (real_ref_class, l_name)
				-- Class "STRING" mapped to "STRING_8".
			l_name := tokens.string_class_name
			string_class := current_system.string_8_class
			mapped_classes.force_last (string_class, l_name)
			create string_type.make (Void, l_name, string_class)
				-- Class "WIDE_CHARACTER" mapped to "CHARACTER_32".
			l_name := tokens.wide_character_class_name
			wide_character_class := current_system.character_32_class
			mapped_classes.force_last (wide_character_class, l_name)
				-- Class "WIDE_CHARACTER_REF" mapped to "CHARACTER_32_REF".
			l_name := tokens.wide_character_ref_class_name
			wide_character_ref_class := current_system.character_32_ref_class
			mapped_classes.force_last (wide_character_ref_class, l_name)
		end

feature -- Iteration

	classes_do_local (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]) is
			-- Apply `an_action' on all classes declared locally in current universe.
		require
			an_action_not_void: an_action /= Void
		do
			classes.do_if (an_action, agent {ET_CLASS}.is_in_universe (Current))
		end

	classes_do_if_local (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN]) is
			-- Apply `an_action' on all classes declared locally in current universe
			-- that satisfy `a_test'.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
		do
			l_cursor := classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.universe = Current then
					if a_test.item ([l_class]) then
						an_action.call ([l_class])
					end
				end
				l_cursor.forth
			end
		end

	classes_do_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]) is
			-- Apply `an_action' on all classes declared locally in current universe
			-- as well as on the classes that are declared in the universes it depends
			-- on recursively.
		require
			an_action_not_void: an_action /= Void
		do
			universes_do_recursive (agent {ET_UNIVERSE}.classes_do_local (an_action))
		end

	classes_do_if_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN]) is
			-- Apply `an_action' on all classes that satisfy `a_test', declared
			-- locally in current universe as well as on the classes that are
			-- declared in the universes it depends on recursively.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			universes_do_recursive (agent {ET_UNIVERSE}.classes_do_if_local (an_action, a_test))
		end

	universes_do_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]) is
			-- Apply `an_action' on current universe and recursively on
			-- the universes it depends on.
		require
			an_action_not_void: an_action /= Void
		local
			l_visited: DS_HASH_SET [ET_UNIVERSE]
		do
			create l_visited.make (10)
			add_universe_recursive (l_visited)
			l_visited.do_all (an_action)
		end

feature -- Relations

	add_universe_recursive (a_visited: DS_HASH_SET [ET_UNIVERSE]) is
			-- Add current universe to `a_visited' and
			-- recursively the universes it depends on.
		require
			a_visited_not_void: a_visited /= Void
		do
			if not a_visited.has (Current) then
				a_visited.force_last (Current)
			end
		end

feature -- Parsing

	is_preparsed: BOOLEAN
			-- Have the classes declared locally in current universe already
			-- been preparsed? This means that we already have a mapping between
			-- class names and their filenames, and that `classes' has been
			-- populated, even if the classes have not been parsed yet.

	preparse is
			-- Build a mapping between class names and their filenames and
			-- populate `classes' (both with classes declared locally and
			-- exported by other universes which have themselves been preparsed
			-- recursively during this call), even if the classes have not been
			-- parsed yet. If current universe had already been reparsed,
			-- then rebuild the mapping between class names and filenames:
			-- modified classes are reset and left unparsed and new classes
			-- are added to `classes', but are not parsed.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		do
			preparse_recursive
		ensure
			preparsed: is_preparsed
		end

	preparse_local is
			-- Build a mapping between class names and their filenames and
			-- populate `classes' (both with classes declared locally and
			-- exported by other universes which are assumed to have been
			-- preparsed before this call), even if the classes have not been
			-- parsed yet. If current universe had already been reparsed,
			-- then rebuild the mapping between class names and filenames:
			-- modified classes are reset and left unparsed and new classes
			-- are added to `classes', but are not parsed.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		do
			classes_modified := False
			classes_added := False
			is_preparsed := True
		ensure
			preparsed: is_preparsed
		end

	preparse_recursive is
			-- Build a mapping between class names and their filenames and
			-- populate `classes' (both with classes declared locally and
			-- exported by other universes which have themselves been preparsed
			-- recursively during this call), even if the classes have not been
			-- parsed yet. If current universe had already been reparsed,
			-- then rebuild the mapping between class names and filenames:
			-- modified classes are reset and left unparsed and new classes
			-- are added to `classes', but are not parsed.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		do
			preparse_local
		ensure
			preparsed: is_preparsed
		end

	parse_all is
			-- Parse all classes declared locally in the current universe,
			-- and recursively those that are declared in universes it
			-- depends on. There is not need to call one of the preparse
			-- routines beforehand since the current routine will traverse
			-- all clusters and parse all Eiffel files anyway. The mapping
			-- between class names and their filenames will be done during
			-- this process and `classes' will be populated (both with classes
			-- declared locally and those exported by other universes which
			-- have themselves been parsed recursively during this call).
			-- If current universe had already been preparsed, then rebuild
			-- the mapping between class names and filenames and reparse
			-- the classes that have been modified or were not parsed yet.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		do
			parse_all_recursive
		ensure
			preparsed: is_preparsed
		end

	parse_all_local is
			-- Parse all classes declared locally in the current universe.
			-- There is not need to call one of the preparse routines
			-- beforehand since the current routine will traverse all
			-- clusters and parse all Eiffel files anyway. The mapping
			-- between class names and their filenames will be done during
			-- this process and `classes' will be populated (both with classes
			-- declared locally and those exported by other universes which
			-- are assumed to have been preparsed before this call).
			-- If current universe had already been preparsed, then rebuild
			-- the mapping between class names and filenames and reparse
			-- the classes that have been modified or were not parsed yet.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		do
			classes_modified := False
			classes_added := False
			is_preparsed := True
		ensure
			preparsed: is_preparsed
		end

	parse_all_recursive is
			-- Parse all classes declared locally in the current universe,
			-- and recursively those that are declared in universes it
			-- depends on. There is not need to call one of the preparse
			-- routines beforehand since the current routine will traverse
			-- all clusters and parse all Eiffel files anyway. The mapping
			-- between class names and their filenames will be done during
			-- this process and `classes' will be populated (both with classes
			-- declared locally and those exported by other universes which
			-- have themselves been parsed recursively during this call).
			-- If current universe had already been preparsed, then rebuild
			-- the mapping between class names and filenames and reparse
			-- the classes that have been modified or were not parsed yet.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		do
			parse_all_local
		ensure
			preparsed: is_preparsed
		end

feature {ET_ADAPTED_UNIVERSE} -- Parsing

	classes_modified: BOOLEAN
			-- Has a class (declared locally or in a universe that the current
			-- universe recursively depends on) been modified or removed?
			-- This would require classes from the current universe and from
			-- universes that depends on it to be reprocessed accordingly?

	classes_added: BOOLEAN
			-- Has a locally declared class been added to current universe?
			-- It could conflict with a class declared in a universe that
			-- depends on it.

feature {ET_EIFFEL_PREPARSER_SKELETON, ET_EIFFEL_PARSER_SKELETON, ET_ADAPTED_UNIVERSE} -- Parsing

	set_classes_modified (b: BOOLEAN) is
			-- Set `classes_modified' to `b'.
		do
			classes_modified := b
		ensure
			classes_modified_set: classes_modified = b
		end

	set_classes_added (b: BOOLEAN) is
			-- Set `classes_added' to `b'.
		do
			classes_added := b
		ensure
			classes_added_set: classes_added = b
		end

feature {NONE} -- Parsing

	reset_modified_classes is
			-- Take care of modified and possibly removed classes (either their
			-- old files do not exist anymore, or they have been modified and
			-- may contain another class) so that they will be (pre)parsed again.
			-- Only classes declared locally in current universe are taken into account.
			-- Note that if a file contains two classes and is modified between
			-- the time we check the first class and the second class then the
			-- re(pre)parse will give inconsistent results and will need to be
			-- rerun again.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' will be set to True if modified or removed
			-- classes have been found. (Do not touch `classes_modified' otherwise.)
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class, l_class1, l_class2: ET_CLASS
			l_time_stamp: INTEGER
			l_cluster: ET_CLUSTER
			l_override_mode: BOOLEAN
			l_readonly_mode: BOOLEAN
			l_shallow_mode: BOOLEAN
		do
			classes_modified := False
			l_override_mode := current_system.preparse_override_mode
			l_readonly_mode := current_system.preparse_readonly_mode
			l_shallow_mode := current_system.preparse_shallow_mode
			l_cursor := classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
					--
					-- Start to process the overridden classes.
					--
				from
					l_class1 := l_class
					l_class2 := l_class1.overridden_class
				until
					l_class2 = Void
				loop
					if l_class2.is_preparsed then
						if l_class2.is_in_cluster then
							l_cluster := l_class2.group.cluster
							if l_override_mode and then not l_cluster.is_override then
									-- This class does not belong to an override cluster.
									-- Just skip it.
								l_class1 := l_class2
								l_class2 := l_class1.overridden_class
							elseif not l_readonly_mode and then l_cluster.is_read_only then
									-- This class belongs to an read-only cluster (i.e. a cluster
									-- which is not traversed again during incremental compilation).
									-- Just skip this class.
								l_class1 := l_class2
								l_class2 := l_class1.overridden_class
							elseif l_cluster.is_abstract then
									-- The class belongs to a cluster which is marked as abstract.
									-- This means that the class of this cluster are ignored.
									-- So we have to get rid of this class.
								l_class2 := l_class2.overridden_class
								l_class1.set_overridden_class (l_class2)
							elseif not l_shallow_mode or else l_class2.is_parsed then
									-- With the "shallow" algorithm the time-stamp is only set when
									-- parsing the class. Hence the test above.
								l_time_stamp := l_class2.time_stamp
								if l_time_stamp < 0 or else file_system.file_time_stamp (l_class2.filename) /= l_time_stamp then
										-- The time-stamp of the file has changed or was never recorded.
										-- The file may have been modified or removed. Get rid of this
										-- class so that the (pre-)parser will look for its content again.
									l_class2 := l_class2.overridden_class
									l_class1.set_overridden_class (l_class2)
								else
										-- The time-stamp of tje file has not changed.
										-- Just skip this class.
									l_class1 := l_class2
									l_class2 := l_class1.overridden_class
								end
							elseif l_shallow_mode then
									-- The class is not marked as parsed. It has only been
									-- preparsed using the "shallow" algorithm (i.e. the
									-- file is named "classname.e").
								if not file_system.file_exists (l_class2.filename) then
										-- The file does not exist anymore.
										-- So we have to get rid of this class.
									l_class2 := l_class2.overridden_class
									l_class1.set_overridden_class (l_class2)
								else
										-- The file still exists.
										-- Just skip this class.
									l_class1 := l_class2
									l_class2 := l_class1.overridden_class
								end
							end
						elseif l_class2.is_in_dotnet_assembly then
								-- This class belongs to a .NET assembly.
								-- Just skip it.
							l_class1 := l_class2
							l_class2 := l_class1.overridden_class
						else
								-- This class does not belong to a cluster.
								-- Just skip it.
							l_class1 := l_class2
							l_class2 := l_class1.overridden_class
						end
					elseif l_override_mode then
							-- This class is not preparsed and hence not in an
							-- override cluster. Just skip it.
						l_class1 := l_class2
						l_class2 := l_class1.overridden_class
					else
							-- This class is not preparsed. We can just
							-- get rid of it since it belongs to no group.
						l_class2 := l_class2.overridden_class
						l_class1.set_overridden_class (l_class2)
					end
				end
					--
					-- Now take care of the master class.
					--
				if l_class.is_preparsed then
					if l_class.is_in_cluster then
						l_cluster := l_class.group.cluster
						if l_override_mode and then not l_cluster.is_override then
							-- This class does not belong to an override cluster.
							-- Just skip it.
						elseif not l_readonly_mode and then l_cluster.is_read_only then
							-- This class belongs to an read-only cluster (i.e. a cluster
							-- which is not traversed again during incremental compilation).
							-- Just skip this class.
						elseif l_cluster.is_abstract then
								-- The class belongs to a cluster which is marked as abstract.
								-- This means that the class of this cluster are ignored.
								-- So we can get rid of this class if it overrides other
								-- classes. Otherwise we will mark it as not preparsed.
							set_classes_modified (True)
							l_class2 := l_class.overridden_class
							if l_class2 /= Void then
								l_class2.reset_after_parsed
								l_class.copy (l_class2)
							else
								l_class.reset
							end
						elseif not l_shallow_mode or else l_class.is_parsed then
								-- With the "shallow" algorithm the time-stamp is only set when
								-- parsing the class. Hence the test above.
							l_time_stamp := l_class.time_stamp
							if l_time_stamp < 0 or else file_system.file_time_stamp (l_class.filename) /= l_time_stamp then
									-- The time-stamp of the file has changed or was never recorded.
									-- The file may have been modified or removed. Get rid of this
									-- class if it overrides other class, or otherwise mark it as
									-- not preparsed. That way the (pre-)parser will look for its
									-- content again.
								set_classes_modified (True)
								l_class2 := l_class.overridden_class
								if l_class2 /= Void then
									l_class2.reset_after_parsed
									l_class.copy (l_class2)
								else
									l_class.reset
								end
							end
						elseif l_shallow_mode then
								-- The class is not marked as parsed. It has only been
								-- preparsed using the "shallow" algorithm (i.e. the
								-- file is named "classname.e").
							if not file_system.file_exists (l_class.filename) then
									-- The file does not exist anymore. Get rid of this
									-- class if it overrides other class, or otherwise mark it as
									-- not preparsed. That way the (pre-)parser will look for its
									-- content again.
								set_classes_modified (True)
								l_class2 := l_class.overridden_class
								if l_class2 /= Void then
									l_class2.reset_after_parsed
									l_class.copy (l_class2)
								else
									l_class.reset
								end
							end
						end
					elseif l_class.is_in_dotnet_assembly then
						-- This class belongs to a .NET assembly.
						-- Just skip it.
					else
						-- This class does not belong to a cluster.
						-- Just skip it.
					end
				elseif l_override_mode then
						-- This class is not preparsed and hence not in an
						-- override cluster. Just skip it.
					if l_class.is_parsed then
							-- When reporting VTCT errors on a class, `is_parsed'
							-- is set to True even if it was not preparsed
							-- (and hence not actually parsed).
						l_class.reset_parsed
					end
				else
						-- This class is not preparsed. We can get rid of it if it
						-- overrides other classes since it belongs to no group.
						-- Otherwise we will let it marked as not preparsed.
					l_class2 := l_class.overridden_class
					if l_class2 /= Void then
						set_classes_modified (True)
						l_class2.reset_after_parsed
						l_class.copy (l_class2)
					elseif l_class.is_parsed then
							-- When reporting VTCT errors on a class, `is_parsed'
							-- is set to True even if it was not preparsed
							-- (and hence not actually parsed).
						set_classes_modified (True)
						l_class.reset_parsed
					end
				end
				l_cursor.forth
			end
		end

feature {NONE} -- Constants

	initial_classes_in_group_capacity: INTEGER is
			-- Initial capacity for `classes_in_group'
		once
			Result := 20
		ensure
			capacity_positive: Result > 0
		end

	mappable_class_count: INTEGER is 13
			-- Number of mappable classes
			-- (STRING, CHARATER, WIDE_CHARACTER, INTEGER, NATURAL, REAL, DOUBLE,
			-- CHARACTER_REF, WIDE_CHARACTER_REF, INTEGER_REF, NATURAL_REF, REAL_REF, DOUBLE_REF)

invariant

	current_system_not_void: current_system /= Void
	classes_not_void: classes /= Void
	no_void_class: not classes.has_item (Void)
		-- Class mapping.
	mapped_classes_not_void: mapped_classes /= Void
	no_void_mapped_class: not mapped_classes.has_item (Void)
	character_class_not_void: character_class /= Void
	character_ref_class_not_void: character_ref_class /= Void
	character_type_not_void: character_type /= Void
	double_class_not_void: double_class /= Void
	double_ref_class_not_void: double_ref_class /= Void
	double_type_not_void: double_type /= Void
	integer_class_not_void: integer_class /= Void
	integer_ref_class_not_void: integer_ref_class /= Void
	integer_type_not_void: integer_type /= Void
	natural_class_not_void: natural_class /= Void
	natural_ref_class_not_void: natural_ref_class /= Void
	natural_type_not_void: natural_type /= Void
	real_class_not_void: real_class /= Void
	real_ref_class_not_void: real_ref_class /= Void
	real_type_not_void: real_type /= Void
	string_class_not_void: string_class /= Void
	string_type_not_void: string_type /= Void
	wide_character_class_not_void: wide_character_class /= Void
	wide_character_ref_class_not_void: wide_character_ref_class /= Void

end
