indexing

	description:

		"Names of Eiffel prefix 'free-operator' features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_FREE_NAME

inherit

	ET_PREFIX_FREE

	ET_PREFIX_NAME
		rename
			make as make_prefix_name
		undefine
			is_prefix_free
		end

creation

	make

feature {NONE} -- Initialization

	make (a_prefix: like prefix_keyword; an_operator: like operator_name) is
			-- Create a new prefix 'free-operator'.
		require
			a_prefix_not_void: a_prefix /= Void
			an_operator_not_void: an_operator /= Void
			an_operator_computed: an_operator.computed
			an_operator_not_empty: an_operator.value.count > 0
		do
			prefix_keyword := a_prefix
			operator_name := an_operator
		ensure
			prefix_keyword_set: prefix_keyword = a_prefix
			operator_name_set: operator_name = an_operator
		end

feature -- Access

	free_operator_name: STRING is
			-- Name of free operator
		do
			Result := operator_name.value
		end

invariant

	operator_name_computed: operator_name.computed
	operator_name_not_empty: operator_name.value.count > 0

end
