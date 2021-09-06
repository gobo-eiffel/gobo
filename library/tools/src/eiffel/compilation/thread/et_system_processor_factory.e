note

	description:

		"Factories for Eiffel system processors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYSTEM_PROCESSOR_FACTORY

feature -- Access

	new_system_processor (a_thread_count: INTEGER): ET_SYSTEM_PROCESSOR
			-- New Eiffel system processor optimized to run
			-- on machines with `a_thread_count' available CPUs
		require
			a_thread_count_not_negative: a_thread_count >= 0
		do
			if a_thread_count > 1 and {PLATFORM}.is_thread_capable then
				create {ET_SYSTEM_MULTIPROCESSOR} Result.make (a_thread_count)
			else
				create Result.make
			end
		ensure
			instance_free: class
			new_system_processor_not_void: Result /= Void
		end

end
