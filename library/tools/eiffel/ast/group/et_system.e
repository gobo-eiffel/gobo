note

	description:

		"Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2012, Eric Bezault and others"
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
			default_read_only_value
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
			-- Error messages will be sent to standard files.
			-- Use default Eiffel AST factory.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			error_handler := tokens.standard_error_handler
			ast_factory := tokens.default_ast_factory
			current_system := Current
			initialize
			set_default_keyword_usage
			set_preparse_shallow_mode
			create external_include_pathnames.make (20)
			create external_object_pathnames.make (20)
			create external_library_pathnames.make (20)
			console_application_mode := True
			alias_transition_mode := True
			unknown_builtin_reported := True
			qualified_anchored_types_enabled := True
			set_default_class_mapping
			set_kernel_types
			create null_processor.make
			eiffel_preparser := null_processor
			master_class_checker := null_processor
			eiffel_parser := null_processor
			provider_checker := null_processor
			ancestor_builder := null_processor
			feature_flattener := null_processor
			interface_checker := null_processor
			implementation_checker := null_processor
			flat_implementation_checker := null_processor
			set_system_name (a_name)
			make_adapted (a_name, Current)
		end

feature -- Status report

	is_dotnet: BOOLEAN
			-- Does current system contain Eiffel for .NET kernel classes?
			-- Hence follow Eiffel for .NET validity rules.
		local
			l_visited: DS_HASH_SET [ET_INTERNAL_UNIVERSE]
		do
			if not dotnet_assemblies.is_empty then
				Result := True
			else
				create l_visited.make (initial_universes_capacity)
				add_internal_universe_recursive (l_visited)
				from l_visited.start until l_visited.after loop
					if not l_visited.item_for_iteration.dotnet_assemblies.is_empty then
						Result := True
						l_visited.go_after
					else
						l_visited.forth
					end
				end
			end
		end

feature -- Access

	root_type: ET_BASE_TYPE
			-- Root type

	root_creation: ET_FEATURE_NAME
			-- Root creation procedure

	error_handler: ET_ERROR_HANDLER
			-- Error handler

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory

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
			l_class := ast_factory.new_class (l_name)
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
			registered_class_count := registered_class_count + 1
			a_class.set_id (registered_class_count)
		end

	registered_class_count: INTEGER
			-- Number of classes already registered

feature -- Feature registration

	register_feature (a_feature: ET_FEATURE)
			-- Register `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			registered_feature_count := registered_feature_count + 1
			a_feature.set_id (registered_feature_count)
		ensure
			a_feature_registered: a_feature.is_registered
		end

	registered_feature_count: INTEGER
			-- Number of features already registered

feature -- Inline constant registration

	register_inline_constant (a_constant: ET_INLINE_CONSTANT)
			-- Register `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			registered_inline_constant_count := registered_inline_constant_count + 1
			a_constant.set_id (registered_inline_constant_count)
		end

	registered_inline_constant_count: INTEGER
			-- Number of inline constants already registered

feature -- Setting

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
			root_type_not_void: root_type /= Void
			root_type_set: root_type.name.same_class_name (a_name)
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

	set_error_handler (a_handler: like error_handler)
			-- Set `error_handler' to `a_handler'.
		require
			a_handler_not_void: a_handler /= Void
		do
			error_handler := a_handler
		ensure
			error_handler_set: error_handler = a_handler
		end

	set_ast_factory (a_factory: like ast_factory)
			-- Set `ast_factory' to `a_factory'.
		require
			a_factory_not_void: a_factory /= Void
		do
			ast_factory := a_factory
		ensure
			ast_factory_set: ast_factory = a_factory
		end

