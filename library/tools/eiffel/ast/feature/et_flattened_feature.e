indexing

	description:

		"Eiffel flattened features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FLATTENED_FEATURE

inherit

	ET_FEATURE


feature -- Status report

	is_flattened: BOOLEAN is True
			-- Is current feature flattened?

	is_redeclared: BOOLEAN is False
			-- Is current feature being redeclared?

feature -- Access

	flattened_feature: ET_FLATTENED_FEATURE is
			-- Feature resulting after feature adaptation
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	precursor_feature: ET_FLATTENED_FEATURE is
			-- Feature inherited from `parent'
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	adapted_feature: ET_INHERITED_FEATURE is
			-- Version of current feature where none of its
			-- inherited components are flattened
		do
			Result := inherited_feature
		end

invariant

	is_flattened: is_flattened
	not_redeclared: not is_redeclared

end
