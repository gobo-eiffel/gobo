﻿note

	description:

		"xsl:namespace-alias element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_NAMESPACE_ALIAS

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, is_namespace_alias, as_namespace_alias
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	stylesheet_uri_code: INTEGER
			-- URI code for stylesheet-prefix attribute

	result_namespace_code: INTEGER
			-- Namespace code for target namespace

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_stylesheet_prefix_attribute, a_result_prefix_attribute, a_uri: detachable STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
				until
					a_cursor.after or any_compile_errors
				loop
					a_name_code := a_cursor.item
					an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
					if STRING_.same_string (an_expanded_name, Stylesheet_prefix_attribute) then
						a_stylesheet_prefix_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_stylesheet_prefix_attribute)
						STRING_.right_adjust (a_stylesheet_prefix_attribute)
					elseif STRING_.same_string (an_expanded_name, Result_prefix_attribute) then
						a_result_prefix_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_result_prefix_attribute)
						STRING_.right_adjust (a_result_prefix_attribute)
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if a_stylesheet_prefix_attribute = Void then
				report_absence ("stylesheet-prefix")
			else
				if STRING_.same_string (a_stylesheet_prefix_attribute, "#default") then
					a_stylesheet_prefix_attribute := ""
				end
				stylesheet_uri_code := uri_code_for_prefix (a_stylesheet_prefix_attribute)
				if stylesheet_uri_code = -1 then
					create an_error.make_from_string (STRING_.concat (a_stylesheet_prefix_attribute, " is not an in-scope prefix."), Xpath_errors_uri, "XTSE0812", Static_error)
					report_compile_error (an_error)
				end
			end
			if a_result_prefix_attribute = Void then
				report_absence ("result-prefix")
			else
				if STRING_.same_string (a_result_prefix_attribute, "#default") then
					a_result_prefix_attribute := ""
				end
				a_uri := uri_for_prefix (a_result_prefix_attribute, True)
				check a_uri /= Void then
					if shared_name_pool.is_namespace_code_allocated (a_result_prefix_attribute, a_uri) then
						result_namespace_code := shared_name_pool.namespace_code (a_result_prefix_attribute, a_uri)
					else
						shared_name_pool.allocate_namespace_code (a_result_prefix_attribute, a_uri)
						result_namespace_code := shared_name_pool.last_namespace_code
					end
				end
				if result_namespace_code = -1 then
					create an_error.make_from_string (STRING_.concat (a_result_prefix_attribute, " is not an in-scope prefix."), Xpath_errors_uri, "XTSE0812", Static_error)
					report_compile_error (an_error)
				end
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		do
			check_top_level (Void)
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		do
			last_generated_expression := Void
		end

feature -- Conversion

	is_namespace_alias: BOOLEAN
			-- Is `Current' an xsl:namespace-alias?
		do
			Result := True
		end

	as_namespace_alias: XM_XSLT_NAMESPACE_ALIAS
			-- `Current' seen as an xsl:namespace-alias
		do
			Result := Current
		end

end
