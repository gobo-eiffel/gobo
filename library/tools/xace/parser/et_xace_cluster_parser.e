indexing

	description:

		"Xace cluster parsers"

	library:	"Gobo Eiffel Tools Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

class ET_XACE_CLUSTER_PARSER

inherit

	ET_XACE_PARSER
		redefine
			parse_file
		end

creation

	make, make_with_variables

feature -- Parsing

	parse_file (a_file: like INPUT_STREAM_TYPE) is
			-- Parse Xace file `a_file'.
		local
			a_parser_factory: XM_PARSER_FACTORY
		do
			last_cluster := Void
			if xml_parser /= Void then
				xml_parser.parse_from_stream (a_file)
				if xml_parser.is_correct then
					xml_validator.validate_cluster_doc (xml_parser.document, xml_parser.last_position_table)
					if not xml_validator.has_error then
						xml_preprocessor.preprocess_composite (xml_parser.document, xml_parser.last_position_table)
						last_cluster := ast_factory.new_cluster (xml_parser.document.root_element)
					end
				else
					error_handler.report_parser_error (xml_parser.last_error_extended_description)
				end
			else
				error_handler.report_no_parser_available_error
			end
		end

feature -- Access

	last_cluster: ET_XACE_CLUSTER
			-- Cluster being parsed

end -- class ET_XACE_CLUSTER_PARSER
