indexing

	description:

		"Objects that represent compiled xsl:result-documents"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_RESULT_DOCUMENT

inherit

	XM_XSLT_INSTRUCTION

	XM_XSLT_VALIDATION

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_property_set: XM_XSLT_OUTPUT_PROPERTIES; an_href: XM_XPATH_EXPRESSION;
			a_base_uri: STRING; a_validation_action: INTEGER; a_schema_type: XM_XPATH_SCHEMA_TYPE;
			some_formatting_attributes: DS_HASH_TABLE [XM_XPATH_EXPRESSION, INTEGER]; a_namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			property_set_not_void: a_property_set /= Void
			base_uri: a_base_uri /= Void
			only_basic_xslt_as_yet: a_validation_action = Validation_strip
			no_schema_type_as_yet: a_schema_type = Void
			formatting_attributes_not_void: some_formatting_attributes /= Void
		do
			executable := an_executable
			instruction_name := "result-document"
			create children.make (0)
			base_uri := a_base_uri
			property_set := a_property_set
			href := an_href
			validation_action := a_validation_action
			schema_type := a_schema_type
			formatting_attributes := some_formatting_attributes
			namespace_resolver := a_namespace_resolver
		ensure
			executable_set: executable = an_executable
			base_uri_set: base_uri = a_base_uri
			output_properties_set: property_set = a_property_set
			href_set: href = an_href
			validation_action_set: validation_action = a_validation_action
			schema_type_set: schema_type = a_schema_type
			formatting_attributes_set: formatting_attributes = some_formatting_attributes
			namespace_resolver_set: namespace_resolver = a_namespace_resolver
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

	property_set: XM_XSLT_OUTPUT_PROPERTIES
			-- Output properties

	href: XM_XPATH_EXPRESSION
			--	Optional URI for output destination

	base_uri: STRING
			-- Base URI

	validation_action: INTEGER
			-- Validation_action

	schema_type: XM_XPATH_SCHEMA_TYPE
			-- Schema type

	formatting_attributes: DS_HASH_TABLE [XM_XPATH_EXPRESSION, INTEGER]
			-- Overrides of xsl:output attributes

	namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER
			-- Optional namespace resolver

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_result: XM_XSLT_TRANSFORMATION_RESULT
			an_output_resolver: XM_XSLT_OUTPUT_URI_RESOLVER
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XPATH_EXPRESSION, INTEGER]
			a_fingerprint: INTEGER
			an_expression: XM_XPATH_EXPRESSION
			a_value: XM_XPATH_STRING_VALUE
			a_property_set: XM_XSLT_OUTPUT_PROPERTIES
			a_receiver: XM_XSLT_SEQUENCE_RECEIVER
			a_uri: UT_URI
			a_uri_to_use, a_message: STRING
		do
			a_transformer := a_context.transformer
			if a_transformer.temporary_destination_depth > 0 then
				a_transformer.report_fatal_error ("XT1480: Attempt to evaluate xsl:document while writing a temporary tree", Current)
			else
				a_receiver := a_transformer.current_receiver
				an_output_resolver := a_transformer.output_resolver
				if href = Void then
					a_result := a_transformer.principal_result
					if a_result.is_document_started then
						a_transformer.report_fatal_error (STRING_.concat ("XT1490: Attempt to generate two result trees to URI ", a_transformer.principal_result_uri), Current)
					end
				else
					href.evaluate_as_string (a_context)
					if href.last_evaluated_string.is_error then
						a_transformer.report_fatal_error (href.last_evaluated_string.error_value.error_message, Current)
					else
						an_output_resolver := a_transformer.output_resolver
						create a_uri.make (a_transformer.principal_result_uri)
						create a_uri.make_resolve (a_uri, href.last_evaluated_string.string_value)
						a_uri_to_use := a_uri.full_reference
						if an_output_resolver.output_destinations.has (a_uri_to_use) then
							a_message := STRING_.concat ("XT1490: Attempt to generate two result trees to URI ", a_uri_to_use)
							a_transformer.report_fatal_error (a_message, Current)
						else
							an_output_resolver.resolve (a_uri)
							a_result := an_output_resolver.last_result
							if a_result = Void then
								a_transformer.report_fatal_error (an_output_resolver.error_message, Current)
							else
								a_property_set := property_set
								if formatting_attributes.count > 0 then
									a_property_set := property_set.another
									from
										a_cursor := formatting_attributes.new_cursor; a_cursor.start
									until
										a_cursor.after
									loop
										a_fingerprint := a_cursor.key
										an_expression := a_cursor.item
										an_expression.evaluate_as_string (a_context)
										a_value :=  an_expression.last_evaluated_string
										if a_value.is_error then
											a_transformer.report_fatal_error (a_value.error_value.error_message, Current)
											a_cursor.go_after
										else
											a_property_set.set_property (a_fingerprint, a_value.string_value, namespace_resolver)
											a_cursor.forth
										end
									end
								end
							end
						end
					end
				end
			end
			if not a_transformer.is_error then
				-- TODO - next-in-chain processing
				a_transformer.change_output_destination (a_property_set, a_result, True, validation_action, schema_type)
				process_children (a_context)
				a_transformer.reset_output_destination (a_receiver)
				an_output_resolver.close (a_result)
			end
			last_tail_call := Void
		end

invariant

	base_uri: base_uri /= Void
	property_set_not_void: property_set /= Void
	only_basic_xslt_as_yet: validation_action = Validation_strip
	no_schema_type_as_yet: schema_type = Void
	formatting_attributes_not_void: formatting_attributes /= Void

end

