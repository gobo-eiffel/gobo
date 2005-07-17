indexing

	description:

		"Eiffel deferred-procedures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DEFERRED_PROCEDURE

inherit

	ET_PROCEDURE
		undefine
			is_deferred
		end

	ET_DEFERRED_ROUTINE

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; args: like arguments; an_obsolete: like obsolete_message;
		a_preconditions: like preconditions; a_postconditions: like postconditions;
		a_clients: like clients; a_class: like implementation_class) is
			-- Create a new deferred procedure.
		require
			a_name_not_void: a_name /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		do
			extended_name := a_name
			hash_code := name.hash_code
			arguments := args
			is_keyword := tokens.is_keyword
			obsolete_message := an_obsolete
			preconditions := a_preconditions
			deferred_keyword := tokens.deferred_keyword
			postconditions := a_postconditions
			end_keyword := tokens.end_keyword
			clients := a_clients
			implementation_class := a_class
			implementation_feature := Current
		ensure
			extended_name_set: extended_name = a_name
			arguments_set: arguments = args
			obsolete_message_set: obsolete_message = an_obsolete
			preconditions_set: preconditions = a_preconditions
			postconditions_set: postconditions = a_postconditions
			clients_set: clients = a_clients
			implementation_class_set: implementation_class = a_class
			implementation_feature_set: implementation_feature = Current
		end

feature -- Duplication

	new_synonym (a_name: like extended_name): like Current is
			-- Synonym feature
		do
			create Result.make (a_name, arguments, obsolete_message, preconditions,
				postconditions, clients, implementation_class)
			Result.set_is_keyword (is_keyword)
			Result.set_deferred_keyword (deferred_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_synonym (Current)
		end

feature -- Conversion

	renamed_feature (a_name: like name): like Current is
			-- Renamed version of current feature
		do
			create Result.make (a_name, arguments, obsolete_message, preconditions,
				postconditions, clients, implementation_class)
			Result.set_implementation_feature (implementation_feature)
			Result.set_first_precursor (first_precursor)
			Result.set_other_precursors (other_precursors)
			Result.set_is_keyword (is_keyword)
			Result.set_deferred_keyword (deferred_keyword)
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
			a_processor.process_deferred_procedure (Current)
		end

end
