indexing

	description:

		"Objects that bind variable names to values"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_BINDERY

inherit

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_global_variable_count, a_maximum_local_variable_count: INTEGER) is
			-- Establish invariant.
		require
			positive_global_count: a_global_variable_count >= 0
			positive_local_count: a_maximum_local_variable_count >= 0
		do
			global_variable_count := a_global_variable_count + 1 -- Why + 1 ???
			allocate_globals (global_variable_count)
			local_variable_count := a_maximum_local_variable_count + Frame_reserved_slots_count
			create frame_stack.make_default
			open_stack_frame_without_parameters
		end

feature -- Access

	Frame_reserved_slots_count: INTEGER is 2
			-- Reserved slots on local stack frame

	Frame_parameters_slot: INTEGER is 1
			-- Slot number on local stack frame reserved for parameters

	Frame_tunnel_parameters_slot: INTEGER is 2
			-- Slot number on local stack frame reserved for tunnel parameters

	current_stack_frame: ARRAY [XM_XSLT_STACK_FRAME_ENTRY]
			-- Current stack frame

	tunnel_parameters: XM_XSLT_PARAMETER_SET is
			--  Tunnel parameters from local stack frame
		local
			a_stack_frame_entry: XM_XSLT_STACK_FRAME_ENTRY
		do
			a_stack_frame_entry := current_stack_frame.item (Frame_tunnel_parameters_slot)
			if a_stack_frame_entry /= Void then
				Result := a_stack_frame_entry.parameter_set
			end
		end

	local_variable (a_slot_number: INTEGER): XM_XPATH_VALUE is
			-- Value of a local variable
		require
			stack_frame_not_void: current_stack_frame /= Void
		do
			Result := current_stack_frame.item (a_slot_number + Frame_reserved_slots_count).value
		ensure
			local_variable_not_void: Result /= Void
		end

feature -- Measurement
	
	frame_stack_count: INTEGER is
			-- Number of stack frames
		do
			Result := frame_stack.count
		end

	global_variable_count: INTEGER
			-- Number of global variables

feature -- Status report

	is_circularity_error: BOOLEAN
			-- Has a circular definition occured

	is_evaluated (a_slot_number: INTEGER): BOOLEAN is
			-- Has global variable `a_slot_number' been evaluated yet?
		require
			valid_slot_number: a_slot_number > 0 and then a_slot_number <= global_variable_count
		do
			Result := global_variables.item (a_slot_number) /= Void
		end

	is_global_parameter_supplied (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent a supplied global parameter?
		do
			if global_parameters /= Void then
				if global_parameters.has (a_fingerprint) then
					Result := global_parameters.value (a_fingerprint) /= Void
				end
			end
		end

	is_local_parameter_supplied (a_fingerprint: INTEGER; is_tunnel: BOOLEAN): BOOLEAN is
			-- Does `a_fingerprint' represent a supplied local parameter?
		local
			a_slot_number: INTEGER
			a_parameter_set: XM_XSLT_PARAMETER_SET
			a_stack_entry:XM_XSLT_STACK_FRAME_ENTRY
		do
			if is_tunnel then
				a_slot_number := Frame_tunnel_parameters_slot
			else
				a_slot_number := Frame_parameters_slot
			end
			a_stack_entry := current_stack_frame.item (a_slot_number)
			a_parameter_set := current_stack_frame.item (a_slot_number).parameter_set
			if a_stack_entry /= Void then
				check
					parameter_set: a_stack_entry.is_parameter_set
				end
				a_parameter_set := a_stack_entry.parameter_set
				if a_parameter_set.has (a_fingerprint) then
					Result := a_parameter_set.value (a_fingerprint) /= Void
				end
			end
		end

	last_binding_failure: STRING
			-- Message associated with last failed binding attempt

