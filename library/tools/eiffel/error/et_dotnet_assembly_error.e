indexing

	description:

		".NET assembly errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_ASSEMBLY_ERROR

inherit

	ET_ERROR

create

	make_gaaaa

feature {NONE} -- Initialization

	make_gaaaa (an_assembly: like assembly) is
			-- Create a new GAAAA error: .NET assemblies not supported.
		require
			an_assembly_not_void: an_assembly /= Void
		do
			code := gaaaa_template_code
			etl_code := gaaaa_etl_code
			default_template := gaaaa_default_template
			assembly := an_assembly
			create parameters.make (1, 2)
			parameters.put (etl_code, 1)
			parameters.put (assembly.full_name ('.'), 2)
		ensure
			assembly_set: assembly = an_assembly
			-- dollar0: $0 = program name
			-- dollar1: $1 = ETL code
			-- dollar2: $2 = assembly full name
		end

feature -- Access

	assembly: ET_DOTNET_ASSEMBLY
			-- Assembly where current error occurred

feature -- Setting

	set_assembly (an_assembly: like assembly) is
			-- Set `assembly' to `an_assembly'.
		require
			an_assembly_not_void: an_assembly /= Void
		do
			assembly := an_assembly
		ensure
			assembly_set: assembly = an_assembly
		end

feature {NONE} -- Implementation

	gaaaa_default_template: STRING is "[$1] assembly $2: .NET assemblies not supported."
			-- Default templates

	gaaaa_etl_code: STRING is "GAAAA"
			-- ETL validity codes

	gaaaa_template_code: STRING is "gaaaa"
			-- Template error codes

invariant

	assembly_not_void: assembly /= Void

end
