note

	description:

		"Structured URI (Universal Resource Identifier)"

	standards: "RFC 3986 (obsoleting RFC 2396)"
	library: "Gobo Eiffel XML Library"
	author: "Copyright (c) 2004-2013, Berend de Boer and others"
	revision: "$Revision$"
	date: "$Date$"

class UT_URI

inherit

	ANY

	UT_HOST_PORT_ROUTINES

	UT_SHARED_URL_ENCODING

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make,
	make_resolve,
	make_resolve_uri,
	make_absolute,
	make_relative

feature {NONE} -- Initialization

	make (a_reference: STRING)
			-- Parse URI from string.
		require
			a_reference_not_void: a_reference /= Void
			a_reference_not_empty: not a_reference.is_empty
			a_reference_valid: not Url_encoding.has_excluded_characters (a_reference)
			valid_optional_fragment_identifier: a_reference.occurrences ('#') < 2
		do
			full_reference := a_reference
			parse_reference
		end

	make_resolve (a_base: UT_URI; a_reference: STRING)
			-- Parse `a_reference' URI and resolve it relatively to `a_base'.
			-- The path component in `a_reference' will not contain
			-- relative components like ".." if `a_reference' is not absolute.
		require
			a_base_not_void: a_base /= Void
			a_base_is_absolute: a_base.is_absolute
			a_reference_not_void: a_reference /= Void
			a_reference_valid: not Url_encoding.has_excluded_characters (a_reference)
			valid_optional_fragment_identifier: a_reference.occurrences ('#') < 2
		do
			full_reference := a_reference
			parse_reference
			resolve_relative_to (a_base)
		ensure
			is_absolute: is_absolute
			a_reference_resolved_if_not_absolute:
				(not a_reference.is_empty and then a_reference.item (1) /= '/') implies is_path_resolved
		end

	make_resolve_uri (a_base: UT_URI; a_new: UT_URI)
			-- Resolve `a_new' relatively to `a_base'.
		require
			a_base_not_void: a_base /= Void
			a_base_absolute: a_base.is_absolute
			a_new_not_void: a_new /= Void
		do
			set_from_uri (a_new)
			resolve_relative_to (a_base)
		ensure
			is_absolute: is_absolute
		end

	make_absolute (a_scheme: like scheme)
			-- Create empty absolute URI.
		require
			a_scheme_not_void: a_scheme /= Void
		do
			reset
			scheme := a_scheme
			has_absolute_path := True
			full_reference := new_full_reference
		ensure
			absolute: is_absolute
			scheme_set: scheme = a_scheme
			no_authority: not has_authority
			path_absolute: has_absolute_path
			path_empty: path_items.is_empty
			no_query: not has_query
			no_fragment: not has_fragment
		end

	make_relative
			-- Create relative URI.
			-- (empty, that is relative to current document)
		do
			reset
			full_reference := new_full_reference
		ensure
			relative: is_relative
			no_authority: not has_authority
			no_absolute_path: not has_absolute_path
			no_path_items: path_items.is_empty
			no_query: not has_query
			no_fragment: not has_fragment
		end

