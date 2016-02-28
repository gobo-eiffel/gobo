note

	description:

		"Eiffel feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_CALL

inherit

	ET_CALL_COMPONENT
		redefine
			target, arguments
		end

feature -- Access

	target: detachable ET_EXPRESSION
			-- Target
		deferred
		end

	arguments: detachable ET_ACTUAL_ARGUMENTS
			-- Arguments
		deferred
		end

	parenthesis_call: detachable ET_QUALIFIED_REGULAR_FEATURE_CALL
			-- Unfolded form when the current call is of the parenthesis alias form;
			-- For example, if the current call is 'f (args)', its parenthesis call
			-- will be 'f.g (args)' where 'g' is declared as 'g alias "()"'.
		do
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
