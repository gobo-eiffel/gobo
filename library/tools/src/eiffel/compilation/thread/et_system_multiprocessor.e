note

	description:

		"Eiffel system multiprocessors, using threads."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYSTEM_MULTIPROCESSOR

inherit

	ET_SYSTEM_PROCESSOR
		rename
			make as make_single,
			make_null as make_null_single
		redefine
			processor_count,
			set_benchmark_shown,
			set_nested_benchmark_shown,
			set_metrics_shown,
			set_use_attached_keyword,
			set_use_attribute_keyword,
			set_use_detachable_keyword,
			set_use_note_keyword,
			set_use_reference_keyword,
			set_default_keyword_usage,
			set_providers_enabled,
			set_cluster_dependence_enabled,
			set_use_cluster_dependence_pathnames,
			set_qualified_anchored_types_cycle_detection_enabled,
			set_preparse_shallow_mode,
			set_preparse_single_mode,
			set_preparse_multiple_mode,
			set_preparse_readonly_mode,
			set_preparse_override_mode,
			set_flat_mode,
			set_flat_dbc_mode,
			set_suppliers_enabled,
			set_unknown_builtin_reported,
			set_ecma_version,
			set_ise_version,
			set_ast_factory,
			set_error_handler,
			parse_classes,
			parse_marked_classes,
			check_implementation_validity,
			process_custom,
			set_stop_request,
			do_all,
			report_degree_metrics
		end

create

	make,
	make_null

feature {NONE} -- Initialization

	make (a_count: INTEGER)
			-- Create a null system mutliprocessor
			-- with `a_count' processors.
		require
			multithreaded: {PLATFORM}.is_thread_capable
			a_count_positive: a_count >= 1
		local
			i: INTEGER
		do
			create other_processors.make (a_count - 1)
			from
				i := a_count - 1
			until
				i <= 0
			loop
				other_processors.put_last (create {ET_SYSTEM_PROCESSOR}.make)
				i := i - 1
			end
			make_single
		ensure
			other_processors_count: other_processors.count = a_count - 1
		end

	make_null (a_count: INTEGER)
			-- Create a null system multiprocessor
			-- with `a_count' processors.
		require
			multithreaded: {PLATFORM}.is_thread_capable
			a_count_positive: a_count >= 1
		local
			i: INTEGER
		do
			create other_processors.make (a_count - 1)
			from
				i := a_count - 1
			until
				i <= 0
			loop
				other_processors.put_last (create {ET_SYSTEM_PROCESSOR}.make_null)
				i := i - 1
			end
			make_null_single
		ensure
			other_processors_count: other_processors.count = a_count - 1
		end

feature -- Status report

	processor_count: INTEGER
			-- Number of processors available to process
			-- Eiffel system together
		do
			Result := other_processors.count + 1
		ensure then
			multiprocessor: Result = (other_processors.count + 1)
		end

