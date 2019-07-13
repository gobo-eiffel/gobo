note

	description:

		"Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
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
			create external_include_pathnames.make (20)
			create external_object_pathnames.make (20)
			create external_library_pathnames.make (20)
			create external_make_pathnames.make (20)
			create external_resource_pathnames.make (20)
			create external_cflags.make (20)
			create external_linker_flags.make (20)
			console_application_mode := True
			alias_transition_mode := True
			total_order_on_reals_mode := True
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
			l_master_class.set_marked (True)
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

	iteration_cursor_item_seed: INTEGER
			-- Seed of feature 'item' in class "ITERATION_CURSOR"

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

	set_iteration_cursor_item_seed (a_seed: INTEGER)
			-- Set `iteration_cursor_item_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			iteration_cursor_item_seed := a_seed
		ensure
			iteration_cursor_item_seed_set: iteration_cursor_item_seed = a_seed
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

	attachment_type_conformance_mode: BOOLEAN
			-- Should attachment status be taken into account when checking
			-- conformance of types in current system?

	target_type_attachment_mode: BOOLEAN
			-- Should the attachment status of the target of qualified calls
			-- be checked at compile time?

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

	total_order_on_reals_mode: BOOLEAN
			-- Should NaN values will be lower than any other real values,
			-- and comparing NaN with another NaN will yield True and not False
			-- as usually done in IEEE arithmetic?

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

	external_make_pathnames: DS_ARRAYED_LIST [STRING]
			-- External make pathnames

	external_resource_pathnames: DS_ARRAYED_LIST [STRING]
			-- External resource pathnames

	external_cflags: DS_ARRAYED_LIST [STRING]
			-- External C flags

	external_linker_flags: DS_ARRAYED_LIST [STRING]
			-- External linker flags

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

	set_attachment_type_conformance_mode (b: BOOLEAN)
			-- Set `attachment_type_conformance_mode' to `b'.
		do
			attachment_type_conformance_mode := b
		ensure
			attachment_type_conformance_mode_set: attachment_type_conformance_mode = b
		end

	set_target_type_attachment_mode (b: BOOLEAN)
			-- Set `target_type_attachment_mode' to `b'.
		do
			target_type_attachment_mode := b
		ensure
			target_type_attachment_mode_set: target_type_attachment_mode = b
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

	set_total_order_on_reals_mode (b: BOOLEAN)
			-- Set `total_order_on_reals_mode' to `b'.
		do
			total_order_on_reals_mode := b
		ensure
			total_order_on_reals_mode_set: total_order_on_reals_mode = b
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

	set_external_make_pathnames (a_pathnames: like external_make_pathnames)
			-- Set `external_make_pathnames' to `a_pathnames'.
		require
			a_pathnames_not_void: a_pathnames /= Void
			no_void_pathname: not a_pathnames.has_void
		do
			external_make_pathnames := a_pathnames
		ensure
			external_make_pathnames_set: external_make_pathnames = a_pathnames
		end

	set_external_resource_pathnames (a_pathnames: like external_resource_pathnames)
			-- Set `external_resource_pathnames' to `a_pathnames'.
		require
			a_pathnames_not_void: a_pathnames /= Void
			no_void_pathname: not a_pathnames.has_void
		do
			external_resource_pathnames := a_pathnames
		ensure
			external_resource_pathnames_set: external_resource_pathnames = a_pathnames
		end

	set_external_cflags (a_flags: like external_cflags)
			-- Set `external_cflags' to `a_flags'.
		require
			a_flags_not_void: a_flags /= Void
			no_void_flag: not a_flags.has_void
		do
			external_cflags := a_flags
		ensure
			external_cflags_set: external_cflags = a_flags
		end

	set_external_linker_flags (a_flags: like external_linker_flags)
			-- Set `external_linker_flags' to `a_flags'.
		require
			a_flags_not_void: a_flags /= Void
			no_void_flag: not a_flags.has_void
		do
			external_linker_flags := a_flags
		ensure
			external_linker_flags_set: external_linker_flags = a_flags
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

feature {NONE} -- Constants

	default_read_only_value: BOOLEAN
			-- Default value for `is_read_only'
		once
			Result := False
		end

invariant

	current_system_is_current: current_system = Current
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
	external_resource_pathnames_not_void: external_resource_pathnames /= Void
	no_void_external_resource_pathname: not external_resource_pathnames.has_void
	external_make_pathnames_not_void: external_make_pathnames /= Void
	no_void_external_make_pathname: not external_make_pathnames.has_void
	external_cflags_not_void: external_cflags /= Void
	no_void_external_cflag: not external_cflags.has_void
	external_linker_flags_not_void: external_linker_flags /= Void
	no_void_external_linker_flag: not external_linker_flags.has_void
		-- Concurrency.
	register_class_mutex_not_void: register_class_mutex /= Void

end
