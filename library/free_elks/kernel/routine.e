note
	description: "[
		Objects representing delayed calls to a routine,
		with some operands possibly still open
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ROUTINE [BASE_TYPE, OPEN_ARGS -> detachable TUPLE create default_create end]

inherit
	HASHABLE

feature -- Access

	target: detachable ANY
			-- Target of call, if already known
		local
			c: like closed_operands
		do
			if is_target_closed then
				c := closed_operands
				if c /= Void and then c.count > 0 then
					Result := c.item (1)
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
			-- Empty tuple matching open operands
		do
			create Result
		ensure
			empty_operands_not_void: Result /= Void
		end

feature -- Status report

	callable: BOOLEAN = True
			-- Can routine be called on current object?

	valid_operands (args: detachable TUPLE): BOOLEAN
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
							if l_arg /= Void and then not l_arg.generating_type.conforms_to (l_expected_args.generating_type.generic_parameter (i)) then
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

	call (args: detachable OPEN_ARGS)
			-- Call routine with `args'.
		require
			valid_operands: valid_operands (args)
		deferred
		end

feature {ROUTINE} -- Implementation

	frozen closed_operands: detachable TUPLE
			-- All closed arguments provided at creation time

end
