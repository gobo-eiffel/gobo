note

	description:

		"Eiffel classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2025, Eric Bezault and others"
	license: "MIT License"

class ET_CLASS

inherit

	ET_NAMED_CLASS
		undefine
			copy, is_equal
		redefine
			name,
			hash_code
		end

	ET_CLASS_TYPE
		rename
			make as make_type,
			reset as reset_type,
			type_mark as class_mark,
			actual_parameters as formal_parameters,
			actual_parameter_count as formal_parameter_count
		undefine
			upper_name, lower_name
		redefine
			name,
			class_mark, process,
			formal_parameters,
			resolve_unfolded_tuple_actual_parameters_1,
			resolve_unfolded_tuple_actual_parameters_2,
			reset_type,
			is_expanded, is_separate,
			is_attached,
			first_leaf, last_leaf,
			position, append_to_string,
			is_named_type, is_valid_context,
			debug_output, copy, is_equal,
			append_unaliased_to_string,
			append_canonical_to_string,
			append_runtime_name_to_string,
			named_query,
			named_procedure,
			add_overloaded_queries,
			add_overloaded_procedures,
			adapted_class_base_type_index_of_label
		end

	ET_SHARED_CLASS_CODES
		export
			{NONE} all
		undefine
			copy, is_equal
		end

	HASHABLE
		undefine
			copy, is_equal
		end

create

	make, make_unknown, make_root

feature {NONE} -- Initialization

	make (a_name: like name)
			-- Create a new class named `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			id := 0
			ancestors := tokens.empty_ancestors
			conforming_ancestors := tokens.empty_ancestors
			queries := tokens.empty_queries
			procedures := tokens.empty_procedures
			class_keyword := tokens.class_keyword
			end_keyword := tokens.end_keyword
			group := tokens.unknown_group
			create status_mutex.make
			create processing_mutex.make
			create formal_parameter_types_mutex.make
			named_base_class := Current
			time_stamp := no_time_stamp
			class_code := class_codes.class_code (a_name)
			tuple_actual_parameters_unfolded_1 := True
			tuple_actual_parameters_unfolded_2 := True
		ensure
			name_set: name = a_name
		end

	make_unknown
			-- Create a new "*UNKNOWN*" class.
		do
			make (tokens.unknown_class_name)
		end

	make_root (a_system: ET_SYSTEM)
			-- Create a new "*ROOT*" class for system `a_system'.
		require
			a_system_not_void: a_system /= Void
		do
			make (tokens.root_class_name)
			create {ET_ROOT_GROUP} group.make (a_system)
		end

feature -- Initialization

	reset
			-- Reset current class as it was when it was created
			-- (i.e. before it was preparsed or parsed).
		do
			reset_implementation_checked
			reset_interface_checked
			reset_features_flattened
			reset_ancestors_built
			reset_parsed
			reset_preparsed
			index := 0
			unprotected_is_marked := False
		ensure
			same_name: name = old name
			same_id: id = old id
		end

	reset_after_preparsed
			-- Reset current class as it was just after it was last preparsed.
		do
			reset_implementation_checked
			reset_interface_checked
			reset_features_flattened
			reset_ancestors_built
			reset_parsed
		ensure
			same_name: name = old name
			same_id: id = old id
			same_preparsed: is_preparsed = old is_preparsed
			not_parsed: not is_parsed
			ancestors_not_built: not ancestors_built
			features_not_flattened: not features_flattened
			interface_not_checked: not interface_checked
			implementation_not_checked: not implementation_checked
		end

	reset_after_parsed
			-- Reset current class as it was just after it was last parsed.
			-- Do nothing if not parsed.
		do
			reset_implementation_checked
			reset_interface_checked
			reset_features_flattened
			reset_ancestors_built
			queries.reset
			procedures.reset
			if attached formal_parameters as l_formal_parameters then
				l_formal_parameters.reset
			end
			if attached parent_clauses as l_parent_clauses then
				l_parent_clauses.reset
			end
			if attached invariants as l_invariants then
				l_invariants.reset
			end
			if attached creators as l_creators then
				l_creators.reset
			end
			if attached convert_features as l_convert_features then
				l_convert_features.reset
			end
		ensure
			same_name: name = old name
			same_id: id = old id
			same_preparsed: is_preparsed = old is_preparsed
			same_parsed: is_parsed = old is_parsed
			same_syntax_error: has_syntax_error = old has_syntax_error
			ancestors_not_built: not ancestors_built
			features_not_flattened: not features_flattened
			interface_not_checked: not interface_checked
			implementation_not_checked: not implementation_checked
		end

	reset_after_ancestors_built
			-- Reset current class as it was just after its ancestors were last built.
			-- Do nothing if ancestors not built.
		local
			l_unfolded_tuple_actual_parameters_resolver: detachable ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS_RESOLVER1
			i, nb: INTEGER
			j, nb2: INTEGER
			l_parent_list: ET_PARENT_LIST
		do
			reset_implementation_checked
			reset_interface_checked
			reset_features_flattened
			queries.reset
			procedures.reset
			if attached formal_parameters as l_formal_parameters then
				l_formal_parameters.reset_constraint_renames
				l_formal_parameters.reset_constraint_creation_procedures
				create l_unfolded_tuple_actual_parameters_resolver.make (tokens.null_system_processor)
				nb := l_formal_parameters.count
				from i := 1 until i > nb loop
					if attached l_formal_parameters.formal_parameter (i).constraint as l_constraint then
						nb2 := l_constraint.count
						from j := 1 until j > nb2 loop
							l_unfolded_tuple_actual_parameters_resolver.resolve_type (l_constraint.type_constraint (j).type, Current)
							j := j + 1
						end
					end
					i := i + 1
				end
			end
			if attached parent_clauses as l_parent_clauses then
				l_parent_clauses.reset
				if l_unfolded_tuple_actual_parameters_resolver = Void then
					create l_unfolded_tuple_actual_parameters_resolver.make (tokens.null_system_processor)
				end
				nb := l_parent_clauses.count
				from i := 1 until i > nb loop
					l_parent_list := l_parent_clauses.item (i)
					nb2 := l_parent_list.count
					from j := 1 until j > nb2 loop
						l_unfolded_tuple_actual_parameters_resolver.resolve_type (l_parent_list.parent (j).type, Current)
						j := j + 1
					end
					i := i + 1
				end
			end
			if attached invariants as l_invariants then
				l_invariants.reset
			end
			if attached creators as l_creators then
				l_creators.reset
			end
			if attached convert_features as l_convert_features then
				l_convert_features.reset
			end
		ensure
			same_name: name = old name
			same_id: id = old id
			same_preparsed: is_preparsed = old is_preparsed
			same_parsed: is_parsed = old is_parsed
			same_syntax_error: has_syntax_error = old has_syntax_error
			same_ancestors_built: ancestors_built = old ancestors_built
			same_ancestors_error: has_ancestors_error = old has_ancestors_error
			features_not_flattened: not features_flattened
			interface_not_checked: not interface_checked
			implementation_not_checked: not implementation_checked
		end

	reset_after_features_flattened
			-- Reset current class as it was just after its features were last flattened.
			-- Do nothing if features not flattened.
		do
			reset_implementation_checked
			reset_interface_checked
			queries.reset_after_features_flattened
			procedures.reset_after_features_flattened
			if attached formal_parameters as l_formal_parameters then
				l_formal_parameters.reset_constraint_renames
				l_formal_parameters.reset_constraint_creation_procedures
			end
			if attached invariants as l_invariants then
				l_invariants.reset
			end
		ensure
			same_name: name = old name
			same_id: id = old id
			same_preparsed: is_preparsed = old is_preparsed
			same_parsed: is_parsed = old is_parsed
			same_syntax_error: has_syntax_error = old has_syntax_error
			same_ancestors_built: ancestors_built = old ancestors_built
			same_ancestors_error: has_ancestors_error = old has_ancestors_error
			same_features_flattened: features_flattened = old features_flattened
			same_flattening_error: has_flattening_error = old has_flattening_error
			interface_not_checked: not interface_checked
			implementation_not_checked: not implementation_checked
		end

	reset_after_interface_checked
			-- Reset current class as it was just after its interface was last checked.
			-- Do nothing if interface not checked.
		do
			reset_implementation_checked
			queries.reset_after_interface_checked
			procedures.reset_after_interface_checked
			if attached invariants as l_invariants then
				l_invariants.reset
			end
		ensure
			same_name: name = old name
			same_id: id = old id
			same_preparsed: is_preparsed = old is_preparsed
			same_parsed: is_parsed = old is_parsed
			same_syntax_error: has_syntax_error = old has_syntax_error
			same_ancestors_built: ancestors_built = old ancestors_built
			same_ancestors_error: has_ancestors_error = old has_ancestors_error
			same_features_flattened: features_flattened = old features_flattened
			same_flattening_error: has_flattening_error = old has_flattening_error
			same_interface_checked: interface_checked = old interface_checked
			same_interface_erorr: has_interface_error = old has_interface_error
			implementation_not_checked: not implementation_checked
		end

	reset_errors
			-- Reset current class as it was before the first error was reported.
			-- Errors will be reported again if current class is processed again.
		do
			if has_syntax_error then
				reset_implementation_checked
				reset_interface_checked
				reset_features_flattened
				reset_ancestors_built
				reset_parsed
			elseif has_ancestors_error then
				reset_implementation_checked
				reset_interface_checked
				reset_features_flattened
				reset_ancestors_built
			elseif has_flattening_error then
				reset_implementation_checked
				reset_interface_checked
				reset_features_flattened
			elseif has_interface_error then
				reset_implementation_checked
				reset_interface_checked
			elseif has_implementation_error then
				reset_implementation_checked
			end
		end

	reset_after_parsed_and_errors
			-- Reset current class as it was just after it was last parsed, or
			-- as it was when it was last preparsed if there was a syntax error
			-- (so that the syntax error will be reported again if the current
			-- class is processed again).
			-- Do nothing if not parsed.
		do
			if has_syntax_error then
				reset_after_preparsed
			else
				reset_after_parsed
			end
		end

	reset_type
			-- Reset type as it was just after it was last parsed.
		do
			if attached formal_parameters as l_parameters then
				l_parameters.reset
			end
		end

