note

	description:

		"External identifiers in DTD"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"

class XM_DTD_EXTERNAL_ID

inherit

	ANY
		undefine
			out
		end

	HASHABLE
		redefine
			out
		end

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			out
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new external ID.
		do
		end

feature -- Status report

	is_public: BOOLEAN
			-- Is public_id defined?
		do
			Result := public_id /= Void
		end

feature -- Access

	base: detachable STRING
			-- Base URI

	system_id: detachable STRING
			-- SYSTEM

	public_id: detachable STRING
			-- PUBLIC

	hash_code: INTEGER
			-- Hash code
		do
			if attached public_id as l_public_id then
				Result := l_public_id.hash_code // 3
			end
			if attached system_id as l_system_id then
				Result := Result + (l_system_id.hash_code // 3)
			end
		end

feature -- Setting

	set_base (a_base: like base)
			-- Set base URI.
		do
			base := a_base
		ensure
			base_set: base = a_base
		end

	set_system (a_system_id: like system_id)
			-- Set SYSTEM.
		do
			system_id := a_system_id
		ensure
			system_id_set: system_id = a_system_id
		end

	set_public (a_public_id: like public_id)
			-- Set PUBLIC.
		do
			public_id := a_public_id
		ensure
			public_id_set: public_id = a_public_id
		end

feature -- Output

	out: STRING
			-- Print as in input.
		do
			if attached public_id as l_public_id then
				Result := STRING_.cloned_string ("PUBLIC ")
				Result := STRING_.appended_string (Result, l_public_id)
				if attached system_id as l_system_id then
					Result.append_character (' ')
					Result := STRING_.appended_string (Result, l_system_id)
					Result.append_character (' ')
				end
			elseif attached system_id as l_system_id then
				Result := STRING_.cloned_string ("SYSTEM")
				Result.append_character (' ')
				Result := STRING_.appended_string (Result, l_system_id)
				Result.append_character (' ')
			else
				Result := ""
			end
		end

end
