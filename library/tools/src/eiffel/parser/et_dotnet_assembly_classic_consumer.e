note

	description:

		"Eiffel classic consumers of .NET assemblies"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"

class ET_DOTNET_ASSEMBLY_CLASSIC_CONSUMER

inherit

	ET_DOTNET_ASSEMBLY_CONSUMER

create

	make

feature -- Consuming

	consume_class (a_class: ET_CLASS)
			-- Consume `a_class'.
		do
			a_class.set_syntax_error
			error_handler.report_gaaaa_error (a_class.group.dotnet_assembly)
		end

feature {ET_DOTNET_ASSEMBLY} -- Consuming

	consume_assembly (an_assembly: ET_DOTNET_ASSEMBLY)
			-- Eiffel classic compilers are not able to consume .NET assemblies.
		do
			error_handler.report_gaaaa_error (an_assembly)
		end

	consume_gac_assembly (an_assembly: ET_DOTNET_GAC_ASSEMBLY)
			-- Eiffel classic compilers are not able to consume .NET assemblies.
		do
			error_handler.report_gaaaa_error (an_assembly)
		end

end
