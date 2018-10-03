note
	description: "Facility to mark objects once when traversing an object graph."
	date: "$Date$"
	revision: "$Revision$"

class
	OBJECT_GRAPH_MARKER

feature {OBJECT_GRAPH_TRAVERSABLE} -- Status report

	is_marked (obj: separate ANY): BOOLEAN
			-- Is `obj' marked?
		require
			object_exists: obj /= Void
		do
			Result := {ISE_RUNTIME}.is_object_marked ($obj)
		ensure
			instance_free: class
		end

feature  {OBJECT_GRAPH_TRAVERSABLE}-- Marking

	mark (obj: separate ANY)
			-- Mark object `obj'.
			-- To be thread safe, make sure to call this feature when you
			-- have the marking lock that you acquire using `lock_marking'.
		require
			object_not_void: obj /= Void
		do
			{ISE_RUNTIME}.mark_object ($obj)
		ensure
			instance_free: class
			is_marked: is_marked (obj)
		end

	unmark (obj: separate ANY)
			-- Unmark object `obj'.
			-- To be thread safe, make sure to call this feature when you
			-- have the marking lock that you acquire using `lock_marking'.
		require
			object_not_void: obj /= Void
		do
			{ISE_RUNTIME}.unmark_object ($obj)
		ensure
			instance_free: class
			is_not_marked: not is_marked (obj)
		end

	lock_marking
			-- Get a lock on `mark' and `unmark' routine so that 2 threads cannot `mark' and
			-- `unmark' at the same time.
		do
			{ISE_RUNTIME}.lock_marking
		ensure
			instance_free: class
		end

	unlock_marking
			-- Release a lock on `mark' and `unmark', so that another thread can
			-- use `mark' and `unmark'.
		do
			{ISE_RUNTIME}.unlock_marking
		ensure
			instance_free: class
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
