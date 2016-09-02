note
	description: "[
		Objects representing delayed calls to a routine,
		with some operands possibly still open
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2015-12-16 11:42:15 -0800 (Wed, 16 Dec 2015) $"
	revision: "$Revision: 98274 $"

deferred class
	ROUTINE [OPEN_ARGS -> detachable TUPLE create default_create end]

inherit
	HASHABLE

	REFLECTOR
		export
			{NONE} all
		end

feature -- Access

	target: detachable ANY
			-- Target of call, if already known
		local
			c: like closed_operands
		do
			if is_target_closed then
				c := closed_operands
				if c /= Void and then c.count > 0 and then attached {ANY} c.item (1) as r then
					Result := r
				end
			end
		end

	hash_code: INTEGER
			-- Hash code value.
		do
			Result := 1
		end

	precondition (args: detachable OPEN_ARGS): BOOLEAN
			-- Do `args' satisfy routine's precondition
			-- in current state?
		do
			Result := True
			--| FIXME compiler support needed!
		end

	postcondition (args: detachable OPEN_ARGS): BOOLEAN
			-- Does current state satisfy routine's
			-- postcondition for `args'?
		do
			Result := True
			--| FIXME compiler support needed!
		end

	empty_operands: attached OPEN_ARGS
			-- Empty tuple matching open operands.
		obsolete "This function will be removed as non-void-safe. [22.07.2013]"
		do
			create Result
		ensure
			empty_operands_not_void: Result /= Void
		end

feature -- Status report

	callable: BOOLEAN = True
			-- Can routine be called on current object?

	valid_operands (args: detachable separate TUPLE): BOOLEAN
			-- Are `args' valid operands for this routine?
		local
			l_expected_args: attached OPEN_ARGS
			i, nb: INTEGER
			l_arg_type_code: INTEGER
			l_arg: detachable ANY
		do
			create l_expected_args
			if args = Void then
					-- Void operands are only allowed
					-- if object has no open operands.
				Result := l_expected_args.count = 0
			elseif args.count >= l_expected_args.count then
				Result := True
				nb := l_expected_args.count
				from i := 1 until i > nb loop
					l_arg_type_code := args.item_code (i)
					if l_arg_type_code = l_expected_args.item_code (i) then
						if l_arg_type_code = {TUPLE}.reference_code then
							l_arg := args.item (i)
							if l_arg /= Void and then not l_arg.generating_type.conforms_to (l_expected_args.generating_type.generic_parameter_type (i)) then
								Result := False
								i := nb + 1
							end
						end
						i := i + 1
					else
						Result := False
						i := nb + 1
					end
				end
			end
		end

	is_target_closed: BOOLEAN
			-- Is target for current agent closed, i.e. specified at creation time?

feature -- Setting

	set_target (a_target: like target)
			-- Set `a_target' as the next `target' for remaining calls to Current.
		require
			a_target_not_void: a_target /= Void
			is_target_closed: is_target_closed
			target_not_void: target /= Void
			same_target_type: attached target as t and then t.same_type (a_target)
		local
			c: like closed_operands
		do
			c := closed_operands
			if c /= Void then
				c.put (a_target, 1)
			end
		ensure
			target_set: target = a_target
		end

feature -- Basic operations

	call (args: detachable separate OPEN_ARGS)
			-- Call routine with `args'.
		require
			valid_operands: valid_operands (args)
		deferred
		end

	apply
			-- Call routine with `operands' as last set.
		require
			valid_operands: valid_operands (operands)
		deferred
		end

feature -- Extended operations

	flexible_call (a: detachable separate TUPLE)
			-- Call routine with arguments `a'.
			-- Compared to `call' the type of `a' may be different from `{OPEN_ARGS}'.
		require
			valid_operands: valid_operands (a)
		local
			default_arguments: detachable OPEN_ARGS
		do
			if not attached a then
				call (default_arguments)
			else
				check
					from_precondition: attached {OPEN_ARGS} new_tuple_from_tuple (({OPEN_ARGS}).type_id, a) as x
				then
					call (x)
				end
			end
		end

feature -- Obsolete

	adapt_from (other: like Current)
			-- Adapt from `other'. Useful in descendants.
		obsolete
			"Please use `adapt' instead (it's also a creation procedure)"
		require
			other_exists: other /= Void
			conforming: conforms_to (other)
		do
			adapt (other)
		end

feature {ROUTINE} -- Implementation

	frozen closed_operands: detachable TUPLE
			-- All closed arguments provided at creation time

	closed_count: INTEGER
			-- The number of closed operands (including the target if it is closed)
		local
			c: detachable TUPLE
		do
			c := closed_operands
			if c /= Void then
				Result := c.count
			end
		end

note
	copyright: "Copyright (c) 1984-2015, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
