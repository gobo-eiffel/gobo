indexing

	description:

		"xsl:key element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

	XM_XPATH_ROLE

	XM_XPATH_CARDINALITY

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_use_attribute, a_match_attribute: STRING
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
					a_name_attribute := attribute_value_by_index (a_cursor.index)
					a_name_attribute.left_adjust
					a_name_attribute.right_adjust
				elseif STRING_.same_string (an_expanded_name, Use_attribute) then
					a_use_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Match_attribute) then
					a_match_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Collation_attribute) then
					collation_uri := attribute_value_by_index (a_cursor.index)
					collation_uri.left_adjust
					collation_uri.right_adjust
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if a_name_attribute = Void then
				report_absence ("name")
			else
				generate_name_code (a_name_attribute)
				if last_generated_name_code = -1 then
					report_compile_error (error_message)
				else
					key_fingerprint :=  last_generated_name_code // bits_20
					if a_match_attribute = Void then
						report_absence ("match")
					else
						generate_pattern (a_match_attribute)
						match := last_generated_pattern
						if a_use_attribute /= Void then
							generate_expression (a_use_attribute)
							use := last_generated_expression -- a compile error may have been reported
						end
					end
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		local
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_role: XM_XPATH_ROLE_LOCATOR
			an_atomic_type: XM_XPATH_SEQUENCE_TYPE
		do
			check_top_level
			if use /= Void then
				check_empty_with_attribute ("use")
			else
				check_not_empty_missing_attribute ("use")
			end
			if not any_compile_errors then
				create a_type_checker
				create a_role.make (Instruction_role, "xsl:key/use", 1)
				create an_atomic_type.make (type_factory.any_atomic_type, Required_cardinality_zero_or_more)
				a_type_checker.static_type_check (static_context, use, an_atomic_type, False, a_role)
				if a_type_checker.is_static_type_check_error	then
					report_compile_error (a_type_checker.static_type_check_error_message)
				else
					use := a_type_checker.checked_expression
				end
			end
			if not any_compile_errors and then use /= Void then
				type_check_expression ("use", use)
				if use.was_expression_replaced then
					use := use.replacement_expression
				end
			end
			if not any_compile_errors and then match /= Void then
				type_check_pattern ("match", match)
			end
			
			-- TODO check that the collation for this key is consistent
			--  with other key definitions of the same name

			validated := True
		end

	compile (compile_to_eiffel: BOOLEAN) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		do
			todo ("compile", False)
		end

feature {NONE} -- Implementation

	key_fingerprint: INTEGER
			-- Fingerprint of the key's QName

	match: XM_XSLT_PATTERN
			-- Match pattern

	use: XM_XPATH_EXPRESSION
			-- Usage expression

	collation_uri: STRING
			-- Collation URI to use when comparing key names

end
