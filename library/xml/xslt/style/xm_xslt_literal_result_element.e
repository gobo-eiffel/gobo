indexing

	description:

		"Literal result elements"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_LITERAL_RESULT_ELEMENT

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, validate_children
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			an_index, a_name_code, a_uri_code, a_fingerprint: INTEGER
			a_name_pool: XM_XPATH_NAME_POOL
		do
			create attribute_name_codes.make (number_of_attributes)
			create attribute_values.make (number_of_attributes)
			attribute_values.set_equality_tester (expression_tester)
			create attribute_clean_flags.make (number_of_attributes)
			if number_of_attributes > 0 then
				a_name_pool := document.name_pool
				from
					an_index := 1
				variant
					number_of_attributes + 1 - an_index
				until
					any_compile_errors or else an_index > number_of_attributes
				loop
					a_name_code := attribute_name_code (an_index)
					a_uri_code := a_name_pool.uri_code_from_name_code (a_name_code)
					if a_uri_code = Xslt_uri_code then
						a_fingerprint := a_name_pool.fingerprint_from_name_code (a_name_code)
						if a_fingerprint = Xslt_use_attribute_sets_type_code then -- deal with this later
						elseif a_fingerprint = Xslt_extension_element_prefixes_type_code then -- already dealt with
						elseif a_fingerprint = Xslt_exclude_result_prefixes_type_code then -- already dealt with
						elseif a_fingerprint = Xslt_version_type_code then -- already dealt with
						elseif a_fingerprint = Xslt_xpath_default_namespace_type_code then -- already dealt with
						elseif a_fingerprint = Xslt_type_type_code then -- deal with this later
						elseif a_fingerprint = Xslt_validation_type_code then -- deal with this later
						else
							report_compile_error (STRING_.appended_string ("Unknown XSL attribute ", a_name_pool.display_name_from_name_code (a_name_code)))
						end
					else
						attribute_name_codes.put_last (a_name_code)
						generate_attribute_value_template (attribute_value_by_index (an_index), static_context)
						attribute_values.put_last (last_generated_expression)
						attribute_clean_flags.put_last (is_attribute_checked_clean (last_generated_expression))
					end
					an_index := an_index + 1
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		do
			todo ("validate", False)
			validated := True
		end

		validate_children is
			-- Validate the children of this node, recursively.
		do
			if not top_level then
				Precursor
			end
		end

	compile (compile_to_eiffel: BOOLEAN) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		do
			todo ("compile", False)
		end

feature {NONE} -- Implementation

	top_level: BOOLEAN
			-- Is `Current' a top-level element?

			-- The next three lists constitute a triple:

	attribute_name_codes: DS_ARRAYED_LIST [INTEGER]
			-- Name codes for non-XSLT attributes

	attribute_values:  DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Values for non-XSLT attributes
	
	attribute_clean_flags: DS_ARRAYED_LIST [BOOLEAN]
			-- Flags for non-XSLT attributes indicating whether they are clean for XML output

	is_attribute_checked_clean (an_expression: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `an_expression' guarenteed free of special characters?
		require
			expression_not_void: an_expression /= Void
		local
			a_string_value: XM_XPATH_STRING_VALUE
			a_string: STRING
			an_index, a_character_code: INTEGER
		do

			-- If we can be sure the attribute value contains no special XML/HTML characters,
			--  we can save the trouble of checking it each time it is output.
			-- Note that the check includes characters that need to be escaped in a URL if the
			--  output method turns out to be HTML (we don't know the method at compile time).

			a_string_value ?= last_generated_expression
			if a_string_value /= Void then
				a_string := a_string_value.string_value
				Result := True
				from
					an_index := 1
				variant
					a_string.count + 1 - an_index
				until
					Result = False or else an_index > a_string.count
				loop
					a_character_code := a_string.item_code (an_index)
					if a_character_code < 33 or else a_character_code > 126
						or else a_character_code = ('>').code
						or else a_character_code = ('<').code
						or else a_character_code = ('&').code
						or else a_character_code = ('%"').code then
						Result := False
					end
					an_index := an_index + 1
				end
			end
		end

invariant

	attribute_lists_not_void: attributes_prepared implies attribute_name_codes /= Void and attribute_values /= Void and attribute_clean_flags /= Void
	attribute_lists_consistent_length: attributes_prepared implies attribute_name_codes.count = attribute_values.count and attribute_values.count = attribute_clean_flags.count

end
