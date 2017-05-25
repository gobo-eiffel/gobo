note

	description:

		"Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/09/15 $"
	revision: "$Revision: #22 $"

class ET_SYSTEM

inherit

	ET_INTERNAL_UNIVERSE
		redefine
			preparse_recursive,
			parse_all_recursive,
			set_none_type,
			default_read_only_value,
			kind_name
		end

	KL_SHARED_EXECUTION_ENVIRONMENT
			export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name: STRING)
			-- Create a new Eiffel system.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			initialize
			create register_class_mutex.make
			create register_feature_mutex.make
			create register_inline_constant_mutex.make
			set_default_keyword_usage
			set_preparse_shallow_mode
			create external_include_pathnames.make (20)
			create external_object_pathnames.make (20)
			create external_library_pathnames.make (20)
			console_application_mode := True
			alias_transition_mode := True
			unknown_builtin_reported := True
			qualified_anchored_types_cycle_detection_enabled := False
			set_system_name (a_name)
				-- First set the kernel types to some dummy types so that the attached attributes
				-- get properly set before using `Current'. Otherwise the compiler will complain.
			set_unknown_kernel_types
			current_system := Current
				-- Set `universe' and `name' outside of `make_adapted', otherwise the compiler
				-- will complain about these attributes not properly set when passing `Current'
				-- as argument.
			universe := Current
			name := a_name
			make_adapted (a_name, Current)
			set_kernel_types
			set_default_class_mapping
		end

feature -- Status report

	is_dotnet: BOOLEAN
			-- Does current system contain Eiffel for .NET kernel classes?
			-- Hence follow Eiffel for .NET validity rules.

feature -- Access

	root_type: detachable ET_BASE_TYPE
			-- Root type

	root_creation: detachable ET_FEATURE_NAME
			-- Root creation procedure

	kind_name: STRING
			-- Name of the kind of universe (e.g. "library", "assembly", etc.)
		once
			Result := "system"
		end

feature -- Kernel types

	set_none_type
			-- Set type "NONE".
		local
			l_name: ET_CLASS_NAME
			l_master_class: ET_MASTER_CLASS
			l_class: ET_CLASS
			l_none_group: ET_NONE_GROUP
		do
			l_name := tokens.none_class_name
			l_master_class := master_class (l_name)
			l_master_class.set_in_system (True)
			create none_type.make (tokens.implicit_attached_type_mark, l_name, l_master_class)
			create detachable_none_type.make (tokens.detachable_keyword, l_name, l_master_class)
			create l_class.make (l_name)
			register_class (l_class)
			create l_none_group.make (Current)
			l_class.set_group (l_none_group)
			l_master_class.add_first_local_class (l_class)
		end

feature -- Feature seeds

	default_create_seed: INTEGER
			-- Seed of feature 'default_create' in class "ANY"

	copy_seed: INTEGER
			-- Seed of feature 'copy' in class "ANY"

	is_equal_seed: INTEGER
			-- Seed of feature 'is_equal' in class "ANY"

	dispose_seed: INTEGER
			-- Seed of feature 'dispose' in class "DISPOSABLE"

	routine_call_seed: INTEGER
			-- Seed of feature 'call' in class "ROUTINE"

	function_item_seed: INTEGER
			-- Seed of feature 'item' in class "FUNCTION"

	iterable_new_cursor_seed: INTEGER
			-- Seed of feature 'new_cursor' in class "ITERABLE"

	iteration_cursor_after_seed: INTEGER
			-- Seed of feature 'after' in class "ITERATION_CURSOR"

	iteration_cursor_forth_seed: INTEGER
			-- Seed of feature 'forth' in class "ITERATION_CURSOR"

