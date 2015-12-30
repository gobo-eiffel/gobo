note

	description:

		"ECF targets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2015, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_TARGET

inherit

	ANY

	ET_ECF_ELEMENT_NAMES
		export {NONE} all end

	ET_ECF_SETTING_NAMES
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

	make (a_name: STRING)
			-- Create a new ECF target.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			create variables.make
			variables.set_secondary_variables (Execution_environment)
			create settings.make
			create options.make
		ensure
			name_set: name = a_name
		end

feature -- Access

	name: STRING
			-- Name

	clusters: detachable ET_ECF_CLUSTERS
			-- Clusters

	libraries: detachable ET_ECF_ADAPTED_LIBRARIES
			-- Libraries

	dotnet_assemblies: detachable ET_ECF_ADAPTED_DOTNET_ASSEMBLIES
			-- .NET assemblies

	parent: detachable ET_ECF_TARGET
			-- Parent, if any

	root: detachable ET_ECF_ROOT
			-- Root class name, creation procedure name, etc.

	variables: ET_ECF_VARIABLES
			-- Variables visible from current target

	settings: ET_ECF_SETTINGS
			-- Settings

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

feature -- Setting

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

	set_parent (a_parent: like parent)
			-- Set `parent' to `a_parent'.
		require
			-- no_cycle: no cycle introduced
		do
			parent := a_parent
			if a_parent /= Void then
				variables.set_secondary_variables (a_parent.variables)
				settings.set_secondary_settings (a_parent.settings)
				options.set_secondary_options (a_parent.options)
			else
				variables.set_secondary_variables (Execution_environment)
				settings.set_secondary_settings (Void)
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

feature -- Basic operations

	update_state (a_state: ET_ECF_STATE)
			-- Update `a_state' with information found in
			-- `parent' if any, and overridden by information
			-- found in current target.
		require
			a_state_not_void: a_state /= Void
		local
			l_value: detachable STRING
		do
			if attached parent as l_parent then
				l_parent.update_state (a_state)
			end
			l_value := settings.value (multithreaded_setting_name)
			if l_value /= Void and then l_value.is_boolean then
				a_state.set_multithreaded (l_value.to_boolean)
			end
			l_value := settings.value (concurrency_setting_name)
			if l_value /= Void then
				if STRING_.same_case_insensitive (l_value, "thread") then
					a_state.set_multithreaded (True)
				elseif STRING_.same_case_insensitive (l_value, "scoop") then
					a_state.set_scoop (True)
				else
					a_state.set_multithreaded (False)
					a_state.set_scoop (False)
				end
			end
			l_value := settings.value (msil_generation_setting_name)
			if l_value /= Void and then l_value.is_boolean then
				a_state.set_dotnet (l_value.to_boolean)
			end
		end

	fill_universe (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Add to `a_universe' the clusters, libraries and .NET assemblies
			-- of current target,  and recursive its parent target if any, whose
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
			if attached parent as l_parent then
				l_parent.fill_universe (a_universe, a_state)
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
				l_external_includes.fill_external_includes (a_universe, a_state)
			end
			if attached external_objects as l_external_objects then
				l_external_objects.fill_external_objects (a_universe, a_state)
			end
			if attached external_libraries as l_external_libraries then
				l_external_libraries.fill_external_libraries (a_universe, a_state)
			end
		end

	fill_root (a_system: ET_ECF_SYSTEM)
			-- Fill `a_system' with root information.
		require
			a_system_not_void: a_system /= Void
		do
			if attached root as l_root then
				l_root.fill_root (a_system)
			elseif attached parent as l_parent then
				l_parent.fill_root (a_system)
			end
		end

	fill_file_rules (a_file_rules: ET_ECF_FILE_RULES; a_state: ET_ECF_STATE)
			-- Add to `a_file_rules' the file rules current target, and recursive
			-- its parent target if any, whose conditions satisfy `a_state'.
		require
			a_file_rules_not_void: a_file_rules /= Void
			a_state_not_void: a_state /= Void
		do
			if attached parent as l_parent then
				l_parent.fill_file_rules (a_file_rules, a_state)
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
				-- console_application.
			l_value := settings.value (console_application_setting_name)
			if l_value /= Void and then l_value.is_boolean  then
				a_system.set_console_application_mode (l_value.to_boolean)
			end
				-- Unknown built-in features reported.
			l_value := variables.value ("unknown_builtin_reported")
			if l_value /= Void and then l_value.is_boolean then
				a_system.set_unknown_builtin_reported (l_value.to_boolean)
			end
		end

	fill_options (a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Fill `a_universe' with option information.
		require
			a_universe_not_void: a_universe /= Void
		local
			l_value: detachable STRING
		do
				-- void_safety.
			l_value := options.value (xml_void_safety)
			if l_value = Void or else l_value.as_lower.same_string ("none") then
				a_universe.set_attachment_type_conformance_mode (False)
				a_universe.set_target_type_attachment_mode (False)
			elseif l_value.as_lower.same_string ("all") then
				a_universe.set_attachment_type_conformance_mode (True)
				a_universe.set_target_type_attachment_mode (True)
			else
				a_universe.set_attachment_type_conformance_mode (True)
				a_universe.set_target_type_attachment_mode (False)
			end
				-- is_attached_by_default.
			l_value := options.value (xml_is_attached_by_default)
			if l_value /= Void and then l_value.is_boolean then
				if l_value.to_boolean then
					a_universe.set_implicit_attachment_type_mark (tokens.implicit_attached_type_mark)
				else
					a_universe.set_implicit_attachment_type_mark (tokens.implicit_detachable_type_mark)
				end
			elseif a_universe.attachment_type_conformance_mode then
				a_universe.set_implicit_attachment_type_mark (tokens.implicit_attached_type_mark)
			else
				a_universe.set_implicit_attachment_type_mark (tokens.implicit_detachable_type_mark)
			end
		end

invariant

	name_not_void: name /= Void
--	no_cycle_in_parent: no cycle in parent
	variables_not_void: variables /= Void
	settings_not_void: settings /= Void
	options_not_void: options /= Void

end
