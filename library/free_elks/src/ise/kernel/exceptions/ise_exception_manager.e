note
	description: "[
		Exception manager. 
		The manager handles all common operations of exception mechanism and interaction with the ISE runtime.
	]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	ISE_EXCEPTION_MANAGER

inherit
	EXCEPTION_MANAGER
		redefine
			last_exception,
			raise,
			ignore,
			catch,
			set_is_ignored,
			is_ignorable,
			is_raisable,
			is_ignored,
			is_caught,
			type_of_code,
			exception_from_code
		end

feature -- Access

	last_exception: detachable EXCEPTION
			-- Last exception
		do
			Result := last_exception_cell.item
		end

feature -- Raise

	raise (a_exception: EXCEPTION)
			-- Raise `a_exception'.
			-- Raising `a_exception' by this routine makes `a_exception' accessible by `last_exception'
			-- in rescue clause. Hence causes removal of original `last_exception'.
		local
			p_meaning, p_message: POINTER
		do
			if not a_exception.is_ignored then
				if in_rescue then
					a_exception.set_throwing_exception (last_exception)
				end
				set_last_exception (a_exception)
					-- Meaning is not yet used in the runtime.
					-- We passes NULL, until we implemented it.
				p_meaning := default_pointer
				if attached {C_STRING} a_exception.c_description as m then
					p_message := m.item
				else
					p_message := default_pointer
				end
				developer_raise (a_exception.code, p_meaning, p_message)
			end
		end

feature -- Status setting

	ignore (a_exception: TYPE [detachable EXCEPTION])
			-- Make sure that any exception of type `a_exception' will be
			-- ignored. This is not the default.
		local
			l_type: INTEGER
		do
			l_type := a_exception.type_id
			ignored_exceptions.force (l_type, l_type)
		end

	catch (a_exception: TYPE [detachable EXCEPTION])
			-- Set type of `a_exception' `is_ignored'.
		do
			ignored_exceptions.remove (a_exception.type_id)
		end

	set_is_ignored (a_exception: TYPE [detachable EXCEPTION]; a_ignored: BOOLEAN)
			-- Set type of `a_exception' to be `a_ignored'.
		do
			if a_ignored then
				ignore (a_exception)
			else
				catch (a_exception)
			end
		end

feature -- Status report

	is_ignorable (a_exception: TYPE [detachable EXCEPTION]): BOOLEAN
			-- If set, type of `a_exception' is ignorable.
		do
			Result := not unignorable_exceptions.has (a_exception.type_id)
		end

	is_raisable (a_exception: TYPE [detachable EXCEPTION]): BOOLEAN
			-- If set, type of `a_exception' is raisable.
		do
			Result := not unraisable_exceptions.has (a_exception.type_id)
		end

	is_ignored (a_exception: TYPE [detachable EXCEPTION]): BOOLEAN
			-- If set, type of `a_exception' is not raised.
		do
			Result := ignored_exceptions.has (a_exception.type_id)
		end

	is_caught (a_exception: TYPE [detachable EXCEPTION]): BOOLEAN
			-- If set, type of `a_exception' is raised.
		do
			Result := not ignored_exceptions.has (a_exception.type_id)
		end

