note
	description: "Representation of a memory structure."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MEMORY_STRUCTURE

feature -- Initialization

	make
			-- Initialize current with given `structure_size'.
		local
			null: POINTER
		do
			internal_item := null
			create managed_pointer.make (structure_size)
			shared := False
		ensure
			not_shared: not shared
		end

	make_by_pointer (a_ptr: POINTER)
			-- Initialize current with `a_ptr'.
		require
			a_ptr_not_null: a_ptr /= default_pointer
		do
			internal_item := a_ptr
			managed_pointer := Void
			shared := True
		ensure
			shared: shared
		end

feature -- Access

	shared: BOOLEAN
			-- Is current memory area shared with others?

	item: POINTER
			-- Access to memory area.
		local
			m: like managed_pointer
		do
			if shared then
				Result := internal_item
			else
				m := managed_pointer
				if m /= Void then
					Result := m.item
				end
			end
		end

feature -- Status report

	exists: BOOLEAN
			-- Is allocated memory still allocated?
		do
			Result := item /= default_pointer
		end

feature -- Measurement

	structure_size: INTEGER
			-- Size to allocate (in bytes).
		deferred
		ensure
			is_class: class
			positive_result: Result > 0
		end

feature {NONE} -- Implementation

	internal_item: POINTER
			-- Pointer holding value when shared.

	managed_pointer: detachable MANAGED_POINTER
			-- Hold memory area in a managed way.

invariant
	managed_pointer_valid: not shared implies managed_pointer /= Void
	internal_item_valid: shared implies internal_item /= default_pointer

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
