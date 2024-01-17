note

	description:

		"[
			Output streams for tests progress status.
			The progess status message looks like this:
			'progress_prefix'['test_count'/'total_test_count'] 'test_name''progress_suffix'
		]"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2023, Eric Bezault and others"
	license: "MIT License"

class TS_PROGRESS_STREAM

inherit

	KL_STRING_OUTPUT_STREAM
		redefine
			make,
			flush
		end

	KL_SHARED_STREAMS
		export {NONE} all end

create

	make,
	make_empty

feature {NONE} -- Initialization

	make (a_string: STRING_8)
			-- Create output to an existing string.
		do
			precursor (a_string)
			progress_prefix := "%RRunning Test Case "
			progress_suffix := "%R"
			max_line_count := 70
			output_file := null_output_stream
		end

feature -- Access

	progress_prefix: detachable STRING
			-- Prefix to be printed to `output_file', if any

	progress_suffix: detachable STRING
			-- Suffix to be printed to `output_file', if any		

	total_test_count: INTEGER
			-- Number of tests to be executed

	test_count: INTEGER
			-- Number of tests already executed

	output_file: KI_TEXT_OUTPUT_STREAM
			-- Where to print progress status message

	max_line_count: INTEGER
			-- Maximum number of character in progress status message

feature -- Setting

	set_progress_prefix (a_prefix: like progress_prefix)
			-- Set `progress_prefix' to `a_prefix'.
		do
			progress_prefix := a_prefix
		ensure
			progress_prefix_set: progress_prefix = a_prefix
		end

	set_progress_suffix (a_suffix: like progress_suffix)
			-- Set `progress_suffix' to `a_suffix'.
		do
			progress_suffix := a_suffix
		ensure
			progress_suffix_set: progress_suffix = a_suffix
		end

	set_total_test_count (a_count: INTEGER)
			-- Set `total_test_count' to `a_count'.
		do
			total_test_count := a_count
		ensure
			total_test_count_set: total_test_count = a_count
		end

	set_output_file (a_output: like output_file)
			-- Set `output_file' to `a_output'.
		require
			a_output_not_void: a_output /= Void
			a_output_open_write: a_output.is_open_write
		do
			output_file := a_output
		ensure
			output_file_set: output_file = a_output
		end

	set_max_line_count (a_count: INTEGER)
			-- Set `max_line_count' to `a_count'
		require
			a_count_not_negative: a_count >= 0
		do
			max_line_count := a_count
		ensure
			max_line_count_set: max_line_count = a_count
		end

feature -- Basic operations

	flush
			-- Take into account progress status reported so far.
		local
			l_test_name: STRING
			l_start: STRING
			l_end: STRING
			i, nb: INTEGER
		do
			if string.starts_with ("@") then
				test_count := test_count + 1
				create l_start.make (max_line_count)
				if attached progress_prefix as l_prefix then
					l_start.append_string (l_prefix)
				end
				l_start.append_character ('[')
				l_start.append_integer (test_count)
				l_start.append_character ('/')
				l_start.append_integer (total_test_count)
				l_start.append_character (']')
				l_start.append_character (' ')
				if attached progress_suffix as l_suffix then
					l_end := l_suffix
				else
					l_end := ""
				end
				nb := max_line_count - l_start.count - l_end.count
				l_test_name := string.substring (2, string.count)
				l_test_name.adjust
				if l_test_name.count > nb then
					from
						i := l_test_name.index_of ('/', 1)
					until
						i <= 0
					loop
						l_test_name.remove_head (i)
						if l_test_name.count > nb then
							i := l_test_name.index_of ('/', 1)
						else
							i := 0
						end
					end
				end
				if l_test_name.count > nb then
					l_test_name.keep_head (nb.max (0))
				elseif l_test_name.count < nb then
					from i := l_test_name.count + 1 until i > nb loop
						l_test_name.append_character (' ')
						i := i + 1
					end
				end
				output_file.put_string (l_start + l_test_name + l_end)
				output_file.flush
			end
			string.wipe_out
		end

invariant

	output_file_not_void: output_file /= Void
	output_file_open_write: output_file.is_open_write

end
