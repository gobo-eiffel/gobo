indexing

	description:

		"Perl-Compatible Regular Expressions written in Eiffel"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002, Harald Erdbrügger and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	RX_MATCHER


inherit

	PLATFORM

	KL_CHARACTER_ROUTINES

	RX_CONSTANTS

	RX_CHARACTER_TABLES


creation

	make,
	make_sub


feature {NONE} -- Initialization

	make (a_regexp: RX_STRING) is
			-- On entry ecode points to the first opcode, and eptr to the
			-- first character in the subject string, while eptrb holds
			-- the value of eptr at the start of the last bracketed group
			-- - used for breaking infinite loops matching zero-length
			-- strings.
		require
			valid_regexp: a_regexp /= Void
		do
			regexp := a_regexp
			-- create brastart_vector.with_capacity (0, 8)
			-- create brastart_vector.make (8, 7)
			create brastart_vector.make (0, -1)
		end


feature {RX_MATCHER}

	make_sub (a_scanner: like Current) is
		do
			regexp := a_scanner.regexp
			subject := a_scanner.subject
			code := a_scanner.code
			eptr := a_scanner.eptr
			prev := Void
			saved_ptr := 0
			eptrb := a_scanner.eptrb
			brastart_vector := a_scanner.brastart_vector
			offset_top := a_scanner.offset_top
		end


feature {NONE}

	scanner_pool: DS_STACK [RX_MATCHER] is
		once
			create {DS_LINKED_STACK [RX_MATCHER]} Result.make
		end


	int16_code_at (a_code_index: INTEGER): INTEGER is
		do
			Result := code.item (a_code_index).code * 256 + code.item(a_code_index+1).code
		ensure
			valid_result: Result >= 0 and Result <= 65535
		end


feature {RX_MATCHER} -- Implementation

	regexp: RX_STRING

	code: ARRAY [CHARACTER]
	code_index: INTEGER

	subject: STRING
	eptr: INTEGER
	saved_ptr: INTEGER

	eptrb: RX_MATCHER
	prev: RX_MATCHER

	brastart_vector: ARRAY [INTEGER]
	saved_brastarts: ARRAY [INTEGER]

	offset_top: INTEGER


feature {NONE}

	is_caseless: BOOLEAN
	is_multiline: BOOLEAN
	is_dotall: BOOLEAN


feature {RX_STRING}

	match_start (a_eptr: INTEGER): BOOLEAN is
		do
			subject := regexp.subject
			code := regexp.code
			code_index := 0
			eptr := a_eptr
			prev := Void
			eptrb := Void
			saved_ptr := 0
			offset_top := 2 + regexp.offset_vector.lower
			brastart_vector.resize (brastart_vector.lower, regexp.offset_vector.count)
			Result := match_internal (0, True, False) = return_true
		end


feature {RX_MATCHER}

	match (a_ecode: INTEGER; a_isgroup, a_condassert: BOOLEAN): INTEGER is
		local
			scanner: RX_MATCHER
		do
			if scanner_pool.is_empty then
				create scanner.make_sub (Current)
			else
				scanner := scanner_pool.item
				scanner_pool.remove
				scanner.make_sub (Current)
			end
			Result := scanner.match_internal (a_ecode, a_isgroup, a_condassert)
			scanner_pool.put (scanner)
		ensure
			Result = return_true or else Result = return_false
		end

	match_internal (a_ec: INTEGER; a_isgroup, a_iscondassert: BOOLEAN): INTEGER is
		local
			op: INTEGER
			ec: INTEGER
			n, off: INTEGER
			tmp, tmpptr: INTEGER
			eptrb_save: like eptrb
			opts: BIT 8
		do
			ec := a_ec
			is_caseless := regexp.is_caseless
			is_multiline := regexp.is_multiline
			is_dotall := regexp.is_dotall
			-- At the start of a bracketed group, add the current subject
			-- pointer to the stack of such pointers, to be re-instated
			-- at the end of the group when we hit the closing ket. When
			-- match() is called in other circumstances, we don't add to
			-- the stack.
			if a_isgroup then
				prev := eptrb
				saved_ptr := eptr
				eptrb := Current
			end

			-- Now start processing the operations.
			from until Result /= return_none loop
				op := code.item (ec).code
				if op > op_bra then
					Result := match_additional_bracket (ec, op - op_bra)
					ec := code_index
				else
					-- Other types of node can be handled by a switch
					inspect
						op

					when op_bra then
						-- Non-capturing bracket: optimized
						Result := next_matching_alternate (ec)
						if Result /= return_true then
							Result := return_false
						end

					when op_cond then
						-- Conditional group: compilation checked that there
						-- are no more than two branches. If the condition
						-- is false, skipping the first branch takes us past
						-- the end if there is only one branch, but that's
						-- OK because that is exactly what going to the ket
						-- would do.
						if code.item (ec+3).code = op_cref then
							-- Condition is extraction test
							tmp := code.item (ec+4).code * 2
							if tmp < offset_top and then regexp.offset_vector.item(tmp) > 0 then
								Result := match (ec+5, True, False)
							else
								Result := match (ec+3 + int16_code_at(ec+1), True, False)
							end

						else
							-- The condition is an assertion. Call match() to
							-- evaluate it - setting the final argument TRUE
							-- causes it to stop at the end of an assertion.
							Result := match (ec+3, True, True)
							if Result = return_true then
								ec := ec + 3 + int16_code_at(ec+4)
								from until code.item (ec).code /= op_alt loop
									ec := ec + int16_code_at(ec+1)
								end
							else
								ec := ec + int16_code_at(ec+1)
							end
							Result := match (ec+3, True, False)
						end

					when op_cref then
						-- Skip over conditional reference data if
						-- encountered (should not be)
						ec := ec + 2

					when op_end then
						-- End of the pattern. If PCRE_NOTEMPTY is set, fail
						-- if we have matched an empty string - recursion
						-- will then try other alternatives, if any.
						if not regexp.is_empty_allowed and then eptr = regexp.subject_start then
							Result := return_false
						else
							regexp.set_next_start (eptr) -- Record where we ended
							regexp.set_match_count (offset_top) -- and how many extracts were taken
							Result := return_true
						end

					when op_opt then
						-- Change option settings
						opts := to_bit_8 (code.item (ec+1))
						is_caseless := (opts and caseless_mask) = caseless_mask
						is_multiline := (opts and multiline_mask) = multiline_mask
						is_dotall := (opts and dotall_mask) = dotall_mask
						ec := ec + 2

					when op_assert, op_assertback then
						-- Assertion brackets. Check the alternative
						-- branches in turn - the matching won't pass the
						-- KET for an assertion. If any one branch matches,
						-- the assertion is true. Lookbehind assertions have
						-- an op_reverse item at the start of each branch to
						-- move the current point backwards, so the code at
						-- this level is identical to the lookahead case.
						eptrb_save := eptrb
						eptrb := Void
						Result := next_matching_alternate (ec)
						eptrb := eptrb_save
						ec := code_index
						if code.item (ec).code = op_ket then
							Result := return_false
						elseif a_iscondassert then
							-- If checking an assertion for a condition, return TRUE.
							Result := return_true
						else
							Result := return_none
							-- Continue from after the assertion, updating
							-- the offsets high water mark, since extracts
							-- may have been taken during the assertion.
							from op := op_alt until op /= op_alt loop
								ec := ec + int16_code_at(ec+1)
								op := code.item (ec).code
							end
							ec := ec + 3
							offset_top := regexp.match_count
						end

					when op_assert_not, op_assertback_not then
						-- Negative assertion: all branches must fail to match
						if next_matching_alternate (ec) = return_true then
							Result := return_false
						elseif a_iscondassert then
							Result := return_true
						else
							ec := code_index + 3
						end

					when op_reverse then
						-- Move the subject pointer back. This occurs only
						-- at the start of each branch of a lookbehind
						-- assertion. If we are too close to the start to
						-- move back, this match function fails. When
						-- working with UTF-8 we move back a number of
						-- characters, not bytes.
						eptr := eptr - int16_code_at(ec+1)
						if eptr < 1 then
							Result := return_false
						else
							ec := ec + 3
						end

					when op_recurse then
						-- Recursion matches the current regex, nested. If
						-- there are any capturing brackets started but not
						-- finished, we have to save their starting points
						-- and reinstate them after the recursion. However,
						-- we don't know how many such there are (offset_top
						-- records the completed total) so we just have to
						-- save all the potential data. There may be up to
						-- 99 such values, which is a bit large to put on
						-- the stack, but using malloc for small numbers
						-- seems expensive. As a compromise, the stack is
						-- used when there are fewer than 16 values to
						-- store; otherwise malloc is used. A problem is
						-- what to do if the malloc fails ... there is no
						-- way of returning to the top level with an
						-- error. Save the top 15 values on the stack, and
						-- accept that the rest may be wrong.
						saved_brastarts := clone (brastart_vector)
						-- Was:
