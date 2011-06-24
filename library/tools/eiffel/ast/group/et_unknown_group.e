note

	description:

		"Built-in groups for class *UNKNOWN*"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNKNOWN_GROUP

inherit

	ET_BUILTIN_GROUP
		redefine
			is_unknown
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new built-in group for the class "*UNKNOWN*".
		do
			name := "unknown"
		end

feature -- status report

	is_unknown: BOOLEAN = True
			-- Is current group a built-in group for class "*UNKNOWN*"?

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Is `a_class' part of current group?
		do
			Result := False
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe
		do
			Result := tokens.unknown_system
		end

feature -- Measurement

	class_count: INTEGER
			-- Number of classes which are part of current group
		do
			Result := 0
		end

feature -- Iteration

	classes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]])
			-- Apply `an_action' on all classes which are part of current group.
		do
			-- Do not perform actions on unknown classes.
		end

	classes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN])
			-- Apply `an_action' on all classes which are part of current group
			-- that satisfy `a_test'.
		do
			-- Do not perform actions on unknown classes.
		end

invariant

	is_unknown: is_unknown

end
