indexing

	description:

		"Namespace pool entry"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAME_ENTRY

creation

	make

feature -- Initialization

	make (code: INTEGER; local_n: STRING) is
			-- Establish invariant
		require
			positive_code: uri_code >= 0 and uri_code < 32000
			local_name_not_void: local_n /= Void and then local_n.count > 0
		do
			local_name := local_n
			uri_code := code
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

	set_next (next_entry: XM_XPATH_NAME_ENTRY) is
			-- Set the `next' field to `next_entry'
		do
			next := next_entry
		ensure
			next_set: next = next_entry
		end
	
invariant
	
	positive_uri_code: uri_code >= 0 -- and then uri_code < 32K ?? check this
	local_name_not_void: local_name /= Void and then local_name.count > 0
	
end
	
