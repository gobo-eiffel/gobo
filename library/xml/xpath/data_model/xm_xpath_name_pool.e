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

feature {NONE} -- Initialization

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

	namespace_code (an_xml_prefix: STRING; a_uri: STRING): INTEGER is
			-- Return existing namespace code for a namespace prefix/URI pair
		require
			uri_allocated: a_uri /= Void
			prefix_allocated: an_xml_prefix /= Void
			code_allocated: is_namespace_code_allocated (an_xml_prefix, a_uri)
		local
			a_prefix_code, a_uri_code: INTEGER -- should be INTEGER_16
			a_key: STRING
		do
			debug ("XPath name pool")
				std.error.put_string ("namespace_code: prefix is ")
				std.error.put_string (an_xml_prefix)
				std.error.put_string (", uri is ")
				std.error.put_string (a_uri)
				std.error.put_new_line
			end
			a_prefix_code := code_for_prefix (an_xml_prefix)
			a_uri_code := code_for_uri (a_uri)

			debug ("XPath name pool")
				std.error.put_string ("namespace_code: code for prefix is ")
				std.error.put_string (a_prefix_code.out)
				std.error.put_string (", code for uri is ")
				std.error.put_string (a_uri_code.out)
				std.error.put_new_line
			end
			-- Result := (a_prefix_code |<< 16) + uri_code;
			-- N.B. a_prefix_code is always a positive 16-bit, so no overflow can occur
			Result := (a_prefix_code * bits_16) + a_uri_code
		ensure
			valid_result: Result >= 0
		end

	code_for_uri (a_uri: STRING): INTEGER is -- should be INTEGER_16
			-- Uri code for a given `uri';
		require
			uri_not_void: a_uri /= Void
			code_allocated: is_code_for_uri_allocated (a_uri)
		local
			a_counter: INTEGER
			found: BOOLEAN
		do
			debug ("XPath name pool")
				std.error.put_string ("code_for_uri: uri is ")
				std.error.put_string (a_uri)
				std.error.put_new_line
			end	
			from
				a_counter := 1
			variant
				uris_used - a_counter + 1
			until
				a_counter > uris_used or found = True
			loop
				if STRING_.same_string (uris.item (a_counter), a_uri) then
					Result := a_counter - 1
					found := True
				end
				a_counter := a_counter + 1
			end
				check
					code_found: found = True
					-- Because of pre-conditions
				end
		ensure
			valid_result: Result >= 0
		end

	code_for_prefix (an_xml_prefix: STRING): INTEGER is -- should be INTEGER_16
			-- Prefix code for a given `an_xml_prefix';
			-- -1 if not found
		require
			an_xml_prefix_not_void: an_xml_prefix /= Void
			code_allocated: is_code_for_prefix_allocated (an_xml_prefix)
		local
			a_counter: INTEGER
			found: BOOLEAN
		do
			debug ("XPath name pool")
				std.error.put_string ("code_for_prefix: prefix is ")
				std.error.put_string (an_xml_prefix)
				std.error.put_new_line
			end			
			from
				a_counter := 1
			variant
				prefixes_used - a_counter + 1
			until
				a_counter > prefixes_used or found = True
			loop
				debug ("XPath name pool")
					std.error.put_string ("code_for_prefix: current prefix is ")
					std.error.put_string (prefixes.item (a_counter))
					std.error.put_new_line
				end				
				if STRING_.same_string (prefixes.item (a_counter),an_xml_prefix) then
					Result := a_counter - 1
					found := True
				end
				a_counter := a_counter + 1
			end
			check
				prefix_found: found = True
				-- Because of pre-condition
			end
		ensure
			valid_result: Result >= 0
		end

	suggest_prefix_for_uri (a_uri: STRING): STRING is
			-- Suggest a prefix for a given `uri';
			-- If there are several, it's undefined which one is returned.;
			-- If there are no prefixes registered for this `uri', return `Void'
		require
			uri_not_void: a_uri /= Void
		local
			a_uri_code: INTEGER -- should be INTEGER_16
			an_index: INTEGER
			possible_prefixes: STRING
		do
			a_uri_code := code_for_uri (a_uri)
			if a_uri_code = -1 then
				Result := Void
			else
				possible_prefixes := prefixes_for_uri.item (a_uri_code + 1)
				an_index := possible_prefixes.index_of (' ', 1)
				if an_index = 0 then
					Result := Void
				else
						check
							not_just_a_blank: an_index > 1
						end
					Result := possible_prefixes.substring (1, an_index - 1)
				end
			end
		end

	prefix_with_index (a_uri_code: INTEGER; an_index: INTEGER): STRING is
			-- Get a prefix among all the prefixes used with a given URI, given its index
		require
			valid_code: a_uri_code >= 0 and a_uri_code <= 32000
			valid_index: an_index >= 0 and an_index < 255
		local
			the_prefixes, this_prefix: STRING
			a_counter, a_blank, last_blank, length_of_prefixes: INTEGER
			found: BOOLEAN
		do
			if an_index = 0 then
				Result := ""
			else
				debug ("XPath name pool")
					std.error.put_string ("prefix_with_index: searching for index ")
					std.error.put_string (an_index.out)
					std.error.put_new_line
				end
				from
					the_prefixes := prefixes_for_uri.item (a_uri_code + 1)
					a_counter := 1
					last_blank := 1
					length_of_prefixes := the_prefixes.count
				invariant
					Result /= Void implies found = True and a_counter = an_index + 1
				variant
					an_index - a_counter + 1
				until
					found = True
				loop
					a_blank := the_prefixes.index_of (' ', last_blank)
					if a_blank = 0 then
						found := True -- no more prefixes
							check
								void_result: Result = Void
							end
					else
						this_prefix := the_prefixes.substring (last_blank, a_blank - 1)
						debug ("XPath name pool")
							std.error.put_string ("prefix_with_index: found prefix ")
							std.error.put_string (this_prefix)
							std.error.put_string (" when searching on iteration ")
							std.error.put_string (a_counter.out)
							std.error.put_new_line
							std.error.put_string ("prefix_with_index: searching from position ")
							std.error.put_string (last_blank.out)
							std.error.put_string (" to position ")
							std.error.put_string ((a_blank - 1).out)
							std.error.put_new_line
						end	
						last_blank := a_blank + 1 -- position AFTER the last blank
						if last_blank > length_of_prefixes then found := True end
						if a_counter = an_index then
							found := True
							Result := this_prefix
						end
					end
					a_counter := a_counter + 1
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

	name_code (an_xml_prefix: STRING; a_uri: STRING; a_local_name: STRING): INTEGER is
			-- Name code for `an_xml_prefix' allocated to `{a_uri}a_local_name'
		require
			prefix_not_void: an_xml_prefix /= Void
			uri_not_void: a_uri /= Void
			a_local_name_not_void: a_local_name /= Void
			name_is_allocated: is_name_code_allocated (an_xml_prefix, a_uri, a_local_name)
		local
			a_prefix_index: INTEGER
		do
			a_prefix_index :=  prefix_index (code_for_uri (a_uri), an_xml_prefix)
			Result := (a_prefix_index * bits_20) + fingerprint (a_uri, a_local_name)
			debug ("XPath name pool")
				std.error.put_string ("Name_code: prefix index is ")
				std.error.put_string (a_prefix_index.out)
				std.error.put_string (", fingerprint is ")
				std.error.put_string (fingerprint (a_uri, a_local_name).out)
				std.error.put_string (", result is ")
				std.error.put_string (result.out)
				std.error.put_new_line
			end	
		end
	
	fingerprint (a_uri: STRING; a_local_name: STRING): INTEGER is
			-- Fingerprint for the name with a given uri and local name;
			-- The fingerprint has the property that if two fingerprint are the same,
			-- the names are the same (i.e. same local name and same URI);
			-- (A read-only version of allocate_name)
		require
			uri_not_void: a_uri /= Void
			a_local_name_not_void: a_local_name /= Void
		local
			a_hash_code, a_depth: INTEGER
			a_uri_code, a_counter: INTEGER -- should be INTEGER_16
			found, finished: BOOLEAN
			an_entry, next_entry: XM_XPATH_NAME_ENTRY
		do
			from
				a_uri_code := -1
				a_counter := 1
			variant
				uris_used - a_counter + 1
			until
				a_counter > uris_used or found = True
			loop
				if STRING_.same_string (uris.item (a_counter), a_uri) then
					a_uri_code := a_counter - 1
					found := True
				end
				a_counter := a_counter + 1
			end
			if a_uri_code = -1 then
				Result := -1
			else
				a_hash_code := a_local_name.hash_code \\ 1024

				if hash_slots.item (a_hash_code) = Void then
					Result := -1
				else
					an_entry :=	hash_slots.item (a_hash_code)
					from
					variant
						1023 - a_depth
					until
						finished = True
					loop
						if STRING_.same_string (an_entry.local_name, a_local_name) and an_entry.uri_code = a_uri_code then
							finished := True
						else
							next_entry := an_entry.next
							if next_entry = Void then
								Result := -1
							else
								an_entry := next_entry
							end
						end
						a_depth := a_depth + 1
					end
					Result := ((a_depth - 1) * bits_10) + a_hash_code
				end
			end
			debug ("XPath name pool allocation")
				std.error.put_string ("fingerprint: searching for uri ")
				std.error.put_string (a_uri)
				std.error.put_string (", local-name: ")
				std.error.put_string (a_local_name)
				std.error.put_new_line
				std.error.put_string (" result is: ")
				std.error.put_string (Result.out)
				std.error.put_new_line
			end
		ensure
			correct_range: Result > -2 and Result <= bits_16
		end

	fingerprint_from_expanded_name (an_expanded_name: STRING): INTEGER is
			-- Fingerprint for the name with a given uri and local name;
		require
			valid_expanded_name: an_expanded_name /= Void and then an_expanded_name.count > 0
		local
			a_local_name, a_namespace: STRING
			a_closing_brace: INTEGER
		do
			if an_expanded_name.item (1).is_equal ('{') then
				a_closing_brace := an_expanded_name.index_of ('}', 1)
				if a_closing_brace = 0 then Exceptions.raise ("No closing '}' in parameter name") end
				if a_closing_brace = an_expanded_name.count then Exceptions.raise ("Missing local part in parameter name") end
				a_namespace := an_expanded_name.substring (2, a_closing_brace - 1)
				a_local_name := an_expanded_name.substring (a_closing_brace + 1, an_expanded_name.count)
			else
				a_namespace := ""
				a_local_name := an_expanded_name
			end
			Result := fingerprint (a_namespace, a_local_name)
		ensure
			valid_name_code: Result > 0 and Result <= bits_28 -- 28 bits = 8-bit prefix-index + 20-bit fingerprint
		end

	document_number (a_doc: XM_XPATH_TINY_DOCUMENT): INTEGER is
			--	Document number associated with `a_doc'
		require
			document_not_void: a_doc /= Void
			document_is_allocated: is_document_allocated (a_doc)
		do
				Result := document_number_map.item (a_doc)
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

	is_code_for_uri_allocated (a_uri: STRING): BOOLEAN is
			-- Has a code been allocated for `a_uri'?
		require
			uri_not_void: a_uri /= Void
		local
			a_counter: INTEGER
		do
			debug ("XPath name pool allocation")
				std.error.put_string ("is_code_for_uri_allocated: searching for ")
				std.error.put_string (a_uri)
				std.error.put_new_line
			end	
			from
				a_counter := 1
			variant
				uris_used - a_counter + 1
			until
				a_counter > uris_used or Result = True
			loop
				debug ("XPath name pool allocation")
					std.error.put_string ("looking at ")
					std.error.put_string (uris.item (a_counter))
					std.error.put_new_line
				end	
				if STRING_.same_string (uris.item (a_counter), a_uri) then
					Result := True
				end
				a_counter := a_counter + 1
			end
			debug ("XPath name pool allocation")
				std.error.put_string ("Found uri? ")
				std.error.put_string (Result.out)
				std.error.put_new_line
			end	
		end

	is_code_for_prefix_allocated (an_xml_prefix: STRING): BOOLEAN is
			-- Has a code been allocated for `an_xml_prefix'?
		require
			prefix_not_void: an_xml_prefix /= Void
		local
			a_counter: INTEGER
			do
			from
				a_counter := 1
			variant
				prefixes_used - a_counter + 1
			until
				a_counter > prefixes_used or Result = True
			loop
				debug ("XPath name pool")
					std.error.put_string ("code_for_prefix: current prefix is ")
					std.error.put_string (prefixes.item (a_counter))
					std.error.put_new_line
				end				
				if STRING_.same_string (prefixes.item (a_counter), an_xml_prefix) then
					Result := True
				end
				a_counter := a_counter + 1
			end
		end

	is_namespace_code_allocated (an_xml_prefix: STRING; a_uri: STRING): BOOLEAN is
			-- Has a namespace code been allocated for `an_xml_prefix' with `a_uri'?
		require
			prefix_not_void: an_xml_prefix /= Void
			uri_not_void: a_uri /= Void
		local
			a_uri_code: INTEGER -- should be INTEGER_16
		do
			if is_code_for_prefix_allocated (an_xml_prefix) = False then Result := False
			elseif is_code_for_uri_allocated (a_uri) = False then Result := False
			else
				a_uri_code := code_for_uri (a_uri)
				if prefix_index (a_uri_code, an_xml_prefix) > -1 then Result := True end
			end
		end

	is_name_code_allocated (an_xml_prefix: STRING; a_uri: STRING; a_local_name: STRING): BOOLEAN is
			-- Has a name code been allocated for `an_xml_prefix' with `a_uri' and `a_local_name'?
		require
			prefix_not_void: an_xml_prefix /= Void
			uri_not_void: a_uri /= Void
			a_local_name_not_void: a_local_name /= Void
		local
			a_uri_code: INTEGER -- should be INTEGER_16			
		do
			if is_code_for_uri_allocated (a_uri) = False then Result := False
			else
				a_uri_code := code_for_uri (a_uri)
				Result := is_name_code_allocated_using_uri_code (an_xml_prefix, a_uri_code, a_local_name)
			end
		end

	is_name_code_allocated_using_uri_code (an_xml_prefix: STRING; a_uri_code: INTEGER; a_local_name: STRING): BOOLEAN is
			-- Has a name code been allocated for `an_xml_prefix' with `a_uri_code' and `a_local_name'?
		require
			prefix_not_void: an_xml_prefix /= Void
			a_local_name_not_void: a_local_name /= Void
		local
			a_hash_code, a_depth, a_prefix_index: INTEGER
			a_name_entry, next_entry: XM_XPATH_NAME_ENTRY
			finished: BOOLEAN
		do
			debug ("XPath name pool allocation")
				std.error.put_string ("is_name_code_allocated_using_uricode: searching for prefix ")
				std.error.put_string (an_xml_prefix)
				std.error.put_string (", local-name ")
				std.error.put_string (a_local_name)
				std.error.put_string (" and uri code ")
				std.error.put_string (a_uri_code.out)
				std.error.put_new_line
			end	
			if uris.count < a_uri_code + 1 then Result := False
			elseif is_code_for_prefix_allocated (an_xml_prefix) = False then Result := False
			else
				a_prefix_index := prefix_index(a_uri_code, an_xml_prefix)
				if a_prefix_index = -1 then Result := False
				else
					a_depth := 0
					a_hash_code := a_local_name.hash_code \\ 1024
					a_name_entry := hash_slots.item (a_hash_code)
					if a_name_entry = Void then
						Result := False
					else
						from
						variant
							1023 - a_depth
						until
							finished = True
						loop
							debug ("XPath name pool")
								std.error.put_string ("is_name_code_allocated_using_uri_code: current depth is ")
								std.error.put_string (a_depth.out)
								std.error.put_new_line
							end
							if STRING_.same_string (a_name_entry.local_name, a_local_name) and a_name_entry.uri_code = a_uri_code then
								finished := True
								Result := True
								a_depth := a_depth + 1
							else
								next_entry := a_name_entry.next
								a_depth := a_depth + 1
								if a_depth > 1023 or next_entry = Void then
									finished := True
								else
									a_name_entry := next_entry
								end
							end
						end
					end
				end
			end
			debug ("XPath name pool allocation")
				std.error.put_string ("is_name_code_allocated_using_uricode: result is ")
				std.error.put_string (Result.out)
				std.error.put_new_line
			end				
		end

	is_document_allocated (a_doc: XM_XPATH_TINY_DOCUMENT): BOOLEAN is
			--	Is a document number associated with `a_doc'
		require
			document_not_void: a_doc /= Void
		do
			Result := document_number_map.has (a_doc)
		end

	diagnostic_dump is
			-- Diagnostic print of the namepool contents
		local
			a_hash_code, a_depth, prefix_count, a_uri_count: INTEGER
			an_entry: XM_XPATH_NAME_ENTRY
		do
			std.error.put_string ("Contents of NamePool ")
			std.error.put_string (out)
			std.error.put_new_line
			from
				a_hash_code := 0
			variant
				1024 - a_hash_code
			until
				a_hash_code = 1024
			loop
				an_entry := hash_slots.item (a_hash_code)
				a_depth := 0
				from
				variant
					1023 - a_depth
				until
					an_entry = Void
				loop
					std.error.put_string ("Fingerprint ")
					std.error.put_string (a_depth.out)
					std.error.put_string ("/")
					std.error.put_string (a_hash_code.out)
					std.error.put_new_line
					std.error.put_string ("  local name = ")
					std.error.put_string (an_entry.local_name)
					std.error.put_string (" uri code = ")
					std.error.put_string (an_entry.uri_code.out)
					std.error.put_new_line

					an_entry := an_entry.next
					a_depth := a_depth + 1
				end
				a_hash_code := a_hash_code + 1
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
				a_uri_count := 1
			variant
				uris_used - a_uri_count + 1
			until
				a_uri_count > uris_used
			loop
				std.error.put_string ("URI ")
				std.error.put_string (a_uri_count.out)
				std.error.put_string (" = ")
				std.error.put_string (uris.item (a_uri_count))
				std.error.put_new_line
				std.error.put_string ("Prefixes for URI ")
				std.error.put_string (a_uri_count.out)
				std.error.put_string (" = ")
				std.error.put_string (prefixes_for_uri.item (a_uri_count))
				std.error.put_new_line

				a_uri_count := a_uri_count + 1
			end
		end
	
feature -- Element change

	allocate_document_number (a_doc: XM_XPATH_TINY_DOCUMENT) is
			--	Add a document to the pool, and allocate a document number;
			-- WARNING - this code is not thread safe
		require
			document_not_void: a_doc /= Void
			document_not_allocated: not is_document_allocated (a_doc)
		do
			document_number_map.put (document_number_map.count + 1, a_doc)
		ensure
			document_allocated: is_document_allocated (a_doc)
		end

	allocate_namespace_code (an_xml_prefix: STRING; a_uri: STRING) is
			--	Allocate the namespace code for a namespace prefix/URI pair;
			-- WARNING - this code is not thread safe
		require
			prefix_not_void: an_xml_prefix /= Void
			uri_not_void: a_uri /= Void
			namespace_code_not_allocated: not is_namespace_code_allocated (an_xml_prefix, a_uri)
		local
			a_prefix_code, a_uri_code: INTEGER -- should be INTEGER_16
			a_key, a_key2: STRING
		do
			debug ("XPath name pool")
				std.error.put_string ("allocate_namespace_code: prefix is ")
				std.error.put_string (an_xml_prefix)
				std.error.put_string (", uri is ")
				std.error.put_string (a_uri)
				std.error.put_new_line
			end
			if is_code_for_uri_allocated (a_uri) then
				a_uri_code := code_for_uri (a_uri)
			else
				allocate_code_for_uri (a_uri)
				a_uri_code := last_uri_code
			end


			if is_code_for_prefix_allocated (an_xml_prefix) then
				a_prefix_code := code_for_prefix (an_xml_prefix)
			else
				allocate_code_for_prefix (an_xml_prefix)
				a_prefix_code := last_prefix_code
			end

			-- Ensure the prefix is in the list of prefixes used with this URI

			a_key2 := prefixes_for_uri.item (a_uri_code + 1)
			a_key := clone (an_xml_prefix)
			a_key := STRING_.appended_string (a_key, " ")
			a_key := STRING_.appended_string (a_key, a_key2)
			prefixes_for_uri.replace (a_key, a_uri_code + 1)

			debug ("XPath name pool")
				std.error.put_string ("allocate_namespace_code: code for prefix is ")
				std.error.put_string (a_prefix_code.out)
				std.error.put_string (", code for uri is ")
				std.error.put_string (a_uri_code.out)
				std.error.put_new_line
			end
			--	last_namespace_code := (a_prefix_code |<< 16 ) + uri_code;
			-- N.B. a_prefix_code is always a positive 16-bit number, so no overflow can occur
			last_namespace_code := (a_prefix_code * bits_16 ) + a_uri_code
		ensure
			namespace_code_allocated: is_namespace_code_allocated (an_xml_prefix, a_uri)
		end

	allocate_code_for_uri (a_uri: STRING) is
			-- Allocate the uri code for a given URI;
			-- WARNING - this code is not thread safe
		require
			uri_not_void: a_uri /= Void
			code_not_allocated: not is_code_for_uri_allocated (a_uri)
		do
			if uris_used >= 32000 then
				Exceptions.raise ("Too many namespace URIs")
			end
			if uris.capacity = uris_used then
				uris.resize (2 * uris_used)
				prefixes_for_uri.resize (2 * uris_used)
			end
			last_uri_code := uris_used
			uris.put (a_uri, uris_used + 1)
			prefixes_for_uri.put ("", uris_used + 1)
			uris_used := uris_used + 1
		ensure
			code_allocated: is_code_for_uri_allocated (a_uri)
		end

	allocate_code_for_prefix (an_xml_prefix: STRING) is
			-- Allocate the uri code for a given `an_xml_prefix';
			-- WARNING - this code is not thread safe
		require
			prefix_not_void: an_xml_prefix /= Void
			code_not_allocated: not is_code_for_prefix_allocated (an_xml_prefix)
		local
			a_counter: INTEGER
			found: BOOLEAN
		do
			if prefixes_used >= 32000 then
				Exceptions.raise ("Too many namespace prefixes")
			end
			if prefixes.capacity = prefixes_used then prefixes.resize (2 * prefixes_used) end
			debug ("XPath name pool")
				std.error.put_string ("allocate_code_for_prefix: Adding prefix ")
				std.error.put_string (an_xml_prefix)
				std.error.put_new_line
			end
			last_prefix_code := prefixes_used
			prefixes.put (an_xml_prefix, prefixes_used + 1)
			prefixes_used := prefixes_used + 1
		ensure
			code_allocated: is_code_for_prefix_allocated (an_xml_prefix)
		end

	allocate_name (an_xml_prefix: STRING; a_uri: STRING; a_local_name: STRING) is
			-- Allocate a new name
		require
			prefix_not_void: an_xml_prefix /= Void
			uri_not_void: a_uri /= Void
			a_local_name_not_void: a_local_name /= Void
			name_not_allocated: not is_name_code_allocated (an_xml_prefix, a_uri, a_local_name)
		local
			a_uri_code: INTEGER -- should be INTEGER_16
		do
			if is_code_for_uri_allocated (a_uri) then
				a_uri_code := code_for_uri (a_uri)
				else
					allocate_code_for_uri (a_uri)
					a_uri_code := last_uri_code
			end
				check
					valid_uri_code:  a_uri_code >= 0 and a_uri_code <= 32000
				end
			allocate_name_using_uri_code (an_xml_prefix, a_uri_code, a_local_name)
			debug ("XPath name pool allocation")
				std.error.put_string ("allocate name: prefix is: ")
				std.error.put_string (an_xml_prefix)
				std.error.put_string (", uri: ")
				std.error.put_string (a_uri)
				std.error.put_string (", local-name: ")
				std.error.put_string (a_local_name)				
				std.error.put_new_line
				std.error.put_string (" name code is: ")
				std.error.put_string (last_name_code.out)				
				std.error.put_new_line				
			end
		ensure
			name_allocated: is_name_code_allocated (an_xml_prefix, a_uri, a_local_name)			
		end

	allocate_name_using_uri_code (an_xml_prefix: STRING; a_uri_code: INTEGER; a_local_name: STRING) is
			-- Allocate a name from the pool, or a new Name if there is not a matching one there
		require
			prefix_not_void: an_xml_prefix /= Void
			valid_uri_code:  a_uri_code >= 0 and a_uri_code <= 32000
			a_local_name_not_void: a_local_name /= Void
			name_not_allocated: not is_name_code_allocated_using_uri_code (an_xml_prefix, a_uri_code, a_local_name)			
		local
			a_hash_code, a_depth, a_prefix_index: INTEGER
			a_key, a_key2: STRING
			a_name_entry, next_entry, new_entry: XM_XPATH_NAME_ENTRY
			finished: BOOLEAN
		do
			a_depth := 0
			a_hash_code := a_local_name.hash_code \\ 1024
				check
					valid_hash_code: a_hash_code >= 0 and a_hash_code < 1024
				end
			debug ("XPath name pool")
				std.error.put_string ("allocate_name_using_name_code: uri_code is ")
				std.error.put_string (a_uri_code.out)
				std.error.put_new_line
			end
			a_prefix_index := prefix_index (a_uri_code, an_xml_prefix)
				check
					valid_prefix_index: a_prefix_index > -2 and a_prefix_index < 255
				end
			if a_prefix_index < 0 then
				debug ("XPath name pool")
					std.error.put_string ("allocate_name_using_name_code: Allocating an index for prefix ")
					std.error.put_string (an_xml_prefix)
					std.error.put_new_line
				end
				allocate_code_for_prefix (an_xml_prefix)

				a_key2 := prefixes_for_uri.item (a_uri_code + 1)
				a_key := clone (an_xml_prefix)
				a_key := STRING_.appended_string (a_key, " ")
				a_key := STRING_.appended_string (a_key, a_key2)
				prefixes_for_uri.replace (a_key, a_uri_code + 1)

				a_prefix_index := prefix_index (a_uri_code, an_xml_prefix)
					check
						valid_prefix_index2: a_prefix_index > 0 and a_prefix_index < 255
					end
				debug ("XPath name pool")
					std.error.put_string ("allocate_name_using_name_code: New prefix index is ")
					std.error.put_string (a_prefix_index.out)
					std.error.put_new_line				
				end
			end
			if hash_slots.item (a_hash_code) = Void then
				create a_name_entry.make (a_uri_code, a_local_name)
				hash_slots.put (a_name_entry, a_hash_code)
			else
				a_name_entry := hash_slots.item (a_hash_code)
				from
				variant
					1023 - a_depth
				until
					finished = True
				loop
					if STRING_.same_string (a_name_entry.local_name, a_local_name) and a_name_entry.uri_code = a_uri_code then
						finished := True
					else
						next_entry := a_name_entry.next
						a_depth := a_depth + 1
						if a_depth > 1023 then
							Exceptions.raise ("The XPath name pool is full")
						end
						if next_entry = Void then
							create new_entry.make (a_uri_code, a_local_name)
							a_name_entry.set_next (new_entry)
							finished := True
						else
							a_name_entry := next_entry
						end
					end
				end
			end
			last_name_code := (a_prefix_index * bits_20) + (a_depth * bits_10) + a_hash_code
			debug ("XPath name pool allocation")
				std.error.put_string ("Allocate_name: prefix index is ")
				std.error.put_string (a_prefix_index.out)
				std.error.put_string (", local-name is ")
				std.error.put_string (a_local_name)
				std.error.put_string (", uri code is ")
				std.error.put_string (a_uri_code.out)
				std.error.put_string (", depth is ")
				std.error.put_string (a_depth.out)
				std.error.put_string (", hash_code is ")
				std.error.put_string (a_hash_code.out)
				std.error.put_string (", equivalent fingerprint is ")
				std.error.put_string (((a_depth * bits_10) + a_hash_code).out)
				std.error.put_new_line
			end	
		ensure
			name_allocated: is_name_code_allocated_using_uri_code (an_xml_prefix, a_uri_code, a_local_name)
		end

