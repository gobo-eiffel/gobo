note

	description:

		"Built-in groups for class *ROOT*"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_ROOT_GROUP

inherit

	ET_BUILTIN_GROUP
		redefine
			is_root
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system: ET_SYSTEM)
			-- Create a new built-in group for the class "*ROOT*".
		require
			a_system_not_void: a_system /= Void
		do
			universe := a_system
			name := "root"
		ensure
			universe_set: universe = a_system
		end

feature -- status report

	is_root: BOOLEAN = True
			-- Is current group a built-in group for class "*ROOT*"?

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Is `a_class' part of current group?
		do
			Result := False
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Measurement

	class_count: INTEGER
			-- Number of classes which are part of current group
		do
			Result := 0
		end

feature -- Iteration

	classes_do_all (an_action: PROCEDURE [ET_CLASS])
			-- Apply `an_action' on all classes which are part of current group.
		do
			-- Do not perform actions on root classes.
		end

	classes_do_if (an_action: PROCEDURE [ET_CLASS]; a_test: FUNCTION [ET_CLASS, BOOLEAN])
			-- Apply `an_action' on all classes which are part of current group
			-- that satisfy `a_test'.
		do
			-- Do not perform actions on root classes.
		end

invariant

	is_root: is_root

end
