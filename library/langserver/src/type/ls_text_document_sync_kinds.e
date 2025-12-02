note

	description:

		"Set of predefined values for LS_TEXT_DOCUMENT_SYNC_KIND"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_SYNC_KINDS

feature -- Access

	none: LS_TEXT_DOCUMENT_SYNC_KIND
			-- Documents should not be synced at all.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 0
			Result := l_integer
		ensure
			none_not_void: Result /= Void
			instance_free: class
		end

	full: LS_TEXT_DOCUMENT_SYNC_KIND
			-- Documents are synced by always sending the full content
			-- of the document.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			full_not_void: Result /= Void
			instance_free: class
		end

	incremental: LS_FILE_CHANGE_TYPE
			-- Documents are synced by sending the full content on open.
			-- After that only incremental updates to the document are
			-- sent.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 2
			Result := l_integer
		ensure
			incremental_not_void: Result /= Void
			instance_free: class
		end

end
