note

	description: "[
		Collection of features that are used to mark
		places in code that needs refactoring.
		]"

	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class REFACTORING_HELPER

feature -- Markers

	fixme (comment: STRING)
			-- Mark code that has to be "fixed" with `comment'.
		require
			comment_not_void: comment /= Void
		do
			debug ("refactor_fixme")
				io.error.put_string ("FIXME: ")
				io.error.put_string (comment)
				io.error.put_new_line
			end
		end

	to_implement (comment: STRING)
			-- Mark code that has to be "implemented" with `comment'.
		require
			comment_not_void: comment /= Void
		do
			debug ("refactor_fixme")
				io.error.put_string ("TO_BE_IMPLEMENTED: ")
				io.error.put_string (comment)
				io.error.put_new_line
			end
		end

	to_implement_assertion (comment: STRING): BOOLEAN
			-- Mark assertion that has to be "implemented" with `comment'.
		require
			comment_not_void: comment /= Void
		do
			debug ("refactor_fixme")
				io.error.put_string ("ASSERTION_TO_BE_IMPLEMENTED: ")
				io.error.put_string (comment)
				io.error.put_new_line
			end
			Result := True
		end

end
