indexing

	description:
		
		"Class that splits an URI into its components."

	standards:
		"1. Based upon RFC 2396.%
		%2. Also takes into account the revised version:%
		%      http://www.apache.org/~fielding/uri/rev-2002/rfc2396bis.html%
		%3. See for issues and other examples:%
		%     http://www.apache.org/~fielding/uri/rev-2002/issues.html"

	library: "Gobo Eiffel XML Library"
	author: "Copyright (c) 2004, Berend de Boer and others"
	revision: "$Revision$"
	date: "$Date$"

class UT_URI

inherit

	ANY
	
	UT_HOST_PORT_ROUTINES

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

creation

	make,
	make_resolve

feature -- Initialization.

	make (a_reference: STRING) is
			-- Create an absolute or relative URI.
		require
			reference_not_empty: a_reference /= Void and then not a_reference.is_empty
			reference_valid: not uri_encoding.has_excluded_characters (a_reference)
		do
			full_reference := a_reference
			parse_reference
		end

	make_resolve (base: UT_URI; a_reference: STRING) is
			-- If `a_reference' is a partial URI, it is resolved using
			-- `base'.
			-- The path component in `a_reference' will not contain
			-- relative components like ".." if `a_reference' is not absolute.
		require
			base_not_void: base /= Void
			base_is_absolute_URI: base.is_absolute
			reference_not_void: a_reference /= Void
			reference_valid: not uri_encoding.has_excluded_characters (a_reference)
		do
			full_reference := a_reference
			parse_reference
			
			-- See steps in RFC 2396, section 5.2
			-- Step 1: parsing done

			if is_relative then

					check
						scheme_empty: scheme = Void
					end

					-- Step 2:
				if authority = Void and not has_path and not has_query then
					scheme := base.scheme
					authority := base.authority
					has_absolute_path := base.has_absolute_path
					create path_items.make_from_linear (base.path_items)

				else
						-- Step 3:
					scheme := base.scheme

						-- Step 4:
					if authority = Void then
						authority := base.authority
							-- Step 5:
						if not has_absolute_path then
								-- Step 6:
							if not has_path then
								-- 1. we don't have a path, use path of parent, if any
								has_absolute_path := base.has_absolute_path
								create path_items.make_from_linear (base.path_items)
							elseif not base.has_path then
								-- 2. Parent doesn't have a path, make our path absolute
								has_absolute_path := True
							else
								-- 3. Something to resolve
								resolve_path (base)
							end
						end
					end
				end

					-- Step 7: build full reference from parsed components
				full_reference := new_full_reference
			end
		ensure
			must_be_absolute: is_absolute
			a_reference_resolved_if_not_absolute:
				not a_reference.is_empty and then a_reference.item (1) /= '/' implies
					(not has_path) or else is_path_resolved
		end

feature -- Status

	is_absolute: BOOLEAN is
			-- Does this URI have a scheme?
		do
			Result := scheme /= Void
		ensure
			consistent: Result = not is_relative
		end

	is_path_resolved: BOOLEAN is
			-- Does `path_items' not contain relative components like ".."?
		require
			has_path: has_path
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
		do
			Result := True
			if path_items.count > 0 then
				Result := not is_dot (path_items.first) and not is_dot (path_items.last)
				if Result then
					from
						a_cursor := path_items.new_cursor
						a_cursor.start
					until
						a_cursor.after
					loop
						Result := not is_dot_dot (a_cursor.item)
						if not Result then
							a_cursor.go_after
						else
							a_cursor.forth
						end
					end
				end
			end
		end

	is_relative: BOOLEAN is
			-- Is this a relative URI?
			-- A relative uri is a URI without `scheme'.
		do
			Result := scheme = Void
		ensure
			consistent: Result = not is_absolute
		end

feature -- Access

	full_reference: STRING
			-- The entire URI.

