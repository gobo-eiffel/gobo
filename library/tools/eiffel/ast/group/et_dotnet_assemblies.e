indexing

	description:

		".NET assembly lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_ASSEMBLIES

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES

create

	make, make_empty

feature {NONE} -- Initialization

	make (an_assembly: like assembly) is
			-- Create a new assembly list with initially
			-- one assembly `an_assembly'.
		require
			an_assembly_not_void: an_assembly /= Void
		do
			create assemblies.make (Initial_assemblies_capacity)
			assemblies.put_last (an_assembly)
		ensure
			one_assembly: assemblies.count = 1
			assemblies_set: assemblies.last = an_assembly
		end

	make_empty is
			-- Create a new empty assembly list.
		do
			create assemblies.make (Initial_assemblies_capacity)
		ensure
			is_empty: assemblies.is_empty
		end

feature -- Access

	assembly (i: INTEGER): ET_DOTNET_ASSEMBLY is
			-- `i'-th assembly
		require
			i_large_enough: i >= 1
			i_small_enough: i <= assemblies.count
		do
			Result := assemblies.item (i)
		ensure
			assembly_not_void: Result /= Void
		end

	assembly_by_name (a_name: STRING): ET_DOTNET_ASSEMBLY is
			-- Assembly with name `a_name';
			-- Void if not such assembly
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			i, nb: INTEGER
			l_assembly: ET_DOTNET_ASSEMBLY
		do
			nb := assemblies.count
			from i := nb until i < 1 loop
				l_assembly := assemblies.item (i)
				if STRING_.same_case_insensitive (l_assembly.name, a_name) then
					Result := l_assembly
					i := 0
				else
					i := i - 1
				end
			end
		end

	assemblies: DS_ARRAYED_LIST [like assembly]
			-- Assemblies

feature -- Measurement

	count: INTEGER is
			-- Number of assemblies
		do
			Result := assemblies.count
		ensure
			count_non_negative: Result >= 0
		end

feature -- Element change

	put_last (an_assembly: like assembly) is
			-- Add `an_assembly' to the list of assemblies.
		require
			an_assembly_not_void: an_assembly /= Void
		do
			assemblies.force_last (an_assembly)
		ensure
			one_more: assemblies.count = old assemblies.count + 1
			assembly_added: assemblies.last = an_assembly
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
			nb := assemblies.count
			from i := 1 until i > nb loop
				an_action.call ([assemblies.item (i)])
				i := i + 1
			end
		end

	universes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]) is
			-- Apply `an_action' to every .NET assembly (viewed as a universe), from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
		do
			nb := assemblies.count
			from i := 1 until i > nb loop
				an_action.call ([assemblies.item (i)])
				i := i + 1
			end
		end

	universes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]; a_test: FUNCTION [ANY, TUPLE [ET_UNIVERSE], BOOLEAN]) is
			-- Apply `an_action' to every .NET assembly (viewed as a universe) that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			i, nb: INTEGER
			l_dotnet_assembly: ET_DOTNET_ASSEMBLY
		do
			nb := assemblies.count
			from i := 1 until i > nb loop
				l_dotnet_assembly := assemblies.item (i)
				if a_test.item ([l_dotnet_assembly]) then
					an_action.call ([l_dotnet_assembly])
				end
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Initial_assemblies_capacity: INTEGER is 50
			-- Initial capacity for `assemblies'

invariant

	assemblies_not_void: assemblies /= Void
	not_void_assembly: not assemblies.has_void

end
