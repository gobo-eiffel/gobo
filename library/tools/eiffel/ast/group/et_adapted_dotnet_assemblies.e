indexing

	description:

		"Eiffel adapted .NET assembly lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ADAPTED_DOTNET_ASSEMBLIES

inherit

	ANY

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_assembly: like dotnet_assembly) is
			-- Create a new adapted .NET assembly list with initially
			-- one .NET assembly `a_assembly'.
		require
			a_assembly_not_void: a_assembly /= Void
		do
			create dotnet_assemblies.make (Initial_assemblies_capacity)
			dotnet_assemblies.put_last (a_assembly)
		ensure
			one_dotnet_assembly: dotnet_assemblies.count = 1
			dotnet_assembly_set: dotnet_assemblies.last = a_assembly
		end

	make_empty is
			-- Create a new empty adapted .NET assembly list.
		do
			create dotnet_assemblies.make (Initial_assemblies_capacity)
		ensure
			is_empty: dotnet_assemblies.is_empty
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is the list of .NET assemblies empty?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	dotnet_assembly (i: INTEGER): ET_ADAPTED_DOTNET_ASSEMBLY is
			-- `i'-th .NET assembly
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := dotnet_assemblies.item (i)
		ensure
			dotnet_assembly_not_void: Result /= Void
		end

	dotnet_assemblies: DS_ARRAYED_LIST [like dotnet_assembly]
			-- Adapted .NET assemblies

feature -- Measurement

	count: INTEGER is
			-- Number of .NET assemblies
		do
			Result := dotnet_assemblies.count
		ensure
			count_not_negative: Result >= 0
		end

feature -- Element change

	put_last (a_assembly: like dotnet_assembly) is
			-- Add `a_assembly' to the list of .NET assemblies.
		require
			a_assembly_not_void: a_assembly /= Void
		do
			dotnet_assemblies.force_last (a_assembly)
		ensure
			one_more: dotnet_assemblies.count = old dotnet_assemblies.count + 1
			dotnet_assembly_added: dotnet_assemblies.last = a_assembly
		end

feature -- Iteration

	do_all (an_action: PROCEDURE [ANY, TUPLE [ET_DOTNET_ASSEMBLY]]) is
			-- Apply `an_action' to every .NET assembly, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
		do
			nb := dotnet_assemblies.count
			from i := 1 until i > nb loop
				an_action.call ([dotnet_assemblies.item (i).dotnet_assembly])
				i := i + 1
			end
		end

	do_adapted (an_action: PROCEDURE [ANY, TUPLE [ET_ADAPTED_DOTNET_ASSEMBLY]]) is
			-- Apply `an_action' to every .NET assembly, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
		do
			dotnet_assemblies.do_all (an_action)
		end

	do_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_DOTNET_ASSEMBLY]]) is
			-- Apply `an_action' to every .NET assemblies,
			-- and to all .NET assemblies reachable from them.
		require
			an_action_not_void: an_action /= Void
		local
			l_visited: DS_HASH_SET [ET_DOTNET_ASSEMBLY]
		do
			create l_visited.make (10)
			do_all (agent {ET_DOTNET_ASSEMBLY}.recursive_add (l_visited))
			l_visited.do_all (an_action)
		end

feature {NONE} -- Constants

	Initial_assemblies_capacity: INTEGER is 50
			-- Initial capacity for `dotnet_assemblies'

invariant

	dotnet_assemblies_not_void: dotnet_assemblies /= Void
	not_void_dotnet_assembly: not dotnet_assemblies.has (Void)

end
