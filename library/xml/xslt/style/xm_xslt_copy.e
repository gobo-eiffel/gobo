indexing

	description:

		"xsl:copy element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COPY

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate, may_contain_sequence_constructor
		end

	XM_XPATH_CARDINALITY
		export {NONE} all end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
			-- Establish invariant.
		do
			is_instruction := True; is_copy_namespaces := True; is_inherit_namespaces := True
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
			an_expanded_name: STRING
			a_copy_namespaces_attribute, an_inherit_namespaces_attribute, a_validation_attribute, a_type_attribute: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			validation := Validation_strip
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index				
			until
				a_cursor.after or any_compile_errors
			loop
				a_name_code := a_cursor.item
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Copy_namespaces_attribute) then
					a_copy_namespaces_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Inherit_namespaces_attribute) then
					an_inherit_namespaces_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Validation_attribute) then
					a_validation_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Type_attribute) then
					a_type_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Use_attribute_sets_attribute) then
					use := attribute_value_by_index (a_cursor.index)
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if a_copy_namespaces_attribute = Void then
				is_copy_namespaces := True
			else
				if STRING_.same_string (a_copy_namespaces_attribute, "no") then
					is_copy_namespaces := False
				elseif STRING_.same_string (a_copy_namespaces_attribute, "yes") then
					is_copy_namespaces := True
				else
					create an_error.make_from_string ("Value of copy-namespaces must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
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
				validation := validation_code (a_validation_attribute)
				if validation /= Validation_strip then
					create an_error.make_from_string ("To perform validation, a schema-aware XSLT processor is needed", Xpath_errors_uri, "XTSE1660", Static_error)
					report_compile_error (an_error)
				elseif validation = Validation_invalid then
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
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		do
			check_within_template
			if use /= Void then
				accumulate_attribute_sets (use, Void)
			else
				create used_attribute_sets.make (0)
			end
			validated := True
		end

	compile (a_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			l_content: XM_XPATH_EXPRESSION
			l_attributes_usage: XM_XSLT_ATTRIBUTE_USAGE
			l_if: XM_XPATH_IF_EXPRESSION
			l_context_item: XM_XPATH_CONTEXT_ITEM_EXPRESSION
			l_condition: XM_XPATH_INSTANCE_OF_EXPRESSION
			l_type: XM_XPATH_SEQUENCE_TYPE
			l_empty: XM_XPATH_EMPTY_SEQUENCE
		do
			compile_sequence_constructor (a_executable, new_axis_iterator (Child_axis), True)
			l_content := last_generated_expression
			if not used_attribute_sets.is_empty then
				create l_attributes_usage.make (a_executable, used_attribute_sets)
				
				-- The use-attribute-sets is ignored unless the context item is an element node.
            -- So we will wrap the XM_XSLT_ATTRIBUTE_USAGE in a conditional to perform a run-time test
				create l_context_item.make
				create l_type.make (element_node_kind_test, Required_cardinality_exactly_one)
				create l_condition.make (l_context_item, l_type)
				create l_empty.make
				create l_if.make (l_condition, l_attributes_usage, l_empty)
				if l_content = Void then
					l_content := l_if
				else
					create {XM_XSLT_BLOCK} l_content.make (a_executable, l_if, l_content, principal_stylesheet.module_number (system_id), line_number)
				end
			end
			if l_content = Void then create {XM_XPATH_EMPTY_SEQUENCE} l_content.make end
			create {XM_XSLT_COMPILED_COPY} last_generated_expression.make (a_executable, l_content,
																								used_attribute_sets,
																								is_copy_namespaces,
																								is_inherit_namespaces,
																								Void, validation)
		end

feature {NONE} -- Implementation

	validation: INTEGER
			-- Validation action

	use: STRING
			-- Value of use-attribute-sets attribute

	is_copy_namespaces: BOOLEAN
			-- Do we copy namespaces?

	is_inherit_namespaces: BOOLEAN
			-- Do we inherit namespaces?

invariant

	instruction: is_instruction = True

end
