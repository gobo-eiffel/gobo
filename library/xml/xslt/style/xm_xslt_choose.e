indexing

	description:

		"xsl:choose element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CHOOSE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate, returned_item_type, mark_tail_calls
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER) is
			-- Establish invariant.
		do
			is_instruction := True
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
		end

feature -- Status setting

	mark_tail_calls is
			-- Mark tail-recursive calls on templates and functions.
		local
			a_last_instruction: XM_XSLT_STYLE_ELEMENT
		do
			a_last_instruction := last_child_instruction
			if a_last_instruction /= Void then
				a_last_instruction.mark_tail_calls
			end
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
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
				an_expanded_name := document.name_pool.expanded_name_from_name_code (a_name_code)
				check_unknown_attribute (a_name_code)
				a_cursor.forth
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			an_xsl_when: XM_XSLT_WHEN
			an_otherwise: XM_XSLT_OTHERWISE
		do
			check_within_template
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				any_compile_errors or else a_child_iterator.after
			loop
				an_xsl_when ?= a_child_iterator.item
				if an_xsl_when /= Void then
					if otherwise /= Void then
						report_compile_error ("xsl:otherwise must come last")
					end
					number_of_whens := number_of_whens + 1
				else
					an_otherwise ?= a_child_iterator.item
					if an_otherwise /= Void then
						if otherwise /= Void then
							report_compile_error ("Only one xsl:otherwise allowed within an xsl:choose")
						else
							otherwise := an_otherwise
						end
					elseif a_child_iterator.item.node_type = Text_node and then not is_all_whitespace (a_child_iterator.item.string_value) then
						report_compile_error ("Text node inside xsl:choose")
					else
						report_compile_error ("Only xsl:when and xsl:otherwise within an xsl:choose")
					end
				end
				a_child_iterator.forth
			end
			if number_of_whens = 0 then
				report_compile_error ("xsl:choose must contain at least one xsl:when")
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE; compile_to_eiffel: BOOLEAN) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		do
			todo ("compile", False)
		end
	

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			Result := common_child_item_type
		end

feature {NONE} -- Implementation

	otherwise: XM_XSLT_OTHERWISE
			-- Otherwise clause

	number_of_whens: INTEGER
			-- Number of when clauses

invariant

	instruction: is_instruction = True

end
