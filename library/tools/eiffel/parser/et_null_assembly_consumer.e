indexing

	description:

		"Null .NET assembly consumers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_NULL_ASSEMBLY_CONSUMER

inherit

	ET_ASSEMBLY_CONSUMER

create

	make

feature -- Consuming

	consume_assemblies (an_assemblies: ET_ASSEMBLIES) is
			-- Consume `an_assemblies' and put the classes in `universe'.
		do
			-- Do nothing.
		end

	consume_assembly (an_assembly: ET_ASSEMBLY) is
			-- Consume `an_assembly' and put the classes in `universe'.
		do
			-- Do nothing.
		end

	consume_gac_assembly (an_assembly: ET_GAC_ASSEMBLY) is
			-- Consume `an_assembly' and put the classes in `universe'.
		do
			-- Do nothing.
		end

end