feature -- Conversion

	namespace_uri_from_name_code (a_name_code: INTEGER): STRING is
			-- Namespace-URI of a name, given its name code or fingerprint
		require
			positive_name_code: a_name_code >= 0
		local
			an_entry: XM_XPATH_NAME_ENTRY
		do
			an_entry := name_entry (a_name_code)
			if an_entry = Void then
				unknown_name_code (a_name_code) -- Exceptions.raises an exception
			else
				Result := uris.item (an_entry.uri_code + 1)
			end
		ensure
			result_not_void: Result /= Void
		end

	uri_code_from_name_code (a_name_code: INTEGER): INTEGER is -- should be INTEGER_16
			-- URI code of a name, given its name code or fingerprint
	require
			positive_name_code: a_name_code >= 0
		local
			an_entry: XM_XPATH_NAME_ENTRY
		do
			an_entry := name_entry (a_name_code)
			if an_entry = Void then
				unknown_name_code (a_name_code) -- Exceptions.raises an exception
			else
				Result := an_entry.uri_code
			end	
		end

	local_name_from_name_code (a_name_code: INTEGER): STRING is
			-- Local part of a name, given its name code or fingerprint
		require
			positive_name_code: a_name_code >= 0
		local
			an_entry: XM_XPATH_NAME_ENTRY
		do
			an_entry := name_entry (a_name_code)
			if an_entry = Void then
				unknown_name_code (a_name_code) -- Exceptions.raises an exception
			else
				Result := an_entry.local_name
			end
		ensure
			result_not_void: Result /= Void
		end		

	prefix_from_name_code (a_name_code: INTEGER): STRING is
			-- Local part of a name, given its name code or fingerprint
		require
			positive_name_code: a_name_code >= 0
		local
			a_uri_code: INTEGER -- should be INTEGER_16
			a_prefix_index: INTEGER
		do
			a_uri_code := uri_code_from_name_code (a_name_code)
			a_prefix_index := name_code_to_prefix_index (a_name_code)
			debug ("XPath name pool")
					std.error.put_string ("prefix_from_name_code: Calculated prefix index is ")
					std.error.put_string (a_prefix_index.out)
					std.error.put_new_line
			end
			Result := prefix_with_index (a_uri_code, a_prefix_index)
		ensure
			result_may_be_void: True
		end

	display_name_from_name_code (a_name_code: INTEGER): STRING is
			-- Display form of a name (the QName), given its name code or fingerprint
		require
			positive_name_code: a_name_code >= 0
		local
			an_entry: XM_XPATH_NAME_ENTRY
			a_prefix_index: INTEGER
		do
			an_entry := name_entry (a_name_code)
			if an_entry = Void then
				unknown_name_code (a_name_code) -- Exceptions.raises an exception
			else
				a_prefix_index := name_code_to_prefix_index (a_name_code)
				if a_prefix_index = 0 then
					Result := an_entry.local_name
				else
					Result := prefix_with_index (an_entry.uri_code, a_prefix_index)
					Result := STRING_.appended_string (Result, ":")
					Result := STRING_.appended_string (Result, an_entry.local_name)
				end
			end	
		ensure
			result_not_void: Result /= Void
		end

	uri_from_namespace_code (a_namespace_code: INTEGER): STRING is
			-- Namespace URI from `a_namespace_code'
		local
			a_uri_code, top_bits: INTEGER -- should be INTEGER_16
		do
			-- Result := uris.item ((a_namespace_code & 0xffff) + 1);
			-- N.B. namespace codes consist of two positive 16-bit numbers,
			--      so overflow does not arise
			top_bits := (a_namespace_code // bits_16) * bits_16
			a_uri_code := a_namespace_code - top_bits
			debug ("XPath name pool")
				std.error.put_string ("uri_from_namespace_code: uri_code is ")
				std.error.put_string (a_uri_code.out)
				std.error.put_string (":")
				std.error.put_new_line
			end
			Result := uris.item (a_uri_code + 1)
		end
		
	uri_from_uri_code (a_uri_code: INTEGER): STRING is
			-- Namespace URI from `a_uri_code'
		require
			valid_code: a_uri_code >= 0 and a_uri_code <= 32000
		do
			Result := uris.item (a_uri_code + 1)
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
			a_hash_code, a_depth, a_counter: INTEGER
			found: BOOLEAN
			an_entry: XM_XPATH_NAME_ENTRY
		do
			a_depth := name_code_to_depth (a_name_code)
			a_hash_code := name_code_to_hash_code (a_name_code)
			an_entry := hash_slots.item (a_hash_code)
			from
				a_counter := 0
			variant
				a_depth - a_counter + 1
			until
				a_counter = a_depth or found = True
			loop
				if an_entry = Void then
					found := True
				else
					an_entry := an_entry.next
					a_counter := a_counter + 1
				end
			end
			debug ("XPath name pool")
				std.error.put_string ("Name_entry: name code is ")
				std.error.put_string (a_name_code.out)
				std.error.put_string (",depth is ")
				std.error.put_string (a_depth.out)
				std.error.put_string (",a_counter is ")
				std.error.put_string (a_counter.out)
