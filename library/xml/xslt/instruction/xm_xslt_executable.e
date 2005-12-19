indexing

	description:

		"Objects that represent an executable stylesheet"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_EXECUTABLE

inherit

	XM_XPATH_SHARED_NAME_POOL

	XM_XPATH_ISOLATION_LEVELS

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_rule_manager: XM_XSLT_RULE_MANAGER; a_key_manager: XM_XSLT_KEY_MANAGER;
			a_decimal_format_manager: XM_XSLT_DECIMAL_FORMAT_MANAGER;
			a_collation_map: DS_HASH_TABLE [ST_COLLATOR, STRING];
			a_module_list: DS_ARRAYED_LIST [STRING]; a_function_library: XM_XPATH_FUNCTION_LIBRARY_MANAGER) is
			-- Establish invariant.
		require
			rule_manager_not_void: a_rule_manager /= Void
			key_manager_not_void: a_key_manager /= Void
			decimal_format_manager: a_decimal_format_manager /= Void
			collation_map: a_collation_map /= Void
			module_list_not_void: a_module_list /= Void
			function_library_not_void: a_function_library /= Void
		do
			rule_manager := a_rule_manager
			key_manager := a_key_manager
			decimal_format_manager := a_decimal_format_manager
			collation_map := a_collation_map
			module_list := a_module_list
			function_library := a_function_library
			create character_map_index.make_default
			create global_slot_manager.make
			create output_properties_map.make_default
			create document_isolation_levels.make_with_equality_testers (5, Void, string_equality_tester)
			create collection_isolation_levels.make_with_equality_testers (5, Void, string_equality_tester)
		ensure
			rule_manager_set: rule_manager = a_rule_manager
			key_manager_set: key_manager = a_key_manager
			decimal_format_manager_set: decimal_format_manager = a_decimal_format_manager
			collation_map_set: collation_map = a_collation_map
			module_list_set: module_list = a_module_list
			function_library_set: function_library = a_function_library
			slots_not_yet_allocated: not are_slots_allocated
		end

