indexing

	description:

		"Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYSTEM

creation

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
			create dynamic_types.make (nb)
			make_basic_types
		ensure
			universe_set: universe = a_universe
		end

	make_basic_types is
			-- Create basic types.
		local
			l_any: ET_CLASS_TYPE
		do
			l_any := universe.any_class
			character_type := dynamic_type (universe.character_class, l_any)
			character_type.set_alive (True)
			string_type := dynamic_type (universe.string_class, l_any)
			string_type.set_alive (True)
			boolean_type := dynamic_type (universe.boolean_class, l_any)
			boolean_type.set_alive (True)
			wide_character_type := dynamic_type (universe.wide_character_class, l_any)
			wide_character_type.set_alive (True)
			integer_type := dynamic_type (universe.integer_class, l_any)
			integer_type.set_alive (True)
			integer_8_type := dynamic_type (universe.integer_8_class, l_any)
			integer_8_type.set_alive (True)
			integer_16_type := dynamic_type (universe.integer_16_class, l_any)
			integer_16_type.set_alive (True)
			integer_64_type := dynamic_type (universe.integer_64_class, l_any)
			integer_64_type.set_alive (True)
			real_type := dynamic_type (universe.real_class, l_any)
			real_type.set_alive (True)
			double_type := dynamic_type (universe.double_class, l_any)
			double_type.set_alive (True)
			pointer_type := dynamic_type (universe.pointer_class, l_any)
			pointer_type.set_alive (True)
			procedure_type := dynamic_type (universe.procedure_class, l_any)
			procedure_type.set_alive (True)
			predicate_type := dynamic_type (universe.predicate_class, l_any)
			predicate_type.set_alive (True)
			function_type := dynamic_type (universe.function_class, l_any)
			function_type.set_alive (True)
			none_type := dynamic_type (universe.none_class, l_any)
		ensure
			none_type_not_void: none_type /= Void
			character_type_not_void: character_type /= Void
			string_type_not_void: string_type /= Void
			boolean_type_not_void: boolean_type /= Void
			wide_character_type_not_void: wide_character_type /= Void
			integer_type_not_void: integer_type /= Void
			integer_8_type_not_void: integer_8_type /= Void
			integer_16_type_not_void: integer_16_type /= Void
			integer_64_type_not_void: integer_64_type /= Void
			real_type_not_void: real_type /= Void
			double_type_not_void: double_type /= Void
			pointer_type_not_void: pointer_type /= Void
			procedure_type_not_void: procedure_type /= Void
			predicate_type_not_void: predicate_type /= Void
			function_type_not_void: function_type /= Void
		end

feature -- Access

	root_type: ET_DYNAMIC_TYPE
			-- Root type

	root_creation_procedure: ET_DYNAMIC_FEATURE
			-- Root creation procedure

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Types

	character_type: ET_DYNAMIC_TYPE
			-- Type "CHARACTER"

	string_type: ET_DYNAMIC_TYPE
			-- Type "STRING"

	boolean_type: ET_DYNAMIC_TYPE
			-- Type "BOOLEAN"

	wide_character_type: ET_DYNAMIC_TYPE
			-- Type "WIDE_CHARACTER"

	integer_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER"

	integer_8_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER_8"

	integer_16_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER_16"

	integer_64_type: ET_DYNAMIC_TYPE
			-- Type "INTEGER_64"

	real_type: ET_DYNAMIC_TYPE
			-- Type "REAL"

	double_type: ET_DYNAMIC_TYPE
			-- Type "DOUBLE"

	pointer_type: ET_DYNAMIC_TYPE
			-- Type "POINTER"

	procedure_type: ET_DYNAMIC_TYPE
			-- Type "PROCEDURE"

	predicate_type: ET_DYNAMIC_TYPE
			-- Type "PREDICATE"

	function_type: ET_DYNAMIC_TYPE
			-- Type "FUNCTION"

	none_type: ET_DYNAMIC_TYPE
			-- Type "NONE"

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
			l_any: ET_CLASS_TYPE
			l_base_type: ET_BASE_TYPE
			l_base_class: ET_CLASS
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
		do
			l_base_type := a_type.base_type (a_context, universe)
			l_base_class := l_base_type.direct_base_class (universe)
			dynamic_types.search (l_base_class)
			if dynamic_types.found then
				l_any := universe.any_class
				l_dynamic_types := dynamic_types.found_item
				nb := l_dynamic_types.count
				from i := 1 until i > nb loop
					l_type := l_dynamic_types.item (i)
					if l_type.base_type.same_base_type (a_type, a_context, l_any, universe) then
						Result := l_type
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			else
				if l_base_class.is_generic then
					create l_dynamic_types.make (10)
				else
					create l_dynamic_types.make (1)
				end
				dynamic_types.force_last (l_dynamic_types, l_base_class)
			end
			if Result = Void then
				l_base_class.process (universe.interface_checker)
				create Result.make (l_base_type, l_base_class)
				l_dynamic_types.force_last (Result)
			end
		ensure
			dynamic_type_not_void: Result /= Void
		end

	dynamic_types: DS_HASH_TABLE [DS_ARRAYED_LIST [ET_DYNAMIC_TYPE], ET_CLASS]
			-- Dynamic types in the system

