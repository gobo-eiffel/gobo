note

	description:

		"Eiffel closures with components common to once routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ONCE_ROUTINE_CLOSURE

inherit

	ET_INTERNAL_ROUTINE_CLOSURE
		redefine
			is_once,
			is_once_per_process,
			is_once_per_thread,
			is_once_per_object
		end

	ET_SHARED_STANDARD_ONCE_KEYS
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

feature -- Status report

	is_once: BOOLEAN = True
			-- Is current routine a once feature?

	is_once_per_process: BOOLEAN
			-- Is current once routine a once-per-process?
		do
			if attached keys as l_keys then
				Result := standard_once_keys.has_process_key (l_keys)
			elseif attached first_note as l_note then
				Result := l_note.has_tagged_note_term_value (tokens.once_note_tag, tokens.global_once_note_value)
			end
		end

	is_once_per_thread: BOOLEAN
			-- Is current once routine a once-per-thread?
		do
			if attached keys as l_keys then
				Result := standard_once_keys.has_thread_key (l_keys)
			elseif attached first_note as l_note then
				if l_note.has_tagged_note_term_value (tokens.once_note_tag, tokens.thread_once_note_value) then
					Result := True
				elseif not l_note.has_note_term_with_tag (tokens.once_note_tag) then
						-- Once-per-thread by default.
					Result := True
				end
			else
					-- Once-per-thread by default.
				Result := True
			end
		end

	is_once_per_object: BOOLEAN
			-- Is current once routine a once-per-object?
		do
			Result := attached keys as l_keys and then standard_once_keys.has_object_key (l_keys)
		end

feature -- Access

	keys: detachable ET_MANIFEST_STRING_LIST
			-- Once keys

feature -- Setting

	set_keys (a_keys: like keys)
			-- Set `keys' to `a_keys'.
		do
			keys := a_keys
		ensure
			keys_set: keys = a_keys
		end

end
