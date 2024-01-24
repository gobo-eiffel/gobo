note

	description:

		"Namespace pool"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_NAME_POOL

	-- A collection of XML names, each containing a Namespace URI,
	-- a Namespace prefix, and a local name
	-- plus a collection of namespaces, each consisting of a prefix/URI pair.
	-- Also an index of names used as schema types.

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
	-- The fingerprint of a name consists of the hash slot number (in the bottom 10 bits) concatenated with
	-- the depth of the entry down the chain of hash synonyms (in the  next 10 bits).
	-- Fingerprints with depth 0 (i.e., in the range 0-2047) are reserved
	--  for predefined names (names of XSLT elements and attributes, and of built-in types).
	-- These names are not stored in the name pool, but are accessible as if they were.
	--
	--
	-- A name_code contains the fingerprint in the bottom 20 bits. It also contains
	-- an 8-bit prefix index. This distinguishes the prefix used, among all the
	-- prefixes that have been used with this namespace URI. If the prefix index is
	-- zero, the prefix is null. Otherwise, it indexes an space-separated list of
	-- prefix Strings associated with the namespace URI.

inherit

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_SHARED_TYPE_FACTORY
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant
		do
			create hash_slots.make_filled (Void, 0, Maximum_hash_chain_depth - 1)

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

			prefixes.put ("xs", Xml_schema_prefix_index)
			uris.put (Xml_schema_uri, Xml_schema_prefix_index)
			prefixes_for_uri.put ("xs ", Xml_schema_prefix_index)

			prefixes.put ("xdt", Xpath_defined_datatypes_prefix_index)
			uris.put (Xpath_defined_datatypes_uri, Xpath_defined_datatypes_prefix_index)
			prefixes_for_uri.put ("xdt ", Xpath_defined_datatypes_prefix_index)

			prefixes.put ("gexslt", Gexslt_uri_prefix_index)
			uris.put (Gexslt_eiffel_type_uri, Gexslt_uri_prefix_index)
			prefixes_for_uri.put ("gexslt ", Gexslt_uri_prefix_index)

			prefixes.put ("xsl", Xslt_prefix_index)
			uris.put (Xslt_uri, Xslt_prefix_index)
			prefixes_for_uri.put ("xsl ", Xslt_prefix_index)

			prefixes.put ("xsi", Xml_schema_instance_prefix_index)
			uris.put (Xml_schema_instance_uri, Xml_schema_instance_prefix_index)
			prefixes_for_uri.put ("xsi ", Xml_schema_instance_prefix_index)

			prefixes.put ("fn", Xpath_standard_functions_prefix_index)
			uris.put (Xpath_standard_functions_uri, Xpath_standard_functions_prefix_index)
			prefixes_for_uri.put ("fn ", Xpath_standard_functions_prefix_index)

			prefixes.put ("xhtml", Xhtml_prefix_index)
			uris.put (Xhtml_uri, Xhtml_prefix_index)
			prefixes_for_uri.put ("xhtml ", Xhtml_prefix_index)

			prefixes.put ("err", Xpath_errors_prefix_index)
			uris.put (Xpath_errors_uri, Xpath_errors_prefix_index)
			prefixes_for_uri.put ("err ", Xpath_errors_prefix_index)

			prefixes_used := 10
			uris_used := 10

		end

