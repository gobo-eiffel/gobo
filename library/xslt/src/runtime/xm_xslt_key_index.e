note

	description:

		"Objects that represent XSLT key indices"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_KEY_INDEX

create

	make, make_under_construction

feature {NONE} -- Initialization

	make (a_map: DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_NODE], XM_XPATH_ATOMIC_VALUE])
			-- Create a built index.
		require
			map_not_void: a_map /= Void
		do
			map := a_map
		ensure
			map_set: map = a_map
		end

	make_under_construction
			-- Create an index under construction.
		do
			is_under_construction := True
		end

feature -- Access

	map: detachable DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_NODE], XM_XPATH_ATOMIC_VALUE]
			-- Map of atomic-valued key-values to node lists

feature -- Status report

	has (a_key_value: XM_XPATH_ATOMIC_VALUE): BOOLEAN
			-- Is `a_key_value' present?
		require
			key_value_not_void: a_key_value /= Void
		do
			Result := attached map as l_map and then l_map.has (a_key_value)
		end

feature -- Status report

	is_under_construction: BOOLEAN
			-- Is this index under construction?
			-- (used to detatct circular key definitions)

invariant

	not_under_construction: not is_under_construction implies map /= Void

end

