indexing

	description:

		"xsl:decimal-format element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DECIMAL_FORMAT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	name: STRING
			-- Name

	is_default_format: BOOLEAN is
			-- Is this the default format?
		require
			attributes_prepared: attributes_prepared
		do
			Result := name = Void
		end

	decimal_separator: STRING
			-- Decimal separator sign

	grouping_separator: STRING
			-- Grouping separator sign

	infinity: STRING
			-- Infinity symbol

	minus_sign: STRING
			-- Minus symbol

	nan: STRING
			-- NaN symbol

	percent: STRING
			-- Percent symbol

	per_mille: STRING
			-- Per-mill symbol

	zero_digit: STRING
			-- Zero digit symbol

	digit: STRING
			-- Digit sign

	pattern_separator: STRING
			-- Pattern separator sign


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
				if STRING_.same_string (an_expanded_name, Name_attribute) then
					name := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Decimal_separator_attribute) then
					decimal_separator	:= attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Grouping_separator_attribute) then
					grouping_separator := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Infinity_attribute) then
					infinity := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Minus_sign_attribute) then
					minus_sign := attribute_value_by_index (a_cursor.index)					
				elseif STRING_.same_string (an_expanded_name, Nan_attribute) then
					nan := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Percent_attribute) then
					percent := attribute_value_by_index (a_cursor.index)										
				elseif STRING_.same_string (an_expanded_name, Per_mille_attribute) then
					per_mille := attribute_value_by_index (a_cursor.index)										
				elseif STRING_.same_string (an_expanded_name, Zero_digit_attribute) then
					zero_digit := attribute_value_by_index (a_cursor.index)										
				elseif STRING_.same_string (an_expanded_name, Digit_attribute) then
					digit := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Pattern_separator_attribute) then
					pattern_separator	:= attribute_value_by_index (a_cursor.index)					
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			attributes_prepared := True			
		end

	validate is
			-- Check that the stylesheet element is valid.
		do
			check_top_level
			check_empty
			validated := True
		end

	compile (compile_to_eiffel: BOOLEAN) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		do
			todo ("compile", False)
		end

end
