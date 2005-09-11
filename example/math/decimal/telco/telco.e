indexing

	description:

		"Telco benchmark"

	specification: "http://www2.hursley.ibm.com/decimal/telco.html"
	copyright: "Copyright (c) 2005, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TELCO

inherit

	ANY

	KL_SHARED_FILE_SYSTEM

	KL_SHARED_STANDARD_FILES

	DT_SHARED_SYSTEM_CLOCK

	KL_SHARED_ARGUMENTS

	KL_SHARED_EXCEPTIONS

	KL_SHARED_EXECUTION_ENVIRONMENT

	MA_DECIMAL_CONSTANTS
	
create

	make

feature {NONE} -- Initialization

	make is
			-- Start telco benchmark.
		do
			std.output.put_line ("-- telco application")
			std.output.put_line ("--")
			std.output.put_line ("-- Benchmark for Decimal Arithmetic")
			std.output.put_line ("--")
			std.output.put_line ("-- Eiffel implementation - Gobo Eiffel Decimal Arithmetic Library")
			std.output.put_line ("--")
			create bcd_parser.make
				-- Set default options.
			tax := True
			calculate := True
			input_filename := file_system.pathname (telco_dirname, "telco.test")
			output_filename := "telco.outc"
				-- Read command-line arguments.
			read_arguments
			if arguments_ok then
				do_benchmark
			else
				print_usage
			end
		end

feature -- Access

	number_count: INTEGER
			-- Number of decimal numbers read from file

	last_number: MA_DECIMAL
			-- Last decimal number read from file

	last_nibble: INTEGER
			-- Last nibble read from file

	input_filename: STRING
			-- Input filename

	output_filename: STRING
			-- Output filename

	arguments_ok: BOOLEAN
			-- Are arguments passed on the command-line valid?

	calculate: BOOLEAN
			-- Is actual computation performed?
			-- (reading/writing only otherwise)

	tax: BOOLEAN
			-- Is tax computation performed?

	bcd_parser: MA_DECIMAL_BCD_PARSER
			-- Decimal parser

