indexing

	description:

		"Namespace pool"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAME_POOL

	-- A collection of XML names, each containing a Namespace URI,
	-- a Namespace prefix, and a local name
	-- plus a collection of namespaces, each consisting of a prefix/URI pair.
	
	-- The equivalence betweem names depends only on the URI and the local name.
	-- The prefix is retained for documentary purposes only; it is useful when
	-- reconstructing a document to use prefixes that the user is familiar with.

	-- The NamePool eliminates duplicate names if they have the same prefix, uri,
	-- and local part. It retains duplicates if they have different prefixes.

	-- The NamePool holds two kinds of entry: name entries, representing
	-- expanded names (local name + prefix + URI), identified by a name code,
	-- and namespace entries (prefix + URI) identified by a namespace code.
	--
	-- The data structure of the name table is as follows.
	--
	-- There is a fixed size hash table; names are allocated to slots in this
	-- table by hashing on the local name. Each entry in the table is the head of
	-- a chain of `XM_XPATH_NAME_ENTRY' objects representing names that have the same hash code.
	--
	-- Each `XM_XPATH_NAME_ENTRY' represents a distinct name (same URI and local name). It contains
	-- the local name as a string, plus an `INTEGER' (should be `INTEGER_16' when all compilers support this)
	--  representing the URI (as an offset into the array uris).
	--
	-- The fingerprint of a name consists of the hash slot number concatenated with
	-- the depth of the entry down the chain of hash synonyms.
	--
	-- A name_code contains the fingerprint in the bottom 20 bits. It also contains
	-- an 8-bit prefix index. This distinguishes the prefix used, among all the
	-- prefixes that have been used with this namespace URI. If the prefix index is
	-- zero, the prefix is null. Otherwise, it indexes an space-separated list of
	-- prefix Strings associated with the namespace URI.

inherit

	XM_XPATH_STANDARD_NAMESPACES

	KL_SHARED_EXCEPTIONS

	KL_SHARED_STANDARD_FILES

	KL_IMPORTED_STRING_ROUTINES

	UC_SHARED_STRING_EQUALITY_TESTER

creation
	make

feature -- Initialization

	make is
			-- Establish invariant
		do
			create document_number_map.make_map (10)
			create hash_slots.make (0, 1023)
			
			create prefixes.make (100)
			prefixes.set_equality_tester (string_equality_tester)

			create uris.make (100)
			uris.set_equality_tester (string_equality_tester)

			create prefixes_for_uri.make (100)
			prefixes_for_uri.set_equality_tester (string_equality_tester)

			prefixes.put ("", Null_prefix_index)
			uris.put (Null_uri, Null_prefix_index)
			prefixes_for_uri.put ("", Null_prefix_index)

			prefixes.put ("xml", Xml_prefix_index)
			uris.put (Xml_uri, Xml_prefix_index)
			prefixes_for_uri.put ("xml ", Xml_prefix_index)

			prefixes.put ("xsl", Xslt_prefix_index)
			uris.put (Xslt_uri, Xslt_prefix_index)			
			prefixes_for_uri.put ("xsl ", Xslt_prefix_index)
			
			prefixes_used := 3
			uris_used := 3
		end
	
