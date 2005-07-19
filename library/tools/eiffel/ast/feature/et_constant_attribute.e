indexing

	description:

		"Eiffel constant attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONSTANT_ATTRIBUTE

inherit

	ET_QUERY
		redefine
			is_constant_attribute,
			is_prefixable
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; a_type: like declared_type; an_assigner: like assigner;
		a_constant: like constant; a_clients: like clients; a_class: like implementation_class) is
			-- Create a new constant attribute.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_constant_not_void: a_constant /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
		do
			extended_name := a_name
			hash_code := name.hash_code
			declared_type := a_type
			assigner := an_assigner
			is_keyword := tokens.is_keyword
			constant := a_constant
			clients := a_clients
			implementation_class := a_class
			implementation_feature := Current
		ensure
			extended_name_set: extended_name = a_name
			declared_type_set: declared_type = a_type
			assigner_set: assigner = an_assigner
			constant_set: constant = a_constant
			clients_set: clients = a_clients
			implementation_class_set: implementation_class = a_class
			implementation_feature_set: implementation_feature = Current
		end

feature -- Access

	is_keyword: ET_KEYWORD
			-- 'is' keyword

	constant: ET_CONSTANT
			-- Constant value

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := constant.last_leaf
		end

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

	new_synonym (a_name: like extended_name): like Current is
			-- Synonym feature
		do
			create Result.make (a_name, declared_type, assigner, constant, clients, implementation_class)
			Result.set_is_keyword (is_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_synonym (Current)
		end

feature -- Conversion

	renamed_feature (a_name: like extended_name): like Current is
			-- Renamed version of current feature
		do
			create Result.make (a_name, declared_type, assigner, constant, clients, implementation_class)
			Result.set_implementation_feature (implementation_feature)
			Result.set_first_precursor (first_precursor)
			Result.set_other_precursors (other_precursors)
			Result.set_is_keyword (is_keyword)
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
			a_processor.process_constant_attribute (Current)
		end

invariant

	is_keyword_not_void: is_keyword /= Void
	constant_not_void: constant /= Void
	is_constant_attribute: arguments = Void

end
