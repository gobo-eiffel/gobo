note

	description:

		"Set of predefined values for LS_INSERT_TEXT_MODE"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INSERT_TEXT_MODES

feature -- Access

	as_is: LS_INSERT_TEXT_MODE
			-- The insertion or replace strings is taken as it is. If the
			-- value is multi line the lines below the cursor will be
			-- inserted using the indentation defined in the string value.
			-- The client will not apply any kind of adjustments to the
			-- string.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 1
			Result := l_integer
		ensure
			as_is_not_void: Result /= Void
			instance_free: class
		end

	adjust_indentation: LS_INSERT_TEXT_MODE
			-- The editor adjusts leading whitespace of new lines so that
			-- they match the indentation up to the cursor of the line for
			-- which the item is accepted.
			--
			-- Consider a line like this: <2tabs><cursor><3tabs>foo. Accepting a
			-- multi line completion item is indented using 2 tabs and all
			-- following lines inserted will be indented using 2 tabs as well.
		local
			l_integer: LS_INTEGER
		once
			l_integer := 2
			Result := l_integer
		ensure
			adjust_indentation_not_void: Result /= Void
			instance_free: class
		end

end
