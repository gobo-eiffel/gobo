note

	description:

		"ECF targets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_TARGET

inherit

	ANY

	ET_ECF_ELEMENT_NAMES
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Create a new ECF target.
		require
			a_name_not_void: a_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			name := a_name
			system_config := a_system_config
			create variables.make
			variables.set_secondary_variables (Execution_environment)
			create settings.make
			create capabilities.make
			create options.make
		ensure
			name_set: name = a_name
			system_config_set: system_config = a_system_config
		end

feature -- Status report

	is_abstract: BOOLEAN
			-- Can current target not be used to compile a system?

feature -- Access

	name: STRING
			-- Name

	clusters: detachable ET_ECF_CLUSTERS
			-- Clusters

	libraries: detachable ET_ECF_ADAPTED_LIBRARIES
			-- Libraries

	dotnet_assemblies: detachable ET_ECF_ADAPTED_DOTNET_ASSEMBLIES
			-- .NET assemblies

	precompiled_library: detachable ET_ECF_ADAPTED_PRECOMPILED_LIBRARY
			-- Precompiled library, if any

	parent: detachable ET_ECF_TARGET_PARENT
			-- Parent, if any

	root: detachable ET_ECF_ROOT
			-- Root class name, creation procedure name, etc.

	variables: ET_ECF_VARIABLES
			-- Variables visible from current target

	settings: ET_ECF_SETTINGS
			-- Settings

	capabilities: ET_ECF_CAPABILITIES
			-- Capabilities

	options: ET_ECF_OPTIONS
			-- Options

	file_rules: detachable ET_ECF_FILE_RULES
			-- File rules

	external_includes: detachable ET_ECF_EXTERNAL_INCLUDES
			-- External includes

	external_objects: detachable ET_ECF_EXTERNAL_OBJECTS
			-- External objects

	external_libraries: detachable ET_ECF_EXTERNAL_LIBRARIES
			-- External libraries

	external_resources: detachable ET_ECF_EXTERNAL_RESOURCES
			-- External resources

	external_makes: detachable ET_ECF_EXTERNAL_MAKES
			-- External makes

	external_cflags: detachable ET_ECF_EXTERNAL_CFLAGS
			-- External C flags

	external_linker_flags: detachable ET_ECF_EXTERNAL_LINKER_FLAGS
			-- External linker flags

	class_mappings: detachable DS_HASH_TABLE [STRING, STRING]
			-- Class mapping, indexed by old class names in upper-case
			-- (e.g. STRING mapped to STRING_32, old_name = STRING, new_anme = STRING_32)
			-- (may be Void)

	pre_compile_actions: detachable DS_ARRAYED_LIST [ET_ECF_ACTION]
			-- Actions to be executed before compiling current target
			-- (may be Void)

	post_compile_actions: detachable DS_ARRAYED_LIST [ET_ECF_ACTION]
			-- Actions to be executed after compiling current target
			-- (may be Void)

	description: detachable STRING
			-- Description

	notes: detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			-- Notes

	version: detachable ET_ECF_VERSION
			-- Version, if any

	system_config: ET_ECF_SYSTEM_CONFIG
			-- ECF file containing the current target

	parent_path (a_other_target: ET_ECF_TARGET): DS_ARRAYED_LIST [ET_ECF_TARGET_PARENT]
			-- Path from current target to `a_other_target',
			-- or empty if `a_other_target' is not an ancestor
		require
			a_other_target_not_void: a_other_target /= Void
		local
			l_target: ET_ECF_TARGET
			nb: INTEGER
		do
			from
				l_target := Current
			until
				l_target = a_other_target or else l_target = Void or else not attached l_target.parent as l_target_parent
			loop
				nb := nb + 1
				l_target := l_target_parent.target
			end
			create Result.make (nb)
			if nb > 0 then
				from
					l_target := Current
				until
					l_target = a_other_target or else l_target = Void or else not attached l_target.parent as l_target_parent
				loop
					Result.put_last (l_target_parent)
					l_target := l_target_parent.target
				end
			end
		ensure
			path_not_void: Result /= Void
			no_void_parent: not Result.has_void
			first: not Result.is_empty implies Result.first = parent
			last: not Result.is_empty implies Result.last.target = a_other_target
			path: across Result as i_path all if not @i_path.is_first then Result.item (@i_path.index - 1) = i_path else True end end
		end

