indexing

	description:

		"Eiffel constant attributes"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CONSTANT_ATTRIBUTE

inherit

	ET_QUERY
		redefine
			is_constant_attribute,
			is_prefixable
		end

creation

	make, make_with_seeds

feature {NONE} -- Initialization

	make (a_name: like name; a_type: like type; a_constant: like constant;
		a_clients: like clients; a_class: like implementation_class; an_id: INTEGER) is
			-- Create a new constant attribute.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_constant_not_void: a_constant /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id >= 0
		do
			!! seeds.make (an_id)
			make_with_seeds (a_name, a_type, a_constant, a_clients,
				a_class, seeds, an_id)
		ensure
			name_set: name = a_name
			type_set: type = a_type
			constant_set: constant = a_constant
			clients_set: clients = a_clients
			version_set: version = an_id
			implementation_class_set: implementation_class = a_class
			id_set: id = an_id
		end

	make_with_seeds (a_name: like name; a_type: like type;
		a_constant: like constant; a_clients: like clients;
		a_class: like implementation_class; a_seeds: like seeds; an_id: INTEGER) is
			-- Create a new constant attribute.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_constant_not_void: a_constant /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			a_seeds_not_void: a_seeds /= Void
			an_id_positive: an_id >= 0
		do
			name := a_name
			id := an_id
			type := a_type
			constant := a_constant
			clients := a_clients
			version := an_id
			implementation_class := a_class
			seeds := a_seeds
		ensure
			name_set: name = a_name
			type_set: type = a_type
			constant_set: constant = a_constant
			clients_set: clients = a_clients
			version_set: version = an_id
			implementation_class_set: implementation_class = a_class
			seeds_set: seeds = a_seeds
			id_set: id = an_id
		end

feature -- Access

	constant: ANY
			-- Constant value

feature -- Status report

	is_constant_attribute: BOOLEAN is True
			-- Is feature a constant attribute?

	is_prefixable: BOOLEAN is True
			-- Can current feature have a name of
			-- the form 'prefix ...'?

feature -- Duplication

	synonym (a_name: like name; an_id: INTEGER): like Current is
			-- Synonym feature
		do
			!! Result.make (a_name, type, constant, clients, implementation_class, an_id)
		end

feature -- Conversion

	renamed_feature (a_name: like name; an_id: INTEGER): like Current is
			-- Renamed version of current feature
		do
			!! Result.make_with_seeds (a_name, type, constant, clients, implementation_class, seeds, an_id)
			Result.set_version (version)
		end

invariant

	constant_not_void: constant /= Void

end -- class ET_CONSTANT_ATTRIBUTE
