indexing

	description:

		"Objects that cache compiled regular expressions and match results"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_REGEXP_CACHE

inherit

	XM_XPATH_REGEXP_CACHE_ROUTINES

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create regexp_cache.make_with_equality_testers (10, Void, string_equality_tester)
		end

feature -- Access

	has (a_composed_key: STRING): BOOLEAN is
			-- Is there a compiled regexp for `a_composed_key' in cache?
		require
			composed_key_not_void: a_composed_key /= Void
		do
			Result := regexp_cache.has (a_composed_key)
		end

	item (a_composed_key: STRING): XM_XPATH_REGEXP_CACHE_ENTRY is
			-- Possible cache entry for `a_composed_key'
		require
			composed_key_not_void: a_composed_key /= Void
		do
			if regexp_cache.has (a_composed_key) then
				Result := regexp_cache.item (a_composed_key)
			end
		ensure
			not_in_error_if_present: Result /= Void implies not Result.is_error
		end

feature -- Element change

	put (a_cache_entry: XM_XPATH_REGEXP_CACHE_ENTRY; a_composed_key: STRING) is
			-- Associate `a_cache_entry' with `a_composed_key'.
		require
			cache_entry_not_in_error: a_cache_entry /= Void and then not a_cache_entry.is_error
			composed_key_not_void: a_composed_key /= Void
			not_already_present_in_cache: not has (a_composed_key)
		do
			if regexp_cache.is_full then
				regexp_cache.resize (regexp_cache.count * 2)
			end
			regexp_cache.put (a_cache_entry, a_composed_key)
		ensure
			present_in_cache: has (a_composed_key)
			correct_entry: item (a_composed_key) = a_cache_entry
		end

feature {NONE} -- Implementation

	regexp_cache: DS_HASH_TABLE [XM_XPATH_REGEXP_CACHE_ENTRY, STRING]

invariant

	regexp_cache_not_void: regexp_cache /= Void

end
	
