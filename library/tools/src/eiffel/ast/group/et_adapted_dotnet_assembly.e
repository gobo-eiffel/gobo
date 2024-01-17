note

	description:

		"Eiffel adapted .NET assemblies of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2011, Eric Bezault and others"
	license: "MIT License"

class ET_ADAPTED_DOTNET_ASSEMBLY

inherit

	ET_ADAPTED_UNIVERSE
		rename
			universe as dotnet_assembly
		redefine
			dotnet_assembly
		end

	ET_ADAPTED_GROUP
		rename
			group as dotnet_assembly
		undefine
			lower_name
		end

create

	make

feature -- Access

	dotnet_assembly: ET_DOTNET_ASSEMBLY
			-- .NET assembly being adapted

invariant

	dotnet_assembly_not_void: dotnet_assembly /= Void

end
