note

	description:

		"Eiffel unique attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNIQUE_ATTRIBUTE

inherit

	ET_CONSTANT_QUERY
		redefine
			is_unique_attribute,
			is_static,
			is_prefixable
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; a_type: like declared_type; a_class: like implementation_class)
			-- Create a new unique attribute.
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_class_not_void: a_class /= Void
		do
			extended_name := a_name
			hash_code := name.hash_code
			declared_type := a_type
			is_keyword := tokens.is_keyword
			unique_keyword := tokens.unique_keyword
			clients := tokens.empty_clients
			create constant.make ("1")
			implementation_class := a_class
			implementation_feature := Current
		ensure
			extended_name_set: extended_name = a_name
			declared_type_set: declared_type = a_type
			implementation_class_set: implementation_class = a_class
			implementation_feature_set: implementation_feature = Current
		end

feature -- Status report

	is_unique_attribute: BOOLEAN = True
			-- Is feature a unique attribute?

	is_static: BOOLEAN = True
			-- Can feature be used as a static feature (i.e. in a call of the form {A}.f)?

	is_prefixable: BOOLEAN = True
			-- Can current feature have a name of
			-- the form 'prefix ...'?

feature -- Access

	is_keyword: ET_AST_LEAF
			-- 'is' keyword or '=' symbol

	unique_keyword: ET_KEYWORD
			-- 'unique' keyword

	constant: ET_REGULAR_INTEGER_CONSTANT
			-- Constant value

	header_break: detachable ET_BREAK
			-- Break which appears where the header comment is expected
		do
			if attached semicolon as l_semicolon then
				if attached l_semicolon.break as l_break and then l_break.has_comment then
					Result := l_break
				end
			end
			if Result = Void then
				if attached unique_keyword.break as l_break and then l_break.has_comment then
					Result := l_break
				end
			end
			if Result = Void then
				if attached is_keyword.break as l_break and then l_break.has_comment then
					Result := l_break
				end
			end
			if Result = Void then
				Result := unique_keyword.break
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if attached semicolon as l_semicolon then
				Result := l_semicolon
			else
				Result := unique_keyword
			end
		end

feature -- Setting

	set_is_keyword (an_is: like is_keyword)
			-- Set `is_keyword' to `an_is'.
		require
			an_is_not_void: an_is /= Void
		do
			is_keyword := an_is
		ensure
			is_keyword_set: is_keyword = an_is
		end

	set_unique_keyword (a_unique: like unique_keyword)
			-- Set `unique_keyword' to `a_unique'.
		require
			a_unique_not_void: a_unique /= Void
		do
			unique_keyword := a_unique
		ensure
			unique_keyword_set: unique_keyword = a_unique
		end

	set_constant (a_constant: like constant)
			-- Set `constant' to `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
			a_constant_is_integer_32: a_constant.is_integer_32
			a_constant_positive: a_constant.to_integer_32 > 0
		do
			constant := a_constant
		ensure
			constant_set: constant = a_constant
		end

feature -- Duplication

	new_synonym (a_name: like extended_name): like Current
			-- Synonym feature
		do
			create Result.make (a_name, declared_type, implementation_class)
			Result.set_assigner (assigner)
			Result.set_clients (clients)
			Result.set_is_keyword (is_keyword)
			Result.set_unique_keyword (unique_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_across_components (across_components)
			Result.set_constant (constant)
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
			Result.set_is_keyword (is_keyword)
			Result.set_unique_keyword (unique_keyword)
			Result.set_version (version)
			Result.set_frozen_keyword (frozen_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_object_tests (object_tests)
			Result.set_across_components (across_components)
			Result.set_constant (constant)
			Result.set_first_seed (first_seed)
			Result.set_other_seeds (other_seeds)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_unique_attribute (Current)
		end

invariant

	is_keyword_not_void: is_keyword /= Void
	unique_keyword_not_void: unique_keyword /= Void
	is_unique_attribute: arguments = Void
	constant_is_integer_32: constant.is_integer_32
	constant_positive: constant.to_integer_32 > 0

end
