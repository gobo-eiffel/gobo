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
			-- Step 1:

			if is_relative then
				-- Resolve stuff from `base' we don't have

					check
						scheme_empty: scheme = Void
					end

				-- Step 2:
				if scheme = Void and authority = Void and path = Void and query = Void then
					scheme := base.scheme
					authority := base.authority
					path := base.path

				else
					-- Step 3:
					scheme := base.scheme

					if authority = Void then
						authority := base.authority
						if not has_absolute_path then
							-- To resolve
							if path = Void then
								-- 1. we don't have a path, use path of parent, if any
								path := clone (base.path)
							elseif base.path = Void then
								-- 2. Parent doesn't have a path, make our path absolute
								path.insert_character ('/', 1)
									check
										absolute: has_absolute_path
									end
							else
								-- 3. Something to resolve
								resolve_path (base.path)
							end
						end
					end
				end

				-- Build `reference' from parsed components
				create full_reference.make_empty
				full_reference := STRING_.appended_string (full_reference, scheme)
				full_reference.append_character (':')
				if authority /= Void then
					full_reference := STRING_.appended_string (full_reference, "//")
					full_reference := STRING_.appended_string (full_reference, authority)
				end
				if path /= Void then
					-- path is void for relative //g
					full_reference := STRING_.appended_string (full_reference, path)
				end
				if query /= Void then
					full_reference.append_character ('?')
					full_reference := STRING_.appended_string (full_reference, query)
				end
				if fragment /= Void then
					full_reference.append_character ('#')
					full_reference := STRING_.appended_string (full_reference, fragment)
				end

			end
		ensure
			must_be_absolute: is_absolute
			a_reference_resolved_if_not_absolute:
				not a_reference.is_empty and then a_reference.item (1) /= '/' implies
					path = Void or else
					is_path_resolved
		end


feature -- Status

	is_absolute: BOOLEAN is
			-- Does this URI have a scheme?
		do
			Result := scheme /= Void
		ensure
			consistent: Result implies not is_relative
		end

	is_path_resolved: BOOLEAN is
			-- Does `path' not contain relative components like ".."?
		require
			path_not_void: path /= Void
		do
			Result :=
				not STRING_.has_substring (path, "/../") and then
				(path.count < 2 or else path.item (1) /= '.' or else path.item (2) /= '/') and then
				(path.count < 2 or else path.item (path.count) /= '/' or else path.item (path.count - 1) /= '.')
		end

	is_relative: BOOLEAN is
			-- Is this a relative URI?
			-- A relative uri is a URI without `scheme'.
		do
			Result := scheme = Void
		ensure
			consistent: Result implies not is_absolute
		end

	has_absolute_path: BOOLEAN is
			-- Has this URI a path and does this path start with a slash?
		do
			Result :=
				path /= Void and then
				path.item (1) = '/'
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


feature -- Most generic URI components

	full_reference: STRING
			-- The entire URI.

	has_valid_scheme: BOOLEAN is
			-- Is scheme set and containing valid characters?
		do
			Result := scheme /= Void and then uri_encoding.is_valid_scheme (scheme)
		ensure
			valid_scheme_not_void: Result implies scheme /= Void
			valid_scheme_characters: Result implies uri_encoding.is_valid_scheme (scheme)
		end
	
	scheme: STRING
			-- Scheme used, like "http" or "ftp", anything before the ':'.

	scheme_specific_part: STRING
			-- Interpretation depends on scheme, everything after the ':'
			-- and before the '?'

feature -- Access

	has_authority: BOOLEAN is
			-- Is `authority' present?
		do
			Result := authority /= Void
		ensure
			result_implies_not_void: Result implies authority /= Void
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

	path: STRING
			-- Path in `scheme_specific_part', consisting of names
			-- separated by slashes.

	query: STRING
			-- Anything after the '?' if present, else Void

	fragment: STRING
			-- The part after the '#' if present, else Void


