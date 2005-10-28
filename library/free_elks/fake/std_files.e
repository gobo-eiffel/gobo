class STD_FILES

feature

	put_string (a_string: STRING) is
		local
			std_files: KL_SHARED_STANDARD_FILES
		do
			create std_files
			std_files.std.output.put_string (a_string)
		end

	set_output_default is
		do
		end

end
