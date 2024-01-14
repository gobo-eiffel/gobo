note

	description:

		".NET assembly lists read from Ace file"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2019, Eric Bezault and others"
	license: "MIT License"

class ET_LACE_DOTNET_ASSEMBLIES

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_DOTNET_ASSEMBLIES
		redefine
			dotnet_assembly
		end

create

	make, make_empty

feature -- Access

	dotnet_assembly (i: INTEGER): ET_LACE_DOTNET_ASSEMBLY
			-- `i'-th assembly
		do
			Result := dotnet_assemblies.item (i)
		end

end
