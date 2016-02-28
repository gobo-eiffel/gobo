note

	description:

		"Objects whose content template produces a text value:%
		%xsl:attribute, xsl:comment, xsl:namespace, xsl:text, xsl:value-of and xsl:processing-instruction"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_STRING_CONSTRUCTOR

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, may_contain_sequence_constructor
		end

feature -- Access

	select_and_content_error: STRING
			-- Error code when both select expression and content are mutually exclusive
		deferred
		ensure
			result_not_void: Result /= Void
			result_not_empty: not Result.is_empty
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence_constructor?
		do
			Result := True
		end

feature -- Element change

	validate
			-- Check that the stylesheet element is valid
		local
			a_message: STRING
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node: XM_XPATH_NODE
			an_error: XM_XPATH_ERROR_VALUE
		do
			if select_expression /= Void and then has_child_nodes then
				a_message := STRING_.appended_string ("An ", node_name)
				a_message := STRING_.appended_string (a_message, " element with a select attribute must be empty")
				create an_error.make_from_string (a_message, Xpath_errors_uri, select_and_content_error, Static_error)
				report_compile_error (an_error)
			else
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
				if select_expression = Void then
					if a_child_iterator.after then

						-- No select attribute and no children

						create {XM_XPATH_STRING_VALUE} select_expression.make ("")
					else
						a_node := a_child_iterator.item
						a_child_iterator.forth
						if a_child_iterator.after then

							-- Exactly one child node - optimize if it is a text node

							if a_node.node_type = Text_node then
								create {XM_XPATH_STRING_VALUE} select_expression.make (a_node.string_value)
							end
						end
					end
				end
			end
			validated := True
		end

	compile_content (an_executable: XM_XSLT_EXECUTABLE; a_string_constructor: XM_XSLT_TEXT_CONSTRUCTOR; a_separator_expression: detachable XM_XPATH_EXPRESSION)
			-- Compile content.
		require
			executable_not_void: an_executable /= Void
			string_constructor_not_void: a_string_constructor /= Void
		local
			a_separator: detachable XM_XPATH_EXPRESSION
			a_content: XM_XPATH_EXPRESSION
			a_content_contructor: XM_XSLT_CONTENT_CONSTRUCTOR
		do
			a_separator := a_separator_expression
			if a_separator = Void then
				create {XM_XPATH_STRING_VALUE} a_separator.make ("")
			end
			if attached select_expression as l_select_expression then
				a_content := l_select_expression
			else
				compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
				check attached last_generated_expression as l_last_generated_expression then
					a_content := l_last_generated_expression
				end
			end
			create a_content_contructor.make (a_content, a_separator)
			a_string_constructor.set_select_expression (a_content_contructor)
		end

feature {NONE} -- Implementation

	select_expression: detachable XM_XPATH_EXPRESSION
			-- Value of 'select' attribute

end

