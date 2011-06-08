note

	description:

		"Adapted .NET assemblies of classes read from ECF file"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ADAPTED_DOTNET_ASSEMBLY

inherit

	ET_ADAPTED_DOTNET_ASSEMBLY
		rename
			make as make_adapted_dotnet_assembly
		end

	ET_ECF_CONDITIONED

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name, a_filename: ET_IDENTIFIER; a_universe: like universe)
			-- Create a new ECF adapted .NET assembly.
		require
			a_name_not_void: a_name /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		do
			name_id := a_name
			filename := a_filename
			universe := a_universe
			make_adapted_dotnet_assembly (a_name.name, tokens.unknown_dotnet_assembly)
		ensure
			name_id_set: name_id = a_name
			name_set: name = a_name.name
			filename_set: filename = a_filename
			universe_set: universe = a_universe
		end

feature -- Access

	name_id: ET_IDENTIFIER
			-- Name identifier

	filename: ET_IDENTIFIER
			-- ECF filename

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

invariant

	name_id_not_void: name_id /= Void
	filename_not_void: filename /= Void
	universe_not_void: universe /= Void

end
