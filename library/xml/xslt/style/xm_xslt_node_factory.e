indexing

	description:

		"XSLT node factory"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NODE_FACTORY

inherit

	XM_XPATH_NODE_FACTORY
		redefine
			new_element_node
		end

	XM_XPATH_STANDARD_NAMESPACES

creation

	make

feature {NONE} -- Initialization

	make (a_name_pool: XM_XPATH_NAME_POOL; extensions_allowed: BOOLEAN) is
			-- Establish invariant.
		require
			name_pool_not_void: a_name_pool /= Void
		do
			are_extensions_allowed := extensions_allowed
			name_pool := a_name_pool
		ensure
			name_pool_set: name_pool = a_name_pool
			are_extensions_allowed_set: are_extensions_allowed = extensions_allowed
		end

feature -- Creation

	new_element_node (a_document: XM_XPATH_TREE_DOCUMENT; a_parent: XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
							a_name_code: INTEGER; a_sequence_number: INTEGER): XM_XPATH_TREE_ELEMENT is
			-- New element node.
			-- TODO - add a locator
		local
			a_line_number, a_uri_code: INTEGER
			a_base_uri, a_local_name: STRING
			a_stylesheet: XM_XSLT_STYLESHEET
			a_data_element: XM_XSLT_DATA_ELEMENT
			a_style_element: XM_XSLT_STYLE_ELEMENT
			is_top_level_element: BOOLEAN
		do
			a_stylesheet ?= a_parent
			is_top_level_element := a_stylesheet /= Void

			a_base_uri := "" -- TODO - need locator

			a_data_element ?= a_parent

			if a_data_element /= Void then
				create {XM_XSLT_DATA_ELEMENT} Result.make (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
			else
				a_style_element := new_xslt_element (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
				if a_style_element /= Void then
					Result := a_style_element
				else

					-- not recognized as an XSLT element
					
					a_local_name := name_pool.local_name_from_name_code (a_name_code)
					a_uri_code := name_pool.uri_code_from_name_code (a_name_code)
					if a_uri_code = Xslt_uri_code then
						create Result.make_in_error_state (a_document, STRING_.appended_string ("Unknown XSLT element: ", a_local_name))
					else

						-- We can't work out the final class of the node until we've examined its attributes
						-- such as version and extension-element-prefixes; but we can have a good guess, and
						-- change it later if need be.

						if a_uri_code = Gexslt_uri_code then -- TODO
						elseif  is_top_level_element and then a_uri_code /= Default_uri_code then

							-- User-defined Data Elements

							create {XM_XSLT_DATA_ELEMENT} Result.make (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)

						else
							Result := possible_literal_result_element (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	name_pool: XM_XPATH_NAME_POOL
			-- Name pool

	are_extensions_allowed: BOOLEAN
			-- Are extensions allowed?

	new_xslt_element (a_document: XM_XPATH_TREE_DOCUMENT; a_parent: XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
							a_name_code: INTEGER; a_sequence_number: INTEGER; a_line_number: INTEGER; a_base_uri: STRING): XM_XSLT_STYLE_ELEMENT is
			-- New XSLT element.
			-- TODO - add a locator
		require
			document_not_void: a_document /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
		local
			a_fingerprint: INTEGER
		do
			a_fingerprint := name_pool.fingerprint_from_name_code (a_name_code)
			
			inspect
				a_fingerprint
			when Xslt_transform_type_code, Xslt_stylesheet_type_code then
				create {XM_XSLT_STYLESHEET} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
			when Xslt_key_type_code then
				create {XM_XSLT_KEY} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
			when Xslt_decimal_format_type_code then
				create {XM_XSLT_DECIMAL_FORMAT} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
			when Xslt_variable_type_code then
				create {XM_XSLT_VARIABLE} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
			when Xslt_param_type_code then
				create {XM_XSLT_PARAM} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
			when Xslt_with_param_type_code then
				create {XM_XSLT_WITH_PARAM} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)				
			when Xslt_template_type_code then
				create {XM_XSLT_TEMPLATE} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)				
			when Xslt_comment_type_code then
				create {XM_XSLT_COMMENT} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)				
			when Xslt_value_of_type_code then
				create {XM_XSLT_VALUE_OF} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)				
			when Xslt_call_template_type_code then
				create {XM_XSLT_CALL_TEMPLATE} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)				
			when Xslt_apply_templates_type_code then
				create {XM_XSLT_APPLY_TEMPLATES} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)				
			when Xslt_choose_type_code then
				create {XM_XSLT_CHOOSE} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)				
			when Xslt_when_type_code then
				create {XM_XSLT_WHEN} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)				
			when Xslt_otherwise_type_code then
				create {XM_XSLT_OTHERWISE} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)				
			when Xslt_for_each_type_code then
				create {XM_XSLT_FOR_EACH} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
			when Xslt_for_each_group_type_code then
				create {XM_XSLT_FOR_EACH_GROUP} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)								
			when Xslt_sort_type_code then
				create {XM_XSLT_SORT} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)				
			when Xslt_number_type_code then
				create {XM_XSLT_NUMBER} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)				
			else
			end
			
			if Result /= Void then
				if a_parent /= Void then a_parent.add_child (Result) end
				if not Result.is_error then
					Result.process_extension_element_attribute (Extension_element_prefixes_attribute)
					if not Result.is_error then
						Result.process_excluded_namespaces_attribute (Exclude_result_prefixes_attribute)
						if not Result.is_error then
							Result.process_version_attribute (Version_attribute)
						end
						if not Result.is_error then
							Result.process_default_xpath_namespace_attribute (Xpath_default_namespace_attribute)
						end
					end
				end
			end
		end

	possible_literal_result_element (a_document: XM_XPATH_TREE_DOCUMENT; a_parent: XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
							a_name_code: INTEGER; a_sequence_number: INTEGER; a_line_number: INTEGER; a_base_uri: STRING): XM_XSLT_STYLE_ELEMENT is
			-- New literal result element, or extension element.
			-- TODO - add a locator
		require
			document_not_void: a_document /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
		do

			-- TODO, may be an extension element (or fallback)

			create {XM_XSLT_LITERAL_RESULT_ELEMENT} Result.make (a_document, Void, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
			if a_parent /= Void then a_parent.add_child (Result) end
			if not Result.is_error then
				Result.process_extension_element_attribute (Xslt_extension_element_prefixes_attribute)
				if not Result.is_error then
					Result.process_excluded_namespaces_attribute (Xslt_exclude_result_prefixes_attribute)
					if not Result.is_error then
						Result.process_version_attribute (Xslt_version_attribute)
					end
					if not Result.is_error then
						Result.process_default_xpath_namespace_attribute (Xslt_xpath_default_namespace_attribute)
					end
				end
			end
		end

invariant
	
	name_pool_not_void: name_pool /= Void


end
	
