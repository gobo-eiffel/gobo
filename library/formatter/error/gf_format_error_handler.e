indexing

	description: "Formatter error handling in case a format error occurs.."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class

	GF_FORMAT_ERROR_HANDLER


inherit

	EXCEPTIONS


feature -- Commands

	report (a_class_name, msg: STRING; code: INTEGER; xobject: ANY) is
			-- Builds error report according to the actual argument list,
			-- prints it and raises a user defined exception: if proper
			-- 'error_types.item (code)' is defined it'll be used as
			-- 'msg' supplement otherwise only numeric 'code' is appended
			-- to ...
		require
			valid_msg: msg /= Void
			valid_name: a_class_name /= Void
		local
			msg_name: STRING
		do
			create msg_name.make_from_string ("Error: ")
			msg_name.append_string (msg)
			msg_name.append_string (" in class: ")
			msg_name.append_string (a_class_name)
			-- Raising a user defined exception which stops the execution ...
			raise (msg_name)
		end


end