feature {EXCEPTIONS} -- Compatibility support

	type_of_code (a_code: INTEGER): detachable TYPE [EXCEPTION]
			-- Exception type of `a_code'
		do
			inspect a_code
			when {EXCEP_CONST}.void_call_target then
				Result := {VOID_TARGET}
			when {EXCEP_CONST}.No_more_memory then
				Result := {NO_MORE_MEMORY}
			when {EXCEP_CONST}.Precondition then
				Result := {PRECONDITION_VIOLATION}
			when {EXCEP_CONST}.Postcondition then
				Result := {POSTCONDITION_VIOLATION}
			when {EXCEP_CONST}.Floating_point_exception then
				Result := {FLOATING_POINT_FAILURE}
			when {EXCEP_CONST}.Class_invariant then
				Result := {INVARIANT_VIOLATION}
			when {EXCEP_CONST}.Check_instruction then
				Result := {CHECK_VIOLATION}
			when {EXCEP_CONST}.Routine_failure then
				Result := {ROUTINE_FAILURE}
			when {EXCEP_CONST}.Incorrect_inspect_value then
				Result := {BAD_INSPECT_VALUE}
			when {EXCEP_CONST}.Loop_variant then
				Result := {VARIANT_VIOLATION}
			when {EXCEP_CONST}.Loop_invariant then
				Result := {LOOP_INVARIANT_VIOLATION}
			when {EXCEP_CONST}.Signal_exception then
				Result := {OPERATING_SYSTEM_SIGNAL_FAILURE}
			when {EXCEP_CONST}.Eiffel_runtime_panic then
				Result := {EIFFEL_RUNTIME_PANIC}
			when {EXCEP_CONST}.Rescue_exception then
					-- Obselete
				Result := {RESCUE_FAILURE}
			when {EXCEP_CONST}.Out_of_memory then
					-- Merged with `No_more_memory'
				Result := {NO_MORE_MEMORY}
			when {EXCEP_CONST}.Resumption_failed then
					-- Obselete
				Result := {RESUMPTION_FAILURE}
			when {EXCEP_CONST}.Create_on_deferred then
				Result := {CREATE_ON_DEFERRED}
			when {EXCEP_CONST}.External_exception then
				Result := {EXTERNAL_FAILURE}
			when {EXCEP_CONST}.Void_assigned_to_expanded then
				Result := {VOID_ASSIGNED_TO_EXPANDED}
			when {EXCEP_CONST}.Exception_in_signal_handler then
					-- Obselete
				Result := {EXCEPTION_IN_SIGNAL_HANDLER_FAILURE}
			when {EXCEP_CONST}.Io_exception then
				Result := {IO_FAILURE}
			when {EXCEP_CONST}.Operating_system_exception then
				Result := {OPERATING_SYSTEM_FAILURE}
			when {EXCEP_CONST}.Retrieve_exception then
				Result := {MISMATCH_FAILURE}
			when {EXCEP_CONST}.Developer_exception then
				Result := {DEVELOPER_EXCEPTION}
			when {EXCEP_CONST}.Eiffel_runtime_fatal_error then
					-- Merged with `Eiffel_runtime_panic'
				Result := {EIFFEL_RUNTIME_PANIC}
			when {EXCEP_CONST}.Dollar_applied_to_melted_feature then
				Result := {ADDRESS_APPLIED_TO_MELTED_FEATURE}
			when {EXCEP_CONST}.Runtime_io_exception then
					-- Merged with `Io_exception'
				Result := {IO_FAILURE}
			when {EXCEP_CONST}.Com_exception then
				Result := {COM_FAILURE}
			when {EXCEP_CONST}.Runtime_check_exception then
				Result := {CHECK_VIOLATION}
			when {EXCEP_CONST}.old_exception then
				Result := {OLD_VIOLATION}
			when {EXCEP_CONST}.serialization_exception then
				Result := {SERIALIZATION_FAILURE}
			else
				Result := Void
			end
		end

	exception_from_code (a_code: INTEGER): detachable EXCEPTION
			-- Create exception object from `a_code'
		local
			l_rt_panic: EIFFEL_RUNTIME_PANIC
			l_io_failure: IO_FAILURE
			l_no_more_mem: NO_MORE_MEMORY
		do
			inspect a_code
			when {EXCEP_CONST}.void_call_target then
				create {VOID_TARGET}Result
			when {EXCEP_CONST}.No_more_memory then
				l_no_more_mem := no_memory_exception_object_cell.item
				l_no_more_mem.set_code ({EXCEP_CONST}.No_more_memory)
				Result := l_no_more_mem
			when {EXCEP_CONST}.Precondition then
				create {PRECONDITION_VIOLATION}Result
			when {EXCEP_CONST}.Postcondition then
				create {POSTCONDITION_VIOLATION}Result
			when {EXCEP_CONST}.Floating_point_exception then
				create {FLOATING_POINT_FAILURE}Result
			when {EXCEP_CONST}.Class_invariant then
				create {INVARIANT_VIOLATION}Result
			when {EXCEP_CONST}.Check_instruction then
				create {CHECK_VIOLATION}Result
			when {EXCEP_CONST}.Routine_failure then
				create {ROUTINE_FAILURE}Result
			when {EXCEP_CONST}.Incorrect_inspect_value then
				create {BAD_INSPECT_VALUE}Result
			when {EXCEP_CONST}.Loop_variant then
				create {VARIANT_VIOLATION}Result
			when {EXCEP_CONST}.Loop_invariant then
				create {LOOP_INVARIANT_VIOLATION}Result
			when {EXCEP_CONST}.Signal_exception then
				create {OPERATING_SYSTEM_SIGNAL_FAILURE}Result
			when {EXCEP_CONST}.Eiffel_runtime_panic then
				create l_rt_panic
				l_rt_panic.set_code ({EXCEP_CONST}.Eiffel_runtime_panic)
				Result := l_rt_panic
			when {EXCEP_CONST}.Rescue_exception then
					-- Obselete
				create {RESCUE_FAILURE}Result
			when {EXCEP_CONST}.Out_of_memory then
					-- Merged with `No_more_memory'
				l_no_more_mem := no_memory_exception_object_cell.item
				l_no_more_mem.set_code ({EXCEP_CONST}.Out_of_memory)
				Result := l_no_more_mem
			when {EXCEP_CONST}.Resumption_failed then
					-- Obselete
				create {RESUMPTION_FAILURE}Result
			when {EXCEP_CONST}.Create_on_deferred then
				create {CREATE_ON_DEFERRED}Result
			when {EXCEP_CONST}.External_exception then
				create {EXTERNAL_FAILURE}Result
			when {EXCEP_CONST}.Void_assigned_to_expanded then
				create {VOID_ASSIGNED_TO_EXPANDED}Result
			when {EXCEP_CONST}.Exception_in_signal_handler then
					-- Obselete
				create {EXCEPTION_IN_SIGNAL_HANDLER_FAILURE}Result
			when {EXCEP_CONST}.Io_exception then
				create l_io_failure
				l_io_failure.set_code ({EXCEP_CONST}.Io_exception)
				Result := l_io_failure
			when {EXCEP_CONST}.Operating_system_exception then
				create {OPERATING_SYSTEM_FAILURE}Result
			when {EXCEP_CONST}.Retrieve_exception then
				create {MISMATCH_FAILURE}Result
			when {EXCEP_CONST}.Developer_exception then
				create {DEVELOPER_EXCEPTION}Result
			when {EXCEP_CONST}.Eiffel_runtime_fatal_error then
					-- Merged with `Eiffel_runtime_panic'
				create l_rt_panic
				l_rt_panic.set_code ({EXCEP_CONST}.Eiffel_runtime_fatal_error)
				Result := l_rt_panic
			when {EXCEP_CONST}.Dollar_applied_to_melted_feature then
				create {ADDRESS_APPLIED_TO_MELTED_FEATURE}Result
			when {EXCEP_CONST}.Runtime_io_exception then
					-- Merged with `Io_exception'
				create l_io_failure
				l_io_failure.set_code ({EXCEP_CONST}.Runtime_io_exception)
				Result := l_io_failure
			when {EXCEP_CONST}.Com_exception then
				create {COM_FAILURE}Result
			when {EXCEP_CONST}.Runtime_check_exception then
				create {CHECK_VIOLATION}Result
			when {EXCEP_CONST}.old_exception then
				create {OLD_VIOLATION}Result
			when {EXCEP_CONST}.serialization_exception then
				create {SERIALIZATION_FAILURE}Result
			else
			end
		end

