indexing

	description:

		"xsl:matching-substring element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_MATCHING_SUBSTRING

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, may_contain_sequence_constructor,
			returned_item_type, is_matching_substring,
			as_matching_substring
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			Result := common_child_item_type
		end

feature -- Status report

	is_matching_substring: BOOLEAN is
			-- Is `Current' an xsl:matching-substring?
		do
			Result := True
		end

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
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			an_analyze_string: XM_XSLT_ANALYZE_STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			an_analyze_string ?= parent
			if an_analyze_string = Void then
				create an_error.make_from_string ("Xsl:matching-substring must be immediate child of xsl:analyze-string", Xpath_errors_uri, "XTSE0010", Static_error)
				report_compile_error (an_error)
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			create an_error.make_from_string ("BUG: xsl:matching-substring should not be compiled", Gexslt_eiffel_type_uri, "COMPILE_BUG", Static_error)
			report_compile_error (an_error)
		end

feature -- Conversion

	as_matching_substring: XM_XSLT_MATCHING_SUBSTRING is
			-- `Current' seen as an xsl:matching-substring
		do
			Result := Current
		end

end
