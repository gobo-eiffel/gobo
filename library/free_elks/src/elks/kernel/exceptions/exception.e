note
	description: "Ancestor of all exception classes."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	EXCEPTION

inherit
	EXCEPTION_MANAGER_FACTORY
		undefine
			out
		end

create
	default_create,
	make_with_tag_and_trace

feature {NONE} -- Initialization

	make_with_tag_and_trace (a_tag, a_trace_string: STRING)
			-- Make `Current' with `description' set to `a_tag'.
		obsolete
			"Use `default_create' and `set_description' instead. [2017-05-31]"
		require
			tag_not_void: a_tag /= Void
			trace_string_not_void: a_trace_string /= Void
		do
			set_description (a_tag)
		ensure
			description_set: attached description as l_des and then a_tag.same_string_general (l_des)
		end

feature -- Raise

	raise
			-- Raise current exception
		require
			is_raisable: is_raisable
		do
			exception_manager.raise (Current)
		end

feature -- Access

	meaning: STRING
			-- A short message describing what current exception is
		obsolete
			"Use `tag' instead. [2017-05-31]"
		do
			Result := tag.as_string_8
		end

	tag: IMMUTABLE_STRING_32
			-- A short message describing what current exception is
		once
			create Result.make_from_string_8 ("General exception")
		end

	message: detachable STRING
			-- Message of current exception
		obsolete
			"Use `description' instead. [2017-05-31]"
		do
			if attached c_description as l_m then
				Result := l_m.substring (1, l_m.count)
			end
		end

	description: detachable READABLE_STRING_32
			-- Detailed description of current exception.
		local
			l_res: STRING_32
		do
			if attached c_description as d then
					-- Description is encoded in UTF-8 by the runtime.
				create l_res.make (d.count)
				{UTF_CONVERTER}.utf_8_0_subpointer_into_escaped_string_32 (d.managed_data, 0, d.count - 1, False, l_res)
				Result := l_res
			end
		end

	exception_trace: detachable STRING_8
			-- String representation of current exception trace
		obsolete
			"Use `trace' instead. [2017-05-31]"
		do
			Result := internal_trace
		end

	trace: detachable STRING_32
			-- String representation of current exception trace
		local
			u: UTF_CONVERTER
		do
			if attached internal_trace as l_trace then
				Result := u.utf_8_string_8_to_escaped_string_32 (l_trace)
			end
		end

	code: INTEGER
			-- Code of the exception.
		do
		end

	frozen original: EXCEPTION
			-- The original exception directly triggered current exception
		local
			t: like throwing_exception
		do
			t := throwing_exception
			if t = Current or else t = Void then
				Result := Current
			elseif (attached {ROUTINE_FAILURE} Current) or else (attached {OLD_VIOLATION} Current) then
				Result := t.original
			else
				Result := Current
			end
		ensure
			original_not_void: Result /= Void
		end

	frozen cause: EXCEPTION
			-- The cause of current exception raised during rescue processing
		do
			if attached original.throwing_exception as e then
				Result := e
			else
				Result := Current
			end
		ensure
			cause_not_void: Result /= Void
		end

	frozen recipient_name: detachable STRING_8
			-- Name of the routine whose execution was
			-- interrupted by current exception

	frozen type_name: detachable STRING_8
			-- Name of the class that includes the recipient
			-- of original form of current exception

	frozen line_number: INTEGER
			-- Line number

feature -- Access obselete

	trace_as_string: detachable STRING
			-- Exception trace represented as a string
		obsolete
			"Use `trace' instead. [2017-05-31]"
		do
			if attached exception_trace as t then
				Result := t
			end
		end

feature -- Status settings

	set_message (a_message: like message)
			-- Set `message' with `a_message'.
		obsolete
			"Use `set_description' instead. [2017-05-31]"
		do
			set_description (a_message)
		ensure
			message_set: message ~ a_message
		end

	set_description (a_description: detachable READABLE_STRING_GENERAL)
			-- Set `description' with `a_description'.
		local
			u: UTF_CONVERTER
			l_upper: CELL [INTEGER]
			l_c: like c_description
		do
			if a_description /= Void then
				create l_c.make_empty (a_description.count)
				create l_upper.put (0)
				u.utf_32_string_into_utf_8_0_pointer (a_description, l_c.managed_data, 0, l_upper)
				l_c.set_count (l_upper.item)
				c_description := l_c
			else
				c_description := Void
			end
		ensure
			description_set: (attached a_description as a_des and then attached description as l_des and then a_des.same_string (l_des)) or else
							(a_description = Void and then description = Void)
		end

feature -- Status report

	frozen is_ignorable: BOOLEAN
			-- Is current exception ignorable?
		do
			Result := exception_manager.is_ignorable (generating_type)
		end

	frozen is_raisable: BOOLEAN
			-- Is current exception raisable by `raise'?
		do
			Result := exception_manager.is_raisable (generating_type)
		end

	frozen is_ignored: BOOLEAN
			-- If set, current exception is not raised.
		do
			Result := exception_manager.is_ignored (generating_type)
		ensure
			is_ignored_implies_is_ignorable: Result implies is_ignorable
			not_is_caught: Result = not is_caught
		end

	frozen is_caught: BOOLEAN
			-- If set, current exception is raised.
		do
			Result := not is_ignored
		ensure
			not_is_caught_implies_is_ignorable: not Result implies is_ignorable
			not_is_ignored: Result = not is_ignored
		end

feature -- Output

	out: STRING
			-- New string containing terse printable representation
			-- of current object
		do
			Result := generating_type.out
			if attached trace as t then
				Result.append_character ('%N')
				if attached {READABLE_STRING} t as r then
					Result.append (r)
				elseif attached {STRING_8} Result as s then
					{UTF_CONVERTER}.escaped_utf_32_string_into_utf_8_string_8 (t, s)
				elseif attached {STRING_32} Result as s then
					s.append_string_general (t)
				end
			end
		end

feature {EXCEPTION} -- Access

	frozen throwing_exception: detachable EXCEPTION
			-- The exception throwing current exception

feature {EXCEPTION_MANAGER} -- Implementation

	frozen set_throwing_exception (a_exception: detachable EXCEPTION)
			-- Set `throwing_exception' with `a_exception'.
		do
			throwing_exception := a_exception
		ensure
			throwing_exception_set: throwing_exception = a_exception
		end

	frozen set_recipient_name (a_name: like recipient_name)
			-- Set `recipient_name' with `a_name'
		do
			recipient_name := a_name
		end

	frozen set_line_number (a_number: like line_number)
			-- Set `line_number' with `a_number'.
		do
			line_number := a_number
		end

	frozen set_c_description (a_des: detachable STRING_8)
			-- Set `c_description' with `a_des'. `a_des' is in UTF-8.
		do
			if a_des /= Void then
				create c_description.make (a_des)
			else
				c_description := Void
			end
		end

	c_description: detachable C_STRING
			-- Message, stored as C string to keep it alive and usable by the runtime trace printing.

	frozen set_type_name (a_type: like type_name)
			-- Set `type_name' with `a_type'
		do
			type_name := a_type
		end

	frozen internal_is_ignorable: BOOLEAN
			-- Internal `is_ignorable'

	frozen set_exception_trace (a_trace: like exception_trace)
			-- Set `exception_trace' with `a_trace'.
		do
			internal_trace := a_trace
		end

	internal_trace: detachable STRING_8
			-- String representation of the exception trace

;note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