feature -- Status report

	is_named_type: BOOLEAN = True
			-- Is current type only made up of named types?

	is_none: BOOLEAN
			-- Is current class a "NONE" class?
		do
			Result := group.is_none
		ensure
			definition: Result = group.is_none
		end

	is_basic: BOOLEAN
			-- Is current class one of "BOOLEAN", "CHARACTER_8",
			-- "CHARACTER_32", "INTEGER_8", "INTEGER_16", "INTEGER_32",
			-- "INTEGER_64", "NATURAL_8", "NATURAL_16", "NATURAL_32",
			-- "NATURAL_64", "POINTER", "REAL_32", "REAL_64"?
		do
			Result := class_codes.is_basic (class_code)
		end

	is_any_class: BOOLEAN
			-- Is current class the "ANY" class?
		do
			Result := class_code = class_codes.any_class_code
		end

	is_array_class: BOOLEAN
			-- Is current class the "ARRAY" class?
		do
			Result := class_code = class_codes.array_class_code
		end

	is_boolean_class: BOOLEAN
			-- Is current class the "BOOLEAN" class?
		do
			Result := class_code = class_codes.boolean_class_code
		end

	is_character_n_class: BOOLEAN
			-- Is current class one of "CHARACTER_8", "CHARACTER_32"?
		do
			Result := class_codes.is_character_n (class_code)
		end

	is_character_8_class: BOOLEAN
			-- Is current class the "CHARACTER_8" class?
		do
			Result := class_code = class_codes.character_8_class_code
		end

	is_character_32_class: BOOLEAN
			-- Is current class the "CHARACTER_32" class?
		do
			Result := class_code = class_codes.character_32_class_code
		end

	is_integer_n_class: BOOLEAN
			-- Is current class one of "INTEGER_8", "INTEGER_16",
			-- "INTEGER_32", "INTEGER_64", "NATURAL_8", "NATURAL_16",
			-- "NATURAL_32", "NATURAL_64"?
		do
			Result := class_codes.is_integer_n (class_code)
		end

	is_integer_8_class: BOOLEAN
			-- Is current class the "INTEGER_8" class?
		do
			Result := class_code = class_codes.integer_8_class_code
		end

	is_integer_16_class: BOOLEAN
			-- Is current class the "INTEGER_16" class?
		do
			Result := class_code = class_codes.integer_16_class_code
		end

	is_integer_32_class: BOOLEAN
			-- Is current class the "INTEGER_32" class?
		do
			Result := class_code = class_codes.integer_32_class_code
		end

	is_integer_64_class: BOOLEAN
			-- Is current class the "INTEGER_64" class?
		do
			Result := class_code = class_codes.integer_64_class_code
		end

	is_natural_8_class: BOOLEAN
			-- Is current class the "NATURAL_8" class?
		do
			Result := class_code = class_codes.natural_8_class_code
		end

	is_natural_16_class: BOOLEAN
			-- Is current class the "NATURAL_16" class?
		do
			Result := class_code = class_codes.natural_16_class_code
		end

	is_natural_32_class: BOOLEAN
			-- Is current class the "NATURAL_32" class?
		do
			Result := class_code = class_codes.natural_32_class_code
		end

	is_natural_64_class: BOOLEAN
			-- Is current class the "NATURAL_64" class?
		do
			Result := class_code = class_codes.natural_64_class_code
		end

	is_pointer_class: BOOLEAN
			-- Is current class the "POINTER" class?
		do
			Result := class_code = class_codes.pointer_class_code
		end

	is_disposable_class: BOOLEAN
			-- Is current class the "DISPOSABLE" class?
		do
			Result := class_code = class_codes.disposable_class_code
		end

	is_real_n_class: BOOLEAN
			-- Is current class one of "REAL_32", "REAL_64"?
		do
			Result := class_codes.is_real_n (class_code)
		end

	is_real_32_class: BOOLEAN
			-- Is current class the "REAL_32" class?
		do
			Result := class_code = class_codes.real_32_class_code
		end

	is_real_64_class: BOOLEAN
			-- Is current class the "REAL_64" class?
		do
			Result := class_code = class_codes.real_64_class_code
		end

	is_function_class: BOOLEAN
			-- Is current class the "FUNCTION" class?
		do
			Result := class_code = class_codes.function_class_code
		end

	is_iterable_class: BOOLEAN
			-- Is current class the "ITERABLE" class?
		do
			Result := class_code = class_codes.iterable_class_code
		end

	is_iteration_cursor_class: BOOLEAN
			-- Is current class the "ITERATION_CURSOR" class?
		do
			Result := class_code = class_codes.iteration_cursor_class_code
		end

	is_predicate_class: BOOLEAN
			-- Is current class the "PREDICATE" class?
		do
			Result := class_code = class_codes.predicate_class_code
		end

	is_procedure_class: BOOLEAN
			-- Is current class the "PROCEDURE" class?
		do
			Result := class_code = class_codes.procedure_class_code
		end

	is_routine_class: BOOLEAN
			-- Is current class the "ROUTINE" class?
		do
			Result := class_code = class_codes.routine_class_code
		end

	is_special_class: BOOLEAN
			-- Is current class the "SPECIAL" class?
		do
			Result := class_code = class_codes.special_class_code
		end

	is_system_object_class: BOOLEAN
			-- Is current class the "SYSTEM_OBJECT" class?
		do
			Result := class_code = class_codes.system_object_class_code
		end

	is_tuple_class: BOOLEAN
			-- Is current class the "TUPLE" class?
		do
			Result := class_code = class_codes.tuple_class_code
		end

	is_type_class: BOOLEAN
			-- Is current class the "TYPE" class?
		do
			Result := class_code = class_codes.type_class_code
		end

	is_typed_pointer_class: BOOLEAN
			-- Is current class the "TYPED_POINTER" class?
		do
			Result := class_code = class_codes.typed_pointer_class_code
		end

	is_unknown_class: BOOLEAN
			-- Is current class an "*UNKNOWN*" class?
			-- This class does not conform to any other class,
			-- not even itself.
		do
			Result := group.is_unknown and then name.same_class_name (tokens.unknown_class_name)
		ensure
			definition: Result = (group.is_unknown and then name.same_class_name (tokens.unknown_class_name))
		end

	is_unknown: BOOLEAN
			-- Is current class unknown?
			-- This class does not conform to any other class,
			-- not even itself.
		do
			Result := group.is_unknown
		ensure
			definition: Result = group.is_unknown
		end

	is_root: BOOLEAN
			-- Is current class an "*ROOT*" class?
		do
			Result := name.same_class_name (tokens.root_class_name)
		ensure
			definition: Result = name.same_class_name (tokens.root_class_name)
		end

	is_ignored: BOOLEAN
			-- Should this class not be taken into account when
			-- analyzing the system?

feature -- Status setting

	set_ignored (b: BOOLEAN)
			-- Set `is_ignored' to `b'.
		do
			is_ignored := b
		ensure
			ignored_set: is_ignored = b
		end

	mark_ignored_class
			-- Mark current class as ignored if not already done.
			-- Update its master class accordingly.
		local
			l_master_class: ET_MASTER_CLASS
		do
			if not is_ignored then
				l_master_class := master_class_in_universe
				l_master_class.remove_local_class (Current)
				set_ignored (True)
				reset_after_parsed
				l_master_class.add_last_local_ignored_class (Current)
			end
		end

	unmark_ignored_class
			-- Mark current class as not ignored if not already done.
			-- Update its master class accordingly.
		local
			l_master_class: ET_MASTER_CLASS
		do
			if is_ignored then
				l_master_class := master_class_in_universe
				l_master_class.remove_local_ignored_class (Current)
				reset_after_parsed
				set_ignored (False)
				l_master_class.add_last_local_class (Current)
			end
		end

feature -- Access

	name: ET_CLASS_NAME
			-- Name of class

	obsolete_message: detachable ET_OBSOLETE
			-- Obsolete message

	first_note_clause: detachable ET_NOTE_LIST
			-- Note clause at the beginning of the class

	second_note_clause: detachable ET_NOTE_LIST
			-- Note clause at the end of the class

	class_keyword: ET_KEYWORD
			-- 'class' keyword

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	id: INTEGER
			-- Class ID

	index: INTEGER
			-- Index of class in enclosing Eiffel system;
			-- Used to get dynamic information about this class.

	hash_code: INTEGER
			-- Hash code value
		do
			Result := id
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if attached first_note_clause as l_first_note_clause then
				Result := l_first_note_clause.position
			elseif attached class_mark as l_class_mark then
				Result := l_class_mark.position
			else
				Result := class_keyword.position
			end
		end

	leading_break: detachable ET_BREAK
			-- Break that appears at the top of the file, before
			-- the class declaration

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if attached first_note_clause as l_first_note_clause then
				Result := l_first_note_clause.first_leaf
			elseif attached class_mark as l_class_mark then
				Result := l_class_mark
			else
				Result := class_keyword
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

	data: detachable ANY
			-- Arbitrary user data

feature -- Setting

	set_id (an_id: INTEGER)
			-- Set `id' to `an_id'.
		require
			an_id_positive: an_id > 0
		do
			id := an_id
		ensure
			id_set: id = an_id
		end

	set_obsolete_message (an_obsolete_message: like obsolete_message)
			-- Set `obsolete_message' to `an_obsolete_message'.
		do
			obsolete_message := an_obsolete_message
		ensure
			obsolete_message_set: obsolete_message = an_obsolete_message
		end

	set_first_note_clause (a_note_clause: like first_note_clause)
			-- Set `first_note_clause' to `a_note_clause'
		do
			first_note_clause := a_note_clause
		ensure
			first_note_clause_set: first_note_clause = a_note_clause
		end

	set_second_note_clause (a_note_clause: like second_note_clause)
			-- Set `second_note_clause' to `a_note_clause'
		do
			second_note_clause := a_note_clause
		ensure
			second_note_clause_set: second_note_clause = a_note_clause
		end

	set_class_keyword (a_class: like class_keyword)
			-- Set `class_keyword' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			class_keyword := a_class
		ensure
			class_keyword_set: class_keyword = a_class
		end

	set_end_keyword (an_end: like end_keyword)
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

	set_leading_break (a_break: like leading_break)
			-- Set `leading_break' to `a_break'.
		do
			leading_break := a_break
		ensure
			leading_break_set: leading_break = a_break
		end

	set_index (i: INTEGER)
			-- Set `index' to `i'.
		require
			i_nonnegative: i >= 0
		do
			index := i
		ensure
			index_set: index = i
		end

	set_data (a_data: like data)
			-- Set `data' to `a_data'.
		do
			data := a_data
		ensure
			data_set: data = a_data
		end