feature -- Access

	global_slot_manager: XM_XPATH_SLOT_MANAGER
			-- Slot manager for global variables

	function_library: XM_XPATH_FUNCTION_LIBRARY_MANAGER
			-- Function library

	rule_manager: XM_XSLT_RULE_MANAGER
			-- Manager of template-matching rules

	key_manager: XM_XSLT_KEY_MANAGER
			-- Manger of key definitions

	decimal_format_manager: XM_XSLT_DECIMAL_FORMAT_MANAGER
			-- Manager of decimal formats

	default_output_properties: XM_XSLT_OUTPUT_PROPERTIES
			-- Default output properties (for the unnamed output format)
	
	compiled_templates_index: DS_HASH_TABLE [XM_XSLT_COMPILED_TEMPLATE, INTEGER]
			-- Index of named templates by `template_fingerprint'

	character_map_index: DS_HASH_TABLE [DS_HASH_TABLE [STRING, INTEGER], INTEGER]
			-- Index of named character maps

	static_context: XM_XSLT_EXPRESSION_CONTEXT
			-- Static context of principal stylesheet

	largest_pattern_stack_frame: INTEGER
			-- Maximum local variable count within a pattern

	document_isolation_levels: DS_HASH_TABLE [INTEGER, STRING]
			-- Map of SYSTEM ids to document isolation levels

	collection_isolation_levels: DS_HASH_TABLE [INTEGER, STRING]
			-- Map of SYSTEM ids to collection isolation levels

	system_id (a_module_number: INTEGER): STRING is
			-- SYSTEM id for stylesheet module `a_module_number'
		require
			valid_module_number: is_valid_module_number (a_module_number)
		do
			Result := module_list.item (a_module_number)
		ensure
			system_id_not_void: Result /= Void
		end

	output_properties (a_fingerprint: INTEGER): XM_XSLT_OUTPUT_PROPERTIES is
			-- Output properties set named by `a_fingerprint'?
		require
			valid_fingerprint: shared_name_pool.is_valid_name_code (a_fingerprint)
			has_property_set: has_output_properties (a_fingerprint)
		do
			Result := output_properties_map.item (a_fingerprint)
		ensure
			output_properties_not_void: Result /= Void
		end

	document_isolation_level (a_uri: STRING): INTEGER is
			-- Isolation-level for `a_uri'
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
		do
			if document_isolation_levels.has (a_uri) then
				Result := document_isolation_levels.item (a_uri)
			else
				Result := Serializable
			end
		ensure
			document_isolation_level_small_enough: Result <= Serializable
			document_isolation_level_large_enough: Result >= Read_uncommitted
		end

	collection_isolation_level (a_uri: STRING): INTEGER is
			-- Isolation-level for `a_uri'
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
		do
			if collection_isolation_levels.has (a_uri) then
				Result := collection_isolation_levels.item (a_uri)
			else
				Result := Serializable
			end
		ensure
			collection_isolation_level_small_enough: Result <= Serializable
			collection_isolation_level_large_enough: Result >= Read_uncommitted
		end

feature -- Status report

	is_strips_type_annotation: BOOLEAN
			-- Does `Current' strip type annotation?
			-- TODO: this is ignored at present  -required for schema-aware version

	is_strips_whitespace: BOOLEAN
			-- Does `Current' strip any whitespace at all?

	is_valid_module_number (a_module_number: INTEGER): BOOLEAN is
			-- is `a_module_number' a valid module number?
		do
			if a_module_number > 0 then Result := a_module_number <= module_list.count end
		end

	are_slots_allocated: BOOLEAN
			-- Have variable slots been allocated yet?

	has_output_properties (a_fingerprint: INTEGER): BOOLEAN is
			-- Does the executable have an output properties set named by `a_fingerprint'?
		require
			valid_fingerprint: shared_name_pool.is_valid_name_code (a_fingerprint)
		do
			Result := output_properties_map.has (a_fingerprint)
		end

	has_document_isolation_level (a_uri: STRING): BOOLEAN is
			-- Is isolation-level set for `a_uri'?
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
		do
			Result := document_isolation_levels.has (a_uri)
		end

	has_collection_isolation_level (a_uri: STRING): BOOLEAN is
			-- Is isolation-level set for `a_uri'?
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
		do
			Result := collection_isolation_levels.has (a_uri)
		end

feature -- Status setting

	set_whitespace_stripping (a_status: BOOLEAN) is
			-- Set whitespace stripping status.
		do
			is_strips_whitespace := a_status
		ensure
			set: is_strips_whitespace = a_status
		end

	set_strips_input_type_annotations (a_status: BOOLEAN) is
			-- Set type-annotations stripping status status.
		do
			is_strips_type_annotation := a_status
		ensure
			set: is_strips_type_annotation = a_status
		end

feature -- Creation

	new_stripper (a_transformer: XM_XSLT_TRANSFORMER; a_builder: XM_XPATH_BUILDER): XM_XSLT_STRIPPER is
			-- Stripper configured to implement the whitespace stripping rules
		require
			transformer_not_void: a_transformer /= Void
			builder_not_void: a_builder /= Void
		do
			create Result.make (a_transformer, stripper_rules, a_builder)
		ensure
			stripper_not_void: Result /= Void
		end

	new_bindery: XM_XSLT_BINDERY is
			-- New variable bindings
		require
			slots_allocated: are_slots_allocated
		do
			create Result.make (global_slot_manager.number_of_variables)
		ensure
			bindery_not_void: Result /= Void
		end
		
feature -- Element change

	set_function_library (a_function_library: XM_XPATH_FUNCTION_LIBRARY_MANAGER) is
			-- Set the function library.
		require
			function_library_not_void: a_function_library /= Void
		do
			function_library := a_function_library
		ensure
			function_library_set: function_library = a_function_library
		end

	set_named_template_table (a_compiled_templates_index: DS_HASH_TABLE [XM_XSLT_COMPILED_TEMPLATE, INTEGER]) is
			-- Set map of compiled templates.
		require
			map_not_void: a_compiled_templates_index /= Void
		do
			compiled_templates_index := a_compiled_templates_index
		ensure
			map_set: compiled_templates_index = a_compiled_templates_index
		end

	set_pattern_slot_space (a_pattern_slot_count: INTEGER) is
			-- Set space requirements for pattern variables
		require
			positive_pattern_slot_count: a_pattern_slot_count >= 0
			slots_not_yet_allocated: not are_slots_allocated
		do
			largest_pattern_stack_frame := a_pattern_slot_count
			are_slots_allocated := True
		ensure
			slots_allocated: are_slots_allocated and then largest_pattern_stack_frame = a_pattern_slot_count
		end

	set_default_output_properties (a_property_set: XM_XSLT_OUTPUT_PROPERTIES) is
			-- Set output properties for the unnamed format.
		require
			output_properties_not_void: a_property_set /= Void
		do
			default_output_properties := a_property_set
		ensure
			default_output_properties_set: default_output_properties = a_property_set
		end

	set_output_properties (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_fingerprint: INTEGER) is
			-- Set output properties named by `a_fingerprint'?
		require
			valid_fingerprint: shared_name_pool.is_valid_name_code (a_fingerprint)
			property_set_not_known: not has_output_properties (a_fingerprint)
			output_properties_not_void: a_property_set /= Void
		do
			output_properties_map.force (a_property_set, a_fingerprint)
		ensure
			property_set_known: has_output_properties (a_fingerprint)
		end

	save_static_context (a_static_context: XM_XSLT_EXPRESSION_CONTEXT) is
			-- Save static context of principal stylesheet.
			-- For XPath-valued global parameter setting
		require
			static_context_not_void: a_static_context /= Void
		do
			static_context := a_static_context
		ensure
			static_context_saved: static_context = a_static_context
		end
	
	set_stripper_rules (a_stripper_rules_set: XM_XSLT_MODE) is
			-- Set strip/preserve whitespace rules
		do
			stripper_rules := a_stripper_rules_set
		ensure
			stripper_rules_set: stripper_rules = a_stripper_rules_set
		end

	set_document_isolation_level (an_isolation_level: INTEGER; a_uri: STRING) is
			-- Set isolation-level for `a_uri' to `an_isolation_level'.
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			document_isolation_level_small_enough: an_isolation_level <= Serializable
			document_isolation_level_large_enough: an_isolation_level >= Read_uncommitted
			not_already_set: not has_document_isolation_level (a_uri)
		do
			document_isolation_levels.force_new (an_isolation_level, a_uri)
		ensure
			document_isolation_level_set: has_document_isolation_level (a_uri) and then document_isolation_level (a_uri) = an_isolation_level
		end

	set_collection_isolation_level (an_isolation_level: INTEGER; a_uri: STRING) is
			-- Set isolation-level for `a_uri' to `an_isolation_level'.
		require
			uri_not_void: a_uri /= Void  -- and then is_absolute
			collection_isolation_level_small_enough: an_isolation_level <= Serializable
			collection_isolation_level_large_enough: an_isolation_level >= Read_uncommitted
			not_already_set: not has_collection_isolation_level (a_uri)
		do
			collection_isolation_levels.force_new (an_isolation_level, a_uri)
		ensure
			collection_isolation_level_set: has_collection_isolation_level (a_uri) and then collection_isolation_level (a_uri) = an_isolation_level
		end

feature {XM_XSLT_EVALUATION_CONTEXT} -- Access

	collation_map: DS_HASH_TABLE [ST_COLLATOR, STRING]
			-- Map of collation names to collators

feature {NONE} -- Implementation
	
	stripper_rules: XM_XSLT_MODE
			-- Whitespace stripping rules

	module_list: DS_ARRAYED_LIST [STRING]
			-- SYSTEM ids indexed by module number

	output_properties_map: DS_HASH_TABLE [XM_XSLT_OUTPUT_PROPERTIES, INTEGER]
			-- Output property sets indexed by fingerprint

invariant

	rule_manager_not_void: rule_manager /= Void
	key_manager_not_void: key_manager /= Void
	decimal_format_manager: decimal_format_manager /= Void
	collation_map_not_void: collation_map /= Void
	module_list_not_void: module_list /= Void
	character_map_index_not_void: character_map_index /= Void
	function_library_not_void: function_library /= Void
	document_isolation_levels_not_void: document_isolation_levels /= Void
	collection_isolation_levels_not_void: collection_isolation_levels /= Void

end
	