feature -- Compilation options

	console_application_mode: BOOLEAN
			-- Should the generated application be a console application
			-- (or a Windows GUI application)?

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

	system_name: STRING
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

	qualified_anchored_types_enabled: BOOLEAN
			-- Are types of the form 'like a.b' or 'like {A}.b'
			-- (also known as qualified anchored types or remote
			-- anchored types) accepted?

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

	set_qualified_anchored_types_enabled (b: BOOLEAN)
			-- Set `qualified_anchored_types_enabled' to `b'.
		do
			qualified_anchored_types_enabled := b
		ensure
			qualified_anchored_types_enabled_set: qualified_anchored_types_enabled = b
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
		local
			a_checker: ET_IMPLEMENTATION_CHECKER
		do
			flat_mode := b
			if b then
				a_checker ?= flat_implementation_checker
			else
				a_checker ?= implementation_checker
			end
			if a_checker /= Void then
				a_checker.set_flat_mode (b)
			end
		ensure
			flat_mode_set: flat_mode = b
		end

	set_flat_dbc_mode (b: BOOLEAN)
			-- Set `flat_dbc_mode' to `b'.
		local
			a_checker: ET_IMPLEMENTATION_CHECKER
		do
			flat_dbc_mode := b
			a_checker ?= implementation_checker
			if a_checker /= Void then
				a_checker.set_flat_dbc_mode (b)
			end
			a_checker ?= flat_implementation_checker
			if a_checker /= Void then
				a_checker.set_flat_dbc_mode (b)
			end
		ensure
			flat_dbc_mode_set: flat_dbc_mode = b
		end

	set_suppliers_enabled (b: BOOLEAN)
			-- Set `suppliers_enabled' to `b'.
		local
			a_checker: ET_IMPLEMENTATION_CHECKER
		do
			suppliers_enabled := b
			a_checker ?= implementation_checker
			if a_checker /= Void then
				a_checker.set_suppliers_enabled (b)
			end
			a_checker ?= flat_implementation_checker
			if a_checker /= Void then
				a_checker.set_suppliers_enabled (b)
			end
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

	preparse_recursive
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
			precursor
			check_master_class_validity
			build_scm_read_mappings
			build_scm_write_mappings
		end

	parse_all_recursive
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
			precursor
			check_master_class_validity
			build_scm_read_mappings
			build_scm_write_mappings
		end

	parse_system
			-- Parse all classes reachable from the root class.
			-- The Eiffel system needs to have been preparsed beforehand.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		local
			l_root_class: ET_CLASS
			l_parsed_class_count: INTEGER
			l_old_parsed_class_count: INTEGER
			l_done: BOOLEAN
		do
			if root_type = Void then
				-- Do nothing.
			elseif root_type.same_named_type (none_type, tokens.unknown_class, tokens.unknown_class) then
				parse_all_recursive
			elseif root_type.same_named_type (any_type, tokens.unknown_class, tokens.unknown_class) then
				parse_all_recursive
			else
				l_root_class := root_type.base_class
				l_root_class.process (eiffel_parser)
				if not l_root_class.is_preparsed then
						-- Error: unknown root class.
					error_handler.report_gvsrc4a_error (l_root_class)
				else
					l_done := False
					l_old_parsed_class_count := parsed_class_count_recursive
					from until l_done loop
						if stop_requested then
							l_done := True
						else
							classes_do_if_recursive_until (agent {ET_CLASS}.process (eiffel_parser), agent {ET_CLASS}.in_system, stop_request)
							l_parsed_class_count := parsed_class_count_recursive
							l_done := (l_parsed_class_count = l_old_parsed_class_count)
							l_old_parsed_class_count := l_parsed_class_count
						end
					end
				end
			end
		end

