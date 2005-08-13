indexing

	description:

		"xsl:element element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ELEMENT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate, may_contain_sequence_constructor
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
			-- Establish invariant.
		do
			is_instruction := True
			validation_action := Validation_strip
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_namespace_attribute,
			a_type_attribute, a_validation_attribute, an_inherit_namespaces_attribute: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index				
			until
				a_cursor.after
			loop
				a_name_code := a_cursor.item
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Name_attribute) then
					a_name_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_name_attribute)
					STRING_.right_adjust (a_name_attribute)
				elseif STRING_.same_string (an_expanded_name, Namespace_attribute) then
					a_namespace_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_namespace_attribute)
					STRING_.right_adjust (a_namespace_attribute)
				elseif STRING_.same_string (an_expanded_name, Type_attribute) then
					a_type_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_type_attribute)
					STRING_.right_adjust (a_type_attribute)
				elseif STRING_.same_string (an_expanded_name, Validation_attribute) then
					a_validation_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_validation_attribute)
					STRING_.right_adjust (a_validation_attribute)
				elseif STRING_.same_string (an_expanded_name, Inherit_namespaces_attribute) then
					an_inherit_namespaces_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (an_inherit_namespaces_attribute)
					STRING_.right_adjust (an_inherit_namespaces_attribute)					
				elseif STRING_.same_string (an_expanded_name, Use_attribute_sets_attribute) then
					use_attribute_sets := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (use_attribute_sets)
					STRING_.right_adjust (use_attribute_sets)					
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			
			if a_name_attribute /= Void then
				generate_attribute_value_template (a_name_attribute, static_context)
				element_name := last_generated_expression
				if element_name.is_error then
					report_compile_error (element_name.error_value)
				else
					if element_name.is_string_value then
						if not is_qname (element_name.as_string_value.string_value) then
							create an_error.make_from_string ("Element name is not a valid QName", Xpath_errors_uri, "XTSE0020", Static_error)
							report_compile_error (an_error)
							
							-- Prevent a duplicate error message.
							
							create {XM_XPATH_STRING_VALUE} element_name.make ("gexslt-error-element")
						end
					end
				end
			else
				report_absence ("name")
			end
			if a_namespace_attribute /= Void then
				generate_attribute_value_template (a_namespace_attribute, static_context)
				namespace := last_generated_expression
				if namespace.is_error then
					report_compile_error (namespace.error_value)
				end
			end
			prepare_attributes_2 (a_validation_attribute, a_type_attribute, an_inherit_namespaces_attribute)
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		do
			check_within_template
			if use_attribute_sets /= Void then
				accumulate_attribute_sets (use_attribute_sets, Void)
			end
			type_check_expression ("name", element_name)
			if element_name.was_expression_replaced then
				element_name := element_name.replacement_expression
			end
			if namespace /= Void then
				type_check_expression ("namespace", namespace)
				if namespace.was_expression_replaced then
					namespace := namespace.replacement_expression
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_name_code: INTEGER
			a_namespace_context: XM_XSLT_NAMESPACE_CONTEXT
			an_element: XM_XSLT_COMPILED_ELEMENT
			a_content: XM_XPATH_EXPRESSION
		do
			
			last_generated_expression := Void
			
			-- Deal specially with the case where the element name is known statically.
			
			if element_name.is_string_value then
				set_qname_parts (element_name.as_string_value)
				if not any_compile_errors then
					if shared_name_pool.is_name_code_allocated (qname_prefix, namespace_uri, local_name) then
						a_name_code := shared_name_pool.name_code (qname_prefix, namespace_uri, local_name)
					else
						shared_name_pool.allocate_name (qname_prefix, namespace_uri, local_name)
						a_name_code := shared_name_pool.last_name_code
					end
				elseif namespace.is_string_value then
					namespace_uri := namespace.as_string_value.string_value
					if namespace_uri.count = 0 then
						qname_prefix := ""
					end
					if shared_name_pool.is_name_code_allocated (qname_prefix, namespace_uri, local_name) then
						a_name_code := shared_name_pool.name_code (qname_prefix, namespace_uri, local_name)
					else
						shared_name_pool.allocate_name (qname_prefix, namespace_uri, local_name)
						a_name_code := shared_name_pool.last_name_code
					end
					compile_fixed_element (an_executable, a_name_code)
				end
			end
			
			if last_generated_expression = Void then
				
				-- If the namespace URI must be deduced at run-time from the element name prefix,
				--  we need to save the namespace context of the instruction.
				
				if namespace = Void then
					a_namespace_context := namespace_context
				end
				compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
				a_content := last_generated_expression
				if a_content = Void then
					create {XM_XPATH_EMPTY_SEQUENCE} a_content.make
				end
				create an_element.make (an_executable, element_name, namespace, a_namespace_context, used_attribute_sets, Void, validation_action, is_inherit_namespaces, a_content)
				last_generated_expression := an_element
			end
		end

