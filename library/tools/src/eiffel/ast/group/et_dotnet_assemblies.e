note

	description:

		".NET assembly lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2016, Eric Bezault and others"
	license: "MIT License"

class ET_DOTNET_ASSEMBLIES

inherit

	ET_ADAPTED_DOTNET_ASSEMBLIES
		redefine
			dotnet_assembly,
			do_adapted,
			do_adapted_if
		end

create

	make, make_empty

feature -- Access

	dotnet_assembly (i: INTEGER): ET_DOTNET_ASSEMBLY
			-- `i'-th .NET assembly
		do
			Result := dotnet_assemblies.item (i)
		end

feature -- Iteration

	do_adapted (an_action: PROCEDURE [ET_ADAPTED_DOTNET_ASSEMBLY])
			-- Apply `an_action' to every .NET assembly, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		local
			i, nb: INTEGER
		do
			from
				i := 1
				nb := dotnet_assemblies.count
			until
				i > nb
			loop
				an_action.call ([dotnet_assemblies.item (i)])
				i := i + 1
			end
		end

	do_adapted_if (an_action: PROCEDURE [ET_ADAPTED_DOTNET_ASSEMBLY]; a_test: FUNCTION [ET_ADAPTED_DOTNET_ASSEMBLY, BOOLEAN])
			-- Apply `an_action' to every .NET assembly which satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		local
			i, nb: INTEGER
			l_assembly: like dotnet_assembly
		do
			from
				i := 1
				nb := dotnet_assemblies.count
			until
				i > nb
			loop
				l_assembly := dotnet_assemblies.item (i)
				if a_test.item ([l_assembly]) then
					an_action.call ([l_assembly])
				end
				i := i + 1
			end
		end

end
