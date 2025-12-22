note

	description:

		"Builders for lists of completion suggestions"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class GELSP_COMPLETION_BUILDER

inherit

	ET_BROWSABLE_COMPLETION_BUILDER

create

	make

feature {NONE} -- Initalization

	make (a_response: like response; a_message_manager: like message_manager)
			-- Create a new completion builder.
		require
			a_response_not_void: a_response /= Void
			a_message_manager_not_void: a_message_manager /= Void
		do
			response := a_response
			message_manager := a_message_manager
		ensure
			response_set: response = a_response
			message_manager_set: message_manager = a_message_manager
		end

feature -- Access

	response: LS_COMPLETION_RESPONSE
			-- List of completion suggestions to be built

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Message manager

feature -- Basic operations

	add_query (a_feature: ET_FEATURE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add query `a_feature` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_feature.lower_name)
			create l_completion_item.make (l_label)
			if a_feature.is_constant_attribute then
				l_completion_item.set_detail ("constant")
				l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.constant)
			elseif a_feature.is_unique_attribute then
				l_completion_item.set_detail ("unique")
				l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.constant)
			elseif a_feature.is_attribute then
				l_completion_item.set_detail ("attribute")
				l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.field)
			elseif a_feature.is_once then
				l_completion_item.set_detail ("once")
				l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.function)
			else
				l_completion_item.set_detail ("function")
				l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.function)
			end
			set_feature_arguments_snippet (a_feature, l_completion_item, a_browsable_name)
			set_feature_documentation (a_feature, l_completion_item, a_browsable_name)
			response.add_completion_item (l_completion_item)
		end

	add_procedure (a_feature: ET_FEATURE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add procedure `a_feature` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_feature.lower_name)
			create l_completion_item.make (l_label)
			if a_feature.is_once then
				l_completion_item.set_detail ("once procedure")
				l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.method)
			else
				l_completion_item.set_detail ("procedure")
				l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.method)
			end
			set_feature_arguments_snippet (a_feature, l_completion_item, a_browsable_name)
			set_feature_documentation (a_feature, l_completion_item, a_browsable_name)
			response.add_completion_item (l_completion_item)
		end

	add_creation_procedure (a_feature: ET_FEATURE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add creation procedure `a_feature` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_feature.lower_name)
			create l_completion_item.make (l_label)
			l_completion_item.set_detail ("create")
			l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.constructor)
			set_feature_arguments_snippet (a_feature, l_completion_item, a_browsable_name)
			set_feature_documentation (a_feature, l_completion_item, a_browsable_name)
			response.add_completion_item (l_completion_item)
		end

	add_tuple_label (a_tuple_label: ET_LABELED_ACTUAL_PARAMETER; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add tuple label `a_tuple_label` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_tuple_label.label.lower_name)
			create l_completion_item.make (l_label)
			l_completion_item.set_detail ("tuple label")
			l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.field)
			l_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.plain_text)
			set_tuple_label_documentation (a_tuple_label, l_completion_item, a_browsable_name)
			response.add_completion_item (l_completion_item)
		end

	add_formal_argument (a_argument: ET_FORMAL_ARGUMENT; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add formal argument `a_argument` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_argument.name.lower_name)
			create l_completion_item.make (l_label)
			l_completion_item.set_detail ("argument")
			l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.variable)
			l_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.plain_text)
			set_formal_argument_documentation (a_argument, l_completion_item, a_browsable_name)
			response.add_completion_item (l_completion_item)
		end

	add_local_variable (a_local_variable: ET_LOCAL_VARIABLE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add local variable `a_local_variable` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_local_variable.name.lower_name)
			create l_completion_item.make (l_label)
			l_completion_item.set_detail ("local")
			l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.variable)
			l_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.plain_text)
			set_local_variable_documentation (a_local_variable, l_completion_item, a_browsable_name)
			response.add_completion_item (l_completion_item)
		end

	add_object_test_local (a_object_test: ET_NAMED_OBJECT_TEST; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add local of `a_object_test` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_object_test.name.lower_name)
			create l_completion_item.make (l_label)
			l_completion_item.set_detail ("attached")
			l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.variable)
			l_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.plain_text)
			response.add_completion_item (l_completion_item)
		end

	add_iteration_item (a_iteration: ET_ITERATION_COMPONENT; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add iteration item of `a_iteration` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_iteration.item_name.lower_name)
			create l_completion_item.make (l_label)
			l_completion_item.set_detail ("across")
			l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.variable)
			l_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.plain_text)
			response.add_completion_item (l_completion_item)
		end


	add_inline_separate_argument (a_inline_separate_argument: ET_INLINE_SEPARATE_ARGUMENT; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add argument of inline separate instruction `a_inline_separate_argument` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_inline_separate_argument.name.lower_name)
			create l_completion_item.make (l_label)
			l_completion_item.set_detail ("separate")
			l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.variable)
			l_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.plain_text)
			response.add_completion_item (l_completion_item)
		end

	add_keyword (a_keyword: ET_KEYWORD; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add keyword `a_keyword` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_keyword.text)
			create l_completion_item.make (l_label)
			l_completion_item.set_detail ("keyword")
			l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.variable)
			l_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.plain_text)
			response.add_completion_item (l_completion_item)
		end

	add_class (a_class: ET_CLASS; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add class `a_class` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_class.upper_name)
			create l_completion_item.make (l_label)
			l_completion_item.set_detail ("class")
			l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.class_)
			set_class_actual_paramaters_snippet (a_class, l_completion_item, a_browsable_name)
			set_class_documentation (a_class, l_completion_item, a_browsable_name)
			response.add_completion_item (l_completion_item)
		end

	add_formal_parameter (a_formal_parameter: ET_FORMAL_PARAMETER; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add formal paramater `a_formal_parameter` to the list of completion suggestions.
		local
			l_completion_item: LS_COMPLETION_ITEM
			l_label: LS_STRING
		do
			create l_label.make_from_utf8 (a_formal_parameter.name.upper_name)
			create l_completion_item.make (l_label)
			l_completion_item.set_detail ("generic parameter")
			l_completion_item.set_kind ({LS_COMPLETION_ITEM_KINDS}.type_parameter)
			l_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.plain_text)
			set_formal_parameter_documentation (a_formal_parameter, l_completion_item, a_browsable_name)
			response.add_completion_item (l_completion_item)
		end

