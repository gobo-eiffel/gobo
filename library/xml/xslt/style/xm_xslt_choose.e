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
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
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
			an_error: XM_XPATH_ERROR_VALUE
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
						create an_error.make_from_string ("xsl:otherwise must be immediately within xsl:choose", "", "XT0010", Static_error)
						report_compile_error (an_error)
					end
					number_of_whens := number_of_whens + 1
				else
					an_otherwise ?= a_child_iterator.item
					if an_otherwise /= Void then
						if otherwise /= Void then
							create an_error.make_from_string ("Only one xsl:otherwise is allowed within an xsl:choose", "", "XT0010", Static_error)
							report_compile_error (an_error)
						else
							otherwise := an_otherwise
						end
					elseif a_child_iterator.item.node_type = Text_node and then not is_all_whitespace (a_child_iterator.item.string_value) then
						create an_error.make_from_string ("Text node is not allowed inside xsl:choose", "", "XT0010", Static_error)
						report_compile_error (an_error)
					else
						create an_error.make_from_string ("Only xsl:when and xsl:otherwise are allowed within an xsl:choose", "", "XT0010", Static_error)
						report_compile_error (an_error)
					end
				end
				a_child_iterator.forth
			end
			if number_of_whens = 0 then
				create an_error.make_from_string ("xsl:choose must contain at least one xsl:when", "", "XT0010", Static_error)
				report_compile_error (an_error)
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_when: XM_XSLT_WHEN
			an_otherwise: XM_XSLT_OTHERWISE
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			a_condition: XM_XPATH_EXPRESSION
			a_block: XM_XSLT_BLOCK
			a_module_number: INTEGER
			an_action: XM_XSLT_INSTRUCTION
		do
			top_stylesheet := principal_stylesheet
			compiled_actions_count := number_of_whens
			if otherwise /= Void then
				compiled_actions_count := compiled_actions_count + 1
			end
			create compiled_conditions.make (compiled_actions_count)
			create compiled_actions.make (compiled_actions_count)
			from
				compiled_actions_count := 0
				a_child_iterator := new_axis_iterator (Child_axis); a_child_iterator.start
			until
				has_compile_loop_finished or else a_child_iterator.after
			loop
				a_when ?= a_child_iterator.item
				if a_when /= Void then
					compile_when (an_executable, a_when)
				else
					an_otherwise ?= a_child_iterator.item
					check
						otherwise: an_otherwise /= Void
					end
					compiled_actions_count := compiled_actions_count + 1
					create {XM_XPATH_BOOLEAN_VALUE} a_condition.make (True)
					compiled_conditions.put_last (a_condition)
					create a_block.make_otherwise (an_executable)
					check
						module_registered: top_stylesheet.is_module_registered (an_otherwise.system_id)
						-- TODO: Why? Maybe this isn't so - review
					end
					a_module_number := top_stylesheet.module_number (an_otherwise.system_id)
					a_block.set_source_location (a_module_number, an_otherwise.line_number)
					an_otherwise.compile_children (an_executable, a_block)
					if an_otherwise.last_generated_instruction_list.count = 1 then
						an_action := an_otherwise.last_generated_instruction_list.item (1)
					else
						an_action := a_block
					end
					compiled_actions.put_last (an_action)
					has_compile_loop_finished := True
				end
				if not has_compile_loop_finished then a_child_iterator.forth end
			end
			if compiled_actions_count = 0 then
				last_generated_instruction := Void
			elseif compiled_actions_count = 1 then
				a_boolean_value ?= compiled_conditions.item (1)
				if a_boolean_value /= Void then
					if a_boolean_value.value then

						-- only one condition left, and it's known to be true: return the corresponding action
						
						last_generated_instruction := compiled_actions.item (1)
					else

						-- but if it's false, return a no-op

						last_generated_instruction := Void
					end
				else
					create {XM_XSLT_COMPILED_CHOOSE} last_generated_instruction.make (an_executable, compiled_conditions, compiled_actions)
				end
			else
				create {XM_XSLT_COMPILED_CHOOSE} last_generated_instruction.make (an_executable, compiled_conditions, compiled_actions)
			end
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

	compiled_actions_count: INTEGER
			-- Number of when's + otherwise that are actually compiled

	has_compile_loop_finished: BOOLEAN
			-- Compile loop may terminate

	top_stylesheet:XM_XSLT_STYLESHEET
			-- Prinicpal stylesheet

	compiled_conditions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			--	Conditions present in compiled instruction
	
	compiled_actions: DS_ARRAYED_LIST [XM_XSLT_INSTRUCTION]
			-- Actions present in compiled instruction

	compile_when (an_executable: XM_XSLT_EXECUTABLE; a_when: XM_XSLT_WHEN) is
			-- Compile when clause.
		require
			executable_not_void: an_executable /= Void
			when_clause_not_void: a_when /= Void
		local
			a_condition: XM_XPATH_EXPRESSION
			a_block: XM_XSLT_BLOCK
			a_module_number: INTEGER
			an_action: XM_XSLT_INSTRUCTION
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			a_condition := a_when.condition
			create a_block.make_when (an_executable)
			check
				module_registered: top_stylesheet.is_module_registered (a_when.system_id)
				-- TODO: Why? Maybe this isn't so - review
			end
			a_module_number := top_stylesheet.module_number (a_when.system_id)
			a_block.set_source_location (a_module_number, a_when.line_number)
			a_when.compile_children (an_executable, a_block)
			if a_when.last_generated_instruction_list.count = 1 then
				an_action := a_when.last_generated_instruction_list.item (1)
			else
				an_action := a_block
			end
			
			-- Optimize for constant conditions (true or false)
			
			a_boolean_value ?= a_condition
			if a_boolean_value /= Void then
				if a_boolean_value.value then
					compiled_actions_count := compiled_actions_count + 1
					compiled_conditions.put_last (a_condition)
					compiled_actions.put_last (an_action)
					has_compile_loop_finished := True
				else
					
					--  constant false: omit this test
					
				end
			else
				compiled_actions_count := compiled_actions_count + 1
				compiled_conditions.put_last (a_condition)
				compiled_actions.put_last (an_action)						
			end
		end

invariant

	instruction: is_instruction = True

end
