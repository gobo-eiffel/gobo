note

	description:

		"Eiffel system multiprocessors, using threads."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
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
			set_benchmark_shown_recursive,
			set_metrics_shown_recursive,
			set_cluster_dependence_enabled_recursive,
			set_use_cluster_dependence_pathnames_recursive,
			set_ast_factory_recursive,
			set_error_handler_recursive,
			parse_classes,
			parse_marked_classes,
			check_implementation_validity,
			set_stop_request_recursive
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

feature -- Status setting

	set_benchmark_shown_recursive (b: BOOLEAN)
			-- Set `benchmark_shown' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_benchmark_shown (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_benchmark_shown (b)
				i := i - 1
			end
		ensure then
			other_benchmark_shown_set: across other_processors as l_other_processors all l_other_processors.item.benchmark_shown = b end
		end

	set_metrics_shown_recursive (b: BOOLEAN)
			-- Set `metrics_shown' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_metrics_shown (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_metrics_shown (b)
				i := i - 1
			end
		ensure then
			other_metrics_shown_set: across other_processors as l_other_processors all l_other_processors.item.metrics_shown = b end
		end

feature -- Parser status setting

	set_cluster_dependence_enabled_recursive (b: BOOLEAN)
			-- Set `cluster_dependence_enabled' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_cluster_dependence_enabled (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_cluster_dependence_enabled (b)
				i := i - 1
			end
		ensure then
			other_cluster_dependence_enabled_set: across other_processors as l_other_processors all l_other_processors.item.cluster_dependence_enabled = b end
		end

	set_use_cluster_dependence_pathnames_recursive (b: BOOLEAN)
			-- Set `use_cluster_dependence_pathnames' to `b' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_use_cluster_dependence_pathnames (b)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_use_cluster_dependence_pathnames (b)
				i := i - 1
			end
		ensure then
			other_use_cluster_dependence_pathnames_set: across other_processors as l_other_processors all l_other_processors.item.use_cluster_dependence_pathnames = b end
		end

feature -- Access

	other_processors: DS_ARRAYED_LIST [ET_SYSTEM_PROCESSOR]
			-- Other system processors, each to be executed on its own thread

feature -- Setting

	set_ast_factory_recursive (a_factory: like ast_factory)
			-- Set `ast_factory' to `a_factory' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_ast_factory (a_factory)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_ast_factory (a_factory)
				i := i - 1
			end
		ensure then
			other_ast_factory_set: across other_processors as l_other_processors all l_other_processors.item.ast_factory = a_factory end
		end

	set_error_handler_recursive (a_handler: like error_handler)
			-- Set `error_handler' to `a_handler' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_error_handler (a_handler)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_error_handler (a_handler)
				i := i - 1
			end
		ensure then
			other_error_handler_set: across other_processors as l_other_processors all l_other_processors.item.error_handler = a_handler end
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

feature -- Stop

	set_stop_request_recursive (a_stop_request: like stop_request)
			-- Set `stop_request' to `a_stop_request' in current system processor
			-- and all other system processors in case of a multiprocessor.
		local
			i: INTEGER
		do
			set_stop_request (a_stop_request)
			from
				i := other_processors.count
			until
				i <= 0
			loop
				other_processors.item (i).set_stop_request (a_stop_request)
				i := i - 1
			end
		ensure then
			other_stop_request_set: across other_processors as l_other_processors all l_other_processors.item.stop_request = a_stop_request end
		end

invariant

	multithreaded: {PLATFORM}.is_thread_capable
	other_processors_not_void: other_processors /= Void
	no_void_processor: not other_processors.has_void

end
