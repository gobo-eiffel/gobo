note

	description:

		"Built-in groups for class NONE"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_NONE_GROUP

inherit

	ET_BUILTIN_GROUP
		redefine
			is_none
		end

create

	make

feature {NONE} -- Initialization

	make (a_universe: ET_UNIVERSE)
			-- Create a new built-in group for class "NONE".
		require
			a_universe_not_void: a_universe /= Void
		do
			name := "none"
			universe := a_universe
		ensure
			universe_set: universe = a_universe
		end

feature -- status report

	is_none: BOOLEAN = True
			-- Is current group a built-in group for class "NONE"?

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Is `a_class' part of current group?
		do
			Result := a_class.is_in_group (Current)
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Measurement

	class_count: INTEGER
			-- Number of classes which are part of current group
		do
			Result := 1
		end

feature -- Iteration

	classes_do_all (an_action: PROCEDURE [ET_CLASS])
			-- Apply `an_action' on all classes which are part of current group.
		do
			an_action.call ([universe.detachable_none_type.base_class])
		end

	classes_do_if (an_action: PROCEDURE [ET_CLASS]; a_test: FUNCTION [ET_CLASS, BOOLEAN])
			-- Apply `an_action' on all classes which are part of current group
			-- that satisfy `a_test'.
		local
			l_none_class: ET_CLASS
		do
			l_none_class := universe.detachable_none_type.base_class
			if a_test.item ([l_none_class]) then
				an_action.call ([l_none_class])
			end
		end

invariant

	is_none: is_none

end
