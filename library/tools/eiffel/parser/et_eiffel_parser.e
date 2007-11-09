indexing

	description:

		"Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_PARSER

inherit

	ET_EIFFEL_PARSER_SKELETON
		undefine
			read_token
		redefine
			yyparse, universe
		end

	ET_EIFFEL_SCANNER
		rename
			make as make_eiffel_scanner,
			make_with_factory as make_eiffel_scanner_with_factory
		undefine
			reset, set_syntax_error
		redefine
			universe
		end

create

	make, make_with_factory


feature {NONE} -- Implementation

	yy_build_parser_tables is
			-- Build parser tables.
		do
			yytranslate := yytranslate_template
			yyr1 := yyr1_template
			yytypes1 := yytypes1_template
			yytypes2 := yytypes2_template
			yydefact := yydefact_template
			yydefgoto := yydefgoto_template
			yypact := yypact_template
			yypgoto := yypgoto_template
			yytable := yytable_template
			yycheck := yycheck_template
		end

	yy_create_value_stacks is
			-- Create value stacks.
		do
		end

	yy_init_value_stacks is
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
			yyvsp4 := -1
			yyvsp5 := -1
			yyvsp6 := -1
			yyvsp7 := -1
			yyvsp8 := -1
			yyvsp9 := -1
			yyvsp10 := -1
			yyvsp11 := -1
			yyvsp12 := -1
			yyvsp13 := -1
			yyvsp14 := -1
			yyvsp15 := -1
			yyvsp16 := -1
			yyvsp17 := -1
			yyvsp18 := -1
			yyvsp19 := -1
			yyvsp20 := -1
			yyvsp21 := -1
			yyvsp22 := -1
			yyvsp23 := -1
			yyvsp24 := -1
			yyvsp25 := -1
			yyvsp26 := -1
			yyvsp27 := -1
			yyvsp28 := -1
			yyvsp29 := -1
			yyvsp30 := -1
			yyvsp31 := -1
			yyvsp32 := -1
			yyvsp33 := -1
			yyvsp34 := -1
			yyvsp35 := -1
			yyvsp36 := -1
			yyvsp37 := -1
			yyvsp38 := -1
			yyvsp39 := -1
			yyvsp40 := -1
			yyvsp41 := -1
			yyvsp42 := -1
			yyvsp43 := -1
			yyvsp44 := -1
			yyvsp45 := -1
			yyvsp46 := -1
			yyvsp47 := -1
			yyvsp48 := -1
			yyvsp49 := -1
			yyvsp50 := -1
			yyvsp51 := -1
			yyvsp52 := -1
			yyvsp53 := -1
			yyvsp54 := -1
			yyvsp55 := -1
			yyvsp56 := -1
			yyvsp57 := -1
			yyvsp58 := -1
			yyvsp59 := -1
			yyvsp60 := -1
			yyvsp61 := -1
			yyvsp62 := -1
			yyvsp63 := -1
			yyvsp64 := -1
			yyvsp65 := -1
			yyvsp66 := -1
			yyvsp67 := -1
			yyvsp68 := -1
			yyvsp69 := -1
			yyvsp70 := -1
			yyvsp71 := -1
			yyvsp72 := -1
			yyvsp73 := -1
			yyvsp74 := -1
			yyvsp75 := -1
			yyvsp76 := -1
			yyvsp77 := -1
			yyvsp78 := -1
			yyvsp79 := -1
			yyvsp80 := -1
			yyvsp81 := -1
			yyvsp82 := -1
			yyvsp83 := -1
			yyvsp84 := -1
			yyvsp85 := -1
			yyvsp86 := -1
			yyvsp87 := -1
			yyvsp88 := -1
			yyvsp89 := -1
			yyvsp90 := -1
			yyvsp91 := -1
			yyvsp92 := -1
			yyvsp93 := -1
			yyvsp94 := -1
			yyvsp95 := -1
			yyvsp96 := -1
			yyvsp97 := -1
			yyvsp98 := -1
			yyvsp99 := -1
			yyvsp100 := -1
			yyvsp101 := -1
			yyvsp102 := -1
			yyvsp103 := -1
			yyvsp104 := -1
			yyvsp105 := -1
			yyvsp106 := -1
			yyvsp107 := -1
			yyvsp108 := -1
			yyvsp109 := -1
			yyvsp110 := -1
			yyvsp111 := -1
			yyvsp112 := -1
			yyvsp113 := -1
			yyvsp114 := -1
			yyvsp115 := -1
			yyvsp116 := -1
		end

	yy_clear_value_stacks is
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			if yyvs1 /= Void then
				yyvs1.clear_all
			end
			if yyvs2 /= Void then
				yyvs2.clear_all
			end
			if yyvs3 /= Void then
				yyvs3.clear_all
			end
			if yyvs4 /= Void then
				yyvs4.clear_all
			end
			if yyvs5 /= Void then
				yyvs5.clear_all
			end
			if yyvs6 /= Void then
				yyvs6.clear_all
			end
			if yyvs7 /= Void then
				yyvs7.clear_all
			end
			if yyvs8 /= Void then
				yyvs8.clear_all
			end
			if yyvs9 /= Void then
				yyvs9.clear_all
			end
			if yyvs10 /= Void then
				yyvs10.clear_all
			end
			if yyvs11 /= Void then
				yyvs11.clear_all
			end
			if yyvs12 /= Void then
				yyvs12.clear_all
			end
			if yyvs13 /= Void then
				yyvs13.clear_all
			end
			if yyvs14 /= Void then
				yyvs14.clear_all
			end
			if yyvs15 /= Void then
				yyvs15.clear_all
			end
			if yyvs16 /= Void then
				yyvs16.clear_all
			end
			if yyvs17 /= Void then
				yyvs17.clear_all
			end
			if yyvs18 /= Void then
				yyvs18.clear_all
			end
			if yyvs19 /= Void then
				yyvs19.clear_all
			end
			if yyvs20 /= Void then
				yyvs20.clear_all
			end
			if yyvs21 /= Void then
				yyvs21.clear_all
			end
			if yyvs22 /= Void then
				yyvs22.clear_all
			end
			if yyvs23 /= Void then
				yyvs23.clear_all
			end
			if yyvs24 /= Void then
				yyvs24.clear_all
			end
			if yyvs25 /= Void then
				yyvs25.clear_all
			end
			if yyvs26 /= Void then
				yyvs26.clear_all
			end
			if yyvs27 /= Void then
				yyvs27.clear_all
			end
			if yyvs28 /= Void then
				yyvs28.clear_all
			end
			if yyvs29 /= Void then
				yyvs29.clear_all
			end
			if yyvs30 /= Void then
				yyvs30.clear_all
			end
			if yyvs31 /= Void then
				yyvs31.clear_all
			end
			if yyvs32 /= Void then
				yyvs32.clear_all
			end
			if yyvs33 /= Void then
				yyvs33.clear_all
			end
			if yyvs34 /= Void then
				yyvs34.clear_all
			end
			if yyvs35 /= Void then
				yyvs35.clear_all
			end
			if yyvs36 /= Void then
				yyvs36.clear_all
			end
			if yyvs37 /= Void then
				yyvs37.clear_all
			end
			if yyvs38 /= Void then
				yyvs38.clear_all
			end
			if yyvs39 /= Void then
				yyvs39.clear_all
			end
			if yyvs40 /= Void then
				yyvs40.clear_all
			end
			if yyvs41 /= Void then
				yyvs41.clear_all
			end
			if yyvs42 /= Void then
				yyvs42.clear_all
			end
			if yyvs43 /= Void then
				yyvs43.clear_all
			end
			if yyvs44 /= Void then
				yyvs44.clear_all
			end
			if yyvs45 /= Void then
				yyvs45.clear_all
			end
			if yyvs46 /= Void then
				yyvs46.clear_all
			end
			if yyvs47 /= Void then
				yyvs47.clear_all
			end
			if yyvs48 /= Void then
				yyvs48.clear_all
			end
			if yyvs49 /= Void then
				yyvs49.clear_all
			end
			if yyvs50 /= Void then
				yyvs50.clear_all
			end
			if yyvs51 /= Void then
				yyvs51.clear_all
			end
			if yyvs52 /= Void then
				yyvs52.clear_all
			end
			if yyvs53 /= Void then
				yyvs53.clear_all
			end
			if yyvs54 /= Void then
				yyvs54.clear_all
			end
			if yyvs55 /= Void then
				yyvs55.clear_all
			end
			if yyvs56 /= Void then
				yyvs56.clear_all
			end
			if yyvs57 /= Void then
				yyvs57.clear_all
			end
			if yyvs58 /= Void then
				yyvs58.clear_all
			end
			if yyvs59 /= Void then
				yyvs59.clear_all
			end
			if yyvs60 /= Void then
				yyvs60.clear_all
			end
			if yyvs61 /= Void then
				yyvs61.clear_all
			end
			if yyvs62 /= Void then
				yyvs62.clear_all
			end
			if yyvs63 /= Void then
				yyvs63.clear_all
			end
			if yyvs64 /= Void then
				yyvs64.clear_all
			end
			if yyvs65 /= Void then
				yyvs65.clear_all
			end
			if yyvs66 /= Void then
				yyvs66.clear_all
			end
			if yyvs67 /= Void then
				yyvs67.clear_all
			end
			if yyvs68 /= Void then
				yyvs68.clear_all
			end
			if yyvs69 /= Void then
				yyvs69.clear_all
			end
			if yyvs70 /= Void then
				yyvs70.clear_all
			end
			if yyvs71 /= Void then
				yyvs71.clear_all
			end
			if yyvs72 /= Void then
				yyvs72.clear_all
			end
			if yyvs73 /= Void then
				yyvs73.clear_all
			end
			if yyvs74 /= Void then
				yyvs74.clear_all
			end
			if yyvs75 /= Void then
				yyvs75.clear_all
			end
			if yyvs76 /= Void then
				yyvs76.clear_all
			end
			if yyvs77 /= Void then
				yyvs77.clear_all
			end
			if yyvs78 /= Void then
				yyvs78.clear_all
			end
			if yyvs79 /= Void then
				yyvs79.clear_all
			end
			if yyvs80 /= Void then
				yyvs80.clear_all
			end
			if yyvs81 /= Void then
				yyvs81.clear_all
			end
			if yyvs82 /= Void then
				yyvs82.clear_all
			end
			if yyvs83 /= Void then
				yyvs83.clear_all
			end
			if yyvs84 /= Void then
				yyvs84.clear_all
			end
			if yyvs85 /= Void then
				yyvs85.clear_all
			end
			if yyvs86 /= Void then
				yyvs86.clear_all
			end
			if yyvs87 /= Void then
				yyvs87.clear_all
			end
			if yyvs88 /= Void then
				yyvs88.clear_all
			end
			if yyvs89 /= Void then
				yyvs89.clear_all
			end
			if yyvs90 /= Void then
				yyvs90.clear_all
			end
			if yyvs91 /= Void then
				yyvs91.clear_all
			end
			if yyvs92 /= Void then
				yyvs92.clear_all
			end
			if yyvs93 /= Void then
				yyvs93.clear_all
			end
			if yyvs94 /= Void then
				yyvs94.clear_all
			end
			if yyvs95 /= Void then
				yyvs95.clear_all
			end
			if yyvs96 /= Void then
				yyvs96.clear_all
			end
			if yyvs97 /= Void then
				yyvs97.clear_all
			end
			if yyvs98 /= Void then
				yyvs98.clear_all
			end
			if yyvs99 /= Void then
				yyvs99.clear_all
			end
			if yyvs100 /= Void then
				yyvs100.clear_all
			end
			if yyvs101 /= Void then
				yyvs101.clear_all
			end
			if yyvs102 /= Void then
				yyvs102.clear_all
			end
			if yyvs103 /= Void then
				yyvs103.clear_all
			end
			if yyvs104 /= Void then
				yyvs104.clear_all
			end
			if yyvs105 /= Void then
				yyvs105.clear_all
			end
			if yyvs106 /= Void then
				yyvs106.clear_all
			end
			if yyvs107 /= Void then
				yyvs107.clear_all
			end
			if yyvs108 /= Void then
				yyvs108.clear_all
			end
			if yyvs109 /= Void then
				yyvs109.clear_all
			end
			if yyvs110 /= Void then
				yyvs110.clear_all
			end
			if yyvs111 /= Void then
				yyvs111.clear_all
			end
			if yyvs112 /= Void then
				yyvs112.clear_all
			end
			if yyvs113 /= Void then
				yyvs113.clear_all
			end
			if yyvs114 /= Void then
				yyvs114.clear_all
			end
			if yyvs115 /= Void then
				yyvs115.clear_all
			end
			if yyvs116 /= Void then
				yyvs116.clear_all
			end
		end

	yy_push_last_value (yychar1: INTEGER) is
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			inspect yytypes2.item (yychar1)
			when 1 then
				yyvsp1 := yyvsp1 + 1
				if yyvsp1 >= yyvsc1 then
					if yyvs1 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs1")
						end
						create yyspecial_routines1
						yyvsc1 := yyInitial_yyvs_size
						yyvs1 := yyspecial_routines1.make (yyvsc1)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs1")
						end
						yyvsc1 := yyvsc1 + yyInitial_yyvs_size
						yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
					end
				end
				yyvs1.put (last_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					if yyvs2 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs2")
						end
						create yyspecial_routines2
						yyvsc2 := yyInitial_yyvs_size
						yyvs2 := yyspecial_routines2.make (yyvsc2)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs2")
						end
						yyvsc2 := yyvsc2 + yyInitial_yyvs_size
						yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
					end
				end
				yyvs2.put (last_et_keyword_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					if yyvs3 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs3")
						end
						create yyspecial_routines3
						yyvsc3 := yyInitial_yyvs_size
						yyvs3 := yyspecial_routines3.make (yyvsc3)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs3")
						end
						yyvsc3 := yyvsc3 + yyInitial_yyvs_size
						yyvs3 := yyspecial_routines3.resize (yyvs3, yyvsc3)
					end
				end
				yyvs3.put (last_et_agent_keyword_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					if yyvs4 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs4")
						end
						create yyspecial_routines4
						yyvsc4 := yyInitial_yyvs_size
						yyvs4 := yyspecial_routines4.make (yyvsc4)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs4")
						end
						yyvsc4 := yyvsc4 + yyInitial_yyvs_size
						yyvs4 := yyspecial_routines4.resize (yyvs4, yyvsc4)
					end
				end
				yyvs4.put (last_et_precursor_keyword_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					if yyvs5 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs5")
						end
						create yyspecial_routines5
						yyvsc5 := yyInitial_yyvs_size
						yyvs5 := yyspecial_routines5.make (yyvsc5)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs5")
						end
						yyvsc5 := yyvsc5 + yyInitial_yyvs_size
						yyvs5 := yyspecial_routines5.resize (yyvs5, yyvsc5)
					end
				end
				yyvs5.put (last_et_symbol_value, yyvsp5)
			when 6 then
				yyvsp6 := yyvsp6 + 1
				if yyvsp6 >= yyvsc6 then
					if yyvs6 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs6")
						end
						create yyspecial_routines6
						yyvsc6 := yyInitial_yyvs_size
						yyvs6 := yyspecial_routines6.make (yyvsc6)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs6")
						end
						yyvsc6 := yyvsc6 + yyInitial_yyvs_size
						yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
					end
				end
				yyvs6.put (last_et_position_value, yyvsp6)
			when 7 then
				yyvsp7 := yyvsp7 + 1
				if yyvsp7 >= yyvsc7 then
					if yyvs7 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs7")
						end
						create yyspecial_routines7
						yyvsc7 := yyInitial_yyvs_size
						yyvs7 := yyspecial_routines7.make (yyvsc7)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs7")
						end
						yyvsc7 := yyvsc7 + yyInitial_yyvs_size
						yyvs7 := yyspecial_routines7.resize (yyvs7, yyvsc7)
					end
				end
				yyvs7.put (last_et_bit_constant_value, yyvsp7)
			when 8 then
				yyvsp8 := yyvsp8 + 1
				if yyvsp8 >= yyvsc8 then
					if yyvs8 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs8")
						end
						create yyspecial_routines8
						yyvsc8 := yyInitial_yyvs_size
						yyvs8 := yyspecial_routines8.make (yyvsc8)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs8")
						end
						yyvsc8 := yyvsc8 + yyInitial_yyvs_size
						yyvs8 := yyspecial_routines8.resize (yyvs8, yyvsc8)
					end
				end
				yyvs8.put (last_et_boolean_constant_value, yyvsp8)
			when 9 then
				yyvsp9 := yyvsp9 + 1
				if yyvsp9 >= yyvsc9 then
					if yyvs9 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs9")
						end
						create yyspecial_routines9
						yyvsc9 := yyInitial_yyvs_size
						yyvs9 := yyspecial_routines9.make (yyvsc9)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs9")
						end
						yyvsc9 := yyvsc9 + yyInitial_yyvs_size
						yyvs9 := yyspecial_routines9.resize (yyvs9, yyvsc9)
					end
				end
				yyvs9.put (last_et_break_value, yyvsp9)
			when 10 then
				yyvsp10 := yyvsp10 + 1
				if yyvsp10 >= yyvsc10 then
					if yyvs10 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs10")
						end
						create yyspecial_routines10
						yyvsc10 := yyInitial_yyvs_size
						yyvs10 := yyspecial_routines10.make (yyvsc10)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs10")
						end
						yyvsc10 := yyvsc10 + yyInitial_yyvs_size
						yyvs10 := yyspecial_routines10.resize (yyvs10, yyvsc10)
					end
				end
				yyvs10.put (last_et_character_constant_value, yyvsp10)
			when 11 then
				yyvsp11 := yyvsp11 + 1
				if yyvsp11 >= yyvsc11 then
					if yyvs11 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs11")
						end
						create yyspecial_routines11
						yyvsc11 := yyInitial_yyvs_size
						yyvs11 := yyspecial_routines11.make (yyvsc11)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs11")
						end
						yyvsc11 := yyvsc11 + yyInitial_yyvs_size
						yyvs11 := yyspecial_routines11.resize (yyvs11, yyvsc11)
					end
				end
				yyvs11.put (last_et_current_value, yyvsp11)
			when 12 then
				yyvsp12 := yyvsp12 + 1
				if yyvsp12 >= yyvsc12 then
					if yyvs12 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs12")
						end
						create yyspecial_routines12
						yyvsc12 := yyInitial_yyvs_size
						yyvs12 := yyspecial_routines12.make (yyvsc12)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs12")
						end
						yyvsc12 := yyvsc12 + yyInitial_yyvs_size
						yyvs12 := yyspecial_routines12.resize (yyvs12, yyvsc12)
					end
				end
				yyvs12.put (last_et_free_operator_value, yyvsp12)
			when 13 then
				yyvsp13 := yyvsp13 + 1
				if yyvsp13 >= yyvsc13 then
					if yyvs13 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs13")
						end
						create yyspecial_routines13
						yyvsc13 := yyInitial_yyvs_size
						yyvs13 := yyspecial_routines13.make (yyvsc13)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs13")
						end
						yyvsc13 := yyvsc13 + yyInitial_yyvs_size
						yyvs13 := yyspecial_routines13.resize (yyvs13, yyvsc13)
					end
				end
				yyvs13.put (last_et_identifier_value, yyvsp13)
			when 14 then
				yyvsp14 := yyvsp14 + 1
				if yyvsp14 >= yyvsc14 then
					if yyvs14 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs14")
						end
						create yyspecial_routines14
						yyvsc14 := yyInitial_yyvs_size
						yyvs14 := yyspecial_routines14.make (yyvsc14)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs14")
						end
						yyvsc14 := yyvsc14 + yyInitial_yyvs_size
						yyvs14 := yyspecial_routines14.resize (yyvs14, yyvsc14)
					end
				end
				yyvs14.put (last_et_integer_constant_value, yyvsp14)
			when 15 then
				yyvsp15 := yyvsp15 + 1
				if yyvsp15 >= yyvsc15 then
					if yyvs15 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs15")
						end
						create yyspecial_routines15
						yyvsc15 := yyInitial_yyvs_size
						yyvs15 := yyspecial_routines15.make (yyvsc15)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs15")
						end
						yyvsc15 := yyvsc15 + yyInitial_yyvs_size
						yyvs15 := yyspecial_routines15.resize (yyvs15, yyvsc15)
					end
				end
				yyvs15.put (last_et_keyword_operator_value, yyvsp15)
			when 16 then
				yyvsp16 := yyvsp16 + 1
				if yyvsp16 >= yyvsc16 then
					if yyvs16 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs16")
						end
						create yyspecial_routines16
						yyvsc16 := yyInitial_yyvs_size
						yyvs16 := yyspecial_routines16.make (yyvsc16)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs16")
						end
						yyvsc16 := yyvsc16 + yyInitial_yyvs_size
						yyvs16 := yyspecial_routines16.resize (yyvs16, yyvsc16)
					end
				end
				yyvs16.put (last_et_manifest_string_value, yyvsp16)
			when 17 then
				yyvsp17 := yyvsp17 + 1
				if yyvsp17 >= yyvsc17 then
					if yyvs17 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs17")
						end
						create yyspecial_routines17
						yyvsc17 := yyInitial_yyvs_size
						yyvs17 := yyspecial_routines17.make (yyvsc17)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs17")
						end
						yyvsc17 := yyvsc17 + yyInitial_yyvs_size
						yyvs17 := yyspecial_routines17.resize (yyvs17, yyvsc17)
					end
				end
				yyvs17.put (last_et_real_constant_value, yyvsp17)
			when 18 then
				yyvsp18 := yyvsp18 + 1
				if yyvsp18 >= yyvsc18 then
					if yyvs18 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs18")
						end
						create yyspecial_routines18
						yyvsc18 := yyInitial_yyvs_size
						yyvs18 := yyspecial_routines18.make (yyvsc18)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs18")
						end
						yyvsc18 := yyvsc18 + yyInitial_yyvs_size
						yyvs18 := yyspecial_routines18.resize (yyvs18, yyvsc18)
					end
				end
				yyvs18.put (last_et_result_value, yyvsp18)
			when 19 then
				yyvsp19 := yyvsp19 + 1
				if yyvsp19 >= yyvsc19 then
					if yyvs19 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs19")
						end
						create yyspecial_routines19
						yyvsc19 := yyInitial_yyvs_size
						yyvs19 := yyspecial_routines19.make (yyvsc19)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs19")
						end
						yyvsc19 := yyvsc19 + yyInitial_yyvs_size
						yyvs19 := yyspecial_routines19.resize (yyvs19, yyvsc19)
					end
				end
				yyvs19.put (last_et_retry_instruction_value, yyvsp19)
			when 20 then
				yyvsp20 := yyvsp20 + 1
				if yyvsp20 >= yyvsc20 then
					if yyvs20 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs20")
						end
						create yyspecial_routines20
						yyvsc20 := yyInitial_yyvs_size
						yyvs20 := yyspecial_routines20.make (yyvsc20)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs20")
						end
						yyvsc20 := yyvsc20 + yyInitial_yyvs_size
						yyvs20 := yyspecial_routines20.resize (yyvs20, yyvsc20)
					end
				end
				yyvs20.put (last_et_symbol_operator_value, yyvsp20)
			when 21 then
				yyvsp21 := yyvsp21 + 1
				if yyvsp21 >= yyvsc21 then
					if yyvs21 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs21")
						end
						create yyspecial_routines21
						yyvsc21 := yyInitial_yyvs_size
						yyvs21 := yyspecial_routines21.make (yyvsc21)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs21")
						end
						yyvsc21 := yyvsc21 + yyInitial_yyvs_size
						yyvs21 := yyspecial_routines21.resize (yyvs21, yyvsc21)
					end
				end
				yyvs21.put (last_et_void_value, yyvsp21)
			when 22 then
				yyvsp22 := yyvsp22 + 1
				if yyvsp22 >= yyvsc22 then
					if yyvs22 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs22")
						end
						create yyspecial_routines22
						yyvsc22 := yyInitial_yyvs_size
						yyvs22 := yyspecial_routines22.make (yyvsc22)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs22")
						end
						yyvsc22 := yyvsc22 + yyInitial_yyvs_size
						yyvs22 := yyspecial_routines22.resize (yyvs22, yyvsc22)
					end
				end
				yyvs22.put (last_et_semicolon_symbol_value, yyvsp22)
			when 23 then
				yyvsp23 := yyvsp23 + 1
				if yyvsp23 >= yyvsc23 then
					if yyvs23 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs23")
						end
						create yyspecial_routines23
						yyvsc23 := yyInitial_yyvs_size
						yyvs23 := yyspecial_routines23.make (yyvsc23)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs23")
						end
						yyvsc23 := yyvsc23 + yyInitial_yyvs_size
						yyvs23 := yyspecial_routines23.resize (yyvs23, yyvsc23)
					end
				end
				yyvs23.put (last_et_bracket_symbol_value, yyvsp23)
			when 24 then
				yyvsp24 := yyvsp24 + 1
				if yyvsp24 >= yyvsc24 then
					if yyvs24 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs24")
						end
						create yyspecial_routines24
						yyvsc24 := yyInitial_yyvs_size
						yyvs24 := yyspecial_routines24.make (yyvsc24)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs24")
						end
						yyvsc24 := yyvsc24 + yyInitial_yyvs_size
						yyvs24 := yyspecial_routines24.resize (yyvs24, yyvsc24)
					end
				end
				yyvs24.put (last_et_question_mark_symbol_value, yyvsp24)
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: not a token type: ")
					std.error.put_integer (yytypes2.item (yychar1))
					std.error.put_new_line
				end
				abort
			end
		end

	yy_push_error_value is
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		local
			yyval1: ANY
		do
			yyvsp1 := yyvsp1 + 1
			if yyvsp1 >= yyvsc1 then
				if yyvs1 = Void then
					debug ("GEYACC")
						std.error.put_line ("Create yyvs1")
					end
					create yyspecial_routines1
					yyvsc1 := yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.make (yyvsc1)
				else
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs1")
					end
					yyvsc1 := yyvsc1 + yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
				end
			end
			yyvs1.put (yyval1, yyvsp1)
		end

	yy_pop_last_value (yystate: INTEGER) is
			-- Pop semantic value from stack when in state `yystate'.
		local
			yy_type_id: INTEGER
		do
			yy_type_id := yytypes1.item (yystate)
			inspect yy_type_id
			when 1 then
				yyvsp1 := yyvsp1 - 1
			when 2 then
				yyvsp2 := yyvsp2 - 1
			when 3 then
				yyvsp3 := yyvsp3 - 1
			when 4 then
				yyvsp4 := yyvsp4 - 1
			when 5 then
				yyvsp5 := yyvsp5 - 1
			when 6 then
				yyvsp6 := yyvsp6 - 1
			when 7 then
				yyvsp7 := yyvsp7 - 1
			when 8 then
				yyvsp8 := yyvsp8 - 1
			when 9 then
				yyvsp9 := yyvsp9 - 1
			when 10 then
				yyvsp10 := yyvsp10 - 1
			when 11 then
				yyvsp11 := yyvsp11 - 1
			when 12 then
				yyvsp12 := yyvsp12 - 1
			when 13 then
				yyvsp13 := yyvsp13 - 1
			when 14 then
				yyvsp14 := yyvsp14 - 1
			when 15 then
				yyvsp15 := yyvsp15 - 1
			when 16 then
				yyvsp16 := yyvsp16 - 1
			when 17 then
				yyvsp17 := yyvsp17 - 1
			when 18 then
				yyvsp18 := yyvsp18 - 1
			when 19 then
				yyvsp19 := yyvsp19 - 1
			when 20 then
				yyvsp20 := yyvsp20 - 1
			when 21 then
				yyvsp21 := yyvsp21 - 1
			when 22 then
				yyvsp22 := yyvsp22 - 1
			when 23 then
				yyvsp23 := yyvsp23 - 1
			when 24 then
				yyvsp24 := yyvsp24 - 1
			when 25 then
				yyvsp25 := yyvsp25 - 1
			when 26 then
				yyvsp26 := yyvsp26 - 1
			when 27 then
				yyvsp27 := yyvsp27 - 1
			when 28 then
				yyvsp28 := yyvsp28 - 1
			when 29 then
				yyvsp29 := yyvsp29 - 1
			when 30 then
				yyvsp30 := yyvsp30 - 1
			when 31 then
				yyvsp31 := yyvsp31 - 1
			when 32 then
				yyvsp32 := yyvsp32 - 1
			when 33 then
				yyvsp33 := yyvsp33 - 1
			when 34 then
				yyvsp34 := yyvsp34 - 1
			when 35 then
				yyvsp35 := yyvsp35 - 1
			when 36 then
				yyvsp36 := yyvsp36 - 1
			when 37 then
				yyvsp37 := yyvsp37 - 1
			when 38 then
				yyvsp38 := yyvsp38 - 1
			when 39 then
				yyvsp39 := yyvsp39 - 1
			when 40 then
				yyvsp40 := yyvsp40 - 1
			when 41 then
				yyvsp41 := yyvsp41 - 1
			when 42 then
				yyvsp42 := yyvsp42 - 1
			when 43 then
				yyvsp43 := yyvsp43 - 1
			when 44 then
				yyvsp44 := yyvsp44 - 1
			when 45 then
				yyvsp45 := yyvsp45 - 1
			when 46 then
				yyvsp46 := yyvsp46 - 1
			when 47 then
				yyvsp47 := yyvsp47 - 1
			when 48 then
				yyvsp48 := yyvsp48 - 1
			when 49 then
				yyvsp49 := yyvsp49 - 1
			when 50 then
				yyvsp50 := yyvsp50 - 1
			when 51 then
				yyvsp51 := yyvsp51 - 1
			when 52 then
				yyvsp52 := yyvsp52 - 1
			when 53 then
				yyvsp53 := yyvsp53 - 1
			when 54 then
				yyvsp54 := yyvsp54 - 1
			when 55 then
				yyvsp55 := yyvsp55 - 1
			when 56 then
				yyvsp56 := yyvsp56 - 1
			when 57 then
				yyvsp57 := yyvsp57 - 1
			when 58 then
				yyvsp58 := yyvsp58 - 1
			when 59 then
				yyvsp59 := yyvsp59 - 1
			when 60 then
				yyvsp60 := yyvsp60 - 1
			when 61 then
				yyvsp61 := yyvsp61 - 1
			when 62 then
				yyvsp62 := yyvsp62 - 1
			when 63 then
				yyvsp63 := yyvsp63 - 1
			when 64 then
				yyvsp64 := yyvsp64 - 1
			when 65 then
				yyvsp65 := yyvsp65 - 1
			when 66 then
				yyvsp66 := yyvsp66 - 1
			when 67 then
				yyvsp67 := yyvsp67 - 1
			when 68 then
				yyvsp68 := yyvsp68 - 1
			when 69 then
				yyvsp69 := yyvsp69 - 1
			when 70 then
				yyvsp70 := yyvsp70 - 1
			when 71 then
				yyvsp71 := yyvsp71 - 1
			when 72 then
				yyvsp72 := yyvsp72 - 1
			when 73 then
				yyvsp73 := yyvsp73 - 1
			when 74 then
				yyvsp74 := yyvsp74 - 1
			when 75 then
				yyvsp75 := yyvsp75 - 1
			when 76 then
				yyvsp76 := yyvsp76 - 1
			when 77 then
				yyvsp77 := yyvsp77 - 1
			when 78 then
				yyvsp78 := yyvsp78 - 1
			when 79 then
				yyvsp79 := yyvsp79 - 1
			when 80 then
				yyvsp80 := yyvsp80 - 1
			when 81 then
				yyvsp81 := yyvsp81 - 1
			when 82 then
				yyvsp82 := yyvsp82 - 1
			when 83 then
				yyvsp83 := yyvsp83 - 1
			when 84 then
				yyvsp84 := yyvsp84 - 1
			when 85 then
				yyvsp85 := yyvsp85 - 1
			when 86 then
				yyvsp86 := yyvsp86 - 1
			when 87 then
				yyvsp87 := yyvsp87 - 1
			when 88 then
				yyvsp88 := yyvsp88 - 1
			when 89 then
				yyvsp89 := yyvsp89 - 1
			when 90 then
				yyvsp90 := yyvsp90 - 1
			when 91 then
				yyvsp91 := yyvsp91 - 1
			when 92 then
				yyvsp92 := yyvsp92 - 1
			when 93 then
				yyvsp93 := yyvsp93 - 1
			when 94 then
				yyvsp94 := yyvsp94 - 1
			when 95 then
				yyvsp95 := yyvsp95 - 1
			when 96 then
				yyvsp96 := yyvsp96 - 1
			when 97 then
				yyvsp97 := yyvsp97 - 1
			when 98 then
				yyvsp98 := yyvsp98 - 1
			when 99 then
				yyvsp99 := yyvsp99 - 1
			when 100 then
				yyvsp100 := yyvsp100 - 1
			when 101 then
				yyvsp101 := yyvsp101 - 1
			when 102 then
				yyvsp102 := yyvsp102 - 1
			when 103 then
				yyvsp103 := yyvsp103 - 1
			when 104 then
				yyvsp104 := yyvsp104 - 1
			when 105 then
				yyvsp105 := yyvsp105 - 1
			when 106 then
				yyvsp106 := yyvsp106 - 1
			when 107 then
				yyvsp107 := yyvsp107 - 1
			when 108 then
				yyvsp108 := yyvsp108 - 1
			when 109 then
				yyvsp109 := yyvsp109 - 1
			when 110 then
				yyvsp110 := yyvsp110 - 1
			when 111 then
				yyvsp111 := yyvsp111 - 1
			when 112 then
				yyvsp112 := yyvsp112 - 1
			when 113 then
				yyvsp113 := yyvsp113 - 1
			when 114 then
				yyvsp114 := yyvsp114 - 1
			when 115 then
				yyvsp115 := yyvsp115 - 1
			when 116 then
				yyvsp116 := yyvsp116 - 1
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown type id: ")
					std.error.put_integer (yy_type_id)
					std.error.put_new_line
				end
				abort
			end
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			if yy_act <= 200 then
				yy_do_action_1_200 (yy_act)
			elseif yy_act <= 400 then
				yy_do_action_201_400 (yy_act)
			elseif yy_act <= 600 then
				yy_do_action_401_600 (yy_act)
			elseif yy_act <= 800 then
				yy_do_action_601_800 (yy_act)
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_action_1_200 (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			inspect yy_act
			when 1 then
					--|#line 223 "et_eiffel_parser.y"
				yy_do_action_1
			when 2 then
					--|#line 224 "et_eiffel_parser.y"
				yy_do_action_2
			when 3 then
					--|#line 232 "et_eiffel_parser.y"
				yy_do_action_3
			when 4 then
					--|#line 241 "et_eiffel_parser.y"
				yy_do_action_4
			when 5 then
					--|#line 242 "et_eiffel_parser.y"
				yy_do_action_5
			when 6 then
					--|#line 245 "et_eiffel_parser.y"
				yy_do_action_6
			when 7 then
					--|#line 251 "et_eiffel_parser.y"
				yy_do_action_7
			when 8 then
					--|#line 257 "et_eiffel_parser.y"
				yy_do_action_8
			when 9 then
					--|#line 263 "et_eiffel_parser.y"
				yy_do_action_9
			when 10 then
					--|#line 269 "et_eiffel_parser.y"
				yy_do_action_10
			when 11 then
					--|#line 275 "et_eiffel_parser.y"
				yy_do_action_11
			when 12 then
					--|#line 283 "et_eiffel_parser.y"
				yy_do_action_12
			when 13 then
					--|#line 288 "et_eiffel_parser.y"
				yy_do_action_13
			when 14 then
					--|#line 303 "et_eiffel_parser.y"
				yy_do_action_14
			when 15 then
					--|#line 308 "et_eiffel_parser.y"
				yy_do_action_15
			when 16 then
					--|#line 310 "et_eiffel_parser.y"
				yy_do_action_16
			when 17 then
					--|#line 310 "et_eiffel_parser.y"
				yy_do_action_17
			when 18 then
					--|#line 323 "et_eiffel_parser.y"
				yy_do_action_18
			when 19 then
					--|#line 325 "et_eiffel_parser.y"
				yy_do_action_19
			when 20 then
					--|#line 329 "et_eiffel_parser.y"
				yy_do_action_20
			when 21 then
					--|#line 340 "et_eiffel_parser.y"
				yy_do_action_21
			when 22 then
					--|#line 352 "et_eiffel_parser.y"
				yy_do_action_22
			when 23 then
					--|#line 352 "et_eiffel_parser.y"
				yy_do_action_23
			when 24 then
					--|#line 361 "et_eiffel_parser.y"
				yy_do_action_24
			when 25 then
					--|#line 361 "et_eiffel_parser.y"
				yy_do_action_25
			when 26 then
					--|#line 372 "et_eiffel_parser.y"
				yy_do_action_26
			when 27 then
					--|#line 379 "et_eiffel_parser.y"
				yy_do_action_27
			when 28 then
					--|#line 383 "et_eiffel_parser.y"
				yy_do_action_28
			when 29 then
					--|#line 393 "et_eiffel_parser.y"
				yy_do_action_29
			when 30 then
					--|#line 395 "et_eiffel_parser.y"
				yy_do_action_30
			when 31 then
					--|#line 400 "et_eiffel_parser.y"
				yy_do_action_31
			when 32 then
					--|#line 411 "et_eiffel_parser.y"
				yy_do_action_32
			when 33 then
					--|#line 420 "et_eiffel_parser.y"
				yy_do_action_33
			when 34 then
					--|#line 422 "et_eiffel_parser.y"
				yy_do_action_34
			when 35 then
					--|#line 424 "et_eiffel_parser.y"
				yy_do_action_35
			when 36 then
					--|#line 426 "et_eiffel_parser.y"
				yy_do_action_36
			when 37 then
					--|#line 428 "et_eiffel_parser.y"
				yy_do_action_37
			when 38 then
					--|#line 430 "et_eiffel_parser.y"
				yy_do_action_38
			when 39 then
					--|#line 432 "et_eiffel_parser.y"
				yy_do_action_39
			when 40 then
					--|#line 434 "et_eiffel_parser.y"
				yy_do_action_40
			when 41 then
					--|#line 436 "et_eiffel_parser.y"
				yy_do_action_41
			when 42 then
					--|#line 440 "et_eiffel_parser.y"
				yy_do_action_42
			when 43 then
					--|#line 451 "et_eiffel_parser.y"
				yy_do_action_43
			when 44 then
					--|#line 461 "et_eiffel_parser.y"
				yy_do_action_44
			when 45 then
					--|#line 472 "et_eiffel_parser.y"
				yy_do_action_45
			when 46 then
					--|#line 483 "et_eiffel_parser.y"
				yy_do_action_46
			when 47 then
					--|#line 496 "et_eiffel_parser.y"
				yy_do_action_47
			when 48 then
					--|#line 498 "et_eiffel_parser.y"
				yy_do_action_48
			when 49 then
					--|#line 502 "et_eiffel_parser.y"
				yy_do_action_49
			when 50 then
					--|#line 504 "et_eiffel_parser.y"
				yy_do_action_50
			when 51 then
					--|#line 510 "et_eiffel_parser.y"
				yy_do_action_51
			when 52 then
					--|#line 514 "et_eiffel_parser.y"
				yy_do_action_52
			when 53 then
					--|#line 520 "et_eiffel_parser.y"
				yy_do_action_53
			when 54 then
					--|#line 520 "et_eiffel_parser.y"
				yy_do_action_54
			when 55 then
					--|#line 534 "et_eiffel_parser.y"
				yy_do_action_55
			when 56 then
					--|#line 545 "et_eiffel_parser.y"
				yy_do_action_56
			when 57 then
					--|#line 554 "et_eiffel_parser.y"
				yy_do_action_57
			when 58 then
					--|#line 563 "et_eiffel_parser.y"
				yy_do_action_58
			when 59 then
					--|#line 570 "et_eiffel_parser.y"
				yy_do_action_59
			when 60 then
					--|#line 577 "et_eiffel_parser.y"
				yy_do_action_60
			when 61 then
					--|#line 584 "et_eiffel_parser.y"
				yy_do_action_61
			when 62 then
					--|#line 591 "et_eiffel_parser.y"
				yy_do_action_62
			when 63 then
					--|#line 598 "et_eiffel_parser.y"
				yy_do_action_63
			when 64 then
					--|#line 605 "et_eiffel_parser.y"
				yy_do_action_64
			when 65 then
					--|#line 612 "et_eiffel_parser.y"
				yy_do_action_65
			when 66 then
					--|#line 619 "et_eiffel_parser.y"
				yy_do_action_66
			when 67 then
					--|#line 628 "et_eiffel_parser.y"
				yy_do_action_67
			when 68 then
					--|#line 630 "et_eiffel_parser.y"
				yy_do_action_68
			when 69 then
					--|#line 630 "et_eiffel_parser.y"
				yy_do_action_69
			when 70 then
					--|#line 643 "et_eiffel_parser.y"
				yy_do_action_70
			when 71 then
					--|#line 654 "et_eiffel_parser.y"
				yy_do_action_71
			when 72 then
					--|#line 662 "et_eiffel_parser.y"
				yy_do_action_72
			when 73 then
					--|#line 671 "et_eiffel_parser.y"
				yy_do_action_73
			when 74 then
					--|#line 673 "et_eiffel_parser.y"
				yy_do_action_74
			when 75 then
					--|#line 675 "et_eiffel_parser.y"
				yy_do_action_75
			when 76 then
					--|#line 677 "et_eiffel_parser.y"
				yy_do_action_76
			when 77 then
					--|#line 679 "et_eiffel_parser.y"
				yy_do_action_77
			when 78 then
					--|#line 681 "et_eiffel_parser.y"
				yy_do_action_78
			when 79 then
					--|#line 683 "et_eiffel_parser.y"
				yy_do_action_79
			when 80 then
					--|#line 685 "et_eiffel_parser.y"
				yy_do_action_80
			when 81 then
					--|#line 689 "et_eiffel_parser.y"
				yy_do_action_81
			when 82 then
					--|#line 691 "et_eiffel_parser.y"
				yy_do_action_82
			when 83 then
					--|#line 693 "et_eiffel_parser.y"
				yy_do_action_83
			when 84 then
					--|#line 695 "et_eiffel_parser.y"
				yy_do_action_84
			when 85 then
					--|#line 697 "et_eiffel_parser.y"
				yy_do_action_85
			when 86 then
					--|#line 699 "et_eiffel_parser.y"
				yy_do_action_86
			when 87 then
					--|#line 701 "et_eiffel_parser.y"
				yy_do_action_87
			when 88 then
					--|#line 703 "et_eiffel_parser.y"
				yy_do_action_88
			when 89 then
					--|#line 707 "et_eiffel_parser.y"
				yy_do_action_89
			when 90 then
					--|#line 709 "et_eiffel_parser.y"
				yy_do_action_90
			when 91 then
					--|#line 713 "et_eiffel_parser.y"
				yy_do_action_91
			when 92 then
					--|#line 716 "et_eiffel_parser.y"
				yy_do_action_92
			when 93 then
					--|#line 724 "et_eiffel_parser.y"
				yy_do_action_93
			when 94 then
					--|#line 735 "et_eiffel_parser.y"
				yy_do_action_94
			when 95 then
					--|#line 740 "et_eiffel_parser.y"
				yy_do_action_95
			when 96 then
					--|#line 745 "et_eiffel_parser.y"
				yy_do_action_96
			when 97 then
					--|#line 752 "et_eiffel_parser.y"
				yy_do_action_97
			when 98 then
					--|#line 761 "et_eiffel_parser.y"
				yy_do_action_98
			when 99 then
					--|#line 763 "et_eiffel_parser.y"
				yy_do_action_99
			when 100 then
					--|#line 767 "et_eiffel_parser.y"
				yy_do_action_100
			when 101 then
					--|#line 770 "et_eiffel_parser.y"
				yy_do_action_101
			when 102 then
					--|#line 776 "et_eiffel_parser.y"
				yy_do_action_102
			when 103 then
					--|#line 784 "et_eiffel_parser.y"
				yy_do_action_103
			when 104 then
					--|#line 789 "et_eiffel_parser.y"
				yy_do_action_104
			when 105 then
					--|#line 794 "et_eiffel_parser.y"
				yy_do_action_105
			when 106 then
					--|#line 799 "et_eiffel_parser.y"
				yy_do_action_106
			when 107 then
					--|#line 810 "et_eiffel_parser.y"
				yy_do_action_107
			when 108 then
					--|#line 821 "et_eiffel_parser.y"
				yy_do_action_108
			when 109 then
					--|#line 834 "et_eiffel_parser.y"
				yy_do_action_109
			when 110 then
					--|#line 843 "et_eiffel_parser.y"
				yy_do_action_110
			when 111 then
					--|#line 854 "et_eiffel_parser.y"
				yy_do_action_111
			when 112 then
					--|#line 856 "et_eiffel_parser.y"
				yy_do_action_112
			when 113 then
					--|#line 862 "et_eiffel_parser.y"
				yy_do_action_113
			when 114 then
					--|#line 864 "et_eiffel_parser.y"
				yy_do_action_114
			when 115 then
					--|#line 866 "et_eiffel_parser.y"
				yy_do_action_115
			when 116 then
					--|#line 873 "et_eiffel_parser.y"
				yy_do_action_116
			when 117 then
					--|#line 881 "et_eiffel_parser.y"
				yy_do_action_117
			when 118 then
					--|#line 888 "et_eiffel_parser.y"
				yy_do_action_118
			when 119 then
					--|#line 895 "et_eiffel_parser.y"
				yy_do_action_119
			when 120 then
					--|#line 903 "et_eiffel_parser.y"
				yy_do_action_120
			when 121 then
					--|#line 910 "et_eiffel_parser.y"
				yy_do_action_121
			when 122 then
					--|#line 917 "et_eiffel_parser.y"
				yy_do_action_122
			when 123 then
					--|#line 924 "et_eiffel_parser.y"
				yy_do_action_123
			when 124 then
					--|#line 933 "et_eiffel_parser.y"
				yy_do_action_124
			when 125 then
					--|#line 942 "et_eiffel_parser.y"
				yy_do_action_125
			when 126 then
					--|#line 949 "et_eiffel_parser.y"
				yy_do_action_126
			when 127 then
					--|#line 956 "et_eiffel_parser.y"
				yy_do_action_127
			when 128 then
					--|#line 963 "et_eiffel_parser.y"
				yy_do_action_128
			when 129 then
					--|#line 970 "et_eiffel_parser.y"
				yy_do_action_129
			when 130 then
					--|#line 979 "et_eiffel_parser.y"
				yy_do_action_130
			when 131 then
					--|#line 986 "et_eiffel_parser.y"
				yy_do_action_131
			when 132 then
					--|#line 993 "et_eiffel_parser.y"
				yy_do_action_132
			when 133 then
					--|#line 1000 "et_eiffel_parser.y"
				yy_do_action_133
			when 134 then
					--|#line 1009 "et_eiffel_parser.y"
				yy_do_action_134
			when 135 then
					--|#line 1016 "et_eiffel_parser.y"
				yy_do_action_135
			when 136 then
					--|#line 1027 "et_eiffel_parser.y"
				yy_do_action_136
			when 137 then
					--|#line 1029 "et_eiffel_parser.y"
				yy_do_action_137
			when 138 then
					--|#line 1029 "et_eiffel_parser.y"
				yy_do_action_138
			when 139 then
					--|#line 1042 "et_eiffel_parser.y"
				yy_do_action_139
			when 140 then
					--|#line 1049 "et_eiffel_parser.y"
				yy_do_action_140
			when 141 then
					--|#line 1057 "et_eiffel_parser.y"
				yy_do_action_141
			when 142 then
					--|#line 1066 "et_eiffel_parser.y"
				yy_do_action_142
			when 143 then
					--|#line 1075 "et_eiffel_parser.y"
				yy_do_action_143
			when 144 then
					--|#line 1086 "et_eiffel_parser.y"
				yy_do_action_144
			when 145 then
					--|#line 1088 "et_eiffel_parser.y"
				yy_do_action_145
			when 146 then
					--|#line 1088 "et_eiffel_parser.y"
				yy_do_action_146
			when 147 then
					--|#line 1101 "et_eiffel_parser.y"
				yy_do_action_147
			when 148 then
					--|#line 1103 "et_eiffel_parser.y"
				yy_do_action_148
			when 149 then
					--|#line 1107 "et_eiffel_parser.y"
				yy_do_action_149
			when 150 then
					--|#line 1118 "et_eiffel_parser.y"
				yy_do_action_150
			when 151 then
					--|#line 1118 "et_eiffel_parser.y"
				yy_do_action_151
			when 152 then
					--|#line 1133 "et_eiffel_parser.y"
				yy_do_action_152
			when 153 then
					--|#line 1137 "et_eiffel_parser.y"
				yy_do_action_153
			when 154 then
					--|#line 1142 "et_eiffel_parser.y"
				yy_do_action_154
			when 155 then
					--|#line 1142 "et_eiffel_parser.y"
				yy_do_action_155
			when 156 then
					--|#line 1152 "et_eiffel_parser.y"
				yy_do_action_156
			when 157 then
					--|#line 1156 "et_eiffel_parser.y"
				yy_do_action_157
			when 158 then
					--|#line 1167 "et_eiffel_parser.y"
				yy_do_action_158
			when 159 then
					--|#line 1175 "et_eiffel_parser.y"
				yy_do_action_159
			when 160 then
					--|#line 1186 "et_eiffel_parser.y"
				yy_do_action_160
			when 161 then
					--|#line 1186 "et_eiffel_parser.y"
				yy_do_action_161
			when 162 then
					--|#line 1197 "et_eiffel_parser.y"
				yy_do_action_162
			when 163 then
					--|#line 1201 "et_eiffel_parser.y"
				yy_do_action_163
			when 164 then
					--|#line 1208 "et_eiffel_parser.y"
				yy_do_action_164
			when 165 then
					--|#line 1216 "et_eiffel_parser.y"
				yy_do_action_165
			when 166 then
					--|#line 1223 "et_eiffel_parser.y"
				yy_do_action_166
			when 167 then
					--|#line 1233 "et_eiffel_parser.y"
				yy_do_action_167
			when 168 then
					--|#line 1242 "et_eiffel_parser.y"
				yy_do_action_168
			when 169 then
					--|#line 1253 "et_eiffel_parser.y"
				yy_do_action_169
			when 170 then
					--|#line 1255 "et_eiffel_parser.y"
				yy_do_action_170
			when 171 then
					--|#line 1255 "et_eiffel_parser.y"
				yy_do_action_171
			when 172 then
					--|#line 1268 "et_eiffel_parser.y"
				yy_do_action_172
			when 173 then
					--|#line 1270 "et_eiffel_parser.y"
				yy_do_action_173
			when 174 then
					--|#line 1274 "et_eiffel_parser.y"
				yy_do_action_174
			when 175 then
					--|#line 1276 "et_eiffel_parser.y"
				yy_do_action_175
			when 176 then
					--|#line 1276 "et_eiffel_parser.y"
				yy_do_action_176
			when 177 then
					--|#line 1289 "et_eiffel_parser.y"
				yy_do_action_177
			when 178 then
					--|#line 1291 "et_eiffel_parser.y"
				yy_do_action_178
			when 179 then
					--|#line 1295 "et_eiffel_parser.y"
				yy_do_action_179
			when 180 then
					--|#line 1297 "et_eiffel_parser.y"
				yy_do_action_180
			when 181 then
					--|#line 1297 "et_eiffel_parser.y"
				yy_do_action_181
			when 182 then
					--|#line 1310 "et_eiffel_parser.y"
				yy_do_action_182
			when 183 then
					--|#line 1312 "et_eiffel_parser.y"
				yy_do_action_183
			when 184 then
					--|#line 1316 "et_eiffel_parser.y"
				yy_do_action_184
			when 185 then
					--|#line 1327 "et_eiffel_parser.y"
				yy_do_action_185
			when 186 then
					--|#line 1335 "et_eiffel_parser.y"
				yy_do_action_186
			when 187 then
					--|#line 1344 "et_eiffel_parser.y"
				yy_do_action_187
			when 188 then
					--|#line 1355 "et_eiffel_parser.y"
				yy_do_action_188
			when 189 then
					--|#line 1357 "et_eiffel_parser.y"
				yy_do_action_189
			when 190 then
					--|#line 1364 "et_eiffel_parser.y"
				yy_do_action_190
			when 191 then
					--|#line 1371 "et_eiffel_parser.y"
				yy_do_action_191
			when 192 then
					--|#line 1382 "et_eiffel_parser.y"
				yy_do_action_192
			when 193 then
					--|#line 1382 "et_eiffel_parser.y"
				yy_do_action_193
			when 194 then
					--|#line 1397 "et_eiffel_parser.y"
				yy_do_action_194
			when 195 then
					--|#line 1399 "et_eiffel_parser.y"
				yy_do_action_195
			when 196 then
					--|#line 1401 "et_eiffel_parser.y"
				yy_do_action_196
			when 197 then
					--|#line 1401 "et_eiffel_parser.y"
				yy_do_action_197
			when 198 then
					--|#line 1413 "et_eiffel_parser.y"
				yy_do_action_198
			when 199 then
					--|#line 1413 "et_eiffel_parser.y"
				yy_do_action_199
			when 200 then
					--|#line 1425 "et_eiffel_parser.y"
				yy_do_action_200
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_action_201_400 (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			inspect yy_act
			when 201 then
					--|#line 1427 "et_eiffel_parser.y"
				yy_do_action_201
			when 202 then
					--|#line 1429 "et_eiffel_parser.y"
				yy_do_action_202
			when 203 then
					--|#line 1429 "et_eiffel_parser.y"
				yy_do_action_203
			when 204 then
					--|#line 1441 "et_eiffel_parser.y"
				yy_do_action_204
			when 205 then
					--|#line 1441 "et_eiffel_parser.y"
				yy_do_action_205
			when 206 then
					--|#line 1455 "et_eiffel_parser.y"
				yy_do_action_206
			when 207 then
					--|#line 1466 "et_eiffel_parser.y"
				yy_do_action_207
			when 208 then
					--|#line 1474 "et_eiffel_parser.y"
				yy_do_action_208
			when 209 then
					--|#line 1483 "et_eiffel_parser.y"
				yy_do_action_209
			when 210 then
					--|#line 1494 "et_eiffel_parser.y"
				yy_do_action_210
			when 211 then
					--|#line 1496 "et_eiffel_parser.y"
				yy_do_action_211
			when 212 then
					--|#line 1500 "et_eiffel_parser.y"
				yy_do_action_212
			when 213 then
					--|#line 1500 "et_eiffel_parser.y"
				yy_do_action_213
			when 214 then
					--|#line 1513 "et_eiffel_parser.y"
				yy_do_action_214
			when 215 then
					--|#line 1520 "et_eiffel_parser.y"
				yy_do_action_215
			when 216 then
					--|#line 1527 "et_eiffel_parser.y"
				yy_do_action_216
			when 217 then
					--|#line 1536 "et_eiffel_parser.y"
				yy_do_action_217
			when 218 then
					--|#line 1545 "et_eiffel_parser.y"
				yy_do_action_218
			when 219 then
					--|#line 1549 "et_eiffel_parser.y"
				yy_do_action_219
			when 220 then
					--|#line 1555 "et_eiffel_parser.y"
				yy_do_action_220
			when 221 then
					--|#line 1557 "et_eiffel_parser.y"
				yy_do_action_221
			when 222 then
					--|#line 1557 "et_eiffel_parser.y"
				yy_do_action_222
			when 223 then
					--|#line 1570 "et_eiffel_parser.y"
				yy_do_action_223
			when 224 then
					--|#line 1581 "et_eiffel_parser.y"
				yy_do_action_224
			when 225 then
					--|#line 1590 "et_eiffel_parser.y"
				yy_do_action_225
			when 226 then
					--|#line 1601 "et_eiffel_parser.y"
				yy_do_action_226
			when 227 then
					--|#line 1606 "et_eiffel_parser.y"
				yy_do_action_227
			when 228 then
					--|#line 1610 "et_eiffel_parser.y"
				yy_do_action_228
			when 229 then
					--|#line 1618 "et_eiffel_parser.y"
				yy_do_action_229
			when 230 then
					--|#line 1625 "et_eiffel_parser.y"
				yy_do_action_230
			when 231 then
					--|#line 1634 "et_eiffel_parser.y"
				yy_do_action_231
			when 232 then
					--|#line 1641 "et_eiffel_parser.y"
				yy_do_action_232
			when 233 then
					--|#line 1650 "et_eiffel_parser.y"
				yy_do_action_233
			when 234 then
					--|#line 1655 "et_eiffel_parser.y"
				yy_do_action_234
			when 235 then
					--|#line 1662 "et_eiffel_parser.y"
				yy_do_action_235
			when 236 then
					--|#line 1663 "et_eiffel_parser.y"
				yy_do_action_236
			when 237 then
					--|#line 1664 "et_eiffel_parser.y"
				yy_do_action_237
			when 238 then
					--|#line 1665 "et_eiffel_parser.y"
				yy_do_action_238
			when 239 then
					--|#line 1670 "et_eiffel_parser.y"
				yy_do_action_239
			when 240 then
					--|#line 1675 "et_eiffel_parser.y"
				yy_do_action_240
			when 241 then
					--|#line 1681 "et_eiffel_parser.y"
				yy_do_action_241
			when 242 then
					--|#line 1686 "et_eiffel_parser.y"
				yy_do_action_242
			when 243 then
					--|#line 1692 "et_eiffel_parser.y"
				yy_do_action_243
			when 244 then
					--|#line 1698 "et_eiffel_parser.y"
				yy_do_action_244
			when 245 then
					--|#line 1707 "et_eiffel_parser.y"
				yy_do_action_245
			when 246 then
					--|#line 1712 "et_eiffel_parser.y"
				yy_do_action_246
			when 247 then
					--|#line 1718 "et_eiffel_parser.y"
				yy_do_action_247
			when 248 then
					--|#line 1723 "et_eiffel_parser.y"
				yy_do_action_248
			when 249 then
					--|#line 1729 "et_eiffel_parser.y"
				yy_do_action_249
			when 250 then
					--|#line 1735 "et_eiffel_parser.y"
				yy_do_action_250
			when 251 then
					--|#line 1744 "et_eiffel_parser.y"
				yy_do_action_251
			when 252 then
					--|#line 1746 "et_eiffel_parser.y"
				yy_do_action_252
			when 253 then
					--|#line 1748 "et_eiffel_parser.y"
				yy_do_action_253
			when 254 then
					--|#line 1750 "et_eiffel_parser.y"
				yy_do_action_254
			when 255 then
					--|#line 1758 "et_eiffel_parser.y"
				yy_do_action_255
			when 256 then
					--|#line 1760 "et_eiffel_parser.y"
				yy_do_action_256
			when 257 then
					--|#line 1768 "et_eiffel_parser.y"
				yy_do_action_257
			when 258 then
					--|#line 1771 "et_eiffel_parser.y"
				yy_do_action_258
			when 259 then
					--|#line 1780 "et_eiffel_parser.y"
				yy_do_action_259
			when 260 then
					--|#line 1784 "et_eiffel_parser.y"
				yy_do_action_260
			when 261 then
					--|#line 1794 "et_eiffel_parser.y"
				yy_do_action_261
			when 262 then
					--|#line 1797 "et_eiffel_parser.y"
				yy_do_action_262
			when 263 then
					--|#line 1806 "et_eiffel_parser.y"
				yy_do_action_263
			when 264 then
					--|#line 1810 "et_eiffel_parser.y"
				yy_do_action_264
			when 265 then
					--|#line 1820 "et_eiffel_parser.y"
				yy_do_action_265
			when 266 then
					--|#line 1822 "et_eiffel_parser.y"
				yy_do_action_266
			when 267 then
					--|#line 1830 "et_eiffel_parser.y"
				yy_do_action_267
			when 268 then
					--|#line 1833 "et_eiffel_parser.y"
				yy_do_action_268
			when 269 then
					--|#line 1842 "et_eiffel_parser.y"
				yy_do_action_269
			when 270 then
					--|#line 1845 "et_eiffel_parser.y"
				yy_do_action_270
			when 271 then
					--|#line 1854 "et_eiffel_parser.y"
				yy_do_action_271
			when 272 then
					--|#line 1858 "et_eiffel_parser.y"
				yy_do_action_272
			when 273 then
					--|#line 1870 "et_eiffel_parser.y"
				yy_do_action_273
			when 274 then
					--|#line 1873 "et_eiffel_parser.y"
				yy_do_action_274
			when 275 then
					--|#line 1877 "et_eiffel_parser.y"
				yy_do_action_275
			when 276 then
					--|#line 1880 "et_eiffel_parser.y"
				yy_do_action_276
			when 277 then
					--|#line 1884 "et_eiffel_parser.y"
				yy_do_action_277
			when 278 then
					--|#line 1886 "et_eiffel_parser.y"
				yy_do_action_278
			when 279 then
					--|#line 1889 "et_eiffel_parser.y"
				yy_do_action_279
			when 280 then
					--|#line 1892 "et_eiffel_parser.y"
				yy_do_action_280
			when 281 then
					--|#line 1898 "et_eiffel_parser.y"
				yy_do_action_281
			when 282 then
					--|#line 1906 "et_eiffel_parser.y"
				yy_do_action_282
			when 283 then
					--|#line 1910 "et_eiffel_parser.y"
				yy_do_action_283
			when 284 then
					--|#line 1912 "et_eiffel_parser.y"
				yy_do_action_284
			when 285 then
					--|#line 1916 "et_eiffel_parser.y"
				yy_do_action_285
			when 286 then
					--|#line 1918 "et_eiffel_parser.y"
				yy_do_action_286
			when 287 then
					--|#line 1922 "et_eiffel_parser.y"
				yy_do_action_287
			when 288 then
					--|#line 1924 "et_eiffel_parser.y"
				yy_do_action_288
			when 289 then
					--|#line 1930 "et_eiffel_parser.y"
				yy_do_action_289
			when 290 then
					--|#line 1932 "et_eiffel_parser.y"
				yy_do_action_290
			when 291 then
					--|#line 1934 "et_eiffel_parser.y"
				yy_do_action_291
			when 292 then
					--|#line 1936 "et_eiffel_parser.y"
				yy_do_action_292
			when 293 then
					--|#line 1938 "et_eiffel_parser.y"
				yy_do_action_293
			when 294 then
					--|#line 1940 "et_eiffel_parser.y"
				yy_do_action_294
			when 295 then
					--|#line 1942 "et_eiffel_parser.y"
				yy_do_action_295
			when 296 then
					--|#line 1944 "et_eiffel_parser.y"
				yy_do_action_296
			when 297 then
					--|#line 1946 "et_eiffel_parser.y"
				yy_do_action_297
			when 298 then
					--|#line 1948 "et_eiffel_parser.y"
				yy_do_action_298
			when 299 then
					--|#line 1950 "et_eiffel_parser.y"
				yy_do_action_299
			when 300 then
					--|#line 1952 "et_eiffel_parser.y"
				yy_do_action_300
			when 301 then
					--|#line 1954 "et_eiffel_parser.y"
				yy_do_action_301
			when 302 then
					--|#line 1956 "et_eiffel_parser.y"
				yy_do_action_302
			when 303 then
					--|#line 1958 "et_eiffel_parser.y"
				yy_do_action_303
			when 304 then
					--|#line 1960 "et_eiffel_parser.y"
				yy_do_action_304
			when 305 then
					--|#line 1962 "et_eiffel_parser.y"
				yy_do_action_305
			when 306 then
					--|#line 1964 "et_eiffel_parser.y"
				yy_do_action_306
			when 307 then
					--|#line 1966 "et_eiffel_parser.y"
				yy_do_action_307
			when 308 then
					--|#line 1968 "et_eiffel_parser.y"
				yy_do_action_308
			when 309 then
					--|#line 1970 "et_eiffel_parser.y"
				yy_do_action_309
			when 310 then
					--|#line 1972 "et_eiffel_parser.y"
				yy_do_action_310
			when 311 then
					--|#line 1974 "et_eiffel_parser.y"
				yy_do_action_311
			when 312 then
					--|#line 1977 "et_eiffel_parser.y"
				yy_do_action_312
			when 313 then
					--|#line 1979 "et_eiffel_parser.y"
				yy_do_action_313
			when 314 then
					--|#line 1981 "et_eiffel_parser.y"
				yy_do_action_314
			when 315 then
					--|#line 1983 "et_eiffel_parser.y"
				yy_do_action_315
			when 316 then
					--|#line 1985 "et_eiffel_parser.y"
				yy_do_action_316
			when 317 then
					--|#line 1987 "et_eiffel_parser.y"
				yy_do_action_317
			when 318 then
					--|#line 1989 "et_eiffel_parser.y"
				yy_do_action_318
			when 319 then
					--|#line 1991 "et_eiffel_parser.y"
				yy_do_action_319
			when 320 then
					--|#line 1993 "et_eiffel_parser.y"
				yy_do_action_320
			when 321 then
					--|#line 1995 "et_eiffel_parser.y"
				yy_do_action_321
			when 322 then
					--|#line 1997 "et_eiffel_parser.y"
				yy_do_action_322
			when 323 then
					--|#line 1999 "et_eiffel_parser.y"
				yy_do_action_323
			when 324 then
					--|#line 2001 "et_eiffel_parser.y"
				yy_do_action_324
			when 325 then
					--|#line 2003 "et_eiffel_parser.y"
				yy_do_action_325
			when 326 then
					--|#line 2005 "et_eiffel_parser.y"
				yy_do_action_326
			when 327 then
					--|#line 2007 "et_eiffel_parser.y"
				yy_do_action_327
			when 328 then
					--|#line 2009 "et_eiffel_parser.y"
				yy_do_action_328
			when 329 then
					--|#line 2011 "et_eiffel_parser.y"
				yy_do_action_329
			when 330 then
					--|#line 2015 "et_eiffel_parser.y"
				yy_do_action_330
			when 331 then
					--|#line 2017 "et_eiffel_parser.y"
				yy_do_action_331
			when 332 then
					--|#line 2021 "et_eiffel_parser.y"
				yy_do_action_332
			when 333 then
					--|#line 2023 "et_eiffel_parser.y"
				yy_do_action_333
			when 334 then
					--|#line 2025 "et_eiffel_parser.y"
				yy_do_action_334
			when 335 then
					--|#line 2027 "et_eiffel_parser.y"
				yy_do_action_335
			when 336 then
					--|#line 2029 "et_eiffel_parser.y"
				yy_do_action_336
			when 337 then
					--|#line 2031 "et_eiffel_parser.y"
				yy_do_action_337
			when 338 then
					--|#line 2033 "et_eiffel_parser.y"
				yy_do_action_338
			when 339 then
					--|#line 2035 "et_eiffel_parser.y"
				yy_do_action_339
			when 340 then
					--|#line 2037 "et_eiffel_parser.y"
				yy_do_action_340
			when 341 then
					--|#line 2039 "et_eiffel_parser.y"
				yy_do_action_341
			when 342 then
					--|#line 2041 "et_eiffel_parser.y"
				yy_do_action_342
			when 343 then
					--|#line 2043 "et_eiffel_parser.y"
				yy_do_action_343
			when 344 then
					--|#line 2045 "et_eiffel_parser.y"
				yy_do_action_344
			when 345 then
					--|#line 2047 "et_eiffel_parser.y"
				yy_do_action_345
			when 346 then
					--|#line 2049 "et_eiffel_parser.y"
				yy_do_action_346
			when 347 then
					--|#line 2051 "et_eiffel_parser.y"
				yy_do_action_347
			when 348 then
					--|#line 2053 "et_eiffel_parser.y"
				yy_do_action_348
			when 349 then
					--|#line 2055 "et_eiffel_parser.y"
				yy_do_action_349
			when 350 then
					--|#line 2057 "et_eiffel_parser.y"
				yy_do_action_350
			when 351 then
					--|#line 2059 "et_eiffel_parser.y"
				yy_do_action_351
			when 352 then
					--|#line 2061 "et_eiffel_parser.y"
				yy_do_action_352
			when 353 then
					--|#line 2064 "et_eiffel_parser.y"
				yy_do_action_353
			when 354 then
					--|#line 2070 "et_eiffel_parser.y"
				yy_do_action_354
			when 355 then
					--|#line 2072 "et_eiffel_parser.y"
				yy_do_action_355
			when 356 then
					--|#line 2080 "et_eiffel_parser.y"
				yy_do_action_356
			when 357 then
					--|#line 2091 "et_eiffel_parser.y"
				yy_do_action_357
			when 358 then
					--|#line 2098 "et_eiffel_parser.y"
				yy_do_action_358
			when 359 then
					--|#line 2105 "et_eiffel_parser.y"
				yy_do_action_359
			when 360 then
					--|#line 2115 "et_eiffel_parser.y"
				yy_do_action_360
			when 361 then
					--|#line 2126 "et_eiffel_parser.y"
				yy_do_action_361
			when 362 then
					--|#line 2133 "et_eiffel_parser.y"
				yy_do_action_362
			when 363 then
					--|#line 2142 "et_eiffel_parser.y"
				yy_do_action_363
			when 364 then
					--|#line 2151 "et_eiffel_parser.y"
				yy_do_action_364
			when 365 then
					--|#line 2160 "et_eiffel_parser.y"
				yy_do_action_365
			when 366 then
					--|#line 2169 "et_eiffel_parser.y"
				yy_do_action_366
			when 367 then
					--|#line 2180 "et_eiffel_parser.y"
				yy_do_action_367
			when 368 then
					--|#line 2185 "et_eiffel_parser.y"
				yy_do_action_368
			when 369 then
					--|#line 2187 "et_eiffel_parser.y"
				yy_do_action_369
			when 370 then
					--|#line 2187 "et_eiffel_parser.y"
				yy_do_action_370
			when 371 then
					--|#line 2200 "et_eiffel_parser.y"
				yy_do_action_371
			when 372 then
					--|#line 2207 "et_eiffel_parser.y"
				yy_do_action_372
			when 373 then
					--|#line 2214 "et_eiffel_parser.y"
				yy_do_action_373
			when 374 then
					--|#line 2224 "et_eiffel_parser.y"
				yy_do_action_374
			when 375 then
					--|#line 2235 "et_eiffel_parser.y"
				yy_do_action_375
			when 376 then
					--|#line 2242 "et_eiffel_parser.y"
				yy_do_action_376
			when 377 then
					--|#line 2251 "et_eiffel_parser.y"
				yy_do_action_377
			when 378 then
					--|#line 2260 "et_eiffel_parser.y"
				yy_do_action_378
			when 379 then
					--|#line 2269 "et_eiffel_parser.y"
				yy_do_action_379
			when 380 then
					--|#line 2278 "et_eiffel_parser.y"
				yy_do_action_380
			when 381 then
					--|#line 2289 "et_eiffel_parser.y"
				yy_do_action_381
			when 382 then
					--|#line 2291 "et_eiffel_parser.y"
				yy_do_action_382
			when 383 then
					--|#line 2293 "et_eiffel_parser.y"
				yy_do_action_383
			when 384 then
					--|#line 2295 "et_eiffel_parser.y"
				yy_do_action_384
			when 385 then
					--|#line 2297 "et_eiffel_parser.y"
				yy_do_action_385
			when 386 then
					--|#line 2299 "et_eiffel_parser.y"
				yy_do_action_386
			when 387 then
					--|#line 2301 "et_eiffel_parser.y"
				yy_do_action_387
			when 388 then
					--|#line 2303 "et_eiffel_parser.y"
				yy_do_action_388
			when 389 then
					--|#line 2307 "et_eiffel_parser.y"
				yy_do_action_389
			when 390 then
					--|#line 2309 "et_eiffel_parser.y"
				yy_do_action_390
			when 391 then
					--|#line 2311 "et_eiffel_parser.y"
				yy_do_action_391
			when 392 then
					--|#line 2313 "et_eiffel_parser.y"
				yy_do_action_392
			when 393 then
					--|#line 2315 "et_eiffel_parser.y"
				yy_do_action_393
			when 394 then
					--|#line 2319 "et_eiffel_parser.y"
				yy_do_action_394
			when 395 then
					--|#line 2321 "et_eiffel_parser.y"
				yy_do_action_395
			when 396 then
					--|#line 2323 "et_eiffel_parser.y"
				yy_do_action_396
			when 397 then
					--|#line 2325 "et_eiffel_parser.y"
				yy_do_action_397
			when 398 then
					--|#line 2327 "et_eiffel_parser.y"
				yy_do_action_398
			when 399 then
					--|#line 2331 "et_eiffel_parser.y"
				yy_do_action_399
			when 400 then
					--|#line 2333 "et_eiffel_parser.y"
				yy_do_action_400
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_action_401_600 (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			inspect yy_act
			when 401 then
					--|#line 2337 "et_eiffel_parser.y"
				yy_do_action_401
			when 402 then
					--|#line 2339 "et_eiffel_parser.y"
				yy_do_action_402
			when 403 then
					--|#line 2343 "et_eiffel_parser.y"
				yy_do_action_403
			when 404 then
					--|#line 2345 "et_eiffel_parser.y"
				yy_do_action_404
			when 405 then
					--|#line 2349 "et_eiffel_parser.y"
				yy_do_action_405
			when 406 then
					--|#line 2351 "et_eiffel_parser.y"
				yy_do_action_406
			when 407 then
					--|#line 2355 "et_eiffel_parser.y"
				yy_do_action_407
			when 408 then
					--|#line 2357 "et_eiffel_parser.y"
				yy_do_action_408
			when 409 then
					--|#line 2359 "et_eiffel_parser.y"
				yy_do_action_409
			when 410 then
					--|#line 2361 "et_eiffel_parser.y"
				yy_do_action_410
			when 411 then
					--|#line 2367 "et_eiffel_parser.y"
				yy_do_action_411
			when 412 then
					--|#line 2369 "et_eiffel_parser.y"
				yy_do_action_412
			when 413 then
					--|#line 2375 "et_eiffel_parser.y"
				yy_do_action_413
			when 414 then
					--|#line 2377 "et_eiffel_parser.y"
				yy_do_action_414
			when 415 then
					--|#line 2381 "et_eiffel_parser.y"
				yy_do_action_415
			when 416 then
					--|#line 2383 "et_eiffel_parser.y"
				yy_do_action_416
			when 417 then
					--|#line 2385 "et_eiffel_parser.y"
				yy_do_action_417
			when 418 then
					--|#line 2387 "et_eiffel_parser.y"
				yy_do_action_418
			when 419 then
					--|#line 2389 "et_eiffel_parser.y"
				yy_do_action_419
			when 420 then
					--|#line 2391 "et_eiffel_parser.y"
				yy_do_action_420
			when 421 then
					--|#line 2393 "et_eiffel_parser.y"
				yy_do_action_421
			when 422 then
					--|#line 2395 "et_eiffel_parser.y"
				yy_do_action_422
			when 423 then
					--|#line 2399 "et_eiffel_parser.y"
				yy_do_action_423
			when 424 then
					--|#line 2401 "et_eiffel_parser.y"
				yy_do_action_424
			when 425 then
					--|#line 2403 "et_eiffel_parser.y"
				yy_do_action_425
			when 426 then
					--|#line 2405 "et_eiffel_parser.y"
				yy_do_action_426
			when 427 then
					--|#line 2407 "et_eiffel_parser.y"
				yy_do_action_427
			when 428 then
					--|#line 2409 "et_eiffel_parser.y"
				yy_do_action_428
			when 429 then
					--|#line 2411 "et_eiffel_parser.y"
				yy_do_action_429
			when 430 then
					--|#line 2413 "et_eiffel_parser.y"
				yy_do_action_430
			when 431 then
					--|#line 2417 "et_eiffel_parser.y"
				yy_do_action_431
			when 432 then
					--|#line 2421 "et_eiffel_parser.y"
				yy_do_action_432
			when 433 then
					--|#line 2423 "et_eiffel_parser.y"
				yy_do_action_433
			when 434 then
					--|#line 2427 "et_eiffel_parser.y"
				yy_do_action_434
			when 435 then
					--|#line 2430 "et_eiffel_parser.y"
				yy_do_action_435
			when 436 then
					--|#line 2438 "et_eiffel_parser.y"
				yy_do_action_436
			when 437 then
					--|#line 2445 "et_eiffel_parser.y"
				yy_do_action_437
			when 438 then
					--|#line 2456 "et_eiffel_parser.y"
				yy_do_action_438
			when 439 then
					--|#line 2461 "et_eiffel_parser.y"
				yy_do_action_439
			when 440 then
					--|#line 2466 "et_eiffel_parser.y"
				yy_do_action_440
			when 441 then
					--|#line 2473 "et_eiffel_parser.y"
				yy_do_action_441
			when 442 then
					--|#line 2479 "et_eiffel_parser.y"
				yy_do_action_442
			when 443 then
					--|#line 2488 "et_eiffel_parser.y"
				yy_do_action_443
			when 444 then
					--|#line 2490 "et_eiffel_parser.y"
				yy_do_action_444
			when 445 then
					--|#line 2494 "et_eiffel_parser.y"
				yy_do_action_445
			when 446 then
					--|#line 2497 "et_eiffel_parser.y"
				yy_do_action_446
			when 447 then
					--|#line 2503 "et_eiffel_parser.y"
				yy_do_action_447
			when 448 then
					--|#line 2511 "et_eiffel_parser.y"
				yy_do_action_448
			when 449 then
					--|#line 2516 "et_eiffel_parser.y"
				yy_do_action_449
			when 450 then
					--|#line 2521 "et_eiffel_parser.y"
				yy_do_action_450
			when 451 then
					--|#line 2526 "et_eiffel_parser.y"
				yy_do_action_451
			when 452 then
					--|#line 2537 "et_eiffel_parser.y"
				yy_do_action_452
			when 453 then
					--|#line 2548 "et_eiffel_parser.y"
				yy_do_action_453
			when 454 then
					--|#line 2561 "et_eiffel_parser.y"
				yy_do_action_454
			when 455 then
					--|#line 2570 "et_eiffel_parser.y"
				yy_do_action_455
			when 456 then
					--|#line 2579 "et_eiffel_parser.y"
				yy_do_action_456
			when 457 then
					--|#line 2581 "et_eiffel_parser.y"
				yy_do_action_457
			when 458 then
					--|#line 2587 "et_eiffel_parser.y"
				yy_do_action_458
			when 459 then
					--|#line 2589 "et_eiffel_parser.y"
				yy_do_action_459
			when 460 then
					--|#line 2596 "et_eiffel_parser.y"
				yy_do_action_460
			when 461 then
					--|#line 2598 "et_eiffel_parser.y"
				yy_do_action_461
			when 462 then
					--|#line 2605 "et_eiffel_parser.y"
				yy_do_action_462
			when 463 then
					--|#line 2607 "et_eiffel_parser.y"
				yy_do_action_463
			when 464 then
					--|#line 2614 "et_eiffel_parser.y"
				yy_do_action_464
			when 465 then
					--|#line 2616 "et_eiffel_parser.y"
				yy_do_action_465
			when 466 then
					--|#line 2623 "et_eiffel_parser.y"
				yy_do_action_466
			when 467 then
					--|#line 2625 "et_eiffel_parser.y"
				yy_do_action_467
			when 468 then
					--|#line 2632 "et_eiffel_parser.y"
				yy_do_action_468
			when 469 then
					--|#line 2634 "et_eiffel_parser.y"
				yy_do_action_469
			when 470 then
					--|#line 2641 "et_eiffel_parser.y"
				yy_do_action_470
			when 471 then
					--|#line 2643 "et_eiffel_parser.y"
				yy_do_action_471
			when 472 then
					--|#line 2650 "et_eiffel_parser.y"
				yy_do_action_472
			when 473 then
					--|#line 2661 "et_eiffel_parser.y"
				yy_do_action_473
			when 474 then
					--|#line 2661 "et_eiffel_parser.y"
				yy_do_action_474
			when 475 then
					--|#line 2682 "et_eiffel_parser.y"
				yy_do_action_475
			when 476 then
					--|#line 2684 "et_eiffel_parser.y"
				yy_do_action_476
			when 477 then
					--|#line 2686 "et_eiffel_parser.y"
				yy_do_action_477
			when 478 then
					--|#line 2688 "et_eiffel_parser.y"
				yy_do_action_478
			when 479 then
					--|#line 2690 "et_eiffel_parser.y"
				yy_do_action_479
			when 480 then
					--|#line 2692 "et_eiffel_parser.y"
				yy_do_action_480
			when 481 then
					--|#line 2694 "et_eiffel_parser.y"
				yy_do_action_481
			when 482 then
					--|#line 2696 "et_eiffel_parser.y"
				yy_do_action_482
			when 483 then
					--|#line 2698 "et_eiffel_parser.y"
				yy_do_action_483
			when 484 then
					--|#line 2700 "et_eiffel_parser.y"
				yy_do_action_484
			when 485 then
					--|#line 2707 "et_eiffel_parser.y"
				yy_do_action_485
			when 486 then
					--|#line 2709 "et_eiffel_parser.y"
				yy_do_action_486
			when 487 then
					--|#line 2711 "et_eiffel_parser.y"
				yy_do_action_487
			when 488 then
					--|#line 2713 "et_eiffel_parser.y"
				yy_do_action_488
			when 489 then
					--|#line 2715 "et_eiffel_parser.y"
				yy_do_action_489
			when 490 then
					--|#line 2721 "et_eiffel_parser.y"
				yy_do_action_490
			when 491 then
					--|#line 2723 "et_eiffel_parser.y"
				yy_do_action_491
			when 492 then
					--|#line 2725 "et_eiffel_parser.y"
				yy_do_action_492
			when 493 then
					--|#line 2727 "et_eiffel_parser.y"
				yy_do_action_493
			when 494 then
					--|#line 2731 "et_eiffel_parser.y"
				yy_do_action_494
			when 495 then
					--|#line 2733 "et_eiffel_parser.y"
				yy_do_action_495
			when 496 then
					--|#line 2735 "et_eiffel_parser.y"
				yy_do_action_496
			when 497 then
					--|#line 2737 "et_eiffel_parser.y"
				yy_do_action_497
			when 498 then
					--|#line 2741 "et_eiffel_parser.y"
				yy_do_action_498
			when 499 then
					--|#line 2743 "et_eiffel_parser.y"
				yy_do_action_499
			when 500 then
					--|#line 2749 "et_eiffel_parser.y"
				yy_do_action_500
			when 501 then
					--|#line 2751 "et_eiffel_parser.y"
				yy_do_action_501
			when 502 then
					--|#line 2753 "et_eiffel_parser.y"
				yy_do_action_502
			when 503 then
					--|#line 2755 "et_eiffel_parser.y"
				yy_do_action_503
			when 504 then
					--|#line 2759 "et_eiffel_parser.y"
				yy_do_action_504
			when 505 then
					--|#line 2766 "et_eiffel_parser.y"
				yy_do_action_505
			when 506 then
					--|#line 2773 "et_eiffel_parser.y"
				yy_do_action_506
			when 507 then
					--|#line 2782 "et_eiffel_parser.y"
				yy_do_action_507
			when 508 then
					--|#line 2793 "et_eiffel_parser.y"
				yy_do_action_508
			when 509 then
					--|#line 2795 "et_eiffel_parser.y"
				yy_do_action_509
			when 510 then
					--|#line 2799 "et_eiffel_parser.y"
				yy_do_action_510
			when 511 then
					--|#line 2801 "et_eiffel_parser.y"
				yy_do_action_511
			when 512 then
					--|#line 2808 "et_eiffel_parser.y"
				yy_do_action_512
			when 513 then
					--|#line 2815 "et_eiffel_parser.y"
				yy_do_action_513
			when 514 then
					--|#line 2824 "et_eiffel_parser.y"
				yy_do_action_514
			when 515 then
					--|#line 2833 "et_eiffel_parser.y"
				yy_do_action_515
			when 516 then
					--|#line 2835 "et_eiffel_parser.y"
				yy_do_action_516
			when 517 then
					--|#line 2835 "et_eiffel_parser.y"
				yy_do_action_517
			when 518 then
					--|#line 2848 "et_eiffel_parser.y"
				yy_do_action_518
			when 519 then
					--|#line 2859 "et_eiffel_parser.y"
				yy_do_action_519
			when 520 then
					--|#line 2867 "et_eiffel_parser.y"
				yy_do_action_520
			when 521 then
					--|#line 2876 "et_eiffel_parser.y"
				yy_do_action_521
			when 522 then
					--|#line 2885 "et_eiffel_parser.y"
				yy_do_action_522
			when 523 then
					--|#line 2887 "et_eiffel_parser.y"
				yy_do_action_523
			when 524 then
					--|#line 2891 "et_eiffel_parser.y"
				yy_do_action_524
			when 525 then
					--|#line 2893 "et_eiffel_parser.y"
				yy_do_action_525
			when 526 then
					--|#line 2895 "et_eiffel_parser.y"
				yy_do_action_526
			when 527 then
					--|#line 2899 "et_eiffel_parser.y"
				yy_do_action_527
			when 528 then
					--|#line 2901 "et_eiffel_parser.y"
				yy_do_action_528
			when 529 then
					--|#line 2907 "et_eiffel_parser.y"
				yy_do_action_529
			when 530 then
					--|#line 2909 "et_eiffel_parser.y"
				yy_do_action_530
			when 531 then
					--|#line 2916 "et_eiffel_parser.y"
				yy_do_action_531
			when 532 then
					--|#line 2918 "et_eiffel_parser.y"
				yy_do_action_532
			when 533 then
					--|#line 2920 "et_eiffel_parser.y"
				yy_do_action_533
			when 534 then
					--|#line 2920 "et_eiffel_parser.y"
				yy_do_action_534
			when 535 then
					--|#line 2933 "et_eiffel_parser.y"
				yy_do_action_535
			when 536 then
					--|#line 2944 "et_eiffel_parser.y"
				yy_do_action_536
			when 537 then
					--|#line 2953 "et_eiffel_parser.y"
				yy_do_action_537
			when 538 then
					--|#line 2964 "et_eiffel_parser.y"
				yy_do_action_538
			when 539 then
					--|#line 2966 "et_eiffel_parser.y"
				yy_do_action_539
			when 540 then
					--|#line 2968 "et_eiffel_parser.y"
				yy_do_action_540
			when 541 then
					--|#line 2970 "et_eiffel_parser.y"
				yy_do_action_541
			when 542 then
					--|#line 2972 "et_eiffel_parser.y"
				yy_do_action_542
			when 543 then
					--|#line 2974 "et_eiffel_parser.y"
				yy_do_action_543
			when 544 then
					--|#line 2978 "et_eiffel_parser.y"
				yy_do_action_544
			when 545 then
					--|#line 2980 "et_eiffel_parser.y"
				yy_do_action_545
			when 546 then
					--|#line 2984 "et_eiffel_parser.y"
				yy_do_action_546
			when 547 then
					--|#line 2988 "et_eiffel_parser.y"
				yy_do_action_547
			when 548 then
					--|#line 2990 "et_eiffel_parser.y"
				yy_do_action_548
			when 549 then
					--|#line 2994 "et_eiffel_parser.y"
				yy_do_action_549
			when 550 then
					--|#line 2996 "et_eiffel_parser.y"
				yy_do_action_550
			when 551 then
					--|#line 3000 "et_eiffel_parser.y"
				yy_do_action_551
			when 552 then
					--|#line 3002 "et_eiffel_parser.y"
				yy_do_action_552
			when 553 then
					--|#line 3004 "et_eiffel_parser.y"
				yy_do_action_553
			when 554 then
					--|#line 3006 "et_eiffel_parser.y"
				yy_do_action_554
			when 555 then
					--|#line 3008 "et_eiffel_parser.y"
				yy_do_action_555
			when 556 then
					--|#line 3010 "et_eiffel_parser.y"
				yy_do_action_556
			when 557 then
					--|#line 3018 "et_eiffel_parser.y"
				yy_do_action_557
			when 558 then
					--|#line 3020 "et_eiffel_parser.y"
				yy_do_action_558
			when 559 then
					--|#line 3026 "et_eiffel_parser.y"
				yy_do_action_559
			when 560 then
					--|#line 3028 "et_eiffel_parser.y"
				yy_do_action_560
			when 561 then
					--|#line 3030 "et_eiffel_parser.y"
				yy_do_action_561
			when 562 then
					--|#line 3030 "et_eiffel_parser.y"
				yy_do_action_562
			when 563 then
					--|#line 3043 "et_eiffel_parser.y"
				yy_do_action_563
			when 564 then
					--|#line 3054 "et_eiffel_parser.y"
				yy_do_action_564
			when 565 then
					--|#line 3062 "et_eiffel_parser.y"
				yy_do_action_565
			when 566 then
					--|#line 3071 "et_eiffel_parser.y"
				yy_do_action_566
			when 567 then
					--|#line 3080 "et_eiffel_parser.y"
				yy_do_action_567
			when 568 then
					--|#line 3082 "et_eiffel_parser.y"
				yy_do_action_568
			when 569 then
					--|#line 3084 "et_eiffel_parser.y"
				yy_do_action_569
			when 570 then
					--|#line 3086 "et_eiffel_parser.y"
				yy_do_action_570
			when 571 then
					--|#line 3093 "et_eiffel_parser.y"
				yy_do_action_571
			when 572 then
					--|#line 3095 "et_eiffel_parser.y"
				yy_do_action_572
			when 573 then
					--|#line 3101 "et_eiffel_parser.y"
				yy_do_action_573
			when 574 then
					--|#line 3103 "et_eiffel_parser.y"
				yy_do_action_574
			when 575 then
					--|#line 3107 "et_eiffel_parser.y"
				yy_do_action_575
			when 576 then
					--|#line 3109 "et_eiffel_parser.y"
				yy_do_action_576
			when 577 then
					--|#line 3111 "et_eiffel_parser.y"
				yy_do_action_577
			when 578 then
					--|#line 3113 "et_eiffel_parser.y"
				yy_do_action_578
			when 579 then
					--|#line 3115 "et_eiffel_parser.y"
				yy_do_action_579
			when 580 then
					--|#line 3117 "et_eiffel_parser.y"
				yy_do_action_580
			when 581 then
					--|#line 3119 "et_eiffel_parser.y"
				yy_do_action_581
			when 582 then
					--|#line 3121 "et_eiffel_parser.y"
				yy_do_action_582
			when 583 then
					--|#line 3123 "et_eiffel_parser.y"
				yy_do_action_583
			when 584 then
					--|#line 3125 "et_eiffel_parser.y"
				yy_do_action_584
			when 585 then
					--|#line 3127 "et_eiffel_parser.y"
				yy_do_action_585
			when 586 then
					--|#line 3129 "et_eiffel_parser.y"
				yy_do_action_586
			when 587 then
					--|#line 3131 "et_eiffel_parser.y"
				yy_do_action_587
			when 588 then
					--|#line 3133 "et_eiffel_parser.y"
				yy_do_action_588
			when 589 then
					--|#line 3135 "et_eiffel_parser.y"
				yy_do_action_589
			when 590 then
					--|#line 3137 "et_eiffel_parser.y"
				yy_do_action_590
			when 591 then
					--|#line 3139 "et_eiffel_parser.y"
				yy_do_action_591
			when 592 then
					--|#line 3141 "et_eiffel_parser.y"
				yy_do_action_592
			when 593 then
					--|#line 3143 "et_eiffel_parser.y"
				yy_do_action_593
			when 594 then
					--|#line 3145 "et_eiffel_parser.y"
				yy_do_action_594
			when 595 then
					--|#line 3149 "et_eiffel_parser.y"
				yy_do_action_595
			when 596 then
					--|#line 3151 "et_eiffel_parser.y"
				yy_do_action_596
			when 597 then
					--|#line 3153 "et_eiffel_parser.y"
				yy_do_action_597
			when 598 then
					--|#line 3155 "et_eiffel_parser.y"
				yy_do_action_598
			when 599 then
					--|#line 3157 "et_eiffel_parser.y"
				yy_do_action_599
			when 600 then
					--|#line 3159 "et_eiffel_parser.y"
				yy_do_action_600
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_action_601_800 (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			inspect yy_act
			when 601 then
					--|#line 3161 "et_eiffel_parser.y"
				yy_do_action_601
			when 602 then
					--|#line 3163 "et_eiffel_parser.y"
				yy_do_action_602
			when 603 then
					--|#line 3165 "et_eiffel_parser.y"
				yy_do_action_603
			when 604 then
					--|#line 3169 "et_eiffel_parser.y"
				yy_do_action_604
			when 605 then
					--|#line 3171 "et_eiffel_parser.y"
				yy_do_action_605
			when 606 then
					--|#line 3173 "et_eiffel_parser.y"
				yy_do_action_606
			when 607 then
					--|#line 3175 "et_eiffel_parser.y"
				yy_do_action_607
			when 608 then
					--|#line 3177 "et_eiffel_parser.y"
				yy_do_action_608
			when 609 then
					--|#line 3179 "et_eiffel_parser.y"
				yy_do_action_609
			when 610 then
					--|#line 3181 "et_eiffel_parser.y"
				yy_do_action_610
			when 611 then
					--|#line 3183 "et_eiffel_parser.y"
				yy_do_action_611
			when 612 then
					--|#line 3185 "et_eiffel_parser.y"
				yy_do_action_612
			when 613 then
					--|#line 3187 "et_eiffel_parser.y"
				yy_do_action_613
			when 614 then
					--|#line 3189 "et_eiffel_parser.y"
				yy_do_action_614
			when 615 then
					--|#line 3191 "et_eiffel_parser.y"
				yy_do_action_615
			when 616 then
					--|#line 3193 "et_eiffel_parser.y"
				yy_do_action_616
			when 617 then
					--|#line 3195 "et_eiffel_parser.y"
				yy_do_action_617
			when 618 then
					--|#line 3197 "et_eiffel_parser.y"
				yy_do_action_618
			when 619 then
					--|#line 3199 "et_eiffel_parser.y"
				yy_do_action_619
			when 620 then
					--|#line 3201 "et_eiffel_parser.y"
				yy_do_action_620
			when 621 then
					--|#line 3203 "et_eiffel_parser.y"
				yy_do_action_621
			when 622 then
					--|#line 3205 "et_eiffel_parser.y"
				yy_do_action_622
			when 623 then
					--|#line 3220 "et_eiffel_parser.y"
				yy_do_action_623
			when 624 then
					--|#line 3222 "et_eiffel_parser.y"
				yy_do_action_624
			when 625 then
					--|#line 3224 "et_eiffel_parser.y"
				yy_do_action_625
			when 626 then
					--|#line 3226 "et_eiffel_parser.y"
				yy_do_action_626
			when 627 then
					--|#line 3230 "et_eiffel_parser.y"
				yy_do_action_627
			when 628 then
					--|#line 3230 "et_eiffel_parser.y"
				yy_do_action_628
			when 629 then
					--|#line 3243 "et_eiffel_parser.y"
				yy_do_action_629
			when 630 then
					--|#line 3254 "et_eiffel_parser.y"
				yy_do_action_630
			when 631 then
					--|#line 3262 "et_eiffel_parser.y"
				yy_do_action_631
			when 632 then
					--|#line 3271 "et_eiffel_parser.y"
				yy_do_action_632
			when 633 then
					--|#line 3279 "et_eiffel_parser.y"
				yy_do_action_633
			when 634 then
					--|#line 3283 "et_eiffel_parser.y"
				yy_do_action_634
			when 635 then
					--|#line 3285 "et_eiffel_parser.y"
				yy_do_action_635
			when 636 then
					--|#line 3285 "et_eiffel_parser.y"
				yy_do_action_636
			when 637 then
					--|#line 3298 "et_eiffel_parser.y"
				yy_do_action_637
			when 638 then
					--|#line 3309 "et_eiffel_parser.y"
				yy_do_action_638
			when 639 then
					--|#line 3317 "et_eiffel_parser.y"
				yy_do_action_639
			when 640 then
					--|#line 3326 "et_eiffel_parser.y"
				yy_do_action_640
			when 641 then
					--|#line 3328 "et_eiffel_parser.y"
				yy_do_action_641
			when 642 then
					--|#line 3328 "et_eiffel_parser.y"
				yy_do_action_642
			when 643 then
					--|#line 3341 "et_eiffel_parser.y"
				yy_do_action_643
			when 644 then
					--|#line 3352 "et_eiffel_parser.y"
				yy_do_action_644
			when 645 then
					--|#line 3360 "et_eiffel_parser.y"
				yy_do_action_645
			when 646 then
					--|#line 3369 "et_eiffel_parser.y"
				yy_do_action_646
			when 647 then
					--|#line 3371 "et_eiffel_parser.y"
				yy_do_action_647
			when 648 then
					--|#line 3371 "et_eiffel_parser.y"
				yy_do_action_648
			when 649 then
					--|#line 3386 "et_eiffel_parser.y"
				yy_do_action_649
			when 650 then
					--|#line 3397 "et_eiffel_parser.y"
				yy_do_action_650
			when 651 then
					--|#line 3405 "et_eiffel_parser.y"
				yy_do_action_651
			when 652 then
					--|#line 3414 "et_eiffel_parser.y"
				yy_do_action_652
			when 653 then
					--|#line 3416 "et_eiffel_parser.y"
				yy_do_action_653
			when 654 then
					--|#line 3418 "et_eiffel_parser.y"
				yy_do_action_654
			when 655 then
					--|#line 3420 "et_eiffel_parser.y"
				yy_do_action_655
			when 656 then
					--|#line 3422 "et_eiffel_parser.y"
				yy_do_action_656
			when 657 then
					--|#line 3424 "et_eiffel_parser.y"
				yy_do_action_657
			when 658 then
					--|#line 3430 "et_eiffel_parser.y"
				yy_do_action_658
			when 659 then
					--|#line 3432 "et_eiffel_parser.y"
				yy_do_action_659
			when 660 then
					--|#line 3436 "et_eiffel_parser.y"
				yy_do_action_660
			when 661 then
					--|#line 3438 "et_eiffel_parser.y"
				yy_do_action_661
			when 662 then
					--|#line 3440 "et_eiffel_parser.y"
				yy_do_action_662
			when 663 then
					--|#line 3442 "et_eiffel_parser.y"
				yy_do_action_663
			when 664 then
					--|#line 3444 "et_eiffel_parser.y"
				yy_do_action_664
			when 665 then
					--|#line 3446 "et_eiffel_parser.y"
				yy_do_action_665
			when 666 then
					--|#line 3450 "et_eiffel_parser.y"
				yy_do_action_666
			when 667 then
					--|#line 3450 "et_eiffel_parser.y"
				yy_do_action_667
			when 668 then
					--|#line 3461 "et_eiffel_parser.y"
				yy_do_action_668
			when 669 then
					--|#line 3461 "et_eiffel_parser.y"
				yy_do_action_669
			when 670 then
					--|#line 3469 "et_eiffel_parser.y"
				yy_do_action_670
			when 671 then
					--|#line 3469 "et_eiffel_parser.y"
				yy_do_action_671
			when 672 then
					--|#line 3476 "et_eiffel_parser.y"
				yy_do_action_672
			when 673 then
					--|#line 3476 "et_eiffel_parser.y"
				yy_do_action_673
			when 674 then
					--|#line 3484 "et_eiffel_parser.y"
				yy_do_action_674
			when 675 then
					--|#line 3487 "et_eiffel_parser.y"
				yy_do_action_675
			when 676 then
					--|#line 3487 "et_eiffel_parser.y"
				yy_do_action_676
			when 677 then
					--|#line 3494 "et_eiffel_parser.y"
				yy_do_action_677
			when 678 then
					--|#line 3494 "et_eiffel_parser.y"
				yy_do_action_678
			when 679 then
					--|#line 3501 "et_eiffel_parser.y"
				yy_do_action_679
			when 680 then
					--|#line 3501 "et_eiffel_parser.y"
				yy_do_action_680
			when 681 then
					--|#line 3509 "et_eiffel_parser.y"
				yy_do_action_681
			when 682 then
					--|#line 3509 "et_eiffel_parser.y"
				yy_do_action_682
			when 683 then
					--|#line 3516 "et_eiffel_parser.y"
				yy_do_action_683
			when 684 then
					--|#line 3516 "et_eiffel_parser.y"
				yy_do_action_684
			when 685 then
					--|#line 3524 "et_eiffel_parser.y"
				yy_do_action_685
			when 686 then
					--|#line 3527 "et_eiffel_parser.y"
				yy_do_action_686
			when 687 then
					--|#line 3527 "et_eiffel_parser.y"
				yy_do_action_687
			when 688 then
					--|#line 3536 "et_eiffel_parser.y"
				yy_do_action_688
			when 689 then
					--|#line 3538 "et_eiffel_parser.y"
				yy_do_action_689
			when 690 then
					--|#line 3540 "et_eiffel_parser.y"
				yy_do_action_690
			when 691 then
					--|#line 3542 "et_eiffel_parser.y"
				yy_do_action_691
			when 692 then
					--|#line 3544 "et_eiffel_parser.y"
				yy_do_action_692
			when 693 then
					--|#line 3548 "et_eiffel_parser.y"
				yy_do_action_693
			when 694 then
					--|#line 3550 "et_eiffel_parser.y"
				yy_do_action_694
			when 695 then
					--|#line 3552 "et_eiffel_parser.y"
				yy_do_action_695
			when 696 then
					--|#line 3552 "et_eiffel_parser.y"
				yy_do_action_696
			when 697 then
					--|#line 3565 "et_eiffel_parser.y"
				yy_do_action_697
			when 698 then
					--|#line 3576 "et_eiffel_parser.y"
				yy_do_action_698
			when 699 then
					--|#line 3584 "et_eiffel_parser.y"
				yy_do_action_699
			when 700 then
					--|#line 3593 "et_eiffel_parser.y"
				yy_do_action_700
			when 701 then
					--|#line 3602 "et_eiffel_parser.y"
				yy_do_action_701
			when 702 then
					--|#line 3604 "et_eiffel_parser.y"
				yy_do_action_702
			when 703 then
					--|#line 3606 "et_eiffel_parser.y"
				yy_do_action_703
			when 704 then
					--|#line 3612 "et_eiffel_parser.y"
				yy_do_action_704
			when 705 then
					--|#line 3614 "et_eiffel_parser.y"
				yy_do_action_705
			when 706 then
					--|#line 3616 "et_eiffel_parser.y"
				yy_do_action_706
			when 707 then
					--|#line 3618 "et_eiffel_parser.y"
				yy_do_action_707
			when 708 then
					--|#line 3620 "et_eiffel_parser.y"
				yy_do_action_708
			when 709 then
					--|#line 3622 "et_eiffel_parser.y"
				yy_do_action_709
			when 710 then
					--|#line 3624 "et_eiffel_parser.y"
				yy_do_action_710
			when 711 then
					--|#line 3626 "et_eiffel_parser.y"
				yy_do_action_711
			when 712 then
					--|#line 3628 "et_eiffel_parser.y"
				yy_do_action_712
			when 713 then
					--|#line 3630 "et_eiffel_parser.y"
				yy_do_action_713
			when 714 then
					--|#line 3632 "et_eiffel_parser.y"
				yy_do_action_714
			when 715 then
					--|#line 3634 "et_eiffel_parser.y"
				yy_do_action_715
			when 716 then
					--|#line 3636 "et_eiffel_parser.y"
				yy_do_action_716
			when 717 then
					--|#line 3638 "et_eiffel_parser.y"
				yy_do_action_717
			when 718 then
					--|#line 3640 "et_eiffel_parser.y"
				yy_do_action_718
			when 719 then
					--|#line 3642 "et_eiffel_parser.y"
				yy_do_action_719
			when 720 then
					--|#line 3644 "et_eiffel_parser.y"
				yy_do_action_720
			when 721 then
					--|#line 3646 "et_eiffel_parser.y"
				yy_do_action_721
			when 722 then
					--|#line 3648 "et_eiffel_parser.y"
				yy_do_action_722
			when 723 then
					--|#line 3650 "et_eiffel_parser.y"
				yy_do_action_723
			when 724 then
					--|#line 3652 "et_eiffel_parser.y"
				yy_do_action_724
			when 725 then
					--|#line 3654 "et_eiffel_parser.y"
				yy_do_action_725
			when 726 then
					--|#line 3656 "et_eiffel_parser.y"
				yy_do_action_726
			when 727 then
					--|#line 3660 "et_eiffel_parser.y"
				yy_do_action_727
			when 728 then
					--|#line 3662 "et_eiffel_parser.y"
				yy_do_action_728
			when 729 then
					--|#line 3666 "et_eiffel_parser.y"
				yy_do_action_729
			when 730 then
					--|#line 3668 "et_eiffel_parser.y"
				yy_do_action_730
			when 731 then
					--|#line 3672 "et_eiffel_parser.y"
				yy_do_action_731
			when 732 then
					--|#line 3674 "et_eiffel_parser.y"
				yy_do_action_732
			when 733 then
					--|#line 3678 "et_eiffel_parser.y"
				yy_do_action_733
			when 734 then
					--|#line 3680 "et_eiffel_parser.y"
				yy_do_action_734
			when 735 then
					--|#line 3684 "et_eiffel_parser.y"
				yy_do_action_735
			when 736 then
					--|#line 3689 "et_eiffel_parser.y"
				yy_do_action_736
			when 737 then
					--|#line 3696 "et_eiffel_parser.y"
				yy_do_action_737
			when 738 then
					--|#line 3703 "et_eiffel_parser.y"
				yy_do_action_738
			when 739 then
					--|#line 3705 "et_eiffel_parser.y"
				yy_do_action_739
			when 740 then
					--|#line 3709 "et_eiffel_parser.y"
				yy_do_action_740
			when 741 then
					--|#line 3711 "et_eiffel_parser.y"
				yy_do_action_741
			when 742 then
					--|#line 3715 "et_eiffel_parser.y"
				yy_do_action_742
			when 743 then
					--|#line 3720 "et_eiffel_parser.y"
				yy_do_action_743
			when 744 then
					--|#line 3727 "et_eiffel_parser.y"
				yy_do_action_744
			when 745 then
					--|#line 3734 "et_eiffel_parser.y"
				yy_do_action_745
			when 746 then
					--|#line 3736 "et_eiffel_parser.y"
				yy_do_action_746
			when 747 then
					--|#line 3738 "et_eiffel_parser.y"
				yy_do_action_747
			when 748 then
					--|#line 3747 "et_eiffel_parser.y"
				yy_do_action_748
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_action_1 is
			--|#line 223 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 223 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 223")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp42 := yyvsp42 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_2 is
			--|#line 224 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 224 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 224")
end

			if yyvs42.item (yyvsp42) /= Void then
				yyvs42.item (yyvsp42).set_leading_break (yyvs9.item (yyvsp9))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp9 := yyvsp9 -1
	yyvsp42 := yyvsp42 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_3 is
			--|#line 232 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 232 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 232")
end

			yyval42 := yyvs42.item (yyvsp42)
			if yyval42 /= Void then
				yyval42.set_first_indexing (yyvs78.item (yyvsp78))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp78 := yyvsp78 -1
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_4 is
			--|#line 241 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 241 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 241")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_5 is
			--|#line 242 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 242 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 242")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp42 := yyvsp42 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_6 is
			--|#line 245 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 245 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 245")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), yyvs56.item (yyvsp56), yyvs53.item (yyvsp53), yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 12
	yyvsp76 := yyvsp76 -1
	yyvsp97 := yyvsp97 -1
	yyvsp101 := yyvsp101 -1
	yyvsp56 := yyvsp56 -1
	yyvsp53 := yyvsp53 -1
	yyvsp67 := yyvsp67 -1
	yyvsp86 := yyvsp86 -1
	yyvsp78 := yyvsp78 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_7 is
			--|#line 251 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 251 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 251")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), yyvs56.item (yyvsp56), yyvs53.item (yyvsp53), yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 12
	yyvsp76 := yyvsp76 -1
	yyvsp97 := yyvsp97 -1
	yyvsp101 := yyvsp101 -1
	yyvsp56 := yyvsp56 -1
	yyvsp53 := yyvsp53 -1
	yyvsp67 := yyvsp67 -1
	yyvsp86 := yyvsp86 -1
	yyvsp78 := yyvsp78 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_8 is
			--|#line 257 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 257 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 257")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), Void, yyvs53.item (yyvsp53), yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 11
	yyvsp76 := yyvsp76 -1
	yyvsp97 := yyvsp97 -1
	yyvsp101 := yyvsp101 -1
	yyvsp53 := yyvsp53 -1
	yyvsp67 := yyvsp67 -1
	yyvsp86 := yyvsp86 -1
	yyvsp78 := yyvsp78 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_9 is
			--|#line 263 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 263 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 263")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), Void, Void, yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 10
	yyvsp76 := yyvsp76 -1
	yyvsp97 := yyvsp97 -1
	yyvsp101 := yyvsp101 -1
	yyvsp67 := yyvsp67 -1
	yyvsp86 := yyvsp86 -1
	yyvsp78 := yyvsp78 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_10 is
			--|#line 269 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 269 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 269")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), Void, Void, Void, yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 9
	yyvsp76 := yyvsp76 -1
	yyvsp97 := yyvsp97 -1
	yyvsp101 := yyvsp101 -1
	yyvsp86 := yyvsp86 -1
	yyvsp78 := yyvsp78 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_11 is
			--|#line 275 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 275 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 275")
end

			yyval42 := yyvs42.item (yyvsp42 - 1)
			set_class_to_inheritance_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101))
			if yyvs42.item (yyvsp42) /= Void then
				yyvs42.item (yyvsp42).set_first_indexing (yyvs78.item (yyvsp78))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp42 := yyvsp42 -1
	yyvsp76 := yyvsp76 -1
	yyvsp97 := yyvsp97 -1
	yyvsp101 := yyvsp101 -1
	yyvsp78 := yyvsp78 -1
	yyvsp1 := yyvsp1 -1
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_12 is
			--|#line 283 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 283 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 283")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), Void, Void, Void, Void, yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 8
	yyvsp76 := yyvsp76 -1
	yyvsp97 := yyvsp97 -1
	yyvsp101 := yyvsp101 -1
	yyvsp78 := yyvsp78 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_13 is
			--|#line 288 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 288 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 288")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_inheritance_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp76 := yyvsp76 -1
	yyvsp97 := yyvsp97 -1
	yyvsp101 := yyvsp101 -1
	yyvsp1 := yyvsp1 -1
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_14 is
			--|#line 303 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 303 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 303")
end

set_class_providers 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_15 is
			--|#line 308 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 308 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 308")
end

yyval78 := ast_factory.new_indexings (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp78 := yyvsp78 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp78 >= yyvsc78 then
		if yyvs78 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs78")
			end
			create yyspecial_routines78
			yyvsc78 := yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.make (yyvsc78)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs78")
			end
			yyvsc78 := yyvsc78 + yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.resize (yyvs78, yyvsc78)
		end
	end
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_16 is
			--|#line 310 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 310 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 310")
end

			yyval78 := yyvs78.item (yyvsp78)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp78 := yyvsp78 -1
	yyvsp2 := yyvsp2 -1
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_17 is
			--|#line 310 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 310 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 310")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp78 := yyvsp78 + 1
	if yyvsp78 >= yyvsc78 then
		if yyvs78 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs78")
			end
			create yyspecial_routines78
			yyvsc78 := yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.make (yyvsc78)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs78")
			end
			yyvsc78 := yyvsc78 + yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.resize (yyvs78, yyvsc78)
		end
	end
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_18 is
			--|#line 323 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 323 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 323")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp78 := yyvsp78 + 1
	if yyvsp78 >= yyvsc78 then
		if yyvs78 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs78")
			end
			create yyspecial_routines78
			yyvsc78 := yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.make (yyvsc78)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs78")
			end
			yyvsc78 := yyvsc78 + yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.resize (yyvs78, yyvsc78)
		end
	end
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_19 is
			--|#line 325 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 325 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 325")
end

yyval78 := yyvs78.item (yyvsp78) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_20 is
			--|#line 329 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 329 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 329")
end

			if yyvs79.item (yyvsp79) /= Void then
				yyval78 := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if yyval78 /= Void then
					yyval78.put_first (yyvs79.item (yyvsp79))
				end
			else
				yyval78 := ast_factory.new_indexings (last_keyword, counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp78 := yyvsp78 + 1
	yyvsp79 := yyvsp79 -1
	if yyvsp78 >= yyvsc78 then
		if yyvs78 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs78")
			end
			create yyspecial_routines78
			yyvsc78 := yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.make (yyvsc78)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs78")
			end
			yyvsc78 := yyvsc78 + yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.resize (yyvs78, yyvsc78)
		end
	end
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_21 is
			--|#line 340 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 340 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 340")
end

			if yyvs79.item (yyvsp79) /= Void then
				yyval78 := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if yyval78 /= Void then
					yyval78.put_first (yyvs79.item (yyvsp79))
				end
			else
				yyval78 := ast_factory.new_indexings (last_keyword, counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp78 := yyvsp78 + 1
	yyvsp79 := yyvsp79 -1
	if yyvsp78 >= yyvsc78 then
		if yyvs78 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs78")
			end
			create yyspecial_routines78
			yyvsc78 := yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.make (yyvsc78)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs78")
			end
			yyvsc78 := yyvsc78 + yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.resize (yyvs78, yyvsc78)
		end
	end
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_22 is
			--|#line 352 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 352 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 352")
end

			yyval78 := yyvs78.item (yyvsp78)
			if yyval78 /= Void and yyvs79.item (yyvsp79) /= Void then
				yyval78.put_first (yyvs79.item (yyvsp79))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp78 := yyvsp78 -1
	yyvsp79 := yyvsp79 -1
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_23 is
			--|#line 352 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 352 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 352")
end

increment_counter 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp78 := yyvsp78 + 1
	if yyvsp78 >= yyvsc78 then
		if yyvs78 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs78")
			end
			create yyspecial_routines78
			yyvsc78 := yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.make (yyvsc78)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs78")
			end
			yyvsc78 := yyvsc78 + yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.resize (yyvs78, yyvsc78)
		end
	end
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_24 is
			--|#line 361 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 361 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 361")
end

			yyval78 := yyvs78.item (yyvsp78)
			if yyval78 /= Void and yyvs79.item (yyvsp79) /= Void then
				yyval78.put_first (yyvs79.item (yyvsp79))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp78 := yyvsp78 -1
	yyvsp79 := yyvsp79 -1
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_25 is
			--|#line 361 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 361 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 361")
end

increment_counter 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp78 := yyvsp78 + 1
	if yyvsp78 >= yyvsc78 then
		if yyvs78 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs78")
			end
			create yyspecial_routines78
			yyvsc78 := yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.make (yyvsc78)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs78")
			end
			yyvsc78 := yyvsc78 + yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.resize (yyvs78, yyvsc78)
		end
	end
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_26 is
			--|#line 372 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 372 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 372")
end

			yyval79 := yyvs79.item (yyvsp79)
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs79.put (yyval79, yyvsp79)
end
		end

	yy_do_action_27 is
			--|#line 379 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 379 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 379")
end

			yyval79 := ast_factory.new_indexing (yyvs82.item (yyvsp82))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp79 := yyvsp79 + 1
	yyvsp82 := yyvsp82 -1
	if yyvsp79 >= yyvsc79 then
		if yyvs79 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs79")
			end
			create yyspecial_routines79
			yyvsc79 := yyInitial_yyvs_size
			yyvs79 := yyspecial_routines79.make (yyvsc79)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs79")
			end
			yyvsc79 := yyvsc79 + yyInitial_yyvs_size
			yyvs79 := yyspecial_routines79.resize (yyvs79, yyvsc79)
		end
	end
	yyvs79.put (yyval79, yyvsp79)
end
		end

	yy_do_action_28 is
			--|#line 383 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 383 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 383")
end

			yyval79 := ast_factory.new_tagged_indexing (ast_factory.new_tag (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyvs82.item (yyvsp82))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp79 := yyvsp79 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp82 := yyvsp82 -1
	if yyvsp79 >= yyvsc79 then
		if yyvs79 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs79")
			end
			create yyspecial_routines79
			yyvsc79 := yyInitial_yyvs_size
			yyvs79 := yyspecial_routines79.make (yyvsc79)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs79")
			end
			yyvsc79 := yyvsc79 + yyInitial_yyvs_size
			yyvs79 := yyspecial_routines79.resize (yyvs79, yyvsc79)
		end
	end
	yyvs79.put (yyval79, yyvsp79)
end
		end

	yy_do_action_29 is
			--|#line 393 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 393 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 393")
end

yyval79 := ast_factory.new_indexing_semicolon (yyvs79.item (yyvsp79), yyvs22.item (yyvsp22)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 -1
	yyvs79.put (yyval79, yyvsp79)
end
		end

	yy_do_action_30 is
			--|#line 395 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 395 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 395")
end

yyval79 := ast_factory.new_indexing_semicolon (yyvs79.item (yyvsp79), yyvs22.item (yyvsp22)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 -1
	yyvs79.put (yyval79, yyvsp79)
end
		end

	yy_do_action_31 is
			--|#line 400 "et_eiffel_parser.y"
		local
			yyval82: ET_INDEXING_TERM_LIST
		do
--|#line 400 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 400")
end

			if yyvs80.item (yyvsp80) /= Void then
				yyval82 := ast_factory.new_indexing_terms (counter_value + 1)
				if yyval82 /= Void then
					yyval82.put_first (yyvs80.item (yyvsp80))
				end
			else
				yyval82 := ast_factory.new_indexing_terms (counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp82 := yyvsp82 + 1
	yyvsp80 := yyvsp80 -1
	if yyvsp82 >= yyvsc82 then
		if yyvs82 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs82")
			end
			create yyspecial_routines82
			yyvsc82 := yyInitial_yyvs_size
			yyvs82 := yyspecial_routines82.make (yyvsc82)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs82")
			end
			yyvsc82 := yyvsc82 + yyInitial_yyvs_size
			yyvs82 := yyspecial_routines82.resize (yyvs82, yyvsc82)
		end
	end
	yyvs82.put (yyval82, yyvsp82)
end
		end

	yy_do_action_32 is
			--|#line 411 "et_eiffel_parser.y"
		local
			yyval82: ET_INDEXING_TERM_LIST
		do
--|#line 411 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 411")
end

			yyval82 := yyvs82.item (yyvsp82)
			if yyval82 /= Void and yyvs81.item (yyvsp81) /= Void then
				yyval82.put_first (yyvs81.item (yyvsp81))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp81 := yyvsp81 -1
	yyvs82.put (yyval82, yyvsp82)
end
		end

	yy_do_action_33 is
			--|#line 420 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 420 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 420")
end

yyval80 := yyvs13.item (yyvsp13) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp80 >= yyvsc80 then
		if yyvs80 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs80")
			end
			create yyspecial_routines80
			yyvsc80 := yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.make (yyvsc80)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs80")
			end
			yyvsc80 := yyvsc80 + yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.resize (yyvs80, yyvsc80)
		end
	end
	yyvs80.put (yyval80, yyvsp80)
end
		end

	yy_do_action_34 is
			--|#line 422 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 422 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 422")
end

yyval80 := yyvs8.item (yyvsp8) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp80 >= yyvsc80 then
		if yyvs80 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs80")
			end
			create yyspecial_routines80
			yyvsc80 := yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.make (yyvsc80)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs80")
			end
			yyvsc80 := yyvsc80 + yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.resize (yyvs80, yyvsc80)
		end
	end
	yyvs80.put (yyval80, yyvsp80)
end
		end

	yy_do_action_35 is
			--|#line 424 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 424 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 424")
end

yyval80 := yyvs10.item (yyvsp10) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp80 >= yyvsc80 then
		if yyvs80 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs80")
			end
			create yyspecial_routines80
			yyvsc80 := yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.make (yyvsc80)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs80")
			end
			yyvsc80 := yyvsc80 + yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.resize (yyvs80, yyvsc80)
		end
	end
	yyvs80.put (yyval80, yyvsp80)
end
		end

	yy_do_action_36 is
			--|#line 426 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 426 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 426")
end

yyval80 := yyvs14.item (yyvsp14) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp80 >= yyvsc80 then
		if yyvs80 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs80")
			end
			create yyspecial_routines80
			yyvsc80 := yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.make (yyvsc80)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs80")
			end
			yyvsc80 := yyvsc80 + yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.resize (yyvs80, yyvsc80)
		end
	end
	yyvs80.put (yyval80, yyvsp80)
end
		end

	yy_do_action_37 is
			--|#line 428 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 428 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 428")
end

yyval80 := yyvs17.item (yyvsp17) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp80 >= yyvsc80 then
		if yyvs80 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs80")
			end
			create yyspecial_routines80
			yyvsc80 := yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.make (yyvsc80)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs80")
			end
			yyvsc80 := yyvsc80 + yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.resize (yyvs80, yyvsc80)
		end
	end
	yyvs80.put (yyval80, yyvsp80)
end
		end

	yy_do_action_38 is
			--|#line 430 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 430 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 430")
end

yyval80 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp80 >= yyvsc80 then
		if yyvs80 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs80")
			end
			create yyspecial_routines80
			yyvsc80 := yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.make (yyvsc80)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs80")
			end
			yyvsc80 := yyvsc80 + yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.resize (yyvs80, yyvsc80)
		end
	end
	yyvs80.put (yyval80, yyvsp80)
end
		end

	yy_do_action_39 is
			--|#line 432 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 432 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 432")
end

yyval80 := yyvs7.item (yyvsp7) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp80 >= yyvsc80 then
		if yyvs80 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs80")
			end
			create yyspecial_routines80
			yyvsc80 := yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.make (yyvsc80)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs80")
			end
			yyvsc80 := yyvsc80 + yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.resize (yyvs80, yyvsc80)
		end
	end
	yyvs80.put (yyval80, yyvsp80)
end
		end

	yy_do_action_40 is
			--|#line 434 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 434 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 434")
end

yyval80 := ast_factory.new_custom_attribute (yyvs54.item (yyvsp54), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp80 := yyvsp80 + 1
	yyvsp54 := yyvsp54 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp80 >= yyvsc80 then
		if yyvs80 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs80")
			end
			create yyspecial_routines80
			yyvsc80 := yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.make (yyvsc80)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs80")
			end
			yyvsc80 := yyvsc80 + yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.resize (yyvs80, yyvsc80)
		end
	end
	yyvs80.put (yyval80, yyvsp80)
end
		end

	yy_do_action_41 is
			--|#line 436 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 436 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 436")
end

yyval80 := ast_factory.new_custom_attribute (yyvs54.item (yyvsp54), yyvs96.item (yyvsp96), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp80 := yyvsp80 + 1
	yyvsp54 := yyvsp54 -1
	yyvsp96 := yyvsp96 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp80 >= yyvsc80 then
		if yyvs80 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs80")
			end
			create yyspecial_routines80
			yyvsc80 := yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.make (yyvsc80)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs80")
			end
			yyvsc80 := yyvsc80 + yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.resize (yyvs80, yyvsc80)
		end
	end
	yyvs80.put (yyval80, yyvsp80)
end
		end

	yy_do_action_42 is
			--|#line 440 "et_eiffel_parser.y"
		local
			yyval81: ET_INDEXING_TERM_ITEM
		do
--|#line 440 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 440")
end

			yyval81 := ast_factory.new_indexing_term_comma (yyvs80.item (yyvsp80), yyvs5.item (yyvsp5))
			if yyval81 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp81 := yyvsp81 + 1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp81 >= yyvsc81 then
		if yyvs81 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs81")
			end
			create yyspecial_routines81
			yyvsc81 := yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.make (yyvsc81)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs81")
			end
			yyvsc81 := yyvsc81 + yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.resize (yyvs81, yyvsc81)
		end
	end
	yyvs81.put (yyval81, yyvsp81)
end
		end

	yy_do_action_43 is
			--|#line 451 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 451 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 451")
end

			yyval42 := new_class (yyvs13.item (yyvsp13))
			if yyval42 /= Void then
				yyval42.set_class_keyword (yyvs2.item (yyvsp2))
				yyval42.set_frozen_keyword (yyvs2.item (yyvsp2 - 2))
				yyval42.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval42
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp13 := yyvsp13 -1
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_44 is
			--|#line 461 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 461 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 461")
end

			yyval42 := new_class (yyvs13.item (yyvsp13))
			if yyval42 /= Void then
				yyval42.set_class_keyword (yyvs2.item (yyvsp2))
				yyval42.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval42.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval42.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval42
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp42 := yyvsp42 + 1
	yyvsp2 := yyvsp2 -4
	yyvsp13 := yyvsp13 -1
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_45 is
			--|#line 472 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 472 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 472")
end

			yyval42 := new_class (yyvs13.item (yyvsp13))
			if yyval42 /= Void then
				yyval42.set_class_keyword (yyvs2.item (yyvsp2))
				yyval42.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval42.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval42.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval42
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp42 := yyvsp42 + 1
	yyvsp2 := yyvsp2 -4
	yyvsp13 := yyvsp13 -1
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_46 is
			--|#line 483 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 483 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 483")
end

			yyval42 := new_class (yyvs13.item (yyvsp13))
			if yyval42 /= Void then
				yyval42.set_class_keyword (yyvs2.item (yyvsp2))
				yyval42.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval42.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval42.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval42
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp42 := yyvsp42 + 1
	yyvsp2 := yyvsp2 -4
	yyvsp13 := yyvsp13 -1
	if yyvsp42 >= yyvsc42 then
		if yyvs42 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs42")
			end
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs42")
			end
			yyvsc42 := yyvsc42 + yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.resize (yyvs42, yyvsc42)
		end
	end
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_47 is
			--|#line 496 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 496 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 496")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_48 is
			--|#line 498 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 498 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 498")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_49 is
			--|#line 502 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 502 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 502")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_50 is
			--|#line 504 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 504 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 504")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_51 is
			--|#line 510 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 510 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 510")
end

			set_formal_parameters (Void)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp76 := yyvsp76 + 1
	if yyvsp76 >= yyvsc76 then
		if yyvs76 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs76")
			end
			create yyspecial_routines76
			yyvsc76 := yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.make (yyvsc76)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs76")
			end
			yyvsc76 := yyvsc76 + yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.resize (yyvs76, yyvsc76)
		end
	end
	yyvs76.put (yyval76, yyvsp76)
end
		end

	yy_do_action_52 is
			--|#line 514 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 514 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 514")
end

			yyval76 := ast_factory.new_formal_parameters (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0)
			set_formal_parameters (yyval76)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp76 := yyvsp76 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp76 >= yyvsc76 then
		if yyvs76 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs76")
			end
			create yyspecial_routines76
			yyvsc76 := yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.make (yyvsc76)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs76")
			end
			yyvsc76 := yyvsc76 + yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.resize (yyvs76, yyvsc76)
		end
	end
	yyvs76.put (yyval76, yyvsp76)
end
		end

	yy_do_action_53 is
			--|#line 520 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 520 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 520")
end

			yyval76 := yyvs76.item (yyvsp76)
			set_formal_parameters (yyval76)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp76 := yyvsp76 -1
	yyvsp23 := yyvsp23 -1
	yyvs76.put (yyval76, yyvsp76)
end
		end

	yy_do_action_54 is
			--|#line 520 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 520 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 520")
end

			add_symbol (yyvs23.item (yyvsp23))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp76 := yyvsp76 + 1
	if yyvsp76 >= yyvsc76 then
		if yyvs76 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs76")
			end
			create yyspecial_routines76
			yyvsc76 := yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.make (yyvsc76)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs76")
			end
			yyvsc76 := yyvsc76 + yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.resize (yyvs76, yyvsc76)
		end
	end
	yyvs76.put (yyval76, yyvsp76)
end
		end

	yy_do_action_55 is
			--|#line 534 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 534 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 534")
end

			if yyvs74.item (yyvsp74) /= Void then
				yyval76 := ast_factory.new_formal_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval76 /= Void then
					yyval76.put_first (yyvs74.item (yyvsp74))
				end
			else
				yyval76 := ast_factory.new_formal_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp76 := yyvsp76 + 1
	yyvsp74 := yyvsp74 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp76 >= yyvsc76 then
		if yyvs76 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs76")
			end
			create yyspecial_routines76
			yyvsc76 := yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.make (yyvsc76)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs76")
			end
			yyvsc76 := yyvsc76 + yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.resize (yyvs76, yyvsc76)
		end
	end
	yyvs76.put (yyval76, yyvsp76)
end
		end

	yy_do_action_56 is
			--|#line 545 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 545 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 545")
end

			yyval76 := yyvs76.item (yyvsp76)
			if yyval76 /= Void and yyvs75.item (yyvsp75) /= Void then
				yyval76.put_first (yyvs75.item (yyvsp75))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp75 := yyvsp75 -1
	yyvs76.put (yyval76, yyvsp76)
end
		end

	yy_do_action_57 is
			--|#line 554 "et_eiffel_parser.y"
		local
			yyval75: ET_FORMAL_PARAMETER_ITEM
		do
--|#line 554 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 554")
end

			yyval75 := ast_factory.new_formal_parameter_comma (yyvs74.item (yyvsp74), yyvs5.item (yyvsp5))
			if yyval75 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp75 := yyvsp75 + 1
	yyvsp74 := yyvsp74 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp75 >= yyvsc75 then
		if yyvs75 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs75")
			end
			create yyspecial_routines75
			yyvsc75 := yyInitial_yyvs_size
			yyvs75 := yyspecial_routines75.make (yyvsc75)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs75")
			end
			yyvsc75 := yyvsc75 + yyInitial_yyvs_size
			yyvs75 := yyspecial_routines75.resize (yyvs75, yyvsc75)
		end
	end
	yyvs75.put (yyval75, yyvsp75)
end
		end

	yy_do_action_58 is
			--|#line 563 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 563 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 563")
end

			yyval74 := ast_factory.new_formal_parameter (Void, yyvs13.item (yyvsp13))
			if yyval74 /= Void then
				register_constraint (Void)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp74 := yyvsp74 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp74 >= yyvsc74 then
		if yyvs74 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs74")
			end
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs74")
			end
			yyvsc74 := yyvsc74 + yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.resize (yyvs74, yyvsc74)
		end
	end
	yyvs74.put (yyval74, yyvsp74)
end
		end

	yy_do_action_59 is
			--|#line 570 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 570 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 570")
end

			yyval74 := ast_factory.new_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13))
			if yyval74 /= Void then
				register_constraint (Void)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp74 := yyvsp74 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	if yyvsp74 >= yyvsc74 then
		if yyvs74 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs74")
			end
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs74")
			end
			yyvsc74 := yyvsc74 + yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.resize (yyvs74, yyvsc74)
		end
	end
	yyvs74.put (yyval74, yyvsp74)
end
		end

	yy_do_action_60 is
			--|#line 577 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 577 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 577")
end

			yyval74 := ast_factory.new_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13))
			if yyval74 /= Void then
				register_constraint (Void)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp74 := yyvsp74 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	if yyvsp74 >= yyvsc74 then
		if yyvs74 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs74")
			end
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs74")
			end
			yyvsc74 := yyvsc74 + yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.resize (yyvs74, yyvsc74)
		end
	end
	yyvs74.put (yyval74, yyvsp74)
end
		end

	yy_do_action_61 is
			--|#line 584 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 584 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 584")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (Void, yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), Void)
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp74 := yyvsp74 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp74 >= yyvsc74 then
		if yyvs74 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs74")
			end
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs74")
			end
			yyvsc74 := yyvsc74 + yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.resize (yyvs74, yyvsc74)
		end
	end
	yyvs74.put (yyval74, yyvsp74)
end
		end

	yy_do_action_62 is
			--|#line 591 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 591 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 591")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), Void)
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp74 := yyvsp74 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp74 >= yyvsc74 then
		if yyvs74 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs74")
			end
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs74")
			end
			yyvsc74 := yyvsc74 + yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.resize (yyvs74, yyvsc74)
		end
	end
	yyvs74.put (yyval74, yyvsp74)
end
		end

	yy_do_action_63 is
			--|#line 598 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 598 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 598")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), Void)
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp74 := yyvsp74 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp74 >= yyvsc74 then
		if yyvs74 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs74")
			end
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs74")
			end
			yyvsc74 := yyvsc74 + yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.resize (yyvs74, yyvsc74)
		end
	end
	yyvs74.put (yyval74, yyvsp74)
end
		end

	yy_do_action_64 is
			--|#line 605 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 605 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 605")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (Void, yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), yyvs49.item (yyvsp49))
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp74 := yyvsp74 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp50 := yyvsp50 -1
	yyvsp49 := yyvsp49 -1
	if yyvsp74 >= yyvsc74 then
		if yyvs74 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs74")
			end
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs74")
			end
			yyvsc74 := yyvsc74 + yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.resize (yyvs74, yyvsc74)
		end
	end
	yyvs74.put (yyval74, yyvsp74)
end
		end

	yy_do_action_65 is
			--|#line 612 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 612 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 612")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), yyvs49.item (yyvsp49))
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp74 := yyvsp74 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp50 := yyvsp50 -1
	yyvsp49 := yyvsp49 -1
	if yyvsp74 >= yyvsc74 then
		if yyvs74 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs74")
			end
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs74")
			end
			yyvsc74 := yyvsc74 + yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.resize (yyvs74, yyvsc74)
		end
	end
	yyvs74.put (yyval74, yyvsp74)
end
		end

	yy_do_action_66 is
			--|#line 619 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 619 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 619")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), yyvs49.item (yyvsp49))
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp74 := yyvsp74 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp50 := yyvsp50 -1
	yyvsp49 := yyvsp49 -1
	if yyvsp74 >= yyvsc74 then
		if yyvs74 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs74")
			end
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs74")
			end
			yyvsc74 := yyvsc74 + yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.resize (yyvs74, yyvsc74)
		end
	end
	yyvs74.put (yyval74, yyvsp74)
end
		end

	yy_do_action_67 is
			--|#line 628 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 628 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 628")
end

yyval49 := ast_factory.new_constraint_creator (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp49 := yyvsp49 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp49 >= yyvsc49 then
		if yyvs49 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs49")
			end
			create yyspecial_routines49
			yyvsc49 := yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.make (yyvsc49)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs49")
			end
			yyvsc49 := yyvsc49 + yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.resize (yyvs49, yyvsc49)
		end
	end
	yyvs49.put (yyval49, yyvsp49)
end
		end

	yy_do_action_68 is
			--|#line 630 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 630 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 630")
end

			yyval49 := yyvs49.item (yyvsp49)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 -1
	yyvsp2 := yyvsp2 -1
	yyvs49.put (yyval49, yyvsp49)
end
		end

	yy_do_action_69 is
			--|#line 630 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 630 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 630")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp49 := yyvsp49 + 1
	if yyvsp49 >= yyvsc49 then
		if yyvs49 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs49")
			end
			create yyspecial_routines49
			yyvsc49 := yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.make (yyvsc49)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs49")
			end
			yyvsc49 := yyvsc49 + yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.resize (yyvs49, yyvsc49)
		end
	end
	yyvs49.put (yyval49, yyvsp49)
end
		end

	yy_do_action_70 is
			--|#line 643 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 643 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 643")
end

			if yyvs13.item (yyvsp13) /= Void then
				yyval49 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value + 1)
				if yyval49 /= Void then
					yyval49.put_first (yyvs13.item (yyvsp13))
				end
			else
				yyval49 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp49 := yyvsp49 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp49 >= yyvsc49 then
		if yyvs49 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs49")
			end
			create yyspecial_routines49
			yyvsc49 := yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.make (yyvsc49)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs49")
			end
			yyvsc49 := yyvsc49 + yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.resize (yyvs49, yyvsc49)
		end
	end
	yyvs49.put (yyval49, yyvsp49)
end
		end

	yy_do_action_71 is
			--|#line 654 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 654 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 654")
end

			yyval49 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value)
			if yyval49 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval49.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp49 := yyvsp49 + 1
	yyvsp70 := yyvsp70 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp49 >= yyvsc49 then
		if yyvs49 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs49")
			end
			create yyspecial_routines49
			yyvsc49 := yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.make (yyvsc49)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs49")
			end
			yyvsc49 := yyvsc49 + yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.resize (yyvs49, yyvsc49)
		end
	end
	yyvs49.put (yyval49, yyvsp49)
end
		end

	yy_do_action_72 is
			--|#line 662 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 662 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 662")
end

			yyval49 := yyvs49.item (yyvsp49)
			if yyval49 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval49.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyvs49.put (yyval49, yyvsp49)
end
		end

	yy_do_action_73 is
			--|#line 671 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 671 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 671")
end

yyval50 := new_constraint_named_type (Void, yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_74 is
			--|#line 673 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 673 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 673")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_75 is
			--|#line 675 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 675 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 675")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_76 is
			--|#line 677 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 677 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 677")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_77 is
			--|#line 679 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 679 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 679")
end

yyval50 := yyvs88.item (yyvsp88) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp50 := yyvsp50 + 1
	yyvsp88 := yyvsp88 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_78 is
			--|#line 681 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 681 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 681")
end

yyval50 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_79 is
			--|#line 683 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 683 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 683")
end

yyval50 := ast_factory.new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp13 := yyvsp13 -2
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_80 is
			--|#line 685 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 685 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 685")
end

yyval50 := new_constraint_named_type (Void, yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_81 is
			--|#line 689 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 689 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 689")
end

yyval50 := new_constraint_named_type (Void, yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_82 is
			--|#line 691 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 691 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 691")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_83 is
			--|#line 693 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 693 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 693")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_84 is
			--|#line 695 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 695 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 695")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_85 is
			--|#line 697 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 697 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 697")
end

yyval50 := yyvs88.item (yyvsp88) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp50 := yyvsp50 + 1
	yyvsp88 := yyvsp88 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_86 is
			--|#line 699 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 699 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 699")
end

yyval50 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_87 is
			--|#line 701 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 701 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 701")
end

yyval50 := ast_factory.new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp13 := yyvsp13 -2
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_88 is
			--|#line 703 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 703 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 703")
end

yyval50 := new_constraint_named_type (Void, yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp48 := yyvsp48 -1
	if yyvsp50 >= yyvsc50 then
		if yyvs50 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs50")
			end
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs50")
			end
			yyvsc50 := yyvsc50 + yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.resize (yyvs50, yyvsc50)
		end
	end
	yyvs50.put (yyval50, yyvsp50)
end
		end

	yy_do_action_89 is
			--|#line 707 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 707 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 707")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp48 := yyvsp48 + 1
	if yyvsp48 >= yyvsc48 then
		if yyvs48 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs48")
			end
			create yyspecial_routines48
			yyvsc48 := yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.make (yyvsc48)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs48")
			end
			yyvsc48 := yyvsc48 + yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.resize (yyvs48, yyvsc48)
		end
	end
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_90 is
			--|#line 709 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 709 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 709")
end

yyval48 := yyvs48.item (yyvsp48) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_91 is
			--|#line 713 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 713 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 713")
end

yyval48 := ast_factory.new_constraint_actual_parameters (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp48 := yyvsp48 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp48 >= yyvsc48 then
		if yyvs48 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs48")
			end
			create yyspecial_routines48
			yyvsc48 := yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.make (yyvsc48)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs48")
			end
			yyvsc48 := yyvsc48 + yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.resize (yyvs48, yyvsc48)
		end
	end
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_92 is
			--|#line 716 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 716 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 716")
end

			yyval48 := yyvs48.item (yyvsp48)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_93 is
			--|#line 724 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 724 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 724")
end

			if yyvs50.item (yyvsp50) /= Void then
				yyval48 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval48 /= Void then
					yyval48.put_first (yyvs50.item (yyvsp50))
				end
			else
				yyval48 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp48 := yyvsp48 + 1
	yyvsp50 := yyvsp50 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp48 >= yyvsc48 then
		if yyvs48 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs48")
			end
			create yyspecial_routines48
			yyvsc48 := yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.make (yyvsc48)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs48")
			end
			yyvsc48 := yyvsc48 + yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.resize (yyvs48, yyvsc48)
		end
	end
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_94 is
			--|#line 735 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 735 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 735")
end

			yyval48 := yyvs48.item (yyvsp48)
			add_to_constraint_actual_parameter_list (yyvs47.item (yyvsp47), yyval48)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp47 := yyvsp47 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_95 is
			--|#line 740 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 740 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 740")
end

			yyval48 := yyvs48.item (yyvsp48)
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_actual_parameter_comma (new_constraint_named_type (Void, yyvs13.item (yyvsp13), Void), yyvs5.item (yyvsp5)), yyval48)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_96 is
			--|#line 745 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 745 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 745")
end

			yyval48 := yyvs48.item (yyvsp48)
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_actual_parameter_comma (new_constraint_named_type (Void, yyvs13.item (yyvsp13), Void), yyvs5.item (yyvsp5)), yyval48)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_97 is
			--|#line 752 "et_eiffel_parser.y"
		local
			yyval47: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 752 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 752")
end

			yyval47 := ast_factory.new_constraint_actual_parameter_comma (yyvs50.item (yyvsp50), yyvs5.item (yyvsp5))
			if yyval47 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp47 := yyvsp47 + 1
	yyvsp50 := yyvsp50 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp47 >= yyvsc47 then
		if yyvs47 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs47")
			end
			create yyspecial_routines47
			yyvsc47 := yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.make (yyvsc47)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs47")
			end
			yyvsc47 := yyvsc47 + yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.resize (yyvs47, yyvsc47)
		end
	end
	yyvs47.put (yyval47, yyvsp47)
end
		end

	yy_do_action_98 is
			--|#line 761 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 761 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 761")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp48 := yyvsp48 + 1
	if yyvsp48 >= yyvsc48 then
		if yyvs48 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs48")
			end
			create yyspecial_routines48
			yyvsc48 := yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.make (yyvsc48)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs48")
			end
			yyvsc48 := yyvsc48 + yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.resize (yyvs48, yyvsc48)
		end
	end
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_99 is
			--|#line 763 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 763 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 763")
end

yyval48 := yyvs48.item (yyvsp48) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_100 is
			--|#line 767 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 767 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 767")
end

yyval48 := ast_factory.new_constraint_actual_parameters (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp48 := yyvsp48 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp48 >= yyvsc48 then
		if yyvs48 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs48")
			end
			create yyspecial_routines48
			yyvsc48 := yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.make (yyvsc48)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs48")
			end
			yyvsc48 := yyvsc48 + yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.resize (yyvs48, yyvsc48)
		end
	end
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_101 is
			--|#line 770 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 770 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 770")
end

			yyval48 := yyvs48.item (yyvsp48)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_102 is
			--|#line 776 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 776 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 776")
end

			yyval48 := yyvs48.item (yyvsp48)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_103 is
			--|#line 784 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 784 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 784")
end

			yyval48 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5 - 1), yyvs50.item (yyvsp50)), yyval48)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp48 := yyvsp48 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -2
	yyvsp50 := yyvsp50 -1
	if yyvsp48 >= yyvsc48 then
		if yyvs48 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs48")
			end
			create yyspecial_routines48
			yyvsc48 := yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.make (yyvsc48)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs48")
			end
			yyvsc48 := yyvsc48 + yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.resize (yyvs48, yyvsc48)
		end
	end
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_104 is
			--|#line 789 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 789 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 789")
end

			yyval48 := yyvs48.item (yyvsp48)
			add_to_constraint_actual_parameter_list (yyvs47.item (yyvsp47), yyvs48.item (yyvsp48))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp47 := yyvsp47 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_105 is
			--|#line 794 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 794 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 794")
end

			yyval48 := yyvs48.item (yyvsp48)
			add_to_constraint_actual_parameter_list (yyvs47.item (yyvsp47), yyvs48.item (yyvsp48))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp47 := yyvsp47 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_106 is
			--|#line 799 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 799 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 799")
end

			yyval48 := yyvs48.item (yyvsp48)
			if yyval48 /= Void then
				if not yyval48.is_empty then
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyval48.first.type), yyval48)
				else
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), Void), yyval48)
				end
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_107 is
			--|#line 810 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 810 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 810")
end

			yyval48 := yyvs48.item (yyvsp48)
			if yyval48 /= Void then
				if not yyval48.is_empty then
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyval48.first.type), yyval48)
				else
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), Void), yyval48)
				end
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_108 is
			--|#line 821 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 821 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 821")
end

			yyval48 := yyvs48.item (yyvsp48)
			if yyval48 /= Void then
				if not yyval48.is_empty then
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyval48.first.type), yyval48)
				else
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), Void), yyval48)
				end
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_109 is
			--|#line 834 "et_eiffel_parser.y"
		local
			yyval47: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 834 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 834")
end

			yyval47 := ast_factory.new_constraint_labeled_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyvs50.item (yyvsp50))
			if yyval47 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp47 := yyvsp47 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp47 >= yyvsc47 then
		if yyvs47 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs47")
			end
			create yyspecial_routines47
			yyvsc47 := yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.make (yyvsc47)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs47")
			end
			yyvsc47 := yyvsc47 + yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.resize (yyvs47, yyvsc47)
		end
	end
	yyvs47.put (yyval47, yyvsp47)
end
		end

	yy_do_action_110 is
			--|#line 843 "et_eiffel_parser.y"
		local
			yyval47: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 843 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 843")
end

			yyval47 := ast_factory.new_constraint_labeled_actual_parameter_semicolon (ast_factory.new_constraint_labeled_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyvs50.item (yyvsp50)), yyvs22.item (yyvsp22))
			if yyval47 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp47 := yyvsp47 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp50 := yyvsp50 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp47 >= yyvsc47 then
		if yyvs47 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs47")
			end
			create yyspecial_routines47
			yyvsc47 := yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.make (yyvsc47)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs47")
			end
			yyvsc47 := yyvsc47 + yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.resize (yyvs47, yyvsc47)
		end
	end
	yyvs47.put (yyval47, yyvsp47)
end
		end

	yy_do_action_111 is
			--|#line 854 "et_eiffel_parser.y"
		local
			yyval97: ET_OBSOLETE
		do
--|#line 854 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 854")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp97 := yyvsp97 + 1
	if yyvsp97 >= yyvsc97 then
		if yyvs97 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs97")
			end
			create yyspecial_routines97
			yyvsc97 := yyInitial_yyvs_size
			yyvs97 := yyspecial_routines97.make (yyvsc97)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs97")
			end
			yyvsc97 := yyvsc97 + yyInitial_yyvs_size
			yyvs97 := yyspecial_routines97.resize (yyvs97, yyvsc97)
		end
	end
	yyvs97.put (yyval97, yyvsp97)
end
		end

	yy_do_action_112 is
			--|#line 856 "et_eiffel_parser.y"
		local
			yyval97: ET_OBSOLETE
		do
--|#line 856 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 856")
end

yyval97 := ast_factory.new_obsolete_message (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp97 := yyvsp97 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp97 >= yyvsc97 then
		if yyvs97 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs97")
			end
			create yyspecial_routines97
			yyvsc97 := yyInitial_yyvs_size
			yyvs97 := yyspecial_routines97.make (yyvsc97)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs97")
			end
			yyvsc97 := yyvsc97 + yyInitial_yyvs_size
			yyvs97 := yyspecial_routines97.resize (yyvs97, yyvsc97)
		end
	end
	yyvs97.put (yyval97, yyvsp97)
end
		end

	yy_do_action_113 is
			--|#line 862 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 862 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 862")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp101 := yyvsp101 + 1
	if yyvsp101 >= yyvsc101 then
		if yyvs101 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs101")
			end
			create yyspecial_routines101
			yyvsc101 := yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.make (yyvsc101)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs101")
			end
			yyvsc101 := yyvsc101 + yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.resize (yyvs101, yyvsc101)
		end
	end
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_114 is
			--|#line 864 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 864 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 864")
end

yyval101 := ast_factory.new_parents (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp101 := yyvsp101 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp101 >= yyvsc101 then
		if yyvs101 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs101")
			end
			create yyspecial_routines101
			yyvsc101 := yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.make (yyvsc101)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs101")
			end
			yyvsc101 := yyvsc101 + yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.resize (yyvs101, yyvsc101)
		end
	end
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_115 is
			--|#line 866 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 866 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 866")
end

			yyval101 := yyvs101.item (yyvsp101)
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_116 is
			--|#line 873 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 873 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 873")
end

			yyval101 := yyvs101.item (yyvsp101)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_117 is
			--|#line 881 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 881 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 881")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_118 is
			--|#line 888 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 888 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 888")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, Void, Void, Void)
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp99 := yyvsp99 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp99 >= yyvsc99 then
		if yyvs99 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs99")
			end
			create yyspecial_routines99
			yyvsc99 := yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.make (yyvsc99)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs99")
			end
			yyvsc99 := yyvsc99 + yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.resize (yyvs99, yyvsc99)
		end
	end
	yyvs99.put (yyval99, yyvsp99)
end
		end

	yy_do_action_119 is
			--|#line 895 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 895 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 895")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), yyvs107.item (yyvsp107), yyvs61.item (yyvsp61), yyvs87.item (yyvsp87 - 2), yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 8
	yyvsp99 := yyvsp99 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp107 := yyvsp107 -1
	yyvsp61 := yyvsp61 -1
	yyvsp87 := yyvsp87 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp99 >= yyvsc99 then
		if yyvs99 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs99")
			end
			create yyspecial_routines99
			yyvsc99 := yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.make (yyvsc99)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs99")
			end
			yyvsc99 := yyvsc99 + yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.resize (yyvs99, yyvsc99)
		end
	end
	yyvs99.put (yyval99, yyvsp99)
end
		end

	yy_do_action_120 is
			--|#line 903 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 903 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 903")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, yyvs61.item (yyvsp61), yyvs87.item (yyvsp87 - 2), yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp99 := yyvsp99 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp61 := yyvsp61 -1
	yyvsp87 := yyvsp87 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp99 >= yyvsc99 then
		if yyvs99 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs99")
			end
			create yyspecial_routines99
			yyvsc99 := yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.make (yyvsc99)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs99")
			end
			yyvsc99 := yyvsc99 + yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.resize (yyvs99, yyvsc99)
		end
	end
	yyvs99.put (yyval99, yyvsp99)
end
		end

	yy_do_action_121 is
			--|#line 910 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 910 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 910")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, yyvs87.item (yyvsp87 - 2), yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 6
	yyvsp99 := yyvsp99 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp87 := yyvsp87 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp99 >= yyvsc99 then
		if yyvs99 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs99")
			end
			create yyspecial_routines99
			yyvsc99 := yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.make (yyvsc99)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs99")
			end
			yyvsc99 := yyvsc99 + yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.resize (yyvs99, yyvsc99)
		end
	end
	yyvs99.put (yyval99, yyvsp99)
end
		end

	yy_do_action_122 is
			--|#line 917 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 917 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 917")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp99 := yyvsp99 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp87 := yyvsp87 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp99 >= yyvsc99 then
		if yyvs99 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs99")
			end
			create yyspecial_routines99
			yyvsc99 := yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.make (yyvsc99)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs99")
			end
			yyvsc99 := yyvsc99 + yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.resize (yyvs99, yyvsc99)
		end
	end
	yyvs99.put (yyval99, yyvsp99)
end
		end

	yy_do_action_123 is
			--|#line 924 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 924 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 924")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, Void, yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp99 := yyvsp99 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp87 := yyvsp87 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp99 >= yyvsc99 then
		if yyvs99 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs99")
			end
			create yyspecial_routines99
			yyvsc99 := yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.make (yyvsc99)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs99")
			end
			yyvsc99 := yyvsc99 + yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.resize (yyvs99, yyvsc99)
		end
	end
	yyvs99.put (yyval99, yyvsp99)
end
		end

	yy_do_action_124 is
			--|#line 933 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 933 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 933")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, Void, Void, yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp99 := yyvsp99 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp99 >= yyvsc99 then
		if yyvs99 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs99")
			end
			create yyspecial_routines99
			yyvsc99 := yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.make (yyvsc99)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs99")
			end
			yyvsc99 := yyvsc99 + yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.resize (yyvs99, yyvsc99)
		end
	end
	yyvs99.put (yyval99, yyvsp99)
end
		end

	yy_do_action_125 is
			--|#line 942 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 942 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 942")
end

			yyval101 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp101 := yyvsp101 + 1
	yyvsp99 := yyvsp99 -1
	if yyvsp101 >= yyvsc101 then
		if yyvs101 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs101")
			end
			create yyspecial_routines101
			yyvsc101 := yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.make (yyvsc101)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs101")
			end
			yyvsc101 := yyvsc101 + yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.resize (yyvs101, yyvsc101)
		end
	end
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_126 is
			--|#line 949 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 949 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 949")
end

			yyval101 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval101 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval101.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp101 := yyvsp101 + 1
	yyvsp100 := yyvsp100 -1
	if yyvsp101 >= yyvsc101 then
		if yyvs101 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs101")
			end
			create yyspecial_routines101
			yyvsc101 := yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.make (yyvsc101)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs101")
			end
			yyvsc101 := yyvsc101 + yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.resize (yyvs101, yyvsc101)
		end
	end
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_127 is
			--|#line 956 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 956 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 956")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp99 := yyvsp99 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_128 is
			--|#line 963 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 963 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 963")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp99 := yyvsp99 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_129 is
			--|#line 970 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 970 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 970")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval101.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_130 is
			--|#line 979 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 979 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 979")
end

			yyval101 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp101 := yyvsp101 + 1
	yyvsp99 := yyvsp99 -1
	if yyvsp101 >= yyvsc101 then
		if yyvs101 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs101")
			end
			create yyspecial_routines101
			yyvsc101 := yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.make (yyvsc101)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs101")
			end
			yyvsc101 := yyvsc101 + yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.resize (yyvs101, yyvsc101)
		end
	end
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_131 is
			--|#line 986 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 986 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 986")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp99 := yyvsp99 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_132 is
			--|#line 993 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 993 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 993")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp99 := yyvsp99 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_133 is
			--|#line 1000 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 1000 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1000")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval101.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_134 is
			--|#line 1009 "et_eiffel_parser.y"
		local
			yyval100: ET_PARENT_ITEM
		do
--|#line 1009 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1009")
end

			yyval100 := ast_factory.new_parent_semicolon (yyvs99.item (yyvsp99), yyvs22.item (yyvsp22))
			if yyval100 /= Void and yyvs99.item (yyvsp99) = Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 + 1
	yyvsp99 := yyvsp99 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp100 >= yyvsc100 then
		if yyvs100 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs100")
			end
			create yyspecial_routines100
			yyvsc100 := yyInitial_yyvs_size
			yyvs100 := yyspecial_routines100.make (yyvsc100)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs100")
			end
			yyvsc100 := yyvsc100 + yyInitial_yyvs_size
			yyvs100 := yyspecial_routines100.resize (yyvs100, yyvsc100)
		end
	end
	yyvs100.put (yyval100, yyvsp100)
end
		end

	yy_do_action_135 is
			--|#line 1016 "et_eiffel_parser.y"
		local
			yyval100: ET_PARENT_ITEM
		do
--|#line 1016 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1016")
end

			yyval100 := ast_factory.new_parent_semicolon (yyvs99.item (yyvsp99), yyvs22.item (yyvsp22))
			if yyval100 /= Void and yyvs99.item (yyvsp99) = Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 + 1
	yyvsp99 := yyvsp99 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp100 >= yyvsc100 then
		if yyvs100 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs100")
			end
			create yyspecial_routines100
			yyvsc100 := yyInitial_yyvs_size
			yyvs100 := yyspecial_routines100.make (yyvsc100)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs100")
			end
			yyvsc100 := yyvsc100 + yyInitial_yyvs_size
			yyvs100 := yyspecial_routines100.resize (yyvs100, yyvsc100)
		end
	end
	yyvs100.put (yyval100, yyvsp100)
end
		end

	yy_do_action_136 is
			--|#line 1027 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1027 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1027")
end

yyval107 := ast_factory.new_renames (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp107 := yyvsp107 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp107 >= yyvsc107 then
		if yyvs107 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs107")
			end
			create yyspecial_routines107
			yyvsc107 := yyInitial_yyvs_size
			yyvs107 := yyspecial_routines107.make (yyvsc107)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs107")
			end
			yyvsc107 := yyvsc107 + yyInitial_yyvs_size
			yyvs107 := yyspecial_routines107.resize (yyvs107, yyvsc107)
		end
	end
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_137 is
			--|#line 1029 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1029 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1029")
end

			yyval107 := yyvs107.item (yyvsp107)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp107 := yyvsp107 -1
	yyvsp2 := yyvsp2 -1
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_138 is
			--|#line 1029 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1029 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1029")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp107 := yyvsp107 + 1
	if yyvsp107 >= yyvsc107 then
		if yyvs107 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs107")
			end
			create yyspecial_routines107
			yyvsc107 := yyInitial_yyvs_size
			yyvs107 := yyspecial_routines107.make (yyvsc107)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs107")
			end
			yyvsc107 := yyvsc107 + yyInitial_yyvs_size
			yyvs107 := yyspecial_routines107.resize (yyvs107, yyvsc107)
		end
	end
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_139 is
			--|#line 1042 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1042 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1042")
end

			yyval107 := ast_factory.new_renames (last_keyword, counter_value)
			if yyval107 /= Void and yyvs106.item (yyvsp106) /= Void then
				yyval107.put_first (yyvs106.item (yyvsp106))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp107 := yyvsp107 + 1
	yyvsp106 := yyvsp106 -1
	if yyvsp107 >= yyvsc107 then
		if yyvs107 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs107")
			end
			create yyspecial_routines107
			yyvsc107 := yyInitial_yyvs_size
			yyvs107 := yyspecial_routines107.make (yyvsc107)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs107")
			end
			yyvsc107 := yyvsc107 + yyInitial_yyvs_size
			yyvs107 := yyspecial_routines107.resize (yyvs107, yyvsc107)
		end
	end
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_140 is
			--|#line 1049 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1049 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1049")
end

			yyval107 := ast_factory.new_renames (last_keyword, counter_value)
			if yyval107 /= Void and yyvs106.item (yyvsp106) /= Void then
				yyval107.put_first (yyvs106.item (yyvsp106))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp107 := yyvsp107 + 1
	yyvsp106 := yyvsp106 -1
	if yyvsp107 >= yyvsc107 then
		if yyvs107 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs107")
			end
			create yyspecial_routines107
			yyvsc107 := yyInitial_yyvs_size
			yyvs107 := yyspecial_routines107.make (yyvsc107)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs107")
			end
			yyvsc107 := yyvsc107 + yyInitial_yyvs_size
			yyvs107 := yyspecial_routines107.resize (yyvs107, yyvsc107)
		end
	end
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_141 is
			--|#line 1057 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1057 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1057")
end

			yyval107 := yyvs107.item (yyvsp107)
			if yyval107 /= Void and yyvs106.item (yyvsp106) /= Void then
				yyval107.put_first (yyvs106.item (yyvsp106))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp106 := yyvsp106 -1
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_142 is
			--|#line 1066 "et_eiffel_parser.y"
		local
			yyval106: ET_RENAME_ITEM
		do
--|#line 1066 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1066")
end

			yyval106 := ast_factory.new_rename (yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs64.item (yyvsp64))
			if yyval106 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp106 := yyvsp106 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	if yyvsp106 >= yyvsc106 then
		if yyvs106 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs106")
			end
			create yyspecial_routines106
			yyvsc106 := yyInitial_yyvs_size
			yyvs106 := yyspecial_routines106.make (yyvsc106)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs106")
			end
			yyvsc106 := yyvsc106 + yyInitial_yyvs_size
			yyvs106 := yyspecial_routines106.resize (yyvs106, yyvsc106)
		end
	end
	yyvs106.put (yyval106, yyvsp106)
end
		end

	yy_do_action_143 is
			--|#line 1075 "et_eiffel_parser.y"
		local
			yyval106: ET_RENAME_ITEM
		do
--|#line 1075 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1075")
end

			yyval106 := ast_factory.new_rename_comma (yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs64.item (yyvsp64), yyvs5.item (yyvsp5))
			if yyval106 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp106 := yyvsp106 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp106 >= yyvsc106 then
		if yyvs106 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs106")
			end
			create yyspecial_routines106
			yyvsc106 := yyInitial_yyvs_size
			yyvs106 := yyspecial_routines106.make (yyvsc106)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs106")
			end
			yyvsc106 := yyvsc106 + yyInitial_yyvs_size
			yyvs106 := yyspecial_routines106.resize (yyvs106, yyvsc106)
		end
	end
	yyvs106.put (yyval106, yyvsp106)
end
		end

	yy_do_action_144 is
			--|#line 1086 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1086 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1086")
end

yyval61 := ast_factory.new_exports (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp61 := yyvsp61 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp61 >= yyvsc61 then
		if yyvs61 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs61")
			end
			create yyspecial_routines61
			yyvsc61 := yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.make (yyvsc61)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs61")
			end
			yyvsc61 := yyvsc61 + yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.resize (yyvs61, yyvsc61)
		end
	end
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_145 is
			--|#line 1088 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1088 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1088")
end

			yyval61 := yyvs61.item (yyvsp61)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp61 := yyvsp61 -1
	yyvsp2 := yyvsp2 -1
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_146 is
			--|#line 1088 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1088 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1088")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp61 := yyvsp61 + 1
	if yyvsp61 >= yyvsc61 then
		if yyvs61 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs61")
			end
			create yyspecial_routines61
			yyvsc61 := yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.make (yyvsc61)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs61")
			end
			yyvsc61 := yyvsc61 + yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.resize (yyvs61, yyvsc61)
		end
	end
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_147 is
			--|#line 1101 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1101 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1101")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp61 := yyvsp61 + 1
	if yyvsp61 >= yyvsc61 then
		if yyvs61 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs61")
			end
			create yyspecial_routines61
			yyvsc61 := yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.make (yyvsc61)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs61")
			end
			yyvsc61 := yyvsc61 + yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.resize (yyvs61, yyvsc61)
		end
	end
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_148 is
			--|#line 1103 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1103 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1103")
end

yyval61 := yyvs61.item (yyvsp61) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_149 is
			--|#line 1107 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1107 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1107")
end

			if yyvs60.item (yyvsp60) /= Void then
				yyval61 := ast_factory.new_exports (last_keyword, counter_value + 1)
				if yyval61 /= Void then
					yyval61.put_first (yyvs60.item (yyvsp60))
				end
			else
				yyval61 := ast_factory.new_exports (last_keyword, counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp61 := yyvsp61 + 1
	yyvsp60 := yyvsp60 -1
	if yyvsp61 >= yyvsc61 then
		if yyvs61 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs61")
			end
			create yyspecial_routines61
			yyvsc61 := yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.make (yyvsc61)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs61")
			end
			yyvsc61 := yyvsc61 + yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.resize (yyvs61, yyvsc61)
		end
	end
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_150 is
			--|#line 1118 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1118 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1118")
end

			yyval61 := yyvs61.item (yyvsp61)
			if yyval61 /= Void and yyvs60.item (yyvsp60) /= Void then
				yyval61.put_first (yyvs60.item (yyvsp60))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp61 := yyvsp61 -1
	yyvsp60 := yyvsp60 -1
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_151 is
			--|#line 1118 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1118 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1118")
end

			if yyvs60.item (yyvsp60) /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp61 := yyvsp61 + 1
	if yyvsp61 >= yyvsc61 then
		if yyvs61 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs61")
			end
			create yyspecial_routines61
			yyvsc61 := yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.make (yyvsc61)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs61")
			end
			yyvsc61 := yyvsc61 + yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.resize (yyvs61, yyvsc61)
		end
	end
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_152 is
			--|#line 1133 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1133 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1133")
end

			yyval60 := ast_factory.new_all_export (yyvs44.item (yyvsp44), yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp60 := yyvsp60 + 1
	yyvsp44 := yyvsp44 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp60 >= yyvsc60 then
		if yyvs60 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs60")
			end
			create yyspecial_routines60
			yyvsc60 := yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.make (yyvsc60)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs60")
			end
			yyvsc60 := yyvsc60 + yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.resize (yyvs60, yyvsc60)
		end
	end
	yyvs60.put (yyval60, yyvsp60)
end
		end

	yy_do_action_153 is
			--|#line 1137 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1137 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1137")
end

			last_export_clients := yyvs44.item (yyvsp44)
			yyval60 := ast_factory.new_feature_export (last_export_clients, 0)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp44 := yyvsp44 -1
	if yyvsp60 >= yyvsc60 then
		if yyvs60 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs60")
			end
			create yyspecial_routines60
			yyvsc60 := yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.make (yyvsc60)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs60")
			end
			yyvsc60 := yyvsc60 + yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.resize (yyvs60, yyvsc60)
		end
	end
	yyvs60.put (yyval60, yyvsp60)
end
		end

	yy_do_action_154 is
			--|#line 1142 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1142 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1142")
end

			yyval60 := yyvs68.item (yyvsp68)
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 -1
	yyvsp68 := yyvsp68 -1
	yyvs60.put (yyval60, yyvsp60)
end
		end

	yy_do_action_155 is
			--|#line 1142 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1142 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1142")
end

			last_export_clients := yyvs44.item (yyvsp44)
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp60 := yyvsp60 + 1
	if yyvsp60 >= yyvsc60 then
		if yyvs60 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs60")
			end
			create yyspecial_routines60
			yyvsc60 := yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.make (yyvsc60)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs60")
			end
			yyvsc60 := yyvsc60 + yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.resize (yyvs60, yyvsc60)
		end
	end
	yyvs60.put (yyval60, yyvsp60)
end
		end

	yy_do_action_156 is
			--|#line 1152 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1152 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1152")
end

yyval60 := ast_factory.new_null_export (yyvs22.item (yyvsp22)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp60 >= yyvsc60 then
		if yyvs60 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs60")
			end
			create yyspecial_routines60
			yyvsc60 := yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.make (yyvsc60)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs60")
			end
			yyvsc60 := yyvsc60 + yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.resize (yyvs60, yyvsc60)
		end
	end
	yyvs60.put (yyval60, yyvsp60)
end
		end

	yy_do_action_157 is
			--|#line 1156 "et_eiffel_parser.y"
		local
			yyval68: ET_FEATURE_EXPORT
		do
--|#line 1156 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1156")
end

			if yyvs69.item (yyvsp69) /= Void then
				yyval68 := ast_factory.new_feature_export (last_export_clients, counter_value + 1)
				if yyval68 /= Void then
					yyval68.put_first (yyvs69.item (yyvsp69))
				end
			else
				yyval68 := ast_factory.new_feature_export (last_export_clients, counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp68 := yyvsp68 + 1
	yyvsp69 := yyvsp69 -1
	if yyvsp68 >= yyvsc68 then
		if yyvs68 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs68")
			end
			create yyspecial_routines68
			yyvsc68 := yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.make (yyvsc68)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs68")
			end
			yyvsc68 := yyvsc68 + yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.resize (yyvs68, yyvsc68)
		end
	end
	yyvs68.put (yyval68, yyvsp68)
end
		end

	yy_do_action_158 is
			--|#line 1167 "et_eiffel_parser.y"
		local
			yyval68: ET_FEATURE_EXPORT
		do
--|#line 1167 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1167")
end

			yyval68 := ast_factory.new_feature_export (last_export_clients, counter_value)
			if yyval68 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval68.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp68 := yyvsp68 + 1
	yyvsp70 := yyvsp70 -1
	if yyvsp68 >= yyvsc68 then
		if yyvs68 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs68")
			end
			create yyspecial_routines68
			yyvsc68 := yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.make (yyvsc68)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs68")
			end
			yyvsc68 := yyvsc68 + yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.resize (yyvs68, yyvsc68)
		end
	end
	yyvs68.put (yyval68, yyvsp68)
end
		end

	yy_do_action_159 is
			--|#line 1175 "et_eiffel_parser.y"
		local
			yyval68: ET_FEATURE_EXPORT
		do
--|#line 1175 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1175")
end

			yyval68 := yyvs68.item (yyvsp68)
			if yyval68 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval68.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyvs68.put (yyval68, yyvsp68)
end
		end

	yy_do_action_160 is
			--|#line 1186 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1186 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1186")
end

			yyval44 := yyvs44.item (yyvsp44)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 -1
	yyvsp5 := yyvsp5 -1
	yyvs44.put (yyval44, yyvsp44)
end
		end

	yy_do_action_161 is
			--|#line 1186 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1186 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1186")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp44 := yyvsp44 + 1
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
		end

	yy_do_action_162 is
			--|#line 1197 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1197 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1197")
end

yyval44 := ast_factory.new_none_clients (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp44 := yyvsp44 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
		end

	yy_do_action_163 is
			--|#line 1201 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1201 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1201")
end

			yyval44 := ast_factory.new_clients (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval44 /= Void and yyvs43.item (yyvsp43) /= Void then
				yyval44.put_first (yyvs43.item (yyvsp43))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp44 := yyvsp44 + 1
	yyvsp43 := yyvsp43 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
		end

	yy_do_action_164 is
			--|#line 1208 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1208 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1208")
end

			yyval44 := ast_factory.new_clients (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval44 /= Void and yyvs43.item (yyvsp43) /= Void then
				yyval44.put_first (yyvs43.item (yyvsp43))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp44 := yyvsp44 + 1
	yyvsp43 := yyvsp43 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp44 >= yyvsc44 then
		if yyvs44 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs44")
			end
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs44")
			end
			yyvsc44 := yyvsc44 + yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.resize (yyvs44, yyvsc44)
		end
	end
	yyvs44.put (yyval44, yyvsp44)
end
		end

	yy_do_action_165 is
			--|#line 1216 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1216 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1216")
end

			yyval44 := yyvs44.item (yyvsp44)
			if yyval44 /= Void and yyvs43.item (yyvsp43) /= Void then
				yyval44.put_first (yyvs43.item (yyvsp43))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp43 := yyvsp43 -1
	yyvs44.put (yyval44, yyvsp44)
end
		end

	yy_do_action_166 is
			--|#line 1223 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1223 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1223")
end

			yyval44 := yyvs44.item (yyvsp44)
			if yyval44 /= Void and yyvs43.item (yyvsp43) /= Void then
				yyval44.put_first (yyvs43.item (yyvsp43))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp43 := yyvsp43 -1
	yyvs44.put (yyval44, yyvsp44)
end
		end

	yy_do_action_167 is
			--|#line 1233 "et_eiffel_parser.y"
		local
			yyval43: ET_CLASS_NAME_ITEM
		do
--|#line 1233 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1233")
end

			yyval43 := yyvs13.item (yyvsp13)
			if yyval43 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp43 := yyvsp43 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
		end

	yy_do_action_168 is
			--|#line 1242 "et_eiffel_parser.y"
		local
			yyval43: ET_CLASS_NAME_ITEM
		do
--|#line 1242 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1242")
end

			yyval43 := ast_factory.new_class_name_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5))
			if yyval43 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp43 := yyvsp43 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp43 >= yyvsc43 then
		if yyvs43 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs43")
			end
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs43")
			end
			yyvsc43 := yyvsc43 + yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.resize (yyvs43, yyvsc43)
		end
	end
	yyvs43.put (yyval43, yyvsp43)
end
		end

	yy_do_action_169 is
			--|#line 1253 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1253 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1253")
end

yyval87 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_170 is
			--|#line 1255 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1255 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1255")
end

			yyval87 := yyvs87.item (yyvsp87)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 -1
	yyvsp2 := yyvsp2 -1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_171 is
			--|#line 1255 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1255 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1255")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp87 := yyvsp87 + 1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_172 is
			--|#line 1268 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1268 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1268")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp87 := yyvsp87 + 1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_173 is
			--|#line 1270 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1270 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1270")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_174 is
			--|#line 1274 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1274 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1274")
end

yyval87 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_175 is
			--|#line 1276 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1276 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1276")
end

			yyval87 := yyvs87.item (yyvsp87)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 -1
	yyvsp2 := yyvsp2 -1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_176 is
			--|#line 1276 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1276 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1276")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp87 := yyvsp87 + 1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_177 is
			--|#line 1289 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1289 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1289")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp87 := yyvsp87 + 1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_178 is
			--|#line 1291 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1291 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1291")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_179 is
			--|#line 1295 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1295 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1295")
end

yyval87 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_180 is
			--|#line 1297 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1297 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1297")
end

			yyval87 := yyvs87.item (yyvsp87)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 -1
	yyvsp2 := yyvsp2 -1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_181 is
			--|#line 1297 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1297 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1297")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp87 := yyvsp87 + 1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_182 is
			--|#line 1310 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1310 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1310")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp87 := yyvsp87 + 1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_183 is
			--|#line 1312 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1312 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1312")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_184 is
			--|#line 1316 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1316 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1316")
end

			if yyvs69.item (yyvsp69) /= Void then
				yyval87 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value + 1)
				if yyval87 /= Void then
					yyval87.put_first (yyvs69.item (yyvsp69))
				end
			else
				yyval87 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp69 := yyvsp69 -1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_185 is
			--|#line 1327 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1327 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1327")
end

			yyval87 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			if yyval87 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval87.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp70 := yyvsp70 -1
	if yyvsp87 >= yyvsc87 then
		if yyvs87 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs87")
			end
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs87")
			end
			yyvsc87 := yyvsc87 + yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.resize (yyvs87, yyvsc87)
		end
	end
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_186 is
			--|#line 1335 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1335 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1335")
end

			yyval87 := yyvs87.item (yyvsp87)
			if yyval87 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval87.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_187 is
			--|#line 1344 "et_eiffel_parser.y"
		local
			yyval70: ET_FEATURE_NAME_ITEM
		do
--|#line 1344 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1344")
end

			yyval70 := ast_factory.new_feature_name_comma (yyvs69.item (yyvsp69), yyvs5.item (yyvsp5))
			if yyval70 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
		end

	yy_do_action_188 is
			--|#line 1355 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1355 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1355")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp56 := yyvsp56 + 1
	if yyvsp56 >= yyvsc56 then
		if yyvs56 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs56")
			end
			create yyspecial_routines56
			yyvsc56 := yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.make (yyvsc56)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs56")
			end
			yyvsc56 := yyvsc56 + yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.resize (yyvs56, yyvsc56)
		end
	end
	yyvs56.put (yyval56, yyvsp56)
end
		end

	yy_do_action_189 is
			--|#line 1357 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1357 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1357")
end

			yyval56 := yyvs56.item (yyvsp56)
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs56.put (yyval56, yyvsp56)
end
		end

	yy_do_action_190 is
			--|#line 1364 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1364 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1364")
end

			yyval56 := yyvs56.item (yyvsp56)
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs56.put (yyval56, yyvsp56)
end
		end

	yy_do_action_191 is
			--|#line 1371 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1371 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1371")
end

			if yyvs55.item (yyvsp55) /= Void then
				yyval56 := ast_factory.new_creators (counter_value + 1)
				if yyval56 /= Void then
					yyval56.put_first (yyvs55.item (yyvsp55))
				end
			else
				yyval56 := ast_factory.new_creators (counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp55 := yyvsp55 -1
	if yyvsp56 >= yyvsc56 then
		if yyvs56 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs56")
			end
			create yyspecial_routines56
			yyvsc56 := yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.make (yyvsc56)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs56")
			end
			yyvsc56 := yyvsc56 + yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.resize (yyvs56, yyvsc56)
		end
	end
	yyvs56.put (yyval56, yyvsp56)
end
		end

	yy_do_action_192 is
			--|#line 1382 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1382 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1382")
end

			yyval56 := yyvs56.item (yyvsp56)
			if yyval56 /= Void and yyvs55.item (yyvsp55) /= Void then
				yyval56.put_first (yyvs55.item (yyvsp55))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp56 := yyvsp56 -1
	yyvsp55 := yyvsp55 -1
	yyvs56.put (yyval56, yyvsp56)
end
		end

	yy_do_action_193 is
			--|#line 1382 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1382 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1382")
end

			if yyvs55.item (yyvsp55) /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp56 := yyvsp56 + 1
	if yyvsp56 >= yyvsc56 then
		if yyvs56 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs56")
			end
			create yyspecial_routines56
			yyvsc56 := yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.make (yyvsc56)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs56")
			end
			yyvsc56 := yyvsc56 + yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.resize (yyvs56, yyvsc56)
		end
	end
	yyvs56.put (yyval56, yyvsp56)
end
		end

	yy_do_action_194 is
			--|#line 1397 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1397 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1397")
end

yyval55 := ast_factory.new_creator (yyvs2.item (yyvsp2), yyvs44.item (yyvsp44), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp55 := yyvsp55 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp44 := yyvsp44 -1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_195 is
			--|#line 1399 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1399 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1399")
end

yyval55 := ast_factory.new_creator (yyvs2.item (yyvsp2), ast_factory.new_any_clients (yyvs2.item (yyvsp2)), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_196 is
			--|#line 1401 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1401")
end

			yyval55 := yyvs55.item (yyvsp55)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp55 := yyvsp55 -1
	yyvsp2 := yyvsp2 -1
	yyvsp44 := yyvsp44 -1
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_197 is
			--|#line 1401 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1401")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := yyvs44.item (yyvsp44)
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp55 := yyvsp55 + 1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_198 is
			--|#line 1413 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1413 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1413")
end

			yyval55 := yyvs55.item (yyvsp55)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp55 := yyvsp55 -1
	yyvsp2 := yyvsp2 -1
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_199 is
			--|#line 1413 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1413 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1413")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := ast_factory.new_any_clients (last_keyword)
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp55 := yyvsp55 + 1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_200 is
			--|#line 1425 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1425 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1425")
end

yyval55 := ast_factory.new_creator (yyvs2.item (yyvsp2), yyvs44.item (yyvsp44), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp55 := yyvsp55 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp44 := yyvsp44 -1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_201 is
			--|#line 1427 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1427 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1427")
end

yyval55 := ast_factory.new_creator (yyvs2.item (yyvsp2), ast_factory.new_any_clients (yyvs2.item (yyvsp2)), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_202 is
			--|#line 1429 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1429 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1429")
end

			yyval55 := yyvs55.item (yyvsp55)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp55 := yyvsp55 -1
	yyvsp2 := yyvsp2 -1
	yyvsp44 := yyvsp44 -1
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_203 is
			--|#line 1429 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1429 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1429")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := yyvs44.item (yyvsp44)
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp55 := yyvsp55 + 1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_204 is
			--|#line 1441 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1441 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1441")
end

			yyval55 := yyvs55.item (yyvsp55)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp55 := yyvsp55 -1
	yyvsp2 := yyvsp2 -1
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_205 is
			--|#line 1441 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1441 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1441")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := ast_factory.new_any_clients (last_keyword)
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp55 := yyvsp55 + 1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_206 is
			--|#line 1455 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1455 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1455")
end

			if yyvs13.item (yyvsp13) /= Void then
				yyval55 := ast_factory.new_creator (last_keyword, last_clients, counter_value + 1)
				if yyval55 /= Void then
					yyval55.put_first (yyvs13.item (yyvsp13))
				end
			else
				yyval55 := ast_factory.new_creator (last_keyword, last_clients, counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_207 is
			--|#line 1466 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1466 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1466")
end

			yyval55 := ast_factory.new_creator (last_keyword, last_clients, counter_value)
			if yyval55 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval55.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp70 := yyvsp70 -1
	if yyvsp55 >= yyvsc55 then
		if yyvs55 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs55")
			end
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs55")
			end
			yyvsc55 := yyvsc55 + yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.resize (yyvs55, yyvsc55)
		end
	end
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_208 is
			--|#line 1474 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1474 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1474")
end

			yyval55 := yyvs55.item (yyvsp55)
			if yyval55 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval55.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_209 is
			--|#line 1483 "et_eiffel_parser.y"
		local
			yyval70: ET_FEATURE_NAME_ITEM
		do
--|#line 1483 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1483")
end

			yyval70 := ast_factory.new_feature_name_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5))
			if yyval70 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp70 >= yyvsc70 then
		if yyvs70 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs70")
			end
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs70")
			end
			yyvsc70 := yyvsc70 + yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.resize (yyvs70, yyvsc70)
		end
	end
	yyvs70.put (yyval70, yyvsp70)
end
		end

	yy_do_action_210 is
			--|#line 1494 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1494 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1494")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp53 := yyvsp53 + 1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
		end

	yy_do_action_211 is
			--|#line 1496 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1496 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1496")
end

yyval53 := yyvs53.item (yyvsp53) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs53.put (yyval53, yyvsp53)
end
		end

	yy_do_action_212 is
			--|#line 1500 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1500 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1500")
end

			yyval53 := yyvs53.item (yyvsp53)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp53 := yyvsp53 -1
	yyvsp2 := yyvsp2 -1
	yyvs53.put (yyval53, yyvsp53)
end
		end

	yy_do_action_213 is
			--|#line 1500 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1500 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1500")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp53 := yyvsp53 + 1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
		end

	yy_do_action_214 is
			--|#line 1513 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1513 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1513")
end

			yyval53 := ast_factory.new_convert_features (last_keyword, counter_value + 1)
			if yyval53 /= Void and yyvs51.item (yyvsp51) /= Void then
				yyval53.put_first (yyvs51.item (yyvsp51))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp51 := yyvsp51 -1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
		end

	yy_do_action_215 is
			--|#line 1520 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1520 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1520")
end

			yyval53 := ast_factory.new_convert_features (last_keyword, counter_value)
			if yyval53 /= Void and yyvs52.item (yyvsp52) /= Void then
				yyval53.put_first (yyvs52.item (yyvsp52))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp52 := yyvsp52 -1
	if yyvsp53 >= yyvsc53 then
		if yyvs53 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs53")
			end
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs53")
			end
			yyvsc53 := yyvsc53 + yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.resize (yyvs53, yyvsc53)
		end
	end
	yyvs53.put (yyval53, yyvsp53)
end
		end

	yy_do_action_216 is
			--|#line 1527 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1527 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1527")
end

			yyval53 := yyvs53.item (yyvsp53)
			if yyval53 /= Void and yyvs52.item (yyvsp52) /= Void then
				yyval53.put_first (yyvs52.item (yyvsp52))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp52 := yyvsp52 -1
	yyvs53.put (yyval53, yyvsp53)
end
		end

	yy_do_action_217 is
			--|#line 1536 "et_eiffel_parser.y"
		local
			yyval52: ET_CONVERT_FEATURE_ITEM
		do
--|#line 1536 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1536")
end

			yyval52 := ast_factory.new_convert_feature_comma (yyvs51.item (yyvsp51), yyvs5.item (yyvsp5))
			if yyval52 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp52 := yyvsp52 + 1
	yyvsp51 := yyvsp51 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp52 >= yyvsc52 then
		if yyvs52 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs52")
			end
			create yyspecial_routines52
			yyvsc52 := yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.make (yyvsc52)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs52")
			end
			yyvsc52 := yyvsc52 + yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.resize (yyvs52, yyvsc52)
		end
	end
	yyvs52.put (yyval52, yyvsp52)
end
		end

	yy_do_action_218 is
			--|#line 1545 "et_eiffel_parser.y"
		local
			yyval51: ET_CONVERT_FEATURE
		do
--|#line 1545 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1545")
end

			yyval51 := ast_factory.new_convert_function (yyvs69.item (yyvsp69), yyvs5.item (yyvsp5), yyvs112.item (yyvsp112))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp51 := yyvsp51 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	if yyvsp51 >= yyvsc51 then
		if yyvs51 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs51")
			end
			create yyspecial_routines51
			yyvsc51 := yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.make (yyvsc51)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs51")
			end
			yyvsc51 := yyvsc51 + yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.resize (yyvs51, yyvsc51)
		end
	end
	yyvs51.put (yyval51, yyvsp51)
end
		end

	yy_do_action_219 is
			--|#line 1549 "et_eiffel_parser.y"
		local
			yyval51: ET_CONVERT_FEATURE
		do
--|#line 1549 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1549")
end

			yyval51 := ast_factory.new_convert_procedure (yyvs69.item (yyvsp69), yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp51 := yyvsp51 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
	if yyvsp51 >= yyvsc51 then
		if yyvs51 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs51")
			end
			create yyspecial_routines51
			yyvsc51 := yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.make (yyvsc51)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs51")
			end
			yyvsc51 := yyvsc51 + yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.resize (yyvs51, yyvsc51)
		end
	end
	yyvs51.put (yyval51, yyvsp51)
end
		end

	yy_do_action_220 is
			--|#line 1555 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE_LIST
		do
--|#line 1555 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1555")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp112 >= yyvsc112 then
		if yyvs112 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs112")
			end
			create yyspecial_routines112
			yyvsc112 := yyInitial_yyvs_size
			yyvs112 := yyspecial_routines112.make (yyvsc112)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs112")
			end
			yyvsc112 := yyvsc112 + yyInitial_yyvs_size
			yyvs112 := yyspecial_routines112.resize (yyvs112, yyvsc112)
		end
	end
	yyvs112.put (yyval112, yyvsp112)
end
		end

	yy_do_action_221 is
			--|#line 1557 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE_LIST
		do
--|#line 1557 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1557")
end

			yyval112 := yyvs112.item (yyvsp112)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 -1
	yyvsp5 := yyvsp5 -1
	yyvs112.put (yyval112, yyvsp112)
end
		end

	yy_do_action_222 is
			--|#line 1557 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE_LIST
		do
--|#line 1557 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1557")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp112 := yyvsp112 + 1
	if yyvsp112 >= yyvsc112 then
		if yyvs112 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs112")
			end
			create yyspecial_routines112
			yyvsc112 := yyInitial_yyvs_size
			yyvs112 := yyspecial_routines112.make (yyvsc112)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs112")
			end
			yyvsc112 := yyvsc112 + yyInitial_yyvs_size
			yyvs112 := yyspecial_routines112.resize (yyvs112, yyvsc112)
		end
	end
	yyvs112.put (yyval112, yyvsp112)
end
		end

	yy_do_action_223 is
			--|#line 1570 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE_LIST
		do
--|#line 1570 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1570")
end

			if yyvs110.item (yyvsp110) /= Void then
				yyval112 := ast_factory.new_convert_types (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval112 /= Void then
					yyval112.put_first (yyvs110.item (yyvsp110))
				end
			else
				yyval112 := ast_factory.new_convert_types (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp110 := yyvsp110 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp112 >= yyvsc112 then
		if yyvs112 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs112")
			end
			create yyspecial_routines112
			yyvsc112 := yyInitial_yyvs_size
			yyvs112 := yyspecial_routines112.make (yyvsc112)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs112")
			end
			yyvsc112 := yyvsc112 + yyInitial_yyvs_size
			yyvs112 := yyspecial_routines112.resize (yyvs112, yyvsc112)
		end
	end
	yyvs112.put (yyval112, yyvsp112)
end
		end

	yy_do_action_224 is
			--|#line 1581 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE_LIST
		do
--|#line 1581 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1581")
end

			yyval112 := yyvs112.item (yyvsp112)
			if yyval112 /= Void and yyvs111.item (yyvsp111) /= Void then
				yyval112.put_first (yyvs111.item (yyvsp111))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp111 := yyvsp111 -1
	yyvs112.put (yyval112, yyvsp112)
end
		end

	yy_do_action_225 is
			--|#line 1590 "et_eiffel_parser.y"
		local
			yyval111: ET_TYPE_ITEM
		do
--|#line 1590 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1590")
end

			yyval111 := ast_factory.new_type_comma (yyvs110.item (yyvsp110), yyvs5.item (yyvsp5))
			if yyval111 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp111 := yyvsp111 + 1
	yyvsp110 := yyvsp110 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp111 >= yyvsc111 then
		if yyvs111 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs111")
			end
			create yyspecial_routines111
			yyvsc111 := yyInitial_yyvs_size
			yyvs111 := yyspecial_routines111.make (yyvsc111)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs111")
			end
			yyvsc111 := yyvsc111 + yyInitial_yyvs_size
			yyvs111 := yyspecial_routines111.resize (yyvs111, yyvsc111)
		end
	end
	yyvs111.put (yyval111, yyvsp111)
end
		end

	yy_do_action_226 is
			--|#line 1601 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1601 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1601")
end

			-- $$ := Void
			set_class_features
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp67 := yyvsp67 + 1
	if yyvsp67 >= yyvsc67 then
		if yyvs67 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs67")
			end
			create yyspecial_routines67
			yyvsc67 := yyInitial_yyvs_size
			yyvs67 := yyspecial_routines67.make (yyvsc67)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs67")
			end
			yyvsc67 := yyvsc67 + yyInitial_yyvs_size
			yyvs67 := yyspecial_routines67.resize (yyvs67, yyvsc67)
		end
	end
	yyvs67.put (yyval67, yyvsp67)
end
		end

	yy_do_action_227 is
			--|#line 1606 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1606 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1606")
end

yyval67 := yyvs67.item (yyvsp67) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs67.put (yyval67, yyvsp67)
end
		end

	yy_do_action_228 is
			--|#line 1610 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1610 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1610")
end

			yyval67 := yyvs67.item (yyvsp67)
			set_class_features
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs67.put (yyval67, yyvsp67)
end
		end

	yy_do_action_229 is
			--|#line 1618 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1618 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1618")
end

			yyval67 := ast_factory.new_feature_clauses (counter_value)
			if yyval67 /= Void and yyvs66.item (yyvsp66) /= Void then
				yyval67.put_first (yyvs66.item (yyvsp66))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp67 := yyvsp67 + 1
	yyvsp66 := yyvsp66 -1
	if yyvsp67 >= yyvsc67 then
		if yyvs67 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs67")
			end
			create yyspecial_routines67
			yyvsc67 := yyInitial_yyvs_size
			yyvs67 := yyspecial_routines67.make (yyvsc67)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs67")
			end
			yyvsc67 := yyvsc67 + yyInitial_yyvs_size
			yyvs67 := yyspecial_routines67.resize (yyvs67, yyvsc67)
		end
	end
	yyvs67.put (yyval67, yyvsp67)
end
		end

	yy_do_action_230 is
			--|#line 1625 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1625 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1625")
end

			yyval67 := yyvs67.item (yyvsp67)
			if yyval67 /= Void and yyvs66.item (yyvsp66) /= Void then
				yyval67.put_first (yyvs66.item (yyvsp66))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp66 := yyvsp66 -1
	yyvs67.put (yyval67, yyvsp67)
end
		end

	yy_do_action_231 is
			--|#line 1634 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1634 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1634")
end

			yyval66 := last_feature_clause
			if yyval66 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs66.put (yyval66, yyvsp66)
end
		end

	yy_do_action_232 is
			--|#line 1641 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1641 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1641")
end

			yyval66 := last_feature_clause
			if yyval66 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs66.put (yyval66, yyvsp66)
end
		end

	yy_do_action_233 is
			--|#line 1650 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1650 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1650")
end

			last_clients := yyvs44.item (yyvsp44)
			last_feature_clause := ast_factory.new_feature_clause (yyvs2.item (yyvsp2), last_clients)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp66 := yyvsp66 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp44 := yyvsp44 -1
	if yyvsp66 >= yyvsc66 then
		if yyvs66 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs66")
			end
			create yyspecial_routines66
			yyvsc66 := yyInitial_yyvs_size
			yyvs66 := yyspecial_routines66.make (yyvsc66)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs66")
			end
			yyvsc66 := yyvsc66 + yyInitial_yyvs_size
			yyvs66 := yyspecial_routines66.resize (yyvs66, yyvsc66)
		end
	end
	yyvs66.put (yyval66, yyvsp66)
end
		end

	yy_do_action_234 is
			--|#line 1655 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1655 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1655")
end

			last_clients := ast_factory.new_any_clients (yyvs2.item (yyvsp2))
			last_feature_clause := ast_factory.new_feature_clause (yyvs2.item (yyvsp2), last_clients)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp66 := yyvsp66 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp66 >= yyvsc66 then
		if yyvs66 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs66")
			end
			create yyspecial_routines66
			yyvsc66 := yyInitial_yyvs_size
			yyvs66 := yyspecial_routines66.make (yyvsc66)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs66")
			end
			yyvsc66 := yyvsc66 + yyInitial_yyvs_size
			yyvs66 := yyspecial_routines66.resize (yyvs66, yyvsc66)
		end
	end
	yyvs66.put (yyval66, yyvsp66)
end
		end

	yy_do_action_235 is
			--|#line 1662 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1662 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1662")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp105 := yyvsp105 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_236 is
			--|#line 1663 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1663 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1663")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp104 := yyvsp104 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_237 is
			--|#line 1664 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1664 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1664")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp105 := yyvsp105 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_238 is
			--|#line 1665 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1665 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1665")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp104 := yyvsp104 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_239 is
			--|#line 1670 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1670 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1670")
end

			yyval105 := yyvs105.item (yyvsp105)
			register_query (yyval105)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_240 is
			--|#line 1675 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1675 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1675")
end

			yyval105 := yyvs105.item (yyvsp105)
			yyval105.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_query (yyval105)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_241 is
			--|#line 1681 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1681 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1681")
end

			yyval105 := new_query_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs105.item (yyvsp105))
			register_query_synonym (yyval105)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_242 is
			--|#line 1686 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1686 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1686")
end

			yyval105 := new_query_synonym (yyvs64.item (yyvsp64), yyvs105.item (yyvsp105))
			register_query_synonym (yyval105)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_243 is
			--|#line 1692 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1692 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1692")
end

			yyval105 := new_query_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs105.item (yyvsp105))
			yyval105.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_query_synonym (yyval105)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_244 is
			--|#line 1698 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1698 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1698")
end

			yyval105 := new_query_synonym (yyvs64.item (yyvsp64), yyvs105.item (yyvsp105))
			yyval105.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_query_synonym (yyval105)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_245 is
			--|#line 1707 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1707 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1707")
end

			yyval104 := yyvs104.item (yyvsp104)
			register_procedure (yyval104)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_246 is
			--|#line 1712 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1712 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1712")
end

			yyval104 := yyvs104.item (yyvsp104)
			yyval104.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_procedure (yyval104)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_247 is
			--|#line 1718 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1718 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1718")
end

			yyval104 := new_procedure_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs104.item (yyvsp104))
			register_procedure_synonym (yyval104)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_248 is
			--|#line 1723 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1723 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1723")
end

			yyval104 := new_procedure_synonym (yyvs64.item (yyvsp64), yyvs104.item (yyvsp104))
			register_procedure_synonym (yyval104)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 -1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_249 is
			--|#line 1729 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1729 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1729")
end

			yyval104 := new_procedure_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs104.item (yyvsp104))
			yyval104.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_procedure_synonym (yyval104)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_250 is
			--|#line 1735 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1735 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1735")
end

			yyval104 := new_procedure_synonym (yyvs64.item (yyvsp64), yyvs104.item (yyvsp104))
			yyval104.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_procedure_synonym (yyval104)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_251 is
			--|#line 1744 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1744 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1744")
end

yyval105 := ast_factory.new_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_252 is
			--|#line 1746 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1746 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1746")
end

yyval105 := ast_factory.new_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_253 is
			--|#line 1748 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1748 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1748")
end

yyval105 := ast_factory.new_constant_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2), yyvs46.item (yyvsp46), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -1
	yyvsp46 := yyvsp46 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_254 is
			--|#line 1750 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1750 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1750")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_constant_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs5.item (yyvsp5), yyvs46.item (yyvsp46), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp46 := yyvsp46 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_255 is
			--|#line 1758 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1758 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1758")
end

yyval105 := ast_factory.new_unique_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -2
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_256 is
			--|#line 1760 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1760 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1760")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_unique_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs5.item (yyvsp5), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_257 is
			--|#line 1768 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1768 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1768")
end

yyval105 := ast_factory.new_do_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 14
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_258 is
			--|#line 1771 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1771 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1771")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_do_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 13
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_259 is
			--|#line 1780 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1780 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1780")
end

yyval105 := ast_factory.new_do_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 15
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_260 is
			--|#line 1784 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1784 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1784")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_do_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 14
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_261 is
			--|#line 1794 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1794 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1794")
end

yyval105 := ast_factory.new_once_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 14
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_262 is
			--|#line 1797 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1797 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1797")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_once_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 13
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_263 is
			--|#line 1806 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1806 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1806")
end

yyval105 := ast_factory.new_once_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 15
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_264 is
			--|#line 1810 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1810 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1810")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_once_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 14
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_265 is
			--|#line 1820 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1820 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1820")
end

yyval105 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 12
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_266 is
			--|#line 1822 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1822 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1822")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 11
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -2
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_267 is
			--|#line 1830 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1830 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1830")
end

yyval105 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 13
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_268 is
			--|#line 1833 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1833 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1833")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 12
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -2
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_269 is
			--|#line 1842 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1842 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1842")
end

yyval105 := new_external_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 14
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_270 is
			--|#line 1845 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1845 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1845")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := new_external_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 13
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_271 is
			--|#line 1854 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1854 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1854")
end

yyval105 := new_external_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 15
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_272 is
			--|#line 1858 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1858 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1858")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := new_external_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 14
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp105 >= yyvsc105 then
		if yyvs105 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs105")
			end
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs105")
			end
			yyvsc105 := yyvsc105 + yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.resize (yyvs105, yyvsc105)
		end
	end
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_273 is
			--|#line 1870 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1870 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1870")
end

yyval104 := ast_factory.new_do_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 11
	yyvsp104 := yyvsp104 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp104 >= yyvsc104 then
		if yyvs104 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs104")
			end
			create yyspecial_routines104
			yyvsc104 := yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.make (yyvsc104)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs104")
			end
			yyvsc104 := yyvsc104 + yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.resize (yyvs104, yyvsc104)
		end
	end
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_274 is
			--|#line 1873 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1873 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1873")
end

yyval104 := ast_factory.new_do_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 12
	yyvsp104 := yyvsp104 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp104 >= yyvsc104 then
		if yyvs104 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs104")
			end
			create yyspecial_routines104
			yyvsc104 := yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.make (yyvsc104)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs104")
			end
			yyvsc104 := yyvsc104 + yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.resize (yyvs104, yyvsc104)
		end
	end
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_275 is
			--|#line 1877 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1877 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1877")
end

yyval104 := ast_factory.new_once_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 11
	yyvsp104 := yyvsp104 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp104 >= yyvsc104 then
		if yyvs104 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs104")
			end
			create yyspecial_routines104
			yyvsc104 := yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.make (yyvsc104)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs104")
			end
			yyvsc104 := yyvsc104 + yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.resize (yyvs104, yyvsc104)
		end
	end
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_276 is
			--|#line 1880 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1880 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1880")
end

yyval104 := ast_factory.new_once_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 12
	yyvsp104 := yyvsp104 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp104 >= yyvsc104 then
		if yyvs104 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs104")
			end
			create yyspecial_routines104
			yyvsc104 := yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.make (yyvsc104)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs104")
			end
			yyvsc104 := yyvsc104 + yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.resize (yyvs104, yyvsc104)
		end
	end
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_277 is
			--|#line 1884 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1884 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1884")
end

yyval104 := ast_factory.new_deferred_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 9
	yyvsp104 := yyvsp104 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp104 >= yyvsc104 then
		if yyvs104 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs104")
			end
			create yyspecial_routines104
			yyvsc104 := yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.make (yyvsc104)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs104")
			end
			yyvsc104 := yyvsc104 + yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.resize (yyvs104, yyvsc104)
		end
	end
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_278 is
			--|#line 1886 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1886 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1886")
end

yyval104 := ast_factory.new_deferred_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 10
	yyvsp104 := yyvsp104 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp104 >= yyvsc104 then
		if yyvs104 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs104")
			end
			create yyspecial_routines104
			yyvsc104 := yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.make (yyvsc104)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs104")
			end
			yyvsc104 := yyvsc104 + yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.resize (yyvs104, yyvsc104)
		end
	end
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_279 is
			--|#line 1889 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1889 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1889")
end

yyval104 := new_external_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 11
	yyvsp104 := yyvsp104 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp104 >= yyvsc104 then
		if yyvs104 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs104")
			end
			create yyspecial_routines104
			yyvsc104 := yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.make (yyvsc104)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs104")
			end
			yyvsc104 := yyvsc104 + yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.resize (yyvs104, yyvsc104)
		end
	end
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_280 is
			--|#line 1892 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1892 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1892")
end

yyval104 := new_external_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 12
	yyvsp104 := yyvsp104 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp97 := yyvsp97 -1
	yyvsp103 := yyvsp103 -1
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp104 >= yyvsc104 then
		if yyvs104 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs104")
			end
			create yyspecial_routines104
			yyvsc104 := yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.make (yyvsc104)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs104")
			end
			yyvsc104 := yyvsc104 + yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.resize (yyvs104, yyvsc104)
		end
	end
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_281 is
			--|#line 1898 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 1898 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1898")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval2 := Void
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		if yyvs2 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs2")
			end
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs2")
			end
			yyvsc2 := yyvsc2 + yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
		end
	end
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_282 is
			--|#line 1906 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 1906 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1906")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_283 is
			--|#line 1910 "et_eiffel_parser.y"
		local
			yyval22: ET_SEMICOLON_SYMBOL
		do
--|#line 1910 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1910")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp22 := yyvsp22 + 1
	if yyvsp22 >= yyvsc22 then
		if yyvs22 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs22")
			end
			create yyspecial_routines22
			yyvsc22 := yyInitial_yyvs_size
			yyvs22 := yyspecial_routines22.make (yyvsc22)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs22")
			end
			yyvsc22 := yyvsc22 + yyInitial_yyvs_size
			yyvs22 := yyspecial_routines22.resize (yyvs22, yyvsc22)
		end
	end
	yyvs22.put (yyval22, yyvsp22)
end
		end

	yy_do_action_284 is
			--|#line 1912 "et_eiffel_parser.y"
		local
			yyval22: ET_SEMICOLON_SYMBOL
		do
--|#line 1912 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1912")
end

yyval22 := yyvs22.item (yyvsp22) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs22.put (yyval22, yyvsp22)
end
		end

	yy_do_action_285 is
			--|#line 1916 "et_eiffel_parser.y"
		local
			yyval65: ET_EXTERNAL_ALIAS
		do
--|#line 1916 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1916")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp65 := yyvsp65 + 1
	if yyvsp65 >= yyvsc65 then
		if yyvs65 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs65")
			end
			create yyspecial_routines65
			yyvsc65 := yyInitial_yyvs_size
			yyvs65 := yyspecial_routines65.make (yyvsc65)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs65")
			end
			yyvsc65 := yyvsc65 + yyInitial_yyvs_size
			yyvs65 := yyspecial_routines65.resize (yyvs65, yyvsc65)
		end
	end
	yyvs65.put (yyval65, yyvsp65)
end
		end

	yy_do_action_286 is
			--|#line 1918 "et_eiffel_parser.y"
		local
			yyval65: ET_EXTERNAL_ALIAS
		do
--|#line 1918 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1918")
end

yyval65 := ast_factory.new_external_alias (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp65 := yyvsp65 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp65 >= yyvsc65 then
		if yyvs65 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs65")
			end
			create yyspecial_routines65
			yyvsc65 := yyInitial_yyvs_size
			yyvs65 := yyspecial_routines65.make (yyvsc65)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs65")
			end
			yyvsc65 := yyvsc65 + yyInitial_yyvs_size
			yyvs65 := yyspecial_routines65.resize (yyvs65, yyvsc65)
		end
	end
	yyvs65.put (yyval65, yyvsp65)
end
		end

	yy_do_action_287 is
			--|#line 1922 "et_eiffel_parser.y"
		local
			yyval33: ET_ASSIGNER
		do
--|#line 1922 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1922")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp33 := yyvsp33 + 1
	if yyvsp33 >= yyvsc33 then
		if yyvs33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyvs33.put (yyval33, yyvsp33)
end
		end

	yy_do_action_288 is
			--|#line 1924 "et_eiffel_parser.y"
		local
			yyval33: ET_ASSIGNER
		do
--|#line 1924 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1924")
end

yyval33 := ast_factory.new_assigner (yyvs2.item (yyvsp2), yyvs69.item (yyvsp69)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp69 := yyvsp69 -1
	if yyvsp33 >= yyvsc33 then
		if yyvs33 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs33")
			end
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs33")
			end
			yyvsc33 := yyvsc33 + yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.resize (yyvs33, yyvsc33)
		end
	end
	yyvs33.put (yyval33, yyvsp33)
end
		end

	yy_do_action_289 is
			--|#line 1930 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1930 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1930")
end

yyval69 := yyvs13.item (yyvsp13) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_290 is
			--|#line 1932 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1932 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1932")
end

yyval69 := ast_factory.new_prefix_not_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_291 is
			--|#line 1934 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1934 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1934")
end

yyval69 := ast_factory.new_prefix_plus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_292 is
			--|#line 1936 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1936 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1936")
end

yyval69 := ast_factory.new_prefix_minus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_293 is
			--|#line 1938 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1938 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1938")
end

yyval69 := ast_factory.new_prefix_free_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_294 is
			--|#line 1940 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1940 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1940")
end

yyval69 := ast_factory.new_infix_plus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_295 is
			--|#line 1942 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1942 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1942")
end

yyval69 := ast_factory.new_infix_minus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_296 is
			--|#line 1944 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1944 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1944")
end

yyval69 := ast_factory.new_infix_times_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_297 is
			--|#line 1946 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1946 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1946")
end

yyval69 := ast_factory.new_infix_divide_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_298 is
			--|#line 1948 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1948 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1948")
end

yyval69 := ast_factory.new_infix_div_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_299 is
			--|#line 1950 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1950 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1950")
end

yyval69 := ast_factory.new_infix_mod_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_300 is
			--|#line 1952 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1952 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1952")
end

yyval69 := ast_factory.new_infix_power_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_301 is
			--|#line 1954 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1954 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1954")
end

yyval69 := ast_factory.new_infix_lt_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_302 is
			--|#line 1956 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1956 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1956")
end

yyval69 := ast_factory.new_infix_le_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_303 is
			--|#line 1958 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1958 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1958")
end

yyval69 := ast_factory.new_infix_gt_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_304 is
			--|#line 1960 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1960 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1960")
end

yyval69 := ast_factory.new_infix_ge_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_305 is
			--|#line 1962 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1962 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1962")
end

yyval69 := ast_factory.new_infix_and_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_306 is
			--|#line 1964 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1964 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1964")
end

yyval69 := ast_factory.new_infix_and_then_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_307 is
			--|#line 1966 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1966 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1966")
end

yyval69 := ast_factory.new_infix_or_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_308 is
			--|#line 1968 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1968 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1968")
end

yyval69 := ast_factory.new_infix_or_else_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_309 is
			--|#line 1970 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1970 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1970")
end

yyval69 := ast_factory.new_infix_implies_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_310 is
			--|#line 1972 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1972 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1972")
end

yyval69 := ast_factory.new_infix_xor_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_311 is
			--|#line 1974 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1974 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1974")
end

yyval69 := ast_factory.new_infix_free_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_312 is
			--|#line 1977 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1977 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1977")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_313 is
			--|#line 1979 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1979 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1979")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_314 is
			--|#line 1981 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1981 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1981")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_315 is
			--|#line 1983 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1983 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1983")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_316 is
			--|#line 1985 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1985 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1985")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_317 is
			--|#line 1987 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1987 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1987")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_318 is
			--|#line 1989 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1989 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1989")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_319 is
			--|#line 1991 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1991 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1991")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_320 is
			--|#line 1993 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1993 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1993")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_321 is
			--|#line 1995 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1995 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1995")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_322 is
			--|#line 1997 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1997 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1997")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_323 is
			--|#line 1999 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 1999 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1999")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_324 is
			--|#line 2001 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2001 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2001")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_325 is
			--|#line 2003 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2003 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2003")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_326 is
			--|#line 2005 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2005 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2005")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_327 is
			--|#line 2007 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2007 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2007")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_328 is
			--|#line 2009 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2009 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2009")
end

yyval69 := new_invalid_infix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_329 is
			--|#line 2011 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2011 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2011")
end

yyval69 := new_invalid_infix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp69 >= yyvsc69 then
		if yyvs69 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs69")
			end
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs69")
			end
			yyvsc69 := yyvsc69 + yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.resize (yyvs69, yyvsc69)
		end
	end
	yyvs69.put (yyval69, yyvsp69)
end
		end

	yy_do_action_330 is
			--|#line 2015 "et_eiffel_parser.y"
		local
			yyval64: ET_EXTENDED_FEATURE_NAME
		do
--|#line 2015 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2015")
end

yyval64 := yyvs69.item (yyvsp69) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp69 := yyvsp69 -1
	if yyvsp64 >= yyvsc64 then
		if yyvs64 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs64")
			end
			create yyspecial_routines64
			yyvsc64 := yyInitial_yyvs_size
			yyvs64 := yyspecial_routines64.make (yyvsc64)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs64")
			end
			yyvsc64 := yyvsc64 + yyInitial_yyvs_size
			yyvs64 := yyspecial_routines64.resize (yyvs64, yyvsc64)
		end
	end
	yyvs64.put (yyval64, yyvsp64)
end
		end

	yy_do_action_331 is
			--|#line 2017 "et_eiffel_parser.y"
		local
			yyval64: ET_EXTENDED_FEATURE_NAME
		do
--|#line 2017 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2017")
end

yyval64 := ast_factory.new_aliased_feature_name (yyvs13.item (yyvsp13), yyvs32.item (yyvsp32)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp32 := yyvsp32 -1
	if yyvsp64 >= yyvsc64 then
		if yyvs64 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs64")
			end
			create yyspecial_routines64
			yyvsc64 := yyInitial_yyvs_size
			yyvs64 := yyspecial_routines64.make (yyvsc64)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs64")
			end
			yyvsc64 := yyvsc64 + yyInitial_yyvs_size
			yyvs64 := yyspecial_routines64.resize (yyvs64, yyvsc64)
		end
	end
	yyvs64.put (yyval64, yyvsp64)
end
		end

	yy_do_action_332 is
			--|#line 2021 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2021 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2021")
end

yyval32 := ast_factory.new_alias_not_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_333 is
			--|#line 2023 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2023 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2023")
end

yyval32 := ast_factory.new_alias_plus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_334 is
			--|#line 2025 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2025 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2025")
end

yyval32 := ast_factory.new_alias_minus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_335 is
			--|#line 2027 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2027 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2027")
end

yyval32 := ast_factory.new_alias_times_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_336 is
			--|#line 2029 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2029 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2029")
end

yyval32 := ast_factory.new_alias_divide_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_337 is
			--|#line 2031 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2031 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2031")
end

yyval32 := ast_factory.new_alias_div_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_338 is
			--|#line 2033 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2033 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2033")
end

yyval32 := ast_factory.new_alias_mod_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_339 is
			--|#line 2035 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2035 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2035")
end

yyval32 := ast_factory.new_alias_power_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_340 is
			--|#line 2037 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2037 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2037")
end

yyval32 := ast_factory.new_alias_lt_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_341 is
			--|#line 2039 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2039 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2039")
end

yyval32 := ast_factory.new_alias_le_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_342 is
			--|#line 2041 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2041 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2041")
end

yyval32 := ast_factory.new_alias_gt_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_343 is
			--|#line 2043 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2043 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2043")
end

yyval32 := ast_factory.new_alias_ge_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_344 is
			--|#line 2045 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2045 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2045")
end

yyval32 := ast_factory.new_alias_and_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_345 is
			--|#line 2047 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2047 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2047")
end

yyval32 := ast_factory.new_alias_and_then_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_346 is
			--|#line 2049 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2049 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2049")
end

yyval32 := ast_factory.new_alias_or_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_347 is
			--|#line 2051 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2051 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2051")
end

yyval32 := ast_factory.new_alias_or_else_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_348 is
			--|#line 2053 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2053 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2053")
end

yyval32 := ast_factory.new_alias_implies_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_349 is
			--|#line 2055 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2055 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2055")
end

yyval32 := ast_factory.new_alias_xor_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_350 is
			--|#line 2057 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2057 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2057")
end

yyval32 := ast_factory.new_alias_dotdot_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_351 is
			--|#line 2059 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2059 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2059")
end

yyval32 := ast_factory.new_alias_free_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_352 is
			--|#line 2061 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2061 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2061")
end

yyval32 := ast_factory.new_alias_bracket_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_353 is
			--|#line 2064 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2064 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2064")
end

yyval32 := new_invalid_alias_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp32 := yyvsp32 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp32 >= yyvsc32 then
		if yyvs32 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs32")
			end
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs32")
			end
			yyvsc32 := yyvsc32 + yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.resize (yyvs32, yyvsc32)
		end
	end
	yyvs32.put (yyval32, yyvsp32)
end
		end

	yy_do_action_354 is
			--|#line 2070 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2070 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2070")
end

yyval73 := new_formal_arguments (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp73 := yyvsp73 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp73 >= yyvsc73 then
		if yyvs73 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs73")
			end
			create yyspecial_routines73
			yyvsc73 := yyInitial_yyvs_size
			yyvs73 := yyspecial_routines73.make (yyvsc73)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs73")
			end
			yyvsc73 := yyvsc73 + yyInitial_yyvs_size
			yyvs73 := yyspecial_routines73.resize (yyvs73, yyvsc73)
		end
	end
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_355 is
			--|#line 2072 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2072 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2072")
end

			yyval73 := yyvs73.item (yyvsp73)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_356 is
			--|#line 2080 "et_eiffel_parser.y"
		local
			yyval5: ET_SYMBOL
		do
--|#line 2080 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2080")
end

			-- Needed to solve ambiguity when parsing:
			--   agent (a).f
			--   agent (a: A) do ... end
			yyval5 := yyvs5.item (yyvsp5)
			add_symbol (yyval5)
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs5.put (yyval5, yyvsp5)
end
		end

	yy_do_action_357 is
			--|#line 2091 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2091 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2091")
end

			yyval73 := new_formal_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval73 /= Void and yyvs72.item (yyvsp72) /= Void then
				yyval73.put_first (yyvs72.item (yyvsp72))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp73 := yyvsp73 + 1
	yyvsp72 := yyvsp72 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp73 >= yyvsc73 then
		if yyvs73 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs73")
			end
			create yyspecial_routines73
			yyvsc73 := yyInitial_yyvs_size
			yyvs73 := yyspecial_routines73.make (yyvsc73)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs73")
			end
			yyvsc73 := yyvsc73 + yyInitial_yyvs_size
			yyvs73 := yyspecial_routines73.resize (yyvs73, yyvsc73)
		end
	end
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_358 is
			--|#line 2098 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2098 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2098")
end

			yyval73 := new_formal_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval73 /= Void and yyvs72.item (yyvsp72) /= Void then
				yyval73.put_first (yyvs72.item (yyvsp72))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp73 := yyvsp73 + 1
	yyvsp72 := yyvsp72 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp73 >= yyvsc73 then
		if yyvs73 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs73")
			end
			create yyspecial_routines73
			yyvsc73 := yyInitial_yyvs_size
			yyvs73 := yyspecial_routines73.make (yyvsc73)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs73")
			end
			yyvsc73 := yyvsc73 + yyInitial_yyvs_size
			yyvs73 := yyspecial_routines73.resize (yyvs73, yyvsc73)
		end
	end
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_359 is
			--|#line 2105 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2105 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2105")
end

			yyval73 := yyvs73.item (yyvsp73)
			if yyval73 /= Void and yyvs71.item (yyvsp71) /= Void then
				if not yyval73.is_empty then
					yyvs71.item (yyvsp71).set_declared_type (yyval73.first.type)
					yyval73.put_first (yyvs71.item (yyvsp71))
				end
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 -1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_360 is
			--|#line 2115 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2115 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2115")
end

			-- TODO: Syntax error
			yyval73 := yyvs73.item (yyvsp73)
			if yyval73 /= Void and yyvs71.item (yyvsp71) /= Void then
				if not yyval73.is_empty then
					yyvs71.item (yyvsp71).set_declared_type (yyval73.first.type)
					yyval73.put_first (yyvs71.item (yyvsp71))
				end
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 -1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_361 is
			--|#line 2126 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2126 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2126")
end

			yyval73 := yyvs73.item (yyvsp73)
			if yyval73 /= Void and yyvs72.item (yyvsp72) /= Void then
				yyval73.put_first (yyvs72.item (yyvsp72))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 -1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_362 is
			--|#line 2133 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2133 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2133")
end

			yyval73 := yyvs73.item (yyvsp73)
			if yyval73 /= Void and yyvs72.item (yyvsp72) /= Void then
				yyval73.put_first (yyvs72.item (yyvsp72))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 -1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_363 is
			--|#line 2142 "et_eiffel_parser.y"
		local
			yyval71: ET_FORMAL_ARGUMENT
		do
--|#line 2142 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2142")
end

			yyval71 := ast_factory.new_formal_comma_argument (ast_factory.new_argument_name_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), dummy_type)
			if yyval71 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp71 >= yyvsc71 then
		if yyvs71 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs71")
			end
			create yyspecial_routines71
			yyvsc71 := yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.make (yyvsc71)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs71")
			end
			yyvsc71 := yyvsc71 + yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.resize (yyvs71, yyvsc71)
		end
	end
	yyvs71.put (yyval71, yyvsp71)
end
		end

	yy_do_action_364 is
			--|#line 2151 "et_eiffel_parser.y"
		local
			yyval71: ET_FORMAL_ARGUMENT
		do
--|#line 2151 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2151")
end

			yyval71 := ast_factory.new_formal_comma_argument (yyvs13.item (yyvsp13), dummy_type)
			if yyval71 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp71 := yyvsp71 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp71 >= yyvsc71 then
		if yyvs71 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs71")
			end
			create yyspecial_routines71
			yyvsc71 := yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.make (yyvsc71)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs71")
			end
			yyvsc71 := yyvsc71 + yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.resize (yyvs71, yyvsc71)
		end
	end
	yyvs71.put (yyval71, yyvsp71)
end
		end

	yy_do_action_365 is
			--|#line 2160 "et_eiffel_parser.y"
		local
			yyval72: ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2160 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2160")
end

			yyval72 := ast_factory.new_formal_argument (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)))
			if yyval72 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp72 := yyvsp72 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	if yyvsp72 >= yyvsc72 then
		if yyvs72 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs72")
			end
			create yyspecial_routines72
			yyvsc72 := yyInitial_yyvs_size
			yyvs72 := yyspecial_routines72.make (yyvsc72)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs72")
			end
			yyvsc72 := yyvsc72 + yyInitial_yyvs_size
			yyvs72 := yyspecial_routines72.resize (yyvs72, yyvsc72)
		end
	end
	yyvs72.put (yyval72, yyvsp72)
end
		end

	yy_do_action_366 is
			--|#line 2169 "et_eiffel_parser.y"
		local
			yyval72: ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2169 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2169")
end

			yyval72 := ast_factory.new_formal_argument_semicolon (ast_factory.new_formal_argument (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110))), yyvs22.item (yyvsp22))
			if yyval72 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp72 := yyvsp72 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp72 >= yyvsc72 then
		if yyvs72 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs72")
			end
			create yyspecial_routines72
			yyvsc72 := yyInitial_yyvs_size
			yyvs72 := yyspecial_routines72.make (yyvsc72)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs72")
			end
			yyvsc72 := yyvsc72 + yyInitial_yyvs_size
			yyvs72 := yyspecial_routines72.resize (yyvs72, yyvsc72)
		end
	end
	yyvs72.put (yyval72, yyvsp72)
end
		end

	yy_do_action_367 is
			--|#line 2180 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2180 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2180")
end

			yyval91 := Void
			last_local_variables_stack.force (Void)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp91 := yyvsp91 + 1
	if yyvsp91 >= yyvsc91 then
		if yyvs91 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs91")
			end
			create yyspecial_routines91
			yyvsc91 := yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.make (yyvsc91)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs91")
			end
			yyvsc91 := yyvsc91 + yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.resize (yyvs91, yyvsc91)
		end
	end
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_368 is
			--|#line 2185 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2185 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2185")
end

yyval91 := new_local_variables (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp91 := yyvsp91 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp91 >= yyvsc91 then
		if yyvs91 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs91")
			end
			create yyspecial_routines91
			yyvsc91 := yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.make (yyvsc91)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs91")
			end
			yyvsc91 := yyvsc91 + yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.resize (yyvs91, yyvsc91)
		end
	end
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_369 is
			--|#line 2187 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2187 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2187")
end

			yyval91 := yyvs91.item (yyvsp91)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp91 := yyvsp91 -1
	yyvsp2 := yyvsp2 -1
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_370 is
			--|#line 2187 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2187 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2187")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp91 := yyvsp91 + 1
	if yyvsp91 >= yyvsc91 then
		if yyvs91 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs91")
			end
			create yyspecial_routines91
			yyvsc91 := yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.make (yyvsc91)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs91")
			end
			yyvsc91 := yyvsc91 + yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.resize (yyvs91, yyvsc91)
		end
	end
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_371 is
			--|#line 2200 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2200 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2200")
end

			yyval91 := new_local_variables (last_keyword, counter_value)
			if yyvs90.item (yyvsp90) /= Void then
				yyval91.put_first (yyvs90.item (yyvsp90))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp91 := yyvsp91 + 1
	yyvsp90 := yyvsp90 -1
	if yyvsp91 >= yyvsc91 then
		if yyvs91 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs91")
			end
			create yyspecial_routines91
			yyvsc91 := yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.make (yyvsc91)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs91")
			end
			yyvsc91 := yyvsc91 + yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.resize (yyvs91, yyvsc91)
		end
	end
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_372 is
			--|#line 2207 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2207 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2207")
end

			yyval91 := new_local_variables (last_keyword, counter_value)
			if yyvs90.item (yyvsp90) /= Void then
				yyval91.put_first (yyvs90.item (yyvsp90))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp91 := yyvsp91 + 1
	yyvsp90 := yyvsp90 -1
	if yyvsp91 >= yyvsc91 then
		if yyvs91 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs91")
			end
			create yyspecial_routines91
			yyvsc91 := yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.make (yyvsc91)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs91")
			end
			yyvsc91 := yyvsc91 + yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.resize (yyvs91, yyvsc91)
		end
	end
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_373 is
			--|#line 2214 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2214 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2214")
end

			yyval91 := yyvs91.item (yyvsp91)
			if yyval91 /= Void and yyvs89.item (yyvsp89) /= Void then
				if not yyval91.is_empty then
					yyvs89.item (yyvsp89).set_declared_type (yyval91.first.type)
					yyval91.put_first (yyvs89.item (yyvsp89))
				end
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp89 := yyvsp89 -1
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_374 is
			--|#line 2224 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2224 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2224")
end

			-- TODO: Syntax error
			yyval91 := yyvs91.item (yyvsp91)
			if yyval91 /= Void and yyvs89.item (yyvsp89) /= Void then
				if not yyval91.is_empty then
					yyvs89.item (yyvsp89).set_declared_type (yyval91.first.type)
					yyval91.put_first (yyvs89.item (yyvsp89))
				end
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp89 := yyvsp89 -1
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_375 is
			--|#line 2235 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2235 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2235")
end

			yyval91 := yyvs91.item (yyvsp91)
			if yyval91 /= Void and yyvs90.item (yyvsp90) /= Void then
				yyval91.put_first (yyvs90.item (yyvsp90))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp90 := yyvsp90 -1
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_376 is
			--|#line 2242 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2242 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2242")
end

			yyval91 := yyvs91.item (yyvsp91)
			if yyval91 /= Void and yyvs90.item (yyvsp90) /= Void then
				yyval91.put_first (yyvs90.item (yyvsp90))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp90 := yyvsp90 -1
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_377 is
			--|#line 2251 "et_eiffel_parser.y"
		local
			yyval89: ET_LOCAL_VARIABLE
		do
--|#line 2251 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2251")
end

			yyval89 := ast_factory.new_local_comma_variable (ast_factory.new_local_name_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), dummy_type)
			if yyval89 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp89 := yyvsp89 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp89 >= yyvsc89 then
		if yyvs89 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs89")
			end
			create yyspecial_routines89
			yyvsc89 := yyInitial_yyvs_size
			yyvs89 := yyspecial_routines89.make (yyvsc89)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs89")
			end
			yyvsc89 := yyvsc89 + yyInitial_yyvs_size
			yyvs89 := yyspecial_routines89.resize (yyvs89, yyvsc89)
		end
	end
	yyvs89.put (yyval89, yyvsp89)
end
		end

	yy_do_action_378 is
			--|#line 2260 "et_eiffel_parser.y"
		local
			yyval89: ET_LOCAL_VARIABLE
		do
--|#line 2260 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2260")
end

			yyval89 := ast_factory.new_local_comma_variable (yyvs13.item (yyvsp13), dummy_type)
			if yyval89 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp89 := yyvsp89 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp89 >= yyvsc89 then
		if yyvs89 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs89")
			end
			create yyspecial_routines89
			yyvsc89 := yyInitial_yyvs_size
			yyvs89 := yyspecial_routines89.make (yyvsc89)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs89")
			end
			yyvsc89 := yyvsc89 + yyInitial_yyvs_size
			yyvs89 := yyspecial_routines89.resize (yyvs89, yyvsc89)
		end
	end
	yyvs89.put (yyval89, yyvsp89)
end
		end

	yy_do_action_379 is
			--|#line 2269 "et_eiffel_parser.y"
		local
			yyval90: ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2269 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2269")
end

			yyval90 := ast_factory.new_local_variable (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)))
			if yyval90 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	if yyvsp90 >= yyvsc90 then
		if yyvs90 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs90")
			end
			create yyspecial_routines90
			yyvsc90 := yyInitial_yyvs_size
			yyvs90 := yyspecial_routines90.make (yyvsc90)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs90")
			end
			yyvsc90 := yyvsc90 + yyInitial_yyvs_size
			yyvs90 := yyspecial_routines90.resize (yyvs90, yyvsc90)
		end
	end
	yyvs90.put (yyval90, yyvsp90)
end
		end

	yy_do_action_380 is
			--|#line 2278 "et_eiffel_parser.y"
		local
			yyval90: ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2278 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2278")
end

			yyval90 := ast_factory.new_local_variable_semicolon (ast_factory.new_local_variable (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110))), yyvs22.item (yyvsp22))
			if yyval90 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp90 := yyvsp90 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp90 >= yyvsc90 then
		if yyvs90 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs90")
			end
			create yyspecial_routines90
			yyvsc90 := yyInitial_yyvs_size
			yyvs90 := yyspecial_routines90.make (yyvsc90)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs90")
			end
			yyvsc90 := yyvsc90 + yyInitial_yyvs_size
			yyvs90 := yyspecial_routines90.resize (yyvs90, yyvsc90)
		end
	end
	yyvs90.put (yyval90, yyvsp90)
end
		end

	yy_do_action_381 is
			--|#line 2289 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2289 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2289")
end

add_expression_assertion (yyvs62.item (yyvsp62), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp62 := yyvsp62 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_382 is
			--|#line 2291 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2291 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2291")
end

add_expression_assertion (yyvs62.item (yyvsp62), yyvs22.item (yyvsp22)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp62 := yyvsp62 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_383 is
			--|#line 2293 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2293 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2293")
end

add_tagged_assertion (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_384 is
			--|#line 2295 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2295 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2295")
end

add_tagged_assertion (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyvs22.item (yyvsp22)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_385 is
			--|#line 2297 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2297 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2297")
end

add_expression_assertion (yyvs62.item (yyvsp62), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_386 is
			--|#line 2299 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2299 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2299")
end

add_expression_assertion (yyvs62.item (yyvsp62), yyvs22.item (yyvsp22)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp22 := yyvsp22 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_387 is
			--|#line 2301 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2301 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2301")
end

add_tagged_assertion (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_388 is
			--|#line 2303 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2303 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2303")
end

add_tagged_assertion (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyvs22.item (yyvsp22)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp22 := yyvsp22 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_389 is
			--|#line 2307 "et_eiffel_parser.y"
		local
			yyval103: ET_PRECONDITIONS
		do
--|#line 2307 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2307")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp103 := yyvsp103 + 1
	if yyvsp103 >= yyvsc103 then
		if yyvs103 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs103")
			end
			create yyspecial_routines103
			yyvsc103 := yyInitial_yyvs_size
			yyvs103 := yyspecial_routines103.make (yyvsc103)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs103")
			end
			yyvsc103 := yyvsc103 + yyInitial_yyvs_size
			yyvs103 := yyspecial_routines103.resize (yyvs103, yyvsc103)
		end
	end
	yyvs103.put (yyval103, yyvsp103)
end
		end

	yy_do_action_390 is
			--|#line 2309 "et_eiffel_parser.y"
		local
			yyval103: ET_PRECONDITIONS
		do
--|#line 2309 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2309")
end

yyval103 := new_preconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp103 := yyvsp103 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp103 >= yyvsc103 then
		if yyvs103 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs103")
			end
			create yyspecial_routines103
			yyvsc103 := yyInitial_yyvs_size
			yyvs103 := yyspecial_routines103.make (yyvsc103)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs103")
			end
			yyvsc103 := yyvsc103 + yyInitial_yyvs_size
			yyvs103 := yyspecial_routines103.resize (yyvs103, yyvsc103)
		end
	end
	yyvs103.put (yyval103, yyvsp103)
end
		end

	yy_do_action_391 is
			--|#line 2311 "et_eiffel_parser.y"
		local
			yyval103: ET_PRECONDITIONS
		do
--|#line 2311 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2311")
end

yyval103 := new_preconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp103 := yyvsp103 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp103 >= yyvsc103 then
		if yyvs103 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs103")
			end
			create yyspecial_routines103
			yyvsc103 := yyInitial_yyvs_size
			yyvs103 := yyspecial_routines103.make (yyvsc103)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs103")
			end
			yyvsc103 := yyvsc103 + yyInitial_yyvs_size
			yyvs103 := yyspecial_routines103.resize (yyvs103, yyvsc103)
		end
	end
	yyvs103.put (yyval103, yyvsp103)
end
		end

	yy_do_action_392 is
			--|#line 2313 "et_eiffel_parser.y"
		local
			yyval103: ET_PRECONDITIONS
		do
--|#line 2313 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2313")
end

yyval103 := new_preconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp103 := yyvsp103 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	if yyvsp103 >= yyvsc103 then
		if yyvs103 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs103")
			end
			create yyspecial_routines103
			yyvsc103 := yyInitial_yyvs_size
			yyvs103 := yyspecial_routines103.make (yyvsc103)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs103")
			end
			yyvsc103 := yyvsc103 + yyInitial_yyvs_size
			yyvs103 := yyspecial_routines103.resize (yyvs103, yyvsc103)
		end
	end
	yyvs103.put (yyval103, yyvsp103)
end
		end

	yy_do_action_393 is
			--|#line 2315 "et_eiffel_parser.y"
		local
			yyval103: ET_PRECONDITIONS
		do
--|#line 2315 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2315")
end

yyval103 := new_preconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp103 := yyvsp103 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp103 >= yyvsc103 then
		if yyvs103 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs103")
			end
			create yyspecial_routines103
			yyvsc103 := yyInitial_yyvs_size
			yyvs103 := yyspecial_routines103.make (yyvsc103)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs103")
			end
			yyvsc103 := yyvsc103 + yyInitial_yyvs_size
			yyvs103 := yyspecial_routines103.resize (yyvs103, yyvsc103)
		end
	end
	yyvs103.put (yyval103, yyvsp103)
end
		end

	yy_do_action_394 is
			--|#line 2319 "et_eiffel_parser.y"
		local
			yyval102: ET_POSTCONDITIONS
		do
--|#line 2319 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2319")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp102 := yyvsp102 + 1
	if yyvsp102 >= yyvsc102 then
		if yyvs102 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs102")
			end
			create yyspecial_routines102
			yyvsc102 := yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.make (yyvsc102)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs102")
			end
			yyvsc102 := yyvsc102 + yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.resize (yyvs102, yyvsc102)
		end
	end
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_395 is
			--|#line 2321 "et_eiffel_parser.y"
		local
			yyval102: ET_POSTCONDITIONS
		do
--|#line 2321 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2321")
end

yyval102 := new_postconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp102 := yyvsp102 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp102 >= yyvsc102 then
		if yyvs102 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs102")
			end
			create yyspecial_routines102
			yyvsc102 := yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.make (yyvsc102)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs102")
			end
			yyvsc102 := yyvsc102 + yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.resize (yyvs102, yyvsc102)
		end
	end
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_396 is
			--|#line 2323 "et_eiffel_parser.y"
		local
			yyval102: ET_POSTCONDITIONS
		do
--|#line 2323 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2323")
end

yyval102 := new_postconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp102 := yyvsp102 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp102 >= yyvsc102 then
		if yyvs102 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs102")
			end
			create yyspecial_routines102
			yyvsc102 := yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.make (yyvsc102)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs102")
			end
			yyvsc102 := yyvsc102 + yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.resize (yyvs102, yyvsc102)
		end
	end
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_397 is
			--|#line 2325 "et_eiffel_parser.y"
		local
			yyval102: ET_POSTCONDITIONS
		do
--|#line 2325 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2325")
end

yyval102 := new_postconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp102 := yyvsp102 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	if yyvsp102 >= yyvsc102 then
		if yyvs102 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs102")
			end
			create yyspecial_routines102
			yyvsc102 := yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.make (yyvsc102)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs102")
			end
			yyvsc102 := yyvsc102 + yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.resize (yyvs102, yyvsc102)
		end
	end
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_398 is
			--|#line 2327 "et_eiffel_parser.y"
		local
			yyval102: ET_POSTCONDITIONS
		do
--|#line 2327 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2327")
end

yyval102 := new_postconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp102 := yyvsp102 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp102 >= yyvsc102 then
		if yyvs102 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs102")
			end
			create yyspecial_routines102
			yyvsc102 := yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.make (yyvsc102)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs102")
			end
			yyvsc102 := yyvsc102 + yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.resize (yyvs102, yyvsc102)
		end
	end
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_399 is
			--|#line 2331 "et_eiffel_parser.y"
		local
			yyval86: ET_INVARIANTS
		do
--|#line 2331 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2331")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp86 := yyvsp86 + 1
	if yyvsp86 >= yyvsc86 then
		if yyvs86 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs86")
			end
			create yyspecial_routines86
			yyvsc86 := yyInitial_yyvs_size
			yyvs86 := yyspecial_routines86.make (yyvsc86)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs86")
			end
			yyvsc86 := yyvsc86 + yyInitial_yyvs_size
			yyvs86 := yyspecial_routines86.resize (yyvs86, yyvsc86)
		end
	end
	yyvs86.put (yyval86, yyvsp86)
end
		end

	yy_do_action_400 is
			--|#line 2333 "et_eiffel_parser.y"
		local
			yyval86: ET_INVARIANTS
		do
--|#line 2333 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2333")
end

yyval86 := yyvs86.item (yyvsp86) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs86.put (yyval86, yyvsp86)
end
		end

	yy_do_action_401 is
			--|#line 2337 "et_eiffel_parser.y"
		local
			yyval86: ET_INVARIANTS
		do
--|#line 2337 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2337")
end

yyval86 := new_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp86 := yyvsp86 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp86 >= yyvsc86 then
		if yyvs86 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs86")
			end
			create yyspecial_routines86
			yyvsc86 := yyInitial_yyvs_size
			yyvs86 := yyspecial_routines86.make (yyvsc86)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs86")
			end
			yyvsc86 := yyvsc86 + yyInitial_yyvs_size
			yyvs86 := yyspecial_routines86.resize (yyvs86, yyvsc86)
		end
	end
	yyvs86.put (yyval86, yyvsp86)
end
		end

	yy_do_action_402 is
			--|#line 2339 "et_eiffel_parser.y"
		local
			yyval86: ET_INVARIANTS
		do
--|#line 2339 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2339")
end

yyval86 := new_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp86 := yyvsp86 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	if yyvsp86 >= yyvsc86 then
		if yyvs86 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs86")
			end
			create yyspecial_routines86
			yyvsc86 := yyInitial_yyvs_size
			yyvs86 := yyspecial_routines86.make (yyvsc86)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs86")
			end
			yyvsc86 := yyvsc86 + yyInitial_yyvs_size
			yyvs86 := yyspecial_routines86.resize (yyvs86, yyvsc86)
		end
	end
	yyvs86.put (yyval86, yyvsp86)
end
		end

	yy_do_action_403 is
			--|#line 2343 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2343 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2343")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp92 := yyvsp92 + 1
	if yyvsp92 >= yyvsc92 then
		if yyvs92 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs92")
			end
			create yyspecial_routines92
			yyvsc92 := yyInitial_yyvs_size
			yyvs92 := yyspecial_routines92.make (yyvsc92)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs92")
			end
			yyvsc92 := yyvsc92 + yyInitial_yyvs_size
			yyvs92 := yyspecial_routines92.resize (yyvs92, yyvsc92)
		end
	end
	yyvs92.put (yyval92, yyvsp92)
end
		end

	yy_do_action_404 is
			--|#line 2345 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2345 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2345")
end

yyval92 := yyvs92.item (yyvsp92) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs92.put (yyval92, yyvsp92)
end
		end

	yy_do_action_405 is
			--|#line 2349 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2349 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2349")
end

yyval92 := new_loop_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp92 := yyvsp92 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp92 >= yyvsc92 then
		if yyvs92 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs92")
			end
			create yyspecial_routines92
			yyvsc92 := yyInitial_yyvs_size
			yyvs92 := yyspecial_routines92.make (yyvsc92)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs92")
			end
			yyvsc92 := yyvsc92 + yyInitial_yyvs_size
			yyvs92 := yyspecial_routines92.resize (yyvs92, yyvsc92)
		end
	end
	yyvs92.put (yyval92, yyvsp92)
end
		end

	yy_do_action_406 is
			--|#line 2351 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2351 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2351")
end

yyval92 := new_loop_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp92 := yyvsp92 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	if yyvsp92 >= yyvsc92 then
		if yyvs92 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs92")
			end
			create yyspecial_routines92
			yyvsc92 := yyInitial_yyvs_size
			yyvs92 := yyspecial_routines92.make (yyvsc92)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs92")
			end
			yyvsc92 := yyvsc92 + yyInitial_yyvs_size
			yyvs92 := yyspecial_routines92.resize (yyvs92, yyvsc92)
		end
	end
	yyvs92.put (yyval92, yyvsp92)
end
		end

	yy_do_action_407 is
			--|#line 2355 "et_eiffel_parser.y"
		local
			yyval113: ET_VARIANT
		do
--|#line 2355 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2355")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp113 := yyvsp113 + 1
	if yyvsp113 >= yyvsc113 then
		if yyvs113 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs113")
			end
			create yyspecial_routines113
			yyvsc113 := yyInitial_yyvs_size
			yyvs113 := yyspecial_routines113.make (yyvsc113)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs113")
			end
			yyvsc113 := yyvsc113 + yyInitial_yyvs_size
			yyvs113 := yyspecial_routines113.resize (yyvs113, yyvsc113)
		end
	end
	yyvs113.put (yyval113, yyvsp113)
end
		end

	yy_do_action_408 is
			--|#line 2357 "et_eiffel_parser.y"
		local
			yyval113: ET_VARIANT
		do
--|#line 2357 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2357")
end

yyval113 := ast_factory.new_variant (yyvs2.item (yyvsp2), Void, Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp113 := yyvsp113 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp113 >= yyvsc113 then
		if yyvs113 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs113")
			end
			create yyspecial_routines113
			yyvsc113 := yyInitial_yyvs_size
			yyvs113 := yyspecial_routines113.make (yyvsc113)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs113")
			end
			yyvsc113 := yyvsc113 + yyInitial_yyvs_size
			yyvs113 := yyspecial_routines113.resize (yyvs113, yyvsc113)
		end
	end
	yyvs113.put (yyval113, yyvsp113)
end
		end

	yy_do_action_409 is
			--|#line 2359 "et_eiffel_parser.y"
		local
			yyval113: ET_VARIANT
		do
--|#line 2359 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2359")
end

yyval113 := ast_factory.new_variant (yyvs2.item (yyvsp2), Void, yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp113 := yyvsp113 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp62 := yyvsp62 -1
	if yyvsp113 >= yyvsc113 then
		if yyvs113 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs113")
			end
			create yyspecial_routines113
			yyvsc113 := yyInitial_yyvs_size
			yyvs113 := yyspecial_routines113.make (yyvsc113)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs113")
			end
			yyvsc113 := yyvsc113 + yyInitial_yyvs_size
			yyvs113 := yyspecial_routines113.resize (yyvs113, yyvsc113)
		end
	end
	yyvs113.put (yyval113, yyvsp113)
end
		end

	yy_do_action_410 is
			--|#line 2361 "et_eiffel_parser.y"
		local
			yyval113: ET_VARIANT
		do
--|#line 2361 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2361")
end

yyval113 := ast_factory.new_variant (yyvs2.item (yyvsp2), ast_factory.new_tag (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp113 := yyvsp113 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp62 := yyvsp62 -1
	if yyvsp113 >= yyvsc113 then
		if yyvs113 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs113")
			end
			create yyspecial_routines113
			yyvsc113 := yyInitial_yyvs_size
			yyvs113 := yyspecial_routines113.make (yyvsc113)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs113")
			end
			yyvsc113 := yyvsc113 + yyInitial_yyvs_size
			yyvs113 := yyspecial_routines113.resize (yyvs113, yyvsc113)
		end
	end
	yyvs113.put (yyval113, yyvsp113)
end
		end

	yy_do_action_411 is
			--|#line 2367 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2367 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2367")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp45 := yyvsp45 + 1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_412 is
			--|#line 2369 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2369 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2369")
end

yyval45 := yyvs45.item (yyvsp45) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_413 is
			--|#line 2375 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2375 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2375")
end

yyval110 := new_named_type (Void, yyvs13.item (yyvsp13), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp110 := yyvsp110 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_414 is
			--|#line 2377 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2377 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2377")
end

yyval110 := yyvs110.item (yyvsp110) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_415 is
			--|#line 2381 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2381 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2381")
end

yyval110 := new_named_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp110 := yyvsp110 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_416 is
			--|#line 2383 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2383 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2383")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_417 is
			--|#line 2385 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2385 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2385")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_418 is
			--|#line 2387 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2387 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2387")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_419 is
			--|#line 2389 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2389 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2389")
end

yyval110 := yyvs88.item (yyvsp88) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp110 := yyvsp110 + 1
	yyvsp88 := yyvsp88 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_420 is
			--|#line 2391 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2391 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2391")
end

yyval110 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp110 := yyvsp110 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_421 is
			--|#line 2393 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2393 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2393")
end

yyval110 := ast_factory.new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp110 := yyvsp110 + 1
	yyvsp13 := yyvsp13 -2
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_422 is
			--|#line 2395 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2395 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2395")
end

yyval110 := ast_factory.new_tuple_type (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp110 := yyvsp110 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_423 is
			--|#line 2399 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2399 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2399")
end

yyval110 := new_named_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp110 := yyvsp110 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_424 is
			--|#line 2401 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2401")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_425 is
			--|#line 2403 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2403 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2403")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_426 is
			--|#line 2405 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2405 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2405")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_427 is
			--|#line 2407 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2407 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2407")
end

yyval110 := yyvs88.item (yyvsp88) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp110 := yyvsp110 + 1
	yyvsp88 := yyvsp88 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_428 is
			--|#line 2409 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2409 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2409")
end

yyval110 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp110 := yyvsp110 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_429 is
			--|#line 2411 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2411 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2411")
end

yyval110 := ast_factory.new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp110 := yyvsp110 + 1
	yyvsp13 := yyvsp13 -2
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_430 is
			--|#line 2413 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2413 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2413")
end

yyval110 := ast_factory.new_tuple_type (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp110 := yyvsp110 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	if yyvsp110 >= yyvsc110 then
		if yyvs110 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs110")
			end
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs110")
			end
			yyvsc110 := yyvsc110 + yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.resize (yyvs110, yyvsc110)
		end
	end
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_431 is
			--|#line 2417 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 2417 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2417")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_432 is
			--|#line 2421 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2421 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2421")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp27 := yyvsp27 + 1
	if yyvsp27 >= yyvsc27 then
		if yyvs27 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs27")
			end
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs27")
			end
			yyvsc27 := yyvsc27 + yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.resize (yyvs27, yyvsc27)
		end
	end
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_433 is
			--|#line 2423 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2423 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2423")
end

yyval27 := yyvs27.item (yyvsp27) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_434 is
			--|#line 2427 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2427 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2427")
end

yyval27 := ast_factory.new_actual_parameters (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp27 >= yyvsc27 then
		if yyvs27 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs27")
			end
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs27")
			end
			yyvsc27 := yyvsc27 + yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.resize (yyvs27, yyvsc27)
		end
	end
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_435 is
			--|#line 2430 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2430 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2430")
end

			yyval27 := yyvs27.item (yyvsp27)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_436 is
			--|#line 2438 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2438 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2438")
end

			add_symbol (yyvs23.item (yyvsp23))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_437 is
			--|#line 2445 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2445 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2445")
end

			if yyvs110.item (yyvsp110) /= Void then
				yyval27 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval27 /= Void then
					yyval27.put_first (yyvs110.item (yyvsp110))
				end
			else
				yyval27 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 + 1
	yyvsp110 := yyvsp110 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp27 >= yyvsc27 then
		if yyvs27 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs27")
			end
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs27")
			end
			yyvsc27 := yyvsc27 + yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.resize (yyvs27, yyvsc27)
		end
	end
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_438 is
			--|#line 2456 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2456 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2456")
end

			yyval27 := yyvs27.item (yyvsp27)
			add_to_actual_parameter_list (yyvs26.item (yyvsp26), yyval27)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_439 is
			--|#line 2461 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2461 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2461")
end

			yyval27 := yyvs27.item (yyvsp27)
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_named_type (Void, yyvs13.item (yyvsp13), Void), yyvs5.item (yyvsp5)), yyval27)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_440 is
			--|#line 2466 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2466 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2466")
end

			yyval27 := yyvs27.item (yyvsp27)
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (ast_factory.new_tuple_type (yyvs13.item (yyvsp13), Void), yyvs5.item (yyvsp5)), yyval27)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_441 is
			--|#line 2473 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2473 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2473")
end

			increment_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_442 is
			--|#line 2479 "et_eiffel_parser.y"
		local
			yyval26: ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2479 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2479")
end

			yyval26 := ast_factory.new_actual_parameter_comma (yyvs110.item (yyvsp110), yyvs5.item (yyvsp5))
			if yyval26 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 + 1
	yyvsp110 := yyvsp110 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp26 >= yyvsc26 then
		if yyvs26 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs26")
			end
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs26")
			end
			yyvsc26 := yyvsc26 + yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.resize (yyvs26, yyvsc26)
		end
	end
	yyvs26.put (yyval26, yyvsp26)
end
		end

	yy_do_action_443 is
			--|#line 2488 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2488 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2488")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp27 := yyvsp27 + 1
	if yyvsp27 >= yyvsc27 then
		if yyvs27 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs27")
			end
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs27")
			end
			yyvsc27 := yyvsc27 + yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.resize (yyvs27, yyvsc27)
		end
	end
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_444 is
			--|#line 2490 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2490 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2490")
end

yyval27 := yyvs27.item (yyvsp27) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_445 is
			--|#line 2494 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2494 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2494")
end

yyval27 := ast_factory.new_actual_parameters (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp27 >= yyvsc27 then
		if yyvs27 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs27")
			end
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs27")
			end
			yyvsc27 := yyvsc27 + yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.resize (yyvs27, yyvsc27)
		end
	end
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_446 is
			--|#line 2497 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2497 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2497")
end

			yyval27 := yyvs27.item (yyvsp27)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_447 is
			--|#line 2503 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2503 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2503")
end

			yyval27 := yyvs27.item (yyvsp27)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_448 is
			--|#line 2511 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2511 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2511")
end

			yyval27 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
			add_to_actual_parameter_list (ast_factory.new_labeled_actual_parameter (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110))), yyval27)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp27 := yyvsp27 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	if yyvsp27 >= yyvsc27 then
		if yyvs27 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs27")
			end
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs27")
			end
			yyvsc27 := yyvsc27 + yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.resize (yyvs27, yyvsc27)
		end
	end
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_449 is
			--|#line 2516 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2516 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2516")
end

			yyval27 := yyvs27.item (yyvsp27)
			add_to_actual_parameter_list (yyvs26.item (yyvsp26), yyvs27.item (yyvsp27))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_450 is
			--|#line 2521 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2521 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2521")
end

			yyval27 := yyvs27.item (yyvsp27)
			add_to_actual_parameter_list (yyvs26.item (yyvsp26), yyvs27.item (yyvsp27))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_451 is
			--|#line 2526 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2526 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2526")
end

			yyval27 := yyvs27.item (yyvsp27)
			if yyval27 /= Void then
				if not yyval27.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyval27.first.type), yyval27)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), Void), yyval27)
				end
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_452 is
			--|#line 2537 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2537 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2537")
end

			yyval27 := yyvs27.item (yyvsp27)
			if yyval27 /= Void then
				if not yyval27.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyval27.first.type), yyval27)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), Void), yyval27)
				end
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_453 is
			--|#line 2548 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2548 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2548")
end

			yyval27 := yyvs27.item (yyvsp27)
			if yyval27 /= Void then
				if not yyval27.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyval27.first.type), yyval27)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), Void), yyval27)
				end
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_454 is
			--|#line 2561 "et_eiffel_parser.y"
		local
			yyval26: ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2561 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2561")
end

			yyval26 := ast_factory.new_labeled_actual_parameter (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)))
			if yyval26 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	if yyvsp26 >= yyvsc26 then
		if yyvs26 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs26")
			end
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs26")
			end
			yyvsc26 := yyvsc26 + yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.resize (yyvs26, yyvsc26)
		end
	end
	yyvs26.put (yyval26, yyvsp26)
end
		end

	yy_do_action_455 is
			--|#line 2570 "et_eiffel_parser.y"
		local
			yyval26: ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2570 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2570")
end

			yyval26 := ast_factory.new_labeled_actual_parameter_semicolon (ast_factory.new_labeled_actual_parameter (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110))), yyvs22.item (yyvsp22))
			if yyval26 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp26 := yyvsp26 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp26 >= yyvsc26 then
		if yyvs26 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs26")
			end
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs26")
			end
			yyvsc26 := yyvsc26 + yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.resize (yyvs26, yyvsc26)
		end
	end
	yyvs26.put (yyval26, yyvsp26)
end
		end

	yy_do_action_456 is
			--|#line 2579 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2579 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2579")
end

yyval88 := ast_factory.new_like_feature (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp88 := yyvsp88 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	if yyvsp88 >= yyvsc88 then
		if yyvs88 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs88")
			end
			create yyspecial_routines88
			yyvsc88 := yyInitial_yyvs_size
			yyvs88 := yyspecial_routines88.make (yyvsc88)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs88")
			end
			yyvsc88 := yyvsc88 + yyInitial_yyvs_size
			yyvs88 := yyspecial_routines88.resize (yyvs88, yyvsc88)
		end
	end
	yyvs88.put (yyval88, yyvsp88)
end
		end

	yy_do_action_457 is
			--|#line 2581 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2581 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2581")
end

yyval88 := ast_factory.new_like_current (yyvs2.item (yyvsp2), yyvs11.item (yyvsp11)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp88 := yyvsp88 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp11 := yyvsp11 -1
	if yyvsp88 >= yyvsc88 then
		if yyvs88 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs88")
			end
			create yyspecial_routines88
			yyvsc88 := yyInitial_yyvs_size
			yyvs88 := yyspecial_routines88.make (yyvsc88)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs88")
			end
			yyvsc88 := yyvsc88 + yyInitial_yyvs_size
			yyvs88 := yyspecial_routines88.resize (yyvs88, yyvsc88)
		end
	end
	yyvs88.put (yyval88, yyvsp88)
end
		end

	yy_do_action_458 is
			--|#line 2587 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2587 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2587")
end

yyval45 := ast_factory.new_do_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_459 is
			--|#line 2589 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2589 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2589")
end

			yyval45 := ast_factory.new_do_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_460 is
			--|#line 2596 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2596 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2596")
end

yyval45 := ast_factory.new_once_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_461 is
			--|#line 2598 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2598 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2598")
end

			yyval45 := ast_factory.new_once_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_462 is
			--|#line 2605 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2605 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2605")
end

yyval45 := ast_factory.new_then_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_463 is
			--|#line 2607 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2607 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2607")
end

			yyval45 := ast_factory.new_then_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_464 is
			--|#line 2614 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2614 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2614")
end

yyval45 := ast_factory.new_else_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_465 is
			--|#line 2616 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2616 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2616")
end

			yyval45 := ast_factory.new_else_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_466 is
			--|#line 2623 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2623 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2623")
end

yyval45 := ast_factory.new_rescue_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_467 is
			--|#line 2625 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2625 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2625")
end

			yyval45 := ast_factory.new_rescue_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_468 is
			--|#line 2632 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2632 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2632")
end

yyval45 := ast_factory.new_from_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_469 is
			--|#line 2634 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2634 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2634")
end

			yyval45 := ast_factory.new_from_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_470 is
			--|#line 2641 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2641 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2641")
end

yyval45 := ast_factory.new_loop_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_471 is
			--|#line 2643 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2643 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2643")
end

			yyval45 := ast_factory.new_loop_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_472 is
			--|#line 2650 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2650 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2650")
end

			if yyvs85.item (yyvsp85) /= Void then
				yyval45 := ast_factory.new_compound (counter_value + 1)
				if yyval45 /= Void then
					yyval45.put_first (yyvs85.item (yyvsp85))
				end
			else
				yyval45 := ast_factory.new_compound (counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
	yyvsp85 := yyvsp85 -1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_473 is
			--|#line 2661 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2661 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2661")
end

			yyval45 := yyvs45.item (yyvsp45)
			if yyval45 /= Void and yyvs85.item (yyvsp85) /= Void then
				yyval45.put_first (yyvs85.item (yyvsp85))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 -1
	yyvsp85 := yyvsp85 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_474 is
			--|#line 2661 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2661 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2661")
end

			if yyvs85.item (yyvsp85) /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp45 := yyvsp45 + 1
	if yyvsp45 >= yyvsc45 then
		if yyvs45 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs45")
			end
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs45")
			end
			yyvsc45 := yyvsc45 + yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.resize (yyvs45, yyvsc45)
		end
	end
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_475 is
			--|#line 2682 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2682 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2682")
end

yyval85 := yyvs85.item (yyvsp85) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_476 is
			--|#line 2684 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2684 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2684")
end

yyval85 := yyvs85.item (yyvsp85) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_477 is
			--|#line 2686 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2686 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2686")
end

yyval85 := yyvs85.item (yyvsp85) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_478 is
			--|#line 2688 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2688 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2688")
end

yyval85 := ast_factory.new_assigner_instruction (yyvs37.item (yyvsp37), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp85 := yyvsp85 + 1
	yyvsp37 := yyvsp37 -1
	yyvsp5 := yyvsp5 -1
	yyvsp62 := yyvsp62 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_479 is
			--|#line 2690 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2690 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2690")
end

yyval85 := ast_factory.new_assigner_instruction (yyvs35.item (yyvsp35), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp85 := yyvsp85 + 1
	yyvsp35 := yyvsp35 -1
	yyvsp5 := yyvsp5 -1
	yyvsp62 := yyvsp62 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_480 is
			--|#line 2692 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2692 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2692")
end

yyval85 := ast_factory.new_assignment (yyvs116.item (yyvsp116), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp85 := yyvsp85 + 1
	yyvsp116 := yyvsp116 -1
	yyvsp5 := yyvsp5 -1
	yyvsp62 := yyvsp62 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_481 is
			--|#line 2694 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2694 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2694")
end

yyval85 := ast_factory.new_assignment_attempt (yyvs116.item (yyvsp116), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp85 := yyvsp85 + 1
	yyvsp116 := yyvsp116 -1
	yyvsp5 := yyvsp5 -1
	yyvsp62 := yyvsp62 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_482 is
			--|#line 2696 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2696 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2696")
end

yyval85 := yyvs77.item (yyvsp77) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp85 := yyvsp85 + 1
	yyvsp77 := yyvsp77 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_483 is
			--|#line 2698 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2698 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2698")
end

yyval85 := yyvs84.item (yyvsp84) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp85 := yyvsp85 + 1
	yyvsp84 := yyvsp84 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_484 is
			--|#line 2700 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2700 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2700")
end

yyval85 := ast_factory.new_loop_instruction (yyvs45.item (yyvsp45 - 1), yyvs92.item (yyvsp92), yyvs113.item (yyvsp113), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp85 := yyvsp85 + 1
	yyvsp45 := yyvsp45 -2
	yyvsp92 := yyvsp92 -1
	yyvsp113 := yyvsp113 -1
	yyvsp2 := yyvsp2 -2
	yyvsp62 := yyvsp62 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_485 is
			--|#line 2707 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2707 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2707")
end

yyval85 := yyvs57.item (yyvsp57) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp85 := yyvsp85 + 1
	yyvsp57 := yyvsp57 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_486 is
			--|#line 2709 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2709 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2709")
end

yyval85 := new_check_instruction (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_487 is
			--|#line 2711 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2711 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2711")
end

yyval85 := new_check_instruction (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_488 is
			--|#line 2713 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2713 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2713")
end

yyval85 := yyvs19.item (yyvsp19) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp85 := yyvsp85 + 1
	yyvsp19 := yyvsp19 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_489 is
			--|#line 2715 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2715 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2715")
end

yyval85 := ast_factory.new_null_instruction (yyvs22.item (yyvsp22)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp85 := yyvsp85 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_490 is
			--|#line 2721 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2721 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2721")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5), yyvs116.item (yyvsp116), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp85 := yyvsp85 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	yyvsp116 := yyvsp116 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_491 is
			--|#line 2723 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2723 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2723")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1), yyvs116.item (yyvsp116), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp85 := yyvsp85 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp110 := yyvsp110 -1
	yyvsp116 := yyvsp116 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_492 is
			--|#line 2725 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2725 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2725")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 1), Void, yyvs5.item (yyvsp5), yyvs116.item (yyvsp116), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp85 := yyvsp85 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp116 := yyvsp116 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_493 is
			--|#line 2727 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2727 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2727")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 2), Void, yyvs5.item (yyvsp5 - 1), yyvs116.item (yyvsp116), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 6
	yyvsp85 := yyvsp85 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp116 := yyvsp116 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_494 is
			--|#line 2731 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2731 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2731")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)), yyvs116.item (yyvsp116), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	yyvsp116 := yyvsp116 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_495 is
			--|#line 2733 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2733 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2733")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), yyvs116.item (yyvsp116), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 8
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp110 := yyvsp110 -1
	yyvsp116 := yyvsp116 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_496 is
			--|#line 2735 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2735 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2735")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), Void, yyvs116.item (yyvsp116), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp116 := yyvsp116 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_497 is
			--|#line 2737 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2737 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2737")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), Void, yyvs116.item (yyvsp116), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp116 := yyvsp116 -1
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_498 is
			--|#line 2741 "et_eiffel_parser.y"
		local
			yyval54: ET_CREATE_EXPRESSION
		do
--|#line 2741 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2741")
end

yyval54 := ast_factory.new_create_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)), Void) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	if yyvsp54 >= yyvsc54 then
		if yyvs54 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs54")
			end
			create yyspecial_routines54
			yyvsc54 := yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.make (yyvsc54)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs54")
			end
			yyvsc54 := yyvsc54 + yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.resize (yyvs54, yyvsc54)
		end
	end
	yyvs54.put (yyval54, yyvsp54)
end
		end

	yy_do_action_499 is
			--|#line 2743 "et_eiffel_parser.y"
		local
			yyval54: ET_CREATE_EXPRESSION
		do
--|#line 2743 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2743")
end

yyval54 := ast_factory.new_create_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp110 := yyvsp110 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp54 >= yyvsc54 then
		if yyvs54 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs54")
			end
			create yyspecial_routines54
			yyvsc54 := yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.make (yyvsc54)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs54")
			end
			yyvsc54 := yyvsc54 + yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.resize (yyvs54, yyvsc54)
		end
	end
	yyvs54.put (yyval54, yyvsp54)
end
		end

	yy_do_action_500 is
			--|#line 2749 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 2749 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2749")
end

yyval77 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45), Void, Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp77 := yyvsp77 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp62 := yyvsp62 -1
	yyvsp45 := yyvsp45 -1
	if yyvsp77 >= yyvsc77 then
		if yyvs77 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs77")
			end
			create yyspecial_routines77
			yyvsc77 := yyInitial_yyvs_size
			yyvs77 := yyspecial_routines77.make (yyvsc77)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs77")
			end
			yyvsc77 := yyvsc77 + yyInitial_yyvs_size
			yyvs77 := yyspecial_routines77.resize (yyvs77, yyvsc77)
		end
	end
	yyvs77.put (yyval77, yyvsp77)
end
		end

	yy_do_action_501 is
			--|#line 2751 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 2751 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2751")
end

yyval77 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45 - 1), Void, yyvs45.item (yyvsp45), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp77 := yyvsp77 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp62 := yyvsp62 -1
	yyvsp45 := yyvsp45 -2
	if yyvsp77 >= yyvsc77 then
		if yyvs77 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs77")
			end
			create yyspecial_routines77
			yyvsc77 := yyInitial_yyvs_size
			yyvs77 := yyspecial_routines77.make (yyvsc77)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs77")
			end
			yyvsc77 := yyvsc77 + yyInitial_yyvs_size
			yyvs77 := yyspecial_routines77.resize (yyvs77, yyvsc77)
		end
	end
	yyvs77.put (yyval77, yyvsp77)
end
		end

	yy_do_action_502 is
			--|#line 2753 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 2753 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2753")
end

yyval77 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45), yyvs59.item (yyvsp59), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp77 := yyvsp77 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp62 := yyvsp62 -1
	yyvsp45 := yyvsp45 -1
	yyvsp59 := yyvsp59 -1
	if yyvsp77 >= yyvsc77 then
		if yyvs77 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs77")
			end
			create yyspecial_routines77
			yyvsc77 := yyInitial_yyvs_size
			yyvs77 := yyspecial_routines77.make (yyvsc77)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs77")
			end
			yyvsc77 := yyvsc77 + yyInitial_yyvs_size
			yyvs77 := yyspecial_routines77.resize (yyvs77, yyvsc77)
		end
	end
	yyvs77.put (yyval77, yyvsp77)
end
		end

	yy_do_action_503 is
			--|#line 2755 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 2755 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2755")
end

yyval77 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45 - 1), yyvs59.item (yyvsp59), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 6
	yyvsp77 := yyvsp77 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp62 := yyvsp62 -1
	yyvsp45 := yyvsp45 -2
	yyvsp59 := yyvsp59 -1
	if yyvsp77 >= yyvsc77 then
		if yyvs77 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs77")
			end
			create yyspecial_routines77
			yyvsc77 := yyInitial_yyvs_size
			yyvs77 := yyspecial_routines77.make (yyvsc77)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs77")
			end
			yyvsc77 := yyvsc77 + yyInitial_yyvs_size
			yyvs77 := yyspecial_routines77.resize (yyvs77, yyvsc77)
		end
	end
	yyvs77.put (yyval77, yyvsp77)
end
		end

	yy_do_action_504 is
			--|#line 2759 "et_eiffel_parser.y"
		local
			yyval59: ET_ELSEIF_PART_LIST
		do
--|#line 2759 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2759")
end

			yyval59 := yyvs59.item (yyvsp59)
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs59.put (yyval59, yyvsp59)
end
		end

	yy_do_action_505 is
			--|#line 2766 "et_eiffel_parser.y"
		local
			yyval59: ET_ELSEIF_PART_LIST
		do
--|#line 2766 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2766")
end

			yyval59 := ast_factory.new_elseif_part_list (counter_value)
			if yyval59 /= Void and yyvs58.item (yyvsp58) /= Void then
				yyval59.put_first (yyvs58.item (yyvsp58))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp59 := yyvsp59 + 1
	yyvsp58 := yyvsp58 -1
	if yyvsp59 >= yyvsc59 then
		if yyvs59 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs59")
			end
			create yyspecial_routines59
			yyvsc59 := yyInitial_yyvs_size
			yyvs59 := yyspecial_routines59.make (yyvsc59)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs59")
			end
			yyvsc59 := yyvsc59 + yyInitial_yyvs_size
			yyvs59 := yyspecial_routines59.resize (yyvs59, yyvsc59)
		end
	end
	yyvs59.put (yyval59, yyvsp59)
end
		end

	yy_do_action_506 is
			--|#line 2773 "et_eiffel_parser.y"
		local
			yyval59: ET_ELSEIF_PART_LIST
		do
--|#line 2773 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2773")
end

			yyval59 := yyvs59.item (yyvsp59)
			if yyval59 /= Void and yyvs58.item (yyvsp58) /= Void then
				yyval59.put_first (yyvs58.item (yyvsp58))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp58 := yyvsp58 -1
	yyvs59.put (yyval59, yyvsp59)
end
		end

	yy_do_action_507 is
			--|#line 2782 "et_eiffel_parser.y"
		local
			yyval58: ET_ELSEIF_PART
		do
--|#line 2782 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2782")
end

			yyval58 := ast_factory.new_elseif_part (ast_factory.new_conditional (yyvs2.item (yyvsp2), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45))
			if yyval58 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp58 := yyvsp58 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp62 := yyvsp62 -1
	yyvsp45 := yyvsp45 -1
	if yyvsp58 >= yyvsc58 then
		if yyvs58 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs58")
			end
			create yyspecial_routines58
			yyvsc58 := yyInitial_yyvs_size
			yyvs58 := yyspecial_routines58.make (yyvsc58)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs58")
			end
			yyvsc58 := yyvsc58 + yyInitial_yyvs_size
			yyvs58 := yyspecial_routines58.resize (yyvs58, yyvsc58)
		end
	end
	yyvs58.put (yyval58, yyvsp58)
end
		end

	yy_do_action_508 is
			--|#line 2793 "et_eiffel_parser.y"
		local
			yyval84: ET_INSPECT_INSTRUCTION
		do
--|#line 2793 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2793")
end

yyval84 := ast_factory.new_inspect_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs115.item (yyvsp115), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp84 := yyvsp84 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp62 := yyvsp62 -1
	yyvsp115 := yyvsp115 -1
	yyvsp45 := yyvsp45 -1
	if yyvsp84 >= yyvsc84 then
		if yyvs84 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs84")
			end
			create yyspecial_routines84
			yyvsc84 := yyInitial_yyvs_size
			yyvs84 := yyspecial_routines84.make (yyvsc84)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs84")
			end
			yyvsc84 := yyvsc84 + yyInitial_yyvs_size
			yyvs84 := yyspecial_routines84.resize (yyvs84, yyvsc84)
		end
	end
	yyvs84.put (yyval84, yyvsp84)
end
		end

	yy_do_action_509 is
			--|#line 2795 "et_eiffel_parser.y"
		local
			yyval84: ET_INSPECT_INSTRUCTION
		do
--|#line 2795 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2795")
end

yyval84 := ast_factory.new_inspect_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs115.item (yyvsp115), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp84 := yyvsp84 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp62 := yyvsp62 -1
	yyvsp115 := yyvsp115 -1
	if yyvsp84 >= yyvsc84 then
		if yyvs84 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs84")
			end
			create yyspecial_routines84
			yyvsc84 := yyInitial_yyvs_size
			yyvs84 := yyspecial_routines84.make (yyvsc84)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs84")
			end
			yyvsc84 := yyvsc84 + yyInitial_yyvs_size
			yyvs84 := yyspecial_routines84.resize (yyvs84, yyvsc84)
		end
	end
	yyvs84.put (yyval84, yyvsp84)
end
		end

	yy_do_action_510 is
			--|#line 2799 "et_eiffel_parser.y"
		local
			yyval115: ET_WHEN_PART_LIST
		do
--|#line 2799 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2799")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp115 := yyvsp115 + 1
	if yyvsp115 >= yyvsc115 then
		if yyvs115 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs115")
			end
			create yyspecial_routines115
			yyvsc115 := yyInitial_yyvs_size
			yyvs115 := yyspecial_routines115.make (yyvsc115)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs115")
			end
			yyvsc115 := yyvsc115 + yyInitial_yyvs_size
			yyvs115 := yyspecial_routines115.resize (yyvs115, yyvsc115)
		end
	end
	yyvs115.put (yyval115, yyvsp115)
end
		end

	yy_do_action_511 is
			--|#line 2801 "et_eiffel_parser.y"
		local
			yyval115: ET_WHEN_PART_LIST
		do
--|#line 2801 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2801")
end

			yyval115 := yyvs115.item (yyvsp115)
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs115.put (yyval115, yyvsp115)
end
		end

	yy_do_action_512 is
			--|#line 2808 "et_eiffel_parser.y"
		local
			yyval115: ET_WHEN_PART_LIST
		do
--|#line 2808 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2808")
end

			yyval115 := ast_factory.new_when_part_list (counter_value)
			if yyval115 /= Void and yyvs114.item (yyvsp114) /= Void then
				yyval115.put_first (yyvs114.item (yyvsp114))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp115 := yyvsp115 + 1
	yyvsp114 := yyvsp114 -1
	if yyvsp115 >= yyvsc115 then
		if yyvs115 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs115")
			end
			create yyspecial_routines115
			yyvsc115 := yyInitial_yyvs_size
			yyvs115 := yyspecial_routines115.make (yyvsc115)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs115")
			end
			yyvsc115 := yyvsc115 + yyInitial_yyvs_size
			yyvs115 := yyspecial_routines115.resize (yyvs115, yyvsc115)
		end
	end
	yyvs115.put (yyval115, yyvsp115)
end
		end

	yy_do_action_513 is
			--|#line 2815 "et_eiffel_parser.y"
		local
			yyval115: ET_WHEN_PART_LIST
		do
--|#line 2815 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2815")
end

			yyval115 := yyvs115.item (yyvsp115)
			if yyval115 /= Void and yyvs114.item (yyvsp114) /= Void then
				yyval115.put_first (yyvs114.item (yyvsp114))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp114 := yyvsp114 -1
	yyvs115.put (yyval115, yyvsp115)
end
		end

	yy_do_action_514 is
			--|#line 2824 "et_eiffel_parser.y"
		local
			yyval114: ET_WHEN_PART
		do
--|#line 2824 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2824")
end

			yyval114 := ast_factory.new_when_part (yyvs41.item (yyvsp41), yyvs45.item (yyvsp45))
			if yyval114 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp114 := yyvsp114 + 1
	yyvsp41 := yyvsp41 -1
	yyvsp45 := yyvsp45 -1
	if yyvsp114 >= yyvsc114 then
		if yyvs114 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs114")
			end
			create yyspecial_routines114
			yyvsc114 := yyInitial_yyvs_size
			yyvs114 := yyspecial_routines114.make (yyvsc114)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs114")
			end
			yyvsc114 := yyvsc114 + yyInitial_yyvs_size
			yyvs114 := yyspecial_routines114.resize (yyvs114, yyvsc114)
		end
	end
	yyvs114.put (yyval114, yyvsp114)
end
		end

	yy_do_action_515 is
			--|#line 2833 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 2833 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2833")
end

yyval41 := ast_factory.new_choice_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp41 := yyvsp41 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
		end

	yy_do_action_516 is
			--|#line 2835 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 2835 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2835")
end

			yyval41 := yyvs41.item (yyvsp41)
			remove_keyword
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 -1
	yyvsp2 := yyvsp2 -1
	yyvs41.put (yyval41, yyvsp41)
end
		end

	yy_do_action_517 is
			--|#line 2835 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 2835 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2835")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp41 := yyvsp41 + 1
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
		end

	yy_do_action_518 is
			--|#line 2848 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 2848 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2848")
end

			if yyvs38.item (yyvsp38) /= Void then
				yyval41 := ast_factory.new_choice_list (last_keyword, counter_value + 1)
				if yyval41 /= Void then
					yyval41.put_first (yyvs38.item (yyvsp38))
				end
			else
				yyval41 := ast_factory.new_choice_list (last_keyword, counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp41 := yyvsp41 + 1
	yyvsp38 := yyvsp38 -1
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
		end

	yy_do_action_519 is
			--|#line 2859 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 2859 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2859")
end

			yyval41 := ast_factory.new_choice_list (last_keyword, counter_value)
			if yyval41 /= Void and yyvs40.item (yyvsp40) /= Void then
				yyval41.put_first (yyvs40.item (yyvsp40))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp41 := yyvsp41 + 1
	yyvsp40 := yyvsp40 -1
	if yyvsp41 >= yyvsc41 then
		if yyvs41 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs41")
			end
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs41")
			end
			yyvsc41 := yyvsc41 + yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.resize (yyvs41, yyvsc41)
		end
	end
	yyvs41.put (yyval41, yyvsp41)
end
		end

	yy_do_action_520 is
			--|#line 2867 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 2867 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2867")
end

			yyval41 := yyvs41.item (yyvsp41)
			if yyval41 /= Void and yyvs40.item (yyvsp40) /= Void then
				yyval41.put_first (yyvs40.item (yyvsp40))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp40 := yyvsp40 -1
	yyvs41.put (yyval41, yyvsp41)
end
		end

	yy_do_action_521 is
			--|#line 2876 "et_eiffel_parser.y"
		local
			yyval40: ET_CHOICE_ITEM
		do
--|#line 2876 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2876")
end

			yyval40 := ast_factory.new_choice_comma (yyvs38.item (yyvsp38), yyvs5.item (yyvsp5))
			if yyval40 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp40 := yyvsp40 + 1
	yyvsp38 := yyvsp38 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp40 >= yyvsc40 then
		if yyvs40 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs40")
			end
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs40")
			end
			yyvsc40 := yyvsc40 + yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.resize (yyvs40, yyvsc40)
		end
	end
	yyvs40.put (yyval40, yyvsp40)
end
		end

	yy_do_action_522 is
			--|#line 2885 "et_eiffel_parser.y"
		local
			yyval38: ET_CHOICE
		do
--|#line 2885 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2885")
end

yyval38 := yyvs39.item (yyvsp39) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp38 := yyvsp38 + 1
	yyvsp39 := yyvsp39 -1
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
		end

	yy_do_action_523 is
			--|#line 2887 "et_eiffel_parser.y"
		local
			yyval38: ET_CHOICE
		do
--|#line 2887 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2887")
end

yyval38 := ast_factory.new_choice_range (yyvs39.item (yyvsp39 - 1), yyvs5.item (yyvsp5), yyvs39.item (yyvsp39)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp39 := yyvsp39 -2
	yyvsp5 := yyvsp5 -1
	if yyvsp38 >= yyvsc38 then
		if yyvs38 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs38")
			end
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs38")
			end
			yyvsc38 := yyvsc38 + yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.resize (yyvs38, yyvsc38)
		end
	end
	yyvs38.put (yyval38, yyvsp38)
end
		end

	yy_do_action_524 is
			--|#line 2891 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 2891 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2891")
end

yyval39 := yyvs14.item (yyvsp14) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp39 := yyvsp39 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
		end

	yy_do_action_525 is
			--|#line 2893 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 2893 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2893")
end

yyval39 := yyvs10.item (yyvsp10) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp39 := yyvsp39 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
		end

	yy_do_action_526 is
			--|#line 2895 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 2895 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2895")
end

yyval39 := yyvs37.item (yyvsp37) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp39 := yyvsp39 + 1
	yyvsp37 := yyvsp37 -1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
		end

	yy_do_action_527 is
			--|#line 2899 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 2899 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2899")
end

yyval39 := yyvs13.item (yyvsp13) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp39 := yyvsp39 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
		end

	yy_do_action_528 is
			--|#line 2901 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 2901 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2901")
end

yyval39 := yyvs108.item (yyvsp108) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp39 := yyvsp39 + 1
	yyvsp108 := yyvsp108 -1
	if yyvsp39 >= yyvsc39 then
		if yyvs39 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs39")
			end
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs39")
			end
			yyvsc39 := yyvsc39 + yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.resize (yyvs39, yyvsc39)
		end
	end
	yyvs39.put (yyval39, yyvsp39)
end
		end

	yy_do_action_529 is
			--|#line 2907 "et_eiffel_parser.y"
		local
			yyval57: ET_DEBUG_INSTRUCTION
		do
--|#line 2907 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2907")
end

yyval57 := ast_factory.new_debug_instruction (yyvs95.item (yyvsp95), ast_factory.new_debug_compound (yyvs2.item (yyvsp2 - 1), ast_factory.new_compound (0)), yyvs2.item (yyvsp2)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp57 := yyvsp57 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp95 := yyvsp95 -1
	if yyvsp57 >= yyvsc57 then
		if yyvs57 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs57")
			end
			create yyspecial_routines57
			yyvsc57 := yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.make (yyvsc57)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs57")
			end
			yyvsc57 := yyvsc57 + yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.resize (yyvs57, yyvsc57)
		end
	end
	yyvs57.put (yyval57, yyvsp57)
end
		end

	yy_do_action_530 is
			--|#line 2909 "et_eiffel_parser.y"
		local
			yyval57: ET_DEBUG_INSTRUCTION
		do
--|#line 2909 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2909")
end

			yyval57 := ast_factory.new_debug_instruction (yyvs95.item (yyvsp95), ast_factory.new_debug_compound (yyvs2.item (yyvsp2 - 1), yyvs45.item (yyvsp45)), yyvs2.item (yyvsp2))
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp57 := yyvsp57 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp95 := yyvsp95 -1
	yyvsp1 := yyvsp1 -1
	yyvsp45 := yyvsp45 -1
	if yyvsp57 >= yyvsc57 then
		if yyvs57 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs57")
			end
			create yyspecial_routines57
			yyvsc57 := yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.make (yyvsc57)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs57")
			end
			yyvsc57 := yyvsc57 + yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.resize (yyvs57, yyvsc57)
		end
	end
	yyvs57.put (yyval57, yyvsp57)
end
		end

	yy_do_action_531 is
			--|#line 2916 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 2916 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2916")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp95 := yyvsp95 + 1
	if yyvsp95 >= yyvsc95 then
		if yyvs95 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs95")
			end
			create yyspecial_routines95
			yyvsc95 := yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.make (yyvsc95)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs95")
			end
			yyvsc95 := yyvsc95 + yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.resize (yyvs95, yyvsc95)
		end
	end
	yyvs95.put (yyval95, yyvsp95)
end
		end

	yy_do_action_532 is
			--|#line 2918 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 2918 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2918")
end

yyval95 := ast_factory.new_manifest_string_list (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp95 := yyvsp95 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp95 >= yyvsc95 then
		if yyvs95 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs95")
			end
			create yyspecial_routines95
			yyvsc95 := yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.make (yyvsc95)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs95")
			end
			yyvsc95 := yyvsc95 + yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.resize (yyvs95, yyvsc95)
		end
	end
	yyvs95.put (yyval95, yyvsp95)
end
		end

	yy_do_action_533 is
			--|#line 2920 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 2920 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2920")
end

			yyval95 := yyvs95.item (yyvsp95)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp95 := yyvsp95 -1
	yyvsp5 := yyvsp5 -1
	yyvs95.put (yyval95, yyvsp95)
end
		end

	yy_do_action_534 is
			--|#line 2920 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 2920 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2920")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp95 := yyvsp95 + 1
	if yyvsp95 >= yyvsc95 then
		if yyvs95 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs95")
			end
			create yyspecial_routines95
			yyvsc95 := yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.make (yyvsc95)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs95")
			end
			yyvsc95 := yyvsc95 + yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.resize (yyvs95, yyvsc95)
		end
	end
	yyvs95.put (yyval95, yyvsp95)
end
		end

	yy_do_action_535 is
			--|#line 2933 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 2933 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2933")
end

			if yyvs16.item (yyvsp16) /= Void then
				yyval95 := ast_factory.new_manifest_string_list (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval95 /= Void then
					yyval95.put_first (yyvs16.item (yyvsp16))
				end
			else
				yyval95 := ast_factory.new_manifest_string_list (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp95 := yyvsp95 + 1
	yyvsp16 := yyvsp16 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp95 >= yyvsc95 then
		if yyvs95 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs95")
			end
			create yyspecial_routines95
			yyvsc95 := yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.make (yyvsc95)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs95")
			end
			yyvsc95 := yyvsc95 + yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.resize (yyvs95, yyvsc95)
		end
	end
	yyvs95.put (yyval95, yyvsp95)
end
		end

	yy_do_action_536 is
			--|#line 2944 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 2944 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2944")
end

			yyval95 := yyvs95.item (yyvsp95)
			if yyval95 /= Void and yyvs94.item (yyvsp94) /= Void then
				yyval95.put_first (yyvs94.item (yyvsp94))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp94 := yyvsp94 -1
	yyvs95.put (yyval95, yyvsp95)
end
		end

	yy_do_action_537 is
			--|#line 2953 "et_eiffel_parser.y"
		local
			yyval94: ET_MANIFEST_STRING_ITEM
		do
--|#line 2953 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2953")
end

			yyval94 := ast_factory.new_manifest_string_comma (yyvs16.item (yyvsp16), yyvs5.item (yyvsp5))
			if yyval94 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp94 := yyvsp94 + 1
	yyvsp16 := yyvsp16 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp94 >= yyvsc94 then
		if yyvs94 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs94")
			end
			create yyspecial_routines94
			yyvsc94 := yyInitial_yyvs_size
			yyvs94 := yyspecial_routines94.make (yyvsc94)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs94")
			end
			yyvsc94 := yyvsc94 + yyInitial_yyvs_size
			yyvs94 := yyspecial_routines94.resize (yyvs94, yyvsc94)
		end
	end
	yyvs94.put (yyval94, yyvsp94)
end
		end

	yy_do_action_538 is
			--|#line 2964 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2964 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2964")
end

yyval85 := new_unqualified_call_instruction (yyvs13.item (yyvsp13), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp85 := yyvsp85 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_539 is
			--|#line 2966 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2966 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2966")
end

yyval85 := ast_factory.new_call_instruction (yyvs62.item (yyvsp62), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp85 := yyvsp85 + 1
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_540 is
			--|#line 2968 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2968 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2968")
end

yyval85 := ast_factory.new_precursor_instruction (False, yyvs4.item (yyvsp4), Void, yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp85 := yyvsp85 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_541 is
			--|#line 2970 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2970 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2970")
end

yyval85 := ast_factory.new_precursor_instruction (False, yyvs4.item (yyvsp4), ast_factory.new_precursor_class_name (yyvs5.item (yyvsp5 - 1), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp85 := yyvsp85 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp5 := yyvsp5 -2
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_542 is
			--|#line 2972 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2972 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2972")
end

yyval85 := ast_factory.new_static_call_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp110 := yyvsp110 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_543 is
			--|#line 2974 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2974 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2974")
end

yyval85 := ast_factory.new_static_call_instruction (Void, ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 6
	yyvsp85 := yyvsp85 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp110 := yyvsp110 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp85 >= yyvsc85 then
		if yyvs85 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs85")
			end
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs85")
			end
			yyvsc85 := yyvsc85 + yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.resize (yyvs85, yyvsc85)
		end
	end
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_544 is
			--|#line 2978 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 2978 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2978")
end

yyval62 := new_unqualified_call_expression (yyvs13.item (yyvsp13), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_545 is
			--|#line 2980 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 2980 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2980")
end

yyval62 := ast_factory.new_call_expression (yyvs62.item (yyvsp62), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_546 is
			--|#line 2984 "et_eiffel_parser.y"
		local
			yyval37: ET_CALL_EXPRESSION
		do
--|#line 2984 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2984")
end

yyval37 := ast_factory.new_call_expression (yyvs62.item (yyvsp62), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp37 >= yyvsc37 then
		if yyvs37 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs37")
			end
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs37")
			end
			yyvsc37 := yyvsc37 + yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.resize (yyvs37, yyvsc37)
		end
	end
	yyvs37.put (yyval37, yyvsp37)
end
		end

	yy_do_action_547 is
			--|#line 2988 "et_eiffel_parser.y"
		local
			yyval108: ET_STATIC_CALL_EXPRESSION
		do
--|#line 2988 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2988")
end

yyval108 := ast_factory.new_static_call_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 7
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp110 := yyvsp110 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp108 >= yyvsc108 then
		if yyvs108 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs108")
			end
			create yyspecial_routines108
			yyvsc108 := yyInitial_yyvs_size
			yyvs108 := yyspecial_routines108.make (yyvsc108)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs108")
			end
			yyvsc108 := yyvsc108 + yyInitial_yyvs_size
			yyvs108 := yyspecial_routines108.resize (yyvs108, yyvsc108)
		end
	end
	yyvs108.put (yyval108, yyvsp108)
end
		end

	yy_do_action_548 is
			--|#line 2990 "et_eiffel_parser.y"
		local
			yyval108: ET_STATIC_CALL_EXPRESSION
		do
--|#line 2990 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2990")
end

yyval108 := ast_factory.new_static_call_expression (Void, ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 6
	yyvsp108 := yyvsp108 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp110 := yyvsp110 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp108 >= yyvsc108 then
		if yyvs108 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs108")
			end
			create yyspecial_routines108
			yyvsc108 := yyInitial_yyvs_size
			yyvs108 := yyspecial_routines108.make (yyvsc108)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs108")
			end
			yyvsc108 := yyvsc108 + yyInitial_yyvs_size
			yyvs108 := yyspecial_routines108.resize (yyvs108, yyvsc108)
		end
	end
	yyvs108.put (yyval108, yyvsp108)
end
		end

	yy_do_action_549 is
			--|#line 2994 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 2994 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2994")
end

yyval62 := ast_factory.new_precursor_expression (False, yyvs4.item (yyvsp4), Void, yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_550 is
			--|#line 2996 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 2996 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2996")
end

yyval62 := ast_factory.new_precursor_expression (False, yyvs4.item (yyvsp4), ast_factory.new_precursor_class_name (yyvs5.item (yyvsp5 - 1), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp62 := yyvsp62 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp5 := yyvsp5 -2
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_551 is
			--|#line 3000 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3000 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3000")
end

yyval62 := new_unqualified_call_expression (yyvs13.item (yyvsp13), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_552 is
			--|#line 3002 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3002 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3002")
end

yyval62 := yyvs18.item (yyvsp18) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_553 is
			--|#line 3004 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3004 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3004")
end

yyval62 := yyvs11.item (yyvsp11) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp11 := yyvsp11 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_554 is
			--|#line 3006 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3006 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3006")
end

yyval62 := yyvs98.item (yyvsp98) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp98 := yyvsp98 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_555 is
			--|#line 3008 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3008 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3008")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_556 is
			--|#line 3010 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3010 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3010")
end

			if universe.is_ise and then universe.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval62 := yyvs35.item (yyvsp35)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_557 is
			--|#line 3018 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3018 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3018")
end

yyval62 := yyvs108.item (yyvsp108) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp108 := yyvsp108 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_558 is
			--|#line 3020 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3020 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3020")
end

yyval62 := ast_factory.new_call_expression (yyvs62.item (yyvsp62), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_559 is
			--|#line 3026 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3026 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3026")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp25 := yyvsp25 + 1
	if yyvsp25 >= yyvsc25 then
		if yyvs25 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs25")
			end
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs25")
			end
			yyvsc25 := yyvsc25 + yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.resize (yyvs25, yyvsc25)
		end
	end
	yyvs25.put (yyval25, yyvsp25)
end
		end

	yy_do_action_560 is
			--|#line 3028 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3028 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3028")
end

yyval25 := ast_factory.new_actual_arguments (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp25 := yyvsp25 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp25 >= yyvsc25 then
		if yyvs25 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs25")
			end
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs25")
			end
			yyvsc25 := yyvsc25 + yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.resize (yyvs25, yyvsc25)
		end
	end
	yyvs25.put (yyval25, yyvsp25)
end
		end

	yy_do_action_561 is
			--|#line 3030 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3030 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3030")
end

			yyval25 := yyvs25.item (yyvsp25)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 -1
	yyvsp5 := yyvsp5 -1
	yyvs25.put (yyval25, yyvsp25)
end
		end

	yy_do_action_562 is
			--|#line 3030 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3030 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3030")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp25 := yyvsp25 + 1
	if yyvsp25 >= yyvsc25 then
		if yyvs25 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs25")
			end
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs25")
			end
			yyvsc25 := yyvsc25 + yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.resize (yyvs25, yyvsc25)
		end
	end
	yyvs25.put (yyval25, yyvsp25)
end
		end

	yy_do_action_563 is
			--|#line 3043 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3043 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3043")
end

			if yyvs62.item (yyvsp62) /= Void then
				yyval25 := ast_factory.new_actual_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval25 /= Void then
					yyval25.put_first (yyvs62.item (yyvsp62))
				end
			else
				yyval25 := ast_factory.new_actual_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp25 := yyvsp25 + 1
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp25 >= yyvsc25 then
		if yyvs25 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs25")
			end
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs25")
			end
			yyvsc25 := yyvsc25 + yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.resize (yyvs25, yyvsc25)
		end
	end
	yyvs25.put (yyval25, yyvsp25)
end
		end

	yy_do_action_564 is
			--|#line 3054 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3054 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3054")
end

			yyval25 := ast_factory.new_actual_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval25 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval25.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp25 := yyvsp25 + 1
	yyvsp63 := yyvsp63 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp25 >= yyvsc25 then
		if yyvs25 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs25")
			end
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs25")
			end
			yyvsc25 := yyvsc25 + yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.resize (yyvs25, yyvsc25)
		end
	end
	yyvs25.put (yyval25, yyvsp25)
end
		end

	yy_do_action_565 is
			--|#line 3062 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3062 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3062")
end

			yyval25 := yyvs25.item (yyvsp25)
			if yyval25 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval25.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp63 := yyvsp63 -1
	yyvs25.put (yyval25, yyvsp25)
end
		end

	yy_do_action_566 is
			--|#line 3071 "et_eiffel_parser.y"
		local
			yyval63: ET_EXPRESSION_ITEM
		do
--|#line 3071 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3071")
end

			yyval63 := ast_factory.new_expression_comma (yyvs62.item (yyvsp62), yyvs5.item (yyvsp5))
			if yyval63 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp63 := yyvsp63 + 1
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp63 >= yyvsc63 then
		if yyvs63 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs63")
			end
			create yyspecial_routines63
			yyvsc63 := yyInitial_yyvs_size
			yyvs63 := yyspecial_routines63.make (yyvsc63)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs63")
			end
			yyvsc63 := yyvsc63 + yyInitial_yyvs_size
			yyvs63 := yyspecial_routines63.resize (yyvs63, yyvsc63)
		end
	end
	yyvs63.put (yyval63, yyvsp63)
end
		end

	yy_do_action_567 is
			--|#line 3080 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3080 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3080")
end

yyval62 := ast_factory.new_feature_address (yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_568 is
			--|#line 3082 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3082 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3082")
end

yyval62 := ast_factory.new_current_address (yyvs5.item (yyvsp5), yyvs11.item (yyvsp11)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp11 := yyvsp11 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_569 is
			--|#line 3084 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3084 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3084")
end

yyval62 := ast_factory.new_result_address (yyvs5.item (yyvsp5), yyvs18.item (yyvsp18)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp18 := yyvsp18 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_570 is
			--|#line 3086 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3086 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3086")
end

yyval62 := ast_factory.new_expression_address (yyvs5.item (yyvsp5), yyvs98.item (yyvsp98)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp98 := yyvsp98 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_571 is
			--|#line 3093 "et_eiffel_parser.y"
		local
			yyval116: ET_WRITABLE
		do
--|#line 3093 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3093")
end

yyval116 := new_writable (yyvs13.item (yyvsp13)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp116 := yyvsp116 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp116 >= yyvsc116 then
		if yyvs116 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs116")
			end
			create yyspecial_routines116
			yyvsc116 := yyInitial_yyvs_size
			yyvs116 := yyspecial_routines116.make (yyvsc116)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs116")
			end
			yyvsc116 := yyvsc116 + yyInitial_yyvs_size
			yyvs116 := yyspecial_routines116.resize (yyvs116, yyvsc116)
		end
	end
	yyvs116.put (yyval116, yyvsp116)
end
		end

	yy_do_action_572 is
			--|#line 3095 "et_eiffel_parser.y"
		local
			yyval116: ET_WRITABLE
		do
--|#line 3095 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3095")
end

yyval116 := yyvs18.item (yyvsp18) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp116 := yyvsp116 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp116 >= yyvsc116 then
		if yyvs116 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs116")
			end
			create yyspecial_routines116
			yyvsc116 := yyInitial_yyvs_size
			yyvs116 := yyspecial_routines116.make (yyvsc116)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs116")
			end
			yyvsc116 := yyvsc116 + yyInitial_yyvs_size
			yyvs116 := yyspecial_routines116.resize (yyvs116, yyvsc116)
		end
	end
	yyvs116.put (yyval116, yyvsp116)
end
		end

	yy_do_action_573 is
			--|#line 3101 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3101 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3101")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_574 is
			--|#line 3103 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3103 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3103")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_575 is
			--|#line 3107 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3107 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3107")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_free_operator (yyvs12.item (yyvsp12)), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp12 := yyvsp12 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_576 is
			--|#line 3109 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3109 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3109")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_plus_operator (yyvs20.item (yyvsp20)), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_577 is
			--|#line 3111 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3111 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3111")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_minus_operator (yyvs20.item (yyvsp20)), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_578 is
			--|#line 3113 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3113 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3113")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_579 is
			--|#line 3115 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3115 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3115")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_580 is
			--|#line 3117 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3117 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3117")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_581 is
			--|#line 3119 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3119 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3119")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_582 is
			--|#line 3121 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3121 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3121")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_583 is
			--|#line 3123 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3123 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3123")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_584 is
			--|#line 3125 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3125 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3125")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_585 is
			--|#line 3127 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3127 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3127")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_586 is
			--|#line 3129 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3129 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3129")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_587 is
			--|#line 3131 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3131 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3131")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_588 is
			--|#line 3133 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3133 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3133")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_589 is
			--|#line 3135 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3135 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3135")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_590 is
			--|#line 3137 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3137 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3137")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_and_then_operator (yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvsp2 := yyvsp2 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_591 is
			--|#line 3139 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3139 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3139")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_or_else_operator (yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvsp2 := yyvsp2 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_592 is
			--|#line 3141 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3141 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3141")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_593 is
			--|#line 3143 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3143 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3143")
end

yyval62 := ast_factory.new_equality_expression (yyvs62.item (yyvsp62 - 1), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_594 is
			--|#line 3145 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3145 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3145")
end

yyval62 := ast_factory.new_equality_expression (yyvs62.item (yyvsp62 - 1), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_595 is
			--|#line 3149 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3149 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3149")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_596 is
			--|#line 3151 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3151 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3151")
end

yyval62 := yyvs35.item (yyvsp35) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_597 is
			--|#line 3153 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3153 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3153")
end

yyval62 := yyvs54.item (yyvsp54) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp54 := yyvsp54 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_598 is
			--|#line 3155 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3155 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3155")
end

yyval62 := yyvs96.item (yyvsp96) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp96 := yyvsp96 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_599 is
			--|#line 3157 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3157 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3157")
end

yyval62 := new_prefix_plus_expression (yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_600 is
			--|#line 3159 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3159 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3159")
end

yyval62 := new_prefix_minus_expression (yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_601 is
			--|#line 3161 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3161 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3161")
end

yyval62 := ast_factory.new_prefix_expression (yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_602 is
			--|#line 3163 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3163 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3163")
end

yyval62 := ast_factory.new_prefix_expression (ast_factory.new_prefix_free_operator (yyvs12.item (yyvsp12)), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_603 is
			--|#line 3165 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3165 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3165")
end

yyval62 := ast_factory.new_old_expression (yyvs2.item (yyvsp2), yyvs62.item (yyvsp62)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_604 is
			--|#line 3169 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3169 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3169")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_605 is
			--|#line 3171 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3171 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3171")
end

yyval62 := yyvs108.item (yyvsp108) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp108 := yyvsp108 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_606 is
			--|#line 3173 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3173 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3173")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_607 is
			--|#line 3175 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3175 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3175")
end

yyval62 := yyvs18.item (yyvsp18) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_608 is
			--|#line 3177 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3177 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3177")
end

yyval62 := yyvs11.item (yyvsp11) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp11 := yyvsp11 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_609 is
			--|#line 3179 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3179 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3179")
end

yyval62 := yyvs98.item (yyvsp98) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp98 := yyvsp98 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_610 is
			--|#line 3181 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3181 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3181")
end

yyval62 := yyvs8.item (yyvsp8) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_611 is
			--|#line 3183 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3183 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3183")
end

yyval62 := yyvs14.item (yyvsp14) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_612 is
			--|#line 3185 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3185 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3185")
end

yyval62 := yyvs17.item (yyvsp17) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_613 is
			--|#line 3187 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3187 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3187")
end

yyval62 := yyvs14.item (yyvsp14) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_614 is
			--|#line 3189 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3189 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3189")
end

yyval62 := yyvs17.item (yyvsp17) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_615 is
			--|#line 3191 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3191 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3191")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_616 is
			--|#line 3193 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3193 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3193")
end

yyval62 := yyvs36.item (yyvsp36) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp36 := yyvsp36 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_617 is
			--|#line 3195 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3195 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3195")
end

yyval62 := yyvs36.item (yyvsp36) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp36 := yyvsp36 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_618 is
			--|#line 3197 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3197 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3197")
end

yyval62 := yyvs83.item (yyvsp83) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp83 := yyvsp83 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_619 is
			--|#line 3199 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3199 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3199")
end

yyval62 := yyvs21.item (yyvsp21) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_620 is
			--|#line 3201 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3201 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3201")
end

yyval62 := yyvs10.item (yyvsp10) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_621 is
			--|#line 3203 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3203 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3203")
end

yyval62 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_622 is
			--|#line 3205 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3205 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3205")
end

yyval62 := new_once_manifest_string (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_623 is
			--|#line 3220 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3220 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3220")
end

yyval62 := yyvs7.item (yyvsp7) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_624 is
			--|#line 3222 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3222 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3222")
end

yyval62 := yyvs93.item (yyvsp93) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp93 := yyvsp93 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_625 is
			--|#line 3224 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3224 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3224")
end

yyval62 := yyvs109.item (yyvsp109) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp109 := yyvsp109 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_626 is
			--|#line 3226 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3226 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3226")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_627 is
			--|#line 3230 "et_eiffel_parser.y"
		local
			yyval35: ET_BRACKET_EXPRESSION
		do
--|#line 3230 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3230")
end

			yyval35 := ast_factory.new_bracket_expression (yyvs62.item (yyvsp62), yyvs23.item (yyvsp23), yyvs34.item (yyvsp34))
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp62 := yyvsp62 -1
	yyvsp23 := yyvsp23 -1
	yyvsp34 := yyvsp34 -1
	yyvs35.put (yyval35, yyvsp35)
end
		end

	yy_do_action_628 is
			--|#line 3230 "et_eiffel_parser.y"
		local
			yyval35: ET_BRACKET_EXPRESSION
		do
--|#line 3230 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3230")
end

			add_symbol (yyvs23.item (yyvsp23))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp35 := yyvsp35 + 1
	if yyvsp35 >= yyvsc35 then
		if yyvs35 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs35")
			end
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs35")
			end
			yyvsc35 := yyvsc35 + yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.resize (yyvs35, yyvsc35)
		end
	end
	yyvs35.put (yyval35, yyvsp35)
end
		end

	yy_do_action_629 is
			--|#line 3243 "et_eiffel_parser.y"
		local
			yyval34: ET_BRACKET_ARGUMENT_LIST
		do
--|#line 3243 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3243")
end

			if yyvs62.item (yyvsp62) /= Void then
				yyval34 := ast_factory.new_bracket_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval34 /= Void then
					yyval34.put_first (yyvs62.item (yyvsp62))
				end
			else
				yyval34 := ast_factory.new_bracket_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp34 := yyvsp34 + 1
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp34 >= yyvsc34 then
		if yyvs34 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs34")
			end
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs34")
			end
			yyvsc34 := yyvsc34 + yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.resize (yyvs34, yyvsc34)
		end
	end
	yyvs34.put (yyval34, yyvsp34)
end
		end

	yy_do_action_630 is
			--|#line 3254 "et_eiffel_parser.y"
		local
			yyval34: ET_BRACKET_ARGUMENT_LIST
		do
--|#line 3254 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3254")
end

			yyval34 := ast_factory.new_bracket_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval34 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval34.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp34 := yyvsp34 + 1
	yyvsp63 := yyvsp63 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp34 >= yyvsc34 then
		if yyvs34 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs34")
			end
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs34")
			end
			yyvsc34 := yyvsc34 + yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.resize (yyvs34, yyvsc34)
		end
	end
	yyvs34.put (yyval34, yyvsp34)
end
		end

	yy_do_action_631 is
			--|#line 3262 "et_eiffel_parser.y"
		local
			yyval34: ET_BRACKET_ARGUMENT_LIST
		do
--|#line 3262 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3262")
end

			yyval34 := yyvs34.item (yyvsp34)
			if yyval34 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval34.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp63 := yyvsp63 -1
	yyvs34.put (yyval34, yyvsp34)
end
		end

	yy_do_action_632 is
			--|#line 3271 "et_eiffel_parser.y"
		local
			yyval98: ET_PARENTHESIZED_EXPRESSION
		do
--|#line 3271 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3271")
end

			remove_symbol
			remove_counter
		 	yyval98 := ast_factory.new_parenthesized_expression (yyvs5.item (yyvsp5 - 1), yyvs62.item (yyvsp62), yyvs5.item (yyvsp5))
		 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp98 := yyvsp98 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp62 := yyvsp62 -1
	if yyvsp98 >= yyvsc98 then
		if yyvs98 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs98")
			end
			create yyspecial_routines98
			yyvsc98 := yyInitial_yyvs_size
			yyvs98 := yyspecial_routines98.make (yyvsc98)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs98")
			end
			yyvsc98 := yyvsc98 + yyInitial_yyvs_size
			yyvs98 := yyspecial_routines98.resize (yyvs98, yyvsc98)
		end
	end
	yyvs98.put (yyval98, yyvsp98)
end
		end

	yy_do_action_633 is
			--|#line 3279 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3279 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3279")
end

yyval62 := ast_factory.new_manifest_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	if yyvsp62 >= yyvsc62 then
		if yyvs62 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs62")
			end
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs62")
			end
			yyvsc62 := yyvsc62 + yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.resize (yyvs62, yyvsc62)
		end
	end
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_634 is
			--|#line 3283 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3283 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3283")
end

yyval93 := ast_factory.new_manifest_array (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp93 := yyvsp93 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp93 >= yyvsc93 then
		if yyvs93 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs93")
			end
			create yyspecial_routines93
			yyvsc93 := yyInitial_yyvs_size
			yyvs93 := yyspecial_routines93.make (yyvsc93)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs93")
			end
			yyvsc93 := yyvsc93 + yyInitial_yyvs_size
			yyvs93 := yyspecial_routines93.resize (yyvs93, yyvsc93)
		end
	end
	yyvs93.put (yyval93, yyvsp93)
end
		end

	yy_do_action_635 is
			--|#line 3285 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3285 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3285")
end

			yyval93 := yyvs93.item (yyvsp93)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp93 := yyvsp93 -1
	yyvsp5 := yyvsp5 -1
	yyvs93.put (yyval93, yyvsp93)
end
		end

	yy_do_action_636 is
			--|#line 3285 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3285 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3285")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp93 := yyvsp93 + 1
	if yyvsp93 >= yyvsc93 then
		if yyvs93 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs93")
			end
			create yyspecial_routines93
			yyvsc93 := yyInitial_yyvs_size
			yyvs93 := yyspecial_routines93.make (yyvsc93)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs93")
			end
			yyvsc93 := yyvsc93 + yyInitial_yyvs_size
			yyvs93 := yyspecial_routines93.resize (yyvs93, yyvsc93)
		end
	end
	yyvs93.put (yyval93, yyvsp93)
end
		end

	yy_do_action_637 is
			--|#line 3298 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3298 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3298")
end

			if yyvs62.item (yyvsp62) /= Void then
				yyval93 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval93 /= Void then
					yyval93.put_first (yyvs62.item (yyvsp62))
				end
			else
				yyval93 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp93 := yyvsp93 + 1
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp93 >= yyvsc93 then
		if yyvs93 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs93")
			end
			create yyspecial_routines93
			yyvsc93 := yyInitial_yyvs_size
			yyvs93 := yyspecial_routines93.make (yyvsc93)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs93")
			end
			yyvsc93 := yyvsc93 + yyInitial_yyvs_size
			yyvs93 := yyspecial_routines93.resize (yyvs93, yyvsc93)
		end
	end
	yyvs93.put (yyval93, yyvsp93)
end
		end

	yy_do_action_638 is
			--|#line 3309 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3309 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3309")
end

			yyval93 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval93 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval93.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp93 := yyvsp93 + 1
	yyvsp63 := yyvsp63 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp93 >= yyvsc93 then
		if yyvs93 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs93")
			end
			create yyspecial_routines93
			yyvsc93 := yyInitial_yyvs_size
			yyvs93 := yyspecial_routines93.make (yyvsc93)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs93")
			end
			yyvsc93 := yyvsc93 + yyInitial_yyvs_size
			yyvs93 := yyspecial_routines93.resize (yyvs93, yyvsc93)
		end
	end
	yyvs93.put (yyval93, yyvsp93)
end
		end

	yy_do_action_639 is
			--|#line 3317 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3317 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3317")
end

			yyval93 := yyvs93.item (yyvsp93)
			if yyval93 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval93.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp63 := yyvsp63 -1
	yyvs93.put (yyval93, yyvsp93)
end
		end

	yy_do_action_640 is
			--|#line 3326 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3326 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3326")
end

yyval96 := ast_factory.new_manifest_tuple (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp96 := yyvsp96 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp96 >= yyvsc96 then
		if yyvs96 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs96")
			end
			create yyspecial_routines96
			yyvsc96 := yyInitial_yyvs_size
			yyvs96 := yyspecial_routines96.make (yyvsc96)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs96")
			end
			yyvsc96 := yyvsc96 + yyInitial_yyvs_size
			yyvs96 := yyspecial_routines96.resize (yyvs96, yyvsc96)
		end
	end
	yyvs96.put (yyval96, yyvsp96)
end
		end

	yy_do_action_641 is
			--|#line 3328 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3328 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3328")
end

			yyval96 := yyvs96.item (yyvsp96)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 -1
	yyvsp23 := yyvsp23 -1
	yyvs96.put (yyval96, yyvsp96)
end
		end

	yy_do_action_642 is
			--|#line 3328 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3328 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3328")
end

			add_symbol (yyvs23.item (yyvsp23))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp96 := yyvsp96 + 1
	if yyvsp96 >= yyvsc96 then
		if yyvs96 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs96")
			end
			create yyspecial_routines96
			yyvsc96 := yyInitial_yyvs_size
			yyvs96 := yyspecial_routines96.make (yyvsc96)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs96")
			end
			yyvsc96 := yyvsc96 + yyInitial_yyvs_size
			yyvs96 := yyspecial_routines96.resize (yyvs96, yyvsc96)
		end
	end
	yyvs96.put (yyval96, yyvsp96)
end
		end

	yy_do_action_643 is
			--|#line 3341 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3341 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3341")
end

			if yyvs62.item (yyvsp62) /= Void then
				yyval96 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval96 /= Void then
					yyval96.put_first (yyvs62.item (yyvsp62))
				end
			else
				yyval96 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp96 := yyvsp96 + 1
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp96 >= yyvsc96 then
		if yyvs96 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs96")
			end
			create yyspecial_routines96
			yyvsc96 := yyInitial_yyvs_size
			yyvs96 := yyspecial_routines96.make (yyvsc96)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs96")
			end
			yyvsc96 := yyvsc96 + yyInitial_yyvs_size
			yyvs96 := yyspecial_routines96.resize (yyvs96, yyvsc96)
		end
	end
	yyvs96.put (yyval96, yyvsp96)
end
		end

	yy_do_action_644 is
			--|#line 3352 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3352 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3352")
end

			yyval96 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval96 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval96.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp96 := yyvsp96 + 1
	yyvsp63 := yyvsp63 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp96 >= yyvsc96 then
		if yyvs96 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs96")
			end
			create yyspecial_routines96
			yyvsc96 := yyInitial_yyvs_size
			yyvs96 := yyspecial_routines96.make (yyvsc96)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs96")
			end
			yyvsc96 := yyvsc96 + yyInitial_yyvs_size
			yyvs96 := yyspecial_routines96.resize (yyvs96, yyvsc96)
		end
	end
	yyvs96.put (yyval96, yyvsp96)
end
		end

	yy_do_action_645 is
			--|#line 3360 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3360 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3360")
end

			yyval96 := yyvs96.item (yyvsp96)
			if yyval96 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval96.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp63 := yyvsp63 -1
	yyvs96.put (yyval96, yyvsp96)
end
		end

	yy_do_action_646 is
			--|#line 3369 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3369 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3369")
end

yyval109 := ast_factory.new_strip_expression (yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp109 := yyvsp109 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -2
	if yyvsp109 >= yyvsc109 then
		if yyvs109 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs109")
			end
			create yyspecial_routines109
			yyvsc109 := yyInitial_yyvs_size
			yyvs109 := yyspecial_routines109.make (yyvsc109)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs109")
			end
			yyvsc109 := yyvsc109 + yyInitial_yyvs_size
			yyvs109 := yyspecial_routines109.resize (yyvs109, yyvsc109)
		end
	end
	yyvs109.put (yyval109, yyvsp109)
end
		end

	yy_do_action_647 is
			--|#line 3371 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3371 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3371")
end

			yyval109 := yyvs109.item (yyvsp109)
			remove_keyword
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp109 := yyvsp109 -1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -1
	yyvs109.put (yyval109, yyvsp109)
end
		end

	yy_do_action_648 is
			--|#line 3371 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3371 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3371")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp109 := yyvsp109 + 1
	if yyvsp109 >= yyvsc109 then
		if yyvs109 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs109")
			end
			create yyspecial_routines109
			yyvsc109 := yyInitial_yyvs_size
			yyvs109 := yyspecial_routines109.make (yyvsc109)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs109")
			end
			yyvsc109 := yyvsc109 + yyInitial_yyvs_size
			yyvs109 := yyspecial_routines109.resize (yyvs109, yyvsc109)
		end
	end
	yyvs109.put (yyval109, yyvsp109)
end
		end

	yy_do_action_649 is
			--|#line 3386 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3386 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3386")
end

			if yyvs69.item (yyvsp69) /= Void then
				yyval109 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval109 /= Void then
					yyval109.put_first (yyvs69.item (yyvsp69))
				end
			else
				yyval109 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp109 := yyvsp109 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp109 >= yyvsc109 then
		if yyvs109 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs109")
			end
			create yyspecial_routines109
			yyvsc109 := yyInitial_yyvs_size
			yyvs109 := yyspecial_routines109.make (yyvsc109)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs109")
			end
			yyvsc109 := yyvsc109 + yyInitial_yyvs_size
			yyvs109 := yyspecial_routines109.resize (yyvs109, yyvsc109)
		end
	end
	yyvs109.put (yyval109, yyvsp109)
end
		end

	yy_do_action_650 is
			--|#line 3397 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3397 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3397")
end

			yyval109 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval109 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval109.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp109 := yyvsp109 + 1
	yyvsp70 := yyvsp70 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp109 >= yyvsc109 then
		if yyvs109 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs109")
			end
			create yyspecial_routines109
			yyvsc109 := yyInitial_yyvs_size
			yyvs109 := yyspecial_routines109.make (yyvsc109)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs109")
			end
			yyvsc109 := yyvsc109 + yyInitial_yyvs_size
			yyvs109 := yyspecial_routines109.resize (yyvs109, yyvsc109)
		end
	end
	yyvs109.put (yyval109, yyvsp109)
end
		end

	yy_do_action_651 is
			--|#line 3405 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3405 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3405")
end

			yyval109 := yyvs109.item (yyvsp109)
			if yyval109 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval109.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyvs109.put (yyval109, yyvsp109)
end
		end

	yy_do_action_652 is
			--|#line 3414 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3414 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3414")
end

yyval46 := yyvs8.item (yyvsp8) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp46 := yyvsp46 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp46 >= yyvsc46 then
		if yyvs46 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs46")
			end
			create yyspecial_routines46
			yyvsc46 := yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.make (yyvsc46)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs46")
			end
			yyvsc46 := yyvsc46 + yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.resize (yyvs46, yyvsc46)
		end
	end
	yyvs46.put (yyval46, yyvsp46)
end
		end

	yy_do_action_653 is
			--|#line 3416 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3416 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3416")
end

yyval46 := yyvs10.item (yyvsp10) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp46 := yyvsp46 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp46 >= yyvsc46 then
		if yyvs46 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs46")
			end
			create yyspecial_routines46
			yyvsc46 := yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.make (yyvsc46)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs46")
			end
			yyvsc46 := yyvsc46 + yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.resize (yyvs46, yyvsc46)
		end
	end
	yyvs46.put (yyval46, yyvsp46)
end
		end

	yy_do_action_654 is
			--|#line 3418 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3418 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3418")
end

yyval46 := yyvs14.item (yyvsp14) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp46 := yyvsp46 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp46 >= yyvsc46 then
		if yyvs46 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs46")
			end
			create yyspecial_routines46
			yyvsc46 := yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.make (yyvsc46)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs46")
			end
			yyvsc46 := yyvsc46 + yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.resize (yyvs46, yyvsc46)
		end
	end
	yyvs46.put (yyval46, yyvsp46)
end
		end

	yy_do_action_655 is
			--|#line 3420 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3420 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3420")
end

yyval46 := yyvs17.item (yyvsp17) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp46 := yyvsp46 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp46 >= yyvsc46 then
		if yyvs46 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs46")
			end
			create yyspecial_routines46
			yyvsc46 := yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.make (yyvsc46)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs46")
			end
			yyvsc46 := yyvsc46 + yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.resize (yyvs46, yyvsc46)
		end
	end
	yyvs46.put (yyval46, yyvsp46)
end
		end

	yy_do_action_656 is
			--|#line 3422 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3422 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3422")
end

yyval46 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp46 := yyvsp46 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp46 >= yyvsc46 then
		if yyvs46 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs46")
			end
			create yyspecial_routines46
			yyvsc46 := yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.make (yyvsc46)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs46")
			end
			yyvsc46 := yyvsc46 + yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.resize (yyvs46, yyvsc46)
		end
	end
	yyvs46.put (yyval46, yyvsp46)
end
		end

	yy_do_action_657 is
			--|#line 3424 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3424 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3424")
end

yyval46 := yyvs7.item (yyvsp7) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp46 := yyvsp46 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp46 >= yyvsc46 then
		if yyvs46 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs46")
			end
			create yyspecial_routines46
			yyvsc46 := yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.make (yyvsc46)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs46")
			end
			yyvsc46 := yyvsc46 + yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.resize (yyvs46, yyvsc46)
		end
	end
	yyvs46.put (yyval46, yyvsp46)
end
		end

	yy_do_action_658 is
			--|#line 3430 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3430 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3430")
end

yyval36 := ast_factory.new_call_agent (yyvs3.item (yyvsp3), Void, yyvs69.item (yyvsp69), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp69 := yyvsp69 -1
	yyvsp30 := yyvsp30 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
		end

	yy_do_action_659 is
			--|#line 3432 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3432 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3432")
end

yyval36 := ast_factory.new_call_agent (yyvs3.item (yyvsp3), yyvs31.item (yyvsp31), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp36 := yyvsp36 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp31 := yyvsp31 -1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
	yyvsp30 := yyvsp30 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
		end

	yy_do_action_660 is
			--|#line 3436 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3436 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3436")
end

yyval36 := ast_factory.new_call_agent (yyvs5.item (yyvsp5), Void, yyvs69.item (yyvsp69), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
	yyvsp30 := yyvsp30 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
		end

	yy_do_action_661 is
			--|#line 3438 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3438 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3438")
end

yyval36 := ast_factory.new_call_agent (yyvs5.item (yyvsp5), new_agent_identifier_target (yyvs13.item (yyvsp13)), yyvs69.item (yyvsp69), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
	yyvsp30 := yyvsp30 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
		end

	yy_do_action_662 is
			--|#line 3440 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3440 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3440")
end

yyval36 := ast_factory.new_call_agent (yyvs5.item (yyvsp5), yyvs98.item (yyvsp98), yyvs69.item (yyvsp69), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp98 := yyvsp98 -1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
	yyvsp30 := yyvsp30 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
		end

	yy_do_action_663 is
			--|#line 3442 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3442 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3442")
end

yyval36 := ast_factory.new_call_agent (yyvs5.item (yyvsp5), yyvs18.item (yyvsp18), yyvs69.item (yyvsp69), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp18 := yyvsp18 -1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
	yyvsp30 := yyvsp30 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
		end

	yy_do_action_664 is
			--|#line 3444 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3444 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3444")
end

yyval36 := ast_factory.new_call_agent (yyvs5.item (yyvsp5), yyvs11.item (yyvsp11), yyvs69.item (yyvsp69), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
	yyvsp30 := yyvsp30 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
		end

	yy_do_action_665 is
			--|#line 3446 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3446 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3446")
end

yyval36 := ast_factory.new_call_agent (yyvs5.item (yyvsp5), ast_factory.new_agent_open_target (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), yyvs69.item (yyvsp69), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 6
	yyvsp36 := yyvsp36 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp110 := yyvsp110 -1
	yyvsp69 := yyvsp69 -1
	yyvsp30 := yyvsp30 -1
	if yyvsp36 >= yyvsc36 then
		if yyvs36 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs36")
			end
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs36")
			end
			yyvsc36 := yyvsc36 + yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.resize (yyvs36, yyvsc36)
		end
	end
	yyvs36.put (yyval36, yyvsp36)
end
		end

	yy_do_action_666 is
			--|#line 3450 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3450 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3450")
end

yyval83 := ast_factory.new_do_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 11
	yyvsp3 := yyvsp3 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp30 := yyvsp30 -1
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_667 is
			--|#line 3450 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3450 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3450")
end

			last_local_variables_stack.remove
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_668 is
			--|#line 3461 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3461 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3461")
end

yyval83 := ast_factory.new_do_function_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 12
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp30 := yyvsp30 -1
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_669 is
			--|#line 3461 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3461 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3461")
end

			last_formal_arguments_stack.remove
			last_local_variables_stack.remove
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_670 is
			--|#line 3469 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3469 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3469")
end

yyval83 := ast_factory.new_once_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 11
	yyvsp3 := yyvsp3 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp30 := yyvsp30 -1
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_671 is
			--|#line 3469 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3469 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3469")
end

			last_local_variables_stack.remove
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_672 is
			--|#line 3476 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3476 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3476")
end

yyval83 := ast_factory.new_once_function_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 12
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp30 := yyvsp30 -1
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_673 is
			--|#line 3476 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3476 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3476")
end

			last_formal_arguments_stack.remove
			last_local_variables_stack.remove
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_674 is
			--|#line 3484 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3484 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3484")
end

yyval83 := ast_factory.new_external_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp30 := yyvsp30 -1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_675 is
			--|#line 3487 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3487 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3487")
end

yyval83 := ast_factory.new_external_function_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 12
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp30 := yyvsp30 -1
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_676 is
			--|#line 3487 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3487 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3487")
end

			last_formal_arguments_stack.remove
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_677 is
			--|#line 3494 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3494 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3494")
end

yyval83 := ast_factory.new_do_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 9
	yyvsp3 := yyvsp3 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp30 := yyvsp30 -1
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_678 is
			--|#line 3494 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3494 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3494")
end

			last_local_variables_stack.remove
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_679 is
			--|#line 3501 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3501 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3501")
end

yyval83 := ast_factory.new_do_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 10
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp30 := yyvsp30 -1
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_680 is
			--|#line 3501 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3501 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3501")
end

			last_formal_arguments_stack.remove
			last_local_variables_stack.remove
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_681 is
			--|#line 3509 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3509 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3509")
end

yyval83 := ast_factory.new_once_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 9
	yyvsp3 := yyvsp3 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp30 := yyvsp30 -1
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_682 is
			--|#line 3509 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3509 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3509")
end

			last_local_variables_stack.remove
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_683 is
			--|#line 3516 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3516 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3516")
end

yyval83 := ast_factory.new_once_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 10
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp30 := yyvsp30 -1
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_684 is
			--|#line 3516 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3516 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3516")
end

			last_formal_arguments_stack.remove
			last_local_variables_stack.remove
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_685 is
			--|#line 3524 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3524 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3524")
end

yyval83 := ast_factory.new_external_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 8
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp30 := yyvsp30 -1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_686 is
			--|#line 3527 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3527 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3527")
end

yyval83 := ast_factory.new_external_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 10
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp30 := yyvsp30 -1
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_687 is
			--|#line 3527 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3527 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3527")
end

			last_formal_arguments_stack.remove
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
	if yyvsp83 >= yyvsc83 then
		if yyvs83 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs83")
			end
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs83")
			end
			yyvsc83 := yyvsc83 + yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.resize (yyvs83, yyvsc83)
		end
	end
	yyvs83.put (yyval83, yyvsp83)
end
		end

	yy_do_action_688 is
			--|#line 3536 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3536 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3536")
end

yyval31 := new_agent_identifier_target (yyvs13.item (yyvsp13)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp31 := yyvsp31 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
		end

	yy_do_action_689 is
			--|#line 3538 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3538 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3538")
end

yyval31 := yyvs98.item (yyvsp98) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp31 := yyvsp31 + 1
	yyvsp98 := yyvsp98 -1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
		end

	yy_do_action_690 is
			--|#line 3540 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3540 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3540")
end

yyval31 := yyvs18.item (yyvsp18) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp31 := yyvsp31 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
		end

	yy_do_action_691 is
			--|#line 3542 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3542 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3542")
end

yyval31 := yyvs11.item (yyvsp11) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp31 := yyvsp31 + 1
	yyvsp11 := yyvsp11 -1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
		end

	yy_do_action_692 is
			--|#line 3544 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3544 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3544")
end

yyval31 := ast_factory.new_agent_open_target (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	if yyvsp31 >= yyvsc31 then
		if yyvs31 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs31")
			end
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs31")
			end
			yyvsc31 := yyvsc31 + yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.resize (yyvs31, yyvsc31)
		end
	end
	yyvs31.put (yyval31, yyvsp31)
end
		end

	yy_do_action_693 is
			--|#line 3548 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3548 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3548")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp30 := yyvsp30 + 1
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
		end

	yy_do_action_694 is
			--|#line 3550 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3550 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3550")
end

yyval30 := ast_factory.new_agent_argument_operands (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp30 := yyvsp30 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
		end

	yy_do_action_695 is
			--|#line 3552 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3552 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3552")
end

			yyval30 := yyvs30.item (yyvsp30)
			remove_symbol
			remove_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 -1
	yyvsp5 := yyvsp5 -1
	yyvs30.put (yyval30, yyvsp30)
end
		end

	yy_do_action_696 is
			--|#line 3552 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3552 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3552")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp30 := yyvsp30 + 1
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
		end

	yy_do_action_697 is
			--|#line 3565 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3565 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3565")
end

			if yyvs28.item (yyvsp28) /= Void then
				yyval30 := ast_factory.new_agent_argument_operands (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval30 /= Void then
					yyval30.put_first (yyvs28.item (yyvsp28))
				end
			else
				yyval30 := ast_factory.new_agent_argument_operands (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp30 := yyvsp30 + 1
	yyvsp28 := yyvsp28 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
		end

	yy_do_action_698 is
			--|#line 3576 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3576 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3576")
end

			yyval30 := ast_factory.new_agent_argument_operands (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval30 /= Void and yyvs29.item (yyvsp29) /= Void then
				yyval30.put_first (yyvs29.item (yyvsp29))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp30 := yyvsp30 + 1
	yyvsp29 := yyvsp29 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp30 >= yyvsc30 then
		if yyvs30 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs30")
			end
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs30")
			end
			yyvsc30 := yyvsc30 + yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.resize (yyvs30, yyvsc30)
		end
	end
	yyvs30.put (yyval30, yyvsp30)
end
		end

	yy_do_action_699 is
			--|#line 3584 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3584 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3584")
end

			yyval30 := yyvs30.item (yyvsp30)
			if yyval30 /= Void and yyvs29.item (yyvsp29) /= Void then
				yyval30.put_first (yyvs29.item (yyvsp29))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp29 := yyvsp29 -1
	yyvs30.put (yyval30, yyvsp30)
end
		end

	yy_do_action_700 is
			--|#line 3593 "et_eiffel_parser.y"
		local
			yyval29: ET_AGENT_ARGUMENT_OPERAND_ITEM
		do
--|#line 3593 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3593")
end

			yyval29 := ast_factory.new_agent_argument_operand_comma (yyvs28.item (yyvsp28), yyvs5.item (yyvsp5))
			if yyval29 /= Void then
				increment_counter
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp29 := yyvsp29 + 1
	yyvsp28 := yyvsp28 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp29 >= yyvsc29 then
		if yyvs29 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs29")
			end
			create yyspecial_routines29
			yyvsc29 := yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.make (yyvsc29)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs29")
			end
			yyvsc29 := yyvsc29 + yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.resize (yyvs29, yyvsc29)
		end
	end
	yyvs29.put (yyval29, yyvsp29)
end
		end

	yy_do_action_701 is
			--|#line 3602 "et_eiffel_parser.y"
		local
			yyval28: ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 3602 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3602")
end

yyval28 := yyvs62.item (yyvsp62) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp62 := yyvsp62 -1
	if yyvsp28 >= yyvsc28 then
		if yyvs28 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs28")
			end
			create yyspecial_routines28
			yyvsc28 := yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.make (yyvsc28)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs28")
			end
			yyvsc28 := yyvsc28 + yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.resize (yyvs28, yyvsc28)
		end
	end
	yyvs28.put (yyval28, yyvsp28)
end
		end

	yy_do_action_702 is
			--|#line 3604 "et_eiffel_parser.y"
		local
			yyval28: ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 3604 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3604")
end

yyval28 := yyvs24.item (yyvsp24) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp28 >= yyvsc28 then
		if yyvs28 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs28")
			end
			create yyspecial_routines28
			yyvsc28 := yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.make (yyvsc28)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs28")
			end
			yyvsc28 := yyvsc28 + yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.resize (yyvs28, yyvsc28)
		end
	end
	yyvs28.put (yyval28, yyvsp28)
end
		end

	yy_do_action_703 is
			--|#line 3606 "et_eiffel_parser.y"
		local
			yyval28: ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 3606 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3606")
end

yyval28 := ast_factory.new_agent_typed_open_argument (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5), yyvs24.item (yyvsp24)) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp28 := yyvsp28 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	yyvsp24 := yyvsp24 -1
	if yyvsp28 >= yyvsc28 then
		if yyvs28 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs28")
			end
			create yyspecial_routines28
			yyvsc28 := yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.make (yyvsc28)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs28")
			end
			yyvsc28 := yyvsc28 + yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.resize (yyvs28, yyvsc28)
		end
	end
	yyvs28.put (yyval28, yyvsp28)
end
		end

	yy_do_action_704 is
			--|#line 3612 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3612 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3612")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_705 is
			--|#line 3614 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3614 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3614")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_706 is
			--|#line 3616 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3616 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3616")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_707 is
			--|#line 3618 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3618 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3618")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_708 is
			--|#line 3620 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3620 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3620")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_709 is
			--|#line 3622 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3622 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3622")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_710 is
			--|#line 3624 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3624 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3624")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_711 is
			--|#line 3626 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3626 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3626")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_712 is
			--|#line 3628 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3628 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3628")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_713 is
			--|#line 3630 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3630 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3630")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_714 is
			--|#line 3632 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3632 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3632")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_715 is
			--|#line 3634 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3634 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3634")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_716 is
			--|#line 3636 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3636 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3636")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_717 is
			--|#line 3638 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3638 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3638")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_718 is
			--|#line 3640 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3640 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3640")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_719 is
			--|#line 3642 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3642 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3642")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_720 is
			--|#line 3644 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3644 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3644")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_721 is
			--|#line 3646 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3646 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3646")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_722 is
			--|#line 3648 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3648 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3648")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_723 is
			--|#line 3650 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3650 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3650")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_724 is
			--|#line 3652 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3652 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3652")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_725 is
			--|#line 3654 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3654 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3654")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_726 is
			--|#line 3656 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3656 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3656")
end

abort 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp16 >= yyvsc16 then
		if yyvs16 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs16")
			end
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs16")
			end
			yyvsc16 := yyvsc16 + yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.resize (yyvs16, yyvsc16)
		end
	end
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_727 is
			--|#line 3660 "et_eiffel_parser.y"
		local
			yyval10: ET_CHARACTER_CONSTANT
		do
--|#line 3660 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3660")
end

yyval10 := yyvs10.item (yyvsp10) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs10.put (yyval10, yyvsp10)
end
		end

	yy_do_action_728 is
			--|#line 3662 "et_eiffel_parser.y"
		local
			yyval10: ET_CHARACTER_CONSTANT
		do
--|#line 3662 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3662")
end

abort 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp10 := yyvsp10 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp10 >= yyvsc10 then
		if yyvs10 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs10")
			end
			create yyspecial_routines10
			yyvsc10 := yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.make (yyvsc10)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs10")
			end
			yyvsc10 := yyvsc10 + yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.resize (yyvs10, yyvsc10)
		end
	end
	yyvs10.put (yyval10, yyvsp10)
end
		end

	yy_do_action_729 is
			--|#line 3666 "et_eiffel_parser.y"
		local
			yyval8: ET_BOOLEAN_CONSTANT
		do
--|#line 3666 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3666")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs8.put (yyval8, yyvsp8)
end
		end

	yy_do_action_730 is
			--|#line 3668 "et_eiffel_parser.y"
		local
			yyval8: ET_BOOLEAN_CONSTANT
		do
--|#line 3668 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3668")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs8.put (yyval8, yyvsp8)
end
		end

	yy_do_action_731 is
			--|#line 3672 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3672 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3672")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_732 is
			--|#line 3674 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3674 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3674")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_733 is
			--|#line 3678 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3678 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3678")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_734 is
			--|#line 3680 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3680 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3680")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_735 is
			--|#line 3684 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3684 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3684")
end

			yyval14 := yyvs14.item (yyvsp14)
			yyval14.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_736 is
			--|#line 3689 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3689 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3689")
end

			yyval14 := yyvs14.item (yyvsp14)
			yyval14.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_737 is
			--|#line 3696 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3696 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3696")
end

			yyval14 := yyvs14.item (yyvsp14)
			yyval14.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_738 is
			--|#line 3703 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3703 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3703")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_739 is
			--|#line 3705 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3705 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3705")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_740 is
			--|#line 3709 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3709 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3709")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_741 is
			--|#line 3711 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3711 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3711")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_742 is
			--|#line 3715 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3715 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3715")
end

			yyval17 := yyvs17.item (yyvsp17)
			yyval17.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_743 is
			--|#line 3720 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3720 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3720")
end

			yyval17 := yyvs17.item (yyvsp17)
			yyval17.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_744 is
			--|#line 3727 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3727 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3727")
end

			yyval17 := yyvs17.item (yyvsp17)
			yyval17.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_745 is
			--|#line 3734 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 3734 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3734")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_746 is
			--|#line 3736 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 3736 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3736")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_747 is
			--|#line 3738 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 3738 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3738")
end

				-- TO DO: reserved word `BIT'
			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_748 is
			--|#line 3747 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 3747 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3747")
end

add_counter 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_error_action (yy_act: INTEGER) is
			-- Execute error action.
		do
			if yy_act <= 199 then
				yy_do_error_action_0_199 (yy_act)
			elseif yy_act <= 399 then
				yy_do_error_action_200_399 (yy_act)
			elseif yy_act <= 599 then
				yy_do_error_action_400_599 (yy_act)
			elseif yy_act <= 799 then
				yy_do_error_action_600_799 (yy_act)
			elseif yy_act <= 999 then
				yy_do_error_action_800_999 (yy_act)
			elseif yy_act <= 1199 then
				yy_do_error_action_1000_1199 (yy_act)
			elseif yy_act <= 1399 then
				yy_do_error_action_1200_1399 (yy_act)
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_0_199 (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_200_399 (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_400_599 (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_600_799 (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_800_999 (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_1000_1199 (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_1200_1399 (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			when 1321 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER] is
			-- Template for `yytranslate'
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  128,    2,    2,  126,    2,    2,    2,
			  121,  122,  113,  131,  124,  130,  127,  106,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,  123,  134,
			  110,  132,  108,  136,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,  135,    2,  125,  112,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  119,    2,  120,  129,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,

			   45,   46,   47,   48,   49,   50,   51,   52,   53,   54,
			   55,   56,   57,   58,   59,   60,   61,   62,   63,   64,
			   65,   66,   67,   68,   69,   70,   71,   72,   73,   74,
			   75,   76,   77,   78,   79,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,
			  105,  107,  109,  111,  114,  115,  116,  117,  118,  133, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  337,  337,  169,  338,  338,  168,  168,  168,  168,
			  168,  168,  168,  168,  339,  250,  250,  340,  251,  251,
			  252,  252,  252,  341,  252,  342,  253,  255,  255,  254,
			  254,  258,  258,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  257,  167,  167,  167,  167,  271,  271,  272,
			  272,  245,  245,  245,  344,  246,  246,  244,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  193,  193,  345,
			  194,  194,  194,  195,  195,  195,  195,  195,  195,  195,
			  195,  196,  196,  196,  196,  196,  196,  196,  196,  188,
			  188,  187,  187,  189,  189,  189,  189,  184,  191,  191,

			  190,  190,  190,  192,  192,  192,  192,  192,  192,  185,
			  186,  298,  298,  303,  303,  303,  304,  348,  300,  300,
			  300,  300,  300,  300,  301,  305,  305,  305,  305,  305,
			  306,  306,  306,  306,  302,  302,  319,  319,  349,  320,
			  320,  320,  317,  318,  213,  213,  350,  214,  214,  215,
			  215,  351,  212,  212,  212,  352,  212,  233,  233,  233,
			  172,  353,  172,  173,  173,  173,  173,  170,  171,  279,
			  279,  354,  280,  280,  277,  277,  355,  278,  278,  275,
			  275,  356,  276,  276,  274,  274,  274,  235,  206,  206,
			  205,  207,  207,  357,  203,  203,  203,  358,  203,  359,

			  203,  203,  203,  360,  203,  361,  204,  204,  204,  236,
			  199,  199,  200,  362,  201,  201,  201,  198,  197,  197,
			  330,  330,  363,  331,  331,  329,  231,  231,  230,  232,
			  232,  228,  228,  229,  229,  364,  364,  364,  364,  311,
			  311,  311,  311,  311,  311,  309,  309,  309,  309,  309,
			  309,  312,  312,  312,  312,  312,  312,  312,  312,  312,
			  312,  312,  312,  312,  312,  312,  312,  312,  312,  312,
			  312,  312,  312,  310,  310,  310,  310,  310,  310,  310,
			  310,  273,  273,  321,  321,  227,  227,  154,  154,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,

			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  226,  226,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  241,  241,  325,  242,  242,  242,
			  242,  242,  242,  238,  237,  239,  240,  286,  286,  286,
			  365,  287,  287,  287,  287,  287,  287,  283,  282,  284,
			  285,  366,  366,  366,  366,  366,  366,  366,  366,  308,
			  308,  308,  308,  308,  307,  307,  307,  307,  307,  270,

			  270,  269,  269,  289,  289,  288,  288,  332,  332,  332,
			  332,  175,  175,  326,  326,  327,  327,  327,  327,  327,
			  327,  327,  327,  328,  328,  328,  328,  328,  328,  328,
			  328,  248,  142,  142,  144,  144,  346,  143,  143,  143,
			  143,  347,  139,  145,  145,  146,  146,  146,  147,  147,
			  147,  147,  147,  147,  140,  141,  281,  281,  176,  176,
			  177,  177,  178,  178,  179,  179,  180,  180,  181,  181,
			  182,  182,  174,  174,  367,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  261,  261,  261,  261,
			  262,  262,  262,  262,  264,  264,  264,  264,  202,  202,

			  249,  249,  249,  249,  210,  211,  211,  209,  260,  260,
			  335,  335,  334,  334,  333,  165,  165,  368,  166,  166,
			  166,  164,  162,  162,  163,  163,  163,  163,  163,  208,
			  208,  295,  295,  295,  369,  294,  294,  293,  263,  263,
			  263,  263,  263,  263,  221,  221,  160,  322,  322,  218,
			  218,  217,  217,  217,  217,  217,  217,  217,  217,  137,
			  137,  137,  370,  138,  138,  138,  225,  220,  220,  220,
			  220,  336,  336,  216,  216,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  224,  224,  224,  224,  224,

			  224,  224,  224,  224,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  157,  371,  156,
			  156,  156,  299,  219,  290,  290,  372,  291,  291,  291,
			  296,  296,  373,  297,  297,  297,  323,  323,  374,  324,
			  324,  324,  183,  183,  183,  183,  183,  183,  158,  158,
			  159,  159,  159,  159,  159,  159,  259,  375,  259,  376,
			  259,  377,  259,  378,  259,  259,  379,  259,  380,  259,
			  381,  259,  382,  259,  383,  259,  259,  384,  152,  152,
			  152,  152,  152,  150,  150,  150,  385,  151,  151,  151,

			  149,  148,  148,  148,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  292,  292,  292,
			  292,  292,  292,  292,  292,  292,  292,  161,  161,  155,
			  155,  265,  265,  267,  267,  268,  268,  266,  313,  313,
			  315,  315,  316,  316,  314,  247,  247,  247,  343, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1323)
			yytypes1_template_1 (an_array)
			yytypes1_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytypes1_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yytypes1'.
		do
			yy_array_subcopy (an_array, <<
			    1,    9,    2,   42,   78,   78,   42,   78,    2,   42,
			   42,    2,   78,   79,   79,    1,   23,   76,    2,    2,
			    2,    2,    2,   22,   78,   22,   78,   20,   20,    6,
			    6,   17,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   14,   13,   13,   13,   10,    8,
			    8,    7,    2,    8,   10,   54,   13,   79,   80,   81,
			   82,   14,   14,   16,   17,   17,    5,   76,    2,   97,
			    2,    2,    2,    2,   78,   78,   17,   14,   17,   14,
			    5,   23,    2,   96,    5,    5,   13,   82,    2,    2,

			   74,   75,   76,   13,   16,    2,  101,  101,    1,    2,
			    2,    2,   13,   13,   13,   13,    2,    2,    2,    2,
			   13,   88,  110,  110,    5,   96,    2,   82,   13,   13,
			    5,    5,   76,    5,   56,    1,    2,    2,   53,   56,
			   67,   78,   86,    1,    1,   13,   99,   99,  100,  101,
			  101,   13,   13,   13,   23,   27,   27,    1,   20,   20,
			   13,   14,   13,   13,   13,   11,   13,   23,   27,    1,
			    5,   20,   20,    5,    5,    5,    5,    2,   21,   18,
			   17,   15,   14,   12,   11,    7,    5,    4,    3,    2,
			    2,    2,    8,   35,   36,   36,   10,   54,   62,   62,

			   62,   62,   62,   62,   62,   62,   62,   63,   13,   83,
			   14,   93,   16,   96,   96,   98,   17,  108,  109,    5,
			    5,    5,   13,   13,    2,    2,    2,   50,   13,   88,
			   53,   53,    2,    2,   55,   56,   53,   62,   13,    1,
			   67,   67,    1,   53,   86,   86,    2,    1,   78,    2,
			   56,   66,   66,   67,   27,   27,   22,  101,  101,   22,
			  101,  101,  101,  101,    5,   13,   13,   13,    2,    2,
			    2,   26,   26,   26,   27,   27,   13,   13,   88,  110,
			  110,   27,   27,   27,    5,   13,   13,   13,   27,    5,
			   62,   62,    2,    2,   69,   13,   18,   11,   69,   98,

			  110,   62,    5,   62,   62,    5,    5,   93,    5,    5,
			   25,    5,    5,    5,   18,   11,    2,   31,   69,   73,
			   13,   98,  103,    5,    5,   16,    5,    5,    5,   20,
			   20,    5,    5,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   15,   15,   15,   15,   12,    5,   23,    5,
			   96,    5,   25,    5,   62,   50,   50,   23,   48,   48,
			    1,   13,   14,   13,   13,   13,    2,   49,   23,   48,
			   48,    1,   67,    5,   44,   55,   44,   55,   56,   51,
			   52,   53,   69,   22,    5,   62,   13,   86,   67,   78,
			    1,   42,    2,   44,   67,    2,   64,   69,   13,  104,

			  104,  105,  105,    1,    2,    2,    2,    2,    2,    2,
			   61,   87,   87,   87,  107,    5,   27,    5,   13,   14,
			    5,   13,   13,   13,   27,   13,   13,   13,   27,   27,
			    5,   27,    5,    5,    5,    5,   13,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,    5,   30,    5,
			   69,   69,   62,   63,   93,    5,   25,   13,  110,    5,
			  110,    2,    1,    5,   30,    5,  103,    2,    2,   91,

			   71,   71,   72,   72,   73,   13,    5,  109,  110,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,    2,   62,    2,   62,   62,   13,
			   35,   69,   69,    5,   49,   49,    5,   13,   13,   13,
			    2,    2,    2,   47,   47,   47,   48,   48,   50,   50,
			   13,   13,   88,   48,   48,   48,    2,   49,    5,   13,
			   13,   13,   48,   86,    5,   44,   55,   55,   70,   13,
			   55,   55,   56,    5,   53,    5,    5,   22,   22,    5,
			   78,   86,    2,   42,    1,    1,   64,  104,  105,    5,
			    5,    2,   73,    2,  104,  105,    5,    2,   32,  104,

			  105,   87,   87,  107,   87,   61,   87,   87,    2,   87,
			   87,   87,   87,   61,   61,    1,    1,    1,   27,   27,
			   27,    5,    5,  110,    1,    1,   25,    5,   30,    5,
			    5,   14,   17,   30,   30,    5,    5,   93,   25,   62,
			   63,    5,  103,    5,    1,   69,  110,    2,   91,   91,
			   16,    2,    2,   45,   45,   73,   13,   73,    5,   73,
			    5,   73,    5,    5,   69,   70,  109,    5,   62,   62,
			   25,   34,   62,   63,   30,   30,    5,   48,    5,   13,
			   14,    5,   13,   13,   13,   48,   13,   13,   13,   48,
			   48,    5,    5,    5,   48,   49,   70,   13,    5,    5,

			   78,   43,   43,   44,   13,   55,   55,    5,   55,    5,
			  112,  112,   22,    2,   78,    1,    1,    5,  104,  105,
			  104,  105,  110,    5,    2,   78,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   69,   70,
			   87,   87,   69,  106,  106,  107,   87,   22,   44,   60,
			   61,   87,   87,    2,   87,   27,   27,   27,   27,   27,
			    1,    1,   22,    5,   24,    5,   28,   29,   30,   62,
			   69,   13,    5,    5,   25,   25,    2,   91,   30,  103,
			   16,   45,   45,   13,   89,   89,   90,   90,   91,    2,

			   65,    1,    1,    2,  102,  102,  110,    5,    5,    5,
			  109,    5,    5,    5,   34,    1,    1,    1,   48,   48,
			   48,    5,    5,   50,    2,   49,    2,    1,    1,    2,
			    5,   44,    5,   44,    5,    5,  112,    5,    1,    2,
			    1,  104,  105,    2,   33,  110,   78,   97,   87,    2,
			  107,    2,   60,   61,   87,    2,   87,  110,    5,    5,
			    5,   30,   30,   25,   16,   45,   45,    2,   91,   65,
			  102,  102,    5,    5,   91,   91,   91,   91,   16,  102,
			   22,    5,    5,   19,   18,    4,    2,    2,    2,    2,
			    2,    2,    2,   35,   37,   45,   45,   57,   62,   62,

			   13,   77,   84,   85,   85,   85,   85,  116,   45,    2,
			    1,    2,   45,   45,   45,   22,   13,   48,   48,   48,
			   48,   48,    1,    1,   22,    5,    1,  110,  111,  112,
			    1,    1,   69,   22,    5,    2,   78,   33,   97,  103,
			   64,   68,   69,   70,   61,    2,   87,    5,   65,  102,
			  102,   16,   45,   45,  102,   45,   45,  110,    2,    5,
			  110,  110,    5,   25,   62,   62,    1,    5,    5,   95,
			    5,   18,   13,  116,    2,    1,    5,    5,    2,   92,
			   92,    5,   25,   45,    5,    5,    1,    1,    2,    2,
			   25,    1,    5,    5,  112,    1,    5,    7,    2,    8, yyDummy>>,
			1, 1000, 0)
		end

	yytypes1_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yytypes1'.
		do
			yy_array_subcopy (an_array, <<
			   10,   46,   14,   14,   14,   16,   17,   17,   17,    2,
			   46,   78,   97,    2,   78,  103,    2,    2,   91,    5,
			   68,    2,   24,  102,   45,   45,   65,  102,  102,    2,
			    2,    2,   22,   30,  116,    5,    5,   13,  115,    1,
			    2,   45,   45,  110,    5,   95,    2,    1,  110,    5,
			    2,   62,   62,    1,    2,  113,   13,   45,   62,   62,
			   45,   83,   83,  110,   22,   22,   22,   22,   22,   97,
			  103,   78,   97,    2,    2,   91,  102,   16,   45,   45,
			    2,    2,    2,  102,   45,   45,   83,   83,   83,    5,
			  116,    5,    5,    2,    2,   45,    2,   41,  114,  115,

			    1,    2,   45,   59,    1,    5,   16,   94,   95,   45,
			    5,   13,   62,   13,    2,   25,   30,   30,    5,  103,
			    2,    2,   91,   97,  103,  102,   16,   45,   45,    2,
			   65,  102,  102,   30,   83,   83,    2,    2,    2,   30,
			   30,   30,   13,    5,   13,   25,    1,    2,   41,   45,
			  115,   45,    2,    2,   45,    2,   58,   59,    5,    5,
			    5,   95,    2,  116,   25,    5,   62,    2,    2,   91,
			  102,   16,   45,   45,  103,    2,    2,   91,    2,   65,
			  102,  102,   22,  102,   45,   45,   30,   30,   83,   83,
			   83,   25,   13,   25,   45,   14,   35,   37,   10,   38,

			   39,   40,   41,   62,   13,   14,   14,  108,    2,   62,
			   59,   13,    5,   62,    2,   45,  102,   16,   45,   45,
			    2,   65,  102,  102,    2,    2,   91,  102,   16,   45,
			   45,   22,  102,   45,   45,    2,    2,    2,   30,   30,
			   30,   25,    5,    5,   41,    5,   45,   25,   13,    1,
			    2,    2,   65,  102,  102,   22,  102,   45,   45,  102,
			   16,   45,   45,    2,   65,  102,  102,    2,    2,    2,
			   22,   22,   22,   39,   13,   25,   45,   22,  102,   45,
			   45,    2,    2,    2,    2,   65,  102,  102,   22,  102,
			   45,   45,   22,   22,   22,   25,    2,    2,    2,   22,

			   22,   22,   22,  102,   45,   45,    2,    2,    2,   22,
			   22,   22,    2,    2,    2,   22,   22,   22,   22,   22,
			   22,    1,    1,    1, yyDummy>>,
			1, 324, 1000)
		end

	yytypes2_template: SPECIAL [INTEGER] is
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    3,    4,    5,    5,    5,
			    5,    5,    5,    6,    7,    8,    8,    9,   10,   11,
			   12,   13,   13,   13,   14,   15,   15,   15,   15,   15,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,

			   16,   16,   17,   18,   19,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   21,    6,    6,    6,    2,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			   20,   20,    5,    5,   22,   23,   24, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1323)
			yydefact_template_1 (an_array)
			yydefact_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yydefact_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yydefact'.
		do
			yy_array_subcopy (an_array, <<
			   18,   18,   17,    1,   19,   47,    2,  748,   48,   51,
			    3,   49,   16,   23,   25,    0,   54,  111,   49,   49,
			   49,   50,    0,   29,  748,   30,  748,    0,    0,  726,
			  728,  740,  704,  723,  722,  721,  725,  724,  720,  719,
			  718,  717,  716,  715,  714,  713,  712,  711,  710,  709,
			  708,  707,  706,  705,  733,  746,  747,  745,  727,  729,
			  730,   39,    0,   34,   35,    0,   33,   26,   31,    0,
			   27,   36,  734,   38,   37,  741,   52,    0,    0,  113,
			    0,    0,    0,    0,   22,   24,  743,  736,  742,  735,
			    0,  642,   40,    0,    0,   42,   33,   32,    0,    0,

			    0,    0,   53,   58,  112,  117,  748,  748,    0,    0,
			    0,    0,   43,  443,    0,  431,    0,    0,    0,    0,
			  413,  419,    0,  414,  640,    0,   41,   28,   60,   59,
			   55,   57,   56,    0,  210,    0,  213,  401,  748,  210,
			  399,   14,   18,   13,    0,  432,  125,  130,  126,  115,
			  116,   46,   45,   44,  436,  422,  444,    0,    0,    0,
			  421,  420,  432,  432,  432,  457,  456,  436,  415,    0,
			  498,    0,    0,    0,    0,  356,    0,    0,  619,  607,
			  612,    0,  611,    0,  608,  623,  636,  559,  389,    0,
			    0,    0,  610,  596,  617,  616,  620,  597,    0,    0,

			  606,  615,  626,  604,  595,  573,  574,    0,  559,  618,
			  613,  624,  621,  598,  641,  609,  614,  605,  625,    0,
			    0,    0,   98,    0,    0,    0,    0,   61,   89,   77,
			  748,  211,  199,  205,  193,  189,    0,  381,  559,  402,
			  227,  399,    0,  748,  400,   18,   14,   47,    0,  234,
			  190,  229,  231,  228,  118,  433,  134,  127,  131,  135,
			  128,  132,  129,  133,  445,  746,  747,  745,    0,    0,
			    0,    0,    0,    0,  446,  447,    0,  413,  427,    0,
			    0,  417,  418,  416,  434,  443,    0,  431,  435,    0,
			  599,  600,    0,    0,  693,  289,  569,  568,  567,  570,

			    0,  603,    0,  601,  602,    0,  634,    0,  562,    0,
			  549,    0,  356,    0,  690,  691,  390,    0,  693,  389,
			  688,  689,  367,    0,  648,  622,    0,    0,    0,    0,
			    0,  643,  566,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  628,  644,
			  645,    0,  551,    0,    0,   63,   62,  436,   99,   80,
			    0,   79,   78,   89,   89,   89,   69,   64,  436,   90,
			   73,    0,  399,  161,  197,    0,  203,    0,    0,  214,
			  215,  212,    0,  382,  383,  385,  559,   18,  399,    0,
			   18,   11,   14,  233,  230,    0,  281,  330,  289,  236,

			  245,  235,  239,  232,  176,  181,  138,  171,  146,  124,
			  177,    0,  172,  182,  147,  441,  444,  441,  429,  428,
			  441,  432,  432,  432,  438,  746,  747,  745,  450,  449,
			    0,  423,  437,  442,  441,  441,  559,  312,  290,  293,
			  327,  326,  325,  324,  323,  322,  321,  320,  319,  318,
			  317,  316,  315,  314,  313,  292,  291,  328,  329,  311,
			  309,  308,  306,  310,  307,  305,  304,  303,  302,  301,
			  300,  299,  298,  297,  296,  295,  294,  696,  660,  633,
			  693,  693,    0,    0,  635,  560,    0,    0,  389,  354,
			    0,  391,  392,    0,  658,    0,  367,  370,    0,    0,

			    0,    0,    0,    0,  355,  559,  646,    0,    0,  594,
			  593,  576,  577,  578,  580,  582,  583,  585,  584,  586,
			  579,  581,  592,  589,    0,  588,    0,  587,  575,  559,
			    0,  693,  693,  632,   66,   65,  100,  746,  747,  745,
			    0,    0,    0,    0,    0,    0,  101,  102,    0,    0,
			    0,   89,   85,   75,   76,   74,   67,    0,   91,   98,
			    0,  431,   92,   18,  162,    0,    0,  198,  207,  206,
			    0,  204,  192,  217,  216,    0,    0,  384,  386,  387,
			    0,   18,   14,    5,   12,   18,  281,  246,  240,    0,
			    0,  282,  281,   18,  248,  242,    0,    0,  331,  238,

			  237,    0,    0,    0,    0,    0,  178,  172,  123,  173,
			  182,  183,    0,  148,  177,    0,    0,    0,  425,  426,
			  424,  441,  441,  454,    0,    0,  499,  694,    0,    0,
			    0,  737,  744,  663,  664,  637,  638,  639,  561,    0,
			    0,  559,  367,  692,  393,  693,  389,    0,    0,    0,
			  285,  748,  748,  394,  394,  360,  364,  359,  357,  362,
			  358,  361,  363,    0,    0,    0,  647,    0,  591,  590,
			  558,  627,    0,    0,  661,  662,  441,   99,  441,   87,
			   86,  441,   89,   89,   89,   94,  746,  747,  745,  105,
			  104,   93,   97,    0,   90,   68,    0,    0,  441,  441,

			    0,    0,    0,  160,  167,  196,  208,  209,  202,  222,
			  218,    0,  388,   14,    0,   18,   10,    0,  250,  244,
			  247,  241,  287,    0,   18,  111,  353,  332,  351,  348,
			  352,  350,  347,  345,  349,  346,  344,  343,  342,  341,
			  340,  339,  338,  337,  336,  335,  334,  333,  184,  185,
			  175,  180,    0,  139,  140,  137,  170,  156,  155,  151,
			  145,  182,    0,  122,  172,  440,  452,  453,  439,  451,
			    0,    0,  455,  448,  702,    0,    0,    0,  695,  701,
			  693,  559,  563,  564,  565,  550,    0,    0,  659,  367,
			  285,  394,  394,  378,    0,    0,  371,  372,  369,    0,

			  394,    0,    0,  395,  411,  411,  365,  187,  649,  650,
			  651,    0,  629,  630,  631,    0,    0,    0,   83,   84,
			   82,  441,  441,  109,   71,   72,   70,    0,    0,   14,
			  163,  166,  164,  165,  168,  220,    0,  219,   18,   14,
			    9,  249,  243,    0,  251,  287,  111,  389,  186,    0,
			  141,  152,    0,    0,    0,  121,  182,    0,  700,  697,
			  698,  699,  665,  548,  285,  394,  394,    0,    0,  394,
			  411,  411,  377,    0,  374,  373,  376,  375,  286,    0,
			  489,    0,    0,  488,  607,  559,    0,    0,  748,    0,
			  531,    0,    0,  556,    0,  461,  403,  485,    0,    0,

			  571,  482,  483,  474,  475,  477,  476,    0,  459,  396,
			  397,  748,    0,  412,    0,  366,  559,   96,  107,  108,
			   95,  106,    0,    0,  110,  103,   18,    0,    0,  221,
			    8,   18,  288,  252,    0,   18,  111,   18,  389,  367,
			  142,  154,  157,  158,  150,  120,    0,  633,  394,  411,
			  411,  285,  394,  394,    0,    0,    0,  379,  693,    0,
			    0,    0,    0,  549,  748,    0,    0,    0,  534,  748,
			    0,  572,  571,  496,  486,    0,    0,    0,  405,  404,
			  407,    0,  551,    0,    0,    0,  398,    0,  678,  682,
			  547,    6,  225,  223,  224,    7,    0,  657,  283,  652, yyDummy>>,
			1, 1000, 0)
		end

	yydefact_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yydefact'.
		do
			yy_array_subcopy (an_array, <<
			  653,  283,  654,  732,  731,  656,  655,  739,  738,  283,
			  283,  111,  389,   18,  111,  367,  394,    0,    0,  143,
			  159,  119,  703,    0,    0,    0,  394,  411,  411,  687,
			  680,  684,  380,  685,  492,    0,  633,    0,    0,    0,
			  748,  748,  469,    0,  532,    0,  529,    0,    0,    0,
			  487,  479,  478,  406,  408,    0,  559,  473,  481,  480,
			  467,  693,  693,    0,  284,  256,  254,  255,  253,  389,
			  367,  111,  389,  394,    0,    0,    0,  285,  394,  394,
			  693,  667,  671,    0,    0,    0,  693,  693,  693,    0,
			  490,    0,  559,  509,  748,    0,  517,    0,  512,  511,

			    0,  500,    0,    0,    0,    0,    0,    0,  533,    0,
			    0,  559,  409,  559,    0,  558,  677,  681,    0,  367,
			  394,    0,    0,  389,  367,    0,  285,  394,  394,  283,
			  394,  411,  411,  674,  693,  693,  676,  669,  673,  686,
			  679,  683,  559,    0,  559,  550,    0,  508,    0,  514,
			  513,  463,  501,  502,    0,    0,  505,  504,    0,  537,
			  535,  536,  530,  494,  497,    0,    0,  394,    0,    0,
			    0,  285,  394,  394,  367,  394,    0,    0,  283,  394,
			  411,  411,  277,    0,    0,    0,  666,  670,  693,  693,
			  693,  493,  559,  548,  465,  733,  556,  526,  620,  518,

			  522,  519,  516,    0,  559,  524,  732,  605,  503,    0,
			  506,  559,    0,  410,  748,    0,    0,  285,  394,  394,
			  283,  394,  411,  411,  394,    0,    0,    0,  285,  394,
			  394,  278,    0,    0,    0,  283,  283,  283,  675,  668,
			  672,  491,  521,    0,  520,    0,  507,  547,  559,    0,
			  484,  283,  394,  411,  411,  266,    0,    0,    0,    0,
			  285,  394,  394,  283,  394,  411,  411,  283,  283,  283,
			  279,  273,  275,  523,  559,  495,  471,  265,    0,    0,
			    0,  283,  283,  283,  283,  394,  411,  411,  268,    0,
			    0,    0,  280,  274,  276,  558,  283,  283,  283,  270,

			  258,  262,  267,    0,    0,    0,  283,  283,  283,  269,
			  257,  261,  283,  283,  283,  272,  260,  264,  271,  259,
			  263,    0,    0,    0, yyDummy>>,
			1, 324, 1000)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			  352,  638,  271,  272,  273,  254,  765,  255,  155,  416,
			  766,  776,  777,  478,  778,  317,  598,  844,  192,  671,
			  193,  194,  195,  894,  196, 1199, 1200, 1201, 1097, 1202,
			    9,   10,  583,  701,  702,  758,  703,  895,  912,  653,
			  654, 1041, 1095,  913,  896, 1215, 1001,  543,  544,  545,
			  369,  370,  917,  677,  359,  918,  367,  695,  548,  549,
			  379,  380,  230,  231,  381,  197,  234,  567,  139,  134,
			  235,  897, 1156, 1103, 1157,  759,  410,  614,  760,  237,
			  199,  200,  201,  202,  203,  204,  205,  206,  207,  396,
			  800,  251,  252,  240,  241,  253,  941,  397,  749,  568,

			  500,  501,  502,  503,  592,  504,  100,  101,   17,  102,
			  208,  120,  901,    4,    5,   12,   13,   14,   67,   68,
			   69,   70,  209,  902,  903,  904,  905,  906, 1205,  210,
			 1004,   72,  244,  245,   11,   22,  593,  750,  611,  612,
			  606,  607,  609,  610,  121,  794,  795,  796,  797,  499,
			  798,  979,  980,  211,  484,  212, 1107, 1108,  969,  213,
			  214,   79,  215,  146,  147,  148,  106,  107,  149,  150,
			  804,  322,  399,  400,  401,  402, 1006,  216,  632,   75,
			  753,  754,  414,  755, 1065,  217,  218,  666,  219,  279,
			  123,  280,  928,  710,  929, 1055, 1098, 1099, 1038,  907,

			 1321,  584,  143,    7,   24,   26,   15,   77,  557,  169,
			  615,  108,  603,  605,  853,  852,  565,  604,  601,  602,
			  378,  566,  375,  570,  377,  236,  836,  403,  649,  239,
			  983, 1148, 1045,  486,  530,  307,  125,  507, 1134, 1189,
			 1135, 1190, 1188, 1061, 1087, 1062, 1088, 1086,  628, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1323)
			yypact_template_1 (an_array)
			yypact_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yypact_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yypact'.
		do
			yy_array_subcopy (an_array, <<
			   34,  900, 4853, -32768, -32768, 1241, -32768, -32768, -32768, 1199,
			 -32768,   80, -32768, 1261,  394, 1759, 1202,  840, 1314, 1314,
			 1314, -32768, 1310, -32768, -32768, -32768, -32768,  132,  127, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, 1204, -32768, -32768,   25, 1198, -32768, 1194, 1759,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  790, 4824, 1292,
			 1308, 1307, 1303,  885, -32768, -32768, -32768, -32768, -32768, -32768,
			  969, 1188, -32768, 1293, 1759, -32768, -32768, -32768,  885,  885,

			  573,  790, -32768, 1245, -32768, 1854, 1318, 1049,  888,  885,
			  885,  885, -32768, 1166,  547, -32768,  888,  888,  888,  726,
			 1057, -32768, 1179, -32768, -32768, 4180, -32768, -32768, 1239, 1238,
			 -32768, -32768, -32768, 1641, 1242,  287, -32768, 4180,  690, 1242,
			 1185, 1274,  900, -32768,  750, 1057,   36,  -23,  888, -32768,
			 -32768, -32768, -32768, -32768, 1162, -32768, -32768, 2268, 1212, 1211,
			 -32768, -32768, 1057, 1057, 1057, -32768, -32768, 1157, -32768, 2138,
			 1156, 4180, 4180,  227,  255, -32768,  969, 4180, -32768,  846,
			 -32768, 4180, -32768, 4180,  823, -32768, 1219,  766, 1266, 1155,
			 4824, 1148, -32768, 1147, -32768, -32768, -32768, -32768, 4623, 1146,

			 1139, -32768, -32768, -32768,  902, -32768, -32768, 4081,  -48, -32768,
			 -32768, -32768, -32768, -32768, -32768,  724, -32768, 1135, -32768, 4180,
			 1641, 1641, 1129,  547,  888,  888,  888, 1215,  990, -32768,
			  690, -32768,  711,  700, 1100, -32768,  227, 4509,  763, 4180,
			 -32768, 1185, 1240,  690, -32768,  900, -32768, 1241, 1246, 1140,
			 -32768, 1240,  282, -32768, 1068, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  701,  809,  688,  888,  888,
			  888, 2138,  916,  916, -32768, -32768, 1134, 1057, 1131, 1130,
			 1116, -32768, -32768, -32768, -32768,  235,  547, 1109, -32768,  885,
			 -32768, -32768, 4905, 4883,  503, -32768, -32768, -32768, -32768, -32768,

			 1112, -32768,  227, -32768, -32768,  227, -32768, 4180, 1105,  888,
			 -32768,  969, 1104,  969, -32768, -32768, 3982, 1098,  503,   28,
			 2029, -32768,  553, 4180, 1102, -32768,  969, 4180, 4180, 4180,
			 4180, -32768, -32768, 4180, 4180, 4180, 4180, 4180, 4180, 4180,
			 4180, 4180, 4180, 4180, 3883, 3784, 4180,  885, -32768, -32768,
			 -32768,  227, 1899,  227, 4667, 1215, 1215, 1097, -32768, -32768,
			 1276, -32768, -32768,  990,  990,  990, 1203, -32768, 1095, -32768,
			 -32768, 1101, 1185, 1094, 1503,  885, 1167,  885,  287, 1089,
			  227, -32768,  562, -32768, 1078, 4436,  607,  900, 1185, 1196,
			  172, -32768, -32768, -32768, -32768,  227, 1257, -32768, 1206, -32768,

			 -32768, -32768, -32768,  282,  569, 1193,  813,   94,  597, -32768,
			 1092, 1190, 1044, 1023, 1184, -32768, 1070, -32768, 1074, 1073,
			 -32768, 1057, 1057, 1057, -32768, 1067, 1066, 1064, -32768, -32768,
			  969, 1059, -32768, -32768, -32768, -32768,  159, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, 1043, -32768,  875,
			  503,  503, 4450, 3685, -32768, -32768, 4180, 1063,  638, -32768,
			 1062, 4180, 4180,  227, -32768,  969,  537,  206, 4824,   82,

			  885,  885,  349,  312, -32768,  617, -32768,  227, 1060,  402,
			  402,  842,  842,    7,    7,    7,  402,  402,  402,  402,
			    7,    7, 4726, 1704, 4180, 1704, 4180, 4564, -32768,  159,
			 4180,  503,  503, -32768, -32768, -32768, -32768,  668,  248,  518,
			  888,  888,  888, 1101,  909,  909, -32768, -32768, 1054, 1040,
			 1035,  990, 1037, -32768, -32768, -32768, -32768,  885, -32768,  232,
			  547, 1033, -32768,  900, -32768,  885,  885, -32768,  885, 1018,
			  885, -32768, -32768, -32768, -32768, 1029, 1029, -32768, -32768, 1026,
			 1127,  900, -32768, -32768, -32768,  172, 1082, -32768, -32768,  282,
			  969, -32768,   24,  900, -32768, -32768,  885, 4861, -32768, -32768,

			 -32768,  227,  227,  227,  227,   69, -32768, 1044, -32768, -32768,
			 1023, -32768, 1125, -32768, 1092, 2268,  916, 2268, 1031, 1021,
			 1013, -32768, -32768,  269, 2138, 2138, -32768, -32768, 3091,  227,
			  885, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, 4579,
			 3586,  159,  383, -32768, 4180,  503,  638, 4824,   82,  885,
			  372,  511,  303,  231,  231, -32768,  493, -32768, -32768, -32768,
			 -32768, -32768, -32768,  969,  661,   44, -32768, 1010, 1704, 4564,
			 1532, -32768, 4520, 3487, -32768, -32768, -32768, 1008, -32768, 1005,
			  983, -32768,  990,  990,  990, -32768,  997,  995,  993, -32768,
			 -32768, -32768, -32768, 1641,  989, -32768,  176,   30, -32768, -32768,

			 1080,  601,  575, -32768,  976, -32768, -32768, -32768, -32768,  973,
			 -32768,  970, -32768, -32768, 1077,  172, -32768,  282, -32768, -32768,
			 -32768, -32768, 1024,  969,  900,  840, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  892,  227,
			 -32768, -32768, 1085, -32768,  227, -32768, -32768, -32768,  272,  522,
			 -32768, 1023, 1069, -32768, 1044, -32768, -32768, -32768, -32768, -32768,
			  916,  916, -32768, -32768, -32768,  969,  640, 2992, -32768, 4711,
			  503,  159, -32768, -32768, -32768, -32768, 4824,   82, -32768,  306,
			  372,  231,  231,  449,  885,  885,  885,  885, -32768, 4824,

			  231, 2893, 2893, 3388,  182,  182,  947, -32768, -32768, -32768,
			 -32768,  885, -32768, -32768, -32768, 1276,  909, 1276,  952,  945,
			  943, -32768, -32768,  178, -32768, -32768, -32768, 1101, 1101, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  969, -32768,  172, -32768,
			 -32768, -32768, -32768,  227,  428, 1024,  840,  638, -32768,  227,
			 -32768, -32768,  227,   69, 1050, -32768, 1023,  940, -32768, -32768,
			 -32768, -32768, -32768, -32768,  372,  231,  231, 4824,   82,  231,
			  182,  182, -32768,  969, -32768, -32768, -32768, -32768, -32768, 1045,
			 -32768,  107,  969, -32768,  103,  561, 4180, 4180,  373,  934,
			  930,  771, 3289,  987,  986, -32768, 1009, -32768,  919,  902,

			 2159, -32768, -32768, 1889, -32768, -32768, -32768,  482, -32768, 4180,
			 4180, 1017, 1016, -32768, 1014, -32768,  159, -32768, -32768, -32768,
			 -32768, -32768,  909,  909, -32768, -32768,  172,  376,  969, -32768,
			 -32768,  172, -32768, -32768, 4403, 1404,  840,  266,  638,  505,
			  905, -32768,  892,  227, -32768, -32768,  984,  467,  231,  182,
			  182,  372,  231,  231,  980,  971,  964,  836,  503,  702,
			  834,  849,  888, 2794, 4214, 4329, 2893,  969,  820,  927,
			  969, -32768, -32768,  807, -32768, 3190, 4180, 4180, 4180, -32768,
			  877,  885, 2289, 2893, 4180, 4180, 4180, 2893, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  969, -32768,   40, -32768, yyDummy>>,
			1, 1000, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yypact'.
		do
			yy_array_subcopy (an_array, <<
			 -32768,   40, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   40,
			   40,  840,  638,  900,  840,  465,  231, 4824,   82, -32768,
			 -32768, -32768, -32768,  913,  904,  896,  231,  182,  182, -32768,
			 -32768, -32768, -32768, -32768,  727,  702,  773,  789,  646,  706,
			  737,  565, -32768,  785, -32768, 4824, -32768, 2893,  781,  885,
			 -32768, 4711, 4711, 4180, 4180,  848,  159, -32768, 4711, 4711,
			 -32768,  503,  503,  769, -32768, -32768, -32768, -32768, -32768,  638,
			  399,  840,  638,  231, 4824,   82,  826,  372,  231,  231,
			  503, -32768, -32768,  810,  806,  796,  503,  503,  503,  885,
			  679,  885,  159, -32768,  775,  739,  734,  719,  706, -32768,

			 2893, -32768,  730,  504,  642,  604,  305, 4824, -32768,  713,
			  702,  159, 4711,  314, 4180, 1662, -32768, -32768,  322,  360,
			  231, 4824,   82,  638,  357,  654,  372,  231,  231,   40,
			  231,  182,  182, -32768,  503,  503, -32768, -32768, -32768, -32768,
			 -32768, -32768,  159,  885,  159, 2669, 2893, -32768, 4295, -32768,
			 -32768, -32768, -32768, -32768,  647, 4180,  642, -32768,  885, -32768,
			 -32768, -32768, -32768,  525, -32768, 4180, 4343,  231, 4824,   82,
			  631,  372,  231,  231,  340,  231, 4824,   82,   40,  231,
			  182,  182, -32768,  621,  616,  595, -32768, -32768,  503,  503,
			  503, -32768,  159, 2544, -32768,  471, -32768, -32768,  104,  475,

			  535, 4295, -32768,  436,   76, -32768,  262,   95, -32768, 4329,
			 -32768,  159,  885, 4711,  545,  496,  488,  372,  231,  231,
			   40,  231,  182,  182,  231, 4824,   82,  479,  372,  231,
			  231, -32768,  466,  440,  434,   40,   40,   40, -32768, -32768,
			 -32768, -32768, -32768, 4295, -32768,  885, -32768, 2419,  159, 2893,
			 -32768,   40,  231,  182,  182, -32768,  426,  418,  396,  378,
			  372,  231,  231,   40,  231,  182,  182,   40,   40,   40,
			 -32768, -32768, -32768, -32768,  159, -32768, -32768, -32768,  326,  319,
			  311,   40,   40,   40,   40,  231,  182,  182, -32768,  296,
			  256,  229, -32768, -32768, -32768,   63,   40,   40,   40, -32768,

			 -32768, -32768, -32768,  209,  199,  196,   40,   40,   40, -32768,
			 -32768, -32768,   40,   40,   40, -32768, -32768, -32768, -32768, -32768,
			 -32768,  191,   74, -32768, yyDummy>>,
			1, 324, 1000)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -168,  777, -32768, -32768, -32768,  -92, -108,  -95, -32768, 1302,
			 -148, -32768, -32768, -189,  637, -32768, -32768,  567,   -3,  736,
			   20, -32768, -32768, -1095,  -14, -32768,  165, -32768, -32768,  201,
			 -32768, 1159,  878, -32768, -32768,  234,  166, -710,  174, -585,
			 -601, -1060, -953, -32768, -32768, -32768,  472, -32768, -32768, -32768,
			  850, -336, -347, 1176, -32768, -318,  476,  703, -118, -32768,
			 -32768, -32768, 1254, 1283, 1012,   67, -32768, -354, -32768, -32768,
			 -109, -32768, -32768, -32768,  228, -32768,  972, -32768,  530,  908,
			 -282, -32768, -32768, -32768, -32768, -536, -32768,  456, -291, -391,
			 -733, -32768, -32768, 1272, -120, 1126,  439,  -98, -481, -525,

			 -32768, -32768, -32768, -32768, 1187,  509, -32768, -32768, -32768, 1275,
			  -15,  546, -32768, -32768, -102,  967, -32768, -32768, -32768, -32768,
			 -32768,   51, -32768, -32768, -32768, -32768, -32768, -32768, -211, -904,
			   18, -32768, 1265, -195, -32768, 1003,  774, -566, 1114, -592,
			 1108,  744, 1106, -596,   42, -32768, -32768, -32768, -32768, -475,
			  119, -32768, -32768, -32768,  874,   -9, -32768,  249, -32768, 1288,
			 1145, -705,   66, -32768, -32768, -32768, -32768, -32768,  879,  867,
			  192, -312, -344,  956, -353,  955, -32768, -224,   -5, -32768,
			 -32768, -32768, -32768,  591,  168, -1103, -32768,  677, -171,  -32,
			 -32768, -32768, -32768,  767,  405, -32768, -32768,  243, -32768, -850,

			 -32768, -563, -133, -32768, -32768, -32768, -104, -32768, -32768,  -13,
			  374, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -302,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5006)
			yytable_template_1 (an_array)
			yytable_template_2 (an_array)
			yytable_template_3 (an_array)
			yytable_template_4 (an_array)
			yytable_template_5 (an_array)
			yytable_template_6 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytable_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yytable'.
		do
			yy_array_subcopy (an_array, <<
			   66,   64,  135,  144,  586,  141,   73,  496,  247,  275,
			   74,  761,   63,  546,  492,  227,  483,  323,  762,  310,
			  847,  648,  716,  571,  562,  168,  665,  553,  554,  555,
			 1003, 1003,  696,   71,  242,  250,  751, 1149,  756,   92,
			  248,  973,  547,  595,  826, 1207,  387,  792,  115,  274,
			  600,  591,  594, 1197,   96,   64,    2,  869,  122,  599,
			   73,  288,  103,  791,   74,  316,   63,  293,  112,  104,
			  281,  282,  283,  308, 1323,  294,  298,  346,  292,   96,
			   64,  351,   65,  128,  129,   73,  103,   71, 1102,   74,
			  318,   63,  908,  652,  151,  152,  153,   21, 1207,  160,

			  157,    1,  355,  356,  166, -546, 1197,  115, -169, 1034,
			  372,  259,   71,  390,  651,   57,   56,   55, -527,  334,
			   97, -546,  238,  388,  428,  429,  242,   20,   19,  494,
			   18,  948,  161, -169, -527,  119,   65, -528,  382,  242,
			 1207,  938,  276,  389,  300,  127, -525,  723, 1197, 1246,
			 1154,  495,  840, -528,  707,  118,  117,  116,  295,  295,
			   91,   65, -525,  424, -572, -572,  809,  787,  856,  854,
			  256,  696,   -4,  320, 1064,  229,  642,  563,  115,  114,
			  113,  325,  431,  848,  665, 1090,  866, -546,  373,  644,
			  824, 1322,  483,  581,    2,  640,  685,  308, -545,  278,

			 -527,   89,  865,  757,  480,  351,   87,  481,  361,  360,
			 1314,  278,  705, 1313,  706,  371,  708, -368, 1026, -528,
			  911,  295, -557, 1312,  386,  596,  689,  690, -525,   88,
			 -552, 1012,  302,  719,   86,  959,  721,  398, -368,  673,
			  299,  362,  718, 1308, 1206,  720,  803,   57,   56,   55,
			  293,  418,  157,  531,  321,  532, 1042,  276,  276,  585,
			 1163,  292,  229,  229,  946,  899,  899,  953,  626,  572,
			 1307,  418,  157, 1057,  436,  930,  851, 1060,  293,  488,
			  308,  490,  382,  952,  419,  580, -153,  295,    2,  292,
			  295,  633,  634, 1013,  508,  233,  232, 1206,   57,   56,

			   55,  238,  395,  925,  419,  293, 1069, -153,  505, 1072,
			 1306, -153,  924,  278,  868, -153,  292, -458, -458,   57,
			   56,   55,   54,  867,  297, 1298,   57,   56,   55,  618,
			  619,  620,  529, 1297,  789,  497,  295, 1109,  295, 1206,
			 1296, -458,  674,  675, 1130,  550,  818,  819,  820,  640,
			  371,  371,  371,   57,   56,   55,  698, 1225,  296,  434,
			  569,  670,  569,  991,  842,  295, 1123,  357,  995,  497,
			  154,  943,  678,  841, 1176,  799,  175, 1168,  159,  158,
			  398,  398,  673,   57,   56,   55,  497, 1224,  398,  497,
			 1151, -153, 1284, 1179,  773,  645,   54, -613,  623, -468,

			  786,  -21,  552,  772, 1175,  -21, -153, 1167,  -21,  664,
			 1283,  -21,  497,  552,  -21,  596, 1121, 1079, -468, -468,
			   57,   56,   55,  -21,   31,  -21,  -21, 1160,  497, 1159,
			  899,  -21, 1282, 1078,  660,  308, 1194, 1165, 1221,  -18,
			 1281,  -21,  -21,  351,  -21,  -18, 1120,  899, 1269,  715,
			    2,  899,   28,   27, 1268,  935,  788,  -18,  940,  -18,
			  -18,  700,  943,  646, 1018,  -18,  374,  376,  767,  769,
			  920,  658,  346,  785, 1128,  -18,  238,  386,  295,  714,
			 1267,  920, 1074,  393, 1252,  656,  656,  656,  656,  650,
			 1127,  725,  295, 1263,  497, 1264,  993,  631,  919,  921,

			  992,  910, 1251,  748,  748,  752,  748,  341,  340,  768,
			 1250,  899, 1073,  335,  334,  333, 1094,  768, 1153,  898,
			  898, 1173, 1017,  679,  360, -460, -460, 1285,   25,  550,
			  550,  780,  330,  329,  497,  939, -149, 1172,  371, 1276,
			 1075,   54,  697,  985,  984,  679,  360,  801,  802, -460,
			  704,  569, 1016,  569,  647,  569,  680, -149,  722, -470,
			  934, -149,  933, 1245,  899, -149,  497,  664, 1219,   31,
			  498,  398,  873,  872,  398,  823, 1230, 1094,  680, 1101,
			  838,  656,  497, -174, 1218,  552,  295,  295,  295,  295,
			  975,  862, 1229, 1243,  630, 1122,  629,   28,   27, 1242,

			  276,  276,  276, 1022, -174,  921, -611,  986, -174, 1237,
			  899, -144,  899,  863,  295,  781,  663,  662,   57,   56,
			   55,   54,  846,  769,  477, 1262, 1015,  290,  291,  386,
			 1236,  806, -144,  301,  793, 1235, -144,  303,  790,  304,
			 -144, 1261,  681, -431, 1169, 1220,   57,   56,   55, 1177,
			  295,  748, 1212, -431,  145, 1155,  752,  278, 1094,  278,
			 1093, 1208,  162,  163,  164,  899,  278,  278, 1178,  371,
			  371,  371,   57,   56,   55,  316, 1053,  159,  158,  228,
			  962,  697,  308,  576,  898,  575,  704,  704, -364, -364,
			 -364,  845,  145,  145,  145,  832,  926,  131,  130, 1226,

			 1070,  898,  398,  277, -226,  898,  931,  899, -201, -201,
			 1007, 1007, -226,  899, -201,  277, -226,  963, -201, -195,
			 -195,  830, -201, 1002, 1002, -195, -201, 1162,  308, -195,
			  579, 1158,  982, -195,  295,  229,  351, -195,  308,  295,
			  663,  662,  936,  857, 1152,  932,  351, 1096,  990, -462,
			 -462, -462, -201, 1147,  942,  276,  276, 1119,  233,  232,
			 1124, 1040,  859, -195,  858,  898,  228,  228,  249, 1033,
			  363,  364,  365,   57,   56,   55, -515,  864, -462,  793,
			  793,  793,  793,  808,  966,  807,  900,  900,  238, -464,
			  878,  616,  676,  -98,  617,  165,  916,   57,   56,   55,

			  550,  550,  550,  357,  927,  971, 1143,  987,  624,  625,
			 1138, 1174,  420, -431,  421,  422,  423,  277,  898,  373,
			 1137,  893,  893, -431, 1136,  415, -443, -136,  295, -136,
			  373,  534,  535, 1011,  398, 1014,  154,  295,   99,   98,
			 1129,  957,   57,   56,   55,  942,  805,   54, -136,  960,
			  961, -554, -136,  353, 1089,  487, -136,  552,  951,  552,
			 1039,   57,   56,   55,  898, 1047, 1203,  831,  833,  552,
			  552,   78, 1116, 1117,  971,   31,  972,  238,    3,    6,
			   57,   56,   55,   54,  308,  309,  384,  308, 1115, 1118,
			  970, 1133,  351, 1114,  238,  386,  927, 1139, 1140, 1141,

			 1091, 1110,  629,   28,   27, 1105,  551,  550,  550, 1092,
			 1082, 1071,  346,  874,  875,  876,  877,  551, 1081, 1203,
			 1000, 1000,    2, 1054, 1145, 1005, 1005, 1080,  295, 1008,
			 1008,  999,  999,  417, 1049, 1043, 1100, 1104, 1048,  159,
			  158, 1046, 1044, 1164,  972, 1186, 1187,  341,  340,   54,
			 -553,  900,  305,  335,  334,  333,   57,   56,   55,  115,
			  386, 1203, 1035,  238, 1063,  631, 1056,  898,  900, 1036,
			 1032,  386,  900, -552, 1191,  302, 1193,   31, 1031,  914,
			  688,  687,  686,  870,  871, 1030,  893,  427,  426,  425,
			 1146,   84,  879,   85, 1029,  770,  771,  119, 1021, 1238, yyDummy>>,
			1, 1000, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yytable'.
		do
			yy_array_subcopy (an_array, <<
			 1239, 1240,  630,  893,  629,   28,   27,  893, 1077,  655,
			  657,  659,  661,  258,  261,  263,  807,  118,  117,  116,
			  972,   80,   81,   82, 1241,  257,  260,  262,  989, 1019,
			  988, -466,  900,  198, 1111,  978, 1106,  348,  386, 1113,
			  115,  114,  113, 1247,  955,  956,  981,  977,  976,  -14,
			  815,  968,  816,  967,  631,  817,  -18,  949,  950,  958,
			  947,  954,  405,  -18,  945, 1126,  -18,  893,  -74,  -18,
			  -76,    2,  827,  828, 1142,  137, 1144,  -75,  843,  407,
			 1275,  915,  409,  855,  408,  900,  682,  683,  684,  551,
			  849,  839,  837,  835,  829,  972,  -18,  -18, 1106,  -18,

			  834,  136,  395,  407,  406,  293, 1295,  405,  -78,  591,
			 1249,  404, 1171,  -81, -191,  198,  292,  822, -191,  678,
			  893,  821, -191, 1024, 1025,  368, -191,  354, 1192,  119,
			  -79,  900,  -88, 1204, 1198,  404,  631,  811, -416,  763,
			 1023,  713,  707, 1211, 1027, 1028, -418,  385,  709,  542,
			  541,  540, -191,   57,   56,   55, -417,  699,  693, 1217,
			  712,  277,  -77,  277,  692,  627,  893, 1228, 1196, 1066,
			  277,  277,  561,  560,  559, -200, -200, 1067, 1068,  691,
			  667, -200,  643,  641, -415, -200, 1204, 1198,  622, -200,
			  417,  621,  167, -200, -430,  922,  923, 1248, -420, -421,

			  408, 1084, 1085,  312,  608,  590,  717, -179, 1076,  597,
			  582,  137,  577,  573,  564,  482, 1260,  556, 1083, -200,
			  558, 1196,  536,  366,  506,  493,  489,  485, 1204, 1198,
			 1274,  354,  479,  435,  900,  509,  510,  511,  512,  228,
			  433,  513,  514,  515,  516,  517,  518,  519,  520,  521,
			  522,  523,  525,  527,  528,  432, -419,  430,  249,  373,
			  392,    8, -557, 1196,  357, 1125, -555,  326,  -20,  893,
			 1131, 1132,  -20,  347, -556,  -20,  324,  395,  -20,  306,
			  293,  -20,  284,  289,  591,   89,   87,  264,  246,  293,
			  -20,  292,  -20,  -20,  136,  221,  220, 1182,  -20,  170,

			  292,  154,  133,  316,  119, 1184, 1185,  126,  -20,  -20,
			  111,  -20, 1170,  124,  110,  109,  105,   83,   95, 1180,
			 1181,   94, 1183,   90,  542,  541,  540,   76,   57,   56,
			   55,   21, -188,  994,   16,  315, -188,   57,   56,   55,
			 -188, 1150,  810,  711, -188,  850, 1231,  539,  538,  537,
			  588,  587,  350,   93, 1233, 1234, 1161,  637,  764, 1216,
			  413,  551,  412,  551, 1222, 1223,  724, 1227,  411,  314,
			 -188, 1232,  142,  551,  551,  319,  132,  394,  312,  140,
			  590,  589, 1020,  944, 1210,  313,  613,  312, 1255,  311,
			  138,  482,  574,  243,  639,   23, 1257, 1258,  358,  825,

			  385,  694, 1244, 1270, 1271, 1272,  391, 1010, 1273,  814,
			 1253, 1254,  937, 1256,  861,  156, 1259,  784,    0, 1277,
			    0, 1265, 1266,    0,    0,    0,    2, 1279, 1280,    0,
			    0, 1288,  668,    0,  669, 1292, 1293, 1294,  672, 1290,
			 1291,    0,    0,    0, 1278,    0,    0,    0, 1009, 1299,
			 1300, 1301, 1302, 1286, 1287,    0, 1289,    0,    0,    0,
			 1304, 1305,    0,    0, 1309, 1310, 1311,    0,  997,   60,
			   59,    0,   58,    0, 1315, 1316, 1317, 1303,   54,    0,
			 1318, 1319, 1320,    0,   53,   52,   51,   50,   49,   48,
			   47,   46,   45,   44,   43,   42,   41,   40,   39,   38,

			   37,   36,   35,   34,   33,   32,   31,    0, 1037,    0,
			    0, -194, -194,    0,    0,    0,    0, -194,    0,   30,
			   29, -194,    0,  996,    0, -194,    0,    0,    0, -194,
			    0,    0,    0,    0,   28,   27,  779,    0, -545,    0,
			 -545,    0, -545, -545, -545, -545, -545, -545,  639, -545,
			 -545, -545,  385, -545, -545, -194,    0, -545, -545,    0,
			    0, -545, -545,    0, -545, -545,    0,    0,    0,    0,
			 -545,    0, -545, -545, -545,    0,    0, -545, -545, -545,
			    0,  672,    0,    0,    0,    0,    0, -545, -545,    0,
			    0, -545, -545,    0,    0,    0, -545, -545, -545,    0,

			 -545, -545, -545, -545, -545, -545, -545, -545, -545, -545,
			 -545, -545, -545, -545, -545, -545, -545, -545, -545, -545,
			 -545, -545, -545, -545, -545, -545, -545, -545, -545, -545,
			 -545, -545, -545, -545, -545, -545, -545, -545, -545, -545,
			 -545, -545, -545, -545, -545, -545, -545, -545, -545,    0,
			 -545, -545,    0, -545, -545,    0, -545, -545, -545,    0,
			 -545, -545, -545, -545, -545, -545, -545, -545, -539,  119,
			 -539,    0, -539,    0, -539, -539, -539, -539,    0,    0,
			 -539, -539,    0, -539,    0,  779,    0, -539, -539,  226,
			  225,  224,    0,    0,    0, -539,    0,    0,    0,    0,

			 -539,    0, -539, -539,    0,    0,    0, -539, -539,    0,
			    0,    0,  115,  223,  222,    0,    0, -539, -539,    0,
			    0, -539,    0, -546,    0,    0, -539, -539, -539,    0,
			 -539, -539,    0, -539, -539, -539, -539,    0,    0,    0,
			    0,    0, -539, -539, -539, -539, -539, -539, -539, -539,
			 -539, -539, -539, -539, -539, -539, -539, -539, -539, -539,
			 -539, -539, -539, -539, -539, -539, -539,   62,    0,    0,
			    0,    0,    0,    0,  346,    0, -539, -539, -539,  345,
			    0, -539,    0, -539,    0,    0,    0,    0, -539,    0,
			 -539, -539,    0,    0,  964,  965, -539, -545,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,  341,
			  340,  339,  338,  337,  336,  335,  334,  333,  385,    0,
			    0,    0,    0,   61,   60,   59,    0,   58,    0,    0,
			   57,   56,   55,   54,  330,  329,  328,  327,    0,   53,
			   52,   51,   50,   49,   48,   47,   46,   45,   44,   43,
			   42,   41,   40,   39,   38,   37,   36,   35,   34,   33,
			   32,   31, -114, -114,    0,    0,    0,    0, -114,    0,
			    0,    0, -114,    0,   30,   29, -114,    0,    0,    0,
			 -114,    0,    0,  385, 1051, 1052,    0,    0,    0,   28,
			   27,    0, 1058, 1059,  385,    0,    0,    0,    0,    0,

			    0, -472, -472, -472, -472, -544, -114, -544,    0, -544,
			 -544, -544, -544, -544, -544, -472, -544, -544, -544,    0,
			 -544, -544,    0,    0, -544, -544,    0, -472, -544, -544,
			 -472, -544, -544,    0, -472, -472,    0, -544,    0, -544,
			 -544, -544,    0,    0, -544, -544, -544,    0,    0,    0,
			    0,    0,    0,    0, -544, -544,    0,    0, -544, -544,
			    0,  385, 1112, -544, -544, -544,    0, -544, -544, -544,
			 -544, -544, -544, -544, -544, -544, -544, -544, -544, -544,
			 -544, -544, -544, -544, -544, -544, -544, -544, -544, -544,
			 -544, -544, -544, -544, -544, -544, -544, -544, -544, -544, yyDummy>>,
			1, 1000, 1000)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #3 of template for `yytable'.
		do
			yy_array_subcopy (an_array, <<
			 -544, -544, -544, -544, -544, -544, -544, -544, -544, -544,
			 -544, -544, -544, -544, -544, -544,    0, -544, -544,    0,
			 -544, -544, 1166, -544, -544, -544,    0, -544, -544, -544,
			 -544, -544, -544, -544, -544, -289,    0, -289,    0, -289,
			 -289, -289, -289, -289, -289,    0, -289, -289, -289,    0,
			 -289, -289,    0,    0, -289, -289,    0,    0, -289, -289,
			    0, -289, -289, 1209,    0,    0,    0, -289,    0, -289,
			 -289, -289,    0, 1213, -289, -289, -289,    0,    0,    0,
			    0,    0,    0,    0, -289, -289,    0,    0, -289, -289,
			    0,    0,    0, -289, -289, -289,    0, -289, -289, -289,

			 -289, -289, -289, -289, -289, -289, -289, -289, -289, -289,
			 -289, -289, -289, -289, -289, -289, -289, -289, -289, -289,
			 -289, -289, -289, -289, -289, -289, -289, -289, -289, -289,
			 -289, -289, -289, -289, -289, -289, -289, -289, -289, -289,
			 -289, -289, -289, -289, -289, -289,    0, -289, -289,    0,
			 -289, -289,    0, -289, -289, -289,    0, -289, -289, -289,
			 -289, -289, -289, -289, -289, -559,  119, -559,    0, -559,
			    0, -559, -559, -559, -559,    0,    0, -559, -559,    0,
			 -559,    0,    0,    0, -559, -559,  270,  269,  268,    0,
			    0,    0, -559,    0,    0,    0,    0, -559,    0, -559,

			 -559,    0,    0,    0, -559, -559,    0,    0,    0,  287,
			  286,  285,    0,    0, -559, -559,    0,    0, -559,    0,
			    0,    0,    0, -559, -559, -559,    0, -559, -559,    0,
			 -559, -559, -559, -559,    0,    0,    0,    0,    0, -559,
			 -559, -559, -559, -559, -559, -559, -559, -559, -559, -559,
			 -559, -559, -559, -559, -559, -559, -559, -559, -559, -559,
			 -559, -559, -559, -559,    0,    0,    0,    0,    0,    0,
			    0,    0,    0, -559, -559, -559,    0,    0, -559,    0,
			  308,    0,    0,    0,    0, -559, -559, -559,  351,    0,
			    0,    0,    0, -559, -559, -538,  119, -538,    0, -538,

			    0, -538, -538, -538, -538,    0,    0, -538, -538,    0,
			 -538,    0,    0,    0, -538, -538,  270,  269,  268,    0,
			    0,    0, -538,    0,    0,    0,    0, -538,    0, -538,
			 -538,    0,    0,    0, -538, -538,    0,    0,    0,  267,
			  266,  265,    0,    0, -538, -538,    0,    0, -538,    0,
			    0,    0,    0, -538, -538, -538,    0, -538, -538,    0,
			 -538, -538, -538, -538,    0,    0,    0,    0,    0, -538,
			 -538, -538, -538, -538, -538, -538, -538, -538, -538, -538,
			 -538, -538, -538, -538, -538, -538, -538, -538, -538, -538,
			 -538, -538, -538, -538,    0,    0,    0,    0,    0,    0,

			    0,    0,    0, -538, -538, -538,    0,    0, -538,    0,
			 -538,    0,    0,    0,    0, -538,    0, -538, -538,    0,
			    0,    0,    0, -538, -544, -542,    0, -542,    0, -542,
			    0, -542, -542, -542, -542,    0,    0, -542, -542,    0,
			 -542,    0,    0,    0, -542, -542,    0,    0,    0,    0,
			    0,    0, -542,    0,    0,    0,    0, -542,    0, -542,
			 -542,    0,    0,    0, -542, -542,    0,    0,    0,    0,
			    0,    0,    0,    0, -542, -542,    0,    0, -542,    0,
			    0,    0,    0, -542, -542, -542,    0, -542, -542,    0,
			 -542, -542, -542, -542,    0,    0,    0,    0,    0, -542,

			 -542, -542, -542, -542, -542, -542, -542, -542, -542, -542,
			 -542, -542, -542, -542, -542, -542, -542, -542, -542, -542,
			 -542, -542, -542, -542,    0,    0,    0,    0,    0,    0,
			    0,    0,    0, -542, -542, -542,    0,    0, -542,    0,
			 -542,    0,    0,    0,    0, -542,    0, -542, -542,    0,
			 -543,    0, -543, -542, -543,    0, -543, -543, -543, -543,
			    0,    0, -543, -543,    0, -543,    0,    0,    0, -543,
			 -543,    0,    0,    0,    0,    0,    0, -543,    0,    0,
			    0,    0, -543,    0, -543, -543,    0,    0,    0, -543,
			 -543,    0,    0,    0,    0,    0,    0,    0,    0, -543,

			 -543,    0,    0, -543,    0,    0,    0,    0, -543, -543,
			 -543,    0, -543, -543,    0, -543, -543, -543, -543,    0,
			    0,    0,    0,    0, -543, -543, -543, -543, -543, -543,
			 -543, -543, -543, -543, -543, -543, -543, -543, -543, -543,
			 -543, -543, -543, -543, -543, -543, -543, -543, -543,    0,
			    0,    0,    0,    0,    0,    0,    0,    0, -543, -543,
			 -543,    0,    0, -543,    0, -543,    0,    0,    0,    0,
			 -543,    0, -543, -543,    0, -541,    0, -541, -543, -541,
			    0, -541, -541, -541, -541,    0,    0, -541, -541,    0,
			 -541,    0,    0,    0, -541, -541,    0,    0,    0,    0,

			    0,    0, -541,    0,    0,    0,    0, -541,    0, -541,
			 -541,    0,    0,    0, -541, -541,    0,    0,    0,    0,
			    0,    0,    0,    0, -541, -541,    0,    0, -541,    0,
			    0,    0,    0, -541, -541, -541,    0, -541, -541,    0,
			 -541, -541, -541, -541,    0,    0,    0,    0,    0, -541,
			 -541, -541, -541, -541, -541, -541, -541, -541, -541, -541,
			 -541, -541, -541, -541, -541, -541, -541, -541, -541, -541,
			 -541, -541, -541, -541,    0,    0,    0,    0,    0,    0,
			    0,    0,    0, -541, -541, -541,    0,    0, -541,    0,
			 -541,    0,    0,    0,    0, -541,    0, -541, -541,    0,

			 -540,    0, -540, -541, -540,    0, -540, -540, -540, -540,
			    0,    0, -540, -540,    0, -540,    0,    0,    0, -540,
			 -540,    0,    0,    0,    0,    0,    0, -540,    0,    0,
			    0,    0, -540,    0, -540, -540,    0,    0,    0, -540,
			 -540,    0,    0,    0,    0,    0,    0,    0,    0, -540,
			 -540,    0,    0, -540,    0,    0,    0,    0, -540, -540,
			 -540,    0, -540, -540,    0, -540, -540, -540, -540,    0,
			    0,    0,    0,    0, -540, -540, -540, -540, -540, -540,
			 -540, -540, -540, -540, -540, -540, -540, -540, -540, -540,
			 -540, -540, -540, -540, -540, -540, -540, -540, -540,  892,

			    0,  891,    0,  890,    0,    0,    0,    0, -540, -540,
			 -540,  889,  888, -540,  887, -540,    0,    0,  886,    0,
			 -540,    0, -540, -540,    0,    0,  190,    0, -540,    0,
			    0,    0,    0,  189,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  188,  885,
			    0,    0,  186,    0,    0,    0,    0,  185,   60,   59,
			    0,   58,  184,    0,   57,   56,   55,  182,    0,    0,
			    0,    0,    0,   53,   52,   51,   50,   49,   48,   47,
			   46,   45,   44,   43,   42,   41,   40,   39,   38,   37,
			   36,   35,   34,   33,   32,  180,  884,  883,    0,    0, yyDummy>>,
			1, 1000, 2000)
		end

	yytable_template_4 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #4 of template for `yytable'.
		do
			yy_array_subcopy (an_array, <<
			   62,    0,    0,    0,    0,    0,    0,  178,   30,   29,
			  191,    0,  882,    0,  175,    0,    0,    0,    0,  174,
			    0,  881,  173,    0,    0,  190,    0,  880,    0,    0,
			    0,    0,  189,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  188,  187,    0,
			    0,  186,    0,    0,    0,    0,  185,   60,   59,    0,
			   58,  184,  183,   57,   56,   55,  182,    0,    0,    0,
			  181,    0,   53,   52,   51,   50,   49,   48,   47,   46,
			   45,   44,   43,   42,   41,   40,   39,   38,   37,   36,
			   35,   34,   33,   32,  180,  179,    0,    0,    0,   62,

			    0,    0,    0,    0,    0,    0,  178,   30,   29,  191,
			  177,  775,    0,  175,  860,    0,    0,    0,  174,    0,
			    0,  173,  172,  171,  190,    0,    0,   91,  774,    0,
			    0,  189,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  188,  187,    0,    0,
			  186,    0,    0,    0,    0,  185,   60,   59,    0,   58,
			  184,  183,   57,   56,   55,  182,    0,    0,    0,  181,
			    0,   53,   52,   51,   50,   49,   48,   47,   46,   45,
			   44,   43,   42,   41,   40,   39,   38,   37,   36,   35,
			   34,   33,   32,  180,  179,    0,    0,    0,   62,    0,

			    0,    0,    0,    0, 1050,  178,   30,   29,  191,  177,
			  775,    0,  175,    0,    0,    0,    0,  174,    0,    0,
			  173,  172,  171,  190,    0,    0,   91,  774,    0,    0,
			  189,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  188,  187,    0,    0,  186,
			    0,    0,    0,    0,  185,   60,   59,    0,   58,  184,
			  183,   57,   56,   55,  182,    0,    0,    0,  181,    0,
			   53,   52,   51,   50,   49,   48,   47,   46,   45,   44,
			   43,   42,   41,   40,   39,   38,   37,   36,   35,   34,
			   33,   32,  180,  179,    0,    0,    0,   62,    0,    0,

			    0,    0,    0,  974,  178,   30,   29,  191,  177,  176,
			    0,  175,    0,    0,    0,    0,  174,    0,    0,  173,
			  172,  171,  190,    0,    0,   91,    0,    0,    0,  189,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  188,  187,    0,    0,  186,    0,
			    0,    0,    0,  185,   60,   59,    0,   58,  184,  183,
			   57,   56,   55,  182,    0,    0,    0,  181,    0,   53,
			   52,   51,   50,   49,   48,   47,   46,   45,   44,   43,
			   42,   41,   40,   39,   38,   37,   36,   35,   34,   33,
			   32,  180,  179,    0,    0,    0,   62,    0,    0,    0,

			    0,    0,    0,  178,   30,   29,  191,  177,  176,    0,
			  175,    0,    0,    0,    0,  174,    0,    0,  173,  172,
			  171,  190,    0,    0,   91,    0,    0,    0,  189,    0,
			  909,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  188,  187,    0,    0,  186,    0,    0,
			    0,    0,  185,   60,   59,    0,   58,  184,  183,   57,
			   56,   55,  182,    0,    0,    0,  181,    0,   53,   52,
			   51,   50,   49,   48,   47,   46,   45,   44,   43,   42,
			   41,   40,   39,   38,   37,   36,   35,   34,   33,   32,
			  180,  179,    0,    0,    0,   62,    0,    0,    0,    0,

			    0,    0,  178,   30,   29,  191,  177,  176,    0,  175,
			    0,    0,    0,    0,  174,    0,    0,  173,  172,  171,
			  190,    0,    0,   91,    0,    0,    0,  189,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  188,  187,    0,    0,  186,    0,    0,    0,
			    0,  185,   60,   59,    0,   58,  184,  183,   57,   56,
			   55,  182,    0,    0,    0,  181,    0,   53,   52,   51,
			   50,   49,   48,   47,   46,   45,   44,   43,   42,   41,
			   40,   39,   38,   37,   36,   35,   34,   33,   32,  180,
			  179,    0,    0,    0,   62,    0,    0,    0,    0,    0,

			    0,  178,   30,   29,  191,  177,  176,    0,  175,    0,
			    0,    0,  813,  174,    0,    0,  173,  172,  171,  190,
			    0,    0,   91,    0,    0,    0,  189,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  188,  187,    0,    0,  186,    0,    0,    0,    0,
			  185,   60,   59,    0,   58,  184,  183,   57,   56,   55,
			  182,    0,    0,    0,  181,    0,   53,   52,   51,   50,
			   49,   48,   47,   46,   45,   44,   43,   42,   41,   40,
			   39,   38,   37,   36,   35,   34,   33,   32,  180,  179,
			    0,    0,    0,   62,    0,    0,    0,    0,    0,    0,

			  178,   30,   29,  191,  177,  176,    0,  175,  783,    0,
			    0,    0,  174,    0,    0,  173,  172,  171,  190,    0,
			    0,   91,    0,    0,    0,  189,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  188,  187,    0,    0,  186,  636,    0,    0,    0,  185,
			   60,   59,    0,   58,  184,  183,   57,   56,   55,  182,
			    0,    0,    0,  181,    0,   53,   52,   51,   50,   49,
			   48,   47,   46,   45,   44,   43,   42,   41,   40,   39,
			   38,   37,   36,   35,   34,   33,   32,  180,  179,    0,
			    0,    0,   62,    0,    0,    0,    0,    0,    0,  178,

			   30,   29,  191,  177,  176,    0,  175,    0,    0,    0,
			    0,  174,    0,    0,  173,  172,  171,  190,    0,    0,
			   91,    0,    0,    0,  189,    0,  526,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  188,
			  187,    0,    0,  186,    0,    0,    0,    0,  185,   60,
			   59,    0,   58,  184,  183,   57,   56,   55,  182,    0,
			    0,    0,  181,    0,   53,   52,   51,   50,   49,   48,
			   47,   46,   45,   44,   43,   42,   41,   40,   39,   38,
			   37,   36,   35,   34,   33,   32,  180,  179,    0,    0,
			    0,   62,    0,    0,    0,  524,    0,    0,  178,   30,

			   29,  191,  177,  176,    0,  175,    0,    0,    0,    0,
			  174,    0,    0,  173,  172,  171,  190,    0,    0,   91,
			    0,    0,    0,  189,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  188,  187,
			    0,    0,  186,    0,    0,    0,    0,  185,   60,   59,
			    0,   58,  184,  183,   57,   56,   55,  182,    0,    0,
			    0,  181,    0,   53,   52,   51,   50,   49,   48,   47,
			   46,   45,   44,   43,   42,   41,   40,   39,   38,   37,
			   36,   35,   34,   33,   32,  180,  179,    0,    0,    0,
			   62,    0,    0,    0,  491,    0,    0,  178,   30,   29, yyDummy>>,
			1, 1000, 3000)
		end

	yytable_template_5 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #5 of template for `yytable'.
		do
			yy_array_subcopy (an_array, <<
			  191,  177,  176,    0,  175,    0,    0,    0,    0,  174,
			    0,    0,  173,  172,  171,  190,    0,    0,   91,    0,
			    0,    0,  189,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  188,  187,    0,
			    0,  186,    0,    0,    0,    0,  185,   60,   59,    0,
			   58,  184,  183,   57,   56,   55,  182,    0,    0,    0,
			  181,    0,   53,   52,   51,   50,   49,   48,   47,   46,
			   45,   44,   43,   42,   41,   40,   39,   38,   37,   36,
			   35,   34,   33,   32,  180,  179,    0,    0,    0,   62,
			    0,    0,    0,    0,    0,    0,  178,   30,   29,  191,

			  177,  176,    0,  175,    0,    0,    0,    0,  174,    0,
			    0,  173,  172,  171,  190,    0,    0,   91,    0,    0,
			    0,  189,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  188,  187,    0,    0,
			  186,    0,    0,    0,    0,  185,   60,   59,    0,   58,
			  184,  183,   57,   56,   55,  182,    0,    0,    0,  181,
			    0,   53,   52,   51,   50,   49,   48,   47,   46,   45,
			   44,   43,   42,   41,   40,   39,   38,   37,   36,   35,
			   34,   33,   32,  180,  179,    0,    0,    0,   62,    0,
			    0,    0,    0,    0,    0,  178,   30,   29,  191,  177,

			  176,    0,  175,    0,    0,    0,  349,  174,    0,    0,
			  173,  172,  171,  190,    0,    0,   91,    0,    0,    0,
			  189,    0,    0,    0,    0,    0, -510,    0, -510,    0,
			    0,    0,    0,    0,    0,  188,  187,    0,    0,  186,
			    0,    0,    0,    0,  185,   60,   59,    0,   58,  184,
			  183,   57,   56,   55,  182,    0,    0,    0,  181,    0,
			   53,   52,   51,   50,   49,   48,   47,   46,   45,   44,
			   43,   42,   41,   40,   39,   38,   37,   36,   35,   34,
			   33,   32,  180,  179,  346,    0,    0,    0,    0,  345,
			  344,  343,    0,  342,  178,   30,   29,    0,  177,  176,

			    0,  175,    0,    0,    0,    0,  174,    0,    0,  173,
			  172,  171,    0,  191,    0,   91,    0,    0,    0,  341,
			  340,  339,  338,  337,  336,  335,  334,  333,  190,    0,
			    0,    0,    0,    0,    0,  189,    0,    0,    0,    0,
			    0,    0,    0,    0,  330,  329,  328,  327,    0,    0,
			  188,  187,    0,    0,  186,    0,    0,    0,    0,  185,
			   60,   59,    0,   58,  184,    0,   57,   56,   55, 1195,
			    0, 1040,    0, 1214,    0,   53,   52,   51,   50,   49,
			   48,   47,   46,   45,   44,   43,   42,   41,   40,   39,
			   38,   37,   36,   35,   34,   33,   32,  180,  179,  346,

			    0,    0,    0,    0,  345,  344,  343,    0,  342,  178,
			   30,   29,    0,  346,  176,    0,  175,    0,  345,  344,
			  343,  174,  342,    0,  173,  159,  158,    0,    0,    0,
			    0,    0,    0,    0,  341,  340,  339,  338,  337,  336,
			  335,  334,  333,    0,    0,    0,    0,  998,  341,  340,
			  339,  338,  337,  336,  335,  334,  333,    0,    0,  330,
			  329,  328,  327,    0,    0,    0,    0,  997,   60,   59,
			    0,   58,    0,  330,  329,  328,  327,   54,    0,    0,
			    0,    0,    0,   53,   52,   51,   50,   49,   48,   47,
			   46,   45,   44,   43,   42,   41,   40,   39,   38,   37,

			   36,   35,   34,   33,   32,   31,  346,    0,    0,    0,
			  635,  345,  344,  343,    0,  342,    0,    0,   30,   29,
			  346,    0,  996,    0,    0,  345,  344,  343,    0,  342,
			    0,    0,    0,   28,   27,    0,    0,    0,    0,    0,
			    0,  341,  340,  339,  338,  337,  336,  335,  334,  333,
			    0,    0,    0,    0,    0,  341,  340,  339,  338,  337,
			  336,  335,  334,  333,    0,    0,  330,  329,  328,  327,
			  578,    0,    0,    0,  332,    0,    0,    0,    0,  346,
			  330,  329,  328,  327,  345,  344,  343,    0,  342,    0,
			  346,    0,    0,    0,    0,  345,  344,  343,    0,  342,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  341,  340,  339,  338,  337,  336,
			  335,  334,  333,    0,    0,  341,  340,  339,  338,  337,
			  336,  335,  334,  333,  346,    0,    0,    0,    0,  330,
			  329,  328,  327,  383,  332,  812,    0,    0,    0,  346,
			  330,  329,  328,  327,  345,  344,  343,    0,  342,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  341,
			  340,  339,  338,  337,  336,  335,  334,  333,    0,    0,
			    0,    0,    0,    0,  341,  340,  339,  338,  337,  336,
			  335,  334,  333,  346,  330,  329,  328,  327,  345,  344,

			  343,  782,  342,  332,    0,    0,    0,    0,    0,  330,
			  329,  328,  327,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  341,  340,
			  339,  338,  337,  336,  335,  334,  333,  346,    0,    0,
			    0,    0,  345,  344,  343,    0,  342,  332,  331,    0,
			    0,    0,    0,  330,  329,  328,  327,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  341,  340,  339,  338,  337,  336,  335,  334,
			  333,  346,    0,    0,    0,    0,  345,  344,  343,  533,
			  342,    0,    0,    0,    0,    0,  346,  330,  329,  328,

			  327,  345,  344,  343,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  341,  340,  339,  338,
			  337,  336,  335,  334,  333,    0,    0,    0,    0,    0,
			    0,  341,  340,  339,  338,  337,  336,  335,  334,  333,
			    0,  330,  329,  328,  327,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  330,  329,  328,  327,
			  -15,    0,    0,    0,  -15,    0,    0,  -15,    0,    0,
			  -15,    0,    0,  -15,    0,    0,    0,    0,    0,    0,
			    0,    0,  -15,    0,  -15,  -15,    0,    0,    0,    0,
			  -15,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			  -15,  -15,    0,  -15,   53,   52,   51,   50,   49,   48,
			   47,   46,   45,   44,   43,   42,   41,   40,   39,   38,
			   37,   36,   35,   34,   33,   32,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   29,  747,  746,  745,  744,  743,  742,  741,  740,  739,
			  738,  737,  736,  735,  734,  733,  732,  731,  730,  729,
			  728,  727,  726,  476,  475,  474,  473,  472,  471,  470,
			  469,  468,  467,  466,  465,  464,  463,  462,  461,    0,
			    0,  460,  459,  458,  457,  456,  455,  454,  453,  452,
			  451,  450,  449,  448,  447,  446,  445,  444,  443,  442, yyDummy>>,
			1, 1000, 4000)
		end

	yytable_template_6 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #6 of template for `yytable'.
		do
			yy_array_subcopy (an_array, <<
			  441,    0,    0,  440,  439,  438,  437, yyDummy>>,
			1, 7, 5000)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5006)
			yycheck_template_1 (an_array)
			yycheck_template_2 (an_array)
			yycheck_template_3 (an_array)
			yycheck_template_4 (an_array)
			yycheck_template_5 (an_array)
			yycheck_template_6 (an_array)
			Result := yyfixed_array (an_array)
		end

	yycheck_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yycheck'.
		do
			yy_array_subcopy (an_array, <<
			   15,   15,  106,  107,  395,  107,   15,  319,  141,  157,
			   15,  607,   15,  360,  316,  133,  307,  188,  610,  187,
			  725,  496,  585,  377,  371,  120,  507,  363,  364,  365,
			  934,  935,  557,   15,  138,  144,  602, 1097,  604,   14,
			  142,  891,  360,  396,   14, 1148,  241,  648,   71,  157,
			  403,   27,  396, 1148,   69,   69,   22,  790,   90,  403,
			   69,  169,   77,  648,   69,   37,   69,   23,   83,   78,
			  162,  163,  164,  121,    0,  173,  174,   70,   34,   94,
			   94,  129,   15,   98,   99,   94,  101,   69, 1041,   94,
			  188,   94,  802,   11,  109,  110,  111,   17, 1201,  114,

			  113,   67,  220,  221,  119,   42, 1201,   71,   14,  959,
			  230,  134,   94,  246,   32,   71,   72,   73,   42,  112,
			   69,   58,  137,  243,  272,  273,  230,   47,   48,  318,
			   50,  864,  114,   39,   58,   28,   69,   42,  236,  243,
			 1243,  846,  157,  245,  176,   94,   42,  123, 1243, 1209,
			 1103,  123,  715,   58,  124,   48,   49,   50,  173,  174,
			  135,   94,   58,  271,   61,   62,  122,  642,  764,  761,
			  134,  696,    0,  188,  134,  133,  488,  372,   71,   72,
			   73,  190,  277,  749,  665, 1035,  787,  124,  119,  491,
			   14,    0,  483,  388,   22,  486,  543,  121,  135,  157,

			  124,   74,  787,  134,  302,  129,   74,  305,  223,  222,
			   14,  169,  566,   14,  568,  228,  570,   11,  951,  124,
			   38,  236,  127,   14,  239,  396,  544,  545,  124,  102,
			  127,  936,  129,  586,  102,  128,  589,  252,   32,  530,
			  174,  223,  586,   14, 1148,  589,   15,   71,   72,   73,
			   23,  266,  265,  351,  188,  353,  966,  272,  273,  392,
			 1110,   34,  220,  221,  856,  801,  802,  868,  436,  378,
			   14,  286,  285,  983,  289,  838,    4,  987,   23,  311,
			  121,  313,  380,  868,  266,  387,   14,  302,   22,   34,
			  305,  480,  481,   27,  326,    8,    9, 1201,   71,   72,

			   73,  316,   20,  125,  286,   23, 1011,   35,  323, 1014,
			   14,   39,  134,  271,  789,   43,   34,   14,   15,   71,
			   72,   73,   74,   17,   69,   14,   71,   72,   73,  421,
			  422,  423,  347,   14,  646,   29,  351, 1047,  353, 1243,
			   14,   38,  531,  532, 1077,  360,  682,  683,  684,  640,
			  363,  364,  365,   71,   72,   73,  124,   17,  103,  124,
			  375,  529,  377,  926,  717,  380, 1071,  135,  931,   29,
			  135,  852,  124,  717,   17,    3,  121,   17,  130,  131,
			  395,  396,  673,   71,   72,   73,   29,   47,  403,   29,
			 1100,  119,   14, 1126,  125,  493,   74,  135,  430,   26,

			   17,    7,  360,  134,   47,   11,  134,   47,   14,  507,
			   14,   17,   29,  371,   20,  586,   17, 1018,   45,   46,
			   71,   72,   73,   29,  102,   31,   32,  122,   29,  124,
			  966,   37,   14, 1018,  122,  121, 1146,  123, 1171,   11,
			   14,   47,   48,  129,   50,   17,   47,  983,   14,  582,
			   22,  987,  130,  131,   14,   27,  645,   29,  849,   31,
			   32,  563,  943,  495,  939,   37,  232,  233,  616,  617,
			  817,  122,   70,  641, 1075,   47,  491,  492,  493,  581,
			   14,  828,   17,  249, 1217,  500,  501,  502,  503,  498,
			 1075,  593,  507,   14,   29, 1228,  120,  479,  816,  817,

			  124,  803,   14,  601,  602,  603,  604,  105,  106,  617,
			   14, 1047,   47,  111,  112,  113,   12,  625,   14,  801,
			  802, 1122,   17,  538,  537,   14,   15, 1260,  134,  544,
			  545,  629,  130,  131,   29,  847,   14, 1122,  551, 1249,
			 1015,   74,  557,   61,   62,  560,  559,  651,  652,   38,
			  565,  566,   47,  568,   17,  570,  538,   35,  590,   14,
			  132,   39,  134,  127, 1100,   43,   29,  665, 1169,  102,
			   17,  586,  123,  124,  589,  693, 1177,   12,  560,   14,
			  713,  596,   29,   14, 1169,  543,  601,  602,  603,  604,
			  892,  780, 1177,   58,  127, 1070,  129,  130,  131,  124,

			  615,  616,  617,  136,   35,  923,  135,  909,   39,   14,
			 1146,   14, 1148,  781,  629,  630,  123,  124,   71,   72,
			   73,   74,  724,  771,  121, 1226,  938,  171,  172,  644,
			   14,  663,   35,  177,  649,   14,   39,  181,  647,  183,
			   43, 1226,  124,  125, 1119,   14,   71,   72,   73, 1124,
			  665,  749,  127,  135,  108,   13,  754,  615,   12,  617,
			   14,   14,  116,  117,  118, 1201,  624,  625,   14,  682,
			  683,  684,   71,   72,   73,   37,  978,  130,  131,  133,
			  119,  696,  121,  121,  966,  123,  701,  702,   71,   72,
			   73,  723,  146,  147,  148,  120,  829,  124,  125, 1174,

			 1012,  983,  717,  157,   14,  987,  839, 1243,    8,    9,
			  934,  935,   22, 1249,   14,  169,   26,  885,   18,    8,
			    9,  120,   22,  934,  935,   14,   26,   14,  121,   18,
			  123,  127,  900,   22,  749,  693,  129,   26,  121,  754,
			  123,  124,  844,  775,   14,  843,  129,   41,  916,   12,
			   13,   14,   52,   14,  852,  770,  771, 1069,    8,    9,
			 1072,   42,  122,   52,  124, 1047,  220,  221,   18,  958,
			  224,  225,  226,   71,   72,   73,   42,  786,   41,  794,
			  795,  796,  797,  122,  888,  124,  801,  802,  803,   14,
			  799,  417,  124,  125,  420,   69,  811,   71,   72,   73,

			  815,  816,  817,  135,  836,  103,  127,  911,  434,  435,
			   14, 1123,  124,  125,  268,  269,  270,  271, 1100,  119,
			   14,  801,  802,  135,   14,  124,  125,   14,  843,   16,
			  119,  355,  356,  935,  849,  937,  135,  852,   48,   49,
			   14,  873,   71,   72,   73,  943,  654,   74,   35,  881,
			  882,  127,   39,  129,  127,  309,   43,  815,  867,  817,
			  964,   71,   72,   73, 1146,  969, 1148,  701,  702,  827,
			  828,   31, 1061, 1062,  103,  102,  891,  892,    0,    1,
			   71,   72,   73,   74,  121,  119,  123,  121, 1056,  120,
			  119, 1080,  129,   45,  909,  910,  928, 1086, 1087, 1088,

			  127,  120,  129,  130,  131,  120,  360,  922,  923,  120,
			   14, 1013,   70,  794,  795,  796,  797,  371,   14, 1201,
			  934,  935,   22,   46, 1092,  934,  935,   14,  943,  934,
			  935,  934,  935,  124,  127,  967, 1040, 1041,  970,  130,
			  131,   14,  122, 1111,  959, 1134, 1135,  105,  106,   74,
			  127,  966,  129,  111,  112,  113,   71,   72,   73,   71,
			  975, 1243,  128,  978,  996,  947,  981, 1249,  983,  120,
			  134,  986,  987,  127, 1142,  129, 1144,  102,   14,  805,
			   71,   72,   73,  791,  792,   14,  966,   71,   72,   73,
			 1094,   24,  800,   26,   14,  621,  622,   28,   14, 1188, yyDummy>>,
			1, 1000, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yycheck'.
		do
			yy_array_subcopy (an_array, <<
			 1189, 1190,  127,  983,  129,  130,  131,  987, 1017,  500,
			  501,  502,  503,  146,  147,  148,  124,   48,   49,   50,
			 1035,   18,   19,   20, 1192,  146,  147,  148,   14,  124,
			   14,   14, 1047,  125, 1049,   26, 1045,  135, 1053, 1054,
			   71,   72,   73, 1211,  870,  871,  127,   61,   61,    0,
			  676,  121,  678,  119, 1036,  681,    7,  865,  866,   14,
			  120,  869,   39,   14,   14, 1074,   17, 1047,  125,   20,
			  125,   22,  698,  699, 1089,   26, 1091,  125,   54,   35,
			 1248,  134,   14,   14,   16, 1100,  540,  541,  542,  543,
			    5,   14,  122,  120,   14, 1110,   47,   48, 1107,   50,

			  124,   52,   20,   35,   36,   23, 1274,   39,  125,   27,
			 1214,   43, 1121,  124,   14,  207,   34,  124,   18,  124,
			 1100,  124,   22,  949,  950,  135,   26,  219, 1143,   28,
			  125, 1146,  124, 1148, 1148,   43, 1118,  127,  125,   14,
			  948,   14,  124, 1158,  952,  953,  125,  239,  119,   48,
			   49,   50,   52,   71,   72,   73,  125,  124,  123, 1168,
			  134,  615,  125,  617,  124,  122, 1146, 1176, 1148, 1001,
			  624,  625,   71,   72,   73,    8,    9, 1009, 1010,  125,
			  120,   14,  120,  120,  125,   18, 1201, 1201,  124,   22,
			  124,  124,  135,   26,  124,  821,  822, 1212,  125,  125,

			   16, 1027, 1028,  121,   14,  123,  124,   14, 1016,    3,
			   14,   26,  134,  124,  120,  307, 1225,   14, 1026,   52,
			  125, 1201,  125,    8,  122,  127,  122,  122, 1243, 1243,
			 1245,  323,  120,  124, 1249,  327,  328,  329,  330,  693,
			  124,  333,  334,  335,  336,  337,  338,  339,  340,  341,
			  342,  343,  344,  345,  346,  125,  125,  123,   18,  119,
			   14,   20,  127, 1243,  135, 1073,  127,  119,    7, 1249,
			 1078, 1079,   11,  127,  127,   14,  121,   20,   17,   60,
			   23,   20,  125,  127,   27,   74,   74,  125,   14,   23,
			   29,   34,   31,   32,   52,   57,   57, 1129,   37,  120,

			   34,  135,   57,   37,   28, 1131, 1132,   14,   47,   48,
			    7,   50, 1120,  125,    7,    7,   24,    7,  124, 1127,
			 1128,  123, 1130,  119,   48,   49,   50,  125,   71,   72,
			   73,   17,   14,  928,  135,   69,   18,   71,   72,   73,
			   22, 1098,  665,  576,   26,  754, 1178,   71,   72,   73,
			  395,  395,  207,   65, 1180, 1181, 1107,  483,  614, 1167,
			  254,  815,  254,  817, 1172, 1173,  592, 1175,  254,  103,
			   52, 1179,  107,  827,  828,  188,  101,  251,  121,  107,
			  123,  124,  943,  853, 1156,  119,  414,  121, 1220,  123,
			  107,  483,  380,  139,  486,  134, 1222, 1223,  222,  696,

			  492,  551, 1201, 1235, 1236, 1237,  247,  935, 1243,  673,
			 1218, 1219,  845, 1221,  777,  113, 1224,  640,   -1, 1251,
			   -1, 1229, 1230,   -1,   -1,   -1,   22, 1253, 1254,   -1,
			   -1, 1263,  524,   -1,  526, 1267, 1268, 1269,  530, 1265,
			 1266,   -1,   -1,   -1, 1252,   -1,   -1,   -1,   44, 1281,
			 1282, 1283, 1284, 1261, 1262,   -1, 1264,   -1,   -1,   -1,
			 1286, 1287,   -1,   -1, 1296, 1297, 1298,   -1,   64,   65,
			   66,   -1,   68,   -1, 1306, 1307, 1308, 1285,   74,   -1,
			 1312, 1313, 1314,   -1,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,

			   96,   97,   98,   99,  100,  101,  102,   -1,  962,   -1,
			   -1,    8,    9,   -1,   -1,   -1,   -1,   14,   -1,  115,
			  116,   18,   -1,  119,   -1,   22,   -1,   -1,   -1,   26,
			   -1,   -1,   -1,   -1,  130,  131,  628,   -1,    6,   -1,
			    8,   -1,   10,   11,   12,   13,   14,   15,  640,   17,
			   18,   19,  644,   21,   22,   52,   -1,   25,   26,   -1,
			   -1,   29,   30,   -1,   32,   33,   -1,   -1,   -1,   -1,
			   38,   -1,   40,   41,   42,   -1,   -1,   45,   46,   47,
			   -1,  673,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,
			   -1,   59,   60,   -1,   -1,   -1,   64,   65,   66,   -1,

			   68,   69,   70,   71,   72,   73,   74,   75,   76,   77,
			   78,   79,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,  105,  106,  107,
			  108,  109,  110,  111,  112,  113,  114,  115,  116,   -1,
			  118,  119,   -1,  121,  122,   -1,  124,  125,  126,   -1,
			  128,  129,  130,  131,  132,  133,  134,  135,    6,   28,
			    8,   -1,   10,   -1,   12,   13,   14,   15,   -1,   -1,
			   18,   19,   -1,   21,   -1,  777,   -1,   25,   26,   48,
			   49,   50,   -1,   -1,   -1,   33,   -1,   -1,   -1,   -1,

			   38,   -1,   40,   41,   -1,   -1,   -1,   45,   46,   -1,
			   -1,   -1,   71,   72,   73,   -1,   -1,   55,   56,   -1,
			   -1,   59,   -1,   61,   -1,   -1,   64,   65,   66,   -1,
			   68,   69,   -1,   71,   72,   73,   74,   -1,   -1,   -1,
			   -1,   -1,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,    8,   -1,   -1,
			   -1,   -1,   -1,   -1,   70,   -1,  114,  115,  116,   75,
			   -1,  119,   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,
			  128,  129,   -1,   -1,  886,  887,  134,  135,   -1,   -1,

			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  105,
			  106,  107,  108,  109,  110,  111,  112,  113,  910,   -1,
			   -1,   -1,   -1,   64,   65,   66,   -1,   68,   -1,   -1,
			   71,   72,   73,   74,  130,  131,  132,  133,   -1,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,    8,    9,   -1,   -1,   -1,   -1,   14,   -1,
			   -1,   -1,   18,   -1,  115,  116,   22,   -1,   -1,   -1,
			   26,   -1,   -1,  975,  976,  977,   -1,   -1,   -1,  130,
			  131,   -1,  984,  985,  986,   -1,   -1,   -1,   -1,   -1,

			   -1,   12,   13,   14,   15,    6,   52,    8,   -1,   10,
			   11,   12,   13,   14,   15,   26,   17,   18,   19,   -1,
			   21,   22,   -1,   -1,   25,   26,   -1,   38,   29,   30,
			   41,   32,   33,   -1,   45,   46,   -1,   38,   -1,   40,
			   41,   42,   -1,   -1,   45,   46,   47,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   60,
			   -1, 1053, 1054,   64,   65,   66,   -1,   68,   69,   70,
			   71,   72,   73,   74,   75,   76,   77,   78,   79,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100, yyDummy>>,
			1, 1000, 1000)
		end

	yycheck_template_3 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #3 of template for `yycheck'.
		do
			yy_array_subcopy (an_array, <<
			  101,  102,  103,  104,  105,  106,  107,  108,  109,  110,
			  111,  112,  113,  114,  115,  116,   -1,  118,  119,   -1,
			  121,  122, 1114,  124,  125,  126,   -1,  128,  129,  130,
			  131,  132,  133,  134,  135,    6,   -1,    8,   -1,   10,
			   11,   12,   13,   14,   15,   -1,   17,   18,   19,   -1,
			   21,   22,   -1,   -1,   25,   26,   -1,   -1,   29,   30,
			   -1,   32,   33, 1155,   -1,   -1,   -1,   38,   -1,   40,
			   41,   42,   -1, 1165,   45,   46,   47,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   60,
			   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,   70,

			   71,   72,   73,   74,   75,   76,   77,   78,   79,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,  105,  106,  107,  108,  109,  110,
			  111,  112,  113,  114,  115,  116,   -1,  118,  119,   -1,
			  121,  122,   -1,  124,  125,  126,   -1,  128,  129,  130,
			  131,  132,  133,  134,  135,    6,   28,    8,   -1,   10,
			   -1,   12,   13,   14,   15,   -1,   -1,   18,   19,   -1,
			   21,   -1,   -1,   -1,   25,   26,   48,   49,   50,   -1,
			   -1,   -1,   33,   -1,   -1,   -1,   -1,   38,   -1,   40,

			   41,   -1,   -1,   -1,   45,   46,   -1,   -1,   -1,   71,
			   72,   73,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,
			   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,   -1,
			   71,   72,   73,   74,   -1,   -1,   -1,   -1,   -1,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  114,  115,  116,   -1,   -1,  119,   -1,
			  121,   -1,   -1,   -1,   -1,  126,  127,  128,  129,   -1,
			   -1,   -1,   -1,  134,  135,    6,   28,    8,   -1,   10,

			   -1,   12,   13,   14,   15,   -1,   -1,   18,   19,   -1,
			   21,   -1,   -1,   -1,   25,   26,   48,   49,   50,   -1,
			   -1,   -1,   33,   -1,   -1,   -1,   -1,   38,   -1,   40,
			   41,   -1,   -1,   -1,   45,   46,   -1,   -1,   -1,   71,
			   72,   73,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,
			   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,   -1,
			   71,   72,   73,   74,   -1,   -1,   -1,   -1,   -1,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   -1,  114,  115,  116,   -1,   -1,  119,   -1,
			  121,   -1,   -1,   -1,   -1,  126,   -1,  128,  129,   -1,
			   -1,   -1,   -1,  134,  135,    6,   -1,    8,   -1,   10,
			   -1,   12,   13,   14,   15,   -1,   -1,   18,   19,   -1,
			   21,   -1,   -1,   -1,   25,   26,   -1,   -1,   -1,   -1,
			   -1,   -1,   33,   -1,   -1,   -1,   -1,   38,   -1,   40,
			   41,   -1,   -1,   -1,   45,   46,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,
			   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,   -1,
			   71,   72,   73,   74,   -1,   -1,   -1,   -1,   -1,   80,

			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  114,  115,  116,   -1,   -1,  119,   -1,
			  121,   -1,   -1,   -1,   -1,  126,   -1,  128,  129,   -1,
			    6,   -1,    8,  134,   10,   -1,   12,   13,   14,   15,
			   -1,   -1,   18,   19,   -1,   21,   -1,   -1,   -1,   25,
			   26,   -1,   -1,   -1,   -1,   -1,   -1,   33,   -1,   -1,
			   -1,   -1,   38,   -1,   40,   41,   -1,   -1,   -1,   45,
			   46,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,

			   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,
			   66,   -1,   68,   69,   -1,   71,   72,   73,   74,   -1,
			   -1,   -1,   -1,   -1,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,
			  116,   -1,   -1,  119,   -1,  121,   -1,   -1,   -1,   -1,
			  126,   -1,  128,  129,   -1,    6,   -1,    8,  134,   10,
			   -1,   12,   13,   14,   15,   -1,   -1,   18,   19,   -1,
			   21,   -1,   -1,   -1,   25,   26,   -1,   -1,   -1,   -1,

			   -1,   -1,   33,   -1,   -1,   -1,   -1,   38,   -1,   40,
			   41,   -1,   -1,   -1,   45,   46,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,
			   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,   -1,
			   71,   72,   73,   74,   -1,   -1,   -1,   -1,   -1,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  114,  115,  116,   -1,   -1,  119,   -1,
			  121,   -1,   -1,   -1,   -1,  126,   -1,  128,  129,   -1,

			    6,   -1,    8,  134,   10,   -1,   12,   13,   14,   15,
			   -1,   -1,   18,   19,   -1,   21,   -1,   -1,   -1,   25,
			   26,   -1,   -1,   -1,   -1,   -1,   -1,   33,   -1,   -1,
			   -1,   -1,   38,   -1,   40,   41,   -1,   -1,   -1,   45,
			   46,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,
			   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,
			   66,   -1,   68,   69,   -1,   71,   72,   73,   74,   -1,
			   -1,   -1,   -1,   -1,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,    6,

			   -1,    8,   -1,   10,   -1,   -1,   -1,   -1,  114,  115,
			  116,   18,   19,  119,   21,  121,   -1,   -1,   25,   -1,
			  126,   -1,  128,  129,   -1,   -1,   33,   -1,  134,   -1,
			   -1,   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,
			   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,
			   -1,   68,   69,   -1,   71,   72,   73,   74,   -1,   -1,
			   -1,   -1,   -1,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,   -1,   -1, yyDummy>>,
			1, 1000, 2000)
		end

	yycheck_template_4 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #4 of template for `yycheck'.
		do
			yy_array_subcopy (an_array, <<
			    8,   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,  116,
			   18,   -1,  119,   -1,  121,   -1,   -1,   -1,   -1,  126,
			   -1,  128,  129,   -1,   -1,   33,   -1,  134,   -1,   -1,
			   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,
			   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,   -1,
			   68,   69,   70,   71,   72,   73,   74,   -1,   -1,   -1,
			   78,   -1,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,   -1,   -1,   -1,    8,

			   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,  116,   18,
			  118,  119,   -1,  121,  122,   -1,   -1,   -1,  126,   -1,
			   -1,  129,  130,  131,   33,   -1,   -1,  135,  136,   -1,
			   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,
			   59,   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,
			   69,   70,   71,   72,   73,   74,   -1,   -1,   -1,   78,
			   -1,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,   -1,   -1,   -1,    8,   -1,

			   -1,   -1,   -1,   -1,   14,  114,  115,  116,   18,  118,
			  119,   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,   -1,
			  129,  130,  131,   33,   -1,   -1,  135,  136,   -1,   -1,
			   40,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,
			   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,
			   70,   71,   72,   73,   74,   -1,   -1,   -1,   78,   -1,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,   -1,   -1,   -1,    8,   -1,   -1,

			   -1,   -1,   -1,   14,  114,  115,  116,   18,  118,  119,
			   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,   -1,  129,
			  130,  131,   33,   -1,   -1,  135,   -1,   -1,   -1,   40,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,
			   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,   70,
			   71,   72,   73,   74,   -1,   -1,   -1,   78,   -1,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,   -1,   -1,   -1,    8,   -1,   -1,   -1,

			   -1,   -1,   -1,  114,  115,  116,   18,  118,  119,   -1,
			  121,   -1,   -1,   -1,   -1,  126,   -1,   -1,  129,  130,
			  131,   33,   -1,   -1,  135,   -1,   -1,   -1,   40,   -1,
			   42,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,   -1,
			   -1,   -1,   64,   65,   66,   -1,   68,   69,   70,   71,
			   72,   73,   74,   -1,   -1,   -1,   78,   -1,   80,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,

			   -1,   -1,  114,  115,  116,   18,  118,  119,   -1,  121,
			   -1,   -1,   -1,   -1,  126,   -1,   -1,  129,  130,  131,
			   33,   -1,   -1,  135,   -1,   -1,   -1,   40,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   55,   56,   -1,   -1,   59,   -1,   -1,   -1,
			   -1,   64,   65,   66,   -1,   68,   69,   70,   71,   72,
			   73,   74,   -1,   -1,   -1,   78,   -1,   80,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,

			   -1,  114,  115,  116,   18,  118,  119,   -1,  121,   -1,
			   -1,   -1,  125,  126,   -1,   -1,  129,  130,  131,   33,
			   -1,   -1,  135,   -1,   -1,   -1,   40,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   55,   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,
			   64,   65,   66,   -1,   68,   69,   70,   71,   72,   73,
			   74,   -1,   -1,   -1,   78,   -1,   80,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,

			  114,  115,  116,   18,  118,  119,   -1,  121,  122,   -1,
			   -1,   -1,  126,   -1,   -1,  129,  130,  131,   33,   -1,
			   -1,  135,   -1,   -1,   -1,   40,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   55,   56,   -1,   -1,   59,   60,   -1,   -1,   -1,   64,
			   65,   66,   -1,   68,   69,   70,   71,   72,   73,   74,
			   -1,   -1,   -1,   78,   -1,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,   -1,
			   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,  114,

			  115,  116,   18,  118,  119,   -1,  121,   -1,   -1,   -1,
			   -1,  126,   -1,   -1,  129,  130,  131,   33,   -1,   -1,
			  135,   -1,   -1,   -1,   40,   -1,   42,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,
			   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,
			   66,   -1,   68,   69,   70,   71,   72,   73,   74,   -1,
			   -1,   -1,   78,   -1,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,   -1,   -1,
			   -1,    8,   -1,   -1,   -1,   12,   -1,   -1,  114,  115,

			  116,   18,  118,  119,   -1,  121,   -1,   -1,   -1,   -1,
			  126,   -1,   -1,  129,  130,  131,   33,   -1,   -1,  135,
			   -1,   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,
			   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,
			   -1,   68,   69,   70,   71,   72,   73,   74,   -1,   -1,
			   -1,   78,   -1,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,   -1,   -1,   -1,
			    8,   -1,   -1,   -1,   12,   -1,   -1,  114,  115,  116, yyDummy>>,
			1, 1000, 3000)
		end

	yycheck_template_5 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #5 of template for `yycheck'.
		do
			yy_array_subcopy (an_array, <<
			   18,  118,  119,   -1,  121,   -1,   -1,   -1,   -1,  126,
			   -1,   -1,  129,  130,  131,   33,   -1,   -1,  135,   -1,
			   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,
			   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,   -1,
			   68,   69,   70,   71,   72,   73,   74,   -1,   -1,   -1,
			   78,   -1,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,   -1,   -1,   -1,    8,
			   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,  116,   18,

			  118,  119,   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,
			   -1,  129,  130,  131,   33,   -1,   -1,  135,   -1,   -1,
			   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,
			   59,   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,
			   69,   70,   71,   72,   73,   74,   -1,   -1,   -1,   78,
			   -1,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,   -1,   -1,   -1,    8,   -1,
			   -1,   -1,   -1,   -1,   -1,  114,  115,  116,   18,  118,

			  119,   -1,  121,   -1,   -1,   -1,  125,  126,   -1,   -1,
			  129,  130,  131,   33,   -1,   -1,  135,   -1,   -1,   -1,
			   40,   -1,   -1,   -1,   -1,   -1,   12,   -1,   14,   -1,
			   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,
			   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,
			   70,   71,   72,   73,   74,   -1,   -1,   -1,   78,   -1,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,   70,   -1,   -1,   -1,   -1,   75,
			   76,   77,   -1,   79,  114,  115,  116,   -1,  118,  119,

			   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,   -1,  129,
			  130,  131,   -1,   18,   -1,  135,   -1,   -1,   -1,  105,
			  106,  107,  108,  109,  110,  111,  112,  113,   33,   -1,
			   -1,   -1,   -1,   -1,   -1,   40,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,  130,  131,  132,  133,   -1,   -1,
			   55,   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,
			   65,   66,   -1,   68,   69,   -1,   71,   72,   73,   74,
			   -1,   42,   -1,   30,   -1,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,   70,

			   -1,   -1,   -1,   -1,   75,   76,   77,   -1,   79,  114,
			  115,  116,   -1,   70,  119,   -1,  121,   -1,   75,   76,
			   77,  126,   79,   -1,  129,  130,  131,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,  105,  106,  107,  108,  109,  110,
			  111,  112,  113,   -1,   -1,   -1,   -1,   44,  105,  106,
			  107,  108,  109,  110,  111,  112,  113,   -1,   -1,  130,
			  131,  132,  133,   -1,   -1,   -1,   -1,   64,   65,   66,
			   -1,   68,   -1,  130,  131,  132,  133,   74,   -1,   -1,
			   -1,   -1,   -1,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,

			   97,   98,   99,  100,  101,  102,   70,   -1,   -1,   -1,
			   60,   75,   76,   77,   -1,   79,   -1,   -1,  115,  116,
			   70,   -1,  119,   -1,   -1,   75,   76,   77,   -1,   79,
			   -1,   -1,   -1,  130,  131,   -1,   -1,   -1,   -1,   -1,
			   -1,  105,  106,  107,  108,  109,  110,  111,  112,  113,
			   -1,   -1,   -1,   -1,   -1,  105,  106,  107,  108,  109,
			  110,  111,  112,  113,   -1,   -1,  130,  131,  132,  133,
			  134,   -1,   -1,   -1,  124,   -1,   -1,   -1,   -1,   70,
			  130,  131,  132,  133,   75,   76,   77,   -1,   79,   -1,
			   70,   -1,   -1,   -1,   -1,   75,   76,   77,   -1,   79,

			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,  105,  106,  107,  108,  109,  110,
			  111,  112,  113,   -1,   -1,  105,  106,  107,  108,  109,
			  110,  111,  112,  113,   70,   -1,   -1,   -1,   -1,  130,
			  131,  132,  133,  134,  124,  125,   -1,   -1,   -1,   70,
			  130,  131,  132,  133,   75,   76,   77,   -1,   79,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  105,
			  106,  107,  108,  109,  110,  111,  112,  113,   -1,   -1,
			   -1,   -1,   -1,   -1,  105,  106,  107,  108,  109,  110,
			  111,  112,  113,   70,  130,  131,  132,  133,   75,   76,

			   77,  122,   79,  124,   -1,   -1,   -1,   -1,   -1,  130,
			  131,  132,  133,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  105,  106,
			  107,  108,  109,  110,  111,  112,  113,   70,   -1,   -1,
			   -1,   -1,   75,   76,   77,   -1,   79,  124,  125,   -1,
			   -1,   -1,   -1,  130,  131,  132,  133,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,  105,  106,  107,  108,  109,  110,  111,  112,
			  113,   70,   -1,   -1,   -1,   -1,   75,   76,   77,  122,
			   79,   -1,   -1,   -1,   -1,   -1,   70,  130,  131,  132,

			  133,   75,   76,   77,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  105,  106,  107,  108,
			  109,  110,  111,  112,  113,   -1,   -1,   -1,   -1,   -1,
			   -1,  105,  106,  107,  108,  109,  110,  111,  112,  113,
			   -1,  130,  131,  132,  133,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  130,  131,  132,  133,
			    7,   -1,   -1,   -1,   11,   -1,   -1,   14,   -1,   -1,
			   17,   -1,   -1,   20,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   29,   -1,   31,   32,   -1,   -1,   -1,   -1,
			   37,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   47,   48,   -1,   50,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			  116,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   -1,
			   -1,   98,   99,  100,  101,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94, yyDummy>>,
			1, 1000, 4000)
		end

	yycheck_template_6 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #6 of template for `yycheck'.
		do
			yy_array_subcopy (an_array, <<
			   95,   -1,   -1,   98,   99,  100,  101, yyDummy>>,
			1, 7, 5000)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [ANY]
			-- Stack for semantic values of type ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: KL_SPECIAL_ROUTINES [ANY]
			-- Routines that ought to be in SPECIAL [ANY]

	yyvs2: SPECIAL [ET_KEYWORD]
			-- Stack for semantic values of type ET_KEYWORD

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [ET_KEYWORD]
			-- Routines that ought to be in SPECIAL [ET_KEYWORD]

	yyvs3: SPECIAL [ET_AGENT_KEYWORD]
			-- Stack for semantic values of type ET_AGENT_KEYWORD

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [ET_AGENT_KEYWORD]
			-- Routines that ought to be in SPECIAL [ET_AGENT_KEYWORD]

	yyvs4: SPECIAL [ET_PRECURSOR_KEYWORD]
			-- Stack for semantic values of type ET_PRECURSOR_KEYWORD

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [ET_PRECURSOR_KEYWORD]
			-- Routines that ought to be in SPECIAL [ET_PRECURSOR_KEYWORD]

	yyvs5: SPECIAL [ET_SYMBOL]
			-- Stack for semantic values of type ET_SYMBOL

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [ET_SYMBOL]
			-- Routines that ought to be in SPECIAL [ET_SYMBOL]

	yyvs6: SPECIAL [ET_POSITION]
			-- Stack for semantic values of type ET_POSITION

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [ET_POSITION]
			-- Routines that ought to be in SPECIAL [ET_POSITION]

	yyvs7: SPECIAL [ET_BIT_CONSTANT]
			-- Stack for semantic values of type ET_BIT_CONSTANT

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [ET_BIT_CONSTANT]
			-- Routines that ought to be in SPECIAL [ET_BIT_CONSTANT]

	yyvs8: SPECIAL [ET_BOOLEAN_CONSTANT]
			-- Stack for semantic values of type ET_BOOLEAN_CONSTANT

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [ET_BOOLEAN_CONSTANT]
			-- Routines that ought to be in SPECIAL [ET_BOOLEAN_CONSTANT]

	yyvs9: SPECIAL [ET_BREAK]
			-- Stack for semantic values of type ET_BREAK

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [ET_BREAK]
			-- Routines that ought to be in SPECIAL [ET_BREAK]

	yyvs10: SPECIAL [ET_CHARACTER_CONSTANT]
			-- Stack for semantic values of type ET_CHARACTER_CONSTANT

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [ET_CHARACTER_CONSTANT]
			-- Routines that ought to be in SPECIAL [ET_CHARACTER_CONSTANT]

	yyvs11: SPECIAL [ET_CURRENT]
			-- Stack for semantic values of type ET_CURRENT

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [ET_CURRENT]
			-- Routines that ought to be in SPECIAL [ET_CURRENT]

	yyvs12: SPECIAL [ET_FREE_OPERATOR]
			-- Stack for semantic values of type ET_FREE_OPERATOR

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [ET_FREE_OPERATOR]
			-- Routines that ought to be in SPECIAL [ET_FREE_OPERATOR]

	yyvs13: SPECIAL [ET_IDENTIFIER]
			-- Stack for semantic values of type ET_IDENTIFIER

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [ET_IDENTIFIER]
			-- Routines that ought to be in SPECIAL [ET_IDENTIFIER]

	yyvs14: SPECIAL [ET_INTEGER_CONSTANT]
			-- Stack for semantic values of type ET_INTEGER_CONSTANT

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [ET_INTEGER_CONSTANT]
			-- Routines that ought to be in SPECIAL [ET_INTEGER_CONSTANT]

	yyvs15: SPECIAL [ET_KEYWORD_OPERATOR]
			-- Stack for semantic values of type ET_KEYWORD_OPERATOR

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [ET_KEYWORD_OPERATOR]
			-- Routines that ought to be in SPECIAL [ET_KEYWORD_OPERATOR]

	yyvs16: SPECIAL [ET_MANIFEST_STRING]
			-- Stack for semantic values of type ET_MANIFEST_STRING

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [ET_MANIFEST_STRING]
			-- Routines that ought to be in SPECIAL [ET_MANIFEST_STRING]

	yyvs17: SPECIAL [ET_REAL_CONSTANT]
			-- Stack for semantic values of type ET_REAL_CONSTANT

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [ET_REAL_CONSTANT]
			-- Routines that ought to be in SPECIAL [ET_REAL_CONSTANT]

	yyvs18: SPECIAL [ET_RESULT]
			-- Stack for semantic values of type ET_RESULT

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [ET_RESULT]
			-- Routines that ought to be in SPECIAL [ET_RESULT]

	yyvs19: SPECIAL [ET_RETRY_INSTRUCTION]
			-- Stack for semantic values of type ET_RETRY_INSTRUCTION

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [ET_RETRY_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [ET_RETRY_INSTRUCTION]

	yyvs20: SPECIAL [ET_SYMBOL_OPERATOR]
			-- Stack for semantic values of type ET_SYMBOL_OPERATOR

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [ET_SYMBOL_OPERATOR]
			-- Routines that ought to be in SPECIAL [ET_SYMBOL_OPERATOR]

	yyvs21: SPECIAL [ET_VOID]
			-- Stack for semantic values of type ET_VOID

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [ET_VOID]
			-- Routines that ought to be in SPECIAL [ET_VOID]

	yyvs22: SPECIAL [ET_SEMICOLON_SYMBOL]
			-- Stack for semantic values of type ET_SEMICOLON_SYMBOL

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [ET_SEMICOLON_SYMBOL]
			-- Routines that ought to be in SPECIAL [ET_SEMICOLON_SYMBOL]

	yyvs23: SPECIAL [ET_BRACKET_SYMBOL]
			-- Stack for semantic values of type ET_BRACKET_SYMBOL

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [ET_BRACKET_SYMBOL]
			-- Routines that ought to be in SPECIAL [ET_BRACKET_SYMBOL]

	yyvs24: SPECIAL [ET_QUESTION_MARK_SYMBOL]
			-- Stack for semantic values of type ET_QUESTION_MARK_SYMBOL

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [ET_QUESTION_MARK_SYMBOL]
			-- Routines that ought to be in SPECIAL [ET_QUESTION_MARK_SYMBOL]

	yyvs25: SPECIAL [ET_ACTUAL_ARGUMENT_LIST]
			-- Stack for semantic values of type ET_ACTUAL_ARGUMENT_LIST

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [ET_ACTUAL_ARGUMENT_LIST]
			-- Routines that ought to be in SPECIAL [ET_ACTUAL_ARGUMENT_LIST]

	yyvs26: SPECIAL [ET_ACTUAL_PARAMETER_ITEM]
			-- Stack for semantic values of type ET_ACTUAL_PARAMETER_ITEM

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM]
			-- Routines that ought to be in SPECIAL [ET_ACTUAL_PARAMETER_ITEM]

	yyvs27: SPECIAL [ET_ACTUAL_PARAMETER_LIST]
			-- Stack for semantic values of type ET_ACTUAL_PARAMETER_LIST

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_LIST]
			-- Routines that ought to be in SPECIAL [ET_ACTUAL_PARAMETER_LIST]

	yyvs28: SPECIAL [ET_AGENT_ARGUMENT_OPERAND]
			-- Stack for semantic values of type ET_AGENT_ARGUMENT_OPERAND

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [ET_AGENT_ARGUMENT_OPERAND]
			-- Routines that ought to be in SPECIAL [ET_AGENT_ARGUMENT_OPERAND]

	yyvs29: SPECIAL [ET_AGENT_ARGUMENT_OPERAND_ITEM]
			-- Stack for semantic values of type ET_AGENT_ARGUMENT_OPERAND_ITEM

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [ET_AGENT_ARGUMENT_OPERAND_ITEM]
			-- Routines that ought to be in SPECIAL [ET_AGENT_ARGUMENT_OPERAND_ITEM]

	yyvs30: SPECIAL [ET_AGENT_ARGUMENT_OPERAND_LIST]
			-- Stack for semantic values of type ET_AGENT_ARGUMENT_OPERAND_LIST

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [ET_AGENT_ARGUMENT_OPERAND_LIST]
			-- Routines that ought to be in SPECIAL [ET_AGENT_ARGUMENT_OPERAND_LIST]

	yyvs31: SPECIAL [ET_AGENT_TARGET]
			-- Stack for semantic values of type ET_AGENT_TARGET

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [ET_AGENT_TARGET]
			-- Routines that ought to be in SPECIAL [ET_AGENT_TARGET]

	yyvs32: SPECIAL [ET_ALIAS_NAME]
			-- Stack for semantic values of type ET_ALIAS_NAME

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [ET_ALIAS_NAME]
			-- Routines that ought to be in SPECIAL [ET_ALIAS_NAME]

	yyvs33: SPECIAL [ET_ASSIGNER]
			-- Stack for semantic values of type ET_ASSIGNER

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [ET_ASSIGNER]
			-- Routines that ought to be in SPECIAL [ET_ASSIGNER]

	yyvs34: SPECIAL [ET_BRACKET_ARGUMENT_LIST]
			-- Stack for semantic values of type ET_BRACKET_ARGUMENT_LIST

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [ET_BRACKET_ARGUMENT_LIST]
			-- Routines that ought to be in SPECIAL [ET_BRACKET_ARGUMENT_LIST]

	yyvs35: SPECIAL [ET_BRACKET_EXPRESSION]
			-- Stack for semantic values of type ET_BRACKET_EXPRESSION

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [ET_BRACKET_EXPRESSION]
			-- Routines that ought to be in SPECIAL [ET_BRACKET_EXPRESSION]

	yyvs36: SPECIAL [ET_CALL_AGENT]
			-- Stack for semantic values of type ET_CALL_AGENT

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [ET_CALL_AGENT]
			-- Routines that ought to be in SPECIAL [ET_CALL_AGENT]

	yyvs37: SPECIAL [ET_CALL_EXPRESSION]
			-- Stack for semantic values of type ET_CALL_EXPRESSION

	yyvsc37: INTEGER
			-- Capacity of semantic value stack `yyvs37'

	yyvsp37: INTEGER
			-- Top of semantic value stack `yyvs37'

	yyspecial_routines37: KL_SPECIAL_ROUTINES [ET_CALL_EXPRESSION]
			-- Routines that ought to be in SPECIAL [ET_CALL_EXPRESSION]

	yyvs38: SPECIAL [ET_CHOICE]
			-- Stack for semantic values of type ET_CHOICE

	yyvsc38: INTEGER
			-- Capacity of semantic value stack `yyvs38'

	yyvsp38: INTEGER
			-- Top of semantic value stack `yyvs38'

	yyspecial_routines38: KL_SPECIAL_ROUTINES [ET_CHOICE]
			-- Routines that ought to be in SPECIAL [ET_CHOICE]

	yyvs39: SPECIAL [ET_CHOICE_CONSTANT]
			-- Stack for semantic values of type ET_CHOICE_CONSTANT

	yyvsc39: INTEGER
			-- Capacity of semantic value stack `yyvs39'

	yyvsp39: INTEGER
			-- Top of semantic value stack `yyvs39'

	yyspecial_routines39: KL_SPECIAL_ROUTINES [ET_CHOICE_CONSTANT]
			-- Routines that ought to be in SPECIAL [ET_CHOICE_CONSTANT]

	yyvs40: SPECIAL [ET_CHOICE_ITEM]
			-- Stack for semantic values of type ET_CHOICE_ITEM

	yyvsc40: INTEGER
			-- Capacity of semantic value stack `yyvs40'

	yyvsp40: INTEGER
			-- Top of semantic value stack `yyvs40'

	yyspecial_routines40: KL_SPECIAL_ROUTINES [ET_CHOICE_ITEM]
			-- Routines that ought to be in SPECIAL [ET_CHOICE_ITEM]

	yyvs41: SPECIAL [ET_CHOICE_LIST]
			-- Stack for semantic values of type ET_CHOICE_LIST

	yyvsc41: INTEGER
			-- Capacity of semantic value stack `yyvs41'

	yyvsp41: INTEGER
			-- Top of semantic value stack `yyvs41'

	yyspecial_routines41: KL_SPECIAL_ROUTINES [ET_CHOICE_LIST]
			-- Routines that ought to be in SPECIAL [ET_CHOICE_LIST]

	yyvs42: SPECIAL [ET_CLASS]
			-- Stack for semantic values of type ET_CLASS

	yyvsc42: INTEGER
			-- Capacity of semantic value stack `yyvs42'

	yyvsp42: INTEGER
			-- Top of semantic value stack `yyvs42'

	yyspecial_routines42: KL_SPECIAL_ROUTINES [ET_CLASS]
			-- Routines that ought to be in SPECIAL [ET_CLASS]

	yyvs43: SPECIAL [ET_CLASS_NAME_ITEM]
			-- Stack for semantic values of type ET_CLASS_NAME_ITEM

	yyvsc43: INTEGER
			-- Capacity of semantic value stack `yyvs43'

	yyvsp43: INTEGER
			-- Top of semantic value stack `yyvs43'

	yyspecial_routines43: KL_SPECIAL_ROUTINES [ET_CLASS_NAME_ITEM]
			-- Routines that ought to be in SPECIAL [ET_CLASS_NAME_ITEM]

	yyvs44: SPECIAL [ET_CLIENTS]
			-- Stack for semantic values of type ET_CLIENTS

	yyvsc44: INTEGER
			-- Capacity of semantic value stack `yyvs44'

	yyvsp44: INTEGER
			-- Top of semantic value stack `yyvs44'

	yyspecial_routines44: KL_SPECIAL_ROUTINES [ET_CLIENTS]
			-- Routines that ought to be in SPECIAL [ET_CLIENTS]

	yyvs45: SPECIAL [ET_COMPOUND]
			-- Stack for semantic values of type ET_COMPOUND

	yyvsc45: INTEGER
			-- Capacity of semantic value stack `yyvs45'

	yyvsp45: INTEGER
			-- Top of semantic value stack `yyvs45'

	yyspecial_routines45: KL_SPECIAL_ROUTINES [ET_COMPOUND]
			-- Routines that ought to be in SPECIAL [ET_COMPOUND]

	yyvs46: SPECIAL [ET_CONSTANT]
			-- Stack for semantic values of type ET_CONSTANT

	yyvsc46: INTEGER
			-- Capacity of semantic value stack `yyvs46'

	yyvsp46: INTEGER
			-- Top of semantic value stack `yyvs46'

	yyspecial_routines46: KL_SPECIAL_ROUTINES [ET_CONSTANT]
			-- Routines that ought to be in SPECIAL [ET_CONSTANT]

	yyvs47: SPECIAL [ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM]
			-- Stack for semantic values of type ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM

	yyvsc47: INTEGER
			-- Capacity of semantic value stack `yyvs47'

	yyvsp47: INTEGER
			-- Top of semantic value stack `yyvs47'

	yyspecial_routines47: KL_SPECIAL_ROUTINES [ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM]
			-- Routines that ought to be in SPECIAL [ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM]

	yyvs48: SPECIAL [ET_CONSTRAINT_ACTUAL_PARAMETER_LIST]
			-- Stack for semantic values of type ET_CONSTRAINT_ACTUAL_PARAMETER_LIST

	yyvsc48: INTEGER
			-- Capacity of semantic value stack `yyvs48'

	yyvsp48: INTEGER
			-- Top of semantic value stack `yyvs48'

	yyspecial_routines48: KL_SPECIAL_ROUTINES [ET_CONSTRAINT_ACTUAL_PARAMETER_LIST]
			-- Routines that ought to be in SPECIAL [ET_CONSTRAINT_ACTUAL_PARAMETER_LIST]

	yyvs49: SPECIAL [ET_CONSTRAINT_CREATOR]
			-- Stack for semantic values of type ET_CONSTRAINT_CREATOR

	yyvsc49: INTEGER
			-- Capacity of semantic value stack `yyvs49'

	yyvsp49: INTEGER
			-- Top of semantic value stack `yyvs49'

	yyspecial_routines49: KL_SPECIAL_ROUTINES [ET_CONSTRAINT_CREATOR]
			-- Routines that ought to be in SPECIAL [ET_CONSTRAINT_CREATOR]

	yyvs50: SPECIAL [ET_CONSTRAINT_TYPE]
			-- Stack for semantic values of type ET_CONSTRAINT_TYPE

	yyvsc50: INTEGER
			-- Capacity of semantic value stack `yyvs50'

	yyvsp50: INTEGER
			-- Top of semantic value stack `yyvs50'

	yyspecial_routines50: KL_SPECIAL_ROUTINES [ET_CONSTRAINT_TYPE]
			-- Routines that ought to be in SPECIAL [ET_CONSTRAINT_TYPE]

	yyvs51: SPECIAL [ET_CONVERT_FEATURE]
			-- Stack for semantic values of type ET_CONVERT_FEATURE

	yyvsc51: INTEGER
			-- Capacity of semantic value stack `yyvs51'

	yyvsp51: INTEGER
			-- Top of semantic value stack `yyvs51'

	yyspecial_routines51: KL_SPECIAL_ROUTINES [ET_CONVERT_FEATURE]
			-- Routines that ought to be in SPECIAL [ET_CONVERT_FEATURE]

	yyvs52: SPECIAL [ET_CONVERT_FEATURE_ITEM]
			-- Stack for semantic values of type ET_CONVERT_FEATURE_ITEM

	yyvsc52: INTEGER
			-- Capacity of semantic value stack `yyvs52'

	yyvsp52: INTEGER
			-- Top of semantic value stack `yyvs52'

	yyspecial_routines52: KL_SPECIAL_ROUTINES [ET_CONVERT_FEATURE_ITEM]
			-- Routines that ought to be in SPECIAL [ET_CONVERT_FEATURE_ITEM]

	yyvs53: SPECIAL [ET_CONVERT_FEATURE_LIST]
			-- Stack for semantic values of type ET_CONVERT_FEATURE_LIST

	yyvsc53: INTEGER
			-- Capacity of semantic value stack `yyvs53'

	yyvsp53: INTEGER
			-- Top of semantic value stack `yyvs53'

	yyspecial_routines53: KL_SPECIAL_ROUTINES [ET_CONVERT_FEATURE_LIST]
			-- Routines that ought to be in SPECIAL [ET_CONVERT_FEATURE_LIST]

	yyvs54: SPECIAL [ET_CREATE_EXPRESSION]
			-- Stack for semantic values of type ET_CREATE_EXPRESSION

	yyvsc54: INTEGER
			-- Capacity of semantic value stack `yyvs54'

	yyvsp54: INTEGER
			-- Top of semantic value stack `yyvs54'

	yyspecial_routines54: KL_SPECIAL_ROUTINES [ET_CREATE_EXPRESSION]
			-- Routines that ought to be in SPECIAL [ET_CREATE_EXPRESSION]

	yyvs55: SPECIAL [ET_CREATOR]
			-- Stack for semantic values of type ET_CREATOR

	yyvsc55: INTEGER
			-- Capacity of semantic value stack `yyvs55'

	yyvsp55: INTEGER
			-- Top of semantic value stack `yyvs55'

	yyspecial_routines55: KL_SPECIAL_ROUTINES [ET_CREATOR]
			-- Routines that ought to be in SPECIAL [ET_CREATOR]

	yyvs56: SPECIAL [ET_CREATOR_LIST]
			-- Stack for semantic values of type ET_CREATOR_LIST

	yyvsc56: INTEGER
			-- Capacity of semantic value stack `yyvs56'

	yyvsp56: INTEGER
			-- Top of semantic value stack `yyvs56'

	yyspecial_routines56: KL_SPECIAL_ROUTINES [ET_CREATOR_LIST]
			-- Routines that ought to be in SPECIAL [ET_CREATOR_LIST]

	yyvs57: SPECIAL [ET_DEBUG_INSTRUCTION]
			-- Stack for semantic values of type ET_DEBUG_INSTRUCTION

	yyvsc57: INTEGER
			-- Capacity of semantic value stack `yyvs57'

	yyvsp57: INTEGER
			-- Top of semantic value stack `yyvs57'

	yyspecial_routines57: KL_SPECIAL_ROUTINES [ET_DEBUG_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [ET_DEBUG_INSTRUCTION]

	yyvs58: SPECIAL [ET_ELSEIF_PART]
			-- Stack for semantic values of type ET_ELSEIF_PART

	yyvsc58: INTEGER
			-- Capacity of semantic value stack `yyvs58'

	yyvsp58: INTEGER
			-- Top of semantic value stack `yyvs58'

	yyspecial_routines58: KL_SPECIAL_ROUTINES [ET_ELSEIF_PART]
			-- Routines that ought to be in SPECIAL [ET_ELSEIF_PART]

	yyvs59: SPECIAL [ET_ELSEIF_PART_LIST]
			-- Stack for semantic values of type ET_ELSEIF_PART_LIST

	yyvsc59: INTEGER
			-- Capacity of semantic value stack `yyvs59'

	yyvsp59: INTEGER
			-- Top of semantic value stack `yyvs59'

	yyspecial_routines59: KL_SPECIAL_ROUTINES [ET_ELSEIF_PART_LIST]
			-- Routines that ought to be in SPECIAL [ET_ELSEIF_PART_LIST]

	yyvs60: SPECIAL [ET_EXPORT]
			-- Stack for semantic values of type ET_EXPORT

	yyvsc60: INTEGER
			-- Capacity of semantic value stack `yyvs60'

	yyvsp60: INTEGER
			-- Top of semantic value stack `yyvs60'

	yyspecial_routines60: KL_SPECIAL_ROUTINES [ET_EXPORT]
			-- Routines that ought to be in SPECIAL [ET_EXPORT]

	yyvs61: SPECIAL [ET_EXPORT_LIST]
			-- Stack for semantic values of type ET_EXPORT_LIST

	yyvsc61: INTEGER
			-- Capacity of semantic value stack `yyvs61'

	yyvsp61: INTEGER
			-- Top of semantic value stack `yyvs61'

	yyspecial_routines61: KL_SPECIAL_ROUTINES [ET_EXPORT_LIST]
			-- Routines that ought to be in SPECIAL [ET_EXPORT_LIST]

	yyvs62: SPECIAL [ET_EXPRESSION]
			-- Stack for semantic values of type ET_EXPRESSION

	yyvsc62: INTEGER
			-- Capacity of semantic value stack `yyvs62'

	yyvsp62: INTEGER
			-- Top of semantic value stack `yyvs62'

	yyspecial_routines62: KL_SPECIAL_ROUTINES [ET_EXPRESSION]
			-- Routines that ought to be in SPECIAL [ET_EXPRESSION]

	yyvs63: SPECIAL [ET_EXPRESSION_ITEM]
			-- Stack for semantic values of type ET_EXPRESSION_ITEM

	yyvsc63: INTEGER
			-- Capacity of semantic value stack `yyvs63'

	yyvsp63: INTEGER
			-- Top of semantic value stack `yyvs63'

	yyspecial_routines63: KL_SPECIAL_ROUTINES [ET_EXPRESSION_ITEM]
			-- Routines that ought to be in SPECIAL [ET_EXPRESSION_ITEM]

	yyvs64: SPECIAL [ET_EXTENDED_FEATURE_NAME]
			-- Stack for semantic values of type ET_EXTENDED_FEATURE_NAME

	yyvsc64: INTEGER
			-- Capacity of semantic value stack `yyvs64'

	yyvsp64: INTEGER
			-- Top of semantic value stack `yyvs64'

	yyspecial_routines64: KL_SPECIAL_ROUTINES [ET_EXTENDED_FEATURE_NAME]
			-- Routines that ought to be in SPECIAL [ET_EXTENDED_FEATURE_NAME]

	yyvs65: SPECIAL [ET_EXTERNAL_ALIAS]
			-- Stack for semantic values of type ET_EXTERNAL_ALIAS

	yyvsc65: INTEGER
			-- Capacity of semantic value stack `yyvs65'

	yyvsp65: INTEGER
			-- Top of semantic value stack `yyvs65'

	yyspecial_routines65: KL_SPECIAL_ROUTINES [ET_EXTERNAL_ALIAS]
			-- Routines that ought to be in SPECIAL [ET_EXTERNAL_ALIAS]

	yyvs66: SPECIAL [ET_FEATURE_CLAUSE]
			-- Stack for semantic values of type ET_FEATURE_CLAUSE

	yyvsc66: INTEGER
			-- Capacity of semantic value stack `yyvs66'

	yyvsp66: INTEGER
			-- Top of semantic value stack `yyvs66'

	yyspecial_routines66: KL_SPECIAL_ROUTINES [ET_FEATURE_CLAUSE]
			-- Routines that ought to be in SPECIAL [ET_FEATURE_CLAUSE]

	yyvs67: SPECIAL [ET_FEATURE_CLAUSE_LIST]
			-- Stack for semantic values of type ET_FEATURE_CLAUSE_LIST

	yyvsc67: INTEGER
			-- Capacity of semantic value stack `yyvs67'

	yyvsp67: INTEGER
			-- Top of semantic value stack `yyvs67'

	yyspecial_routines67: KL_SPECIAL_ROUTINES [ET_FEATURE_CLAUSE_LIST]
			-- Routines that ought to be in SPECIAL [ET_FEATURE_CLAUSE_LIST]

	yyvs68: SPECIAL [ET_FEATURE_EXPORT]
			-- Stack for semantic values of type ET_FEATURE_EXPORT

	yyvsc68: INTEGER
			-- Capacity of semantic value stack `yyvs68'

	yyvsp68: INTEGER
			-- Top of semantic value stack `yyvs68'

	yyspecial_routines68: KL_SPECIAL_ROUTINES [ET_FEATURE_EXPORT]
			-- Routines that ought to be in SPECIAL [ET_FEATURE_EXPORT]

	yyvs69: SPECIAL [ET_FEATURE_NAME]
			-- Stack for semantic values of type ET_FEATURE_NAME

	yyvsc69: INTEGER
			-- Capacity of semantic value stack `yyvs69'

	yyvsp69: INTEGER
			-- Top of semantic value stack `yyvs69'

	yyspecial_routines69: KL_SPECIAL_ROUTINES [ET_FEATURE_NAME]
			-- Routines that ought to be in SPECIAL [ET_FEATURE_NAME]

	yyvs70: SPECIAL [ET_FEATURE_NAME_ITEM]
			-- Stack for semantic values of type ET_FEATURE_NAME_ITEM

	yyvsc70: INTEGER
			-- Capacity of semantic value stack `yyvs70'

	yyvsp70: INTEGER
			-- Top of semantic value stack `yyvs70'

	yyspecial_routines70: KL_SPECIAL_ROUTINES [ET_FEATURE_NAME_ITEM]
			-- Routines that ought to be in SPECIAL [ET_FEATURE_NAME_ITEM]

	yyvs71: SPECIAL [ET_FORMAL_ARGUMENT]
			-- Stack for semantic values of type ET_FORMAL_ARGUMENT

	yyvsc71: INTEGER
			-- Capacity of semantic value stack `yyvs71'

	yyvsp71: INTEGER
			-- Top of semantic value stack `yyvs71'

	yyspecial_routines71: KL_SPECIAL_ROUTINES [ET_FORMAL_ARGUMENT]
			-- Routines that ought to be in SPECIAL [ET_FORMAL_ARGUMENT]

	yyvs72: SPECIAL [ET_FORMAL_ARGUMENT_ITEM]
			-- Stack for semantic values of type ET_FORMAL_ARGUMENT_ITEM

	yyvsc72: INTEGER
			-- Capacity of semantic value stack `yyvs72'

	yyvsp72: INTEGER
			-- Top of semantic value stack `yyvs72'

	yyspecial_routines72: KL_SPECIAL_ROUTINES [ET_FORMAL_ARGUMENT_ITEM]
			-- Routines that ought to be in SPECIAL [ET_FORMAL_ARGUMENT_ITEM]

	yyvs73: SPECIAL [ET_FORMAL_ARGUMENT_LIST]
			-- Stack for semantic values of type ET_FORMAL_ARGUMENT_LIST

	yyvsc73: INTEGER
			-- Capacity of semantic value stack `yyvs73'

	yyvsp73: INTEGER
			-- Top of semantic value stack `yyvs73'

	yyspecial_routines73: KL_SPECIAL_ROUTINES [ET_FORMAL_ARGUMENT_LIST]
			-- Routines that ought to be in SPECIAL [ET_FORMAL_ARGUMENT_LIST]

	yyvs74: SPECIAL [ET_FORMAL_PARAMETER]
			-- Stack for semantic values of type ET_FORMAL_PARAMETER

	yyvsc74: INTEGER
			-- Capacity of semantic value stack `yyvs74'

	yyvsp74: INTEGER
			-- Top of semantic value stack `yyvs74'

	yyspecial_routines74: KL_SPECIAL_ROUTINES [ET_FORMAL_PARAMETER]
			-- Routines that ought to be in SPECIAL [ET_FORMAL_PARAMETER]

	yyvs75: SPECIAL [ET_FORMAL_PARAMETER_ITEM]
			-- Stack for semantic values of type ET_FORMAL_PARAMETER_ITEM

	yyvsc75: INTEGER
			-- Capacity of semantic value stack `yyvs75'

	yyvsp75: INTEGER
			-- Top of semantic value stack `yyvs75'

	yyspecial_routines75: KL_SPECIAL_ROUTINES [ET_FORMAL_PARAMETER_ITEM]
			-- Routines that ought to be in SPECIAL [ET_FORMAL_PARAMETER_ITEM]

	yyvs76: SPECIAL [ET_FORMAL_PARAMETER_LIST]
			-- Stack for semantic values of type ET_FORMAL_PARAMETER_LIST

	yyvsc76: INTEGER
			-- Capacity of semantic value stack `yyvs76'

	yyvsp76: INTEGER
			-- Top of semantic value stack `yyvs76'

	yyspecial_routines76: KL_SPECIAL_ROUTINES [ET_FORMAL_PARAMETER_LIST]
			-- Routines that ought to be in SPECIAL [ET_FORMAL_PARAMETER_LIST]

	yyvs77: SPECIAL [ET_IF_INSTRUCTION]
			-- Stack for semantic values of type ET_IF_INSTRUCTION

	yyvsc77: INTEGER
			-- Capacity of semantic value stack `yyvs77'

	yyvsp77: INTEGER
			-- Top of semantic value stack `yyvs77'

	yyspecial_routines77: KL_SPECIAL_ROUTINES [ET_IF_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [ET_IF_INSTRUCTION]

	yyvs78: SPECIAL [ET_INDEXING_LIST]
			-- Stack for semantic values of type ET_INDEXING_LIST

	yyvsc78: INTEGER
			-- Capacity of semantic value stack `yyvs78'

	yyvsp78: INTEGER
			-- Top of semantic value stack `yyvs78'

	yyspecial_routines78: KL_SPECIAL_ROUTINES [ET_INDEXING_LIST]
			-- Routines that ought to be in SPECIAL [ET_INDEXING_LIST]

	yyvs79: SPECIAL [ET_INDEXING_ITEM]
			-- Stack for semantic values of type ET_INDEXING_ITEM

	yyvsc79: INTEGER
			-- Capacity of semantic value stack `yyvs79'

	yyvsp79: INTEGER
			-- Top of semantic value stack `yyvs79'

	yyspecial_routines79: KL_SPECIAL_ROUTINES [ET_INDEXING_ITEM]
			-- Routines that ought to be in SPECIAL [ET_INDEXING_ITEM]

	yyvs80: SPECIAL [ET_INDEXING_TERM]
			-- Stack for semantic values of type ET_INDEXING_TERM

	yyvsc80: INTEGER
			-- Capacity of semantic value stack `yyvs80'

	yyvsp80: INTEGER
			-- Top of semantic value stack `yyvs80'

	yyspecial_routines80: KL_SPECIAL_ROUTINES [ET_INDEXING_TERM]
			-- Routines that ought to be in SPECIAL [ET_INDEXING_TERM]

	yyvs81: SPECIAL [ET_INDEXING_TERM_ITEM]
			-- Stack for semantic values of type ET_INDEXING_TERM_ITEM

	yyvsc81: INTEGER
			-- Capacity of semantic value stack `yyvs81'

	yyvsp81: INTEGER
			-- Top of semantic value stack `yyvs81'

	yyspecial_routines81: KL_SPECIAL_ROUTINES [ET_INDEXING_TERM_ITEM]
			-- Routines that ought to be in SPECIAL [ET_INDEXING_TERM_ITEM]

	yyvs82: SPECIAL [ET_INDEXING_TERM_LIST]
			-- Stack for semantic values of type ET_INDEXING_TERM_LIST

	yyvsc82: INTEGER
			-- Capacity of semantic value stack `yyvs82'

	yyvsp82: INTEGER
			-- Top of semantic value stack `yyvs82'

	yyspecial_routines82: KL_SPECIAL_ROUTINES [ET_INDEXING_TERM_LIST]
			-- Routines that ought to be in SPECIAL [ET_INDEXING_TERM_LIST]

	yyvs83: SPECIAL [ET_INLINE_AGENT]
			-- Stack for semantic values of type ET_INLINE_AGENT

	yyvsc83: INTEGER
			-- Capacity of semantic value stack `yyvs83'

	yyvsp83: INTEGER
			-- Top of semantic value stack `yyvs83'

	yyspecial_routines83: KL_SPECIAL_ROUTINES [ET_INLINE_AGENT]
			-- Routines that ought to be in SPECIAL [ET_INLINE_AGENT]

	yyvs84: SPECIAL [ET_INSPECT_INSTRUCTION]
			-- Stack for semantic values of type ET_INSPECT_INSTRUCTION

	yyvsc84: INTEGER
			-- Capacity of semantic value stack `yyvs84'

	yyvsp84: INTEGER
			-- Top of semantic value stack `yyvs84'

	yyspecial_routines84: KL_SPECIAL_ROUTINES [ET_INSPECT_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [ET_INSPECT_INSTRUCTION]

	yyvs85: SPECIAL [ET_INSTRUCTION]
			-- Stack for semantic values of type ET_INSTRUCTION

	yyvsc85: INTEGER
			-- Capacity of semantic value stack `yyvs85'

	yyvsp85: INTEGER
			-- Top of semantic value stack `yyvs85'

	yyspecial_routines85: KL_SPECIAL_ROUTINES [ET_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [ET_INSTRUCTION]

	yyvs86: SPECIAL [ET_INVARIANTS]
			-- Stack for semantic values of type ET_INVARIANTS

	yyvsc86: INTEGER
			-- Capacity of semantic value stack `yyvs86'

	yyvsp86: INTEGER
			-- Top of semantic value stack `yyvs86'

	yyspecial_routines86: KL_SPECIAL_ROUTINES [ET_INVARIANTS]
			-- Routines that ought to be in SPECIAL [ET_INVARIANTS]

	yyvs87: SPECIAL [ET_KEYWORD_FEATURE_NAME_LIST]
			-- Stack for semantic values of type ET_KEYWORD_FEATURE_NAME_LIST

	yyvsc87: INTEGER
			-- Capacity of semantic value stack `yyvs87'

	yyvsp87: INTEGER
			-- Top of semantic value stack `yyvs87'

	yyspecial_routines87: KL_SPECIAL_ROUTINES [ET_KEYWORD_FEATURE_NAME_LIST]
			-- Routines that ought to be in SPECIAL [ET_KEYWORD_FEATURE_NAME_LIST]

	yyvs88: SPECIAL [ET_LIKE_TYPE]
			-- Stack for semantic values of type ET_LIKE_TYPE

	yyvsc88: INTEGER
			-- Capacity of semantic value stack `yyvs88'

	yyvsp88: INTEGER
			-- Top of semantic value stack `yyvs88'

	yyspecial_routines88: KL_SPECIAL_ROUTINES [ET_LIKE_TYPE]
			-- Routines that ought to be in SPECIAL [ET_LIKE_TYPE]

	yyvs89: SPECIAL [ET_LOCAL_VARIABLE]
			-- Stack for semantic values of type ET_LOCAL_VARIABLE

	yyvsc89: INTEGER
			-- Capacity of semantic value stack `yyvs89'

	yyvsp89: INTEGER
			-- Top of semantic value stack `yyvs89'

	yyspecial_routines89: KL_SPECIAL_ROUTINES [ET_LOCAL_VARIABLE]
			-- Routines that ought to be in SPECIAL [ET_LOCAL_VARIABLE]

	yyvs90: SPECIAL [ET_LOCAL_VARIABLE_ITEM]
			-- Stack for semantic values of type ET_LOCAL_VARIABLE_ITEM

	yyvsc90: INTEGER
			-- Capacity of semantic value stack `yyvs90'

	yyvsp90: INTEGER
			-- Top of semantic value stack `yyvs90'

	yyspecial_routines90: KL_SPECIAL_ROUTINES [ET_LOCAL_VARIABLE_ITEM]
			-- Routines that ought to be in SPECIAL [ET_LOCAL_VARIABLE_ITEM]

	yyvs91: SPECIAL [ET_LOCAL_VARIABLE_LIST]
			-- Stack for semantic values of type ET_LOCAL_VARIABLE_LIST

	yyvsc91: INTEGER
			-- Capacity of semantic value stack `yyvs91'

	yyvsp91: INTEGER
			-- Top of semantic value stack `yyvs91'

	yyspecial_routines91: KL_SPECIAL_ROUTINES [ET_LOCAL_VARIABLE_LIST]
			-- Routines that ought to be in SPECIAL [ET_LOCAL_VARIABLE_LIST]

	yyvs92: SPECIAL [ET_LOOP_INVARIANTS]
			-- Stack for semantic values of type ET_LOOP_INVARIANTS

	yyvsc92: INTEGER
			-- Capacity of semantic value stack `yyvs92'

	yyvsp92: INTEGER
			-- Top of semantic value stack `yyvs92'

	yyspecial_routines92: KL_SPECIAL_ROUTINES [ET_LOOP_INVARIANTS]
			-- Routines that ought to be in SPECIAL [ET_LOOP_INVARIANTS]

	yyvs93: SPECIAL [ET_MANIFEST_ARRAY]
			-- Stack for semantic values of type ET_MANIFEST_ARRAY

	yyvsc93: INTEGER
			-- Capacity of semantic value stack `yyvs93'

	yyvsp93: INTEGER
			-- Top of semantic value stack `yyvs93'

	yyspecial_routines93: KL_SPECIAL_ROUTINES [ET_MANIFEST_ARRAY]
			-- Routines that ought to be in SPECIAL [ET_MANIFEST_ARRAY]

	yyvs94: SPECIAL [ET_MANIFEST_STRING_ITEM]
			-- Stack for semantic values of type ET_MANIFEST_STRING_ITEM

	yyvsc94: INTEGER
			-- Capacity of semantic value stack `yyvs94'

	yyvsp94: INTEGER
			-- Top of semantic value stack `yyvs94'

	yyspecial_routines94: KL_SPECIAL_ROUTINES [ET_MANIFEST_STRING_ITEM]
			-- Routines that ought to be in SPECIAL [ET_MANIFEST_STRING_ITEM]

	yyvs95: SPECIAL [ET_MANIFEST_STRING_LIST]
			-- Stack for semantic values of type ET_MANIFEST_STRING_LIST

	yyvsc95: INTEGER
			-- Capacity of semantic value stack `yyvs95'

	yyvsp95: INTEGER
			-- Top of semantic value stack `yyvs95'

	yyspecial_routines95: KL_SPECIAL_ROUTINES [ET_MANIFEST_STRING_LIST]
			-- Routines that ought to be in SPECIAL [ET_MANIFEST_STRING_LIST]

	yyvs96: SPECIAL [ET_MANIFEST_TUPLE]
			-- Stack for semantic values of type ET_MANIFEST_TUPLE

	yyvsc96: INTEGER
			-- Capacity of semantic value stack `yyvs96'

	yyvsp96: INTEGER
			-- Top of semantic value stack `yyvs96'

	yyspecial_routines96: KL_SPECIAL_ROUTINES [ET_MANIFEST_TUPLE]
			-- Routines that ought to be in SPECIAL [ET_MANIFEST_TUPLE]

	yyvs97: SPECIAL [ET_OBSOLETE]
			-- Stack for semantic values of type ET_OBSOLETE

	yyvsc97: INTEGER
			-- Capacity of semantic value stack `yyvs97'

	yyvsp97: INTEGER
			-- Top of semantic value stack `yyvs97'

	yyspecial_routines97: KL_SPECIAL_ROUTINES [ET_OBSOLETE]
			-- Routines that ought to be in SPECIAL [ET_OBSOLETE]

	yyvs98: SPECIAL [ET_PARENTHESIZED_EXPRESSION]
			-- Stack for semantic values of type ET_PARENTHESIZED_EXPRESSION

	yyvsc98: INTEGER
			-- Capacity of semantic value stack `yyvs98'

	yyvsp98: INTEGER
			-- Top of semantic value stack `yyvs98'

	yyspecial_routines98: KL_SPECIAL_ROUTINES [ET_PARENTHESIZED_EXPRESSION]
			-- Routines that ought to be in SPECIAL [ET_PARENTHESIZED_EXPRESSION]

	yyvs99: SPECIAL [ET_PARENT]
			-- Stack for semantic values of type ET_PARENT

	yyvsc99: INTEGER
			-- Capacity of semantic value stack `yyvs99'

	yyvsp99: INTEGER
			-- Top of semantic value stack `yyvs99'

	yyspecial_routines99: KL_SPECIAL_ROUTINES [ET_PARENT]
			-- Routines that ought to be in SPECIAL [ET_PARENT]

	yyvs100: SPECIAL [ET_PARENT_ITEM]
			-- Stack for semantic values of type ET_PARENT_ITEM

	yyvsc100: INTEGER
			-- Capacity of semantic value stack `yyvs100'

	yyvsp100: INTEGER
			-- Top of semantic value stack `yyvs100'

	yyspecial_routines100: KL_SPECIAL_ROUTINES [ET_PARENT_ITEM]
			-- Routines that ought to be in SPECIAL [ET_PARENT_ITEM]

	yyvs101: SPECIAL [ET_PARENT_LIST]
			-- Stack for semantic values of type ET_PARENT_LIST

	yyvsc101: INTEGER
			-- Capacity of semantic value stack `yyvs101'

	yyvsp101: INTEGER
			-- Top of semantic value stack `yyvs101'

	yyspecial_routines101: KL_SPECIAL_ROUTINES [ET_PARENT_LIST]
			-- Routines that ought to be in SPECIAL [ET_PARENT_LIST]

	yyvs102: SPECIAL [ET_POSTCONDITIONS]
			-- Stack for semantic values of type ET_POSTCONDITIONS

	yyvsc102: INTEGER
			-- Capacity of semantic value stack `yyvs102'

	yyvsp102: INTEGER
			-- Top of semantic value stack `yyvs102'

	yyspecial_routines102: KL_SPECIAL_ROUTINES [ET_POSTCONDITIONS]
			-- Routines that ought to be in SPECIAL [ET_POSTCONDITIONS]

	yyvs103: SPECIAL [ET_PRECONDITIONS]
			-- Stack for semantic values of type ET_PRECONDITIONS

	yyvsc103: INTEGER
			-- Capacity of semantic value stack `yyvs103'

	yyvsp103: INTEGER
			-- Top of semantic value stack `yyvs103'

	yyspecial_routines103: KL_SPECIAL_ROUTINES [ET_PRECONDITIONS]
			-- Routines that ought to be in SPECIAL [ET_PRECONDITIONS]

	yyvs104: SPECIAL [ET_PROCEDURE]
			-- Stack for semantic values of type ET_PROCEDURE

	yyvsc104: INTEGER
			-- Capacity of semantic value stack `yyvs104'

	yyvsp104: INTEGER
			-- Top of semantic value stack `yyvs104'

	yyspecial_routines104: KL_SPECIAL_ROUTINES [ET_PROCEDURE]
			-- Routines that ought to be in SPECIAL [ET_PROCEDURE]

	yyvs105: SPECIAL [ET_QUERY]
			-- Stack for semantic values of type ET_QUERY

	yyvsc105: INTEGER
			-- Capacity of semantic value stack `yyvs105'

	yyvsp105: INTEGER
			-- Top of semantic value stack `yyvs105'

	yyspecial_routines105: KL_SPECIAL_ROUTINES [ET_QUERY]
			-- Routines that ought to be in SPECIAL [ET_QUERY]

	yyvs106: SPECIAL [ET_RENAME_ITEM]
			-- Stack for semantic values of type ET_RENAME_ITEM

	yyvsc106: INTEGER
			-- Capacity of semantic value stack `yyvs106'

	yyvsp106: INTEGER
			-- Top of semantic value stack `yyvs106'

	yyspecial_routines106: KL_SPECIAL_ROUTINES [ET_RENAME_ITEM]
			-- Routines that ought to be in SPECIAL [ET_RENAME_ITEM]

	yyvs107: SPECIAL [ET_RENAME_LIST]
			-- Stack for semantic values of type ET_RENAME_LIST

	yyvsc107: INTEGER
			-- Capacity of semantic value stack `yyvs107'

	yyvsp107: INTEGER
			-- Top of semantic value stack `yyvs107'

	yyspecial_routines107: KL_SPECIAL_ROUTINES [ET_RENAME_LIST]
			-- Routines that ought to be in SPECIAL [ET_RENAME_LIST]

	yyvs108: SPECIAL [ET_STATIC_CALL_EXPRESSION]
			-- Stack for semantic values of type ET_STATIC_CALL_EXPRESSION

	yyvsc108: INTEGER
			-- Capacity of semantic value stack `yyvs108'

	yyvsp108: INTEGER
			-- Top of semantic value stack `yyvs108'

	yyspecial_routines108: KL_SPECIAL_ROUTINES [ET_STATIC_CALL_EXPRESSION]
			-- Routines that ought to be in SPECIAL [ET_STATIC_CALL_EXPRESSION]

	yyvs109: SPECIAL [ET_STRIP_EXPRESSION]
			-- Stack for semantic values of type ET_STRIP_EXPRESSION

	yyvsc109: INTEGER
			-- Capacity of semantic value stack `yyvs109'

	yyvsp109: INTEGER
			-- Top of semantic value stack `yyvs109'

	yyspecial_routines109: KL_SPECIAL_ROUTINES [ET_STRIP_EXPRESSION]
			-- Routines that ought to be in SPECIAL [ET_STRIP_EXPRESSION]

	yyvs110: SPECIAL [ET_TYPE]
			-- Stack for semantic values of type ET_TYPE

	yyvsc110: INTEGER
			-- Capacity of semantic value stack `yyvs110'

	yyvsp110: INTEGER
			-- Top of semantic value stack `yyvs110'

	yyspecial_routines110: KL_SPECIAL_ROUTINES [ET_TYPE]
			-- Routines that ought to be in SPECIAL [ET_TYPE]

	yyvs111: SPECIAL [ET_TYPE_ITEM]
			-- Stack for semantic values of type ET_TYPE_ITEM

	yyvsc111: INTEGER
			-- Capacity of semantic value stack `yyvs111'

	yyvsp111: INTEGER
			-- Top of semantic value stack `yyvs111'

	yyspecial_routines111: KL_SPECIAL_ROUTINES [ET_TYPE_ITEM]
			-- Routines that ought to be in SPECIAL [ET_TYPE_ITEM]

	yyvs112: SPECIAL [ET_TYPE_LIST]
			-- Stack for semantic values of type ET_TYPE_LIST

	yyvsc112: INTEGER
			-- Capacity of semantic value stack `yyvs112'

	yyvsp112: INTEGER
			-- Top of semantic value stack `yyvs112'

	yyspecial_routines112: KL_SPECIAL_ROUTINES [ET_TYPE_LIST]
			-- Routines that ought to be in SPECIAL [ET_TYPE_LIST]

	yyvs113: SPECIAL [ET_VARIANT]
			-- Stack for semantic values of type ET_VARIANT

	yyvsc113: INTEGER
			-- Capacity of semantic value stack `yyvs113'

	yyvsp113: INTEGER
			-- Top of semantic value stack `yyvs113'

	yyspecial_routines113: KL_SPECIAL_ROUTINES [ET_VARIANT]
			-- Routines that ought to be in SPECIAL [ET_VARIANT]

	yyvs114: SPECIAL [ET_WHEN_PART]
			-- Stack for semantic values of type ET_WHEN_PART

	yyvsc114: INTEGER
			-- Capacity of semantic value stack `yyvs114'

	yyvsp114: INTEGER
			-- Top of semantic value stack `yyvs114'

	yyspecial_routines114: KL_SPECIAL_ROUTINES [ET_WHEN_PART]
			-- Routines that ought to be in SPECIAL [ET_WHEN_PART]

	yyvs115: SPECIAL [ET_WHEN_PART_LIST]
			-- Stack for semantic values of type ET_WHEN_PART_LIST

	yyvsc115: INTEGER
			-- Capacity of semantic value stack `yyvs115'

	yyvsp115: INTEGER
			-- Top of semantic value stack `yyvs115'

	yyspecial_routines115: KL_SPECIAL_ROUTINES [ET_WHEN_PART_LIST]
			-- Routines that ought to be in SPECIAL [ET_WHEN_PART_LIST]

	yyvs116: SPECIAL [ET_WRITABLE]
			-- Stack for semantic values of type ET_WRITABLE

	yyvsc116: INTEGER
			-- Capacity of semantic value stack `yyvs116'

	yyvsp116: INTEGER
			-- Top of semantic value stack `yyvs116'

	yyspecial_routines116: KL_SPECIAL_ROUTINES [ET_WRITABLE]
			-- Routines that ought to be in SPECIAL [ET_WRITABLE]

feature {NONE} -- Constants

	yyFinal: INTEGER is 1323
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 137
			-- Number of tokens

	yyLast: INTEGER is 5006
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 369
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 386
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Parsing

	yyparse is
			-- (NOTE: THIS IS THE COPY/PASTE VERSION OF THE CODE IN
			-- THE YY_PARSER_SKELETON CLASS, FOR OPTIMISATION WITH
			-- ISE EIFFEL (ALLOW INLINING NOT POSSIBLE IN
			-- YY_PARSER_SKELETON).)

			-- Parse input stream.
			-- Set `syntax_error' to True if
			-- parsing has not been successful.
		local
			yystacksize: INTEGER
			yystate: INTEGER
			yyn: INTEGER
			yychar1: INTEGER
			index, yyss_top: INTEGER
			yy_goto: INTEGER
		do
				-- This routine is implemented with a loop whose body
				-- is a big inspect instruction. This is a mere
				-- translation of C gotos into Eiffel. Needless to
				-- say that I'm not very proud of this piece of code.
				-- However I performed some benchmarks and the results
				-- were that this implementation runs amazingly faster
				-- than an alternative implementation with no loop nor
				-- inspect instructions and where every branch of the
				-- old inspect instruction was written in a separate
				-- routine. I think that the performance penalty is due
				-- to the routine call overhead and the depth of the call
				-- stack. Anyway, I prefer to provide you with a big and
				-- ugly but fast parsing routine rather than a nice and
				-- slow version. I hope you won't blame me for that! :-)
			from
				if yy_parsing_status = yySuspended then
					yystacksize := yy_suspended_yystacksize
					yystate := yy_suspended_yystate
					yyn := yy_suspended_yyn
					yychar1 := yy_suspended_yychar1
					index := yy_suspended_index
					yyss_top := yy_suspended_yyss_top
					yy_goto := yy_suspended_yy_goto
					yy_parsing_status := yyContinue
				else
					error_count := 0
					yy_lookahead_needed := True
					yyerrstatus := 0
					yy_init_value_stacks
					yyssp := -1
					yystacksize := yyss.count
					yy_parsing_status := yyContinue
					yy_goto := yyNewstate
				end
			until
				yy_parsing_status /= yyContinue
			loop
				inspect yy_goto
				when yyNewstate then
					yyssp := yyssp + 1
					if yyssp >= yystacksize then
						yystacksize := yystacksize + yyInitial_stack_size
						yyss := SPECIAL_INTEGER_.resize (yyss, yystacksize)
						debug ("GEYACC")
							std.error.put_string ("Stack (yyss) size increased to ")
							std.error.put_integer (yystacksize)
							std.error.put_character ('%N')
						end
					end
					debug ("GEYACC")
						std.error.put_string ("Entering state ")
						std.error.put_integer (yystate)
						std.error.put_character ('%N')
					end
					yyss.put (yystate, yyssp)
						-- Do appropriate processing given the current state.
						-- Read a lookahead token if one is needed.
					yyn := yypact.item (yystate)
						-- First try to decide what to do without reference
						-- lookahead token.
					if yyn = yyFlag then
						yy_goto := yyDefault
					else
							-- Not known => get a lookahead token if don't
							-- already have one.
						if yy_lookahead_needed then
							debug ("GEYACC")
								std.error.put_string ("Reading a token%N")
							end
							read_token
							yy_lookahead_needed := False
						end
							-- Convert token to internal form (in `yychar1')
							-- for indexing tables.
						if last_token > yyEof then
							debug ("GEYACC")
								std.error.put_string ("Next token is ")
								std.error.put_integer (last_token)
								std.error.put_character ('%N')
							end
								-- Translate lexical token `last_token' into
								-- geyacc internal token code.
							if last_token <= yyMax_token then
								yychar1 := yytranslate.item (last_token)
							else
								yychar1 := yyNsyms
							end
							yyn := yyn + yychar1
						elseif last_token = yyEof then
								-- This means end of input.
							debug ("GEYACC")
								std.error.put_string ("Now at end of input.%N")
							end
							yychar1 := 0
						else
								-- An error occurred in the scanner.
							debug ("GEYACC")
								std.error.put_string ("Error in scanner.%N")
							end
							error_count := error_count + 1
							yy_do_error_action (yystate)
							abort
								-- Skip next conditional instruction:
							yyn := -1
						end
						if
							(yyn < 0 or yyn > yyLast) or else
							yycheck.item (yyn) /= yychar1
						then
							yy_goto := yyDefault
						else
							yyn := yytable.item (yyn)
								-- `yyn' is what to do for this token type in
								-- this state:
								-- Negative => reduce, -`yyn' is rule number.
								-- Positive => shift, `yyn' is new state.
								-- New state is final state => don't bother to
								-- shift, just return success.
								-- 0, or most negative number => error.
							if yyn < 0 then
								if yyn = yyFlag then
									yy_goto := yyErrlab
								else
									yyn := -yyn
									yy_goto := yyReduce
								end
							elseif yyn = 0 then
								yy_goto := yyErrlab
							elseif yyn = yyFinal then
								accept
							else
									-- Shift the lookahead token.
								debug ("GEYACC")
									std.error.put_string ("Shifting token ")
									std.error.put_integer (last_token)
									std.error.put_character ('%N')
								end
									-- Discard the token being shifted
									-- unless it is eof.
								if last_token > yyEof then
									yy_lookahead_needed := True
								end
								yy_push_last_value (yychar1)
									-- Count tokens shifted since error;
									-- after three, turn off error status.
								if yyerrstatus /= 0 then
									yyerrstatus := yyerrstatus - 1
								end
								yystate := yyn
								check
									newstate: yy_goto = yyNewstate
								end
							end
						end
					end
				when yyDefault then
						-- Do the default action for the current state.
					yyn := yydefact.item (yystate)
					if yyn = 0 then
						yy_goto := yyErrlab
					else
						yy_goto := yyReduce
					end
				when yyReduce then
						-- Do a reduction. `yyn' is the number of a rule
						-- to reduce with.
					debug ("GEYACC")
						std.error.put_string ("Reducing via rule #")
						std.error.put_integer (yyn)
						std.error.put_character ('%N')
					end
					yy_do_action (yyn)
					inspect yy_parsing_status
					when yyContinue then
							-- Now "shift" the result of the reduction.
							-- Determine what state that goes to,
							-- based on the state we popped back to
							-- and the rule number reduced by.
						yyn := yyr1.item (yyn)
						yyss_top := yyss.item (yyssp)
						index := yyn - yyNtbase
						yystate := yypgoto.item (index) + yyss_top
						if
							(yystate >= 0 and yystate <= yyLast) and then
							yycheck.item (yystate) = yyss_top
						then
							yystate := yytable.item (yystate)
						else
							yystate := yydefgoto.item (index)
						end
						yy_goto := yyNewstate
					when yySuspended then
						yy_suspended_yystacksize := yystacksize
						yy_suspended_yystate := yystate
						yy_suspended_yyn := yyn
						yy_suspended_yychar1 := yychar1
						yy_suspended_index := index
						yy_suspended_yyss_top := yyss_top
						yy_suspended_yy_goto := yy_goto
					when yyError_raised then
							-- Handle error raised explicitly by an action.
						yy_parsing_status := yyContinue
						yy_goto := yyErrlab
					else
							-- Accepted or aborted.
					end
				when yyErrlab then
						-- Detect error.
					if yyerrstatus = 3 then
							-- If just tried and failed to reuse lookahead
							-- token after an error, discard it. Return
							-- failure if at end of input.
						if last_token <= yyEof then
							abort
						else
							debug ("GEYACC")
								std.error.put_string ("Discarding token ")
								std.error.put_integer (last_token)
								std.error.put_character ('%N')
							end
							yy_lookahead_needed := True
							yy_goto := yyErrhandle
						end
					else
						if yyerrstatus = 0 then
								-- If not already recovering from an error,
								-- report this error.
							error_count := error_count + 1
							yy_do_error_action (yystate)
						end
						yyerrstatus := 3
						yy_goto := yyErrhandle
					end
				when yyErrhandle then
						-- Handle error.
					yyn := yypact.item (yystate)
					if yyn = yyFlag then
						yy_goto := yyErrpop
					else
						yyn := yyn + yyTerror
						if
							(yyn < 0 or yyn > yyLast) or else
							yycheck.item (yyn) /= yyTerror
						then
							yy_goto := yyErrpop
						else
							yyn := yytable.item (yyn)
							if yyn < 0 then
								if yyn = yyFlag then
									yy_goto := yyErrpop
								else
									yyn := -yyn
									yy_goto := yyReduce
								end
							elseif yyn = 0 then
								yy_goto := yyErrpop
							elseif yyn = yyFinal then
								accept
							else
								yy_push_error_value
								yystate := yyn
								yy_goto := yyNewstate
							end
						end
					end
				when yyErrpop then
						-- Pop the current state because it cannot handle
						-- the error token.
					if yyssp = 0 then
						abort
					else
						yy_pop_last_value (yystate)
						yyssp := yyssp - 1
						yystate := yyss.item (yyssp)
						yy_goto := yyErrhandle
					end
				end
			end
			if yy_parsing_status /= yySuspended then
				yy_clear_all
			end
		rescue
			debug ("GEYACC")
				std.error.put_line ("Entering rescue clause of parser")
			end
			abort
			yy_clear_all
		end

end