feature -- Preparsing

	filename: detachable STRING
			-- Filename

	group: ET_PRIMARY_GROUP
			-- Group (e.g. cluster or .NET assembly) to which current class belongs

	universe: ET_UNIVERSE
			-- Universe to which current class belongs
		do
			Result := group.universe
		end

	time_stamp: INTEGER
			-- Time stamp of the file when it was last parsed

	master_class_in_universe: ET_MASTER_CLASS
			-- Class named `name' in `universe'
			--
			-- Note that the 'actual_class' of the Result might represent
			-- a class other than the current class when there are name clashes.
			-- In that case, the current class is likely to be found in one of
			-- 'first_local_override_class', 'other_local_override_classes',
			-- 'first_local_non_override_class', 'other_local_non_override_classes',
			-- 'first_local_ignored_class' or 'other_local_ignored_classes'
			-- of the Result. See features of class ET_MASTER_CLASS for more details.
		do
			Result := universe.master_class (name)
		ensure
			master_class_in_universe_not_void: Result /= Void
			master_class_in_universe: Result.universe = universe
		end

	master_class_in_system: detachable ET_MASTER_CLASS
			-- Class in `current_system' corresponding to `master_class_in_universe'
			-- if any, Void otherwise
			--
			-- It's either `master_class_in_universe' if `universe' is `current_system'
			-- itself, or it's one of the classes in `current_system' with
			-- `master_class_in_universe' as one of its imported classes.
		local
			l_master_class_in_universe: ET_MASTER_CLASS
			l_other_master_class: ET_MASTER_CLASS
			l_cell: DS_CELL [detachable ET_MASTER_CLASS]
		do
			l_master_class_in_universe := universe.master_class (name)
			if l_master_class_in_universe.universe = current_system then
				Result := l_master_class_in_universe
			else
				create l_cell.make (Void)
				l_master_class_in_universe.overriding_classes_do_if (agent l_cell.put ({ET_MASTER_CLASS}?), agent {ET_MASTER_CLASS}.is_in_universe (current_system))
				if l_cell.item /= Void then
					Result := l_cell.item
				else
					l_other_master_class := current_system.master_class (name)
					if l_other_master_class.has_imported_class (l_master_class_in_universe) then
						Result := l_other_master_class
					else
						current_system.master_classes.do_if (agent l_cell.put ({ET_MASTER_CLASS}?), agent {ET_MASTER_CLASS}.has_imported_class (l_master_class_in_universe))
						Result := l_cell.item
					end
				end
			end
		ensure
			master_class_in_system: Result /= Void implies Result.universe = current_system
		end

	master_class: ET_MASTER_CLASS
			-- `master_class_in_system' if not Void,
			-- `master_class_in_universe' otherwise
		do
			if attached master_class_in_system as l_master_class_in_system then
				Result := l_master_class_in_system
			else
				Result := master_class_in_universe
			end
		ensure
			master_class_not_void: Result /= Void
		end

	actual_class: ET_CLASS
			-- Actual class
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	first_non_override_overridden_class: detachable ET_CLASS
			-- First overridden class that is not in an override group;
			-- Void if no such class
		local
			l_master_class: ET_MASTER_CLASS
		do
			l_master_class := master_class_in_universe
			if l_master_class.actual_class = Current then
				Result := l_master_class.first_local_non_override_class
				if Result = Current and then attached l_master_class.other_local_non_override_classes as l_other_local_non_override_classes and then not l_other_local_non_override_classes.is_empty then
					Result := l_other_local_non_override_classes.first
				end
				if Result = Void then
					if attached l_master_class.first_imported_class as l_imported_class then
						Result := l_imported_class.first_local_non_override_class
					end
				end
			end
		end

	set_filename (a_name: STRING)
			-- Set `filename' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			filename := a_name
		ensure
			filename_set: filename = a_name
		end

	set_group (a_group: like group)
			-- Set `group' to `a_group'.
		require
			a_group_not_void: a_group /= Void
		do
			group := a_group
			a_group.fill_options (Current)
		ensure
			group_set: group = a_group
		end

	set_time_stamp (a_time_stamp: INTEGER)
			-- Set `time_stamp' to `a_time_stamp'.
		do
			time_stamp := a_time_stamp
		ensure
			time_stamp_set: time_stamp = a_time_stamp
		end

	add_by_group (a_classes: DS_HASH_TABLE [DS_ARRAYED_LIST [ET_CLASS], ET_GROUP])
			-- Add current class to `a_classes', indexed by groups.
		require
			a_classes_not_void: a_classes /= Void
		local
			l_class_list: DS_ARRAYED_LIST [ET_CLASS]
		do
			a_classes.search (group)
			if a_classes.found then
				l_class_list := a_classes.found_item
			else
				create l_class_list.make (initial_classes_in_group_capacity)
				a_classes.force_last_new (l_class_list, group)
			end
			l_class_list.force_last (Current)
		end

feature -- Preparsing status

	is_preparsed: BOOLEAN
			-- Has current class been preparsed (i.e. its group is already
			-- known but the class has not necessarily been parsed yet)?
			-- This means that the class is in one the universes making
			-- up the surrounding Eiffel system.
			-- Note that class "NONE" is considered as preparsed even though
			-- it does not have an explicit class text.
		do
			Result := not group.is_unknown
		ensure then
			definition: Result = not group.is_unknown
		end

	is_in_group (a_group: ET_GROUP): BOOLEAN
			-- Has current class been declared in `a_group'?
		require
			a_group_not_void: a_group /= Void
		do
			Result := (group = a_group)
		ensure
			definition: Result = (group = a_group)
		end

	is_in_group_recursive (a_group: ET_GROUP): BOOLEAN
			-- Has current class been declared in `a_group' or
			-- recursively in one of its subgroups?
		require
			a_group_not_void: a_group /= Void
		do
			if group = a_group then
				Result := True
			elseif a_group.universe /= universe then
				Result := False
			elseif ANY_.to_any (a_group) = universe then
				Result := True
			else
				Result := a_group.has_subgroup (group)
			end
		end

	is_in_universe (a_universe: ET_UNIVERSE): BOOLEAN
			-- Has current class been declared in `a_universe'?
		require
			a_universe_not_void: a_universe /= Void
		do
			Result := (universe = a_universe)
		ensure
			definition: Result = (universe = a_universe)
		end

	is_in_cluster: BOOLEAN
			-- Is current class in a cluster?
		do
			Result := (attached filename as l_filename and then not l_filename.is_empty and then group.is_cluster)
		ensure
			is_cluster: Result implies group.is_cluster
			filename_not_empty: Result implies (attached filename as l_filename and then not l_filename.is_empty)
		end

	is_in_dotnet_assembly: BOOLEAN
			-- Is current class in a .NET assembly?
		do
			Result := group.is_dotnet_assembly
		ensure
			is_dotnet_assembly: Result implies group.is_dotnet_assembly
		end

	is_override (a_universe: ET_UNIVERSE): BOOLEAN
			-- Is current class considered as an override class in `a_universe'?
			-- This means that current class has been declared in an override
			-- group and that group is part of `a_universe'.
		do
			Result := is_in_override_group and then universe = a_universe
		end

	is_overridden: BOOLEAN
			-- Is current class overridden by another class?
		do
			Result := (master_class_in_universe.actual_class /= Current)
		ensure
			definition: Result = (master_class_in_universe.actual_class /= Current)
		end

	is_unignorable_overridden: BOOLEAN
			-- Is current class overridden by another class?
			--
			-- Note that this routine does not take into account the ignored status of classes.
		do
			Result := (master_class_in_universe.unignorable_actual_class /= Current)
		ensure
			definition: Result = (master_class_in_universe.unignorable_actual_class /= Current)
		end

	is_overriding: BOOLEAN
			-- Is current class overriding another class?
		local
			l_master_class: ET_MASTER_CLASS
		do
			l_master_class := master_class_in_universe
			Result := l_master_class.actual_class = Current and l_master_class.has_name_clash
		ensure
			definition: Result = (master_class_in_universe.actual_class = Current and master_class_in_universe.has_name_clash)
		end

	is_unignorable_overriding: BOOLEAN
			-- Is current class overriding another class?
			--
			-- Note that this routine does not take into account the ignored status of classes.
		local
			l_master_class: ET_MASTER_CLASS
		do
			l_master_class := master_class_in_universe
			Result := l_master_class.unignorable_actual_class = Current and l_master_class.has_unignorable_name_clash
		ensure
			definition: Result = (master_class_in_universe.unignorable_actual_class = Current and master_class_in_universe.has_unignorable_name_clash)
		end

	is_in_override_group: BOOLEAN
			-- Is current class in an override group?
		do
			Result := group.is_override
		ensure
			is_override: Result implies group.is_override
		end

	is_in_override_cluster: BOOLEAN
			-- Is current class in an override cluster?
		do
			Result := attached filename as l_filename and then not l_filename.is_empty and then group.is_cluster and then group.is_override
		ensure
			is_cluster: Result implies is_in_cluster
			is_override: Result implies is_in_override_group
		end

	reset_preparsed
			-- Set `is_preparsed' to False.
		do
			filename := Void
			set_group (tokens.unknown_group)
			time_stamp := no_time_stamp
			is_interface := False
			has_utf8_bom := False
		ensure
			not_preparsed: not is_preparsed
		end

feature -- Parsing status

	is_parsed: BOOLEAN
			-- Has current class been parsed?
			-- Note that when reporting VTCT errors on a class,
			-- `is_parsed' is set to True even if it was not
			-- preparsed (and hence not actually parsed).
		do
			status_mutex.lock
			Result := unprotected_is_parsed
			status_mutex.unlock
		end

	is_parsed_successfully: BOOLEAN
			-- Has current class been successfully parsed?
		do
			status_mutex.lock
			Result := unprotected_is_parsed and then not unprotected_has_syntax_error
			status_mutex.unlock
		end

	has_syntax_error: BOOLEAN
			-- Has a fatal syntax error been detected?
		do
			status_mutex.lock
			Result := unprotected_has_syntax_error
			status_mutex.unlock
		end

	set_parsed
			-- Set `is_parsed' to True.
		do
			status_mutex.lock
			unprotected_is_parsed := True
			status_mutex.unlock
		ensure
			is_parsed: is_parsed
		end

	set_syntax_error
			-- Set `has_syntax_error' to True.
		do
			status_mutex.lock
			unprotected_is_parsed := True
			unprotected_has_syntax_error := True
			status_mutex.unlock
		ensure
			is_parsed: is_parsed
			syntax_error_set: has_syntax_error
		end

	reset_parsed
			-- Set `is_parsed' to False.
		do
			status_mutex.lock
			unprotected_has_syntax_error := False
			unprotected_is_parsed := False
			class_keyword := tokens.class_keyword
			end_keyword := tokens.end_keyword
			external_keyword := Void
			frozen_keyword := Void
			class_mark := Void
			creators := Void
			convert_features := Void
			feature_clauses := Void
			first_note_clause := Void
			second_note_clause := Void
			formal_parameters := Void
			tuple_constraint_position := 0
			invariants := Void
			obsolete_message := Void
			parent_clauses := Void
			queries := tokens.empty_queries
			procedures := tokens.empty_procedures
			registered_feature_count := 0
			registered_inline_constant_count := 0
			leading_break := Void
			providers := Void
			has_utf8_bom := False
			status_mutex.unlock
		ensure
			not_parsed: not is_parsed
			no_syntax_error: not has_syntax_error
		end

feature {NONE} -- Parsing status

	unprotected_is_parsed: BOOLEAN
			-- Has current class been parsed?
			-- Note that when reporting VTCT errors on a class,
			-- `is_parsed' is set to True even if it was not
			-- preparsed (and hence not actually parsed).
			--
			-- This is not protected by a mutex in case of multi-threading.

	unprotected_has_syntax_error: BOOLEAN
			-- Has a fatal syntax error been detected?
			--
			-- This is not protected by a mutex in case of multi-threading.

feature -- Encoding

	has_utf8_bom: BOOLEAN
			-- Has the byte order mark (BOM) for UTF-8 been found at the
			-- beginning of the class text?

	set_has_utf8_bom (b: BOOLEAN)
			-- Set `has_utf8_bom' to `b'.
		do
			has_utf8_bom := b
		ensure
			has_utf8_bom_set: has_utf8_bom = b
		end

