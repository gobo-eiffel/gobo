indexing

	description:

		"Eiffel adapted .NET assemblies of classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ADAPTED_DOTNET_ASSEMBLY

inherit

	ET_DOTNET_ASSEMBLY

feature -- Access

	adapted_dotnet_assembly: ET_DOTNET_ASSEMBLY
			-- .NET assembly being adapted

invariant

	adapted_dotnet_assembly_not_void: adapted_dotnet_assembly /= Void

end
