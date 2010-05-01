note

	description:

		"GAC .NET assemblies of classes read from Ace file"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_DOTNET_GAC_ASSEMBLY

inherit

	ET_DOTNET_GAC_ASSEMBLY
		rename
			make as make_dotnet_gac_assembly
		end

	ET_LACE_DOTNET_ASSEMBLY
		rename
			make as make_lace_dotnet_assembly
		undefine
			consume
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name_id; an_assembly_name: like assembly_name_id; a_system: ET_SYSTEM) is
			-- Create a new GAC assembly.
		require
			a_name_not_void: a_name /= Void
			an_assembly_name_not_void: an_assembly_name /= Void
		do
			name_id := a_name
			assembly_name_id := an_assembly_name
			make_dotnet_gac_assembly (a_name.name, an_assembly_name.name, a_system)
		ensure
			name_id_set: name_id = a_name
			assembly_name_id_set: assembly_name_id = an_assembly_name
		end

feature -- Access

	assembly_name_id: ET_IDENTIFIER
			-- Name of current assembly identifier

	assembly_version_id: ET_IDENTIFIER
			-- Version of current assembly identifier (may be Void)

	assembly_culture_id: ET_IDENTIFIER
			-- Culture of current assembly identifier (may be Void)

	assembly_public_key_token_id: ET_IDENTIFIER
			-- Public key of current assembly identifier (may be Void)

feature -- Setting

	set_assembly_version_id (a_version: like assembly_version_id) is
			-- Set `assembly_version_id' to `a_version'.
		local
			l_assembly_version: STRING
		do
			assembly_version_id := a_version
			if a_version /= Void then
				l_assembly_version := a_version.name
			end
			set_assembly_version (l_assembly_version)
		ensure
			assembly_version_id_set: assembly_version_id = a_version
			assembly_version_set: a_version /= Void implies assembly_version = a_version.name
			no_assembly_version_set: a_version = Void implies assembly_version = Void
		end

	set_assembly_culture_id (a_culture: like assembly_culture_id) is
			-- Set `assembly_culture_id' to `a_culture'.
		local
			l_assembly_culture: STRING
		do
			assembly_culture_id := a_culture
			if a_culture /= Void then
				l_assembly_culture := a_culture.name
			end
			set_assembly_culture (l_assembly_culture)
		ensure
			assembly_culture_id_set: assembly_culture_id = a_culture
			assembly_culture_set: a_culture /= Void implies assembly_culture = a_culture.name
			no_assembly_culture_set: a_culture = Void implies assembly_culture = Void
		end

	set_assembly_public_key_token_id (a_public_key_token: like assembly_public_key_token_id) is
			-- Set `assembly_public_key_token_id' to `a_public_key_token'.
		local
			l_assembly_public_key_token: STRING
		do
			assembly_public_key_token_id := a_public_key_token
			if a_public_key_token /= Void then
				l_assembly_public_key_token := a_public_key_token.name
			end
			set_assembly_public_key_token (l_assembly_public_key_token)
		ensure
			assembly_public_key_token_id_set: assembly_public_key_token_id = a_public_key_token
			assembly_public_key_token_set: a_public_key_token /= Void implies assembly_public_key_token = a_public_key_token.name
			no_assembly_public_key_token_set: a_public_key_token = Void implies assembly_public_key_token = Void
		end

invariant

	assembly_name_id_not_void: assembly_name_id /= Void
	assembly_name_definition: assembly_name = assembly_name_id.name

end
