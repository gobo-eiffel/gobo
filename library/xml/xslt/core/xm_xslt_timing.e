indexing

	description:

		"Objects that hold timing information about a transformation"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2008, Colin Adams and others"
	license: "MIT License"
	date: "$Date:  $"
	revision: "$Revision:  $"

class XM_XSLT_TIMING

inherit

	DT_SHARED_SYSTEM_CLOCK

create

	make

feature {NONE} -- Initialization

	make is
			-- Initialize `start_time'
		do
			start_time := system_clock.time_now
		end
	
feature -- Access

	start_time: DT_TIME
			-- Time at start of compilation
	
	build_start_time: DT_TIME
			-- Time at start of building document

	build_finish_time: DT_TIME
			-- Time at end of building document

	finish_compiling_time: DT_TIME
			-- Time at end of compilation

	finish_time: DT_TIME
			-- Time at ebd of transformation

	compile_time: DT_TIME_DURATION is
			-- Time taken to compile stylesheet modules
		require
			finish_compiling_time_not_void: finish_compiling_time /= Void
		do
			Result := finish_compiling_time.canonical_duration (start_time)
		ensure
			compile_time_not_void: Result /= Void
		end
		
	document_build_time: DT_TIME_DURATION is
			-- Time taken to buiuld an XML document tree.
		require
			build_start_time_not_void: build_start_time /= Void
			build_finish_time_not_void: build_finish_time /= Void
		do
			Result := build_finish_time.canonical_duration (build_start_time)
		ensure
			document_build_time_not_void: Result /= Void
		end

	transformation_time: DT_TIME_DURATION is
			-- Time taken to perform transformation
		require
			finish_compiling_time_not_void: finish_compiling_time /= Void
			finish_time_not_void: finish_time /= Void			
		do
			if build_finish_time = Void then
				Result := finish_time.canonical_duration (finish_compiling_time)
			else
				Result := finish_time.canonical_duration (build_finish_time)
			end
		ensure
			transformation_time_not_void: Result /= Void
		end

	total_time: DT_TIME_DURATION is
			-- Time taken to compile stylesheet modules and perform transformation.
		require
			finish_time_not_void: finish_time /= Void			
		do
			Result := finish_time.canonical_duration (start_time)
		ensure
			compile_time_not_void: Result /= Void
		end
	
feature -- Basic operations

	mark_compilation_finished is
			-- Set `finish_compiling_time' to now.
		do
			finish_compiling_time := system_clock.time_now
		ensure
			finish_compiling_time_not_void: finish_compiling_time /= Void
		end
	
	mark_transformation_finished is
				-- Set `finish_time' to now.
		do
			finish_time := system_clock.time_now
		ensure
			finish_time_not_void: finish_time /= Void
		end
	
	time_document_building is
			-- Perform timing to parse an XML document and construct an XDM tree.
		do
			build_start_time := system_clock.time_now
		ensure
			build_start_time_not_void: build_start_time /= Void
		end
	
	mark_document_built is
			-- Set `build_finish_time' to now.
		do
			build_finish_time := system_clock.time_now
		ensure
			build_finish_time_not_void: build_finish_time /= Void
		end

invariant

	start_time_not_void: start_time /= Void

end
