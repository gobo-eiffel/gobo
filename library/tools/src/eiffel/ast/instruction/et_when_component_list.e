note

	description:

		"Eiffel lists of inspect when components"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

deferred class ET_WHEN_COMPONENT_LIST

inherit

	ET_AST_NODE

feature -- Measurement

	count: INTEGER
			-- Number of actual parameters
		deferred
		ensure
			count_not_negative: Result >= 0
		end

feature -- Access

	item (i: INTEGER): ET_WHEN_COMPONENT
			-- `i'-th item in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		ensure
			item_not_void: Result /= Void
		end

end