feature -- Status setting

	set_executing (a_slot_number: INTEGER; executing: BOOLEAN) is
			-- Set/Unset a flag to indicate that `a_slot_number' is currently being evaluated.
		require
			valid_slot_number: a_slot_number > 0 and then a_slot_number <= global_variable_count
		do
			if executing then
				if busy_globals.item (a_slot_number) then
					is_circularity_error := True
				else
					busy_globals.put (True, a_slot_number)
				end
			else
				busy_globals.put (False, a_slot_number)
			end
		end

feature -- Element change

	open_stack_frame_without_parameters is
			-- Start a new stack frame without parameters.
		do
			allocate_stack_frame
		ensure
			one_more: frame_stack.count = old frame_stack.count + 1
		end

	open_stack_frame (some_local_parameters, some_tunnel_parameters: XM_XSLT_PARAMETER_SET) is
			-- Start a new stack frame.
		require
		local
			a_parameter_set, another_parameter_set: XM_XSLT_PARAMETER_SET
			a_stack_entry, another_stack_entry: XM_XSLT_STACK_FRAME_ENTRY
		do
			allocate_stack_frame
			if some_local_parameters = Void then
				create a_parameter_set.make_empty
			else
				a_parameter_set := some_local_parameters
			end
			if some_tunnel_parameters = Void then
				create another_parameter_set.make_empty
			else
				another_parameter_set := some_tunnel_parameters
			end			
			create a_stack_entry.make_parameter_set (a_parameter_set)
			create another_stack_entry.make_parameter_set (another_parameter_set)
			current_stack_frame.put (a_stack_entry, Frame_parameters_slot)
			current_stack_frame.put (another_stack_entry, Frame_tunnel_parameters_slot)
		ensure
			one_more: frame_stack.count = old frame_stack.count + 1			
		end

	open_stack_frame_with_positional_parameters (some_actual_arguments: DS_LIST [XM_XPATH_VALUE]) is
			-- Start a new stack frame, supplying positional parameter values.
		require
			positional_parameters_not_void: some_actual_arguments /= Void
		local
			a_cursor:  DS_LIST_CURSOR [XM_XPATH_VALUE]
			a_stack_frame_entry: XM_XSLT_STACK_FRAME_ENTRY
		do
			allocate_stack_frame
			from
				a_cursor := some_actual_arguments.new_cursor; a_cursor.start
			variant
				some_actual_arguments.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				create a_stack_frame_entry.make (a_cursor.item)
				current_stack_frame.put (a_stack_frame_entry, a_cursor.index + Frame_reserved_slots_count)
				a_cursor.forth
			end
		ensure
			one_more: frame_stack.count = old frame_stack.count + 1			
		end

	close_stack_frame is
			-- Remove current stack frame.
		require
			at_least_one_stack_frame: frame_stack_count > 0
		do
			frame_stack.remove
			current_stack_frame := frame_stack.item
		ensure
			one_fewer: frame_stack.count = old frame_stack.count - 1
		end
			
	define_global_variable (a_slot_number: INTEGER; a_value: XM_XPATH_VALUE) is
			-- Define global variable.
		require
			valid_slot_number: a_slot_number > 0 and then a_slot_number <= global_variable_count
			not_yet_evaluated: not is_evaluated (a_slot_number)
			value_not_void: a_value /= Void
		do
			global_variables.put (a_value, a_slot_number)
		ensure
			global_variable_defined: is_evaluated (a_slot_number)
		end

	define_global_parameters (a_parameter_set: XM_XSLT_PARAMETER_SET) is
			-- Define global parameters (e.g. as suppiled on command line by user).
		require
			parameter_set_not_void: a_parameter_set /= Void
		do
			global_parameters := a_parameter_set
		ensure
			global_parameters_set: global_parameters = a_parameter_set
		end

	bind_global_parameter (a_variable_definition: XM_XSLT_COMPILED_VARIABLE_DEFINITION; a_fingerprint: INTEGER) is
			-- Bind a global parameter value to it's definition.
		require
			parameter_value_supplied: is_global_parameter_supplied (a_fingerprint)
		local
			a_value: XM_XPATH_VALUE
			a_required_item_type: XM_XPATH_ITEM_TYPE
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_atomic_type: XM_XPATH_ATOMIC_TYPE
			a_required_cardinality: INTEGER
		do
			last_binding_failure := Void
			a_value := global_parameters.value (a_fingerprint)
			check
				value_not_void: a_value /= Void
				-- from pre-condition
			end
			a_required_item_type := a_variable_definition.required_type.primary_type
			an_atomic_value ?= a_value
			an_atomic_type ?= a_required_item_type
			if an_atomic_value /= Void and then an_atomic_type /= Void then

				-- If the parameter is an atomic value, typically a string supplied on
            --  the command line, we attempt to convert it to the required type.
				-- This will not always succeed.

				if an_atomic_value.is_convertible (an_atomic_type) then
					a_value := an_atomic_value.convert_to_type (an_atomic_type)
				else
					last_binding_failure := STRING_.concat ("Global parameter requires type ", a_required_item_type.conventional_name)
					last_binding_failure := STRING_.appended_string (last_binding_failure, "; supplied value has type ")
					last_binding_failure := STRING_.appended_string (last_binding_failure, a_value.item_type.conventional_name)
				end
			else

				-- For any other parameter value, we verify that if conforms to the
            --  required type. This must be precise conformance, we don't attempt to
            --  do atomization or to convert untypedAtomic values

				if not is_sub_type (a_value.item_type, a_required_item_type) then
					last_binding_failure := STRING_.concat ("Global parameter requires type ", a_required_item_type.conventional_name)
					last_binding_failure := STRING_.appended_string (last_binding_failure, "; supplied value has type ")
					last_binding_failure := STRING_.appended_string (last_binding_failure, a_value.item_type.conventional_name)
				else
					if not a_variable_definition.required_type.cardinality_subsumes (a_value.cardinality) then
						last_binding_failure := "Supplied value of external parameter does not match the required cardinality"
					end
				end
			end
			if last_binding_failure = Void then
				global_variables.put (a_value, a_variable_definition.slot_number)
			end
		end

	set_local_variable (a_slot_number: INTEGER; a_value: XM_XPATH_VALUE) is
			-- Set the value of a local variable
		require
			value_not_void: a_value /= Void
		local
			a_stack_entry:XM_XSLT_STACK_FRAME_ENTRY
		do
			create a_stack_entry.make (a_value)
			current_stack_frame.put (a_stack_entry, a_slot_number + Frame_reserved_slots_count)
		ensure
			local_variable_set: local_variable (a_slot_number) = a_value
		end

feature -- Evaluation

	global_variable_value (a_slot_number: INTEGER): XM_XPATH_VALUE is
		require
			valid_slot_number: a_slot_number > 0 and then a_slot_number <= global_variable_count
		do
			Result := global_variables.item (a_slot_number)
		ensure
			value_not_void_if_not_yet_bound: True
		end
		
	supplied_local_parameter_value (a_fingerprint: INTEGER; is_tunnel: BOOLEAN): XM_XPATH_VALUE is
			-- Does `a_fingerprint' represent a supplied local parameter?
		require
			local_parameter_supplied: is_local_parameter_supplied (a_fingerprint, is_tunnel)
		local
			a_slot_number: INTEGER
			a_parameter_set: XM_XSLT_PARAMETER_SET
			a_stack_entry:XM_XSLT_STACK_FRAME_ENTRY
		do
			if is_tunnel then
				a_slot_number := Frame_tunnel_parameters_slot
			else
				a_slot_number := Frame_parameters_slot
			end
			a_stack_entry := current_stack_frame.item (a_slot_number)
			--a_parameter_set := current_stack_frame.item (a_slot_number).parameter_set
			check
				parameter_set: a_stack_entry.is_parameter_set
				-- from pre-condition
			end
			a_parameter_set := a_stack_entry.parameter_set
			check
				present: a_parameter_set.has (a_fingerprint)
				-- from pre-condition
			end
			Result := a_parameter_set.value (a_fingerprint)
		end

