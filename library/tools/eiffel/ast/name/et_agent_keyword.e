indexing

	description:

		"Eiffel 'agent' keywords"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AGENT_KEYWORD

inherit

	ET_KEYWORD
		rename
			make_agent as make,
			text as name,
			is_local as is_local_keyword,
			is_precursor as is_precursor_keyword,
			is_infix as is_infix_keyword,
			is_prefix as is_prefix_keyword,
			is_alias as is_alias_keyword
		redefine
			process, is_equal
		end

	ET_FEATURE_NAME
		undefine
			first_position, last_position, is_equal
		end

create

	make

feature -- Access

	lower_name: STRING is
			-- Lower-name of feature name
			-- (May return the same object as `name' if already in lower case.)
		do
			Result := tokens.agent_keyword_name
		end

	hash_code: INTEGER is
			-- Hash code
		do
			Result := code.code
		end

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN is
			-- Are `Current' and `other' the same feature call name?
			-- (case insensitive)
		do
			Result := ANY_.same_types (Current, other)
		end

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		do
			Result := ANY_.same_types (Current, other)
		end

	is_equal (other: like Current): BOOLEAN is
			-- Are current 'agent' keyword and `other' considered equal?
		do
			Result := ANY_.same_types (Current, other)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_agent_keyword (Current)
		end

end