feature -- Status setting

	set_abstract (b: BOOLEAN)
			-- Set `is_abstract' to `b'.
		do
			is_abstract := b
		ensure
			abstract_set: is_abstract = b
		end

feature -- Setting

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_clusters (a_clusters: like clusters)
			-- Set `clusters' to `a_clusters'.
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

	set_libraries (a_libraries: like libraries)
			-- Set `libraries' to `a_libraries'.
		do
			libraries := a_libraries
		ensure
			libraries_set: libraries = a_libraries
		end

	set_dotnet_assemblies (a_dotnet_assemblies: like dotnet_assemblies)
			-- Set `dotnet_assemblies' to `a_dotnet_assemblies'.
		do
			dotnet_assemblies := a_dotnet_assemblies
		ensure
			dotnet_assemblies_set: dotnet_assemblies = a_dotnet_assemblies
		end

	set_precompiled_library (a_precompiled_library: like precompiled_library)
			-- Set `precompiled_library' to `a_precompiled_library'.
		do
			precompiled_library := a_precompiled_library
		ensure
			precompiled_library_set: precompiled_library = a_precompiled_library
		end

	set_parent (a_parent: like parent)
			-- Set `parent' to `a_parent'.
		require
			-- no_cycle: no cycle introduced
		do
			parent := a_parent
			if a_parent /= Void and then attached a_parent.target as l_parent_target then
				variables.set_secondary_variables (l_parent_target.variables)
				settings.set_secondary_settings (l_parent_target.settings)
				capabilities.set_secondary_capabilities (l_parent_target.capabilities)
				options.set_secondary_options (l_parent_target.options)
			else
				variables.set_secondary_variables (Execution_environment)
				settings.set_secondary_settings (Void)
				capabilities.set_secondary_capabilities (Void)
				options.set_secondary_options (Void)
			end
		ensure
			parent_set: parent = a_parent
		end

	set_root (a_root: like root)
			-- Set `root' to `a_root'.
		do
			root := a_root
		ensure
			root_set: root = a_root
		end

	set_file_rules (a_file_rules: like file_rules)
			-- Set `file_rules' to `a_file_rules'.
		do
			file_rules := a_file_rules
		ensure
			file_rules_set: file_rules = a_file_rules
		end

	set_external_includes (a_external_includes: like external_includes)
			-- Set `external_includes' to `a_external_includes'.
		do
			external_includes := a_external_includes
		ensure
			external_includes_set: external_includes = a_external_includes
		end

	set_external_objects (a_external_objects: like external_objects)
			-- Set `external_objects' to `a_external_objects'.
		do
			external_objects := a_external_objects
		ensure
			external_objects_set: external_objects = a_external_objects
		end

	set_external_libraries (a_external_libraries: like external_libraries)
			-- Set `external_libraries' to `a_external_libraries'.
		do
			external_libraries := a_external_libraries
		ensure
			external_libraries_set: external_libraries = a_external_libraries
		end

	set_external_resources (a_external_resources: like external_resources)
			-- Set `external_resources' to `a_external_resources'.
		do
			external_resources := a_external_resources
		ensure
			external_resources_set: external_resources = a_external_resources
		end

	set_external_makes (a_external_makes: like external_makes)
			-- Set `external_makes' to `a_external_makes'.
		do
			external_makes := a_external_makes
		ensure
			external_makes_set: external_makes = a_external_makes
		end

	set_external_cflags (a_external_cflags: like external_cflags)
			-- Set `external_cflags' to `a_external_cflags'.
		do
			external_cflags := a_external_cflags
		ensure
			external_cflags_set: external_cflags = a_external_cflags
		end

	set_external_linker_flags (a_external_linker_flags: like external_linker_flags)
			-- Set `external_linker_flags' to `a_external_linker_flags'.
		do
			external_linker_flags := a_external_linker_flags
		ensure
			external_linker_flags_set: external_linker_flags = a_external_linker_flags
		end

	set_class_mappings (a_mappings: like class_mappings)
			-- Set `class_mappings' to `a_mappings'.
		require
			no_void_new_class_mapping: a_mappings /= Void implies not a_mappings.has_void
			no_void_old_class_mapping: a_mappings /= Void implies not a_mappings.has_void_item
		do
			class_mappings := a_mappings
		ensure
			class_mappings_set: class_mappings = a_mappings
		end

	set_pre_compile_actions (a_actions: like pre_compile_actions)
			-- Set `pre_compile_actions' to `a_actions'.
		require
			no_void_action: a_actions /= Void implies not a_actions.has_void
		do
			pre_compile_actions := a_actions
		ensure
			pre_compile_actions_set: pre_compile_actions = a_actions
		end

	set_post_compile_actions (a_actions: like post_compile_actions)
			-- Set `post_compile_actions' to `a_actions'.
		require
			no_void_action: a_actions /= Void implies not a_actions.has_void
		do
			post_compile_actions := a_actions
		ensure
			post_compile_actions_set: post_compile_actions = a_actions
		end

	set_description (a_description: like description)
			-- Set `description' to `a_description'.
		do
			description := a_description
		ensure
			description_set: description = a_description
		end

	set_notes (a_notes: like notes)
			-- Set `notes' to `a_notes'.
		require
			no_void_note: a_notes /= Void implies not a_notes.has_void
		do
			notes := a_notes
		ensure
			notes_set: notes = a_notes
		end

	set_version (a_version: like version)
			-- Set `version' to `a_version'.
		do
			version := a_version
		ensure
			version_set: version = a_version
		end