feature -- Access

	bits_10: INTEGER is 1024 -- 2^10
			-- For extracting depth and hash code from name code

	bits_16: INTEGER is 65536 -- 2^16
			-- For extracting uri code and prefix code from namespace code

	bits_20: INTEGER is 1048576 -- 2^20
			-- For extracting prefix index from name code

	bits_28:INTEGER is 268435455 -- 2^28 -1
			-- Maximum limit of fingerprint value

	namespace_code (xml_prefix: STRING; uri: STRING): INTEGER is
			-- Return existing namespace code for a namespace prefix/URI pair
		require
			uri_allocated: uri /= Void
			prefix_allocated: xml_prefix /= Void
			code_allocated: is_namespace_code_allocated (xml_prefix, uri)
		local
			prefix_code, uri_code: INTEGER -- should be INTEGER_16
			key: STRING
		do
			debug ("XPath name pool")
				std.error.put_string ("namespace_code: prefix is ")
				std.error.put_string (xml_prefix)
				std.error.put_string (", uri is ")
				std.error.put_string (uri)
				std.error.put_new_line
			end
			prefix_code := code_for_prefix (xml_prefix)
			uri_code := code_for_uri (uri)

			debug ("XPath name pool")
				std.error.put_string ("namespace_code: code for prefix is ")
				std.error.put_string (prefix_code.out)
				std.error.put_string (", code for uri is ")
				std.error.put_string (uri_code.out)
				std.error.put_new_line
			end
			-- Result := (prefix_code |<< 16) + uri_code;
			-- N.B. prefix_code is always a positive 16-bit, so no overflow can occur
			Result := (prefix_code * bits_16) + uri_code
		ensure
			valid_result: Result >= 0
		end

	code_for_uri (uri: STRING): INTEGER is -- should be INTEGER_16
			-- Uri code for a given `uri';
		require
			uri_not_void: uri /= Void
			code_allocated: is_code_for_uri_allocated (uri)
		local
			counter: INTEGER
			found: BOOLEAN
		do
			debug ("XPath name pool")
				std.error.put_string ("code_for_uri: uri is ")
				std.error.put_string (uri)
				std.error.put_new_line
			end	
			from
				counter := 1
			variant
				uris_used - counter + 1
			until
				counter > uris_used or found = True
			loop
				if STRING_.same_string (uris.item (counter), uri) then
					Result := counter - 1
					found := True
				end
				counter := counter + 1
			end
				check
					code_found: found = True
					-- Because of pre-conditions
				end
		ensure
			valid_result: Result >= 0
		end

	code_for_prefix (xml_prefix: STRING): INTEGER is -- should be INTEGER_16
			-- Prefix code for a given `xml_prefix';
			-- -1 if not found
		require
			xml_prefix_not_void: xml_prefix /= Void
			code_allocated: is_code_for_prefix_allocated (xml_prefix)
		local
			counter: INTEGER
			found: BOOLEAN
		do
			debug ("XPath name pool")
				std.error.put_string ("code_for_prefix: prefix is ")
				std.error.put_string (xml_prefix)
				std.error.put_new_line
			end			
			from
				counter := 1
			variant
				prefixes_used - counter + 1
			until
				counter > prefixes_used or found = True
			loop
				debug ("XPath name pool")
					std.error.put_string ("code_for_prefix: current prefix is ")
					std.error.put_string (prefixes.item (counter))
					std.error.put_new_line
				end				
				if STRING_.same_string (prefixes.item (counter),xml_prefix) then
					Result := counter - 1
					found := True
				end
				counter := counter + 1
			end
			check
				prefix_found: found = True
				-- Because of pre-condition
			end
		ensure
			valid_result: Result >= 0
		end

	suggest_prefix_for_uri (uri: STRING): STRING is
			-- Suggest a prefix for a given `uri';
			-- If there are several, it's undefined which one is returned.;
			-- If there are no prefixes registered for this `uri', return `Void'
		require
			uri_not_void: uri /= Void
		local
			uri_code: INTEGER -- should be INTEGER_16
			index: INTEGER
			possible_prefixes: STRING
		do
			uri_code := code_for_uri (uri)
			if uri_code = -1 then
				Result := Void
			else
				possible_prefixes := prefixes_for_uri.item (uri_code + 1)
				index := possible_prefixes.index_of (' ', 1)
				if index = 0 then
					Result := Void
				else
						check
							not_just_a_blank: index > 1
						end
					Result := possible_prefixes.substring (1, index - 1)
				end
			end
		end

	prefix_with_index (uri_code: INTEGER; index: INTEGER): STRING is
			-- Get a prefix among all the prefixes used with a given URI, given its index
		require
			valid_code: uri_code >= 0 and uri_code <= 32000
			valid_index: index >= 0 and index < 255
		local
			the_prefixes, this_prefix: STRING
			counter, blank, last_blank, length_of_prefixes: INTEGER
			found: BOOLEAN
		do
			if index = 0 then
				Result := ""
			else
				debug ("XPath name pool")
					std.error.put_string ("prefix_with_index: searching for index ")
					std.error.put_string (index.out)
					std.error.put_new_line
				end
				from
					the_prefixes := prefixes_for_uri.item (uri_code + 1)
					counter := 1
					last_blank := 1
					length_of_prefixes := the_prefixes.count
				invariant
					Result /= Void implies found = True and counter = index + 1
				variant
					index - counter + 1
				until
					found = True
				loop
					blank := the_prefixes.index_of (' ', last_blank)
					if blank = 0 then
						found := True -- no more prefixes
							check
								void_result: Result = Void
							end
					else
						this_prefix := the_prefixes.substring (last_blank, blank - 1)
						debug ("XPath name pool")
							std.error.put_string ("prefix_with_index: found prefix ")
							std.error.put_string (this_prefix)
							std.error.put_string (" when searching on iteration ")
							std.error.put_string (counter.out)
							std.error.put_new_line
							std.error.put_string ("prefix_with_index: searching from position ")
							std.error.put_string (last_blank.out)
							std.error.put_string (" to position ")
							std.error.put_string ((blank - 1).out)
							std.error.put_new_line
						end	
						last_blank := blank + 1 -- position AFTER the last blank
						if last_blank > length_of_prefixes then found := True end
						if counter = index then
							found := True
							Result := this_prefix
						end
					end
					counter := counter + 1
				end
			end
			debug ("XPath name pool")
				if Result /= Void then
					std.error.put_string ("prefix_with_index: Found prefix ")
					std.error.put_string (Result)
					std.error.put_new_line
				else
					std.error.put_string ("prefix_with_index: prefix not found%N")
				end
			end
		end

	name_code (xml_prefix: STRING; uri: STRING; a_local_name: STRING): INTEGER is
			-- Name code for `xml_prefix' allocated to `{uri}a_local_name'
		require
			prefix_not_void: xml_prefix /= Void
			uri_not_void: uri /= Void
			a_local_name_not_void: a_local_name /= Void
			name_is_allocated: is_name_code_allocated (xml_prefix, uri, a_local_name)
		local
			the_prefix_index: INTEGER
		do
			the_prefix_index :=  prefix_index (code_for_uri (uri), xml_prefix)
			Result := (the_prefix_index * bits_20) + fingerprint (uri, a_local_name)
			debug ("XPath name pool")
				std.error.put_string ("Name_code: prefix index is ")
				std.error.put_string (the_prefix_index.out)
				std.error.put_string (", fingerprint is ")
				std.error.put_string (fingerprint (uri, a_local_name).out)
				std.error.put_string (", result is ")
				std.error.put_string (result.out)
				std.error.put_new_line
			end	
		end
	
	fingerprint (uri: STRING; a_local_name: STRING): INTEGER is
			-- Fingerprint for the name with a given uri and local name;
			-- The fingerprint has the property that if two fingerprint are the same,
			-- the names are the same (i.e. same local name and same URI);
			-- (A read-only version of allocate_name)
		require
			uri_not_void: uri /= Void
			a_local_name_not_void: a_local_name /= Void
		local
			hash_code, depth: INTEGER
			uri_code, counter: INTEGER -- should be INTEGER_16
			found, finished: BOOLEAN
			entry, next: XM_XPATH_NAME_ENTRY
		do
			from
				uri_code := -1
				counter := 1
			variant
				uris_used - counter + 1
			until
				counter > uris_used or found = True
			loop
				if STRING_.same_string (uris.item (counter), uri) then
					uri_code := counter - 1
					found := True
				end
				counter := counter + 1
			end
			if uri_code = -1 then
				Result := -1
			else
				hash_code := a_local_name.hash_code \\ 1024

				if hash_slots.item (hash_code) = Void then
					Result := -1
				else
					entry :=	hash_slots.item (hash_code)
					from
					variant
						1023 - depth
					until
						finished = True
					loop
						if STRING_.same_string (entry.local_name, a_local_name) and entry.uri_code = uri_code then
							finished := True
						else
							next := entry.next
							if next = Void then
								Result := -1
							else
								entry := next
							end
						end
						depth := depth + 1
					end
					Result := ((depth - 1) * bits_10) + hash_code
			debug ("XPath name pool")
				std.error.put_string ("Fingerprint: depth is ")
				std.error.put_string ((depth - 1).out)
				std.error.put_string (", hash_code is ")
				std.error.put_string (hash_code.out)
				std.error.put_string (", result is ")
				std.error.put_string (result.out)
				std.error.put_new_line
			end					
				end
			end
		ensure
			correct_range: Result > -2 and Result <= bits_16
		end

	fingerprint_from_expanded_name (expanded_name: STRING): INTEGER is
			-- Fingerprint for the name with a given uri and local name;
		require
			valid_expanded_name: expanded_name /= Void and then expanded_name.count > 0
		local
			a_local_name, namespace: STRING
			closing_brace: INTEGER
		do
			if expanded_name.item (1).is_equal ('{') then
				closing_brace := expanded_name.index_of ('}', 1)
				if closing_brace = 0 then Exceptions.raise ("No closing '}' in parameter name") end
				if closing_brace = expanded_name.count then Exceptions.raise ("Missing local part in parameter name") end
				namespace := expanded_name.substring (2, closing_brace - 1)
				a_local_name := expanded_name.substring (closing_brace + 1, expanded_name.count)
			else
				namespace := ""
				a_local_name := expanded_name
			end
			Result := fingerprint (namespace, a_local_name)
		ensure
			valid_name_code: Result > 0 and Result <= bits_28 -- 28 bits = 8-bit prefix-index + 20-bit fingerprint
		end

	document_number (doc: XM_XPATH_TINY_DOCUMENT): INTEGER is
			--	Document number associated with `doc'
		require
			document_not_void: doc /= Void
			document_is_allocated: is_document_allocated (doc)
		do
				Result := document_number_map.item (doc)
		end

	last_name_code: INTEGER
			-- The last name code allocated by `allocate_name_using_uri_code' or `allocate_name'

	last_uri_code: INTEGER -- should be INTEGER_16
			-- The last URI code allocated by `allocate_code_for_uri'

	last_prefix_code: INTEGER -- should be INTEGER_16
			-- The last prefix code allocated by `allocate_code_for_prefix'

	last_namespace_code: INTEGER
			-- The last namespace code allocated by `allocate_namespace_code'

feature -- Status report

	is_code_for_uri_allocated (uri: STRING): BOOLEAN is
			-- Has a code been allocated for `uri'?
		require
			uri_not_void: uri /= Void
		local
			counter: INTEGER
		do
			from
				counter := 1
			variant
				uris_used - counter + 1
			until
				counter > uris_used or Result = True
			loop
				if STRING_.same_string (uris.item (counter), uri) then
					Result := True
				end
				counter := counter + 1
			end
		end

	is_code_for_prefix_allocated (xml_prefix: STRING): BOOLEAN is
			-- Has a code been allocated for `xml_prefix'?
		require
			prefix_not_void: xml_prefix /= Void
		local
			counter: INTEGER
			do
			from
				counter := 1
			variant
				prefixes_used - counter + 1
			until
				counter > prefixes_used or Result = True
			loop
				debug ("XPath name pool")
					std.error.put_string ("code_for_prefix: current prefix is ")
					std.error.put_string (prefixes.item (counter))
					std.error.put_new_line
				end				
				if STRING_.same_string (prefixes.item (counter), xml_prefix) then
					Result := True
				end
				counter := counter + 1
			end
		end

	is_namespace_code_allocated (xml_prefix: STRING; uri: STRING): BOOLEAN is
			-- Has a namespace code been allocated for `xml_prefix' with `uri'?
		require
			prefix_not_void: xml_prefix /= Void
			uri_not_void: uri /= Void
		local
			uri_code: INTEGER -- should be INTEGER_16
		do
			if is_code_for_prefix_allocated (xml_prefix) = False then Result := False
			elseif is_code_for_uri_allocated (uri) = False then Result := False
			else
				uri_code := code_for_uri (uri)
				if prefix_index (uri_code, xml_prefix) > -1 then Result := True end
			end
		end

	is_name_code_allocated (xml_prefix: STRING; uri: STRING; a_local_name: STRING): BOOLEAN is
			-- Has a name code been allocated for `xml_prefix' with `uri' and `a_local_name'?
		require
			prefix_not_void: xml_prefix /= Void
			uri_not_void: uri /= Void
			a_local_name_not_void: a_local_name /= Void
		local
			uri_code: INTEGER -- should be INTEGER_16			
		do
			if is_code_for_uri_allocated (uri) = False then Result := False
			else
				uri_code := code_for_uri (uri)
				Result := is_name_code_allocated_using_uri_code (xml_prefix, uri_code, a_local_name)
			end
		end

	is_name_code_allocated_using_uri_code (xml_prefix: STRING; uri_code: INTEGER; a_local_name: STRING): BOOLEAN is
			-- Has a name code been allocated for `xml_prefix' with `uri_code' and `a_local_name'?
		require
			prefix_not_void: xml_prefix /= Void
			a_local_name_not_void: a_local_name /= Void
		local
			hash_code, depth, the_prefix_index: INTEGER
			the_name_entry, next: XM_XPATH_NAME_ENTRY
			finished: BOOLEAN
		do
			if uris.count < uri_code + 1 then Result := False
			elseif is_code_for_prefix_allocated (xml_prefix) = False then Result := False
			else
				the_prefix_index := prefix_index(uri_code, xml_prefix)
				if the_prefix_index = -1 then Result := False
				else
					depth := 0
					hash_code := a_local_name.hash_code \\ 1024
					the_name_entry := hash_slots.item (hash_code)
					if the_name_entry = Void then
						Result := False
					else
						from
						variant
							1023 - depth
						until
							finished = True
						loop
							debug ("XPath name pool")
								std.error.put_string ("is_name_code_allocated_using_uri_code: current depth is ")
								std.error.put_string (depth.out)
								std.error.put_new_line
							end
							if STRING_.same_string (the_name_entry.local_name, a_local_name) and the_name_entry.uri_code = uri_code then
								finished := True
								Result := True
								depth := depth + 1
							else
								next := the_name_entry.next
								depth := depth + 1
								if depth > 1023 or next = Void then
									finished := True
								else
									the_name_entry := next
								end
							end
						end
					end
				end
			end
		end

	is_document_allocated (doc: XM_XPATH_TINY_DOCUMENT): BOOLEAN is
			--	Is a document number associated with `doc'
		require
			document_not_void: doc /= Void
		do
			Result := document_number_map.has (doc)
		end

	diagnostic_dump is
			-- Diagnostic print of the namepool contents
		local
			hash_code, depth, prefix_count, uri_count: INTEGER
			entry, next: XM_XPATH_NAME_ENTRY
		do
			std.error.put_string ("Contents of NamePool ")
			std.error.put_string (out)
			std.error.put_new_line
			from
				hash_code := 0
			variant
				1024 - hash_code
			until
				hash_code = 1024
			loop
				entry := hash_slots.item (hash_code)
				depth := 0
				from
				variant
					1023 - depth
				until
					entry = Void
				loop
					std.error.put_string ("Fingerprint ")
					std.error.put_string (depth.out)
					std.error.put_string ("/")
					std.error.put_string (hash_code.out)
					std.error.put_new_line
					std.error.put_string ("  local name = ")
					std.error.put_string (entry.local_name)
					std.error.put_string (" uri code = ")
					std.error.put_string (entry.uri_code.out)
					std.error.put_new_line

					entry := entry.next
					depth := depth + 1
				end
				hash_code := hash_code + 1
			end
			from
				prefix_count := 1
			variant
				prefixes_used - prefix_count + 1
			until
				prefix_count > prefixes_used
			loop
				std.error.put_string ("Prefix ")
				std.error.put_string (prefix_count.out)
				std.error.put_string (" = ")
				std.error.put_string (prefixes.item (prefix_count))
				std.error.put_new_line

				prefix_count := prefix_count + 1
			end
			from
				uri_count := 1
			variant
				uris_used - uri_count + 1
			until
				uri_count > uris_used
			loop
				std.error.put_string ("URI ")
				std.error.put_string (uri_count.out)
				std.error.put_string (" = ")
				std.error.put_string (uris.item (uri_count))
				std.error.put_new_line
				std.error.put_string ("Prefixes for URI ")
				std.error.put_string (uri_count.out)
				std.error.put_string (" = ")
				std.error.put_string (prefixes_for_uri.item (uri_count))
				std.error.put_new_line

				uri_count := uri_count + 1
			end
		end
	
feature -- Element change

	allocate_document_number (doc: XM_XPATH_TINY_DOCUMENT) is
			--	Add a document to the pool, and allocate a document number;
			-- WARNING - this code is not thread safe
		require
			document_not_void: doc /= Void
			document_not_allocated: not is_document_allocated (doc)
		do
			document_number_map.put (document_number_map.count + 1, doc)
		ensure
			document_allocated: is_document_allocated (doc)
		end

	allocate_namespace_code (xml_prefix: STRING; uri: STRING) is
			--	Allocate the namespace code for a namespace prefix/URI pair;
			-- WARNING - this code is not thread safe
		require
			prefix_not_void: xml_prefix /= Void
			uri_not_void: uri /= Void
			namespace_code_not_allocated: not is_namespace_code_allocated (xml_prefix, uri)
		local
			prefix_code, uri_code: INTEGER -- should be INTEGER_16
			key, key2: STRING
		do
			debug ("XPath name pool")
				std.error.put_string ("allocate_namespace_code: prefix is ")
				std.error.put_string (xml_prefix)
				std.error.put_string (", uri is ")
				std.error.put_string (uri)
				std.error.put_new_line
			end
			if is_code_for_uri_allocated (uri) then
				uri_code := code_for_uri (uri)
			else
				allocate_code_for_uri (uri)
				uri_code := last_uri_code
			end


			if is_code_for_prefix_allocated (xml_prefix) then
				prefix_code := code_for_prefix (xml_prefix)
			else
				allocate_code_for_prefix (xml_prefix)
				prefix_code := last_prefix_code
			end

			-- Ensure the prefix is in the list of prefixes used with this URI

			key2 := prefixes_for_uri.item (uri_code + 1)
			key := clone (xml_prefix)
			key := STRING_.appended_string (key, " ")
			key := STRING_.appended_string (key, key2)
			prefixes_for_uri.replace (key, uri_code + 1)

			debug ("XPath name pool")
				std.error.put_string ("allocate_namespace_code: code for prefix is ")
				std.error.put_string (prefix_code.out)
				std.error.put_string (", code for uri is ")
				std.error.put_string (uri_code.out)
				std.error.put_new_line
			end
			--	last_namespace_code := (prefix_code |<< 16 ) + uri_code;
			-- N.B. prefix_code is always a positive 16-bit number, so no overflow can occur
			last_namespace_code := (prefix_code * bits_16 ) + uri_code
		ensure
			namespace_code_allocated: is_namespace_code_allocated (xml_prefix, uri)
		end

	allocate_code_for_uri (uri: STRING) is
			-- Allocate the uri code for a given URI;
			-- WARNING - this code is not thread safe
		require
			uri_not_void: uri /= Void
			code_not_allocated: not is_code_for_uri_allocated (uri)
		do
			if uris_used >= 32000 then
				Exceptions.raise ("Too many namespace URIs")
			end
			if uris.capacity = uris_used then
				uris.resize (2 * uris_used)
				prefixes_for_uri.resize (2 * uris_used)
			end
			last_uri_code := uris_used
			uris.put (uri, uris_used + 1)
			prefixes_for_uri.put ("", uris_used + 1)
			uris_used := uris_used + 1
		ensure
			code_allocated: is_code_for_uri_allocated (uri)
		end

	allocate_code_for_prefix (xml_prefix: STRING) is
			-- Allocate the uri code for a given `xml_prefix';
			-- WARNING - this code is not thread safe
		require
			prefix_not_void: xml_prefix /= Void
			code_not_allocated: not is_code_for_prefix_allocated (xml_prefix)
		local
			counter: INTEGER
			found: BOOLEAN
		do
			if prefixes_used >= 32000 then
				Exceptions.raise ("Too many namespace prefixes")
			end
			if prefixes.capacity = prefixes_used then prefixes.resize (2 * prefixes_used) end
			debug ("XPath name pool")
				std.error.put_string ("allocate_code_for_prefix: Adding prefix ")
				std.error.put_string (xml_prefix)
				std.error.put_new_line
			end
			last_prefix_code := prefixes_used
			prefixes.put (xml_prefix, prefixes_used + 1)
			prefixes_used := prefixes_used + 1
		ensure
			code_allocated: is_code_for_prefix_allocated (xml_prefix)
		end

	allocate_name (xml_prefix: STRING; uri: STRING; a_local_name: STRING) is
			-- Allocate a new name
		require
			prefix_not_void: xml_prefix /= Void
			uri_not_void: uri /= Void
			a_local_name_not_void: a_local_name /= Void
			name_not_allocated: not is_name_code_allocated (xml_prefix, uri, a_local_name)
		local
			uri_code: INTEGER -- should be INTEGER_16
		do
			if is_code_for_uri_allocated (uri) then
				uri_code := code_for_uri (uri)
				else
					allocate_code_for_uri (uri)
					uri_code := last_uri_code
			end
				check
					valid_uri_code:  uri_code >= 0 and uri_code <= 32000
				end
			allocate_name_using_uri_code (xml_prefix, uri_code, a_local_name)
		ensure
			name_allocated: is_name_code_allocated (xml_prefix, uri, a_local_name)			
		end

	allocate_name_using_uri_code (xml_prefix: STRING; uri_code: INTEGER; a_local_name: STRING) is
			-- Allocate a name from the pool, or a new Name if there is not a matching one there
		require
			prefix_not_void: xml_prefix /= Void
			valid_uri_code:  uri_code >= 0 and uri_code <= 32000
			a_local_name_not_void: a_local_name /= Void
			name_not_allocated: not is_name_code_allocated_using_uri_code (xml_prefix, uri_code, a_local_name)			
		local
			hash_code, depth, the_prefix_index: INTEGER
			prefix_code: INTEGER -- should be INTEGER_16
			key, key2: STRING
			the_name_entry, next, new_entry: XM_XPATH_NAME_ENTRY
			finished: BOOLEAN
		do
			depth := 0
			hash_code := a_local_name.hash_code \\ 1024
				check
					valid_hash_code: hash_code >= 0 and hash_code < 1024
				end
			debug ("XPath name pool")
				std.error.put_string ("allocate_name_using_name_code: uri_code is ")
				std.error.put_string (uri_code.out)
				std.error.put_new_line
			end
			the_prefix_index := prefix_index (uri_code, xml_prefix)
				check
					valid_prefix_index: the_prefix_index > -2 and the_prefix_index < 255
				end
			if the_prefix_index < 0 then
				debug ("XPath name pool")
					std.error.put_string ("allocate_name_using_name_code: Allocating an index for prefix ")
					std.error.put_string (xml_prefix)
					std.error.put_new_line
				end
				allocate_code_for_prefix (xml_prefix)

				key2 := prefixes_for_uri.item (uri_code + 1)
				key := clone (xml_prefix)
				key := STRING_.appended_string (key, " ")
				key := STRING_.appended_string (key, key2)
				prefixes_for_uri.replace (key, uri_code + 1)

				the_prefix_index := prefix_index (uri_code, xml_prefix)
					check
						valid_prefix_index2: the_prefix_index > 0 and the_prefix_index < 255
					end
				debug ("XPath name pool")
					std.error.put_string ("allocate_name_using_name_code: New prefix index is ")
					std.error.put_string (the_prefix_index.out)
					std.error.put_new_line				
				end
			end
			if hash_slots.item (hash_code) = Void then
				create the_name_entry.make (uri_code, a_local_name)
				hash_slots.put (the_name_entry, hash_code)
			else
				the_name_entry := hash_slots.item (hash_code)
				from
				variant
					1023 - depth
				until
					finished = True
				loop
					if STRING_.same_string (the_name_entry.local_name, a_local_name) and the_name_entry.uri_code = uri_code then
						finished := True
					else
						next := the_name_entry.next
						depth := depth + 1
						if depth > 1023 then
							Exceptions.raise ("The XPath name pool is full")
						end
						if next = Void then
							create new_entry.make (uri_code, a_local_name)
							the_name_entry.set_next (new_entry)
							finished := True
						else
							the_name_entry := next
						end
					end
				end
			end
			last_name_code := (the_prefix_index * bits_20) + (depth * bits_10) + hash_code
			debug ("XPath name pool")
				std.error.put_string ("Allocate_name: prefix index is ")
				std.error.put_string (the_prefix_index.out)
				std.error.put_string (", depth is ")
				std.error.put_string (depth.out)
				std.error.put_string (", hash_code is ")
				std.error.put_string (hash_code.out)
				std.error.put_string (", equivalent fingerprint is ")
				std.error.put_string (((depth * bits_10) + hash_code).out)
				std.error.put_string (", result is ")
				std.error.put_string (last_name_code.out)
				std.error.put_new_line
			end	
		ensure
			name_allocated: is_name_code_allocated_using_uri_code (xml_prefix, uri_code, a_local_name)
		end

