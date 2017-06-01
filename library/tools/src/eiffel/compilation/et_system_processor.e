note

	description:

		"Eiffel system processors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYSTEM_PROCESSOR

inherit

	ANY

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make,
	make_null

feature {NONE} -- Initialization

	make
			-- Create a null system processor.
		do
			make_null
			create {ET_EIFFEL_PREPARSER} eiffel_preparser.make (current)
			create {ET_MASTER_CLASS_CHECKER} master_class_checker.make (Current)
			create {ET_EIFFEL_PARSER} eiffel_parser.make (Current)
			create {ET_PROVIDER_CHECKER} provider_checker.make (Current)
			create {ET_ANCESTOR_BUILDER} ancestor_builder.make (Current)
			create {ET_FEATURE_FLATTENER} feature_flattener.make (Current)
			create {ET_INTERFACE_CHECKER} interface_checker.make (Current)
			create {ET_IMPLEMENTATION_CHECKER} implementation_checker.make (Current)
			error_handler := tokens.standard_error_handler
		end

	make_null
			-- Create a null system processor.
		local
			l_null_processor: ET_AST_NULL_PROCESSOR
		do
			create processed_class_count_stack.make_default
			ast_factory := tokens.default_ast_factory
			l_null_processor := tokens.null_ast_processor
			eiffel_preparser := l_null_processor
			master_class_checker := l_null_processor
			eiffel_parser := l_null_processor
			provider_checker := l_null_processor
			ancestor_builder := l_null_processor
			feature_flattener := l_null_processor
			interface_checker := l_null_processor
			implementation_checker := l_null_processor
			error_handler := tokens.null_error_handler
			create {ET_DOTNET_ASSEMBLY_CLASSIC_CONSUMER} dotnet_assembly_consumer.make (Current)
			set_default_keyword_usage
			set_preparse_shallow_mode
			set_unknown_builtin_reported (True)
			set_qualified_anchored_types_cycle_detection_enabled (False)
		end

feature -- Status report

	benchmark_shown: BOOLEAN
			-- Should benchmark be shown for each Degree?

	metrics_shown: BOOLEAN
			-- Should metrics be shown?

