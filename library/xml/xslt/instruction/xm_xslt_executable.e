note

	description:

		"Objects that represent an executable stylesheet"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_EXECUTABLE

inherit

	XM_XPATH_ISOLATION_LEVELS

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_rule_manager: XM_XSLT_RULE_MANAGER; a_key_manager: XM_XSLT_KEY_MANAGER;
			a_decimal_format_manager: XM_XSLT_DECIMAL_FORMAT_MANAGER;
			a_collation_map: DS_HASH_TABLE [ST_COLLATOR, STRING]; a_name_pool: like name_pool;
			a_module_list: DS_ARRAYED_LIST [STRING]; a_function_library: XM_XPATH_FUNCTION_LIBRARY_MANAGER)
			-- Establish invariant.
		require
			rule_manager_not_void: a_rule_manager /= Void
			key_manager_not_void: a_key_manager /= Void
			decimal_format_manager: a_decimal_format_manager /= Void
			collation_map: a_collation_map /= Void
			module_list_not_void: a_module_list /= Void
			function_library_not_void: a_function_library /= Void
			name_pool_not_void: a_name_pool /= Void
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
			create attribute_set_manager.make
			create required_parameters.make_default
			isolation_level := Serializable
			name_pool := a_name_pool
		ensure
			rule_manager_set: rule_manager = a_rule_manager
			key_manager_set: key_manager = a_key_manager
			decimal_format_manager_set: decimal_format_manager = a_decimal_format_manager
			collation_map_set: collation_map = a_collation_map
			module_list_set: module_list = a_module_list
			function_library_set: function_library = a_function_library
			slots_not_yet_allocated: not are_slots_allocated
			name_pool_set: name_pool = a_name_pool
		end

