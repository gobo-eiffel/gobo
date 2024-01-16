note

	description:

		"Access to the shared decimal context; used to be a singleton"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004-2018, Paul G. Crismer and others"
	license: "MIT License"

class MA_SHARED_DECIMAL_CONTEXT

inherit

	KL_ANY

feature -- Access

	shared_decimal_context: MA_DECIMAL_CONTEXT
			-- Decimal context for operations where it does not explicitly appear in the signature;
			-- Return `default_context' by default, but can be changed by calling `set_shared_decimal_context'
		do
			Result := cell.item
		ensure
			instance_free: class
			shared_decimal_context_not_void: Result /= Void
		end

	default_context: MA_DECIMAL_CONTEXT
			-- Default context for general purpose arithmetic
		once
			create Result.make_default
		ensure
			instance_free: class
			default_context_not_void: Result /= Void
		end

feature -- Setting

	set_shared_decimal_context (new_context: MA_DECIMAL_CONTEXT)
			-- Set `shared_decimal_context' to `new_context'.
			-- It is best practice to call this routine once and for all
			-- at the beginning of the application to avoid unexpected
			-- behaviors.
		require
			new_context_not_void: new_context /= Void
		do
			cell.put (new_context)
		ensure
			instance_free: class
			context_set: shared_decimal_context = new_context
		end

feature {NONE} -- Implementation

	cell: KL_CELL [MA_DECIMAL_CONTEXT]
			-- Cell containing shared decimal context
		once
			create Result.make (default_context)
		ensure
			instance_free: class
			cell_not_void: Result /= Void
			context_not_void: cell.item /= Void
		end

end