feature {NONE} -- Implementation

	set_feature_documentation (a_feature: ET_FEATURE; a_completion_item: LS_COMPLETION_ITEM; a_browsable_name: ET_BROWSABLE_NAME)
			-- Set documentation of `a_feature` in `a_completion_item`, if any.
		require
			a_feature_not_void: a_feature /= Void
			a_completion_item_not_void: a_completion_item /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		local
			l_documentation: LS_MARKUP_CONTENT
			l_text: STRING_8
			l_string: LS_STRING
		do
			if message_manager.completion_request_handler.is_markdown_supported then
				create l_text.make (50)
				l_text.append_string (once "```eiffel%N")
				a_browsable_name.append_feature_description_to_string (a_feature, l_text)
				l_text.append_string (once "%N```")
				if l_text.count = 14 then
					-- No description.
				else
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.markdown, l_string)
					a_completion_item.set_documentation (l_documentation)
				end
			else
				create l_text.make (50)
				a_browsable_name.append_feature_description_to_string (a_feature, l_text)
				if l_text.is_empty then
					-- No description.
				elseif message_manager.completion_request_handler.is_plaintext_supported then
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.plaintext, l_string)
					a_completion_item.set_documentation (l_documentation)
				else
					create l_string.make_from_utf8 (l_text)
					a_completion_item.set_documentation (l_string)
				end
			end
		end

	set_tuple_label_documentation (a_tuple_label: ET_LABELED_ACTUAL_PARAMETER; a_completion_item: LS_COMPLETION_ITEM; a_browsable_name: ET_BROWSABLE_NAME)
			-- Set documentation of `a_tuple_label` in `a_completion_item`, if any.
		require
			a_tuple_label_not_void: a_tuple_label /= Void
			a_completion_item_not_void: a_completion_item /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		local
			l_documentation: LS_MARKUP_CONTENT
			l_text: STRING_8
			l_string: LS_STRING
		do
			if message_manager.completion_request_handler.is_markdown_supported then
				create l_text.make (50)
				l_text.append_string (once "```eiffel%N")
				a_browsable_name.append_tuple_label_description_to_string (a_tuple_label, l_text)
				l_text.append_string (once "%N```")
				if l_text.count = 14 then
					-- No description.
				else
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.markdown, l_string)
					a_completion_item.set_documentation (l_documentation)
				end
			else
				create l_text.make (50)
				a_browsable_name.append_tuple_label_description_to_string (a_tuple_label, l_text)
				if l_text.is_empty then
					-- No description.
				elseif message_manager.completion_request_handler.is_plaintext_supported then
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.plaintext, l_string)
					a_completion_item.set_documentation (l_documentation)
				else
					create l_string.make_from_utf8 (l_text)
					a_completion_item.set_documentation (l_string)
				end
			end
		end

	set_formal_argument_documentation (a_argument: ET_FORMAL_ARGUMENT; a_completion_item: LS_COMPLETION_ITEM; a_browsable_name: ET_BROWSABLE_NAME)
			-- Set documentation of `a_argument` in `a_completion_item`, if any.
		require
			a_argument_not_void: a_argument /= Void
			a_completion_item_not_void: a_completion_item /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		local
			l_documentation: LS_MARKUP_CONTENT
			l_text: STRING_8
			l_string: LS_STRING
		do
			if message_manager.completion_request_handler.is_markdown_supported then
				create l_text.make (50)
				l_text.append_string (once "```eiffel%N")
				a_browsable_name.append_formal_agument_description_to_string (a_argument, l_text)
				l_text.append_string (once "%N```")
				if l_text.count = 14 then
					-- No description.
				else
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.markdown, l_string)
					a_completion_item.set_documentation (l_documentation)
				end
			else
				create l_text.make (50)
				a_browsable_name.append_formal_agument_description_to_string (a_argument, l_text)
				if l_text.is_empty then
					-- No description.
				elseif message_manager.completion_request_handler.is_plaintext_supported then
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.plaintext, l_string)
					a_completion_item.set_documentation (l_documentation)
				else
					create l_string.make_from_utf8 (l_text)
					a_completion_item.set_documentation (l_string)
				end
			end
		end

	set_local_variable_documentation (a_local_variable: ET_LOCAL_VARIABLE; a_completion_item: LS_COMPLETION_ITEM; a_browsable_name: ET_BROWSABLE_NAME)
			-- Set documentation of `a_local_variable` in `a_completion_item`, if any.
		require
			a_local_variable_not_void: a_local_variable /= Void
			a_completion_item_not_void: a_completion_item /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		local
			l_documentation: LS_MARKUP_CONTENT
			l_text: STRING_8
			l_string: LS_STRING
		do
			if message_manager.completion_request_handler.is_markdown_supported then
				create l_text.make (50)
				l_text.append_string (once "```eiffel%N")
				a_browsable_name.append_local_variable_description_to_string (a_local_variable, l_text)
				l_text.append_string (once "%N```")
				if l_text.count = 14 then
					-- No description.
				else
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.markdown, l_string)
					a_completion_item.set_documentation (l_documentation)
				end
			else
				create l_text.make (50)
				a_browsable_name.append_local_variable_description_to_string (a_local_variable, l_text)
				if l_text.is_empty then
					-- No description.
				elseif message_manager.completion_request_handler.is_plaintext_supported then
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.plaintext, l_string)
					a_completion_item.set_documentation (l_documentation)
				else
					create l_string.make_from_utf8 (l_text)
					a_completion_item.set_documentation (l_string)
				end
			end
		end

	set_class_documentation (a_class: ET_CLASS; a_completion_item: LS_COMPLETION_ITEM; a_browsable_name: ET_BROWSABLE_NAME)
			-- Set documentation of `a_class` in `a_completion_item`, if any.
		require
			a_class_not_void: a_class /= Void
			a_completion_item_not_void: a_completion_item /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		local
			l_documentation: LS_MARKUP_CONTENT
			l_text: STRING_8
			l_string: LS_STRING
		do
			if message_manager.completion_request_handler.is_markdown_supported then
				create l_text.make (50)
				l_text.append_string (once "```eiffel%N")
				a_browsable_name.append_class_description_to_string (a_class, l_text)
				l_text.append_string (once "%N```")
				if l_text.count = 14 then
					-- No description.
				else
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.markdown, l_string)
					a_completion_item.set_documentation (l_documentation)
				end
			else
				create l_text.make (50)
				a_browsable_name.append_class_description_to_string (a_class, l_text)
				if l_text.is_empty then
					-- No description.
				elseif message_manager.completion_request_handler.is_plaintext_supported then
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.plaintext, l_string)
					a_completion_item.set_documentation (l_documentation)
				else
					create l_string.make_from_utf8 (l_text)
					a_completion_item.set_documentation (l_string)
				end
			end
		end

	set_formal_parameter_documentation (a_formal_parameter: ET_FORMAL_PARAMETER; a_completion_item: LS_COMPLETION_ITEM; a_browsable_name: ET_BROWSABLE_NAME)
			-- Set documentation of `a_formal_parameter` in `a_completion_item`, if any.
		require
			a_formal_parameter_not_void: a_formal_parameter /= Void
			a_completion_item_not_void: a_completion_item /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		local
			l_documentation: LS_MARKUP_CONTENT
			l_text: STRING_8
			l_string: LS_STRING
		do
			if message_manager.completion_request_handler.is_markdown_supported then
				create l_text.make (50)
				l_text.append_string (once "```eiffel%N")
				a_browsable_name.append_formal_parameter_description_to_string (a_formal_parameter, l_text)
				l_text.append_string (once "%N```")
				if l_text.count = 14 then
					-- No description.
				else
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.markdown, l_string)
					a_completion_item.set_documentation (l_documentation)
				end
			else
				create l_text.make (50)
				a_browsable_name.append_formal_parameter_description_to_string (a_formal_parameter, l_text)
				if l_text.is_empty then
					-- No description.
				elseif message_manager.completion_request_handler.is_plaintext_supported then
					create l_string.make_from_utf8 (l_text)
					create l_documentation.make ({LS_MARKUP_KINDS}.plaintext, l_string)
					a_completion_item.set_documentation (l_documentation)
				else
					create l_string.make_from_utf8 (l_text)
					a_completion_item.set_documentation (l_string)
				end
			end
		end

	set_feature_arguments_snippet (a_feature: ET_FEATURE; a_completion_item: LS_COMPLETION_ITEM; a_browsable_name: ET_BROWSABLE_NAME)
			-- Set snippet with the arguments of `a_feature` in `a_completion_item`, if any.
		require
			a_feature_not_void: a_feature /= Void
			a_completion_item_not_void: a_completion_item /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		local
			l_snippet: STRING_8
			l_insert_text: LS_STRING
			i, nb: INTEGER
		do
			if a_browsable_name.is_only_feature_name_expected or else a_feature.arguments_count = 0 then
				a_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.plain_text)
			else
				a_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.snippet)
				create l_snippet.make (50)
				l_snippet.append_string (a_feature.lower_name)
				if attached a_feature.arguments as l_arguments then
					l_snippet.append_character (' ')
					l_snippet.append_character ('(')
					nb := l_arguments.count
					from i := 1 until i > nb loop
						if i /= 1 then
							l_snippet.append_character (',')
							l_snippet.append_character (' ')
						end
						l_snippet.append_character ('$')
						l_snippet.append_character ('{')
						if i /= nb then
							l_snippet.append_integer (i)
						else
							l_snippet.append_character ('0')
						end
						l_snippet.append_character (':')
						l_snippet.append_string (l_arguments.formal_argument (i).name.lower_name)
						l_snippet.append_character ('}')
						i := i + 1
					end
					l_snippet.append_character (')')
				end
				create l_insert_text.make_from_utf8 (l_snippet)
				a_completion_item.set_insert_text (l_insert_text)
			end
		end

	set_class_actual_paramaters_snippet (a_class: ET_CLASS; a_completion_item: LS_COMPLETION_ITEM; a_browsable_name: ET_BROWSABLE_NAME)
			-- Set snippet with the actual generic parameters of `a_class` in `a_completion_item`, if any.
		require
			a_class_not_void: a_class /= Void
			a_completion_item_not_void: a_completion_item /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		local
			l_snippet: STRING_8
			l_insert_text: LS_STRING
			i, nb: INTEGER
		do
			if a_browsable_name.is_only_class_name_expected or else a_class.formal_parameter_count = 0 then
				a_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.plain_text)
			else
				a_completion_item.set_insert_text_format ({LS_INSERT_TEXT_FORMATS}.snippet)
				create l_snippet.make (50)
				l_snippet.append_string (a_class.upper_name)
				if attached a_class.formal_parameters as l_formal_parameters then
					l_snippet.append_character (' ')
					l_snippet.append_character ('[')
					nb := l_formal_parameters.count
					from i := 1 until i > nb loop
						if i /= 1 then
							l_snippet.append_character (',')
							l_snippet.append_character (' ')
						end
						l_snippet.append_character ('$')
						l_snippet.append_character ('{')
						if i /= nb then
							l_snippet.append_integer (i)
						else
							l_snippet.append_character ('0')
						end
						l_snippet.append_character (':')
						l_snippet.append_string (l_formal_parameters.formal_parameter (i).name.upper_name)
						l_snippet.append_character ('}')
						i := i + 1
					end
					l_snippet.append_character (']')
				end
				create l_insert_text.make_from_utf8 (l_snippet)
				a_completion_item.set_insert_text (l_insert_text)
			end
		end

invariant

	response_not_void: response /= Void
	message_manager_not_void: message_manager /= Void

end
