indexing
	description: "Representation of a memory structure."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MEMORY_STRUCTURE

feature -- Initialization

	make is
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

	make_by_pointer (a_ptr: POINTER) is
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

	item: POINTER is
			-- Access to memory area.
		local
			m: like managed_pointer
		do
			if shared then
				Result := internal_item
			else
				m :=managed_pointer
				if m /= Void then
					Result := m.item
				end
			end
		end

feature -- Measurement

	structure_size: INTEGER is
			-- Size to allocate (in bytes)
		deferred
		ensure
			positive_result: Result > 0
		end

feature {NONE} -- Implementation

	internal_item: POINTER
			-- Pointer holding value when shared.

	managed_pointer: ?MANAGED_POINTER
			-- Hold memory area in a managed way.

invariant
	managed_pointer_valid: not shared implies managed_pointer /= Void
	internal_item_valid: shared implies internal_item /= default_pointer

end
