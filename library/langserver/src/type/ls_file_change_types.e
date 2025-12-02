note

	description:

		"Set of predefined values for LS_FILE_CHANGE_TYPE"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_FILE_CHANGE_TYPES

feature -- Access

	created: LS_FILE_CHANGE_TYPE
			-- The file got created.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			created_not_void: Result /= Void
			instance_free: class
		end

	changed: LS_FILE_CHANGE_TYPE
			-- The file got changed.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 2
			Result := l_integer
		ensure
			changed_not_void: Result /= Void
			instance_free: class
		end

	deleted: LS_FILE_CHANGE_TYPE
			-- The file got deleted.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 3
			Result := l_integer
		ensure
			deleted_not_void: Result /= Void
			instance_free: class
		end

end
