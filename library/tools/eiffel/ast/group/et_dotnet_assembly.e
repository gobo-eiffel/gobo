note

	description:

		"Eiffel .NET assemblies of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_ASSEMBLY

inherit

	ET_PRIMARY_GROUP
		rename
			group as dotnet_assembly,
			has_class_recursive as has_class,
			class_count_recursive as class_count,
			classes_do_recursive as classes_do_all,
			classes_do_if_recursive as classes_do_if
		undefine
			current_system, hash_code,
			dotnet_assembly, lower_name,
			full_name, full_lower_name,
			relative_name, relative_lower_name
		redefine
			is_dotnet_assembly,
			kind_name,
			has_class,
			class_count,
			classes_do_all,
			classes_do_if
		end

	ET_UNIVERSE
		rename
			universe as dotnet_assembly,
			has_class as has_class_by_name
		redefine
			import_classes,
			add_universe_recursive,
			universes_do_all,
			universes_do_if,
			dotnet_assembly,
			adapted_universe,
			kind_name,
			class_count,
			classes_do_all,
			classes_do_if
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

	is_implicit: BOOLEAN
			-- Has current assembly not been explicitly declared
			-- but is instead the result of assembly dependences?

	has_group_by_name (a_names: ARRAY [STRING]): BOOLEAN
			-- Is there a group named `a_names' starting from within current universe
			-- and recursively traversing dependent universes if needed?
			-- Do not take into account missing implicit subclusters.
		do
			Result := has_group_by_name_at_index (a_names, a_names.lower)
		end

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Has `a_class' been declared in current .NET assembly?
			-- Do not take into account overridden classes.
		do
			Result := a_class.universe = Current and then not a_class.is_overridden
		end

feature {ET_DOTNET_ASSEMBLY, ET_INTERNAL_UNIVERSE} -- Status report

	has_group_by_name_at_index (a_names: ARRAY [STRING]; a_index: INTEGER): BOOLEAN
			-- Is there a group named `a_names', ignoring the entries before `a_index',
			-- starting from within current universe and recursively traversing
			-- dependent universes if needed?
			-- Do not take into account missing implicit subclusters.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		local
			nb: INTEGER
			l_dotnet_assembly: ET_DOTNET_ASSEMBLY
		do
			nb := a_names.upper
			if a_index <= nb then
				l_dotnet_assembly := referenced_assemblies.dotnet_assembly_by_name (a_names.item (a_index))
				if l_dotnet_assembly /= Void then
					if a_index = nb then
						Result := True
					else
						Result := l_dotnet_assembly.has_group_by_name_at_index (a_names, a_index + 1)
					end
				end
			end
		end

feature -- Access

	pathname: STRING
			-- Assembly pathname (may be Void)

	classname_mapping: DS_HASH_TABLE [ET_CLASS_NAME, STRING]
			-- Mapping between names of .NET classes provided
			-- in current assembly and their Eiffel class name
			-- counterparts

	referenced_assemblies: ET_DOTNET_ASSEMBLIES
			-- .NET assemblies that current universe depends on

	group_by_name (a_names: ARRAY [STRING]): ET_GROUP
			-- Group named `a_names' starting from within current universe
			-- and recursively traversing dependent universes if needed
			--
			-- Add missing implicit subclusters if needed.
			-- Void if not such group.
		do
			Result := group_by_name_at_index (a_names, a_names.lower)
		end

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
			if l_dotnet_assembly /= Void and then referenced_assemblies.dotnet_assemblies.has (l_dotnet_assembly) then
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

feature {ET_DOTNET_ASSEMBLY, ET_INTERNAL_UNIVERSE} -- Access

	group_by_name_at_index (a_names: ARRAY [STRING]; a_index: INTEGER): ET_GROUP
			-- Group named `a_names', ignoring the entries before `a_index',
			-- starting from within current universe and recursively traversing
			-- dependent universes if needed
			--
			-- Add missing implicit subclusters if needed.
			-- Void if not such group.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		local
			nb: INTEGER
			l_dotnet_assembly: ET_DOTNET_ASSEMBLY
		do
			nb := a_names.upper
			if a_index <= nb then
				l_dotnet_assembly := referenced_assemblies.dotnet_assembly_by_name (a_names.item (a_index))
				if l_dotnet_assembly /= Void then
					if a_index = nb then
						Result := l_dotnet_assembly
					else
						Result := l_dotnet_assembly.group_by_name_at_index (a_names, a_index + 1)
					end
				end
			end
		ensure
			not_void_if_has: has_group_by_name_at_index (a_names, a_index) implies Result /= Void
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

feature -- Measurement

	class_count: INTEGER
			-- Number of classes declared locally in current .NET assembly.
			-- Do not take into account overridden classes.
		do
			Result := precursor {ET_UNIVERSE}
		end

feature -- Nested

	parent: ET_DOTNET_ASSEMBLY
			-- Parent group
		do
			-- Result := Void
		end

feature -- Iteration

	classes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]])
			-- Apply `an_action' on all classes declared locally in current .NET assembly.
			-- Do not take into account overridden classes.
		do
			precursor {ET_UNIVERSE} (an_action)
		end

	classes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN])
			-- Apply `an_action' on all classes declared locally in current .NET assembly
			-- that satisfy `a_test'.
			-- Do not take into account overridden classes.
		do
			precursor {ET_UNIVERSE} (an_action, a_test)
		end

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

feature {ET_INTERNAL_UNIVERSE} -- Parsing

	is_consumable: BOOLEAN
			-- Will current .NET assembly need to be consumed
			-- next time a universe depending on it will be
			-- preparsed or parsed.
		do
-- TODO: .NET assemblies are currently considered read-only,
-- regardless of the value of `is_read_only'.
			Result := not is_preparsed
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