feature -- Compilation

	compile is
			-- Compile current system.
		local
			l_class: ET_CLASS
			l_name: ET_IDENTIFIER
			l_feature: ET_FEATURE
			l_command: KL_SHELL_COMMAND
			l_eiffel_parser: ET_EIFFEL_PARSER
		do
			universe.activate_processors
			universe.preparse_single
			l_eiffel_parser := universe.eiffel_parser
			l_class := character_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := string_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := boolean_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := wide_character_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := integer_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := integer_8_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := integer_16_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := integer_64_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := real_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := double_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := pointer_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := procedure_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := predicate_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := function_type.base_class
			if l_class.is_preparsed then
				l_class.process (l_eiffel_parser)
			end
			l_class := universe.root_class
			if l_class = universe.none_class then
				compile_all
			elseif l_class /= Void then
				root_type := dynamic_type (l_class, l_class)
				universe.set_feature_seeds
				if universe.root_creation /= Void then
					l_feature := l_class.named_feature (universe.root_creation)
				elseif universe.default_create_seed /= 0 then
					l_feature := l_class.seeded_feature (universe.default_create_seed)
				else
					create l_name.make ("default_create")
					l_feature := l_class.named_feature (l_name)
				end
				if l_feature = Void then
-- TODO
				elseif not l_feature.is_procedure then
-- TODO.
				else
					root_creation_procedure := root_type.dynamic_feature (l_feature, Current)
					root_creation_procedure.set_creation (True)
					root_type.set_alive (True)
					build_dynamic_type_sets
					generate_ids
					generate_c_code
					if universe.system_name /= Void then
						create l_command.make ("cl " + universe.system_name + ".c")
					else
						create l_command.make ("cl " + l_class.name.name + ".c")
					end
					l_command.execute
				end
			end
		end

	compile_all is
			-- Compile whole universe.
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_features: ET_FEATURE_LIST
			l_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			universe.compile_all (False)
			create l_builder.make (Current)
			l_cursor := universe.classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.implementation_checked and then not l_class.has_implementation_error then
					if not l_class.is_deferred and not l_class.is_generic then
						l_dynamic_type := dynamic_type (l_class, l_class)
						l_features := l_class.features
						--nb := l_features.count
						nb := l_class.declared_feature_count
						from i := 1 until i > nb loop
							l_feature := l_features.item (i)
							l_dynamic_feature := l_dynamic_type.dynamic_feature (l_feature, Current)
							l_builder.build_dynamic_type_sets (l_dynamic_feature, l_dynamic_type)
							i := i + 1
						end
					end
				end
				l_cursor.forth
			end
			build_dynamic_type_sets
		end

	build_dynamic_type_sets is
			-- Build dynamic type sets for current system.
		local
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			i, nb: INTEGER
			l_type: ET_DYNAMIC_TYPE
			j, nb2: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			done: BOOLEAN
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_cursor: DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [ET_DYNAMIC_TYPE], ET_CLASS]
		do
			l_cursor := dynamic_types.new_cursor
			create l_builder.make (Current)
			from until done loop
				done := True
				from l_cursor.start until l_cursor.after loop
					l_dynamic_types := l_cursor.item
					nb := l_dynamic_types.count
					from i := 1 until i > nb loop
						l_type := l_dynamic_types.item (i)
						l_features := l_type.features
						if l_features /= Void then
							nb2 := l_features.count
							from j := 1 until j > nb2 loop
								l_feature := l_features.item (j)
								if not l_feature.is_built then
									l_builder.build_dynamic_type_sets (l_feature, l_type)
									done := False
								end
								j := j + 1
							end
						end
						i := i + 1
					end
					l_cursor.forth
				end
			end
		end

	generate_c_code is
			-- Generate C code for current system.
		local
			l_generator: ET_C_GENERATOR
			l_file: KL_TEXT_OUTPUT_FILE
		do
			if universe.system_name /= Void then
				create l_file.make (universe.system_name + ".c")
			else
				create l_file.make (universe.root_class.name.name + ".c")
			end
			l_file.open_write
			if l_file.is_open_write then
				create l_generator.make (Current)
				l_generator.generate (l_file)
				l_file.close
			else
-- TODO: report error.
			end
		end

	generate_ids is
			-- Generate types and feature ids.
		local
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			j, nb2: INTEGER
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_cursor: DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [ET_DYNAMIC_TYPE], ET_CLASS]
		do
			l_cursor := dynamic_types.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_dynamic_types := l_cursor.item
				nb := l_dynamic_types.count
				from i := 1 until i > nb loop
					l_type := l_dynamic_types.item (i)
					l_type.set_id (i)
					if l_type.is_alive then
						l_features := l_type.features
						if l_features /= Void then
							nb2 := l_features.count
							from j := 1 until j > nb2 loop
								l_feature := l_features.item (j)
								l_feature.set_id (j)
								j := j + 1
							end
						end
					end
					i := i + 1
				end
				l_cursor.forth
			end
		end

invariant

	universe_not_void: universe /= Void
	dynamic_types_not_void: dynamic_types /= Void
	no_void_dynamic_types: not dynamic_types.has_item (Void)
	-- no_void_dynamic_type: forall item in dynamic_types, not item.has (Void)
	none_type_not_void: none_type /= Void
	character_type_not_void: character_type /= Void
	string_type_not_void: string_type /= Void
	boolean_type_not_void: boolean_type /= Void
	wide_character_type_not_void: wide_character_type /= Void
	integer_type_not_void: integer_type /= Void
	integer_8_type_not_void: integer_8_type /= Void
	integer_16_type_not_void: integer_16_type /= Void
	integer_64_type_not_void: integer_64_type /= Void
	real_type_not_void: real_type /= Void
	double_type_not_void: double_type /= Void
	pointer_type_not_void: pointer_type /= Void
	procedure_type_not_void: procedure_type /= Void
	predicate_type_not_void: predicate_type /= Void
	function_type_not_void: function_type /= Void
	root_creation_procedure: root_creation_procedure /= Void implies root_creation_procedure.is_procedure

end
