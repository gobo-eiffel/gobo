indexing

	description:

		"Eiffel internal (do or once) procedures"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_INTERNAL_PROCEDURE

inherit

	ET_PROCEDURE
	ET_INTERNAL_ROUTINE

feature {NONE} -- Initialization

	make (a_name: like name; args: like arguments; an_obsolete: like obsolete_message;
		a_preconditions: like preconditions; a_locals: like locals;
		a_compound: like compound; a_postconditions: like postconditions;
		a_rescue: like rescue_clause; a_clients: like clients;
		a_class: like base_class) is
			-- Create a new internal procedure.
		require
			a_name_not_void: a_name /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		do
			make_with_seeds (a_name, args, an_obsolete, a_preconditions,
				a_locals, a_compound, a_postconditions, a_rescue,
				a_clients, a_class, new_seeds)
		ensure
			name_set: name = a_name
			arguments_set: arguments = args
			obsolete_message_set: obsolete_message = an_obsolete
			preconditions_set: preconditions = a_preconditions
			locals_set: locals = a_locals
			compound_set: compound = a_compound
			postconditions_set: postconditions = a_postconditions
			rescue_clause_set: rescue_clause = a_rescue
			clients_set: clients = a_clients
			version_set: version = Current
			base_class_set: base_class = a_class
			implementation_class_set: implementation_class = a_class
		end

	make_with_seeds (a_name: like name; args: like arguments; an_obsolete: like obsolete_message;
		a_preconditions: like preconditions; a_locals: like locals;
		a_compound: like compound; a_postconditions: like postconditions;
		a_rescue: like rescue_clause; a_clients: like clients;
		a_class: like base_class; a_seeds: like seeds) is
			-- Create a new internal procedure.
		require
			a_name_not_void: a_name /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			a_seeds_not_void: a_seeds /= Void
			a_seeds_valid: valid_seeds (a_seeds)
		do
			name := a_name
			arguments := args
			obsolete_message := an_obsolete
			preconditions := a_preconditions
			locals := a_locals
			compound := a_compound
			postconditions := a_postconditions
			rescue_clause := a_rescue
			clients := a_clients
			version := Current
			base_class := a_class
			implementation_class := a_class
			seeds := a_seeds
		ensure
			name_set: name = a_name
			arguments_set: arguments = args
			obsolete_message_set: obsolete_message = an_obsolete
			preconditions_set: preconditions = a_preconditions
			locals_set: locals = a_locals
			compound_set: compound = a_compound
			postconditions_set: postconditions = a_postconditions
			rescue_clause_set: rescue_clause = a_rescue
			clients_set: clients = a_clients
			version_set: version = Current
			base_class_set: base_class = a_class
			implementation_class_set: implementation_class = a_class
			seeds_set: seeds = a_seeds
		end

end -- class ET_INTERNAL_PROCEDURE
