indexing

	description:

		"Perl-Compatible Regular Expressions written in Eiffel"

	library:		"Gobo Eiffel Regexp Library"
	author:		"Harald Erdbrügger <he@he-me.de>"
	copyright:	"Copyright (c) 2002, Harald Erdbrügger and others"
	license:		"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:			"$Date$"
	revision:	"$Revision$"


class

	RX_COMPILER


inherit

	PLATFORM

	KL_CHARACTER_ROUTINES

	KL_INTEGER_ROUTINES

	KL_IMPORTED_STRING_ROUTINES

	RX_CHARACTER_TABLES

	RX_CODER
		rename
			make as make_coder
		export
			{RX_MATCHER} all
		end


creation

	make


feature {NONE} -- Initialization

	make (a_code_pool: ARRAY [CHARACTER]) is
		do
			make_coder (a_code_pool)
			set_char_casing (default_char_casing)
			set_word_set (default_word_set)
			reset
		ensure
			not is_compiled
		end


feature {RX_COMPILER} -- Command

	reset is
		do
			compile_error := err_msg_99
		ensure
			not is_compiled
		end


feature -- Character casing

	char_casing: RX_CASING_MAPS

	set_char_casing (a_casing_maps: RX_CASING_MAPS) is
		require
			not is_compiled
			a_casing_maps /= Void
		do
			char_casing := a_casing_maps
		ensure
			char_casing = a_casing_maps
		end

	set_word_set (a_word_set: RX_CHARACTER_SET) is
		require
			not is_compiled
			a_word_set /= Void
		do
			word_set := a_word_set
		ensure
			word_set = a_word_set
		end


feature -- Query

	is_compiled: BOOLEAN is
			-- Last compilation successfully?
		do
			Result := compile_error = err_msg_0
		end

	compile_error: STRING
			-- Holds the state of the compile execution.

	error_offset: INTEGER
			-- Hold the position in pattern where the error is detected.
			-- `Result' <= 0 implies no valid position found


feature -- Public options not changeable after compilation

	is_caseless: BOOLEAN
			-- If this bit is set, letters in the pattern match both	upper
			-- and  lower	case	letters.	It	is	equivalent	to Perl's /i
			-- option.

	is_extended: BOOLEAN
			-- If this bit is set, whitespace data characters in	the  pat-
			-- tern	are  totally  ignored  except when escaped or inside a
			-- character class, and characters between an unescaped #  out-
			-- side	a	character  class	and  the	next newline character,
			-- inclusive, are also ignored. This is equivalent to Perl's /x
			-- option,	and  makes	it	possible to include comments inside
			-- complicated patterns. Note, however, that this applies  only
			-- to	data	characters. Whitespace characters may never appear
			-- within special character sequences in a pattern, for example
			-- within  the sequence (?( which introduces a conditional sub-
			-- pattern.

	is_greedy: BOOLEAN
			-- This option inverts the "greediness" of the	quantifiers	so
			-- that	they	are  not greedy by default, but become greedy if
			-- followed by "?". It is not compatible with Perl. It can also
			-- be set by a (?U) option setting within the pattern.


feature -- Public options

	is_multiline: BOOLEAN
			-- By default, PCRE treats the subject string as consisting	of
			-- a	single "line" of characters (even if it actually contains
			-- several newlines). The "start	of	line"	metacharacter (^)
			-- matches	only	at the start of the string, while the "end of
			-- line" metacharacter ($) matches	only	at	the	end  of	the
			-- string,	or	before	a	terminating	newline (unless
			-- is_dollar_endonly is set). This is the same as Perl.
			-- When is_multiline it is set, the "start of line" and	"end
			-- of	line"	constructs match immediately following or immedi-
			-- ately before any newline  in	the  subject  string,  respec-
			-- tively,	as	well	as	at	the  very  start and end. This is
			-- equivalent to Perl's /m option. If there are no "\n" charac-
			-- ters	in	a subject string, or no occurrences of ^ or $ in a
			-- pattern, setting is_multiline has no effect.

	is_dotall: BOOLEAN
			-- If this bit is	set,	a	dot	metacharater  in	the  pattern
			-- matches all characters, including newlines. Without it, new-
			-- lines are excluded. This option is equivalent to  Perl's	/s
			-- option.	A negative class such as [^a] always matches a new-
			-- line character, independent of the setting of this option.

	is_empty_allowed: BOOLEAN
			-- An empty string is not considered to be  a  valid	match	if
			-- this option is cleared. If there are alternatives in the pat-
			-- tern, they are tried. If  all	the	alternatives  match	the
			-- empty	string,	the	entire match fails. For example, if the
			-- pattern		a?b?
			-- is applied to a string not beginning with	"a"	or	"b",	it
			-- matches	the  empty string at the start of the subject. With
			-- not  is_empty_allowed,	this	match	is	not	valid, so PCRE
			-- searches	further into the string for	occurrences of "a" or
			-- "b". Perl has no direct	equivalent of is_empty_allowed, but
			-- it does make a special case of a pattern	match of the empty
			-- string  within its split()	function, and when	using the /g
			-- modifier. It is possible to emulate	Perl's	behaviour after
			-- matching a null string by first trying the  match	again	at
			-- the same offset with	is_empty_allowed	cleared, and then if
			-- that fails by advancing the starting  offset (see below) and
			-- trying an ordinary match again.

	is_dollar_endonly: BOOLEAN
			-- If this bit is set, a dollar metacharacter  in	the  pattern
			-- matches	only at the end of the subject string. Without this
			-- option, a dollar also matches immediately before  the	final
			-- character  if it is a newline (but not before any other new-
			-- lines).	The  is_dollar_endonly	option  is	ignored	if
			-- is_multiline is set. There is no equivalent to this option
			-- in Perl.

	is_bol: BOOLEAN
			-- If not set, the  first	character of the	string is not	the
			-- beginning of a line, so the circumflex	metacharacter should
			-- not match before it. Clearing this without  is_multiline (at
			-- compiletime) causes circumflex never to match.

	is_eol: BOOLEAN
			-- If not set, the end of the	string is not the end of a line,
			-- so the  dollar metacharacter should not match it nor (except
			-- in multiline mode) a newline immediately before it.  Setting
			-- this without  is_multiline	(at compile time) causes	dollar
			-- never to match.

	is_anchored: BOOLEAN
			-- If this flag is set, the pattern is forced to be  "anchored",
			-- that is, it is constrained to match only at the start of the
			-- string which is being searched (the "subject string").  This
			-- effect can also be achieved by appropriate constructs in the
			-- pattern itself (^), which is the only way to do it in Perl.


feature -- Public options setting

	set_default_options is
		require
			not is_compiled
		do
			set_caseless (False)
			set_multiline (False)
			set_dotall (False)
			set_extended (False)
			set_empty_allowed (True)
			set_dollar_endonly (False)
			set_bol (True)
			set_eol (True)
			set_anchored (False)
			set_greedy (True)
		end

	set_caseless (a_state: BOOLEAN) is
		require
			not is_compiled
		do
			is_caseless := a_state
		ensure
			is_caseless = a_state
		end

	set_extended (a_state: BOOLEAN) is
		require
			not is_compiled
		do
			is_extended := a_state
		ensure
			is_extended = a_state
		end

	set_greedy (a_state: BOOLEAN) is
		require
			not is_compiled
		do
			is_greedy := a_state
		ensure
			is_greedy = a_state
		end

	set_multiline (a_state: BOOLEAN) is
		do
			is_multiline := a_state
		ensure
			is_multiline = a_state
		end

	set_dotall (a_state: BOOLEAN) is
		do
			is_dotall := a_state
		ensure
			is_dotall = a_state
		end

	set_empty_allowed (a_state: BOOLEAN) is
		do
			is_empty_allowed := a_state
		ensure
			is_empty_allowed = a_state
		end

	set_dollar_endonly (a_state: BOOLEAN) is
		do
			is_dollar_endonly := a_state
		ensure
			is_dollar_endonly = a_state
		end

	set_bol (a_state: BOOLEAN) is
		do
			is_bol := a_state
		ensure
			is_bol = a_state
		end

	set_eol (a_state: BOOLEAN) is
		do
			is_eol := a_state
		ensure
			is_eol = a_state
		end

	set_anchored (a_state: BOOLEAN) is
		do
			is_anchored := a_state
		ensure
			is_anchored = a_state
		end


feature {RX_MATCHER} -- Internal options

	is_startline: BOOLEAN
	is_ichanged: BOOLEAN

	set_default_internal_options is
		do
			set_startline (False)
			set_ichanged (False)
		end

	set_startline (a_state: BOOLEAN) is
		do
			is_startline := a_state
		ensure
			is_startline = a_state
		end

	set_ichanged (a_state: BOOLEAN) is
		do
			is_ichanged := a_state
		ensure
			is_ichanged = a_state
		end

	optchanged:		BIT 8

	ims_from_options: BIT 8 is
		do
			if is_caseless then
				Result := Result or caseless_mask
			end
			if is_multiline then
				Result := Result or multiline_mask
			end
			if is_dotall then
				Result := Result or dotall_mask
			end
		end

	set_options_from_ims (a_bits: BIT 8) is
		do
			is_caseless := (a_bits and caseless_mask) = caseless_mask
			is_multiline := (a_bits and multiline_mask) = multiline_mask
			is_dotall := (a_bits and dotall_mask) = dotall_mask
		end


feature {NONE} -- Compiler command

	compile_pattern (a_pattern: STRING) is
			-- Compiles the regular expression in a_pattern. the
			-- behaviour of the compiler will be manipulate by the
			-- various option flags.
			-- Sets `is_compiled' to true if the pattern successfuly
			-- compiled else descibes `error_message' and `error_offset'
			-- the situation
		require
			a_pattern /= Void
		local
			opt: BIT 8
		do
			if pattern = Void then
				pattern := STRING_.make (a_pattern.count+1)
			end
			pattern.copy (a_pattern)
			pattern.append_character ('%U') -- the terminating character
			pattern_index := 1
			code_index := 0
			subexpression_count := 0
			maxbackrefs := 0
			set_default_internal_options
			optchanged := undef_mask
			first_character := -1
			required_character := -1
			regex_countlits := -1
			compile_error := Void
			error_offset := pattern_index

			--		debug
			--			print ("%NCOMPILING PATTERN: ");print(a_pattern);print("%N")
			--			print_options
			--		end
			put_opcode_at (op_bra, code_index)
			compile_regex (undef_mask, False, False, -1)

			if compile_error = Void and then pattern_index < pattern.count then
				-- If not reached end of pattern on success, there's an
				-- excess bracket.
				compile_error := err_msg_22
			elseif (maxbackrefs > subexpression_count) then
				-- Give an error if there's back reference to a non-existent
				-- capturing subpattern.
				compile_error := err_msg_15
			end
			if compile_error = Void then
				compile_error := err_msg_0

				-- Fill in the terminating state
				emit_opcode (op_end)
				-- fix the code-size
				code.resize (code.lower, code_index - code.lower)

				opt := ims_from_options
				if not is_anchored then
					-- If the anchored option was not passed, set flag if
					-- we can determine that the pattern is anchored by
					-- virtue of ^ characters or \A or anything else (such
					-- as starting with .* when DOTALL is set).	for
					-- introspection reset code_index
					code_index := code.lower
					if can_anchored (opt) then
						-- for introspection reset code_index
						code_index := code.lower
						set_anchored (True)
					else
						-- Otherwise, see if we can determine what the first
						-- character has to be, because that speeds up
						-- unanchored matches no end. If not, see if we can
						-- set the PCRE_STARTLINE flag. This is helpful for
						-- multiline matches when all branches start with
						-- ^. and also when all branches start with .* for
						-- non-DOTALL matches.	for introspection reset
						-- code_index
						code_index := code.lower
						opt := find_firstchar (opt)
						-- for introspection reset code_index
						code_index := code.lower
						if first_character < 0 and then has_startline then
							set_startline (True)
						end
					end
				end

				-- Save the last required character if there are at least
				-- two literal characters on all paths, or if there is no
				-- first character setting.
				if regex_countlits <= 1 and then first_character >= 0 then
					required_character := -1
				end
			else
				error_offset := pattern_index
			end
			--		debug
			--			if (not is_compiled) then
			--				print ("COMPILER ERROR: "); print(compile_error)
			--				print (" at "); print(error_offset)
			--				print (" character: "); print(pattern.item(error_offset))
			--			end
			--			print_compiled_pattern
			--		end
		end