feature -- If authority is <userinfo>@<host>:<port>

	user_info: STRING
			-- Usually a user name.

	host: STRING
			-- hostname or IP4 address. IP6 addresses are explicitly not
			-- supported by RFC 2396

	port: INTEGER
			-- TCP port, 0 if no port present.

	is_server_authority: BOOLEAN is
			-- True if authority can be parsed as:
			-- [ userinfo '@' ] host [ ':' port ]
			-- and port, if present, is an integer.
		local
			p, q: INTEGER
			has_host: BOOLEAN
			a_port: STRING
		do
			Result := authority /= Void and then not authority.is_empty
			if Result then
				p := authority.index_of ('@', 1)
				q := authority.index_of (':', p + 1)
				has_host :=
					(q = 0 implies authority.count - p > 0) or else
					(q - p > 0)
				Result := has_host
				if Result and then q /= 0 and then q < authority.count then
					a_port := authority.substring (q + 1, authority.count)
					Result := authority.substring (q + 1, authority.count).is_integer
					if Result then
						Result := a_port.to_integer <= 65535 and a_port.to_integer >= 0
					end
				end
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
			host_port: STRING
			s: STRING
			user_info_present: BOOLEAN
		do
			-- scan for userinfo
			p := authority.index_of ('@', 1)
			user_info_present := p > 1
			if user_info_present then
				user_info := authority.substring (1, p - 1)
			end

			-- host_port is remainder of authority
			if p = 0 then
				host_port := authority
			else
				check valid_authority_implies: p + 1 < authority.count end
				host_port := authority.substring (p + 1, authority.count)
			end
				check
					host_port_set_correctly: host_port /= Void implies host_port.count = authority.count - p
				end

			-- scan for port
			p := host_port.index_of (':', 1)
			if p = 0 then
				create host.make_from_string (host_port)
				port := default_port
			else
				check valid_authority_implies_host_not_empty: p /= 1 end
				host := host_port.substring (1, p - 1)
				if p = host_port.count then
					port := default_port
				else
					s := host_port.substring (p + 1, host_port.count)
					check 
						valid_authority_implies_integer: s.is_integer
						valid_authority_implies_positive: s.to_integer >= 0
						valid_authority_implies_maximukm: s.to_integer <= 65535
					end
					port := s.to_integer
				end
			end
		ensure
			user_info_occurs_in_authority: user_info /= Void implies STRING_.substring_index (authority, user_info, 1) /= 0
			host_not_void: host /= Void
			host_occurs_in_authority: host /= Void implies STRING_.substring_index (authority, host, 1) /= 0
		end


feature -- Set url components

	add_key_value (key, value: STRING) is
			-- Add a key=value pair to `query'. `value' is adding in
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
			set_full_reference
		end

	set_path (a_path: STRING) is
			-- Set `path'.
		require
			path_is_void_or_not_empty: a_path = Void or else not a_path.is_empty
			no_invalid_characters: not uri_encoding.has_excluded_characters (a_path)
		do
			path := a_path
			set_full_reference
		ensure
			path_set: path = a_path or else STRING_.same_string (path, a_path)
		end

	set_query (a_query: STRING) is
			-- Set `query'.
		require
			a_query_is_void_or_not_empty: a_query = Void or else not a_query.is_empty
			no_crosshatch: a_query /= Void implies not a_query.has ('#')
			no_invalid_characters: not uri_encoding.has_excluded_characters (a_query)
		do
			query := a_query
			set_full_reference
		ensure
			query_set: query = a_query or else STRING_.same_string (query, a_query)
		end

	unescape_components is
			-- Unescape the `path', `host' and `user_info' components.
		do
			if path /= Void then
				path := uri_encoding.unescape_string (path)
			end
			if host /= Void then
				host := uri_encoding.unescape_string (host)
			end
			if user_info /= Void then
				user_info := uri_encoding.unescape_string (user_info)
			end
		end