feature -- Access

	name_pool: XM_XPATH_NAME_POOL
			-- Name pool used to compile `Current'.

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

	attribute_set_manager: XM_XSLT_ATTRIBUTE_SET_MANAGER
			-- Manager for attribute set

	system_id (a_module_number: INTEGER): STRING
			-- SYSTEM id for stylesheet module `a_module_number'
		require
			valid_module_number: is_valid_module_number (a_module_number)
		do
			Result := module_list.item (a_module_number)
		ensure
			system_id_not_void: Result /= Void
		end

	module_system_ids: DS_LIST [STRING]
			-- System-IDs of all compiled stylesheet modules
		do
			Result := module_list
		ensure
			result_not_void: Result /= Void
		end

	output_properties (a_fingerprint: INTEGER): XM_XSLT_OUTPUT_PROPERTIES
			-- Output properties set named by `a_fingerprint'?
		require
			valid_fingerprint: name_pool.is_valid_name_code (a_fingerprint)
			has_property_set: has_output_properties (a_fingerprint)
		do
			Result := output_properties_map.item (a_fingerprint)
		ensure
			output_properties_not_void: Result /= Void
		end

	isolation_level: INTEGER
			-- Isolation-level

feature -- Status report

	is_strips_type_annotation: BOOLEAN
			-- Does `Current' strip type annotation?
			-- TODO: this is ignored at present  -required for schema-aware version

	is_strips_whitespace: BOOLEAN
			-- Does `Current' strip any whitespace at all?

	is_valid_module_number (a_module_number: INTEGER): BOOLEAN
			-- is `a_module_number' a valid module number?
		do
			if a_module_number > 0 then Result := a_module_number <= module_list.count end
		end

	are_slots_allocated: BOOLEAN
			-- Have variable slots been allocated yet?

	has_output_properties (a_fingerprint: INTEGER): BOOLEAN
			-- Does the executable have an output properties set named by `a_fingerprint'?
		require
			valid_fingerprint: name_pool.is_valid_name_code (a_fingerprint)
		do
			Result := output_properties_map.has (a_fingerprint)
		end

	missing_required_global_parameters (a_parameters: XM_XSLT_PARAMETER_SET): DS_LINKED_LIST [STRING]
			-- Required global parameters not supplied
		require
			a_parameters_not_void: a_parameters /= Void
		local
			l_cursor: DS_HASH_SET_CURSOR [INTEGER]
			l_fingerprint: INTEGER
		do
			create Result.make
			from
				l_cursor := required_parameters.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_fingerprint := l_cursor.item
				if not a_parameters.has (l_fingerprint) then
					Result.force_last (shared_name_pool.display_name_from_name_code (l_fingerprint))
				end
				l_cursor.forth
			end
		ensure
			missing_required_global_parameters_not_void: Result /= Void
		end

feature -- Status setting

	set_whitespace_stripping (a_status: BOOLEAN)
			-- Set whitespace stripping status.
		do
			is_strips_whitespace := a_status
		ensure
			set: is_strips_whitespace = a_status
		end

	set_strips_input_type_annotations (a_status: BOOLEAN)
			-- Set type-annotations stripping status status.
		do
			is_strips_type_annotation := a_status
		ensure
			set: is_strips_type_annotation = a_status
		end

feature -- Creation

	new_stripper (a_transformer: XM_XSLT_TRANSFORMER; a_builder: XM_XPATH_BUILDER): XM_XSLT_STRIPPER
			-- Stripper configured to implement the whitespace stripping rules
		require
			transformer_not_void: a_transformer /= Void
			builder_not_void: a_builder /= Void
		do
			if stripper_rules /= Void then
				rule_manager.rank_mode (stripper_rules)
			end
			create Result.make (a_transformer, stripper_rules, a_builder)
		ensure
			stripper_not_void: Result /= Void
		end

	new_bindery: XM_XSLT_BINDERY
			-- New variable bindings
		require
			slots_allocated: are_slots_allocated
		do
			create Result.make (global_slot_manager.number_of_variables)
		ensure
			bindery_not_void: Result /= Void
		end

feature -- Element change

	set_function_library (a_function_library: XM_XPATH_FUNCTION_LIBRARY_MANAGER)
			-- Set the function library.
		require
			function_library_not_void: a_function_library /= Void
		do
			function_library := a_function_library
		ensure
			function_library_set: function_library = a_function_library
		end

	set_named_template_table (a_compiled_templates_index: DS_HASH_TABLE [XM_XSLT_COMPILED_TEMPLATE, INTEGER])
			-- Set map of compiled templates.
		require
			map_not_void: a_compiled_templates_index /= Void
		do
			compiled_templates_index := a_compiled_templates_index
		ensure
			map_set: compiled_templates_index = a_compiled_templates_index
		end

	set_pattern_slot_space (a_pattern_slot_count: INTEGER)
			-- Set space requirements for pattern variables and allocate slots for key expressions.
		require
			positive_pattern_slot_count: a_pattern_slot_count >= 0
			slots_not_yet_allocated: not are_slots_allocated
		do
			largest_pattern_stack_frame := a_pattern_slot_count
			are_slots_allocated := True
			key_manager.allocate_slots
		ensure
			slots_allocated: are_slots_allocated and then largest_pattern_stack_frame = a_pattern_slot_count
		end

	set_default_output_properties (a_property_set: XM_XSLT_OUTPUT_PROPERTIES)
			-- Set output properties for the unnamed format.
		require
			output_properties_not_void: a_property_set /= Void
		do
			default_output_properties := a_property_set
		ensure
			default_output_properties_set: default_output_properties = a_property_set
		end

	set_output_properties (a_property_set: XM_XSLT_OUTPUT_PROPERTIES; a_fingerprint: INTEGER)
			-- Set output properties named by `a_fingerprint'?
		require
			valid_fingerprint: name_pool.is_valid_name_code (a_fingerprint)
			property_set_not_known: not has_output_properties (a_fingerprint)
			output_properties_not_void: a_property_set /= Void
		do
			output_properties_map.force (a_property_set, a_fingerprint)
		ensure
			property_set_known: has_output_properties (a_fingerprint)
		end

	save_static_context (a_static_context: XM_XSLT_EXPRESSION_CONTEXT)
			-- Save static context of principal stylesheet.
			-- For XPath-valued global parameter setting
		require
			static_context_not_void: a_static_context /= Void
		do
			static_context := a_static_context
		ensure
			static_context_saved: static_context = a_static_context
		end

	set_stripper_rules (a_stripper_rules_set: XM_XSLT_MODE)
			-- Set strip/preserve whitespace rules
		do
			stripper_rules := a_stripper_rules_set
		ensure
			stripper_rules_set: stripper_rules = a_stripper_rules_set
		end

	set_isolation_level (an_isolation_level: INTEGER)
			-- Set isolation-level to `an_isolation_level'.
		require
			isolation_level_small_enough: an_isolation_level <= Serializable
			isolation_level_large_enough: an_isolation_level >= Read_uncommitted
		do
			isolation_level := an_isolation_level
		ensure
			isolation_level_set: isolation_level = an_isolation_level
		end

	add_required_parameter (a_fingerprint: INTEGER)
			-- Add `a_fingerprint' to `required_parameters'.
		do
			required_parameters.force (a_fingerprint)
		ensure
			added_parameter: required_parameters.has (a_fingerprint)
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

	required_parameters: DS_HASH_SET [INTEGER]
			-- Required global parameters

invariant

	name_pool_not_void: name_pool /= Void
	rule_manager_not_void: rule_manager /= Void
	key_manager_not_void: key_manager /= Void
	decimal_format_manager: decimal_format_manager /= Void
	collation_map_not_void: collation_map /= Void
	module_list_not_void: module_list /= Void
	character_map_index_not_void: character_map_index /= Void
	function_library_not_void: function_library /= Void
	isolation_level_small_enough: isolation_level <= Serializable
	isolation_level_large_enough: isolation_level >= Read_uncommitted
	attribute_set_manager_not_void: attribute_set_manager /= Void
	required_parameters_not_void: required_parameters /= Void

end