feature -- Ignored classes

	ignore_classes (a_classes: DS_HASH_SET [ET_CLASS])
			-- Unmark classes which were already marked as ignored
			-- and mark the classes in `a_classes'. Reset classes
			-- of current system accordingly to take into account
			-- these modifications.
		require
			a_classes_not_void: a_classes /= Void
			no_void_classes: not a_classes.has_void
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
				reset_classes_incremental_recursive
			end
			check_master_class_validity
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
		local
			l_mapping: ET_CLUSTER_SCM_READ_MAPPING
		do
			if a_cluster.scm_read_mapping = Void then
				if scm_read_mapping_builder /= Void then
					l_mapping := scm_read_mapping_builder.item ([a_cluster])
					if l_mapping /= Void then
						a_cluster.set_scm_read_mapping (l_mapping)
					end
				end
			end
		end

	scm_read_mapping_builder: FUNCTION [ANY, TUPLE [ET_CLUSTER], ET_CLUSTER_SCM_READ_MAPPING]
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
		local
			l_mapping: ET_CLUSTER_SCM_WRITE_MAPPING
		do
			if a_cluster.scm_write_mapping = Void then
				if scm_write_mapping_builder /= Void then
					l_mapping := scm_write_mapping_builder.item ([a_cluster])
					if l_mapping /= Void then
						a_cluster.set_scm_write_mapping (l_mapping)
						l_mapping.master_cluster.scm_read_mapping_recursive.scm_write_mappings.force_last (l_mapping)
					end
				end
			end
		end

	scm_write_mapping_builder: FUNCTION [ANY, TUPLE [ET_CLUSTER], ET_CLUSTER_SCM_WRITE_MAPPING]
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

	ecma_version: UT_VERSION
			-- ECMA version, if any, whose semantics should be
			-- used by the compilation process

	is_ise: BOOLEAN
			-- Should the compilation process use ISE's semantics?
		do
			Result := (ise_version /= Void)
		ensure
			definition: Result = (ise_version /= Void)
		end

	ise_version: UT_VERSION
			-- ISE version, if any, whose semantics should be
			-- used by the compilation process

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
			if ise_version /= Void then
				set_use_attribute_keyword (ise_version >= ise_6_4_7_6592)
				set_use_note_keyword (ise_version >= ise_6_4_7_6592)
				set_use_reference_keyword (True)
				set_use_attached_keyword (ise_version >= ise_6_4_7_7252)
				set_use_detachable_keyword (ise_version >= ise_6_4_7_7252)
			elseif ecma_version /= Void then
				set_ecma_version (ecma_version)
			else
				set_default_keyword_usage
			end
		ensure
			ise_version_set: ise_version = a_version
		end

feature -- Compilation

	compile
			-- Compile current Eiffel system.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		do
			if root_type = Void then
				compile_all
			elseif root_type = none_type then
				compile_all
			elseif root_type = any_type then
				compile_all
			else
				compile_system
			end
		end

	compile_system
			-- Compile all classes reachable from the root class.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		local
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: DT_DATE_TIME
		do
			activate_processors
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			preparse_recursive
			if not stop_requested and then error_handler.benchmark_shown then
				print_time (dt1, "Degree 6")
				dt1 := l_clock.system_clock.date_time_now
			end
			parse_system
			if not stop_requested and then error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Preparsed ")
				error_handler.info_file.put_integer (class_count_recursive)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_string ("Parsed ")
				error_handler.info_file.put_integer (parsed_class_count_recursive)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (registered_feature_count)
				error_handler.info_file.put_line (" features")
			end
			if not stop_requested and then error_handler.benchmark_shown then
				print_time (dt1, "Degree 5")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_4
			if not stop_requested and then error_handler.benchmark_shown then
				print_time (dt1, "Degree 4")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_3
			if not stop_requested and then error_handler.benchmark_shown then
				print_time (dt1, "Degree 3")
			end
		end

	compile_all
			-- Compile all classes in the current Eiffel system.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		local
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: DT_DATE_TIME
		do
			activate_processors
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			if preparse_enabled then
				preparse_recursive
				if not stop_requested and then error_handler.benchmark_shown then
					print_time (dt1, "Degree 6")
					dt1 := l_clock.system_clock.date_time_now
				end
				compile_degree_5
			else
				parse_all_recursive
				check_provider_validity
			end
			if not stop_requested and then error_handler.benchmark_shown then
				print_time (dt1, "Degree 5")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_4
			if not stop_requested and then error_handler.benchmark_shown then
				print_time (dt1, "Degree 4")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_3
			if not stop_requested and then error_handler.benchmark_shown then
				print_time (dt1, "Degree 3")
			end
		end

	compile_degree_5
			-- Equivalent of ISE's Degree 5.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		do
				-- Parse classes.
			classes_do_recursive_until (agent {ET_CLASS}.process (eiffel_parser), stop_request)
			check_provider_validity
			if not stop_requested and then error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Parsed ")
				error_handler.info_file.put_integer (parsed_class_count_recursive)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (registered_feature_count)
				error_handler.info_file.put_line (" features")
			end
		end

	compile_degree_4
			-- Equivalent of ISE Eiffel's Degree 4.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		do
				-- Build ancestors.
			classes_do_if_recursive_until (agent {ET_CLASS}.process (ancestor_builder), agent {ET_CLASS}.is_parsed, stop_request)
				-- Flatten features.
			classes_do_if_recursive_until (agent {ET_CLASS}.process (feature_flattener), agent {ET_CLASS}.ancestors_built, stop_request)
				-- Check interface.
			classes_do_if_recursive_until (agent {ET_CLASS}.process (interface_checker), agent {ET_CLASS}.features_flattened, stop_request)
			if not stop_requested and then error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Flattened ")
				error_handler.info_file.put_integer (parsed_class_count_recursive)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (registered_feature_count)
				error_handler.info_file.put_line (" features")
			end
		end

	compile_degree_3
			-- Equivalent of ISE Eiffel's Degree 3.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		local
			l_processor: ET_AST_PROCESSOR
		do
				-- Check implementation.
			if flat_mode then
				l_processor := flat_implementation_checker
			else
				l_processor := implementation_checker
			end
			if attached {ET_IMPLEMENTATION_CHECKER} l_processor as l_checker then
				l_checker.set_flat_mode (flat_mode)
				l_checker.set_flat_dbc_mode (flat_dbc_mode)
				l_checker.set_suppliers_enabled (suppliers_enabled)
			end
			classes_do_if_recursive_until (agent {ET_CLASS}.process (l_processor), agent {ET_CLASS}.interface_checked, stop_request)
		end

	check_provider_validity
			-- Check cluster dependence constraints.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		do
			if cluster_dependence_enabled then
				classes_do_if_recursive_until (agent {ET_CLASS}.process (provider_checker), agent {ET_CLASS}.is_parsed, stop_request)
			end
		end

	check_master_class_validity
			-- Check for invalid class name clashes and invalid class overriding.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		do
			master_classes_do_recursive_until (agent {ET_MASTER_CLASS}.process (master_class_checker), stop_request)
		end

feature -- Processors

	eiffel_preparser: ET_AST_PROCESSOR
			-- Eiffel preparser

	eiffel_parser: ET_AST_PROCESSOR
			-- Eiffel parser

	master_class_checker: ET_AST_PROCESSOR
			-- Master class checker

	dotnet_assembly_consumer: ET_DOTNET_ASSEMBLY_CONSUMER
			-- .NET assembly consumer
		do
			Result := internal_dotnet_assembly_consumer
			if Result = Void then
				create {ET_DOTNET_ASSEMBLY_CLASSIC_CONSUMER} Result.make (Current)
				internal_dotnet_assembly_consumer := Result
			end
		end

	provider_checker: ET_AST_PROCESSOR
			-- Provider checker

	ancestor_builder: ET_AST_PROCESSOR
			-- Ancestor builder

	feature_flattener: ET_AST_PROCESSOR
			-- Feature flattener

	interface_checker: ET_AST_PROCESSOR
			-- Interface checker

	implementation_checker: ET_AST_PROCESSOR
			-- Implementation checker

	flat_implementation_checker: ET_AST_PROCESSOR
			-- Implementation checker in flat mode

	null_processor: ET_AST_NULL_PROCESSOR
			-- Null processor

	activate_processors
			-- Activate processors.
		local
			l_implementation_checker: ET_IMPLEMENTATION_CHECKER
		do
			if eiffel_preparser = null_processor then
				create {ET_EIFFEL_PREPARSER} eiffel_preparser.make
			end
			if master_class_checker = null_processor then
				create {ET_MASTER_CLASS_CHECKER} master_class_checker.make
			end
			if eiffel_parser = null_processor then
				create {ET_EIFFEL_PARSER} eiffel_parser.make
			end
			if provider_checker = null_processor then
				create {ET_PROVIDER_CHECKER} provider_checker.make
			end
			if ancestor_builder = null_processor then
				create {ET_ANCESTOR_BUILDER} ancestor_builder.make
			end
			if feature_flattener = null_processor then
				create {ET_FEATURE_FLATTENER} feature_flattener.make
			end
			if interface_checker = null_processor then
				create {ET_INTERFACE_CHECKER} interface_checker.make
			end
			if implementation_checker = null_processor then
				create l_implementation_checker.make
				l_implementation_checker.set_flat_mode (False)
				l_implementation_checker.set_flat_dbc_mode (flat_dbc_mode)
				l_implementation_checker.set_suppliers_enabled (suppliers_enabled)
				implementation_checker := l_implementation_checker
			end
			if flat_implementation_checker = null_processor then
				create l_implementation_checker.make
				l_implementation_checker.set_flat_mode (True)
				l_implementation_checker.set_flat_dbc_mode (flat_dbc_mode)
				l_implementation_checker.set_suppliers_enabled (suppliers_enabled)
				flat_implementation_checker := l_implementation_checker
			end
		end

	set_eiffel_preparser (a_eiffel_preparser: like eiffel_preparser)
			-- Set `eiffel_preparser' to `a_eiffel_preparser'.
		require
			a_eiffel_preparser_not_void: a_eiffel_preparser /= Void
		do
			eiffel_preparser := a_eiffel_preparser
		ensure
			eiffel_preparser_set: eiffel_preparser = a_eiffel_preparser
		end

	set_master_class_checker (a_master_class_checker: like master_class_checker)
			-- Set `master_class_checker' to `a_master_class_checker'.
		require
			a_master_class_checker_not_void: a_master_class_checker /= Void
		do
			master_class_checker := a_master_class_checker
		ensure
			master_class_checker_set: master_class_checker = a_master_class_checker
		end

	set_eiffel_parser (a_eiffel_parser: like eiffel_parser)
			-- Set `eiffel_parser' to `a_eiffel_parser'.
		require
			a_eiffel_parser_not_void: a_eiffel_parser /= Void
		do
			eiffel_parser := a_eiffel_parser
		ensure
			eiffel_parser_set: eiffel_parser = a_eiffel_parser
		end

	set_dotnet_assembly_consumer (a_consumer: like dotnet_assembly_consumer)
			-- Set `dotnet_assembly_consumer' to `a_consumer'.
		require
			a_consumer_not_void: a_consumer /= Void
		do
			internal_dotnet_assembly_consumer := a_consumer
		ensure
			dotnet_assembly_consumer_set: dotnet_assembly_consumer = a_consumer
		end

	set_provider_checker (a_provider_checker: like provider_checker)
			-- Set `provider_checker' to `a_provider_checker'.
		require
			a_provider_checker_not_void: a_provider_checker /= Void
		do
			provider_checker := a_provider_checker
		ensure
			provider_checker_set: provider_checker = a_provider_checker
		end

	set_ancestor_builder (an_ancestor_builder: like ancestor_builder)
			-- Set `ancestor_builder' to `an_ancestor_builder'.
		require
			an_ancestor_builder_not_void: an_ancestor_builder /= Void
		do
			ancestor_builder := an_ancestor_builder
		ensure
			ancestor_builder_set: ancestor_builder = an_ancestor_builder
		end

	set_feature_flattener (a_feature_flattener: like feature_flattener)
			-- Set `feature_flattener' to `a_feature_flattener'.
		require
			a_feature_flattener_not_void: a_feature_flattener /= Void
		do
			feature_flattener := a_feature_flattener
		ensure
			feature_flattener_set: feature_flattener = a_feature_flattener
		end

	set_interface_checker (an_interface_checker: like interface_checker)
			-- Set `interface_checker' to `an_interface_checker'.
		require
			an_interface_checker_not_void: an_interface_checker /= Void
		do
			interface_checker := an_interface_checker
		ensure
			interface_checker_set: interface_checker = an_interface_checker
		end

	set_implementation_checker (a_checker: like implementation_checker)
			-- Set `implementation_chcker' to `a_checker'.
		require
			a_checker_not_void: a_checker /= Void
		do
			implementation_checker := a_checker
		ensure
			implementation_checker_set: implementation_checker = a_checker
		end

	set_flat_implementation_checker (a_checker: like flat_implementation_checker)
			-- Set `flat_implementation_chcker' to `a_checker'.
		require
			a_checker_not_void: a_checker /= Void
		do
			flat_implementation_checker := a_checker
		ensure
			flat_implementation_checker_set: flat_implementation_checker = a_checker
		end

