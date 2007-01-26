indexing
	
	description:
	
		"External resolver using strings for entity content"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
	
class XM_STRING_EXTERNAL_RESOLVER

inherit

	XM_EXTERNAL_RESOLVER

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make
	
feature {NONE} -- Creation

	make is
			-- Make.
		do
			create strings.make_map_default
			strings.set_key_equality_tester (string_equality_tester)
			last_error := "no stream"
		ensure
			empty: strings.is_empty
		end
		
feature -- Access

	strings: DS_HASH_TABLE [STRING, STRING]
			-- Table of strings indexed by resolution names.

feature -- Action(s)

	resolve (a_system_name: STRING) is
			-- Open file with corresponding name.
		do
			if strings.has (a_system_name) then
				last_error := Void
				create {KL_STRING_INPUT_STREAM} last_stream.make (strings.item (a_system_name))
			else
				last_error := STRING_.concat ("cannot find stream named: ", a_system_name)
				last_stream := Void
			end
		end

feature -- Result

	last_stream: KI_CHARACTER_INPUT_STREAM
			-- File matching stream.

	last_error: STRING
			-- Last error.

	has_error: BOOLEAN is
			-- Is there an error.
		do
			Result := last_error /= Void
		end

invariant

	error_or_stream: last_stream /= Void xor last_error /= Void
	strings_not_void: strings /= Void

end
