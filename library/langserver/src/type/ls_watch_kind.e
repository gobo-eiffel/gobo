note

	description:

		"LSP file event types"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_WATCH_KIND

inherit

	LS_ANY

feature -- Access

	value: NATURAL_32
			-- Unsigned integer value
		deferred
		end

	bit_or alias "|" (other: LS_WATCH_KIND): LS_WATCH_KIND
			-- Bitwise or between Current and `other`.
		require
			other_not_void: other /= Void
		local
			l_uinteger: LS_UINTEGER
		do
			l_uinteger := value | other.value
			Result := l_uinteger
		ensure
			bit_or_not_void: Result /= Void
		end

feature -- Status report

	has_create_value: BOOLEAN
			-- Interested in create events.
		do
			Result := (value & {LS_WATCH_KINDS}.create_.value) = {LS_WATCH_KINDS}.create_.value
		end

	has_change_value: BOOLEAN
			-- Interested in change events
		do	
			Result := (value & {LS_WATCH_KINDS}.change.value) = {LS_WATCH_KINDS}.change.value
		end

	has_delete_value: BOOLEAN
			-- Interested in delete events
		do
			Result := (value & {LS_WATCH_KINDS}.delete.value) = {LS_WATCH_KINDS}.delete.value
		end

end