feature -- Status setting

	set_benchmark_shown (b: BOOLEAN)
			-- Set `benchmark_shown' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_benchmark_shown_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_benchmark_shown_only (b)
				i := i - 1
			end
		ensure then
			other_benchmark_shown_set: across other_processors as i_other_processor all i_other_processor.benchmark_shown = b end
		end

	set_nested_benchmark_shown (b: BOOLEAN)
			-- Set `nested_benchmark_shown' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_nested_benchmark_shown_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_nested_benchmark_shown_only (b)
				i := i - 1
			end
		ensure then
			other_nested_benchmark_shown_set: across other_processors as i_other_processor all i_other_processor.nested_benchmark_shown = b end
		end

	set_metrics_shown (b: BOOLEAN)
			-- Set `metrics_shown' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_metrics_shown_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_metrics_shown_only (b)
				i := i - 1
			end
		ensure then
			other_metrics_shown_set: across other_processors as i_other_processor all i_other_processor.metrics_shown = b end
		end

feature -- Parser status setting

	set_use_attached_keyword (b: BOOLEAN)
			-- Set `use_attached_keyword' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_use_attached_keyword_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_use_attached_keyword_only (b)
				i := i - 1
			end
		ensure then
			other_use_attached_keyword_set: across other_processors as i_other_processor all i_other_processor.use_attached_keyword = b end
		end

	set_use_attribute_keyword (b: BOOLEAN)
			-- Set `use_attribute_keyword' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_use_attribute_keyword_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_use_attribute_keyword_only (b)
				i := i - 1
			end
		ensure then
			other_use_attribute_keyword_set: across other_processors as i_other_processor all i_other_processor.use_attribute_keyword = b end
		end

	set_use_detachable_keyword (b: BOOLEAN)
			-- Set `use_detachable_keyword' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_use_detachable_keyword_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_use_detachable_keyword_only (b)
				i := i - 1
			end
		ensure then
			other_use_detachable_keyword_set: across other_processors as i_other_processor all i_other_processor.use_detachable_keyword = b end
		end

	set_use_note_keyword (b: BOOLEAN)
			-- Set `use_note_keyword' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_use_note_keyword_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_use_note_keyword_only (b)
				i := i - 1
			end
		ensure then
			other_use_note_keyword_set: across other_processors as i_other_processor all i_other_processor.use_note_keyword = b end
		end

	set_use_reference_keyword (b: BOOLEAN)
			-- Set `use_reference_keyword' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_use_reference_keyword_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_use_reference_keyword_only (b)
				i := i - 1
			end
		ensure then
			other_use_reference_keyword_set: across other_processors as i_other_processor all i_other_processor.use_reference_keyword = b end
		end

	set_default_keyword_usage
			-- Set default keyword usage in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_default_keyword_usage_only
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_default_keyword_usage_only
				i := i - 1
			end
		end

	set_providers_enabled (b: BOOLEAN)
			-- Set `providers_enabled' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_providers_enabled_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_providers_enabled_only (b)
				i := i - 1
			end
		ensure then
			other_providers_enabled_set: across other_processors as i_other_processor all i_other_processor.providers_enabled = b end
		end

	set_cluster_dependence_enabled (b: BOOLEAN)
			-- Set `cluster_dependence_enabled' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_cluster_dependence_enabled_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_cluster_dependence_enabled_only (b)
				i := i - 1
			end
		ensure then
			other_cluster_dependence_enabled_set: across other_processors as i_other_processor all i_other_processor.cluster_dependence_enabled = b end
		end

	set_use_cluster_dependence_pathnames (b: BOOLEAN)
			-- Set `use_cluster_dependence_pathnames' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_use_cluster_dependence_pathnames_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_use_cluster_dependence_pathnames_only (b)
				i := i - 1
			end
		ensure then
			other_use_cluster_dependence_pathnames_set: across other_processors as i_other_processor all i_other_processor.use_cluster_dependence_pathnames = b end
		end

	set_qualified_anchored_types_cycle_detection_enabled (b: BOOLEAN)
			-- Set `qualified_anchored_types_cycle_detection_enabled' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_qualified_anchored_types_cycle_detection_enabled_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_qualified_anchored_types_cycle_detection_enabled_only (b)
				i := i - 1
			end
		ensure then
			other_qualified_anchored_types_cycle_detection_enabled_set: across other_processors as i_other_processor all i_other_processor.qualified_anchored_types_cycle_detection_enabled = b end
		end

	set_preparse_shallow_mode
			-- Set `preparse_shallow_mode' to True in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_preparse_shallow_mode_only
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_preparse_shallow_mode_only
				i := i - 1
			end
		ensure then
			other_preparse_shallow_mode_set: across other_processors as i_other_processor all i_other_processor.preparse_shallow_mode end
			other_preparse_single_mode_unset: across other_processors as i_other_processor all not i_other_processor.preparse_single_mode end
			other_preparse_multiple_mode_unset: across other_processors as i_other_processor all not i_other_processor.preparse_multiple_mode end
		end

	set_preparse_single_mode
			-- Set `preparse_single_mode' to True in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_preparse_single_mode_only
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_preparse_single_mode_only
				i := i - 1
			end
		ensure then
			other_preparse_single_mode_set: across other_processors as i_other_processor all i_other_processor.preparse_single_mode end
			other_preparse_shallow_mode_unset: across other_processors as i_other_processor all not i_other_processor.preparse_shallow_mode end
			other_preparse_multiple_mode_unset: across other_processors as i_other_processor all not i_other_processor.preparse_multiple_mode end
		end

	set_preparse_multiple_mode
			-- Set `preparse_multiple_mode' to True in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_preparse_multiple_mode_only
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_preparse_multiple_mode_only
				i := i - 1
			end
		ensure then
			other_preparse_multiple_mode_set: across other_processors as i_other_processor all i_other_processor.preparse_multiple_mode end
			other_preparse_shallow_mode_unset: across other_processors as i_other_processor all not i_other_processor.preparse_shallow_mode end
			other_preparse_single_mode_unset: across other_processors as i_other_processor all not i_other_processor.preparse_single_mode end
		end

	set_preparse_readonly_mode (b: BOOLEAN)
			-- Set `preparse_readonly_mode' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_preparse_readonly_mode_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_preparse_readonly_mode_only (b)
				i := i - 1
			end
		ensure then
			other_preparse_readonly_mode_set: across other_processors as i_other_processor all i_other_processor.preparse_readonly_mode = b end
		end

	set_preparse_override_mode (b: BOOLEAN)
			-- Set `preparse_override_mode' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_preparse_override_mode_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_preparse_override_mode_only (b)
				i := i - 1
			end
		ensure then
			other_preparse_override_mode_set: across other_processors as i_other_processor all i_other_processor.preparse_override_mode = b end
		end

feature -- Implementation checking status setting

	set_flat_mode (b: BOOLEAN)
			-- Set `flat_mode' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_flat_mode_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_flat_mode_only (b)
				i := i - 1
			end
		ensure then
			other_flat_mode_set: across other_processors as i_other_processor all i_other_processor.flat_mode = b end
		end

	set_flat_dbc_mode (b: BOOLEAN)
			-- Set `flat_dbc_mode' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_flat_dbc_mode_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_flat_dbc_mode_only (b)
				i := i - 1
			end
		ensure then
			other_flat_dbc_mode_set: across other_processors as i_other_processor all i_other_processor.flat_dbc_mode = b end
		end

	set_suppliers_enabled (b: BOOLEAN)
			-- Set `suppliers_enabled' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_suppliers_enabled_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_suppliers_enabled_only (b)
				i := i - 1
			end
		ensure then
			other_suppliers_enabled_set: across other_processors as i_other_processor all i_other_processor.suppliers_enabled = b end
		end

	set_unknown_builtin_reported (b: BOOLEAN)
			-- Set `unknown_builtin_reported' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_unknown_builtin_reported_only (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_unknown_builtin_reported_only (b)
				i := i - 1
			end
		ensure then
			other_unknown_builtin_reported_set: across other_processors as i_other_processor all i_other_processor.unknown_builtin_reported = b end
		end

feature -- Eiffel version setting

	set_ecma_version (a_version: like ecma_version)
			-- Set `ecma_version' to `a_version' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_ecma_version_only (a_version)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_ecma_version_only (a_version)
				i := i - 1
			end
		ensure then
			other_ecma_version_set: across other_processors as i_other_processor all i_other_processor.ecma_version = a_version end
		end

	set_ise_version (a_version: like ise_version)
			-- Set `ise_version' to `a_version' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_ise_version_only (a_version)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_ise_version_only (a_version)
				i := i - 1
			end
		ensure then
			other_ise_version_set: across other_processors as i_other_processor all i_other_processor.ise_version = a_version end
		end

