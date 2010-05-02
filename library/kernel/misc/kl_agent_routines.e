note

	description:

		"Routines that ought to be in agent classes."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_AGENT_ROUTINES [G]

feature -- Action

	call (v: G; a_action: PROCEDURE [ANY, TUPLE])
			-- Execute `a_action'.
			--
			-- Note: Useful when we want to pass it as an agent which
			-- requires an open operand of type G that is not required
			-- by `a_action'.
		require
			a_action_not_void: a_action /= Void
		do
			a_action.call ([])
		end

feature -- Boolean operations

	negated (v: G; a_boolean: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Negation
		require
			a_boolean_not_void: a_boolean /= Void
		do
			Result := not a_boolean.item ([v])
		end

	conjuncted (v: G; a_left, a_right: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Boolean conjunction
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			Result := a_left.item ([v]) and a_right.item ([v])
		end

	conjuncted_semistrict (v: G; a_left, a_right: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Boolean semi-strict conjunction
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			Result := a_left.item ([v]) and then a_right.item ([v])
		end

	disjuncted (v: G; a_left, a_right: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Boolean disjunction
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			Result := a_left.item ([v]) or a_right.item ([v])
		end

	disjuncted_semistrict (v: G; a_left, a_right: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Boolean semi-strict disjunction
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			Result := a_left.item ([v]) or else a_right.item ([v])
		end

	disjuncted_exclusive (v: G; a_left, a_right: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Boolean exclusive disjunction
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			Result := a_left.item ([v]) xor a_right.item ([v])
		end

	implication (v: G; a_left, a_right: FUNCTION [ANY, TUPLE [G], BOOLEAN]): BOOLEAN
			-- Boolean implication
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			Result := a_left.item ([v]) implies a_right.item ([v])
		end

end
