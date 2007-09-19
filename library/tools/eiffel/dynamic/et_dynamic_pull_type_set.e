indexing

	description:

		"Eiffel dynamic type sets pulling types from subsets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_PULL_TYPE_SET

inherit

	ET_DYNAMIC_TYPE_SET

create

	make

feature {NONE} -- Initialization

	make (a_type: like static_type) is
			-- Create a new empty dynamic type set.
			-- Set `first_type' to `a_type' if it is expanded.
		require
			a_type_not_void: a_type /= Void
		do
			static_type := a_type
			if a_type.is_expanded then
				put_type (a_type)
			end
		ensure
			static_type_set: static_type = a_type
			first_expanded_type: a_type.is_expanded implies (count = 1 and then dynamic_type (1) = a_type)
		end

feature -- Access

	static_type: ET_DYNAMIC_TYPE
			-- Type at compilation time

	sources: ET_DYNAMIC_ATTACHMENT
			-- Sub-sets of current set

feature -- Element change

	put_target (a_target: ET_DYNAMIC_TARGET; a_system: ET_SYSTEM) is
			-- Add `a_target' to current set.
			-- (Targets are supersets of current set.)
		do
			-- Do nothing: the current kind of type set is not pushing
			-- types to targets but pulling them from sources.
		end

	put_source (a_source: ET_DYNAMIC_ATTACHMENT; a_system: ET_SYSTEM) is
			-- Add `a_source' to current set.
			-- (Sources are subsets of current set.)
		do
			if sources = Void then
				sources := a_source
			else
				a_source.set_next_attachment (sources)
				sources := a_source
			end
			a_source.propagate_types (Current, a_system)
		end

end
