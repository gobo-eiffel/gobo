note

	description:

	"[
		Secondary groups of Eiffel classes which can be customized by adding
		or removing classes.
		Useful when grouping classes together in favorites in an IDE, e.g.
		classes from different clusters but which should be checked-in
		together in the source control repository.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CUSTOMIZABLE_GROUP

inherit

	ET_SECONDARY_GROUP

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_universe: ET_UNIVERSE)
			-- Create a new customized group.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_universe_not_void: a_universe /= Void
		do
			name := a_name
			universe := a_universe
			create classes.make (initial_classes_capacity)
		ensure
			name_set: name = a_name
			universe_set: universe = a_universe
		end

feature -- Status report

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Is `a_class' part of current group?
		do
			Result := classes.has (a_class)
		end

feature -- Access

	classes: DS_HASH_SET [ET_CLASS]
			-- Classes being part of current group

feature -- Measurement

	class_count: INTEGER
			-- Number of classes which are part of current group
		do
			Result := classes.count
		end

feature -- Iteration

	classes_do_all (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]])
			-- Apply `an_action' on all classes which are part of current group.
		do
			classes.do_all (an_action)
		end

	classes_do_if (an_action: PROCEDURE [ANY, TUPLE [ET_CLASS]]; a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN])
			-- Apply `an_action' on all classes which are part of current group
			-- that satisfy `a_test'.
		do
			classes.do_if (an_action, a_test)
		end

feature -- Basic operations

	add_class (a_class: ET_CLASS)
			-- Add `a_class' to current group.
		require
			a_class_not_void: a_class /= Void
		do
			classes.force_last (a_class)
		ensure
			class_added: has_class (a_class)
		end

	remove_class (a_class: ET_CLASS)
			-- Remove `a_class' from current group.
		require
			a_class_not_void: a_class /= Void
		do
			classes.remove (a_class)
		ensure
			class_removed: not has_class (a_class)
		end

feature {NONE} -- Constants

	initial_classes_capacity: INTEGER = 50
			-- Initial capacity for `classes'

invariant

	classes_not_void: classes /= Void
	no_void_class: not classes.has_void

end
