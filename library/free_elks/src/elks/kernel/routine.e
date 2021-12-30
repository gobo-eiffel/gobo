note
	description: "[
		Objects representing delayed calls to a routine,
		with some operands possibly still open
	]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ROUTINE [OPEN_ARGS -> detachable TUPLE create default_create end]

inherit
	HASHABLE
		redefine
			copy,
			is_equal
		end

	MISMATCH_CORRECTOR
		redefine
			correct_mismatch,
			copy,
			is_equal
		end

inherit {NONE}

	REFLECTOR
		export
			{NONE} all
		redefine
			copy,
			is_equal
		end

feature -- Initialization

	adapt (other: like Current)
			-- Initialize from `other'.
			-- Useful in descendants.
		require
			other_exists: other /= Void
			conforming: conforms_to (other)
		do
			rout_disp := other.rout_disp
			encaps_rout_disp := other.encaps_rout_disp
			calc_rout_addr := other.calc_rout_addr
			closed_operands := other.closed_operands
			operands := other.operands
			routine_id := other.routine_id
			is_basic := other.is_basic
			is_target_closed := other.is_target_closed
			written_type_id_inline_agent := other.written_type_id_inline_agent
			open_count := other.open_count
		end

feature -- Access

	frozen operands: detachable OPEN_ARGS

	target: detachable ANY
			-- Target of call, if already known
		local
			c: like closed_operands
		do
				-- Because a target object is never separate relative to the routine object,
				-- the first argument is checked against {ANY} rather than {separate ANY}.
			if is_target_closed then
				c := closed_operands
				if c /= Void and then c.count > 0 and then attached {ANY} c.item (1) as r then
					Result := r
				end
			elseif attached {TUPLE} operands as o and then o.count > 0 and then attached {ANY} o.item (1) as r then
				Result := r
			end
		end

	hash_code: INTEGER
			-- Hash code value.
		do
			Result := rout_disp.hash_code.bit_xor (routine_id.hash_code)
		end

	precondition (args: like operands): BOOLEAN
			-- Do `args' satisfy routine's precondition
			-- in current state?
		do
			Result := True
			--| FIXME compiler support needed!
		end

	postcondition (args: like operands): BOOLEAN
			-- Does current state satisfy routine's
			-- postcondition for `args'?
		do
			Result := True
			--| FIXME compiler support needed!
		end

	empty_operands: attached OPEN_ARGS
			-- Empty tuple matching open operands.
		obsolete "This function will be removed as non-void-safe. [2017-05-31]"
		do
			create Result
		ensure
			empty_operands_not_void: Result /= Void
		end

feature -- Status report

	callable: BOOLEAN = True
			-- Can routine be called on current object?

	is_equal (other: like Current): BOOLEAN
			-- Is associated routine the same as the one
			-- associated with `other'.
		do
			--| Do not compare implementation data
			Result := closed_operands ~ other.closed_operands
				and then operands ~ other.operands
				and then open_map ~ other.open_map
				and then (rout_disp = other.rout_disp)
				and then (routine_id = other.routine_id)
				and then (written_type_id_inline_agent = other.written_type_id_inline_agent)
				and then (encaps_rout_disp = other.encaps_rout_disp)
				and then (calc_rout_addr = other.calc_rout_addr)
		end

	valid_operands (args: detachable separate TUPLE): BOOLEAN
			-- Are `args' valid operands for this routine?
		local
			i, arg_type_code: INTEGER
			arg: like {TUPLE}.item
			l_type: INTEGER
		do
			if args = Void then
					-- Void operands are only allowed
					-- if object has no open operands.
				Result := open_count = 0
			elseif args.count >= open_count then
				from
					Result := True
					i := 1
				until
					i > open_count or not Result
				loop
					arg_type_code := args.item_code (i)
					l_type := open_operand_type (i)
					inspect arg_type_code
					when {TUPLE}.boolean_code then
						Result := l_type = ({BOOLEAN}).type_id
					when {TUPLE}.character_8_code then
						Result := l_type = ({CHARACTER_8}).type_id
					when {TUPLE}.character_32_code then
						Result := l_type = ({CHARACTER_32}).type_id
					when {TUPLE}.integer_8_code then
						Result := l_type = ({INTEGER_8}).type_id
					when {TUPLE}.integer_16_code then
						Result := l_type = ({INTEGER_16}).type_id
					when {TUPLE}.integer_32_code then
						Result := l_type = ({INTEGER_32}).type_id
					when {TUPLE}.integer_64_code then
						Result := l_type = ({INTEGER_64}).type_id
					when {TUPLE}.natural_8_code then
						Result := l_type = ({NATURAL_8}).type_id
					when {TUPLE}.natural_16_code then
						Result := l_type = ({NATURAL_16}).type_id
					when {TUPLE}.natural_32_code then
						Result := l_type = ({NATURAL_32}).type_id
					when {TUPLE}.natural_64_code then
						Result := l_type = ({NATURAL_64}).type_id
					when {TUPLE}.pointer_code then
						Result := l_type = ({POINTER}).type_id
					when {TUPLE}.real_32_code then
						Result := l_type = ({REAL_32}).type_id
					when {TUPLE}.real_64_code then
						Result := l_type = ({REAL_64}).type_id
					when {TUPLE}.reference_code then
						arg := args.item (i)
							-- If expected type is attached, then we need to verify that the actual
							-- is indeed attached.
						if is_attached_type (l_type) then
							Result := arg /= Void and then
								field_conforms_to ({ISE_RUNTIME}.dynamic_type (arg), l_type)
						else
							Result := arg = Void or else
								field_conforms_to ({ISE_RUNTIME}.dynamic_type (arg), l_type)
						end
					else
						Result := False
					end
					i := i + 1
				end
			end
			if Result and then not is_target_closed then
				Result := args /= Void and then not args.is_empty and then args.item (1) /= Void
			end
		end

	valid_target (args: detachable TUPLE): BOOLEAN
			-- Is the first element of tuple `args' a valid target
		do
			if args /= Void and then args.count > 0 then
				if args.is_reference_item (1) then
					Result := args.reference_item (1) /= Void
				else
					Result := True
				end
			end
		end

	is_target_closed: BOOLEAN
			-- Is target for current agent closed, i.e. specified at creation time?

