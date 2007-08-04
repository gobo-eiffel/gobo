indexing

	description:

		"xsl:key element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_KEY

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate, may_contain_sequence_constructor, is_key, as_key
		end

	XM_XSLT_PROCEDURE

	XM_XPATH_ROLE

	XM_XPATH_CARDINALITY

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
		
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration) is
			-- Establish invariant.
		do
			create slot_manager.make
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

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
				a_cursor.after or any_compile_errors
			loop
				a_name_code := a_cursor.item
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Name_attribute) then
					a_name_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_name_attribute)
					STRING_.right_adjust (a_name_attribute)
				elseif STRING_.same_string (an_expanded_name, Use_attribute) then
					a_use_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Match_attribute) then
					a_match_attribute := attribute_value_by_index (a_cursor.index)
				elseif STRING_.same_string (an_expanded_name, Collation_attribute) then
					collation_uri := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (collation_uri)
					STRING_.right_adjust (collation_uri)
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if a_name_attribute = Void then
				report_absence ("name")
			else
				key_name := a_name_attribute
				if is_qname (key_name) then
					generate_name_code (a_name_attribute)
					if last_generated_name_code = -1 then
						report_compile_error (name_code_error_value)
					else
						key_fingerprint :=  fingerprint_from_name_code (last_generated_name_code)
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
				else
					report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (key_name, " is not a lexical QName"),
						Xpath_errors_uri, "XTSE0020", Static_error))
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_key_manager: XM_XSLT_KEY_MANAGER
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_role: XM_XPATH_ROLE_LOCATOR
			an_atomic_type: XM_XPATH_SEQUENCE_TYPE
			a_collation_name: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			check_top_level (Void)
			if use /= Void then
				check_empty_with_attribute ("use", "XTSE1205")
			else
				check_not_empty_missing_attribute ("use", "XTSE1205")
			end
			if not any_compile_errors and then use /= Void then
				create a_type_checker
				create a_role.make (Instruction_role, "xsl:key/use", 1, Xpath_errors_uri, "XPTY0004")
				create an_atomic_type.make (type_factory.any_atomic_type, Required_cardinality_zero_or_more)
				a_type_checker.static_type_check (static_context, use, an_atomic_type, False, a_role)
				if a_type_checker.is_static_type_check_error	then
					report_compile_error (a_type_checker.static_type_check_error)
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

			if collation_uri = Void then
				collation_uri := static_context.default_collation_name
			end
			a_key_manager := principal_stylesheet.key_manager
			if a_key_manager.has_key (key_fingerprint) then
				a_collation_name := a_key_manager.collation_uri (key_fingerprint)
				if not STRING_.same_string (a_collation_name, collation_uri) then
					create an_error.make_from_string (STRING_.concat("inconsistent collation names for key ", key_name), Xpath_errors_uri, "XTSE1220", Static_error)
					report_compile_error (an_error)
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_key_manager: XM_XSLT_KEY_MANAGER
			a_key_definition: XM_XSLT_KEY_DEFINITION
			a_collator: ST_COLLATOR
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_role: XM_XPATH_ROLE_LOCATOR
			an_atomic_type: XM_XPATH_SEQUENCE_TYPE
		do
			if not principal_stylesheet.is_collator_defined (collation_uri) then
				a_message := STRING_.concat ("The collation named '", collation_uri)
				a_message := STRING_.appended_string (a_message, "' has not been defined")
				create an_error.make_from_string (a_message, Xpath_errors_uri, "XTSE1210", Static_error)
				report_compile_error (an_error)
			else
				a_collator := principal_stylesheet.find_collator (collation_uri)
			end
			if use = Void then
				compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
				if last_generated_expression = Void then

					-- This really shouldn't occur

					create an_error.make_from_string ("BUG: Sequence constructor must be present for xsl:key when use attribute is absent.", Xpath_errors_uri, "XTSE1205", Static_error)
					report_compile_error (an_error)
				else
					create {XM_XPATH_ATOMIZER_EXPRESSION} use.make (last_generated_expression, static_context.configuration.are_all_nodes_untyped)
					create a_type_checker
					create a_role.make (Instruction_role, "xsl:key/use", 1, Xpath_errors_uri, "XPTY0004")
					create an_atomic_type.make (type_factory.any_atomic_type, Required_cardinality_zero_or_more)
					a_type_checker.static_type_check (static_context, use, an_atomic_type, False, a_role)
					if a_type_checker.is_static_type_check_error	then
						report_compile_error (a_type_checker.static_type_check_error)
					else
						use := a_type_checker.checked_expression
					end
				end
			end
			if not any_compile_errors then
				a_key_manager := principal_stylesheet.key_manager
				create a_key_definition.make (an_executable, match, use, a_collator, collation_uri, line_number, system_id, slot_manager)
				a_key_manager.add_key_definition (a_key_definition, key_fingerprint)
			end
			last_generated_expression := Void
		end

feature -- Conversion

	is_key: BOOLEAN is
			-- Is `Current' an xsl:key?
		do
			Result := True
		end

	as_key: XM_XSLT_KEY is
			-- `Current' seen as an xsl:key
		do
			Result := Current
		end

feature {NONE} -- Implementation

	key_name: STRING
			-- Name of key (for diagnostic purposes)

	key_fingerprint: INTEGER
			-- Fingerprint of the key's QName

	match: XM_XSLT_PATTERN
			-- Match pattern

	use: XM_XPATH_EXPRESSION
			-- Usage expression

	collation_uri: STRING
			-- Collation URI to use when comparing key names

invariant

	key_name: attributes_prepared and then not any_compile_errors implies key_name /= Void
	collation_uri: parent_node /= Void and then not any_compile_errors and then validated implies collation_uri /= Void

end