feature -- Assertions

	preconditions_enabled: BOOLEAN
			-- Are preconditions monitored?

	supplier_preconditions_enabled: BOOLEAN
			-- Are supplier preconditions (preconditions in qualified calls) monitored?

	postconditions_enabled: BOOLEAN
			-- Are postconditions monitored?

	invariants_enabled: BOOLEAN
			-- Are invariants monitored?

	check_assertions_enabled: BOOLEAN
			-- Are check assertions monitored?

	loop_assertions_enabled: BOOLEAN
			-- Are loop assertions monitored?

	set_preconditions_enabled (b: BOOLEAN)
			-- Set `preconditions_enabled' to `b'.
		do
			preconditions_enabled := b
		ensure
			preconditions_enabled_set: preconditions_enabled = b
		end

	set_supplier_preconditions_enabled (b: BOOLEAN)
			-- Set `supplier_preconditions_enabled' to `b'.
		do
			supplier_preconditions_enabled := b
		ensure
			supplier_preconditions_enabled_set: supplier_preconditions_enabled = b
		end

	set_postconditions_enabled (b: BOOLEAN)
			-- Set `postconditions_enabled' to `b'.
		do
			postconditions_enabled := b
		ensure
			postconditions_enabled_set: postconditions_enabled = b
		end

	set_invariants_enabled (b: BOOLEAN)
			-- Set `invariants_enabled' to `b'.
		do
			invariants_enabled := b
		ensure
			invariants_enabled_set: invariants_enabled = b
		end

	set_check_assertions_enabled (b: BOOLEAN)
			-- Set `check_assertions_enabled' to `b'.
		do
			check_assertions_enabled := b
		ensure
			check_assertions_enabled_set: check_assertions_enabled = b
		end

	set_loop_assertions_enabled (b: BOOLEAN)
			-- Set `loop_assertions_enabled' to `b'.
		do
			loop_assertions_enabled := b
		ensure
			loop_assertions_enabled_set: loop_assertions_enabled = b
		end

feature -- Class header

	is_deferred: BOOLEAN
			-- Is current class deferred?
			-- A class is deferred if it has been marked as
			-- deferred or if it has deferred features. If
			-- it has deferred features but has not been marked
			-- as deferred then VCCH-1 is violated; if it is
			-- marked as deferred but has no deferred features
			-- then VCCH-2 is violated, although this latter
			-- validity rule has been relaxed in ETL3.
		do
			Result := has_deferred_mark or has_deferred_features
		ensure
			definition: Result = (has_deferred_mark or has_deferred_features)
		end

	is_expanded: BOOLEAN
			-- Is current class expanded?
		do
			Result := has_expanded_mark
		ensure then
			definition: Result = has_expanded_mark
		end

	is_attached: BOOLEAN
			-- Is current class attached?
		do
			if is_expanded then
				Result := True
			elseif attached class_mark as l_class_mark and then l_class_mark.is_attachment_mark then
				Result := l_class_mark.is_attached_mark
			elseif attached universe.implicit_attachment_type_mark as l_type_mark and then l_type_mark.is_attachment_mark then
				Result := l_type_mark.is_attached_mark
			elseif current_system.attachment_type_conformance_mode then
				Result := True
			else
				Result := False
			end
		end

	is_separate: BOOLEAN
			-- Is current class separate?
		do
			Result := has_separate_mark
		ensure then
			definition: Result = has_separate_mark
		end

	is_frozen: BOOLEAN
			-- Is current class frozen?
		do
			Result := has_frozen_mark
		ensure
			definition: Result = has_frozen_mark
		end

	is_external: BOOLEAN
			-- Is current class external?
		do
			Result := has_external_mark
		ensure
			definition: Result = has_external_mark
		end

	is_dotnet: BOOLEAN
			-- Is current class a .NET class?
		do
			Result := is_in_dotnet_assembly
		end

	is_interface: BOOLEAN
			-- Is current class an interface?
			-- (useful for .NET classes)

	set_interface (b: BOOLEAN)
			-- Set `is_interface' to `b'.
		do
			is_interface := b
		ensure
			interface_set: is_interface = b
		end

	has_deferred_features: BOOLEAN
			-- Does current class contain deferred features?

	set_has_deferred_features (b: BOOLEAN)
			-- Set `has_deferred_features' to `b'.
		do
			has_deferred_features := b
		ensure
			has_deferred_features: has_deferred_features = b
		end

	has_deferred_mark: BOOLEAN
			-- Has class been declared as deferred?
		do
			Result := (attached class_mark as l_class_mark and then l_class_mark.is_deferred)
		ensure
			definition: Result = (attached class_mark as l_class_mark and then l_class_mark.is_deferred)
		end

	has_expanded_mark: BOOLEAN
			-- Has class been declared as expanded?
		do
			Result := (attached class_mark as l_class_mark and then l_class_mark.is_expanded)
		ensure
			definition: Result = (attached class_mark as l_class_mark and then l_class_mark.is_expanded)
		end

	has_reference_mark: BOOLEAN
			-- Has class been declared as reference?
		do
			Result := (attached class_mark as l_class_mark and then l_class_mark.is_reference)
		ensure
			definition: Result = (attached class_mark as l_class_mark and then l_class_mark.is_reference)
		end

	has_separate_mark: BOOLEAN
			-- Has class been declared as separate?
		do
			Result := (attached class_mark as l_class_mark and then l_class_mark.is_separate)
		ensure
			definition: Result = (attached class_mark as l_class_mark and then l_class_mark.is_separate)
		end

	has_frozen_mark: BOOLEAN
			-- Has class been declared as frozen?
		do
			Result := frozen_keyword /= Void
		ensure
			definition: Result = (frozen_keyword /= Void)
		end

	has_external_mark: BOOLEAN
			-- Has class been declared as external?
		do
			Result := external_keyword /= Void
		ensure
			definition: Result = (external_keyword /= Void)
		end

	class_mark: detachable ET_CLASS_MARK
			-- 'attached', 'detachable', 'deferred', 'expanded', 'reference' or 'separate' keyword,
			-- or '!' or '?' symbol

	set_class_mark (a_mark: like class_mark)
			-- Set `class_mark' to `a_mark'.
		do
			class_mark := a_mark
		ensure
			class_mark_set: class_mark = a_mark
		end

	frozen_keyword: detachable ET_KEYWORD
			-- 'frozen' keyword

	set_frozen_keyword (a_frozen: like frozen_keyword)
			-- Set `frozen_keyword' to `a_frozen'.
		do
			frozen_keyword := a_frozen
		ensure
			frozen_keyword_set: frozen_keyword = a_frozen
		end

	external_keyword: detachable ET_KEYWORD
			-- 'external' keyword

	set_external_keyword (an_external: like external_keyword)
			-- Set `external_keyword' to `an_external'.
		do
			external_keyword := an_external
		ensure
			external_keyword_set: external_keyword = an_external
		end

feature -- Genericity

	formal_parameters: detachable ET_FORMAL_PARAMETER_LIST
			-- Formal generic parameters

	set_formal_parameters (a_parameters: like formal_parameters)
			-- Set `formal_parameters' to `a_parameters'.
		local
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			formal_parameters := a_parameters
			tuple_constraint_position := 0
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					if attached a_parameters.formal_parameter (i).constraint as l_constraint then
						nb2 := l_constraint.count
						from j := 1 until j > nb2 loop
							if attached {ET_TUPLE_TYPE} l_constraint.type_constraint (j).type then
								if tuple_constraint_position /= 0 then
										-- This is not a single-tuple class: there are more than one
										-- formal parameter with a Tuple type as constraint.
									tuple_constraint_position := 0
									i := nb -- Jump out of the outer loop.
								else
									tuple_constraint_position := i
								end
								j := nb2 -- Jump out of the inner loop.
							end
							j := j + 1
						end
					end
					i := i + 1
				end
			end
		ensure
			formal_parameters_set: formal_parameters = a_parameters
		end

	has_formal_parameter (a_name: ET_IDENTIFIER): BOOLEAN
			-- Is `a_name' a formal generic parameter?
		require
			a_name_not_void: a_name /= Void
		do
			if attached formal_parameters as l_formal_parameters then
				Result := l_formal_parameters.has_formal_parameter (a_name)
			end
		ensure
			is_generic: Result implies is_generic
		end

	formal_parameter (a_name: ET_IDENTIFIER): detachable ET_FORMAL_PARAMETER
			-- Formal generic parameter with name `a_name';
			-- Void if no such formal generic parameter
		require
			a_name_not_void: a_name /= Void
		do
			if attached formal_parameters as l_formal_parameters then
				Result := l_formal_parameters.formal_parameter_by_name (a_name)
			end
		ensure
			has_formal_parameter: has_formal_parameter (a_name) = (Result /= Void)
			same_name: Result /= Void implies Result.name.same_identifier (a_name)
		end

	formal_parameter_type (i: INTEGER): ET_FORMAL_PARAMETER_TYPE
			-- `i'-th formal parameter type
		require
			i_large_enough: i >= 1
		local
			nb: INTEGER
			l_name: ET_IDENTIFIER
			l_formal_parameter_types: like formal_parameter_types
		do
			if attached formal_parameters as l_formal_parameters and then i <= l_formal_parameters.count then
				Result := l_formal_parameters.formal_parameter (i)
			else
				formal_parameter_types_mutex.lock
				l_formal_parameter_types := formal_parameter_types
				if l_formal_parameter_types = Void then
					create l_formal_parameter_types.make (i.max (10))
					formal_parameter_types := l_formal_parameter_types
				end
				nb := l_formal_parameter_types.count
				if i > nb then
					if i > l_formal_parameter_types.capacity then
						l_formal_parameter_types.resize (i)
					end
					from until i = nb loop
						l_formal_parameter_types.put_last (Void)
						nb := nb + 1
					end
				end
				if attached l_formal_parameter_types.item (i) as l_formal_parameter_type then
					Result := l_formal_parameter_type
				else
					create l_name.make ("G" + i.out)
					create Result.make (Void, l_name, i, Current)
					l_formal_parameter_types.replace (Result, i)
				end
				formal_parameter_types_mutex.unlock
			end
		ensure
			formal_parameter_type_not_void: Result /= Void
		end

	tuple_constraint_position: INTEGER
			-- Position of the formal parameter with a Tuple type constraint
			-- where there is exactly one (i.e. when the current class is a
			-- single-tuple class).
			-- Otherwise, 0.

	resolve_unfolded_tuple_actual_parameters_1 (a_universe: ET_UNIVERSE)
			-- First phase of Tuple-type-unfolding in actual parameters of current class type.
			-- Perform syntactical transformations only:
			-- * Resolve cases where the number of actual and formal generic parameters
			--   are different.
			-- * Also resolve the use of obsolete routine types (with an extra
			--   first generic parameter).
		do
				-- Do no unfold formal parameters of classes, only actual parameters of class types.
			tuple_actual_parameters_unfolded_1 := True
			tuple_actual_parameters_unfolded_2 := True
		end

	resolve_unfolded_tuple_actual_parameters_2 (a_context, a_constraint_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Second phase of Tuple-type-unfolding in actual parameters of current class type.
			-- Perform transformations which require conformance checking:
			-- * Resolve the case: "FOO [A, B, C]" -> "FOO [A, TUPLE [B], C]".
			-- `a_context' and `a_constraint_context' are the contexts from which
			-- the current actual parameter at the tuple constraint position
			-- and its associated constraint are viewed respectively when
			-- performing conformance checking.
		do
				-- Do no unfold formal parameters of classes, only actual parameters of class types.
			tuple_actual_parameters_unfolded_1 := True
			tuple_actual_parameters_unfolded_2 := True
		end

