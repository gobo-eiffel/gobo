note

	description:

		"LSP null values"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

class LS_NULL

inherit

	LS_RESPONSE_ID

	LS_OPTIONAL_VERSION

	LS_OPTIONAL_DOCUMENT_SELECTOR

	LS_RESPONSE_RESULT

	LS_HOVER_RESULT

	LS_DEFINITION_RESULT

	LS_TYPE_DEFINITION_RESULT

	LS_DECLARATION_RESULT

	LS_IMPLEMENTATION_RESULT

	LS_OPTIONAL_INTEGER

	LS_OPTIONAL_STRING

	LS_OPTIONAL_WORKSPACE_FOLDER_LIST

	LS_OPTIONAL_DOCUMENT_URI

	LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_RESULT

	LS_SELECTION_RANGE_RESULT

	LS_DOCUMENT_HIGHLIGHT_RESULT

	LS_DOCUMENT_SYMBOL_RESULT

	LS_WORKSPACE_SYMBOL_RESULT

	LS_COMPLETION_RESULT

	LS_CALL_HIERARCHY_PREPARE_RESULT

	LS_CALL_HIERARCHY_INCOMING_CALLS_RESULT

	LS_CALL_HIERARCHY_OUTGOING_CALLS_RESULT

	LS_TYPE_HIERARCHY_PREPARE_RESULT

	LS_TYPE_HIERARCHY_SUPERTYPES_RESULT

	LS_TYPE_HIERARCHY_SUBTYPES_RESULT

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
