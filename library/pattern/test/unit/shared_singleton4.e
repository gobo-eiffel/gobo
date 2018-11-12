note

	description:

		"Shared singleton4"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class SHARED_SINGLETON4

feature -- Access

	singleton4: SINGLETON4
			-- Singleton object
		do
			if attached singleton4_cell.item as l_singleton4 then
				Result := l_singleton4
			else
				create Result.make
				singleton4_cell.put (Result)
			end
		ensure
			singleton4_created: singleton4_created
			singleton4_not_void: Result /= Void
		end

feature -- Status report

	singleton4_created: BOOLEAN
			-- Has singleton already been created?
		do
			Result := singleton4_cell.item /= Void
		end

feature {NONE} -- Implementation

	singleton4_cell: DS_CELL [detachable SINGLETON4]
			-- Cell containing the singleton if already created
		once
			create Result.make (Void)
		ensure
			cell_not_void: Result /= Void
		end

end