feature -- Access

	scheme: STRING
			-- Scheme used, like "http" or "ftp", anything before the ':'.

	scheme_specific_part: STRING is
			-- Interpretation depends on scheme, everything after the ':'.
		do
			if is_relative then
				Result := full_reference
			else
				Result := full_reference.substring (scheme.count + 2, full_reference.count)
			end
		ensure
			result_not_void: Result /= Void
			relative_is_full: is_relative implies STRING_.same_string (Result, full_reference)
		end
	
	has_valid_scheme: BOOLEAN is
			-- Is scheme set and containing valid characters?
		do
			Result := scheme /= Void 
				and then not scheme.is_empty 
					and uri_encoding.is_valid_scheme (scheme)
		ensure
			valid_scheme_not_void: Result implies scheme /= Void
			valid_scheme_not_empty: Result implies not scheme.is_empty
			valid_scheme_characters: Result implies uri_encoding.is_valid_scheme (scheme)
		end

feature -- Access

	has_authority: BOOLEAN is
			-- Is `authority' present?
		do
			Result := authority /= Void
		ensure
			result_implies_not_void: Result implies authority /= Void
		end
		
	has_path: BOOLEAN is
			-- Is path part set?
		do
			Result := path_items /= Void
		ensure
			path_items: Result implies path_items /= Void
		end

	has_query: BOOLEAN is
			-- Is `query' present?
		do
			Result := query /= Void
		ensure
			result_implies_not_void: Result implies query /= Void
		end
		
	has_fragment: BOOLEAN is
			-- Is `fragment' present?
		do
			Result := fragment /= Void
		ensure
			result_implies_not_void: Result implies fragment /= Void
		end

feature -- If URI has a hierarchical relationships within the namespace

	authority: STRING
			-- Authority part of `scheme_specific_part', usually a host name.
			-- It can be more complex however like: <userinfo>@<host>:<port>.
			-- Use `parse_authority' to split authority in these
			-- components if that is applicable for the protocol.

	path_items: DS_ARRAYED_LIST [STRING]
			-- Path in `scheme_specific_part'.

	has_absolute_path: BOOLEAN
			-- Has this URI an absolute path?

	path: STRING is
			-- Create path from items.
			-- (without handling URL encoding)
		require
			has_path: has_path
		local
			a_cursor: DS_LINEAR_CURSOR [STRING]
			a_first_done: BOOLEAN
		do
			create Result.make_empty
			from
				a_cursor := path_items.new_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				if a_first_done or has_absolute_path then
					Result.append_character ('/')
				end
				a_first_done := True
				Result := STRING_.appended_string (Result, a_cursor.item)
				a_cursor.forth
			end
		ensure
			result_not_void: Result /= Void
			separator_numbers: Result.occurrences ('/') >= path_items.count - 1
		end

	query: STRING
			-- Anything after the '?' if present, else Void

	fragment: STRING
			-- The part after the '#' if present, else Void


