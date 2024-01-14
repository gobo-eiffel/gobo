note

	description:

		".NET assembly consumers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"

deferred class ET_DOTNET_ASSEMBLY_CONSUMER

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new assembly consumer.
		require
			a_system_processor_not_void: a_system_processor /= Void
		do
			system_processor := a_system_processor
		ensure
			system_processor_set: system_processor = a_system_processor
		end

feature -- Access

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

	error_handler: ET_ERROR_HANDLER
			-- Error handler
		do
			Result := system_processor.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Consuming

	consume_assemblies (an_assemblies: ET_DOTNET_ASSEMBLIES)
			-- Consume `an_assemblies' and put the classes in `universe'.
		require
			an_assemblies_not_void: an_assemblies /= Void
		local
			i, nb: INTEGER
		do
			nb := an_assemblies.count
			from i := 1 until i > nb loop
				an_assemblies.dotnet_assembly (i).consume (Current)
				i := i + 1
			end
		end

	consume_class (a_class: ET_CLASS)
			-- Consume `a_class'.
		require
			a_class_not_void: a_class /= Void
			a_class_dotnet: a_class.is_in_dotnet_assembly
		deferred
		ensure
			a_class_parsed: a_class.is_parsed
		end

feature {ET_DOTNET_ASSEMBLY} -- Consuming

	consume_assembly (an_assembly: ET_DOTNET_ASSEMBLY)
			-- Consume `an_assembly' and put the classes in `universe'.
		require
			an_assembly_not_void: an_assembly /= Void
		deferred
		end

	consume_gac_assembly (an_assembly: ET_DOTNET_GAC_ASSEMBLY)
			-- Consume `an_assembly' and put the classes in `universe'.
		require
			an_assembly_not_void: an_assembly /= Void
		deferred
		end

invariant

	system_processor_not_void: system_processor /= Void

end
