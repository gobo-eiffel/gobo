note

	description:

		"JSON value processors"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class JN_PROCESSOR

feature {NONE} -- Initialization

	make
			-- Create a new processor.
		do
		end

feature {JN_VALUE} -- Processing

	process_array (a_value: JN_ARRAY)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_boolean (a_value: JN_BOOLEAN)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_null (a_value: JN_NULL)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_number (a_value: JN_NUMBER)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_object (a_value: JN_OBJECT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_string (a_value: JN_STRING)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

end