feature {RX_CODER} -- Compiler interface to the (generated) code

	maxlit: INTEGER is 255
			-- The number of bytes in a literal character string above
			-- which we can't add any more is different when UTF-8
			-- characters may be encountered.


feature {NONE} -- Implementation

	pattern: STRING
			-- The regular expression pattern which was (tried to) compiled.

	pattern_index: INTEGER
			-- Index to the actual character in pattern.

	subexpression_count: INTEGER
			-- Number of used brakets.

	maxbackrefs: INTEGER
			-- Maximum backref number.

	first_character: INTEGER
			-- First character in regular expression (if any)
			-- else -1.

	required_character: INTEGER
			-- A required character in regular expression (if any)
			-- else -1 or -2.

	regex_countlits: INTEGER
			-- Mandatory literal character count.


feature {NONE} -- Implementation

	compile_regex (a_changed_options: BIT 8; a_in_group, a_lookbehind: BOOLEAN; a_condref: INTEGER) is
			-- On entry, pattern_index is pointing past the bracket
			-- character, but on return it points to the closing bracket,
			-- or vertical bar, or end of string.
			-- The code_index variable is pointing at the byte into which
			-- the BRA operator has been stored. If the ims options are
			-- changed at the start (for a (?ims: group) or during any
			-- branch, we need to insert an op_opt item at the start of
			-- every following branch to ensure they get set correctly at
			-- run time, and also pass the new options into every
			-- subsequent branch compile.
			-- Argument:
			--	`a_lookbehind'	TRUE if this is a lookbehind assertion
			--	`a_condref'		>= 0 for OPT_CREF setting at start of conditional group
		local
			last_branch: INTEGER
			start_bracket: INTEGER
			reverse_count: INTEGER
			saved_reqchar, saved_countlits: INTEGER
			length: INTEGER
			changed_options: BIT 8
			old_options: BIT 8
			stop: BOOLEAN
		do
			changed_options := a_changed_options
			old_options := ims_from_options
			last_branch := code_index
			start_bracket := code_index

			required_character := -1
			regex_countlits := Maximum_integer
			code_index := code_index + 3

			-- At the start of a reference-based conditional group,
			-- insert the reference number as an op_cref item.
			if (a_condref >= 0) then
				emit_opcode (op_cref)
				emit_int8 (a_condref)
			end

			-- Loop for each alternative branch
			from until stop loop
				-- Handle change of options
				if (changed_options and undef_mask) /= undef_mask then
					emit_option_bits (changed_options)
					set_options_from_ims (changed_options)
				end

				if a_lookbehind then
					-- Set up dummy op_reverse if lookbehind assertion
					emit_opcode (op_reverse)
					reverse_count := code_index
					emit_int16 (0)
				end


				-- Save some vars
				saved_reqchar := required_character
				saved_countlits := regex_countlits

				-- set for compilation
				optchanged := changed_options

				-- Now compile the branch
				compile_branch (a_in_group)

				changed_options := optchanged
				if (compile_error = Void) then
					-- Fill in the length of the last branch
					length := code_index - last_branch
					put_int16_code_at (length, last_branch + 1)

					-- Save the last required character if all branches
					-- have the same; a current- value of -1 means unset,
					-- while -2 means "previous branch had no last required
					-- char".
					if (saved_reqchar /= -2) then
						if (required_character >= 0) then
							if (saved_reqchar = -1) then
								saved_reqchar := required_character
							elseif (saved_reqchar /= required_character) then
								saved_reqchar := -2
							end
						else
							saved_reqchar := -2
						end
					end

					-- Keep the shortest literal count
					if (regex_countlits < saved_countlits) then
						saved_countlits := regex_countlits
					end
					required_character := saved_reqchar
					regex_countlits := saved_countlits

					-- If lookbehind, check that this branch matches a
					-- fixed-length string, and put the length into the
					-- op_reverse item. Temporarily mark the end of the
					-- branch with op_end.
					if a_lookbehind then
						put_opcode_at (op_end, code_index)
						length := find_fixed_code_length (last_branch)
						if (length < 0) then
							compile_error := err_msg_25
						else
							put_int16_code_at (length, reverse_count)
						end
					end

					-- Reached end of expression, either ')' or end of
					-- pattern. Insert a terminating ket and the length
					-- of the whole bracketed item, and return, leaving
					-- the pointer at the terminating char. If any of the
					-- ims options were changed inside the group,
					-- compile a resetting op-code following.
					if pattern.item (pattern_index) /= '|' then
						length := code_index - start_bracket
						emit_opcode (op_ket)
						emit_int16 (length)
						if (changed_options and undef_mask) /= undef_mask then
							emit_option_bits (old_options)
						end
						stop := True

					else
						-- Another branch follows; insert an "or" node and
						-- advance the pointer.
						put_opcode_at (op_alt, code_index)
						last_branch := code_index
						code_index := code_index + 3
						pattern_index := pattern_index + 1
					end
				else
					stop := True
				end -- if compile_error = Void
			end -- from
		end -- compile_regex


feature {NONE} -- compiler helpers for compile

	first_significant_code (a_options, a_optbit: BIT 8; a_optstop: BOOLEAN): BIT 8 is
			-- This is called by several functions that scan a compiled
			-- expression looking for a fixed first character, or an
			-- anchoring op code etc. It skips over things that do not
			-- influence this. For one application, a change of caseless
			-- option is important.
			-- Arguments:
			--	options	external options
			--	optbit	the option bit (s) whose changing is significant, or
			--				zero if none are
			--	optstop	TRUE to return on option change, otherwise change
			--				the options value and continue
		local
			icode, op: INTEGER
			stop: BOOLEAN
		do
			from
				Result := a_options
				icode := code_index
			until
				stop
			loop
				inspect
					code.item (icode).code

				when op_opt then
					if a_optbit.to_integer /= 0 and then
						((to_bit_8 (code.item (icode+1)) and a_optbit) /= (Result and a_optbit)) then
						if a_optstop then
							stop := true
						else
							Result := to_bit_8 (code.item (icode + 1))
							icode := icode + 2
						end
					else
						icode := icode + 2
					end

				when op_cref then
					icode := icode + 2

				when op_word_boundary, op_not_word_boundary then
					icode := icode + 1

				when op_assert_not, op_assertback, op_assertback_not then
					from op := op_alt until op /= op_alt loop
						icode := icode + int16_code_at(icode + 1)
						op := code.item (icode).code
					end
					icode := icode + 3

				else
					stop := true
				end
			end
			code_index := icode
		ensure
			code.valid_index (code_index)
		end


	find_firstchar (a_options: BIT 8): BIT 8 is
			-- Try to find out if there is a fixed first character. This
			-- is called for unanchored expressions, as it speeds up
			-- their processing quite considerably.
			-- Consider each alternative branch. If they all start with
			-- the same char, or with a bracket all of whose alternatives
			-- start with the same char (recurse ad lib), then we set
			-- first_character to that char, otherwise to -1.
			-- Arguments:
			--	options		pointer to the options (used to check casing changes)
			-- Returns:		options
		local
			icode: INTEGER
			op, c: INTEGER
			stop: BOOLEAN
		do
			from
				icode := code_index
				Result := a_options
				first_character := -1
				op := op_alt
			until
				op /= op_alt or else stop
			loop
				code_index := icode + 3
				Result := first_significant_code (Result, caseless_mask, TRUE)
				op := code.item (code_index).code
				if (op >= op_bra) then
					op := op_bra
				end
				inspect
					op
				when op_bra, op_assert, op_once, op_cond then
					c := first_character
					Result := find_firstchar (Result)
					if (first_character < 0) then
						stop := true
					elseif (c < 0) then
						-- new first_character found
					elseif (c /= first_character) then
						first_character := -1
						stop := true
					end

				when op_exact, op_chars, op_plus, op_minplus then
					if op = op_exact then
						code_index := code_index + 2
					elseif op = op_chars then
						code_index := code_index + 1
					end
					if (first_character < 0) then
						first_character := code.item (code_index + 1).code
					elseif (first_character /= code.item(code_index + 1).code) then
						first_character := -1
						stop := true
					end

				else
					first_character := -1
					stop := true
				end

				if not stop then
					icode := icode + int16_code_at(icode + 1)
					op := code.item (icode).code
				end
			end
		end


	can_anchored (a_options: BIT 8): BOOLEAN is
			-- Try to find out if this is an anchored regular
			-- expression. Consider each alternative branch. If they all
			-- start with op_sod or op_circ, or with a bracket all of
			-- whose alternatives start with op_sod or op_circ (recurse
			-- ad lib), then it's anchored. However, if this is a
			-- multiline pattern, then only op_sod counts, since op_circ
			-- can match in the middle.
			-- A branch is also implicitly anchored if it starts with .*
			-- and DOTALL is set, because that will try the rest of the
			-- pattern at all possible matching points, so there is no
			-- point trying them again.
		local
			icode: like code_index
			op: INTEGER
			opt: BIT 8
		do
			from
				opt := a_options
				icode := code_index
				Result := true
				op := op_alt
			until
				op /= op_alt or else not Result
			loop
				code_index := icode + 3
				opt := first_significant_code (opt, multiline_mask, false)
				op := code.item (code_index).code
				if (op >= op_bra or else op = op_assert or else op = op_once or else op = op_cond) then
					Result := can_anchored (opt)
				elseif (op = op_typestar or else op = op_typeminstar) and then (opt and dotall_mask) = dotall_mask then
					Result := code.item (code_index + 1).code = op_any
				else
					Result := op = op_sod or else (op = op_circ and then (opt and multiline_mask) /= multiline_mask)
				end
				if Result then
					icode := icode + int16_code_at(icode + 1)
					op := code.item (icode).code
				end
			end
		end -- can_anchored


	has_startline: BOOLEAN is
			-- This is called to find out if every branch starts with ^
			-- or .* so that "first char" processing can be done to speed
			-- things up in multiline matching and for non-DOTALL
			-- patterns that start with .* (which must start at the
			-- beginning or after \n).
		local
			icode: INTEGER
			op: INTEGER
			opt: BIT 8
		do
			from
				icode := code_index
				Result := true
				op := op_alt
			until
				op /= op_alt or else not Result
			loop
				code_index := icode + 3
				opt := first_significant_code (opt, 0B, FALSE)
				op := code.item (code_index).code
				if (op >= op_bra or else op = op_assert or else op = op_once or else op = op_cond) then
					Result := has_startline
				elseif (op = op_typestar or else op = op_typeminstar) then
					Result := code.item (code_index + 1).code = op_any
				else
					Result := op = op_circ
				end
				if Result then
					icode := icode + int16_code_at(icode + 1)
					op := code.item (icode).code
				end
			end
		end -- has_startline


feature {NONE} -- Code info

	find_fixed_code_length (a_code: INTEGER): INTEGER is
			-- Scan a pattern and compute the fixed length of subject
			-- that will match it, if the length is fixed. This is needed
			-- for dealing with backward assertions.
			-- Returns:	the fixed length, or -1 if there is no fixed length
		local
			cc, d, op: INTEGER
			branchlength: INTEGER
			stop: BOOLEAN
		do
			Result := -1
			cc := a_code + 3

			-- Scan along the opcodes for this branch. If we get to the
			-- end of the branch, check the length against that of the
			-- other branches.
			from
			until
				stop
			loop
				op := code.item (cc).code
				if (op > op_bra) then
					op := op_bra
				end

				inspect
					op

				when op_bra, op_once, op_cond then
					d := find_fixed_code_length (cc)
					if (d < 0) then
						Result := -1
						stop := true
					else
						branchlength := branchlength + d
						from
							cc := cc + int16_code_at(cc+1)
						until
							code.item (cc).code /= op_alt
						loop
							cc := cc + int16_code_at(cc+1)
						end
						cc := cc + 3
					end

				when op_alt, op_ket, op_ketrmax, op_ketrmin, op_end then
					-- Reached end of a branch; if it's a ket it is the end
					-- of a nested call. If it's ALT it is an
					-- alternation in a nested call. If it is END it's
					-- the end of the outer call. All can be handled by the
					-- same code.
					if (Result < 0) then
						Result := branchlength
					elseif (Result /= branchlength) then
						Result := -1
						stop := true
					end
					if not stop then
						if (op /= op_alt) then
							stop := true
						else
							cc := cc + 3
							branchlength := 0
						end
					end

				when op_assert, op_assert_not, op_assertback, op_assertback_not then
					-- Skip over assertive subpatterns
					from
						cc := cc + int16_code_at(cc+1)
					until
						code.item (cc).code /= op_alt
					loop
						cc := cc + int16_code_at(cc+1)
					end
					cc := cc + 3

				when op_reverse then
					-- Skip over things that don't match chars
					cc := cc + 3

				when op_cref, op_opt then
					-- Skip over things that don't match chars
					cc := cc + 2

				when op_sod, op_eod, op_eodn, op_circ, op_doll, op_not_word_boundary, op_word_boundary then
					-- Skip over things that don't match chars
					cc := cc + 1

				when op_chars then
					-- Handle char strings
					cc := cc + 1
					branchlength := branchlength + code.item(cc).code
					cc := cc + code.item(cc).code + 1

				when op_exact, op_typeexact then
					-- Handle exact repetitions
					branchlength := branchlength + int16_code_at(cc+1)
					cc := cc + 4

				when op_not_digit, op_digit, op_not_whitespace, op_whitespace, op_not_wordchar, op_wordchar, op_any then
					-- Handle single-char matchers
					branchlength := branchlength + 1
					cc := cc + 1

				when op_class then --@@@HE maybe add op_ref
					-- Check a class for variable quantification
					if (op = op_ref) then
						--@@@HE should never happen, missing op_ref in when
						cc := cc + 2
					else
						cc := cc + 33
					end
					op := code.item (cc).code
					inspect
						op
					when op_crstar, op_crminstar, op_crquery, op_crminquery then
						Result := -1
						stop := true

					when op_crrange, op_crminrange then
						if (int16_code_at(cc+1) /= int16_code_at(cc+3)) then
							Result := -1
							stop := true
						else
							branchlength := branchlength + int16_code_at(cc+1)
							cc := cc + 5
						end

					else
						branchlength := branchlength + 1
					end -- inspect

				else
					-- Anything else is variable length
					Result := -1
					stop := true
				end -- inspect
			end -- from
		ensure
			Result < 0 implies Result = -1
		end -- find_fixed_code_length


	compile_branch (a_in_group: BOOLEAN) is
			-- Scan the pattern, compiling it into the code vector.
		local
			bravalue, length, val: INTEGER
			condcount: INTEGER
			previous: INTEGER
			tempcode, tc: INTEGER
			condref: INTEGER
			sub_countlits, sub_reqchar: INTEGER
			prevreqchar: INTEGER
			saved_countlits, saved_reqchar: INTEGER
			newoptions, opt: BIT 8
			old_options: BIT 8
			old_extended, old_greedy: BOOLEAN
			c: CHARACTER
			stop, flag: BOOLEAN
		do
			-- Initialize no required char, and count of literals
			required_character := -1
			regex_countlits := 0
			prevreqchar := -1

			old_options := ims_from_options
			old_extended := is_extended
			old_greedy := is_greedy
			-- Switch on next character until the end of the branch
			from
				if is_extended then
					scan_comment
				end
			until
				stop or else pattern_index >= pattern.count or else compile_error /= Void
			loop
				c := pattern.item (pattern_index)
				if c = '{' and then compile_counted_repeats(previous, prevreqchar, sub_countlits) then
					previous := 0
				else
					inspect
						c
					when '|', ')' then --@@@HE '%U' removed - it's a normal character
					-- The branch terminates at end of string, |, or )
					pattern_index := pattern_index - 1
					stop := true

					when '^' then
						-- Handle single-character metacharacters
						previous := 0
						emit_opcode (op_circ)

					when '$' then
						previous := 0
						emit_opcode (op_doll)

					when '.' then
						previous := code_index
						emit_opcode (op_any)

					when '[' then
						-- Character classes. These always build a 32-byte
						-- bitmap of the permitted characters, except in
						-- the special case where there is only one
						-- character. For negated classes, we build the
						-- map as usual, then invert it at the end.
						previous := code_index
						compile_character_classes

					when '*' then
						compile_repeats (0, -1, previous, prevreqchar, sub_countlits)
						previous := 0

					when '+' then
						compile_repeats (1, -1, previous, prevreqchar, sub_countlits)
						previous := 0

					when '?' then
						compile_repeats (0, 1, previous, prevreqchar, sub_countlits)
						previous := 0

					when '(' then
						-- Start of nested bracket sub-expression, or
						-- comment or lookahead orlookbehind or option
						-- setting or condition. First deal with special
						-- things that can come after a bracket; all are
						-- introduced by ?, and the appearance of any of
						-- them means that this is not a referencing
						-- group. They were checked for validity in the
						-- first pass over the string, so we don't have to
						-- check for syntax errors here.
						opt := ims_from_options
						newoptions := opt
						condref := -1
						bravalue := -1

						pattern_index := pattern_index + 1
						if (pattern.item(pattern_index) = '?') then
							pattern_index := pattern_index + 1
							inspect
								pattern.item (pattern_index)

							when '#' then
								-- Comment; skip to ket
								from
									tc := pattern_index + 1
								until
									tc >= pattern.count or else pattern.item(tc) = ')'
								loop
									tc := tc + 1
								end
								if tc >= pattern.count then
									-- unexpected end of pattern
									pattern_index := tc - 1
								else
									pattern_index := tc
								end

							when ':' then
								-- Non-extracting bracket
								bravalue := op_bra
								pattern_index := pattern_index + 1

							when '(' then
								-- Conditional group
								bravalue := op_cond
								pattern_index := pattern_index + 1
								if pattern.item (pattern_index) >= '0' and pattern.item (pattern_index) <= '9' then
									condref := scan_decimal_number (10)
									if pattern.item (pattern_index) /= ')' then
								compile_error := err_msg_26
									end
									if (condref = 0) then
										compile_error := err_msg_35
									else
										pattern_index := pattern_index + 1
									end
								else
									tc := pattern_index
									if pattern.item (tc) /= '?' or else (pattern.item(tc+1) /= '=' and then
																					pattern.item (tc+1) /= '!' and then pattern.item(tc+1) /= '<') then
										compile_error := err_msg_28
									end
									pattern_index := tc - 1
								end

							when '=' then
								-- Positive lookahead
								bravalue := op_assert
								pattern_index := pattern_index + 1

							when '!' then
								-- Negative lookahead
								bravalue := op_assert_not
								pattern_index := pattern_index + 1

							when '<' then
								-- Lookbehinds
								pattern_index := pattern_index + 1
								inspect
									pattern.item (pattern_index)
								when '=' then
									-- Positive lookbehind
									bravalue := op_assertback
									pattern_index := pattern_index + 1
								when '!' then
									-- Negative lookbehind
									bravalue := op_assertback_not
									pattern_index := pattern_index + 1
								else
									-- Syntax error
									compile_error := err_msg_24
								end

							when '>' then
								-- One-time brackets
								bravalue := op_once
								pattern_index := pattern_index + 1

							when 'R' then
								-- Pattern recursion
								emit_opcode (op_recurse)
								pattern_index := pattern_index + 1

							else
								-- Option setting
								from
									c := pattern.item (pattern_index)
									flag := True
								until
									c = ')' or else c = ':' or else compile_error /= Void
								loop
									-- Set up the changed option bits, but don't change anything yet.
									inspect
										c
									when '-' then
										flag := not flag
									when 'i' then
										if flag then
											newoptions := newoptions or caseless_mask
										else
											newoptions := newoptions and not caseless_mask
										end
									when 'm' then
										if flag then
											newoptions := newoptions or multiline_mask
										else
											newoptions := newoptions and not multiline_mask
										end
									when 's' then
										if flag then
											newoptions := newoptions or dotall_mask
										else
											newoptions := newoptions and not dotall_mask
										end
									when 'x' then
										is_extended := flag
									when 'U' then
										is_greedy := not flag

									else
										compile_error := err_msg_12
									end
									pattern_index := pattern_index + 1
									c := pattern.item (pattern_index)
								end
								if is_caseless /= ((newoptions and caseless_mask) = caseless_mask) then
									set_ichanged (True)
								end

								if (c = ')') then
									-- If the options ended with ')' this is
									-- not the start of a nested group with
									-- option changes, so the options change at
									-- this level. At top level there is
									-- nothing else to be done (the options
									-- will in fact have been set from the
									-- start of compiling as a result of the
									-- first pass) but at an inner level we
									-- must compile code to change the ims
									-- options if necessary, and pass the new
									-- setting back so that it can be put at
									-- the start of any following branches, and
									-- when this group ends, a resetting item
									-- can be compiled.
									if a_in_group then
										if (opt xor (newoptions and ims_mask)).to_integer /= 0 then
											optchanged := newoptions and ims_mask
											emit_option_bits (optchanged)
										end
									else
										-- we are on the top-level - all options
										-- are global
										old_greedy := is_greedy
										old_extended := is_extended
										old_options := newoptions
									end
									-- Change options at this level
									set_options_from_ims (newoptions)
									previous := 0 -- This item can't be repeated

								else
									-- If the options ended with ':' we are
									-- heading into a nested group with
									-- possible change of options. Such groups
									-- are non-capturing and are not
									-- assertions of any kind. All we need to
									-- do is skip over the ':' the
									-- newoptions value is handled below.
									bravalue := op_bra
									pattern_index := pattern_index + 1
								end
							end

						else
							-- Else we have a referencing group; adjust the opcode.
							subexpression_count := subexpression_count + 1
							if (subexpression_count > extract_max) then
								compile_error := err_msg_13
							else
								bravalue := op_bra + subexpression_count
							end
						end

						if bravalue >= 0 then
							-- Process nested bracketed re. Assertions may
							-- not be repeated, but other kinds can be. We
							-- copy code into a non-register variable in
							-- order to be able to pass its address
							-- because some compilers complain
							-- otherwise. Pass in a new setting for the
							-- ims options if they have changed.
							if bravalue >= op_once then
								previous := code_index
							else
								previous := 0
							end
							put_opcode_at (bravalue, code_index)
							tempcode := code_index
							-- save reqchar and countlits for later
							-- use. compile_regex change these values
							saved_reqchar := required_character
							saved_countlits := regex_countlits
							if (opt xor (newoptions and ims_mask)).to_integer = 0 then
								opt := undef_mask
							else
								opt := newoptions and ims_mask
							end
							compile_regex (
							opt, -- Pass ims options if changed
							True, -- Set for all nested groups
							(bravalue = op_assertback or else bravalue = op_assertback_not), -- TRUE if back assert
							condref) -- Condition reference number
							sub_countlits := regex_countlits
							sub_reqchar := required_character
							regex_countlits := saved_countlits
							required_character := saved_reqchar
							if compile_error = Void then
								-- At the end of compiling, code is still
								-- pointing to the start of the group,
								-- while tempcode has been updated to point
								-- past the end of the group and any option
								-- resetting that may follow it. The pattern
								-- pointer (ptr) is on the bracket.
								if (bravalue = op_cond) then
									-- If this is a conditional bracket, check
									-- that there are no more than two
									-- branches in the group.
									from
										condcount := 1
										tc := tempcode + int16_code_at(tempcode + 1)
									until
										code.item (tc).code = op_ket
									loop
										condcount := condcount + 1
										tc := tc + int16_code_at(tc + 1)
									end
									if (condcount > 2) then
										compile_error := err_msg_27
									end
								end

								-- Handle updating of the required
								-- character. If the subpattern didn't set
								-- one, leave it as it was. Otherwise, update
								-- it for normal brackets of all kinds,
								-- forward assertions, and conditions with two
								-- branches. Don't update the literal count
								-- for forward assertions, however. If the
								-- bracket is followed by a quantifier with
								-- zero repeat, we have to back off. Hence
								-- the definition of prevreqchar and
								-- subcountlits outside the main loop so
								-- that they can be accessed for the back off.
								if (sub_reqchar > 0) and then
									(bravalue >= op_bra or else bravalue = op_once or else bravalue = op_assert
										or else (bravalue = op_cond and then condcount = 2)) then
									prevreqchar := required_character
									required_character := sub_reqchar
									if (bravalue /= op_assert) then
										regex_countlits := regex_countlits + sub_countlits
									end
								end
								if (pattern.item(pattern_index) /= ')') then
									-- Error if hit end of pattern
									compile_error := err_msg_14
								end
							end
						end

					else
						-- Handle a run of data characters until a
						-- metacharacter is encountered.	The first
						-- character is guaranteed not to be whitespace or #
						-- when the extended flag is set.
						previous := code_index -- may overriden by metacharacterhandling
						emit_opcode (op_chars)
						tempcode := code_index -- used later to store the count of char
						code_index := code_index + 1 -- skip length-byte
						length := 0
						from
							c := pattern.item (pattern_index)
							flag := False
						until
							flag
						loop
							-- Backslash may introduce a data char or a
							-- metacharacter. Escaped items are checked
							-- for validity in the pre-compiling pass. Stop
							-- the string- before a metaitem.
							if c = '\' then
								-- Check \ for being a real metacharacter; if
								-- not, fall through and handle it as a
								-- data character at the start of a
								-- string. Escape items are checked for
								-- validity in the pre-compiling pass.
								val := scan_escape (subexpression_count, false)
								if val < 0 then
									-- Handle metacharacters introduced by
									-- \. For ones like \d, the ESC_ values
									-- are arranged to be the negation of the
									-- corresponding op_values. For the back
									-- references, the values are esc_ref plus
									-- the reference number. Only back
									-- references and those types that consume
									-- a character may be repeated.	We can
									-- test for values between esc_b and esc_z
									-- for the latter; this may have to
									-- change if any new ones are ever created.
									if length = 0 then
										-- no characters emited for op_chars, so reset
										code_index := previous
									else
										previous := code_index
									end
									if -val >= esc_ref then
										emit_opcode (op_ref)
										emit_int8 (-val - esc_ref)
									else
										if -val <= esc_lcb or else -val >= esc_ucz then
											previous := 0
										end
										emit_opcode (-val)
									end
									pattern_index := pattern_index + 1
									c := pattern.item (pattern_index)
									flag := true
								else
									-- BdB: to be fixed!!!
									debug
										if val > 255 then
											print ("@@@@@@@@@@ value is: ")
											print (val)
											print ("%N")
										end
									end
									if val > 255 then
										c := to_character (val - 256)
									else
										c := to_character (val)
									end
									emit_character (c)
									length := length + 1
									flag := compile_error /= Void
								end
							else
								emit_character (c)
								length := length + 1
							end
							if not flag then
								pattern_index := pattern_index + 1
								if is_extended then
									scan_comment
								end
								c := pattern.item (pattern_index)
								flag := pattern_index >= pattern.count or else length >= maxlit or else meta_set.is_in(c)
							end
						end -- from

						if length > 0 then
							-- Update the last character and the count of literals
							if (length > 1) then
								prevreqchar := code.item (tempcode + length - 1).code
							else
								prevreqchar := required_character
							end
							required_character := code.item (tempcode + length).code
							regex_countlits := regex_countlits + length

							-- Compute the length and set it in the data
							-- vector, and advance to -- the next state.
							put_int8_code_at (length, tempcode)
						end
						if (length <= maxlit) then
							pattern_index := pattern_index - 1
						end
					end -- inspect
				end -- if
				pattern_index := pattern_index + 1
				if is_extended then
					scan_comment
				end
			end -- from -- end of big loop
			set_options_from_ims (old_options)
			is_extended := old_extended
			is_greedy := old_greedy
		end -- compile_branch


