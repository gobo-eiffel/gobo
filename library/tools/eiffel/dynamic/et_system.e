indexing

	description:

		"Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYSTEM

inherit

	ANY

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new system.
		require
			a_universe_not_void: a_universe /= Void
		local
			nb: INTEGER
		do
			universe := a_universe
			nb := a_universe.classes.capacity
			create null_dynamic_type_set_builder.make (Current)
			set_dynamic_type_set_builder (null_dynamic_type_set_builder)
			create dynamic_types.make (nb)
			make_basic_types
		ensure
			universe_set: universe = a_universe
		end

	make_basic_types is
			-- Create basic types.
		local
			l_unknown_class: ET_CLASS
			l_unknown_type: ET_DYNAMIC_TYPE
		do
			l_unknown_class := universe.unknown_class
			create l_unknown_type.make (l_unknown_class, l_unknown_class)
			boolean_type := l_unknown_type
			character_type := l_unknown_type
			wide_character_type := l_unknown_type
			character_8_type := l_unknown_type
			character_32_type := l_unknown_type
			integer_type := l_unknown_type
			integer_8_type := l_unknown_type
			integer_16_type := l_unknown_type
			integer_32_type := l_unknown_type
			integer_64_type := l_unknown_type
			natural_type := l_unknown_type
			natural_8_type := l_unknown_type
			natural_16_type := l_unknown_type
			natural_32_type := l_unknown_type
			natural_64_type := l_unknown_type
			real_type := l_unknown_type
			double_type := l_unknown_type
			real_32_type := l_unknown_type
			real_64_type := l_unknown_type
			pointer_type := l_unknown_type
			string_type := l_unknown_type
			string_8_type := l_unknown_type
			string_32_type := l_unknown_type
			special_character_type := l_unknown_type
			special_character_8_type := l_unknown_type
			special_character_32_type := l_unknown_type
			any_type := l_unknown_type
			none_type := l_unknown_type
		ensure
			any_type_not_void: any_type /= Void
			none_type_not_void: none_type /= Void
			boolean_type_not_void: boolean_type /= Void
			character_type_not_void: character_type /= Void
			wide_character_type_not_void: wide_character_type /= Void
			character_8_type_not_void: character_8_type /= Void
			character_32_type_not_void: character_32_type /= Void
			integer_type_not_void: integer_type /= Void
			integer_8_type_not_void: integer_8_type /= Void
			integer_16_type_not_void: integer_16_type /= Void
			integer_32_type_not_void: integer_32_type /= Void
			integer_64_type_not_void: integer_64_type /= Void
			natural_type_not_void: natural_type /= Void
			natural_8_type_not_void: natural_8_type /= Void
			natural_16_type_not_void: natural_16_type /= Void
			natural_32_type_not_void: natural_32_type /= Void
			natural_64_type_not_void: natural_64_type /= Void
			real_type_not_void: real_type /= Void
			double_type_not_void: double_type /= Void
			real_32_type_not_void: real_32_type /= Void
			real_64_type_not_void: real_64_type /= Void
			pointer_type_not_void: pointer_type /= Void
			string_type_not_void: string_type /= Void
			string_8_type_not_void: string_8_type /= Void
			string_32_type_not_void: string_32_type /= Void
			special_character_type_not_void: special_character_type /= Void
			special_character_8_type_not_void: special_character_8_type /= Void
			special_character_32_type_not_void: special_character_32_type /= Void
		end

feature -- Access

	root_type: ET_DYNAMIC_TYPE
			-- Root type

	root_creation_procedure: ET_DYNAMIC_FEATURE
			-- Root creation procedure

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Status report

	catcall_mode: BOOLEAN
			-- Are CAT-call errors considered as fatal errors?

