indexing

	description:

		"Names of Eiffel infix 'free-operator' features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_FREE_NAME

inherit

	ET_INFIX_FREE

	ET_INFIX_NAME
		rename
			make as make_infix_name
		undefine
			is_infix_free
		end

creation

	make

feature {NONE} -- Initialization

	make (an_infix: like infix_keyword; an_operator: like operator_name) is
			-- Create a new infix 'free-operator'.
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
			an_operator_computed: an_operator.computed
			an_operator_not_empty: an_operator.value.count > 0
		do
			infix_keyword := an_infix
			operator_name := an_operator
		ensure
			infix_keyword_set: infix_keyword = an_infix
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
