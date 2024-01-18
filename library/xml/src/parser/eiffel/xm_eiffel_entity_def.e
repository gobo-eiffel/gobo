note

	description:

		"Entity definition and scanner"

	remark:

		"This class represents an entity name/type and also a scanner for this %
		%entity. The two concepts could be distinct, but this helps enforcing %
		%the property that an entity cannot be recursively included, as the %
		%scanner can be checked for being in use if the entity is recursively %
		%included. This is not really a is-a relationship though."

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"

class XM_EIFFEL_ENTITY_DEF

inherit

	HASHABLE

	XM_EIFFEL_SCANNER
		redefine
			reset, read_token,
			normalized_newline,
			has_normalized_newline
		end

	UC_IMPORTED_UTF8_ROUTINES
		export {NONE} all end

create

	make_literal,
	make_external,
	make_def

feature {NONE} -- Initialization

	make_literal (a_name: STRING; a_value: STRING)
			-- Create a new literal entity definition from `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		do
			literal_name := a_name
			value := a_value
			make_scanner
			create {XM_NULL_EXTERNAL_RESOLVER} resolver
		ensure
			is_literal: is_literal
			value_set: value = a_value
		end

	make_external (a_resolver: like resolver; an_id: like external_id)
			-- Create a new external entity definition from `a_value'.
		require
			a_resolver_not_void: a_resolver /= Void
			an_id_not_void: an_id /= Void
		do
			resolver := a_resolver
			external_id := an_id
			make_scanner
		ensure
			is_external: is_external
			value_set: value = Void and literal_name = Void
			external_id_set: external_id = an_id
			resolver_set: resolver = a_resolver
		end

	make_def (other: XM_EIFFEL_ENTITY_DEF)
			-- Create a new entity definition from `other'.
		require
			other_not_void: other /= Void
		do
			if attached other.external_id as l_external_id then
				check is_external: other.is_external end
				make_external (other.resolver, l_external_id)
			else
				check is_literal: attached other.literal_name as l_literal_name and attached other.value as l_value then
					make_literal (l_literal_name, l_value)
				end
			end
		ensure
			is_external: is_external = other.is_external
			is_literal: is_literal = other.is_literal
			value_set: value = other.value
		end

feature -- Resolver

	resolver: XM_EXTERNAL_RESOLVER

feature -- Status report

	is_external: BOOLEAN
			-- Is current entity an external entity?
		do
			Result := external_id /= Void
		end

	is_literal: BOOLEAN
			-- Is current entity a literal entity?
		do
			Result := not is_external
		ensure
			definition: Result = not is_external
		end

feature -- Access

	literal_name: detachable STRING
			-- Literal entity name

	value: detachable STRING
			-- Literal entity value

	external_id: detachable XM_DTD_EXTERNAL_ID
			-- Resolve external value.

	hash_code: INTEGER
			-- Hash code value
			-- (on the entity name aspect)
		do
			if attached value as l_value then
				Result := l_value.hash_code
			elseif attached external_id as l_external_id then
				Result := l_external_id.hash_code
			end
		end

feature -- Scanner: set input buffer

	apply_input_buffer
			-- Set input buffer.
		local
			str_stream: KL_STRING_INPUT_STREAM
		do
			if in_use then
				fatal_error (Error_recursive_entity)
			elseif attached literal_name as l_literal_name and attached value as l_value then
					-- Literal string.
				check literal_string: is_literal end
				reset
				-- the value we get may be UC_STRING, so it must be
				-- converted back to UTF8 for the scanner which operates
				-- on UTF8-in-STRING input
				create str_stream.make (utf8.to_utf8 (l_value))
				set_input_stream (str_stream)
				input_name := l_literal_name
			elseif attached external_id as l_external_id and then attached l_external_id.system_id as l_system_id then
					-- External entity in a file.
				check external_entity: is_external end
				reset
				if attached l_external_id.public_id as l_public_id then
					check is_public: l_external_id.is_public end
					resolver.resolve_public (l_public_id, l_system_id)
				else
					resolver.resolve (l_system_id)
				end
				if attached resolver.last_error as l_last_error then
					check has_error: resolver.has_error end
					fatal_error (l_last_error)
				else
					set_input_from_resolver (resolver)
					-- `has_error'/`last_error' set by `set_input_file'.
				end
			else
				fatal_error ("Internal error")
			end
		end

feature {NONE} -- Newline normalization

	normalized_newline: STRING
			-- Newline normalized text (2.11)
		do
				-- Newline normalization has already been applied
				-- to a literal entity and should not be applied
				-- again, e.g. for literal entities which contain
				-- character entities of newline characters which
				-- should get out as is.
			if is_literal then
				Result := text
			else
				Result := Precursor
			end
		end

	has_normalized_newline: BOOLEAN
			-- Has newline normalization already been applied?
		do
				-- Newline normalization has already been applied
				-- to a literal entity and should not be applied
				-- again, e.g. for literal entities which contain
				-- character entities of newline characters which
				-- should get out as is.
			Result := is_literal
		end

feature -- Scanner: events

	in_use: BOOLEAN
			-- Has the first token been processed?

	read_token
			-- Ignore XML declaration that may be at the start of an external entity.
			-- Also that places the content of an external DTD within
			-- a (DOCTYPE_DECL_START, DOCTYPE_DECL_END) token pair.
		local
			done: BOOLEAN
			enc_count, vers_count: INTEGER
			wait_eq: BOOLEAN
		do
			Precursor
			if not in_use then
					-- Processing on first token read.
				in_use := True
				if is_external and last_token = XMLDECLARATION_START then
						-- Micro parser to skip xml declaration.
					from until
						end_of_file or done
					loop
						Precursor
						if last_token = XMLDECLARATION_ENCODING then
							enc_count := enc_count + 1
							wait_eq := True
						elseif last_token = XMLDECLARATION_VERSION then
							vers_count := vers_count + 1
							wait_eq := True
						elseif last_token = EQ then
							done := not wait_eq -- Unexpected EQ: exit and error
							wait_eq := False
						elseif last_token = SPACE then
							-- Continue.
						elseif last_token = APOS or last_token = QUOT
							or last_token = XMLDECLARATION_ENCODING_VALUE
							or last_token = XMLDECLARATION_VERSION_10
						then
							-- Continue.
							wait_eq := False
						elseif last_token = XMLDECLARATION_END then
							if enc_count = 1 and vers_count <= 1 then
									-- Valid, skip this else leave for error.
								Precursor
							end
							done := True
						else
								-- Exit and error.
							done := True
						end
					end
				end
			end
				-- Reset in use flag.
			if end_of_file then
				in_use := False
			end
		end

feature -- Scanner: initialization

	reset
			-- Reset first seen status.
		do
			Precursor
			in_use := False
		end

invariant

	value_not_void: value /= Void or external_id /= Void
	value_name_void_consistent: (value = Void) = (literal_name = Void)
	resolver_not_void: resolver /= Void
	type: is_literal xor is_external

end