feature -- Access

	Maximum_hash_chain_depth: INTEGER = 2048
			-- Maximum depth for same `hash_code' chains

	namespace_code (an_xml_prefix: STRING; a_uri: STRING): INTEGER
			-- Return existing namespace code for a namespace prefix/URI pair
		require
			uri_allocated: a_uri /= Void
			prefix_allocated: an_xml_prefix /= Void
			code_allocated: is_namespace_code_allocated (an_xml_prefix, a_uri)
		local
			a_prefix_code, a_uri_code: INTEGER -- should be INTEGER_16
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
			valid_namespace_code: is_valid_namespace_code (Result)
		end

	code_for_uri (a_uri: STRING): INTEGER  -- should be INTEGER_16
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
			until
				a_counter > uris_used or found = True
			loop
				if STRING_.same_string (uris.item (a_counter), a_uri) then
					Result := a_counter - 1
					found := True
				end
				a_counter := a_counter + 1
			variant
				uris_used - a_counter + 1
			end
				check
					code_found: found = True
					-- Because of pre-conditions
				end
		ensure
			valid_uri_code: is_valid_uri_code (Result)
			correct_uri: STRING_.same_string (uris.item (Result + 1), a_uri)
		end

	code_for_prefix (an_xml_prefix: STRING): INTEGER  -- should be INTEGER_16
			-- Prefix code for a given `an_xml_prefix'
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
			variant
				prefixes_used - a_counter + 1
			end
			check
				prefix_found: found = True
				-- Because of pre-condition
			end
		ensure
			valid_result: Result >= 0
		end

	suggested_prefix_for_uri (a_uri: STRING): detachable STRING
			-- Suggested prefix for a given `uri';
			-- If there are several, it's undefined which one is returned.;
			-- If there are no prefixes registered for this `uri', return `Void'
		require
			uri_not_void: a_uri /= Void
		local
			a_uri_code: INTEGER -- should be INTEGER_16
			an_index: INTEGER
			possible_prefixes: STRING
		do
			if is_code_for_uri_allocated (a_uri) then
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
		end

	name_code_to_prefix_index (a_name_code: INTEGER): INTEGER
			-- Extracted prefix index from `a_name_code'
		do
			check
				name_code_is_positive: a_name_code > 0
				-- because it only occupies 28 bits
			end
			-- (a_name_code |>> 20) & 0x000000ff
			Result := (a_name_code // bits_20)
		ensure
			valid_prefix_index: Result >= 0 and Result < 255
		end

	prefix_with_index (a_uri_code: INTEGER; an_index: INTEGER): detachable STRING
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
				variant
					an_index - a_counter + 1
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

	name_code (an_xml_prefix: STRING; a_uri: STRING; a_local_name: STRING): INTEGER
			-- Name code for `an_xml_prefix' allocated to `{a_uri}a_local_name'
		require
			prefix_not_void: an_xml_prefix /= Void
			uri_not_void: a_uri /= Void
			valid_local_name: a_local_name /= Void and then (a_local_name.count > 0 implies is_ncname (a_local_name))
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
		ensure
			valid_name_code: is_valid_name_code (Result)
		end

	fingerprint (a_uri: STRING; a_local_name: STRING): INTEGER
			-- Fingerprint for the name with a given uri and local name;
			-- The fingerprint has the property that if two fingerprint are the same,
			-- the names are the same (i.e. same local name and same URI);
			-- (A read-only version of allocate_name)
		require
			uri_not_void: a_uri /= Void
			valid_local_name: a_local_name /= Void and then (a_local_name.count > 0 implies is_ncname (a_local_name))
		local
			a_hash_code, a_depth: INTEGER
			a_uri_code, a_counter: INTEGER -- should be INTEGER_16
			found, finished: BOOLEAN
			an_entry: XM_XPATH_NAME_ENTRY
			next_entry: detachable XM_XPATH_NAME_ENTRY
		do
			Result := -1
			if is_reserved_namespace (a_uri) or else STRING_.same_string (a_uri, Gexslt_eiffel_type_uri) then
				Result := type_factory.standard_fingerprint (a_uri, a_local_name)
			end
			if Result = -1 then
				Result := 0
				from
					a_uri_code := -1
					a_counter := 1
				until
					a_counter > uris_used or found = True
				loop
					if STRING_.same_string (uris.item (a_counter), a_uri) then
						a_uri_code := a_counter - 1
						found := True
					end
					a_counter := a_counter + 1
				variant
					uris_used - a_counter + 1
				end
				if a_uri_code = -1 then
					Result := -1
				else
					a_hash_code := a_local_name.hash_code \\ Maximum_hash_chain_depth

					if not attached hash_slots.item (a_hash_code) as l_entry2 then
						Result := -1
					else
						an_entry :=	l_entry2
						from
							a_depth := 1
						until
							finished = True
						loop
							debug ("XPath name pool - URIs")
								std.error.put_string ("Looking for fingerprint ")
								std.error.put_string (a_uri)
								std.error.put_string (":")
								std.error.put_string (a_local_name)
								std.error.put_string (" with URI code of ")
								std.error.put_string (a_uri_code.out)
								std.error.put_new_line
							end
							if STRING_.same_string (an_entry.local_name, a_local_name) and an_entry.uri_code = a_uri_code then
								finished := True
								debug ("XPath name pool - URIs")
									std.error.put_string ("Found it%N")
								end
							else
								next_entry := an_entry.next
								if next_entry = Void then
									Result := -1; finished := True
									debug ("XPath name pool - URIs")
										std.error.put_string ("Not found%N")
									end
								else
									an_entry := next_entry
								end
							end
							a_depth := a_depth + 1
						variant
							Maximum_hash_chain_depth - 1 - a_depth
						end
						if Result /= -1 then
							Result := ((a_depth - 1) * bits_11) + a_hash_code
						end
					end
				end
			end
		ensure
			valid_name_code:  Result = -1 or else is_valid_name_code (Result)
		end

	fingerprint_from_expanded_name (an_expanded_name: STRING): INTEGER
			-- Fingerprint for the name with a given uri and local name;
		require
			valid_expanded_name: an_expanded_name /= Void and then is_valid_expanded_name (an_expanded_name)
			expanded_name_allocated: is_expanded_name_allocated (an_expanded_name)
		local
			a_local_name, a_namespace: STRING
		do
			a_namespace := namespace_uri_from_expanded_name (an_expanded_name)
			a_local_name := local_name_from_expanded_name (an_expanded_name)
			Result := fingerprint (a_namespace, a_local_name)
		ensure
			valid_name_code: Result = -1 or else is_valid_name_code (Result)
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

	is_valid_namespace_code (a_namespace_code: INTEGER): BOOLEAN
			-- Does `a_namespace_code' represent a URI in `Current'?
		do
			Result :=  is_valid_uri_code (uri_code_from_namespace_code (a_namespace_code))
		ensure
			positive_true_result: Result implies a_namespace_code >= 0
		end

	is_valid_name_code (a_name_code: INTEGER): BOOLEAN
			-- Does `a_name_code' represent a name in `Current'?
		local
			a_prefix_index: INTEGER
		do
			if a_name_code < 0 then
				Result := False
			else
				if type_factory.is_built_in_fingerprint (fingerprint_from_name_code (a_name_code)) then
					a_prefix_index := name_code_to_prefix_index (a_name_code)
					Result := a_prefix_index >= 0 and then a_prefix_index <= prefixes_used
				end
				if Result = False then
					Result :=  name_entry (a_name_code) /= Void
				end
			end
		end

	is_standard_uri_code (a_uri_code: INTEGER): BOOLEAN
			-- Does `a_uri_code' represent a standard URI?
		do
			Result := a_uri_code > Default_uri_code and then a_uri_code <= Xpath_standard_functions_uri_code
		end

	is_standard_name (a_uri, a_local_name: STRING): BOOLEAN
			-- Does `a_uri' paired with `a_local_name' represent a standard name?
		require
			uri_not_void: a_uri /= Void
			local_name_not_void: a_local_name /= Void
		do
			Result := (is_reserved_namespace (a_uri) or else STRING_.same_string (a_uri, Gexslt_eiffel_type_uri))
				and then type_factory.is_built_in_fingerprint (type_factory.standard_fingerprint (a_uri, a_local_name))
		end

	is_valid_uri_code (a_uri_code: INTEGER): BOOLEAN
			-- Does `a_uri_code' represent a URI in `Current'?
		do
			Result := a_uri_code >= 0 and then a_uri_code < uris.count
		end

	is_code_for_uri_allocated (a_uri: STRING): BOOLEAN
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
			if is_reserved_namespace (a_uri) or else STRING_.same_string (a_uri, Gexslt_eiffel_type_uri) then
				Result := True
			else
				from
					a_counter := 1
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
				variant
					uris_used - a_counter + 1
				end
				debug ("XPath name pool allocation")
					std.error.put_string ("Found uri? ")
					std.error.put_string (Result.out)
					std.error.put_new_line
				end
			end
		end

	is_code_for_prefix_allocated (an_xml_prefix: STRING): BOOLEAN
			-- Has a code been allocated for `an_xml_prefix'?
		require
			prefix_not_void: an_xml_prefix /= Void
		local
			a_counter: INTEGER
			do
			from
				a_counter := 1
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
			variant
				prefixes_used - a_counter + 1
			end
		end

	is_prefix_declared (a_qname: STRING): BOOLEAN
			-- Is prefix declared?
		require
			valid_qname: a_qname /= Void and then is_qname (a_qname)
		local
			a_colon: INTEGER
			an_xml_prefix: STRING
		do
			a_colon  := a_qname.index_of (':', 1)
			if a_colon > 0 then
				an_xml_prefix := a_qname.substring (1, a_colon - 1)
			else
				an_xml_prefix := ""
			end
			Result := is_code_for_prefix_allocated (an_xml_prefix)
		end

	is_namespace_code_allocated (an_xml_prefix: STRING; a_uri: STRING): BOOLEAN
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

	is_namespace_code_allocated_for_name_code (a_name_code: INTEGER): BOOLEAN
			-- Has a namespace code been allocated corresponding to `a_name_code'?
		require
			valid_name_code: is_valid_name_code (a_name_code)
		do
			check attached prefix_from_name_code (a_name_code) as a_prefix then
				Result := is_code_for_prefix_allocated (a_prefix)
			end
		end

	is_name_code_allocated (a_xml_prefix: STRING; a_uri: STRING; a_local_name: STRING): BOOLEAN
			-- Has a name code been allocated for `an_xml_prefix' with `a_uri' and `a_local_name'?
		require
			prefix_not_void: a_xml_prefix /= Void
			uri_not_void: a_uri /= Void
			valid_local_name: a_local_name /= Void and then (a_local_name.count > 0 implies is_ncname (a_local_name))
		local
			l_uri_code: INTEGER -- should be INTEGER_16
			l_fingerprint: INTEGER
		do
			if is_code_for_uri_allocated (a_uri) = False then Result := False
			else
				l_uri_code := code_for_uri (a_uri)
				if is_standard_uri_code (l_uri_code) then
					l_fingerprint := type_factory.standard_fingerprint (a_uri, a_local_name)
					if type_factory.is_built_in_fingerprint (l_fingerprint) then
						Result := prefix_index (l_uri_code, a_xml_prefix) /= -1
					end
				end
				if not Result then
					Result := is_name_code_allocated_using_uri_code (a_xml_prefix, l_uri_code, a_local_name)
				end
			end
		end

	is_name_code_allocated_using_uri_code (an_xml_prefix: STRING; a_uri_code: INTEGER; a_local_name: STRING): BOOLEAN
			-- Has a name code been allocated for `an_xml_prefix' with `a_uri_code' and `a_local_name'?
		require
			prefix_not_void: an_xml_prefix /= Void
			valid_local_name: a_local_name /= Void and then (a_local_name.count > 0 implies is_ncname (a_local_name))
		local
			a_hash_code, a_depth, a_prefix_index: INTEGER
			a_name_entry, next_entry: detachable XM_XPATH_NAME_ENTRY
			finished: BOOLEAN
			a_uri: STRING
		do
			if uris.count < a_uri_code + 1 then Result := False
			elseif is_code_for_prefix_allocated (an_xml_prefix) = False then Result := False
			else
				a_prefix_index := prefix_index(a_uri_code, an_xml_prefix)
				if a_prefix_index = -1 then Result := False
				else
					if is_standard_uri_code (a_uri_code) then
						a_uri := uris.item (a_uri_code + 1)
						Result := type_factory.is_built_in_fingerprint (type_factory.standard_fingerprint (a_uri, a_local_name))
					end
					if not Result then
						a_depth := 1
						a_hash_code := a_local_name.hash_code \\ Maximum_hash_chain_depth
						a_name_entry := hash_slots.item (a_hash_code)
						if a_name_entry = Void then
							Result := False
						else
							from
							until
								finished = True
							loop
								if STRING_.same_string (a_name_entry.local_name, a_local_name) and a_name_entry.uri_code = a_uri_code then
									finished := True
									Result := True
									a_depth := a_depth + 1
								else
									next_entry := a_name_entry.next
									a_depth := a_depth + 1
									if a_depth >= Maximum_hash_chain_depth or next_entry = Void then
										finished := True
									else
										a_name_entry := next_entry
									end
								end
							variant
								Maximum_hash_chain_depth - 1 - a_depth
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

	is_name_pool_full (a_uri, a_local_name: STRING): BOOLEAN
			--	Is `Current' full for `a_local_name', taking `a_uri' into consideration?
		require
			uri_not_void: a_uri /= Void
			valid_local_name: a_local_name /= Void and then (a_local_name.count > 0 implies is_ncname (a_local_name))
		local
			a_uri_code: INTEGER
		do
			if is_code_for_uri_allocated (a_uri) then
				a_uri_code := code_for_uri (a_uri)
			else
				a_uri_code := -1 -- Invalid, so guarentees no match
			end
				check
					valid_uri_code:  is_valid_uri_code (a_uri_code) or else a_uri_code = -1
				end
			Result := is_name_pool_full_using_uri_code (a_uri_code, a_local_name)
		end

	is_name_pool_full_using_uri_code (a_uri_code: INTEGER; a_local_name: STRING): BOOLEAN
			--	Is `Current' full for `a_local_name', taking `a_uri_code' into consideration?
		require
			valid_uri_code: is_valid_uri_code (a_uri_code) or else a_uri_code = -1
			valid_local_name: a_local_name /= Void and then (a_local_name.count > 0 implies is_ncname (a_local_name))
		local
			a_hash_code, a_depth: INTEGER
			a_name_entry, next_entry: detachable XM_XPATH_NAME_ENTRY
			finished: BOOLEAN
		do
			a_name_entry := hash_slots.item (a_hash_code)
			if a_name_entry = Void then
				Result := False
			else
				from
					Result := True
					a_depth := 1
					a_hash_code := a_local_name.hash_code \\ Maximum_hash_chain_depth
				until
					finished
				loop
					if STRING_.same_string (a_name_entry.local_name, a_local_name) and a_name_entry.uri_code = a_uri_code then
						Result := False
						finished := True
					else
						next_entry := a_name_entry.next
						a_depth := a_depth + 1
						if a_depth >= Maximum_hash_chain_depth then
							Result := True
							finished := True
						elseif next_entry = Void then
							finished := True
							Result := False
						else
							a_name_entry := next_entry
						end
					end
				variant
					Maximum_hash_chain_depth - 1 - a_depth
				end
			end
		end

	is_expanded_name_allocated (an_expanded_name: STRING): BOOLEAN
			-- Is `an_expanded_name' allocated?
		require
			valid_expanded_name: an_expanded_name /= Void and then is_valid_expanded_name (an_expanded_name)
		local
			a_namespace_uri, a_local_name: STRING
		do
			a_local_name := local_name_from_expanded_name (an_expanded_name)
			a_namespace_uri := namespace_uri_from_expanded_name (an_expanded_name)
			Result := is_name_code_allocated ("", a_namespace_uri, a_local_name)
		end

	is_valid_prefix_for_uri (a_uri_code: INTEGER; an_xml_prefix: STRING): BOOLEAN
			-- Is `an_xml_prefix' valid for `a_uri_code'?
		require
			valid_uri_code: is_valid_uri_code (a_uri_code)
			prefix_not_void: an_xml_prefix /= Void
		local
			the_prefixes, this_prefix: STRING
			a_prefix_count, a_counter, a_blank, last_blank: INTEGER
		do
			the_prefixes := prefixes_for_uri.item (a_uri_code + 1)
			a_prefix_count := the_prefixes.count
			if a_prefix_count = an_xml_prefix.count + 1 and then the_prefixes.item (a_prefix_count).is_equal (' ')
				and then STRING_.same_string (the_prefixes.substring (1, a_prefix_count - 1), an_xml_prefix) then -- sole prefix
				Result := True
			else
				from
					a_counter := 1
					last_blank := 1
				until
					Result or else a_counter > 255
				loop
					a_blank := the_prefixes.index_of (' ', last_blank)
					if a_blank = 0 then
						Result := True
						a_counter := a_counter + 1
					else
						this_prefix := the_prefixes.substring (last_blank, a_blank - 1)
						if STRING_.same_string (this_prefix, an_xml_prefix) then
							Result := True
							a_counter := a_counter + 1
						else
							a_counter := a_counter + 1
						end
					end
					last_blank := a_blank + 1 -- position AFTER the last blank
				variant
					255 - a_counter
				end
			end
		end

	are_uris_all_used: BOOLEAN
			-- Are all URIs in use?
		do
			Result := uris_used >= 32000
		end

	are_prefixes_all_used: BOOLEAN
			-- Are all prefixes used?
		do
			Result := prefixes_used >= 32000
		end

	diagnostic_dump
			-- Diagnostic print of the namepool contents
		local
			a_hash_code, a_depth, prefix_count, a_uri_count: INTEGER
			an_entry: detachable XM_XPATH_NAME_ENTRY
		do
			std.error.put_string ("Contents of NamePool ")
			std.error.put_string (out)
			std.error.put_new_line
			from
				a_hash_code := 0
			until
				a_hash_code = Maximum_hash_chain_depth
			loop
				an_entry := hash_slots.item (a_hash_code)
				a_depth := 1
				from
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
				variant
					Maximum_hash_chain_depth - 1 - a_depth
				end
				a_hash_code := a_hash_code + 1
			variant
				Maximum_hash_chain_depth - a_hash_code
			end
			from
				prefix_count := 1
			until
				prefix_count > prefixes_used
			loop
				std.error.put_string ("Prefix ")
				std.error.put_string (prefix_count.out)
				std.error.put_string (" = ")
				std.error.put_string (prefixes.item (prefix_count))
				std.error.put_new_line

				prefix_count := prefix_count + 1
			variant
				prefixes_used - prefix_count + 1
			end
			from
				a_uri_count := 1
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
			variant
				uris_used - a_uri_count + 1
			end
		end

