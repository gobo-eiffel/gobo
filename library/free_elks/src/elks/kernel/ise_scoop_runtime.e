note
	description: "Features to access and interact with the SCOOP runtime."
	date: "$Date: 2018-04-28 20:50:36 +0000 (Sat, 28 Apr 2018) $"
	revision: "$Revision: 101699 $"

class
	ISE_SCOOP_RUNTIME

feature -- Access

	frozen invalid_region_id: NATURAL_16
			-- The special region ID used for invalid regions.
		external
			"C macro use %"eif_scoop.h%""
		alias
			"EIF_NULL_PROCESSOR"
		ensure
			instance_free: class
		end

	frozen region_id (a_object: separate ANY): NATURAL_16
			-- The region ID on which `a_object' is placed.
		do
			Result := c_region_id ($a_object)
		ensure
			instance_free: class
		end

feature -- Basic operations

	pin_to_thread
			-- Pin the current processor to its own thread.
		do
			c_disable_impersonation (c_region_id($Current))
		end

	pin_processor_to_thread (a_object: separate ANY)
			-- Pin the processor behind the separate object `a_object' to its own thread.
		do
				-- We first need to synchronize with the processor.
			a_object.default_pointer.do_nothing
			c_disable_impersonation (c_region_id($a_object))
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	frozen c_region_id (a_object: POINTER): NATURAL_16
			-- C exxternal for the region ID of an object.
		external
			"C inline use %"eif_macros.h%""
		alias
			"return RTS_PID($a_object)"
		end

	frozen c_disable_impersonation (a_pid: NATURAL_16)
			-- C external to disable impersonation for a specific processor.
		external
			"C inline use %"eif_scoop.h%""
		alias
			"eif_scoop_set_is_impersonation_allowed ($a_pid, EIF_FALSE)"
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
