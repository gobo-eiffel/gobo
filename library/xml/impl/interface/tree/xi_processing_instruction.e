indexing


	description:

		"Objects that represent XML processing instruction nodes"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XI_PROCESSING_INSTRUCTION

inherit

	XI_NODE

feature {ANY} -- Access

	target: UC_STRING is
			-- target of this processing instruction. XML defines this as being the
			-- first token following the markup that begins the processing instruction.
		deferred
		end

	data: UC_STRING is
			-- content of this processing instruction. This is from the first non
			-- white space character after the target to the character immediately
			-- preceding the ?>.
		deferred
		end

invariant

	target_not_void: target /= Void
	data_not_void: data /= Void

end -- class XI_PROCESSING_INSTRUCTION
