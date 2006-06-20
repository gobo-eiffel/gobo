indexing

	description:

		"GAC .NET Assemblies of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_GAC_ASSEMBLY

inherit

	ET_ASSEMBLY

feature -- Access

	assembly_name: STRING is
			-- Name of current assembly
		deferred
		ensure
			assembly_name_not_void: Result /= Void
			assembly_name_not_empty: Result.count > 0
		end

	assembly_version: STRING is
			-- Version of current assembly (may be Void)
		deferred
		end

	assembly_culture: STRING is
			-- Culture of current assembly (may be Void)
		deferred
		end

	assembly_public_key_token: STRING is
			-- Public key of current assembly (may be Void)
		deferred
		end

end
