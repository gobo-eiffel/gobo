indexing

	description:

		"Eiffel identifiers"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_IDENTIFIER

inherit

	ET_FEATURE_NAME
		redefine
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

	ET_TAG
		undefine
			is_equal
		end

	ET_WRITABLE
		undefine
			is_equal
		end

	ET_TOKEN
		rename
			text as name
		undefine
			is_equal
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal
		end

creation

	make, make_with_position

feature -- Access

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := STRING_.case_insensitive_hash_code (name)
		end

	identifier_item: ET_IDENTIFIER is
			-- Identifier
		do
			Result := Current
		end

feature -- Status report

	is_identifier: BOOLEAN is True
			-- Is current feature name an identifier?

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		local
			id: ET_IDENTIFIER
		do
			if other = Current then
				Result := True
			elseif other.is_identifier then
				id ?= other
				if id /= Void then
					Result := same_identifier (id)
				end
			end
		end

	same_class_name (other: ET_CLASS_NAME): BOOLEAN is
			-- Are class name and `other' the same class name?
			-- (case insensitive)
		local
			id: ET_IDENTIFIER
		do
			if other = Current then
				Result := True
			elseif other.is_identifier then
				id ?= other
				if id /= Void then
					Result := same_identifier (id)
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
			else
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

end -- class ET_IDENTIFIER
