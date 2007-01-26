indexing

	description:

		"GAC .NET assemblies of classes read from Ace file"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_DOTNET_GAC_ASSEMBLY

inherit

	ET_DOTNET_GAC_ASSEMBLY

	ET_LACE_DOTNET_ASSEMBLY
		rename
			make as make_assembly
		undefine
			consume
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name_id; an_assembly_name: like assembly_name_id) is
			-- Create a new GAC assembly.
		require
			a_name_not_void: a_name /= Void
			an_assembly_name_not_void: an_assembly_name /= Void
		do
			name_id := a_name
			assembly_name_id := an_assembly_name
		ensure
			name_id_set: name_id = a_name
			assembly_name_id_set: assembly_name_id = an_assembly_name
		end

feature -- Access

	assembly_name: STRING is
			-- Name of current assembly
		do
			Result := assembly_name_id.name
		end

	assembly_version: STRING is
			-- Version of current assembly (may be Void)
		do
			if assembly_version_id /= Void then
				Result := assembly_version_id.name
			end
		end

	assembly_culture: STRING is
			-- Culture of current assembly (may be Void)
		do
			if assembly_culture_id /= Void then
				Result := assembly_culture_id.name
			end
		end

	assembly_public_key_token: STRING is
			-- Public key of current assembly (may be Void)
		do
			if assembly_public_key_token_id /= Void then
				Result := assembly_public_key_token_id.name
			end
		end

	assembly_name_id: ET_IDENTIFIER
			-- Name of current assembly identifier

	assembly_version_id: ET_IDENTIFIER
			-- Version of current assembly identifier (may be Void)

	assembly_culture_id: ET_IDENTIFIER
			-- Culture of current assembly identifier (may be Void)

	assembly_public_key_token_id: ET_IDENTIFIER
			-- Public key of current assembly identifier (may be Void)

feature -- Setting

	set_assembly_version (a_version: like assembly_version_id) is
			-- Set `assembly_version_id' to `a_version'.
		do
			assembly_version_id := a_version
		ensure
			assembly_version_id_set: assembly_version_id = a_version
		end

	set_assembly_culture (a_culture: like assembly_culture_id) is
			-- Set `assembly_culture_id' to `a_culture'.
		do
			assembly_culture_id := a_culture
		ensure
			assembly_culture_id_set: assembly_culture_id = a_culture
		end

	set_assembly_public_key_token (a_public_key_token: like assembly_public_key_token_id) is
			-- Set `assembly_version_id' to `a_public_key_token'.
		do
			assembly_public_key_token_id := a_public_key_token
		ensure
			assembly_public_key_token_id_set: assembly_public_key_token_id = a_public_key_token
		end

invariant

	assembly_name_id_not_void: assembly_name_id /= Void

end
