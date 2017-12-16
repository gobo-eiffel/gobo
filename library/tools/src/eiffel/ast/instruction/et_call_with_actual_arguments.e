note

	description:

		"Eiffel calls with actual arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CALL_WITH_ACTUAL_ARGUMENTS

inherit

	ET_AST_NODE

feature -- Access

	name: ET_CALL_NAME
			-- Call name
		deferred
		ensure
			name_not_void: Result /= Void
		end

	arguments: detachable ET_ACTUAL_ARGUMENTS
			-- Arguments
		deferred
		end

feature -- Measurement

	arguments_count: INTEGER
			-- Number of arguments
		do
			if attached arguments as l_arguments then
				Result := l_arguments.count
			end
		ensure
			arguments_count_not_negative: Result >= 0
			no_argument: arguments = Void implies Result = 0
			with_arguments: attached arguments as l_arguments implies Result = l_arguments.count
		end

end
