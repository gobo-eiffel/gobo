indexing

	description:

		"Eiffel unique attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNIQUE_ATTRIBUTE

inherit

	ET_QUERY
		redefine
			is_unique_attribute,
			is_prefixable
		end

	ET_SHARED_TOKEN_CONSTANTS

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name_item; a_type: like declared_type; a_clients: like clients;
		a_class: like current_class; an_id: INTEGER) is
			-- Create a new unique attribute.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			name_item := a_name
			id := an_id
			declared_type := a_type
			is_keyword := tokens.is_keyword
			unique_keyword := tokens.unique_keyword
			clients := a_clients
			version := an_id
			current_class := a_class
			implementation_class := a_class
			first_seed := an_id
		ensure
			name_item_set: name_item = a_name
			declared_type_set: declared_type = a_type
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

feature -- Access

	is_keyword: ET_TOKEN
			-- 'is' keyword

	unique_keyword: ET_TOKEN
			-- 'unique' keyword

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := unique_keyword.break
		end

feature -- Setting

	set_is_keyword (an_is: like is_keyword) is
			-- Set `is_keyword' to `an_is'.
		require
			an_is_not_void: an_is /= Void
		do
			is_keyword := an_is
		ensure
			is_keyword_set: is_keyword = an_is
		end

	set_unique_keyword (a_unique: like unique_keyword) is
			-- Set `unique_keyword' to `a_unique'.
		require
			a_unique_not_void: a_unique /= Void
		do
			unique_keyword := a_unique
		ensure
			unique_keyword_set: unique_keyword = a_unique
		end

feature -- Duplication

	new_synonym (a_name: like name_item): like Current is
			-- Synonym feature
		do
			Result := universe.new_unique_attribute (a_name,
				declared_type, clients, current_class)
			Result.set_is_keyword (is_keyword)
			Result.set_unique_keyword (unique_keyword)
			Result.set_synonym (Current)
		end

feature -- Conversion

	renamed_feature (a_name: like name): like Current is
			-- Renamed version of current feature
		do
			Result := universe.new_unique_attribute (a_name,
				declared_type, clients, current_class)
			Result.set_is_keyword (is_keyword)
			Result.set_unique_keyword (unique_keyword)
			Result.set_implementation_class (implementation_class)
			Result.set_version (version)
			Result.set_frozen_keyword (frozen_keyword)
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

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_unique_attribute (Current)
		end

invariant

	is_keyword_not_void: is_keyword /= Void
	unique_keyword_not_void: unique_keyword /= Void

end
