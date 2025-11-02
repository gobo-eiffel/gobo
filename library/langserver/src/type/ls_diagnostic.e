note

	description:
	"[
		LSP diagnostic, such as a compiler error or warning.
		
		Diagnostic objects are only valid in the scope of a resource.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DIAGNOSTIC

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_range: like range; a_severity: like severity; a_code: like code;
		a_code_description: like code_description; a_source: like source;
		a_message: like message; a_tags: like tags;
		a_related_information: like related_information; a_data: like data)
			-- Create a new diagnostic.
		require
			a_range_not_void: a_range /= Void
			a_message_not_void: a_message /= Void
		do
			range := a_range
			severity := a_severity
			code := a_code
			code_description := a_code_description
			source := a_source
			message := a_message
			tags := a_tags
			related_information := a_related_information
			data := a_data
		ensure
			range_set: range = a_range
			severity_set: severity = severity
			code_set: code = a_code
			code_description_set: code_description = a_code_description
			source_set: source = a_source
			message_set: message = a_message
			tags_set: tags = a_tags
			related_information_set: related_information = a_related_information
			data_set: data = a_data
		end

feature -- Access

	range: LS_RANGE
			-- The range at which the message applies.

	severity: detachable LS_DIAGNOSTIC_SEVERITY
			-- The diagnostic's severity. To avoid interpretation mismatches when a
			-- server is used with different clients it is highly recommended that
			-- servers always provide a severity value. If omitted, it's recommended
			-- for the client to interpret it as an Error severity.

	code: detachable LS_DIAGNOSTIC_CODE
			-- The diagnostic's code, which might appear in the user interface.

	code_description: detachable LS_CODE_DESCRIPTION
			-- An optional property to describe the error code.

	source: detachable LS_STRING
			-- A human-readable string describing the source of this
			-- diagnostic, e.g. 'typescript' or 'super lint'.

	message: LS_STRING
			-- The diagnostic's message.

	tags: detachable LS_DIAGNOSTIC_TAG_LIST
			-- Additional metadata about the diagnostic.

	related_information: detachable LS_DIAGNOSTIC_RELATED_INFORMATION_LIST
			-- An array of related diagnostic information, e.g. when symbol-names within
			-- a scope collide all definitions can be marked via this property.

	data: detachable LS_ANY
			-- A data entry field that is preserved between a
			-- 'textDocument/publishDiagnostics' notification and
			-- 'textDocument/codeAction' request.

feature -- Field names

	range_name: STRING_8 = "range"
	severity_name: STRING_8 = "severity"
	code_name: STRING_8 = "code"
	code_description_name: STRING_8 = "codeDescription"
	source_name: STRING_8 = "source"
	message_name: STRING_8 = "message"
	tags_name: STRING_8 = "tags"
	related_information_name: STRING_8 = "relatedInformation"
	data_name: STRING_8 = "data"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_diagnostic (Current)
		end

invariant

	range_not_void: range /= Void
	message_not_void: message /= Void

end