feature -- Stop

	stop_requested: BOOLEAN
			-- Has the interruption of the current operation
			-- been requested? The operation will therefore be
			-- interrupted at the earliest possible time.
		do
			if stop_request /= Void then
				Result := stop_request.item ([])
			end
		end

	stop_request: FUNCTION [ANY, TUPLE, BOOLEAN]
			-- Agent used to figure out whether there has been
			-- a request to interrupt the current operation;
			-- No interruption if Void

	set_stop_request (a_stop_request: like stop_request)
			-- Set `stop_request' to `a_stop_request'.
		do
			stop_request := a_stop_request
		ensure
			stop_request_set: stop_request = a_stop_request
		end

feature -- Timing

	print_time (a_start: DT_DATE_TIME; a_degree: STRING)
			-- Print time spent in `a_degree' since `a_start'.
		require
			a_start_not_void: a_start /= Void
			a_degree_not_void: a_degree /= Void
		local
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt2: DT_DATE_TIME
			dtd: DT_DATE_TIME_DURATION
		do
			if not stop_requested then
				create l_clock
				dt2 := l_clock.system_clock.date_time_now
				dtd := dt2 - a_start
				dtd.set_canonical (a_start)
				error_handler.info_file.put_string (a_degree)
				error_handler.info_file.put_string (": ")
				error_handler.info_file.put_line (dtd.out)
				debug ("stop")
					io.read_line
				end
			end
		end

