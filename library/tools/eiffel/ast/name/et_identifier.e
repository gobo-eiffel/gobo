indexing

	description:

		"Eiffel identifiers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_IDENTIFIER

inherit

	ET_FEATURE_NAME
		redefine
			is_local, is_argument,
			is_identifier, is_equal
		end

	ET_CLASS_NAME
		undefine
			is_identifier, is_equal
		end

	ET_LOCAL_NAME
		undefine
			is_equal
		end

	ET_ARGUMENT_NAME
		undefine
			is_equal
		end

	ET_TAG
		undefine
			is_equal
		end

	ET_WRITABLE
		undefine
			is_equal
		end

	ET_INDEXING_TERM
		undefine
			is_equal
		end

	ET_TOKEN
		rename
			text as name
		undefine
			is_equal
		redefine
			make
		end

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			is_equal
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name) is
			-- Create a new identifier.
		do
			hash_code := STRING_.case_insensitive_hash_code (a_name)
			precursor (a_name)
		end

feature -- Access

	hash_code: INTEGER
			-- Hash code value

	identifier: ET_IDENTIFIER is
			-- Identifier
		do
			Result := Current
		end

feature -- Status report

	is_identifier: BOOLEAN is True
			-- Is current feature name an identifier?

	is_local: BOOLEAN
			-- Is current identifier a local variable name?

	is_argument: BOOLEAN
			-- Is current identifier a formal argument name?

feature -- Status setting

	set_local (b: BOOLEAN) is
			-- Set `is_local' to `b'.
		do
			is_local := b
		ensure
			local_set: is_local = b
		end

	set_argument (b: BOOLEAN) is
			-- Set `is_argument' to `b'.
		do
			is_argument := b
		ensure
			argument_set: is_argument = b
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		local
			an_id: ET_IDENTIFIER
			l_name: STRING
		do
			if other = Current then
				Result := True
			else
				an_id ?= other
				if an_id /= Void then
					l_name := an_id.name
					if hash_code = an_id.hash_code then
						if l_name = name then
							Result := True
						else
							Result := STRING_.same_case_insensitive (name, l_name)
						end
					end
				end
			end
		end

	same_class_name (other: ET_CLASS_NAME): BOOLEAN is
			-- Are class name and `other' the same class name?
			-- (case insensitive)
		local
			an_id: ET_IDENTIFIER
			l_name: STRING
		do
			if other = Current then
				Result := True
			else
				an_id ?= other
				if an_id /= Void then
					l_name := an_id.name
					if hash_code = an_id.hash_code then
						if l_name = name then
							Result := True
						else
							Result := STRING_.same_case_insensitive (name, l_name)
						end
					end
				end
			end
		end

	same_identifier (other: ET_IDENTIFIER): BOOLEAN is
			-- Are current identifier and `other' the same identifier?
			-- (case insensitive)
		require
			other_not_void: other /= Void
		do
			if other = Current then
				Result := True
			elseif other.name = name then
				Result := True
			elseif hash_code = other.hash_code then
				Result := STRING_.same_case_insensitive (name, other.name)
			end
		end

	is_equal (other: like Current): BOOLEAN is
			-- Are current identifier and `other' considered equal?
		do
			if same_type (other) then
				Result := same_identifier (other)
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_identifier (Current)
		end

end
