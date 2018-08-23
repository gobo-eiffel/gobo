note

	description:

		"Eiffel system class markers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: $"

class ET_SYSTEM_CLASS_MARKER

inherit

	ET_PROVIDER_PROCESSOR

create

	make

feature -- Processing

	mark_system (a_class: ET_CLASS)
			-- Identify the classes that `a_class' recursively depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Mark `a_class' as well.
		require
			a_class_not_void: a_class /= Void
		do
			unmark_all (a_class.current_system)
			mark_system_no_unmark (a_class)
		ensure
			a_class_marked: a_class.is_marked
		end

	mark_system_no_unmark (a_class: ET_CLASS)
			-- Identify the classes that `a_class' recursively depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Mark `a_class' as well. (Do not call `unmark_all'
			-- before marking the classes.)
		require
			a_class_not_void: a_class /= Void
		do
			is_recursive := True
			a_class.set_marked (True)
			process_class (a_class)
		ensure
			a_class_marked: a_class.is_marked
		end

	mark_shallow (a_class: ET_CLASS)
			-- Identify the classes that `a_class' directly depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Do not mark `a_class' if it does not
			-- directly depend on itself.
		require
			a_class_not_void: a_class /= Void
		do
			unmark_all (a_class.current_system)
			mark_shallow_no_unmark (a_class)
		end

	mark_shallow_no_unmark (a_class: ET_CLASS)
			-- Identify the classes that `a_class' directly depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Do not mark `a_class' if it does not
			-- directly depend on itself. (Do not call `unmark_all'
			-- before marking the classes.)
		require
			a_class_not_void: a_class /= Void
		do
			is_recursive := False
			process_class (a_class)
		end

	unmark_all (a_system: ET_SYSTEM)
			-- Unmark all classes of `a_system' as if none of them
			-- was in the system.
		require
			a_system_not_void: a_system /= Void
		do
			a_system.classes_do_recursive (agent {ET_CLASS}.set_marked (False))
		end

feature {NONE} -- Processing

	process_provider (a_provider: ET_CLASS)
			-- Mark `a_provider' if not already done.
		do
			if not a_provider.is_marked then
				a_provider.set_marked (True)
				if is_recursive then
					process_class (a_provider)
				end
			end
		ensure then
			a_provider_marked: a_provider.is_marked
		end

feature {NONE} -- Implementation

	is_recursive: BOOLEAN
			-- Is the processing recursive?

end