feature -- Basic operations

	do_benchmark is
			-- Do actual benchmarks.
		local
			sum_t, sum_b, sum_d: MA_DECIMAL
			number, price, base_tax, distance_tax, total_price: MA_DECIMAL
			base_rate, distance_rate: MA_DECIMAL
			base_tax_rate, distance_tax_rate: MA_DECIMAL
			price_context,  tax_context: MA_DECIMAL_CONTEXT
			long_distance: BOOLEAN
			long_distance_count: INTEGER
			t_start, t_end: DT_TIME
			input_file: KL_BINARY_INPUT_FILE
			output_file: KL_TEXT_OUTPUT_FILE
			l_default_context: MA_DECIMAL_CONTEXT
		do
				-- Establish math contexts.
			create price_context.make_double
			price_context.set_digits (31)
			price_context.set_rounding_mode (price_context.Round_half_even)
			tax_context := price_context.cloned_object
			tax_context.set_rounding_mode (tax_context.Round_down)
			create l_default_context.make_double
			l_default_context.set_digits (31)
				-- Create rates.
			create base_rate.make_from_string_ctx ("0.0013", l_default_context)
			create distance_rate.make_from_string_ctx ("0.00894", l_default_context)
			create base_tax_rate.make_from_string_ctx ("0.0675", l_default_context)
			create distance_tax_rate.make_from_string_ctx ("0.0341", l_default_context)
				-- Start measuring.
			t_start := system_clock.time_now
				-- Initialization.
			sum_t := base_rate.zero
			sum_b := base_rate.zero
			sum_d := base_rate.zero
				-- Open files.
			create input_file.make (input_filename)
			create output_file.make (output_filename)
			input_file.open_read
			if not input_file.is_open_read then
				std.error.put_string ("Cannot read file: ")
				std.error.put_line (input_filename)
			else
				output_file.open_write
				if not output_file.is_open_write then
					std.error.put_string ("Cannot write to file: ")
					std.error.put_line (output_filename)
					input_file.close
				else
						-- Read file.
					from
						read_number_from_bcd (input_file)
					until
						input_file.end_of_input
					loop
						number := last_number
						if calculate then
							long_distance := last_nibble \\ 2 = 1
								-- 1. Price.
							set_shared_decimal_context (l_default_context)
							if long_distance then
								price := number * distance_rate
								long_distance_count := long_distance_count + 1
							else
								price := number * base_rate
							end
							price := price.rescale (-2, price_context)
							if tax then
									-- 2. Basic tax.
								set_shared_decimal_context (tax_context)
								base_tax := price * base_tax_rate
								base_tax := base_tax.rescale (-2, tax_context)
								sum_b := sum_b + base_tax
								total_price := price + base_tax
									-- 3. Long distance calls.
								if long_distance then
									distance_tax := price * distance_tax_rate
									distance_tax := distance_tax.rescale (-2, tax_context)
									sum_d := sum_d + distance_tax
										-- 4. Total price.
									total_price := total_price + distance_tax
								end
							else
								total_price := price
							end
								-- 5. Compute totals.
							sum_t := sum_t.add (total_price, tax_context)
							output_file.put_line (total_price.to_scientific_string)
						else
								-- Output dummy numbers.
							total_price := number
							output_file.put_line ("123456")
						end
							-- 6. Put string total.
							-- Read again.
						read_number_from_bcd (input_file)
					end
					input_file.close
					output_file.close
				end
			end
				-- Stop measuring.
			t_end := system_clock.time_now
				-- Output results.
			std.output.put_integer (number_count)
			std.output.put_string (" Numbers processed, with ")
			std.output.put_integer (long_distance_count)
			std.output.put_line (" long distance calls")
			std.output.put_new_line
			std.output.put_string ("Duration: ")
			std.output.put_string ((t_end - t_start).to_canonical.precise_out)
			std.output.put_line ("  - hour:minute:second.millisecond")
			std.output.put_new_line
			std.output.put_string ("%Tsum_t = ")
			std.output.put_line (sum_t.to_scientific_string)
			std.output.put_string ("%Tsum_b = ")
			std.output.put_line (sum_b.to_scientific_string)
			std.output.put_string ("%Tsum_d = ")
			std.output.put_line (sum_d.to_scientific_string)
		end

	read_arguments is
			-- Read command-line arguments.
		local
			i, nb: INTEGER
			arg: STRING
		do
			arguments_ok := True
			nb := Arguments.argument_count
			from i := 1 until i > nb loop
				arg := Arguments.argument (i)
				if arg.is_equal ("-input") then
					i := i + 1
					if i <= nb then
						input_filename := Arguments.argument (i)
					else
						std.error.put_string ("Expected input filename!")
						arguments_ok := False
						i := nb + 1
					end
				elseif arg.is_equal ("-output") then
					i := i + 1
					if i <= nb then
						output_filename := Arguments.argument (i)
					else
						std.error.put_string ("Expected output filename!")
						arguments_ok := False
						i := nb + 1
					end
				elseif arg.is_equal ("-nocalc") then
					calculate := False
				elseif arg.is_equal ("-notax") then
					tax := False
				else
					std.error.put_string ("Unknown argument: '")
					std.error.put_string (arg)
					std.error.put_character ('%'')
					std.error.put_new_line
					arguments_ok := False
					i := nb + 1
				end
				i := i + 1
			end
		end

	read_number_from_bcd (a_file: KL_BINARY_INPUT_FILE) is
			-- Read number from `a_file' in packed decimal representation
			-- and make it available in `last_number'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_file_not_end_of_input: not a_file.end_of_input
		local
			l_packed_string: STRING
		do
			a_file.read_string (8)
			if not a_file.end_of_input then
				if calculate then
					l_packed_string := a_file.last_string
					bcd_parser.parse (l_packed_string)
					if not bcd_parser.error then
						last_number := bcd_parser.last_decimal
					else
						Exceptions.raise ("Invalid file format: need 8 byte packed decimal")
					end
					last_nibble := bcd_parser.last_nibble
				else
					last_number := zero
				end
				number_count := number_count + 1
			end
		end

feature -- Error handling

	print_usage is
			-- Print usage message.
		do
			std.error.put_line ("Usage : telco [-input <filename>] [-output <filename>] [-nocalc] [-notax]")
			std.error.put_line ("%T[-input <filename>]    Use <filename> as input,")
			std.error.put_line ("%T[-output <filename>]   Use <filename> as output,")
			std.error.put_line ("%T[-nocalc]              Do not calculate; reading/writing only,")
			std.error.put_line ("%T[-notax]               Do not calculate tax.")
		end

feature {NONE} -- Constants

	telco_dirname: STRING is
			-- Full directory name of "$GOBO/example/math/decimal/telco/data"
		do
				-- Bug in ISE 5.6 for .NET: use a do-function rather than
				-- a once-function, otherwise ${GOBO} is not replaced by
				-- its value in `interpreted_string'.
			Result := file_system.nested_pathname ("${GOBO}", <<"example", "math", "decimal", "telco", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			telco_dirname_not_void: Result /= Void
		end

invariant

	bcd_parser_not_void: bcd_parser /= Void
	input_filename_not_void: input_filename /= Void
	output_filename_not_void: output_filename /= Void

end
