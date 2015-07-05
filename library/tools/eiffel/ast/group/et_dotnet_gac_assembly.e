note

	description:

		"GAC .NET assemblies of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_GAC_ASSEMBLY

inherit

	ET_DOTNET_ASSEMBLY
		rename
			make as make_dotnet_assembly
		redefine
			consume
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; an_assembly_name: like assembly_name; a_system: ET_SYSTEM)
			-- Create a new GAC assembly.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			an_assembly_name_not_void: an_assembly_name /= Void
			an_assembly_name_not_empty: not an_assembly_name.is_empty
			a_system_not_void: a_system /= Void
		do
			assembly_name := an_assembly_name
			make_dotnet_assembly (a_name, Void, a_system)
		ensure
			name_set: name = a_name
			assembly_name_set: assembly_name = an_assembly_name
			current_system_set: current_system = a_system
		end

feature -- Access

	assembly_name: STRING
			-- Name of current assembly

	assembly_version: detachable STRING
			-- Version of current assembly (may be Void)

	assembly_culture: detachable STRING
			-- Culture of current assembly (may be Void)

	assembly_public_key_token: detachable STRING
			-- Public key of current assembly (may be Void)

feature -- Setting

	set_assembly_version (a_version: like assembly_version)
			-- Set `assembly_version' to `a_version'.
		do
			assembly_version := a_version
		ensure
			assembly_version_set: assembly_version = a_version
		end

	set_assembly_culture (a_culture: like assembly_culture)
			-- Set `assembly_culture' to `a_culture'.
		do
			assembly_culture := a_culture
		ensure
			assembly_culture_set: assembly_culture = a_culture
		end

	set_assembly_public_key_token (a_public_key_token: like assembly_public_key_token)
			-- Set `assembly_version' to `a_public_key_token'.
		do
			assembly_public_key_token := a_public_key_token
		ensure
			assembly_public_key_token_set: assembly_public_key_token = a_public_key_token
		end

feature {ET_DOTNET_ASSEMBLY_CONSUMER} -- Consuming

	consume (a_consumer: ET_DOTNET_ASSEMBLY_CONSUMER)
			-- Consume current assembly using `a_consumer'.
		do
			a_consumer.consume_gac_assembly (Current)
		end

invariant

	assembly_name_not_void: assembly_name /= Void
	assembly_name_not_empty: assembly_name.count > 0

end