feature -- Feature seeds setting

	set_default_create_seed (a_seed: INTEGER)
			-- Set `default_create_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			default_create_seed := a_seed
		ensure
			default_create_seed_set: default_create_seed = a_seed
		end

	set_copy_seed (a_seed: INTEGER)
			-- Set `copy_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			copy_seed := a_seed
		ensure
			copy_seed_set: copy_seed = a_seed
		end

	set_is_equal_seed (a_seed: INTEGER)
			-- Set `is_equal_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			is_equal_seed := a_seed
		ensure
			is_equal_seed_set: is_equal_seed = a_seed
		end

	set_dispose_seed (a_seed: INTEGER)
			-- Set `dispose_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			dispose_seed := a_seed
		ensure
			dispose_seed_set: dispose_seed = a_seed
		end

	set_routine_call_seed (a_seed: INTEGER)
			-- Set `routine_call_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			routine_call_seed := a_seed
		ensure
			routine_call_seed_set: routine_call_seed = a_seed
		end

	set_function_item_seed (a_seed: INTEGER)
			-- Set `function_item_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			function_item_seed := a_seed
		ensure
			function_item_seed_set: function_item_seed = a_seed
		end

	set_iterable_new_cursor_seed (a_seed: INTEGER)
			-- Set `iterable_new_cursor_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			iterable_new_cursor_seed := a_seed
		ensure
			iterable_new_cursor_seed_set: iterable_new_cursor_seed = a_seed
		end

	set_iteration_cursor_after_seed (a_seed: INTEGER)
			-- Set `iteration_cursor_after_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			iteration_cursor_after_seed := a_seed
		ensure
			iteration_cursor_after_seed_set: iteration_cursor_after_seed = a_seed
		end

	set_iteration_cursor_forth_seed (a_seed: INTEGER)
			-- Set `iteration_cursor_forth_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			iteration_cursor_forth_seed := a_seed
		ensure
			iteration_cursor_forth_seed_set: iteration_cursor_forth_seed = a_seed
		end

feature -- Class registration

	register_class (a_class: ET_CLASS)
			-- Register `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			register_class_mutex.lock
			registered_class_count := registered_class_count + 1
			a_class.set_id (registered_class_count)
			register_class_mutex.unlock
		end

	registered_class_count: INTEGER
			-- Number of classes already registered

	register_class_mutex: MUTEX
			-- Mutex for `register_class'

feature -- Feature registration

	register_feature (a_feature: ET_FEATURE)
			-- Register `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			register_feature_mutex.lock
			registered_feature_count := registered_feature_count + 1
			a_feature.set_id (registered_feature_count)
			register_feature_mutex.unlock
		ensure
			a_feature_registered: a_feature.is_registered
		end

	registered_feature_count: INTEGER
			-- Number of features already registered

	register_feature_mutex: MUTEX
			-- Mutex for `register_feature'

feature -- Inline constant registration

	register_inline_constant (a_constant: ET_INLINE_CONSTANT)
			-- Register `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			register_inline_constant_mutex.lock
			registered_inline_constant_count := registered_inline_constant_count + 1
			a_constant.set_id (registered_inline_constant_count)
			register_inline_constant_mutex.unlock
		end

	registered_inline_constant_count: INTEGER
			-- Number of inline constants already registered

	register_inline_constant_mutex: MUTEX
			-- Mutex for `register_inline_constant'

feature -- Setting

	set_dotnet (b: BOOLEAN)
			-- Set `is_dotnet' to `b'.
		do
			is_dotnet := b
		ensure
			dotnet_set: is_dotnet = b
		end

	set_root_type (a_name: ET_CLASS_NAME)
			-- Set `root_type'.
		require
			a_name_not_void: a_name /= Void
		local
			l_class: ET_MASTER_CLASS
		do
			l_class := master_class (a_name)
			l_class.set_marked (True)
			if l_class = any_type.named_base_class then
				root_type := any_type
			elseif l_class = none_type.named_base_class then
				root_type := none_type
			else
				create {ET_CLASS_TYPE} root_type.make (Void, a_name, l_class)
			end
		ensure
			root_type_set: attached root_type as l_root_type and then l_root_type.name.same_class_name (a_name)
		end

	unset_root_type
			-- Unset `root_type'.
		do
			root_type := Void
		ensure
			root_type_unset: root_type = Void
		end

	set_root_creation (a_name: like root_creation)
			-- Set `root_creation' to `a_name'.
		do
			root_creation := a_name
		ensure
			root_creation_set: root_creation = a_name
		end

