note

	description:

		"Set of predefined values for LS_POISITION_ENCODING_KIND"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_POSITION_ENCODING_KINDS

feature -- Access

	utf8: LS_POSITION_ENCODING_KIND
			-- Character offsets count UTF-8 code units (e.g bytes)
		local
			l_string: LS_STRING
		once
			l_string := "utf-8"
			Result := l_string
		ensure
			utf8_not_void: Result /= Void
			instance_free: class
		end

	utf16: LS_POSITION_ENCODING_KIND
			-- Character offsets count UTF-16 code units.
			--
			-- This is the default and must always be supported
			-- by servers.
		local
			l_string: LS_STRING
		once
			l_string := "utf-16"
			Result := l_string
		ensure
			utf8_not_void: Result /= Void
			instance_free: class
		end

	utf32: LS_POSITION_ENCODING_KIND
			-- Character offsets count UTF-32 code units.
			-- 
			-- Implementation note: these are the same as Unicode code points,
			-- so this `PositionEncodingKind` may also be used for an
			-- encoding-agnostic representation of character offsets.
		local
			l_string: LS_STRING
		once
			l_string := "utf-32"
			Result := l_string
		ensure
			utf8_not_void: Result /= Void
			instance_free: class
		end

end
