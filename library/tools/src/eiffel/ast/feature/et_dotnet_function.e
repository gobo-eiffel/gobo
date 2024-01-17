note

	description:

		"Functions implemented in .NET"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2024, Eric Bezault and others"
	license: "MIT License"

class ET_DOTNET_FUNCTION

inherit

	ET_FUNCTION
		undefine
			is_frozen, is_dotnet,
			is_static,
			is_deferred,
			overloaded_extended_name
		redefine
			make, is_prefixable, is_infixable
		end

	ET_DOTNET_QUERY
		undefine
			arguments,
			preconditions,
			postconditions,
			reset_preconditions,
			reset_postconditions,
			obsolete_message,
			is_function,
			is_routine,
			is_prefixable, is_infixable,
			is_bracketable, undefined_feature,
			is_deferred
		end

	ET_DOTNET_ROUTINE
		undefine
			reset, type, is_prefixable, is_infixable,
			is_bracketable, is_function
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; args: like arguments; a_type: like declared_type; a_class: like implementation_class)
			-- Create a new .NET function.
		do
			dotnet_name := a_name.feature_name.name
			overloaded_extended_name := a_name
			precursor (a_name, args, a_type, a_class)
		ensure then
			dotnet_name_set: dotnet_name.same_string (name.name)
			overloaded_extended_name_set: overloaded_extended_name = a_name
		end

feature -- status report

	is_infixable: BOOLEAN
			-- Can current feature have a name of
			-- the form binary 'alias "..."'?
		do
			Result := attached arguments as l_arguments and then (l_arguments.count = 1 or (is_static and l_arguments.count = 2))
		end

	is_prefixable: BOOLEAN
			-- Can current feature have a name of
			-- the form unary 'alias "..."'?
		do
			Result := not attached arguments as l_arguments or else (l_arguments.count = 0 or (is_static and l_arguments.count = 1))
		end

feature -- Duplication

	new_synonym (a_name: like extended_name): like Current
			-- Synonym feature
		do
			create Result.make (a_name, arguments, declared_type, implementation_class)
			Result.set_clients (clients)
			Result.set_overloaded_extended_name (overloaded_extended_name)
			Result.set_dotnet_name (dotnet_name)
			Result.set_is_keyword (is_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_note (first_note)
			Result.set_object_tests (object_tests)
			Result.set_iteration_components (iteration_components)
			Result.set_inline_separate_arguments (inline_separate_arguments)
			Result.set_synonym (Current)
		end

feature -- Conversion

	renamed_feature (a_name: like extended_name): like Current
			-- Renamed version of current feature
		do
			create Result.make (a_name, arguments, declared_type, implementation_class)
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
			Result.set_first_note (first_note)
			Result.set_object_tests (object_tests)
			Result.set_iteration_components (iteration_components)
			Result.set_inline_separate_arguments (inline_separate_arguments)
			Result.set_first_seed (first_seed)
			Result.set_other_seeds (other_seeds)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_dotnet_function (Current)
		end

end
