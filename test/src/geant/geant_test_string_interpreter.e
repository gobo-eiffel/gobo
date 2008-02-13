indexing

	description:

		"Test features of classes GEANT_STRING_INTERPRETER and GEANT_VARIABLES_VARIABLE_RESOLVER"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2005, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_TEST_STRING_INTERPRETER

inherit

	TS_TEST_CASE
		redefine
			tear_down, set_up
		end

create

	make_default

feature -- Test

	test_template is
			-- Test simple string interpretion.
		local
			a_variables: GEANT_VARIABLES
			template: STRING
			s: STRING
		do
			create a_variables.make
			vr.set_variables (a_variables)
			a_variables.put ("index.html", "output_filename")
			a_variables.put ("gobo2html2.xsl", "stylesheet_filename")
			a_variables.put ("index.xml", "input_filename")
			template := "gexslt --output=${output_filename} --file=${stylesheet_filename} --file=${input_filename}"
			s := si.interpreted_string (template)
			assert_equal ("test_template_1", "gexslt --output=index.html --file=gobo2html2.xsl --file=index.xml", s)
		end

feature -- Execution

	set_up is
			-- Setup for a test.
		do
			create si.make
			create vr.make
			si.set_variable_resolver (vr)
		end

	tear_down is
			-- Tear down after a test.
		do
			si := Void
			vr := Void
		end

feature {NONE} -- Implementation

	si: GEANT_STRING_INTERPRETER
			-- Object under test

	vr: GEANT_VARIABLES_VARIABLE_RESOLVER
			-- Variables to be used with `si'

end
