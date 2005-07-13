indexing

	description:

		"Objects that holds a TCP hostname and port number"

	library: "Gobo Eiffel Utility Library"
	author: "Copyright (c) 2004, Franck Arnaud and others"
	revision: "$Revision$"
	date: "$Date$"

class UT_HOST_PORT

inherit

	ANY

	UT_HOST_PORT_ROUTINES

create

	make

feature -- Setting

	make, parse (a_string: STRING; a_default_port: INTEGER) is
			-- Parse <hostname> [ ':' <port> ] (tolerant).
		require
			a_string_not_void: a_string /= Void
			a_default_port_valid: is_valid_port (a_default_port)
		local
			i: INTEGER
			a_port: STRING
		do
			port := a_default_port
			i := a_string.index_of (Port_separator, 1) 
			if i /= 0 then
				host := a_string.substring (1, i - 1)
				a_port := a_string.substring (i + 1, a_string.count)
				if a_port.is_integer then
					port := a_port.to_integer
					if port < 0 then
						port := a_default_port
					elseif port > Maximum_port then
						port := a_default_port
					end
				end
			else
				host := a_string
			end
		end

	set_host (a_host: STRING) is
			-- Set host.
		require
			a_host_not_void: a_host /= Void
		do
			host := a_host
		ensure
			host_set: host = a_host
		end

	set_port (a_port: INTEGER) is
			-- Set port.
		require
			a_port_valid: is_valid_port (a_port)
		do
			port := a_port
		ensure
			port_set: port = a_port
		end

feature -- Access

	host: STRING
			-- Host name (or numeric address expressed as text)

	port: INTEGER
			-- Port number

invariant

	host_not_void: host /= Void
	port_positive: port >= 0
	port_maximum: port < Maximum_port

end