feature -- Status setting

	set_catcall_mode (b: BOOLEAN) is
			-- Set `catcall_mode' to `b'.
		do
			catcall_mode := b
		ensure
			catcall_mode_set: catcall_mode = b
		end

	set_string_type_alive is
			-- Make sure that `string_type' and its dependent types
			-- are marked as alive.
		do
			string_type.set_alive
				-- Make sure that type SPECIAL[CHARACTER] (used in
				-- feature 'area') is marked as alive.
			special_character_type.set_alive
				-- Make sure that type CHARACTER (used as actual generic type
				-- of 'SPECIAL[CHARACTER]' in feature 'area') is marked as alive.
			character_type.set_alive
				-- Make sure that type INTEGER (used in attribute 'count') is marked as alive.
			integer_type.set_alive
		ensure
			string_type_alive: string_type.is_alive
			special_character_type_alive: special_character_type.is_alive
			character_type_alive: character_type.is_alive
			integer_type_alive: integer_type.is_alive
		end

feature -- Types

	boolean_type: ET_DYNAMIC_TYPE
			-- Type "BOOLEAN"

	character_type: ET_DYNAMIC_TYPE
			-- Type "CHARACTER"			

	wide_character_type: ET_DYNAMIC_TYPE
			-- Type "WIDE_CHARACTER"

	character_8_type: ET_DYNAMIC_TYPE
			-- Type "CHARACTER_8"	

	character_32_type: ET_DYNAMIC_TYPE
			-- Type "CHARACTER_32"	

	integer_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER"

	integer_8_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER_8"

	integer_16_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER_16"

	integer_32_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER_32"

	integer_64_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER_64"

	natural_type: ET_DYNAMIC_TYPE
			-- Type "NATURAL"

	natural_8_type: ET_DYNAMIC_TYPE
			-- Type "NATURAL_8"

	natural_16_type: ET_DYNAMIC_TYPE
			-- Type "NATURAL_16"

	natural_32_type: ET_DYNAMIC_TYPE
			-- Type "NATURAL_32"

	natural_64_type: ET_DYNAMIC_TYPE
			-- Type "NATURAL_64"

	real_type: ET_DYNAMIC_TYPE
			-- Type "REAL"

	double_type: ET_DYNAMIC_TYPE
			-- Type "DOUBLE"

	real_32_type: ET_DYNAMIC_TYPE
			-- Type "REAL_32"

	real_64_type: ET_DYNAMIC_TYPE
			-- Type "REAL_64"

	pointer_type: ET_DYNAMIC_TYPE
			-- Type "POINTER"

	any_type: ET_DYNAMIC_TYPE
			-- Type "ANY"

	none_type: ET_DYNAMIC_TYPE
			-- Type "NONE"

	string_type: ET_DYNAMIC_TYPE
			-- Type "STRING"

	string_8_type: ET_DYNAMIC_TYPE
			-- Type "STRING_8"

	string_32_type: ET_DYNAMIC_TYPE
			-- Type "STRING_32"

	special_character_type: ET_DYNAMIC_TYPE
			-- Type "SPECIAL [CHARACTER]"

	special_character_8_type: ET_DYNAMIC_TYPE
			-- Type "SPECIAL [CHARACTER_8]"

	special_character_32_type: ET_DYNAMIC_TYPE
			-- Type "SPECIAL [CHARACTER_32]"

	dynamic_type (a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT): ET_DYNAMIC_TYPE is
			-- Dynamic type corresponding to `a_type' in `a_context';
			-- Create a new one if it does not exist yet
		require
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_item_type: ET_DYNAMIC_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_return_type: ET_DYNAMIC_TYPE
			l_return_type_set: ET_DYNAMIC_TYPE_SET
			l_base_type: ET_BASE_TYPE
			l_base_class: ET_CLASS
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_any: ET_CLASS
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			l_base_class := a_type.base_class (a_context, universe)
			i := l_base_class.index
			if i >= 1 and i <= dynamic_types.count then
				l_type := dynamic_types.item (i)
				if l_type.base_class /= l_base_class then
					-- Wrong index.
				elseif not l_base_class.is_generic and l_base_class /= universe.tuple_class then
					Result := l_type
				else
						-- Traverse all dynamic types with the same base class.
						-- If not found then add this new dynamic type.
					l_any := universe.any_class
					from until
						Result /= Void
					loop
						if l_type.base_type.same_base_type (a_type, a_context, l_any, universe) then
							Result := l_type
						elseif l_type.next_type = Void then
							l_base_type := a_type.base_type (a_context, universe)
							if l_base_class = universe.special_class then
								l_actual_parameters := l_base_type.actual_parameters
								if l_actual_parameters /= Void and then l_actual_parameters.count = 1 then
										-- Class SPECIAL should have exactly one generic parameter.
									l_item_type := dynamic_type (l_actual_parameters.type (1), l_any)
									l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
									create {ET_DYNAMIC_SPECIAL_TYPE} Result.make (l_base_type, l_base_class, l_item_type_set)
								else
									create Result.make (l_base_type, l_base_class)
								end
							elseif l_base_class = universe.tuple_class then
								l_actual_parameters := l_base_type.actual_parameters
								if l_actual_parameters /= Void then
									nb := l_actual_parameters.count
									if nb > 0 then
										create l_item_type_sets.make_with_capacity (nb)
										from i := 1 until i > nb loop
											l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
											l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
											l_item_type_sets.put_last (l_item_type_set)
											i := i + 1
										end
									else
										l_item_type_sets := empty_dynamic_type_sets
									end
								else
									l_item_type_sets := empty_dynamic_type_sets
								end
								create {ET_DYNAMIC_TUPLE_TYPE} Result.make (l_base_type, l_base_class, l_item_type_sets)
							elseif l_base_class = universe.array_class then
								create Result.make (l_base_type, l_base_class)
									-- Make features 'area', and 'lower' and 'upper' alive at the
									-- first three positions in the feature list of the ARRAY type.
								if array_area_feature /= Void then
									l_dynamic_feature := Result.dynamic_query (array_area_feature, Current)
								end
								if array_lower_feature /= Void then
									l_dynamic_feature := Result.dynamic_query (array_lower_feature, Current)
								end
								if array_upper_feature /= Void then
									l_dynamic_feature := Result.dynamic_query (array_upper_feature, Current)
								end
							elseif l_base_class = universe.typed_pointer_class then
								create Result.make (l_base_type, l_base_class)
									-- Make feature 'pointer_item' alive at the first position
									-- in the feature list of the TYPED_POINTER type.
								if typed_pointer_pointer_item_feature /= Void then
									l_dynamic_feature := Result.dynamic_query (typed_pointer_pointer_item_feature, Current)
								end
							elseif l_base_class = universe.procedure_class then
								l_actual_parameters := l_base_type.actual_parameters
								if l_actual_parameters /= Void and then l_actual_parameters.count = 2 then
									l_item_type := dynamic_type (l_actual_parameters.type (2), l_any)
									l_actual_parameters := l_item_type.base_type.actual_parameters
									if l_actual_parameters /= Void then
										nb := l_actual_parameters.count
										if nb > 0 then
											create l_item_type_sets.make_with_capacity (nb)
											from i := 1 until i > nb loop
												l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
												l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
												l_item_type_sets.put_last (l_item_type_set)
												i := i + 1
											end
										else
											l_item_type_sets := empty_dynamic_type_sets
										end
									else
										l_item_type_sets := empty_dynamic_type_sets
									end
									create {ET_DYNAMIC_PROCEDURE_TYPE} Result.make (l_base_type, l_base_class, l_item_type_sets)
								else
									create Result.make (l_base_type, l_base_class)
								end
							elseif l_base_class = universe.function_class then
								l_actual_parameters := l_base_type.actual_parameters
								if l_actual_parameters /= Void and then l_actual_parameters.count = 3 then
									l_return_type := dynamic_type (l_actual_parameters.type (3), l_any)
									l_return_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_return_type)
									l_item_type := dynamic_type (l_actual_parameters.type (2), l_any)
									l_actual_parameters := l_item_type.base_type.actual_parameters
									if l_actual_parameters /= Void then
										nb := l_actual_parameters.count
										if nb > 0 then
											create l_item_type_sets.make_with_capacity (nb)
											from i := 1 until i > nb loop
												l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
												l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
												l_item_type_sets.put_last (l_item_type_set)
												i := i + 1
											end
										else
											l_item_type_sets := empty_dynamic_type_sets
										end
									else
										l_item_type_sets := empty_dynamic_type_sets
									end
									create {ET_DYNAMIC_FUNCTION_TYPE} Result.make (l_base_type, l_base_class, l_item_type_sets, l_return_type_set)
								else
									create Result.make (l_base_type, l_base_class)
								end
							elseif l_base_class = universe.predicate_class then
								l_actual_parameters := l_base_type.actual_parameters
								if l_actual_parameters /= Void and then l_actual_parameters.count = 2 then
									l_return_type := boolean_type
									l_return_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_return_type)
									l_item_type := dynamic_type (l_actual_parameters.type (2), l_any)
									l_actual_parameters := l_item_type.base_type.actual_parameters
									if l_actual_parameters /= Void then
										nb := l_actual_parameters.count
										if nb > 0 then
											create l_item_type_sets.make_with_capacity (nb)
											from i := 1 until i > nb loop
												l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
												l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
												l_item_type_sets.put_last (l_item_type_set)
												i := i + 1
											end
										else
											l_item_type_sets := empty_dynamic_type_sets
										end
									else
										l_item_type_sets := empty_dynamic_type_sets
									end
									create {ET_DYNAMIC_FUNCTION_TYPE} Result.make (l_base_type, l_base_class, l_item_type_sets, l_return_type_set)
								else
									create Result.make (l_base_type, l_base_class)
								end
							else
								create Result.make (l_base_type, l_base_class)
							end
							dynamic_types.force_last (Result)
								-- `dynamic_type' is re-entrant. So at this stage
								-- 'l_type.next_type' is not necessarily Void anymore.
								-- We have to take that possibility into account.
							Result.set_next_type (l_type.next_type)
							l_type.set_next_type (Result)
						else
							l_type := l_type.next_type
						end
					end
				end
			end
			if Result = Void then
					-- No dynamic type yet with this base class.
					-- Add the new dynamic type and keep track
					-- of its associated index.
				l_base_class.process (universe.interface_checker)
				if not l_base_class.interface_checked or else l_base_class.has_interface_error then
					set_fatal_error
				end
				l_base_type := a_type.base_type (a_context, universe)
				if l_base_class = universe.special_class then
					l_actual_parameters := l_base_type.actual_parameters
					if l_actual_parameters /= Void and then l_actual_parameters.count = 1 then
							-- Class SPECIAL should have exactly one generic parameter.
						l_item_type := dynamic_type (l_actual_parameters.type (1), universe.any_class)
						l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
						create {ET_DYNAMIC_SPECIAL_TYPE} Result.make (l_base_type, l_base_class, l_item_type_set)
					else
						create Result.make (l_base_type, l_base_class)
					end
				elseif l_base_class = universe.tuple_class then
					l_any := universe.any_class
					l_actual_parameters := l_base_type.actual_parameters
					if l_actual_parameters /= Void then
						nb := l_actual_parameters.count
						if nb > 0 then
							create l_item_type_sets.make_with_capacity (nb)
							from i := 1 until i > nb loop
								l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
								l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
								l_item_type_sets.put_last (l_item_type_set)
								i := i + 1
							end
						else
							l_item_type_sets := empty_dynamic_type_sets
						end
					else
						l_item_type_sets := empty_dynamic_type_sets
					end
					create {ET_DYNAMIC_TUPLE_TYPE} Result.make (l_base_type, l_base_class, l_item_type_sets)
				elseif l_base_class = universe.array_class then
					create Result.make (l_base_type, l_base_class)
						-- Make features 'area', and 'lower' and 'upper' alive at the
						-- first three positions in the feature list of the ARRAY type.
					if array_area_feature /= Void then
						l_dynamic_feature := Result.dynamic_query (array_area_feature, Current)
					end
					if array_lower_feature /= Void then
						l_dynamic_feature := Result.dynamic_query (array_lower_feature, Current)
					end
					if array_upper_feature /= Void then
						l_dynamic_feature := Result.dynamic_query (array_upper_feature, Current)
					end
				elseif l_base_class = universe.typed_pointer_class then
					create Result.make (l_base_type, l_base_class)
						-- Make feature 'pointer_item' alive at the first position
						-- in the feature list of the TYPED_POINTER type.
					if typed_pointer_pointer_item_feature /= Void then
						l_dynamic_feature := Result.dynamic_query (typed_pointer_pointer_item_feature, Current)
					end
				elseif l_base_class = universe.procedure_class then
					l_any := universe.any_class
					l_actual_parameters := l_base_type.actual_parameters
					if l_actual_parameters /= Void and then l_actual_parameters.count = 2 then
						l_item_type := dynamic_type (l_actual_parameters.type (2), l_any)
						l_actual_parameters := l_item_type.base_type.actual_parameters
						if l_actual_parameters /= Void then
							nb := l_actual_parameters.count
							if nb > 0 then
								create l_item_type_sets.make_with_capacity (nb)
								from i := 1 until i > nb loop
									l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
									l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
									l_item_type_sets.put_last (l_item_type_set)
									i := i + 1
								end
							else
								l_item_type_sets := empty_dynamic_type_sets
							end
						else
							l_item_type_sets := empty_dynamic_type_sets
						end
						create {ET_DYNAMIC_PROCEDURE_TYPE} Result.make (l_base_type, l_base_class, l_item_type_sets)
					else
						create Result.make (l_base_type, l_base_class)
					end
				elseif l_base_class = universe.function_class then
					l_any := universe.any_class
					l_actual_parameters := l_base_type.actual_parameters
					if l_actual_parameters /= Void and then l_actual_parameters.count = 3 then
						l_return_type := dynamic_type (l_actual_parameters.type (3), l_any)
						l_return_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_return_type)
						l_item_type := dynamic_type (l_actual_parameters.type (2), l_any)
						l_actual_parameters := l_item_type.base_type.actual_parameters
						if l_actual_parameters /= Void then
							nb := l_actual_parameters.count
							if nb > 0 then
								create l_item_type_sets.make_with_capacity (nb)
								from i := 1 until i > nb loop
									l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
									l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
									l_item_type_sets.put_last (l_item_type_set)
									i := i + 1
								end
							else
								l_item_type_sets := empty_dynamic_type_sets
							end
						else
							l_item_type_sets := empty_dynamic_type_sets
						end
						create {ET_DYNAMIC_FUNCTION_TYPE} Result.make (l_base_type, l_base_class, l_item_type_sets, l_return_type_set)
					else
						create Result.make (l_base_type, l_base_class)
					end
				elseif l_base_class = universe.predicate_class then
					l_any := universe.any_class
					l_actual_parameters := l_base_type.actual_parameters
					if l_actual_parameters /= Void and then l_actual_parameters.count = 2 then
						l_return_type := boolean_type
						l_return_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_return_type)
						l_item_type := dynamic_type (l_actual_parameters.type (2), l_any)
						l_actual_parameters := l_item_type.base_type.actual_parameters
						if l_actual_parameters /= Void then
							nb := l_actual_parameters.count
							if nb > 0 then
								create l_item_type_sets.make_with_capacity (nb)
								from i := 1 until i > nb loop
									l_item_type := dynamic_type (l_actual_parameters.type (i), l_any)
									l_item_type_set := dynamic_type_set_builder.new_dynamic_type_set (l_item_type)
									l_item_type_sets.put_last (l_item_type_set)
									i := i + 1
								end
							else
								l_item_type_sets := empty_dynamic_type_sets
							end
						else
							l_item_type_sets := empty_dynamic_type_sets
						end
						create {ET_DYNAMIC_FUNCTION_TYPE} Result.make (l_base_type, l_base_class, l_item_type_sets, l_return_type_set)
					else
						create Result.make (l_base_type, l_base_class)
					end
				else
					create Result.make (l_base_type, l_base_class)
				end
				dynamic_types.force_last (Result)
					-- `dynamic_type' is re-entrant. So at this stage another type with
					-- the same base class may have been inserted into `dynamic_types'.
					-- We have to take that possibility into account.
				i := l_base_class.index
				if i >= 1 and i <= dynamic_types.count then
					l_type := dynamic_types.item (i)
					if l_type.base_class /= l_base_class then
							-- Wrong index.
						l_base_class.set_index (dynamic_types.count)
					else
							-- Another type has been inserted.
						Result.set_next_type (l_type.next_type)
						l_type.set_next_type (Result)
					end
				else
						-- No other type has been inserted.
					l_base_class.set_index (dynamic_types.count)
				end
			end
		ensure
			dynamic_type_not_void: Result /= Void
		end

	dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			-- Dynamic types in the system

feature -- Compilation

	compile is
			-- Compile current system.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_class: ET_CLASS
		do
			l_class := universe.root_class
			if l_class = universe.none_class then
				compile_all
			elseif l_class /= Void then
				compile_system
			end
		end

	compile_system is
			-- Compile all classes in the system.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_class: ET_CLASS
			l_name: ET_FEATURE_NAME
			l_procedure: ET_PROCEDURE
			l_query: ET_QUERY
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: DT_DATE_TIME
		do
			has_fatal_error := False
			universe.activate_processors
			activate_dynamic_type_set_builder
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			universe.preparse_single
			if error_handler.benchmark_shown then
				universe.print_time (dt1, "Degree 6")
			end
			compile_kernel
			l_class := universe.root_class
			if l_class = Void then
					-- Error: missing root class.
				set_fatal_error
				error_handler.report_gvsrc3a_error
			elseif l_class = universe.none_class then
					-- Error: the root creation feature is not declared as a
					-- publicly available creation procedure in the root class.
				l_name := universe.root_creation
				if l_name = Void then
					l_name := tokens.default_create_feature_name
				end
				set_fatal_error
				error_handler.report_gvsrc6a_error (l_class, l_name)
			elseif not l_class.is_preparsed then
					-- Error: unknown root class.
				set_fatal_error
				error_handler.report_gvsrc4a_error (l_class)
			else
				l_class.process (universe.eiffel_parser)
				if not l_class.is_parsed or else l_class.has_syntax_error then
						-- Error already reported.
					set_fatal_error
				elseif l_class.is_generic then
						-- Error: the root class should not be generic.
					set_fatal_error
					error_handler.report_vsrc1a_error (l_class)
				else
					root_type := dynamic_type (l_class, l_class)
					if l_class.has_interface_error then
							-- Error already reported.
						set_fatal_error
					else
						l_name := universe.root_creation
						if l_name /= Void then
							l_procedure := l_class.named_procedure (l_name)
						elseif universe.default_create_seed /= 0 then
							l_procedure := l_class.seeded_procedure (universe.default_create_seed)
							l_name := tokens.default_create_feature_name
						else
							l_name := tokens.default_create_feature_name
							l_procedure := l_class.named_procedure (l_name)
						end
						if l_procedure = Void then
							if l_name /= Void then
								l_query := l_class.named_query (l_name)
							elseif universe.default_create_seed /= 0 then
								l_query := l_class.seeded_query (universe.default_create_seed)
								l_name := tokens.default_create_feature_name
							else
								l_name := tokens.default_create_feature_name
								l_query := l_class.named_query (l_name)
							end
							if l_query = Void then
									-- Error: the root creation procedure is not
									-- a feature of the root class.
								set_fatal_error
								error_handler.report_gvsrc5a_error (l_class, l_name)
							else
									-- Internal error: the root creation feature is not a procedure.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						elseif not l_class.is_creation_directly_exported_to (l_procedure.name, universe.any_class) then
							set_fatal_error
							error_handler.report_gvsrc6a_error (l_class, l_procedure.name)
						else
							root_creation_procedure := root_type.dynamic_procedure (l_procedure, Current)
							root_creation_procedure.set_creation (True)
							root_type.set_alive
							build_dynamic_type_sets
						end
					end
				end
			end
		end

	compile_all is
			-- Compile all classes in the universe.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: ET_PROCEDURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: DT_DATE_TIME
		do
			has_fatal_error := False
			universe.activate_processors
			activate_dynamic_type_set_builder
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			universe.parse_all
			if error_handler.benchmark_shown then
				universe.print_time (dt1, "Degree 5")
				dt1 := l_clock.system_clock.date_time_now
			end
			universe.compile_degree_4
			if error_handler.benchmark_shown then
				universe.print_time (dt1, "Degree 4")
				dt1 := l_clock.system_clock.date_time_now
			end
			universe.compile_degree_3
			if error_handler.benchmark_shown then
				universe.print_time (dt1, "Degree 3")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_kernel
			l_cursor := universe.classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.implementation_checked and then not l_class.has_implementation_error then
					if not l_class.is_deferred and not l_class.is_generic then
						l_dynamic_type := dynamic_type (l_class, l_class)
						l_queries := l_class.queries
						--nb := l_queries.count
						nb := l_queries.declared_count
						from i := 1 until i > nb loop
							l_query := l_queries.item (i)
							l_dynamic_feature := l_dynamic_type.dynamic_query (l_query, Current)
							i := i + 1
						end
						l_procedures := l_class.procedures
						--nb := l_procedures.count
						nb := l_procedures.declared_count
						from i := 1 until i > nb loop
							l_procedure := l_procedures.item (i)
							l_dynamic_feature := l_dynamic_type.dynamic_procedure (l_procedure, Current)
							i := i + 1
						end
					end
				end
				l_cursor.forth
			end
			build_dynamic_type_sets
			if error_handler.benchmark_shown then
				universe.print_time (dt1, "Degree Dynamic Type Set")
			end
		end

feature {NONE} -- Compilation

	compile_kernel is
			-- Compile kernel classes.
		local
			l_any: ET_CLASS_TYPE
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_generic_class_type: ET_GENERIC_CLASS_TYPE
			l_class: ET_CLASS
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_area_feature: ET_QUERY
			l_count_feature: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_external_function: ET_EXTERNAL_FUNCTION
		do
			dynamic_types.wipe_out
			l_any := universe.any_class
				-- Type "BOOLEAN".
			l_class := universe.boolean_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			boolean_type := dynamic_type (l_class, l_any)
				-- Type "CHARACTER_8".
			l_class := universe.character_8_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			character_8_type := dynamic_type (l_class, l_any)
				-- Type "CHARACTER_32".
			l_class := universe.character_32_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			character_32_type := dynamic_type (l_class, l_any)
				-- Type "CHARACTER".
			l_class := universe.character_class
			if l_class = universe.character_8_class then
				character_type := character_8_type
			elseif l_class = universe.character_32_class then
				character_type := character_32_type
			else
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				character_type := dynamic_type (l_class, l_any)
			end
				-- Type "WIDE_CHARACTER".
			l_class := universe.wide_character_class
			if l_class = universe.character_8_class then
				wide_character_type := character_8_type
			elseif l_class = universe.character_32_class then
				wide_character_type := character_32_type
			else
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				wide_character_type := dynamic_type (l_class, l_any)
			end
				-- Type "INTEGER_8".
			l_class := universe.integer_8_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			integer_8_type := dynamic_type (l_class, l_any)
				-- Type "INTEGER_16".
			l_class := universe.integer_16_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			integer_16_type := dynamic_type (l_class, l_any)
				-- Type "INTEGER_32".
			l_class := universe.integer_32_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			integer_32_type := dynamic_type (l_class, l_any)
				-- Type "INTEGER_64".
			l_class := universe.integer_64_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			integer_64_type := dynamic_type (l_class, l_any)
				-- Type "INTEGER".
			l_class := universe.integer_class
			if l_class = universe.integer_8_class then
				integer_type := integer_8_type
			elseif l_class = universe.integer_16_class then
				integer_type := integer_16_type
			elseif l_class = universe.integer_32_class then
				integer_type := integer_32_type
			elseif l_class = universe.integer_64_class then
				integer_type := integer_64_type
			else
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				integer_type := dynamic_type (l_class, l_any)
			end
				-- Type "NATURAL_8".
			l_class := universe.natural_8_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			natural_8_type := dynamic_type (l_class, l_any)
				-- Type "NATURAL_16".
			l_class := universe.natural_16_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			natural_16_type := dynamic_type (l_class, l_any)
				-- Type "NATURAL_32".
			l_class := universe.natural_32_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			natural_32_type := dynamic_type (l_class, l_any)
				-- Type "NATURAL_64".
			l_class := universe.natural_64_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			natural_64_type := dynamic_type (l_class, l_any)
				-- Type "NATURAL".
			l_class := universe.natural_class
			if l_class = universe.natural_8_class then
				natural_type := natural_8_type
			elseif l_class = universe.natural_16_class then
				natural_type := natural_16_type
			elseif l_class = universe.natural_32_class then
				natural_type := natural_32_type
			elseif l_class = universe.natural_64_class then
				natural_type := natural_64_type
			else
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				natural_type := dynamic_type (l_class, l_any)
			end
				-- Type "REAL_32".
			l_class := universe.real_32_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			real_32_type := dynamic_type (l_class, l_any)
				-- Type "REAL_64".
			l_class := universe.real_64_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			real_64_type := dynamic_type (l_class, l_any)
				-- Type "REAL".
			l_class := universe.real_class
			if l_class = universe.real_32_class then
				real_type := real_32_type
			elseif l_class = universe.real_64_class then
				real_type := real_64_type
			else
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				real_type := dynamic_type (l_class, l_any)
			end
				-- Type "DOUBLE".
			l_class := universe.double_class
			if l_class = universe.real_32_class then
				double_type := real_32_type
			elseif l_class = universe.real_64_class then
				double_type := real_64_type
			else
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				double_type := dynamic_type (l_class, l_any)
			end
				-- Type "POINTER".
			l_class := universe.pointer_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			pointer_type := dynamic_type (l_class, l_any)
				-- Type "SPECIAL[CHARACTER_8]"
			l_class := universe.special_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			create l_actual_parameters.make_with_capacity (1)
			l_actual_parameters.put_first (universe.character_8_class)
			create l_generic_class_type.make (Void, l_class.name, l_actual_parameters, l_class)
			special_character_8_type := dynamic_type (l_generic_class_type, l_any)
				-- Type "SPECIAL[CHARACTER_32]"
			l_class := universe.special_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			create l_actual_parameters.make_with_capacity (1)
			l_actual_parameters.put_first (universe.character_32_class)
			create l_generic_class_type.make (Void, l_class.name, l_actual_parameters, l_class)
			special_character_32_type := dynamic_type (l_generic_class_type, l_any)
				-- Type "SPECIAL[CHARACTER]"
			l_class := universe.character_class
			if l_class = universe.character_8_class then
				special_character_type := special_character_8_type
			elseif l_class = universe.character_32_class then
				special_character_type := special_character_32_type
			else
				l_class := universe.special_class
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				create l_actual_parameters.make_with_capacity (1)
				l_actual_parameters.put_first (universe.character_class)
				create l_generic_class_type.make (Void, l_class.name, l_actual_parameters, l_class)
				special_character_type := dynamic_type (l_generic_class_type, l_any)
			end
				-- Type "STRING_8".
			l_class := universe.string_8_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			string_8_type := dynamic_type (l_class, l_any)
			if l_class.has_interface_error then
					-- Error already reported.
				set_fatal_error
			else
					-- Make features 'area' and 'count' alive at the first
					-- two positions in the feature list of the STRING_8 type.
				l_area_feature := l_class.named_query (tokens.area_feature_name)
				if l_area_feature = Void then
					l_procedure := l_class.named_procedure (tokens.area_feature_name)
					if l_procedure /= Void then
						set_fatal_error
						error_handler.report_gvkfe2a_error (l_class, l_area_feature)
					else
						set_fatal_error
						error_handler.report_gvkfe1a_error (l_class, tokens.area_feature_name)
					end
				elseif not l_area_feature.is_attribute then
					set_fatal_error
					error_handler.report_gvkfe2a_error (l_class, l_area_feature)
				else
					l_dynamic_feature := string_8_type.dynamic_query (l_area_feature, Current)
					l_result_type_set := l_dynamic_feature.result_type_set
					if l_result_type_set = Void then
							-- Internal error: an attribute should have a result type.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_result_type_set.static_type /= special_character_8_type then
						set_fatal_error
						error_handler.report_gvkfe3a_error (l_class, l_area_feature, special_character_8_type.base_type)
					end
				end
				l_count_feature := l_class.named_query (tokens.count_feature_name)
				if l_count_feature = Void then
					l_procedure := l_class.named_procedure (tokens.count_feature_name)
					if l_procedure /= Void then
						set_fatal_error
						error_handler.report_gvkfe2a_error (l_class, l_count_feature)
					else
						set_fatal_error
						error_handler.report_gvkfe1a_error (l_class, tokens.count_feature_name)
					end
				elseif not l_count_feature.is_attribute then
					set_fatal_error
					error_handler.report_gvkfe2a_error (l_class, l_count_feature)
				else
					l_dynamic_feature := string_8_type.dynamic_query (l_count_feature, Current)
					l_result_type_set := l_dynamic_feature.result_type_set
					if l_result_type_set = Void then
							-- Internal error: an attribute should have a result type.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_result_type_set.static_type /= integer_type then
						set_fatal_error
						error_handler.report_gvkfe3a_error (l_class, l_count_feature, integer_type.base_type)
					end
				end
			end
				-- Type "STRING_32".
			l_class := universe.string_32_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			end
			string_32_type := dynamic_type (l_class, l_any)
			if l_class.has_interface_error then
					-- Error already reported.
				set_fatal_error
			else
					-- Make features 'area' and 'count' alive at the first
					-- two positions in the feature list of the STRING_32 type.
				l_area_feature := l_class.named_query (tokens.area_feature_name)
				if l_area_feature = Void then
					l_procedure := l_class.named_procedure (tokens.area_feature_name)
					if l_procedure /= Void then
						set_fatal_error
						error_handler.report_gvkfe2a_error (l_class, l_area_feature)
					else
						set_fatal_error
						error_handler.report_gvkfe1a_error (l_class, tokens.area_feature_name)
					end
				elseif not l_area_feature.is_attribute then
					set_fatal_error
					error_handler.report_gvkfe2a_error (l_class, l_area_feature)
				else
					l_dynamic_feature := string_32_type.dynamic_query (l_area_feature, Current)
					l_result_type_set := l_dynamic_feature.result_type_set
					if l_result_type_set = Void then
							-- Internal error: an attribute should have a result type.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_result_type_set.static_type /= special_character_32_type then
						set_fatal_error
						error_handler.report_gvkfe3a_error (l_class, l_area_feature, special_character_32_type.base_type)
					end
				end
				l_count_feature := l_class.named_query (tokens.count_feature_name)
				if l_count_feature = Void then
					l_procedure := l_class.named_procedure (tokens.count_feature_name)
					if l_procedure /= Void then
						set_fatal_error
						error_handler.report_gvkfe2a_error (l_class, l_count_feature)
					else
						set_fatal_error
						error_handler.report_gvkfe1a_error (l_class, tokens.count_feature_name)
					end
				elseif not l_count_feature.is_attribute then
					set_fatal_error
					error_handler.report_gvkfe2a_error (l_class, l_count_feature)
				else
					l_dynamic_feature := string_32_type.dynamic_query (l_count_feature, Current)
					l_result_type_set := l_dynamic_feature.result_type_set
					if l_result_type_set = Void then
							-- Internal error: an attribute should have a result type.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_result_type_set.static_type /= integer_type then
						set_fatal_error
						error_handler.report_gvkfe3a_error (l_class, l_count_feature, integer_type.base_type)
					end
				end
			end
				-- Class "STRING".
			l_class := universe.string_class
			if l_class = universe.string_8_class then
				string_type := string_8_type
			elseif l_class = universe.string_32_class then
				string_type := string_32_type
			else
				if not l_class.is_preparsed then
					set_fatal_error
					error_handler.report_gvknl1a_error (l_class)
				end
				string_type := dynamic_type (l_class, l_any)
				if l_class.has_interface_error then
						-- Error already reported.
					set_fatal_error
				else
						-- Make features 'area' and 'count' alive at the first
						-- two positions in the feature list of the STRING type.
					l_area_feature := l_class.named_query (tokens.area_feature_name)
					if l_area_feature = Void then
						l_procedure := l_class.named_procedure (tokens.area_feature_name)
						if l_procedure /= Void then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_area_feature)
						else
							set_fatal_error
							error_handler.report_gvkfe1a_error (l_class, tokens.area_feature_name)
						end
					elseif not l_area_feature.is_attribute then
						set_fatal_error
						error_handler.report_gvkfe2a_error (l_class, l_area_feature)
					else
						l_dynamic_feature := string_type.dynamic_query (l_area_feature, Current)
						l_result_type_set := l_dynamic_feature.result_type_set
						if l_result_type_set = Void then
								-- Internal error: an attribute should have a result type.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_result_type_set.static_type /= special_character_type then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, l_area_feature, special_character_type.base_type)
						end
					end
					l_count_feature := l_class.named_query (tokens.count_feature_name)
					if l_count_feature = Void then
						l_procedure := l_class.named_procedure (tokens.count_feature_name)
						if l_procedure /= Void then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, l_count_feature)
						else
							set_fatal_error
							error_handler.report_gvkfe1a_error (l_class, tokens.count_feature_name)
						end
					elseif not l_count_feature.is_attribute then
						set_fatal_error
						error_handler.report_gvkfe2a_error (l_class, l_count_feature)
					else
						l_dynamic_feature := string_type.dynamic_query (l_count_feature, Current)
						l_result_type_set := l_dynamic_feature.result_type_set
						if l_result_type_set = Void then
								-- Internal error: an attribute should have a result type.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_result_type_set.static_type /= integer_type then
							set_fatal_error
							error_handler.report_gvkfe3a_error (l_class, l_count_feature, integer_type.base_type)
						end
					end
				end
			end
				-- Class "ARRAY".
			array_area_feature := Void
			array_lower_feature := Void
			array_upper_feature := Void
			l_class := universe.array_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			else
				l_class.process (universe.interface_checker)
				if not l_class.interface_checked or else l_class.has_interface_error then
						-- Error already reported by the previous
						-- processing on `l_class'.
					set_fatal_error
				else
						-- Check features `area', and `lower' and `upper' of class ARRAY.
					array_area_feature := l_class.named_query (tokens.area_feature_name)
					if array_area_feature = Void then
						l_procedure := l_class.named_procedure (tokens.area_feature_name)
						if l_procedure /= Void then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, array_area_feature)
						else
							set_fatal_error
							error_handler.report_gvkfe1a_error (l_class, tokens.area_feature_name)
						end
					elseif not array_area_feature.is_attribute then
						set_fatal_error
						error_handler.report_gvkfe2a_error (l_class, array_area_feature)
						array_area_feature := Void
					elseif not array_area_feature.type.same_named_type (universe.special_class, l_class, l_class, universe) then
						set_fatal_error
						error_handler.report_gvkfe3a_error (l_class, array_area_feature, universe.special_class)
						array_area_feature := Void
					end
					array_lower_feature := l_class.named_query (tokens.lower_feature_name)
					if array_lower_feature = Void then
						l_procedure := l_class.named_procedure (tokens.lower_feature_name)
						if l_procedure /= Void then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, array_lower_feature)
						else
							set_fatal_error
							error_handler.report_gvkfe1a_error (l_class, tokens.lower_feature_name)
						end
					elseif not array_lower_feature.is_attribute then
						set_fatal_error
						error_handler.report_gvkfe2a_error (l_class, array_lower_feature)
						array_lower_feature := Void
					elseif not array_lower_feature.type.same_named_type (universe.integer_class, l_class, l_class, universe) then
						set_fatal_error
						error_handler.report_gvkfe3a_error (l_class, array_lower_feature, universe.integer_class)
						array_lower_feature := Void
					end
					array_upper_feature := l_class.named_query (tokens.upper_feature_name)
					if array_upper_feature = Void then
						l_procedure := l_class.named_procedure (tokens.upper_feature_name)
						if l_procedure /= Void then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, array_upper_feature)
						else
							set_fatal_error
							error_handler.report_gvkfe1a_error (l_class, tokens.upper_feature_name)
						end
					elseif not array_upper_feature.is_attribute then
						set_fatal_error
						error_handler.report_gvkfe2a_error (l_class, array_upper_feature)
						array_upper_feature := Void
					elseif not array_upper_feature.type.same_named_type (universe.integer_class, l_class, l_class, universe) then
						set_fatal_error
						error_handler.report_gvkfe3a_error (l_class, array_upper_feature, universe.integer_class)
						array_upper_feature := Void
					end
				end
			end
				-- Class TYPED_POINTER.
			typed_pointer_pointer_item_feature := Void
			l_class := universe.typed_pointer_class
			if not l_class.is_preparsed then
				set_fatal_error
				error_handler.report_gvknl1a_error (l_class)
			else
				l_class.process (universe.interface_checker)
				if not l_class.interface_checked or else l_class.has_interface_error then
						-- Error already reported by the previous
						-- processing on `l_class'.
					set_fatal_error
				else
						-- Check feature 'pointer_item' of class TYPED_POINTER.
					typed_pointer_pointer_item_feature := l_class.named_query (tokens.pointer_item_feature_name)
					if typed_pointer_pointer_item_feature = Void then
						l_procedure := l_class.named_procedure (tokens.pointer_item_feature_name)
						if l_procedure /= Void then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, typed_pointer_pointer_item_feature)
						else
							set_fatal_error
							error_handler.report_gvkfe1a_error (l_class, tokens.pointer_item_feature_name)
						end
					elseif not typed_pointer_pointer_item_feature.type.same_named_type (universe.pointer_class, l_class, l_class, universe) then
						set_fatal_error
						error_handler.report_gvkfe3a_error (l_class, typed_pointer_pointer_item_feature, universe.pointer_class)
						typed_pointer_pointer_item_feature := Void
					elseif not typed_pointer_pointer_item_feature.is_attribute then
						l_external_function ?= typed_pointer_pointer_item_feature
						if l_external_function = Void or else l_external_function.builtin_code /= tokens.builtin_pointer_feature (tokens.builtin_pointer_item) then
							set_fatal_error
							error_handler.report_gvkfe2a_error (l_class, typed_pointer_pointer_item_feature)
							typed_pointer_pointer_item_feature := Void
						end
					end
				end
			end
				-- Type "ANY".
			any_type := dynamic_type (universe.any_class, l_any)
				-- Type "NONE".
			none_type := dynamic_type (universe.none_class, l_any)
		end

	build_dynamic_type_sets is
			-- Build dynamic type sets for current system.
		local
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
		do
			l_builder := dynamic_type_set_builder
			l_builder.set_no_debug (True)
			l_builder.set_no_assertion (True)
			l_builder.set_catcall_mode (catcall_mode)
			l_builder.build_dynamic_type_sets
			if l_builder.has_fatal_error then
				set_fatal_error
			end
		end

feature -- Error handling

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred?

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := universe.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Processors

	dynamic_type_set_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			-- Builder of dynamic type sets

	null_dynamic_type_set_builder: ET_DYNAMIC_NULL_TYPE_SET_BUILDER
			-- Null builder of dynamic type sets

	activate_dynamic_type_set_builder is
			-- Activate dynamic type set builder.
		do
			if dynamic_type_set_builder = null_dynamic_type_set_builder then
				create {ET_DYNAMIC_PUSH_TYPE_SET_BUILDER} dynamic_type_set_builder.make (Current)
				dynamic_type_set_builder.set_catcall_mode (catcall_mode)
			end
		end

	set_dynamic_type_set_builder (a_builder: like dynamic_type_set_builder) is
			-- Set `dynamic_type_set_builder' to `a_builder'.
		require
			a_builder_not_void: a_builder /= Void
		do
			dynamic_type_set_builder := a_builder
			dynamic_type_set_builder.set_catcall_mode (catcall_mode)
		ensure
			dynamic_type_set_builder_set: dynamic_type_set_builder = a_builder
		end

