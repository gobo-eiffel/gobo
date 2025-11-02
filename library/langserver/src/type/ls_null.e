note

	description:

		"LSP null values"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_NULL

inherit

	LS_RESPONSE_ID

	LS_OPTIONAL_VERSION

	LS_OPTIONAL_DOCUMENT_SELECTOR

	LS_RESPONSE_RESULT

	LS_OPTIONAL_HOVER_RESULT

	LS_OPTIONAL_INTEGER

	LS_OPTIONAL_STRING

	LS_OPTIONAL_WORKSPACE_FOLDER_LIST

	LS_OPTIONAL_DOCUMENT_URI

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new null value.
		do
		end

feature -- Access

	null: LS_NULL
			-- null
		once
			create Result.make
		ensure
			null_not_void: Result /= Void
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_null (Current)
		end

feature -- Constants

	null_value: STRING_8 = "null"

end