feature -- Basic operations

	fill_universe (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Add to `a_universe' the clusters, libraries and .NET assemblies
			-- of current target, and recursively its parent target if any, whose
			-- conditions satisfy `a_state'.
		require
			a_universe_not_void: a_universe /= Void
			a_state_not_void: a_state /= Void
		local
			l_universe_clusters: ET_CLUSTERS
			l_universe_libraries: ET_ADAPTED_LIBRARIES
			l_universe_dotnet_assemblies: ET_ADAPTED_DOTNET_ASSEMBLIES
			l_cluster: ET_ECF_CLUSTER
			l_library: ET_ECF_ADAPTED_LIBRARY
			l_dotnet_assembly: ET_ECF_ADAPTED_DOTNET_ASSEMBLY
			l_is_ecf_library: BOOLEAN
			i, nb: INTEGER
		do
			if attached parent as l_parent and then attached l_parent.target as l_parent_target then
				l_parent_target.fill_universe (a_universe, a_state)
			end
			if attached clusters as l_clusters then
				l_is_ecf_library := attached {ET_ECF_LIBRARY} a_universe
				l_universe_clusters := a_universe.clusters
				nb := l_clusters.count
				from i := 1 until i > nb loop
					l_cluster := l_clusters.cluster (i)
					if l_is_ecf_library and l_cluster.is_override then
						 -- Override clusters in ECF libraries are ignored.
						 -- That's the way it works in ISE Eiffel.
					elseif l_cluster.is_enabled (a_state) then
						l_universe_clusters.put_last (l_cluster)
						l_cluster.fill_subclusters (a_state)
						l_cluster.fill_file_rules (Current, a_state)
					end
					i := i + 1
				end
			end
			if attached libraries as l_libraries then
				l_universe_libraries := a_universe.libraries
				nb := l_libraries.count
				from i := 1 until i > nb loop
					l_library := l_libraries.library (i)
					if l_library.is_enabled (a_state) then
						l_universe_libraries.put_last (l_library)
					end
					i := i + 1
				end
			end
			if a_state.is_dotnet and then attached dotnet_assemblies as l_dotnet_assemblies then
				l_universe_dotnet_assemblies := a_universe.dotnet_assemblies
				nb := l_dotnet_assemblies.count
				from i := 1 until i > nb loop
					l_dotnet_assembly := l_dotnet_assemblies.dotnet_assembly (i)
					if l_dotnet_assembly.is_enabled (a_state) then
						l_universe_dotnet_assemblies.put_last (l_dotnet_assembly)
						a_universe.current_system.set_dotnet (True)
					end
					i := i + 1
				end
			end
			if attached external_includes as l_external_includes then
				l_external_includes.fill_external_includes (Current, a_state)
			end
			if attached external_objects as l_external_objects then
				l_external_objects.fill_external_objects (Current, a_state)
			end
			if attached external_libraries as l_external_libraries then
				l_external_libraries.fill_external_libraries (Current, a_state)
			end
			if attached external_resources as l_external_resources then
				l_external_resources.fill_external_resources (Current, a_state)
			end
			if attached external_makes as l_external_makes then
				l_external_makes.fill_external_makes (Current, a_state)
			end
			if attached external_cflags as l_external_cflags then
				l_external_cflags.fill_external_cflags (Current, a_state)
			end
			if attached external_linker_flags as l_external_linker_flags then
				l_external_linker_flags.fill_external_linker_flags (Current, a_state)
			end
		end

	fill_root (a_system: ET_ECF_SYSTEM)
			-- Fill `a_system' with root information.
		require
			a_system_not_void: a_system /= Void
		do
			if attached root as l_root then
				l_root.fill_root (a_system)
			elseif attached parent as l_parent and then attached l_parent.target as l_parent_target then
				l_parent_target.fill_root (a_system)
			end
		end

	fill_file_rules (a_file_rules: ET_ECF_FILE_RULES; a_state: ET_ECF_STATE)
			-- Add to `a_file_rules' the file rules current target, and recursive
			-- its parent target if any, whose conditions satisfy `a_state'.
		require
			a_file_rules_not_void: a_file_rules /= Void
			a_state_not_void: a_state /= Void
		do
			if attached parent as l_parent and then attached l_parent.target as l_parent_target then
				l_parent_target.fill_file_rules (a_file_rules, a_state)
			end
			if attached file_rules as l_file_rules then
				l_file_rules.fill_file_rules (a_file_rules, a_state)
			end
		end

	fill_settings (a_system: ET_ECF_SYSTEM)
			-- Fill `a_system' with setting information.
		require
			a_system_not_void: a_system /= Void
		local
			l_value: detachable STRING
		do
				-- "console_application".
			l_value := settings.value ({ET_ECF_SETTING_NAMES}.console_application_setting_name)
			if l_value /= Void and then l_value.is_boolean then
				a_system.set_console_application_mode (l_value.to_boolean)
			end
				-- "exception_trace".
			l_value := settings.value ({ET_ECF_SETTING_NAMES}.exception_trace_setting_name)
			if l_value /= Void and then l_value.is_boolean then
				a_system.set_exception_trace_mode (l_value.to_boolean)
			end
				-- "total_order_on_reals".
			l_value := settings.value ({ET_ECF_SETTING_NAMES}.total_order_on_reals_setting_name)
			if l_value /= Void and then l_value.is_boolean then
				a_system.set_total_order_on_reals_mode (l_value.to_boolean)
			end
				-- "line_generation".
			l_value := settings.value ({ET_ECF_SETTING_NAMES}.line_generation_setting_name)
			if l_value /= Void and then l_value.is_boolean then
				a_system.set_line_generation_mode (l_value.to_boolean)
			end
		end

	fill_capabilities (a_system: ET_ECF_SYSTEM)
			-- Fill `a_system' with capability information.
		require
			a_system_not_void: a_system /= Void
		local
			l_value: detachable STRING
		do
				-- "concurrency".
			l_value := capabilities.use_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name)
			if l_value = Void then
				l_value := capabilities.support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name)
			end
			if l_value /= Void then
				if STRING_.same_case_insensitive (l_value, {ET_ECF_CAPABILITY_NAMES}.thread_capability_value) then
					a_system.set_multithreaded_mode (True)
				elseif STRING_.same_case_insensitive (l_value, {ET_ECF_CAPABILITY_NAMES}.scoop_capability_value) then
					a_system.set_multithreaded_mode (False)
				else
					a_system.set_multithreaded_mode (False)
				end
			end
				-- void_safety.
			l_value := capabilities.use_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
			if l_value = Void then
				l_value := capabilities.support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
			end
			if l_value = Void or else STRING_.same_case_insensitive (l_value, {ET_ECF_CAPABILITY_NAMES}.none_capability_value) then
				a_system.set_attachment_type_conformance_mode (False)
				a_system.set_target_type_attachment_mode (False)
			elseif STRING_.same_case_insensitive (l_value, {ET_ECF_CAPABILITY_NAMES}.all_capability_value) then
				a_system.set_attachment_type_conformance_mode (True)
				a_system.set_target_type_attachment_mode (True)
			elseif STRING_.same_case_insensitive (l_value, {ET_ECF_CAPABILITY_NAMES}.transitional_capability_value) then
				a_system.set_attachment_type_conformance_mode (True)
				a_system.set_target_type_attachment_mode (True)
			else
				a_system.set_attachment_type_conformance_mode (True)
				a_system.set_target_type_attachment_mode (False)
			end
		end

	fill_options (a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Fill `a_universe' with option information.
		require
			a_universe_not_void: a_universe /= Void
		local
			l_value: detachable STRING
		do
				-- is_attached_by_default.
			l_value := options.value ({ET_ECF_OPTION_NAMES}.is_attached_by_default_option_name)
			if l_value /= Void and then l_value.is_boolean then
				if l_value.to_boolean then
					a_universe.set_implicit_attachment_type_mark (tokens.implicit_attached_type_mark)
				else
					a_universe.set_implicit_attachment_type_mark (tokens.implicit_detachable_type_mark)
				end
			elseif a_universe.current_system.attachment_type_conformance_mode then
				a_universe.set_implicit_attachment_type_mark (tokens.implicit_attached_type_mark)
			else
				a_universe.set_implicit_attachment_type_mark (tokens.implicit_detachable_type_mark)
			end
				-- is_obsolete_iteration.
			l_value := options.value ({ET_ECF_OPTION_NAMES}.is_obsolete_iteration_option_name)
			if l_value /= Void and then l_value.is_boolean then
				a_universe.set_obsolete_iteration_mode (l_value.to_boolean)
			end
				-- is_obsolete_routine_type.
			l_value := options.value ({ET_ECF_OPTION_NAMES}.is_obsolete_routine_type_option_name)
			if l_value /= Void and then l_value.is_boolean then
				a_universe.set_obsolete_routine_type_mode (l_value.to_boolean)
			end
				-- trace.
			l_value := options.value ({ET_ECF_OPTION_NAMES}.trace_option_name)
			if l_value /= Void and then l_value.is_boolean then
				if attached {ET_ECF_SYSTEM} a_universe as l_system then
					l_system.set_trace_mode (l_value.to_boolean)
				end
			end
		end

	fill_class_mappings (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Fill `a_universe' with class mapping information.
		require
			a_universe_not_void: a_universe /= Void
			a_state_not_void: a_state /= Void
		do
			if attached class_mappings as l_attached_class_mappings then
				across l_attached_class_mappings as i_class_mapping loop
					a_universe.set_class_mapping (create {ET_IDENTIFIER}.make (@i_class_mapping.key), create {ET_IDENTIFIER}.make (i_class_mapping))
				end
			end
		end

	override_settings (a_settings: ET_ECF_SETTINGS)
			-- Override settings of current target with `a_settings'.
		require
			a_settings_not_void: a_settings /= Void
		local
			i, nb: INTEGER
		do
			across a_settings.primary_settings as i_primary_setting loop
				if STRING_.same_case_insensitive (@i_primary_setting.key, "all_assertions") then
					if attached system_config.targets as l_targets then
						l_targets.do_all (agent {ET_ECF_TARGET}.override_all_assertions (i_primary_setting))
					else
						override_all_assertions (i_primary_setting)
					end
				elseif STRING_.same_case_insensitive (@i_primary_setting.key, {ET_ECF_SETTING_NAMES}.library_root_setting_name) and attached system_config.targets as l_targets then
					nb := l_targets.count
					from i := 1 until i > nb loop
						l_targets.target (i).settings.set_primary_value (@i_primary_setting.key, i_primary_setting)
						i := i + 1
					end
				else
					settings.set_primary_value (@i_primary_setting.key, i_primary_setting)
				end
			end
		end

	override_capabilities (a_capabilities: ET_ECF_CAPABILITIES)
			-- Override capabilities of current target with `a_capabilities'.
		require
			a_capabilities_not_void: a_capabilities /= Void
		do
			across a_capabilities.primary_support_capabilities as i_primary_support_capability loop
				capabilities.set_primary_support_value (@i_primary_support_capability.key, i_primary_support_capability)
			end
			across a_capabilities.primary_use_capabilities as i_primary_use_capability loop
				capabilities.set_primary_use_value_id (@i_primary_use_capability.key, i_primary_use_capability)
			end
		end

	override_variables (a_variables: ET_ECF_VARIABLES)
			-- Override variables of current target with `a_variables'.
		require
			a_variables_not_void: a_variables /= Void
		do
			across a_variables.primary_variables as i_primary_variable loop
				variables.set_primary_value (@i_primary_variable.key, i_primary_variable)
			end
		end

	override_all_assertions (a_value: STRING)
			-- Override all assertions in current target, its clusters,
			-- and the libraries and assemblies it uses with value `a_value'.
		require
			a_value_not_void: a_value /= Void
		do
			override_all_assertions_in_option (options, a_value)
			if attached clusters as l_clusters then
				l_clusters.do_explicit (agent override_all_assertions_in_cluster (?, a_value))
			end
			if attached libraries as l_libraries then
				l_libraries.do_adapted (agent override_all_assertions_in_adapted_group ({ET_ECF_ADAPTED_LIBRARY}?, a_value))
			end
			if attached dotnet_assemblies as l_dotnet_assemblies then
				l_dotnet_assemblies.do_adapted (agent override_all_assertions_in_adapted_group ({ET_ECF_ADAPTED_DOTNET_ASSEMBLY}?, a_value))
			end
			if attached precompiled_library as l_precompiled_library then
				override_all_assertions_in_adapted_group (l_precompiled_library, a_value)
			end
		end

feature {NONE} -- Implementation

	override_all_assertions_in_cluster (a_cluster: ET_ECF_CLUSTER; a_value: STRING)
			-- Override all assertions in `a_cluster' with value `a_value'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_value_not_void: a_value /= Void
		do
			if attached a_cluster.options as l_cluster_options then
				override_all_assertions_in_option (l_cluster_options, a_value)
			end
			if attached a_cluster.class_options as l_class_options then
				l_class_options.do_all (agent override_all_assertions_in_option (?, a_value))
			end
		end

	override_all_assertions_in_adapted_group (a_group: ET_ECF_GROUP; a_value: STRING)
			-- Override all assertions in adapted group `a_group' with value `a_value'.
		require
			a_group_not_void: a_group /= Void
			a_value_not_void: a_value /= Void
		local
			l_options: ET_ECF_OPTIONS
		do
			if attached a_group.options as l_group_options then
				override_all_assertions_in_option (l_group_options, a_value)
			else
				create l_options.make
				a_group.set_options (l_options)
				override_all_assertions_in_option (l_options, a_value)
			end
			if attached a_group.class_options as l_class_options then
				l_class_options.do_all (agent override_all_assertions_in_option (?, a_value))
			end
		end

	override_all_assertions_in_option (a_options: ET_ECF_OPTIONS; a_value: STRING)
			-- Override all assertions in `a_options' with value `a_value'.
		require
			a_options_not_void: a_options /= Void
			a_value_not_void: a_value /= Void
		local
			l_valid_assertions: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
		do
			if attached system_config.ecf_version as l_ecf_version then
				l_valid_assertions := {ET_ECF_OPTION_DEFAULTS}.valid_assertions (l_ecf_version)
			else
				l_valid_assertions := {ET_ECF_OPTION_DEFAULTS}.valid_assertions_latest
			end
			l_valid_assertions.keys.do_all (agent a_options.set_primary_assertion_value (?, a_value))
		end

invariant

	name_not_void: name /= Void
--	no_cycle_in_parent: no cycle in parent
	variables_not_void: variables /= Void
	settings_not_void: settings /= Void
	capabilities_not_void: capabilities /= Void
	options_not_void: options /= Void
	no_void_new_class_mapping: attached class_mappings as l_class_mappings implies not l_class_mappings.has_void
	no_void_old_class_mapping: attached class_mappings as l_class_mappings implies not l_class_mappings.has_void_item
	no_void_pre_compile_action: attached pre_compile_actions as l_pre_compile_actions implies not l_pre_compile_actions.has_void
	no_void_post_compile_action: attached post_compile_actions as l_post_compile_actions implies not l_post_compile_actions.has_void
	no_void_note: attached notes as l_notes implies not l_notes.has_void
	system_config_not_void: system_config /= Void

end
