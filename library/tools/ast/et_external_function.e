indexing

	description:

		"Eiffel external-functions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EXTERNAL_FUNCTION

inherit

	ET_FUNCTION
	ET_EXTERNAL_ROUTINE

creation

	make, make_with_seeds

feature {NONE} -- Initialization

	make (a_name: like name; args: like arguments; a_type: like type;
		an_obsolete: like obsolete_message; a_preconditions: like preconditions;
		a_language: like language; an_alias: like alias_clause;
		a_postconditions: like postconditions; a_clients: like clients;
		a_class: like base_class) is
			-- Create a new external function.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_language_not_void: a_language /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		do
			make_with_seeds (a_name, args, a_type, an_obsolete,
				a_preconditions, a_language, an_alias, a_postconditions,
				a_clients, a_class, new_seeds)
		ensure
			name_set: name = a_name
			arguments_set: arguments = args
			type_set: type = a_type
			obsolete_message_set: obsolete_message = an_obsolete
			preconditions_set: preconditions = a_preconditions
			language_set: language = a_language
			alias_clause_set: alias_clause = an_alias
			postconditions_set: postconditions = a_postconditions
			clients_set: clients = a_clients
			version_set: version = Current
			base_class_set: base_class = a_class
			implementation_class_set: implementation_class = a_class
		end

	make_with_seeds (a_name: like name; args: like arguments; a_type: like type;
		an_obsolete: like obsolete_message; a_preconditions: like preconditions;
		a_language: like language; an_alias: like alias_clause;
		a_postconditions: like postconditions; a_clients: like clients;
		a_class: like base_class; a_seeds: like seeds) is
			-- Create a new external function.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_language_not_void: a_language /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			a_seeds_not_void: a_seeds /= Void
			a_seeds_valid: valid_seeds (a_seeds)
		do
			name := a_name
			arguments := args
			type := a_type
			obsolete_message := an_obsolete
			preconditions := a_preconditions
			language := a_language
			alias_clause := an_alias
			postconditions := a_postconditions
			clients := a_clients
			version := Current
			base_class := a_class
			implementation_class := a_class
			seeds := a_seeds
		ensure
			name_set: name = a_name
			arguments_set: arguments = args
			type_set: type = a_type
			obsolete_message_set: obsolete_message = an_obsolete
			preconditions_set: preconditions = a_preconditions
			language_set: language = a_language
			alias_clause_set: alias_clause = an_alias
			postconditions_set: postconditions = a_postconditions
			clients_set: clients = a_clients
			version_set: version = Current
			base_class_set: base_class = a_class
			implementation_class_set: implementation_class = a_class
			seeds_set: seeds = a_seeds
		end

feature -- Duplication

	synonym (a_name: like name): like Current is
			-- Synonym feature
		do
			!! Result.make (a_name, arguments, type, obsolete_message, preconditions,
				language, alias_clause, postconditions, clients, base_class)
		end

feature -- Conversion

	renamed_feature (a_name: like name; a_class: like base_class): like Current is
			-- Renamed version of current feature
		do
			!! Result.make_with_seeds (a_name, arguments, type, obsolete_message, preconditions,
				language, alias_clause, postconditions, clients, a_class, seeds)
			Result.set_version (version)
			Result.set_implementation_class (implementation_class)
		end

end -- class ET_EXTERNAL_FUNCTION
