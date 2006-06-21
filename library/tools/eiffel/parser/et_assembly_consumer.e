indexing

	description:

		".NET assembly consumers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ASSEMBLY_CONSUMER

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new assembly consumer.
		require
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
		ensure
			universe_set: universe = a_universe
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Consuming

	consume_assemblies (an_assemblies: ET_ASSEMBLIES) is
			-- Consume `an_assemblies' and put the classes in `universe'.
		require
			an_assemblies_not_void: an_assemblies /= Void
		deferred
		end

	consume_assembly (an_assembly: ET_ASSEMBLY) is
			-- Consume `an_assembly' and put the classes in `universe'.
		require
			an_assembly_not_void: an_assembly /= Void
		deferred
		end

	consume_gac_assembly (an_assembly: ET_GAC_ASSEMBLY) is
			-- Consume `an_assembly' and put the classes in `universe'.
		require
			an_assembly_not_void: an_assembly /= Void
		deferred
		end

invariant

	universe_not_void: universe /= Void

end
