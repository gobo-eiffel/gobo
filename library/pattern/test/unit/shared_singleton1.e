note

	description:

		"Shared singleton1"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class SHARED_SINGLETON1

feature -- Access

	singleton1: SINGLETON1
			-- Singleton object
		do
			if attached singleton1_cell.item as l_singleton1 then
				Result := l_singleton1
			else
				create Result.make
				singleton1_cell.put (Result)
			end
		ensure
			singleton1_created: singleton1_created
			singleton1_not_void: Result /= Void
		end

feature -- Status report

	singleton1_created: BOOLEAN
			-- Has singleton already been created?
		do
			Result := singleton1_cell.item /= Void
		end

feature {NONE} -- Implementation

	singleton1_cell: DS_CELL [detachable SINGLETON1]
			-- Cell containing the singleton if already created
		once
			create Result.make (Void)
		ensure
			cell_not_void: Result /= Void
		end

end
