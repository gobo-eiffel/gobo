indexing

	description:

		"Eiffel external-procedures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXTERNAL_PROCEDURE

inherit

	ET_PROCEDURE

	ET_EXTERNAL_ROUTINE

create

	make

feature {NONE} -- Initialization

	make (a_name: like name_item; args: like arguments;
		an_obsolete: like obsolete_message; a_preconditions: like preconditions;
		a_language: like language; an_alias: like alias_clause;
		a_postconditions: like postconditions; a_clients: like clients;
		a_class: like implementation_class) is
			-- Create a new external procedure.
		require
			a_name_not_void: a_name /= Void
			a_language_not_void: a_language /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		do
			name_item := a_name
			hash_code := name.hash_code
			arguments := args
			is_keyword := tokens.is_keyword
			obsolete_message := an_obsolete
			preconditions := a_preconditions
			language := a_language
			alias_clause := an_alias
			postconditions := a_postconditions
			end_keyword := tokens.end_keyword
			clients := a_clients
			implementation_class := a_class
			implementation_feature := Current
			builtin_code := tokens.builtin_not_builtin
		ensure
			name_item_set: name_item = a_name
			arguments_set: arguments = args
			obsolete_message_set: obsolete_message = an_obsolete
			preconditions_set: preconditions = a_preconditions
			language_set: language = a_language
			alias_clause_set: alias_clause = an_alias
			postconditions_set: postconditions = a_postconditions
			clients_set: clients = a_clients
			implementation_class_set: implementation_class = a_class
			implementation_feature_set: implementation_feature = Current
		end

feature -- Duplication

	new_synonym (a_name: like name_item): like Current is
			-- Synonym feature
		do
			create Result.make (a_name, arguments, obsolete_message, preconditions,
				language, alias_clause, postconditions, clients, implementation_class)
			Result.set_is_keyword (is_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_synonym (Current)
			if is_builtin then
				Result.set_builtin_code (tokens.builtin_unknown)
			end
		end

feature -- Conversion

	renamed_feature (a_name: like name): like Current is
			-- Renamed version of current feature
		do
			create Result.make (a_name, arguments, obsolete_message, preconditions,
				language, alias_clause, postconditions, clients, implementation_class)
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
			Result.set_builtin_code (builtin_code)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_external_procedure (Current)
		end

end
