note

	description:

		"Shared singleton3"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003-2018, Eric Bezault and others"
	license: "MIT License"

class SHARED_SINGLETON3

feature -- Access

	singleton3: SINGLETON3
			-- Singleton object
		do
			if attached singleton3_cell.item as l_singleton3 then
				Result := l_singleton3
			else
				create Result.make
				singleton3_cell.put (Result)
			end
		ensure
			singleton3_created: singleton3_created
			singleton3_not_void: Result /= Void
		end

feature -- Status report

	singleton3_created: BOOLEAN
			-- Has singleton already been created?
		do
			Result := singleton3_cell.item /= Void
		end

feature {NONE} -- Implementation

	singleton3_cell: DS_CELL [detachable SINGLETON3]
			-- Cell containing the singleton if already created
		once
			create Result.make (Void)
		ensure
			cell_not_void: Result /= Void
		end

end