feature -- Compilation options

	console_application_mode: BOOLEAN
			-- Should the generated application be a console application
			-- (or a Windows GUI application)?

	multithreaded_mode: BOOLEAN
			-- Should the generated application be thread-capable?

	scoop_mode: BOOLEAN
			-- Should the generated application be SCOOP-capable?

	exception_trace_mode: BOOLEAN
			-- Should the generated application be able to provide an exception trace?
			-- An exception trace is the execution path from the root creation procedure
			-- to the feature where an exception occurred.

	trace_mode: BOOLEAN
			-- Should the generated application be compiled with trace turned on?
			-- The trace is displayed each time the execution enters or exits
			-- from a feature.

	alias_transition_mode: BOOLEAN
			-- Should functions declared with the old infix/prefix syntax and
			-- with the new alias syntax considered the same?

	use_boehm_gc: BOOLEAN
			-- Should the application be compiled with the Boehm GC?

	system_name: detachable STRING
			-- Name of system

	external_include_pathnames: DS_ARRAYED_LIST [STRING]
			-- External include pathnames

	external_object_pathnames: DS_ARRAYED_LIST [STRING]
			-- External object pathnames

	external_library_pathnames: DS_ARRAYED_LIST [STRING]
			-- External library pathnames

feature -- Compilation options setting

	set_console_application_mode (b: BOOLEAN)
			-- Set `console_application_mode' to `b'.
		do
			console_application_mode := b
		ensure
			console_application_mode_set: console_application_mode = b
		end

	set_multithreaded_mode (b: BOOLEAN)
			-- Set `multithreaded_mode' to `b'.
		do
			multithreaded_mode := b
		ensure
			multithreaded_mode_mode_set: multithreaded_mode = b
		end

	set_exception_trace_mode (b: BOOLEAN)
			-- Set `exception_trace_mode' to `b'.
		do
			exception_trace_mode := b
		ensure
			exception_trace_mode_set: exception_trace_mode = b
		end

	set_trace_mode (b: BOOLEAN)
			-- Set `trace_mode' to `b'.
		do
			trace_mode := b
		ensure
			trace_mode_set: trace_mode = b
		end

	set_alias_transition_mode (b: BOOLEAN)
			-- Set `alias_transition_mode' to `b'.
		do
			alias_transition_mode := b
		ensure
			alias_transition_mode_set: alias_transition_mode = b
		end

	set_use_boehm_gc (b: BOOLEAN)
			-- Set `use_boehm_gc' to `b'.
		do
			use_boehm_gc := b
		ensure
			use_boehm_gc_set: use_boehm_gc = b
		end

	set_system_name (a_name: like system_name)
			-- Set `system_name' to `a_name'.
		do
			system_name := a_name
		ensure
			system_name_set: system_name = a_name
		end

	set_external_include_pathnames (a_pathnames: like external_include_pathnames)
			-- Set `external_include_pathnames' to `a_pathnames'.
		require
			a_pathnames_not_void: a_pathnames /= Void
			no_void_pathname: not a_pathnames.has_void
		do
			external_include_pathnames := a_pathnames
		ensure
			external_include_pathnames_set: external_include_pathnames = a_pathnames
		end

	set_external_object_pathnames (a_pathnames: like external_object_pathnames)
			-- Set `external_object_pathnames' to `a_pathnames'.
		require
			a_pathnames_not_void: a_pathnames /= Void
			no_void_pathname: not a_pathnames.has_void
		do
			external_object_pathnames := a_pathnames
		ensure
			external_object_pathnames_set: external_object_pathnames = a_pathnames
		end

	set_external_library_pathnames (a_pathnames: like external_library_pathnames)
			-- Set `external_library_pathnames' to `a_pathnames'.
		require
			a_pathnames_not_void: a_pathnames /= Void
			no_void_pathname: not a_pathnames.has_void
		do
			external_library_pathnames := a_pathnames
		ensure
			external_library_pathnames_set: external_library_pathnames = a_pathnames
		end