feature {NONE} -- Pure query

	check_posix_syntax (a_pattern_index: INTEGER): INTEGER is
			-- This function is called when the sequence "[:" or "[." or
			-- "[=" is encountered in a character class. It checks
			-- whether this is followed by an optional ^ and then a
			-- sequence of letters, terminated by a matching ":]" or ".]"
			-- or "=]".
		local
			set: RX_CHARACTER_SET
			i: INTEGER
			terminator: CHARACTER
		do
			from
				set := alpha_set
				i := a_pattern_index
				terminator := pattern.item (i + 1)
				if (pattern.item(i+2) = '^') then
					i := i + 3
				else
					i := i + 2
				end
			until
				not set.is_in (pattern.item(i))
			loop
				i := i + 1
			end -- from
			if (pattern.item(i) = terminator and then pattern.item(i+1) = ']') then
				Result := i
			else
				Result := -1
			end
		ensure
			Result /= -1 implies pattern.valid_index(Result)
		end -- check_posix_syntax


	check_posix_name (a_pattern_index, a_len: INTEGER): INTEGER is
			-- This function is called to check the name given in a
			-- POSIX-style class entry such as [:alnum:].
			-- Arguments:
			--	ptr			points to the first letter
			--	len			the length of the name
			-- Returns:		a value representing the name-index, or -1 if unknown
		local
			i: INTEGER
			s: STRING
		do
			from
				i := 1
				Result := -1
			until
				i > class_names.count
			loop
				s := class_names.item (i)
				if (a_len = s.count) and then strncmp(pattern, a_pattern_index, s, 1, a_len) then
					Result := i
					i := class_names.count + 1
				else
					i := i + 1
				end
			end
		ensure
			Result /= -1 implies class_sets.valid_index(Result)
		end


