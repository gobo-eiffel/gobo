note

	description:

		"Eiffel syntax errors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYNTAX_ERROR

inherit

	ET_EIFFEL_ERROR

create

	make

feature {NONE} -- Initialization

	make (a_filename: STRING; a_position: ET_POSITION)
			-- Create a new Eiffel syntax error at `a_position' in `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
			a_position_not_void: a_position /= Void
		do
			code := default_code
			etl_code := default_code
			default_template := default_validity_template
			filename := a_filename
			position := a_position
			create parameters.make (1, 1)
			parameters.put (a_position.to_text, 1)
			set_compilers (True)
		ensure
			filename_set: filename = a_filename
			position_set: position = a_position
			all_reported: all_reported
			all_fatal: all_fatal
		end

feature -- Access

	filename: STRING
			-- Name of file where current error occurred

feature -- Setting

	set_filename (a_filename: like filename)
			-- Set `filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
		do
			filename := a_filename
		ensure
			filename_set: filename = a_filename
		end

	set_current_class (a_class: like current_class)
			-- Set `current_class' to `a_class'.
		do
			current_class := a_class
		ensure
			current_class_set: current_class = a_class
		end

feature {NONE} -- Implementation

	default_validity_template: STRING = "Syntax error:%N$1"
	default_code: STRING = "gssss"
			-- Default values

	ssel_default_template: STRING = "SSEL: empty lines not allowed in middle of multi-line manifest strings.%N$1"
			-- "SSEL: Syntax String Empty Line"

end
