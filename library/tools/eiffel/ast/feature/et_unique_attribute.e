indexing

	description:

		"Eiffel unique attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNIQUE_ATTRIBUTE

inherit

	ET_QUERY
		redefine
			is_unique_attribute,
			is_prefixable
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_name; a_type: like declared_type; a_class: like implementation_class) is
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
			implementation_class := a_class
			implementation_feature := Current
		ensure
			extended_name_set: extended_name = a_name
			declared_type_set: declared_type = a_type
			implementation_class_set: implementation_class = a_class
			implementation_feature_set: implementation_feature = Current
		end

feature -- Status report

	is_unique_attribute: BOOLEAN is True
			-- Is feature a unique attribute?

	is_prefixable: BOOLEAN is True
			-- Can current feature have a name of
			-- the form 'prefix ...'?

feature -- Access

	is_keyword: ET_AST_LEAF
			-- 'is' keyword or '=' symbol

	unique_keyword: ET_KEYWORD
			-- 'unique' keyword

	header_break: ET_BREAK is
			-- Break which appears where the header comment is expected
		local
			l_break: ET_BREAK
		do
			if semicolon /= Void then
				l_break := semicolon.break
				if l_break /= Void and then l_break.has_comment then
					Result := l_break
				end
			end
			if Result = Void then
				l_break := unique_keyword.break
				if l_break /= Void and then l_break.has_comment then
					Result := l_break
				end
			end
			if Result = Void then
				l_break := is_keyword.break
				if l_break /= Void and then l_break.has_comment then
					Result := l_break
				end
			end
			if Result = Void then
				Result := unique_keyword.break
			end
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if semicolon /= Void then
				Result := semicolon
			else
				Result := unique_keyword
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if semicolon /= Void then
				Result := semicolon.break
			else
				Result := unique_keyword.break
			end
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

	new_synonym (a_name: like extended_name): like Current is
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
			Result.set_synonym (Current)
		end

feature -- Conversion

	renamed_feature (a_name: like extended_name): like Current is
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
			Result.set_first_seed (first_seed)
			Result.set_other_seeds (other_seeds)
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
	is_unique_attribute: arguments = Void

end
