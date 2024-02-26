note

	description:

		"xsl:key element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"

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

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list: detachable DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration)
			-- Establish invariant.
		do
			create slot_manager.make
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_name_attribute, a_use_attribute, a_match_attribute: detachable STRING
			l_collation_uri: like collation_uri
			l_key_name: like key_name
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
					if STRING_.same_string (an_expanded_name, Name_attribute) then
						a_name_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_name_attribute)
						STRING_.right_adjust (a_name_attribute)
					elseif STRING_.same_string (an_expanded_name, Use_attribute) then
						a_use_attribute := attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Match_attribute) then
						a_match_attribute := attribute_value_by_index (a_cursor.index)
					elseif STRING_.same_string (an_expanded_name, Collation_attribute) then
						l_collation_uri := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (l_collation_uri)
						STRING_.right_adjust (l_collation_uri)
						collation_uri := l_collation_uri
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if a_name_attribute = Void then
				report_absence ("name")
			else
				l_key_name := a_name_attribute
				key_name := l_key_name
				if is_qname (l_key_name) then
					generate_name_code (a_name_attribute)
					if last_generated_name_code = -1 then
						check postcondition_of_generate_name_code: attached name_code_error_value as l_name_code_error_value then
							report_compile_error (l_name_code_error_value)
						end
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
					report_compile_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (l_key_name, " is not a lexical QName"),
						Xpath_errors_uri, "XTSE0020", Static_error))
				end
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_key_manager: XM_XSLT_KEY_MANAGER
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_role: XM_XPATH_ROLE_LOCATOR
			l_atomic_type: XM_XPATH_SEQUENCE_TYPE
			l_collation_name: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_collation_uri: like collation_uri
		do
			check_top_level (Void)
			if use /= Void then
				check_empty_with_attribute ("use", "XTSE1205")
			else
				check_not_empty_missing_attribute ("use", "XTSE1205")
			end
			if not any_compile_errors and then attached use as l_use then
				create l_type_checker
				create l_role.make (Instruction_role, "xsl:key/use", 1, Xpath_errors_uri, "XPTY0004")
				create l_atomic_type.make (type_factory.any_atomic_type, Required_cardinality_zero_or_more)
				l_type_checker.static_type_check (static_context, l_use, l_atomic_type, False, l_role)
				if l_type_checker.is_static_type_check_error	then
					check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
						report_compile_error (l_static_type_check_error)
					end
				else
					use := l_type_checker.checked_expression
				end
			end
			if not any_compile_errors and then attached use as l_use then
				create l_replacement.make (Void)
				type_check_expression (l_replacement, "use", l_use)
				use := l_replacement.item
			end
			if not any_compile_errors and then attached match as l_match then
				type_check_pattern ("match", l_match)
			end

			l_collation_uri := collation_uri
			if l_collation_uri = Void then
				check attached static_context as l_static_context then
					l_collation_uri := l_static_context.default_collation_name
					collation_uri := l_collation_uri
				end
			end
			check attached principal_stylesheet as l_principal_stylesheet then
				l_key_manager := l_principal_stylesheet.key_manager
			end
			if l_key_manager.has_key (key_fingerprint) then
				l_collation_name := l_key_manager.collation_uri (key_fingerprint)
				if not STRING_.same_string (l_collation_name, l_collation_uri) then
					check attached key_name as l_key_name then
						create l_error.make_from_string (STRING_.concat("inconsistent collation names for key ", l_key_name), Xpath_errors_uri, "XTSE1220", Static_error)
					end
					report_compile_error (l_error)
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_key_manager: XM_XSLT_KEY_MANAGER
			a_key_definition: XM_XSLT_KEY_DEFINITION
			a_collator: detachable ST_COLLATOR
			a_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_role: XM_XPATH_ROLE_LOCATOR
			l_atomic_type: XM_XPATH_SEQUENCE_TYPE
			l_primitive_type: INTEGER
			l_use: like use
		do
			check attached principal_stylesheet as l_principal_stylesheet then
				check attached collation_uri as l_collation_uri then
					if not l_principal_stylesheet.is_collator_defined (l_collation_uri) then
						a_message := STRING_.concat ("The collation named '", l_collation_uri)
						a_message := STRING_.appended_string (a_message, "' has not been defined")
						create l_error.make_from_string (a_message, Xpath_errors_uri, "XTSE1210", Static_error)
						report_compile_error (l_error)
					else
						a_collator := l_principal_stylesheet.find_collator (l_collation_uri)
					end
				end
				l_use := use
				if l_use = Void then
					compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
					if not attached last_generated_expression as l_last_generated_expression then

						-- This really shouldn't occur

						create l_error.make_from_string ("BUG: Sequence constructor must be present for xsl:key when use attribute is absent.", Xpath_errors_uri, "XTSE1205", Static_error)
						report_compile_error (l_error)
					else
						check attached static_context as l_static_context then
							create {XM_XPATH_ATOMIZER_EXPRESSION} l_use.make (l_last_generated_expression, l_static_context.configuration.are_all_nodes_untyped)
							use := l_use
						end
						create l_type_checker
						create l_role.make (Instruction_role, "xsl:key/use", 1, Xpath_errors_uri, "XPTY0004")
						create l_atomic_type.make (type_factory.any_atomic_type, Required_cardinality_zero_or_more)
						l_type_checker.static_type_check (static_context, l_use, l_atomic_type, False, l_role)
						if l_type_checker.is_static_type_check_error	then
							check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
								report_compile_error (l_static_type_check_error)
							end
						else
							check postcondition_of_static_type_check: attached l_type_checker.checked_expression as l_checked_expression then
								l_use := l_checked_expression
								use := l_use
							end
						end
						if is_backwards_compatible_processing_enabled then
							l_primitive_type := l_use.item_type.primitive_type
							if not (l_primitive_type = Untyped_atomic_type_code or l_primitive_type = String_type_code) then
								create {XM_XPATH_ATOMIC_SEQUENCE_CONVERTER} l_use.make (l_use, type_factory.string_type)
								use := l_use
							end
						end
					end
				end
				if not any_compile_errors then
					l_key_manager := l_principal_stylesheet.key_manager
					check
						attached match as l_match
						a_collator /= Void
						l_use /= Void
						attached collation_uri as l_collation_uri
					then
						create a_key_definition.make (an_executable, l_match, l_use, a_collator, l_collation_uri, line_number, system_id, slot_manager)
					end
					if is_backwards_compatible_processing_enabled then
						a_key_definition.set_backwards_compatible
					end
					l_key_manager.add_key_definition (a_key_definition, key_fingerprint)
				end
				last_generated_expression := Void
			end
		end

feature -- Conversion

	is_key: BOOLEAN
			-- Is `Current' an xsl:key?
		do
			Result := True
		end

	as_key: XM_XSLT_KEY
			-- `Current' seen as an xsl:key
		do
			Result := Current
		end

feature {NONE} -- Implementation

	key_name: detachable STRING
			-- Name of key (for diagnostic purposes)

	key_fingerprint: INTEGER
			-- Fingerprint of the key's QName

	match: detachable XM_XSLT_PATTERN
			-- Match pattern

	use: detachable XM_XPATH_EXPRESSION
			-- Usage expression

	collation_uri: detachable STRING
			-- Collation URI to use when comparing key names

invariant

	key_name: attributes_prepared and then not any_compile_errors implies key_name /= Void
	collation_uri: parent_node /= Void and then not any_compile_errors and then validated implies collation_uri /= Void

end
