indexing

	description:

		"Objects that represent an executable stylesheet"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_EXECUTABLE

creation

	make

feature {NONE} -- Initialization

	make (a_configuration: XM_XSLT_CONFIGURATION; a_rule_manager: XM_XSLT_RULE_MANAGER; a_key_manager: XM_XSLT_KEY_MANAGER;
			a_decimal_format_manager: XM_XSLT_DECIMAL_FORMAT_MANAGER;
			a_collation_map: DS_HASH_TABLE [ST_COLLATOR, STRING]; a_mode: XM_XSLT_MODE; strips_whitespace: BOOLEAN;
			a_module_list: DS_ARRAYED_LIST [STRING]; a_function_library: XM_XPATH_FUNCTION_LIBRARY_MANAGER) is
			-- Establish invariant.
		require
			configuration_not_void: a_configuration /= Void
			rule_manager_not_void: a_rule_manager /= Void
			key_manager_not_void: a_key_manager /= Void
			decimal_format_manager: a_decimal_format_manager /= Void
			collation_map: a_collation_map /= Void
			module_list_not_void: a_module_list /= Void
			function_library_not_void: a_function_library /= Void
		do
			configuration := a_configuration
			rule_manager := a_rule_manager
			key_manager := a_key_manager
			decimal_format_manager := a_decimal_format_manager
			collation_map := a_collation_map
			stripper_rules := a_mode
			is_strips_whitespace := strips_whitespace
			module_list := a_module_list
			function_library := a_function_library
			create character_map_index.make_default
		ensure
			configuration_set: configuration = a_configuration
			rule_manager_set: rule_manager = a_rule_manager
			key_manager_set: key_manager = a_key_manager
			decimal_format_manager_set: decimal_format_manager = a_decimal_format_manager
			collation_map_set: collation_map = a_collation_map
			stripper_rules_set: stripper_rules = a_mode
			strips_whitespace_set: is_strips_whitespace = strips_whitespace
			module_list_set: module_list = a_module_list
			function_library_set: function_library = a_function_library
			slots_not_yet_allocated: not are_slots_allocated
		end

feature -- Access

	configuration: XM_XSLT_CONFIGURATION
			-- User configuration options

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

	system_id (a_module_number: INTEGER): STRING is
			-- SYSTEM id for stylesheet module `a_module_number'
		require
			valid_module_number: is_valid_module_number (a_module_number)
		do
			Result := module_list.item (a_module_number)
		ensure
			system_id_not_void: Result /= Void
		end

feature -- Status report

	is_strips_whitespace: BOOLEAN
			-- Does this executable strip any whitespace at all?

	is_valid_module_number (a_module_number: INTEGER): BOOLEAN is
			-- is `a_module_number' a valid module number?
		do
			if a_module_number > 0 then Result := a_module_number <= module_list.count end
		end

	are_slots_allocated: BOOLEAN
			-- Have variable slots been allocated yet?

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
			create Result.make (number_of_global_variables, largest_stack_frame)
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

	set_slot_space (a_global_slot_count, a_local_slot_count: INTEGER) is
			-- Set space requirements for variables
		require
			positive_global_slot_count: a_global_slot_count >= 0
			positive_local_slot_count: a_local_slot_count >= 0
			slots_not_yet_allocated: not are_slots_allocated
		do
			number_of_global_variables := a_global_slot_count
			largest_stack_frame := a_local_slot_count
			are_slots_allocated := True
		ensure
			slots_allocated: are_slots_allocated
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
	
feature {XM_XSLT_EVALUATION_CONTEXT} -- Access

		collation_map: DS_HASH_TABLE [ST_COLLATOR, STRING]
			-- Map of collation names to collators

feature {NONE} -- Implementation
	
	stripper_rules: XM_XSLT_MODE
			-- Whitespace stripping rules

	number_of_global_variables: INTEGER
			-- Global variable count

	largest_stack_frame: INTEGER
			-- Maximum local variable count

	module_list: DS_ARRAYED_LIST [STRING]
			-- SYSTEM ids indexed by module number

invariant

	configuration_not_void: configuration /= Void
	rule_manager_not_void: rule_manager /= Void
	key_manager_not_void: key_manager /= Void
	decimal_format_manager: decimal_format_manager /= Void
	collation_map_not_void: collation_map /= Void
	module_list_not_void: module_list /= Void
	character_map_index_not_void: character_map_index /= Void
	function_library_not_void: function_library /= Void

end
	
