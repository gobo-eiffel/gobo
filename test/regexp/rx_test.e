indexing

	description:

		"Test features of class regexp library"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002, Harald Erdbrügger and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	RX_TEST


inherit

	KL_INTEGER_ROUTINES

	KL_SHARED_ARGUMENTS

	EXCEPTIONS


creation

	make


feature

	read_pattern (a_regexp: RX_STRING; a_file: KL_TEXT_INPUT_FILE; a_pat: STRING) is
		local
			i: INTEGER
			buf: STRING
			delimeter: CHARACTER
			last: CHARACTER
		do
			a_pat.wipe_out
			buf := a_file.last_string
			buf.left_adjust
			buf.right_adjust
			from until a_file.end_of_input or else buf.count > 0 loop
				print (buf);print("%N")
				a_file.read_line
				buf := a_file.last_string
				buf.left_adjust
				buf.right_adjust
			end
			from i := 1 until i > buf.count loop
				from until i > buf.count or else not is_space(buf.item(i)) loop
					i := i + 1
				end
				delimeter := buf.item (i) -- most of the time /
					i := i + 1

				from until a_file.end_of_input or else (last /= '\' and then buf.item(i) = delimeter) loop
					print (buf);print("%N")
					from until i > buf.count or else (last /= '\' and then buf.item(i) = delimeter) loop
						last := buf.item (i)
						a_pat.append_character (last)
						i := i + 1
					end
					from until a_file.end_of_input or else i <= buf.count loop
						last := '%N'
						a_pat.append_character ('%N')
						a_file.read_line
						buf := a_file.last_string
						buf.left_adjust
						buf.right_adjust
						if buf.count > 0 and then buf.item(1) = '/' then
							print (buf);print("%N")
						end
						i := 1
					end
				end
				a_regexp.set_default_options
				from until i > buf.count loop
					inspect
						buf.item (i)
					when '\' then a_pat.append_character('\')

					when 'i' then a_regexp.set_caseless(True)
					when 'm' then a_regexp.set_multiline(True)
					when 's' then a_regexp.set_dotall(True)
					when 'x' then a_regexp.set_extended(True)

						--				when '+' then do_showrest = 1; break
					when 'A' then a_regexp.set_anchored(True)
						--				when 'D' then do_debug = do_showinfo = 1; break
					when 'E' then a_regexp.set_dollar_endonly(True)
						--				when 'G' then do_G = 1; break

					when 'U' then a_regexp.set_greedy(False)
						--				when 'X' then regexp.set_extra(True)

					when 'L' then i := buf.count + 1
					else
					end
					i := i + 1
				end
			end
			a_file.read_line
		end

	skip_to_blank_line (a_file: KL_TEXT_INPUT_FILE) is
		do
			from
			until
				a_file.end_of_input or else a_file.last_string.is_equal ("")
			loop
				a_file.read_line
				a_file.last_string.left_adjust
				a_file.last_string.right_adjust
			end
		end

	is_space (a_ch: CHARACTER): BOOLEAN is
		do
			Result := (a_ch >= '%/9/' and a_ch <= '%/12/') or else a_ch = ' '
		end


	print_substr (a_str: STRING; a_from, a_to: INTEGER) is
		local
			i: INTEGER
			s: STRING
		do
			if a_from < 1 then
				print ("<unset>")
			else
				from i := a_from until i > a_to loop
					if a_str.item (i) >= '%/32/' and a_str.item (i) <= '%/126/' then
						print (a_str.item(i))
					else
						s := to_hexadecimal (a_str.item (i).code, True)
						s.to_lower
						print ("\x0")
						print(s)
					end
					i := i + 1
				end
			end
		end


	make is
		local
			regexp: RX_STRING
			file: KL_TEXT_INPUT_FILE
			pattern: STRING
			subject: STRING
			buf, s: STRING
			time: TIME
			i, j, v: INTEGER
			pattern_count: INTEGER
			subject_count: INTEGER
		do
			if Arguments.argument_count = 0 then
				print ("Give at least a single input file as arguments.%N")
				die (1)
			end
			print ("OPEN FILE: ")
			print(Arguments.argument (1))
			print ("%N%N")
			from
				create regexp.make
				create pattern.make_empty
				create subject.make_empty
				create file.make (Arguments.argument (1))
				file.open_read
			until
				not file.is_open_read or else file.end_of_input
			loop
				file.read_line
				regexp.reset
				read_pattern (regexp, file, pattern)
				print (file.last_string);print("%N")
				regexp.compile (pattern)
				pattern_count := pattern_count + 1
				if regexp.is_compiled then
					from
						file.last_string.left_adjust
						file.last_string.right_adjust
					until
						file.end_of_input or else file.last_string.is_equal ("")
					loop
						from
							buf := file.last_string
							buf.left_adjust
							buf.right_adjust
							subject.wipe_out
							i := 1
						until
							i > buf.count or else not is_space(buf.item(i))
						loop
							i := i + 1
						end
						subject.wipe_out
						from until i > buf.count loop
							if buf.item (i) = '\' then
								if i < buf.count then
									i := i + 1
									inspect
										buf.item (i)
									when 'a' then subject.append_character ('%/7/')
									when 'b' then subject.append_character ('%B')
									when 'e' then subject.append_character ('%/27/')
									when 'f' then subject.append_character ('%F')
									when 'n' then subject.append_character ('%N')
									when 'r' then subject.append_character ('%R')
									when 't' then subject.append_character ('%T')
									when 'v' then subject.append_character ('%/11/')

									when '0'..'7' then
										from
											j := i
											v := 0
										until
											i > buf.count or else i-j > 2 or else not (buf.item (i) >= '0' and buf.item (i) <= '7')
										loop
											v := v * 8 + buf.item(i).code - ('0').code
											i := i + 1
										end
										subject.append_character (to_character (v \\ 256))
										i := i - 1
									when 'x' then
										from
											i := i + 1
											j := i
											v := 0
										until
											i > buf.count or else i-j > 1 or else
											not (buf.item (i) >= '0' and buf.item (i) <= '9') or else
											(buf.item (i) >= 'a' and buf.item (i) <= 'f')
										loop
											if buf.item (i) < 'a' then
												v := v * 16 + buf.item(i).code - ('0').code
											else
												v := v * 16 + buf.item(i).code - ('a').code + 10
											end
											i := i + 1
										end
										subject.append_character (to_character (v \\ 256))
										i := i - 1
									when '8', '9' then
										i := i - 1
									else
										subject.append_character (buf.item (i))
									end
								end
							else
								subject.append_character (buf.item (i))
							end
							i := i + 1
						end
						regexp.match_substring (subject, 1, subject.count)
						subject_count := subject_count + 1
						if regexp.has_matched then
							from
								i := 0
							until
								i >= regexp.match_count
							loop
								if i < 10 then
									print (" ");print(i);print(": ")
								else
									print (i);print(": ")
								end
								if regexp.start_of_portion (i) = 0 then
									print ("<unset>%N")
								else
									s := regexp.matched_portion (i)
									print_substr (s, 1, s.count);print("%N")
								end
								i := i + 1
							end
							--	--print("matched at ");print(regexp.offset_vector.item(0));print(", ")
							--	--print(regexp.offset_vector.item(1));print("%N")
						else
							print ("No match%N")
						end
						file.read_line
						print (file.last_string);print("%N")
						file.last_string.left_adjust
						file.last_string.right_adjust
					end
				else
					print ("Failed: ");print(regexp.compile_error);print("%N")
					skip_to_blank_line (file)
				end
			end -- from
			--		print ("compiled pattern:	");print(pattern_count);print("%N")
			--		print ("matched subjects:	");print(subject_count);print("%N")
		end -- make


end
