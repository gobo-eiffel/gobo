indexing

	description:

		"Names of Eiffel prefix features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_PREFIX_NAME

inherit

	ET_PREFIX

feature {NONE} -- Initialization

	make (a_prefix: like prefix_keyword; an_operator: like operator_name) is
			-- Create a new prefix feature name.
		require
			a_prefix_not_void: a_prefix /= Void
			an_operator_not_void: an_operator /= Void
		do
			prefix_keyword := a_prefix
			operator_name := an_operator
		ensure
			prefix_keyword_set: prefix_keyword = a_prefix
			operator_name_set: operator_name = an_operator
		end

feature -- Access

	prefix_keyword: ET_TOKEN
			-- Prefix keyword

	operator_name: ET_MANIFEST_STRING
			-- Name of prefix operator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := prefix_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := operator_name.break
		end

invariant

	prefix_keyword_not_void: prefix_keyword /= Void
	operator_name_not_void: operator_name /= Void

end -- class ET_PREFIX_NAME
