indexing

	description:

		"Objects that simplify function arguments"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ARGUMENT_SIMPLIFIER


feature -- Access

	simplified_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Result of `simplify_arguments' if no error

feature -- Status report

	is_error: BOOLEAN
			-- Did `simplify_arguments' detect an error?

	error_value: XM_XPATH_ERROR_VALUE
			-- Error value detected by `error_value'

feature -- Optimization

	simplify_arguments (arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
			-- Simplify `arguments'
		local
			an_argument: XM_XPATH_EXPRESSION
			arguments_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			simplified_arguments := Void
			is_error := False
			from
				create simplified_arguments.make (arguments.count)
				error_value := Void
				arguments_cursor := arguments.new_cursor
				arguments_cursor.start
			variant
				arguments.count + 1 - arguments_cursor.index
			until
				is_error or else arguments_cursor.after
			loop
				an_argument := arguments_cursor.item.simplified_expression
				if an_argument.is_error then
					is_error := True
					error_value := an_argument.error_value
				else
					simplified_arguments.put_last (an_argument)
				end
				arguments_cursor.forth
			end
			if is_error then
				simplified_arguments := Void
			else
				error_value := Void
			end
		ensure
			simplified_arguments_not_void_or_error: not is_error implies simplified_arguments /= Void and then error_value = Void
			error_value: is_error implies error_value /= Void
		end

end