feature {NONE} -- Access

	exception_data: detachable TUPLE [code: INTEGER; signal_code: INTEGER; error_code: INTEGER; tag, recipient, eclass: STRING_8; rf_routine, rf_class: STRING_8; trace: STRING_8; line_number: INTEGER; is_invariant_entry: BOOLEAN]
			-- Exception data
			-- Used to store temporary exception information,
			-- which is used to create exception object later.
		do
			Result := exception_data_cell.item
		ensure
			instance_free: class
		end

feature {NONE} -- Element change

	set_last_exception (a_last_exception: detachable EXCEPTION)
			-- Set `last_exception' with `a_last_exception'.
		do
			last_exception_cell.put (a_last_exception)
		ensure
			instance_free: class
			last_exception_set: last_exception_cell.item = a_last_exception
		end

	set_exception_data (code: INTEGER; new_obj: BOOLEAN; signal_code: INTEGER; error_code: INTEGER; tag, recipient, eclass: STRING_8;
						rf_routine, rf_class: STRING_8; trace: STRING_8; line_number: INTEGER; is_invariant_entry: BOOLEAN)
			-- Set exception data.
		do
			exception_data_cell.put ([code, signal_code, error_code, tag, recipient, eclass, rf_routine, rf_class, trace, line_number, is_invariant_entry])
			if new_obj then
				if attached {EXCEPTION} exception_from_data as e then
					set_last_exception (e)
				end
			else
					-- This exception was raised from Eiffel code.
					-- Now the callback from runtime simply fill the exception object with interesting information.
				check
					last_exception_attached: attached last_exception as l_exception
				then
					l_exception.set_exception_trace (trace)
					l_exception.set_recipient_name (recipient)
					l_exception.set_type_name (eclass)
				end
			end
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation, ignoring

	ignored_exceptions: HASH_TABLE [INTEGER, INTEGER]
			-- Ignored exceptions
		once
			create Result.make (0)
		ensure
			instance_free: class
		end

	unignorable_exceptions: HASH_TABLE [INTEGER, INTEGER]
			-- Unignorable exceptions
		local
			l_type: INTEGER
		once
			create Result.make (1)
			l_type := ({VOID_TARGET}).type_id
			Result.force (l_type, l_type)
		ensure
			instance_free: class
		end

	unraisable_exceptions: HASH_TABLE [INTEGER, INTEGER]
			-- Unraisable exceptions
		local
			l_type: INTEGER
		once
			create Result.make (2)
			l_type := ({ROUTINE_FAILURE}).type_id
			Result.force (l_type, l_type)
			l_type := ({OLD_VIOLATION}).type_id
			Result.force (l_type, l_type)
		ensure
			instance_free: class
		end