feature -- Conversion

	namespace_uri_from_name_code (a_name_code: INTEGER): STRING is
			-- Namespace-URI of a name, given its name code or fingerprint
		require
			positive_name_code: a_name_code >= 0
		local
			entry: XM_XPATH_NAME_ENTRY
		do
			entry := name_entry (a_name_code)
			if entry = Void then
				unknown_name_code (a_name_code) -- Exceptions.raises an exception
			else
				Result := uris.item (entry.uri_code + 1)
			end
		ensure
			result_not_void: Result /= Void
		end

	uri_code_from_name_code (a_name_code: INTEGER): INTEGER is -- should be INTEGER_16
			-- URI code of a name, given its name code or fingerprint
	require
			positive_name_code: a_name_code >= 0
		local
			entry: XM_XPATH_NAME_ENTRY
		do
			entry := name_entry (a_name_code)
			if entry = Void then
				unknown_name_code (a_name_code) -- Exceptions.raises an exception
			else
				Result := entry.uri_code
			end	
		end

	local_name_from_name_code (a_name_code: INTEGER): STRING is
			-- Local part of a name, given its name code or fingerprint
		require
			positive_name_code: a_name_code >= 0
		local
			entry: XM_XPATH_NAME_ENTRY
		do
			entry := name_entry (a_name_code)
			if entry = Void then
				unknown_name_code (a_name_code) -- Exceptions.raises an exception
			else
				Result := entry.local_name
			end
		ensure
			result_not_void: Result /= Void
		end		

	prefix_from_name_code (a_name_code: INTEGER): STRING is
			-- Local part of a name, given its name code or fingerprint
		require
			positive_name_code: a_name_code >= 0
		local
			uri_code: INTEGER -- should be INTEGER_16
			the_prefix_index: INTEGER
		do
			uri_code := uri_code_from_name_code (a_name_code)
			the_prefix_index := name_code_to_prefix_index (a_name_code)
			debug ("XPath name pool")
					std.error.put_string ("prefix_from_name_code: Calculated prefix index is ")
					std.error.put_string (the_prefix_index.out)
					std.error.put_new_line
			end
			Result := prefix_with_index (uri_code, the_prefix_index)
		ensure
			result_may_be_void: True
		end

	display_name_from_name_code (a_name_code: INTEGER): STRING is
			-- Display form of a name (the QName), given its name code or fingerprint
		require
			positive_name_code: a_name_code >= 0
		local
			entry: XM_XPATH_NAME_ENTRY
			the_prefix_index: INTEGER
		do
			entry := name_entry (a_name_code)
			if entry = Void then
				unknown_name_code (a_name_code) -- Exceptions.raises an exception
			else
				the_prefix_index := name_code_to_prefix_index (a_name_code)
				if the_prefix_index = 0 then
					Result := entry.local_name
				else
					Result := prefix_with_index (entry.uri_code, the_prefix_index)
					Result := STRING_.appended_string (Result, ":")
					Result := STRING_.appended_string (Result, entry.local_name)
				end
			end	
		ensure
			result_not_void: Result /= Void
		end

	uri_from_namespace_code (a_namespace_code: INTEGER): STRING is
			-- Namespace URI from `namespace_code'
		local
			uri_code, top_bits: INTEGER -- should be INTEGER_16
		do
			-- Result := uris.item ((a_namespace_code & 0xffff) + 1);
			-- N.B. namespace codes consist of two positive 16-bit numbers,
			--      so overflow does not arise
			top_bits := (a_namespace_code // bits_16) * bits_16
			uri_code := a_namespace_code - top_bits
			debug ("XPath name pool")
				std.error.put_string ("uri_from_namespace_code: uri_code is ")
				std.error.put_string (uri_code.out)
				std.error.put_string (":")
				std.error.put_new_line
			end
			Result := uris.item (uri_code + 1)
		end
		
	uri_from_uri_code (uri_code: INTEGER): STRING is
			-- Namespace URI from `uri_code'
		require
			valid_code: uri_code >= 0 and uri_code <= 32000
		do
			Result := uris.item (uri_code + 1)
		end

	prefix_from_namespace_code (a_namespace_code: INTEGER): STRING is
			-- Namespace prefix from `namespace_code'
		do
			-- Result := prefixes.item ((a_namespace_code |>> 16) + 1)
			-- N.B. namespace codes consist of two positive 16-bit numbers,
			--      so overflow does not arise
			Result := prefixes.item ((a_namespace_code // bits_16) + 1)
		end
		

feature {NONE} -- Implementation

	name_entry (a_name_code: INTEGER): XM_XPATH_NAME_ENTRY is
			-- Name entry corresponding to `a_name_code'
		require
			positive_name_code: a_name_code >= 0
		local
			hash_code, depth, counter: INTEGER
			found: BOOLEAN
			entry: XM_XPATH_NAME_ENTRY
		do
			depth := name_code_to_depth (a_name_code)
			hash_code := name_code_to_hash_code (a_name_code)
			entry := hash_slots.item (hash_code)
			from
				counter := 0
			variant
				depth - counter + 1
			until
				counter = depth or found = True
			loop
				if entry = Void then
					found := True
				else
					entry := entry.next
					counter := counter + 1
				end
			end
			debug ("XPath name pool")
				std.error.put_string ("Name_entry: name code is ")
				std.error.put_string (a_name_code.out)
				std.error.put_string (",depth is ")
				std.error.put_string (depth.out)
				std.error.put_string (",counter is ")
				std.error.put_string (counter.out)
