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
			none_type := dynamic_type (universe.none_class, l_any)
		ensure
			none_type_not_void: none_type /= Void
			character_type_not_void: character_type /= Void
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

	none_type: ET_DYNAMIC_TYPE
			-- Type "NONE"

	dynamic_type (a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT): ET_DYNAMIC_TYPE is
			-- Dynamic type corresponding to `a_type' in `a_context';
			-- Create a new one if it does not exist yet
		require
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_any: ET_CLASS_TYPE
			l_base_type: ET_BASE_TYPE
			l_base_class: ET_CLASS
		do
			l_any := universe.any_class
			nb := dynamic_types.count
			from i := 1 until i > nb loop
				l_type := dynamic_types.item (i)
				if l_type.base_type.same_base_type (a_type, a_context, l_any, universe) then
					Result := l_type
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
			if Result = Void then
				l_base_type := a_type.base_type (a_context, universe)
				l_base_class := l_base_type.direct_base_class (universe)
				l_base_class.process (universe.interface_checker)
				create Result.make (l_base_type, l_base_class)
				dynamic_types.force_last (Result)
			end
		ensure
			dynamic_type_not_void: Result /= Void
		end

	dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			-- Dynamic types in the system

feature -- Compilation

	compile is
			-- Compile current system.
		local
			l_class: ET_CLASS
			l_name: ET_IDENTIFIER
			l_feature: ET_FEATURE
			l_command: KL_SHELL_COMMAND
		do
			universe.activate_processors
			universe.preparse_single
			l_class := universe.root_class
			if l_class /= Void then
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
		do
			create l_builder.make (Current)
			from until done loop
				done := True
				nb := dynamic_types.count
				from i := 1 until i > nb loop
					l_type := dynamic_types.item (i)
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
			l_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			j, nb2: INTEGER
		do
			l_types := dynamic_types
			nb := l_types.count
			from i := 1 until i > nb loop
				l_type := l_types.item (i)
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
		end

invariant

	universe_not_void: universe /= Void
	dynamic_types_not_void: dynamic_types /= Void
	no_void_dynamic_type: not dynamic_types.has (Void)
	none_type_not_void: none_type /= Void
	character_type_not_void: character_type /= Void
	root_creation_procedure: root_creation_procedure /= Void implies root_creation_procedure.is_procedure

end
