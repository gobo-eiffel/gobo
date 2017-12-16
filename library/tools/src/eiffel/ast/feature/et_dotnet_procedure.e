note

	description:

		"Procedures implemented in .NET"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_PROCEDURE

inherit

	ET_PROCEDURE
		undefine
			is_frozen, is_dotnet,
			is_static,
			is_deferred,
			overloaded_extended_name
		redefine
			make
		end

	ET_DOTNET_ROUTINE

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; args: like arguments; a_class: like implementation_class)
			-- Create a new .NET procedure.
		do
			dotnet_name := a_name.feature_name.name
			overloaded_extended_name := a_name
			precursor (a_name, args, a_class)
		ensure then
			dotnet_name_set: dotnet_name.same_string (name.name)
			overloaded_extended_name_set: overloaded_extended_name = a_name
		end

feature -- Duplication

	new_synonym (a_name: like extended_name): like Current
			-- Synonym feature
		do
			create Result.make (a_name, arguments, implementation_class)
			Result.set_clients (clients)
			Result.set_overloaded_extended_name (overloaded_extended_name)
			Result.set_dotnet_name (dotnet_name)
			Result.set_is_keyword (is_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_across_components (across_components)
			Result.set_synonym (Current)
		end

feature -- Conversion

	renamed_feature (a_name: like extended_name): like Current
			-- Renamed version of current feature
		do
			create Result.make (a_name, arguments, implementation_class)
			Result.set_clients (clients)
			Result.set_implementation_feature (implementation_feature)
			Result.set_overloaded_extended_name (overloaded_extended_name)
			Result.set_dotnet_name (dotnet_name)
			Result.set_first_precursor (first_precursor)
			Result.set_other_precursors (other_precursors)
			Result.set_is_keyword (is_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_version (version)
			Result.set_frozen_keyword (frozen_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_across_components (across_components)
			Result.set_first_seed (first_seed)
			Result.set_other_seeds (other_seeds)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_dotnet_procedure (Current)
		end

end