feature {NONE} -- Update cached attributes

	set_full_reference is
			-- Reconstruct `full_reference' and `scheme_specific_part'
			-- from individual components.
		do
			create full_reference.make (32)
			create scheme_specific_part.make (32)
			if scheme /= Void then
				full_reference := STRING_.appended_string (full_reference, scheme)
				full_reference.append_character (':')
			end
			if authority /= Void then
				scheme_specific_part := STRING_.appended_string (scheme_specific_part, authority)
			end
			if path /= Void then
				scheme_specific_part := STRING_.appended_string (scheme_specific_part, path)
			end
			if query /= Void then
				scheme_specific_part.append_character ('?')
				scheme_specific_part := STRING_.appended_string (scheme_specific_part, query)
			end
			if fragment /= Void then
				scheme_specific_part.append_character ('#')
				scheme_specific_part := STRING_.appended_string (scheme_specific_part, fragment)
			end
			full_reference := STRING_.appended_string (full_reference, scheme_specific_part)
		end


feature {NONE} -- URI parsing

	State_scheme: INTEGER is 1
	State_authority: INTEGER is 2
	State_path: INTEGER is 3
	State_query: INTEGER is 4
	State_fragment: INTEGER is 5
			-- States uses in parsing the URI

	clear_url_parts is
			-- Reset all fields to their default state.
		do
			scheme := Void
			authority := Void
			path := Void
			query := Void
			fragment := Void
			user_info := Void
			host := Void
			port := 0
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
			something_left_to_parse: BOOLEAN
		do
			clear_url_parts
			from
				start := 1
				state := State_scheme
				i := 1
			variant
				(full_reference.count + 1) - i
			until
				i > full_reference.count
			loop
				c := full_reference.item (i)

				-- switch to next state when char encountered that is
				-- forbidden in state.
				-- If `c' is a valid start character for a state is
				-- checked in the next block
				inspect c
				when ':' then
					if state = State_scheme then
						stop_scheme (start, i)
						start := i + 1
						i := i + 1
						c := full_reference.item (i)
						state := State_authority
					end
				when '/' then
					inspect state
					when State_scheme then
						if i = start then
							state := State_authority
						else
							state := State_path
						end
					when State_authority then
						if i > start + 1 then
							stop_authority (start, i)
							start := i
							state := State_path
						end
					else -- ok
					end
				when '?' then
					inspect state
					when State_scheme then
						stop_path (start, i)
					when State_authority then
						if i = start + 1 then
							stop_path (start, i) -- match for /?
						elseif i > start + 1 then
							stop_authority (start, i)
						end
					when State_path then
						if i > start then
							stop_path (start, i)
						end
					else -- ok
					end
					start := i
					state := State_query
				when '#' then
					inspect state
					when State_scheme then
						stop_path (start, i)
					when State_authority then
						if i = start + 1 then
							stop_path (start, i) -- match for /#
						elseif i > start + 1 then
							stop_authority (start, i)
						end
					when State_path then
						stop_path (start, i)
					when State_query then
						stop_query (start, i)
					else -- ok
					end
					start := i
					state := State_fragment
				else -- ok
				end

				-- check here required start characters for a state
				-- move to next state if mismatch
				if state = State_authority then
					-- check if started with //
					if c /= '/' and i < start + 2 then
						state := State_path
					end
				end

				if state = State_path then
					-- check if started with /
					if i = start and (c = '?' or c = '#') then
						state := State_query
					end
				end

				if state = State_query then
					-- check if started with ?
					if c /= '?' and i = start then
						state := State_fragment
					end
				end

				if state = State_fragment then
					-- check if started with #
					if c /= '#' and i = start then
						-- what?? probably not parseable
					end
				end

				i := i + 1
			end

			-- handle last part of string
			something_left_to_parse := start < i
			if something_left_to_parse then
				inspect state
				when State_scheme then
					stop_path (start, i)
				when State_authority then
					if i = start + 1 then
						stop_path (start, i) -- got only a '/'
					elseif i > start + 1 then
						stop_authority (start, i)
					end
				when State_path then
					stop_path (start, i)
				when State_query then
					stop_query (start, i)
				when State_fragment then
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
			scheme_specific_part := full_reference.substring (stop + 1, full_reference.count)
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

	stop_path (start, stop: INTEGER) is
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start)
			valid_stop: stop > start implies full_reference.valid_index (stop-1)
		do
			if stop > start then
				path := full_reference.substring (start, stop-1)
			end
		ensure
			conditional_path_set: stop > start implies path /= Void and then not path.is_empty
			conditional_path_not_set: stop <= start implies path = Void
		end

	stop_query (start, stop: INTEGER) is
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start)
			valid_query: full_reference.item (start) = '?'
			valid_stop: full_reference.valid_index (stop - 1)
			full_reference_contains_query: start + 1 <= stop - 1
		do
			query := full_reference.substring (start + 1, stop-1)
		ensure
			query_set: query /= Void and then not query.is_empty
		end

	stop_fragment (start, stop: INTEGER) is
			-- Start is inclusive, stop is exclusive.
		require
			valid_start: full_reference.valid_index (start)
			valid_fragment: full_reference.item (start) = '#'
			valid_stop: full_reference.valid_index (stop - 1)
			full_reference_contains_fragment: start + 1 <= stop - 1
		do
			fragment := full_reference.substring (start + 1, stop-1)
		ensure
			fragment_set: fragment /= Void and then not fragment.is_empty
		end


feature {NONE} -- Resolve a relative-path reference

	resolve_path (base: STRING) is
			-- Resolve path according to rfc2396bis. Abnormal cases are
			-- compensated for.
		require
			base_path_not_void: base /= Void
			something_to_resolve: path /= Void
			-- `path' is relative
		local
			base_paths: DS_LIST [STRING]
			relative_paths: DS_LIST [STRING]
			segment: STRING
			a_cursor: DS_LINEAR_CURSOR [STRING]
			a_splitter: ST_SPLITTER
		do
			-- See rfc2396, section 5.2 step 6 for an implementation
			-- I use a different one

			create a_splitter.make
			a_splitter.set_separators ("/")
			base_paths := a_splitter.split_character (base)
			relative_paths := a_splitter.split_character (path)

			-- All but the last segment of the base URI's path component is
			-- copied to the buffer.  In other words, any characters after the
			-- last (right-most) slash character, if any, are excluded.

			from
				base_paths.remove_last
				a_cursor := relative_paths.new_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				segment := a_cursor.item
				if segment.is_empty or is_dot (segment) then
					-- do nothing
				elseif is_dot_dot (segment) then
					-- back one level
					if not base_paths.is_empty then
						base_paths.remove_last
					end
				else
					-- add segment
					base_paths.force_last (segment)
				end
				a_cursor.forth
			end

			-- build path, skip empty segments (just /'s)
			create path.make (base.count)
			from
				a_cursor := base_paths.new_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				segment := a_cursor.item
				if not segment.is_empty then
					path.append_character ('/')
					path := STRING_.appended_string (path, segment)
				end
				a_cursor.forth
			end

			-- make sure we have a / at the end if needed
			
			if relative_paths.count > 0 then
				segment := relative_paths.last --item (relative_paths.count - 1)
				if segment.is_empty or is_dot (segment) or is_dot_dot (segment) then
					path.append_character ('/')
				end
			end
		ensure
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

invariant

	scheme_void_or_not_empty: scheme = Void or else not scheme.is_empty

	either_absolute_or_relative: is_absolute xor is_relative
	full_reference_not_empty: full_reference /= Void and then not full_reference.is_empty
	full_reference_is_valid: not uri_encoding.has_excluded_characters (full_reference)

-- I'm really unsure if these constraints hold for deliberate garbage...

	-- Constraints on elements of a parsed URI.
	path_void_or_not_empty: path = Void or else not path.is_empty
	valid_path: path /= Void implies not (path.has ('?') or path.has ('#'))
	query_void_or_not_empty: query = Void or else not query.is_empty
	valid_query: query = Void or else not query.has ('#')
	fragment_void_or_not_empty: fragment = Void or else not fragment.is_empty
	vaid_fragment: fragment = Void or else not fragment.has ('#')

	-- Contraints on parsed `authority'
	user_info_occurs_in_authority: user_info /= Void implies STRING_.substring_index (authority, user_info, 1) /= 0
	host_occurs_in_authority: host /= Void implies STRING_.substring_index (authority, host, 1) /= 0
	valid_port: port >= 0 and port <= 65535

end
