indexing

	description: 

		"Entity definition and scanner"

	note:

		"This class represents an entity name/type and also a scanner for this %
		%entity. The two concepts could be distinct, but this helps enforcing %
		%the property that an entity cannot be recursively included, as the %
		%scanner can be checked for being in use if the entity is recursively %
		%included. This is not really a is-a relationship though."

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XF_ENTITY_DEF

inherit

	HASHABLE

	XF_FULL_SCANNER
		redefine
			reset,
			read_token
		end

creation

	make_literal,
	make_external,
	make_def

feature {NONE} -- Creation

	make_literal (a: STRING) is
			-- Literal.
		require
			not_void: a /= Void
		do
			value := a
			make_scanner
		end

	make_external (a: STRING) is
			-- External.
		require
			not_void: a /= Void
		do
			is_external := True
			value := a
			make_scanner
		end

	make_def (a: XF_ENTITY_DEF) is
			-- Make from other.
		require
			not_void: a /= Void
		do
			if a.is_external then
				make_external (a.value)
			else
				make_literal (a.value)
			end
		end

feature -- Access

	is_external: BOOLEAN
			-- Is this an external entity.

	is_literal: BOOLEAN is
			-- Is this a literal entity.
		do
			Result := not is_external
		end

	value: STRING
			-- Value.

	external_value: STRING is
			-- Resolve external value.
			-- Place holder.
		require
			is_external: is_external
		do
			Result := value
		end

feature -- HASHABLE (on the entity name aspect)

	hash_code: INTEGER is
			-- Has
		do
			Result := value.hash_code // 2
			if is_external then
				Result := Result + 1
			end
		end

feature -- Scanner: set input buffer

	apply_input_buffer is
			-- Set input buffer
		do
			if in_use then
				fatal_error (Error_recursive_entity)
			elseif is_literal then
				-- literal string
				reset
				set_input_buffer (new_string_buffer (value))
			else
				-- external entity in a file
				reset
				set_input_file (external_value)
				-- has_error/last_error set by set_input_file
				if has_error then
					fatal_error (Error_entity_unresolved_external)
				end
			end
		end

feature -- Scanner: events

	in_use: BOOLEAN
			-- Has the first token been processed?

	read_token is
			-- Ignore XML declaration that may be at the start of am 
			-- external entity.
			-- Also  that places the content of an external 
			-- DTD within a (DOCTYPE_DECL_START, DOCTYPE_DECL_END)
			-- token pair.
		local
			done: BOOLEAN
			enc_count, vers_count: INTEGER
		do
			Precursor
			if not in_use then
				-- processing on first token read
				in_use := True
				if is_external and last_token = XMLDECLARATION_START then

					-- micro parser to skip xml declaration
					from until
						end_of_file or done
					loop
						Precursor
						if last_token = XMLDECLARATION_ENCODING then
							enc_count := enc_count + 1
						elseif last_token = XMLDECLARATION_VERSION then
							vers_count := vers_count + 1
						elseif last_token = SPACE then
							-- continue
						elseif last_token = XMLDECLARATION_END then
							if enc_count = 1 and vers_count <= 1 then
								-- valid, skip this else leave for error
								Precursor
							end
							done := True
						else
							done := True -- exit and error
						end
					end
				end
			end
			
			-- reset in use flag
			if end_of_file then
				in_use := False
			end
		end

	reset is
			-- Reset first seen status.
		do
			Precursor
			in_use := False
		end
		
invariant

	not_void: value /= Void
	type: is_literal xor is_external

end