feature -- Access

	other_processors: DS_ARRAYED_LIST [ET_SYSTEM_PROCESSOR]
			-- Other system processors, each to be executed on its own thread

feature -- Setting

	set_ast_factory (a_factory: like ast_factory)
			-- Set `ast_factory' to `a_factory' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_ast_factory_only (a_factory)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_ast_factory_only (a_factory)
				i := i - 1
			end
		ensure then
			other_ast_factory_set: across other_processors as i_other_processor all i_other_processor.ast_factory = a_factory end
		end

	set_error_handler (a_handler: like error_handler)
			-- Set `error_handler' to `a_handler' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_error_handler_only (a_handler)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_error_handler_only (a_handler)
				i := i - 1
			end
		ensure then
			other_error_handler_set: across other_processors as i_other_processor all i_other_processor.error_handler = a_handler end
		end

feature -- Processing

	parse_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Parse all classes in `a_classes' which have not been parsed yet.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		local
			i, nb: INTEGER
			l_thread: WORKER_THREAD
		do
			from
				i := 1
				nb := other_processors.count
			until
				i > nb
			loop
				create l_thread.make (agent (other_processors.item (i)).parse_classes (a_classes))
				l_thread.launch
				i := i + 1
			end
			precursor (a_classes)
			{THREAD_CONTROL}.join_all
		end

	parse_marked_classes (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Parse al _marked classes in `a_classes' which have not been parsed yet.
			-- Note that parsing these classes may mark other classes. Parse these
			-- other classes as well until no more marked classes are not parsed.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		local
			i, nb: INTEGER
			l_thread: WORKER_THREAD
		do
			from
				i := 1
				nb := other_processors.count
			until
				i > nb
			loop
				create l_thread.make (agent (other_processors.item (i)).parse_marked_classes (a_classes))
				l_thread.launch
				i := i + 1
			end
			precursor (a_classes)
			{THREAD_CONTROL}.join_all
		end

	check_implementation_validity (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Check the implementation of the features of `a_classes'.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		local
			i, nb: INTEGER
			l_thread: WORKER_THREAD
		do
			from
				i := 1
				nb := other_processors.count
			until
				i > nb
			loop
				create l_thread.make (agent (other_processors.item (i)).check_implementation_validity (a_classes))
				l_thread.launch
				i := i + 1
			end
			precursor (a_classes)
			{THREAD_CONTROL}.join_all
		end

feature -- Custom processing

	process_custom (a_classes: DS_ARRAYED_LIST [ET_CLASS])
			-- Execute `custom_processor' on all classes in `a_classes' which have not been marked yet.
			-- Execute in several passes until no more classes have been reported as
			-- having been processed.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		local
			i, nb: INTEGER
			l_thread: WORKER_THREAD
		do
			from
				i := 1
				nb := other_processors.count
			until
				i > nb
			loop
				create l_thread.make (agent (other_processors.item (i)).process_custom (a_classes))
				l_thread.launch
				i := i + 1
			end
			precursor (a_classes)
			{THREAD_CONTROL}.join_all
		end

feature -- Stop

	set_stop_request (a_stop_request: like stop_request)
			-- Set `stop_request' to `a_stop_request' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_stop_request_only (a_stop_request)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_stop_request_only (a_stop_request)
				i := i - 1
			end
		ensure then
			other_stop_request_set: across other_processors as i_other_processor all i_other_processor.stop_request = a_stop_request end
		end

feature -- Iteration

	do_all (a_action: PROCEDURE [ET_SYSTEM_PROCESSOR])
			-- Execute `a_action' on current system processor and on
			-- all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			a_action.call ([Current])
			from
				i := other_processors.count
			until
				i <= 0
			loop
				a_action.call ([other_processors.item (i)])
				i := i - 1
			end
		end

feature {NONE} -- Metrics

	report_degree_metrics (a_classes: DS_ARRAYED_LIST [ET_CLASS]; a_degree: STRING)
			-- Report metrics for `a_degree' if current system processor
			-- was not stopped and metrics were requested
		do
			if not stop_requested and then metrics_shown then
				error_handler.info_file.put_string (a_degree)
				error_handler.info_file.put_character (' ')
				error_handler.info_file.put_integer (total_processed_class_count_recursive)
				error_handler.info_file.put_line (" classes")
				report_processor_metrics_recursive
			end
		end

	report_processor_metrics_recursive
			-- Report metrics of current system processor and all other system processors.
		local
			i, nb: INTEGER
		do
			from
				i := 1
				nb := other_processors.count
			until
				i > nb
			loop
				other_processors.item (i).report_processor_metrics (i)
				i := i + 1
			end
			report_processor_metrics (nb + 1)
		end

	total_processed_class_count_recursive: INTEGER
			-- Total number of processed classes recorded in `processed_class_count_stack'
			-- in current system processor and all other system processors.
		local
			i, nb: INTEGER
		do
			Result := total_processed_class_count
			from
				i := 1
				nb := other_processors.count
			until
				i > nb
			loop
				Result := Result + other_processors.item (i).total_processed_class_count
				i := i + 1
			end
		ensure
			total_processed_class_count_recursive_not_negative: Result >= 0
		end

invariant

	multithreaded: {PLATFORM}.is_thread_capable
	other_processors_not_void: other_processors /= Void
	no_void_processor: not other_processors.has_void

end
