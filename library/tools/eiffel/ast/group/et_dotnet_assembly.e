indexing

	description:

		".NET assemblies of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_ASSEMBLY

inherit

	ET_GROUP
		undefine
			current_system, hash_code,
			dotnet_assembly
		redefine
			is_dotnet_assembly
		end

	ET_UNIVERSE

	ET_ADAPTED_DOTNET_ASSEMBLY
		rename
			make as make_adapted
		end

create

	make

feature {NONE} -- Inialization

	make (a_name: like name; a_pathname: like pathname; a_system: ET_SYSTEM) is
			-- Create a new .NET assembly.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_system_not_void: a_system /= Void
		do
			name := a_name
			pathname := a_pathname
			make_from_system (a_system)
			make_adapted (Current)
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
			current_system_set: current_system = a_system
		end

feature -- Status report

	is_dotnet_assembly: BOOLEAN is True
			-- Is current group a .NET assembly?

	is_override: BOOLEAN is False
			-- Is current group an override group?
			-- In other words, do classes in this group and other override
			-- groups take precedence over classes with same names but in
			-- non-override group? (see 'override_cluster' in ISE's LACE.)

	is_read_only: BOOLEAN is True
			-- Is current group a read-only group?
			-- In other words, are changes in this group and in its classes
			-- not taken into account when repreparsing or reparsing
			-- the universe? (see 'library' in ISE's LACE.)

	is_implicit: BOOLEAN
			-- Has current assembly not been explicitly declared
			-- but is instead the result of assembly dependences?

feature -- Access

	name: STRING
			-- Name

	pathname: STRING
			-- Assembly pathname (may be Void)

	classname_prefix: STRING
			-- Prefix for classnames of current assembly
			-- (may be Void)

	classname_mapping: DS_HASH_TABLE [ET_CLASS_NAME, STRING]
			-- Mapping between names of .NET classes provided
			-- in current assembly and their Eiffel class name
			-- counterparts

	referenced_assemblies: ET_DOTNET_ASSEMBLIES
			-- Assemblies referenced by current assembly

	universe: ET_UNIVERSE is
			-- Surrounding universe
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

feature -- Status setting

	set_implicit (b: BOOLEAN) is
			-- Set `is_implicit' to `b'.
		do
			is_implicit := b
		ensure
			implicit_set: is_implicit = b
		end

feature -- Setting

	set_classname_prefix (a_prefix: like classname_prefix) is
			-- Set `classname_prefix_id' to `a_prefix'.
		do
			classname_prefix := a_prefix
		ensure
			classname_prefix_set: classname_prefix = a_prefix
		end

	set_classname_mapping (a_mapping: like classname_mapping) is
			-- Set `classname_mapping' to `a_mapping'.
		require
			no_void_classname: a_mapping /= Void implies not a_mapping.has_item (Void)
		do
			classname_mapping := a_mapping
		ensure
			classname_mapping_set: classname_mapping = a_mapping
		end

	set_referenced_assemblies (a_assemblies: like referenced_assemblies) is
			-- Set `referenced_assemblies' to `a_assemblies'.
		do
			referenced_assemblies := a_assemblies
		ensure
			referenced_assemblies_set: referenced_assemblies = a_assemblies
		end

feature -- Nested

	parent: ET_DOTNET_ASSEMBLY is
			-- Parent group
		do
			-- Result := Void
		end

feature -- Parsing

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
			if not is_preparsed then
				is_preparsed := True
				import_classes
				classes_added := True
			end
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
			if not is_preparsed then
				is_preparsed := True
				import_classes
				classes_added := True
			end
		end

feature {NONE} -- Parsing

	import_classes is
			-- Import classes made available (i.e. exported) by other universes.
		do
			classes.force_last (current_system.any_class, current_system.any_class.name)
			classes.force_last (current_system.arguments_class, current_system.arguments_class.name)
			classes.force_last (current_system.array_class, current_system.array_class.name)
			classes.force_last (current_system.bit_class, current_system.bit_class.name)
			classes.force_last (current_system.boolean_class, current_system.boolean_class.name)
			classes.force_last (current_system.boolean_ref_class, current_system.boolean_ref_class.name)
			classes.force_last (current_system.character_8_class, current_system.character_8_class.name)
			classes.force_last (current_system.character_8_ref_class, current_system.character_8_ref_class.name)
			classes.force_last (current_system.character_32_class, current_system.character_32_class.name)
			classes.force_last (current_system.character_32_ref_class, current_system.character_32_ref_class.name)
			classes.force_last (current_system.disposable_class, current_system.disposable_class.name)
			classes.force_last (current_system.function_class, current_system.function_class.name)
			classes.force_last (current_system.identified_routines_class, current_system.identified_routines_class.name)
			classes.force_last (current_system.integer_8_class, current_system.integer_8_class.name)
			classes.force_last (current_system.integer_8_ref_class, current_system.integer_8_ref_class.name)
			classes.force_last (current_system.integer_16_class, current_system.integer_16_class.name)
			classes.force_last (current_system.integer_16_ref_class, current_system.integer_16_ref_class.name)
			classes.force_last (current_system.integer_32_class, current_system.integer_32_class.name)
			classes.force_last (current_system.integer_32_ref_class, current_system.integer_32_ref_class.name)
			classes.force_last (current_system.integer_64_class, current_system.integer_64_class.name)
			classes.force_last (current_system.integer_64_ref_class, current_system.integer_64_ref_class.name)
			classes.force_last (current_system.native_array_class, current_system.native_array_class.name)
			classes.force_last (current_system.natural_8_class, current_system.natural_8_class.name)
			classes.force_last (current_system.natural_8_ref_class, current_system.natural_8_ref_class.name)
			classes.force_last (current_system.natural_16_class, current_system.natural_16_class.name)
			classes.force_last (current_system.natural_16_ref_class, current_system.natural_16_ref_class.name)
			classes.force_last (current_system.natural_32_class, current_system.natural_32_class.name)
			classes.force_last (current_system.natural_32_ref_class, current_system.natural_32_ref_class.name)
			classes.force_last (current_system.natural_64_class, current_system.natural_64_class.name)
			classes.force_last (current_system.natural_64_ref_class, current_system.natural_64_ref_class.name)
			classes.force_last (current_system.none_class, current_system.none_class.name)
			classes.force_last (current_system.platform_class, current_system.platform_class.name)
			classes.force_last (current_system.pointer_class, current_system.pointer_class.name)
			classes.force_last (current_system.pointer_ref_class, current_system.pointer_ref_class.name)
			classes.force_last (current_system.predicate_class, current_system.predicate_class.name)
			classes.force_last (current_system.procedure_class, current_system.procedure_class.name)
			classes.force_last (current_system.real_32_class, current_system.real_32_class.name)
			classes.force_last (current_system.real_32_ref_class, current_system.real_32_ref_class.name)
			classes.force_last (current_system.real_64_class, current_system.real_64_class.name)
			classes.force_last (current_system.real_64_ref_class, current_system.real_64_ref_class.name)
			classes.force_last (current_system.routine_class, current_system.routine_class.name)
			classes.force_last (current_system.special_class, current_system.special_class.name)
			classes.force_last (current_system.string_8_class, current_system.string_8_class.name)
			classes.force_last (current_system.string_32_class, current_system.string_32_class.name)
			classes.force_last (current_system.system_object_class, current_system.system_object_class.name)
			classes.force_last (current_system.system_string_class, current_system.system_string_class.name)
			classes.force_last (current_system.tuple_class, current_system.tuple_class.name)
			classes.force_last (current_system.type_class, current_system.type_class.name)
			classes.force_last (current_system.typed_pointer_class, current_system.typed_pointer_class.name)
		end

feature -- Relations

	recursive_add (a_visited: DS_HASH_SET [ET_DOTNET_ASSEMBLY]) is
			-- Add current .NET assembly to `a_visited' and
			-- recursively the .NET assemblies it depends on.
		require
			a_visited_not_void: a_visited /= Void
		do
			if not a_visited.has (Current) then
				a_visited.force_last (Current)
				if referenced_assemblies /= Void then
					referenced_assemblies.do_all (agent {ET_DOTNET_ASSEMBLY}.recursive_add (a_visited))
				end
			end
		end

feature {ET_DOTNET_ASSEMBLY_CONSUMER} -- Consuming

	consume (a_consumer: ET_DOTNET_ASSEMBLY_CONSUMER) is
			-- Consume current assembly using `a_consumer'.
		require
			a_consumer_not_void: a_consumer /= Void
		do
			a_consumer.consume_assembly (Current)
		end

invariant

	is_dotnet_assembly: is_dotnet_assembly
	self_adapted: dotnet_assembly = Current
	no_void_classname: classname_mapping /= Void implies not classname_mapping.has_item (Void)


end