feature -- If authority is <userinfo>@<host>:<port>

	user_info: STRING
			-- Usually a user name.

	host_port: UT_HOST_PORT
			-- Hostname and port number.

	has_parsed_authority: BOOLEAN is
			-- Has authority part been parsed?
		do
			Result := host_port /= Void
		ensure
			host_port_not_void: Result implies host_port /= Void
		end

	has_user_info: BOOLEAN is
			-- Is the user information part of authority set?
		require
			has_parsed_authority: has_parsed_authority
		do
			Result := user_info /= Void
		ensure
			user_info_not_void: Result implies user_info /= Void
		end
		
	is_server_authority: BOOLEAN is
			-- True if authority can be parsed as:
			-- [ userinfo '@' ] host [ ':' port ]
			-- and port, if present, is an integer.
		local
			p: INTEGER
		do
			Result := authority /= Void and then not authority.is_empty
			if Result then
				p := authority.index_of ('@', 1)
				Result := is_valid_host_port (authority.substring (p + 1, authority.count))
			end
		end
				
	parse_authority (default_port: INTEGER) is
			-- Parse authority of that form:
			-- [ userinfo '@' ] host [ ':' port ].
			-- `default_port' = 0 means no default.
		require
			valid_default_port: default_port >= 0 and default_port <= 65535
			valid_authority: is_server_authority
		local
			p: INTEGER
			user_info_present: BOOLEAN
		do
				-- Scan for userinfo
			p := authority.index_of ('@', 1)
			user_info_present := p > 1
			if user_info_present then
				user_info := authority.substring (1, p - 1)
			end

				-- host_port is remainder of authority
			if p = 0 then
				create host_port.make (authority, default_port)
			else
				check valid_authority_implies: p + 1 < authority.count end
				create host_port.make (authority.substring (p + 1, authority.count), default_port)
			end
		ensure
			has_parsed_authority: has_parsed_authority
			user_info_occurs_in_authority: user_info /= Void implies STRING_.substring_index (authority, user_info, 1) = 1
			host_occurs_in_authority: STRING_.substring_index (authority, host, 1) /= 0
		end

	host: STRING is
			-- hostname or IP4 address (RFC2396) or IP6 addresses (RFC2732).
		require
			has_authority: has_parsed_authority
		do
			Result := host_port.host
		ensure
			result_not_void: Result /= Void
			definition: host = host_port.host
		end
		
	port: INTEGER is
			-- Service port number.
		require
			has_authority: has_parsed_authority
		do
			Result := host_port.port
		ensure
			definition: port = host_port.port
		end
		
feature -- Setting

	add_key_value (key, value: STRING) is
			-- Add a key=value pair to `query'. `value' is added in
			-- escaped form.
		require
			key_not_empty: key /= Void and then not key.is_empty
			key_has_no_invalid_characters: not uri_encoding.has_excluded_characters (key)
		do
			if query = Void then
				create query.make_from_string (key)
			else
				query.append_character ('&')
				query := STRING_.appended_string (query, key)
			end
			query.append_character ('=')
			if value /= Void and then not value.is_empty then
				query := STRING_.appended_string (query, uri_encoding.escape_string (value))
			end
			full_reference := new_full_reference
		end

	set_path (a_path: STRING) is
			-- Set `path'.
		require
			path_is_void_or_not_empty: a_path = Void or else not a_path.is_empty
			no_invalid_characters: not uri_encoding.has_excluded_characters (a_path)
		local
			a_splitter: ST_SPLITTER
		do
			create a_splitter.make
			a_splitter.set_separators ("/")
			
			if a_path.is_empty then
				has_absolute_path := False
				path_items := Void
			elseif a_path.item (1) = '/' then
				has_absolute_path := True
				create path_items.make_from_linear (a_splitter.split_character (a_path.substring (2, a_path.count)))
			else
				has_absolute_path := False
				create path_items.make_from_linear (a_splitter.split_character (a_path))
			end
			full_reference := new_full_reference
		ensure
			has_path: not a_path.is_empty implies has_path
			path_set: has_path implies STRING_.same_string (path, a_path)
		end

	set_query (a_query: STRING) is
			-- Set `query'.
		require
			a_query_is_void_or_not_empty: a_query = Void or else not a_query.is_empty
			no_crosshatch: a_query /= Void implies not a_query.has ('#')
			no_invalid_characters: not uri_encoding.has_excluded_characters (a_query)
		do
			query := a_query
			full_reference := new_full_reference
		ensure
			query_set: query = a_query or else STRING_.same_string (query, a_query)
		end

	unescape_components is
			-- Unescape the `path_items', `host' and `user_info' components.
		local
			i: INTEGER
		do
			if path_items /= Void then
				from
					i := 1
				until
					i > path_items.count
				loop
					path_items.put (uri_encoding.unescape_string (path_items.item (i)), i)
					i := i + 1
				end
			end
			if has_parsed_authority then
				host_port.set_host (uri_encoding.unescape_string (host_port.host))
				if has_user_info then
					user_info := uri_encoding.unescape_string (user_info)
				end
			end
		end

