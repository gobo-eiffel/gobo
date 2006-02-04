indexing

	description: "[
		Objects that are able to iterate over traversable structures,
		on which they can perform repeated actions and tests according
		to a number of predefined control structures such as ``if'',
		``until'' and others.
		]"

	status: "See notice at end of class"
	names: iterators, iteration;
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ITERATOR [G]
	
feature -- Initialization

	set (s: like target) is
			-- Make `s' the new target of iterations.
		require
			target_exists: s /= Void
		do
			target := s
		ensure
			target = s
			target /= Void
		end

feature -- Access

	target: TRAVERSABLE [G]
			-- The structure to which iteration features will apply

feature -- Status report

	invariant_value: BOOLEAN is
			-- Is the invariant satisfied?
			-- (Redefinitions of this feature will usually involve
			-- `target'; if so, make sure that the result is defined
			-- when `target = Void'.)
		do
			Result := True
		end

feature -- Iteration

	do_all (action: PROCEDURE [ANY, TUPLE [G]]) is
			-- Apply `action' to every item of `target'.
		require
			action_exists: action /= Void
		do
			target.do_all (action)
		end

	do_if (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' satisfying `test'.
		require
			action_exists: action /= Void
			test_exists: test /= Void
		do
			target.do_if (action, test)
		end

	do_until (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' up to
			-- and including first one satisfying `test'.
			-- (Apply to full list if no item satisfies `test').
		require
			action_exists: action /= Void
			test_exists: test /= Void
		deferred
		end

	do_while (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' up to
			-- and including first one not satisfying `test'.
			-- (Apply to full list if all items satisfy `test').
		require
			action_exists: action /= Void
			test_exists: test /= Void
		deferred
		end

	until_do (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' up to
			-- but excluding first one satisfying `test'.
			-- (Apply to full list if no items satisfy `test'.)
		require
			action_exists: action /= Void
			test_exists: test /= Void
		deferred
		end

	while_do (action: PROCEDURE [ANY, TUPLE [G]]; test: FUNCTION [ANY, TUPLE [G], BOOLEAN]) is
			-- Apply `action' to every item of `target' up to
			-- but excluding first one satisfying not `test'.
			-- (Apply to full list if all items satisfy `test'.)
		require
			action_exists: action /= Void
			test_exists: test /= Void
		deferred
		end

	there_exists (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Is `test' true for at least one item of `target'?
		require
			test_exists: test /= Void
		deferred
		end
		
	for_all (test: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN is
			-- Is `test' true for all items of `target'?
		require
			test_exists: test /= Void
		deferred
		end
		
invariant

	traversable_exists: target /= Void

indexing

	library: "[
			EiffelBase: Library of reusable components for Eiffel.
			]"

	status: "[
			Copyright 1986-2001 Interactive Software Engineering (ISE).
			For ISE customers the original versions are an ISE product
			covered by the ISE Eiffel license and support agreements.
			]"

	license: "[
			EiffelBase may now be used by anyone as FREE SOFTWARE to
			develop any product, public-domain or commercial, without
			payment to ISE, under the terms of the ISE Free Eiffel Library
			License (IFELL) at http://eiffel.com/products/base/license.html.
			]"

	source: "[
			Interactive Software Engineering Inc.
			ISE Building
			360 Storke Road, Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Electronic mail <info@eiffel.com>
			Customer support http://support.eiffel.com
			]"

	info: "[
			For latest info see award-winning pages: http://eiffel.com
			]"

end -- class ITERATOR