feature {NONE} -- Tools

	strncmp (a_str1: STRING; a_off1: INTEGER; a_str2: STRING; a_off2: INTEGER; a_len: INTEGER): BOOLEAN is
		local
			i1, i2: INTEGER
			len: INTEGER
		do
			from
				i1 := a_off1
				i2 := a_off2
				len := a_len
				Result := true
			until
				not Result or else len <= 0
			loop
				Result := a_str1.item (i1) = a_str2.item(i2)
				i1 := i1 + 1
				i2 := i2 + 1
				len := len - 1
			end
		end


feature {NONE} -- Some pattern scanning functions

	scan_octal_number (a_max_len: INTEGER): INTEGER is
			-- The actual pattern-character is the one after the digit sequence.
		local
			c: CHARACTER
			stop: INTEGER
		do
			stop := pattern_index + a_max_len
			from
				c := pattern.item (pattern_index)
			until
				c > '8' or else c < '0' or else pattern_index >= stop
			loop
				Result := Result * 8 + c.code - ('0').code
				pattern_index := pattern_index + 1
				c := pattern.item (pattern_index)
			end
		ensure
			Result >= 0
			pattern_index <= old pattern_index + a_max_len
		end


	scan_decimal_number (a_max_len: INTEGER): INTEGER is
			-- The actual pattern-character is the one after the digit sequence.
		local
			c: CHARACTER
			stop: INTEGER
		do
			stop := pattern_index + a_max_len
			from
				c := pattern.item (pattern_index)
			until
				c > '9' or else c < '0' or else pattern_index >= stop
			loop
				Result := Result * 10 + c.code - ('0').code
				pattern_index := pattern_index + 1
				c := pattern.item (pattern_index)
			end
		ensure
			Result >= 0
			pattern_index <= old pattern_index + a_max_len
		end


	scan_hex_number (a_max_len: INTEGER): INTEGER is
			-- The actual pattern-character is the one after the digit sequence.
		local
			c: CHARACTER
			stop: INTEGER
		do
			stop := pattern_index + a_max_len
			from
				c := pattern.item (pattern_index)
			until
				not xdigit_set.is_in (c) or else pattern_index >= stop
			loop
				if c < 'A' then
					Result := Result * 16 + c.code - ('0').code
				elseif c < 'a' then
					Result := Result * 16 + c.code - ('A').code + 10
				else
					Result := Result * 16 + c.code - ('a').code + 10
				end
				pattern_index := pattern_index + 1
				c := pattern.item (pattern_index)
			end
		ensure
			Result >= 0
			pattern_index <= old pattern_index + a_max_len
		end


	scan_comment is
		local
			i, j: INTEGER
		do
			j := pattern_index
			from i := j - 1 until i = j loop
				i := j
				from until not space_set.is_in (pattern.item(j)) loop
					j := j + 1
				end
				if pattern.item (j) = '#' then
					from
						j := j + 1
					until
						j >= pattern.count or else pattern.item(j) = '%N'
					loop
						j := j + 1
					end
				end
			end
			pattern_index := j
		end


