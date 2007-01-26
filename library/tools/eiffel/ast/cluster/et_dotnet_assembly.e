indexing

	description:

		".NET Assemblies of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DOTNET_ASSEMBLY

inherit

	ET_GROUP
		redefine
			is_dotnet_assembly,
			dotnet_assembly
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

	classname_prefix: STRING is
			-- Prefix for classnames of current assembly
			-- (may be Void)
		deferred
		end

	dotnet_assembly: ET_DOTNET_ASSEMBLY is
			-- Current group viewed as a .NET assembly
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	classname_mapping: DS_HASH_TABLE [ET_CLASS_NAME, STRING]
			-- Mapping between names of .NET classes provided
			-- in current assembly and their Eiffel class name
			-- counterparts

	referenced_assemblies: ET_DOTNET_ASSEMBLIES
			-- Assemblies referenced by current assembly

feature -- Status setting

	set_implicit (b: BOOLEAN) is
			-- Set `is_implicit' to `b'.
		do
			is_implicit := b
		ensure
			implicit_set: is_implicit = b
		end

feature -- Setting

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
	no_void_classname: classname_mapping /= Void implies not classname_mapping.has_item (Void)

end
