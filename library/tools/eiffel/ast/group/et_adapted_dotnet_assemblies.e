note

	description:

		"Eiffel adapted .NET assembly lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ADAPTED_DOTNET_ASSEMBLIES

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_assembly: like dotnet_assembly)
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

	make_empty
			-- Create a new empty adapted .NET assembly list.
		do
			create dotnet_assemblies.make (Initial_assemblies_capacity)
		ensure
			is_empty: dotnet_assemblies.is_empty
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is the list of .NET assemblies empty?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Access

	dotnet_assembly (i: INTEGER): ET_ADAPTED_DOTNET_ASSEMBLY
			-- `i'-th .NET assembly
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := dotnet_assemblies.item (i)
		ensure
			dotnet_assembly_not_void: Result /= Void
		end

	dotnet_assembly_by_name (a_name: STRING): ET_ADAPTED_DOTNET_ASSEMBLY
			-- .NET assembly with name `a_name';
			-- Void if not such .NET assembly
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			i, nb: INTEGER
			l_dotnet_assembly: ET_ADAPTED_DOTNET_ASSEMBLY
		do
			nb := dotnet_assemblies.count
			from i := nb until i < 1 loop
				l_dotnet_assembly := dotnet_assemblies.item (i)
				if STRING_.same_case_insensitive (l_dotnet_assembly.name, a_name) then
					Result := l_dotnet_assembly
					i := 0
				else
					i := i - 1
				end
			end
		end

	adapted_dotnet_assembly (a_dotnet_assembly: ET_DOTNET_ASSEMBLY): ET_ADAPTED_DOTNET_ASSEMBLY
			-- Adapted .NET assembly corresponding to `a_dotnet_assembly' in current list
			--  if any, Void otherwise
			--
			-- Note that `a_dotnet_assembly' may appear twice by the current
			-- list. Return one of them in that case.
		require
			a_dotnet_assembly_not_void: a_dotnet_assembly /= Void
		local
			i, nb: INTEGER
			l_adapted_dotnet_assembly: ET_ADAPTED_DOTNET_ASSEMBLY
		do
			nb := dotnet_assemblies.count
			from i := 1 until i > nb loop
				l_adapted_dotnet_assembly := dotnet_assemblies.item (i)
				if l_adapted_dotnet_assembly.dotnet_assembly = a_dotnet_assembly then
					Result := l_adapted_dotnet_assembly
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + 1
			end
		ensure
			consistent: Result /= Void implies Result.dotnet_assembly = a_dotnet_assembly
		end

	dotnet_assemblies: DS_ARRAYED_LIST [like dotnet_assembly]
			-- Adapted .NET assemblies

feature -- Measurement

	count: INTEGER
			-- Number of .NET assemblies
		do
			Result := dotnet_assemblies.count
		ensure
			count_not_negative: Result >= 0
		end

feature -- Element change

	put_last (a_assembly: like dotnet_assembly)
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

	do_all (an_action: PROCEDURE [ANY, TUPLE [ET_DOTNET_ASSEMBLY]])
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

	do_if (an_action: PROCEDURE [ANY, TUPLE [ET_DOTNET_ASSEMBLY]]; a_test: FUNCTION [ANY, TUPLE [ET_DOTNET_ASSEMBLY], BOOLEAN])
			-- Apply `an_action' to every .NET assembly that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			i, nb: INTEGER
			l_assembly: ET_DOTNET_ASSEMBLY
		do
			nb := dotnet_assemblies.count
			from i := 1 until i > nb loop
				l_assembly := dotnet_assemblies.item (i).dotnet_assembly
				if a_test.item ([l_assembly]) then
					an_action.call ([l_assembly])
				end
				i := i + 1
			end
		end

	universes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]])
			-- Apply `an_action' to every .NET assembly (viewed as a universe), from first to last.
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

	universes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_UNIVERSE]]; a_test: FUNCTION [ANY, TUPLE [ET_UNIVERSE], BOOLEAN])
			-- Apply `an_action' to every .NET assembly (viewed as a universe) that satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			i, nb: INTEGER
			l_dotnet_assembly: ET_DOTNET_ASSEMBLY
		do
			nb := dotnet_assemblies.count
			from i := 1 until i > nb loop
				l_dotnet_assembly := dotnet_assemblies.item (i).dotnet_assembly
				if a_test.item ([l_dotnet_assembly]) then
					an_action.call ([l_dotnet_assembly])
				end
				i := i + 1
			end
		end

	do_adapted (an_action: PROCEDURE [ANY, TUPLE [ET_ADAPTED_DOTNET_ASSEMBLY]])
			-- Apply `an_action' to every .NET assembly, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		require
			an_action_not_void: an_action /= Void
		do
			dotnet_assemblies.do_all (an_action)
		end

	do_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_DOTNET_ASSEMBLY]])
			-- Apply `an_action' to every .NET assemblies,
			-- and to all .NET assemblies reachable from them.
		require
			an_action_not_void: an_action /= Void
		local
			l_visited: DS_HASH_SET [ET_DOTNET_ASSEMBLY]
		do
			create l_visited.make (10)
			do_all (agent {ET_DOTNET_ASSEMBLY}.add_dotnet_assembly_recursive (l_visited))
			l_visited.do_all (an_action)
		end

feature {NONE} -- Constants

	Initial_assemblies_capacity: INTEGER = 50
			-- Initial capacity for `dotnet_assemblies'

invariant

	dotnet_assemblies_not_void: dotnet_assemblies /= Void
	not_void_dotnet_assembly: not dotnet_assemblies.has_void

end
