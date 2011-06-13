note

	description:

	"[
		Groups of Eiffel classes which primarily belong to other groups.
		Useful when grouping classes together in favorites in an IDE, e.g.
		classes from different clusters but which should be checked-in
		together in the source control repository.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_SECONDARY_GROUP

inherit

	ET_GROUP
		redefine
			is_secondary,
			as_secondary
		end

feature -- Status report

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Is `a_class' part of current group?
		require
			a_class_not_void: a_class /= Void
		deferred
		end

	is_secondary: BOOLEAN = True
			-- Is current group a secondary group?

	is_override: BOOLEAN = False
			-- Is current group an override group?
			-- In other words, do classes in this group and other override
			-- groups take precedence over classes with same names but in
			-- non-override group? (see 'override_cluster' in ISE's LACE.)

	is_read_only: BOOLEAN = True
			-- Is current group a read-only group?
			-- In other words, are changes in this group and in its classes
			-- not taken into account when repreparsing or reparsing
			-- the universe? (see 'library' in ISE's LACE.)

	is_preparsed: BOOLEAN = True
			-- Has current group already been traversed to look for its classes?

feature -- Access

	name: STRING
			-- Name

	pathname: STRING
			-- Directory pathname (may be Void)
		do
		end

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Iteration

	classes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]])
			-- Apply `an_action' on all classes which are part of current group.
		require
			an_action_not_void: an_action /= Void
		deferred
		end

	classes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN])
			-- Apply `an_action' on all classes which are part of current group
			-- that satisfy `a_test'.
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		deferred
		end

feature -- Conversion

	as_secondary: ET_SECONDARY_GROUP
			-- Current group viewed as a secondary group
		do
			Result := Current
		end

feature -- Nested

	parent: ET_GROUP
			-- Parent group
		do
			-- Result := Void
		end

end
