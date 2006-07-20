indexing

	description:

		"Attributes implemented in .NET"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_ATTRIBUTE

inherit

	ET_ATTRIBUTE
		undefine
			is_dotnet
		redefine
			process
		end

	ET_DOTNET_QUERY
		undefine
			is_attribute,
			is_prefixable
		end

create

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_dotnet_attribute (Current)
		end

end