feature -- Status setting

	set_benchmark_shown (b: BOOLEAN)
			-- Set `benchmark_shown' to `b'.
		do
			benchmark_shown := b
		ensure
			benchmark_shown_set: benchmark_shown = b
		end

	set_benchmark_shown_recursive (b: BOOLEAN)
			-- Set `benchmark_shown' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_benchmark_shown (b)
		ensure
			benchmark_shown_set: benchmark_shown = b
		end

	set_metrics_shown (b: BOOLEAN)
			-- Set `metrics_shown' to `b'.
		do
			metrics_shown := b
		ensure
			metrics_shown_set: metrics_shown = b
		end

	set_metrics_shown_recursive (b: BOOLEAN)
			-- Set `metrics_shown' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_metrics_shown (b)
		ensure
			metrics_shown_set: metrics_shown = b
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

feature -- Parser status setting

	set_use_attached_keyword (b: BOOLEAN)
			-- Set `use_attached_keyword' to `b'.
		do
			use_attached_keyword := b
		ensure
			use_attached_keyword_set: use_attached_keyword = b
		end

	set_use_attached_keyword_recursive (b: BOOLEAN)
			-- Set `use_attached_keyword' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_use_attached_keyword (b)
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

	set_use_attribute_keyword_recursve (b: BOOLEAN)
			-- Set `use_attribute_keyword' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_use_attribute_keyword (b)
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

	set_use_detachable_keyword_recusive (b: BOOLEAN)
			-- Set `use_detachable_keyword' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_use_detachable_keyword (b)
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

	set_use_note_keyword_recursive (b: BOOLEAN)
			-- Set `use_note_keyword' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_use_note_keyword (b)
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

	set_use_reference_keyword_recursive (b: BOOLEAN)
			-- Set `use_reference_keyword' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_use_reference_keyword (b)
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

	set_default_keyword_usage_recursive
			-- Set default keyword usage in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_default_keyword_usage
		end

	set_providers_enabled (b: BOOLEAN)
			-- Set `providers_enabled' to `b'.
		do
			providers_enabled := b
		ensure
			providers_enabled_set: providers_enabled = b
		end

	set_providers_enabled_recursive (b: BOOLEAN)
			-- Set `providers_enabled' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_providers_enabled (b)
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

	set_cluster_dependence_enabled_recursive (b: BOOLEAN)
			-- Set `cluster_dependence_enabled' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_cluster_dependence_enabled (b)
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

	set_use_cluster_dependence_pathnames_recursive (b: BOOLEAN)
			-- Set `use_cluster_dependence_pathnames' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_use_cluster_dependence_pathnames (b)
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

	set_qualified_anchored_types_cycle_detection_enabled_recursive (b: BOOLEAN)
			-- Set `qualified_anchored_types_cycle_detection_enabled' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_qualified_anchored_types_cycle_detection_enabled (b)
		ensure
			qualified_anchored_types_cycle_detection_enabled_set: qualified_anchored_types_cycle_detection_enabled = b
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

	set_preparse_shallow_mode_recursive
			-- Set `preparse_shallow_mode' to True in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_preparse_shallow_mode
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

	set_preparse_single_mode_recursive
			-- Set `preparse_single_mode' to True in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_preparse_single_mode
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

	set_preparse_multiple_mode_recursive
			-- Set `preparse_multiple_mode' to True in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_preparse_multiple_mode
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

	set_preparse_readonly_mode_recursive (b: BOOLEAN)
			-- Set `preparse_readonly_mode' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_preparse_readonly_mode (b)
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

	set_preparse_override_mode_recursive (b: BOOLEAN)
			-- Set `preparse_override_mode' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_preparse_override_mode (b)
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

	set_flat_mode_recursive (b: BOOLEAN)
			-- Set `flat_mode' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_flat_mode (b)
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

	set_flat_dbc_mode_recursive (b: BOOLEAN)
			-- Set `flat_dbc_mode' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_flat_dbc_mode (b)
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

	set_suppliers_enabled_recursive (b: BOOLEAN)
			-- Set `suppliers_enabled' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_suppliers_enabled (b)
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

	set_unknown_builtin_reported_recursive (b: BOOLEAN)
			-- Set `unknown_builtin_reported' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_unknown_builtin_reported (b)
		ensure
			unknown_builtin_reported_set: unknown_builtin_reported = b
		end

feature -- Eiffel version

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

feature -- Eiffel version setting

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

	set_ecma_version_recursive (a_version: like ecma_version)
			-- Set `ecma_version' to `a_version' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_ecma_version (a_version)
		ensure
			ecma_version_set: ecma_version = a_version
		end

	set_ise_version (a_version: like ise_version)
			-- Set `ise_version' to `a_version'.
		do
			ise_version := a_version
			if ise_version /= Void then
				set_use_attribute_keyword (True)
				set_use_note_keyword (True)
				set_use_reference_keyword (True)
				set_use_attached_keyword (True)
				set_use_detachable_keyword (True)
			elseif ecma_version /= Void then
				set_ecma_version (ecma_version)
			else
				set_default_keyword_usage
			end
		ensure
			ise_version_set: ise_version = a_version
		end

	set_ise_version_recursive (a_version: like ise_version)
			-- Set `ise_version' to `a_version' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_ise_version (a_version)
		ensure
			ise_version_set: ise_version = a_version
		end

feature -- Access

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory

	eiffel_preparser: ET_AST_PROCESSOR
			-- Eiffel preparser

	eiffel_parser: ET_AST_PROCESSOR
			-- Eiffel parser

	dotnet_assembly_consumer: ET_DOTNET_ASSEMBLY_CONSUMER
			-- .NET assembly consumer

	master_class_checker: ET_AST_PROCESSOR
			-- Master class checker

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

	error_handler: ET_ERROR_HANDLER
			-- Error handler

feature -- Setting

	set_ast_factory (a_factory: like ast_factory)
			-- Set `ast_factory' to `a_factory'.
		require
			a_factory_not_void: a_factory /= Void
		do
			ast_factory := a_factory
		ensure
			ast_factory_set: ast_factory = a_factory
		end

	set_ast_factory_recursive (a_factory: like ast_factory)
			-- Set `ast_factory' to `a_factory' in current system processor
			-- and all other system processors in case of a multiprocessor.
		require
			a_factory_not_void: a_factory /= Void
		do
			set_ast_factory (a_factory)
		ensure
			ast_factory_set: ast_factory = a_factory
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
			dotnet_assembly_consumer := a_consumer
		ensure
			dotnet_assembly_consumer_set: dotnet_assembly_consumer = a_consumer
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
			-- Set `implementation_checker' to `a_checker'.
		require
			a_checker_not_void: a_checker /= Void
		do
			implementation_checker := a_checker
		ensure
			implementation_checker_set: implementation_checker = a_checker
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

	set_error_handler_recursive (a_handler: like error_handler)
			-- Set `error_handler' to `a_handler' in current system processor
			-- and all other system processors in case of a multiprocessor.
		require
			a_handler_not_void: a_handler /= Void
		do
			set_error_handler (a_handler)
		ensure
			error_handler_set: error_handler = a_handler
		end

