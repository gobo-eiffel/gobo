note

	description:

		"ECF adapted class library lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2016, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_ADAPTED_LIBRARIES

inherit

	ET_ADAPTED_LIBRARIES
		redefine
			library,
			do_adapted,
			do_adapted_if
		end

create

	make, make_empty

feature -- Access

	library (i: INTEGER): ET_ECF_ADAPTED_LIBRARY
			-- `i'-th library
		do
			Result := libraries.item (i)
		end

feature -- Iteration

	do_adapted (an_action: PROCEDURE [ET_ADAPTED_LIBRARY])
			-- Apply `an_action' to every library, from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		local
			i, nb: INTEGER
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				an_action.call ([libraries.item (i)])
				i := i + 1
			end
		end

	do_adapted_if (an_action: PROCEDURE [ET_ADAPTED_LIBRARY]; a_test: FUNCTION [ET_ADAPTED_LIBRARY, BOOLEAN])
			-- Apply `an_action' to every library which satisfies `a_test', from first to last.
			-- (Semantics not guaranteed if `an_action' changes the list.)
		local
			i, nb: INTEGER
			l_library: ET_ECF_ADAPTED_LIBRARY
		do
			nb := libraries.count
			from i := 1 until i > nb loop
				l_library := libraries.item (i)
				if a_test.item ([l_library]) then
					an_action.call ([l_library])
				end
				i := i + 1
			end
		end

end