feature {NONE} -- Update cached attributes

	new_full_reference: STRING is
			-- Reconstruct full URI from components.
		do
			create Result.make_empty
			if is_absolute then
				Result := STRING_.appended_string (Result, scheme)
				Result.append_character (':')
			end
			if has_authority then
				Result.append_character ('/')
				Result.append_character ('/')
				Result := STRING_.appended_string (Result, authority)
			end
			if has_path then
				Result := STRING_.appended_string (Result, path)
			end
			if has_query then
				Result.append_character ('?')
				Result := STRING_.appended_string (Result, query)
			end
			if has_fragment then
				Result.append_character ('#')
				Result := STRING_.appended_string (Result, fragment)
			end
		ensure
			result_not_void: Result /= Void
		end
		
feature {NONE} -- URI parsing

	State_scheme: INTEGER is 1
	State_authority_prefix: INTEGER is 2
	State_authority: INTEGER is 3
	State_path: INTEGER is 4
	State_query: INTEGER is 5
	State_fragment: INTEGER is 6
			-- States uses in parsing the URI

	clear_url_parts is
			-- Reset all fields to their default state.
		do
			scheme := Void
			authority := Void
			path_items := Void
			query := Void
			fragment := Void
			user_info := Void
			host_port := Void
		end

	parse_reference is
			-- Parse reference according to RFC 2396.
		require
			have_reference: full_reference /= Void
		local
			i: INTEGER
			start: INTEGER
			c: CHARACTER
			state: INTEGER
		do
			clear_url_parts
			from
				start := 1
				state := State_scheme
				i := 1
			variant
				full_reference.count + 1 - i
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
						state := State_path -- match for : /:
						start := i
					when State_authority, State_path, State_query, State_fragment then
					end
				when '/' then
					inspect state
					when State_scheme then
						if i = start then
							has_absolute_path := True
							state := State_authority_prefix
						else
							stop_path_item (start, i)
							start := i + 1
							state := State_path
						end
					when State_authority_prefix then
						has_absolute_path := True
						if i > start then
							state := State_authority
						end
					when State_authority then
						stop_authority (start, i)
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
						stop_path_item (start, i)
					when State_authority_prefix then -- ? /?
						stop_path_item (i, i)
					when State_authority then
						stop_authority (start, i)
					when State_query, State_fragment then
					end
					start := i
					state := State_query
				when '#' then
					inspect state
					when State_scheme, State_path then
						stop_path_item (start, i)
					when State_authority_prefix then
						stop_path_item (i, i)
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
					when State_authority_prefix then -- match for /.
						start := i
						state := State_path
					else -- ok
					end
				end

				i := i + 1
			end

				-- Handle last part of string
			inspect state
			when State_scheme, State_authority_prefix, State_path then
				stop_path_item (start, i)
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

	stop_scheme (start, stop: INTEGER) is
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

	stop_authority (start, stop: INTEGER) is
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start)
			valid_authority:
				full_reference.item (start) = '/' and
				full_reference.item (start + 1) = '/'
			valid_stop: full_reference.valid_index (stop - 1)
			full_reference_contains_authority: start + 2 <= stop
		do
			authority := full_reference.substring (start+2, stop-1)
		ensure
			authority_set: authority /= Void
		end

	stop_path_item (start, stop: INTEGER) is
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start) or start = full_reference.count + 1
			valid_stop: stop > start implies full_reference.valid_index (stop-1)
		do
			if path_items = Void then
				create path_items.make_default
			end
			path_items.force_last (full_reference.substring (start, stop - 1))
		ensure
			--path_item_added: path_items.count = 1 + old (path_items.count), when path_items /= Void
		end
		
	stop_query (start, stop: INTEGER) is
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start)
			valid_query: full_reference.item (start) = '?'
			valid_stop: full_reference.valid_index (stop - 1)
			full_reference_contains_query: start + 1 <= stop
		do
			query := full_reference.substring (start + 1, stop - 1)
		ensure
			query_set: query /= Void
		end

	stop_fragment (start, stop: INTEGER) is
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start)
			valid_fragment: full_reference.item (start) = '#'
			valid_stop: full_reference.valid_index (stop - 1)
			full_reference_contains_fragment: start + 1 <= stop
		do
			fragment := full_reference.substring (start + 1, stop - 1)
		ensure
			fragment_set: fragment /= Void
		end


