note

	description:

		"Eiffel .NET assemblies of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_ASSEMBLY

inherit

	ET_GROUP
		undefine
			current_system, hash_code,
			dotnet_assembly, lower_name,
			full_name, full_lower_name,
			relative_name, relative_lower_name
		redefine
			is_dotnet_assembly,
			kind_name
		end

	ET_UNIVERSE
		rename
			universe as dotnet_assembly
		redefine
			import_classes,
			add_universe_recursive,
			universes_do_all,
			universes_do_if,
			dotnet_assembly,
			adapted_universe,
			kind_name
		end

	ET_ADAPTED_DOTNET_ASSEMBLY
		rename
			make as make_adapted
		redefine
			dotnet_assembly
		end

create

	make

feature {NONE} -- Inialization

	make (a_name: like name; a_pathname: like pathname; a_system: ET_SYSTEM)
			-- Create a new .NET assembly.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_system_not_void: a_system /= Void
		do
			pathname := a_pathname
			create referenced_assemblies.make_empty
			make_from_system (a_name, a_system)
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
			current_system_set: current_system = a_system
		end

feature -- Status report

	is_dotnet_assembly: BOOLEAN = True
			-- Is current group a .NET assembly?

	is_override: BOOLEAN = False
			-- Is current group an override group?
			-- In other words, do classes in this group and other override
			-- groups take precedence over classes with same names but in
			-- non-override group? (see 'override_cluster' in ISE's LACE.)

	is_read_only: BOOLEAN = True
			-- Is current group a read-only group?
			-- In other words, are changes in this group and in its classes
			-- not taken into account when repreparsing or reparsing
			-- the universe? (see 'library' in ISE's LACE.)

	is_implicit: BOOLEAN
			-- Has current assembly not been explicitly declared
			-- but is instead the result of assembly dependences?

feature -- Access

	pathname: STRING
			-- Assembly pathname (may be Void)

	classname_mapping: DS_HASH_TABLE [ET_CLASS_NAME, STRING]
			-- Mapping between names of .NET classes provided
			-- in current assembly and their Eiffel class name
			-- counterparts

	referenced_assemblies: ET_DOTNET_ASSEMBLIES
			-- .NET assemblies that current universe depends on

	adapted_universe (a_universe: ET_UNIVERSE): ET_ADAPTED_UNIVERSE
			-- Adapted version of `a_universe' viewed from current universe
			-- when it depends on it, Void otherwise
			--
			-- `a_universe' may be a library or assembly from which the current
			-- universe imports classes. Note that `a_universe' may be imported
			-- twice by the current universe. Return one of them in that case.
		local
			l_dotnet_assembly: ET_DOTNET_ASSEMBLY
		do
			l_dotnet_assembly ?= a_universe
			if l_dotnet_assembly /= Void and then referenced_assemblies.assemblies.has (l_dotnet_assembly) then
				Result := l_dotnet_assembly
			end
		end

	dotnet_assembly: ET_DOTNET_ASSEMBLY
			-- .NET assembly being adapted

	universe: ET_UNIVERSE
			-- Surrounding universe
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	kind_name: STRING
			-- Name of the kind of group or universe (e.g. "cluster", "assembly", "library", etc.)
		once
			Result := "assembly"
		end

feature -- Status setting

	set_implicit (b: BOOLEAN)
			-- Set `is_implicit' to `b'.
		do
			is_implicit := b
		ensure
			implicit_set: is_implicit = b
		end

feature -- Setting

	set_classname_mapping (a_mapping: like classname_mapping)
			-- Set `classname_mapping' to `a_mapping'.
		require
			no_void_classname: a_mapping /= Void implies not a_mapping.has_void_item
		do
			classname_mapping := a_mapping
		ensure
			classname_mapping_set: classname_mapping = a_mapping
		end

	set_referenced_assemblies (a_assemblies: like referenced_assemblies)
			-- Set `referenced_assemblies' to `a_assemblies'.
		require
			a_assemblies_not_void: a_assemblies /= Void
		do
			referenced_assemblies := a_assemblies
		ensure
			referenced_assemblies_set: referenced_assemblies = a_assemblies
		end

feature -- Nested

	parent: ET_DOTNET_ASSEMBLY
			-- Parent group
		do
			-- Result := Void
		end

feature -- Iteration

	universes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]])
			-- Apply `an_action' to every universe that current universe depends on.
		do
			referenced_assemblies.universes_do_all (an_action)
		end

	universes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]; a_test: FUNCTION [ANY, TUPLE [ET_UNIVERSE], BOOLEAN])
			-- Apply `an_action' to every universe that current universe depends on and
			-- which satisfies `a_test'.
		do
			referenced_assemblies.universes_do_if (an_action, a_test)
		end

feature -- Relations

	add_universe_recursive (a_visited: DS_HASH_SET [ET_UNIVERSE])
			-- Add current universe to `a_visited' and
			-- recursively the universes it depends on.
		do
			if not a_visited.has (Current) then
				a_visited.force_last (Current)
				referenced_assemblies.do_all (agent {ET_DOTNET_ASSEMBLY}.add_universe_recursive (a_visited))
			end
		end

	add_dotnet_assembly_recursive (a_visited: DS_HASH_SET [ET_DOTNET_ASSEMBLY])
			-- Add current .NET assembly to `a_visited' and
			-- recursively the .NET assemblies it depends on.
		require
			a_visited_not_void: a_visited /= Void
		do
			if not a_visited.has (Current) then
				a_visited.force_last (Current)
				referenced_assemblies.do_all (agent {ET_DOTNET_ASSEMBLY}.add_dotnet_assembly_recursive (a_visited))
			end
		end

feature {ET_DOTNET_ASSEMBLY_CONSUMER} -- Parsing

	set_preparsed (b: BOOLEAN)
			-- Set `is_preparsed' to `b'.
		do
			is_preparsed := b
		ensure
			preparsed_set: is_preparsed = b
		end