feature -- Status setting

	clear
			-- Clear out all entries and reset to initial state.
		do
			make
		end

feature -- Element change

	allocate_namespace_code (an_xml_prefix: STRING; a_uri: STRING)
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
			debug ("XPath name pool - namespaces")
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
			a_key := STRING_.cloned_string (an_xml_prefix)
			if not a_key2.is_empty then
				a_key2 := STRING_.appended_string (a_key2, " ")
				a_key2 := STRING_.appended_string (a_key2, a_key)
				a_key2 := STRING_.appended_string (a_key2, " ")
			else
				a_key2 := STRING_.appended_string (a_key, " ")
			end
			prefixes_for_uri.replace (a_key2, a_uri_code + 1)

			debug ("XPath name pool - namespaces")
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

	allocate_namespace_code_for_name_code (a_name_code: INTEGER)
			-- Allocate a namespace code for a given name code.
		require
			namespace_code_not_allocated: not is_namespace_code_allocated_for_name_code (a_name_code)
		do
			check attached prefix_from_name_code (a_name_code) as a_prefix then
				allocate_code_for_prefix (a_prefix)
			end
		ensure
			namespace_code_allocated: attached prefix_from_name_code (a_name_code) implies is_namespace_code_allocated_for_name_code (a_name_code)
		end

	allocate_code_for_uri (a_uri: STRING)
			-- Allocate the uri code for a given URI;
			-- WARNING - this code is not thread safe
		require
			uri_not_void: a_uri /= Void
			code_not_allocated: not is_code_for_uri_allocated (a_uri)
			uris_not_all_used: not are_uris_all_used
		local
			an_index: INTEGER
		do
			debug ("XPath name pool - URIs")
				std.error.put_string ("Before resize:%N")
				from
					an_index := 1
				until
					an_index > uris.count
				loop
					std.error.put_string (uris.item (an_index))
					std.error.put_new_line
					an_index := an_index + 1
				end
				std.error.put_new_line
			end
			if uris.capacity = uris_used then
				uris.resize (2 * uris_used)
				prefixes_for_uri.resize (2 * uris_used)
			end
			debug ("XPath name pool - URIs")
				std.error.put_string ("After resize:%N")
				from
					an_index := 1
				until
					an_index > uris.count
				loop
					std.error.put_string (uris.item (an_index))
					std.error.put_new_line
					an_index := an_index + 1
				end
				std.error.put_new_line
			end
			last_uri_code := uris_used
			uris.put (a_uri, uris_used + 1)
			prefixes_for_uri.put ("", uris_used + 1)
			uris_used := uris_used + 1
			debug ("XPath name pool - URIs")
				std.error.put_string ("After addition:%N")
				from
					an_index := 1
				until
					an_index > uris.count
				loop
					std.error.put_string (uris.item (an_index))
					std.error.put_new_line
					an_index := an_index + 1
				end
				std.error.put_new_line
			end
		ensure
			code_allocated: is_code_for_uri_allocated (a_uri)
		end

	allocate_code_for_prefix (an_xml_prefix: STRING)
			-- Allocate the uri code for a given `an_xml_prefix';
			-- WARNING - this code is not thread safe
		require
			prefix_not_void: an_xml_prefix /= Void
			code_not_allocated: not is_code_for_prefix_allocated (an_xml_prefix)
			prefixes_not_all_used: not are_prefixes_all_used
		do
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

	allocate_name (an_xml_prefix: STRING; a_uri: STRING; a_local_name: STRING)
			-- Allocate a new name
		require
			prefix_not_void: an_xml_prefix /= Void
			uri_not_void: a_uri /= Void
			valid_local_name: a_local_name /= Void and then (a_local_name.count > 0 implies is_ncname (a_local_name))
			name_not_allocated: not is_name_code_allocated (an_xml_prefix, a_uri, a_local_name)
			name_pool_not_full: not is_name_pool_full (a_uri, a_local_name)
		local
			a_uri_code: INTEGER -- should be INTEGER_16
			a_fingerprint, a_prefix_index: INTEGER
		do
			last_name_code := -1
			if is_reserved_namespace (a_uri) or else STRING_.same_string (a_uri, Gexslt_eiffel_type_uri) then
				a_fingerprint := type_factory.standard_fingerprint (a_uri, a_local_name)
				if type_factory.is_built_in_fingerprint (a_fingerprint) then
					a_uri_code := type_factory.standard_uri_code (a_fingerprint)
					a_prefix_index := prefix_index (a_uri_code, an_xml_prefix)
					if a_prefix_index < 0 then
						allocate_prefix (a_uri_code, an_xml_prefix)
						a_prefix_index := prefix_index (a_uri_code, an_xml_prefix)
					end
					check
						prefix_allocated: a_prefix_index >= 0
					end
					last_name_code :=  (a_prefix_index * bits_20) + a_fingerprint
				end
			end
			if last_name_code = -1 then
				if is_code_for_uri_allocated (a_uri) then
					a_uri_code := code_for_uri (a_uri)
				else
					allocate_code_for_uri (a_uri)
					a_uri_code := last_uri_code
				end
				check
					valid_uri_code:  is_valid_uri_code (a_uri_code)
				end
				allocate_name_using_uri_code (an_xml_prefix, a_uri_code, a_local_name)
			end
		ensure
			name_allocated: is_name_code_allocated (an_xml_prefix, a_uri, a_local_name)
			valid_name_code: is_valid_name_code (last_name_code)
		end

	allocate_name_using_uri_code (an_xml_prefix: STRING; a_uri_code: INTEGER; a_local_name: STRING)
			-- Allocate a name from the pool, or a new Name if there is not a matching one there
		require
			prefix_not_void: an_xml_prefix /= Void
			valid_uri_code:  is_valid_uri_code (a_uri_code)
			valid_local_name: a_local_name /= Void and then (a_local_name.count > 0 implies is_ncname (a_local_name))
			name_not_allocated: not is_name_code_allocated_using_uri_code (an_xml_prefix, a_uri_code, a_local_name)
			name_pool_not_full: not is_name_pool_full_using_uri_code (a_uri_code, a_local_name)
		local
			a_hash_code, a_depth, a_prefix_index: INTEGER
			a_name_entry, new_entry: XM_XPATH_NAME_ENTRY
			next_entry: detachable XM_XPATH_NAME_ENTRY
			finished: BOOLEAN
		do
			a_depth := 1
			a_hash_code := a_local_name.hash_code \\ Maximum_hash_chain_depth
				check
					valid_hash_code: a_hash_code >= 0 and a_hash_code < Maximum_hash_chain_depth
				end
			a_prefix_index := prefix_index (a_uri_code, an_xml_prefix)
				check
					valid_prefix_index: a_prefix_index > -2 and a_prefix_index < 255
				end
			if a_prefix_index < 0 then
				allocate_prefix (a_uri_code, an_xml_prefix)
				a_prefix_index := prefix_index (a_uri_code, an_xml_prefix)
					check
						valid_prefix_index2: a_prefix_index > 0 and a_prefix_index < 255
					end
			end
			if not attached hash_slots.item (a_hash_code) as l_name_entry2 then
				create a_name_entry.make (a_uri_code, a_local_name)
				hash_slots.put (a_name_entry, a_hash_code)
			else
				a_name_entry := l_name_entry2
				from
				until
					finished = True
				loop
					if STRING_.same_string (a_name_entry.local_name, a_local_name) and a_name_entry.uri_code = a_uri_code then
						finished := True
					else
						next_entry := a_name_entry.next
						a_depth := a_depth + 1
							check
								pool_not_full: not (a_depth >= Maximum_hash_chain_depth)
								-- from pre-condition
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
			last_name_code := (a_prefix_index * bits_20) + (a_depth * bits_11) + a_hash_code
		ensure
			name_allocated: is_name_code_allocated_using_uri_code (an_xml_prefix, a_uri_code, a_local_name)
			valid_name_code: is_valid_name_code (last_name_code)
		end

	allocate_expanded_name (an_expanded_name: STRING)
			-- Allocate a fingerprint for `an_expanded_name'
		require
			valid_expanded_name: an_expanded_name /= Void and then is_valid_expanded_name (an_expanded_name)
			expanded_name_not_allocated: not is_expanded_name_allocated (an_expanded_name)
		local
			a_namespace_uri, a_local_name: STRING
		do
			a_local_name := local_name_from_expanded_name (an_expanded_name)
			a_namespace_uri := namespace_uri_from_expanded_name (an_expanded_name)
			allocate_name ("", a_namespace_uri, a_local_name)
		ensure
			expanded_name_allocated: is_expanded_name_allocated (an_expanded_name)
		end

