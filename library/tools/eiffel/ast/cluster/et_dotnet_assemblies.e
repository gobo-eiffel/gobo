indexing

	description:

		".NET assembly lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

feature {NONE} -- Constants

	Initial_assemblies_capacity: INTEGER is 50
			-- Initial capacity for `assemblies'

invariant

	assemblies_not_void: assemblies /= Void
	not_void_assembly: not assemblies.has (Void)

end
