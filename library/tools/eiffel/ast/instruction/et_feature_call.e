indexing

	description:

		"Eiffel feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_CALL

inherit

	ET_CALL_COMPONENT
		redefine
			target, arguments
		end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Access

	target: ET_EXPRESSION is
			-- Target
		deferred
		end

	arguments: ET_ACTUAL_ARGUMENTS is
			-- Arguments
		deferred
		end

feature -- Measurement

	arguments_count: INTEGER is
			-- Number of arguments
		local
			l_arguments: like arguments
		do
			l_arguments := arguments
			if l_arguments /= Void then
				Result := l_arguments.count
			end
		ensure
			arguments_count_not_negative: Result >= 0
			no_argument: arguments = Void implies Result = 0
			with_arguments: arguments /= Void implies Result = arguments.count
		end

end
