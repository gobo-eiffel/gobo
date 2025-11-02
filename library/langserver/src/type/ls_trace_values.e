note

	description:

		"Set of predefined values for LS_TRACE_VALUE"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TRACE_VALUES

feature -- Access

	off: LS_TRACE_VALUE
			-- No trace
		local
			l_string: LS_STRING
		once
			l_string := "off"
			Result := l_string
		ensure
			off_not_void: Result /= Void
			instance_free: class
		end

	message: LS_TRACE_VALUE
			-- Only the message part
		local
			l_string: LS_STRING
		once
			l_string := "message"
			Result := l_string
		ensure
			message_not_void: Result /= Void
			instance_free: class
		end

	verbose: LS_TRACE_VALUE
			-- Both message and verbose parts
		local
			l_string: LS_STRING
		once
			l_string := "verbose"
			Result := l_string
		ensure
			verbose_not_void: Result /= Void
			instance_free: class
		end

end