feature {NONE} -- Genericity

	formal_parameter_types: detachable DS_ARRAYED_LIST [detachable ET_FORMAL_PARAMETER_TYPE]
			-- Shared formal parameter types, indexed by index.
			-- Note that some entries in the list may be Void if
			-- the corresponding formal parameter type has not
			-- been requested yet.

	formal_parameter_types_mutex: MUTEX
			-- Mutex to get exclusive access to `formal_parameter_types'
			-- in a multi-threaded environment

feature -- Ancestors

	has_ancestor (a_class: ET_CLASS): BOOLEAN
			-- Is `a_class' an ancestor of current class?
			-- (Note: you have to make sure that the ancestors have correctly
			-- been built first in order to get the correct answer.)
		require
			a_class_not_void: a_class /= Void
		do
			if is_unknown then
					-- Class "*UNKNOWN*" has no ancestors.
				Result := False
			elseif a_class = Current then
				Result := True
			elseif is_none then
					-- "NONE" is a descendant of all classes.
				Result := True
			else
				Result := ancestors.has_class (a_class)
			end
		end

	has_conforming_ancestor (a_class: ET_CLASS): BOOLEAN
			-- Is `a_class' a conforming ancestor of current class?
			-- (Note: you have to make sure that the ancestors have correctly
			-- been built first in order to get the correct answer.)
		require
			a_class_not_void: a_class /= Void
		do
			if is_unknown then
					-- Class "*UNKNOWN*" has no ancestors.
				Result := False
			elseif a_class = Current then
				Result := True
			elseif is_none then
					-- "NONE" is a descendant of all classes.
				Result := True
			else
				Result := conforming_ancestors.has_class (a_class)
			end
		end

	ancestor (a_type: ET_BASE_TYPE): detachable ET_BASE_TYPE
			-- Ancestor of current class with same base class as `a_type';
			-- Void if no such ancestor.
			-- (Note: you have to make sure that the ancestors have correctly
			-- been built first in order to get the correct answer.)
		require
			a_type_not_void: a_type /= Void
		local
			a_class: ET_CLASS
		do
			a_class := a_type.base_class
			if is_unknown then
					-- Class "*UNKNOWN*" has no ancestors.
				Result := Void
			elseif a_class = Current then
				Result := a_type
			elseif is_none then
					-- "NONE" is a descendant of all classes.
				Result := a_type
			else
				Result := ancestors.base_type (a_class)
			end
		end

	conforming_ancestor (a_type: ET_BASE_TYPE): detachable ET_BASE_TYPE
			-- Conforming ancestor of current class with same base class as `a_type';
			-- Void if no such ancestor.
			-- (Note: you have to make sure that the ancestors have correctly
			-- been built first in order to get the correct answer.)
		require
			a_type_not_void: a_type /= Void
		local
			a_class: ET_CLASS
		do
			a_class := a_type.base_class
			if is_unknown then
					-- Class "*UNKNOWN*" has no ancestors.
				Result := Void
			elseif a_class = Current then
				Result := a_type
			elseif is_none then
					-- "NONE" is a descendant of all classes.
				Result := a_type
			else
				Result := conforming_ancestors.base_type (a_class)
			end
		end

	ancestors: ET_BASE_TYPE_LIST
			-- Proper ancestors in reverse topological order
			-- (parents, then grand-parents, etc.)

	conforming_ancestors: ET_BASE_TYPE_LIST
			-- Proper conforming ancestors in reverse topological order
			-- (parents, then grand-parents, etc.)

	set_ancestors (some_ancestors: like ancestors)
			-- Set `ancestors' to `some_ancestors'.
		require
			some_ancestors_not_void: some_ancestors /= Void
		do
			ancestors := some_ancestors
		ensure
			ancestors_set: ancestors = some_ancestors
		end

	set_conforming_ancestors (a_ancestors: like ancestors)
			-- Set `conforming_ancestors' to `a_ancestors'.
		require
			a_ancestors_not_void: a_ancestors /= Void
		do
			conforming_ancestors := a_ancestors
		ensure
			conforming_ancestors_set: conforming_ancestors = a_ancestors
		end

	descendants: DS_ARRAYED_LIST [ET_CLASS]
			-- Proper descendant classes of current class in the surrounding Eiffel system
			-- (Note: you have to make sure that the ancestors of the classes in the
			-- surrounding Eiffel system have correctly been built first in order to
			-- get the correct answer.)
		do
			if is_unknown then
					-- Class "*UNKNOWN*" has no descendants.
				create Result.make (0)
			elseif is_none then
					-- Class "NONE" has no descendants.
				create Result.make (0)
			elseif not is_preparsed then
					-- Current class is not preparsed, this means that we know nothing
					-- about it, not even its filename. Therefore it cannot possibly
					-- have descendant classes.
				create Result.make (0)
			else
				create Result.make (initial_descendants_capacity)
				current_system.classes_do_recursive (agent {ET_CLASS}.add_to_descendants (Current, Result))
			end
		ensure
			descendants_not_void: Result /= Void
			no_void_descendant: not Result.has_void
		end

	add_to_descendants (a_class: ET_CLASS; a_descendants: DS_ARRAYED_LIST [ET_CLASS])
			-- Add current class to `a_descendants' if it is a proper descendant of `a_class'.
			-- (Note: you have to make sure that the ancestors of current class have correctly
			-- been built first in order to get the correct behavior.)
		require
			a_class_not_void: a_class /= Void
			a_descendants_not_void: a_descendants /= Void
			no_void_descendants: not a_descendants.has_void
		do
			if a_class /= Current then
				if ancestors_built and then has_ancestor (a_class) then
					a_descendants.force_last (Current)
				end
			end
		ensure
			no_void_descendants: not a_descendants.has_void
		end

	conforming_descendants: DS_ARRAYED_LIST [ET_CLASS]
			-- Proper conforming descendant classes of current class in the surrounding Eiffel system
			-- (Note: you have to make sure that the ancestors of the classes in the
			-- surrounding Eiffel system have correctly been built first in order to
			-- get the correct answer.)
		do
			if is_unknown then
					-- Class "*UNKNOWN*" has no descendants.
				create Result.make (0)
			elseif is_none then
					-- Class "NONE" has no descendants.
				create Result.make (0)
			elseif not is_preparsed then
					-- Current class is not preparsed, this means that we know nothing
					-- about it, not even its filename. Therefore it cannot possibly
					-- have descendant classes.
				create Result.make (0)
			else
				create Result.make (initial_descendants_capacity)
				current_system.classes_do_recursive (agent {ET_CLASS}.add_to_conforming_descendants (Current, Result))
			end
		ensure
			conforming_descendants_not_void: Result /= Void
			no_void_conforming_descendant: not Result.has_void
		end

	add_to_conforming_descendants (a_class: ET_CLASS; a_descendants: DS_ARRAYED_LIST [ET_CLASS])
			-- Add current class to `a_descendants' if it is a proper conforming descendant of `a_class'.
			-- (Note: you have to make sure that the ancestors of current class have correctly
			-- been built first in order to get the correct behavior.)
		require
			a_class_not_void: a_class /= Void
			a_descendants_not_void: a_descendants /= Void
			no_void_descendants: not a_descendants.has_void
		do
			if a_class /= Current then
				if ancestors_built and then has_conforming_ancestor (a_class) then
					a_descendants.force_last (Current)
				end
			end
		ensure
			no_void_descendants: not a_descendants.has_void
		end

	parent_clauses: detachable ET_PARENT_CLAUSE_LIST
			-- Parents explicitly specified in the Parent clauses

	set_parent_clauses (a_parents: like parent_clauses)
			-- Set `parent_clauses' to `a_parents'.
		do
			parent_clauses := a_parents
		ensure
			parent_clauses_set: parent_clauses = a_parents
		end

	has_explicit_conforming_parent: BOOLEAN
			-- Does current class have at least one explicit conforming parent?
		do
			Result := attached parent_clauses as l_parent_clauses and then l_parent_clauses.has_conforming_parent
		ensure
			definition: Result = (attached parent_clauses as l_parent_clauses and then l_parent_clauses.has_conforming_parent)
		end

	implicit_parent_clause: detachable ET_PARENT_LIST
			-- Implicit parent clause when the current class has no explicit conforming parent.
			--
			-- Under .NET, the implicit parent in the "SYSTEM_OBJECT" class if the class
			-- is not the "SYSTEM_OBJECT" class itself.
			-- Otherwise the implicit parent if "ANY" if the class is not "ANY"
			-- itself. As a consequence, "ANY" is the only class with no parents.
		require
			no_explicit_conforming_parent: not has_explicit_conforming_parent
		do
			if is_any_class then
					-- "ANY" has no implicit parents.
				Result := Void
			elseif is_dotnet and then not is_system_object_class then
				Result := universe.system_object_parents
			else
				Result := universe.any_parents
			end
		end

	parents_count: INTEGER
			-- Number of explicit and implicit parent clauses
		do
			if attached parent_clauses as l_parent_clauses then
				Result := l_parent_clauses.count
			end
			if not has_explicit_conforming_parent and then implicit_parent_clause /= Void then
				Result := Result + 1
			end
		ensure
			parents_count_not_negative: Result >= 0
		end

	parents (i: INTEGER): ET_PARENT_LIST
			-- `i'-th parent clause (explicit or implicit)
		require
			i_large_enough: i >= 1
			i_small_enough: i <= parents_count
		do
			if attached parent_clauses as l_parent_clauses and then i <= l_parent_clauses.count then
				Result := l_parent_clauses.item (i)
			else
				check has_implicit_parent: attached implicit_parent_clause as l_implicit_parent_clause then
					Result := l_implicit_parent_clause
				end
			end
		ensure
			parents_not_void: Result /= Void
		end

	add_base_class_of_parents_exported_to (a_client: ET_CLASS; a_set: DS_HASH_SET [ET_CLASS])
			-- Add to `a_set' the base class of the parents which are exported
			-- to `a_client' (all conforming parents, and if `a_client' is "NONE"
			-- then the non-conforming parents as well).
		require
			a_client_not_void: a_client /= Void
			a_set_not_void: a_set /= Void
			no_void_classes: not a_set.has_void
		local
			l_is_none: BOOLEAN
			l_parent_list: ET_PARENT_LIST
			i1, nb1: INTEGER
			i2, nb2: INTEGER
		do
			l_is_none := a_client.is_none
			nb1 := parents_count
			from i1 := 1 until i1 > nb1 loop
				l_parent_list := parents (i1)
				if l_is_none or else l_parent_list.is_conforming then
					nb2 := l_parent_list.count
					from i2 := 1 until i2 > nb2 loop
						a_set.force (l_parent_list.parent (i2).type.base_class)
						i2 := i2 + 1
					end
				end
				i1 := i1 + 1
			end
		ensure
			no_void_classes: not a_set.has_void
		end