feature -- Conversion

	namespace_code_from_name_code (a_name_code: INTEGER): INTEGER
			-- Namespace code, given its name code
		require
			valid_name_code: is_valid_name_code (a_name_code)
		local
			a_uri_code, a_prefix_code: INTEGER --_16
		do
			check attached prefix_from_name_code (a_name_code) as l_prefix then
				a_uri_code := uri_code_from_name_code (a_name_code)
				a_prefix_code := code_for_prefix (l_prefix)
				Result := (a_prefix_code * bits_16) + a_uri_code
			end
		end

	namespace_uri_from_name_code (a_name_code: INTEGER): STRING
			-- Namespace-URI of a name, given its name code or fingerprint
		require
			valid_name_code: is_valid_name_code (a_name_code)
		local
			a_fingerprint: INTEGER
		do
			a_fingerprint := fingerprint_from_name_code (a_name_code)
			if type_factory.is_built_in_fingerprint (a_fingerprint) then
				Result := type_factory.standard_uri (a_fingerprint)
			else
				check precondition_valid_name_code: attached name_entry (a_name_code) as an_entry then
					Result := uris.item (an_entry.uri_code + 1)
				end
			end
		ensure
			result_not_void: Result /= Void
		end

	uri_code_from_name_code (a_name_code: INTEGER): INTEGER  -- should be INTEGER_16
			-- URI code of a name, given its name code or fingerprint
		require
			valid_name_code: is_valid_name_code (a_name_code)
		local
			a_fingerprint: INTEGER
		do
			a_fingerprint := fingerprint_from_name_code (a_name_code)
			if type_factory.is_built_in_fingerprint (a_fingerprint) then
				Result := type_factory.standard_uri_code (a_fingerprint)
			else
				check precondition_valid_name_code: attached name_entry (a_name_code) as an_entry then
					Result := an_entry.uri_code
				end
			end
		end

	local_name_from_name_code (a_name_code: INTEGER): STRING
			-- Local part of a name, given its name code or fingerprint
		require
			valid_name_code: is_valid_name_code (a_name_code)
		local
			a_fingerprint: INTEGER
		do
			a_fingerprint := fingerprint_from_name_code (a_name_code)
			if type_factory.is_built_in_fingerprint (a_fingerprint) then
				Result := type_factory.standard_local_name (a_fingerprint)
			else
				check precondition_valid_name_code: attached name_entry (a_name_code) as an_entry then
					Result := an_entry.local_name
				end
			end
		ensure
			result_not_void: Result /= Void
		end

	prefix_from_name_code (a_name_code: INTEGER): detachable STRING
			-- Xml prefix, given its name code
		require
			valid_name_code: is_valid_name_code (a_name_code)
		local
			a_fingerprint: INTEGER
			a_uri_code: INTEGER -- should be INTEGER_16
			a_prefix_index: INTEGER
		do
			a_fingerprint := fingerprint_from_name_code (a_name_code)
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

	display_name_from_name_code (a_name_code: INTEGER): STRING
			-- Display form of a name (the QName), given its name code or fingerprint
		require
			valid_name_code: is_valid_name_code (a_name_code)
		local
			l_prefix_index: INTEGER
			l_fingerprint, l_uri_code: INTEGER
		do
			l_fingerprint := fingerprint_from_name_code (a_name_code)
			l_uri_code := uri_code_from_name_code (a_name_code)
			l_prefix_index := name_code_to_prefix_index (a_name_code)
			if not type_factory.is_built_in_fingerprint (l_fingerprint) then
				check precondition_valid_name_code: attached name_entry (a_name_code) as l_entry then
					if l_prefix_index = 0 then
						Result := l_entry.local_name
					else
						check attached prefix_with_index (l_entry.uri_code, l_prefix_index) as l_prefix then
							Result := STRING_.appended_string (l_prefix, ":")
							Result := STRING_.appended_string (Result, l_entry.local_name)
						end
					end
				end
			else
				if l_prefix_index = 0 then
					Result := type_factory.standard_prefix (l_fingerprint)
				else
					check attached prefix_with_index (l_uri_code, l_prefix_index) as l_prefix then
						Result := l_prefix
					end
				end
				Result := STRING_.appended_string (Result, ":")
				Result := STRING_.appended_string (Result, type_factory.standard_local_name (l_fingerprint))
			end
		ensure
			result_not_void: Result /= Void
		end

	uri_from_namespace_code (a_namespace_code: INTEGER): STRING
			-- Namespace URI from `a_namespace_code'
		require
			valid_code: is_valid_namespace_code (a_namespace_code)
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
		ensure
			uri_not_void: Result /= Void
		end

	uri_from_uri_code (a_uri_code: INTEGER): STRING
			-- Namespace URI from `a_uri_code'
		require
			valid_code: is_valid_uri_code (a_uri_code)
		do
			Result := uris.item (a_uri_code + 1)
		end

	prefix_from_namespace_code (a_namespace_code: INTEGER): STRING
			-- Namespace prefix from `namespace_code'
		require
			valid_code: is_valid_namespace_code (a_namespace_code)
		local
			b16: INTEGER
		do
			-- Result := prefixes.item ((a_namespace_code |>> 16) + 1)
			-- N.B. namespace codes consist of two positive 16-bit numbers,
			--      so overflow does not arise
			b16 := bits_16
			Result := prefixes.item ((a_namespace_code // b16) + 1)
		end

	expanded_name_from_name_code (a_name_code: INTEGER): STRING
			-- Expanded name of `a_name_code'
		require
			positive_name_code: a_name_code >= 0
		local
			a_fingerprint: INTEGER
			a_name_entry: detachable XM_XPATH_NAME_ENTRY
		do
			a_fingerprint := fingerprint_from_name_code (a_name_code)
			if a_fingerprint <= Maximum_built_in_fingerprint then
				Result := STRING_.concat (type_factory.standard_uri (a_fingerprint), "#")
				Result := STRING_.appended_string (Result, type_factory.standard_local_name (a_fingerprint))
			else
				a_name_entry := name_entry (a_name_code)
				if a_name_entry = Void then
					Result := ""
				elseif a_name_entry.uri_code = 0 then
					Result := a_name_entry.local_name
				else
					Result := STRING_.concat (uri_from_uri_code (a_name_entry.uri_code), "#")
					Result := STRING_.appended_string (Result, a_name_entry.local_name)
				end
			end
		end