feature -- Measurement

	open_count: INTEGER
			-- Number of open operands.

feature -- Settings

	frozen set_operands (args: detachable OPEN_ARGS)
			-- Use `args' as operands for next call.
		require
			valid_operands: valid_operands (args)
		do
			operands := args
		ensure
			operands_set: (operands /= Void implies (operands ~ args)) or
				(operands = Void implies (args = Void or else args.is_empty))
		end

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

feature -- Duplication

	copy (other: like Current)
			-- Use same routine as `other'.
		do
			if other /= Current then
				standard_copy (other)
				if attached operands as l_operands then
					operands := l_operands.twin
				end
			end
		ensure then
			same_call_status: other.callable implies callable
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
			i: INTEGER
		do
			if not attached a then
				call (default_arguments)
			elseif attached {OPEN_ARGS} a as x then
				call (x)
			else
					-- Note: with the precondition `valid_operands`, no need to check for conformance of items
					--	 the following code is similar to `new_tuple_from_tuple`.			
				check
					from_precondition: attached {OPEN_ARGS} ({ISE_RUNTIME}.new_tuple_instance_of (({OPEN_ARGS}).type_id)) as x
				then
					if a.object_comparison then
						x.compare_objects
					end
					from
						i := x.count
					until
						i <= 0
					loop
						x [i] := a [i]
						i := i - 1
					end
					call (x)
				end
			end
		end