feature {NONE} -- Implementation

	resolve_relative_to (a_base: UT_URI)
			-- Resolve current relative to `a_base'.
		require
			a_base_not_void: a_base /= Void
			a_base_is_absolute: a_base.is_absolute
		do
				-- See RFC 3986, section 5.2.2.
			if is_absolute then
				-- Keep scheme.
				-- Keep authority.
				-- Keep path.
				-- Keep query.
			else
				check
					is_relative: is_relative
					not_has_scheme: scheme = Void
				end
				if has_authority then
					-- Keep authority.
					-- Keep path.
					-- Keep query.
				else
					if not has_path then
						has_absolute_path := a_base.has_absolute_path
						create path_items.make_from_linear (a_base.path_items)
						path_base_item := a_base.path_base_item
						if has_query then
							-- Keep query.
						else
							query_item := a_base.query_item
						end
					else
						if has_absolute_path then
							-- Keep path.
						else
							resolve_path (a_base)
						end
							-- Keep query.
					end
					authority_item := a_base.authority_item
				end
				scheme := a_base.scheme
			end
				-- Build full reference from parsed components.
			full_reference := new_full_reference
		ensure
			is_absolute: is_absolute
		end

feature -- Status report

	is_absolute: BOOLEAN
			-- Does this URI have a scheme?
		do
			Result := scheme /= Void
		ensure
			consistent: Result = not is_relative
		end

	is_path_resolved: BOOLEAN
			-- Does `path_items' not contain relative components like ".."?
		local
			a_cursor: DS_LINEAR_CURSOR [UT_URI_STRING]
			l_path_base_item: like path_base_item
		do
			Result := True
			l_path_base_item := path_base_item
			if l_path_base_item /= Void and then has_path_base then
				Result := not is_dot_dot (l_path_base_item) and not is_dot (l_path_base_item)
			end
			if path_items.count > 0 then
				Result := not is_dot (path_items.first)
				if Result then
					a_cursor := path_items.new_cursor
					from a_cursor.start until a_cursor.after loop
						if is_dot_dot (a_cursor.item) then
							Result := False
							a_cursor.go_after
						else
							a_cursor.forth
						end
					end
				end
			end
		end

	has_path: BOOLEAN
			-- Is an explicit path defined?
		do
			Result := has_absolute_path or has_path_base or not path_items.is_empty
		ensure
			definition: Result = (has_absolute_path or has_path_base or not path_items.is_empty)
			consistent_with_path: Result = not path.is_empty
		end

	has_path_base: BOOLEAN
			-- Does the path contain a base segment, that is:
			-- False for s://host/a/b/
			-- True for s://host/a/b
		do
			Result := path_base_item /= Void
		ensure
			result_implies_path_base_item_not_void: Result implies path_base_item /= Void
			-- Commented out CPA 2006/10/06 as it fails for gex:/ : no_base: has_path implies (Result = (path.item (path.count) /= '/'))
		end

	is_relative: BOOLEAN
			-- Is this a relative URI?
			-- A relative URI is a URI without `scheme'.
		do
			Result := scheme = Void
		ensure
			consistent: Result = not is_absolute
		end

	is_opaque: BOOLEAN
			-- Is this an opaque (non-hierarchical) URI?
		do
			Result := is_absolute and then (not has_authority and not has_absolute_path)
		ensure
			consistent: Result = not is_hierarchical
		end

	is_hierarchical: BOOLEAN
			-- Is this a hierarchical URI?
		do
			Result := not is_opaque
		ensure
			consistent: Result = not is_opaque
		end

	has_valid_scheme: BOOLEAN
			-- Is scheme set and containing valid characters?
		local
			l_scheme: like scheme
		do
			l_scheme := scheme
			Result := l_scheme /= Void and then (not l_scheme.is_empty and Url_encoding.is_valid_scheme (l_scheme))
		ensure
			valid_scheme_not_void: Result implies scheme /= Void
			valid_scheme_not_empty: Result implies attached scheme as el_scheme and then not el_scheme.is_empty
			valid_scheme_characters: Result implies attached scheme as el_scheme2 and then Url_encoding.is_valid_scheme (el_scheme2)
		end

	has_authority: BOOLEAN
			-- Is `authority' present?
		do
			Result := authority_item /= Void
		ensure
			definition: Result = (authority_item /= Void)
			authority_not_void: Result implies authority /= Void
		end

	has_query: BOOLEAN
			-- Is `query' present?
		do
			Result := query_item /= Void
		ensure
			definition: Result = (query_item /= Void)
			query_not_void: Result implies query /= Void
		end

	has_fragment: BOOLEAN
			-- Is `fragment' present?
		do
			Result := fragment_item /= Void
		ensure
			definition: Result = (fragment_item /= Void)
			fragment_not_void: Result implies fragment /= Void
		end