feature {NONE} -- Implementation

	name_entry (a_name_code: INTEGER): detachable XM_XPATH_NAME_ENTRY
			-- Name entry corresponding to `a_name_code'
		require
			positive_name_code: a_name_code >= 0
		local
			a_hash_code, a_depth, a_counter: INTEGER
			end_of_chain: BOOLEAN
			an_entry: detachable XM_XPATH_NAME_ENTRY
		do
			a_depth := name_code_to_depth (a_name_code)
			a_hash_code := name_code_to_hash_code (a_name_code)
			an_entry := hash_slots.item (a_hash_code)
			from
				a_counter := 1
			until
				a_counter = a_depth or else end_of_chain
			loop
				if an_entry = Void then
					end_of_chain := True
				else
					an_entry := an_entry.next
				end
				a_counter := a_counter + 1
			variant
				a_depth - a_counter + 1
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

	prefix_index (a_uri_code: INTEGER; an_xml_prefix: STRING): INTEGER
			-- Index of a prefix among all the prefixes used with a given URI
		require
			prefix_not_void: an_xml_prefix /= Void
			valid_prefix: is_valid_prefix_for_uri (a_uri_code, an_xml_prefix)
		local
			the_prefixes, this_prefix: STRING
			a_prefix_count, a_counter, a_blank, last_blank: INTEGER
			found: BOOLEAN
		do

			-- look for quick wins

			if an_xml_prefix.is_empty then
				Result := 0
			else
				the_prefixes := prefixes_for_uri.item (a_uri_code + 1)
				a_prefix_count := the_prefixes.count
				if a_prefix_count = an_xml_prefix.count + 1 and then the_prefixes.item (a_prefix_count).is_equal (' ')
					and then STRING_.same_string (the_prefixes.substring (1, a_prefix_count - 1), an_xml_prefix) then -- sole prefix
					Result := 1
				else
					from
						a_counter := 1
						Result := -1 -- Not found
						last_blank := 1
					until
						found = True
					loop
						a_blank := the_prefixes.index_of (' ', last_blank)
						if a_blank = 0 then
							Result := -1
							found := True
							a_counter := a_counter + 1
						else
							this_prefix := the_prefixes.substring (last_blank, a_blank - 1)
							if STRING_.same_string (this_prefix, an_xml_prefix) then
								Result := a_counter
								found := True
								a_counter := a_counter + 1
							else
								a_counter := a_counter + 1
							end
						end
						last_blank := a_blank + 1 -- position AFTER the last blank
					variant
						255 - a_counter
					end
				end
			end
		ensure
			valid_result: -2 < Result and Result < 255
		end

	name_code_to_depth (a_name_code: INTEGER): INTEGER
			-- Extract the depth from `a_name_code'
		local
			a_scaled_prefix_index: INTEGER
		do
			--	(a_name_code |>> 10) & 0x000003ff
			a_scaled_prefix_index := name_code_to_prefix_index (a_name_code) * bits_20

			Result := (a_name_code - a_scaled_prefix_index) // bits_11
		ensure
			positive_result: Result >= 0 and Result < Maximum_hash_chain_depth
		end

	name_code_to_hash_code (a_name_code: INTEGER): INTEGER
			-- Extract the depth from `a_name_code'
		local
			a_scaled_prefix_index, a_depth: INTEGER
		do
			-- hash_code := a_name_code & 0x000003ff
			a_scaled_prefix_index := name_code_to_prefix_index (a_name_code) * bits_20
			a_depth := (a_name_code - a_scaled_prefix_index) // bits_11

			Result := (a_name_code - a_scaled_prefix_index - (a_depth * bits_11))
		ensure
			positive_result: Result >= 0 and Result < Maximum_hash_chain_depth
		end

	allocate_prefix (a_uri_code: INTEGER; an_xml_prefix: STRING)
			-- Allocate `an_xml_prefix' to `a_uri_code'.
		require
			prefix_not_allocated: prefix_index (a_uri_code, an_xml_prefix) < 0
		local
			a_key, a_key2: STRING
		do
			if not is_code_for_prefix_allocated (an_xml_prefix) then
				allocate_code_for_prefix (an_xml_prefix)
			end

			a_key2 := prefixes_for_uri.item (a_uri_code + 1)
			a_key := STRING_.cloned_string (an_xml_prefix)
			if not a_key2.is_empty then
				a_key2 := STRING_.appended_string (a_key2, " ")
				a_key2 := STRING_.appended_string (a_key2, a_key)
				a_key2 := STRING_.appended_string (a_key2, " ")
			else
				a_key2 := STRING_.appended_string (a_key, " ")
			end
			prefixes_for_uri.replace (a_key2, a_uri_code + 1)
		ensure
			prefix_allocated: prefix_index (a_uri_code, an_xml_prefix) > -1
		end

	hash_slots: ARRAY [detachable XM_XPATH_NAME_ENTRY]
			-- Fixed size hash table

feature -- Access

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

	fixed_hash_slots: hash_slots /= Void and then hash_slots.count = Maximum_hash_chain_depth
	prefixes_not_void: prefixes /= Void
	prefixes_used: prefixes_used >= 3
	uris_not_void: uris /= Void
	prefixes_for_uri_not_void: prefixes_for_uri /= Void
	uris_used: uris_used >= 3

end