feature {NONE} -- Resolve a relative-path reference

	resolve_path (a_base: UT_URI) is
			-- Resolve path according to rfc2396bis. Abnormal cases are
			-- compensated for.
		require
			a_base_path_not_void: a_base /= Void
			something_to_resolve: a_base.has_path
			-- `path' is relative
		local
			some_items: like path_items
			segment: STRING
			a_cursor: DS_LIST_CURSOR [STRING]
		do
				-- See rfc2396, section 5.2 step 6 for an implementation
				-- I use a different one
			
				-- Resolved path is absolute
			has_absolute_path := True

				-- Path items
			create some_items.make_from_linear (a_base.path_items)
			
			if has_path and not (path_items.count = 1 and then path_items.first.is_empty) then

				-- All but the last segment of the base URI's path component is
				-- copied to the buffer.  In other words, any characters after the
				-- last (right-most) slash character, if any, are excluded.
				some_items.remove_last

				from
					a_cursor := path_items.new_cursor
					a_cursor.start
				until
					a_cursor.after
				loop
					segment := a_cursor.item
					if is_dot (segment) then
							-- Do nothing
					elseif is_dot_dot (segment) then
							-- Back one level
						if not some_items.is_empty then
							some_items.remove_last
						end
					else
							-- Add segment
						some_items.force_last (segment)
					end
					a_cursor.forth
				end

					-- Make sure we have empty segment (/) at the end if needed
				if path_items.count > 0 then
					segment := path_items.last
					if segment.is_empty or is_dot (segment) or is_dot_dot (segment) then
						some_items.force_last ("")
					end
				end

					-- Remove empty segments except the last one
				from
					a_cursor := some_items.new_cursor
					a_cursor.start
				until
					a_cursor.after
				loop
					segment := a_cursor.item
					a_cursor.forth
					if segment.is_empty and not a_cursor.after then
						a_cursor.back
						a_cursor.remove
					end
				end
			end
			
			path_items := some_items
		ensure
			absolute: has_absolute_path
			path_resolved: is_path_resolved
		end
	
	is_dot (a_string: STRING): BOOLEAN is
			-- Is '.'?
		require
			a_string_not_void: a_string /= Void
		do
			Result := a_string.count = 1 
				and then a_string.item (1) = '.'
		ensure
			definition: Result = STRING_.same_string (a_string, ".")
		end
		
	is_dot_dot (a_string: STRING): BOOLEAN is
			-- Is '..'?
		require
			a_string_not_void: a_string /= Void
		do
			Result := a_string.count = 2 
				and then a_string.item (1) = '.'
				and then a_string.item (2) = '.'
		ensure
			definition: Result = STRING_.same_string (a_string, "..")
		end

feature -- Encoding

	uri_encoding: UT_URL_ENCODING is
			-- Encoding/decoding routines and tests,
			-- exported for contract checking.
		once
			create Result
		ensure
			uri_encoding_not_void: Result /= Void
		end

invariant

	either_absolute_or_relative: is_absolute xor is_relative
	full_reference_not_empty: full_reference /= Void and then not full_reference.is_empty
	full_reference_is_valid: not uri_encoding.has_excluded_characters (full_reference)

		-- Constraints on elements of a parsed URI.
	valid_authority: authority /= Void implies (not authority.has ('/') and not authority.has ('?') and not authority.has ('#'))
	--valid_path: has_path implies (not path.item.has ('?') and not path.item.has ('#'))
	valid_query: query /= Void implies not query.has ('#')
	vaid_fragment: fragment /= Void implies not fragment.has ('#')

		-- Contraints on parsed `authority'
	user_info_occurs_in_authority: user_info /= Void implies STRING_.substring_index (authority, user_info, 1) /= 0
	host_occurs_in_authority: has_parsed_authority implies STRING_.substring_index (authority, host_port.host, 1) /= 0

end
