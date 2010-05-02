note

	description:

		"Name pool entries"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAME_ENTRY

create

	make

feature {NONE} -- Initialization

	make (a_code: INTEGER; a_local_name: STRING)
			-- Establish invariant
		require
			positive_code: uri_code >= 0 and uri_code < 32000
			local_name_not_void: a_local_name /= Void
		do
			local_name := a_local_name
			uri_code := a_code
			next := Void
		ensure
			no_next_entry: next = Void
		end

feature -- Access

	local_name: STRING
			-- The local part of an XML name

	uri_code: INTEGER -- TODO - should be INTEGER_16 when all compilers support it
			-- A code representing the uri

	next: XM_XPATH_NAME_ENTRY
			-- Chain pointer to the next entry with the same hash code

feature -- Element change

	set_next (a_next_entry: XM_XPATH_NAME_ENTRY)
			-- Set the `next' field to `a_next_entry'
		do
			next := a_next_entry
		ensure
			next_set: next = a_next_entry
		end

invariant

	positive_uri_code: uri_code >= 0 -- and then uri_code < 32K ?? check this
	local_name_not_void: local_name /= Void

end