feature {NONE} -- Cells

	exception_data_cell: CELL [detachable TUPLE [code: INTEGER; signal_code: INTEGER; error_code: INTEGER; tag, recipient, eclass: STRING_8; rf_routine, rf_class: STRING_8; trace: STRING_8; line_number: INTEGER; is_invariant_entry: BOOLEAN]]
			-- Cell to hold current exception data
		once
			create Result.put (Void)
		ensure
			instance_free: class
		end

	last_exception_cell: CELL [detachable EXCEPTION]
			-- Cell to hold last exception
		once
			create Result.put (Void)
		ensure
			instance_free: class
		end

	no_memory_exception_object_cell: CELL [NO_MORE_MEMORY]
			-- No more memory exception object.
		local
			l_nomem: NO_MORE_MEMORY
		once
				-- Reserve memory for no more memory exception object.
			create l_nomem
			l_nomem.set_exception_trace (create {STRING_8}.make (4096))
			create Result.put (l_nomem)
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	is_code_ignored (a_code: INTEGER): BOOLEAN
			-- Is exception of `a_code' ignored?
		do
			if attached {TYPE [detachable EXCEPTION]} type_of_code (a_code) as l_type then
				Result := is_ignored (l_type)
			else
				Result := True
			end
		ensure
			instance_free: class
		end

	exception_from_data: detachable EXCEPTION
			-- Create an exception object `exception_data'
		local
			t: detachable EXCEPTION
		do
			if
				attached exception_data as l_data and then
				attached {EXCEPTION} exception_from_code (l_data.code) as e
			then
				if attached {ROUTINE_FAILURE} e as l_rf then
					t := last_exception
					if t /= Void then
						e.set_throwing_exception (t)
					end
					l_rf.set_routine_name (l_data.rf_routine)
					l_rf.set_class_name (l_data.rf_class)
				elseif attached {OLD_VIOLATION} e as l_ov then
					t := last_exception
					if t /= Void then
						e.set_throwing_exception (t)
					end
				else
					if attached {INVARIANT_VIOLATION} e as l_inva then
						l_inva.set_is_entry (l_data.is_invariant_entry)
					elseif attached {OPERATING_SYSTEM_SIGNAL_FAILURE} e as l_sig then
						l_sig.set_signal_code (l_data.signal_code)
					elseif attached {IO_FAILURE} e as l_io then
						l_io.set_error_code (l_data.error_code)
					elseif attached {OPERATING_SYSTEM_FAILURE} e as l_sys then
						l_sys.set_error_code (l_data.error_code)
					elseif attached {COM_FAILURE} e as l_com then
						l_com.set_hresult_code (l_data.signal_code)
						l_com.set_exception_information (l_data.tag)
					end
					if in_rescue then
						t := last_exception
					end
					if t = Void then
						t := e
					end
					e.set_throwing_exception (t)
				end
				e.set_exception_trace (l_data.trace)
				e.set_description (l_data.tag)
				e.set_recipient_name (l_data.recipient)
				e.set_type_name (l_data.eclass)
				Result := e
			end
		ensure
			instance_free: class
		end

	once_raise (a_exception: EXCEPTION)
			-- Called by runtime to raise saved exception for once routines.
		require
			a_exception_not_void: a_exception /= Void
		local
			p_meaning, p_message: POINTER
		do
			if not a_exception.is_ignored then
				if in_rescue then
						-- We replace the `cause'.
					a_exception.original.set_throwing_exception (last_exception)
				end
				set_last_exception (a_exception)
					-- Meaning is not yet used in the runtime.
					-- We passes NULL, until we implemented it.
				p_meaning := default_pointer
				if attached {C_STRING} a_exception.c_description as m then
					p_message := m.item
				else
					p_message := default_pointer
				end
				developer_raise (a_exception.code, p_meaning, p_message)
			end
		ensure
			instance_free: class
		end

	frozen init_exception_manager
			-- Call once routines to create objects beforehand,
			-- in case it goes into critical session (Stack overflow, no memory etc.)
			-- The creations doesn't fail.
		do
			ignored_exceptions.do_nothing
			unignorable_exceptions.do_nothing
			unraisable_exceptions.do_nothing
			exception_data_cell.do_nothing
			last_exception_cell.do_nothing
				-- Reserve memory for no more memory exception object.
			no_memory_exception_object_cell.do_nothing
		ensure
			instance_free: class
		end

	frozen free_preallocated_trace
		local
			e: detachable EXCEPTION
		do
			e := no_memory_exception_object_cell.item
			if e /= Void then
				e.set_description (Void)
			end
		ensure
			instance_free: class
		end

	developer_raise (a_code: INTEGER; a_meaning, a_message: POINTER)
			-- Raise an exception
		external
			"built_in static"
		ensure
			instance_free: class
		end

	frozen in_rescue: BOOLEAN
			-- Current execution is during rescue?
		external
			"C use %"eif_except.h%""
		alias
			"eif_is_in_rescue"
		ensure
			instance_free: class
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2020, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
