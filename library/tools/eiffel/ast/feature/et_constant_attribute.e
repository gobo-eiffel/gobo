indexing

	description:

		"Eiffel constant attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTANT_ATTRIBUTE

inherit

	ET_QUERY
		redefine
			is_constant_attribute,
			is_prefixable
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name_item; a_type: like declared_type; a_constant: like constant;
		a_clients: like clients; a_class: like current_class) is
			-- Create a new constant attribute.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_constant_not_void: a_constant /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		do
			name_item := a_name
			declared_type := a_type
			is_keyword := tokens.is_keyword
			constant := a_constant
			clients := a_clients
			current_class := a_class
			implementation_class := a_class
		ensure
			name_item_set: name_item = a_name
			declared_type_set: declared_type = a_type
			constant_set: constant = a_constant
			clients_set: clients = a_clients
			current_class_set: current_class = a_class
			implementation_class_set: implementation_class = a_class
		end

feature -- Access

	is_keyword: ET_KEYWORD
			-- 'is' keyword

	constant: ET_CONSTANT
			-- Constant value

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := constant.break
		end

feature -- Status report

	is_constant_attribute: BOOLEAN is True
			-- Is feature a constant attribute?

	is_prefixable: BOOLEAN is True
			-- Can current feature have a name of
			-- the form 'prefix ...'?

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

feature -- Duplication

	new_synonym (a_name: like name_item): like Current is
			-- Synonym feature
		do
			create Result.make (a_name, declared_type, constant, clients, current_class)
			Result.set_is_keyword (is_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_synonym (Current)
		end

feature -- Conversion

	renamed_feature (a_name: like name): like Current is
			-- Renamed version of current feature
		do
			create Result.make (a_name, declared_type, constant, clients, current_class)
			Result.set_is_keyword (is_keyword)
			Result.set_implementation_class (implementation_class)
			Result.set_version (version)
			Result.set_frozen_keyword (frozen_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
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
			a_processor.process_constant_attribute (Current)
		end

invariant

	is_keyword_not_void: is_keyword /= Void
	constant_not_void: constant /= Void

end
