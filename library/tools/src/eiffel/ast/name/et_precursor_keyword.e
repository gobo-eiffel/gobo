note

	description:

		"Eiffel 'precursor' keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2019, Eric Bezault and others"
	license: "MIT License"

class ET_PRECURSOR_KEYWORD

inherit

	ET_KEYWORD
		rename
			make_precursor as make,
			text as name,
			is_local as is_local_keyword,
			is_alias as is_alias_keyword
		redefine
			process,
			is_equal
		end

	ET_CALL_NAME
		undefine
			first_position,
			last_position,
			is_equal,
			is_precursor,
			break
		redefine
			precursor_keyword
		end

create

	make

feature -- Access

	lower_name: STRING
			-- Lower-name of feature call
			-- (using UTF-8 encoding)
			-- (May return the same object as `name' if already in lower case.)
		do
			Result := tokens.precursor_keyword_name
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
			if Current = other then
				Result := True
			else
				Result := other.is_precursor
			end
		end

	is_equal (other: like Current): BOOLEAN
			-- Are current Precursor keyword and `other' considered equal?
		do
			Result := ANY_.same_types (Current, other)
		end

feature -- Conversion

	precursor_keyword: ET_PRECURSOR_KEYWORD
			-- Current feature name viewed as a 'precursor' keyword
		do
			Result := Current
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_precursor_keyword (Current)
		end

end