feature {NONE} -- Implementation

	global_parameters: XM_XSLT_PARAMETER_SET
			-- global parameters

	global_variables: ARRAY [XM_XPATH_VALUE]
			-- Global variables

	busy_globals: ARRAY [BOOLEAN]
			-- Flags used to indicate a global variable is being defined

	local_variable_count: INTEGER
			-- Maximum number of local variables needed for any stack frame

	frame_stack: DS_ARRAYED_STACK [ARRAY [XM_XSLT_STACK_FRAME_ENTRY]]
			-- Local variable stack

	allocate_globals (a_global_variable_count: INTEGER) is
			-- Allocate space for global variables
		require
			strictly_positive_global_count: a_global_variable_count > 0
		do
			create global_variables.make (1, a_global_variable_count)
			create busy_globals.make (1, a_global_variable_count)
		end

	allocate_stack_frame is
			-- Allocate space for a new stack frame.
		do
			if frame_stack.is_full then
				frame_stack.resize (frame_stack.count + frame_stack.default_capacity)
			end
			create current_stack_frame.make (1, local_variable_count)
			frame_stack.put (current_stack_frame)
		ensure
			one_more: frame_stack.count = old frame_stack.count + 1
		end

invariant

	global_variables_not_void: global_variables /= Void
	busy_globals_not_void: busy_globals /= Void and then busy_globals.count = global_variables.count
	strictly_positive_local_count: local_variable_count >= Frame_reserved_slots_count
	frame_stack_not_void: frame_stack /= Void

end
	
