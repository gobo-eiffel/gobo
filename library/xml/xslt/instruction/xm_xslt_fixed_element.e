indexing
	description:

		"Elements whose name is known at compile time"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_FIXED_ELEMENT

inherit

	XM_XSLT_ELEMENT_CONSTRUCTOR
		redefine
			item_type, simplify
		end

	XM_XPATH_TOKENS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_name_code: INTEGER; a_namespace_code_list: DS_ARRAYED_LIST [INTEGER]; some_attribute_sets: DS_ARRAYED_LIST [INTEGER];
			a_schema_type: XM_XPATH_SCHEMA_TYPE; a_validation_action: INTEGER; inherit_namespaces: BOOLEAN; a_content: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			namespace_codes_not_void: a_namespace_code_list /= Void
			validation: a_validation_action >= Validation_strict  and then Validation_strip >= a_validation_action
			content_not_void: a_content /= Void
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
		do
			executable := an_executable
			fixed_name_code := a_name_code
			attribute_sets := some_attribute_sets
			validation_action := a_validation_action
			type := a_schema_type
			namespace_code_list := a_namespace_code_list
			is_inherit_namespaces := inherit_namespaces
			content := a_content
			adopt_child_expression (content)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			name_code_set: fixed_name_code = a_name_code
			attribute_sets_set: attribute_sets = some_attribute_sets
			validation_action_set: validation_action = a_validation_action
			type_set: type = a_schema_type
			namespace_codes_set: namespace_code_list = a_namespace_code_list
			is_inherit_namespaces_set: is_inherit_namespaces = inherit_namespaces
			content_set: content = a_content
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			if internal_item_type /= Void then
				Result := internal_item_type
			else
				Result := Precursor
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	instruction_name: STRING is
			-- Name of instruction, for diagnostics
		do
			Result := shared_name_pool.display_name_from_name_code (fixed_name_code)
		end

	name_code (a_context: XM_XSLT_EVALUATION_CONTEXT): INTEGER is
			-- Name code
		do
			Result := fixed_name_code
		end

	new_base_uri (a_context: XM_XPATH_CONTEXT): STRING is
			-- Re-calculated base URI
		do
			Result := base_uri
			if Result = Void then
				Result := ""
			end
		end
		
feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:element ")
			std.error.put_string (a_string)
			std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "fixed name ")
			a_string := STRING_.appended_string (a_string, shared_name_pool.display_name_from_name_code (fixed_name_code))
			std.error.put_string (a_string)
			std.error.put_new_line			
			a_string := STRING_.appended_string (indentation (a_level + 1), "content ")
			std.error.put_string (a_string)
			std.error.put_new_line			
			content.display (a_level + 2)
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
			-- Perform context-free optimizations.
		local
			l_name_test: XM_XPATH_NAME_TEST
			l_original_text: STRING
			l_content_test: XM_XPATH_CONTENT_TYPE_TEST
		do
			
			-- The following code will need modifying for a schema-aware processor:

			l_original_text := STRING_.concat ("element(", shared_name_pool.display_name_from_name_code (fixed_name_code))
			l_original_text := STRING_.appended_string (l_original_text, ")")
			create l_name_test.make (Element_node, fixed_name_code, l_original_text)
			create l_content_test.make (Element_node, type_factory.untyped_type)
			create {XM_XPATH_COMBINED_NODE_TEST} internal_item_type.make (l_name_test, Intersect_token, l_content_test)
			
			Precursor (a_replacement)
		end

feature {XM_XSLT_ELEMENT_CONSTRUCTOR} -- Local

	output_namespace_nodes (a_context: XM_XSLT_EVALUATION_CONTEXT; a_receiver: XM_XPATH_RECEIVER) is
			-- Output namespace nodes for the new element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			if namespace_code_list.count > 0 then
				from
					a_cursor := namespace_code_list.new_cursor; a_cursor.start
				variant
					namespace_code_list.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					if a_cursor.item >= 0 then -- drop excluded namespaces
						a_receiver.notify_namespace (a_cursor.item, 0)
						a_cursor.forth
					else
						a_cursor.remove
					end
				end
			end
		end
	
feature {NONE} -- Implementation
	
	fixed_name_code: INTEGER
			-- Name code

	namespace_code_list: DS_ARRAYED_LIST [INTEGER]
			-- Namespace codes

	internal_item_type: XM_XPATH_ITEM_TYPE 
			-- Data type of the expression, when known

invariant

	namespace_codes_not_void: initialized implies namespace_code_list /= Void
	valid_name_code: shared_name_pool.is_valid_name_code (fixed_name_code)

end
	
