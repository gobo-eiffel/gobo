note

	description:

		"Set of predefined values for LS_WATCH_KIND"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WATCH_KINDS

feature -- Access

	create_: LS_WATCH_KIND
			-- Interested in create events.
		local
			l_uinteger: LS_UINTEGER
		once
			l_uinteger := create_value
			Result := l_uinteger
		ensure
			create_not_void: Result /= Void
			instance_free: class
		end

	change: LS_WATCH_KIND
			-- The file got changed.
		local
			l_uinteger: LS_UINTEGER
		once
			l_uinteger := change_value
			Result := l_uinteger
		ensure
			change_not_void: Result /= Void
			instance_free: class
		end

	delete: LS_WATCH_KIND
			-- The file got deleted.
		local
			l_uinteger: LS_UINTEGER
		once
			l_uinteger := delete_value
			Result := l_uinteger
		ensure
			delete_not_void: Result /= Void
			instance_free: class
		end

	create_value: NATURAL_32 = 1
			-- Interested in create events.

	change_value: NATURAL_32 = 2
			-- Interested in change events

	delete_value: NATURAL_32 = 4
			-- Interested in delete events

end
