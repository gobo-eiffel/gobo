indexing

	description:

		"Constant attributes implemented in .NET"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_CONSTANT_ATTRIBUTE

inherit

	ET_CONSTANT_ATTRIBUTE
		undefine
			is_frozen, is_dotnet
		redefine
			process, make
		end

	ET_DOTNET_QUERY
		undefine
			is_constant_attribute,
			is_prefixable
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; a_type: like declared_type; a_constant: like constant; a_class: like implementation_class) is
			-- Create a new .NET constant attribute.
		do
			precursor (a_name, a_type, a_constant, a_class)
			dotnet_name := name.name
			overloaded_name := name.name
		ensure then
			dotnet_name_set: dotnet_name.same_string (name.name)
			overloaded_name_set: overloaded_name.same_string (name.name)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_dotnet_constant_attribute (Current)
		end

end