std.error.put_new_line
			end
			Result := entry
		end

	prefix_index (uri_code: INTEGER; xml_prefix: STRING): INTEGER is
			-- Index of a prefix among all the prefixes used with a given URI
		require
			prefix_not_void: xml_prefix /= Void
			valid_uri_code:  uri_code >= 0 and uri_code <= 32000
		local
			the_prefixes, this_prefix: STRING
			count, counter, blank, last_blank: INTEGER
			found: BOOLEAN
		do
			debug ("XPath name pool")
				std.error.put_string ("prefix_index: prefix is ")
				std.error.put_string (xml_prefix)
				std.error.put_string (":")
				std.error.put_new_line
			end
			-- look for quick wins
			if xml_prefix.is_empty then
				debug ("XPath name pool")
					std.error.put_string ("prefix_index: xml - code 0%N")
				end
				Result := 0
			else
				debug ("XPath name pool")
					std.error.put_string ("prefix_index: uri_code is ")
					std.error.put_string (uri_code.out)
					std.error.put_new_line
				end
				the_prefixes := prefixes_for_uri.item (uri_code + 1)
				debug ("XPath name pool")
					std.error.put_string ("prefix_index: available prefixes are ")
					std.error.put_string (the_prefixes)
					std.error.put_new_line
				end				
				count := the_prefixes.count
				if count = xml_prefix.count + 1 and then the_prefixes.item (count).is_equal (' ') and then STRING_.same_string (the_prefixes.substring (1, count - 1), xml_prefix) then -- sole prefix
					debug ("XPath name pool")
						std.error.put_string ("prefix_index: sole prefix - code 1%N")
					end
					Result := 1
				else
					debug ("XPath name pool")
						std.error.put_string ("prefix_index: searching...%N")
					end
					from
						counter := 1
						Result := -1 -- Not found
						last_blank := 1
					variant
						255 - counter
					until
						found = True
					loop
						debug ("XPath name pool")
							std.error.put_string ("prefix_index: iteration%N")
						end
						blank := the_prefixes.index_of (' ', last_blank)
						if blank = 0 then
							debug ("XPath name pool")
								std.error.put_string ("prefix_index: prefix not found%N")
							end
							Result := -1
							found := True
							counter := counter + 1
						else
							this_prefix := the_prefixes.substring (last_blank, blank - 1)
							debug ("XPath name pool")
								std.error.put_string ("prefix_index: Looking at prefix ")
								std.error.put_string (this_prefix)
								std.error.put_string (" from positon ")
								std.error.put_string (last_blank.out)
								std.error.put_string (" to positon ")
								std.error.put_string ((blank - 1).out)
								std.error.put_new_line
							end
							if STRING_.same_string (this_prefix, xml_prefix) then
								debug ("XPath name pool")
									std.error.put_string ("prefix_index: prefix found%N")
								end
								Result := counter
								found := True
								counter := counter + 1
							else
								counter := counter + 1
							end
						end
						if not found and counter = 255 then
							Exceptions.raise ("Too many prefixes for one namespace URI")
						end
						last_blank := blank + 1 -- position AFTER the last blank
					end
				end
			end
		ensure
			valid_result: Result > -2 and Result < 255
		end

	name_code_to_prefix_index (a_name_code: INTEGER): INTEGER is
			-- Extract the prefix index from `a_name_code'
		do
				check
					name_code_is_positive: a_name_code > 0
					-- because it only occupoes 28 bits
				end
			-- (a_name_code |>> 20) & 0x000000ff
			Result := (a_name_code // bits_20)
		ensure
			valid_prefix_index: Result >= 0 and Result < 255
		end

	name_code_to_depth (a_name_code: INTEGER): INTEGER is
			-- Extract the depth from `a_name_code'
		local
			scaled_prefix_index: INTEGER
		do
			--	(a_name_code |>> 10) & 0x000003ff
			scaled_prefix_index := name_code_to_prefix_index (a_name_code) * bits_20

			Result := (a_name_code - scaled_prefix_index) // bits_10
		ensure
			positive_result: Result >= 0 and Result < 1024
		end

	name_code_to_hash_code (a_name_code: INTEGER): INTEGER is
			-- Extract the depth from `a_name_code'
		local
			scaled_prefix_index, depth: INTEGER
		do
			-- hash_code := a_name_code & 0x000003ff
			scaled_prefix_index := name_code_to_prefix_index (a_name_code) * bits_20
			depth := (a_name_code - scaled_prefix_index) // bits_10
			
			Result := (a_name_code - scaled_prefix_index - (depth * bits_10))
		ensure
			positive_result: Result >= 0 and Result < 1024
		end

	unknown_name_code (a_name_code: INTEGER) is
		-- Exceptions.Raise an exception
		require
			always_valid: True
		local
			result_string: STRING
		do
			create result_string.make_from_string ("Unknown name code ")
			result_string.append_string (a_name_code.out)
			Exceptions.raise (result_string)
		ensure
			impossible: False
		end
	
	document_number_map: DS_HASH_TABLE [INTEGER, XM_XPATH_TINY_DOCUMENT] -- TODO - ought to be DS_WEAK_HASH_TABLE, if/when one exists
			-- Maps documents to document numbers
	
	hash_slots: ARRAY [XM_XPATH_NAME_ENTRY]
			-- Fixed size hash table
	
	prefixes: DS_ARRAYED_LIST [STRING]
			-- The XML prefixes in use
	
	prefixes_used: INTEGER
			-- Highest number XML prefix in use

	uris: DS_ARRAYED_LIST [STRING]
			-- The URIs in use
	
	prefixes_for_uri: DS_ARRAYED_LIST [STRING]
			-- The XML prefixes in use for a given URI
	
	uris_used: INTEGER
			-- Highest number uri in use
	
invariant

	document_map_not_void: document_number_map /= Void
	fixed_hash_slots: hash_slots /= Void and then hash_slots.count = 1024
	prefixes_not_void: prefixes /= Void
	prefixes_used: prefixes_used >= 3
	uris_not_void: uris /= Void
	prefixes_for_uri_not_void: prefixes_for_uri /= Void
	uris_used: uris_used >= 3
	
end

	
