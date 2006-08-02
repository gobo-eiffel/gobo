indexing

	description:

		"A list of alternative options, introduced by a special option"
	
	author: "Bernd Schoeller"
	copyright: "(c) 2006 Bernd Schoeller (bernd@fams.de) and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class AP_ALTERNATIVE_OPTIONS_LIST

inherit

	DS_LINKED_LIST [AP_OPTION]
		rename
			make as old_make
		end

create

	make

feature{NONE} -- Initialization

	make (an_option: AP_OPTION) is
			-- Initialize with `an_option' as the `introduction_option'.
		require
			not_void: an_option /= Void
		do
			old_make
			set_introduction_option (an_option)
			set_parameters_description ("")
		ensure
			option_set: introduction_option = an_option
		end
	
feature -- Access

	introduction_option: AP_OPTION
			-- Option that will introduce this alternative options list

	parameters_description: STRING
			-- Description of the parameters
	
feature -- Element change

	set_introduction_option (an_option: AP_OPTION) is
			-- Set `introduction_option' to `an_option'.
		require
			not_void: an_option /= Void
		do
			introduction_option := an_option
		ensure
			option_set: introduction_option = an_option
		end

	set_parameters_description (a_string: STRING) is
			-- Set the description for parameters to `a_string'.
		require
			not_void: a_string /= Void
		do
			parameters_description := a_string
		ensure
			name_set: parameters_description = a_string
		end
	
invariant
	
	introduction_option_not_void: introduction_option /= Void
	paramters_description_not_void: parameters_description /= Void
	
end