feature {NONE} -- Escape characters

	esc_uca: INTEGER is 1
	esc_ucb: INTEGER is 2
	esc_lcb: INTEGER is 3
	esc_ucd: INTEGER is 4
	esc_lcd: INTEGER is 5
	esc_ucs: INTEGER is 6
	esc_lcs: INTEGER is 7
	esc_ucw: INTEGER is 8
	esc_lcw: INTEGER is 9
	esc_ucz: INTEGER is 10
	esc_lcz: INTEGER is 11

	esc_ref: INTEGER is 12


	escape_table: ARRAY [INTEGER] is
		once
			Result :=
				<<			0,			0,				0,			0,			0,			0,			0,			0,	-- 0 - 7
								0,		0, (':').code,(';').code, ('<').code,('=').code, ('>').code,('?').code,	-- 8 - ?
								('@').code, -esc_uca,	-esc_ucb,			0,	-esc_ucd,			0,			0,			0,	-- @ - G
								0,		0,			0,			0,			0,			0,				0,			0,	-- H - O
								0,		0,			0,	-esc_ucs,			0,			0,				0,	-esc_ucw,	-- P - W
								0,		0,	-esc_ucz,('[').code, ('\').code,(']').code, ('^').code,('_').code,	-- X - _
								('`').code,			7,	-esc_lcb,			0,	-esc_lcd,			27,('%F').code,			0,	-- ` - g
								0,		0,			0,			0,			0,			0,('%N').code,			0,	-- h - o
								0,		0,('%R').code,	-esc_lcs,('%T').code,			0,				0,	-esc_lcw,	-- p - w
								0,			0,	-esc_lcz>> -- x - z
		end


	escape_character (a_idx: INTEGER): INTEGER is
		do
			Result := escape_table.item (a_idx + 1)
		end


	scan_escape (a_bra_count: INTEGER; a_isclass: BOOLEAN): INTEGER is
			-- This function is called when a \ has been encountered. It
			-- either returns a positive value for a simple escape such
			-- as \n, or a negative value which encodes one of the more
			-- complicated things such as \d. When UTF-8 is enabled, a
			-- positive value greater than 255 may be returned. On entry,
			-- ptr is pointing at the \. On exit, it is on the final
			-- character of the escape sequence.
			--
			--	a_bra_count	number of previous extracting subexpression_count
			--	a_options	the options bits
			--	a_isclass	TRUE if inside a character class
			--
			--	Returns:	zero or positive => a data character
			--					negative => a special escape sequence
			--					on error, compile_error is set
		local
			old_pattern_index: like pattern_index
			c: CHARACTER
		do
			pattern_index := pattern_index + 1
			c := pattern.item (pattern_index)
			if pattern_index >= pattern.count then
				-- If backslash is at the end of the pattern, it's an error.
				compile_error := err_msg_1
			elseif not (c >= '0' and c <= 'z') then
				-- Digits or letters may have special meaning; all others
				-- are literals.
				Result := c.code
			else
				-- Do an initial lookup in a table. A non-zero result is
				-- something that can be returned immediately. Otherwise
				-- further processing may be required.
				Result := escape_character (c.code - ('0').code)
				if (Result = 0) then
					-- Escapes that need further processing, or are illegal.
					inspect
						c

					when '1' .. '9' then
						-- The handling of escape sequences consisting of a
						-- string of digits starting with one that is not
						-- zero is not straightforward. By experiment, the
						-- way Perl works seems to be as follows:

						if (not a_isclass) then
							-- Outside a character class, the digits are read
							-- as a decimal number. If the number is less
							-- than 10, or if there are that many previous
							-- extracting left brackets, then it is a back
							-- reference. Otherwise, up to three octal digits
							-- are read to form an escaped byte. Thus \123 is
							-- likely to be octal 123 (cf \0123, which is
							-- octal 012 followed by the literal 3). If the
							-- octal value is greater than 377, the least
							-- significant 8 bits are taken. Inside a
							-- character class, \ followed by a digit is
							-- always an octal number. */
							old_pattern_index := pattern_index
					Result := scan_decimal_number (10)
							if (Result < 10 or else Result <= a_bra_count) then
								if (Result > maxbackrefs) then
									maxbackrefs := Result
								end
								Result := -(esc_ref + Result)
							else
								pattern_index := old_pattern_index -- Put the pointer back
								if c >= '8' then
									Result := 0
								else
									Result := scan_octal_number (3)
								end -- if
							end -- if
						elseif (c >= '8') then
							-- Handle an octal number following \. If the
							-- first digit is 8 or 9, Perl generates a binary
							-- zero byte and treats the digit as a following
							-- literal.
							-- Thus we have to pull back the pointer by one.
							Result := 0
						else
							Result := scan_octal_number (3)
						end -- elseif
						pattern_index := pattern_index - 1

					when '0' then
						Result := scan_octal_number (3)
						Result := Result \\ 256
						pattern_index := pattern_index - 1

					when 'x' then
						-- Read just a single hex char
						pattern_index := pattern_index + 1
						Result := scan_hex_number (2)
						pattern_index := pattern_index - 1

					when 'c' then
						-- make following character an control-character
						pattern_index := pattern_index + 1
						c := pattern.item (pattern_index)
						if pattern_index >= pattern.count then
							compile_error := err_msg_2
							Result := 0
						else
							if c >= 'a' and c <= 'z' then
								c := char_casing.flip_case (c)
							end
							Result := (to_bit_8 (c) xor to_bit_8('@')).to_integer
						end

					else
						compile_error := err_msg_3
						Result := c.code
					end -- inspect
				end -- if
			end -- if
		end -- scan_escape


feature {NONE} -- Compile repeats

	output_single_repeat (a_ch: CHARACTER; a_previous, a_min, a_max, a_op_type, a_repeat_type: INTEGER) is
		local
			repeat_type: INTEGER
		do
			-- Combine the op_type with the repeat_type
			repeat_type := a_repeat_type + a_op_type

			if (a_min = 0) then
				-- A minimum of zero is handled either as the special case
				-- * or ?, or as -- an UPTO, with the maximum given.
				if (a_max = -1) then
					emit_opcode (op_star + repeat_type)

				elseif (a_max = 1) then
					emit_opcode (op_query + repeat_type)

				else
					emit_opcode (op_upto + repeat_type)
					emit_int16 (a_max)
				end

			elseif (a_min = 1 and then a_max = -1) then
				-- The case {1,} is handled as the special case +
				emit_opcode (op_plus + repeat_type)

			else
				-- The case {n,n} is just an EXACT, while the general case
				-- {n,m} is handled as an EXACT followed by an UPTO. An
				-- EXACT of 1 is optimized.
				if (a_min /= 1) then
					emit_opcode (op_exact + a_op_type) -- NB EXACT doesn't have repeat_type
					emit_int16 (a_min)

				elseif (code.item(a_previous).code = op_chars) then
					-- If the mininum is 1 and the previous item was a
					-- character string, we either have to put back the
					-- item that got cancelled if the string length was
					-- 1, or add the character back onto the end of a
					-- longer string. For a character type nothing need
					-- be done; it will just get put back
					-- naturally. Note that the final character is always
					-- going to get added below.
					if (code_index = a_previous) then
						code_index := code_index + 2
					else
						put_int8_code_at (code.item(a_previous + 1).code + 1, a_previous + 1)
					end

				elseif (code.item(a_previous).code = op_not) then
					--	For a single negated character we also have to put back the
					--	item that got cancelled.
					code_index := code_index + 1
				end

				if (a_max < 0) then
					-- If the maximum is unlimited, insert an op_star.
					emit_character (a_ch)
					emit_opcode (op_star + repeat_type)

				elseif (a_max /= a_min) then
					-- Else insert an UPTO if the max is greater than the min.
					emit_character (a_ch)
					emit_opcode (op_upto + repeat_type)
					emit_int16 (a_max - a_min)
				end
			end
			emit_character (a_ch)
		end


	compile_repeats (a_min, a_max, a_previous, a_prevreqchar, a_subcountlits: INTEGER) is
		local
			repeat_type, op_type: INTEGER
			repeat_min, repeat_max: INTEGER
			op, i, len: INTEGER
			previous, ketoffset: INTEGER
			offset, oldlinkoffset: INTEGER
			bralink: INTEGER
			c: CHARACTER
			greedy_default, greedy_non_default: BOOLEAN
		do
			-- Set up the default and non-default settings for greediness
			greedy_default := not is_greedy
			greedy_non_default := not greedy_default

			repeat_min := a_min
			repeat_max := a_max

			previous := a_previous

			if (previous = 0) then
				compile_error := err_msg_9
			else
				-- If the next character is '?' this is a minimizing
				-- repeat, by default, but if PCRE_UNGREEDY is set, it
				-- works the other way round. Advance to the next
				-- character.
				if (pattern.item(pattern_index + 1) = '?') then
					if greedy_non_default then
						repeat_type := 1
					else
						repeat_type := 0
					end
					pattern_index := pattern_index + 1
				else
					if greedy_default then
						repeat_type := 1
					else
						repeat_type := 0
					end
				end
				-- If previous was a string of characters, chop off the
				-- last one and use it as the subject of the repeat. If
				-- there was only one character, we can abolish the
				-- previous item altogether. A repeat with a zero minimum
				-- wipes out any reqchar setting, backing up to the
				-- previous value. We must also adjust the countlits
				-- value.
				op := code.item (previous).code
				if (op = op_chars) then
					len := code.item (previous + 1).code

					if (repeat_min = 0) then
						required_character := a_prevreqchar
					end
					regex_countlits := regex_countlits + repeat_min - 1
					if (len = 1) then
						c := code.item (previous + 2)
						code_index := previous
					else
						c := code.item (previous + len + 1)
						put_int8_code_at (code.item(previous + 1).code - 1, previous + 1)
						code_index := code_index - 1
					end
					op_type := 0 -- Use single-char op codes
					if (repeat_max /= 0) then
						output_single_repeat (c, previous, repeat_min, repeat_max, op_type, repeat_type)
					end

				elseif (op = op_not) then
					-- If previous was a single negated character ([^a] or
					-- similar), we use one of the special opcodes,
					-- replacing it. The code is shared with
					-- single-character repeats by adding a suitable offset
					-- into repeat_type.
					op_type := op_notstar - op_star -- Use "not" opcodes
					c := code.item (previous + 1)
					code_index := previous
					if (repeat_max /= 0) then
						output_single_repeat (c, previous, repeat_min, repeat_max, op_type, repeat_type)
					end

				elseif (op < op_eodn or else op = op_any) then
					-- If previous was a character type match (\d or
					-- similar), abolish it and create a suitable repeat
					-- item. The code is shared with single-character
					-- repeats by adding a suitable offset into
					-- repeat_type.
					op_type := op_typestar - op_star -- Use type opcodes
					c := code.item (previous)
					code_index := previous
					if (repeat_max /= 0) then
						output_single_repeat (c, previous, repeat_min, repeat_max, op_type, repeat_type)
					end

				elseif (op = op_class or else op = op_ref) then
					-- If previous was a character class or a back
					-- reference, we put the repeat stuff after it, but
					-- just skip the item if the repeat was {0,0}.
					if (repeat_max = 0) then
						code_index := previous
					else
						if (repeat_min = 0 and then repeat_max = -1) then
							emit_opcode (op_crstar + repeat_type)
						elseif (repeat_min = 1 and then repeat_max = -1) then
							emit_opcode (op_crplus + repeat_type)
						elseif (repeat_min = 0 and then repeat_max = 1) then
							emit_opcode (op_crquery + repeat_type)
						else
							emit_opcode (op_crrange + repeat_type)
							emit_int16 (repeat_min)
							if (repeat_max = -1) then
								repeat_max := 0
								emit_int16 (0)
							else
								emit_int16 (repeat_max)
							end
						end
					end

				elseif (op >= op_bra or else op = op_once or else op = op_cond) then
					-- If previous was a bracket group, we may have to
					-- replicate it in certain cases.
					len := code_index - previous

					if (repeat_max = -1) then
						-- If the maximum repeat count is unlimited, find
						-- the end of the bracket by scanning through
						-- from the start, and compute the offset back to it
						-- from the current code pointer. There may be an
						-- op_opt setting following the final KET, so we
						-- can't find the end just by going back from the
						-- code pointer.
						from i := previous until op = op_ket loop
							i := i + int16_code_at(i+1)
							op := code.item (i).code
						end
						ketoffset := code_index - i
					end

					if (repeat_min = 0) then
						-- The case of a zero minimum is special because of
						-- the need to stick op_brazero in front of it,
						-- and because the group appears once in the
						-- data, whereas in other cases it appears the
						-- minimum number of times. For this reason, it
						-- is simplest to treat this case separately, as
						-- otherwise the code gets far too mess. There
						-- are several special subcases when the minimum
						-- is zero.
						if (a_subcountlits > 0) then
							-- If we set up a required char from the bracket,
							-- we must back off to the previous value and
							-- reset the countlits value too.
							required_character := a_prevreqchar
							regex_countlits := regex_countlits - a_subcountlits
						end

						if (repeat_max = 0) then
							-- If the maximum is also zero, we just omit the
							-- group from the output altogether.
							code_index := previous
						else
							if (repeat_max <= 1) then
								-- If the maximum is 1 or unlimited, we just
								-- have to stick in the BRAZERO and do no more
								-- at this point.
								add_opcode_at (op_brazero + repeat_type, previous)
								previous := previous + 1

							else
								-- If the maximum is greater than 1 and
								-- limited, we have to replicate in a
								-- nested fashion, sticking op_brazero before
								-- each set of brackets.  The first one has
								-- to be handled carefully because it's the
								-- original copy, which has to be moved
								-- up. The remainder can be handled by code
								-- that is common with the non-zero minimum
								-- case below. We just have to adjust the
								-- value or repeat_max, since one less copy is
								-- required.
								code.resize (code.lower, code_index + 4 + 1)
								code.move (previous, code_index, 4)
								code_index := code_index + 4
								put_opcode_at (op_brazero + repeat_type, previous)
								put_opcode_at (op_bra, previous + 1)
								previous := previous + 2
								-- We chain together the bracket offset fields
								-- that have to be filled in later when the
								-- ends of the brackets are reached.
								if (bralink = 0) then
									put_int16_code_at (0, previous)
								else
									put_int16_code_at (previous - bralink, previous)
								end
								bralink := previous
								previous := previous + 2
							end

							repeat_max := repeat_max - 1
						end

					else
						-- If the minimum is greater than zero, replicate
						-- the group as many times as necessary, and
						-- adjust the maximum to the number of subsequent
						-- copies that we need.
						from i := 1 until i >= repeat_min loop
							emit_code_copy (previous, len)
							i := i + 1
						end
						if (repeat_max > 0) then
							repeat_max := repeat_max - repeat_min
						end
					end

					if (repeat_max >= 0) then
						-- This code is common to both the zero and non-zero
						-- minimum cases. If the maximum is limited, it
						-- replicates the group in a nested fashion,
						-- remembering the bracket starts on a stack. In the
						-- case of a zero minimum, the first one was set
						-- up above. In all cases the repeat_max now
						-- specifies the number of additional copies
						-- needed.
						from i := repeat_max - 1 until i < 0 loop
							emit_opcode (op_brazero + repeat_type)

							if (i /= 0) then
								-- All but the final copy start a new nesting,
								-- maintaining the chain of brackets
								-- outstanding.
								emit_opcode (op_bra)
								if (bralink = 0) then
									bralink := code_index
									emit_int16 (0)
								else
									offset := code_index - bralink
									bralink := code_index
									emit_int16 (offset)
								end
							end
							emit_code_copy (previous, len)
							i := i - 1
						end

						-- Now chain through the pending brackets, and fill
						-- in their length fields (which are holding the
						-- chain links pro tem).
						from until bralink = 0 loop
							offset := code_index - bralink + 1
							i := code_index - offset + 1
								check code.item (i-1).code = op_bra end
								oldlinkoffset := int16_code_at (i)
								if (oldlinkoffset = 0) then
									bralink := 0
								else
									bralink := bralink - oldlinkoffset
								end
								emit_opcode (op_ket)
								emit_int16 (offset)
								put_int16_code_at (offset, i)
							end -- from

						else
							-- If the maximum is unlimited, set a repeater in
							-- the final copy. We can't just offset
							-- backwards from the current code point, because
							-- we don't know if there's been an options
							-- resetting after the ket. The correct offset
							-- was computed above.
							put_opcode_at (op_ketrmax + repeat_type, code_index - ketoffset)
						end

					else
						-- Else there's some kind of shambles
						compile_error := err_msg_11
					end
				end -- if previous = 0
			end -- compile_repeats


			compile_counted_repeats (a_previous, a_prevreqchar, a_subcountlits: INTEGER): BOOLEAN is
			-- Read an item of the form {n,m}. This is called only after
			-- is_counted_repeat() has confirmed that a repeat-count
			-- quantifier exists, so the syntax is guaranteed to be
			-- correct, but we need to check the values and then call
			-- compile_repeats feature
		local
			min: INTEGER
			max: INTEGER
			i: INTEGER
			c: CHARACTER
		do
			min := 0
			max := -1 -- unlimited

			from
				i := pattern_index + 1
				c := pattern.item (i)
			until
				not (c >= '0' and c <= '9')
			loop
				min := min * 10 + c.code - ('0').code
				i := i + 1
				c := pattern.item (i)
			end
			if (min > 65535) then
				compile_error := err_msg_5
			elseif (i - pattern_index > 1) then
				-- one or more digits seen
				if c = '}' then
					max := min
					Result := True
				elseif c = ',' then
					i := i + 1
					c := pattern.item (i)
					if c /= '}' then
						from
							max := 0
						until
							not (c >= '0' and c <= '9')
						loop
							max := max * 10 + c.code - ('0').code
							i := i + 1
							c := pattern.item (i)
						end
					end
					if c = '}' then
						if max > 65535 then
							compile_error := err_msg_5
						elseif max >= 0 and then min > max then
							compile_error := err_msg_4
						else
							Result := True
						end
					end
				end
			end
			if Result then
				pattern_index := i
				compile_repeats (min, max, a_previous, a_prevreqchar, a_subcountlits)
			end
		end -- compile_counted_repeat


feature {NONE} -- Character classes

	actual_set: RX_CHARACTER_SET is
			-- is a shared buffer for a set
		once
			create Result.make_empty
		end


	compile_character_classes is
		local
			class_set: RX_CHARACTER_SET
			-- We have to build the character-map in a temporary bit of store,
			-- in case the class contains only 1 character, because in that
			-- case the compiled code doesn't use the bit map.
			tmp_pat_index: INTEGER
			posix_class, val: INTEGER
			class_charcount: INTEGER
			class_lastchar: INTEGER
			c, range_end: CHARACTER
			negate_class: BOOLEAN
			local_negate: BOOLEAN
		do
			class_set := actual_set
			class_set.clear
			pattern_index := pattern_index + 1
			c := pattern.item (pattern_index)
			if (c = '^') then
				-- If the first character is '^', set the negation flag
				-- and skip it.
				negate_class := true
				pattern_index := pattern_index + 1
				c := pattern.item (pattern_index)
			end

			from
				class_charcount := 0
				-- Keep a count of chars so that we can optimize the case
				-- of just a single character.
			until
				(class_charcount > 0 and then c = ']') or else compile_error /= Void
				-- Process characters until ] is reached. By checking the
				-- class_charcount, greater 1 a possible initial ] is
				-- taken as a data character.
			loop
				if pattern_index >= pattern.count then
					compile_error := err_msg_6
				else
					tmp_pat_index := 0
					if (c = '[') then
						inspect
							pattern.item (pattern_index + 1)
						when ':', '.', '=' then
							tmp_pat_index := check_posix_syntax (pattern_index)
						else
							-- do nothing
						end
					end
					if tmp_pat_index > 0 then
						-- Handle POSIX class names. Perl allows a negation
						-- extension of the form [:^name]. A square
						-- bracket that doesn't match the syntax is
						-- treated as a literal. We also recognize the POSIX
						-- constructions [.ch.] and [=ch=] ("collating
						-- elements") and fault them, as Perl 5.6 does.
						local_negate := false
						if pattern.item (pattern_index + 1) /= ':' then
							compile_error := err_msg_31
						else
							pattern_index := pattern_index + 2
							if (pattern.item(pattern_index) = '^') then
								pattern_index := pattern_index + 1
								local_negate := true
							end

							posix_class := check_posix_name (pattern_index, tmp_pat_index - pattern_index)
							if posix_class < 0 then
								compile_error := err_msg_30
							else
								if posix_class <= 3 and then is_caseless then
									-- If matching is caseless, upper and lower
									-- are converted to alpha. This relies
									-- on the fact that the class table starts
									-- with alpha, lower, upper as the first
									-- 3 entries.
									posix_class := 0
								end
								class_set.add_set (class_sets.item(posix_class), local_negate)
								pattern_index := tmp_pat_index + 1
								class_charcount := 10 -- Set > 1; assumes more than 1 character per class
							end
						end
					else
						val := 0
						if (c = '\') then
							-- Backslash may introduce a single character, or
							-- it may introduce one of the specials, which
							-- just set a flag. Escaped items are checked for
							-- validity in the pre-compiling pass. The
							-- sequence \b is a special case.  Inside a
							-- class (and only there) it is treated as
							-- backspace. Elsewhere it marks a word
							-- boundary. Other escapes have preset maps ready
							-- to or into the one we are building. We
							-- assume they have more than one character in
							-- them, so set class_count bigger than one.
							val := scan_escape (subexpression_count, true)
							if (-val = esc_lcb) then
								c := '%B' -- backspace
								val := c.code
							elseif (val < 0) then
								class_charcount := class_charcount + 1
								class_lastchar := val
								inspect
									-val

								when esc_lcd then
									class_set.add_set (digit_set, False)

								when esc_ucd then
									class_set.add_set (digit_set, True)

								when esc_lcw then
									class_set.add_set (word_set, False)

								when esc_ucw then
									class_set.add_set (word_set, True)

								when esc_lcs then
									class_set.add_set (space_set, False)

								when esc_ucs then
									class_set.add_set (space_set, True)

								else
									compile_error := err_msg_7
								end -- inspect
							else
								c := to_character (val)
							end
						end

						if val >= 0 then
							if pattern.item (pattern_index + 1) = '-' and then pattern.item(pattern_index + 2) /= ']' then
								-- A single character may be followed by '-'
								-- to form a range. However, Perl does not
								-- permit ']' to be the end of the range. A
								-- '-' character here is treated as a
								-- literal.
								pattern_index := pattern_index + 2
								if pattern_index >= pattern.count then
									compile_error := err_msg_6
								else
									range_end := pattern.item (pattern_index)
									tmp_pat_index := pattern_index
									if range_end = '\' then
										-- The second part of a range can be a
										-- single-character escape, but not
										-- any of the other escapes. Perl 5.6
										-- treats a hyphen as a literal in
										-- such circumstances.
										val := scan_escape (subexpression_count, true)
										if val < 0 then
											-- \b is backslash; any other special means the '-' was literal
											if val = -esc_lcb then
												range_end := '%B' -- backspace
											else
												pattern_index := tmp_pat_index - 2
												range_end := c
											end
										else
											range_end := to_character (val)
										end
									end

									if (range_end < c) then
										compile_error := err_msg_8
									else
										from
											-- to make it for the range_end
											-- avoids endless loop
											class_set.add_character (range_end)
											if is_caseless then
												class_set.add_character (char_casing.flip_case(range_end))
											end
											class_charcount := class_charcount + range_end.code - c.code + 1 -- in case a one-char range
											class_lastchar := range_end.code
										until
											c >= range_end
										loop
											class_set.add_character (c)
											if is_caseless then
												class_set.add_character (char_casing.flip_case(c))
											end
											c := to_character (c.code + 1)
										end
									end
								end
							else
								-- Handle a lone single character - we can get
								-- here for a normal non-escape char, or
								-- after \ that introduces a single character.
								class_set.add_character (c)
								if is_caseless then
									class_set.add_character (char_casing.flip_case(c))
								end
								class_charcount := class_charcount + 1
								class_lastchar := c.code
							end
						end -- if val >= 0
					end
				end -- if
				if compile_error = Void then
					pattern_index := pattern_index + 1
					c := pattern.item (pattern_index)
				end
			end -- from

			if class_charcount = 1 then
				if class_lastchar < 0 then
					if negate_class then
						if even (-class_lastchar) then
							emit_opcode (-class_lastchar + 1)
						else
							emit_opcode (-class_lastchar - 1)
						end
					else
						emit_opcode (-class_lastchar)
					end
				else
					-- If class_charcount is 1 and class_lastchar is not
					-- negative, we saw precisely one character. This
					-- doesn't need the whole 32-byte bit map.
					--	We turn it into a 1-character op_char if it's
					--	positive, or op_not if it's negative. (BdB: end)
					if negate_class then
						emit_opcode (op_not)
					else
						emit_opcode (op_chars)
						emit_int8 (1)
					end
					emit_character (to_character (class_lastchar))
				end
			else
				-- Otherwise, negate the 32-byte map if necessary, and
				-- copy it into the code vector.
				emit_opcode (op_class)
				emit_set (class_set, negate_class)
			end
		end -- compile_character_classes


feature {NONE} -- Debug compilation

	class_ref_repeat (a_i: INTEGER): INTEGER is
		local
			min, max: INTEGER
		do
			inspect
				code.item (a_i).code
			when op_crstar, op_crminstar, op_crplus, op_crminplus, op_crquery, op_crminquery then
				print (op_names.item(code.item(a_i).code+1))
				Result := a_i

			when op_crrange, op_crminrange then
				min := int16_code_at (a_i + 1)
				max := int16_code_at (a_i + 3)
				print ("{"); print(min); print(",")
				if max /= 0 then
					print (max)
				end
				print ("}")
				if code.item (a_i).code = op_crminrange then
					print ("?")
				end
				Result := a_i + 4

			else
				Result := a_i - 1
			end
		end

	print_options is
		do
			print ("Options: ")
			if is_anchored then
				print ("anchored ")
			end
			if is_caseless then
				print ("caseless ")
			end
			if is_ichanged then
				print ("ichanged ")
			end
			if is_extended then
				print ("extended ")
			end
			if is_multiline then
				print ("multiline ")
			end
			if is_dotall then
				print ("dotall ")
			end
			if is_dollar_endonly then
				print ("endonly ")
			end
			if not is_greedy then
				print ("ungreedy ")
			end
			print ("%N")
		end

	print_compiled_pattern is
		local
			i, j, k: INTEGER
			len: INTEGER
		do
			print ("Length = "); print(code.upper - code.lower + 1); print("%N")
			print ("Subexpressions = "); print(subexpression_count); print("%N")
			print ("Max Backrefs = "); print(maxbackrefs); print("%N")
			print_options
			if first_character >= 0 then
				print ("%Tfirst-character: ")
				if print_set.is_in (to_character (first_character)) then
					print (to_character (first_character))
				else
					print ("\x")
					print(to_hexadecimal (first_character, True))
				end
				print ("%N")
			end
			if required_character >= 0 then
				print ("%Trequired-character: ")
				if print_set.is_in (to_character (required_character)) then
					print (to_character (required_character))
				else
					print ("\x")
					print (to_hexadecimal (required_character, True))
				end
				print ("%N")
			end
			from
				i := code.lower
			until
				i > code.upper
			loop
				print ("Pos:%T"); print(i); print("%T%T")
				if code.item (i).code >= op_bra then
					print (int16_code_at(i+1))
					print ("%TBra%T")
					print (code.item(i).code - op_bra)
					i := i + 2
				else
					inspect
						code.item (i).code
					when op_opt then
						-- BdB: print (code.item (i+1).to_integer.to_hexadecimal)
						print (to_hexadecimal (code.item (i+1).code, True))
						print ("%T")
						print(op_names.item (code.item (i).code+1))
						i := i + 1

					when op_cond then
						print (int16_code_at(i+1))
						print ("%TCond")
						i := i + 2

					when op_cref then
						print (to_hexadecimal (code.item (i+1).code, True))
						print ("%T")
						print (op_names.item (code.item (i).code+1))
						i := i + 1

					when op_chars then
						len := code.item (i+1).code
						print (len); print("%T")
						from
							i := i + 2
						until
							len <= 0
						loop
							if print_set.is_in (code.item(i)) then
								print (code.item(i))
							else
								print ("\x")
								print (to_hexadecimal (code.item(i).code, True))
							end
							i := i + 1
							len := len - 1
						end
						i := i - 1

					when op_ketrmax, op_ketrmin, op_alt, op_ket, op_assert, op_assert_not,
						op_assertback, op_assertback_not, op_once then
						print (int16_code_at(i+1))
						print ("%T"); print(op_names.item(code.item(i).code+1))
						i := i + 2

					when op_reverse then
						print (to_hexadecimal (int16_code_at(i+1), True))
						print ("%T"); print(op_names.item(code.item(i).code+1))
						i := i + 2

					when op_star, op_minstar, op_plus, op_minplus, op_query, op_minquery, op_typestar,
						op_typeminstar, op_typeplus, op_typeminplus, op_typequery, op_typeminquery then
						print ("%T")
						if code.item (i).code >= op_typestar then
							print (op_names.item(code.item(i+1).code+1))
						else
							if print_set.is_in (code.item(i+1)) then
								print (code.item(i+1))
							else
								print ("\x")
								print (to_hexadecimal (code.item(i+1).code, True))
							end
						end
						print (op_names.item(code.item(i).code+1))
						i := i + 1

					when op_exact, op_upto, op_minupto then
						print ("%T")
						if print_set.is_in (code.item(i+3)) then
							print (code.item(i+3))
						else
							print ("\x")
							print (to_hexadecimal (code.item(i+3).code, True))
						end
						print ("{")
						if code.item (i).code /= op_exact then
							print ("0,")
						end
						print (int16_code_at(i+1))
						if code.item (i).code = op_minupto then
							print ("?")
						end
						print ("}")
						i := i + 3

					when op_typeexact, op_typeupto, op_typeminupto then
						print ("%T"); print(op_names.item(code.item(i+3).code+1)); print("(")
						if code.item (i).code /= op_typeexact then
							print (",")
						end
						print (int16_code_at(i+1)); print(")")
						if code.item (i).code = op_typeminupto then
							print ("?")
						end
						i := i + 3

					when op_not then
						print ("[^")
						if print_set.is_in (code.item(i+1)) then
							print (code.item(i+1))
						else
							print ("\x")
							print (to_hexadecimal (code.item(i+1).code, True))
						end
						print ("]")
						i := i + 1

					when op_notstar, op_notminstar, op_notplus, op_notminplus, op_notquery, op_notminquery then
						print ("%T[^")
						if print_set.is_in (code.item(i+1)) then
							print (code.item(i+1))
						else
							print ("\x")
							print (to_hexadecimal (code.item(i+1).code, True))
						end
						print ("]")
						print (op_names.item(code.item(i).code+1))
						i := i + 1

					when op_notexact, op_notupto, op_notminupto then
						print ("%T[^")
						if print_set.is_in (code.item(i+3)) then
							print (code.item(i+3))
						else
							print ("\x")
							print (to_hexadecimal (code.item(i+3).code, True))
						end
						print ("](")
						if code.item (i).code /= op_notexact then
							print (",")
						end
						print (int16_code_at(i+1))
						print (")")
						if code.item (i).code = op_notminupto then
							print ("?")
						end
						i := i + 3

					when op_ref then
						print ("%TRef "); print(code.item(i+1).code)
						i := class_ref_repeat (i + 2)

					when op_class then
						print ("%T[")
						from
							i := i + 1
							j := 0
						until
							j > 255
						loop
							if to_bit_8 (code.item (i+j//Character_bits)).item(j\\Character_bits+1) then
								from
									k := j + 1
								until
									k > 255 or else not to_bit_8 (code.item(i + k // Character_bits)).item(k\\Character_bits+1)
								loop
									k := k + 1
								end
								if not alnum_set.is_in (to_character (j)) then
									print ("\")
								end
								if print_set.is_in ( to_character (j)) then
									print (to_character (j))
								else
									print ("x")
									print (to_hexadecimal (j, True))
								end
								k := k - 1
								if k > j then
									print ("-")
									if not alnum_set.is_in (to_character (k)) then
										print ("\")
									end
									if print_set.is_in (to_character (k)) then
										print (to_character (k))
									else
										print ("x")
										print (to_hexadecimal (k, True))
									end
								end
								j := k
							end
							j := j + 1
						end
						print ("]")
						i := class_ref_repeat (i + 32)

					else
						print ("%T")
						print (op_names.item(code.item(i).code+1))
					end -- inspect
				end -- if
				i := i + 1
				print ("%N")
			end -- from
		end


invariant

	valid_first_character: not (first_character >= 0 and first_character <= 255) implies first_character = -1
	valid_required_character: not (required_character >= 0 and required_character <= 255) implies required_character >= -2


end -- class RX_COMPILER
