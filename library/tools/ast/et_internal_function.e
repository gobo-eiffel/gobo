indexing

	description:

		"Eiffel internal (do or once) functions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_INTERNAL_FUNCTION

inherit

	ET_FUNCTION
	ET_INTERNAL_ROUTINE

feature {NONE} -- Initialization

	make (a_name: like name; args: like arguments; a_type: like type;
		an_obsolete: like obsolete_message; a_preconditions: like preconditions;
		a_locals: like locals; a_compound: like compound;
		a_postconditions: like postconditions; a_rescue: like rescue_clause;
		a_clients: like clients; a_class: like implementation_class; an_id: INTEGER) is
			-- Create a new internal function.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id >= 0
		do
			!! seeds.make (an_id)
			make_with_seeds (a_name, args, a_type, an_obsolete,
				a_preconditions, a_locals, a_compound, a_postconditions,
				a_rescue, a_clients, a_class, seeds, an_id)
		ensure
			name_set: name = a_name
			arguments_set: arguments = args
			type_set: type = a_type
			obsolete_message_set: obsolete_message = an_obsolete
			preconditions_set: preconditions = a_preconditions
			locals_set: locals = a_locals
			compound_set: compound = a_compound
			postconditions_set: postconditions = a_postconditions
			rescue_clause_set: rescue_clause = a_rescue
			clients_set: clients = a_clients
			version_set: version = an_id
			implementation_class_set: implementation_class = a_class
			id_set: id = an_id
		end

	make_with_seeds (a_name: like name; args: like arguments; a_type: like type;
		an_obsolete: like obsolete_message; a_preconditions: like preconditions;
		a_locals: like locals; a_compound: like compound;
		a_postconditions: like postconditions; a_rescue: like rescue_clause;
		a_clients: like clients; a_class: like implementation_class; a_seeds: like seeds; an_id: INTEGER) is
			-- Create a new internal function.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			a_seeds_not_void: a_seeds /= Void
			an_id_positive: an_id >= 0
		do
			name := a_name
			id := an_id
			arguments := args
			type := a_type
			obsolete_message := an_obsolete
			preconditions := a_preconditions
			locals := a_locals
			compound := a_compound
			postconditions := a_postconditions
			rescue_clause := a_rescue
			clients := a_clients
			version := an_id
			implementation_class := a_class
			seeds := a_seeds
		ensure
			name_set: name = a_name
			arguments_set: arguments = args
			type_set: type = a_type
			obsolete_message_set: obsolete_message = an_obsolete
			preconditions_set: preconditions = a_preconditions
			locals_set: locals = a_locals
			compound_set: compound = a_compound
			postconditions_set: postconditions = a_postconditions
			rescue_clause_set: rescue_clause = a_rescue
			clients_set: clients = a_clients
			version_set: version = an_id
			implementation_class_set: implementation_class = a_class
			seeds_set: seeds = a_seeds
			id_set: id = an_id
		end

end -- class ET_INTERNAL_FUNCTION
