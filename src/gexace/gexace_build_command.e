indexing

	description:

		"Build commands for 'gexace'"

	system: "Gobo Eiffel Xace"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class GEXACE_BUILD_COMMAND

inherit

	GEXACE_COMMAND

feature -- Access

	generators: DS_LINKED_LIST [ET_XACE_GENERATOR]
			-- Eiffel config file generators

	format: STRING
			-- Name of Eiffel config file format
			-- (e.g. ace, ecf, ...)

	output_filename: STRING
			-- Output filename

feature -- Setting

	set_format (a_format: like format) is
			-- Set `format' to `a_format'.
		do
			format := a_format
		ensure
			format_set: format = a_format
		end

	set_output_filename (a_filename: like output_filename) is
			-- Set `output_filename' to `a_filename'.
		do
			output_filename := a_filename
		ensure
			output_filename_set: output_filename = a_filename
		end

invariant

	generators_not_void: generators /= Void
	no_void_generator: not generators.has (Void)

end