feature {ET_UNIVERSE} -- Parsing

	import_classes
			-- Import classes made available (i.e. exported) by other universes.
		do
			import_kernel_classes
-- With the ISE .NET assembly consumer, we should not import classes from other assemblies.
--			referenced_assemblies.do_all (agent {ET_DOTNET_ASSEMBLY}.export_classes (Current))
			if not master_class (tokens.system_object_class_name).is_declared_locally then
				import_kernel_class (tokens.system_object_class_name)
			end
		end

	import_kernel_classes
			-- Import kernel classes.
		do
			import_kernel_class (tokens.any_class_name)
			import_kernel_class (tokens.boolean_class_name)
			import_kernel_class (tokens.character_8_class_name)
			import_kernel_class (tokens.character_32_class_name)
			import_kernel_class (tokens.integer_8_class_name)
			import_kernel_class (tokens.integer_16_class_name)
			import_kernel_class (tokens.integer_32_class_name)
			import_kernel_class (tokens.integer_64_class_name)
			import_kernel_class (tokens.natural_8_class_name)
			import_kernel_class (tokens.natural_16_class_name)
			import_kernel_class (tokens.natural_32_class_name)
			import_kernel_class (tokens.natural_64_class_name)
			import_kernel_class (tokens.real_32_class_name)
			import_kernel_class (tokens.real_64_class_name)
			import_kernel_class (tokens.pointer_class_name)
			import_kernel_class (tokens.typed_pointer_class_name)
			import_kernel_class (tokens.native_array_class_name)
		end

	import_kernel_class (a_class_name: ET_CLASS_NAME)
			-- Import kernel class `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		local
			l_master_class: ET_MASTER_CLASS
			l_other_class: ET_MASTER_CLASS
		do
			l_other_class := current_system.master_class (a_class_name)
			l_master_class := master_class (a_class_name)
			if not l_master_class.has_imported_class (l_other_class) then
				l_master_class.add_last_imported_class (l_other_class)
			end
		end

feature {ET_DOTNET_ASSEMBLY_CONSUMER} -- Consuming

	consume (a_consumer: ET_DOTNET_ASSEMBLY_CONSUMER)
			-- Consume current assembly using `a_consumer'.
		require
			a_consumer_not_void: a_consumer /= Void
		do
			a_consumer.consume_assembly (Current)
		end

invariant

	is_dotnet_assembly: is_dotnet_assembly
	self_adapted: dotnet_assembly = Current
	no_void_classname: classname_mapping /= Void implies not classname_mapping.has_void_item
	referenced_assemblies_not_void: referenced_assemblies /= Void

end
