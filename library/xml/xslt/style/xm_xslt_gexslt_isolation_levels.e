indexing

	description:

		"Objects that implement gexslt:isolation-levels"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_GEXSLT_ISOLATION_LEVELS

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

	-- This class implements a User-defined Data Element in the gexslt extensions
	--  namespace, whose purpose is to establish isolation levels for fn:doc and fn:collection.

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
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
				check_unknown_attribute (a_name_code)
				a_cursor.forth
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_style_element: XM_XSLT_STYLE_ELEMENT
			an_error: XM_XPATH_ERROR_VALUE
			finished: BOOLEAN
		do
			check_top_level (Void)
			from
				a_child_iterator := new_axis_iterator (Child_axis); a_child_iterator.start
			until finished or else a_child_iterator.after loop
				a_style_element ?= a_child_iterator.item
				if a_child_iterator.item.node_type = Text_node and then is_all_whitespace (a_child_iterator.item.string_value) then
					-- do nothing, as xml:space="preserve" makes this legitimate
				elseif a_style_element /= Void and then
					not (a_style_element.is_gexslt_document or a_style_element.is_gexslt_collection)
				 then
					create an_error.make_from_string ("Only gexslt:document and gexslt:collection are allowed here", Xpath_errors_uri, "XTSE0010", Static_error) 
					report_compile_error (an_error); finished := True
				end
				a_child_iterator.forth
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			an_axis_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			an_axis_iterator := new_axis_iterator (Child_axis)
			from an_axis_iterator.start until an_axis_iterator.after loop
				a_style_element ?= an_axis_iterator.item
				if a_style_element /= Void then
					a_style_element.compile (an_executable)
				end
				an_axis_iterator.forth
			end
			last_generated_expression := Void
		end

end
