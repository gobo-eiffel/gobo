note

	description:

		"Eiffel 'invariant' keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

class ET_INVARIANT_KEYWORD

inherit

	ET_KEYWORD
		rename
			make_invariant as make,
			text as name,
			is_local as is_local_keyword,
			is_precursor as is_precursor_keyword,
			is_alias as is_alias_keyword
		redefine
			process,
			is_equal
		end

	ET_FEATURE_NAME
		undefine
			first_position,
			last_position,
			is_equal,
			break
		end

create

	make

feature -- Access

	lower_name: STRING
			-- Lower-name of feature name
			-- (using UTF-8 encoding)
			-- (May return the same object as `name' if already in lower case.)
		do
			Result := tokens.invariant_keyword_name
		end

	hash_code: INTEGER
			-- Hash code
		do
			Result := code.code
		end

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN
			-- Are `Current' and `other' the same feature call name?
			-- (case insensitive)
		do
			Result := ANY_.same_types (Current, other)
		end

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		do
			Result := ANY_.same_types (Current, other)
		end

	is_equal (other: like Current): BOOLEAN
			-- Are current 'invariant' keyword and `other' considered equal?
		do
			Result := ANY_.same_types (Current, other)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_invariant_keyword (Current)
		end

end