feature {NONE} -- Features

	array_area_feature: ET_QUERY
	array_lower_feature: ET_QUERY
	array_upper_feature: ET_QUERY
			-- Expected attributes in class ARRAY

	typed_pointer_pointer_item_feature: ET_QUERY
			-- Expected attributes in class TYPED_POINTER

feature {NONE} -- Implementation

	empty_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST is
			-- Empty dynamic type set list
		once
			create Result.make
		ensure
			dynamic_type_sets_not_void: Result /= Void
			dynamic_type_sets_empty: Result.is_empty
		end

invariant

	universe_not_void: universe /= Void
	dynamic_types_not_void: dynamic_types /= Void
	no_void_dynamic_type: not dynamic_types.has (Void)
	any_type_not_void: any_type /= Void
	none_type_not_void: none_type /= Void
	boolean_type_not_void: boolean_type /= Void
	character_type_not_void: character_type /= Void
	wide_character_type_not_void: wide_character_type /= Void
	character_8_type_not_void: character_8_type /= Void
	character_32_type_not_void: character_32_type /= Void
	integer_type_not_void: integer_type /= Void
	integer_8_type_not_void: integer_8_type /= Void
	integer_16_type_not_void: integer_16_type /= Void
	integer_32_type_not_void: integer_32_type /= Void
	integer_64_type_not_void: integer_64_type /= Void
	natural_type_not_void: natural_type /= Void
	natural_8_type_not_void: natural_8_type /= Void
	natural_16_type_not_void: natural_16_type /= Void
	natural_32_type_not_void: natural_32_type /= Void
	natural_64_type_not_void: natural_64_type /= Void
	real_type_not_void: real_type /= Void
	double_type_not_void: double_type /= Void
	real_32_type_not_void: real_32_type /= Void
	real_64_type_not_void: real_64_type /= Void
	pointer_type_not_void: pointer_type /= Void
	string_type_not_void: string_type /= Void
	string_8_type_not_void: string_8_type /= Void
	string_32_type_not_void: string_32_type /= Void
	special_character_type_not_void: special_character_type /= Void
	special_character_8_type_not_void: special_character_8_type /= Void
	special_character_32_type_not_void: special_character_32_type /= Void
	root_creation_procedure: root_creation_procedure /= Void implies root_creation_procedure.is_procedure
	dynamic_type_set_builder_not_void: dynamic_type_set_builder /= Void
	null_dynamic_type_set_builder_not_void: null_dynamic_type_set_builder /= Void

end
