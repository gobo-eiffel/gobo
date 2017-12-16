note

	description:

		"Eiffel system class markers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYSTEM_MARKER

inherit

	ET_SYSTEM_CLASS_MARKER
		rename
			make as make_system_class_marker,
			unmark_all as system_class_marker_unmark_all
		redefine
			mark_system,
			mark_shallow
		end


create

	make

feature {NONE} -- Initialization

	make (a_system: ET_SYSTEM)
			-- Create a new system marker for `a_system'.
		require
			a_system_not_void: a_system /= Void
		do
			current_system := a_system
			make_system_class_marker
		ensure
			current_system_set: current_system = a_system
		end

feature -- Access

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system
			-- (Note: there is a frozen feature called `system' in
			-- class GENERAL of SmartEiffel 1.0)

feature -- Processing

	mark_system (a_class: ET_CLASS)
			-- Identify the classes that `a_class' recursively depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Mark `a_class' as well.
		do
			unmark_all
			mark_system_no_unmark (a_class)
		end

	mark_shallow (a_class: ET_CLASS)
			-- Identify the classes that `a_class' directly depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Do not mark `a_class' if it does not
			-- directly depend on itself.
		do
			unmark_all
			mark_shallow_no_unmark (a_class)
		end

	unmark_all
			-- Unmark all classes of `current_system' as if none of them
			-- was in the system.
		do
			system_class_marker_unmark_all (current_system)
		end

invariant

	current_system_not_void: current_system /= Void

end
