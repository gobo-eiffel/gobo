indexing

	description:

		"Eiffel identifiers"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_IDENTIFIER

inherit

	ET_WRITABLE
		undefine
			is_equal
		end

	ET_FEATURE_NAME
		redefine
			same_feature_name
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_position: like position) is
			-- Create a new identifier.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_position_not_void: a_position /= Void
		do
			name := a_name
			position := a_position
			hash_code := STRING_.case_insensitive_hash_code (a_name)
		ensure
			name_set: name = a_name
			position_set: position = a_position
		end

feature -- Access

	name: STRING
			-- Name of identifier

	hash_code: INTEGER
			-- Hash code value

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		local
			id: ET_IDENTIFIER
		do
			if other = Current then
				Result := True
			elseif same_type (other) then
				id ?= other
				Result := same_identifier (id)
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

invariant

	name_not_void: name /= Void
	name_not_empty: name.count > 0

end -- class ET_IDENTIFIER
