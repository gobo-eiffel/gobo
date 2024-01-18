note

	description:

		"Interface for external resolver of system entities"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"

deferred class XM_EXTERNAL_RESOLVER

feature -- Action(s)

	resolve (a_system: STRING)
			-- Resolve a system identifier to an input stream
			-- on behalf of an XML parser.
		require
			a_system_not_void: a_system /= Void
		deferred
		ensure
			stream_open_on_success: attached last_stream as l_last_stream implies l_last_stream.is_open_read
			--depth: not has_error implies resolve_depth = old resolve_depth + 1
		end

	resolve_public (a_public: STRING; a_system: STRING)
			-- Resolve a public/system identified pair to an input stream.
			-- (Default implementation: resolve using system ID only.)
		require
			a_public_not_void: a_public /= Void
			a_system_not_void: a_system /= Void
		do
			resolve (a_system)
		ensure
			stream_open_on_success: attached last_stream as l_last_stream implies l_last_stream.is_open_read
			--depth: not has_error implies resolve_depth = old resolve_depth + 1
		end

	resolve_finish
			-- The parser has finished with the last resolved entity.
			-- The previously resolved entity becomes the last resolved one.
			-- Note: `last_stream' is not required to be restored accordingly.
		require
			--balanced: resolve_depth > 0
		do
		ensure
			--depth: resolve_depth = old resolve_depth - 1
		end

feature -- Result

	last_stream: detachable KI_CHARACTER_INPUT_STREAM
			-- Last stream initialised from external entity.
		deferred
		end

	has_error: BOOLEAN
			-- Did the last resolution attempt succeed?
		deferred
		end

	last_error: detachable STRING
			-- Last error message.
		deferred
		end

invariant

	has_error: has_error implies last_error /= Void
	has_no_error: not has_error implies last_stream /= Void

end