feature -- Processing

	compile (a_system: ET_SYSTEM)
			-- Compile all classes reachable from the root class of `a_system'.
			-- `a_system.flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `a_system.flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		local
			l_root_class: ET_CLASS
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_6 (a_system)
			if
				not attached a_system.root_type as l_root_type or else
				l_root_type.same_named_type (a_system.none_type, tokens.unknown_class, tokens.unknown_class) or else
				l_root_type.same_named_type (a_system.any_type, tokens.unknown_class, tokens.unknown_class)
			then
				create l_classes.make (a_system.class_count_recursive)
				a_system.classes_do_recursive (agent l_classes.force_last)
				compile_classes (l_classes)
			else
				l_root_class := l_root_type.base_class
				if not l_root_class.is_preparsed then
						-- Error: unknown root class.
					error_handler.report_gvsrc4a_error (l_root_class)
				else
					create l_classes.make (a_system.class_count_recursive)
					a_system.classes_do_recursive (agent l_classes.force_last)
					l_root_class.set_marked (True)
					compile_marked_classes (l_classes)
				end
			end
			if not stop_requested then
				if dt1 /= Void then
					print_time (dt1, "All Degrees")
				end
			end
		end

	compile_all (a_system: ET_SYSTEM)
			-- Compile all classes in `a_system'.
			-- `a_system.flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `a_system.flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		local
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_6 (a_system)
			create l_classes.make (a_system.class_count_recursive)
			a_system.classes_do_recursive (agent l_classes.force_last)
			compile_classes (l_classes)
			if not stop_requested then
				if dt1 /= Void then
					print_time (dt1, "All Degrees")
				end
			end
		end

	compile_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Compile all classes in `a_classes'.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		do
			compile_degree_5 (a_classes, False)
			compile_degree_4 (a_classes)
			compile_degree_3 (a_classes)
		end

	compile_marked_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Compile marked all classes in `a_classes'.
			--
			-- Note that parsing these classes may mark other classes. Process these
			-- other classes as well until no more marked classes are not processed.
			-- Remove unmarked classes from `a_classes' when no more marked classes
			-- need to be parsed.

			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		do
			compile_degree_5 (a_classes, True)
			compile_degree_4 (a_classes)
			compile_degree_3 (a_classes)
		end

	compile_degree_6 (a_system: ET_SYSTEM)
			-- Equivalent of ISE's Degree 6 on `a_system'.
		require
			a_system_not_void: a_system /= Void
		local
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			a_system.preparse_recursive (Current)
			if dt1 /= Void then
				print_time (dt1, "Degree 6")
			end
			if metrics_shown then
				report_degree_6_metrics (a_system)
			end
		end

	compile_degree_5 (a_classes: DS_ARRAYED_LIST [ET_CLASS]; a_marked_only: BOOLEAN)
			-- Equivalent of ISE's Degree 5 on `a_classes'.
			--
			-- `a_marked_only' indicates that only classes which are marked will be processed.
			-- Note that parsing these classes may mark other classes. Process these
			-- other classes as well until no more marked classes are not processed.
			-- Remove unmarked classes from `a_classes' when no more marked classes
			-- need to be parsed.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_5_2 (a_classes, a_marked_only)
			check_provider_validity (a_classes)
			if not stop_requested then
				if dt1 /= Void then
					print_time (dt1, "Degree 5")
				end
			end
		ensure
			marked_only: a_marked_only implies a_classes.count <= old a_classes.count
			all_marked: a_marked_only implies a_classes.for_all (agent {ET_CLASS}.is_marked)
		end

	compile_degree_5_2 (a_classes: DS_ARRAYED_LIST [ET_CLASS]; a_marked_only: BOOLEAN)
			-- Equivalent of ISE's of the first phase Degree 5 on `a_classes'.
			--
			-- `a_marked_only' indicates that only classes which are marked will be processed.
			-- Note that parsing these classes may mark other classes. Process these
			-- other classes as well until no more marked classes are not processed.
			-- Remove unmarked classes from `a_classes' when no more marked classes
			-- need to be parsed.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			if a_marked_only then
				parse_marked_classes (a_classes)
				remove_unmarked_classes (a_classes)
			else
				parse_classes (a_classes)
			end
			if not stop_requested then
				set_syntax_internal_error (a_classes)
			end
			if not stop_requested then
				if dt1 /= Void then
					print_time (dt1, "Degree 5.2")
				end
				if metrics_shown then
					report_degree_5_2_metrics (a_classes)
				end
			end
		ensure
			marked_only: a_marked_only implies a_classes.count <= old a_classes.count
			all_marked: a_marked_only implies a_classes.for_all (agent {ET_CLASS}.is_marked)
		end

	compile_degree_4 (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Equivalent of ISE Eiffel's Degree 4 on `a_classes'.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			build_ancestors (a_classes)
			if not stop_requested then
				set_ancestors_internal_error (a_classes)
			end
			flatten_features (a_classes)
			if not stop_requested then
				set_flattening_internal_error (a_classes)
			end
			check_interface_validity (a_classes)
			if not stop_requested then
				set_interface_internal_error (a_classes)
			end
			if not stop_requested then
				if dt1 /= Void then
					print_time (dt1, "Degree 4")
				end
				if metrics_shown then
					report_degree_4_metrics (a_classes)
				end
			end
		end

	compile_degree_3 (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Equivalent of ISE's Degree 3 on `a_classes'.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			l_clock: detachable DT_SHARED_SYSTEM_CLOCK
			dt1: detachable DT_DATE_TIME
		do
			if benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			check_implementation_validity (a_classes)
			if not stop_requested then
				set_implementation_internal_error (a_classes)
			end
			if not stop_requested then
				if dt1 /= Void then
					print_time (dt1, "Degree 3")
				end
				if metrics_shown then
					report_degree_3_metrics (a_classes)
				end
			end
		end

	parse_system (a_system: ET_SYSTEM)
			-- Parse all classes reachable from the root class of `a_system'
			-- which have not been parsed yet.
			-- The Eiffel system needs to have been preparsed beforehand.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		local
			l_root_class: ET_CLASS
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
		do
			if
				not attached a_system.root_type as l_root_type or else
				l_root_type.same_named_type (a_system.none_type, tokens.unknown_class, tokens.unknown_class) or else
				l_root_type.same_named_type (a_system.any_type, tokens.unknown_class, tokens.unknown_class)
			then
				create l_classes.make (a_system.class_count_recursive)
				a_system.classes_do_recursive (agent l_classes.force_last)
				parse_classes (l_classes)
			else
				l_root_class := l_root_type.base_class
				if not l_root_class.is_preparsed then
						-- Error: unknown root class.
					error_handler.report_gvsrc4a_error (l_root_class)
				else
					create l_classes.make (a_system.class_count_recursive)
					a_system.classes_do_recursive (agent l_classes.force_last)
					l_root_class.set_marked (True)
					parse_marked_classes (l_classes)
				end
			end
		end

	parse_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Parse all classes in `a_classes' which have not been parsed yet.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_eiffel_parser: like eiffel_parser
		do
			reset_total_processed_class_count
			l_eiffel_parser := eiffel_parser
			from
				i := 1
				nb := a_classes.count
			until
				i > nb or stop_requested
			loop
				l_class := a_classes.item (i)
				if not l_class.is_parsed then
					l_class.process (l_eiffel_parser)
				end
				i := i + 1
			end
			reset_processed_class_count
		end

	parse_marked_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Parse all marked classes in `a_classes' which have not been parsed yet.
			-- Note that parsing these classes may mark other classes. Parse these
			-- other classes as well until no more marked classes are not parsed.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_done: BOOLEAN
			l_eiffel_parser: like eiffel_parser
		do
			reset_total_processed_class_count
			l_eiffel_parser := eiffel_parser
			from
				nb := a_classes.count
			until
				l_done
			loop
				from i := 1 until i > nb loop
					if stop_requested then
							-- Jump out of the loops.
						l_done := True
						i := nb
					else
						l_class :=  a_classes.item (i)
						if l_class.is_marked and then not l_class.is_parsed then
							l_class.process (l_eiffel_parser)
						end
					end
					i := i + 1
				end
				if not l_done then
					l_done := processed_class_count = 0
				end
				reset_processed_class_count
			end
		end

	check_provider_validity (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Check cluster dependence constraints on the classes
			-- of `a_classes' which have been parsed.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_provider_checker: like provider_checker
		do
			if cluster_dependence_enabled then
				l_provider_checker := provider_checker
				from
					i := 1
					nb := a_classes.count
				until
					i > nb or stop_requested
				loop
					l_class := a_classes.item (i)
					if l_class.is_parsed then
						l_class.process (l_provider_checker)
					end
					i := i + 1
				end
			end
		end

	build_ancestors (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Build ancestors of all classes in `a_classes' if not already done.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_eiffel_parser: like eiffel_parser
			l_ancestor_builder: like ancestor_builder
		do
			l_eiffel_parser := eiffel_parser
			eiffel_parser := tokens.null_ast_processor
			l_ancestor_builder := ancestor_builder
			from
				i := 1
				nb := a_classes.count
			until
				i > nb or stop_requested
			loop
				l_class := a_classes.item (i)
				if l_class.is_parsed and then not l_class.ancestors_built then
					l_class.process (l_ancestor_builder)
				end
				i := i + 1
			end
			eiffel_parser := l_eiffel_parser
		end

	flatten_features (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Flatten features of all classes in `a_classes' if not already done.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_eiffel_parser: like eiffel_parser
			l_ancestor_builder: like ancestor_builder
			l_feature_flattener: like feature_flattener
		do
			l_eiffel_parser := eiffel_parser
			eiffel_parser := tokens.null_ast_processor
			l_ancestor_builder := ancestor_builder
			ancestor_builder := tokens.null_ast_processor
			l_feature_flattener := feature_flattener
			from
				i := 1
				nb := a_classes.count
			until
				i > nb or stop_requested
			loop
				l_class := a_classes.item (i)
				if l_class.ancestors_built and then not l_class.features_flattened then
					l_class.process (l_feature_flattener)
				end
				i := i + 1
			end
			eiffel_parser := l_eiffel_parser
			ancestor_builder := l_ancestor_builder
		end

	check_interface_validity (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Check the interface of all classes in `a_classes' if not already done.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_eiffel_parser: like eiffel_parser
			l_ancestor_builder: like ancestor_builder
			l_feature_flattener: like feature_flattener
			l_interface_checker: like interface_checker
		do
			l_eiffel_parser := eiffel_parser
			eiffel_parser := tokens.null_ast_processor
			l_ancestor_builder := ancestor_builder
			ancestor_builder := tokens.null_ast_processor
			l_feature_flattener := feature_flattener
			feature_flattener := tokens.null_ast_processor
			l_interface_checker := interface_checker
			from
				i := 1
				nb := a_classes.count
			until
				i > nb or stop_requested
			loop
				l_class := a_classes.item (i)
				if l_class.features_flattened and then not l_class.interface_checked then
					l_class.process (l_interface_checker)
				end
				i := i + 1
			end
			eiffel_parser := l_eiffel_parser
			ancestor_builder := l_ancestor_builder
			feature_flattener := l_feature_flattener
		end

	check_implementation_validity (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Check the implementation of the features of `a_classes' if not already done.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
			l_done: BOOLEAN
			l_eiffel_parser: like eiffel_parser
			l_ancestor_builder: like ancestor_builder
			l_feature_flattener: like feature_flattener
			l_interface_checker: like interface_checker
			l_implementation_checker: like implementation_checker
		do
			l_eiffel_parser := eiffel_parser
			eiffel_parser := tokens.null_ast_processor
			l_ancestor_builder := ancestor_builder
			ancestor_builder := tokens.null_ast_processor
			l_feature_flattener := feature_flattener
			feature_flattener := tokens.null_ast_processor
			l_interface_checker := interface_checker
			interface_checker := tokens.null_ast_processor
			l_implementation_checker := implementation_checker
			reset_total_processed_class_count
			from
				nb := a_classes.count
			until
				l_done
			loop
				from i := 1 until i > nb loop
					if stop_requested then
							-- Jump out of the loops.
						l_done := True
						i := nb
					else
						l_class :=  a_classes.item (i)
						if l_class.interface_checked and then not l_class.implementation_checked then
							l_class.process (l_implementation_checker)
						end
					end
					i := i + 1
				end
				if not l_done then
					l_done := processed_class_count = 0
				end
				reset_processed_class_count
			end
			eiffel_parser := l_eiffel_parser
			ancestor_builder := l_ancestor_builder
			feature_flattener := l_feature_flattener
			interface_checker := l_interface_checker
		end

	check_master_class_validity (a_system: ET_SYSTEM)
			-- Check for invalid class name clashes and invalid class overriding in `a_system'.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		require
			a_system_not_void: a_system /= Void
		do
			a_system.master_classes_do_recursive_until (agent {ET_MASTER_CLASS}.process (master_class_checker), stop_request)
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

feature -- Stop

	stop_requested: BOOLEAN
			-- Has the interruption of the current operation
			-- been requested? The operation will therefore be
			-- interrupted at the earliest possible time.
		do
			if attached stop_request as l_stop_request then
				Result := l_stop_request.item ([])
			end
		end

	stop_request: detachable FUNCTION [BOOLEAN]
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

	set_stop_request_recursive (a_stop_request: like stop_request)
			-- Set `stop_request' to `a_stop_request' in current system processor
			-- and all other system processors in case of a multiprocessor.
		do
			set_stop_request (a_stop_request)
		ensure
			stop_request_set: stop_request = a_stop_request
		end

feature -- Metrics

	report_class_processed (a_class: ET_CLASS)
			-- report that `a_class' has been processed.
		require
			a_class_not_void: a_class /= Void
		do
			processed_class_count := processed_class_count + 1
		end

	processed_class_count: INTEGER
			-- Number of classes processed

	processed_class_count_stack: DS_ARRAYED_LIST [INTEGER]
			-- Number of classes processed, per pass

	total_processed_class_count: INTEGER
			-- Total number of processed classes recorded in `processed_class_count_stack'
		local
			i, nb: INTEGER
		do
			from
				i := 1
				nb := processed_class_count_stack.count
			until
				i > nb
			loop
				Result := Result + processed_class_count_stack.item (i)
				i := i + 1
			end
		ensure
			total_processed_class_count_not_negative: Result >= 0
		end

	reset_processed_class_count
			-- Store `processed_class_count' to `processed_class_count_stack'
			-- and reset it to 0.
		do
			processed_class_count_stack.force_last (processed_class_count)
			processed_class_count := 0
		ensure
			stored: not processed_class_count_stack.is_empty and then processed_class_count_stack.last = old processed_class_count
			reset: processed_class_count = 0
		end

	reset_total_processed_class_count
			-- Reset `processed_class_count' to 0 and
			-- wipe out `processed_class_count_stack'.
		do
			processed_class_count := 0
			processed_class_count_stack.wipe_out
		ensure
			processed_class_count_reset: processed_class_count = 0
			processed_class_count_stack_wiped_out: processed_class_count_stack.is_empty
		end

feature {ET_SYSTEM_MULTIPROCESSOR} -- Metrics

	report_processor_metrics (a_processor_id: INTEGER)
			-- Report metrics when current system processor is part of a multiprocessor.
		do
			if a_processor_id > 0 then
				error_handler.info_file.put_string ("%TProcessor #")
				error_handler.info_file.put_integer (a_processor_id)
				error_handler.info_file.put_string (": ")
			end
			error_handler.info_file.put_integer (total_processed_class_count)
			error_handler.info_file.put_string (" classes in ")
			error_handler.info_file.put_integer (processed_class_count_stack.count)
			error_handler.info_file.put_string (" pass")
			if processed_class_count_stack.count > 1 then
				error_handler.info_file.put_string ("es")
			end
			error_handler.info_file.put_string (" [")
			report_processed_class_count_stack
			error_handler.info_file.put_line ("]")
		end

feature {NONE} -- Metrics

	report_degree_6_metrics (a_system: ET_SYSTEM)
			-- Report metrics for Degree 6.
		require
			a_system_not_void: a_system /= Void
		do
			error_handler.info_file.put_string ("Preparsed ")
			error_handler.info_file.put_integer (a_system.class_count_recursive)
			error_handler.info_file.put_line (" classes")
		end

	report_degree_5_2_metrics (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Report metrics for Degree 5.2.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		do
			error_handler.info_file.put_string ("Parsed ")
			report_processor_metrics (0)
			error_handler.info_file.put_integer (feature_count (a_classes))
			error_handler.info_file.put_line (" features")
		end

	report_degree_4_metrics (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Report metrics for Degree 4.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		do
			error_handler.info_file.put_string ("Flattened ")
			error_handler.info_file.put_integer (a_classes.count)
			error_handler.info_file.put_line (" classes")
			error_handler.info_file.put_integer (feature_count (a_classes))
			error_handler.info_file.put_line (" features")
		end

	report_degree_3_metrics (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Report metrics for Degree 3.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		do
			error_handler.info_file.put_string ("Checked implementation of ")
			report_processor_metrics (0)
		end

	report_processed_class_count_stack
			-- Report the processed class counts recorded in `processed_class_count_stack'.
		local
			i, nb: INTEGER
		do
			from
				i := 1
				nb := processed_class_count_stack.count
			until
				i > nb
			loop
				if i /= 1 then
					error_handler.info_file.put_string (", ")
				end
				error_handler.info_file.put_integer (processed_class_count_stack.item (i))
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	remove_unmarked_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Remove classes from `a_classes' which are not marked.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, j, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if l_class.is_marked then
					j := j + 1
					a_classes.replace (l_class, j)
				end
				i := i + 1
			end
			a_classes.keep_first (j)
		ensure
			no_void_class: not a_classes.has_void
			classes_removed: a_classes.count <= old a_classes.count
			all_marked: a_classes.for_all (agent {ET_CLASS}.is_marked)
		end

	feature_count (a_classes: DS_ARRAYED_LIST [ET_CLASS]): INTEGER
			-- Number of features (immediate or inherited) in `a_classes'
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				Result := Result + l_class.queries.count + l_class.procedures.count
				i := i + 1
			end
		ensure
			feature_count_not_negative: Result >= 0
		end

	set_syntax_internal_error (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Set syntax error to all classes of `a_classes' which have not been parsed.
			-- Report an internal error.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if not l_class.is_parsed then
					l_class.set_syntax_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		ensure
			all_classes_parsed: a_classes.for_all (agent {ET_CLASS}.is_parsed)
		end

	set_ancestors_internal_error (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Set ancestors error to all classes of `a_classes' for which
			-- the ancestors have not been built.
			-- Report an internal error.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if not l_class.ancestors_built then
					l_class.set_ancestors_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		ensure
			all_ancestors_built: a_classes.for_all (agent {ET_CLASS}.ancestors_built)
		end

	set_flattening_internal_error (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Set flattening error to all classes of `a_classes' for which
			-- the features have not been flattened.
			-- Report an internal error.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if not l_class.features_flattened then
					l_class.set_flattening_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		ensure
			all_features_flattened: a_classes.for_all (agent {ET_CLASS}.features_flattened)
		end

	set_interface_internal_error (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Set interface error to all classes of `a_classes' for which
			-- the interface has not been checked.
			-- Report an internal error.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if not l_class.interface_checked then
					l_class.set_interface_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		ensure
			all_interface_checked: a_classes.for_all (agent {ET_CLASS}.interface_checked)
		end

	set_implementation_internal_error (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Set implementation error to all classes of `a_classes' for which
			-- the implementation has not been checked.
			-- Report an internal error.
		require
			a_classes_not_void: a_classes /= Void
			no_void_class: not a_classes.has_void
		local
			i, nb: INTEGER
			l_class: ET_CLASS
		do
			from
				i := 1
				nb := a_classes.count
			until
				i > nb
			loop
				l_class := a_classes.item (i)
				if not l_class.implementation_checked then
					l_class.set_implementation_error
					error_handler.report_giaaa_error
				end
				i := i + 1
			end
		ensure
			all_implementation_checked: a_classes.for_all (agent {ET_CLASS}.implementation_checked)
		end

invariant

	ast_factory_not_void: ast_factory /= Void
	eiffel_preparser_not_void: eiffel_preparser /= Void
	eiffel_parser_not_void: eiffel_parser /= Void
	dotnet_assembly_consumer_not_void: dotnet_assembly_consumer /= Void
	master_class_checker_not_void: master_class_checker /= Void
	provider_checker_not_void: provider_checker /= Void
	ancestor_builder_not_void: ancestor_builder /= Void
	feature_flattener_not_void: feature_flattener /= Void
	interface_checker_not_void: interface_checker /= Void
	implementation_checker_not_void: implementation_checker /= Void
	error_handler_not_void: error_handler /= Void
	processed_class_count_stack_not_void: processed_class_count_stack /= Void
	processed_class_count_not_negative: processed_class_count >= 0

end
