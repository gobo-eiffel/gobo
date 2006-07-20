indexing

	description:

		"Functions implemented in .NET"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DOTNET_FUNCTION

inherit

	ET_FUNCTION
		undefine
			is_dotnet
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
			is_prefixable, is_infixable,
			is_bracketable, undefined_feature,
			resolve_inherited_signature
		end

	ET_DOTNET_ROUTINE
		undefine
			type, is_prefixable, is_infixable,
			is_bracketable, is_function
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; args: like arguments; a_type: like declared_type;
		a_clients: like clients; a_class: like implementation_class) is
			-- Create a new .NET function.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		do
			extended_name := a_name
			hash_code := name.hash_code
			arguments := args
			declared_type := a_type
			is_keyword := tokens.is_keyword
			end_keyword := tokens.end_keyword
			clients := a_clients
			implementation_class := a_class
			implementation_feature := Current
		ensure
			extended_name_set: extended_name = a_name
			arguments_set: arguments = args
			clients_set: clients = a_clients
			implementation_class_set: implementation_class = a_class
			implementation_feature_set: implementation_feature = Current
		end

feature -- Duplication

	new_synonym (a_name: like extended_name): like Current is
			-- Synonym feature
		do
			create Result.make (a_name, arguments, declared_type, clients, implementation_class)
			Result.set_is_keyword (is_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_synonym (Current)
		end

feature -- Conversion

	renamed_feature (a_name: like extended_name): like Current is
			-- Renamed version of current feature
		do
			create Result.make (a_name, arguments, declared_type, clients, implementation_class)
			Result.set_implementation_feature (implementation_feature)
			Result.set_first_precursor (first_precursor)
			Result.set_other_precursors (other_precursors)
			Result.set_is_keyword (is_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_version (version)
			Result.set_frozen_keyword (frozen_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_first_seed (first_seed)
			Result.set_other_seeds (other_seeds)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			-- TODO
		end

end
