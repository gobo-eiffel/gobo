indexing

	description:

		"XSLT key managers"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY_MANAGER

inherit

	UC_SHARED_STRING_EQUALITY_TESTER

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature {NONE} -- Implementation

	make is
			-- Establish invariant.
		do
			create key_map.make_map (5)
			create collation_map.make_with_equality_testers (5, string_equality_tester, Void)
		end

feature -- Access

	select_by_key (a_key_fingerprint: INTEGER; a_document: XM_XPATH_DOCUMENT; a_key_value: XM_XPATH_ATOMIC_VALUE; a_transformer: XM_XSLT_TRANSFORMER): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
		require
			-- TODO
		do
			todo ("select_by_key", False)
		ensure
		end

	collation_uri (a_key_fingerprint: INTEGER): STRING is
			-- Collation URI for the key defined by a_key_fingerprint'
		require
			key_defined: has_key (a_key_fingerprint)
		do
			Result := collation_map.item (a_key_fingerprint)
		ensure
			collation_uri_not_void: Result /= Void
		end

feature -- Status report

	has_key (a_key_fingerprint: INTEGER): BOOLEAN is
			-- Is there a key definition for `a_key_fingerprint'?
		do
			Result := key_map.has (a_key_fingerprint)
		end

	is_same_collation (a_key_definition: XM_XSLT_KEY_DEFINITION; a_key_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_key_definition' use the same collation as all keys defined to map to `a_key_fingerprint'?
		require
			key_definition_not_void: a_key_definition /= Void
		do
			if not key_map.has (a_key_fingerprint) then
				Result := True
			else
				Result := collation_map.has (a_key_fingerprint) and then STRING_.same_string (collation_uri (a_key_fingerprint), a_key_definition.collation_uri)
			end
		end

feature -- Element change

	add_key_definition (a_key_definition: XM_XSLT_KEY_DEFINITION; a_key_fingerprint: INTEGER) is
			-- Add a key definition.
		require
			key_definition_not_void: a_key_definition /= Void
			same_collation: is_same_collation (a_key_definition, a_key_fingerprint)
		local
			a_key_list: DS_ARRAYED_LIST [XM_XSLT_KEY_DEFINITION]
			a_collation_uri: STRING
		do
			if key_map.has (a_key_fingerprint) then
				a_key_list := key_map.item (a_key_fingerprint)
				check
					collation_map_entry: collation_map.has (a_key_fingerprint)
					-- as this routine ensures it
				end
			else
				create a_key_list.make (3)
				key_map.put (a_key_list, a_key_fingerprint)
				collation_map.put (a_key_definition.collation_uri, a_key_fingerprint)
			end
			if not a_key_list.extendible (1) then
				a_key_list.resize (2 * a_key_list.count)
			end
			a_key_list.put_last (a_key_definition)
		ensure
			has_key: has_key (a_key_fingerprint)
			key_definition_added: True -- TODO
		end

feature {NONE} -- Implementation

	key_map: DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XSLT_KEY_DEFINITION], INTEGER]
			-- Map of fingerprints to keys

	collation_map: DS_HASH_TABLE [STRING, INTEGER]
			-- Map of fingerprints to collation_names

invariant

	key_map: key_map /= Void

end
	
