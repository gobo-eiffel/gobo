indexing

	description:

		".NET assembly consumers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DOTNET_ASSEMBLY_CONSUMER

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

	universe: ET_SYSTEM
			-- Surrounding universe

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := universe.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Consuming

	consume_assemblies (an_assemblies: ET_DOTNET_ASSEMBLIES) is
			-- Consume `an_assemblies' and put the classes in `universe'.
		require
			an_assemblies_not_void: an_assemblies /= Void
		local
			i, nb: INTEGER
		do
			nb := an_assemblies.count
			from i := 1 until i > nb loop
				an_assemblies.assembly (i).consume (Current)
				i := i + 1
			end
		end

	consume_class (a_class: ET_CLASS) is
			-- Consume `a_class'.
		require
			a_class_not_void: a_class /= Void
			a_class_dotnet: a_class.is_in_dotnet_assembly
		deferred
		ensure
			a_class_parsed: a_class.is_parsed
		end

feature {ET_DOTNET_ASSEMBLY} -- Consuming

	consume_assembly (an_assembly: ET_DOTNET_ASSEMBLY) is
			-- Consume `an_assembly' and put the classes in `universe'.
		require
			an_assembly_not_void: an_assembly /= Void
		deferred
		end

	consume_gac_assembly (an_assembly: ET_DOTNET_GAC_ASSEMBLY) is
			-- Consume `an_assembly' and put the classes in `universe'.
		require
			an_assembly_not_void: an_assembly /= Void
		deferred
		end

invariant

	universe_not_void: universe /= Void

end