std.error.put_new_line
			end
			Result := an_entry
		end

	prefix_index (a_uri_code: INTEGER; an_xml_prefix: STRING): INTEGER is
			-- Index of a prefix among all the prefixes used with a given URI
		require
			prefix_not_void: an_xml_prefix /= Void
			valid_uri_code:  a_uri_code >= 0 and a_uri_code <= 32000
		local
			the_prefixes, this_prefix: STRING
			a_prefix_count, a_counter, a_blank, last_blank: INTEGER
			found: BOOLEAN
		do
			debug ("XPath name pool")
				std.error.put_string ("prefix_index: prefix is ")
				std.error.put_string (an_xml_prefix)
				std.error.put_string (":")
				std.error.put_new_line
			end
			-- look for quick wins
			if an_xml_prefix.is_empty then
				debug ("XPath name pool")
					std.error.put_string ("prefix_index: xml - code 0%N")
				end
				Result := 0
			else
				debug ("XPath name pool")
					std.error.put_string ("prefix_index: uri_code is ")
					std.error.put_string (a_uri_code.out)
					std.error.put_new_line
				end
				the_prefixes := prefixes_for_uri.item (a_uri_code + 1)
				debug ("XPath name pool")
					std.error.put_string ("prefix_index: available prefixes are ")
					std.error.put_string (the_prefixes)
					std.error.put_new_line
				end				
				a_prefix_count := the_prefixes.count
				if a_prefix_count = an_xml_prefix.count + 1 and then the_prefixes.item (a_prefix_count).is_equal (' ') and then STRING_.same_string (the_prefixes.substring (1, a_prefix_count - 1), an_xml_prefix) then -- sole prefix
					debug ("XPath name pool")
						std.error.put_string ("prefix_index: sole prefix - code 1%N")
					end
					Result := 1
				else
					debug ("XPath name pool")
						std.error.put_string ("prefix_index: searching...%N")
					end
					from
						a_counter := 1
						Result := -1 -- Not found
						last_blank := 1
					variant
						255 - a_counter
					until
						found = True
					loop
						debug ("XPath name pool")
							std.error.put_string ("prefix_index: iteration%N")
						end
						a_blank := the_prefixes.index_of (' ', last_blank)
						if a_blank = 0 then
							debug ("XPath name pool")
								std.error.put_string ("prefix_index: prefix not found%N")
							end
							Result := -1
							found := True
							a_counter := a_counter + 1
						else
							this_prefix := the_prefixes.substring (last_blank, a_blank - 1)
							debug ("XPath name pool")
								std.error.put_string ("prefix_index: Looking at prefix ")
								std.error.put_string (this_prefix)
								std.error.put_string (" from positon ")
								std.error.put_string (last_blank.out)
								std.error.put_string (" to positon ")
								std.error.put_string ((a_blank - 1).out)
								std.error.put_new_line
							end
							if STRING_.same_string (this_prefix, an_xml_prefix) then
								debug ("XPath name pool")
									std.error.put_string ("prefix_index: prefix found%N")
								end
								Result := a_counter
								found := True
								a_counter := a_counter + 1
							else
								a_counter := a_counter + 1
							end
						end
						if not found and a_counter = 255 then
							Exceptions.raise ("Too many prefixes for one namespace URI")
						end
						last_blank := a_blank + 1 -- position AFTER the last blank
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
			a_scaled_prefix_index: INTEGER
		do
			--	(a_name_code |>> 10) & 0x000003ff
			a_scaled_prefix_index := name_code_to_prefix_index (a_name_code) * bits_20

			Result := (a_name_code - a_scaled_prefix_index) // bits_10
		ensure
			positive_result: Result >= 0 and Result < 1024
		end

	name_code_to_hash_code (a_name_code: INTEGER): INTEGER is
			-- Extract the depth from `a_name_code'
		local
			a_scaled_prefix_index, a_depth: INTEGER
		do
			-- hash_code := a_name_code & 0x000003ff
			a_scaled_prefix_index := name_code_to_prefix_index (a_name_code) * bits_20
			a_depth := (a_name_code - a_scaled_prefix_index) // bits_10
			
			Result := (a_name_code - a_scaled_prefix_index - (a_depth * bits_10))
		ensure
			positive_result: Result >= 0 and Result < 1024
		end

	unknown_name_code (a_name_code: INTEGER) is
		-- Exceptions.Raise an exception
		require
			always_valid: True
		local
			a_result_string: STRING
		do
			create a_result_string.make_from_string ("Unknown name code ")
			a_result_string.append_string (a_name_code.out)
			Exceptions.raise (a_result_string)
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

	
