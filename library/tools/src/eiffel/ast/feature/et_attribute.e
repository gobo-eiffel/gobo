note

	description:

		"Eiffel variable attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ATTRIBUTE

inherit

	ET_QUERY
		redefine
			is_attribute,
			is_transient_attribute,
			is_stable_attribute,
			is_prefixable
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; a_type: like declared_type; a_class: like implementation_class)
			-- Create a new attribute.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_class_not_void: a_class /= Void
		do
			extended_name := a_name
			hash_code := name.hash_code
			declared_type := a_type
			clients := tokens.empty_clients
			implementation_class := a_class
			implementation_feature := Current
		ensure
			extended_name_set: extended_name = a_name
			declared_type_set: declared_type = a_type
			implementation_class_set: implementation_class = a_class
			implementation_feature_set: implementation_feature = Current
		end

feature -- Status report

	is_attribute: BOOLEAN = True
			-- Is feature an attribute?

	is_transient_attribute: BOOLEAN
			-- Is feature a transient attribute
			-- (i.e. not taken into account by Storable)?
		do
			Result := attached first_indexing as l_indexing and then l_indexing.has_tagged_indexing_term_value (tokens.option_indexing_tag, tokens.transient_indexing_value)
		end

	is_stable_attribute: BOOLEAN
			-- Is feature a stable attribute
			-- (i.e. cannot be set to Void in void-safe mode)?
		do
			Result := attached first_indexing as l_indexing and then l_indexing.has_tagged_indexing_term_value (tokens.option_indexing_tag, tokens.stable_indexing_value)
		end

	is_prefixable: BOOLEAN = True
			-- Can current feature have a name of
			-- the form unary 'alias "..."'?

feature -- Access

	header_break: detachable ET_BREAK
			-- Break which appears where the header comment is expected
		do
			if attached semicolon as l_semicolon then
				if attached l_semicolon.break as l_break and then l_break.has_comment then
					Result := l_break
				end
			end
			if Result = Void then
				if attached declared_type.break as l_break and then l_break.has_comment then
					Result := l_break
				end
			end
			if Result = Void and attached assigner as l_assigner then
				if attached l_assigner.break as l_break and then l_break.has_comment then
					Result := l_break
				end
			end
			if Result = Void then
				Result := declared_type.break
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached semicolon as l_semicolon then
				Result := l_semicolon
			else
				Result := declared_type.last_leaf
			end
		end

feature -- Duplication

	new_synonym (a_name: like extended_name): like Current
			-- Synonym feature
		do
			create Result.make (a_name, declared_type, implementation_class)
			Result.set_assigner (assigner)
			Result.set_clients (clients)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_iteration_components (iteration_components)
			Result.set_synonym (Current)
		end

feature -- Conversion

	renamed_feature (a_name: like extended_name): like Current
			-- Renamed version of current feature
		do
			create Result.make (a_name, declared_type, implementation_class)
			Result.set_assigner (assigner)
			Result.set_clients (clients)
			Result.set_implementation_feature (implementation_feature)
			Result.set_first_precursor (first_precursor)
			Result.set_other_precursors (other_precursors)
			Result.set_version (version)
			Result.set_frozen_keyword (frozen_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_iteration_components (iteration_components)
			Result.set_first_seed (first_seed)
			Result.set_other_seeds (other_seeds)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_attribute (Current)
		end

invariant

	is_attribute: arguments = Void

end
