note

	description:

		"Test the Eiffel parser when parsing assertions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TEST_PARSING_ASSERTIONS

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_inline_agent_in_precondition
			-- Test whether the parser can parse correctly an inline agent
			-- containing a precondition which itself appears in the
			-- precondition of its enclosing routine.
		do
			check_class ("AA", inline_agent_in_precondition)
		end

	test_inline_agent_in_check_instruction
			-- Test whether the parser can parse correctly an inline agent
			-- containing a precondition which itself appears in a
			-- check instruction.
		do
			check_class ("BB", inline_agent_in_check_instruction)
		end

	test_tag_in_nested_check_instruction
			-- Test whether the parser can parse correctly an assertion
			-- made up of a tag with no expression in a check instrunction
			-- containing another check instruction whose first assertion
			-- as no tag.
		do
			check_class ("CC", tag_in_nested_check_instruction)
		end
		
feature {NONE} -- Implementation

	check_class (a_class_name, a_class_text: STRING)
			-- Check that parsing `a_class_text' to AST and then printing 
			-- the AST produce the same class text.
		require
			a_class_name_not_void: a_class_name /= Void
			a_class_name_not_empty: not a_class_name.is_empty
			a_class_text_not_void: a_class_text /= Void
			a_class_text_not_empty: not a_class_text.is_empty
		local
			l_system: ET_SYSTEM
			l_ast_factory: ET_DECORATED_AST_FACTORY
			l_system_processor: ET_SYSTEM_PROCESSOR
			l_group: ET_TEXT_GROUP
			l_class: ET_CLASS
			l_identifier: ET_IDENTIFIER
			l_printer: ET_AST_PRINTER
			l_output_stream: KL_STRING_OUTPUT_STREAM
		do
			create l_system.make ("test_system")
			create l_ast_factory.make
			l_ast_factory.set_keep_all_breaks (True)
			l_system.set_default_keyword_usage
			create l_system_processor.make_null
			l_system_processor.activate (l_system)
			l_system_processor.set_ast_factory (l_ast_factory)
			create l_group.make ("text_group", l_system)
			create l_identifier.make (a_class_name)
			create l_class.make (l_identifier)
			l_class.set_time_stamp (-1)
			l_class.set_group (l_group)
			l_group.set_class_text (a_class_text, l_class)
			l_class.process (l_system_processor.eiffel_parser)
			assert (a_class_name + "_parsed", l_class.is_parsed)
			assert (a_class_name + "_no_syntax_error", not l_class.has_syntax_error)
			create l_printer.make_null
			create l_output_stream.make_empty
			l_printer.set_file (l_output_stream)
			l_class.process (l_printer)
			l_printer.set_null_file
			assert_strings_equal (a_class_name + "_parsed_correctly", a_class_text, l_output_stream.string)
		end
		
	inline_agent_in_precondition: STRING = "[
class AA
feature
	f
		require
			a: foo
			b: bar
			c: for_all (agent (a_any: ANY): BOOLEAN
				require
					d: toto
				do
				end)
		do
		end
end
]"

	inline_agent_in_check_instruction: STRING = "[
class BB
feature
	f
		do
			check
				a: foo
				b: bar
			then
				do_all (agent (a_any: ANY): BOOLEAN
					require
						d: toto
					do
					end)
			end
		end
end
]"

	tag_in_nested_check_instruction: STRING = "[
class CC
feature
	f
		do
			check
				a: foo
				b: -- bar
			then
				check
					toto
				then
				end
			end
		end
end
]"

end