feature -- Parser status report

	use_attached_keyword: BOOLEAN
			-- Should 'attached' be considered as
			-- a keyword (otherwise identifier)?

	use_attribute_keyword: BOOLEAN
			-- Should 'attribute' be considered as
			-- a keyword (otherwise identifier)?

	use_detachable_keyword: BOOLEAN
			-- Should 'detachable' be considered as
			-- a keyword (otherwise identifier)?

	use_note_keyword: BOOLEAN
			-- Should 'note' be considered as
			-- a keyword (otherwise identifier)?

	use_reference_keyword: BOOLEAN
			-- Should 'reference' be considered as
			-- a keyword (otherwise identifier)?

	providers_enabled: BOOLEAN
			-- Should providers be built when parsing a class?

	cluster_dependence_enabled: BOOLEAN
			-- Should cluster dependence constraints be checked?

	use_cluster_dependence_pathnames: BOOLEAN
			-- Should cluster dependence constraints specified in 'providers.txt'
			-- and 'dependants.txt' files be considered as group pathnames
			-- (possibly with wildcards)? Otherwise they are considered as
			-- group names.

	qualified_anchored_types_cycle_detection_enabled: BOOLEAN
			-- Should an error be reported (VTAT-2) when the type of
			-- the anchor appearing in a qualified anchored type
			-- depends on a qualified anchored type?
			-- This is a way to avoid cycles in qualified anchored types.

	preparse_enabled: BOOLEAN
			-- Should preparsing be performed even when not necessary?
			--
			-- One case when it's not necessary is when analyzing the whole
			-- system, with "NONE" as root class for example. In that case
			-- preparsing can be skipped and all classes will be parsed.
			-- We may want to perform preparsing in that case anyway when
			-- overridden classes contain syntax errors for example. Since
			-- these classes are overridden, we don't want to get the
			-- syntax error messages. If we perform preparsing then the
			-- overridden classes will not need to be parsed, and no syntax
			-- error will be reported.

	preparse_shallow_mode: BOOLEAN
			-- Are filenames expected to be of the form 'classname.e'?

	preparse_single_mode: BOOLEAN
			-- Is each Eiffel file expected to contain exactly one class?
			-- (The filename is not necessarily expected to match the class name.)

	preparse_multiple_mode: BOOLEAN
			-- Can each Eiffel file contain more than one class?

	preparse_readonly_mode: BOOLEAN
			-- When a read-only group or universe had already been preparsed,
			-- can it nevertheless be reparsed again (as if it was not marked
			-- as read-only)?

	preparse_override_mode: BOOLEAN
			-- When reparsing universes, should only override clusters be
			-- traversed?

