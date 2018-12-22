note

	description:

		"Test features of classes GEANT_STRING_INTERPRETER and GEANT_VARIABLES_VARIABLE_RESOLVER"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2005-2018, Sven Ehrke and others"
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

	test_template
			-- Test simple string interpretion.
		local
			a_variables: GEANT_VARIABLES
			template: STRING
			s: STRING
		do
			if attached vr as l_vr and attached si as l_si then
				create a_variables.make
				l_vr.set_variables (a_variables)
				a_variables.put ("index.html", "output_filename")
				a_variables.put ("gobo2html2.xsl", "stylesheet_filename")
				a_variables.put ("index.xml", "input_filename")
				template := "gexslt --output=${output_filename} --file=${stylesheet_filename} --file=${input_filename}"
				s := l_si.interpreted_string (template)
				assert_equal ("test_template_1", "gexslt --output=index.html --file=gobo2html2.xsl --file=index.xml", s)
			end
		end

feature -- Execution

	set_up
			-- Setup for a test.
		local
			a_variables: GEANT_VARIABLES
			l_si: like si
			l_vr: like vr
		do
			create l_si.make
			si := l_si
			create a_variables.make
			create l_vr.make (a_variables)
			vr := l_vr
			l_si.set_variable_resolver (l_vr)
		end

	tear_down
			-- Tear down after a test.
		do
			si := Void
			vr := Void
		end

feature {NONE} -- Implementation

	si: detachable GEANT_STRING_INTERPRETER
			-- Object under test

	vr: detachable GEANT_VARIABLES_VARIABLE_RESOLVER
			-- Variables to be used with `si'

end
