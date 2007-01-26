indexing

	description:

		"Command-line parsers for 'gexace'"

	system: "Gobo Eiffel Xace"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEXACE_COMMAND_LINE_PARSER

inherit

	KL_SHARED_ARGUMENTS

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new command-line parser.
		do
			reset
		end

feature -- Operations

	reset is
			-- Reset internal option position to first option
			-- must be called before first use.
		do
			next_option_position := 1
		end

	consume_option is
			-- Move `next_token_position' to the next token position.
		do
			next_option_position := next_option_position + 1
		end

feature -- Status report

	has_next_option: BOOLEAN is
			-- Is there an unconsumed token left?
		do
			Result := is_valid_option_position (next_option_position)
		end

	is_next_option_long_option: BOOLEAN is
			-- Is the next option a long option (with or without a value)?
		local
			arg: STRING
		do
			if has_next_option then
				arg := next_option
				Result := arg.count >= 2 and then
					 STRING_.same_string (arg.substring (1, 2), "--")
			end
		end

	has_next_option_value: BOOLEAN is
			-- Has the next option a value?
		require
			has_next_option: has_next_option
			next_option_is_long_option: is_next_option_long_option
		local
			i: INTEGER
			arg: STRING
		do
			arg := next_option
			i := arg.index_of ('=', 1)
			Result := (i >= 1 and i < arg.count)
		end

feature -- Access

	next_option: STRING is
			-- Next option on command-line
		require
			has_next_option: has_next_option
		do
			Result := Arguments.argument (next_option_position)
		ensure
			next_option_not_void: Result /= Void
		end

	next_option_value: STRING is
			-- Value of next option
		require
			next_option_is_long_option: is_next_option_long_option
			has_next_option_value: has_next_option_value
		local
			i: INTEGER
			arg: STRING
		do
			arg := next_option
			i := arg.index_of ('=', 1)
			Result := arg.substring (i + 1, arg.count)
		ensure
			next_option_value_not_void: Result /= Void
		end

feature -- Matching

	match_long_option (an_option_name: STRING): BOOLEAN is
			-- Is there a next option on the command-line and
			-- is this option a long option whose name is
			-- `an_option_name' (Note that `an_option_name'
			-- does not contain the leading '--' characters)?
		require
			an_option_name_not_void: an_option_name /= Void
		local
			arg: STRING
			nb: INTEGER
		do
			if has_next_option then
				arg := next_option
				nb := an_option_name.count + 2
				if
					arg.count >= nb and then
					(arg.item (1) = '-' and
					arg.item (2) = '-') and then
					STRING_.same_string (arg.substring (3, nb), an_option_name)
				then
					Result := (arg.count = nb or else arg.item (nb + 1) = '=')
				end
			end
		end

feature {NONE} -- Implementation

	next_option_position: INTEGER
			-- Index of next option

	is_valid_option_position (i: INTEGER): BOOLEAN is
			-- Is `i' a valid token position?
		do
			Result := (i >= 1 and i <= Arguments.argument_count)
		end

end
