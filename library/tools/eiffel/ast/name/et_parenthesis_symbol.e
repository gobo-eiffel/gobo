note

	description:

		"Eiffel '(' symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENTHESIS_SYMBOL

inherit

	ET_SYMBOL
		rename
			make_left_parenthesis as make
		redefine
			process
		end

	ET_FEATURE_NAME
		undefine
			first_position, last_position, is_equal
		redefine
			is_parenthesis
		end

create

	make

feature -- Access

	name: STRING
			-- Name of feature call
		do
			Result := tokens.alias_parenthesis_name
		end

	lower_name: STRING
			-- Lower-name of feature call
			-- (May return the same object as `name' if already in lower case.)
		do
			Result := name
		end

	hash_code: INTEGER
			-- Hash code
		do
			Result := tokens.alias_parenthesis_code.code
		end

feature -- Status report

	is_parenthesis: BOOLEAN = True
			-- Is current feature name of the form 'alias "()"'?

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN
			-- Are `Current' and `other' the same feature call name?
			-- (case insensitive)
		do
			if Current = other then
				Result := True
			else
				Result := other.is_parenthesis
			end
		end

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		do
			Result := ANY_.same_types (Current, other)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_parenthesis_symbol (Current)
		end

invariant

	is_parenthesis: is_parenthesis
	is_left_parenthesis: is_left_parenthesis

end