feature -- Parser setting

	set_use_attached_keyword (b: BOOLEAN)
			-- Set `use_attached_keyword' to `b'.
		do
			use_attached_keyword := b
		ensure
			use_attached_keyword_set: use_attached_keyword = b
		end

	set_use_attribute_keyword (b: BOOLEAN)
			-- Set `use_attribute_keyword' to `b'.
		do
			use_attribute_keyword := b
		ensure
			use_attribute_keyword_set: use_attribute_keyword = b
		end

	set_use_detachable_keyword (b: BOOLEAN)
			-- Set `use_detachable_keyword' to `b'.
		do
			use_detachable_keyword := b
		ensure
			use_detachable_keyword_set: use_detachable_keyword = b
		end

	set_use_note_keyword (b: BOOLEAN)
			-- Set `use_note_keyword' to `b'.
		do
			use_note_keyword := b
		ensure
			use_note_keyword_set: use_note_keyword = b
		end

	set_use_reference_keyword (b: BOOLEAN)
			-- Set `use_reference_keyword' to `b'.
		do
			use_reference_keyword := b
		ensure
			use_reference_keyword_set: use_reference_keyword = b
		end

	set_default_keyword_usage
			-- Set default keyword usage.
		do
			set_use_attribute_keyword (True)
			set_use_note_keyword (True)
			set_use_reference_keyword (True)
			set_use_attached_keyword (True)
			set_use_detachable_keyword (True)
		end

	set_providers_enabled (b: BOOLEAN)
			-- Set `providers_enabled' to `b'.
		do
			providers_enabled := b
		ensure
			providers_enabled_set: providers_enabled = b
		end

	set_cluster_dependence_enabled (b: BOOLEAN)
			-- Set `cluster_dependence_enabled' to `b'.
		do
			cluster_dependence_enabled := b
		ensure
			cluster_dependence_enabled_set: cluster_dependence_enabled = b
		end

	set_use_cluster_dependence_pathnames (b: BOOLEAN)
			-- Set `use_cluster_dependence_pathnames' to `b'.
		do
			use_cluster_dependence_pathnames := b
		ensure
			use_cluster_dependence_pathnames_set: use_cluster_dependence_pathnames = b
		end

	set_qualified_anchored_types_cycle_detection_enabled (b: BOOLEAN)
			-- Set `qualified_anchored_types_cycle_detection_enabled' to `b'.
		do
			qualified_anchored_types_cycle_detection_enabled := b
		ensure
			qualified_anchored_types_cycle_detection_enabled_set: qualified_anchored_types_cycle_detection_enabled = b
		end

	set_preparse_enabled (b: BOOLEAN)
			-- Set `preparse_enabled' to `b'.
		do
			preparse_enabled := b
		ensure
			preparse_enabled_set: preparse_enabled = b
		end

	set_preparse_shallow_mode
			-- Set `preparse_shallow_mode' to True.
		do
			preparse_shallow_mode := True
			preparse_single_mode := False
			preparse_multiple_mode := False
		ensure
			preparse_shallow_mode_set: preparse_shallow_mode
			preparse_single_mode_unset: not preparse_single_mode
			preparse_multiple_mode_unset: not preparse_multiple_mode
		end

	set_preparse_single_mode
			-- Set `preparse_single_mode' to True.
		do
			preparse_single_mode := True
			preparse_shallow_mode := False
			preparse_multiple_mode := False
		ensure
			preparse_single_mode_set: preparse_single_mode
			preparse_shallow_mode_unset: not preparse_shallow_mode
			preparse_multiple_mode_unset: not preparse_multiple_mode
		end

	set_preparse_multiple_mode
			-- Set `preparse_multiple_mode' to True.
		do
			preparse_multiple_mode := True
			preparse_shallow_mode := False
			preparse_single_mode := False
		ensure
			preparse_multiple_mode_set: preparse_multiple_mode
			preparse_shallow_mode_unset: not preparse_shallow_mode
			preparse_single_mode_unset: not preparse_single_mode
		end

	set_preparse_readonly_mode (b: BOOLEAN)
			-- Set `preparse_readonly_mode' to `b'.
		do
			preparse_readonly_mode := b
		ensure
			preparse_readonly_mode_set: preparse_readonly_mode = b
		end

	set_preparse_override_mode (b: BOOLEAN)
			-- Set `preparse_override_mode' to `b'.
		do
			preparse_override_mode := b
		ensure
			preparse_override_mode_set: preparse_override_mode = b
		end

feature -- Implementation checking status report

	flat_mode: BOOLEAN
			-- Should the inherited features be checked
			-- again in the descendant classes?

	flat_dbc_mode: BOOLEAN
			-- Should the inherited pre- and postconditions be
			-- checked again in the redeclaration of features?

	suppliers_enabled: BOOLEAN
			-- Should suppliers of classes be computed?

	unknown_builtin_reported: BOOLEAN
			-- Should unknown built-in features be reported as an error?

