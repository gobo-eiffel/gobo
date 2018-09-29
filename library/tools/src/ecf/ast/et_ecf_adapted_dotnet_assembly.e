note

	description:

		"Adapted .NET assemblies of classes read from ECF file"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ADAPTED_DOTNET_ASSEMBLY

inherit

	ET_ADAPTED_DOTNET_ASSEMBLY
		rename
			make as make_adapted_dotnet_assembly
		undefine
			lower_name
		end

	ET_ECF_GROUP

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name, a_filename: ET_IDENTIFIER; a_universe: like universe; a_target: like target)
			-- Create a new ECF adapted .NET assembly.
		require
			a_name_not_void: a_name /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
			a_target_nit_void: a_target /= Void
		do
			name_id := a_name
			filename_id := a_filename
			universe := a_universe
			target := a_target
			make_adapted_dotnet_assembly (a_name.name, tokens.unknown_dotnet_assembly)
		ensure
			name_id_set: name_id = a_name
			name_set: name = a_name.name
			filename_id_set: filename_id = a_filename
			universe_set: universe = a_universe
			target_set: target = a_target
		end

feature -- Access

	name_id: ET_IDENTIFIER
			-- Name identifier

	filename_id: ET_IDENTIFIER
			-- ECF filename

	pathname: STRING
			-- Pathname
		do
			Result := filename_id.name
		ensure then
			definition: Result = filename_id.name
		end

	assembly_name: detachable STRING
			-- Name of assembly

	assembly_version: detachable STRING
			-- Version of assembly

	assembly_culture: detachable STRING
			-- Culture of assembly

	assembly_key: detachable STRING
			-- Key of assembly

	universe: ET_ECF_INTERNAL_UNIVERSE
			-- ECF universe containing the current reference to `dotnet_assembly'

feature -- Setting

	set_dotnet_assembly (a_dotnet_assembly: like dotnet_assembly)
			-- Set `dotnet_assembly' to `a_dotnet_assembly'.
		require
			a_dotnet_assembly_not_void: a_dotnet_assembly /= Void
		do
			dotnet_assembly := a_dotnet_assembly
		ensure
			dotnet_assembly_set: dotnet_assembly = a_dotnet_assembly
		end

	set_assembly_name (a_assembly_name: like assembly_name)
			-- Set `assembly_name' to `a_assembly_name'.
		do
			assembly_name := a_assembly_name
		ensure
			assembly_name_set: assembly_name = a_assembly_name
		end

	set_assembly_version (a_assembly_version: like assembly_version)
			-- Set `assembly_version' to `a_assembly_version'.
		do
			assembly_version := a_assembly_version
		ensure
			assembly_version_set: assembly_version = a_assembly_version
		end

	set_assembly_culture (a_assembly_culture: like assembly_culture)
			-- Set `assembly_culture' to `a_assembly_culture'.
		do
			assembly_culture := a_assembly_culture
		ensure
			assembly_culture_set: assembly_culture = a_assembly_culture
		end

	set_assembly_key (a_assembly_key: like assembly_key)
			-- Set `assembly_key' to `a_assembly_key'.
		do
			assembly_key := a_assembly_key
		ensure
			assembly_key_set: assembly_key = a_assembly_key
		end

invariant

	name_id_not_void: name_id /= Void
	filename_id_not_void: filename_id /= Void
	universe_not_void: universe /= Void

end