feature {NONE} -- Implementation

	element_name: XM_XPATH_EXPRESSION
			-- QName of element

	namespace: XM_XPATH_EXPRESSION
			-- Namespace URI of element

	use_attribute_sets: STRING
			-- -- Attribute sets to be used

	qname_prefix, namespace_uri, local_name, qname: STRING
			-- Used for communicating with `compile'

	validation_action: INTEGER

	is_inherit_namespaces: BOOLEAN
		-- Do we inherit namespaces?
	
	prepare_attributes_2 (a_validation_attribute, a_type_attribute, an_inherit_namespaces_attribute: STRING) is
			-- Continue prparing attributes.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if an_inherit_namespaces_attribute = Void then
				is_inherit_namespaces := True
			else
				if STRING_.same_string (an_inherit_namespaces_attribute, "no") then
					is_inherit_namespaces := False
				elseif STRING_.same_string (an_inherit_namespaces_attribute, "yes") then
					is_inherit_namespaces := True
				else
					create an_error.make_from_string ("Value of inherit-namespaces must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end	
			if a_validation_attribute /= Void then
				validation_action := validation_code (a_validation_attribute)
				if validation_action /= Validation_strip then
					create an_error.make_from_string ("To perform validation, a schema-aware XSLT processor is needed", Xpath_errors_uri, "XTSE1660", Static_error)
				report_compile_error (an_error)
				elseif validation_action = Validation_invalid then
					create an_error.make_from_string ("Invalid value of validation attribute", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end

			if a_type_attribute /= Void then
				create an_error.make_from_string ("The type attribute is available only with a schema-aware XSLT processor", Xpath_errors_uri, "XTSE1660", Static_error)
				report_compile_error (an_error)
			end

			if a_type_attribute /= Void and then a_validation_attribute /= Void then
				create an_error.make_from_string ("The validation and type attributes are mutually exclusive", Xpath_errors_uri, "XTSE1505", Static_error)
				report_compile_error (an_error)
			end
		end

	set_qname_parts (a_string_value: XM_XPATH_STRING_VALUE) is
			-- Analyze and set qname parts.
		require
			string_value_not_void: a_string_value /= Void
		local
			a_string_splitter: ST_SPLITTER
			qname_parts: DS_LIST [STRING]
			an_error: XM_XPATH_ERROR_VALUE
		do
			qname := a_string_value.string_value
			STRING_.left_adjust (qname)
			STRING_.right_adjust (qname)
			if qname.count = 0 then
				create an_error.make_from_string ("Element name must not be zero length", Xpath_errors_uri, "XTSE0020", Static_error)
				report_compile_error (an_error)
			else
				create a_string_splitter.make
				a_string_splitter.set_separators (":")
				qname_parts := a_string_splitter.split (qname)
				if qname_parts.count = 1 then
					local_name := qname_parts.item (1)
					qname_prefix := ""
				elseif qname_parts.count = 2 then
					local_name := qname_parts.item (2)
					qname_prefix := qname_parts.item (1)
				else
					create an_error.make_from_string (STRING_.concat ("Invalid element name: ", qname), Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
				if namespace = Void then
					namespace_uri := uri_for_prefix (qname_prefix, False)
				end
			end
		end

	compile_fixed_element (an_executable: XM_XSLT_EXECUTABLE; a_name_code: INTEGER) is
			-- Compile to a fixed element.
		require
			executable_not_void: an_executable /= Void
		local
			a_fixed_element: XM_XSLT_FIXED_ELEMENT
			some_namespace_codes: DS_ARRAYED_LIST [INTEGER]
			a_content: XM_XPATH_EXPRESSION
		do
			create some_namespace_codes.make (0)
			compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
			a_content := last_generated_expression
			if a_content = Void then
				create {XM_XPATH_EMPTY_SEQUENCE} a_content.make
			end
			create a_fixed_element.make (an_executable, a_name_code, some_namespace_codes, used_attribute_sets, Void, validation_action, is_inherit_namespaces, a_content)
			last_generated_expression := a_fixed_element
		end

invariant

	instruction: is_instruction = True

end
