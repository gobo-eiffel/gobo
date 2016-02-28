note

	description:

		"Eiffel dynamic type sets pulling types from subsets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_PULL_TYPE_SET

inherit

	ET_DYNAMIC_EXTENDIBLE_TYPE_SET
		redefine
			sources, put_source
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like static_type)
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

	sources: detachable ET_DYNAMIC_ATTACHMENT
			-- Sub-sets of current set

feature -- Element change

	put_source (a_source: ET_DYNAMIC_ATTACHMENT; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_source' to current set.
			-- (Sources are subsets of current set.)
		local
			l_source_type_set: ET_DYNAMIC_TYPE_SET
		do
			if attached sources as l_sources then
				a_source.set_next_attachment (l_sources)
				sources := a_source
			else
				sources := a_source
			end
			a_source.propagate_types (Current, a_system)
			l_source_type_set := a_source.source_type_set
			if not l_source_type_set.is_never_void then
				propagate_can_be_void (l_source_type_set)
			end
		end

end