--							if saved_brastarts = Void then
--								create saved_brastarts.from_collection (brastart_vector)
--							else
--								saved_brastarts.from_collection (brastart_vector)
--							end
						tmp := match (0, True, False)
						brastart_vector := clone (saved_brastarts)
--							brastart_vector.from_collection (saved_brastarts)
						if tmp = return_true then
							-- In case the recursion has set more capturing
							-- values, save the final number, then move
							-- along the subject till after the recursive
							-- match, and advance one byte in the pattern
							-- code.
							offset_top := regexp.match_count
							eptr := regexp.subject_next_start
							ec := ec + 1
						else
							Result := return_false
						end

					when op_once then
						-- "Once" brackets are like assertion brackets
						-- except that after a match, the point in the
						-- subject string is not moved back. Thus there can
						-- never be a move back into the brackets. Check the
						-- alternative branches in turn - the matching won't
						-- pass the KET for this kind of subpattern. If any
						-- one branch matches, we carry on as at the end of
						-- a normal bracket, leaving the subject pointer.
						tmp := ec
						tmpptr := eptr
						n := next_matching_alternate (ec) -- never uses the result
						ec := code_index
						op := code.item (ec).code
						-- If hit the end of the group (which could be
						-- repeated), fail
						if op /= op_once and then op /= op_alt then
							Result := return_false
						else
							-- Continue as from after the assertion, updating
							-- the offsets high water mark, since extracts
							-- may have been taken.
							from op := op_alt until op /= op_alt loop
								ec := ec + int16_code_at(ec+1)
								op := code.item (ec).code
							end

							offset_top := regexp.match_count
							eptr := regexp.subject_next_start

							-- For a non-repeating ket, just continue at this
							-- level. This also happens for a repeating
							-- ket if no characters were matched in the
							-- group. This is the forcible breaking of
							-- infinite loops as implemented in Perl
							-- 5.005. If there is an options reset, it will
							-- get obeyed in the normal course of events.
							if op = op_ket or else eptr = tmpptr then
								ec := ec + 3
							else
								-- The repeating kets try the rest of the
								-- pattern or restart from the preceding
								-- bracket, in the appropriate order. We need
								-- to reset any options that changed within
								-- the bracket before re-running it, so check
								-- the next opcode.
								if code.item (ec+3).code = op_opt then
									regexp.set_options_from_ims (to_bit_8 (code.item(ec+4)))
								end
								if op = op_ketrmin then
									Result := match (ec+3, False, False)
									if Result /= return_true then
										Result := match (tmp, True, False)
									end
								else -- op_ketrmax
									Result := match (tmp, True, False)
									if Result /= return_true then
										Result := match (ec+3, False, False)
									end
								end
							end
						end

					when op_alt then
						-- An alternation is the end of a branch; scan along
						-- to find the end of the bracketed group and go to
						-- there.
						from until op /= op_alt loop
							ec := ec + int16_code_at(ec + 1)
							op := code.item (ec).code
						end

					when op_brazero then
						-- BRAZERO and BRAMINZERO occur just before a
						-- bracket group, indicating that it may occur zero
						-- times. It may repeat infinitely, or not at all -
						-- i.e. it could be ()* or ()? in the
						-- pattern. Brackets with fixed upper repeat limits
						-- are compiled as a number of copies, with the
						-- optional ones preceded by BRAZERO or BRAMINZERO.
						tmpptr := ec + 1
						if match (tmpptr, True, False) = return_true then
							Result := return_true
						else
							from op := op_alt until op /= op_alt loop
								tmpptr := tmpptr + int16_code_at(tmpptr+1)
								op := code.item (tmpptr).code
							end
							ec := tmpptr + 3
						end

					when op_braminzero then
						tmpptr := ec + 1
						from op := op_alt until op /= op_alt loop
							tmpptr := tmpptr + int16_code_at(tmpptr+1)
							op := code.item (tmpptr).code
						end
						if match (tmpptr+3, True, False) = return_true then
							Result := return_true
						else
							ec := ec + 1
						end

					when op_ket, op_ketrmin, op_ketrmax then
						-- End of a group, repeated or non-repeating. If we
						-- are at the end of an assertion "group", stop
						-- matching and return TRUE, but record the current
						-- high water mark for use by positive
						-- assertions. Do this also for the "once"
						-- (not-backup up) groups.
						tmp := ec - int16_code_at(ec+1)
						tmpptr := eptrb.saved_ptr
						eptrb := eptrb.prev -- Back up the stack of bracket start pointers

						op := code.item (tmp).code
						if op = op_assert or else op = op_assert_not or else op = op_once
							or else op = op_assertback or else op = op_assertback_not then
							regexp.set_next_start (eptr) -- For ONCE
							regexp.set_match_count (offset_top)
							Result := return_true
						else
							-- In all other cases except a conditional group
							-- we have to check the group number back at the
							-- start and if necessary complete handling an
							-- extraction by setting the offsets and bumping
							-- the high water mark.
							if op /= op_cond then
								n := op - op_bra
								off := n * 2
								if n > 0 then
									regexp.offset_vector.put (brastart_vector.item(off), off)
									regexp.offset_vector.put (eptr, off+1)
									if offset_top <= off then
										offset_top := off + 2
									end
								end
							end

							-- Reset the value of the ims flags, in case they
							-- got changed during the group.
							is_caseless := regexp.is_caseless
							is_multiline := regexp.is_multiline
							is_dotall := regexp.is_dotall

							op := code.item (ec).code
							if op = op_ket or else eptr = tmpptr then
								-- For a non-repeating ket, just continue at
								-- this level. This also happens for a
								-- repeating ket if no characters were matched
								-- in the group. This is the forcible
								-- breaking of infinite loops as implemented
								-- in Perl 5.005. If there is an options
								-- reset, it will get obeyed in the normal
								-- course of events.
								ec := ec + 3
							else
								-- The repeating kets try the rest of the
								-- pattern or restart from the preceding
								-- bracket, in the appropriate order.
								if op = op_ketrmin then
									Result := match (ec+3, False, False)
									if Result /= return_true then
										Result := match (tmp, True, False)
									end
								else -- op_ketrmax
									Result := match (tmp, True, False)
									if Result /= return_true then
										Result := match (ec+3, False, False)
									end
								end
							end
						end

					when op_circ then
						-- Start of subject unless notbol, or after internal
						-- newline if multiline
						if not regexp.is_bol and then eptr = regexp.subject_start then
							Result := return_false
						elseif is_multiline then
							if eptr > regexp.subject_start and then subject.item(eptr-1) /= '%N' then
								Result := return_false
							else
								ec := ec + 1
							end
						elseif eptr > regexp.subject_start then
							Result := return_false
						else
							ec := ec + 1
						end

					when op_sod then
						-- Start of subject assertion
						if eptr > regexp.subject_start then
							Result := return_false
						else
							ec := ec + 1
						end

					when op_doll then
						-- Assert before internal newline if multiline, or
						-- before a terminating newline unless endonly is
						-- set, else end of subject unless noteol is set.
						if is_multiline then
							if eptr <= regexp.subject_end then
								if subject.item (eptr) /= '%N' then
									Result := return_false
								else
									ec := ec + 1
								end
							elseif regexp.is_eol then
								ec := ec + 1
							else
								Result := return_false
							end
						elseif not regexp.is_eol then
							Result := return_false
						elseif not regexp.is_dollar_endonly then
							if
								eptr < regexp.subject_end or else
								(eptr = regexp.subject_end and then subject.item(eptr) /= '%N') then
								Result := return_false
							else
								ec := ec + 1
							end
						elseif eptr <= regexp.subject_end then
							Result := return_false
						else
							ec := ec + 1
						end

					when op_eod then
						-- End of subject assertion (\z)
						if eptr <= regexp.subject_end then
							Result := return_false
						else
							ec := ec + 1
						end

					when op_eodn then
						-- End of subject or ending \n assertion (\Z)
						if eptr < regexp.subject_end or else
							(eptr = regexp.subject_end and then subject.item(eptr) /= '%N') then
							Result := return_false
						else
							ec := ec + 1
						end

					when op_not_word_boundary then
						-- No word boundary assertion
						if (eptr > regexp.subject_start and then regexp.word_set.is_in(subject.item(eptr-1))) /=
							(eptr <= regexp.subject_end and then regexp.word_set.is_in(subject.item(eptr))) then
							Result := return_false
						else
							ec := ec + 1
						end

					when op_word_boundary then
						-- Word boundary assertions
						if (eptr > regexp.subject_start and then regexp.word_set.is_in(subject.item(eptr-1))) =
							(eptr <= regexp.subject_end and then regexp.word_set.is_in(subject.item(eptr))) then
							Result := return_false
						else
							ec := ec + 1
						end

					when op_any then
						-- Match a single character type; inline for speed
						if not is_dotall and then eptr <= regexp.subject_end and then subject.item(eptr) = '%N' then
							Result := return_false
						elseif eptr > regexp.subject_end then
							Result := return_false
						else
							eptr := eptr + 1
							ec := ec + 1
						end

					when op_not_digit then
						if eptr > regexp.subject_end or else digit_set.is_in(subject.item(eptr)) then
							Result := return_false
						else
							eptr := eptr + 1
							ec := ec + 1
						end

					when op_digit then
						if eptr > regexp.subject_end or else not digit_set.is_in(subject.item(eptr)) then
							Result := return_false
						else
							eptr := eptr + 1
							ec := ec + 1
						end

					when op_not_whitespace then
						if eptr > regexp.subject_end or else space_set.is_in(subject.item(eptr)) then
							Result := return_false
						else
							eptr := eptr + 1
							ec := ec + 1
						end

					when op_whitespace then
						if eptr > regexp.subject_end or else not space_set.is_in(subject.item(eptr)) then
							Result := return_false
						else
							eptr := eptr + 1
							ec := ec + 1
						end

					when op_not_wordchar then
						if eptr > regexp.subject_end or else regexp.word_set.is_in(subject.item(eptr)) then
							Result := return_false
						else
							eptr := eptr + 1
							ec := ec + 1
						end

					when op_wordchar then
						if eptr > regexp.subject_end or else not regexp.word_set.is_in(subject.item(eptr)) then
							Result := return_false
						else
							eptr := eptr + 1
							ec := ec + 1
						end

					when op_ref then
						Result := match_repeated_refs (ec)
						ec := code_index

					when op_class then
						Result := match_repeated_classes (ec)
						ec := code_index

					when op_chars then
						-- Match a run of characters
						n := code.item (ec+1).code
						ec := ec + 2
						if eptr + n - 1 > regexp.subject_end then
							Result := return_false
						elseif is_caseless then
							from until n <= 0 loop
								if regexp.char_casing.to_lower (code.item(ec)) /=
									regexp.char_casing.to_lower (subject.item(eptr)) then
									Result := return_false
									n := 0
								else
									ec := ec + 1
									eptr := eptr + 1
									n := n - 1
								end
							end
						else
							from until n <= 0 loop
								if code.item (ec) /= subject.item(eptr) then
									Result := return_false
									n := 0
								else
									ec := ec + 1
									eptr := eptr + 1
									n := n - 1
								end
							end
						end

						-- Match a single character repeatedly
					when op_exact then
						tmp := int16_code_at (ec+1)
						ec := ec + 4
						Result := match_repeated_characters (ec, tmp, tmp, False)

					when op_upto, op_minupto then
						tmp := int16_code_at (ec + 1)
						ec := ec + 4
						Result := match_repeated_characters (ec, 0, tmp, op = op_minupto)

					when op_star, op_minstar then
						ec := ec + 2
						Result := match_repeated_characters (ec, 0, Maximum_integer, op = op_minstar)

					when op_plus, op_minplus then
						ec := ec + 2
						Result := match_repeated_characters (ec, 1, Maximum_integer, op = op_minplus)

					when op_query, op_minquery then
						ec := ec + 2
						Result := match_repeated_characters (ec, 0, 1, op = op_minquery)

					when op_not then
								-- Match a negated single character
						if eptr > regexp.subject_end then
							Result := return_false
						else
							ec := ec + 1
							if is_caseless then
								if regexp.char_casing.to_lower (code.item(ec)) =
									regexp.char_casing.to_lower (subject.item(eptr)) then
									Result := return_false
								end
							else
								if code.item (ec) = subject.item(eptr) then
									Result := return_false
								end
							end
							if Result = 0 then
								ec := ec + 1
								eptr := eptr + 1
							end
						end

						-- Match a negated single character repeatedly. This
						-- is almost a repeat of the code for a repeated
						-- single character, but I haven't found a nice way
						-- of commoning these up that doesn't require a test
						-- of the positive/negative option for each
						-- character match. Maybe that wouldn't add very
						-- much to the time taken, but character matching
						-- *is* what this is all about...
					when op_notexact then
						tmp := int16_code_at (ec+1)
						ec := ec + 4
						Result := match_not_repeated_characters (ec, tmp, tmp, False)

					when op_notupto, op_notminupto then
						tmp := int16_code_at (ec + 1)
						ec := ec + 4
						Result := match_not_repeated_characters (ec, 0, tmp, op = op_notminupto)

					when op_notstar, op_notminstar then
						ec := ec + 2
						Result := match_not_repeated_characters (ec, 0, Maximum_integer, op = op_notminstar)

					when op_notplus, op_notminplus then
						ec := ec + 2
						Result := match_not_repeated_characters (ec, 1, Maximum_integer, op = op_notminplus)

					when op_notquery, op_notminquery then
						ec := ec + 2
						Result := match_not_repeated_characters (ec, 0, 1, op = op_notminquery)

						-- Match a single character type repeatedly; several
						-- different opcodes share code. This is very
						-- similar to the code for single characters, but we
						-- repeat it in the interests of efficiency.
					when op_typeexact then
						tmp := int16_code_at (ec+1)
						ec := ec + 4
						Result := match_repeated_type (ec, tmp, tmp, True)

					when op_typeupto, op_typeminupto then
						tmp := int16_code_at (ec+1)
						ec := ec + 4
								Result := match_repeated_type (ec, 0, tmp, op = op_typeminupto)

					when op_typestar, op_typeminstar then
						ec := ec + 2
						Result := match_repeated_type (ec, 0, Maximum_integer, op = op_typeminstar)

					when op_typeplus, op_typeminplus then
						ec := ec + 2
						Result := match_repeated_type (ec, 1, Maximum_integer, op = op_typeminplus)

					when op_typequery, op_typeminquery then
						ec := ec + 2
						Result := match_repeated_type (ec, 0, 1, op = op_typeminquery)

					else
						-- There's been some horrible disaster.
							check
								False
							end
					end -- inspect
				end
			end -- from	End of main loop
		ensure
			Result = return_true or else Result = return_false
		end -- match_internal


	match_additional_bracket (a_ec, a_number: INTEGER): INTEGER is
			-- Opening capturing bracket. If there is space in the offset
			-- vector, save the current subject position in the working
			-- slot at the top of the vector. We mustn't change the
			-- current values of the data slot, because they may be set
			-- from a previous iteration of this group, and be referred
			-- to by a reference inside the group.
			--	If the bracket fails to match, we need to restore this
			--	value and also the values of the final offsets, in case
			--	they were set by a previous iteration of the same bracket.
		local
			offset: INTEGER
			save_offset1: INTEGER
			save_offset2: INTEGER
			save_offset3: INTEGER
		do
			offset := a_number * 2
			save_offset1 := regexp.offset_vector.item (offset)
			save_offset2 := regexp.offset_vector.item (offset+1)
			save_offset3 := brastart_vector.item (offset)

			brastart_vector.put (eptr, offset)
			Result := next_matching_alternate (a_ec)
			if Result /= return_true then
				regexp.offset_vector.put (save_offset1, offset)
				regexp.offset_vector.put (save_offset2, offset+1)
				brastart_vector.put (save_offset3, offset)
				Result := return_false
			end
		end -- match_additional_bracket

	next_matching_alternate (a_ec: INTEGER): INTEGER is
		local
			op, res: INTEGER
		do
			code_index := a_ec
			from op := op_alt until op /= op_alt loop
				res := match (code_index+3, True, False)
				if res = return_true then
					op := op_end -- break the loop
					Result := return_true
				else
					code_index := code_index + int16_code_at (code_index+1)
					op := code.item (code_index).code
				end
			end
		ensure
			Result = return_true or else Result = return_none
		end -- next_matching_alternate

	match_ref (a_eptr, a_offset, a_length: INTEGER): INTEGER is
			-- If a back reference hasn't been set, the length that is
			-- passed is greater than the number of characters left in
			-- the string, so the match fails.
			-- Arguments:
			--	offset		index into the offset vector
			--	length		length to be matched
		local
			p, sp, ep: INTEGER
		do
			if a_length > regexp.subject_end - a_eptr + 1 then
				-- Always fail if not enough characters left
				Result := return_false
			else
				p := regexp.offset_vector.item (a_offset)
				sp := a_eptr
				ep := p + a_length
				Result := return_true
				-- Separate the caselesss case for speed
				if is_caseless then
					from until p >= ep loop
						if regexp.char_casing.to_lower (subject.item (p)) =
							regexp.char_casing.to_lower (subject.item (sp)) then
							p := p + 1
							sp := sp + 1
						else
							p := ep
							Result := return_false
						end
					end
				else
					from until p >= ep loop
						if subject.item (p) = subject.item (sp) then
							p := p + 1
							sp := sp + 1
						else
							p := ep
							Result := return_false
						end
					end
				end
			end
		end

	match_repeated_refs (a_ec: INTEGER): INTEGER is
			-- Match a back reference, possibly repeatedly. Look past the
			-- end of the item to see if there is repeat information
			-- following. The code is similar to that for character
			-- classes, but repeated for efficiency. Then obey similar
			-- code to character type repeats - written out again for
			-- speed.
			-- However, if the referenced string is the empty string,
			-- always treat it as matched, any number of times (otherwise
			-- there could be infinite loops).
		local
			ec, i: INTEGER
			min, max: INTEGER
			off, length: INTEGER
			tmpptr: INTEGER
			minimize: BOOLEAN
		do
			ec := a_ec
			off := code.item (ec+1).code * 2
			ec := ec + 2 -- Advance past the item
			-- If the reference is unset, set the length to be longer
			-- than the amount of subject left; this ensures that
			-- every attempt at a match fails. We can't just fail
			-- here, because of the possibility of quantifiers with zero
			-- minima.
			if off >= offset_top or else regexp.offset_vector.item (off) <= 0 then
				length := regexp.subject_end - eptr + 2
			else
				length := regexp.offset_vector.item (off+1) - regexp.offset_vector.item (off)
			end

			-- Set up for repetition, or handle the non-repeated case
			inspect
				code.item (ec).code
			when op_crstar then
				ec := ec + 1
				minimize := False
				min := 0
				max := Maximum_integer

			when op_crminstar then
				ec := ec + 1
				minimize := True
				min := 0
				max := Maximum_integer

			when op_crplus then
				ec := ec + 1
				minimize := False
				min := 1
				max := Maximum_integer

			when op_crminplus then
				ec := ec + 1
				minimize := True
				min := 1
				max := Maximum_integer

			when op_crquery then
				ec := ec + 1
				minimize := False
				min := 0
				max := 1

			when op_crminquery then
				ec := ec + 1
				minimize := True
				min := 0
				max := 1

			when op_crrange, op_crminrange then
				minimize := code.item (ec).code = op_crminrange
				min := int16_code_at (ec+1)
				max := int16_code_at (ec+3)
				if max = 0 then
					max := Maximum_integer
				end
				ec := ec + 5

			else
				-- No repeat follows
				if match_ref (eptr, off, length) = return_true then
					eptr := eptr + length
					length := 0
				else
					Result := return_false
				end
			end

			-- If the length of the reference is zero, just continue with
			-- the main loop.
			if Result = 0 and then length > 0 then
				-- First, ensure the minimum number of matches are
				-- present. We get back the length of the reference
				-- string explicitly rather than passing the address of
				-- eptr, so that eptr can be a register variable.
				from i := 1 until i > min loop
					if match_ref (eptr, off, length) = return_true then
						eptr := eptr + length
						i := i + 1
					else
						Result := return_false
						i := min + 1
					end
				end
				if Result = 0 and then min < max then
					-- If min = max, continue at the same level without recursion.
					--	They are not both allowed to be zero.
					if minimize then
						-- If minimizing, keep trying and advancing the pointer
						from i := min until Result /= 0 loop
							if match (ec, False, False) = return_true then
								Result := return_true
							elseif i >= max or else match_ref(eptr, off, length) /= return_true then
								Result := return_false
							else
								eptr := eptr + length
								i := i + 1
							end
						end
					else
						-- If maximizing, find the longest string and work backwards
						tmpptr := eptr
						from i := min until i >= max loop
							if match_ref (eptr, off, length) = return_true then
								eptr := eptr + length
								i := i + 1
							else
								i := max
							end
						end
						from until eptr < tmpptr loop
							if match (ec, False, False) = return_true then
								Result := return_true
								eptr := tmpptr - 1
							else
								eptr := eptr - length
							end
						end
						if Result = 0 then
							Result := return_false
						end
					end
				end
			end
			code_index := ec
		ensure
			Result = return_true or else Result = return_false or else Result = return_none
		end -- match_repeated_refs

	match_repeated_classes (a_ec: INTEGER): INTEGER is
			-- Match a character class, possibly repeatedly. Look past
			-- the end of the item to see if there is repeat information
			-- following. Then obey similar code to character type
			-- repeats - written out again for speed.
		local
			ec, i, data, pp: INTEGER
			min, max: INTEGER
			c: CHARACTER
			minimize: BOOLEAN
		do
			data := a_ec + 1
			ec := a_ec + 33
			inspect
				code.item (ec).code
			when op_crstar then
				ec := ec + 1
				minimize := False
				min := 0
				max := Maximum_integer

			when op_crminstar then
				ec := ec + 1
				minimize := True
				min := 0
				max := Maximum_integer

			when op_crplus then
				ec := ec + 1
				minimize := False
				min := 1
				max := Maximum_integer

			when op_crminplus then
				ec := ec + 1
				minimize := True
				min := 1
				max := Maximum_integer

			when op_crquery then
				ec := ec + 1
				minimize := False
				min := 0
				max := 1

			when op_crminquery then
				ec := ec + 1
				minimize := True
				min := 0
				max := 1

			when op_crrange, op_crminrange then
				minimize := code.item (ec).code = op_crminrange
				min := int16_code_at (ec+1)
				max := int16_code_at (ec+3)
				if max = 0 then
					max := Maximum_integer
				end
				ec := ec + 5

			else
				-- No repeat follows
				min := 1
				max := 1
			end

			-- First, ensure the minimum number of matches are present.
			from i := 1 until i > min loop
				if eptr > regexp.subject_end then
					Result := return_false
					i := min + 1
				else
					c := subject.item (eptr)
					eptr := eptr + 1
					if to_bit_8 (code.item (data + c.code // Character_bits)).item (c.code \\ Character_bits + 1) then
						i := i + 1
					else
						Result := return_false
						i := min + 1
					end
				end
			end

			-- If max == min we can continue with the main loop without the
			--	need to recurse.
			if Result = 0 and then min < max then
				if minimize then
					-- If minimizing, keep testing the rest of the
					-- expression and advancing the pointer while it
					-- matches the class.
					from i := min until Result /= 0 loop
						if match (ec, False, False) = return_true then
							Result := return_true
						elseif i >= max or else eptr > regexp.subject_end then
							Result := return_false
						else
							c := subject.item (eptr)
							eptr := eptr + 1
							if to_bit_8 (code.item (data + c.code // Character_bits)).item (c.code \\ Character_bits + 1) then
								i := i + 1
							else
								Result := return_false
							end
						end
					end

				else
					-- If maximizing, find the longest possible run, then
					-- work backwards.
					pp := eptr
					from i := min until i >= max or else eptr > regexp.subject_end loop
						c := subject.item (eptr)
						if to_bit_8 (code.item (data + c.code // Character_bits)).item (c.code \\ Character_bits + 1) then
							eptr := eptr + 1
							i := i + 1
						else
							i := max
						end
					end
					from until eptr < pp loop
						if match (ec, False, False) = return_true then
							eptr := pp - 1
							Result := return_true
						else
							eptr := eptr - 1
						end
					end
					if Result = 0 then
						Result := return_false
					end
				end
			end
			code_index := ec
		ensure
			Result = return_true or else Result = return_false or else Result = return_none
		end -- match_repated_classes

	match_repeated_characters (a_ec, a_min, a_max: INTEGER; a_minimize: BOOLEAN): INTEGER is
		local
			i, tmpptr: INTEGER
			c: CHARACTER
		do
			if a_min > regexp.subject_end - eptr + 1 then
				Result := return_false
			else
				c := code.item (a_ec-1)
				-- The code is duplicated for the caseless and caseful
				-- cases, for speed, since matching characters is likely
				-- to be quite common. First, ensure the minimum number of
				-- matches are present. If min = max, continue at the same
				-- level without recursing. Otherwise, if minimizing, keep
				-- trying the rest of the expression and advancing one
				-- matching character if failing, up to the
				-- maximum. Alternatively, if maximizing, find the maximum
				-- number of characters and work backwards.
				if is_caseless then
					c := regexp.char_casing.to_lower (c)
					from i := 1 until i > a_min loop
						if c /= regexp.char_casing.to_lower(subject.item(eptr)) then
							Result := return_false
							i := a_min + 1
						else
							eptr := eptr + 1
							i := i + 1
						end
					end
					if Result = 0 and then a_min < a_max then
						if a_minimize then
							from i := a_min until Result /= 0 loop
								if match (a_ec, False, False) = return_true then
									Result := return_true
								elseif i >= a_max or else eptr > regexp.subject_end or else
									c /= regexp.char_casing.to_lower(subject.item(eptr)) then
									Result := return_false
								else
									eptr := eptr + 1
									i := i + 1
								end
							end
						else
							tmpptr := eptr
							from i := a_min until i >= a_max loop
								if eptr > regexp.subject_end or else c /= regexp.char_casing.to_lower(subject.item(eptr)) then
									i := a_max
								else
									eptr := eptr + 1
									i := i + 1
								end
							end
							from until eptr < tmpptr loop
								if match (a_ec, False, False) = return_true then
									Result := return_true
									eptr := tmpptr - 1
								else
									eptr := eptr - 1
								end
							end
							if Result = 0 then
								Result := return_false
							end
						end
					end
				else
					-- Caseful comparisons
					from i := 1 until i > a_min loop
						if c /= subject.item(eptr) then
							Result := return_false
							i := a_min + 1
						else
							eptr := eptr + 1
							i := i + 1
						end
					end
					if Result = 0 and then a_min < a_max then
						if a_minimize then
							from i := a_min until Result /= 0 loop
								if match (a_ec, False, False) = return_true then
									Result := return_true
								elseif i >= a_max or else eptr > regexp.subject_end or else c /= subject.item(eptr) then
									Result := return_false
								else
									eptr := eptr + 1
									i := i + 1
								end
							end
						else
							tmpptr := eptr
							from i := a_min until i >= a_max loop
								if eptr > regexp.subject_end or else c /= subject.item(eptr) then
									i := a_max
								else
									eptr := eptr + 1
									i := i + 1
								end
							end
							from until eptr < tmpptr loop
								if match (a_ec, False, False) = return_true then
									Result := return_true
									eptr := tmpptr - 1
								else
									eptr := eptr - 1
								end
							end
							if Result = 0 then
								Result := return_false
							end
						end
					end
				end
			end
		ensure
			Result = return_true or else Result = return_false or else Result = return_none
		end -- match_repeated_characters

	match_not_repeated_characters (a_ec, a_min, a_max: INTEGER; a_minimize: BOOLEAN): INTEGER is
		local
			i, tmpptr: INTEGER
			c: CHARACTER
		do
			if a_min > regexp.subject_end - eptr + 1 then
				Result := return_false
			else
				c := code.item (a_ec-1)
				-- The code is duplicated for the caseless and caseful
				-- cases, for speed, since matching characters is likely
				-- to be quite common. First, ensure the minimum number of
				-- matches are present. If min = max, continue at the same
				-- level without recursing. Otherwise, if minimizing, keep
				-- trying the rest of the expression and advancing one
				-- matching character if failing, up to the
				-- maximum. Alternatively, if maximizing, find the maximum
				-- number of characters and work backwards.
				if is_caseless then
					c := regexp.char_casing.to_lower (c)
					from i := 1 until i > a_min loop
						if c = regexp.char_casing.to_lower (subject.item(eptr)) then
							Result := return_false
							i := a_min + 1
						else
							eptr := eptr + 1
							i := i + 1
						end
					end
					if Result = 0 and then a_min < a_max then
						if a_minimize then
							from i := a_min until Result /= 0 loop
								if match (a_ec, False, False) = return_true then
									Result := return_true
								elseif i >= a_max or else eptr > regexp.subject_end or else
									c /= regexp.char_casing.to_lower(subject.item(eptr)) then
									Result := return_false
								else
									eptr := eptr + 1
									i := i + 1
								end
							end
						else
							tmpptr := eptr
							from i := a_min until i >= a_max loop
								if eptr > regexp.subject_end or else c = regexp.char_casing.to_lower(subject.item(eptr)) then
									i := a_max
								else
									eptr := eptr + 1
									i := i + 1
								end
							end
							from until eptr < tmpptr loop
								if match (a_ec, False, False) = return_true then
									Result := return_true
									eptr := tmpptr - 1
								else
									eptr := eptr - 1
								end
							end
							if Result = 0 then
								Result := return_false
							end
						end
					end
				else
					from i := 1 until i > a_min loop
						if c = subject.item (eptr) then
							Result := return_false
							i := a_min + 1
						else
							eptr := eptr + 1
							i := i + 1
						end
					end
					if Result = 0 and then a_min < a_max then
						if a_minimize then
							from i := a_min until Result /= 0 loop
								if match (a_ec, False, False) = return_true then
									Result := return_true
								elseif i >= a_max or else eptr > regexp.subject_end or else c = subject.item(eptr) then
									Result := return_false
								else
									eptr := eptr + 1
									i := i + 1
								end
							end
						else
							tmpptr := eptr
							from i := a_min until i >= a_max loop
								if eptr > regexp.subject_end or else c = subject.item(eptr) then
									i := a_max
								else
									eptr := eptr + 1
									i := i + 1
								end
							end
							from until eptr < tmpptr loop
								if match (a_ec, False, False) = return_true then
									Result := return_true
									eptr := tmpptr - 1
								else
									eptr := eptr - 1
								end
							end
							if Result = 0 then
								Result := return_false
							end
						end
					end
				end
			end
		ensure
			Result = return_true or else Result = return_false or else Result = return_none
		end -- match_not_repeated_characters

	match_repeated_type (a_ec, a_min, a_max: INTEGER; a_minimize: BOOLEAN): INTEGER is
		local
			i, pp: INTEGER
			ctype: INTEGER
			c: CHARACTER
		do
			ctype := code.item (a_ec-1).code -- Code for the character type

			-- First, ensure the minimum number of matches are
			-- present. Use inline code for maximizing the speed, and do
			-- the type test once at the start (i.e. keep it out of the
			-- loop). Also we can test that there are at least the
			-- minimum number of bytes before we start, except when doing
			-- '.' in UTF8 mode. Leave the test in in all cases; in the
			-- special case we have to test after each character.
			if a_min > regexp.subject_end - eptr + 1 then
				Result := return_false
			else
				if a_min > 0 then
					inspect
						ctype
					when op_any then
						if is_dotall then
							eptr := eptr + a_min
						else
							from i := 1 until i > a_min loop
								if subject.item (eptr) = '%N' then
									Result := return_false
									i := a_min + 1
								else
									eptr := eptr + 1
									i := i + 1
								end
							end
						end

					when op_not_digit then
						from i := 1 until i > a_min loop
							if eptr > regexp.subject_end or else digit_set.is_in(subject.item(eptr)) then
								--						if eptr > regexp.subject_end or else subject.item(eptr).in_range('0', '9') then
								Result := return_false
								i := a_min + 1
								else
									eptr := eptr + 1
									i := i + 1
								end
							end

						when op_digit then
							from i := 1 until i > a_min loop
								if eptr > regexp.subject_end or else not digit_set.is_in(subject.item(eptr)) then
									--						if eptr > regexp.subject_end or else not subject.item(eptr).in_range('0', '9') then
									Result := return_false
									i := a_min + 1
									else
										eptr := eptr + 1
										i := i + 1
									end
								end

							when op_not_whitespace then
								from i := 1 until i > a_min loop
									if eptr > regexp.subject_end or else space_set.is_in(subject.item(eptr)) then
										Result := return_false
										i := a_min + 1
									else
										eptr := eptr + 1
										i := i + 1
									end
								end

							when op_whitespace then
								from i := 1 until i > a_min loop
									if eptr > regexp.subject_end or else not space_set.is_in(subject.item(eptr)) then
										Result := return_false
										i := a_min + 1
									else
										eptr := eptr + 1
										i := i + 1
									end
								end

							when op_not_wordchar then
								from i := 1 until i > a_min loop
									if eptr > regexp.subject_end or else regexp.word_set.is_in(subject.item(eptr)) then
										Result := return_false
										i := a_min + 1
									else
										eptr := eptr + 1
										i := i + 1
									end
								end

							when op_wordchar then
								from i := 1 until i > a_min loop
									if eptr > regexp.subject_end or else not regexp.word_set.is_in(subject.item(eptr)) then
										Result := return_false
										i := a_min + 1
									else
										eptr := eptr + 1
										i := i + 1
									end
								end

							end -- inspect
						end -- if

						-- If min = max, continue at the same level without recursing
						if Result = 0 and then a_min < a_max then
							-- If minimizing, we have to test the rest of the
							-- pattern before each subsequent match.
							if a_minimize then
								from i := a_min until Result /= 0 loop
									if match (a_ec, False, False) = return_true then
										Result := return_true
									elseif i >= a_max or else eptr > regexp.subject_end then
										Result := return_false
									else
										c := subject.item (eptr)
										eptr := eptr + 1
										inspect
											ctype
										when op_any then
											if not is_dotall and then c = '%N' then
												Result := return_false
											end

										when op_not_digit then
											if digit_set.is_in (subject.item(eptr)) then
												--								if subject.item (eptr).in_range('0', '9') then
												Result := return_false
												end

											when op_digit then
												if not digit_set.is_in (subject.item(eptr)) then
													--								if not subject.item (eptr).in_range('0', '9') then
													Result := return_false
													end

												when op_not_whitespace then
													if space_set.is_in (subject.item(eptr)) then
														Result := return_false
													end

												when op_whitespace then
													if not space_set.is_in (subject.item(eptr)) then
														Result := return_false
													end

												when op_not_wordchar then
													if regexp.word_set.is_in (subject.item(eptr)) then
														Result := return_false
													end

												when op_wordchar then
													if not regexp.word_set.is_in (subject.item(eptr)) then
														Result := return_false
													end
												end -- inspect
												i := i + 1
											end
										end -- from
									else
										-- If maximizing it is worth using
										-- inline code for speed, doing the type
										-- test once at the start (i.e. keep it
										-- out of the loop).
										pp := eptr
										inspect
											ctype
										when op_any then
											if is_dotall then
												i := a_max - a_min
												if i > regexp.subject_end - eptr then
													i := regexp.subject_end - eptr + 1
												end
												eptr := eptr + i
											else
												from i := a_min until i >= a_max loop
													if eptr > regexp.subject_end or else subject.item(eptr) = '%N' then
														i := a_max
													else
														eptr := eptr + 1
														i := i + 1
													end
												end
											end

										when op_not_digit then
											from i := a_min until i >= a_max loop
												if eptr > regexp.subject_end or else digit_set.is_in(subject.item(eptr)) then
													--							if eptr > regexp.subject_end or else subject.item(eptr).in_range('0', '9') then
													i := a_max
													else
														eptr := eptr + 1
														i := i + 1
													end
												end

											when op_digit then
												from i := a_min until i >= a_max loop
													if eptr > regexp.subject_end or else not digit_set.is_in(subject.item(eptr)) then
														--							if eptr > regexp.subject_end or else not subject.item(eptr).in_range('0', '9') then
														i := a_max
														else
															eptr := eptr + 1
															i := i + 1
														end
													end

												when op_not_whitespace then
													from i := a_min until i >= a_max loop
														if eptr > regexp.subject_end or else space_set.is_in(subject.item(eptr)) then
															i := a_max
														else
															eptr := eptr + 1
															i := i + 1
														end
													end

												when op_whitespace then
													from i := a_min until i >= a_max loop
														if eptr > regexp.subject_end or else not space_set.is_in(subject.item(eptr)) then
															i := a_max
														else
															eptr := eptr + 1
															i := i + 1
														end
													end

												when op_not_wordchar then
													from i := a_min until i >= a_max loop
														if eptr > regexp.subject_end or else regexp.word_set.is_in(subject.item(eptr)) then
															i := a_max
														else
															eptr := eptr + 1
															i := i + 1
														end
													end

												when op_wordchar then
													from i := a_min until i >= a_max loop
														if eptr > regexp.subject_end or else not regexp.word_set.is_in(subject.item(eptr)) then
															i := a_max
														else
															eptr := eptr + 1
															i := i + 1
														end
													end
												end -- inspect
												from until eptr < pp loop
													if match (a_ec, False, False) = return_true then
														Result := return_true
														eptr := pp - 1
													else
														eptr := eptr - 1
													end
												end
												if Result = 0 then
													Result := return_false
												end
											end
										end
									end
		ensure
			Result = return_true or else Result = return_false or else Result = return_none
		end -- match_repeated_type


end
