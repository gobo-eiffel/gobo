indexing

	description:

		"xsl:variable element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_VARIABLE

inherit

	XM_XSLT_VARIABLE_DECLARATION
		redefine
			make_style_element, prepare_attributes
		end

	XM_XPATH_CARDINALITY

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER) is
			-- Establish invariant.
		do
			cached_variable_fingerprint := -1
			is_instruction := True
			create references.make (5)
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
		end

feature -- Access

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of the variable
		local
			default_type: XM_XPATH_SEQUENCE_TYPE
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
			a_document_test: XM_XPATH_NODE_KIND_TEST
		do
			if as_type /= Void then
				Result := as_type
			elseif select_expression /= Void then
				an_empty_sequence ?= select_expression
				if an_empty_sequence /= Void then
					create Result.make_any_sequence -- apparently, returning empty sequence as the type gives problems with static type checking
				else

					-- Try to infer the type from the select expression

					create Result.make (select_expression.item_type, select_expression.cardinality)
				end
			elseif has_child_nodes then
				create a_document_test.make_document_test
				create Result.make (a_document_test, Required_cardinality_exactly_one)
			else

				-- No select attribute or content: value is an empty string

				create Result.make_single_string
			end
		end

	preparation_state: INTEGER
			-- Used by `prepare_attributes'

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		require else
			preparation_state: preparation_state < 2
		do
			if preparation_state > 0 then
				report_compile_error ("Circular reference to variable")
			else
				preparation_state := 1
				Precursor
				preparation_state := 2
			end
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_variable: XM_XSLT_COMPILED_VARIABLE
		do
			if references.count = 0 then
				is_redundant_variable := True
			end
			if is_global_variable and not is_redundant_variable then
				principal_stylesheet.allocate_local_slots (number_of_variables)
			end
			if not is_redundant_variable then
				check
					strictly_positive_slot_number: slot_number > 0
				end
				create a_variable.make (an_executable, variable_name, slot_number)
				initialize_instruction (an_executable, a_variable)
				a_variable.set_required_type (required_type)
				fixup_binding (a_variable)
				last_generated_instruction := a_variable
			end
		end

invariant

	instruction: is_instruction = True -- Well, it can be.

end
