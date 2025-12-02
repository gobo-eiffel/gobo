note

	description:

		"LSP 'textDocument/publishDiagnostics' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_PUBLISH_DIAGNOSTICS_CAPABILITIES

inherit

	LS_CLIENT_CAPABILITIES

create

	make

feature {NONE} -- Initialization

	make (a_related_information: like related_information;
		a_tag_support: like tag_support;
		a_version_support: like version_support;
		a_code_description_support: like code_description_support;
		a_data_support: like data_support)
			-- Create a new client capabilities.
		do
			related_information := a_related_information
			tag_support := a_tag_support
			version_support := a_version_support
			code_description_support := a_code_description_support
			data_support := a_data_support
		ensure
			related_information_set: related_information = related_information
			tag_support_set: tag_support = a_tag_support
			version_support_set: version_support = a_version_support
			code_description_support_set: code_description_support = a_code_description_support
			data_support_set: data_support = a_data_support
		end

feature -- Access

	related_information: detachable LS_BOOLEAN
			-- Whether the clients accepts diagnostics with related information.

	tag_support: detachable LS_DIAGNOSTIC_TAG_SET
			-- Client supports the tag property to provide meta data about a diagnostic.
			-- Clients supporting tags have to handle unknown tags gracefully.

	version_support: detachable LS_BOOLEAN
			-- Whether the client interprets the version property of the
			-- 'textDocument/publishDiagnostics' notification's parameter.

	code_description_support: detachable LS_BOOLEAN
			-- Client supports a 'code_description' property

	data_support: detachable LS_BOOLEAN
			-- Whether code action supports the 'data' property which is
			-- preserved between a 'textDocument/publishDiagnostics' and
			-- 'textDocument/codeAction' request.

feature -- Field names

	related_information_name: STRING_8 = "relatedInformation"
	tag_support_name: STRING_8 = "tagSupport"
	version_support_name: STRING_8 = "versionSupport"
	code_description_support_name: STRING_8 = "codeDescriptionSupport"
	data_support_name: STRING_8 = "dataSupport"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_publish_diagnostics_capabilities (Current)
		end

end
