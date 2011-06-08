note

	description:

		"Adapted .NET assembly lists read from ECF file"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ADAPTED_DOTNET_ASSEMBLIES

inherit

	ET_ADAPTED_DOTNET_ASSEMBLIES
		redefine
			dotnet_assembly,
			do_adapted
		end

create

	make, make_empty

feature -- Access

	dotnet_assembly (i: INTEGER): ET_ECF_ADAPTED_DOTNET_ASSEMBLY
			-- `i'-th .NET assembly
		do
			Result := dotnet_assemblies.item (i)
		end

feature -- Iteration

	do_adapted (an_action: PROCEDURE [ANY, TUPLE [ET_ECF_ADAPTED_DOTNET_ASSEMBLY]])
			-- Apply `an_action' to every .NET assembly, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		local
			i, nb: INTEGER
		do
			nb := dotnet_assemblies.count
			from i := 1 until i > nb loop
				an_action.call ([dotnet_assemblies.item (i)])
				i := i + 1
			end
		end

end
