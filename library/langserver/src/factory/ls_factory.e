note

	description:

		"LSP factories"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_FACTORY

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new factory.
		do
		end

feature -- Access

	annotated_text_edit_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_ANNOTATED_TEXT_EDIT
			-- Convert `a_object` to an annotated text edit.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached range_in_object (a_object, {LS_ANNOTATED_TEXT_EDIT}.range_name, False) as l_range then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_ANNOTATED_TEXT_EDIT}.range_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_ANNOTATED_TEXT_EDIT}.new_text_name, False) as l_new_text then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_ANNOTATED_TEXT_EDIT}.new_text_name + ": missing field"
				end
			elseif not attached change_annotation_identifier_in_object (a_object, {LS_ANNOTATED_TEXT_EDIT}.annotation_id_name, False) as l_annotation_id then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_ANNOTATED_TEXT_EDIT}.annotation_id_name + ": missing field"
				end
			else
				create Result.make (l_range, l_new_text, l_annotation_id)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	annotated_text_edit_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_ANNOTATED_TEXT_EDIT
			-- Annotated text edit stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_ANNOTATED_TEXT_EDIT} l_value as l_text_edit then
				Result := l_text_edit
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := annotated_text_edit_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	application_info_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_APPLICATION_INFO
			-- Convert `a_object` to an application info.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_version: detachable LS_STRING
		do
			last_error := Void
			if not attached string_in_object (a_object, {LS_APPLICATION_INFO}.name_name, False) as l_name then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_APPLICATION_INFO}.name_name + ": missing field"
				end
			else
				l_version := string_in_object (a_object, {LS_APPLICATION_INFO}.version_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					create Result.make (l_name, l_version)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	application_info_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_APPLICATION_INFO
			-- Application info stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_APPLICATION_INFO} l_value as l_application_info then
				Result := l_application_info
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := application_info_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	base_uri_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_BASE_URI
			-- Convert `a_any` to a base URI.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_BASE_URI} a_any as l_base_uri then
				Result := l_base_uri
			elseif attached {LS_OBJECT} a_any as l_object and then attached workspace_folder_from_object (l_object, a_field_name) as l_workspace_folder then
				Result := l_workspace_folder
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	base_uri_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_BASE_URI
			-- Base URI stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := base_uri_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	boolean_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_BOOLEAN
			-- Convert `a_any` to a boolean.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_BOOLEAN} a_any as l_boolean then
				Result := l_boolean
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	boolean_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_BOOLEAN
			-- Boolean stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := boolean_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	change_annotation_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_CHANGE_ANNOTATION
			-- Convert `a_object` to a change annotation.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_needs_confirmation: detachable LS_BOOLEAN
			l_description: detachable LS_STRING
		do
			last_error := Void
			if not attached string_in_object (a_object, {LS_CHANGE_ANNOTATION}.label_name, False) as l_label then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_CHANGE_ANNOTATION}.label_name + ": missing field"
				end
			else
				l_needs_confirmation := boolean_in_object (a_object, {LS_CHANGE_ANNOTATION}.needs_confirmation_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
				if last_error = Void then
					l_description := string_in_object (a_object, {LS_CHANGE_ANNOTATION}.description_name, True)
					if attached last_error as l_last_error and a_field_name /= Void then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					create Result.make (l_label, l_needs_confirmation, l_description)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	change_annotation_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_CHANGE_ANNOTATION
			-- Change annotation stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_CHANGE_ANNOTATION} l_value as l_text_edit then
				Result := l_text_edit
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := change_annotation_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	change_annotation_identifier_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_CHANGE_ANNOTATION_IDENTIFIER
			-- Convert `a_any` to a change annotation identifier.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_CHANGE_ANNOTATION_IDENTIFIER} a_any as l_change_annotation_identifier then
				Result := l_change_annotation_identifier
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	change_annotation_identifier_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_CHANGE_ANNOTATION_IDENTIFIER
			-- Change annotation identifier stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := change_annotation_identifier_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	client_all_capabilities_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_CLIENT_ALL_CAPABILITIES
			-- Convert `a_object` to a client all capabilities.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_text_document: detachable LS_TEXT_DOCUMENT_CAPABILITIES
			l_workspace: detachable LS_WORKSPACE_CAPABILITIES
		do
			last_error := Void
			l_text_document := text_document_capabilities_in_object (a_object, {LS_CLIENT_ALL_CAPABILITIES}.text_document_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_workspace := workspace_capabilities_in_object (a_object, {LS_CLIENT_ALL_CAPABILITIES}.workspace_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make
				Result.set_text_document (l_text_document)
				Result.set_workspace (l_workspace)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	client_all_capabilities_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_CLIENT_ALL_CAPABILITIES
			-- Client all capabilities stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_CLIENT_ALL_CAPABILITIES} l_value as l_client_all_capabilities then
				Result := l_client_all_capabilities
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := client_all_capabilities_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	code_block_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_CODE_BLOCK
			-- Convert `a_object` to a code block.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached string_in_object (a_object, {LS_CODE_BLOCK}.language_name, False) as l_language then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_CODE_BLOCK}.language_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_CODE_BLOCK}.value_name, False) as l_value then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_CODE_BLOCK}.value_name + ": missing field"
				end
			else
				create Result.make (l_language, l_value)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	code_block_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_CODE_BLOCK
			-- Code block stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_CODE_BLOCK} l_value as l_code_block then
				Result := l_code_block
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := code_block_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	code_description_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_CODE_DESCRIPTION
			-- Convert `a_object` to a code description.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached uri_in_object (a_object, {LS_CODE_DESCRIPTION}.href_name, False) as l_href then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_CODE_DESCRIPTION}.href_name + ": missing field"
				end
			else
				create Result.make (l_href)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	code_description_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_CODE_DESCRIPTION
			-- Code description stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_CODE_DESCRIPTION} l_value as l_code_description then
				Result := l_code_description
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := code_description_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	configuration_capabilities_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_CONFIGURATION_CAPABILITIES
			-- Convert `a_any` to a configuration capabilities.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_CONFIGURATION_CAPABILITIES} a_any as l_configuration_capabilities then
				Result := l_configuration_capabilities
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	configuration_capabilities_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_CONFIGURATION_CAPABILITIES
			-- Configuration capabilities stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := configuration_capabilities_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	configuration_item_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_CONFIGURATION_ITEM
			-- Convert `a_object` to a configuration item.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_scope_uri: detachable LS_URI
			l_section: detachable LS_STRING
		do
			last_error := Void
			l_scope_uri := uri_in_object (a_object, {LS_CONFIGURATION_ITEM}.scope_uri_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_section := string_in_object (a_object, {LS_CONFIGURATION_ITEM}.section_name, True)
				if attached last_error as l_last_error and a_field_name /= Void then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make (l_scope_uri, l_section)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	configuration_item_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_CONFIGURATION_ITEM
			-- Configuration item stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_CONFIGURATION_ITEM} l_value as l_configuration_item then
				Result := l_configuration_item
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := configuration_item_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	configuration_item_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_CONFIGURATION_ITEM_LIST
			-- Convert `a_array` to configuration item list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached configuration_item_from_object (l_object, i.out) as l_configuration_item then
					Result.put_last (l_configuration_item)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	configuration_item_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_CONFIGURATION_ITEM_LIST
			-- Configuration item list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_CONFIGURATION_ITEM_LIST} l_value as l_configuration_item_list then
				Result := l_configuration_item_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := configuration_item_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	configuration_result_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_CONFIGURATION_RESULT
			-- Convert `a_any` to a configuration result.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_CONFIGURATION_RESULT} a_any as l_configuration_result then
				Result := l_configuration_result
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	configuration_result_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_CONFIGURATION_RESULT
			-- Configuration result stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := configuration_result_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	command_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_COMMAND
			-- Convert `a_object` to a command.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
			l_arguments: detachable LS_ARRAY
		do
			last_error := Void
			if not attached string_in_object (a_object, {LS_COMMAND}.title_name, False) as l_title then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_COMMAND}.title_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_COMMAND}.command_name, False) as l_command then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_COMMAND}.command_name + ": missing field"
				end
			else
				l_value := a_object.value ({LS_COMMAND}.arguments_name)
				if attached {LS_ARRAY} l_value as l_array then
					l_arguments := l_array
				elseif l_value /= Void then
					last_error := a_field_name + "." + {LS_COMMAND}.arguments_name + ": invalid type"
				end
				if last_error = Void then
					create Result.make (l_title, l_command, l_arguments)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	command_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_COMMAND
			-- Command stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_COMMAND} l_value as l_command then
				Result := l_command
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := command_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	definition_capabilities_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DEFINITION_CAPABILITIES
			-- Convert `a_object` to a definition capabilities.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_dynamic_registration: detachable LS_BOOLEAN
			l_link_support: detachable LS_BOOLEAN
		do
			last_error := Void
			l_dynamic_registration := boolean_in_object (a_object, {LS_DEFINITION_CAPABILITIES}.dynamic_registration_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_link_support := boolean_in_object (a_object, {LS_DEFINITION_CAPABILITIES}.link_support_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make (l_dynamic_registration, l_link_support)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	definition_capabilities_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DEFINITION_CAPABILITIES
			-- Definition capabilities stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DEFINITION_CAPABILITIES} l_value as l_definition_capabilities then
				Result := l_definition_capabilities
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := definition_capabilities_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	definition_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DEFINITION_OPTIONS
			-- Convert `a_object` to a definition options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_work_done_progress: detachable LS_BOOLEAN
		do
			last_error := Void
			l_work_done_progress := boolean_in_object (a_object, {LS_DEFINITION_OPTIONS}.work_done_progress_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			else
				create Result.make (l_work_done_progress)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	definition_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DEFINITION_OPTIONS
			-- Definition options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DEFINITION_OPTIONS} l_value as l_definition_options then
				Result := l_definition_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := definition_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	definition_registration_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DEFINITION_REGISTRATION_OPTIONS
			-- Convert `a_object` to a definition registration options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_work_done_progress: detachable LS_BOOLEAN
		do
			last_error := Void
			if not attached optional_document_selector_in_object (a_object, {LS_DEFINITION_REGISTRATION_OPTIONS}.document_selector_name, False) as l_document_selector then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DEFINITION_REGISTRATION_OPTIONS}.document_selector_name + ": missing field"
				end
			else
				l_work_done_progress := boolean_in_object (a_object, {LS_DEFINITION_REGISTRATION_OPTIONS}.work_done_progress_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					create Result.make (l_document_selector, l_work_done_progress)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	definition_registration_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DEFINITION_REGISTRATION_OPTIONS
			-- Definition registration options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DEFINITION_REGISTRATION_OPTIONS} l_value as l_definition_registration_options then
				Result := l_definition_registration_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := definition_registration_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	diagnostic_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DIAGNOSTIC
			-- Convert `a_object` to a diagnostic.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_severity: detachable LS_DIAGNOSTIC_SEVERITY
			l_code: detachable LS_DIAGNOSTIC_CODE
			l_code_description: detachable LS_CODE_DESCRIPTION
			l_source: detachable LS_STRING
			l_tags: detachable LS_DIAGNOSTIC_TAG_LIST
			l_related_information: detachable LS_DIAGNOSTIC_RELATED_INFORMATION_LIST
			l_data: detachable LS_ANY
		do
			last_error := Void
			if not attached range_in_object (a_object, {LS_DIAGNOSTIC}.range_name, False) as l_range then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DIAGNOSTIC}.range_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_DIAGNOSTIC}.message_name, False) as l_message then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DIAGNOSTIC}.message_name + ": missing field"
				end
			else
				l_severity := diagnostic_severity_in_object (a_object, {LS_DIAGNOSTIC}.severity_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
				if last_error = Void then
					l_code := diagnostic_code_in_object (a_object, {LS_DIAGNOSTIC}.code_name, True)
					if attached last_error as l_last_error and a_field_name /= Void then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					l_code_description := code_description_in_object (a_object, {LS_DIAGNOSTIC}.code_description_name, True)
					if attached last_error as l_last_error and a_field_name /= Void then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					l_source := string_in_object (a_object, {LS_DIAGNOSTIC}.source_name, True)
					if attached last_error as l_last_error and a_field_name /= Void then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					l_tags := diagnostic_tag_list_in_object (a_object, {LS_DIAGNOSTIC}.tags_name, True)
					if attached last_error as l_last_error and a_field_name /= Void then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					l_related_information := diagnostic_related_information_list_in_object (a_object, {LS_DIAGNOSTIC}.related_information_name, True)
					if attached last_error as l_last_error and a_field_name /= Void then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					l_data := a_object.value ({LS_DIAGNOSTIC}.data_name)
					create Result.make (l_range, l_severity, l_code, l_code_description, l_source, l_message, l_tags, l_related_information, l_data)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	diagnostic_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DIAGNOSTIC
			-- Diagnostic stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DIAGNOSTIC} l_value as l_diagnostic then
				Result := l_diagnostic
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := diagnostic_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	diagnostic_code_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_DIAGNOSTIC_CODE
			-- Convert `a_any` to a diagnostic code.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_DIAGNOSTIC_CODE} a_any as l_diagnostic_code then
				Result := l_diagnostic_code
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	diagnostic_code_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DIAGNOSTIC_CODE
			-- Diagnostic code stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := diagnostic_code_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	diagnostic_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_DIAGNOSTIC_LIST
			-- Convert `a_array` to diagnostic list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached diagnostic_from_object (l_object, i.out) as l_diagnostic then
					Result.put_last (l_diagnostic)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	diagnostic_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DIAGNOSTIC_LIST
			-- Diagnostic list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DIAGNOSTIC_LIST} l_value as l_diagnostic_list then
				Result := l_diagnostic_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := diagnostic_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	diagnostic_related_information_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DIAGNOSTIC_RELATED_INFORMATION
			-- Convert `a_object` to a diagnostic related information.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached location_in_object (a_object, {LS_DIAGNOSTIC_RELATED_INFORMATION}.location_name, False) as l_location then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DIAGNOSTIC_RELATED_INFORMATION}.location_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_DIAGNOSTIC_RELATED_INFORMATION}.message_name, False) as l_message then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DIAGNOSTIC_RELATED_INFORMATION}.message_name + ": missing field"
				end
			else
				create Result.make (l_location, l_message)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	diagnostic_related_information_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DIAGNOSTIC_RELATED_INFORMATION
			-- Diagnostic related information stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DIAGNOSTIC_RELATED_INFORMATION} l_value as l_diagnostic_related_information then
				Result := l_diagnostic_related_information
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := diagnostic_related_information_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	diagnostic_related_information_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_DIAGNOSTIC_RELATED_INFORMATION_LIST
			-- Convert `a_array` to diagnostic related information list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached diagnostic_related_information_from_object (l_object, i.out) as l_diagnostic_related_information then
					Result.put_last (l_diagnostic_related_information)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	diagnostic_related_information_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DIAGNOSTIC_RELATED_INFORMATION_LIST
			-- Diagnostic related information list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DIAGNOSTIC_RELATED_INFORMATION_LIST} l_value as l_diagnostic_related_information_list then
				Result := l_diagnostic_related_information_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := diagnostic_related_information_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	diagnostic_severity_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_DIAGNOSTIC_SEVERITY
			-- Convert `a_any` to a diagnostic severity.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_DIAGNOSTIC_SEVERITY} a_any as l_diagnostic_severity then
				Result := l_diagnostic_severity
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	diagnostic_severity_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DIAGNOSTIC_SEVERITY
			-- Diagnostic severity stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := diagnostic_severity_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	diagnostic_tag_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_DIAGNOSTIC_TAG
			-- Convert `a_any` to a diagnostic tag.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_DIAGNOSTIC_TAG} a_any as l_diagnostic_tag then
				Result := l_diagnostic_tag
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	diagnostic_tag_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DIAGNOSTIC_TAG
			-- Diagnostic tag stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := diagnostic_tag_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	diagnostic_tag_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_DIAGNOSTIC_TAG_LIST
			-- Convert `a_array` to diagnostic tag list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if attached diagnostic_tag_from_any (a_array.value (i), i.out) as l_diagnostic_tag then
					Result.put_last (l_diagnostic_tag)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	diagnostic_tag_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DIAGNOSTIC_TAG_LIST
			-- Diagnostic tag list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DIAGNOSTIC_TAG_LIST} l_value as l_diagnostic_tag_list then
				Result := l_diagnostic_tag_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := diagnostic_tag_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	diagnostic_tag_set_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DIAGNOSTIC_TAG_SET
			-- Convert `a_object` to a diagnostic tag set.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value_set: detachable LS_DIAGNOSTIC_TAG_LIST
		do
			last_error := Void
			l_value_set := diagnostic_tag_list_in_object (a_object, {LS_DIAGNOSTIC_TAG_SET}.value_set_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			else
				create Result.make (l_value_set)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	diagnostic_tag_set_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DIAGNOSTIC_TAG_SET
			-- Diagnostic tag set stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DIAGNOSTIC_TAG_SET} l_value as l_diagnostic_tag_set then
				Result := l_diagnostic_tag_set
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := diagnostic_tag_set_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	did_change_text_document_registration_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DID_CHANGE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Convert `a_object` to a did change text document registration options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached text_document_sync_kind_in_object (a_object, {LS_DID_CHANGE_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.sync_kind_name, False) as l_sync_kind then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DID_CHANGE_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.sync_kind_name + ": missing field"
				end
			elseif not attached optional_document_selector_in_object (a_object, {LS_DID_CHANGE_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name, False) as l_document_selector then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DID_CHANGE_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name + ": missing field"
				end
			else
				create Result.make (l_sync_kind, l_document_selector)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	did_change_text_document_registration_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DID_CHANGE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Did change text document registration options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DID_CHANGE_TEXT_DOCUMENT_REGISTRATION_OPTIONS} l_value as l_did_change_text_document_registration_options then
				Result := l_did_change_text_document_registration_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := did_change_text_document_registration_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	did_change_watched_files_capabilities_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DID_CHANGE_WATCHED_FILES_CAPABILITIES
			-- Convert `a_object` to a did change watched files capabilities.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_dynamic_registration: detachable LS_BOOLEAN
			l_relative_pattern_support: detachable LS_BOOLEAN
		do
			last_error := Void
			l_dynamic_registration := boolean_in_object (a_object, {LS_DID_CHANGE_WATCHED_FILES_CAPABILITIES}.dynamic_registration_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_relative_pattern_support := boolean_in_object (a_object, {LS_DID_CHANGE_WATCHED_FILES_CAPABILITIES}.relative_pattern_support_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make (l_dynamic_registration, l_relative_pattern_support)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	did_change_watched_files_capabilities_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DID_CHANGE_WATCHED_FILES_CAPABILITIES
			-- Did change watched files capabilities stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DID_CHANGE_WATCHED_FILES_CAPABILITIES} l_value as l_did_change_watched_files_capabilities then
				Result := l_did_change_watched_files_capabilities
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := did_change_watched_files_capabilities_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	did_change_watched_files_registration_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DID_CHANGE_WATCHED_FILES_REGISTRATION_OPTIONS
			-- Convert `a_object` to a did change watched files registration options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached file_system_watcher_list_in_object (a_object, {LS_DID_CHANGE_WATCHED_FILES_REGISTRATION_OPTIONS}.watchers_name, False) as l_watchers then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DID_CHANGE_WATCHED_FILES_REGISTRATION_OPTIONS}.watchers_name + ": missing field"
				end
			else
				create Result.make (l_watchers)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	did_change_watched_files_registration_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DID_CHANGE_WATCHED_FILES_REGISTRATION_OPTIONS
			-- Did change watched files registration options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DID_CHANGE_WATCHED_FILES_REGISTRATION_OPTIONS} l_value as l_did_change_watched_files_registration_options then
				Result := l_did_change_watched_files_registration_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := did_change_watched_files_registration_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	did_close_text_document_options_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_DID_CLOSE_TEXT_DOCUMENT_OPTIONS
			-- Convert `a_any` to a did close text document options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_DID_CLOSE_TEXT_DOCUMENT_OPTIONS} a_any as l_did_close_text_document_options then
				Result := l_did_close_text_document_options
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	did_close_text_document_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DID_CLOSE_TEXT_DOCUMENT_OPTIONS
			-- Did close text document options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := did_close_text_document_options_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	did_close_text_document_registration_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DID_CLOSE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Convert `a_object` to a did close text document registration options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached optional_document_selector_in_object (a_object, {LS_DID_CLOSE_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name, False) as l_document_selector then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DID_CLOSE_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name + ": missing field"
				end
			else
				create Result.make (l_document_selector)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	did_close_text_document_registration_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DID_CLOSE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Did close text document registration options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DID_CLOSE_TEXT_DOCUMENT_REGISTRATION_OPTIONS} l_value as l_did_close_text_document_registration_options then
				Result := l_did_close_text_document_registration_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := did_close_text_document_registration_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	did_open_text_document_options_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_DID_OPEN_TEXT_DOCUMENT_OPTIONS
			-- Convert `a_any` to a did open text document options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_DID_OPEN_TEXT_DOCUMENT_OPTIONS} a_any as l_did_open_text_document_options then
				Result := l_did_open_text_document_options
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	did_open_text_document_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DID_OPEN_TEXT_DOCUMENT_OPTIONS
			-- Did open text document options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := did_open_text_document_options_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	did_open_text_document_registration_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DID_OPEN_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Convert `a_object` to a did open text document registration options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached optional_document_selector_in_object (a_object, {LS_DID_OPEN_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name, False) as l_document_selector then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DID_OPEN_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name + ": missing field"
				end
			else
				create Result.make (l_document_selector)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	did_open_text_document_registration_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DID_OPEN_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Did open text document registration options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DID_OPEN_TEXT_DOCUMENT_REGISTRATION_OPTIONS} l_value as l_did_open_text_document_registration_options then
				Result := l_did_open_text_document_registration_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := did_open_text_document_registration_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	did_save_text_document_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DID_SAVE_TEXT_DOCUMENT_OPTIONS
			-- Convert `a_object` to a did save text document options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_include_text: detachable LS_BOOLEAN
		do
			last_error := Void
			l_include_text := boolean_in_object (a_object, {LS_DID_SAVE_TEXT_DOCUMENT_OPTIONS}.include_text_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			else
				create Result.make (l_include_text)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	did_save_text_document_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DID_SAVE_TEXT_DOCUMENT_OPTIONS
			-- Did save text document options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DID_SAVE_TEXT_DOCUMENT_OPTIONS} l_value as l_did_save_text_document_options then
				Result := l_did_save_text_document_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := did_save_text_document_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	did_save_text_document_registration_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DID_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Convert `a_object` to a did save text document registration options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_include_text: detachable LS_BOOLEAN
		do
			last_error := Void
			if not attached optional_document_selector_in_object (a_object, {LS_DID_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name, False) as l_document_selector then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DID_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name + ": missing field"
				end
			else
				l_include_text := boolean_in_object (a_object, {LS_DID_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.include_text_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					create Result.make (l_include_text, l_document_selector)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	did_save_text_document_registration_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DID_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Did save text document registration options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DID_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS} l_value as l_did_save_text_document_registration_options then
				Result := l_did_save_text_document_registration_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := did_save_text_document_registration_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	document_filter_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DOCUMENT_FILTER
			-- Convert `a_object` to a document filter.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_language: detachable LS_STRING
			l_scheme: detachable LS_STRING
			l_pattern: detachable LS_STRING
		do
			last_error := Void
			l_language := string_in_object (a_object, {LS_DOCUMENT_FILTER}.language_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_scheme := string_in_object (a_object, {LS_DOCUMENT_FILTER}.scheme_name, True)
				if attached last_error as l_last_error and a_field_name /= Void then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_pattern := string_in_object (a_object, {LS_DOCUMENT_FILTER}.pattern_name, True)
				if attached last_error as l_last_error and a_field_name /= Void then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error /= Void then
				-- Done.
			elseif l_language = Void and l_scheme = Void and l_pattern = Void then
				last_error := a_field_name + ": missing language, scheme or pattern"
			else
				create Result.make (l_language, l_scheme, l_pattern)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	document_filter_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DOCUMENT_FILTER
			-- Document filter stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DOCUMENT_FILTER} l_value as l_document_filter then
				Result := l_document_filter
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := document_filter_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	document_selector_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_DOCUMENT_SELECTOR
			-- Convert `a_array` to a document selector.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			if a_array.is_empty then
				last_error := a_field_name + ": no document filters"
			elseif not attached {LS_OBJECT} a_array.value (1) as l_first_object then
				last_error := a_field_name + ".1: invalid type"
			elseif attached document_filter_from_object (l_first_object, "1") as l_first_document_filter then
				nb := a_array.count
				create Result.make_with_capacity (l_first_document_filter, nb)
				from i := 2 until i > nb loop
					if not attached {LS_OBJECT} a_array.value (i) as l_object then
						last_error := a_field_name + "." + i.out + ": invalid type"
						i := nb + 1 -- Jump out of the loop.
					elseif attached document_filter_from_object (l_object, i.out) as l_document_filter then
						Result.put_last (l_document_filter)
						i := i + 1
					elseif attached last_error as l_last_error then
						last_error := a_field_name + "." + l_last_error
						i := nb + 1 -- Jump out of the loop.
					else
						last_error := a_field_name + "." + i.out + ": invalid type"
						i := nb + 1 -- Jump out of the loop.
					end
				end
				if last_error /= Void then
					Result := Void
				end
			elseif attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			else
				last_error := a_field_name + ".1: invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	document_selector_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DOCUMENT_SELECTOR
			-- Document selector stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DOCUMENT_SELECTOR} l_value as l_document_selector then
				Result := l_document_selector
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := document_selector_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	document_symbol_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DOCUMENT_SYMBOL
			-- Convert `a_object` to a document symbol.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_detail: detachable LS_STRING
			l_tags: detachable LS_SYMBOL_TAG_LIST
			l_deprecated: detachable LS_BOOLEAN
			l_children: detachable LS_DOCUMENT_SYMBOL_LIST
		do
			last_error := Void
			if not attached string_in_object (a_object, {LS_DOCUMENT_SYMBOL}.name_name, False) as l_name then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DOCUMENT_SYMBOL}.name_name + ": missing field"
				end
			elseif not attached symbol_kind_in_object (a_object, {LS_DOCUMENT_SYMBOL}.kind_name, False) as l_kind then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DOCUMENT_SYMBOL}.kind_name + ": missing field"
				end
			elseif not attached range_in_object (a_object, {LS_DOCUMENT_SYMBOL}.range_name, False) as l_range then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DOCUMENT_SYMBOL}.range_name + ": missing field"
				end
			elseif not attached range_in_object (a_object, {LS_DOCUMENT_SYMBOL}.selection_range_name, False) as l_selection_range then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DOCUMENT_SYMBOL}.selection_range_name + ": missing field"
				end
			else
				l_detail := string_in_object (a_object, {LS_DOCUMENT_SYMBOL}.detail_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
				if last_error = Void then
					l_tags := symbol_tag_list_in_object (a_object, {LS_DOCUMENT_SYMBOL}.tags_name, True)
					if attached last_error as l_last_error then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					l_deprecated := boolean_in_object (a_object, {LS_DOCUMENT_SYMBOL}.deprecated_name, True)
					if attached last_error as l_last_error then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					l_children := document_symbol_list_in_object (a_object, {LS_DOCUMENT_SYMBOL}.children_name, True)
					if attached last_error as l_last_error then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					create Result.make (l_name, l_detail, l_kind, l_tags, l_deprecated, l_range, l_selection_range, l_children)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	document_symbol_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DOCUMENT_SYMBOL
			-- Document symbol stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DOCUMENT_SYMBOL} l_value as l_document_symbol then
				Result := l_document_symbol
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := document_symbol_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	document_symbol_capabilities_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DOCUMENT_SYMBOL_CAPABILITIES
			-- Convert `a_object` to a document symbol capabilities.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_dynamic_registration: detachable LS_BOOLEAN
			l_symbol_kind: detachable LS_SYMBOL_KIND_SET
			l_hierarchical_document_symbol_support: detachable LS_BOOLEAN
			l_tag_support: detachable LS_SYMBOL_TAG_SET
			l_label_support: detachable LS_BOOLEAN
		do
			last_error := Void
			l_dynamic_registration := boolean_in_object (a_object, {LS_DOCUMENT_SYMBOL_CAPABILITIES}.dynamic_registration_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_symbol_kind := symbol_kind_set_in_object (a_object, {LS_DOCUMENT_SYMBOL_CAPABILITIES}.symbol_kind_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_hierarchical_document_symbol_support := boolean_in_object (a_object, {LS_DOCUMENT_SYMBOL_CAPABILITIES}.hierarchical_document_symbol_support_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_tag_support := symbol_tag_set_in_object (a_object, {LS_DOCUMENT_SYMBOL_CAPABILITIES}.tag_support_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_label_support := boolean_in_object (a_object, {LS_DOCUMENT_SYMBOL_CAPABILITIES}.label_support_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make (l_dynamic_registration, l_symbol_kind, l_hierarchical_document_symbol_support, l_tag_support, l_label_support)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	document_symbol_capabilities_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DOCUMENT_SYMBOL_CAPABILITIES
			-- Document symbol capabilities stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DOCUMENT_SYMBOL_CAPABILITIES} l_value as l_document_symbol_capabilities then
				Result := l_document_symbol_capabilities
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := document_symbol_capabilities_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	document_symbol_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_DOCUMENT_SYMBOL_LIST
			-- Convert `a_array` to document symbol list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached document_symbol_from_object (l_object, i.out) as l_document_symbol then
					Result.put_last (l_document_symbol)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	document_symbol_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DOCUMENT_SYMBOL_LIST
			-- Document symbol list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DOCUMENT_SYMBOL_LIST} l_value as l_document_symbol_list then
				Result := l_document_symbol_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := document_symbol_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	document_symbol_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DOCUMENT_SYMBOL_OPTIONS
			-- Convert `a_object` to a document symbol options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_label: detachable LS_STRING
			l_work_done_progress: detachable LS_BOOLEAN
		do
			last_error := Void
			l_label := string_in_object (a_object, {LS_DOCUMENT_SYMBOL_OPTIONS}.label_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_work_done_progress := boolean_in_object (a_object, {LS_DOCUMENT_SYMBOL_OPTIONS}.work_done_progress_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make (l_label, l_work_done_progress)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	document_symbol_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DOCUMENT_SYMBOL_OPTIONS
			-- Document symbol options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DOCUMENT_SYMBOL_OPTIONS} l_value as l_document_symbol_options then
				Result := l_document_symbol_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := document_symbol_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	document_symbol_registration_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_DOCUMENT_SYMBOL_REGISTRATION_OPTIONS
			-- Convert `a_object` to a document symbol registration options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_label: detachable LS_STRING
			l_work_done_progress: detachable LS_BOOLEAN
		do
			last_error := Void
			if not attached optional_document_selector_in_object (a_object, {LS_DOCUMENT_SYMBOL_REGISTRATION_OPTIONS}.document_selector_name, False) as l_document_selector then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_DOCUMENT_SYMBOL_REGISTRATION_OPTIONS}.document_selector_name + ": missing field"
				end
			else
				l_label := string_in_object (a_object, {LS_DOCUMENT_SYMBOL_REGISTRATION_OPTIONS}.label_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
				if last_error = Void then
					l_work_done_progress := boolean_in_object (a_object, {LS_DOCUMENT_SYMBOL_REGISTRATION_OPTIONS}.work_done_progress_name, True)
					if attached last_error as l_last_error then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					create Result.make (l_label, l_document_selector, l_work_done_progress)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	document_symbol_registration_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DOCUMENT_SYMBOL_REGISTRATION_OPTIONS
			-- Document symbol registration options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_DOCUMENT_SYMBOL_REGISTRATION_OPTIONS} l_value as l_document_symbol_registration_options then
				Result := l_document_symbol_registration_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := document_symbol_registration_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	document_uri_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_DOCUMENT_URI
			-- Convert `a_any` to a document URI.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_DOCUMENT_URI} a_any as l_document_uri then
				Result := l_document_uri
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	document_uri_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_DOCUMENT_URI
			-- Document URI stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := document_uri_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	file_change_type_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_FILE_CHANGE_TYPE
			-- Convert `a_any` to a file change type.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_FILE_CHANGE_TYPE} a_any as l_file_change_type then
				Result := l_file_change_type
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	file_change_type_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_FILE_CHANGE_TYPE
			-- File change type stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := file_change_type_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	file_event_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_FILE_EVENT
			-- Convert `a_object` to a file event.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached document_uri_in_object (a_object, {LS_FILE_EVENT}.uri_name, False) as l_uri then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_FILE_EVENT}.uri_name + ": missing field"
				end
			elseif not attached file_change_type_in_object (a_object, {LS_FILE_EVENT}.type_name, False) as l_type then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_FILE_EVENT}.type_name + ": missing field"
				end
			else
				create Result.make (l_uri, l_type)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	file_event_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_FILE_EVENT
			-- File event stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_FILE_EVENT} l_value as l_file_event then
				Result := l_file_event
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := file_event_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	file_event_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_FILE_EVENT_LIST
			-- Convert `a_array` to file event list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached file_event_from_object (l_object, i.out) as l_file_event then
					Result.put_last (l_file_event)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	file_event_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_FILE_EVENT_LIST
			-- File event list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_FILE_EVENT_LIST} l_value as l_file_event_list then
				Result := l_file_event_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := file_event_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	file_system_watcher_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_FILE_SYSTEM_WATCHER
			-- Convert `a_object` to a file system watcher.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_kind: detachable LS_WATCH_KIND
		do
			last_error := Void
			if not attached glob_pattern_in_object (a_object, {LS_FILE_SYSTEM_WATCHER}.glob_pattern_name, False) as l_glob_pattern then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_FILE_SYSTEM_WATCHER}.glob_pattern_name + ": missing field"
				end
			else
				l_kind := watch_kind_in_object (a_object, {LS_FILE_SYSTEM_WATCHER}.kind_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					create Result.make (l_glob_pattern, l_kind)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	file_system_watcher_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_FILE_SYSTEM_WATCHER
			-- File system watcher stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_FILE_SYSTEM_WATCHER} l_value as l_file_system_watcher then
				Result := l_file_system_watcher
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := file_system_watcher_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	file_system_watcher_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_FILE_SYSTEM_WATCHER_LIST
			-- Convert `a_array` to file system watcher list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			if not attached {LS_OBJECT} a_array.value (1) as l_first_object then
				last_error := a_field_name + ".1: invalid type"
			else
				nb := a_array.count
				create Result.make_with_capacity (nb)
				from i := 1 until i > nb loop
					if not attached {LS_OBJECT} a_array.value (i) as l_object then
						last_error := a_field_name + "." + i.out + ": invalid type"
						i := nb + 1 -- Jump out of the loop.
					elseif attached file_system_watcher_from_object (l_object, i.out) as l_file_system_watcher then
						Result.put_last (l_file_system_watcher)
						i := i + 1
					elseif attached last_error as l_last_error then
						last_error := a_field_name + "." + l_last_error
						i := nb + 1 -- Jump out of the loop.
					else
						last_error := a_field_name + "." + i.out + ": invalid type"
						i := nb + 1 -- Jump out of the loop.
					end
				end
				if last_error /= Void then
					Result := Void
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	file_system_watcher_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_FILE_SYSTEM_WATCHER_LIST
			-- File system watcher list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_FILE_SYSTEM_WATCHER_LIST} l_value as l_file_system_watcher_list then
				Result := l_file_system_watcher_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := file_system_watcher_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	glob_pattern_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_GLOB_PATTERN
			-- Convert `a_any` to a glob pattern.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_GLOB_PATTERN} a_any as l_glob_pattern then
				Result := l_glob_pattern
			elseif attached {LS_OBJECT} a_any as l_object and then attached relative_pattern_from_object (l_object, a_field_name) as l_relative_pattern then
				Result := l_relative_pattern
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	glob_pattern_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_GLOB_PATTERN
			-- Glob pattern stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := glob_pattern_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	hover_capabilities_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_HOVER_CAPABILITIES
			-- Convert `a_object` to a hover capabilities.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_dynamic_registration: detachable LS_BOOLEAN
			l_content_format: detachable LS_MARKUP_KIND_LIST
		do
			last_error := Void
			l_dynamic_registration := boolean_in_object (a_object, {LS_HOVER_CAPABILITIES}.dynamic_registration_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_content_format := markup_kind_list_in_object (a_object, {LS_HOVER_CAPABILITIES}.content_format_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make (l_dynamic_registration, l_content_format)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	hover_capabilities_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_HOVER_CAPABILITIES
			-- Hover capabilities stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_HOVER_CAPABILITIES} l_value as l_hover_capabilities then
				Result := l_hover_capabilities
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := hover_capabilities_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	hover_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_HOVER_OPTIONS
			-- Convert `a_object` to a hover options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_work_done_progress: detachable LS_BOOLEAN
		do
			last_error := Void
			l_work_done_progress := boolean_in_object (a_object, {LS_HOVER_OPTIONS}.work_done_progress_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			else
				create Result.make (l_work_done_progress)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	hover_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_HOVER_OPTIONS
			-- Hover options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_HOVER_OPTIONS} l_value as l_hover_options then
				Result := l_hover_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := hover_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	hover_registration_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_HOVER_REGISTRATION_OPTIONS
			-- Convert `a_object` to a hover registration options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_work_done_progress: detachable LS_BOOLEAN
		do
			last_error := Void
			if not attached optional_document_selector_in_object (a_object, {LS_HOVER_REGISTRATION_OPTIONS}.document_selector_name, False) as l_document_selector then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_HOVER_REGISTRATION_OPTIONS}.document_selector_name + ": missing field"
				end
			else
				l_work_done_progress := boolean_in_object (a_object, {LS_HOVER_REGISTRATION_OPTIONS}.work_done_progress_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					create Result.make (l_document_selector, l_work_done_progress)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	hover_registration_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_HOVER_REGISTRATION_OPTIONS
			-- Hover registration options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_HOVER_REGISTRATION_OPTIONS} l_value as l_hover_registration_options then
				Result := l_hover_registration_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := hover_registration_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	hover_result_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_HOVER_RESULT
			-- Convert `a_object` to a hover result.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_range: detachable LS_RANGE
		do
			last_error := Void
			if not attached string_content_in_object (a_object, {LS_HOVER_RESULT}.contents_name, False) as l_contents then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_HOVER_RESULT}.contents_name + ": missing field"
				end
			else
				l_range := range_in_object (a_object, {LS_HOVER_RESULT}.range_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					create Result.make_with_range (l_contents, l_range)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	hover_result_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_HOVER_RESULT
			-- Hover result stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_HOVER_RESULT} l_value as l_hover_result then
				Result := l_hover_result
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := hover_result_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	initialize_error_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_INITIALIZE_ERROR
			-- Convert `a_object` to a initialize error.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached boolean_in_object (a_object, {LS_INITIALIZE_ERROR}.retry_name, False) as l_retry then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_INITIALIZE_ERROR}.retry_name + ": missing field"
				end
			else
				create Result.make (l_retry)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	initialize_error_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_INITIALIZE_ERROR
			-- Initialize error stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_INITIALIZE_ERROR} l_value as l_initialize_error then
				Result := l_initialize_error
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := initialize_error_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	initialize_result_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_INITIALIZE_RESULT
			-- Convert `a_object` to a initialize result.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached server_capabilities_in_object (a_object, {LS_INITIALIZE_RESULT}.capabilities_name, False) as l_capabilities then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_INITIALIZE_RESULT}.capabilities_name + ": missing field"
				end
			else
				create Result.make (l_capabilities)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	initialize_result_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_INITIALIZE_RESULT
			-- Initialize result stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_INITIALIZE_RESULT} l_value as l_initialize_result then
				Result := l_initialize_result
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := initialize_result_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	integer_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_INTEGER
			-- Convert `a_any` to an integer.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_INTEGER} a_any as l_integer then
				Result := l_integer
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	integer_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_INTEGER
			-- Integer stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := integer_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	location_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_LOCATION
			-- Convert `a_object` to a location.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached document_uri_in_object (a_object, {LS_LOCATION}.uri_name, False) as l_uri then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_LOCATION}.uri_name + ": missing field"
				end
			elseif not attached range_in_object (a_object, {LS_LOCATION}.range_name, False) as l_range then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_LOCATION}.range_name + ": missing field"
				end
			else
				create Result.make (l_uri, l_range)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	location_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_LOCATION
			-- Location stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_LOCATION} l_value as l_location then
				Result := l_location
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := location_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	location_link_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_LOCATION_LINK
			-- Convert `a_object` to a location link.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_origin_selection_range: detachable LS_RANGE
		do
			last_error := Void
			if not attached document_uri_in_object (a_object, {LS_LOCATION_LINK}.target_uri_name, False) as l_target_uri then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_LOCATION_LINK}.target_uri_name + ": missing field"
				end
			elseif not attached range_in_object (a_object, {LS_LOCATION_LINK}.target_range_name, False) as l_target_range then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_LOCATION_LINK}.target_range_name + ": missing field"
				end
			elseif not attached range_in_object (a_object, {LS_LOCATION_LINK}.target_selection_range_name, False) as l_target_selection_range then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_LOCATION_LINK}.target_selection_range_name + ": missing field"
				end
			else
				l_origin_selection_range := range_in_object (a_object, {LS_LOCATION_LINK}.origin_selection_range_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					create Result.make (l_origin_selection_range, l_target_uri, l_target_range, l_target_selection_range)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	location_link_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_LOCATION_LINK
			-- Location link stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_LOCATION_LINK} l_value as l_location_link then
				Result := l_location_link
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := location_link_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	location_link_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_LOCATION_LINK_LIST
			-- Convert `a_array` to location link list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached location_link_from_object (l_object, i.out) as l_location_link then
					Result.put_last (l_location_link)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	location_link_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_LOCATION_LINK_LIST
			-- Location link list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_LOCATION_LINK_LIST} l_value as l_location_link_list then
				Result := l_location_link_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := location_link_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	location_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_LOCATION_LIST
			-- Convert `a_array` to location list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached location_from_object (l_object, i.out) as l_location then
					Result.put_last (l_location)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	location_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_LOCATION_LIST
			-- Location list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_LOCATION_LIST} l_value as l_location_list then
				Result := l_location_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := location_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	marked_string_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_MARKED_STRING_LIST
			-- Convert `a_array` to marked string list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if attached marked_string_from_any (a_array.value (i), i.out) as l_marked_string then
					Result.put_last (l_marked_string)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	marked_string_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_MARKED_STRING_LIST
			-- Marked string list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_MARKED_STRING_LIST} l_value as l_marked_string_list then
				Result := l_marked_string_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := marked_string_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	marked_string_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_MARKED_STRING
			-- Convert `a_any` to a marked string.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_MARKED_STRING} a_any as l_marked_string then
				Result := l_marked_string
			elseif attached {LS_OBJECT} a_any as l_object and then attached code_block_from_object (l_object, a_field_name) as l_code_block then
				Result := l_code_block
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	marked_string_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_MARKED_STRING
			-- Marked string stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := marked_string_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	markup_content_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_MARKUP_CONTENT
			-- Convert `a_object` to a markup content.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached markup_kind_in_object (a_object, {LS_MARKUP_CONTENT}.kind_name, False) as l_kind then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_MARKUP_CONTENT}.kind_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_MARKUP_CONTENT}.value_name, False) as l_string then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_MARKUP_CONTENT}.value_name + ": missing field"
				end
			else
				create Result.make (l_kind, l_string)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	markup_content_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_MARKUP_CONTENT
			-- Markup content stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_MARKUP_CONTENT} l_value as l_markup_kind then
				Result := l_markup_kind
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := markup_content_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	markup_kind_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_MARKUP_KIND
			-- Convert `a_any` to a markup kind.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_MARKUP_KIND} a_any as l_markup_kind then
				Result := l_markup_kind
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	markup_kind_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_MARKUP_KIND
			-- Markup kind stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := markup_kind_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	markup_kind_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_MARKUP_KIND_LIST
			-- Convert `a_array` to markup kind list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if attached markup_kind_from_any (a_array.value (i), i.out) as l_markup_kind then
					Result.put_last (l_markup_kind)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	markup_kind_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_MARKUP_KIND_LIST
			-- Markup kind list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_MARKUP_KIND_LIST} l_value as l_markup_kind_list then
				Result := l_markup_kind_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := markup_kind_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	null_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_NULL
			-- Convert `a_any` to a null.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_NULL} a_any as l_null then
				Result := l_null
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	null_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_NULL
			-- Null stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := null_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	number_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_NUMBER
			-- Convert `a_any` to a number.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_NUMBER} a_any as l_number then
				Result := l_number
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	number_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_NUMBER
			-- Number stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := number_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_definition_options_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_DEFINITION_OPTIONS
			-- Convert `a_any` to an optional definition options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_DEFINITION_OPTIONS} a_any as l_optional_definition_options then
				Result := l_optional_definition_options
			elseif attached {LS_OBJECT} a_any as l_object and then attached definition_options_from_object (l_object, a_field_name) as l_definition_options then
				Result := l_definition_options
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_definition_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_DEFINITION_OPTIONS
			-- Optional definition options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_definition_options_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_definition_result_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_DEFINITION_RESULT
			-- Convert `a_any` to an optional definition result.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_DEFINITION_RESULT} a_any as l_optional_definition_result then
				Result := l_optional_definition_result
			elseif attached {LS_OBJECT} a_any as l_object and then attached location_from_object (l_object, a_field_name) as l_location then
				Result := l_location
			elseif attached {LS_ARRAY} a_any as l_array and then attached location_list_from_array (l_array, a_field_name) as l_location_list then
				Result := l_location_list
			elseif attached {LS_ARRAY} a_any as l_array and then attached location_link_list_from_array (l_array, a_field_name) as l_location_link_list then
				Result := l_location_link_list
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_definition_result_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_DEFINITION_RESULT
			-- Optional definition result stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_definition_result_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_did_save_text_document_options_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_DID_SAVE_TEXT_DOCUMENT_OPTIONS
			-- Convert `a_any` to an optional did save text document options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_DID_SAVE_TEXT_DOCUMENT_OPTIONS} a_any as l_optional_did_save_text_document_options then
				Result := l_optional_did_save_text_document_options
			elseif attached {LS_OBJECT} a_any as l_object and then attached did_save_text_document_options_from_object (l_object, a_field_name) as l_did_save_text_document_options then
				Result := l_did_save_text_document_options
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_did_save_text_document_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_DID_SAVE_TEXT_DOCUMENT_OPTIONS
			-- Optional did save text document options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_did_save_text_document_options_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_document_selector_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_DOCUMENT_SELECTOR
			-- Convert `a_any` to an optional document selector.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_DOCUMENT_SELECTOR} a_any as l_optional_document_selector then
				Result := l_optional_document_selector
			elseif attached {LS_ARRAY} a_any as l_array and then attached document_selector_from_array (l_array, a_field_name) as l_document_selector then
				Result := l_document_selector
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_document_selector_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_DOCUMENT_SELECTOR
			-- Optional document selector stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_document_selector_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_document_symbol_options_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_DOCUMENT_SYMBOL_OPTIONS
			-- Convert `a_any` to an optional document symbol options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_DOCUMENT_SYMBOL_OPTIONS} a_any as l_optional_document_symbol_options then
				Result := l_optional_document_symbol_options
			elseif attached {LS_OBJECT} a_any as l_object and then attached document_symbol_options_from_object (l_object, a_field_name) as l_document_symbol_options then
				Result := l_document_symbol_options
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_document_symbol_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_DOCUMENT_SYMBOL_OPTIONS
			-- Optional document symbol options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_document_symbol_options_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_document_symbol_result_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_DOCUMENT_SYMBOL_RESULT
			-- Convert `a_any` to an optional document symbol result.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_DOCUMENT_SYMBOL_RESULT} a_any as l_optional_document_symbol_result then
				Result := l_optional_document_symbol_result
			elseif attached {LS_ARRAY} a_any as l_array and then attached document_symbol_list_from_array (l_array, a_field_name) as l_document_symbol_list then
				Result := l_document_symbol_list
			elseif attached {LS_ARRAY} a_any as l_array and then attached symbol_information_list_from_array (l_array, a_field_name) as l_symbol_information_list then
				Result := l_symbol_information_list
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_document_symbol_result_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_DOCUMENT_SYMBOL_RESULT
			-- Optional document symbol result stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_document_symbol_result_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_document_uri_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_DOCUMENT_URI
			-- Convert `a_any` to an optional document URI.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_DOCUMENT_URI} a_any as l_optional_document_uri then
				Result := l_optional_document_uri
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_document_uri_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_DOCUMENT_URI
			-- Optional document URI stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_document_uri_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_hover_options_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_HOVER_OPTIONS
			-- Convert `a_any` to an optional hover options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_HOVER_OPTIONS} a_any as l_optional_hover_options then
				Result := l_optional_hover_options
			elseif attached {LS_OBJECT} a_any as l_object and then attached hover_options_from_object (l_object, a_field_name) as l_hover_options then
				Result := l_hover_options
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_hover_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_HOVER_OPTIONS
			-- Optional hover options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_hover_options_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_hover_result_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_HOVER_RESULT
			-- Convert `a_any` to an optional hover result.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_HOVER_RESULT} a_any as l_optional_hover_result then
				Result := l_optional_hover_result
			elseif attached {LS_OBJECT} a_any as l_object and then attached hover_result_from_object (l_object, a_field_name) as l_hover_result then
				Result := l_hover_result
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_hover_result_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_HOVER_RESULT
			-- Optional hover result stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_hover_result_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_integer_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_INTEGER
			-- Convert `a_any` to an optional integer.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_INTEGER} a_any as l_optional_integer then
				Result := l_optional_integer
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_integer_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_INTEGER
			-- Optional integer stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_integer_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_string_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_STRING
			-- Convert `a_any` to an optional string.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_STRING} a_any as l_optional_string then
				Result := l_optional_string
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_string_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_STRING
			-- Optional string stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_string_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_version_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_VERSION
			-- Convert `a_any` to an optional version.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_VERSION} a_any as l_optional_version then
				Result := l_optional_version
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_version_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_VERSION
			-- Optional version stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_version_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_versioned_text_document_identifier_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER
			-- Convert `a_object` to an optional versioned text document identifier.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached document_uri_in_object (a_object, {LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.uri_name, False) as l_uri then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.uri_name + ": missing field"
				end
			elseif not attached optional_version_in_object (a_object, {LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.version_name, False) as l_version then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.version_name + ": missing field"
				end
			else
				create Result.make (l_uri, l_version)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_versioned_text_document_identifier_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER
			-- Optional versioned text document identifier stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER} l_value as l_optional_versioned_text_document_identifier then
				Result := l_optional_versioned_text_document_identifier
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := optional_versioned_text_document_identifier_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_will_save_wait_until_text_document_result_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_RESULT
			-- Convert `a_any` to an optional will save wait until text document result.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_RESULT} a_any as l_optional_will_save_wait_until_text_document_result then
				Result := l_optional_will_save_wait_until_text_document_result
			elseif attached {LS_ARRAY} a_any as l_array and then attached text_edit_list_from_array (l_array, a_field_name) as l_text_edit_list then
				Result := l_text_edit_list
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_will_save_wait_until_text_document_result_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_RESULT
			-- Optional will save wait until text document result stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_will_save_wait_until_text_document_result_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	optional_workspace_folder_list_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_OPTIONAL_WORKSPACE_FOLDER_LIST
			-- Convert `a_any` to an optional workspace folder list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_OPTIONAL_WORKSPACE_FOLDER_LIST} a_any as l_optional_workspace_folder_list then
				Result := l_optional_workspace_folder_list
			elseif attached {LS_ARRAY} a_any as l_array and then attached workspace_folder_list_from_array (l_array, a_field_name) as l_workspace_folder_list then
				Result := l_workspace_folder_list
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	optional_workspace_folder_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_OPTIONAL_WORKSPACE_FOLDER_LIST
			-- Optional workspace folder list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := optional_workspace_folder_list_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	pattern_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_PATTERN
			-- Convert `a_any` to a pattern.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_PATTERN} a_any as l_pattern then
				Result := l_pattern
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	pattern_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_PATTERN
			-- Pattern stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := pattern_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	position_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_POSITION
			-- Convert `a_object` to a position.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached uinteger_in_object (a_object, {LS_POSITION}.line_name, False) as l_line then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_POSITION}.line_name + ": missing field"
				end
			elseif not attached uinteger_in_object (a_object, {LS_POSITION}.character_name, False) as l_character then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_POSITION}.character_name + ": missing field"
				end
			else
				create Result.make (l_line, l_character)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	position_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_POSITION
			-- Position stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_POSITION} l_value as l_position then
				Result := l_position
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := position_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	position_encoding_kind_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_POSITION_ENCODING_KIND
			-- Convert `a_any` to a position encoding kind.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_POSITION_ENCODING_KIND} a_any as l_position_encoding_kind then
				Result := l_position_encoding_kind
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	position_encoding_kind_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_POSITION_ENCODING_KIND
			-- Position encoding kind stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := position_encoding_kind_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	progress_token_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_PROGRESS_TOKEN
			-- Convert `a_any` to a progress token.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_PROGRESS_TOKEN} a_any as l_progress_token then
				Result := l_progress_token
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	progress_token_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_PROGRESS_TOKEN
			-- Optional version stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := progress_token_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	publish_diagnostics_capabilities_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_PUBLISH_DIAGNOSTICS_CAPABILITIES
			-- Convert `a_object` to a publish diagnostics capabilities.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_related_information: detachable LS_BOOLEAN
			l_tag_support: detachable LS_DIAGNOSTIC_TAG_SET
			l_version_support: detachable LS_BOOLEAN
			l_code_description_support: detachable LS_BOOLEAN
			l_data_support: detachable LS_BOOLEAN
		do
			last_error := Void
			l_related_information := boolean_in_object (a_object, {LS_PUBLISH_DIAGNOSTICS_CAPABILITIES}.related_information_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_tag_support := diagnostic_tag_set_in_object (a_object, {LS_PUBLISH_DIAGNOSTICS_CAPABILITIES}.tag_support_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_version_support := boolean_in_object (a_object, {LS_PUBLISH_DIAGNOSTICS_CAPABILITIES}.version_support_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_code_description_support := boolean_in_object (a_object, {LS_PUBLISH_DIAGNOSTICS_CAPABILITIES}.code_description_support_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_data_support := boolean_in_object (a_object, {LS_PUBLISH_DIAGNOSTICS_CAPABILITIES}.data_support_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make (l_related_information, l_tag_support, l_version_support, l_code_description_support, l_data_support)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	publish_diagnostics_capabilities_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_PUBLISH_DIAGNOSTICS_CAPABILITIES
			-- Publish diagnostics capabilities stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_PUBLISH_DIAGNOSTICS_CAPABILITIES} l_value as l_publish_diagnostics_capabilities then
				Result := l_publish_diagnostics_capabilities
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := publish_diagnostics_capabilities_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	range_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_RANGE
			-- Convert `a_object` to a range.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached position_in_object (a_object, {LS_RANGE}.start_name, False) as l_start then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_RANGE}.start_name + ": missing field"
				end
			elseif not attached position_in_object (a_object, {LS_RANGE}.end_name, False) as l_end then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_RANGE}.end_name + ": missing field"
				end
			else
				create Result.make (l_start, l_end)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	range_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_RANGE
			-- Range stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_RANGE} l_value as l_position then
				Result := l_position
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := range_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	registration_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_REGISTRATION
			-- Convert `a_object` to a registration.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_register_options: detachable LS_ANY
		do
			last_error := Void
			if not attached string_in_object (a_object, {LS_REGISTRATION}.id_name, False) as l_id then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_REGISTRATION}.id_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_REGISTRATION}.method_name, False) as l_method then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_REGISTRATION}.method_name + ": missing field"
				end
			else
				l_register_options := a_object.value ({LS_REGISTRATION}.register_options_name)
				create Result.make (l_id, l_method, l_register_options)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	registration_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_REGISTRATION
			-- Registration stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_REGISTRATION} l_value as l_registration then
				Result := l_registration
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := registration_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	registration_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_REGISTRATION_LIST
			-- Convert `a_array` to registration list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached registration_from_object (l_object, i.out) as l_registration then
					Result.put_last (l_registration)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	registration_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_REGISTRATION_LIST
			-- Registration list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_REGISTRATION_LIST} l_value as l_registration_list then
				Result := l_registration_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := registration_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	relative_pattern_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_RELATIVE_PATTERN
			-- Convert `a_object` to a relative pattern.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached base_uri_in_object (a_object, {LS_RELATIVE_PATTERN}.base_uri_name, False) as l_base_uri then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_RELATIVE_PATTERN}.base_uri_name + ": missing field"
				end
			elseif not attached pattern_in_object (a_object, {LS_RELATIVE_PATTERN}.pattern_name, False) as l_pattern then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_RELATIVE_PATTERN}.pattern_name + ": missing field"
				end
			else
				create Result.make (l_base_uri, l_pattern)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	relative_pattern_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_RELATIVE_PATTERN
			-- Relative pattern stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_RELATIVE_PATTERN} l_value as l_relative_pattern then
				Result := l_relative_pattern
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := relative_pattern_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	request_id_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_REQUEST_ID
			-- Convert `a_any` to a request id.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_REQUEST_ID} a_any as l_request_id then
				Result := l_request_id
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	response_error_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_RESPONSE_ERROR
			-- Convert `a_object` to a response error.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_data: detachable LS_ANY
		do
			last_error := Void
			if not attached integer_in_object (a_object, {LS_RESPONSE_ERROR}.code_name, False) as l_code then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_RESPONSE_ERROR}.code_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_RESPONSE_ERROR}.message_name, False) as l_message then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_RESPONSE_ERROR}.message_name + ": missing field"
				end
			else
				l_data := a_object.value ({LS_RESPONSE_ERROR}.data_name)
				create Result.make_with_data (l_code, l_message, l_data)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	response_error_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_RESPONSE_ERROR
			-- Response error stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_RESPONSE_ERROR} l_value as l_response_error then
				Result := l_response_error
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := response_error_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	request_id_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_REQUEST_ID
			-- Request id stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := request_id_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	response_id_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_RESPONSE_ID
			-- Convert `a_any` to a response id.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_RESPONSE_ID} a_any as l_response_id then
				Result := l_response_id
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	response_id_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_RESPONSE_ID
			-- Response id stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := response_id_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	server_capabilities_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_SERVER_CAPABILITIES
			-- Convert `a_object` to a server capabilities.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_text_document_sync: detachable LS_TEXT_DOCUMENT_SYNC_GENERAL_OPTIONS
			l_hover_provider: detachable LS_OPTIONAL_HOVER_OPTIONS
			l_definition_provider: detachable LS_OPTIONAL_DEFINITION_OPTIONS
			l_document_symbol_provider: detachable LS_OPTIONAL_DOCUMENT_SYMBOL_OPTIONS
		do
			last_error := Void
			l_text_document_sync := text_document_sync_general_options_in_object (a_object, {LS_SERVER_CAPABILITIES}.text_document_sync_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_hover_provider := optional_hover_options_in_object (a_object, {LS_SERVER_CAPABILITIES}.hover_provider_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_definition_provider := optional_definition_options_in_object (a_object, {LS_SERVER_CAPABILITIES}.definition_provider_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_document_symbol_provider := optional_document_symbol_options_in_object (a_object, {LS_SERVER_CAPABILITIES}.document_symbol_provider_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make
				Result.set_text_document_sync (l_text_document_sync)
				Result.set_hover_provider (l_hover_provider)
				Result.set_definition_provider (l_definition_provider)
				Result.set_document_symbol_provider (l_document_symbol_provider)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	server_capabilities_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_SERVER_CAPABILITIES
			-- Server capabilities stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_SERVER_CAPABILITIES} l_value as l_server_capabilities then
				Result := l_server_capabilities
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := server_capabilities_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	string_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_STRING
			-- Convert `a_any` to a string.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_STRING} a_any as l_string then
				Result := l_string
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	string_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_STRING
			-- String stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := string_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	string_content_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_STRING_CONTENT
			-- Convert `a_any` to a string content.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_STRING_CONTENT} a_any as l_string_content then
				Result := l_string_content
			elseif attached {LS_ARRAY} a_any as l_array and then attached marked_string_list_from_array (l_array, a_field_name) as l_marked_string_list then
				Result := l_marked_string_list
			elseif not attached {LS_OBJECT} a_any as l_object then
				last_error := a_field_name + ": invalid type"
			elseif attached markup_content_from_object (l_object, a_field_name) as l_markup_content then
				Result := l_markup_content
			elseif attached code_block_from_object (l_object, a_field_name) as l_code_block then
				Result := l_code_block
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	string_content_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_STRING_CONTENT
			-- String content stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := string_content_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	symbol_information_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_SYMBOL_INFORMATION
			-- Convert `a_object` to a symbol information.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_tags: detachable LS_SYMBOL_TAG_LIST
			l_deprecated: detachable LS_BOOLEAN
			l_container_name: detachable LS_STRING
		do
			last_error := Void
			if not attached string_in_object (a_object, {LS_SYMBOL_INFORMATION}.name_name, False) as l_name then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_SYMBOL_INFORMATION}.name_name + ": missing field"
				end
			elseif not attached symbol_kind_in_object (a_object, {LS_SYMBOL_INFORMATION}.kind_name, False) as l_kind then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_SYMBOL_INFORMATION}.kind_name + ": missing field"
				end
			elseif not attached location_in_object (a_object, {LS_SYMBOL_INFORMATION}.location_name, False) as l_location then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_SYMBOL_INFORMATION}.location_name + ": missing field"
				end
			else
				l_tags := symbol_tag_list_in_object (a_object, {LS_SYMBOL_INFORMATION}.tags_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
				if last_error = Void then
					l_deprecated := boolean_in_object (a_object, {LS_SYMBOL_INFORMATION}.deprecated_name, True)
					if attached last_error as l_last_error then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					l_container_name := string_in_object (a_object, {LS_SYMBOL_INFORMATION}.container_name_name, True)
					if attached last_error as l_last_error then
						last_error := a_field_name + "." + l_last_error
					end
				end
				if last_error = Void then
					create Result.make (l_name, l_kind, l_tags, l_deprecated, l_location, l_container_name)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	symbol_information_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_SYMBOL_INFORMATION
			-- Symbol information stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_SYMBOL_INFORMATION} l_value as l_symbol_information then
				Result := l_symbol_information
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := symbol_information_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	symbol_information_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_SYMBOL_INFORMATION_LIST
			-- Convert `a_array` to symbol information list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached symbol_information_from_object (l_object, i.out) as l_symbol_information then
					Result.put_last (l_symbol_information)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	symbol_information_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_SYMBOL_INFORMATION_LIST
			-- Symbol information list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_SYMBOL_INFORMATION_LIST} l_value as l_symbol_information_list then
				Result := l_symbol_information_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := symbol_information_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	symbol_kind_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_SYMBOL_KIND
			-- Convert `a_any` to a symbol kind.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_SYMBOL_KIND} a_any as l_symbol_kind then
				Result := l_symbol_kind
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	symbol_kind_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_SYMBOL_KIND
			-- Symbol kind stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := symbol_kind_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	symbol_kind_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_SYMBOL_KIND_LIST
			-- Convert `a_array` to symbol kind list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if attached symbol_kind_from_any (a_array.value (i), i.out) as l_symbol_kind then
					Result.put_last (l_symbol_kind)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	symbol_kind_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_SYMBOL_KIND_LIST
			-- Symbol kind list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_SYMBOL_KIND_LIST} l_value as l_symbol_kind_list then
				Result := l_symbol_kind_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := symbol_kind_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	symbol_kind_set_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_SYMBOL_KIND_SET
			-- Convert `a_object` to a symbol kind set.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value_set: detachable LS_SYMBOL_KIND_LIST
		do
			last_error := Void
			l_value_set := symbol_kind_list_in_object (a_object, {LS_SYMBOL_KIND_SET}.value_set_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			else
				create Result.make (l_value_set)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	symbol_kind_set_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_SYMBOL_KIND_SET
			-- Symbol kind set stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_SYMBOL_KIND_SET} l_value as l_symbol_kind_set then
				Result := l_symbol_kind_set
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := symbol_kind_set_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	symbol_tag_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_SYMBOL_TAG
			-- Convert `a_any` to a symbol tag.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_SYMBOL_TAG} a_any as l_symbol_tag then
				Result := l_symbol_tag
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	symbol_tag_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_SYMBOL_TAG
			-- Symbol tag stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := symbol_tag_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	symbol_tag_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_SYMBOL_TAG_LIST
			-- Convert `a_array` to symbol tag list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if attached symbol_tag_from_any (a_array.value (i), i.out) as l_symbol_tag then
					Result.put_last (l_symbol_tag)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	symbol_tag_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_SYMBOL_TAG_LIST
			-- Symbol tag list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_SYMBOL_TAG_LIST} l_value as l_symbol_tag_list then
				Result := l_symbol_tag_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := symbol_tag_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	symbol_tag_set_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_SYMBOL_TAG_SET
			-- Convert `a_object` to a symbol tag set.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached symbol_tag_list_in_object (a_object, {LS_SYMBOL_TAG_SET}.value_set_name, False) as l_value_set then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_SYMBOL_TAG_SET}.value_set_name + ": missing field"
				end
			else
				create Result.make (l_value_set)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	symbol_tag_set_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_SYMBOL_TAG_SET
			-- Symbol tag set stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_SYMBOL_TAG_SET} l_value as l_symbol_tag_set then
				Result := l_symbol_tag_set
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := symbol_tag_set_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_capabilities_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_CAPABILITIES
			-- Convert `a_object` to a text document capabilities.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_synchronization: detachable LS_TEXT_DOCUMENT_SYNC_CAPABILITIES
			l_hover: detachable LS_HOVER_CAPABILITIES
			l_definition: detachable LS_DEFINITION_CAPABILITIES
			l_document_symbol: detachable LS_DOCUMENT_SYMBOL_CAPABILITIES
			l_publish_diagnostics: detachable LS_PUBLISH_DIAGNOSTICS_CAPABILITIES
		do
			last_error := Void
			l_synchronization := text_document_sync_capabilities_in_object (a_object, {LS_TEXT_DOCUMENT_CAPABILITIES}.synchronization_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_hover := hover_capabilities_in_object (a_object, {LS_TEXT_DOCUMENT_CAPABILITIES}.hover_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_definition := definition_capabilities_in_object (a_object, {LS_TEXT_DOCUMENT_CAPABILITIES}.definition_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_document_symbol := document_symbol_capabilities_in_object (a_object, {LS_TEXT_DOCUMENT_CAPABILITIES}.document_symbol_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_publish_diagnostics := publish_diagnostics_capabilities_in_object (a_object, {LS_TEXT_DOCUMENT_CAPABILITIES}.publish_diagnostics_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make
				Result.set_synchronization (l_synchronization)
				Result.set_hover (l_hover)
				Result.set_definition (l_definition)
				Result.set_document_symbol (l_document_symbol)
				Result.set_publish_diagnostics (l_publish_diagnostics)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_capabilities_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_CAPABILITIES
			-- Text document capabilities stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_DOCUMENT_CAPABILITIES} l_value as l_text_document_capabilities then
				Result := l_text_document_capabilities
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_document_capabilities_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_content_change_event_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT
			-- Convert `a_object` to a text document content change event.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached text_document_full_content_change_event_from_object (a_object, a_field_name) as l_text_document_full_content_change_event then
				Result := l_text_document_full_content_change_event
			elseif attached text_document_incremental_content_change_event_from_object (a_object, a_field_name) as l_text_document_incremental_content_change_event then
				Result := l_text_document_incremental_content_change_event
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_content_change_event_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT
			-- Text document content change event stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT} l_value as l_text_document_content_change_event then
				Result := l_text_document_content_change_event
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_document_content_change_event_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_content_change_event_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT_LIST
			-- Convert `a_array` to text document content change event list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached text_document_content_change_event_from_object (l_object, i.out) as l_text_document_content_change_event then
					Result.put_last (l_text_document_content_change_event)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_content_change_event_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT_LIST
			-- Text document content change event list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT_LIST} l_value as l_text_document_content_change_event_list then
				Result := l_text_document_content_change_event_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_document_content_change_event_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_edit_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_EDIT
			-- Convert `a_object` to a text document edit.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached optional_versioned_text_document_identifier_in_object (a_object, {LS_TEXT_DOCUMENT_EDIT}.text_document_name, False) as l_text_document then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_DOCUMENT_EDIT}.text_document_name + ": missing field"
				end
			elseif not attached text_edit_list_in_object (a_object, {LS_TEXT_DOCUMENT_EDIT}.edits_name, False) as l_edits then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_DOCUMENT_EDIT}.edits_name + ": missing field"
				end
			else
				create Result.make (l_text_document, l_edits)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_edit_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_EDIT
			-- Text document edit item stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_DOCUMENT_EDIT} l_value as l_text_document_edit then
				Result := l_text_document_edit
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_document_edit_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_full_content_change_event_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_FULL_CONTENT_CHANGE_EVENT
			-- Convert `a_object` to a text document full content change event.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached string_in_object (a_object, {LS_TEXT_DOCUMENT_FULL_CONTENT_CHANGE_EVENT}.text_name, False) as l_text then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_DOCUMENT_FULL_CONTENT_CHANGE_EVENT}.text_name + ": missing field"
				end
			else
				create Result.make (l_text)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_full_content_change_event_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_FULL_CONTENT_CHANGE_EVENT
			-- Text document full content change event stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_DOCUMENT_FULL_CONTENT_CHANGE_EVENT} l_value as l_text_document_full_content_change_event then
				Result := l_text_document_full_content_change_event
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_document_full_content_change_event_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_identifier_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_IDENTIFIER
			-- Convert `a_object` to a text document identifier.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached document_uri_in_object (a_object, {LS_TEXT_DOCUMENT_IDENTIFIER}.uri_name, False) as l_document_uri then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_DOCUMENT_IDENTIFIER}.uri_name + ": missing field"
				end
			else
				create Result.make (l_document_uri)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_identifier_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_IDENTIFIER
			-- Text document identifier stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_DOCUMENT_IDENTIFIER} l_value as l_text_document_identifier then
				Result := l_text_document_identifier
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_document_identifier_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_incremental_content_change_event_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_INCREMENTAL_CONTENT_CHANGE_EVENT
			-- Convert `a_object` to a text document incremental content change event.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_range_length: detachable LS_UINTEGER
		do
			last_error := Void
			if not attached range_in_object (a_object, {LS_TEXT_DOCUMENT_INCREMENTAL_CONTENT_CHANGE_EVENT}.range_name, False) as l_range then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_DOCUMENT_INCREMENTAL_CONTENT_CHANGE_EVENT}.range_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_TEXT_DOCUMENT_INCREMENTAL_CONTENT_CHANGE_EVENT}.text_name, False) as l_text then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_DOCUMENT_INCREMENTAL_CONTENT_CHANGE_EVENT}.text_name + ": missing field"
				end
			else
				l_range_length := uinteger_in_object (a_object, {LS_TEXT_DOCUMENT_INCREMENTAL_CONTENT_CHANGE_EVENT}.range_length_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					create Result.make (l_range, l_range_length, l_text)
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_incremental_content_change_event_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_INCREMENTAL_CONTENT_CHANGE_EVENT
			-- Text document incremental content change event stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_DOCUMENT_INCREMENTAL_CONTENT_CHANGE_EVENT} l_value as l_text_document_incremental_content_change_event then
				Result := l_text_document_incremental_content_change_event
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_document_incremental_content_change_event_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_item_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_ITEM
			-- Convert `a_object` to a text document item.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached document_uri_in_object (a_object, {LS_TEXT_DOCUMENT_ITEM}.uri_name, False) as l_uri then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_DOCUMENT_ITEM}.uri_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_TEXT_DOCUMENT_ITEM}.language_id_name, False) as l_language_id then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_DOCUMENT_ITEM}.language_id_name + ": missing field"
				end
			elseif not attached integer_in_object (a_object, {LS_TEXT_DOCUMENT_ITEM}.version_name, False) as l_version then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_DOCUMENT_ITEM}.version_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_TEXT_DOCUMENT_ITEM}.text_name, False) as l_text then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_DOCUMENT_ITEM}.text_name + ": missing field"
				end
			else
				create Result.make (l_uri, l_language_id, l_version, l_text)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_item_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_ITEM
			-- Text document item stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_DOCUMENT_ITEM} l_value as l_text_document_item then
				Result := l_text_document_item
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_document_item_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_save_reason_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_SAVE_REASON
			-- Convert `a_any` to a text document save reason.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_TEXT_DOCUMENT_SAVE_REASON} a_any as l_text_document_save_reason then
				Result := l_text_document_save_reason
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_save_reason_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_SAVE_REASON
			-- Text document save reason stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := text_document_save_reason_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_sync_capabilities_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_SYNC_CAPABILITIES
			-- Convert `a_object` to a text document sync capabilities.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_dynamic_registration: detachable LS_BOOLEAN
			l_did_save: detachable LS_BOOLEAN
			l_will_save: detachable LS_BOOLEAN
			l_will_save_wait_until: detachable LS_BOOLEAN
		do
			last_error := Void
			l_dynamic_registration := boolean_in_object (a_object, {LS_TEXT_DOCUMENT_SYNC_CAPABILITIES}.dynamic_registration_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_will_save := boolean_in_object (a_object, {LS_TEXT_DOCUMENT_SYNC_CAPABILITIES}.will_save_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_will_save_wait_until := boolean_in_object (a_object, {LS_TEXT_DOCUMENT_SYNC_CAPABILITIES}.will_save_wait_until_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_did_save := boolean_in_object (a_object, {LS_TEXT_DOCUMENT_SYNC_CAPABILITIES}.did_save_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make (l_dynamic_registration, l_did_save, l_will_save, l_will_save_wait_until)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_sync_capabilities_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_SYNC_CAPABILITIES
			-- Text document sync capabilities stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_DOCUMENT_SYNC_CAPABILITIES} l_value as l_text_document_sync_capabilities then
				Result := l_text_document_sync_capabilities
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_document_sync_capabilities_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_sync_general_options_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_SYNC_GENERAL_OPTIONS
			-- Convert `a_any` to a text document sync general options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_TEXT_DOCUMENT_SYNC_GENERAL_OPTIONS} a_any as l_text_document_change_options then
				Result := l_text_document_change_options
			elseif attached {LS_OBJECT} a_any as l_object and then attached text_document_sync_options_from_object (l_object, a_field_name) as l_text_document_sync_options then
				Result := l_text_document_sync_options
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_sync_general_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_SYNC_GENERAL_OPTIONS
			-- Text document sync general options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := text_document_sync_general_options_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_sync_kind_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_SYNC_KIND
			-- Convert `a_any` to a text document sync kind.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_TEXT_DOCUMENT_SYNC_KIND} a_any as l_text_document_sync_kind then
				Result := l_text_document_sync_kind
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_sync_kind_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_SYNC_KIND
			-- Text document sync kind stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := text_document_sync_kind_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_document_sync_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_TEXT_DOCUMENT_SYNC_OPTIONS
			-- Convert `a_object` to a text document sync options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_open_close: detachable LS_BOOLEAN
			l_change: detachable LS_TEXT_DOCUMENT_SYNC_KIND
			l_will_save: detachable LS_BOOLEAN
			l_will_save_wait_until: detachable LS_BOOLEAN
			l_save: detachable LS_OPTIONAL_DID_SAVE_TEXT_DOCUMENT_OPTIONS
		do
			last_error := Void
			l_open_close := boolean_in_object (a_object, {LS_TEXT_DOCUMENT_SYNC_OPTIONS}.open_close_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				l_change := text_document_sync_kind_in_object (a_object, {LS_TEXT_DOCUMENT_SYNC_OPTIONS}.change_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_will_save := boolean_in_object (a_object, {LS_TEXT_DOCUMENT_SYNC_OPTIONS}.will_save_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_will_save_wait_until := boolean_in_object (a_object, {LS_TEXT_DOCUMENT_SYNC_OPTIONS}.will_save_wait_until_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				l_save := optional_did_save_text_document_options_in_object (a_object, {LS_TEXT_DOCUMENT_SYNC_OPTIONS}.save_name, True)
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				end
			end
			if last_error = Void then
				create Result.make (l_open_close, l_change, l_will_save, l_will_save_wait_until, l_save)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_document_sync_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_DOCUMENT_SYNC_OPTIONS
			-- Text document sync options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_DOCUMENT_SYNC_OPTIONS} l_value as l_text_document_sync_options then
				Result := l_text_document_sync_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_document_sync_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_edit_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_TEXT_EDIT
			-- Convert `a_object` to a text edit.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached range_in_object (a_object, {LS_TEXT_EDIT}.range_name, False) as l_range then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_EDIT}.range_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_TEXT_EDIT}.new_text_name, False) as l_new_text then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_TEXT_EDIT}.new_text_name + ": missing field"
				end
			else
				create Result.make (l_range, l_new_text)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_edit_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_EDIT
			-- Text edit item stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_EDIT} l_value as l_text_edit then
				Result := l_text_edit
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_edit_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	text_edit_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_TEXT_EDIT_LIST
			-- Convert `a_array` to text edit list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached annotated_text_edit_from_object (l_object, i.out) as l_annotated_text_edit then
					Result.put_last (l_annotated_text_edit)
					i := i + 1
				elseif attached text_edit_from_object (l_object, i.out) as l_text_edit then
					Result.put_last (l_text_edit)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	text_edit_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TEXT_EDIT_LIST
			-- Text edit list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_TEXT_EDIT_LIST} l_value as l_text_edit_list then
				Result := l_text_edit_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := text_edit_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	trace_value_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_TRACE_VALUE
			-- Convert `a_any` to a trace value.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_TRACE_VALUE} a_any as l_trace_value then
				Result := l_trace_value
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	trace_value_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_TRACE_VALUE
			-- Trace value stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := trace_value_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	uinteger_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_UINTEGER
			-- Convert `a_any` to a uinteger.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_UINTEGER} a_any as l_uinteger then
				Result := l_uinteger
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_uinteger then
				Result := l_number.to_uinteger
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	uinteger_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_UINTEGER
			-- Uinteger stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := uinteger_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	unregistration_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_UNREGISTRATION
			-- Convert `a_object` to a unregistration.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached string_in_object (a_object, {LS_UNREGISTRATION}.id_name, False) as l_id then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_UNREGISTRATION}.id_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_UNREGISTRATION}.method_name, False) as l_method then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_UNREGISTRATION}.method_name + ": missing field"
				end
			else
				create Result.make (l_id, l_method)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	unregistration_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_UNREGISTRATION
			-- Unregistration stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_UNREGISTRATION} l_value as l_unregistration then
				Result := l_unregistration
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := unregistration_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	unregistration_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_UNREGISTRATION_LIST
			-- Convert `a_array` to unregistration list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			nb := a_array.count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				if not attached {LS_OBJECT} a_array.value (i) as l_object then
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				elseif attached unregistration_from_object (l_object, i.out) as l_unregistration then
					Result.put_last (l_unregistration)
					i := i + 1
				elseif attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
					i := nb + 1 -- Jump out of the loop.
				else
					last_error := a_field_name + "." + i.out + ": invalid type"
					i := nb + 1 -- Jump out of the loop.
				end
			end
			if last_error /= Void then
				Result := Void
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	unregistration_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_UNREGISTRATION_LIST
			-- Unregistration list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_UNREGISTRATION_LIST} l_value as l_unregistration_list then
				Result := l_unregistration_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := unregistration_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	uri_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_URI
			-- Convert `a_any` to a URI.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_URI} a_any as l_uri then
				Result := l_uri
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	uri_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_URI
			-- URI stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := uri_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	versioned_text_document_identifier_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER
			-- Convert `a_object` to a versioned text document identifier.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached document_uri_in_object (a_object, {LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.uri_name, False) as l_uri then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.uri_name + ": missing field"
				end
			elseif not attached integer_in_object (a_object, {LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.version_name, False) as l_version then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.version_name + ": missing field"
				end
			else
				create Result.make (l_uri, l_version)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	versioned_text_document_identifier_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER
			-- Versioned text document identifier stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER} l_value as l_versioned_text_document_identifier then
				Result := l_versioned_text_document_identifier
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := versioned_text_document_identifier_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	watch_kind_from_any (a_any: LS_ANY; a_field_name: STRING_8): detachable LS_WATCH_KIND
			-- Convert `a_any` to a watch kind.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_any_not_void: a_any /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached {LS_WATCH_KIND} a_any as l_watch_kind then
				Result := l_watch_kind
			elseif attached {LS_NUMBER} a_any as l_number and then l_number.is_uinteger then
				Result := l_number.to_uinteger
			else
				last_error := a_field_name + ": invalid type"
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	watch_kind_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_WATCH_KIND
			-- Watch kind stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if attached a_object.value (a_field_name) as l_value then
				Result := watch_kind_from_any (l_value, a_field_name)
			elseif not a_optional then
				last_error := a_field_name + ": missing field"
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	will_save_text_document_registration_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_WILL_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Convert `a_object` to a will save text document registration options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached optional_document_selector_in_object (a_object, {LS_WILL_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name, False) as l_document_selector then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_WILL_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name + ": missing field"
				end
			else
				create Result.make (l_document_selector)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	will_save_text_document_registration_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_WILL_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Will save text document registration options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_WILL_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS} l_value as l_will_save_text_document_registration_options then
				Result := l_will_save_text_document_registration_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := will_save_text_document_registration_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	will_save_wait_until_text_document_registration_options_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Convert `a_object` to a will save wait until text document registration options.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached optional_document_selector_in_object (a_object, {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name, False) as l_document_selector then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name + ": missing field"
				end
			else
				create Result.make (l_document_selector)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	will_save_wait_until_text_document_registration_options_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Will save wait until text document registration options stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REGISTRATION_OPTIONS} l_value as l_will_save_wait_until_text_document_registration_options then
				Result := l_will_save_wait_until_text_document_registration_options
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := will_save_wait_until_text_document_registration_options_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	workspace_capabilities_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_WORKSPACE_CAPABILITIES
			-- Convert `a_object` to a workspace capabilities.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_did_change_watched_files: detachable LS_DID_CHANGE_WATCHED_FILES_CAPABILITIES
		do
			last_error := Void
			l_did_change_watched_files := did_change_watched_files_capabilities_in_object (a_object, {LS_WORKSPACE_CAPABILITIES}.did_change_watched_files_name, True)
			if attached last_error as l_last_error then
				last_error := a_field_name + "." + l_last_error
			end
			if last_error = Void then
				create Result.make
				Result.set_did_change_watched_files (l_did_change_watched_files)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	workspace_capabilities_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_WORKSPACE_CAPABILITIES
			-- Workspace capabilities stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_WORKSPACE_CAPABILITIES} l_value as l_workspace_capabilities then
				Result := l_workspace_capabilities
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := workspace_capabilities_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	workspace_folder_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): detachable LS_WORKSPACE_FOLDER
			-- Convert `a_object` to a workspace folder.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			last_error := Void
			if not attached uri_in_object (a_object, {LS_WORKSPACE_FOLDER}.uri_name, False) as l_uri then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_WORKSPACE_FOLDER}.uri_name + ": missing field"
				end
			elseif not attached string_in_object (a_object, {LS_WORKSPACE_FOLDER}.name_name, False) as l_name then
				if attached last_error as l_last_error then
					last_error := a_field_name + "." + l_last_error
				else
					last_error := a_field_name + "." + {LS_WORKSPACE_FOLDER}.name_name + ": missing field"
				end
			else
				create Result.make (l_uri, l_name)
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	workspace_folder_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_WORKSPACE_FOLDER
			-- Workspace folder identifier stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_WORKSPACE_FOLDER} l_value as l_workspace_folder then
				Result := l_workspace_folder
			elseif not attached {LS_OBJECT} l_value as l_object then
				last_error := a_field_name + ": invalid type"
			else
				Result := workspace_folder_from_object (l_object, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

	workspace_folder_list_from_array (a_array: LS_ARRAY; a_field_name: STRING_8): detachable LS_WORKSPACE_FOLDER_LIST
			-- Convert `a_array` to workspace folder list.
			-- `a_field_name` is the name of the field containing `a_object` in the enclosing object.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_array /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			i, nb: INTEGER
		do
			last_error := Void
			if not attached {LS_OBJECT} a_array.value (1) as l_first_object then
				last_error := a_field_name + ".1: invalid type"
			else
				nb := a_array.count
				create Result.make_with_capacity (nb)
				from i := 1 until i > nb loop
					if not attached {LS_OBJECT} a_array.value (i) as l_object then
						last_error := a_field_name + "." + i.out + ": invalid type"
						i := nb + 1 -- Jump out of the loop.
					elseif attached workspace_folder_from_object (l_object, i.out) as l_workspace_folder then
						Result.put_last (l_workspace_folder)
						i := i + 1
					elseif attached last_error as l_last_error then
						last_error := a_field_name + "." + l_last_error
						i := nb + 1 -- Jump out of the loop.
					else
						last_error := a_field_name + "." + i.out + ": invalid type"
						i := nb + 1 -- Jump out of the loop.
					end
				end
				if last_error /= Void then
					Result := Void
				end
			end
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	workspace_folder_list_in_object (a_object: LS_OBJECT; a_field_name: STRING_8; a_optional: BOOLEAN): detachable LS_WORKSPACE_FOLDER_LIST
			-- Workspace folder list stored in field `a_field_name` of `a_object`.
			-- `a_optional` means that that it is valid if there is no
			-- such field in `a_object`. Return Void in that case.
			-- Set `last_error` in case of error.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_value: detachable LS_ANY
		do
			last_error := Void
			l_value := a_object.value (a_field_name)
			if l_value = Void then
				if not a_optional then
					last_error := a_field_name + ": missing field"
				end
			elseif attached {LS_WORKSPACE_FOLDER_LIST} l_value as l_workspace_folder_list then
				Result := l_workspace_folder_list
			elseif not attached {LS_ARRAY} l_value as l_array then
				last_error := a_field_name + ": invalid type"
			else
				Result := workspace_folder_list_from_array (l_array, a_field_name)
			end
		ensure
			error: last_error /= Void implies Result = Void
			not_optional: not a_optional implies (Result /= Void xor last_error /= Void)
		end

feature -- Error handling

	last_error: detachable STRING_8
			-- Error message, if any

end
