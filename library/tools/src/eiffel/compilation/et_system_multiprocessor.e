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
			compile_degree_5_2,
			compile_degree_3,
			is_degree_6_required
		end

create

	make,
	make_null

feature {NONE} -- Initialization

	make (a_count: INTEGER)
			-- Create a null system mutliprocessor
			-- with `a_count' processors.
		require
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

feature -- Access

	other_processors: DS_ARRAYED_LIST [ET_SYSTEM_PROCESSOR]
			-- Other system processors, each to be executed on its own thread

feature -- Setting

	set_all_error_handler (a_handler: like error_handler)
			-- Set `error_handler' of all system processors to `a_handler'.
		require
			a_handler_not_void: a_handler /= Void
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
		ensure
			error_handler_set: error_handler = a_handler
			other_error_handler_set: across other_processors as l_other_processors all l_other_processors.item.error_handler = a_handler end
		end

feature -- Processing

	compile_degree_5_2 (a_system: ET_SYSTEM)
			-- Parse classes of `a_system'.
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
				create l_thread.make (agent (other_processors.item (i)).compile_degree_5_2 (a_system))
				l_thread.launch
				i := i + 1
			end
			precursor (a_system)
			{THREAD_CONTROL}.join_all
		end

	compile_degree_3 (a_system: ET_SYSTEM)
			-- Equivalent of ISE Eiffel's Degree 3 on `a_system'.
			-- `a_system.flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `a_system.flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted a system processor
			-- if it receives a stop request, i.e. its `stop_request' starts
			-- returning True. No interruption if `stop_request' is Void. Make
			-- sure that each system processor have the same `stop_request' to
			-- have the operation interrupted on all systen processors.
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
				create l_thread.make (agent (other_processors.item (i)).compile_degree_3 (a_system))
				l_thread.launch
				i := i + 1
			end
			precursor (a_system)
			{THREAD_CONTROL}.join_all
		end

feature {NONE} -- Implementation

	is_degree_6_required (a_system: ET_SYSTEM): BOOLEAN
			-- Should Degree 6 be done on `a_system' even when parsing all classes?
		do
			Result := True
		end

invariant

	other_processors_not_void: other_processors /= Void
	no_void_processor: not other_processors.has_void

end
