indexing
	
	description:
	
		"Test namespace from http://www.jclark.com/xml/xmlns.htm (normalised)"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_TEST_NAMESPACE_JCLARK

inherit

	TS_TEST_CASE

	XM_CALLBACKS_FILTER_FACTORY
		export {NONE} all end
		
feature

	test_cars is
		do
			assert_namespace ("cars",
				"<cars:part xmlns:cars=%"http://www.cars.com/xml%"/>",
				"<{http://www.cars.com/xml}part></{http://www.cars.com/xml}part>")
		end
	
	test_html is
		do
			assert_namespace ("test",
				"<NAME HTML:CLASS=%"largeSansSerif%" xmlns:HTML=%"http://www.w3.org/TR/REC-html40%">Layman, A</NAME>",
				"<NAME {http://www.w3.org/TR/REC-html40}CLASS=%"largeSansSerif%">Layman, A</NAME>")
		end
		
	test_reservation is
		do
			assert_namespace ("reservation",
			"<RESERVATION xmlns:HTML=%"http://www.w3.org/TR/REC-html40%">"+
			"<NAME HTML:CLASS=%"largeSansSerif%">Layman, A</NAME>"+
			"<SEAT CLASS=%"Y%" HTML:CLASS=%"largeMonotype%">33B</SEAT>"+
			"<HTML:A HREF='/cgi-bin/ResStatus'>Check Status</HTML:A>"+
			"<DEPARTURE>1997-05-24T07:55:00+1</DEPARTURE></RESERVATION>"
			,
			"<RESERVATION>"+
			"<NAME {http://www.w3.org/TR/REC-html40}CLASS=%"largeSansSerif%">Layman, A</NAME>"+
			"<SEAT CLASS=%"Y%" {http://www.w3.org/TR/REC-html40}CLASS=%"largeMonotype%">33B</SEAT>"+
			"<{http://www.w3.org/TR/REC-html40}A HREF=%"/cgi-bin/ResStatus%">Check Status</{http://www.w3.org/TR/REC-html40}A>"+
			"<DEPARTURE>1997-05-24T07:55:00+1</DEPARTURE></RESERVATION>")
		end
		
	test_book is
		do
			assert_namespace ("book",
				"<section xmlns='urn:com:books-r-us'>"+
				"	<title>Book-Signing Event</title>"+
				"	<signing>"+
				"		<author title=%"Mr%" name=%"Vikram Seth%" />"+
	   			"		<book title=%"A Suitable Boy%" price=%"$22.95%" />"+
				"	</signing>"+
				"</section>"
				,
				"<{urn:com:books-r-us}section>"+
  				"	<{urn:com:books-r-us}title>Book-Signing Event</{urn:com:books-r-us}title>"+
				"	<{urn:com:books-r-us}signing>"+
			    "		<{urn:com:books-r-us}author title=%"Mr%" name=%"Vikram Seth%"></{urn:com:books-r-us}author>"+
			    "		<{urn:com:books-r-us}book title=%"A Suitable Boy%" price=%"$22.95%"></{urn:com:books-r-us}book>"+
  				"	</{urn:com:books-r-us}signing>"+
				"</{urn:com:books-r-us}section>")
		end
		
	test_book_empty is
		do
			assert_namespace ("book_empty",
				"<section xmlns='urn:com:books-r-us'>"+
				"<title>Book-Signing Event</title>"+
				"<signing xmlns=''>"+
				"<author title=%"Mr%" name=%"Vikram Seth%" />"+
				"<book title=%"A Suitable Boy%" price=%"$22.95%" />"+
				"</signing>"+
				"</section>"
				,
				"<{urn:com:books-r-us}section>"+
				"<{urn:com:books-r-us}title>Book-Signing Event</{urn:com:books-r-us}title>"+
				"<signing>"+
				"<author title=%"Mr%" name=%"Vikram Seth%"></author>"+
				"<book title=%"A Suitable Boy%" price=%"$22.95%"></book>"+
				"</signing>"+
				"</{urn:com:books-r-us}section>")
		end

feature {NONE} -- Implementation

	assert_namespace (a_name: STRING; a_xml: STRING; a_parsed: STRING) is
			-- Test resolved namespaces and pretty printed as expected.
		require
			a_name_not_void: a_name /= Void
			a_xml_not_void: a_xml /= Void
			a_parser_not_void: a_parsed /= Void
		local
			a_parser: XM_EIFFEL_PARSER
			a_printer: XM_NAMESPACE_PRETTY_PRINT_FILTER
		do
			create a_printer.make_null
			a_printer.set_output_to_string
			
			create a_parser.make
			a_parser.set_callbacks (standard_callbacks_pipe (<<a_printer>>))
			a_parser.parse_from_string (a_xml)
			
			assert ("parsing ok for "+a_name, a_parser.is_correct)
			assert_equal (a_name, a_parsed, a_printer.last_output)
		end

end

