indexing

	description:

		"Eiffel deferred-functions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DEFERRED_FUNCTION

inherit

	ET_FUNCTION
		undefine
			is_deferred
		end

	ET_DEFERRED_ROUTINE
		undefine
			is_prefixable, is_infixable
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; args: like arguments; a_type: like type;
		an_obsolete: like obsolete_message; a_preconditions: like preconditions;
		a_postconditions: like postconditions; a_clients: like clients;
		a_class: like current_class; an_id: INTEGER) is
			-- Create a new deferred function.
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
			postconditions := a_postconditions
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
			postconditions_set: postconditions = a_postconditions
			clients_set: clients = a_clients
			version_set: version = an_id
			first_seed_set: first_seed = an_id
			current_class_set: current_class = a_class
			implementation_class_set: implementation_class = a_class
			id_set: id = an_id
		end

feature -- Duplication

	synonym (a_name: like name): like Current is
			-- Synonym feature
		do
			Result := universe.new_deferred_function (a_name,
				arguments, type, obsolete_message, preconditions,
				postconditions, clients, current_class)
		end

feature -- Conversion

	renamed_feature (a_name: like name): like Current is
			-- Renamed version of current feature
		do
			Result := universe.new_deferred_function (a_name,
				arguments, type, obsolete_message, preconditions,
				postconditions, clients, current_class)
			Result.set_implementation_class (implementation_class)
			Result.set_version (version)
			if seeds /= Void then
				Result.set_seeds (seeds)
			else
				Result.set_first_seed (first_seed)
			end
			if precursors /= Void then
				Result.set_precursors (precursors)
			else
				Result.set_first_precursor (first_precursor)
			end
		end

end