feature -- Implementation checking status setting

	set_flat_mode (b: BOOLEAN)
			-- Set `flat_mode' to `b'.
		do
			flat_mode := b
		ensure
			flat_mode_set: flat_mode = b
		end

	set_flat_dbc_mode (b: BOOLEAN)
			-- Set `flat_dbc_mode' to `b'.
		do
			flat_dbc_mode := b
		ensure
			flat_dbc_mode_set: flat_dbc_mode = b
		end

	set_suppliers_enabled (b: BOOLEAN)
			-- Set `suppliers_enabled' to `b'.
		do
			suppliers_enabled := b
		ensure
			suppliers_enabled_set: suppliers_enabled = b
		end

	set_unknown_builtin_reported (b: BOOLEAN)
			-- Set `unknown_builtin_reported' to `b'.
		do
			unknown_builtin_reported := b
		ensure
			unknown_builtin_reported_set: unknown_builtin_reported = b
		end

feature -- Parsing

	preparse_recursive (a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Build a mapping between class names and their filenames and
			-- populate `master_classes', even if the classes have not been
			-- parsed yet. If current universe had already been preparsed,
			-- then rebuild the mapping between class names and filenames:
			-- modified classes are reset and left unparsed and new classes
			-- are added to `master_classes', but are not parsed.
			--
			-- Note that both locally declared classes and classes imported
			-- from other universes (after having themselves been preparsed
			-- recursively) will be taken into account.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
		do
			precursor (a_system_processor)
			a_system_processor.check_master_class_validity (Current)
			build_scm_read_mappings
			build_scm_write_mappings
		end

	parse_all_recursive (a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Parse all classes declared locally in the current universe,
			-- and recursively those that are declared in universes it
			-- depends on. There is no need to call one of the preparse
			-- routines beforehand since the current routine will traverse
			-- all clusters and parse all Eiffel files anyway. The mapping
			-- between class names and their filenames will be done during
			-- this process and `master_classes' will be populated (both with
			-- classes declared locally and those imported from other universes
			-- which have themselves been parsed recursively during this call).
			-- If current universe had already been preparsed, then rebuild
			-- the mapping between class names and filenames and reparse
			-- the classes that have been modified or were not parsed yet.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
		do
			precursor (a_system_processor)
			a_system_processor.check_master_class_validity (Current)
			build_scm_read_mappings
			build_scm_write_mappings
		end

	parse_system (a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Parse all classes reachable from the root class.
			-- The Eiffel system needs to have been preparsed beforehand.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_processor_not_void: a_system_processor /= Void
		local
			l_root_class: ET_CLASS
			l_parsed_class_count: INTEGER
			l_old_parsed_class_count: INTEGER
			l_done: BOOLEAN
		do
			if not attached root_type as l_root_type then
				-- Do nothing.
			elseif l_root_type.same_named_type (none_type, tokens.unknown_class, tokens.unknown_class) then
				parse_all_recursive (a_system_processor)
			elseif l_root_type.same_named_type (any_type, tokens.unknown_class, tokens.unknown_class) then
				parse_all_recursive (a_system_processor)
			else
				l_root_class := l_root_type.base_class
				l_root_class.process (a_system_processor.eiffel_parser)
				if not l_root_class.is_preparsed then
						-- Error: unknown root class.
					a_system_processor.error_handler.report_gvsrc4a_error (l_root_class)
				else
					l_done := False
					l_old_parsed_class_count := parsed_class_count_recursive
					from until l_done loop
						if a_system_processor.stop_requested then
							l_done := True
						else
							classes_do_if_recursive_until (agent {ET_CLASS}.process (a_system_processor.eiffel_parser), agent {ET_CLASS}.in_system, a_system_processor.stop_request)
							l_parsed_class_count := parsed_class_count_recursive
							l_done := (l_parsed_class_count = l_old_parsed_class_count)
							l_old_parsed_class_count := l_parsed_class_count
						end
					end
				end
			end
		end

feature -- Ignored classes

	ignore_classes (a_classes: DS_HASH_SET [ET_CLASS]; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Unmark classes which were already marked as ignored
			-- and mark the classes in `a_classes'. Reset classes
			-- of current system accordingly to take into account
			-- these modifications.
		require
			a_classes_not_void: a_classes /= Void
			no_void_classes: not a_classes.has_void
			a_system_processor_not_void: a_system_processor /= Void
		do
				-- Unmark classes which were already marked as ignored
				-- and mark the classes in `a_classes'.
			master_classes_do_recursive (agent {ET_MASTER_CLASS}.local_ignored_classes_do_if (agent {ET_CLASS}.unmark_ignored_class, agent any_actions.negated ({ET_CLASS} ?, agent a_classes.has)))
			a_classes.do_all (agent {ET_CLASS}.mark_ignored_class)
				-- Then for each universe, import classes from other universes.
			dotnet_assemblies.do_recursive (agent {ET_DOTNET_ASSEMBLY}.import_classes)
			libraries.do_recursive (agent {ET_LIBRARY}.import_classes)
			import_classes
				-- Reset incrementally all classes that may have been
				-- affected by changes made above.
			if classes_modified_recursive then
				reset_classes_incremental_recursive (a_system_processor)
			end
			a_system_processor.check_master_class_validity (Current)
		end

feature -- SCM mappings

	build_scm_read_mappings
			-- Build SCM read mappings for all clusters in current system.
		do
			clusters_do_explicit_recursive (agent build_scm_read_mapping)
		end

	build_scm_read_mapping (a_cluster: ET_CLUSTER)
			-- Build SCM read mapping of `a_cluster' if not already done.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			if a_cluster.scm_read_mapping = Void then
				if attached scm_read_mapping_builder as l_scm_read_mapping_builder then
					if attached l_scm_read_mapping_builder.item ([a_cluster]) as l_mapping then
						a_cluster.set_scm_read_mapping (l_mapping)
					end
				end
			end
		end

	scm_read_mapping_builder: detachable FUNCTION [ET_CLUSTER, detachable ET_CLUSTER_SCM_READ_MAPPING]
			-- Function which is able to build a SCM read mapping for a given cluster

	set_scm_read_mapping_builder (a_builder: like scm_read_mapping_builder)
			-- Set `scm_read_mapping_builder' to `a_builder'.
		do
			scm_read_mapping_builder := a_builder
		ensure
			scm_read_mapping_builder_set: scm_read_mapping_builder = a_builder
		end

	build_scm_write_mappings
			-- Build SCM write mappings for all clusters in current system.
		do
			clusters_do_explicit_recursive (agent build_scm_write_mapping)
		end

	build_scm_write_mapping (a_cluster: ET_CLUSTER)
			-- Build SCM write mapping of `a_cluster' if not already done.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			if a_cluster.scm_write_mapping = Void then
				if attached scm_write_mapping_builder as l_scm_write_mapping_builder then
					if attached l_scm_write_mapping_builder.item ([a_cluster]) as l_write_mapping then
						a_cluster.set_scm_write_mapping (l_write_mapping)
						if attached l_write_mapping.master_cluster.scm_read_mapping_recursive as l_read_mapping then
							l_read_mapping.scm_write_mappings.force_last (l_write_mapping)
						end
					end
				end
			end
		end

	scm_write_mapping_builder: detachable FUNCTION [ET_CLUSTER, detachable ET_CLUSTER_SCM_WRITE_MAPPING]
			-- Function which is able to build a SCM write mapping for a given cluster

	set_scm_write_mapping_builder (a_builder: like scm_write_mapping_builder)
			-- Set `scm_write_mapping_builder' to `a_builder'.
		do
			scm_write_mapping_builder := a_builder
		ensure
			scm_write_mapping_builder_set: scm_write_mapping_builder = a_builder
		end

feature -- Compilation status report

	is_ecma: BOOLEAN
			-- Should the compilation process use ECMA's semantics?
		do
			Result := (ecma_version /= Void)
		ensure
			definition: Result = (ecma_version /= Void)
		end

	ecma_version: detachable UT_VERSION
			-- ECMA version, if any, whose semantics should be
			-- used by the compilation process

	is_ise: BOOLEAN
			-- Should the compilation process use ISE's semantics?
		do
			Result := (ise_version /= Void)
		ensure
			definition: Result = (ise_version /= Void)
		end

	ise_version: detachable UT_VERSION
			-- ISE version, if any, whose semantics should be
			-- used by the compilation process

	older_ise_version (a_version: UT_VERSION): BOOLEAN
			-- Should the compilation process use ISE's semantics
			-- corresponding to a version older than `a_version'?
		require
			a_version_not_void: a_version /= Void
		do
			Result := attached ise_version as l_version and then l_version < a_version
		ensure
			definition: Result = (attached ise_version as l_version and then l_version < a_version)
		end

	older_or_same_ise_version (a_version: UT_VERSION): BOOLEAN
			-- Should the compilation process use ISE's semantics
			-- corresponding to a version older than or same as
			-- `a_version'?
		require
			a_version_not_void: a_version /= Void
		do
			Result := attached ise_version as l_version and then l_version <= a_version
		ensure
			definition: Result = (attached ise_version as l_version and then l_version <= a_version)
		end

	newer_ise_version (a_version: UT_VERSION): BOOLEAN
			-- Should the compilation process use ISE's semantics
			-- corresponding to a version more recent than `a_version'?
		require
			a_version_not_void: a_version /= Void
		do
			Result := attached ise_version as l_version and then l_version > a_version
		ensure
			definition: Result = (attached ise_version as l_version and then l_version > a_version)
		end

	newer_or_same_ise_version (a_version: UT_VERSION): BOOLEAN
			-- Should the compilation process use ISE's semantics
			-- corresponding to a version more recent than or same as
			-- `a_version'?
		require
			a_version_not_void: a_version /= Void
		do
			Result := attached ise_version as l_version and then l_version >= a_version
		ensure
			definition: Result = (attached ise_version as l_version and then l_version >= a_version)
		end

feature -- Compilation setting

	set_ecma_version (a_version: like ecma_version)
			-- Set `ecma_version' to `a_version'.
		do
			ecma_version := a_version
			if ecma_version /= Void then
				set_use_attribute_keyword (True)
				set_use_note_keyword (True)
				set_use_reference_keyword (False)
				set_use_attached_keyword (True)
				set_use_detachable_keyword (True)
			elseif ise_version /= Void then
				set_ise_version (ise_version)
			else
				set_default_keyword_usage
			end
		ensure
			ecma_version_set: ecma_version = a_version
		end

	set_ise_version (a_version: like ise_version)
			-- Set `ise_version' to `a_version'.
		do
			ise_version := a_version
			if attached ise_version as l_ise_version then
				set_use_attribute_keyword (l_ise_version >= ise_6_4_7_6592)
				set_use_note_keyword (l_ise_version >= ise_6_4_7_6592)
				set_use_reference_keyword (True)
				set_use_attached_keyword (l_ise_version >= ise_6_4_7_7252)
				set_use_detachable_keyword (l_ise_version >= ise_6_4_7_7252)
			elseif ecma_version /= Void then
				set_ecma_version (ecma_version)
			else
				set_default_keyword_usage
			end
		ensure
			ise_version_set: ise_version = a_version
		end

feature {NONE} -- Constants

	default_read_only_value: BOOLEAN
			-- Default value for `is_read_only'
		once
			Result := False
		end

invariant

		-- Feature seeds.
	default_create_seed_not_negative: default_create_seed >= 0
	copy_seed_not_negative: copy_seed >= 0
	is_equal_seed_not_negative: is_equal_seed >= 0
	dispose_seed_not_negative: dispose_seed >= 0
	routine_call_seed_not_negative: routine_call_seed >= 0
	function_item_seed_not_negative: function_item_seed >= 0
		-- Compilation options.
	external_include_pathnames_not_void: external_include_pathnames /= Void
	no_void_external_include_pathname: not external_include_pathnames.has_void
	external_object_pathnames_not_void: external_object_pathnames /= Void
	no_void_external_object_pathname: not external_object_pathnames.has_void
	external_library_pathnames_not_void: external_library_pathnames /= Void
	no_void_external_library_pathname: not external_library_pathnames.has_void

end
