note
	description: "[
		Common exception operations and management.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-23 21:13:10 -0700 (Wed, 23 May 2012) $"
	revision: "$Revision: 91981 $"

class
	EXCEPTION_MANAGER

feature -- Access

	last_exception: detachable EXCEPTION
			-- Last exception
		external
			"built_in"
		end

feature -- Raise

	raise (a_exception: EXCEPTION)
			-- Raise `a_exception'.
		require
			a_exception_not_void: a_exception /= Void
			a_exception_is_raisable: a_exception.is_raisable
		external
			"built_in"
		end

feature -- Status setting

	ignore (a_exception: TYPE [detachable EXCEPTION])
			-- Ignore type of `a_exception'.
		require
			a_exception_not_void: a_exception /= Void
			is_ignorable: is_ignorable (a_exception)
		external
			"built_in"
		ensure
			is_caught: is_ignored (a_exception)
		end

	catch (a_exception: TYPE [detachable EXCEPTION])
			-- Set type of `a_exception' `is_caught'.
		require
			a_exception_not_void: a_exception /= Void
		external
			"built_in"
		ensure
			is_ignored: not is_ignored (a_exception)
		end

	set_is_ignored (a_exception: TYPE [detachable EXCEPTION]; a_ignored: BOOLEAN)
			-- Set type of `a_exception' to be `a_ignored'.
		require
			a_exception_not_void: a_exception /= Void
			a_ignored_implies_is_ignorable: a_ignored implies is_ignorable (a_exception)
		external
			"built_in"
		ensure
			is_ignored_set: is_ignored (a_exception) = a_ignored
		end

feature -- Status report

	is_ignorable (a_exception: TYPE [detachable EXCEPTION]): BOOLEAN
			-- If set, type of `a_exception' is ignorable.
		external
			"built_in"
		end

	is_raisable (a_exception: TYPE [detachable EXCEPTION]): BOOLEAN
			-- If set, type of `a_exception' is raisable.
		external
			"built_in"
		end

	is_ignored (a_exception: TYPE [detachable EXCEPTION]): BOOLEAN
			-- If set, type of `a_exception' is not raised.
		external
			"built_in"
		ensure
			not_is_caught: Result = not is_caught (a_exception)
		end

	is_caught (a_exception: TYPE [detachable EXCEPTION]): BOOLEAN
			-- If set, type of `a_exception' is raised.
		external
			"built_in"
		ensure
			not_is_ignored: Result = not is_ignored (a_exception)
		end

feature {EXCEPTIONS} -- Backward compatibility support

	type_of_code (a_code: INTEGER): detachable TYPE [EXCEPTION]
			-- Exception type of `a_code'
		external
			"built_in"
		end

	exception_from_code (a_code: INTEGER): detachable EXCEPTION
			-- Create exception object from `a_code'
		external
			"built_in"
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