feature {NONE} -- Implementation

	internal_dotnet_assembly_consumer: ET_DOTNET_ASSEMBLY_CONSUMER
			-- .NET assembly consumer

feature {NONE} -- Constants

	default_read_only_value: BOOLEAN
			-- Default value for `is_read_only'
		once
			Result := False
		end

invariant

	error_handler_not_void: error_handler /= Void
	ast_factory_not_void: ast_factory /= Void
		-- Feature seeds.
	default_create_seed_not_negative: default_create_seed >= 0
	copy_seed_not_negative: copy_seed >= 0
	is_equal_seed_not_negative: is_equal_seed >= 0
	dispose_seed_not_negative: dispose_seed >= 0
	routine_call_seed_not_negative: routine_call_seed >= 0
	function_item_seed_not_negative: function_item_seed >= 0
		-- Processors.
	eiffel_preparser_not_void: eiffel_preparser /= Void
	master_class_checker_not_void: master_class_checker /= Void
	eiffel_parser_not_void: eiffel_parser /= Void
	provider_checker_not_void: provider_checker /= Void
	ancestor_builder_not_void: ancestor_builder /= Void
	feature_flattener_not_void: feature_flattener /= Void
	interface_checker_not_void: interface_checker /= Void
	implementation_checker_not_void: implementation_checker /= Void
	flat_implementation_checker_not_void: flat_implementation_checker /= Void
	null_processor_not_void: null_processor /= Void
		-- Compilation options.
	external_include_pathnames_not_void: external_include_pathnames /= Void
	no_void_external_include_pathname: not external_include_pathnames.has_void
	external_object_pathnames_not_void: external_object_pathnames /= Void
	no_void_external_object_pathname: not external_object_pathnames.has_void
	external_library_pathnames_not_void: external_library_pathnames /= Void
	no_void_external_library_pathname: not external_library_pathnames.has_void

end
