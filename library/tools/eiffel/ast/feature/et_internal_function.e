indexing

	description:

		"Eiffel internal (do or once) functions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INTERNAL_FUNCTION

inherit

	ET_FUNCTION

	ET_INTERNAL_ROUTINE
		undefine
			type, is_prefixable, is_infixable
		end

feature {NONE} -- Initialization

	make (a_name: like name_item; args: like arguments; a_type: like declared_type;
		an_obsolete: like obsolete_message; a_preconditions: like preconditions;
		a_locals: like locals; a_compound: like compound;
		a_postconditions: like postconditions; a_rescue: like rescue_clause;
		a_clients: like clients; a_class: like implementation_class) is
			-- Create a new internal function.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		do
			name_item := a_name
			arguments := args
			declared_type := a_type
			is_keyword := tokens.is_keyword
			obsolete_message := an_obsolete
			preconditions := a_preconditions
			locals := a_locals
			compound := a_compound
			postconditions := a_postconditions
			rescue_clause := a_rescue
			end_keyword := tokens.end_keyword
			clients := a_clients
			implementation_class := a_class
		ensure
			name_item_set: name_item = a_name
			arguments_set: arguments = args
			declared_type_set: declared_type = a_type
			obsolete_message_set: obsolete_message = an_obsolete
			preconditions_set: preconditions = a_preconditions
			locals_set: locals = a_locals
			compound_set: compound = a_compound
			postconditions_set: postconditions = a_postconditions
			rescue_clause_set: rescue_clause = a_rescue
			clients_set: clients = a_clients
			implementation_class_set: implementation_class = a_class
		end

end