feature -- Correction

	correct_mismatch
			-- <Precursor>
		do
			-- For the time being, even if the schema of agents changes, we will still retrieve them (without
			-- properly initializing all the fields.) This is acceptable as agents without schema change can
			-- be retrieved and are also invalid objects.

			-- Note: This implementation of `correct_mismath` should have been introduced in 14.05, but it was
			-- missed and introduced in 17.05 to help retrieve storables made by 13.11 and older.
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

	frozen rout_disp: POINTER
			-- Routine dispatcher

	frozen calc_rout_addr: POINTER
			-- Address of the final routine

	frozen open_map: detachable ARRAY [INTEGER]
			-- Index map for open arguments

	frozen encaps_rout_disp: POINTER
			-- Eiffel routine dispatcher

	frozen routine_id: INTEGER

	frozen is_basic: BOOLEAN

	frozen written_type_id_inline_agent: INTEGER

	frozen set_rout_disp (a_rout_disp, a_encaps_rout_disp, a_calc_rout_addr: POINTER;
						  a_routine_id: INTEGER; a_open_map: like open_map;
						  a_is_basic, a_is_target_closed: BOOLEAN; a_written_type_id_inline_agent: INTEGER;
						  a_closed_operands: TUPLE; a_open_count: INTEGER)
			-- Initialize object in workbench mode.
		require
			a_routine_id_valid: a_routine_id > -1
			target_valid: a_is_target_closed implies valid_target (a_closed_operands)
		do
			set_rout_disp_int (a_rout_disp, a_encaps_rout_disp, a_calc_rout_addr, a_routine_id,
							   a_open_map, a_is_basic, a_is_target_closed,
							   a_written_type_id_inline_agent, a_closed_operands, a_open_count)
		end

	frozen set_rout_disp_final (a_rout_disp, a_encaps_rout_disp, a_calc_rout_addr: POINTER
						  		a_closed_operands: TUPLE; a_is_target_closed: BOOLEAN; a_open_count: INTEGER)
			-- Initialize object in finalized mode.
		require
			target_valid: a_is_target_closed implies valid_target (a_closed_operands)
		do
			rout_disp := a_rout_disp
			encaps_rout_disp := a_encaps_rout_disp
			calc_rout_addr := a_calc_rout_addr
			closed_operands := a_closed_operands
			is_target_closed := a_is_target_closed
			open_count := a_open_count
		end

	frozen set_rout_disp_int (a_rout_disp, a_encaps_rout_disp, a_calc_rout_addr: POINTER;
						  	  a_routine_id: INTEGER; a_open_map: like open_map;
	 						  a_is_basic, a_is_target_closed: BOOLEAN; a_written_type_id_inline_agent: INTEGER;
							  a_closed_operands: TUPLE; a_open_count: INTEGER)
			-- Initialize object in workbench mode.
		require
			a_routine_id_valid: a_routine_id > -1
			target_valid: a_is_target_closed implies valid_target (a_closed_operands)
		do
			rout_disp := a_rout_disp
			encaps_rout_disp := a_encaps_rout_disp
			calc_rout_addr := a_calc_rout_addr
			routine_id := a_routine_id
			open_map := a_open_map
			is_basic := a_is_basic
			is_target_closed := a_is_target_closed
			written_type_id_inline_agent := a_written_type_id_inline_agent
			closed_operands := a_closed_operands
			open_count := a_open_count
		ensure
			rout_disp_set: rout_disp = a_rout_disp
			encaps_rout_disp_set: encaps_rout_disp = a_encaps_rout_disp
			calc_rout_addr_set: calc_rout_addr = a_calc_rout_addr
			routine_id_set: routine_id = a_routine_id
			open_map_set: open_map = a_open_map
			is_target_closed_set: is_target_closed = a_is_target_closed
			is_basic_set: is_basic = a_is_basic
			written_type_id_inline_agent_set: written_type_id_inline_agent = a_written_type_id_inline_agent
			closed_operands_set: closed_operands = a_closed_operands
			open_count_set: open_count = a_open_count
		end

feature {NONE} -- Implementation

	frozen open_types: detachable ARRAY [INTEGER]
			-- Types of open operands

	open_operand_type (i: INTEGER): INTEGER
			-- Type of `i'th open operand.
		require
			positive: i >= 1
			within_bounds: i <= open_count
		local
			o: like open_types
		do
			o := open_types
			if o = Void then
				create o.make_filled (-1, 1, open_count)
				open_types := o
			end
			Result := o.item (i)
			if Result = -1 then
				Result := ({OPEN_ARGS}).generic_parameter_type (i).type_id
				o.put (Result, i)
			end
		end

	type_id_of (a: separate ANY): INTEGER
			-- Type ID of an object `a'.
			--| FIXME
			--| Replace all usage of {ISE_RUNTIME}.dynamic_type (a) by this routine
			--| when we solve the nature of TYPE instances in a SCOOP context.
		require
			False
		do
			Result := a.generating_type.type_id
		end

feature -- Obsolete

	adapt_from (other: like Current)
			-- Adapt from `other'. Useful in descendants.
		obsolete
			"Please use `adapt' instead (it's also a creation procedure).  [2017-05-31]"
		require
			other_exists: other /= Void
			conforming: conforms_to (other)
		do
			adapt (other)
		end

	arguments: detachable OPEN_ARGS
		obsolete
			"Use `operands`. [2017-05-31]"
		do
			Result := operands
		end

	set_arguments (args: detachable OPEN_ARGS)
		obsolete
			"Use `set_operands`. [2017-05-31]"
		do
			set_operands (args)
		end

	valid_arguments (args: detachable OPEN_ARGS): BOOLEAN
		obsolete
			"Use `valid_operands`. [2017-05-31]"
		do
			Result := valid_operands (args)
		end

note
	ca_ignore: "CA011", "CA011: too many arguments"
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