feature -- Access

	full_reference: STRING
			-- Full URI reference (including fragment)

	full_uri: STRING
			-- Full URI (without fragment)
		do
			if has_fragment then
				Result := new_full_uri
			else
				Result := full_reference
			end
		ensure
			full_uri_not_void: Result /= Void
			no_fragment_is_reference: not has_fragment implies STRING_.same_string (Result, full_reference)
		end

	scheme: detachable STRING
			-- Scheme used, like "http" or "ftp", anything before the ':'

	scheme_specific_part: STRING
			-- Interpretation depends on scheme, everything after the ':'
		local
			l_scheme: like scheme
		do
			if is_relative then
				Result := full_reference
			else
				l_scheme := scheme
				check
						-- `not is_relative' means `is_absolute" means `scheme /= Void'
					scheme_not_void: l_scheme /= Void
				then
					Result := full_reference.substring (l_scheme.count + 2, full_reference.count)
				end
			end
		ensure
			scheme_specific_part_not_void: Result /= Void
			relative_is_full: is_relative implies STRING_.same_string (Result, full_reference)
		end

feature -- Components

	authority: STRING
			-- Authority component, dependent on scheme;
			-- Use `parse_authority' to parse the [<userinfo>@]<host>[:<port>] form.
		require
			has_authority: has_authority
		local
			l_authority_item: like authority_item
		do
			l_authority_item := authority_item
			check
					-- Precondition `has_authority'
				l_authority_item /= Void
			then
				Result := l_authority_item.encoded
			end
		ensure
			authority_not_void: Result /= Void
			definition: attached authority_item as el_authority_item and then STRING_.same_string (Result, el_authority_item.encoded)
			not_next_path_separator: not Result.has ('/')
			not_next_query_separator: not Result.has ('?')
			not_next_fragment_separator: not Result.has ('#')
		end

	path: STRING
			-- Path reconstructed from items
			-- (Item names are kept URL-encoded.)
		local
			i, nb: INTEGER
			l_path_base_item: like path_base_item
		do
			create Result.make_empty
			if has_absolute_path then
				Result.append_character ('/')
			end
			nb := path_items.count
			from i := 1 until i > nb loop
				Result := STRING_.appended_string (Result, path_items.item (i).encoded)
				Result.append_character ('/')
				i := i + 1
			end
			l_path_base_item := path_base_item
			if l_path_base_item /= Void and then has_path_base then
				Result := STRING_.appended_string (Result, l_path_base_item.encoded)
			end
		ensure
			path_not_void: Result /= Void
			not_empty: has_path implies not Result.is_empty
			separator_numbers: Result.occurrences ('/') >= path_items.count
			-- CPA 2006/06/10 (see `has_path_base' : path_base: has_path_base implies (not Result.is_empty and then Result.item (Result.count) /= '/')
			not_next_query_separator: not Result.has ('?')
			not_next_fragment_separator: not Result.has ('#')
		end

	path_base: STRING
			-- Base name of path, that is:
			-- has_path_base = False for "s://host/a/b/"
			-- path_base = "b" for "s://host/a/b"
		require
			has_path_base: has_path_base
		local
			l_path_base_item: like path_base_item
		do
			l_path_base_item := path_base_item
			check
					-- precondition `has_path_base'
				has_path_base: l_path_base_item /= Void
			then
				Result := l_path_base_item.encoded
			end
		ensure
			path_base_not_void: Result /= Void
			not_empty: not Result.is_empty
			no_separator: not Result.has ('/')
		end

	query: STRING
			-- Anything after the '?' and before '#' if present
		require
			has_query: has_query
		local
			l_query_item: like query_item
		do
			l_query_item := query_item
			check
					-- precondition `has_query'
				has_query: l_query_item /= Void
			then
				Result := l_query_item.encoded
			end
		ensure
			query_not_void: Result /= Void
			definition: attached query_item as el_query_item and then STRING_.same_string (Result, el_query_item.encoded)
			not_next_separator: not Result.has ('#')
		end

	fragment: STRING
			-- The part after the '#' if present
		require
			has_fragment: has_fragment
		local
			l_fragment_item: like fragment_item
		do
			l_fragment_item := fragment_item
			check
					-- precondition `has_fragment'
				has_fragment: l_fragment_item /= Void
			then
				Result := l_fragment_item.encoded
			end
		ensure
			fragment_not_void: Result /= Void
			definition: attached fragment_item as el_fragment_item and then STRING_.same_string (Result, el_fragment_item.encoded)
			not_separator: not Result.has ('#')
		end

	authority_item: detachable UT_URI_STRING
			-- Authority if present

	path_items: DS_ARRAYED_LIST [UT_URI_STRING]
			-- Path in `scheme_specific_part'

	path_base_item: detachable UT_URI_STRING
			-- Last segment, if any, of path
			-- (See `path_has_base'.)

	query_item: detachable UT_URI_STRING
			-- Query string if present

	query_items: detachable DS_HASH_TABLE [STRING, STRING]
			-- Individual items in query string if present;
			-- if an item is duplicated, only the last value is retained

	fragment_item: detachable UT_URI_STRING
			-- Fragment string if present

	has_absolute_path: BOOLEAN
			-- Has this URI an absolute path?

feature -- If authority is <userinfo>@<host>:<port>

	user_info: detachable STRING
			-- Optional user info part of a authority
--		require
--			has_parsed_authority: has_parsed_authority

	host_port: detachable UT_HOST_PORT
			-- Hostname and port number
--		require
--			has_parsed_authority: has_parsed_authority
--		ensure
--			host_port_not_void: Result /= Void

	has_parsed_authority: BOOLEAN
			-- Has authority part been parsed?
		do
			Result := host_port /= Void
		ensure
			host_port_not_void: Result implies host_port /= Void
		end

	has_user_info: BOOLEAN
			-- Is the user information part of authority set?
		require
			has_parsed_authority: has_parsed_authority
		do
			Result := user_info /= Void
		ensure
			user_info_not_void: Result implies user_info /= Void
		end

	is_server_authority: BOOLEAN
			-- True if authority can be parsed as:
			-- [ userinfo '@' ] host [ ':' port ]
			-- and port, if present, is an integer.
		local
			p: INTEGER
		do
			Result := has_authority and then not authority.is_empty
			if Result then
				p := authority.index_of ('@', 1)
				Result := is_valid_host_port (authority.substring (p + 1, authority.count))
			end
		end

	parse_authority (default_port: INTEGER)
			-- Parse authority of that form:
			-- [ userinfo '@' ] host [ ':' port ].
			-- `default_port' = 0 means no default.
		require
			valid_default_port: default_port >= 0 and default_port <= 65535
			valid_authority: is_server_authority
		local
			p: INTEGER
			user_info_present: BOOLEAN
			l_authority_item: like authority_item
		do
				-- Scan for `userinfo'.
			l_authority_item := authority_item
			check
					-- precondition `valid_authority'
				valid_authority: l_authority_item /= Void
			then
				p := l_authority_item.encoded.index_of ('@', 1)
				user_info_present := p > 1
				if user_info_present then
					user_info := authority.substring (1, p - 1)
				end
					-- `host_port' is remainder of `authority'.
				if p = 0 then
					create host_port.make (l_authority_item.encoded, default_port)
				else
					check valid_authority_implies: p + 1 < l_authority_item.encoded.count end
					create host_port.make (l_authority_item.encoded.substring (p + 1, authority.count), default_port)
				end
			end
		ensure
			has_parsed_authority: has_parsed_authority
			user_info_occurs_in_authority: attached user_info as el_user_info implies STRING_.substring_index (authority, el_user_info, 1) = 1
			host_occurs_in_authority: STRING_.substring_index (authority, host, 1) /= 0
		end

	host: STRING
			-- Hostname or IP4 address (RFC2396) or IP6 addresses (RFC2732)
		require
			has_authority: has_parsed_authority
		local
			l_host_port: like host_port
		do
			l_host_port := host_port
			check
					-- precondition `has_authority'
				has_authority: l_host_port /= Void
			then
				Result := l_host_port.host
			end
		ensure
			host_not_void: Result /= Void
			definition: attached host_port as el_host_port and then host = el_host_port.host
		end

	port: INTEGER
			-- Service port number
		require
			has_authority: has_parsed_authority
		local
			l_host_port: like host_port
		do
			l_host_port := host_port
			check
					-- precondition `has_authority'
				has_authority: l_host_port /= Void
			then
				Result := l_host_port.port
			end
		ensure
			definition: attached host_port as el_host_port and then port = el_host_port.port
		end

feature {NONE} -- Parsed authority

	reset_parsed_authority
			-- Reset parsed version of `authority'.
		do
			user_info := Void
			host_port := Void
		ensure
			reset: not has_parsed_authority
		end

feature -- Setting

	set_from_uri (a_uri: UT_URI)
			-- Set from other URI.
		require
			a_uri_not_void: a_uri /= Void
		do
			reset
			if a_uri.is_absolute then
				scheme := a_uri.scheme
			end
			if a_uri.has_authority then
				authority_item := a_uri.authority_item
			end
			set_path_from_uri (a_uri)
			if a_uri.has_query then
				query_item := a_uri.query_item
			end
			if a_uri.has_fragment then
				fragment_item := a_uri.fragment_item
			end
		ensure
			scheme_set: scheme = a_uri.scheme
			authority_set: authority_item = a_uri.authority_item
			path_set: STRING_.same_string (path, a_uri.path)
			query_set: query_item = a_uri.query_item
			fragment_set: fragment_item = a_uri.fragment_item
		end

	set_authority (a_authority: like authority_item)
			-- Set authority.
		require
			no_path_separators: a_authority /= Void implies not a_authority.encoded.has ('/')
			no_query_separator: a_authority /= Void implies not a_authority.encoded.has ('?')
			no_fragment_separator: a_authority /= Void implies not a_authority.encoded.has ('#')
		do
			authority_item := a_authority
			reset_parsed_authority
			full_reference := new_full_reference
		ensure
			authority_set: authority_item = a_authority
			authority_reset: not has_parsed_authority
		end

	set_path (a_path: STRING)
			-- Set path.
		require
			a_path_not_void: a_path /= Void
			no_invalid_characters: not Url_encoding.has_excluded_characters (a_path)
			hierarchical: is_hierarchical
		local
			a_uri_string: UT_URI_STRING
			i, j: INTEGER
		do
			if a_path.is_empty then
				has_absolute_path := False
				create path_items.make_default
			else
				if a_path.item (1) = '/' then
					has_absolute_path := True
					i := 2
				else
					has_absolute_path := False
					i := 1
				end
				create path_items.make_default
				from
					j := path.index_of ('/', i)
				until
					j = 0
				loop
					create a_uri_string.make_encoded (path.substring (i, j - 1))
					path_items.force_last (a_uri_string)
					i := j + 1
					j := path.index_of ('/', i)
				end
			end
			full_reference := new_full_reference
		ensure
			path_set: STRING_.same_string (path, a_path)
		end

	set_path_items (a_has_absolute: BOOLEAN; some_items: like path_items)
			-- Set path items.
		require
			some_items_not_void: some_items /= Void
		do
			has_absolute_path := a_has_absolute
			path_items := some_items
			full_reference := new_full_reference
		ensure
			has_absolute_path_set: has_absolute_path = a_has_absolute
			path_items_set: path_items = some_items
		end

	set_path_base (an_item: UT_URI_STRING)
			-- Set path base (last segment, see `has_path_base').
		require
			an_item_not_void: an_item /= Void
		do
			path_base_item := an_item
			full_reference := new_full_reference
		ensure
			path_base_set: path_base_item = an_item
		end

	set_path_from_uri (a_uri: UT_URI)
			-- Set path from other uri.
		require
			a_uri_not_void: a_uri /= Void
		do
			has_absolute_path := a_uri.has_absolute_path
			create path_items.make_from_linear (a_uri.path_items)
			path_base_item := a_uri.path_base_item
			full_reference := new_full_reference
		ensure
			path_set: STRING_.same_string (path, a_uri.path)
		end

	set_query (a_query: like query_item)
			-- Set query.
		require
			no_fragment_separators: a_query /= Void implies not a_query.encoded.has ('#')
		do
			query_item := a_query
			full_reference := new_full_reference
		ensure
			query_set: query_item = a_query
		end

	set_fragment (a_fragment: like fragment_item)
			-- Set fragment.
		do
			fragment_item := a_fragment
		ensure
			fragment_set: fragment_item = a_fragment
		end

feature {NONE} -- Update cached attributes

	new_full_uri: STRING
			-- Reconstructed full URI (without fragment) from components
		local
			l_scheme: like scheme
		do
			create Result.make_empty
			if is_absolute then
				l_scheme := scheme
				check
						-- condition `is_absolute'
					is_absolute: l_scheme /= Void
				then
					Result := STRING_.appended_string (Result, l_scheme)
					Result.append_character (':')
				end
			end
			if has_authority then
				Result.append_character ('/')
				Result.append_character ('/')
				Result := STRING_.appended_string (Result, authority)
			end
			Result := STRING_.appended_string (Result, path)
			if has_query then
				Result.append_character ('?')
				Result := STRING_.appended_string (Result, query)
			end
		ensure
			new_full_uri_not_void: Result /= Void
		end

	new_full_reference: STRING
			-- Reconstructed full reference from components
		do
			Result := new_full_uri
			if has_fragment then
				Result.append_character ('#')
				Result := STRING_.appended_string (Result, fragment)
			end
		ensure
			new_full_reference_not_void: Result /= Void
		end

feature {NONE} -- URI parsing

	State_scheme: INTEGER = 1
	State_authority_prefix: INTEGER = 2
	State_authority: INTEGER = 3
	State_path: INTEGER = 4
	State_query: INTEGER = 5
	State_fragment: INTEGER = 6
			-- States uses in parsing the URI

	reset
			-- Reset all fields to their default state.
		do
			scheme := Void
			authority_item := Void
			reset_parsed_authority
			has_absolute_path := False
			create path_items.make_default
			query_item := Void
			query_items := Void
			query_item_name := Void
			start_query_part := 0
			fragment_item := Void
		ensure
			scheme_void: scheme = Void
			authority_item_void: authority_item = Void
			not_has_absolute_path: not has_absolute_path
			query_item_void: query_item = Void
			query_items_void: query_items = Void
			query_item_name_void: query_item_name = Void
			start_query_reset: start_query_part = 0
			fragment_item_void: fragment_item = Void
			path_items_empty: path_items.is_empty
			not_has_parsed_authority: not has_parsed_authority
		end

	parse_reference
			-- Parse reference according to "generic URI" syntax as
			-- defined in RFC 2396.
		require
			have_reference: full_reference /= Void
		local
			i: INTEGER
			start: INTEGER
			c: CHARACTER
			state: INTEGER
		do
			reset
			from
				start := 1
				state := State_scheme
				i := 1
			until
				i > full_reference.count
			loop
				c := full_reference.item (i)
				inspect c
				when ':' then
					inspect state
					when State_scheme then
						stop_scheme (start, i)
						start := i + 1
						state := State_authority_prefix
					when State_authority_prefix then
							-- Match for : /:
						has_absolute_path := start < i
						start := i
						state := State_path
					when State_authority, State_path, State_query, State_fragment then
					end
				when '/' then
					inspect state
					when State_scheme then
						if i = start then
							state := State_authority_prefix
						else
							stop_path_item (start, i)
							start := i + 1
							state := State_path
						end
					when State_authority_prefix then
						if i > start then
							state := State_authority
						end
					when State_authority then
						stop_authority (start, i)
						has_absolute_path := True
						start := i + 1
						state := State_path
					when State_path then
						stop_path_item (start, i)
						start := i + 1
					when State_query, State_fragment then
					end
				when '?' then
					inspect state
					when State_scheme, State_path then
						stop_path_base (start, i)
					when State_authority_prefix then
							-- ? /?
						has_absolute_path := start < i
						stop_path_base (i, i)
					when State_authority then
						stop_authority (start, i)
					when State_query, State_fragment then
					end
					start := i
					start_query_part := i
					state := State_query
					create query_items.make (1)
				when '=' then
					inspect state
					when State_query then
						stop_query_name (i)
						start_query_part := i
					else
						-- OK.
					end
				when '&' then
					inspect state
					when State_query then
						stop_query_value (i)
						start_query_part := i
					else
						-- OK.
					end
				when '#' then
					inspect state
					when State_scheme, State_path then
						stop_path_base (start, i)
					when State_authority_prefix then
						has_absolute_path := start < i
						stop_path_base (i, i)
					when State_authority then
						stop_authority (start, i)
					when State_query then
						stop_query (start, i)
					when State_fragment then
					end
					start := i
					state := State_fragment
				else
					inspect state
					when State_authority_prefix then
							-- Match for /.
						has_absolute_path := start < i
						start := i
						state := State_path
					else
						-- OK.
					end
				end
				i := i + 1
			variant
				full_reference.count + 1 - i
			end
				-- Handle last part of string.
			inspect state
			when State_scheme, State_authority_prefix, State_path then
				if state /= State_authority_prefix then
					stop_path_base (start, i)
				end
				if
					not has_absolute_path and then
					i > start and then
					full_reference.item (start) = '/'
				then
					has_absolute_path := True
				end
			when State_authority then
				if start < i then
					stop_authority (start, i)
				end
			when State_query then
				if start < i then
					stop_query (start, i)
				end
			when State_fragment then
				if start < i then
					stop_fragment (start, i)
				end
			end
		end

	stop_scheme (start, stop: INTEGER)
			-- Called when scheme part parsed.
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: start = 1
			valid_stop: stop >= 1 and stop <= full_reference.count
		do
			if stop >= start then
				scheme := full_reference.substring (start, stop - 1)
			end
		end

	stop_authority (start, stop: INTEGER)
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start)
			valid_authority:
				full_reference.item (start) = '/' and
				full_reference.item (start + 1) = '/'
			valid_stop: full_reference.valid_index (stop - 1)
			full_reference_contains_authority: start + 2 <= stop
		do
			create authority_item.make_encoded (full_reference.substring (start + 2, stop - 1))
		ensure
			authority_set: has_authority
		end

	stop_path_item (start, stop: INTEGER)
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start) or start = full_reference.count + 1
			valid_stop: stop > start implies full_reference.valid_index (stop - 1)
			full_reference_contains_path_item: start <= stop
		local
			a_uri_string: UT_URI_STRING
		do
			create a_uri_string.make_encoded (full_reference.substring (start, stop - 1))
			path_items.force_last (a_uri_string)
		ensure
			path_item_added: path_items.count = old (path_items.count) + 1
		end

	stop_path_base (start, stop: INTEGER)
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start) or start = full_reference.count + 1
			valid_stop: stop > start implies full_reference.valid_index (stop - 1)
			full_reference_contains_path_item: start <= stop
		do
			if start < stop then
				create path_base_item.make_encoded (full_reference.substring (start, stop - 1))
			end
		end

	query_item_name: detachable STRING

	start_query_part: INTEGER
			-- Track beginning

	stop_query_name (stop: INTEGER)
			-- Stop is exclusive.
		require
			valid_start: full_reference.valid_index (start_query_part)
			valid_query: full_reference.item (start_query_part) = '?'
			valid_stop: full_reference.valid_index (stop - 1)
			full_reference_contains_query: start_query_part + 1 <= stop
		do
			query_item_name := full_reference.substring (start_query_part + 1, stop - 1)
		ensure
			scan_value: start_query_part = stop + 1
		end

	stop_query_value (stop: INTEGER)
			-- `stop' is exclusive.
		require
			valid_start: full_reference.valid_index (start_query_part)
			valid_query: full_reference.item (start_query_part) = '?'
			valid_stop: full_reference.valid_index (stop - 1)
			full_reference_contains_query: start_query_part + 1 <= stop
			query_items_not_void: attached query_items
		local
			l_value: STRING
		do
			if attached query_item_name as l_name and then attached query_items as l_query_items then
				l_value := full_reference.substring (start_query_part + 1, stop - 1)
				l_query_items.force_last (l_value, l_name)
				query_item_name := Void
			end
		ensure
			query_item_name_void: not attached query_item_name
			stop_query_part_scan: start_query_part = 0
		end

	stop_query (start, stop: INTEGER)
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start)
			valid_query: full_reference.item (start) = '?'
			valid_stop: full_reference.valid_index (stop - 1)
			full_reference_contains_query: start + 1 <= stop
		do
			stop_query_value (stop)
			create query_item.make_encoded (full_reference.substring (start + 1, stop - 1))
		ensure
			query_set: has_query
		end

	stop_fragment (start, stop: INTEGER)
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start)
			valid_fragment: full_reference.item (start) = '#'
			valid_stop: full_reference.valid_index (stop - 1)
			full_reference_contains_fragment: start + 1 <= stop
		do
			create fragment_item.make_encoded (full_reference.substring (start + 1, stop - 1))
		ensure
			fragment_set: has_fragment
		end