feature -- Ancestor building status

	ancestors_built: BOOLEAN
			-- Have `ancestors' been built?
		do
			status_mutex.lock
			Result := unprotected_ancestors_built
			status_mutex.unlock
		end

	ancestors_built_successfully: BOOLEAN
			-- Have `ancestors' been successfully built?
		do
			status_mutex.lock
			Result := unprotected_ancestors_built and then not unprotected_has_ancestors_error
			status_mutex.unlock
		end

	has_ancestors_error: BOOLEAN
			-- Has a fatal error occurred when building `ancestors'?
		do
			status_mutex.lock
			Result := unprotected_has_ancestors_error
			status_mutex.unlock
		end

	set_ancestors_built
			-- Set `ancestors_built' to True.
		do
			status_mutex.lock
			unprotected_ancestors_built := True
			status_mutex.unlock
		ensure
			ancestors_built: ancestors_built
		end

	set_ancestors_error
			-- Set `has_ancestors_error' to True.
		do
			status_mutex.lock
			unprotected_ancestors_built := True
			unprotected_has_ancestors_error := True
			status_mutex.unlock
		ensure
			ancestors_built: ancestors_built
			has_ancestors_error: has_ancestors_error
		end

	unset_ancestors_error
			-- Set `has_ancestors_error' to False.
		do
			status_mutex.lock
			unprotected_has_ancestors_error := False
			status_mutex.unlock
		ensure
			not_has_ancestors_error: not has_ancestors_error
		end

	reset_ancestors_built
			-- Set `ancestors_built' to False.
		do
			status_mutex.lock
			unprotected_has_ancestors_error := False
			unprotected_ancestors_built := False
			ancestors := tokens.empty_ancestors
			conforming_ancestors := tokens.empty_ancestors
			status_mutex.unlock
		ensure
			ancestors_not_built: not ancestors_built
			no_ancestors_error: not has_ancestors_error
		end

feature {NONE} -- Ancestor building status

	unprotected_ancestors_built: BOOLEAN
			-- Have `ancestors' been built?
			--
			-- This is not protected by a mutex in case of multi-threading.

	unprotected_has_ancestors_error: BOOLEAN
			-- Has a fatal error occurred when building `ancestors'?
			--
			-- This is not protected by a mutex in case of multi-threading.

feature -- Creation

	is_creation_exported_to (a_name: ET_FEATURE_NAME; a_client: ET_CLASS; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Is feature name listed in current creation clauses
			-- and is it exported to `a_client'?
			-- (Note: Use `a_system_processor.ancestor_builder' on the classes whose ancestors
			-- need to be built in order to check for descendants.)
		require
			a_name_not_void: a_name /= Void
			a_client_not_void: a_client /= Void
			a_system_processor_not_void: a_system_processor /= Void
		do
			if attached creators as l_creators then
				Result := l_creators.is_exported_to (a_name, a_client, a_system_processor)
			end
		end

	is_creation_directly_exported_to (a_name: ET_FEATURE_NAME; a_client: ET_CLASS): BOOLEAN
			-- Is feature name listed in current creation clauses
			-- and is it directly exported to `a_client'?
			-- This is different from `is_creation_exported_to' where `a_client'
			-- can be a descendant of a class appearing in the list of clients.
			-- Note: The use of 'direct' in the name of this feature has not
			-- the same meaning as 'direct and indirect client' in ETL2 p.91.
		require
			a_name_not_void: a_name /= Void
			a_client_not_void: a_client /= Void
		do
			if attached creators as l_creators then
				Result := l_creators.is_directly_exported_to (a_name, a_client)
			end
		end

	add_creations_exported_to (a_client: ET_CLASS; a_set: DS_HASH_SET [ET_FEATURE_NAME]; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Add to `a_set' the feature name of creation procedures which are
			-- exported to `a_client'.
			-- (Note: Use `a_system_processor.ancestor_builder' on the classes
			-- whose ancestors need to be built in order to check for descendants.)
		require
			a_client_not_void: a_client /= Void
			a_set_not_void: a_set /= Void
			no_void_names: not a_set.has_void
			a_system_processor_not_void: a_system_processor /= Void
		do
			if attached creators as l_creators then
				l_creators.add_creations_exported_to (a_client, a_set, a_system_processor)
			end
		end

	creators: detachable ET_CREATOR_LIST
			-- Creation clauses

	set_creators (a_creators: like creators)
			-- Set `creators' to `a_creators'.
		do
			creators := a_creators
		ensure
			creators_set: creators = a_creators
		end

feature -- Conversion

	convert_to_feature (other: ET_TYPE_CONTEXT; a_type: ET_TYPE_CONTEXT): detachable ET_CONVERT_FEATURE
			-- Conversion feature, if any, to convert `a_type' to `other'
		require
			other_not_void: other /= Void
			other_context_valid: other.is_valid_context
			a_type_not_void: a_type /= Void
			a_type_context_valid: a_type.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			valid_type: a_type.base_class = Current
		local
			i, nb: INTEGER
			a_feature: ET_CONVERT_FEATURE
			other_type: ET_TYPE
		do
			if attached convert_features as l_convert_features then
				other_type := tokens.identity_type
				nb := l_convert_features.count
				from i := 1 until i > nb loop
					a_feature := l_convert_features.convert_feature (i)
					if a_feature.is_convert_to then
							-- Do not take into account the attachment and
							-- separateness status of the types involved.
						if a_feature.types.has_named_type_with_type_marks (other_type, tokens.attached_separate_type_mark, other, tokens.attached_separate_type_mark, a_type) then
							Result := a_feature
							i := nb + 1 -- Jump out of the loop.
						end
					end
					i := i + 1
				end
			end
		end

	convert_from_feature (other: ET_TYPE_CONTEXT; a_type: ET_TYPE_CONTEXT): detachable ET_CONVERT_FEATURE
			-- Conversion feature, if any, to convert `a_type' from `other'
		require
			other_not_void: other /= Void
			other_context_valid: other.is_valid_context
			a_type_not_void: a_type /= Void
			a_type_context_valid: a_type.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			valid_type: a_type.base_class = Current
		local
			i, nb: INTEGER
			a_feature: ET_CONVERT_FEATURE
			other_type: ET_TYPE
		do
			if attached convert_features as l_convert_features then
				other_type := tokens.identity_type
				nb := l_convert_features.count
				from i := 1 until i > nb loop
					a_feature := l_convert_features.convert_feature (i)
					if a_feature.is_convert_from then
							-- Do not take into account the attachment and
							-- separateness status of the types involved.
						if a_feature.types.has_named_type_with_type_marks (other_type, tokens.attached_separate_type_mark, other, tokens.attached_separate_type_mark, a_type) then
							Result := a_feature
							i := nb + 1 -- Jump out of the loop.
						end
					end
					i := i + 1
				end
			end
		end

	convert_features: detachable ET_CONVERT_FEATURE_LIST
			-- Conversion clauses

	set_convert_features (a_convert_features: like convert_features)
			-- Set `convert_features' to `a_convert_features'.
		do
			convert_features := a_convert_features
		ensure
			convert_features_set: convert_features = a_convert_features
		end

feature -- Feature clauses

	feature_clauses: detachable ET_FEATURE_CLAUSE_LIST
			-- Feature clauses

	set_feature_clauses (a_feature_clauses: like feature_clauses)
			-- Set `feature_clauses' to `a_feature_clauses'.
		do
			feature_clauses := a_feature_clauses
		ensure
			feature_clauses_set: feature_clauses = a_feature_clauses
		end

feature -- Features

	named_query (a_name: ET_CALL_NAME): detachable ET_QUERY
			-- Query named `a_name';
			-- Void if no such query
		do
			Result := queries.named_feature (a_name)
		end

	named_procedure (a_name: ET_CALL_NAME): detachable ET_PROCEDURE
			-- Procedure named `a_name';
			-- Void if no such procedure
		do
			Result := procedures.named_feature (a_name)
		end

	named_declared_feature (a_name: ET_CALL_NAME): detachable ET_FEATURE
			-- Feature named `a_name' declared in current class;
			-- Void if no such feature
		require
			a_name_not_void: a_name /= Void
		do
			Result := procedures.named_declared_feature (a_name)
			if Result = Void then
				Result := queries.named_declared_feature (a_name)
			end
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	seeded_query (a_seed: INTEGER): detachable ET_QUERY
			-- Query with seed `a_seed';
			-- Void if no such query
		do
			Result := queries.seeded_feature (a_seed)
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	seeded_procedure (a_seed: INTEGER): detachable ET_PROCEDURE
			-- Procedure with seed `a_seed';
			-- Void if no such procedure
		do
			Result := procedures.seeded_feature (a_seed)
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	seeded_feature (a_seed: INTEGER): detachable ET_FEATURE
			-- Feature with seed `a_seed';
			-- Void if no such feature
		do
			Result := queries.seeded_feature (a_seed)
			if Result = Void then
				Result := procedures.seeded_feature (a_seed)
			end
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	add_overloaded_queries (a_name: ET_CALL_NAME; a_list: DS_ARRAYED_LIST [ET_QUERY])
			-- Add to `a_list' queries whose name or overloaded name is `a_name'.
		do
			queries.add_overloaded_features (a_name, a_list)
		end

	add_overloaded_procedures (a_name: ET_CALL_NAME; a_list: DS_ARRAYED_LIST [ET_PROCEDURE])
			-- Add to `a_list' procedures whose name or overloaded name is `a_name'.
		do
			procedures.add_overloaded_features (a_name, a_list)
		end

	queries: ET_QUERY_LIST
			-- Queries

	procedures: ET_PROCEDURE_LIST
			-- Procedures

	set_queries (a_queries: like queries)
			-- Set `queries' to `a_queries' and
		require
			a_queries_not_void: a_queries /= Void
			-- a_features_registered: forall f in a_queries, f.is_registered
		do
			queries := a_queries
		ensure
			queries_set: queries = a_queries
		end

	set_procedures (a_procedures: like procedures)
			-- Set `procedures' to `a_procedures' and
		require
			a_procedures_not_void: a_procedures /= Void
			-- a_features_registered: forall f in a_procedures, f.is_registered
		do
			procedures := a_procedures
		ensure
			procedures_set: procedures = a_procedures
		end

	features_do_all (an_action: PROCEDURE [ET_FEATURE])
			-- Apply `an_action' to every feature of current class.
			-- (Semantics not guaranteed if `an_action' changes the list of features.)
		require
			an_action_not_void: an_action /= Void
		do
			queries.features_do_all (an_action)
			procedures.features_do_all (an_action)
		end

	features_do_until (an_action: PROCEDURE [ET_FEATURE]; a_stop_request: detachable FUNCTION [BOOLEAN])
			-- Apply `an_action' to every feature of current class.
			-- (Semantics not guaranteed if `an_action' changes the list of features.)
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		do
			queries.features_do_until (an_action, a_stop_request)
			procedures.features_do_until (an_action, a_stop_request)
		end

	features_do_declared (an_action: PROCEDURE [ET_FEATURE])
			-- Apply `an_action' to every feature declared in current class
			-- (i.e. do not traverse inherited features which have not been
			-- redefined in current class).
			-- (Semantics not guaranteed if `an_action' changes the list of features.)
		require
			an_action_not_void: an_action /= Void
		do
			queries.features_do_declared (an_action)
			procedures.features_do_declared (an_action)
		end

	features_do_declared_until (an_action: PROCEDURE [ET_FEATURE]; a_stop_request: detachable FUNCTION [BOOLEAN])
			-- Apply `an_action' to every feature declared in current class
			-- (i.e. do not traverse inherited features which have not been
			-- redefined in current class).
			-- (Semantics not guaranteed if `an_action' changes the list of features.)
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		do
			queries.features_do_declared_until (an_action, a_stop_request)
			procedures.features_do_declared_until (an_action, a_stop_request)
		end

	features_do_inherited (an_action: PROCEDURE [ET_FEATURE])
			-- Apply `an_action' to every feature inherited without being explicitly
			-- redeclared in current class that satisfies `a_test'.
			-- (Semantics not guaranteed if `an_action' changes the list of features.)
		require
			an_action_not_void: an_action /= Void
		do
			queries.features_do_inherited (an_action)
			procedures.features_do_inherited (an_action)
		end

	features_do_inherited_until (an_action: PROCEDURE [ET_FEATURE]; a_stop_request: detachable FUNCTION [BOOLEAN])
			-- Apply `an_action' to every feature inherited without being explicitly
			-- redeclared in current class that satisfies `a_test'.
			-- (Semantics not guaranteed if `an_action' changes the list of features.)
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		do
			queries.features_do_inherited_until (an_action, a_stop_request)
			procedures.features_do_inherited_until (an_action, a_stop_request)
		end

	features_do_if (an_action: PROCEDURE [ET_FEATURE]; a_test: FUNCTION [ET_FEATURE, BOOLEAN])
			-- Apply `an_action' to every feature of current class that satisfies `a_test'.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the list of features.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			queries.features_do_if (an_action, a_test)
			procedures.features_do_if (an_action, a_test)
		end

	features_do_if_until (an_action: PROCEDURE [ET_FEATURE]; a_test: FUNCTION [ET_FEATURE, BOOLEAN]; a_stop_request: detachable FUNCTION [BOOLEAN])
			-- Apply `an_action' to every feature of current class that satisfies `a_test'.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the list of features.)
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			queries.features_do_if_until (an_action, a_test, a_stop_request)
			procedures.features_do_if_until (an_action, a_test, a_stop_request)
		end

	features_do_declared_if (an_action: PROCEDURE [ET_FEATURE]; a_test: FUNCTION [ET_FEATURE, BOOLEAN])
			-- Apply `an_action' to every feature declared in current class
			-- (i.e. do not traverse inherited features which have not been
			-- redefined in current class) that satisfies `a_test'.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the list of features.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			queries.features_do_declared_if (an_action, a_test)
			procedures.features_do_declared_if (an_action, a_test)
		end

	features_do_declared_if_until (an_action: PROCEDURE [ET_FEATURE]; a_test: FUNCTION [ET_FEATURE, BOOLEAN]; a_stop_request: detachable FUNCTION [BOOLEAN])
			-- Apply `an_action' to every feature declared in current class
			-- (i.e. do not traverse inherited features which have not been
			-- redefined in current class) that satisfies `a_test'.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the list of features.)
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			queries.features_do_declared_if_until (an_action, a_test, a_stop_request)
			procedures.features_do_declared_if_until (an_action, a_test, a_stop_request)
		end

	features_do_inherited_if (an_action: PROCEDURE [ET_FEATURE]; a_test: FUNCTION [ET_FEATURE, BOOLEAN])
			-- Apply `an_action' to every feature inherited without being explicitly
			-- redeclared in current class that satisfies `a_test'.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the list of features.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			queries.features_do_inherited_if (an_action, a_test)
			procedures.features_do_inherited_if (an_action, a_test)
		end

	features_do_inherited_if_until (an_action: PROCEDURE [ET_FEATURE]; a_test: FUNCTION [ET_FEATURE, BOOLEAN]; a_stop_request: detachable FUNCTION [BOOLEAN])
			-- Apply `an_action' to every feature inherited without being explicitly
			-- redeclared in current class that satisfies `a_test'.
			-- (Semantics not guaranteed if `an_action' or `a_test' change the list of features.)
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		do
			queries.features_do_inherited_if_until (an_action, a_test, a_stop_request)
			procedures.features_do_inherited_if_until (an_action, a_test, a_stop_request)
		end

	has_declared_feature (a_feature: ET_FEATURE): BOOLEAN
			-- Is `a_feature' part of features declared in current class?
		require
			a_feature_not_void: a_feature /= Void
		do
			if a_feature.is_query then
				Result := queries.has_declared_feature (a_feature)
			else
				Result := procedures.has_declared_feature (a_feature)
			end
		end

	has_inherited_feature (a_feature: ET_FEATURE): BOOLEAN
			-- Is `a_feature' part of the features inherited without
			-- being explicitly redeclared in current class?
		require
			a_feature_not_void: a_feature /= Void
		do
			if a_feature.is_query then
				Result := queries.has_inherited_feature (a_feature)
			else
				Result := procedures.has_inherited_feature (a_feature)
			end
		end

	adapted_class_base_type_index_of_label (a_label: ET_IDENTIFIER; a_context: ET_TYPE_CONTEXT): INTEGER
			-- Index of actual generic parameter with label `a_label'
			-- in `a_context.base_type'.
			-- 0 if it does not exist.
		do
			Result := a_context.base_type_index_of_label (a_label)
		end

feature -- Feature registration

	register_feature (a_feature: ET_FEATURE)
			-- Register `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			registered_feature_count := registered_feature_count + 1
			a_feature.set_id (id |<< 14 | registered_feature_count)
		ensure
			a_feature_registered: a_feature.is_registered
		end

feature -- Feature registration

	registered_feature_count: INTEGER
			-- Number of features already registered

feature -- Inline constant registration

	register_inline_constant (a_constant: ET_INLINE_CONSTANT)
			-- Register `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			registered_inline_constant_count := registered_inline_constant_count + 1
			a_constant.set_id (id |<< 14 | registered_inline_constant_count)
		end

	registered_inline_constant_count: INTEGER
			-- Number of inline constants already registered

feature -- Redeclared signature conformance checking

	redeclared_signatures_checked: BOOLEAN
			-- Has conformance of redeclared signatures been checked when flattening the features?
			-- This could be postponed to the next compilation pass if the signature
			-- of some features contains qualified types (e.g. of the for 'like a.b')
			-- requiring features from other classes to be flattened (e.g. to determine
			-- the type of feature 'b' in the base class of 'like a').
			-- For simplicity, all validity errors related to signature conformance
			-- are reported during the interface checking compilation pass.

	set_redeclared_signatures_checked (b: BOOLEAN)
			-- Set `redeclared_signatures_checked' to `b'.
		do
			redeclared_signatures_checked := b
		ensure
			redeclared_signatures_checked_set: redeclared_signatures_checked = b
		end

feature -- Feature flattening status

	features_flattened: BOOLEAN
			-- Have features been flattened?
		do
			status_mutex.lock
			Result := unprotected_features_flattened
			status_mutex.unlock
		end

	features_flattened_successfully: BOOLEAN
			-- Have features been successfully flattened?
		do
			status_mutex.lock
			Result := unprotected_features_flattened and then not unprotected_has_flattening_error
			status_mutex.unlock
		end

	has_flattening_error: BOOLEAN
			-- Has a fatal error occurred during feature flattening?
		do
			status_mutex.lock
			Result := unprotected_has_flattening_error
			status_mutex.unlock
		end

	set_features_flattened
			-- Set `features_flattened' to True.
		do
			status_mutex.lock
			unprotected_features_flattened := True
			status_mutex.unlock
		ensure
			features_flattened: features_flattened
		end

	set_flattening_error
			-- Set `has_flattening_error' to True.
		do
			status_mutex.lock
			unprotected_features_flattened := True
			unprotected_has_flattening_error := True
			status_mutex.unlock
		ensure
			features_flattened: features_flattened
			has_flattening_error: has_flattening_error
		end

	unset_flattening_error
			-- Set `has_flattening_error' to False.
		do
			status_mutex.lock
			unprotected_has_flattening_error := False
			status_mutex.unlock
		ensure
			not_has_flattening_error: not has_flattening_error
		end

	reset_features_flattened
			-- Set `features_flattened' to False.
		do
			status_mutex.lock
			unprotected_has_flattening_error := False
			unprotected_features_flattened := False
			has_deferred_features := False
			redeclared_signatures_checked := False
			registered_feature_count := queries.declared_count + procedures.declared_count
			status_mutex.unlock
		ensure
			features_not_flattened: not features_flattened
			no_flattening_error: not has_flattening_error
		end

feature {NONE} -- Feature flattening status

	unprotected_features_flattened: BOOLEAN
			-- Have features been flattened?
			--
			-- This is not protected by a mutex in case of multi-threading.

	unprotected_has_flattening_error: BOOLEAN
			-- Has a fatal error occurred during feature flattening?
			--
			-- This is not protected by a mutex in case of multi-threading.

feature -- Interface checking status

	interface_checked: BOOLEAN
			-- Has the interface of current class been checked?
		do
			status_mutex.lock
			Result := unprotected_interface_checked
			status_mutex.unlock
		end

	interface_checked_successfully: BOOLEAN
			-- Has the interface of current class been successfully checked?
		do
			status_mutex.lock
			Result := unprotected_interface_checked and then not unprotected_has_interface_error
			status_mutex.unlock
		end

	has_interface_error: BOOLEAN
			-- Has a fatal error occurred during interface checking?
		do
			status_mutex.lock
			Result := unprotected_has_interface_error
			status_mutex.unlock
		end

	set_interface_checked
			-- Set `interface_checked' to True.
		do
			status_mutex.lock
			unprotected_interface_checked := True
			status_mutex.unlock
		ensure
			interface_checked: interface_checked
		end

	set_interface_error
			-- Set `has_interface_error' to True.
		do
			status_mutex.lock
			unprotected_interface_checked := True
			unprotected_has_interface_error := True
			status_mutex.unlock
		ensure
			interface_checked: interface_checked
			has_interface_error: has_interface_error
		end

	unset_interface_error
			-- Set `has_interface_error' to False.
		do
			status_mutex.lock
			unprotected_has_interface_error := False
			status_mutex.unlock
		ensure
			not_has_interface_error: not has_interface_error
		end

	reset_interface_checked
			-- Set `interface_checked' to False.
		do
			status_mutex.lock
			unprotected_has_interface_error := False
			unprotected_interface_checked := False
			status_mutex.unlock
		ensure
			interface_not_checked: not interface_checked
			no_interface_error: not has_interface_error
		end

feature {NONE} -- Interface checking status

	unprotected_interface_checked: BOOLEAN
			-- Has the interface of current class been checked?
			--
			-- This is not protected by a mutex in case of multi-threading.

	unprotected_has_interface_error: BOOLEAN
			-- Has a fatal error occurred during interface checking?
			--
			-- This is not protected by a mutex in case of multi-threading.

feature -- Suppliers/Providers

	suppliers: detachable DS_HASH_SET [ET_NAMED_CLASS]
			-- Named supplier classes of current class

	supplier_classes: detachable DS_HASH_SET [ET_CLASS]
			-- Supplier classes of current class
		local
			l_cursor: DS_HASH_SET_CURSOR [ET_NAMED_CLASS]
			l_class: ET_CLASS
		do
			if attached suppliers as l_suppliers then
				create Result.make (l_suppliers.count)
				l_cursor := l_suppliers.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_class := l_cursor.item.actual_class
					if not l_class.is_unknown then
						Result.force_last (l_class)
					end
					l_cursor.forth
				end
			end
		ensure
			no_void_supplier: Result /= Void implies not Result.has_void
			no_unknown_supplier: Result /= Void implies not Result.there_exists (agent {ET_CLASS}.is_unknown)
		end

	set_suppliers (a_suppliers: like suppliers)
			-- Set `suppliers' to `a_suppliers'.
		require
			no_void_supplier: a_suppliers /= Void implies not a_suppliers.has_void
		do
			suppliers := a_suppliers
		ensure
			suppliers_set: suppliers = a_suppliers
		end

	providers: detachable DS_HASH_SET [ET_NAMED_CLASS]
			-- Named provider classes of current class
			-- (classes whose name appears in the text of current class)

	provider_classes: detachable DS_HASH_SET [ET_CLASS]
			-- Provider classes of current class
			-- (classes whose name appears in the text of current class)
		local
			l_cursor: DS_HASH_SET_CURSOR [ET_NAMED_CLASS]
			l_class: ET_CLASS
		do
			if attached providers as l_providers then
				create Result.make (l_providers.count)
				l_cursor := l_providers.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_class := l_cursor.item.actual_class
					if not l_class.is_unknown then
						Result.force_last (l_class)
					end
					l_cursor.forth
				end
			end
		ensure
			no_void_provider: Result /= Void implies not Result.has_void
			no_unknown_provider: Result /= Void implies not Result.there_exists (agent {ET_CLASS}.is_unknown)
		end

	set_providers (a_providers: like providers)
			-- Set `providers' to `a_providers'.
		require
			no_void_provider: a_providers /= Void implies not a_providers.has_void
		do
			providers := a_providers
		ensure
			providers_set: providers = a_providers
		end

feature -- Implementation checking status

	implementation_checked: BOOLEAN
			-- Has the implementation of current class been checked?
			-- Immediate and redefined (and possibly inherited when in flat mode)
			-- features and invariant have been checked.
		do
			status_mutex.lock
			Result := unprotected_implementation_checked
			status_mutex.unlock
		end

	implementation_checked_successfully: BOOLEAN
			-- Has the implementation of current class been successfully checked?
		do
			status_mutex.lock
			Result := unprotected_implementation_checked and then not unprotected_has_implementation_error
			status_mutex.unlock
		end

	has_implementation_error: BOOLEAN
			-- Has a fatal error occurred during implementation checking?
		do
			status_mutex.lock
			Result := unprotected_has_implementation_error
			status_mutex.unlock
		end

	set_implementation_checked
			-- Set `implementation_checked' to True.
		do
			status_mutex.lock
			unprotected_implementation_checked := True
			status_mutex.unlock
		ensure
			implementation_checked: implementation_checked
		end

	set_implementation_error
			-- Set `has_implementation_error' to True.
		do
			status_mutex.lock
			unprotected_implementation_checked := True
			unprotected_has_implementation_error := True
			status_mutex.unlock
		ensure
			implementation_checked: implementation_checked
			has_implementation_error: has_implementation_error
		end

	unset_implementation_error
			-- Set `has_implementation_error' to False.
		do
			status_mutex.lock
			unprotected_has_implementation_error := False
			status_mutex.unlock
		ensure
			not_has_implementation_error: not has_implementation_error
		end

	reset_implementation_checked
			-- Set `implementation_checked' to False.
		do
			status_mutex.lock
			unprotected_has_implementation_error := False
			unprotected_implementation_checked := False
			suppliers := Void
			status_mutex.unlock
		ensure
			implementation_not_checked: not implementation_checked
			no_implementation_error: not has_implementation_error
			suppliers_reset: suppliers = Void
		end

feature {ET_IMPLEMENTATION_CHECKER, ET_FEATURE_CHECKER} -- Implementation checking status

	is_checking_implementation: BOOLEAN
			-- Is the implementation of current class being checked?
			-- (This is to avoid infinite loop in ET_IMPLEMENTATION_CHECKER
			-- in case of a cycle in the parents.)

	set_checking_implementation (b: BOOLEAN)
			-- Set `is_checking_implementation' to `b'.
		do
			is_checking_implementation := b
		ensure
			checking_implementation_set: is_checking_implementation = b
		end

feature {NONE} -- Implementation checking status

	unprotected_implementation_checked: BOOLEAN
			-- Has the implementation of current class been checked?
			-- Immediate and redefined (and possibly inherited when in flat mode)
			-- features and invariant have been checked.
			--
			-- This is not protected by a mutex in case of multi-threading.

	unprotected_has_implementation_error: BOOLEAN
			-- Has a fatal error occurred during implementation checking?
			--
			-- This is not protected by a mutex in case of multi-threading.

feature -- Invariant

	invariants: detachable ET_INVARIANTS
			-- Invariants

	set_invariants (an_invariants: like invariants)
			-- Set `invariants' to `an_invariants'.
		do
			invariants := an_invariants
		ensure
			invariants_set: invariants = an_invariants
		end

feature -- Type context

	is_valid_context: BOOLEAN = True
			-- A context is valid if the base class of its `root_context'
			-- is preparsed and if its `root_context' is only made up
			-- of class names and formal generic parameter names, and if
			-- the actual parameters of these formal parameters are
			-- themselves in `root_context'?

feature -- Duplication

	cloned_class: ET_CLASS
			-- Clone version of current class
		do
			create Result.make_unknown
			Result.copy (Current)
		ensure
			cloned_class_not_void: Result /= Void
		end

	copy (other: like Current)
			-- Copy `other' to current class.
		do
			if other /= Current then
				standard_copy (other)
				named_base_class := Current
			end
		end

	copy_ast (other: like Current)
			-- Copy from `other' everything but the name, filename, group, time_stamp and id.
		require
			other_not_void: other /= Void
		local
			l_name: like name
			l_group: like group
			l_filename: like filename
			l_id: like id
			l_time_stamp: like time_stamp
			l_is_ignored: BOOLEAN
		do
			if other /= Current then
				l_name := name
				l_filename := filename
				l_group := group
				l_time_stamp := time_stamp
				l_id := id
				l_is_ignored := is_ignored
				copy (other)
				name := l_name
				filename := l_filename
				set_group (l_group)
				time_stamp := l_time_stamp
				id := l_id
				is_ignored := l_is_ignored
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is current class equal to `other'?
		local
			l_class: ET_NAMED_CLASS
		do
			if other = Current then
				Result := True
			else
				l_class := named_base_class
				named_base_class := other.named_base_class
				Result := standard_is_equal (other)
				named_base_class := l_class
			end
		end

feature -- Output

	append_to_string (a_string: STRING)
			-- Append `to_text' to `a_string'.
		do
			a_string.append_string (upper_name)
			if attached formal_parameters as l_formal_parameters and then not l_formal_parameters.is_empty then
				a_string.append_character (' ')
				l_formal_parameters.append_to_string (a_string)
			end
		end

	append_unaliased_to_string (a_string: STRING)
			-- Append `unaliased_to_text' to `a_string'.
		do
			a_string.append_string (upper_name)
			if attached formal_parameters as l_formal_parameters and then not l_formal_parameters.is_empty then
				a_string.append_character (' ')
				l_formal_parameters.append_unaliased_to_string (a_string)
			end
		end

	append_canonical_to_string (a_string: STRING)
			-- Append `canonical_to_text' to `a_string'.
		do
			a_string.append_string (upper_name)
			if attached formal_parameters as l_formal_parameters and then not l_formal_parameters.is_empty then
				a_string.append_character (' ')
				l_formal_parameters.append_canonical_to_string (a_string)
			end
		end

	append_runtime_name_to_string (a_string: STRING)
			-- Append `runtime_name_to_text' to `a_string'.
		do
			a_string.append_string (upper_name)
			if attached formal_parameters as l_formal_parameters and then not l_formal_parameters.is_empty then
				a_string.append_character (' ')
				l_formal_parameters.append_runtime_name_to_string (a_string)
			end
		end

	debug_output: STRING
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := upper_name
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_class (Current)
		end

feature {NONE} -- Constants

	initial_descendants_capacity: INTEGER
			-- Initial capacity for `descendants'
		once
			Result := 20
		ensure
			capacity_positive: Result > 0
		end

	initial_classes_in_group_capacity: INTEGER
			-- Initial capacity for class list when calling `add_by_group'
		once
			Result := 20
		ensure
			capacity_positive: Result > 0
		end

	no_time_stamp: INTEGER = -2
			-- No time stamp marker

feature {NONE} -- Codes

	class_code: NATURAL_8
			-- Class code (i.e. whether it's a kernel class or not)

invariant

	id_not_negative: id >= 0
	index_not_negative: index >= 0
	group_not_void: group /= Void
	ancestors_not_void: ancestors /= Void
	conforming_ancestors_not_void: conforming_ancestors /= Void
	queries_not_void: queries /= Void
	-- queries_registered: forall f in queries, f.is_registered
	procedures_not_void: procedures /= Void
	-- procedures_registered: forall f in procedures, f.is_registered
	class_keyword_not_void: class_keyword /= Void
	end_keyword_not_void: end_keyword /= Void
	named_type: is_named_type
	valid_context: is_valid_context
	no_void_supplier: attached suppliers as l_suppliers implies not l_suppliers.has_void
	no_void_provider: attached providers as l_providers implies not l_providers.has_void
	tuple_constraint_position: tuple_constraint_position /= 0 implies attached formal_parameters as l_formal_parameters and then (tuple_constraint_position >= 1 and tuple_constraint_position <= l_formal_parameters.count)
	formal_parameter_types_mutex_not_void: formal_parameter_types_mutex /= Void

end
