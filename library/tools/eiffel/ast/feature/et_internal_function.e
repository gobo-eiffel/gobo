indexing

	description:

		"Eiffel internal (do or once) functions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INTERNAL_FUNCTION

inherit

	ET_FUNCTION
		redefine
			add_to_system
		end

	ET_INTERNAL_ROUTINE
		undefine
			is_prefixable, is_infixable
		end

feature {NONE} -- Initialization

	make (a_name: like name; args: like arguments; a_type: like type;
		an_obsolete: like obsolete_message; a_preconditions: like preconditions;
		a_locals: like locals; a_compound: like compound;
		a_postconditions: like postconditions; a_rescue: like rescue_clause;
		a_clients: like clients; a_class: like current_class; an_id: INTEGER) is
			-- Create a new internal function.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
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
			current_class := a_class
			implementation_class := a_class
			first_seed := an_id
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
			first_seed_set: first_seed = an_id
			current_class_set: current_class = a_class
			implementation_class_set: implementation_class = a_class
			id_set: id = an_id
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current feature.
		do
			type.add_to_system
			if arguments /= Void then
				arguments.add_to_system
			end
			if locals /= Void then
				locals.add_to_system
			end
			if compound /= Void then
				compound.add_to_system
			end
		end

end -- class ET_INTERNAL_FUNCTION
