indexing

	description:

		"Eiffel unique attributes"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_UNIQUE_ATTRIBUTE

inherit

	ET_QUERY
		redefine
			is_unique_attribute,
			is_prefixable
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_type: like type; a_clients: like clients;
		a_class: like current_class; an_id: INTEGER) is
			-- Create a new unique attribute.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			name := a_name
			id := an_id
			type := a_type
			clients := a_clients
			version := an_id
			current_class := a_class
			implementation_class := a_class
			first_seed := an_id
		ensure
			name_set: name = a_name
			type_set: type = a_type
			clients_set: clients = a_clients
			version_set: version = an_id
			first_seed_set: first_seed = an_id
			current_class_set: current_class = a_class
			implementation_class_set: implementation_class = a_class
			id_set: id = an_id
		end

feature -- Status report

	is_unique_attribute: BOOLEAN is True
			-- Is feature a unique attribute?

	is_prefixable: BOOLEAN is True
			-- Can current feature have a name of
			-- the form 'prefix ...'?

feature -- Duplication

	synonym (a_name: like name): like Current is
			-- Synonym feature
		do
			Result := universe.new_unique_attribute (a_name,
				type, clients, current_class)
		end

feature -- Conversion

	renamed_feature (a_name: like name): like Current is
			-- Renamed version of current feature
		do
			Result := universe.new_unique_attribute (a_name,
				type, clients, current_class)
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

end -- class ET_UNIQUE_ATTRIBUTE