feature {NONE} -- Resolve a relative-path reference

	resolve_path (a_base: UT_URI)
			-- Resolve path according to RFC 2396bis.
			-- Abnormal cases are compensated for.
		require
			a_base_path_not_void: a_base /= Void
			path_relative: not has_absolute_path
		local
			some_items: like path_items
			segment: UT_URI_STRING
			i, nb: INTEGER
			l_path_base_item: like path_base_item
		do
				-- See RFC 2396, section 5.2 step 6 for an implementation.
				-- Another implementation is used below.

				-- Resolved path is absolute.
			has_absolute_path := True
				-- Path items.
			create some_items.make_from_linear (a_base.path_items)
				-- Handle path base if relative.
			if has_path_base then
				l_path_base_item := path_base_item
				check
						-- condition `has_path_base'
					has_path_base: l_path_base_item /= Void
				then
					if is_dot (l_path_base_item) or is_dot_dot (l_path_base_item) then
						path_items.force_last (l_path_base_item)
						path_base_item := Void
					end
				end
			end
				-- Last segment is part of path if relative.
			nb := path_items.count
			from i := 1 until i > nb loop
				segment := path_items.item (i)
				if is_dot (segment) then
					-- Do nothing.
				elseif is_dot_dot (segment) then
						-- Back one level.
					if not some_items.is_empty then
						some_items.remove_last
					end
				else
						-- Add segment.
					some_items.force_last (segment)
				end
				i := i + 1
			end
				-- Remove empty segments.
			nb := some_items.count
			from i := 1 until i > nb loop
				segment := some_items.item (i)
				if is_empty (segment) then
					some_items.remove (i)
					nb := nb - 1
				else
					i := i + 1
				end
			end
			path_items := some_items
		ensure
			absolute: has_absolute_path
			path_resolved: is_path_resolved
		end

	is_empty (a_string: UT_URI_STRING): BOOLEAN
			-- Is `a_string' an empty ''?
		require
			a_string_not_void: a_string /= Void
		do
			Result := a_string.encoded.is_empty
		ensure
			definition: Result = a_string.encoded.is_empty
		end

	is_dot (a_string: UT_URI_STRING): BOOLEAN
			-- Is `a_string a '.'?
		require
			a_string_not_void: a_string /= Void
		local
			an_encoded: STRING
		do
			an_encoded := a_string.encoded
			Result := an_encoded.count = 1
				and then an_encoded.item (1) = '.'
		ensure
			definition: Result = STRING_.same_string (a_string.encoded, ".")
		end

	is_dot_dot (a_string: UT_URI_STRING): BOOLEAN
			-- Is `a_string a '..'?
		require
			a_string_not_void: a_string /= Void
		local
			an_encoded: STRING
		do
			an_encoded := a_string.encoded
			Result := an_encoded.count = 2
				and then an_encoded.item (1) = '.'
				and then an_encoded.item (2) = '.'
		ensure
			definition: Result = STRING_.same_string (a_string.encoded, "..")
		end

invariant

	either_absolute_or_relative: is_absolute xor is_relative
	hierarchical_or_opaque: is_hierarchical xor is_opaque
	full_reference_not_void: full_reference /= Void
	full_reference_is_valid: not Url_encoding.has_excluded_characters (full_reference)
	path_items_not_void: path_items /= Void
	no_void_path_item: not path_items.has_void
	-- no_empty_path_item: not path_items.has ("")
		-- Contraints on parsed `authority'.
	query_items_if_query: has_query = (attached query_items)
	user_info_occurs_in_authority: attached user_info as l_user_info implies STRING_.substring_index (authority, l_user_info, 1) /= 0
	host_occurs_in_authority: has_parsed_authority implies attached host_port as l_host_port and then STRING_.substring_index (authority, l_host_port.host, 1) /= 0

end
