﻿note

	description:

		"Objects that hold timing information about a transformation"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2008-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_TIMING

inherit

	DT_SHARED_SYSTEM_CLOCK

create

	make

feature {NONE} -- Initialization

	make
			-- Initialize `start_time'
		do
			start_time := system_clock.time_now
		end

feature -- Access

	start_time: DT_TIME
			-- Time at start of compilation

	build_start_time: detachable DT_TIME
			-- Time at start of building document

	build_finish_time: detachable DT_TIME
			-- Time at end of building document

	finish_compiling_time: detachable DT_TIME
			-- Time at end of compilation

	finish_time: detachable DT_TIME
			-- Time at ebd of transformation

	compile_time: DT_TIME_DURATION
			-- Time taken to compile stylesheet modules
		require
			finish_compiling_time_not_void: finish_compiling_time /= Void
		do
			check precondition_finish_compiling_time_not_void: attached finish_compiling_time as l_finish_compiling_time then
				Result := l_finish_compiling_time.canonical_duration (start_time)
			end
		ensure
			compile_time_not_void: Result /= Void
		end

	document_build_time: DT_TIME_DURATION
			-- Time taken to buiuld an XML document tree.
		require
			build_start_time_not_void: build_start_time /= Void
			build_finish_time_not_void: build_finish_time /= Void
		do
			check
				precondition_build_start_time_not_void: attached build_start_time as l_build_start_time
				precondition_build_finish_time_not_void: attached build_finish_time as l_build_finish_time
			then
				Result := l_build_finish_time.canonical_duration (l_build_start_time)
			end
		ensure
			document_build_time_not_void: Result /= Void
		end

	transformation_time: DT_TIME_DURATION
			-- Time taken to perform transformation
		require
			finish_compiling_time_not_void: finish_compiling_time /= Void
			finish_time_not_void: finish_time /= Void
		do
			check
				precondition_finish_compiling_time_not_void: attached finish_compiling_time as l_finish_compiling_time
				precondition_finish_time_not_void: attached finish_time as l_finish_time
			then
				if not attached build_finish_time as l_build_finish_time then
					Result := l_finish_time.canonical_duration (l_finish_compiling_time)
				else
					Result := l_finish_time.canonical_duration (l_build_finish_time)
				end
			end
		ensure
			transformation_time_not_void: Result /= Void
		end

	total_time: DT_TIME_DURATION
			-- Time taken to compile stylesheet modules and perform transformation.
		require
			finish_time_not_void: finish_time /= Void
		do
			check precondition_finish_time_not_void: attached finish_time as l_finish_time then
				Result := l_finish_time.canonical_duration (start_time)
			end
		ensure
			compile_time_not_void: Result /= Void
		end

feature -- Basic operations

	mark_compilation_finished
			-- Set `finish_compiling_time' to now.
		do
			finish_compiling_time := system_clock.time_now
		ensure
			finish_compiling_time_not_void: finish_compiling_time /= Void
		end

	mark_transformation_finished
				-- Set `finish_time' to now.
		do
			finish_time := system_clock.time_now
		ensure
			finish_time_not_void: finish_time /= Void
		end

	time_document_building
			-- Perform timing to parse an XML document and construct an XDM tree.
		do
			build_start_time := system_clock.time_now
		ensure
			build_start_time_not_void: build_start_time /= Void
		end

	mark_document_built
			-- Set `build_finish_time' to now.
		do
			build_finish_time := system_clock.time_now
		ensure
			build_finish_time_not_void: build_finish_time /= Void
		end

invariant

	start_time_not_void: start_time /= Void

end
