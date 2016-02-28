note

	description:

		"Debugging routines"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DEBUGGING_ROUTINES

inherit

	ANY

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

feature -- Output

	todo (a_routine_name: STRING; is_partially_done: BOOLEAN)
			-- Write a TODO message.
		require
			routine_name_not_void: a_routine_name /= Void and then a_routine_name.count > 2
		do
			if not keys.has (a_routine_name) then
				std.error.put_string ("TODO: {")
				std.error.put_string (generating_type)
				std.error.put_string ("}.")
				std.error.put_string (a_routine_name)
				if is_partially_done then
					std.error.put_string (" is only partly written")
				else
					std.error.put_string (" needs to be written")
				end
				std.error.put_new_line
				keys.put (a_routine_name)
			end
		end

	debug_print (a_string: STRING)
			-- Print `a_string' plus it's item codes.
		local
			i: INTEGER
		do
			std.output.put_string(a_string)
			std.output.put_new_line
			from
				i := 1
			until
				i > a_string.count
			loop
				std.output.put_string (a_string.item_code (i).out)
				std.output.put_string (",")
				i := i+ 1
			end
			std.output.put_new_line
		end

feature {NONE} -- Implementation

	keys: DS_HASH_SET [STRING]
			-- Routines we have already seen
		once
			create Result.make (30)
			Result.set_equality_tester (string_equality_tester)
		end

end

