indexing

	description:

		"Accesses to the shared decimal context; used to be a singleton"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"

class MA_SHARED_DECIMAL_CONTEXT

feature -- Access

	shared_decimal_context: MA_DECIMAL_CONTEXT is
			-- Decimal context for operations where it does not explicitly appear in the signature
		do
			Result := cell.item
		ensure
			shared_decimal_context_not_void: Result /= Void
		end

feature -- Element change

	set_shared_decimal_context (new_context: MA_DECIMAL_CONTEXT) is
			-- Set `shared_decimal_context' to `new_context'.
		require
			new_context_not_void: new_context /= Void
		do
			cell.put (new_context)
		ensure
			context_set: shared_decimal_context = new_context
		end

feature {NONE} -- Implementation

	cell: KL_CELL [MA_DECIMAL_CONTEXT] is
			-- Cell containing shared decimal context
		local
			new_context: MA_DECIMAL_CONTEXT
		once
			create new_context.make_default
			create Result.make (new_context)
		end

invariant

	shared_context_not_void: shared_decimal_context /= Void

end
