indexing

	description:

		"Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_PARSER

inherit

	ET_EIFFEL_PARSER_SKELETON
		undefine
			read_token
		redefine
			yyparse
		end

	ET_EIFFEL_SCANNER
		rename
			make as make_eiffel_scanner
		undefine
			reset, set_syntax_error
		end

create

	make


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
					--|#line 220 "et_eiffel_parser.y"
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
					--|#line 242 "et_eiffel_parser.y"
				yy_do_action_6
			when 7 then
					--|#line 253 "et_eiffel_parser.y"
				yy_do_action_7
			when 8 then
					--|#line 259 "et_eiffel_parser.y"
				yy_do_action_8
			when 9 then
					--|#line 265 "et_eiffel_parser.y"
				yy_do_action_9
			when 10 then
					--|#line 271 "et_eiffel_parser.y"
				yy_do_action_10
			when 11 then
					--|#line 277 "et_eiffel_parser.y"
				yy_do_action_11
			when 12 then
					--|#line 283 "et_eiffel_parser.y"
				yy_do_action_12
			when 13 then
					--|#line 283 "et_eiffel_parser.y"
				yy_do_action_13
			when 14 then
					--|#line 299 "et_eiffel_parser.y"
				yy_do_action_14
			when 15 then
					--|#line 304 "et_eiffel_parser.y"
				yy_do_action_15
			when 16 then
					--|#line 319 "et_eiffel_parser.y"
				yy_do_action_16
			when 17 then
					--|#line 324 "et_eiffel_parser.y"
				yy_do_action_17
			when 18 then
					--|#line 326 "et_eiffel_parser.y"
				yy_do_action_18
			when 19 then
					--|#line 326 "et_eiffel_parser.y"
				yy_do_action_19
			when 20 then
					--|#line 339 "et_eiffel_parser.y"
				yy_do_action_20
			when 21 then
					--|#line 341 "et_eiffel_parser.y"
				yy_do_action_21
			when 22 then
					--|#line 345 "et_eiffel_parser.y"
				yy_do_action_22
			when 23 then
					--|#line 356 "et_eiffel_parser.y"
				yy_do_action_23
			when 24 then
					--|#line 368 "et_eiffel_parser.y"
				yy_do_action_24
			when 25 then
					--|#line 368 "et_eiffel_parser.y"
				yy_do_action_25
			when 26 then
					--|#line 377 "et_eiffel_parser.y"
				yy_do_action_26
			when 27 then
					--|#line 377 "et_eiffel_parser.y"
				yy_do_action_27
			when 28 then
					--|#line 388 "et_eiffel_parser.y"
				yy_do_action_28
			when 29 then
					--|#line 395 "et_eiffel_parser.y"
				yy_do_action_29
			when 30 then
					--|#line 399 "et_eiffel_parser.y"
				yy_do_action_30
			when 31 then
					--|#line 405 "et_eiffel_parser.y"
				yy_do_action_31
			when 32 then
					--|#line 407 "et_eiffel_parser.y"
				yy_do_action_32
			when 33 then
					--|#line 412 "et_eiffel_parser.y"
				yy_do_action_33
			when 34 then
					--|#line 423 "et_eiffel_parser.y"
				yy_do_action_34
			when 35 then
					--|#line 432 "et_eiffel_parser.y"
				yy_do_action_35
			when 36 then
					--|#line 434 "et_eiffel_parser.y"
				yy_do_action_36
			when 37 then
					--|#line 436 "et_eiffel_parser.y"
				yy_do_action_37
			when 38 then
					--|#line 438 "et_eiffel_parser.y"
				yy_do_action_38
			when 39 then
					--|#line 440 "et_eiffel_parser.y"
				yy_do_action_39
			when 40 then
					--|#line 442 "et_eiffel_parser.y"
				yy_do_action_40
			when 41 then
					--|#line 444 "et_eiffel_parser.y"
				yy_do_action_41
			when 42 then
					--|#line 446 "et_eiffel_parser.y"
				yy_do_action_42
			when 43 then
					--|#line 448 "et_eiffel_parser.y"
				yy_do_action_43
			when 44 then
					--|#line 452 "et_eiffel_parser.y"
				yy_do_action_44
			when 45 then
					--|#line 463 "et_eiffel_parser.y"
				yy_do_action_45
			when 46 then
					--|#line 473 "et_eiffel_parser.y"
				yy_do_action_46
			when 47 then
					--|#line 484 "et_eiffel_parser.y"
				yy_do_action_47
			when 48 then
					--|#line 495 "et_eiffel_parser.y"
				yy_do_action_48
			when 49 then
					--|#line 508 "et_eiffel_parser.y"
				yy_do_action_49
			when 50 then
					--|#line 510 "et_eiffel_parser.y"
				yy_do_action_50
			when 51 then
					--|#line 514 "et_eiffel_parser.y"
				yy_do_action_51
			when 52 then
					--|#line 516 "et_eiffel_parser.y"
				yy_do_action_52
			when 53 then
					--|#line 522 "et_eiffel_parser.y"
				yy_do_action_53
			when 54 then
					--|#line 526 "et_eiffel_parser.y"
				yy_do_action_54
			when 55 then
					--|#line 532 "et_eiffel_parser.y"
				yy_do_action_55
			when 56 then
					--|#line 532 "et_eiffel_parser.y"
				yy_do_action_56
			when 57 then
					--|#line 546 "et_eiffel_parser.y"
				yy_do_action_57
			when 58 then
					--|#line 557 "et_eiffel_parser.y"
				yy_do_action_58
			when 59 then
					--|#line 566 "et_eiffel_parser.y"
				yy_do_action_59
			when 60 then
					--|#line 575 "et_eiffel_parser.y"
				yy_do_action_60
			when 61 then
					--|#line 582 "et_eiffel_parser.y"
				yy_do_action_61
			when 62 then
					--|#line 589 "et_eiffel_parser.y"
				yy_do_action_62
			when 63 then
					--|#line 596 "et_eiffel_parser.y"
				yy_do_action_63
			when 64 then
					--|#line 603 "et_eiffel_parser.y"
				yy_do_action_64
			when 65 then
					--|#line 610 "et_eiffel_parser.y"
				yy_do_action_65
			when 66 then
					--|#line 617 "et_eiffel_parser.y"
				yy_do_action_66
			when 67 then
					--|#line 624 "et_eiffel_parser.y"
				yy_do_action_67
			when 68 then
					--|#line 631 "et_eiffel_parser.y"
				yy_do_action_68
			when 69 then
					--|#line 640 "et_eiffel_parser.y"
				yy_do_action_69
			when 70 then
					--|#line 642 "et_eiffel_parser.y"
				yy_do_action_70
			when 71 then
					--|#line 642 "et_eiffel_parser.y"
				yy_do_action_71
			when 72 then
					--|#line 655 "et_eiffel_parser.y"
				yy_do_action_72
			when 73 then
					--|#line 666 "et_eiffel_parser.y"
				yy_do_action_73
			when 74 then
					--|#line 674 "et_eiffel_parser.y"
				yy_do_action_74
			when 75 then
					--|#line 683 "et_eiffel_parser.y"
				yy_do_action_75
			when 76 then
					--|#line 685 "et_eiffel_parser.y"
				yy_do_action_76
			when 77 then
					--|#line 687 "et_eiffel_parser.y"
				yy_do_action_77
			when 78 then
					--|#line 689 "et_eiffel_parser.y"
				yy_do_action_78
			when 79 then
					--|#line 691 "et_eiffel_parser.y"
				yy_do_action_79
			when 80 then
					--|#line 699 "et_eiffel_parser.y"
				yy_do_action_80
			when 81 then
					--|#line 707 "et_eiffel_parser.y"
				yy_do_action_81
			when 82 then
					--|#line 709 "et_eiffel_parser.y"
				yy_do_action_82
			when 83 then
					--|#line 711 "et_eiffel_parser.y"
				yy_do_action_83
			when 84 then
					--|#line 713 "et_eiffel_parser.y"
				yy_do_action_84
			when 85 then
					--|#line 715 "et_eiffel_parser.y"
				yy_do_action_85
			when 86 then
					--|#line 723 "et_eiffel_parser.y"
				yy_do_action_86
			when 87 then
					--|#line 733 "et_eiffel_parser.y"
				yy_do_action_87
			when 88 then
					--|#line 735 "et_eiffel_parser.y"
				yy_do_action_88
			when 89 then
					--|#line 737 "et_eiffel_parser.y"
				yy_do_action_89
			when 90 then
					--|#line 739 "et_eiffel_parser.y"
				yy_do_action_90
			when 91 then
					--|#line 741 "et_eiffel_parser.y"
				yy_do_action_91
			when 92 then
					--|#line 749 "et_eiffel_parser.y"
				yy_do_action_92
			when 93 then
					--|#line 757 "et_eiffel_parser.y"
				yy_do_action_93
			when 94 then
					--|#line 759 "et_eiffel_parser.y"
				yy_do_action_94
			when 95 then
					--|#line 761 "et_eiffel_parser.y"
				yy_do_action_95
			when 96 then
					--|#line 763 "et_eiffel_parser.y"
				yy_do_action_96
			when 97 then
					--|#line 765 "et_eiffel_parser.y"
				yy_do_action_97
			when 98 then
					--|#line 773 "et_eiffel_parser.y"
				yy_do_action_98
			when 99 then
					--|#line 783 "et_eiffel_parser.y"
				yy_do_action_99
			when 100 then
					--|#line 785 "et_eiffel_parser.y"
				yy_do_action_100
			when 101 then
					--|#line 789 "et_eiffel_parser.y"
				yy_do_action_101
			when 102 then
					--|#line 792 "et_eiffel_parser.y"
				yy_do_action_102
			when 103 then
					--|#line 800 "et_eiffel_parser.y"
				yy_do_action_103
			when 104 then
					--|#line 811 "et_eiffel_parser.y"
				yy_do_action_104
			when 105 then
					--|#line 816 "et_eiffel_parser.y"
				yy_do_action_105
			when 106 then
					--|#line 821 "et_eiffel_parser.y"
				yy_do_action_106
			when 107 then
					--|#line 828 "et_eiffel_parser.y"
				yy_do_action_107
			when 108 then
					--|#line 837 "et_eiffel_parser.y"
				yy_do_action_108
			when 109 then
					--|#line 839 "et_eiffel_parser.y"
				yy_do_action_109
			when 110 then
					--|#line 843 "et_eiffel_parser.y"
				yy_do_action_110
			when 111 then
					--|#line 846 "et_eiffel_parser.y"
				yy_do_action_111
			when 112 then
					--|#line 852 "et_eiffel_parser.y"
				yy_do_action_112
			when 113 then
					--|#line 860 "et_eiffel_parser.y"
				yy_do_action_113
			when 114 then
					--|#line 865 "et_eiffel_parser.y"
				yy_do_action_114
			when 115 then
					--|#line 870 "et_eiffel_parser.y"
				yy_do_action_115
			when 116 then
					--|#line 875 "et_eiffel_parser.y"
				yy_do_action_116
			when 117 then
					--|#line 886 "et_eiffel_parser.y"
				yy_do_action_117
			when 118 then
					--|#line 897 "et_eiffel_parser.y"
				yy_do_action_118
			when 119 then
					--|#line 910 "et_eiffel_parser.y"
				yy_do_action_119
			when 120 then
					--|#line 919 "et_eiffel_parser.y"
				yy_do_action_120
			when 121 then
					--|#line 930 "et_eiffel_parser.y"
				yy_do_action_121
			when 122 then
					--|#line 932 "et_eiffel_parser.y"
				yy_do_action_122
			when 123 then
					--|#line 938 "et_eiffel_parser.y"
				yy_do_action_123
			when 124 then
					--|#line 940 "et_eiffel_parser.y"
				yy_do_action_124
			when 125 then
					--|#line 942 "et_eiffel_parser.y"
				yy_do_action_125
			when 126 then
					--|#line 949 "et_eiffel_parser.y"
				yy_do_action_126
			when 127 then
					--|#line 957 "et_eiffel_parser.y"
				yy_do_action_127
			when 128 then
					--|#line 964 "et_eiffel_parser.y"
				yy_do_action_128
			when 129 then
					--|#line 971 "et_eiffel_parser.y"
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
					--|#line 1018 "et_eiffel_parser.y"
				yy_do_action_135
			when 136 then
					--|#line 1025 "et_eiffel_parser.y"
				yy_do_action_136
			when 137 then
					--|#line 1032 "et_eiffel_parser.y"
				yy_do_action_137
			when 138 then
					--|#line 1039 "et_eiffel_parser.y"
				yy_do_action_138
			when 139 then
					--|#line 1046 "et_eiffel_parser.y"
				yy_do_action_139
			when 140 then
					--|#line 1055 "et_eiffel_parser.y"
				yy_do_action_140
			when 141 then
					--|#line 1062 "et_eiffel_parser.y"
				yy_do_action_141
			when 142 then
					--|#line 1069 "et_eiffel_parser.y"
				yy_do_action_142
			when 143 then
					--|#line 1076 "et_eiffel_parser.y"
				yy_do_action_143
			when 144 then
					--|#line 1085 "et_eiffel_parser.y"
				yy_do_action_144
			when 145 then
					--|#line 1092 "et_eiffel_parser.y"
				yy_do_action_145
			when 146 then
					--|#line 1103 "et_eiffel_parser.y"
				yy_do_action_146
			when 147 then
					--|#line 1105 "et_eiffel_parser.y"
				yy_do_action_147
			when 148 then
					--|#line 1105 "et_eiffel_parser.y"
				yy_do_action_148
			when 149 then
					--|#line 1118 "et_eiffel_parser.y"
				yy_do_action_149
			when 150 then
					--|#line 1125 "et_eiffel_parser.y"
				yy_do_action_150
			when 151 then
					--|#line 1133 "et_eiffel_parser.y"
				yy_do_action_151
			when 152 then
					--|#line 1142 "et_eiffel_parser.y"
				yy_do_action_152
			when 153 then
					--|#line 1151 "et_eiffel_parser.y"
				yy_do_action_153
			when 154 then
					--|#line 1162 "et_eiffel_parser.y"
				yy_do_action_154
			when 155 then
					--|#line 1164 "et_eiffel_parser.y"
				yy_do_action_155
			when 156 then
					--|#line 1164 "et_eiffel_parser.y"
				yy_do_action_156
			when 157 then
					--|#line 1177 "et_eiffel_parser.y"
				yy_do_action_157
			when 158 then
					--|#line 1179 "et_eiffel_parser.y"
				yy_do_action_158
			when 159 then
					--|#line 1183 "et_eiffel_parser.y"
				yy_do_action_159
			when 160 then
					--|#line 1194 "et_eiffel_parser.y"
				yy_do_action_160
			when 161 then
					--|#line 1194 "et_eiffel_parser.y"
				yy_do_action_161
			when 162 then
					--|#line 1209 "et_eiffel_parser.y"
				yy_do_action_162
			when 163 then
					--|#line 1213 "et_eiffel_parser.y"
				yy_do_action_163
			when 164 then
					--|#line 1218 "et_eiffel_parser.y"
				yy_do_action_164
			when 165 then
					--|#line 1218 "et_eiffel_parser.y"
				yy_do_action_165
			when 166 then
					--|#line 1228 "et_eiffel_parser.y"
				yy_do_action_166
			when 167 then
					--|#line 1232 "et_eiffel_parser.y"
				yy_do_action_167
			when 168 then
					--|#line 1243 "et_eiffel_parser.y"
				yy_do_action_168
			when 169 then
					--|#line 1251 "et_eiffel_parser.y"
				yy_do_action_169
			when 170 then
					--|#line 1262 "et_eiffel_parser.y"
				yy_do_action_170
			when 171 then
					--|#line 1262 "et_eiffel_parser.y"
				yy_do_action_171
			when 172 then
					--|#line 1273 "et_eiffel_parser.y"
				yy_do_action_172
			when 173 then
					--|#line 1277 "et_eiffel_parser.y"
				yy_do_action_173
			when 174 then
					--|#line 1284 "et_eiffel_parser.y"
				yy_do_action_174
			when 175 then
					--|#line 1292 "et_eiffel_parser.y"
				yy_do_action_175
			when 176 then
					--|#line 1299 "et_eiffel_parser.y"
				yy_do_action_176
			when 177 then
					--|#line 1309 "et_eiffel_parser.y"
				yy_do_action_177
			when 178 then
					--|#line 1318 "et_eiffel_parser.y"
				yy_do_action_178
			when 179 then
					--|#line 1329 "et_eiffel_parser.y"
				yy_do_action_179
			when 180 then
					--|#line 1331 "et_eiffel_parser.y"
				yy_do_action_180
			when 181 then
					--|#line 1331 "et_eiffel_parser.y"
				yy_do_action_181
			when 182 then
					--|#line 1344 "et_eiffel_parser.y"
				yy_do_action_182
			when 183 then
					--|#line 1346 "et_eiffel_parser.y"
				yy_do_action_183
			when 184 then
					--|#line 1350 "et_eiffel_parser.y"
				yy_do_action_184
			when 185 then
					--|#line 1352 "et_eiffel_parser.y"
				yy_do_action_185
			when 186 then
					--|#line 1352 "et_eiffel_parser.y"
				yy_do_action_186
			when 187 then
					--|#line 1365 "et_eiffel_parser.y"
				yy_do_action_187
			when 188 then
					--|#line 1367 "et_eiffel_parser.y"
				yy_do_action_188
			when 189 then
					--|#line 1371 "et_eiffel_parser.y"
				yy_do_action_189
			when 190 then
					--|#line 1373 "et_eiffel_parser.y"
				yy_do_action_190
			when 191 then
					--|#line 1373 "et_eiffel_parser.y"
				yy_do_action_191
			when 192 then
					--|#line 1386 "et_eiffel_parser.y"
				yy_do_action_192
			when 193 then
					--|#line 1388 "et_eiffel_parser.y"
				yy_do_action_193
			when 194 then
					--|#line 1392 "et_eiffel_parser.y"
				yy_do_action_194
			when 195 then
					--|#line 1403 "et_eiffel_parser.y"
				yy_do_action_195
			when 196 then
					--|#line 1411 "et_eiffel_parser.y"
				yy_do_action_196
			when 197 then
					--|#line 1420 "et_eiffel_parser.y"
				yy_do_action_197
			when 198 then
					--|#line 1431 "et_eiffel_parser.y"
				yy_do_action_198
			when 199 then
					--|#line 1433 "et_eiffel_parser.y"
				yy_do_action_199
			when 200 then
					--|#line 1440 "et_eiffel_parser.y"
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
					--|#line 1447 "et_eiffel_parser.y"
				yy_do_action_201
			when 202 then
					--|#line 1458 "et_eiffel_parser.y"
				yy_do_action_202
			when 203 then
					--|#line 1458 "et_eiffel_parser.y"
				yy_do_action_203
			when 204 then
					--|#line 1473 "et_eiffel_parser.y"
				yy_do_action_204
			when 205 then
					--|#line 1475 "et_eiffel_parser.y"
				yy_do_action_205
			when 206 then
					--|#line 1477 "et_eiffel_parser.y"
				yy_do_action_206
			when 207 then
					--|#line 1477 "et_eiffel_parser.y"
				yy_do_action_207
			when 208 then
					--|#line 1489 "et_eiffel_parser.y"
				yy_do_action_208
			when 209 then
					--|#line 1489 "et_eiffel_parser.y"
				yy_do_action_209
			when 210 then
					--|#line 1501 "et_eiffel_parser.y"
				yy_do_action_210
			when 211 then
					--|#line 1503 "et_eiffel_parser.y"
				yy_do_action_211
			when 212 then
					--|#line 1505 "et_eiffel_parser.y"
				yy_do_action_212
			when 213 then
					--|#line 1505 "et_eiffel_parser.y"
				yy_do_action_213
			when 214 then
					--|#line 1517 "et_eiffel_parser.y"
				yy_do_action_214
			when 215 then
					--|#line 1517 "et_eiffel_parser.y"
				yy_do_action_215
			when 216 then
					--|#line 1531 "et_eiffel_parser.y"
				yy_do_action_216
			when 217 then
					--|#line 1542 "et_eiffel_parser.y"
				yy_do_action_217
			when 218 then
					--|#line 1550 "et_eiffel_parser.y"
				yy_do_action_218
			when 219 then
					--|#line 1559 "et_eiffel_parser.y"
				yy_do_action_219
			when 220 then
					--|#line 1570 "et_eiffel_parser.y"
				yy_do_action_220
			when 221 then
					--|#line 1572 "et_eiffel_parser.y"
				yy_do_action_221
			when 222 then
					--|#line 1576 "et_eiffel_parser.y"
				yy_do_action_222
			when 223 then
					--|#line 1576 "et_eiffel_parser.y"
				yy_do_action_223
			when 224 then
					--|#line 1589 "et_eiffel_parser.y"
				yy_do_action_224
			when 225 then
					--|#line 1596 "et_eiffel_parser.y"
				yy_do_action_225
			when 226 then
					--|#line 1603 "et_eiffel_parser.y"
				yy_do_action_226
			when 227 then
					--|#line 1612 "et_eiffel_parser.y"
				yy_do_action_227
			when 228 then
					--|#line 1621 "et_eiffel_parser.y"
				yy_do_action_228
			when 229 then
					--|#line 1625 "et_eiffel_parser.y"
				yy_do_action_229
			when 230 then
					--|#line 1631 "et_eiffel_parser.y"
				yy_do_action_230
			when 231 then
					--|#line 1633 "et_eiffel_parser.y"
				yy_do_action_231
			when 232 then
					--|#line 1633 "et_eiffel_parser.y"
				yy_do_action_232
			when 233 then
					--|#line 1646 "et_eiffel_parser.y"
				yy_do_action_233
			when 234 then
					--|#line 1657 "et_eiffel_parser.y"
				yy_do_action_234
			when 235 then
					--|#line 1666 "et_eiffel_parser.y"
				yy_do_action_235
			when 236 then
					--|#line 1677 "et_eiffel_parser.y"
				yy_do_action_236
			when 237 then
					--|#line 1682 "et_eiffel_parser.y"
				yy_do_action_237
			when 238 then
					--|#line 1686 "et_eiffel_parser.y"
				yy_do_action_238
			when 239 then
					--|#line 1694 "et_eiffel_parser.y"
				yy_do_action_239
			when 240 then
					--|#line 1701 "et_eiffel_parser.y"
				yy_do_action_240
			when 241 then
					--|#line 1710 "et_eiffel_parser.y"
				yy_do_action_241
			when 242 then
					--|#line 1717 "et_eiffel_parser.y"
				yy_do_action_242
			when 243 then
					--|#line 1726 "et_eiffel_parser.y"
				yy_do_action_243
			when 244 then
					--|#line 1731 "et_eiffel_parser.y"
				yy_do_action_244
			when 245 then
					--|#line 1738 "et_eiffel_parser.y"
				yy_do_action_245
			when 246 then
					--|#line 1739 "et_eiffel_parser.y"
				yy_do_action_246
			when 247 then
					--|#line 1740 "et_eiffel_parser.y"
				yy_do_action_247
			when 248 then
					--|#line 1741 "et_eiffel_parser.y"
				yy_do_action_248
			when 249 then
					--|#line 1746 "et_eiffel_parser.y"
				yy_do_action_249
			when 250 then
					--|#line 1751 "et_eiffel_parser.y"
				yy_do_action_250
			when 251 then
					--|#line 1757 "et_eiffel_parser.y"
				yy_do_action_251
			when 252 then
					--|#line 1762 "et_eiffel_parser.y"
				yy_do_action_252
			when 253 then
					--|#line 1768 "et_eiffel_parser.y"
				yy_do_action_253
			when 254 then
					--|#line 1774 "et_eiffel_parser.y"
				yy_do_action_254
			when 255 then
					--|#line 1783 "et_eiffel_parser.y"
				yy_do_action_255
			when 256 then
					--|#line 1788 "et_eiffel_parser.y"
				yy_do_action_256
			when 257 then
					--|#line 1794 "et_eiffel_parser.y"
				yy_do_action_257
			when 258 then
					--|#line 1799 "et_eiffel_parser.y"
				yy_do_action_258
			when 259 then
					--|#line 1805 "et_eiffel_parser.y"
				yy_do_action_259
			when 260 then
					--|#line 1811 "et_eiffel_parser.y"
				yy_do_action_260
			when 261 then
					--|#line 1820 "et_eiffel_parser.y"
				yy_do_action_261
			when 262 then
					--|#line 1822 "et_eiffel_parser.y"
				yy_do_action_262
			when 263 then
					--|#line 1824 "et_eiffel_parser.y"
				yy_do_action_263
			when 264 then
					--|#line 1826 "et_eiffel_parser.y"
				yy_do_action_264
			when 265 then
					--|#line 1834 "et_eiffel_parser.y"
				yy_do_action_265
			when 266 then
					--|#line 1836 "et_eiffel_parser.y"
				yy_do_action_266
			when 267 then
					--|#line 1844 "et_eiffel_parser.y"
				yy_do_action_267
			when 268 then
					--|#line 1847 "et_eiffel_parser.y"
				yy_do_action_268
			when 269 then
					--|#line 1856 "et_eiffel_parser.y"
				yy_do_action_269
			when 270 then
					--|#line 1860 "et_eiffel_parser.y"
				yy_do_action_270
			when 271 then
					--|#line 1870 "et_eiffel_parser.y"
				yy_do_action_271
			when 272 then
					--|#line 1873 "et_eiffel_parser.y"
				yy_do_action_272
			when 273 then
					--|#line 1882 "et_eiffel_parser.y"
				yy_do_action_273
			when 274 then
					--|#line 1886 "et_eiffel_parser.y"
				yy_do_action_274
			when 275 then
					--|#line 1896 "et_eiffel_parser.y"
				yy_do_action_275
			when 276 then
					--|#line 1898 "et_eiffel_parser.y"
				yy_do_action_276
			when 277 then
					--|#line 1906 "et_eiffel_parser.y"
				yy_do_action_277
			when 278 then
					--|#line 1909 "et_eiffel_parser.y"
				yy_do_action_278
			when 279 then
					--|#line 1918 "et_eiffel_parser.y"
				yy_do_action_279
			when 280 then
					--|#line 1921 "et_eiffel_parser.y"
				yy_do_action_280
			when 281 then
					--|#line 1930 "et_eiffel_parser.y"
				yy_do_action_281
			when 282 then
					--|#line 1934 "et_eiffel_parser.y"
				yy_do_action_282
			when 283 then
					--|#line 1946 "et_eiffel_parser.y"
				yy_do_action_283
			when 284 then
					--|#line 1949 "et_eiffel_parser.y"
				yy_do_action_284
			when 285 then
					--|#line 1953 "et_eiffel_parser.y"
				yy_do_action_285
			when 286 then
					--|#line 1956 "et_eiffel_parser.y"
				yy_do_action_286
			when 287 then
					--|#line 1960 "et_eiffel_parser.y"
				yy_do_action_287
			when 288 then
					--|#line 1962 "et_eiffel_parser.y"
				yy_do_action_288
			when 289 then
					--|#line 1965 "et_eiffel_parser.y"
				yy_do_action_289
			when 290 then
					--|#line 1968 "et_eiffel_parser.y"
				yy_do_action_290
			when 291 then
					--|#line 1974 "et_eiffel_parser.y"
				yy_do_action_291
			when 292 then
					--|#line 1982 "et_eiffel_parser.y"
				yy_do_action_292
			when 293 then
					--|#line 1986 "et_eiffel_parser.y"
				yy_do_action_293
			when 294 then
					--|#line 1988 "et_eiffel_parser.y"
				yy_do_action_294
			when 295 then
					--|#line 1992 "et_eiffel_parser.y"
				yy_do_action_295
			when 296 then
					--|#line 1994 "et_eiffel_parser.y"
				yy_do_action_296
			when 297 then
					--|#line 1998 "et_eiffel_parser.y"
				yy_do_action_297
			when 298 then
					--|#line 2000 "et_eiffel_parser.y"
				yy_do_action_298
			when 299 then
					--|#line 2006 "et_eiffel_parser.y"
				yy_do_action_299
			when 300 then
					--|#line 2008 "et_eiffel_parser.y"
				yy_do_action_300
			when 301 then
					--|#line 2010 "et_eiffel_parser.y"
				yy_do_action_301
			when 302 then
					--|#line 2012 "et_eiffel_parser.y"
				yy_do_action_302
			when 303 then
					--|#line 2014 "et_eiffel_parser.y"
				yy_do_action_303
			when 304 then
					--|#line 2016 "et_eiffel_parser.y"
				yy_do_action_304
			when 305 then
					--|#line 2018 "et_eiffel_parser.y"
				yy_do_action_305
			when 306 then
					--|#line 2020 "et_eiffel_parser.y"
				yy_do_action_306
			when 307 then
					--|#line 2022 "et_eiffel_parser.y"
				yy_do_action_307
			when 308 then
					--|#line 2024 "et_eiffel_parser.y"
				yy_do_action_308
			when 309 then
					--|#line 2026 "et_eiffel_parser.y"
				yy_do_action_309
			when 310 then
					--|#line 2028 "et_eiffel_parser.y"
				yy_do_action_310
			when 311 then
					--|#line 2030 "et_eiffel_parser.y"
				yy_do_action_311
			when 312 then
					--|#line 2032 "et_eiffel_parser.y"
				yy_do_action_312
			when 313 then
					--|#line 2034 "et_eiffel_parser.y"
				yy_do_action_313
			when 314 then
					--|#line 2036 "et_eiffel_parser.y"
				yy_do_action_314
			when 315 then
					--|#line 2038 "et_eiffel_parser.y"
				yy_do_action_315
			when 316 then
					--|#line 2040 "et_eiffel_parser.y"
				yy_do_action_316
			when 317 then
					--|#line 2042 "et_eiffel_parser.y"
				yy_do_action_317
			when 318 then
					--|#line 2044 "et_eiffel_parser.y"
				yy_do_action_318
			when 319 then
					--|#line 2046 "et_eiffel_parser.y"
				yy_do_action_319
			when 320 then
					--|#line 2048 "et_eiffel_parser.y"
				yy_do_action_320
			when 321 then
					--|#line 2050 "et_eiffel_parser.y"
				yy_do_action_321
			when 322 then
					--|#line 2053 "et_eiffel_parser.y"
				yy_do_action_322
			when 323 then
					--|#line 2055 "et_eiffel_parser.y"
				yy_do_action_323
			when 324 then
					--|#line 2057 "et_eiffel_parser.y"
				yy_do_action_324
			when 325 then
					--|#line 2059 "et_eiffel_parser.y"
				yy_do_action_325
			when 326 then
					--|#line 2061 "et_eiffel_parser.y"
				yy_do_action_326
			when 327 then
					--|#line 2063 "et_eiffel_parser.y"
				yy_do_action_327
			when 328 then
					--|#line 2065 "et_eiffel_parser.y"
				yy_do_action_328
			when 329 then
					--|#line 2067 "et_eiffel_parser.y"
				yy_do_action_329
			when 330 then
					--|#line 2069 "et_eiffel_parser.y"
				yy_do_action_330
			when 331 then
					--|#line 2071 "et_eiffel_parser.y"
				yy_do_action_331
			when 332 then
					--|#line 2073 "et_eiffel_parser.y"
				yy_do_action_332
			when 333 then
					--|#line 2075 "et_eiffel_parser.y"
				yy_do_action_333
			when 334 then
					--|#line 2077 "et_eiffel_parser.y"
				yy_do_action_334
			when 335 then
					--|#line 2079 "et_eiffel_parser.y"
				yy_do_action_335
			when 336 then
					--|#line 2081 "et_eiffel_parser.y"
				yy_do_action_336
			when 337 then
					--|#line 2083 "et_eiffel_parser.y"
				yy_do_action_337
			when 338 then
					--|#line 2085 "et_eiffel_parser.y"
				yy_do_action_338
			when 339 then
					--|#line 2087 "et_eiffel_parser.y"
				yy_do_action_339
			when 340 then
					--|#line 2091 "et_eiffel_parser.y"
				yy_do_action_340
			when 341 then
					--|#line 2093 "et_eiffel_parser.y"
				yy_do_action_341
			when 342 then
					--|#line 2097 "et_eiffel_parser.y"
				yy_do_action_342
			when 343 then
					--|#line 2099 "et_eiffel_parser.y"
				yy_do_action_343
			when 344 then
					--|#line 2101 "et_eiffel_parser.y"
				yy_do_action_344
			when 345 then
					--|#line 2103 "et_eiffel_parser.y"
				yy_do_action_345
			when 346 then
					--|#line 2105 "et_eiffel_parser.y"
				yy_do_action_346
			when 347 then
					--|#line 2107 "et_eiffel_parser.y"
				yy_do_action_347
			when 348 then
					--|#line 2109 "et_eiffel_parser.y"
				yy_do_action_348
			when 349 then
					--|#line 2111 "et_eiffel_parser.y"
				yy_do_action_349
			when 350 then
					--|#line 2113 "et_eiffel_parser.y"
				yy_do_action_350
			when 351 then
					--|#line 2115 "et_eiffel_parser.y"
				yy_do_action_351
			when 352 then
					--|#line 2117 "et_eiffel_parser.y"
				yy_do_action_352
			when 353 then
					--|#line 2119 "et_eiffel_parser.y"
				yy_do_action_353
			when 354 then
					--|#line 2121 "et_eiffel_parser.y"
				yy_do_action_354
			when 355 then
					--|#line 2123 "et_eiffel_parser.y"
				yy_do_action_355
			when 356 then
					--|#line 2125 "et_eiffel_parser.y"
				yy_do_action_356
			when 357 then
					--|#line 2127 "et_eiffel_parser.y"
				yy_do_action_357
			when 358 then
					--|#line 2129 "et_eiffel_parser.y"
				yy_do_action_358
			when 359 then
					--|#line 2131 "et_eiffel_parser.y"
				yy_do_action_359
			when 360 then
					--|#line 2133 "et_eiffel_parser.y"
				yy_do_action_360
			when 361 then
					--|#line 2135 "et_eiffel_parser.y"
				yy_do_action_361
			when 362 then
					--|#line 2137 "et_eiffel_parser.y"
				yy_do_action_362
			when 363 then
					--|#line 2140 "et_eiffel_parser.y"
				yy_do_action_363
			when 364 then
					--|#line 2146 "et_eiffel_parser.y"
				yy_do_action_364
			when 365 then
					--|#line 2153 "et_eiffel_parser.y"
				yy_do_action_365
			when 366 then
					--|#line 2155 "et_eiffel_parser.y"
				yy_do_action_366
			when 367 then
					--|#line 2163 "et_eiffel_parser.y"
				yy_do_action_367
			when 368 then
					--|#line 2174 "et_eiffel_parser.y"
				yy_do_action_368
			when 369 then
					--|#line 2181 "et_eiffel_parser.y"
				yy_do_action_369
			when 370 then
					--|#line 2188 "et_eiffel_parser.y"
				yy_do_action_370
			when 371 then
					--|#line 2198 "et_eiffel_parser.y"
				yy_do_action_371
			when 372 then
					--|#line 2209 "et_eiffel_parser.y"
				yy_do_action_372
			when 373 then
					--|#line 2216 "et_eiffel_parser.y"
				yy_do_action_373
			when 374 then
					--|#line 2225 "et_eiffel_parser.y"
				yy_do_action_374
			when 375 then
					--|#line 2234 "et_eiffel_parser.y"
				yy_do_action_375
			when 376 then
					--|#line 2243 "et_eiffel_parser.y"
				yy_do_action_376
			when 377 then
					--|#line 2252 "et_eiffel_parser.y"
				yy_do_action_377
			when 378 then
					--|#line 2263 "et_eiffel_parser.y"
				yy_do_action_378
			when 379 then
					--|#line 2265 "et_eiffel_parser.y"
				yy_do_action_379
			when 380 then
					--|#line 2267 "et_eiffel_parser.y"
				yy_do_action_380
			when 381 then
					--|#line 2267 "et_eiffel_parser.y"
				yy_do_action_381
			when 382 then
					--|#line 2280 "et_eiffel_parser.y"
				yy_do_action_382
			when 383 then
					--|#line 2287 "et_eiffel_parser.y"
				yy_do_action_383
			when 384 then
					--|#line 2294 "et_eiffel_parser.y"
				yy_do_action_384
			when 385 then
					--|#line 2304 "et_eiffel_parser.y"
				yy_do_action_385
			when 386 then
					--|#line 2315 "et_eiffel_parser.y"
				yy_do_action_386
			when 387 then
					--|#line 2322 "et_eiffel_parser.y"
				yy_do_action_387
			when 388 then
					--|#line 2331 "et_eiffel_parser.y"
				yy_do_action_388
			when 389 then
					--|#line 2340 "et_eiffel_parser.y"
				yy_do_action_389
			when 390 then
					--|#line 2349 "et_eiffel_parser.y"
				yy_do_action_390
			when 391 then
					--|#line 2358 "et_eiffel_parser.y"
				yy_do_action_391
			when 392 then
					--|#line 2369 "et_eiffel_parser.y"
				yy_do_action_392
			when 393 then
					--|#line 2371 "et_eiffel_parser.y"
				yy_do_action_393
			when 394 then
					--|#line 2373 "et_eiffel_parser.y"
				yy_do_action_394
			when 395 then
					--|#line 2375 "et_eiffel_parser.y"
				yy_do_action_395
			when 396 then
					--|#line 2377 "et_eiffel_parser.y"
				yy_do_action_396
			when 397 then
					--|#line 2379 "et_eiffel_parser.y"
				yy_do_action_397
			when 398 then
					--|#line 2381 "et_eiffel_parser.y"
				yy_do_action_398
			when 399 then
					--|#line 2383 "et_eiffel_parser.y"
				yy_do_action_399
			when 400 then
					--|#line 2387 "et_eiffel_parser.y"
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
					--|#line 2389 "et_eiffel_parser.y"
				yy_do_action_401
			when 402 then
					--|#line 2391 "et_eiffel_parser.y"
				yy_do_action_402
			when 403 then
					--|#line 2393 "et_eiffel_parser.y"
				yy_do_action_403
			when 404 then
					--|#line 2395 "et_eiffel_parser.y"
				yy_do_action_404
			when 405 then
					--|#line 2399 "et_eiffel_parser.y"
				yy_do_action_405
			when 406 then
					--|#line 2401 "et_eiffel_parser.y"
				yy_do_action_406
			when 407 then
					--|#line 2403 "et_eiffel_parser.y"
				yy_do_action_407
			when 408 then
					--|#line 2405 "et_eiffel_parser.y"
				yy_do_action_408
			when 409 then
					--|#line 2407 "et_eiffel_parser.y"
				yy_do_action_409
			when 410 then
					--|#line 2411 "et_eiffel_parser.y"
				yy_do_action_410
			when 411 then
					--|#line 2413 "et_eiffel_parser.y"
				yy_do_action_411
			when 412 then
					--|#line 2417 "et_eiffel_parser.y"
				yy_do_action_412
			when 413 then
					--|#line 2419 "et_eiffel_parser.y"
				yy_do_action_413
			when 414 then
					--|#line 2423 "et_eiffel_parser.y"
				yy_do_action_414
			when 415 then
					--|#line 2425 "et_eiffel_parser.y"
				yy_do_action_415
			when 416 then
					--|#line 2429 "et_eiffel_parser.y"
				yy_do_action_416
			when 417 then
					--|#line 2431 "et_eiffel_parser.y"
				yy_do_action_417
			when 418 then
					--|#line 2435 "et_eiffel_parser.y"
				yy_do_action_418
			when 419 then
					--|#line 2437 "et_eiffel_parser.y"
				yy_do_action_419
			when 420 then
					--|#line 2439 "et_eiffel_parser.y"
				yy_do_action_420
			when 421 then
					--|#line 2441 "et_eiffel_parser.y"
				yy_do_action_421
			when 422 then
					--|#line 2447 "et_eiffel_parser.y"
				yy_do_action_422
			when 423 then
					--|#line 2449 "et_eiffel_parser.y"
				yy_do_action_423
			when 424 then
					--|#line 2455 "et_eiffel_parser.y"
				yy_do_action_424
			when 425 then
					--|#line 2457 "et_eiffel_parser.y"
				yy_do_action_425
			when 426 then
					--|#line 2461 "et_eiffel_parser.y"
				yy_do_action_426
			when 427 then
					--|#line 2463 "et_eiffel_parser.y"
				yy_do_action_427
			when 428 then
					--|#line 2465 "et_eiffel_parser.y"
				yy_do_action_428
			when 429 then
					--|#line 2467 "et_eiffel_parser.y"
				yy_do_action_429
			when 430 then
					--|#line 2469 "et_eiffel_parser.y"
				yy_do_action_430
			when 431 then
					--|#line 2477 "et_eiffel_parser.y"
				yy_do_action_431
			when 432 then
					--|#line 2485 "et_eiffel_parser.y"
				yy_do_action_432
			when 433 then
					--|#line 2487 "et_eiffel_parser.y"
				yy_do_action_433
			when 434 then
					--|#line 2489 "et_eiffel_parser.y"
				yy_do_action_434
			when 435 then
					--|#line 2491 "et_eiffel_parser.y"
				yy_do_action_435
			when 436 then
					--|#line 2493 "et_eiffel_parser.y"
				yy_do_action_436
			when 437 then
					--|#line 2501 "et_eiffel_parser.y"
				yy_do_action_437
			when 438 then
					--|#line 2511 "et_eiffel_parser.y"
				yy_do_action_438
			when 439 then
					--|#line 2513 "et_eiffel_parser.y"
				yy_do_action_439
			when 440 then
					--|#line 2515 "et_eiffel_parser.y"
				yy_do_action_440
			when 441 then
					--|#line 2517 "et_eiffel_parser.y"
				yy_do_action_441
			when 442 then
					--|#line 2519 "et_eiffel_parser.y"
				yy_do_action_442
			when 443 then
					--|#line 2527 "et_eiffel_parser.y"
				yy_do_action_443
			when 444 then
					--|#line 2535 "et_eiffel_parser.y"
				yy_do_action_444
			when 445 then
					--|#line 2537 "et_eiffel_parser.y"
				yy_do_action_445
			when 446 then
					--|#line 2539 "et_eiffel_parser.y"
				yy_do_action_446
			when 447 then
					--|#line 2541 "et_eiffel_parser.y"
				yy_do_action_447
			when 448 then
					--|#line 2543 "et_eiffel_parser.y"
				yy_do_action_448
			when 449 then
					--|#line 2551 "et_eiffel_parser.y"
				yy_do_action_449
			when 450 then
					--|#line 2561 "et_eiffel_parser.y"
				yy_do_action_450
			when 451 then
					--|#line 2563 "et_eiffel_parser.y"
				yy_do_action_451
			when 452 then
					--|#line 2565 "et_eiffel_parser.y"
				yy_do_action_452
			when 453 then
					--|#line 2567 "et_eiffel_parser.y"
				yy_do_action_453
			when 454 then
					--|#line 2569 "et_eiffel_parser.y"
				yy_do_action_454
			when 455 then
					--|#line 2571 "et_eiffel_parser.y"
				yy_do_action_455
			when 456 then
					--|#line 2579 "et_eiffel_parser.y"
				yy_do_action_456
			when 457 then
					--|#line 2587 "et_eiffel_parser.y"
				yy_do_action_457
			when 458 then
					--|#line 2589 "et_eiffel_parser.y"
				yy_do_action_458
			when 459 then
					--|#line 2591 "et_eiffel_parser.y"
				yy_do_action_459
			when 460 then
					--|#line 2593 "et_eiffel_parser.y"
				yy_do_action_460
			when 461 then
					--|#line 2595 "et_eiffel_parser.y"
				yy_do_action_461
			when 462 then
					--|#line 2603 "et_eiffel_parser.y"
				yy_do_action_462
			when 463 then
					--|#line 2613 "et_eiffel_parser.y"
				yy_do_action_463
			when 464 then
					--|#line 2617 "et_eiffel_parser.y"
				yy_do_action_464
			when 465 then
					--|#line 2619 "et_eiffel_parser.y"
				yy_do_action_465
			when 466 then
					--|#line 2623 "et_eiffel_parser.y"
				yy_do_action_466
			when 467 then
					--|#line 2626 "et_eiffel_parser.y"
				yy_do_action_467
			when 468 then
					--|#line 2634 "et_eiffel_parser.y"
				yy_do_action_468
			when 469 then
					--|#line 2641 "et_eiffel_parser.y"
				yy_do_action_469
			when 470 then
					--|#line 2652 "et_eiffel_parser.y"
				yy_do_action_470
			when 471 then
					--|#line 2657 "et_eiffel_parser.y"
				yy_do_action_471
			when 472 then
					--|#line 2662 "et_eiffel_parser.y"
				yy_do_action_472
			when 473 then
					--|#line 2669 "et_eiffel_parser.y"
				yy_do_action_473
			when 474 then
					--|#line 2675 "et_eiffel_parser.y"
				yy_do_action_474
			when 475 then
					--|#line 2684 "et_eiffel_parser.y"
				yy_do_action_475
			when 476 then
					--|#line 2686 "et_eiffel_parser.y"
				yy_do_action_476
			when 477 then
					--|#line 2690 "et_eiffel_parser.y"
				yy_do_action_477
			when 478 then
					--|#line 2693 "et_eiffel_parser.y"
				yy_do_action_478
			when 479 then
					--|#line 2699 "et_eiffel_parser.y"
				yy_do_action_479
			when 480 then
					--|#line 2707 "et_eiffel_parser.y"
				yy_do_action_480
			when 481 then
					--|#line 2712 "et_eiffel_parser.y"
				yy_do_action_481
			when 482 then
					--|#line 2717 "et_eiffel_parser.y"
				yy_do_action_482
			when 483 then
					--|#line 2722 "et_eiffel_parser.y"
				yy_do_action_483
			when 484 then
					--|#line 2733 "et_eiffel_parser.y"
				yy_do_action_484
			when 485 then
					--|#line 2744 "et_eiffel_parser.y"
				yy_do_action_485
			when 486 then
					--|#line 2757 "et_eiffel_parser.y"
				yy_do_action_486
			when 487 then
					--|#line 2766 "et_eiffel_parser.y"
				yy_do_action_487
			when 488 then
					--|#line 2775 "et_eiffel_parser.y"
				yy_do_action_488
			when 489 then
					--|#line 2777 "et_eiffel_parser.y"
				yy_do_action_489
			when 490 then
					--|#line 2785 "et_eiffel_parser.y"
				yy_do_action_490
			when 491 then
					--|#line 2793 "et_eiffel_parser.y"
				yy_do_action_491
			when 492 then
					--|#line 2795 "et_eiffel_parser.y"
				yy_do_action_492
			when 493 then
					--|#line 2803 "et_eiffel_parser.y"
				yy_do_action_493
			when 494 then
					--|#line 2815 "et_eiffel_parser.y"
				yy_do_action_494
			when 495 then
					--|#line 2817 "et_eiffel_parser.y"
				yy_do_action_495
			when 496 then
					--|#line 2824 "et_eiffel_parser.y"
				yy_do_action_496
			when 497 then
					--|#line 2826 "et_eiffel_parser.y"
				yy_do_action_497
			when 498 then
					--|#line 2833 "et_eiffel_parser.y"
				yy_do_action_498
			when 499 then
					--|#line 2835 "et_eiffel_parser.y"
				yy_do_action_499
			when 500 then
					--|#line 2842 "et_eiffel_parser.y"
				yy_do_action_500
			when 501 then
					--|#line 2844 "et_eiffel_parser.y"
				yy_do_action_501
			when 502 then
					--|#line 2851 "et_eiffel_parser.y"
				yy_do_action_502
			when 503 then
					--|#line 2853 "et_eiffel_parser.y"
				yy_do_action_503
			when 504 then
					--|#line 2860 "et_eiffel_parser.y"
				yy_do_action_504
			when 505 then
					--|#line 2862 "et_eiffel_parser.y"
				yy_do_action_505
			when 506 then
					--|#line 2869 "et_eiffel_parser.y"
				yy_do_action_506
			when 507 then
					--|#line 2871 "et_eiffel_parser.y"
				yy_do_action_507
			when 508 then
					--|#line 2878 "et_eiffel_parser.y"
				yy_do_action_508
			when 509 then
					--|#line 2889 "et_eiffel_parser.y"
				yy_do_action_509
			when 510 then
					--|#line 2889 "et_eiffel_parser.y"
				yy_do_action_510
			when 511 then
					--|#line 2910 "et_eiffel_parser.y"
				yy_do_action_511
			when 512 then
					--|#line 2912 "et_eiffel_parser.y"
				yy_do_action_512
			when 513 then
					--|#line 2914 "et_eiffel_parser.y"
				yy_do_action_513
			when 514 then
					--|#line 2916 "et_eiffel_parser.y"
				yy_do_action_514
			when 515 then
					--|#line 2918 "et_eiffel_parser.y"
				yy_do_action_515
			when 516 then
					--|#line 2920 "et_eiffel_parser.y"
				yy_do_action_516
			when 517 then
					--|#line 2922 "et_eiffel_parser.y"
				yy_do_action_517
			when 518 then
					--|#line 2924 "et_eiffel_parser.y"
				yy_do_action_518
			when 519 then
					--|#line 2926 "et_eiffel_parser.y"
				yy_do_action_519
			when 520 then
					--|#line 2928 "et_eiffel_parser.y"
				yy_do_action_520
			when 521 then
					--|#line 2935 "et_eiffel_parser.y"
				yy_do_action_521
			when 522 then
					--|#line 2937 "et_eiffel_parser.y"
				yy_do_action_522
			when 523 then
					--|#line 2939 "et_eiffel_parser.y"
				yy_do_action_523
			when 524 then
					--|#line 2941 "et_eiffel_parser.y"
				yy_do_action_524
			when 525 then
					--|#line 2943 "et_eiffel_parser.y"
				yy_do_action_525
			when 526 then
					--|#line 2949 "et_eiffel_parser.y"
				yy_do_action_526
			when 527 then
					--|#line 2951 "et_eiffel_parser.y"
				yy_do_action_527
			when 528 then
					--|#line 2953 "et_eiffel_parser.y"
				yy_do_action_528
			when 529 then
					--|#line 2955 "et_eiffel_parser.y"
				yy_do_action_529
			when 530 then
					--|#line 2959 "et_eiffel_parser.y"
				yy_do_action_530
			when 531 then
					--|#line 2961 "et_eiffel_parser.y"
				yy_do_action_531
			when 532 then
					--|#line 2963 "et_eiffel_parser.y"
				yy_do_action_532
			when 533 then
					--|#line 2965 "et_eiffel_parser.y"
				yy_do_action_533
			when 534 then
					--|#line 2969 "et_eiffel_parser.y"
				yy_do_action_534
			when 535 then
					--|#line 2971 "et_eiffel_parser.y"
				yy_do_action_535
			when 536 then
					--|#line 2977 "et_eiffel_parser.y"
				yy_do_action_536
			when 537 then
					--|#line 2979 "et_eiffel_parser.y"
				yy_do_action_537
			when 538 then
					--|#line 2981 "et_eiffel_parser.y"
				yy_do_action_538
			when 539 then
					--|#line 2983 "et_eiffel_parser.y"
				yy_do_action_539
			when 540 then
					--|#line 2987 "et_eiffel_parser.y"
				yy_do_action_540
			when 541 then
					--|#line 2994 "et_eiffel_parser.y"
				yy_do_action_541
			when 542 then
					--|#line 3001 "et_eiffel_parser.y"
				yy_do_action_542
			when 543 then
					--|#line 3010 "et_eiffel_parser.y"
				yy_do_action_543
			when 544 then
					--|#line 3021 "et_eiffel_parser.y"
				yy_do_action_544
			when 545 then
					--|#line 3023 "et_eiffel_parser.y"
				yy_do_action_545
			when 546 then
					--|#line 3027 "et_eiffel_parser.y"
				yy_do_action_546
			when 547 then
					--|#line 3029 "et_eiffel_parser.y"
				yy_do_action_547
			when 548 then
					--|#line 3036 "et_eiffel_parser.y"
				yy_do_action_548
			when 549 then
					--|#line 3043 "et_eiffel_parser.y"
				yy_do_action_549
			when 550 then
					--|#line 3052 "et_eiffel_parser.y"
				yy_do_action_550
			when 551 then
					--|#line 3061 "et_eiffel_parser.y"
				yy_do_action_551
			when 552 then
					--|#line 3063 "et_eiffel_parser.y"
				yy_do_action_552
			when 553 then
					--|#line 3063 "et_eiffel_parser.y"
				yy_do_action_553
			when 554 then
					--|#line 3076 "et_eiffel_parser.y"
				yy_do_action_554
			when 555 then
					--|#line 3087 "et_eiffel_parser.y"
				yy_do_action_555
			when 556 then
					--|#line 3095 "et_eiffel_parser.y"
				yy_do_action_556
			when 557 then
					--|#line 3104 "et_eiffel_parser.y"
				yy_do_action_557
			when 558 then
					--|#line 3113 "et_eiffel_parser.y"
				yy_do_action_558
			when 559 then
					--|#line 3115 "et_eiffel_parser.y"
				yy_do_action_559
			when 560 then
					--|#line 3119 "et_eiffel_parser.y"
				yy_do_action_560
			when 561 then
					--|#line 3121 "et_eiffel_parser.y"
				yy_do_action_561
			when 562 then
					--|#line 3123 "et_eiffel_parser.y"
				yy_do_action_562
			when 563 then
					--|#line 3125 "et_eiffel_parser.y"
				yy_do_action_563
			when 564 then
					--|#line 3131 "et_eiffel_parser.y"
				yy_do_action_564
			when 565 then
					--|#line 3133 "et_eiffel_parser.y"
				yy_do_action_565
			when 566 then
					--|#line 3140 "et_eiffel_parser.y"
				yy_do_action_566
			when 567 then
					--|#line 3142 "et_eiffel_parser.y"
				yy_do_action_567
			when 568 then
					--|#line 3144 "et_eiffel_parser.y"
				yy_do_action_568
			when 569 then
					--|#line 3144 "et_eiffel_parser.y"
				yy_do_action_569
			when 570 then
					--|#line 3157 "et_eiffel_parser.y"
				yy_do_action_570
			when 571 then
					--|#line 3168 "et_eiffel_parser.y"
				yy_do_action_571
			when 572 then
					--|#line 3177 "et_eiffel_parser.y"
				yy_do_action_572
			when 573 then
					--|#line 3188 "et_eiffel_parser.y"
				yy_do_action_573
			when 574 then
					--|#line 3190 "et_eiffel_parser.y"
				yy_do_action_574
			when 575 then
					--|#line 3192 "et_eiffel_parser.y"
				yy_do_action_575
			when 576 then
					--|#line 3194 "et_eiffel_parser.y"
				yy_do_action_576
			when 577 then
					--|#line 3196 "et_eiffel_parser.y"
				yy_do_action_577
			when 578 then
					--|#line 3198 "et_eiffel_parser.y"
				yy_do_action_578
			when 579 then
					--|#line 3202 "et_eiffel_parser.y"
				yy_do_action_579
			when 580 then
					--|#line 3204 "et_eiffel_parser.y"
				yy_do_action_580
			when 581 then
					--|#line 3208 "et_eiffel_parser.y"
				yy_do_action_581
			when 582 then
					--|#line 3212 "et_eiffel_parser.y"
				yy_do_action_582
			when 583 then
					--|#line 3214 "et_eiffel_parser.y"
				yy_do_action_583
			when 584 then
					--|#line 3218 "et_eiffel_parser.y"
				yy_do_action_584
			when 585 then
					--|#line 3220 "et_eiffel_parser.y"
				yy_do_action_585
			when 586 then
					--|#line 3224 "et_eiffel_parser.y"
				yy_do_action_586
			when 587 then
					--|#line 3226 "et_eiffel_parser.y"
				yy_do_action_587
			when 588 then
					--|#line 3228 "et_eiffel_parser.y"
				yy_do_action_588
			when 589 then
					--|#line 3230 "et_eiffel_parser.y"
				yy_do_action_589
			when 590 then
					--|#line 3232 "et_eiffel_parser.y"
				yy_do_action_590
			when 591 then
					--|#line 3234 "et_eiffel_parser.y"
				yy_do_action_591
			when 592 then
					--|#line 3242 "et_eiffel_parser.y"
				yy_do_action_592
			when 593 then
					--|#line 3244 "et_eiffel_parser.y"
				yy_do_action_593
			when 594 then
					--|#line 3250 "et_eiffel_parser.y"
				yy_do_action_594
			when 595 then
					--|#line 3252 "et_eiffel_parser.y"
				yy_do_action_595
			when 596 then
					--|#line 3254 "et_eiffel_parser.y"
				yy_do_action_596
			when 597 then
					--|#line 3254 "et_eiffel_parser.y"
				yy_do_action_597
			when 598 then
					--|#line 3267 "et_eiffel_parser.y"
				yy_do_action_598
			when 599 then
					--|#line 3278 "et_eiffel_parser.y"
				yy_do_action_599
			when 600 then
					--|#line 3286 "et_eiffel_parser.y"
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
					--|#line 3295 "et_eiffel_parser.y"
				yy_do_action_601
			when 602 then
					--|#line 3304 "et_eiffel_parser.y"
				yy_do_action_602
			when 603 then
					--|#line 3306 "et_eiffel_parser.y"
				yy_do_action_603
			when 604 then
					--|#line 3308 "et_eiffel_parser.y"
				yy_do_action_604
			when 605 then
					--|#line 3310 "et_eiffel_parser.y"
				yy_do_action_605
			when 606 then
					--|#line 3317 "et_eiffel_parser.y"
				yy_do_action_606
			when 607 then
					--|#line 3319 "et_eiffel_parser.y"
				yy_do_action_607
			when 608 then
					--|#line 3325 "et_eiffel_parser.y"
				yy_do_action_608
			when 609 then
					--|#line 3327 "et_eiffel_parser.y"
				yy_do_action_609
			when 610 then
					--|#line 3331 "et_eiffel_parser.y"
				yy_do_action_610
			when 611 then
					--|#line 3333 "et_eiffel_parser.y"
				yy_do_action_611
			when 612 then
					--|#line 3335 "et_eiffel_parser.y"
				yy_do_action_612
			when 613 then
					--|#line 3337 "et_eiffel_parser.y"
				yy_do_action_613
			when 614 then
					--|#line 3339 "et_eiffel_parser.y"
				yy_do_action_614
			when 615 then
					--|#line 3341 "et_eiffel_parser.y"
				yy_do_action_615
			when 616 then
					--|#line 3343 "et_eiffel_parser.y"
				yy_do_action_616
			when 617 then
					--|#line 3345 "et_eiffel_parser.y"
				yy_do_action_617
			when 618 then
					--|#line 3347 "et_eiffel_parser.y"
				yy_do_action_618
			when 619 then
					--|#line 3349 "et_eiffel_parser.y"
				yy_do_action_619
			when 620 then
					--|#line 3351 "et_eiffel_parser.y"
				yy_do_action_620
			when 621 then
					--|#line 3353 "et_eiffel_parser.y"
				yy_do_action_621
			when 622 then
					--|#line 3355 "et_eiffel_parser.y"
				yy_do_action_622
			when 623 then
					--|#line 3357 "et_eiffel_parser.y"
				yy_do_action_623
			when 624 then
					--|#line 3359 "et_eiffel_parser.y"
				yy_do_action_624
			when 625 then
					--|#line 3361 "et_eiffel_parser.y"
				yy_do_action_625
			when 626 then
					--|#line 3363 "et_eiffel_parser.y"
				yy_do_action_626
			when 627 then
					--|#line 3365 "et_eiffel_parser.y"
				yy_do_action_627
			when 628 then
					--|#line 3367 "et_eiffel_parser.y"
				yy_do_action_628
			when 629 then
					--|#line 3369 "et_eiffel_parser.y"
				yy_do_action_629
			when 630 then
					--|#line 3373 "et_eiffel_parser.y"
				yy_do_action_630
			when 631 then
					--|#line 3375 "et_eiffel_parser.y"
				yy_do_action_631
			when 632 then
					--|#line 3377 "et_eiffel_parser.y"
				yy_do_action_632
			when 633 then
					--|#line 3379 "et_eiffel_parser.y"
				yy_do_action_633
			when 634 then
					--|#line 3381 "et_eiffel_parser.y"
				yy_do_action_634
			when 635 then
					--|#line 3383 "et_eiffel_parser.y"
				yy_do_action_635
			when 636 then
					--|#line 3385 "et_eiffel_parser.y"
				yy_do_action_636
			when 637 then
					--|#line 3387 "et_eiffel_parser.y"
				yy_do_action_637
			when 638 then
					--|#line 3389 "et_eiffel_parser.y"
				yy_do_action_638
			when 639 then
					--|#line 3391 "et_eiffel_parser.y"
				yy_do_action_639
			when 640 then
					--|#line 3401 "et_eiffel_parser.y"
				yy_do_action_640
			when 641 then
					--|#line 3403 "et_eiffel_parser.y"
				yy_do_action_641
			when 642 then
					--|#line 3405 "et_eiffel_parser.y"
				yy_do_action_642
			when 643 then
					--|#line 3407 "et_eiffel_parser.y"
				yy_do_action_643
			when 644 then
					--|#line 3409 "et_eiffel_parser.y"
				yy_do_action_644
			when 645 then
					--|#line 3411 "et_eiffel_parser.y"
				yy_do_action_645
			when 646 then
					--|#line 3413 "et_eiffel_parser.y"
				yy_do_action_646
			when 647 then
					--|#line 3415 "et_eiffel_parser.y"
				yy_do_action_647
			when 648 then
					--|#line 3417 "et_eiffel_parser.y"
				yy_do_action_648
			when 649 then
					--|#line 3419 "et_eiffel_parser.y"
				yy_do_action_649
			when 650 then
					--|#line 3421 "et_eiffel_parser.y"
				yy_do_action_650
			when 651 then
					--|#line 3423 "et_eiffel_parser.y"
				yy_do_action_651
			when 652 then
					--|#line 3425 "et_eiffel_parser.y"
				yy_do_action_652
			when 653 then
					--|#line 3427 "et_eiffel_parser.y"
				yy_do_action_653
			when 654 then
					--|#line 3429 "et_eiffel_parser.y"
				yy_do_action_654
			when 655 then
					--|#line 3431 "et_eiffel_parser.y"
				yy_do_action_655
			when 656 then
					--|#line 3433 "et_eiffel_parser.y"
				yy_do_action_656
			when 657 then
					--|#line 3435 "et_eiffel_parser.y"
				yy_do_action_657
			when 658 then
					--|#line 3450 "et_eiffel_parser.y"
				yy_do_action_658
			when 659 then
					--|#line 3452 "et_eiffel_parser.y"
				yy_do_action_659
			when 660 then
					--|#line 3454 "et_eiffel_parser.y"
				yy_do_action_660
			when 661 then
					--|#line 3456 "et_eiffel_parser.y"
				yy_do_action_661
			when 662 then
					--|#line 3460 "et_eiffel_parser.y"
				yy_do_action_662
			when 663 then
					--|#line 3460 "et_eiffel_parser.y"
				yy_do_action_663
			when 664 then
					--|#line 3473 "et_eiffel_parser.y"
				yy_do_action_664
			when 665 then
					--|#line 3484 "et_eiffel_parser.y"
				yy_do_action_665
			when 666 then
					--|#line 3492 "et_eiffel_parser.y"
				yy_do_action_666
			when 667 then
					--|#line 3501 "et_eiffel_parser.y"
				yy_do_action_667
			when 668 then
					--|#line 3509 "et_eiffel_parser.y"
				yy_do_action_668
			when 669 then
					--|#line 3513 "et_eiffel_parser.y"
				yy_do_action_669
			when 670 then
					--|#line 3515 "et_eiffel_parser.y"
				yy_do_action_670
			when 671 then
					--|#line 3515 "et_eiffel_parser.y"
				yy_do_action_671
			when 672 then
					--|#line 3528 "et_eiffel_parser.y"
				yy_do_action_672
			when 673 then
					--|#line 3539 "et_eiffel_parser.y"
				yy_do_action_673
			when 674 then
					--|#line 3547 "et_eiffel_parser.y"
				yy_do_action_674
			when 675 then
					--|#line 3556 "et_eiffel_parser.y"
				yy_do_action_675
			when 676 then
					--|#line 3558 "et_eiffel_parser.y"
				yy_do_action_676
			when 677 then
					--|#line 3558 "et_eiffel_parser.y"
				yy_do_action_677
			when 678 then
					--|#line 3571 "et_eiffel_parser.y"
				yy_do_action_678
			when 679 then
					--|#line 3582 "et_eiffel_parser.y"
				yy_do_action_679
			when 680 then
					--|#line 3590 "et_eiffel_parser.y"
				yy_do_action_680
			when 681 then
					--|#line 3599 "et_eiffel_parser.y"
				yy_do_action_681
			when 682 then
					--|#line 3601 "et_eiffel_parser.y"
				yy_do_action_682
			when 683 then
					--|#line 3601 "et_eiffel_parser.y"
				yy_do_action_683
			when 684 then
					--|#line 3616 "et_eiffel_parser.y"
				yy_do_action_684
			when 685 then
					--|#line 3627 "et_eiffel_parser.y"
				yy_do_action_685
			when 686 then
					--|#line 3635 "et_eiffel_parser.y"
				yy_do_action_686
			when 687 then
					--|#line 3644 "et_eiffel_parser.y"
				yy_do_action_687
			when 688 then
					--|#line 3646 "et_eiffel_parser.y"
				yy_do_action_688
			when 689 then
					--|#line 3648 "et_eiffel_parser.y"
				yy_do_action_689
			when 690 then
					--|#line 3650 "et_eiffel_parser.y"
				yy_do_action_690
			when 691 then
					--|#line 3652 "et_eiffel_parser.y"
				yy_do_action_691
			when 692 then
					--|#line 3654 "et_eiffel_parser.y"
				yy_do_action_692
			when 693 then
					--|#line 3660 "et_eiffel_parser.y"
				yy_do_action_693
			when 694 then
					--|#line 3662 "et_eiffel_parser.y"
				yy_do_action_694
			when 695 then
					--|#line 3666 "et_eiffel_parser.y"
				yy_do_action_695
			when 696 then
					--|#line 3674 "et_eiffel_parser.y"
				yy_do_action_696
			when 697 then
					--|#line 3678 "et_eiffel_parser.y"
				yy_do_action_697
			when 698 then
					--|#line 3682 "et_eiffel_parser.y"
				yy_do_action_698
			when 699 then
					--|#line 3686 "et_eiffel_parser.y"
				yy_do_action_699
			when 700 then
					--|#line 3690 "et_eiffel_parser.y"
				yy_do_action_700
			when 701 then
					--|#line 3694 "et_eiffel_parser.y"
				yy_do_action_701
			when 702 then
					--|#line 3698 "et_eiffel_parser.y"
				yy_do_action_702
			when 703 then
					--|#line 3702 "et_eiffel_parser.y"
				yy_do_action_703
			when 704 then
					--|#line 3706 "et_eiffel_parser.y"
				yy_do_action_704
			when 705 then
					--|#line 3710 "et_eiffel_parser.y"
				yy_do_action_705
			when 706 then
					--|#line 3714 "et_eiffel_parser.y"
				yy_do_action_706
			when 707 then
					--|#line 3720 "et_eiffel_parser.y"
				yy_do_action_707
			when 708 then
					--|#line 3727 "et_eiffel_parser.y"
				yy_do_action_708
			when 709 then
					--|#line 3731 "et_eiffel_parser.y"
				yy_do_action_709
			when 710 then
					--|#line 3738 "et_eiffel_parser.y"
				yy_do_action_710
			when 711 then
					--|#line 3740 "et_eiffel_parser.y"
				yy_do_action_711
			when 712 then
					--|#line 3742 "et_eiffel_parser.y"
				yy_do_action_712
			when 713 then
					--|#line 3744 "et_eiffel_parser.y"
				yy_do_action_713
			when 714 then
					--|#line 3746 "et_eiffel_parser.y"
				yy_do_action_714
			when 715 then
					--|#line 3750 "et_eiffel_parser.y"
				yy_do_action_715
			when 716 then
					--|#line 3752 "et_eiffel_parser.y"
				yy_do_action_716
			when 717 then
					--|#line 3754 "et_eiffel_parser.y"
				yy_do_action_717
			when 718 then
					--|#line 3754 "et_eiffel_parser.y"
				yy_do_action_718
			when 719 then
					--|#line 3767 "et_eiffel_parser.y"
				yy_do_action_719
			when 720 then
					--|#line 3778 "et_eiffel_parser.y"
				yy_do_action_720
			when 721 then
					--|#line 3786 "et_eiffel_parser.y"
				yy_do_action_721
			when 722 then
					--|#line 3795 "et_eiffel_parser.y"
				yy_do_action_722
			when 723 then
					--|#line 3804 "et_eiffel_parser.y"
				yy_do_action_723
			when 724 then
					--|#line 3806 "et_eiffel_parser.y"
				yy_do_action_724
			when 725 then
					--|#line 3808 "et_eiffel_parser.y"
				yy_do_action_725
			when 726 then
					--|#line 3814 "et_eiffel_parser.y"
				yy_do_action_726
			when 727 then
					--|#line 3816 "et_eiffel_parser.y"
				yy_do_action_727
			when 728 then
					--|#line 3818 "et_eiffel_parser.y"
				yy_do_action_728
			when 729 then
					--|#line 3820 "et_eiffel_parser.y"
				yy_do_action_729
			when 730 then
					--|#line 3822 "et_eiffel_parser.y"
				yy_do_action_730
			when 731 then
					--|#line 3824 "et_eiffel_parser.y"
				yy_do_action_731
			when 732 then
					--|#line 3826 "et_eiffel_parser.y"
				yy_do_action_732
			when 733 then
					--|#line 3828 "et_eiffel_parser.y"
				yy_do_action_733
			when 734 then
					--|#line 3830 "et_eiffel_parser.y"
				yy_do_action_734
			when 735 then
					--|#line 3832 "et_eiffel_parser.y"
				yy_do_action_735
			when 736 then
					--|#line 3834 "et_eiffel_parser.y"
				yy_do_action_736
			when 737 then
					--|#line 3836 "et_eiffel_parser.y"
				yy_do_action_737
			when 738 then
					--|#line 3838 "et_eiffel_parser.y"
				yy_do_action_738
			when 739 then
					--|#line 3840 "et_eiffel_parser.y"
				yy_do_action_739
			when 740 then
					--|#line 3842 "et_eiffel_parser.y"
				yy_do_action_740
			when 741 then
					--|#line 3844 "et_eiffel_parser.y"
				yy_do_action_741
			when 742 then
					--|#line 3846 "et_eiffel_parser.y"
				yy_do_action_742
			when 743 then
					--|#line 3848 "et_eiffel_parser.y"
				yy_do_action_743
			when 744 then
					--|#line 3850 "et_eiffel_parser.y"
				yy_do_action_744
			when 745 then
					--|#line 3852 "et_eiffel_parser.y"
				yy_do_action_745
			when 746 then
					--|#line 3854 "et_eiffel_parser.y"
				yy_do_action_746
			when 747 then
					--|#line 3856 "et_eiffel_parser.y"
				yy_do_action_747
			when 748 then
					--|#line 3858 "et_eiffel_parser.y"
				yy_do_action_748
			when 749 then
					--|#line 3862 "et_eiffel_parser.y"
				yy_do_action_749
			when 750 then
					--|#line 3864 "et_eiffel_parser.y"
				yy_do_action_750
			when 751 then
					--|#line 3868 "et_eiffel_parser.y"
				yy_do_action_751
			when 752 then
					--|#line 3870 "et_eiffel_parser.y"
				yy_do_action_752
			when 753 then
					--|#line 3874 "et_eiffel_parser.y"
				yy_do_action_753
			when 754 then
					--|#line 3876 "et_eiffel_parser.y"
				yy_do_action_754
			when 755 then
					--|#line 3880 "et_eiffel_parser.y"
				yy_do_action_755
			when 756 then
					--|#line 3882 "et_eiffel_parser.y"
				yy_do_action_756
			when 757 then
					--|#line 3886 "et_eiffel_parser.y"
				yy_do_action_757
			when 758 then
					--|#line 3891 "et_eiffel_parser.y"
				yy_do_action_758
			when 759 then
					--|#line 3898 "et_eiffel_parser.y"
				yy_do_action_759
			when 760 then
					--|#line 3905 "et_eiffel_parser.y"
				yy_do_action_760
			when 761 then
					--|#line 3907 "et_eiffel_parser.y"
				yy_do_action_761
			when 762 then
					--|#line 3911 "et_eiffel_parser.y"
				yy_do_action_762
			when 763 then
					--|#line 3913 "et_eiffel_parser.y"
				yy_do_action_763
			when 764 then
					--|#line 3917 "et_eiffel_parser.y"
				yy_do_action_764
			when 765 then
					--|#line 3922 "et_eiffel_parser.y"
				yy_do_action_765
			when 766 then
					--|#line 3929 "et_eiffel_parser.y"
				yy_do_action_766
			when 767 then
					--|#line 3936 "et_eiffel_parser.y"
				yy_do_action_767
			when 768 then
					--|#line 3938 "et_eiffel_parser.y"
				yy_do_action_768
			when 769 then
					--|#line 3940 "et_eiffel_parser.y"
				yy_do_action_769
			when 770 then
					--|#line 3949 "et_eiffel_parser.y"
				yy_do_action_770
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
			--|#line 220 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 220 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 220")
end

			-- END
		
if yy_parsing_status >= yyContinue then
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
		
if yy_parsing_status >= yyContinue then
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
		
if yy_parsing_status >= yyContinue then
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


if yy_parsing_status >= yyContinue then
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


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp42 := yyvsp42 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_6 is
			--|#line 242 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 242 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 242")
end

			if not current_system.preparse_multiple_mode then
					-- Raise syntax error: it is not valid to have more
					-- than one class text in the same file.
				raise_error
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_7 is
			--|#line 253 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 253 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 253")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), yyvs56.item (yyvsp56), yyvs53.item (yyvsp53), yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
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
			--|#line 259 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 259 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 259")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), yyvs56.item (yyvsp56), yyvs53.item (yyvsp53), yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_9 is
			--|#line 265 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 265 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 265")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), Void, yyvs53.item (yyvsp53), yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_10 is
			--|#line 271 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 271 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 271")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), Void, Void, yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_11 is
			--|#line 277 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 277 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 277")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), Void, Void, Void, yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_12 is
			--|#line 283 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 283 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 283")
end

			yyval42 := yyvs42.item (yyvsp42 - 2)
			set_class_to_inheritance_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101))
			if yyvs42.item (yyvsp42 - 1) /= Void then
				yyvs42.item (yyvsp42 - 1).set_first_indexing (yyvs78.item (yyvsp78))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp42 := yyvsp42 -2
	yyvsp76 := yyvsp76 -1
	yyvsp97 := yyvsp97 -1
	yyvsp101 := yyvsp101 -1
	yyvsp78 := yyvsp78 -1
	yyvsp1 := yyvsp1 -1
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_13 is
			--|#line 283 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 283 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 283")
end

			if not current_system.preparse_multiple_mode then
					-- Raise syntax error: it is not valid to have more
					-- than one class text in the same file.
				raise_error
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp42 := yyvsp42 + 1
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

	yy_do_action_14 is
			--|#line 299 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 299 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 299")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101), Void, Void, Void, Void, yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_15 is
			--|#line 304 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 304 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 304")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_inheritance_end (yyval42, yyvs97.item (yyvsp97), yyvs101.item (yyvsp101))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp76 := yyvsp76 -1
	yyvsp97 := yyvsp97 -1
	yyvsp101 := yyvsp101 -1
	yyvsp1 := yyvsp1 -1
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_16 is
			--|#line 319 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 319 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 319")
end

set_class_providers 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_17 is
			--|#line 324 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 324 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 324")
end

yyval78 := ast_factory.new_indexings (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_18 is
			--|#line 326 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 326 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 326")
end

			yyval78 := yyvs78.item (yyvsp78)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp78 := yyvsp78 -1
	yyvsp2 := yyvsp2 -1
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_19 is
			--|#line 326 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 326 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 326")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_20 is
			--|#line 339 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 339 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 339")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_21 is
			--|#line 341 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 341 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 341")
end

yyval78 := yyvs78.item (yyvsp78) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_22 is
			--|#line 345 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 345 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 345")
end

			if yyvs79.item (yyvsp79) /= Void then
				yyval78 := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if yyval78 /= Void then
					yyval78.put_first (yyvs79.item (yyvsp79))
				end
			else
				yyval78 := ast_factory.new_indexings (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_23 is
			--|#line 356 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 356 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 356")
end

			if yyvs79.item (yyvsp79) /= Void then
				yyval78 := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if yyval78 /= Void then
					yyval78.put_first (yyvs79.item (yyvsp79))
				end
			else
				yyval78 := ast_factory.new_indexings (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_24 is
			--|#line 368 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 368 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 368")
end

			yyval78 := yyvs78.item (yyvsp78)
			if yyval78 /= Void and yyvs79.item (yyvsp79) /= Void then
				yyval78.put_first (yyvs79.item (yyvsp79))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp78 := yyvsp78 -1
	yyvsp79 := yyvsp79 -1
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_25 is
			--|#line 368 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 368 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 368")
end

increment_counter 
if yy_parsing_status >= yyContinue then
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
			--|#line 377 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 377 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 377")
end

			yyval78 := yyvs78.item (yyvsp78)
			if yyval78 /= Void and yyvs79.item (yyvsp79) /= Void then
				yyval78.put_first (yyvs79.item (yyvsp79))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp78 := yyvsp78 -1
	yyvsp79 := yyvsp79 -1
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_27 is
			--|#line 377 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 377 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 377")
end

increment_counter 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_28 is
			--|#line 388 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 388 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 388")
end

			yyval79 := yyvs79.item (yyvsp79)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs79.put (yyval79, yyvsp79)
end
		end

	yy_do_action_29 is
			--|#line 395 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 395 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 395")
end

			yyval79 := ast_factory.new_indexing (yyvs82.item (yyvsp82))
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_30 is
			--|#line 399 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 399 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 399")
end

			yyval79 := ast_factory.new_tagged_indexing (ast_factory.new_tag (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyvs82.item (yyvsp82))
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_31 is
			--|#line 405 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 405 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 405")
end

yyval79 := ast_factory.new_indexing_semicolon (yyvs79.item (yyvsp79), yyvs22.item (yyvsp22)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 -1
	yyvs79.put (yyval79, yyvsp79)
end
		end

	yy_do_action_32 is
			--|#line 407 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 407 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 407")
end

yyval79 := ast_factory.new_indexing_semicolon (yyvs79.item (yyvsp79), yyvs22.item (yyvsp22)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 -1
	yyvs79.put (yyval79, yyvsp79)
end
		end

	yy_do_action_33 is
			--|#line 412 "et_eiffel_parser.y"
		local
			yyval82: ET_INDEXING_TERM_LIST
		do
--|#line 412 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 412")
end

			if yyvs80.item (yyvsp80) /= Void then
				yyval82 := ast_factory.new_indexing_terms (counter_value + 1)
				if yyval82 /= Void then
					yyval82.put_first (yyvs80.item (yyvsp80))
				end
			else
				yyval82 := ast_factory.new_indexing_terms (counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_34 is
			--|#line 423 "et_eiffel_parser.y"
		local
			yyval82: ET_INDEXING_TERM_LIST
		do
--|#line 423 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 423")
end

			yyval82 := yyvs82.item (yyvsp82)
			if yyval82 /= Void and yyvs81.item (yyvsp81) /= Void then
				yyval82.put_first (yyvs81.item (yyvsp81))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp81 := yyvsp81 -1
	yyvs82.put (yyval82, yyvsp82)
end
		end

	yy_do_action_35 is
			--|#line 432 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 432 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 432")
end

yyval80 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_36 is
			--|#line 434 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 434 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 434")
end

yyval80 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_37 is
			--|#line 436 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 436 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 436")
end

yyval80 := yyvs10.item (yyvsp10) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_38 is
			--|#line 438 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 438 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 438")
end

yyval80 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_39 is
			--|#line 440 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 440 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 440")
end

yyval80 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_40 is
			--|#line 442 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 442 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 442")
end

yyval80 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_41 is
			--|#line 444 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 444 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 444")
end

yyval80 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_42 is
			--|#line 446 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 446 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 446")
end

yyval80 := ast_factory.new_custom_attribute (yyvs54.item (yyvsp54), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_43 is
			--|#line 448 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 448 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 448")
end

yyval80 := ast_factory.new_custom_attribute (yyvs54.item (yyvsp54), yyvs96.item (yyvsp96), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_44 is
			--|#line 452 "et_eiffel_parser.y"
		local
			yyval81: ET_INDEXING_TERM_ITEM
		do
--|#line 452 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 452")
end

			yyval81 := ast_factory.new_indexing_term_comma (yyvs80.item (yyvsp80), yyvs5.item (yyvsp5))
			if yyval81 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_45 is
			--|#line 463 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 463 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 463")
end

			yyval42 := new_class (yyvs13.item (yyvsp13))
			if yyval42 /= Void then
				yyval42.set_class_keyword (yyvs2.item (yyvsp2))
				yyval42.set_frozen_keyword (yyvs2.item (yyvsp2 - 2))
				yyval42.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval42
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_46 is
			--|#line 473 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 473 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 473")
end

			yyval42 := new_class (yyvs13.item (yyvsp13))
			if yyval42 /= Void then
				yyval42.set_class_keyword (yyvs2.item (yyvsp2))
				yyval42.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval42.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval42.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval42
		
if yy_parsing_status >= yyContinue then
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
			--|#line 484 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 484 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 484")
end

			yyval42 := new_class (yyvs13.item (yyvsp13))
			if yyval42 /= Void then
				yyval42.set_class_keyword (yyvs2.item (yyvsp2))
				yyval42.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval42.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval42.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval42
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_48 is
			--|#line 495 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 495 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 495")
end

			yyval42 := new_class (yyvs13.item (yyvsp13))
			if yyval42 /= Void then
				yyval42.set_class_keyword (yyvs2.item (yyvsp2))
				yyval42.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval42.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval42.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval42
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_49 is
			--|#line 508 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 508 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 508")
end


if yy_parsing_status >= yyContinue then
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
			--|#line 510 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 510 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 510")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_51 is
			--|#line 514 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 514 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 514")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_52 is
			--|#line 516 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 516 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 516")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_53 is
			--|#line 522 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 522 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 522")
end

			set_formal_parameters (Void)
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_54 is
			--|#line 526 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 526 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 526")
end

			yyval76 := ast_factory.new_formal_parameters (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0)
			set_formal_parameters (yyval76)
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_55 is
			--|#line 532 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 532 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 532")
end

			yyval76 := yyvs76.item (yyvsp76)
			set_formal_parameters (yyval76)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp76 := yyvsp76 -1
	yyvsp23 := yyvsp23 -1
	yyvs76.put (yyval76, yyvsp76)
end
		end

	yy_do_action_56 is
			--|#line 532 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 532 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 532")
end

			add_symbol (yyvs23.item (yyvsp23))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_57 is
			--|#line 546 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 546 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 546")
end

			if yyvs74.item (yyvsp74) /= Void then
				yyval76 := ast_factory.new_formal_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval76 /= Void then
					yyval76.put_first (yyvs74.item (yyvsp74))
				end
			else
				yyval76 := ast_factory.new_formal_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_58 is
			--|#line 557 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 557 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 557")
end

			yyval76 := yyvs76.item (yyvsp76)
			if yyval76 /= Void and yyvs75.item (yyvsp75) /= Void then
				yyval76.put_first (yyvs75.item (yyvsp75))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp75 := yyvsp75 -1
	yyvs76.put (yyval76, yyvsp76)
end
		end

	yy_do_action_59 is
			--|#line 566 "et_eiffel_parser.y"
		local
			yyval75: ET_FORMAL_PARAMETER_ITEM
		do
--|#line 566 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 566")
end

			yyval75 := ast_factory.new_formal_parameter_comma (yyvs74.item (yyvsp74), yyvs5.item (yyvsp5))
			if yyval75 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_60 is
			--|#line 575 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 575 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 575")
end

			yyval74 := ast_factory.new_formal_parameter (Void, yyvs13.item (yyvsp13))
			if yyval74 /= Void then
				register_constraint (Void)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_61 is
			--|#line 582 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 582 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 582")
end

			yyval74 := ast_factory.new_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13))
			if yyval74 /= Void then
				register_constraint (Void)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_62 is
			--|#line 589 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 589 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 589")
end

			yyval74 := ast_factory.new_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13))
			if yyval74 /= Void then
				register_constraint (Void)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_63 is
			--|#line 596 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 596 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 596")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (Void, yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), Void)
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_64 is
			--|#line 603 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 603 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 603")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), Void)
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_65 is
			--|#line 610 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 610 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 610")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), Void)
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_66 is
			--|#line 617 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 617 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 617")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (Void, yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), yyvs49.item (yyvsp49))
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_67 is
			--|#line 624 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 624 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 624")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), yyvs49.item (yyvsp49))
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_68 is
			--|#line 631 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 631 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 631")
end

			yyval74 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), dummy_constraint (yyvs50.item (yyvsp50)), yyvs49.item (yyvsp49))
			if yyval74 /= Void then
				register_constraint (yyvs50.item (yyvsp50))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_69 is
			--|#line 640 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 640 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 640")
end

yyval49 := ast_factory.new_constraint_creator (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_70 is
			--|#line 642 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 642 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 642")
end

			yyval49 := yyvs49.item (yyvsp49)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 -1
	yyvsp2 := yyvsp2 -1
	yyvs49.put (yyval49, yyvsp49)
end
		end

	yy_do_action_71 is
			--|#line 642 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 642 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 642")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_72 is
			--|#line 655 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 655 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 655")
end

			if yyvs13.item (yyvsp13) /= Void then
				yyval49 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value + 1)
				if yyval49 /= Void then
					yyval49.put_first (yyvs13.item (yyvsp13))
				end
			else
				yyval49 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_73 is
			--|#line 666 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 666 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 666")
end

			yyval49 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value)
			if yyval49 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval49.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_74 is
			--|#line 674 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 674 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 674")
end

			yyval49 := yyvs49.item (yyvsp49)
			if yyval49 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval49.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyvs49.put (yyval49, yyvsp49)
end
		end

	yy_do_action_75 is
			--|#line 683 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 683 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 683")
end

yyval50 := new_constraint_named_type (Void, yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_76 is
			--|#line 685 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 685 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 685")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 687 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 687 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 687")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_78 is
			--|#line 689 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 689 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 689")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_79 is
			--|#line 691 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 691 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 691")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval50 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_80 is
			--|#line 699 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 699 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 699")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval50 := new_constraint_named_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp24 := yyvsp24 -1
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
			--|#line 707 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 707 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 707")
end

yyval50 := yyvs88.item (yyvsp88) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_82 is
			--|#line 709 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 709 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 709")
end

yyval50 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_83 is
			--|#line 711 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 711 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 711")
end

yyval50 := new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status >= yyContinue then
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

	yy_do_action_84 is
			--|#line 713 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 713 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 713")
end

yyval50 := new_constraint_named_type (Void, yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_85 is
			--|#line 715 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 715 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 715")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval50 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_86 is
			--|#line 723 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 723 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 723")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval50 := new_constraint_named_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_87 is
			--|#line 733 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 733 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 733")
end

yyval50 := new_constraint_named_type (Void, yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_88 is
			--|#line 735 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 735 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 735")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_89 is
			--|#line 737 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 737 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 737")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_90 is
			--|#line 739 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 739 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 739")
end

yyval50 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_91 is
			--|#line 741 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 741 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 741")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval50 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_92 is
			--|#line 749 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 749 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 749")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval50 := new_constraint_named_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_93 is
			--|#line 757 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 757 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 757")
end

yyval50 := yyvs88.item (yyvsp88) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_94 is
			--|#line 759 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 759 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 759")
end

yyval50 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_95 is
			--|#line 761 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 761 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 761")
end

yyval50 := new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status >= yyContinue then
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

	yy_do_action_96 is
			--|#line 763 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 763 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 763")
end

yyval50 := new_constraint_named_type (Void, yyvs13.item (yyvsp13), yyvs48.item (yyvsp48)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_97 is
			--|#line 765 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 765 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 765")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval50 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_98 is
			--|#line 773 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 773 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 773")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval50 := new_constraint_named_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs48.item (yyvsp48))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_99 is
			--|#line 783 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 783 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 783")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_100 is
			--|#line 785 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 785 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 785")
end

yyval48 := yyvs48.item (yyvsp48) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_101 is
			--|#line 789 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 789 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 789")
end

yyval48 := ast_factory.new_constraint_actual_parameters (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_102 is
			--|#line 792 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 792 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 792")
end

			yyval48 := yyvs48.item (yyvsp48)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_103 is
			--|#line 800 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 800 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 800")
end

			if yyvs50.item (yyvsp50) /= Void then
				yyval48 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval48 /= Void then
					yyval48.put_first (yyvs50.item (yyvsp50))
				end
			else
				yyval48 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_104 is
			--|#line 811 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 811 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 811")
end

			yyval48 := yyvs48.item (yyvsp48)
			add_to_constraint_actual_parameter_list (yyvs47.item (yyvsp47), yyval48)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp47 := yyvsp47 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_105 is
			--|#line 816 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 816 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 816")
end

			yyval48 := yyvs48.item (yyvsp48)
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_actual_parameter_comma (new_constraint_named_type (Void, yyvs13.item (yyvsp13), Void), yyvs5.item (yyvsp5)), yyval48)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_106 is
			--|#line 821 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 821 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 821")
end

			yyval48 := yyvs48.item (yyvsp48)
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_actual_parameter_comma (new_constraint_named_type (Void, yyvs13.item (yyvsp13), Void), yyvs5.item (yyvsp5)), yyval48)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_107 is
			--|#line 828 "et_eiffel_parser.y"
		local
			yyval47: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 828 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 828")
end

			yyval47 := ast_factory.new_constraint_actual_parameter_comma (yyvs50.item (yyvsp50), yyvs5.item (yyvsp5))
			if yyval47 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_108 is
			--|#line 837 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 837 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 837")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_109 is
			--|#line 839 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 839 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 839")
end

yyval48 := yyvs48.item (yyvsp48) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_110 is
			--|#line 843 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 843 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 843")
end

yyval48 := ast_factory.new_constraint_actual_parameters (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_111 is
			--|#line 846 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 846 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 846")
end

			yyval48 := yyvs48.item (yyvsp48)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_112 is
			--|#line 852 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 852 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 852")
end

			yyval48 := yyvs48.item (yyvsp48)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_113 is
			--|#line 860 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 860 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 860")
end

			yyval48 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5 - 1), yyvs50.item (yyvsp50)), yyval48)
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_114 is
			--|#line 865 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 865 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 865")
end

			yyval48 := yyvs48.item (yyvsp48)
			add_to_constraint_actual_parameter_list (yyvs47.item (yyvsp47), yyvs48.item (yyvsp48))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp47 := yyvsp47 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_115 is
			--|#line 870 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 870 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 870")
end

			yyval48 := yyvs48.item (yyvsp48)
			add_to_constraint_actual_parameter_list (yyvs47.item (yyvsp47), yyvs48.item (yyvsp48))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp47 := yyvsp47 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_116 is
			--|#line 875 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 875 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 875")
end

			yyval48 := yyvs48.item (yyvsp48)
			if yyval48 /= Void then
				if not yyval48.is_empty then
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyval48.first.type), yyval48)
				else
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), Void), yyval48)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_117 is
			--|#line 886 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 886 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 886")
end

			yyval48 := yyvs48.item (yyvsp48)
			if yyval48 /= Void then
				if not yyval48.is_empty then
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyval48.first.type), yyval48)
				else
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), Void), yyval48)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_118 is
			--|#line 897 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 897 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 897")
end

			yyval48 := yyvs48.item (yyvsp48)
			if yyval48 /= Void then
				if not yyval48.is_empty then
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyval48.first.type), yyval48)
				else
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), Void), yyval48)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_119 is
			--|#line 910 "et_eiffel_parser.y"
		local
			yyval47: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 910 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 910")
end

			yyval47 := ast_factory.new_constraint_labeled_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyvs50.item (yyvsp50))
			if yyval47 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_120 is
			--|#line 919 "et_eiffel_parser.y"
		local
			yyval47: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 919 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 919")
end

			yyval47 := ast_factory.new_constraint_labeled_actual_parameter_semicolon (ast_factory.new_constraint_labeled_actual_parameter (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyvs50.item (yyvsp50)), yyvs22.item (yyvsp22))
			if yyval47 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_121 is
			--|#line 930 "et_eiffel_parser.y"
		local
			yyval97: ET_OBSOLETE
		do
--|#line 930 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 930")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_122 is
			--|#line 932 "et_eiffel_parser.y"
		local
			yyval97: ET_OBSOLETE
		do
--|#line 932 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 932")
end

yyval97 := ast_factory.new_obsolete_message (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_123 is
			--|#line 938 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 938 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 938")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_124 is
			--|#line 940 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 940 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 940")
end

yyval101 := ast_factory.new_parents (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_125 is
			--|#line 942 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 942 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 942")
end

			yyval101 := yyvs101.item (yyvsp101)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
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

			yyval101 := yyvs101.item (yyvsp101)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_127 is
			--|#line 957 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 957 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 957")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_128 is
			--|#line 964 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 964 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 964")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, Void, Void, Void)
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_129 is
			--|#line 971 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 971 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 971")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), yyvs107.item (yyvsp107), yyvs61.item (yyvsp61), yyvs87.item (yyvsp87 - 2), yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_130 is
			--|#line 979 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 979 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 979")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, yyvs61.item (yyvsp61), yyvs87.item (yyvsp87 - 2), yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_131 is
			--|#line 986 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 986 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 986")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, yyvs87.item (yyvsp87 - 2), yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_132 is
			--|#line 993 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 993 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 993")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_133 is
			--|#line 1000 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 1000 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1000")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, Void, yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_134 is
			--|#line 1009 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENT
		do
--|#line 1009 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1009")
end

			yyval99 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, Void, Void, yyvs2.item (yyvsp2))
			if yyval99 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_135 is
			--|#line 1018 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 1018 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1018")
end

			yyval101 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_136 is
			--|#line 1025 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 1025 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1025")
end

			yyval101 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval101 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval101.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_137 is
			--|#line 1032 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 1032 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1032")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp99 := yyvsp99 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_138 is
			--|#line 1039 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 1039 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1039")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp99 := yyvsp99 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_139 is
			--|#line 1046 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 1046 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1046")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval101.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_140 is
			--|#line 1055 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 1055 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1055")
end

			yyval101 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_141 is
			--|#line 1062 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 1062 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1062")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp99 := yyvsp99 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_142 is
			--|#line 1069 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 1069 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1069")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs99.item (yyvsp99) /= Void then
				yyval101.put_first (yyvs99.item (yyvsp99))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp99 := yyvsp99 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_143 is
			--|#line 1076 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_LIST
		do
--|#line 1076 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1076")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval101.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 -1
	yyvs101.put (yyval101, yyvsp101)
end
		end

	yy_do_action_144 is
			--|#line 1085 "et_eiffel_parser.y"
		local
			yyval100: ET_PARENT_ITEM
		do
--|#line 1085 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1085")
end

			yyval100 := ast_factory.new_parent_semicolon (yyvs99.item (yyvsp99), yyvs22.item (yyvsp22))
			if yyval100 /= Void and yyvs99.item (yyvsp99) = Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_145 is
			--|#line 1092 "et_eiffel_parser.y"
		local
			yyval100: ET_PARENT_ITEM
		do
--|#line 1092 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1092")
end

			yyval100 := ast_factory.new_parent_semicolon (yyvs99.item (yyvsp99), yyvs22.item (yyvsp22))
			if yyval100 /= Void and yyvs99.item (yyvsp99) = Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_146 is
			--|#line 1103 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1103 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1103")
end

yyval107 := ast_factory.new_renames (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_147 is
			--|#line 1105 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1105 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1105")
end

			yyval107 := yyvs107.item (yyvsp107)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp107 := yyvsp107 -1
	yyvsp2 := yyvsp2 -1
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_148 is
			--|#line 1105 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1105 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1105")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_149 is
			--|#line 1118 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1118 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1118")
end

			yyval107 := ast_factory.new_renames (last_keyword, counter_value)
			if yyval107 /= Void and yyvs106.item (yyvsp106) /= Void then
				yyval107.put_first (yyvs106.item (yyvsp106))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_150 is
			--|#line 1125 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1125 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1125")
end

			yyval107 := ast_factory.new_renames (last_keyword, counter_value)
			if yyval107 /= Void and yyvs106.item (yyvsp106) /= Void then
				yyval107.put_first (yyvs106.item (yyvsp106))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_151 is
			--|#line 1133 "et_eiffel_parser.y"
		local
			yyval107: ET_RENAME_LIST
		do
--|#line 1133 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1133")
end

			yyval107 := yyvs107.item (yyvsp107)
			if yyval107 /= Void and yyvs106.item (yyvsp106) /= Void then
				yyval107.put_first (yyvs106.item (yyvsp106))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp106 := yyvsp106 -1
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_152 is
			--|#line 1142 "et_eiffel_parser.y"
		local
			yyval106: ET_RENAME_ITEM
		do
--|#line 1142 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1142")
end

			yyval106 := ast_factory.new_rename (yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs64.item (yyvsp64))
			if yyval106 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_153 is
			--|#line 1151 "et_eiffel_parser.y"
		local
			yyval106: ET_RENAME_ITEM
		do
--|#line 1151 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1151")
end

			yyval106 := ast_factory.new_rename_comma (yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs64.item (yyvsp64), yyvs5.item (yyvsp5))
			if yyval106 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_154 is
			--|#line 1162 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1162 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1162")
end

yyval61 := ast_factory.new_exports (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_155 is
			--|#line 1164 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1164 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1164")
end

			yyval61 := yyvs61.item (yyvsp61)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp61 := yyvsp61 -1
	yyvsp2 := yyvsp2 -1
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_156 is
			--|#line 1164 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1164 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1164")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_157 is
			--|#line 1177 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1177 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1177")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_158 is
			--|#line 1179 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1179 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1179")
end

yyval61 := yyvs61.item (yyvsp61) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_159 is
			--|#line 1183 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1183 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1183")
end

			if yyvs60.item (yyvsp60) /= Void then
				yyval61 := ast_factory.new_exports (last_keyword, counter_value + 1)
				if yyval61 /= Void then
					yyval61.put_first (yyvs60.item (yyvsp60))
				end
			else
				yyval61 := ast_factory.new_exports (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_160 is
			--|#line 1194 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1194 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1194")
end

			yyval61 := yyvs61.item (yyvsp61)
			if yyval61 /= Void and yyvs60.item (yyvsp60) /= Void then
				yyval61.put_first (yyvs60.item (yyvsp60))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp61 := yyvsp61 -1
	yyvsp60 := yyvsp60 -1
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_161 is
			--|#line 1194 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1194 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1194")
end

			if yyvs60.item (yyvsp60) /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_162 is
			--|#line 1209 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1209 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1209")
end

			yyval60 := ast_factory.new_all_export (yyvs44.item (yyvsp44), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_163 is
			--|#line 1213 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1213 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1213")
end

			last_export_clients := yyvs44.item (yyvsp44)
			yyval60 := ast_factory.new_feature_export (last_export_clients, 0)
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_164 is
			--|#line 1218 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1218 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1218")
end

			yyval60 := yyvs68.item (yyvsp68)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 -1
	yyvsp68 := yyvsp68 -1
	yyvs60.put (yyval60, yyvsp60)
end
		end

	yy_do_action_165 is
			--|#line 1218 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1218 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1218")
end

			last_export_clients := yyvs44.item (yyvsp44)
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_166 is
			--|#line 1228 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1228 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1228")
end

yyval60 := ast_factory.new_null_export (yyvs22.item (yyvsp22)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_167 is
			--|#line 1232 "et_eiffel_parser.y"
		local
			yyval68: ET_FEATURE_EXPORT
		do
--|#line 1232 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1232")
end

			if yyvs69.item (yyvsp69) /= Void then
				yyval68 := ast_factory.new_feature_export (last_export_clients, counter_value + 1)
				if yyval68 /= Void then
					yyval68.put_first (yyvs69.item (yyvsp69))
				end
			else
				yyval68 := ast_factory.new_feature_export (last_export_clients, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_168 is
			--|#line 1243 "et_eiffel_parser.y"
		local
			yyval68: ET_FEATURE_EXPORT
		do
--|#line 1243 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1243")
end

			yyval68 := ast_factory.new_feature_export (last_export_clients, counter_value)
			if yyval68 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval68.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_169 is
			--|#line 1251 "et_eiffel_parser.y"
		local
			yyval68: ET_FEATURE_EXPORT
		do
--|#line 1251 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1251")
end

			yyval68 := yyvs68.item (yyvsp68)
			if yyval68 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval68.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyvs68.put (yyval68, yyvsp68)
end
		end

	yy_do_action_170 is
			--|#line 1262 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1262 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1262")
end

			yyval44 := yyvs44.item (yyvsp44)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 -1
	yyvsp5 := yyvsp5 -1
	yyvs44.put (yyval44, yyvsp44)
end
		end

	yy_do_action_171 is
			--|#line 1262 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1262 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1262")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_172 is
			--|#line 1273 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1273 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1273")
end

yyval44 := ast_factory.new_none_clients (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_173 is
			--|#line 1277 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1277 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1277")
end

			yyval44 := ast_factory.new_clients (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval44 /= Void and yyvs43.item (yyvsp43) /= Void then
				yyval44.put_first (yyvs43.item (yyvsp43))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_174 is
			--|#line 1284 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1284 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1284")
end

			yyval44 := ast_factory.new_clients (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval44 /= Void and yyvs43.item (yyvsp43) /= Void then
				yyval44.put_first (yyvs43.item (yyvsp43))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_175 is
			--|#line 1292 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1292 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1292")
end

			yyval44 := yyvs44.item (yyvsp44)
			if yyval44 /= Void and yyvs43.item (yyvsp43) /= Void then
				yyval44.put_first (yyvs43.item (yyvsp43))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp43 := yyvsp43 -1
	yyvs44.put (yyval44, yyvsp44)
end
		end

	yy_do_action_176 is
			--|#line 1299 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1299 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1299")
end

			yyval44 := yyvs44.item (yyvsp44)
			if yyval44 /= Void and yyvs43.item (yyvsp43) /= Void then
				yyval44.put_first (yyvs43.item (yyvsp43))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp43 := yyvsp43 -1
	yyvs44.put (yyval44, yyvsp44)
end
		end

	yy_do_action_177 is
			--|#line 1309 "et_eiffel_parser.y"
		local
			yyval43: ET_CLIENT_ITEM
		do
--|#line 1309 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1309")
end

			yyval43 := new_client (yyvs13.item (yyvsp13))
			if yyval43 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_178 is
			--|#line 1318 "et_eiffel_parser.y"
		local
			yyval43: ET_CLIENT_ITEM
		do
--|#line 1318 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1318")
end

			yyval43 := new_client_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5))
			if yyval43 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_179 is
			--|#line 1329 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1329 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1329")
end

yyval87 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
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
			--|#line 1331 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1331 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1331")
end

			yyval87 := yyvs87.item (yyvsp87)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 -1
	yyvsp2 := yyvsp2 -1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_181 is
			--|#line 1331 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1331 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1331")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
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
			--|#line 1344 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1344 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1344")
end


if yy_parsing_status >= yyContinue then
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
			--|#line 1346 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1346 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1346")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_184 is
			--|#line 1350 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1350 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1350")
end

yyval87 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_185 is
			--|#line 1352 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1352 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1352")
end

			yyval87 := yyvs87.item (yyvsp87)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 -1
	yyvsp2 := yyvsp2 -1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_186 is
			--|#line 1352 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1352 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1352")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_187 is
			--|#line 1365 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1365 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1365")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_188 is
			--|#line 1367 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1367 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1367")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_189 is
			--|#line 1371 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1371 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1371")
end

yyval87 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_190 is
			--|#line 1373 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1373 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1373")
end

			yyval87 := yyvs87.item (yyvsp87)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 -1
	yyvsp2 := yyvsp2 -1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_191 is
			--|#line 1373 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1373 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1373")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_192 is
			--|#line 1386 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1386 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1386")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_193 is
			--|#line 1388 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1388 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1388")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_194 is
			--|#line 1392 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1392 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1392")
end

			if yyvs69.item (yyvsp69) /= Void then
				yyval87 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value + 1)
				if yyval87 /= Void then
					yyval87.put_first (yyvs69.item (yyvsp69))
				end
			else
				yyval87 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_195 is
			--|#line 1403 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1403 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1403")
end

			yyval87 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			if yyval87 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval87.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_196 is
			--|#line 1411 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1411 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1411")
end

			yyval87 := yyvs87.item (yyvsp87)
			if yyval87 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval87.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_197 is
			--|#line 1420 "et_eiffel_parser.y"
		local
			yyval70: ET_FEATURE_NAME_ITEM
		do
--|#line 1420 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1420")
end

			yyval70 := ast_factory.new_feature_name_comma (yyvs69.item (yyvsp69), yyvs5.item (yyvsp5))
			if yyval70 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_198 is
			--|#line 1431 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1431 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1431")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_199 is
			--|#line 1433 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1433 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1433")
end

			yyval56 := yyvs56.item (yyvsp56)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs56.put (yyval56, yyvsp56)
end
		end

	yy_do_action_200 is
			--|#line 1440 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1440 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1440")
end

			yyval56 := yyvs56.item (yyvsp56)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs56.put (yyval56, yyvsp56)
end
		end

	yy_do_action_201 is
			--|#line 1447 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1447 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1447")
end

			if yyvs55.item (yyvsp55) /= Void then
				yyval56 := ast_factory.new_creators (counter_value + 1)
				if yyval56 /= Void then
					yyval56.put_first (yyvs55.item (yyvsp55))
				end
			else
				yyval56 := ast_factory.new_creators (counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_202 is
			--|#line 1458 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1458 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1458")
end

			yyval56 := yyvs56.item (yyvsp56)
			if yyval56 /= Void and yyvs55.item (yyvsp55) /= Void then
				yyval56.put_first (yyvs55.item (yyvsp55))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp56 := yyvsp56 -1
	yyvsp55 := yyvsp55 -1
	yyvs56.put (yyval56, yyvsp56)
end
		end

	yy_do_action_203 is
			--|#line 1458 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1458 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1458")
end

			if yyvs55.item (yyvsp55) /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_204 is
			--|#line 1473 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1473 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1473")
end

yyval55 := ast_factory.new_creator (yyvs2.item (yyvsp2), yyvs44.item (yyvsp44), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_205 is
			--|#line 1475 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1475 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1475")
end

yyval55 := ast_factory.new_creator (yyvs2.item (yyvsp2), new_any_clients (yyvs2.item (yyvsp2)), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_206 is
			--|#line 1477 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1477 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1477")
end

			yyval55 := yyvs55.item (yyvsp55)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp55 := yyvsp55 -1
	yyvsp2 := yyvsp2 -1
	yyvsp44 := yyvsp44 -1
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_207 is
			--|#line 1477 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1477 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1477")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := yyvs44.item (yyvsp44)
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_208 is
			--|#line 1489 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1489 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1489")
end

			yyval55 := yyvs55.item (yyvsp55)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp55 := yyvsp55 -1
	yyvsp2 := yyvsp2 -1
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_209 is
			--|#line 1489 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1489 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1489")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := new_any_clients (last_keyword)
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_210 is
			--|#line 1501 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1501 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1501")
end

yyval55 := ast_factory.new_creator (yyvs2.item (yyvsp2), yyvs44.item (yyvsp44), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_211 is
			--|#line 1503 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1503 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1503")
end

yyval55 := ast_factory.new_creator (yyvs2.item (yyvsp2), new_any_clients (yyvs2.item (yyvsp2)), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_212 is
			--|#line 1505 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1505 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1505")
end

			yyval55 := yyvs55.item (yyvsp55)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp55 := yyvsp55 -1
	yyvsp2 := yyvsp2 -1
	yyvsp44 := yyvsp44 -1
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_213 is
			--|#line 1505 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1505 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1505")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := yyvs44.item (yyvsp44)
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_214 is
			--|#line 1517 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1517 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1517")
end

			yyval55 := yyvs55.item (yyvsp55)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp55 := yyvsp55 -1
	yyvsp2 := yyvsp2 -1
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_215 is
			--|#line 1517 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1517 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1517")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := new_any_clients (last_keyword)
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_216 is
			--|#line 1531 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1531 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1531")
end

			if yyvs13.item (yyvsp13) /= Void then
				yyval55 := ast_factory.new_creator (last_keyword, last_clients, counter_value + 1)
				if yyval55 /= Void then
					yyval55.put_first (yyvs13.item (yyvsp13))
				end
			else
				yyval55 := ast_factory.new_creator (last_keyword, last_clients, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_217 is
			--|#line 1542 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1542 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1542")
end

			yyval55 := ast_factory.new_creator (last_keyword, last_clients, counter_value)
			if yyval55 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval55.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_218 is
			--|#line 1550 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1550 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1550")
end

			yyval55 := yyvs55.item (yyvsp55)
			if yyval55 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval55.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyvs55.put (yyval55, yyvsp55)
end
		end

	yy_do_action_219 is
			--|#line 1559 "et_eiffel_parser.y"
		local
			yyval70: ET_FEATURE_NAME_ITEM
		do
--|#line 1559 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1559")
end

			yyval70 := ast_factory.new_feature_name_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5))
			if yyval70 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_220 is
			--|#line 1570 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1570 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1570")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_221 is
			--|#line 1572 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1572 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1572")
end

yyval53 := yyvs53.item (yyvsp53) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs53.put (yyval53, yyvsp53)
end
		end

	yy_do_action_222 is
			--|#line 1576 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1576 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1576")
end

			yyval53 := yyvs53.item (yyvsp53)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp53 := yyvsp53 -1
	yyvsp2 := yyvsp2 -1
	yyvs53.put (yyval53, yyvsp53)
end
		end

	yy_do_action_223 is
			--|#line 1576 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1576 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1576")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_224 is
			--|#line 1589 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1589 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1589")
end

			yyval53 := ast_factory.new_convert_features (last_keyword, counter_value + 1)
			if yyval53 /= Void and yyvs51.item (yyvsp51) /= Void then
				yyval53.put_first (yyvs51.item (yyvsp51))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_225 is
			--|#line 1596 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1596 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1596")
end

			yyval53 := ast_factory.new_convert_features (last_keyword, counter_value)
			if yyval53 /= Void and yyvs52.item (yyvsp52) /= Void then
				yyval53.put_first (yyvs52.item (yyvsp52))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_226 is
			--|#line 1603 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1603 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1603")
end

			yyval53 := yyvs53.item (yyvsp53)
			if yyval53 /= Void and yyvs52.item (yyvsp52) /= Void then
				yyval53.put_first (yyvs52.item (yyvsp52))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp52 := yyvsp52 -1
	yyvs53.put (yyval53, yyvsp53)
end
		end

	yy_do_action_227 is
			--|#line 1612 "et_eiffel_parser.y"
		local
			yyval52: ET_CONVERT_FEATURE_ITEM
		do
--|#line 1612 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1612")
end

			yyval52 := ast_factory.new_convert_feature_comma (yyvs51.item (yyvsp51), yyvs5.item (yyvsp5))
			if yyval52 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_228 is
			--|#line 1621 "et_eiffel_parser.y"
		local
			yyval51: ET_CONVERT_FEATURE
		do
--|#line 1621 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1621")
end

			yyval51 := ast_factory.new_convert_function (yyvs69.item (yyvsp69), yyvs5.item (yyvsp5), yyvs112.item (yyvsp112))
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_229 is
			--|#line 1625 "et_eiffel_parser.y"
		local
			yyval51: ET_CONVERT_FEATURE
		do
--|#line 1625 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1625")
end

			yyval51 := ast_factory.new_convert_procedure (yyvs69.item (yyvsp69), yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_230 is
			--|#line 1631 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE_LIST
		do
--|#line 1631 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1631")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_231 is
			--|#line 1633 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE_LIST
		do
--|#line 1633 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1633")
end

			yyval112 := yyvs112.item (yyvsp112)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 -1
	yyvsp5 := yyvsp5 -1
	yyvs112.put (yyval112, yyvsp112)
end
		end

	yy_do_action_232 is
			--|#line 1633 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE_LIST
		do
--|#line 1633 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1633")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_233 is
			--|#line 1646 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE_LIST
		do
--|#line 1646 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1646")
end

			if yyvs110.item (yyvsp110) /= Void then
				yyval112 := ast_factory.new_convert_types (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval112 /= Void then
					yyval112.put_first (yyvs110.item (yyvsp110))
				end
			else
				yyval112 := ast_factory.new_convert_types (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_234 is
			--|#line 1657 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE_LIST
		do
--|#line 1657 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1657")
end

			yyval112 := yyvs112.item (yyvsp112)
			if yyval112 /= Void and yyvs111.item (yyvsp111) /= Void then
				yyval112.put_first (yyvs111.item (yyvsp111))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp111 := yyvsp111 -1
	yyvs112.put (yyval112, yyvsp112)
end
		end

	yy_do_action_235 is
			--|#line 1666 "et_eiffel_parser.y"
		local
			yyval111: ET_TYPE_ITEM
		do
--|#line 1666 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1666")
end

			yyval111 := ast_factory.new_type_comma (yyvs110.item (yyvsp110), yyvs5.item (yyvsp5))
			if yyval111 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_236 is
			--|#line 1677 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1677 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1677")
end

			-- $$ := Void
			set_class_features
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_237 is
			--|#line 1682 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1682 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1682")
end

yyval67 := yyvs67.item (yyvsp67) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs67.put (yyval67, yyvsp67)
end
		end

	yy_do_action_238 is
			--|#line 1686 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1686 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1686")
end

			yyval67 := yyvs67.item (yyvsp67)
			set_class_features
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs67.put (yyval67, yyvsp67)
end
		end

	yy_do_action_239 is
			--|#line 1694 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1694 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1694")
end

			yyval67 := ast_factory.new_feature_clauses (counter_value)
			if yyval67 /= Void and yyvs66.item (yyvsp66) /= Void then
				yyval67.put_first (yyvs66.item (yyvsp66))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_240 is
			--|#line 1701 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1701 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1701")
end

			yyval67 := yyvs67.item (yyvsp67)
			if yyval67 /= Void and yyvs66.item (yyvsp66) /= Void then
				yyval67.put_first (yyvs66.item (yyvsp66))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp66 := yyvsp66 -1
	yyvs67.put (yyval67, yyvsp67)
end
		end

	yy_do_action_241 is
			--|#line 1710 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1710 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1710")
end

			yyval66 := last_feature_clause
			if yyval66 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs66.put (yyval66, yyvsp66)
end
		end

	yy_do_action_242 is
			--|#line 1717 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1717 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1717")
end

			yyval66 := last_feature_clause
			if yyval66 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs66.put (yyval66, yyvsp66)
end
		end

	yy_do_action_243 is
			--|#line 1726 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1726 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1726")
end

			last_clients := yyvs44.item (yyvsp44)
			last_feature_clause := ast_factory.new_feature_clause (yyvs2.item (yyvsp2), last_clients)
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_244 is
			--|#line 1731 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1731 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1731")
end

			last_clients := new_any_clients (yyvs2.item (yyvsp2))
			last_feature_clause := ast_factory.new_feature_clause (yyvs2.item (yyvsp2), last_clients)
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_245 is
			--|#line 1738 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1738 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1738")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_246 is
			--|#line 1739 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1739 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1739")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_247 is
			--|#line 1740 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1740 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1740")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp105 := yyvsp105 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_248 is
			--|#line 1741 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1741 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1741")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp104 := yyvsp104 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_249 is
			--|#line 1746 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1746 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1746")
end

			yyval105 := yyvs105.item (yyvsp105)
			register_query (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_250 is
			--|#line 1751 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1751 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1751")
end

			yyval105 := yyvs105.item (yyvsp105)
			yyval105.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_query (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_251 is
			--|#line 1757 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1757 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1757")
end

			yyval105 := new_query_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs105.item (yyvsp105))
			register_query_synonym (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_252 is
			--|#line 1762 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1762 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1762")
end

			yyval105 := new_query_synonym (yyvs64.item (yyvsp64), yyvs105.item (yyvsp105))
			register_query_synonym (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_253 is
			--|#line 1768 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1768 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1768")
end

			yyval105 := new_query_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs105.item (yyvsp105))
			yyval105.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_query_synonym (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_254 is
			--|#line 1774 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1774 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1774")
end

			yyval105 := new_query_synonym (yyvs64.item (yyvsp64), yyvs105.item (yyvsp105))
			yyval105.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_query_synonym (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_255 is
			--|#line 1783 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1783 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1783")
end

			yyval104 := yyvs104.item (yyvsp104)
			register_procedure (yyval104)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_256 is
			--|#line 1788 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1788 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1788")
end

			yyval104 := yyvs104.item (yyvsp104)
			yyval104.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_procedure (yyval104)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_257 is
			--|#line 1794 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1794 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1794")
end

			yyval104 := new_procedure_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs104.item (yyvsp104))
			register_procedure_synonym (yyval104)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_258 is
			--|#line 1799 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1799 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1799")
end

			yyval104 := new_procedure_synonym (yyvs64.item (yyvsp64), yyvs104.item (yyvsp104))
			register_procedure_synonym (yyval104)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 -1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_259 is
			--|#line 1805 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1805 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1805")
end

			yyval104 := new_procedure_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs104.item (yyvsp104))
			yyval104.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_procedure_synonym (yyval104)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_260 is
			--|#line 1811 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1811 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1811")
end

			yyval104 := new_procedure_synonym (yyvs64.item (yyvsp64), yyvs104.item (yyvsp104))
			yyval104.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_procedure_synonym (yyval104)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvs104.put (yyval104, yyvsp104)
end
		end

	yy_do_action_261 is
			--|#line 1820 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1820 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1820")
end

yyval105 := ast_factory.new_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_262 is
			--|#line 1822 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1822 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1822")
end

yyval105 := ast_factory.new_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_263 is
			--|#line 1824 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1824 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1824")
end

yyval105 := ast_factory.new_constant_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2), yyvs46.item (yyvsp46), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_264 is
			--|#line 1826 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1826 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1826")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_constant_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs5.item (yyvsp5), yyvs46.item (yyvsp46), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_265 is
			--|#line 1834 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1834 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1834")
end

yyval105 := ast_factory.new_unique_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_266 is
			--|#line 1836 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1836 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1836")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_unique_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs5.item (yyvsp5), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_267 is
			--|#line 1844 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1844 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1844")
end

yyval105 := ast_factory.new_do_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_268 is
			--|#line 1847 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1847 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1847")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_do_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_269 is
			--|#line 1856 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1856 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1856")
end

yyval105 := ast_factory.new_do_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_270 is
			--|#line 1860 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1860 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1860")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_do_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_271 is
			--|#line 1870 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1870 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1870")
end

yyval105 := ast_factory.new_once_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_272 is
			--|#line 1873 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1873 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1873")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_once_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_273 is
			--|#line 1882 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1882 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1882")
end

yyval105 := ast_factory.new_once_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_274 is
			--|#line 1886 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1886 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1886")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_once_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_275 is
			--|#line 1896 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1896 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1896")
end

yyval105 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_276 is
			--|#line 1898 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1898 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1898")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_277 is
			--|#line 1906 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1906 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1906")
end

yyval105 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_278 is
			--|#line 1909 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1909 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1909")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_279 is
			--|#line 1918 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1918 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1918")
end

yyval105 := new_external_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_280 is
			--|#line 1921 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1921 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1921")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := new_external_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_281 is
			--|#line 1930 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1930 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1930")
end

yyval105 := new_external_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_282 is
			--|#line 1934 "et_eiffel_parser.y"
		local
			yyval105: ET_QUERY
		do
--|#line 1934 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1934")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval105 := new_external_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_283 is
			--|#line 1946 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1946 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1946")
end

yyval104 := ast_factory.new_do_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_284 is
			--|#line 1949 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1949 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1949")
end

yyval104 := ast_factory.new_do_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_285 is
			--|#line 1953 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1953 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1953")
end

yyval104 := ast_factory.new_once_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_286 is
			--|#line 1956 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1956 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1956")
end

yyval104 := ast_factory.new_once_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_287 is
			--|#line 1960 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1960 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1960")
end

yyval104 := ast_factory.new_deferred_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_288 is
			--|#line 1962 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1962 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1962")
end

yyval104 := ast_factory.new_deferred_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2 - 1), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_289 is
			--|#line 1965 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1965 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1965")
end

yyval104 := new_external_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_290 is
			--|#line 1968 "et_eiffel_parser.y"
		local
			yyval104: ET_PROCEDURE
		do
--|#line 1968 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1968")
end

yyval104 := new_external_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs97.item (yyvsp97), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_291 is
			--|#line 1974 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 1974 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1974")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval2 := Void
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_292 is
			--|#line 1982 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 1982 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1982")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_293 is
			--|#line 1986 "et_eiffel_parser.y"
		local
			yyval22: ET_SEMICOLON_SYMBOL
		do
--|#line 1986 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1986")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_294 is
			--|#line 1988 "et_eiffel_parser.y"
		local
			yyval22: ET_SEMICOLON_SYMBOL
		do
--|#line 1988 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1988")
end

yyval22 := yyvs22.item (yyvsp22) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs22.put (yyval22, yyvsp22)
end
		end

	yy_do_action_295 is
			--|#line 1992 "et_eiffel_parser.y"
		local
			yyval65: ET_EXTERNAL_ALIAS
		do
--|#line 1992 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1992")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_296 is
			--|#line 1994 "et_eiffel_parser.y"
		local
			yyval65: ET_EXTERNAL_ALIAS
		do
--|#line 1994 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1994")
end

yyval65 := ast_factory.new_external_alias (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_297 is
			--|#line 1998 "et_eiffel_parser.y"
		local
			yyval33: ET_ASSIGNER
		do
--|#line 1998 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1998")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_298 is
			--|#line 2000 "et_eiffel_parser.y"
		local
			yyval33: ET_ASSIGNER
		do
--|#line 2000 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2000")
end

yyval33 := ast_factory.new_assigner (yyvs2.item (yyvsp2), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_299 is
			--|#line 2006 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2006 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2006")
end

yyval69 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_300 is
			--|#line 2008 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2008 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2008")
end

yyval69 := ast_factory.new_prefix_not_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2010 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2010 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2010")
end

yyval69 := ast_factory.new_prefix_plus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2012 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2012 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2012")
end

yyval69 := ast_factory.new_prefix_minus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2014 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2014 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2014")
end

yyval69 := ast_factory.new_prefix_free_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2016 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2016 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2016")
end

yyval69 := ast_factory.new_infix_plus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2018 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2018 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2018")
end

yyval69 := ast_factory.new_infix_minus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2020 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2020 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2020")
end

yyval69 := ast_factory.new_infix_times_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2022 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2022 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2022")
end

yyval69 := ast_factory.new_infix_divide_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2024 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2024 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2024")
end

yyval69 := ast_factory.new_infix_div_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2026 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2026 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2026")
end

yyval69 := ast_factory.new_infix_mod_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2028 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2028 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2028")
end

yyval69 := ast_factory.new_infix_power_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2030 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2030 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2030")
end

yyval69 := ast_factory.new_infix_lt_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2032 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2032 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2032")
end

yyval69 := ast_factory.new_infix_le_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2034 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2034 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2034")
end

yyval69 := ast_factory.new_infix_gt_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2036 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2036 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2036")
end

yyval69 := ast_factory.new_infix_ge_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2038 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2038 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2038")
end

yyval69 := ast_factory.new_infix_and_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2040 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2040 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2040")
end

yyval69 := ast_factory.new_infix_and_then_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2042 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2042 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2042")
end

yyval69 := ast_factory.new_infix_or_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2044 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2044 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2044")
end

yyval69 := ast_factory.new_infix_or_else_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2046 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2046 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2046")
end

yyval69 := ast_factory.new_infix_implies_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2048 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2048 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2048")
end

yyval69 := ast_factory.new_infix_xor_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2050 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2050 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2050")
end

yyval69 := ast_factory.new_infix_free_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2053 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2053 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2053")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2055 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2055 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2055")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2057 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2057 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2057")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2059 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2059 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2059")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2061 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2061 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2061")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2063 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2063 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2063")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2065 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2065 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2065")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2067 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2067 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2067")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2069 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2069 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2069")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_331 is
			--|#line 2071 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2071 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2071")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_332 is
			--|#line 2073 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2073 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2073")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_333 is
			--|#line 2075 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2075 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2075")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_334 is
			--|#line 2077 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2077 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2077")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_335 is
			--|#line 2079 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2079 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2079")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_336 is
			--|#line 2081 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2081 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2081")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_337 is
			--|#line 2083 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2083 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2083")
end

yyval69 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_338 is
			--|#line 2085 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2085 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2085")
end

yyval69 := new_invalid_infix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_339 is
			--|#line 2087 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2087 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2087")
end

yyval69 := new_invalid_infix_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_340 is
			--|#line 2091 "et_eiffel_parser.y"
		local
			yyval64: ET_EXTENDED_FEATURE_NAME
		do
--|#line 2091 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2091")
end

yyval64 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_341 is
			--|#line 2093 "et_eiffel_parser.y"
		local
			yyval64: ET_EXTENDED_FEATURE_NAME
		do
--|#line 2093 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2093")
end

yyval64 := ast_factory.new_aliased_feature_name (yyvs13.item (yyvsp13), yyvs32.item (yyvsp32)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_342 is
			--|#line 2097 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2097 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2097")
end

yyval32 := ast_factory.new_alias_not_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2099 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2099 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2099")
end

yyval32 := ast_factory.new_alias_plus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2101 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2101 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2101")
end

yyval32 := ast_factory.new_alias_minus_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2103 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2103 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2103")
end

yyval32 := ast_factory.new_alias_times_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2105 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2105 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2105")
end

yyval32 := ast_factory.new_alias_divide_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2107 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2107 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2107")
end

yyval32 := ast_factory.new_alias_div_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2109 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2109 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2109")
end

yyval32 := ast_factory.new_alias_mod_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2111 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2111 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2111")
end

yyval32 := ast_factory.new_alias_power_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2113 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2113 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2113")
end

yyval32 := ast_factory.new_alias_lt_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2115 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2115 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2115")
end

yyval32 := ast_factory.new_alias_le_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2117 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2117 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2117")
end

yyval32 := ast_factory.new_alias_gt_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2119 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2119 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2119")
end

yyval32 := ast_factory.new_alias_ge_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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
			--|#line 2121 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2121 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2121")
end

yyval32 := ast_factory.new_alias_and_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_355 is
			--|#line 2123 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2123 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2123")
end

yyval32 := ast_factory.new_alias_and_then_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_356 is
			--|#line 2125 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2125 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2125")
end

yyval32 := ast_factory.new_alias_or_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_357 is
			--|#line 2127 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2127 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2127")
end

yyval32 := ast_factory.new_alias_or_else_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_358 is
			--|#line 2129 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2129 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2129")
end

yyval32 := ast_factory.new_alias_implies_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_359 is
			--|#line 2131 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2131 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2131")
end

yyval32 := ast_factory.new_alias_xor_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_360 is
			--|#line 2133 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2133 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2133")
end

yyval32 := ast_factory.new_alias_dotdot_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_361 is
			--|#line 2135 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2135 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2135")
end

yyval32 := ast_factory.new_alias_free_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_362 is
			--|#line 2137 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2137 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2137")
end

yyval32 := ast_factory.new_alias_bracket_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_363 is
			--|#line 2140 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2140 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2140")
end

yyval32 := new_invalid_alias_name (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_364 is
			--|#line 2146 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2146 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2146")
end

			yyval73 := yyvs73.item (yyvsp73)
			set_start_closure (yyval73)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_365 is
			--|#line 2153 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2153 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2153")
end

yyval73 := new_formal_arguments (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_366 is
			--|#line 2155 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2155 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2155")
end

			yyval73 := yyvs73.item (yyvsp73)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_367 is
			--|#line 2163 "et_eiffel_parser.y"
		local
			yyval5: ET_SYMBOL
		do
--|#line 2163 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2163")
end

			-- Needed to solve ambiguity when parsing:
			--   agent (a).f
			--   agent (a: A) do ... end
			yyval5 := yyvs5.item (yyvsp5)
			add_symbol (yyval5)
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs5.put (yyval5, yyvsp5)
end
		end

	yy_do_action_368 is
			--|#line 2174 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2174 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2174")
end

			yyval73 := new_formal_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval73 /= Void and yyvs72.item (yyvsp72) /= Void then
				yyval73.put_first (yyvs72.item (yyvsp72))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_369 is
			--|#line 2181 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2181 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2181")
end

			yyval73 := new_formal_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval73 /= Void and yyvs72.item (yyvsp72) /= Void then
				yyval73.put_first (yyvs72.item (yyvsp72))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_370 is
			--|#line 2188 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2188 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2188")
end

			yyval73 := yyvs73.item (yyvsp73)
			if yyval73 /= Void and yyvs71.item (yyvsp71) /= Void then
				if not yyval73.is_empty then
					yyvs71.item (yyvsp71).set_declared_type (yyval73.first.type)
					yyval73.put_first (yyvs71.item (yyvsp71))
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 -1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_371 is
			--|#line 2198 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2198 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2198")
end

			-- TODO: Syntax error
			yyval73 := yyvs73.item (yyvsp73)
			if yyval73 /= Void and yyvs71.item (yyvsp71) /= Void then
				if not yyval73.is_empty then
					yyvs71.item (yyvsp71).set_declared_type (yyval73.first.type)
					yyval73.put_first (yyvs71.item (yyvsp71))
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 -1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_372 is
			--|#line 2209 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2209 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2209")
end

			yyval73 := yyvs73.item (yyvsp73)
			if yyval73 /= Void and yyvs72.item (yyvsp72) /= Void then
				yyval73.put_first (yyvs72.item (yyvsp72))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 -1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_373 is
			--|#line 2216 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2216 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2216")
end

			yyval73 := yyvs73.item (yyvsp73)
			if yyval73 /= Void and yyvs72.item (yyvsp72) /= Void then
				yyval73.put_first (yyvs72.item (yyvsp72))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 -1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_374 is
			--|#line 2225 "et_eiffel_parser.y"
		local
			yyval71: ET_FORMAL_ARGUMENT
		do
--|#line 2225 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2225")
end

			yyval71 := ast_factory.new_formal_comma_argument (ast_factory.new_argument_name_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), dummy_type)
			if yyval71 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_375 is
			--|#line 2234 "et_eiffel_parser.y"
		local
			yyval71: ET_FORMAL_ARGUMENT
		do
--|#line 2234 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2234")
end

			yyval71 := ast_factory.new_formal_comma_argument (yyvs13.item (yyvsp13), dummy_type)
			if yyval71 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_376 is
			--|#line 2243 "et_eiffel_parser.y"
		local
			yyval72: ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2243 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2243")
end

			yyval72 := ast_factory.new_formal_argument (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)))
			if yyval72 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_377 is
			--|#line 2252 "et_eiffel_parser.y"
		local
			yyval72: ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2252 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2252")
end

			yyval72 := ast_factory.new_formal_argument_semicolon (ast_factory.new_formal_argument (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110))), yyvs22.item (yyvsp22))
			if yyval72 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_378 is
			--|#line 2263 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2263 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2263")
end

yyval91 := Void 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_379 is
			--|#line 2265 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2265 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2265")
end

yyval91 := new_local_variables (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_380 is
			--|#line 2267 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2267 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2267")
end

			yyval91 := yyvs91.item (yyvsp91)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp91 := yyvsp91 -1
	yyvsp2 := yyvsp2 -1
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_381 is
			--|#line 2267 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2267 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2267")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_382 is
			--|#line 2280 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2280 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2280")
end

			yyval91 := new_local_variables (last_keyword, counter_value)
			if yyvs90.item (yyvsp90) /= Void then
				yyval91.put_first (yyvs90.item (yyvsp90))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_383 is
			--|#line 2287 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2287 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2287")
end

			yyval91 := new_local_variables (last_keyword, counter_value)
			if yyvs90.item (yyvsp90) /= Void then
				yyval91.put_first (yyvs90.item (yyvsp90))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_384 is
			--|#line 2294 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2294 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2294")
end

			yyval91 := yyvs91.item (yyvsp91)
			if yyval91 /= Void and yyvs89.item (yyvsp89) /= Void then
				if not yyval91.is_empty then
					yyvs89.item (yyvsp89).set_declared_type (yyval91.first.type)
					yyval91.put_first (yyvs89.item (yyvsp89))
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp89 := yyvsp89 -1
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_385 is
			--|#line 2304 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2304 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2304")
end

			-- TODO: Syntax error
			yyval91 := yyvs91.item (yyvsp91)
			if yyval91 /= Void and yyvs89.item (yyvsp89) /= Void then
				if not yyval91.is_empty then
					yyvs89.item (yyvsp89).set_declared_type (yyval91.first.type)
					yyval91.put_first (yyvs89.item (yyvsp89))
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp89 := yyvsp89 -1
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_386 is
			--|#line 2315 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2315 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2315")
end

			yyval91 := yyvs91.item (yyvsp91)
			if yyval91 /= Void and yyvs90.item (yyvsp90) /= Void then
				yyval91.put_first (yyvs90.item (yyvsp90))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp90 := yyvsp90 -1
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_387 is
			--|#line 2322 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2322 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2322")
end

			yyval91 := yyvs91.item (yyvsp91)
			if yyval91 /= Void and yyvs90.item (yyvsp90) /= Void then
				yyval91.put_first (yyvs90.item (yyvsp90))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp90 := yyvsp90 -1
	yyvs91.put (yyval91, yyvsp91)
end
		end

	yy_do_action_388 is
			--|#line 2331 "et_eiffel_parser.y"
		local
			yyval89: ET_LOCAL_VARIABLE
		do
--|#line 2331 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2331")
end

			yyval89 := ast_factory.new_local_comma_variable (ast_factory.new_local_name_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), dummy_type)
			if yyval89 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_389 is
			--|#line 2340 "et_eiffel_parser.y"
		local
			yyval89: ET_LOCAL_VARIABLE
		do
--|#line 2340 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2340")
end

			yyval89 := ast_factory.new_local_comma_variable (yyvs13.item (yyvsp13), dummy_type)
			if yyval89 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_390 is
			--|#line 2349 "et_eiffel_parser.y"
		local
			yyval90: ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2349 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2349")
end

			yyval90 := ast_factory.new_local_variable (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)))
			if yyval90 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_391 is
			--|#line 2358 "et_eiffel_parser.y"
		local
			yyval90: ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2358 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2358")
end

			yyval90 := ast_factory.new_local_variable_semicolon (ast_factory.new_local_variable (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110))), yyvs22.item (yyvsp22))
			if yyval90 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_392 is
			--|#line 2369 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2369 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2369")
end

add_expression_assertion (yyvs62.item (yyvsp62), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_393 is
			--|#line 2371 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2371 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2371")
end

add_expression_assertion (yyvs62.item (yyvsp62), yyvs22.item (yyvsp22)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_394 is
			--|#line 2373 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2373 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2373")
end

add_tagged_assertion (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_395 is
			--|#line 2375 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2375 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2375")
end

add_tagged_assertion (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyvs22.item (yyvsp22)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_396 is
			--|#line 2377 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2377 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2377")
end

add_expression_assertion (yyvs62.item (yyvsp62), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_397 is
			--|#line 2379 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2379 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2379")
end

add_expression_assertion (yyvs62.item (yyvsp62), yyvs22.item (yyvsp22)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp22 := yyvsp22 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_398 is
			--|#line 2381 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2381 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2381")
end

add_tagged_assertion (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_399 is
			--|#line 2383 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2383 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2383")
end

add_tagged_assertion (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5), yyvs22.item (yyvsp22)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp22 := yyvsp22 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_400 is
			--|#line 2387 "et_eiffel_parser.y"
		local
			yyval103: ET_PRECONDITIONS
		do
--|#line 2387 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2387")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_401 is
			--|#line 2389 "et_eiffel_parser.y"
		local
			yyval103: ET_PRECONDITIONS
		do
--|#line 2389 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2389")
end

yyval103 := new_preconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_402 is
			--|#line 2391 "et_eiffel_parser.y"
		local
			yyval103: ET_PRECONDITIONS
		do
--|#line 2391 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2391")
end

yyval103 := new_preconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_403 is
			--|#line 2393 "et_eiffel_parser.y"
		local
			yyval103: ET_PRECONDITIONS
		do
--|#line 2393 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2393")
end

yyval103 := new_preconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_404 is
			--|#line 2395 "et_eiffel_parser.y"
		local
			yyval103: ET_PRECONDITIONS
		do
--|#line 2395 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2395")
end

yyval103 := new_preconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_405 is
			--|#line 2399 "et_eiffel_parser.y"
		local
			yyval102: ET_POSTCONDITIONS
		do
--|#line 2399 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2399")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_406 is
			--|#line 2401 "et_eiffel_parser.y"
		local
			yyval102: ET_POSTCONDITIONS
		do
--|#line 2401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2401")
end

yyval102 := new_postconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_407 is
			--|#line 2403 "et_eiffel_parser.y"
		local
			yyval102: ET_POSTCONDITIONS
		do
--|#line 2403 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2403")
end

yyval102 := new_postconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_408 is
			--|#line 2405 "et_eiffel_parser.y"
		local
			yyval102: ET_POSTCONDITIONS
		do
--|#line 2405 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2405")
end

yyval102 := new_postconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_409 is
			--|#line 2407 "et_eiffel_parser.y"
		local
			yyval102: ET_POSTCONDITIONS
		do
--|#line 2407 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2407")
end

yyval102 := new_postconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_410 is
			--|#line 2411 "et_eiffel_parser.y"
		local
			yyval86: ET_INVARIANTS
		do
--|#line 2411 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2411")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_411 is
			--|#line 2413 "et_eiffel_parser.y"
		local
			yyval86: ET_INVARIANTS
		do
--|#line 2413 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2413")
end

yyval86 := yyvs86.item (yyvsp86) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs86.put (yyval86, yyvsp86)
end
		end

	yy_do_action_412 is
			--|#line 2417 "et_eiffel_parser.y"
		local
			yyval86: ET_INVARIANTS
		do
--|#line 2417 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2417")
end

yyval86 := new_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_413 is
			--|#line 2419 "et_eiffel_parser.y"
		local
			yyval86: ET_INVARIANTS
		do
--|#line 2419 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2419")
end

yyval86 := new_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_414 is
			--|#line 2423 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2423 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2423")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_415 is
			--|#line 2425 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2425 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2425")
end

yyval92 := yyvs92.item (yyvsp92) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs92.put (yyval92, yyvsp92)
end
		end

	yy_do_action_416 is
			--|#line 2429 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2429 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2429")
end

yyval92 := new_loop_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_417 is
			--|#line 2431 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2431 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2431")
end

yyval92 := new_loop_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_418 is
			--|#line 2435 "et_eiffel_parser.y"
		local
			yyval113: ET_VARIANT
		do
--|#line 2435 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2435")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_419 is
			--|#line 2437 "et_eiffel_parser.y"
		local
			yyval113: ET_VARIANT
		do
--|#line 2437 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2437")
end

yyval113 := ast_factory.new_variant (yyvs2.item (yyvsp2), Void, Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_420 is
			--|#line 2439 "et_eiffel_parser.y"
		local
			yyval113: ET_VARIANT
		do
--|#line 2439 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2439")
end

yyval113 := ast_factory.new_variant (yyvs2.item (yyvsp2), Void, yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_421 is
			--|#line 2441 "et_eiffel_parser.y"
		local
			yyval113: ET_VARIANT
		do
--|#line 2441 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2441")
end

yyval113 := ast_factory.new_variant (yyvs2.item (yyvsp2), ast_factory.new_tag (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_422 is
			--|#line 2447 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2447 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2447")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_423 is
			--|#line 2449 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2449 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2449")
end

yyval45 := yyvs45.item (yyvsp45) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_424 is
			--|#line 2455 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2455 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2455")
end

yyval110 := new_named_type (Void, yyvs13.item (yyvsp13), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_425 is
			--|#line 2457 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2457 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2457")
end

yyval110 := yyvs110.item (yyvsp110) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs110.put (yyval110, yyvsp110)
end
		end

	yy_do_action_426 is
			--|#line 2461 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2461 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2461")
end

yyval110 := new_named_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_427 is
			--|#line 2463 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2463 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2463")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_428 is
			--|#line 2465 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2465 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2465")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_429 is
			--|#line 2467 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2467 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2467")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_430 is
			--|#line 2469 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2469 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2469")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_named_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp5 := yyvsp5 -1
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
			--|#line 2477 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2477 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2477")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_named_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_432 is
			--|#line 2485 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2485 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2485")
end

yyval110 := yyvs88.item (yyvsp88) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_433 is
			--|#line 2487 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2487 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2487")
end

yyval110 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_434 is
			--|#line 2489 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2489 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2489")
end

yyval110 := new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status >= yyContinue then
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

	yy_do_action_435 is
			--|#line 2491 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2491 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2491")
end

yyval110 := new_tuple_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_436 is
			--|#line 2493 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2493 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2493")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_tuple_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_437 is
			--|#line 2501 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2501 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2501")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_tuple_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_438 is
			--|#line 2511 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2511 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2511")
end

yyval110 := new_named_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_439 is
			--|#line 2513 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2513 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2513")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_440 is
			--|#line 2515 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2515 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2515")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_441 is
			--|#line 2517 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2517 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2517")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_442 is
			--|#line 2519 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2519 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2519")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_named_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_443 is
			--|#line 2527 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2527 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2527")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_named_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_444 is
			--|#line 2535 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2535 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2535")
end

yyval110 := yyvs88.item (yyvsp88) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_445 is
			--|#line 2537 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2537 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2537")
end

yyval110 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_446 is
			--|#line 2539 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2539 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2539")
end

yyval110 := new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status >= yyContinue then
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

	yy_do_action_447 is
			--|#line 2541 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2541 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2541")
end

yyval110 := new_tuple_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_448 is
			--|#line 2543 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2543 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2543")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_tuple_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_449 is
			--|#line 2551 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2551 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2551")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_tuple_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_450 is
			--|#line 2561 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2561 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2561")
end

yyval110 := new_named_type (Void, yyvs13.item (yyvsp13), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_451 is
			--|#line 2563 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2563 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2563")
end

yyval110 := new_named_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_452 is
			--|#line 2565 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2565 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2565")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_453 is
			--|#line 2567 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2567 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2567")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_454 is
			--|#line 2569 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2569 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2569")
end

yyval110 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_455 is
			--|#line 2571 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2571 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2571")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_named_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_456 is
			--|#line 2579 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2579 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2579")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_named_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_457 is
			--|#line 2587 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2587 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2587")
end

yyval110 := yyvs88.item (yyvsp88) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_458 is
			--|#line 2589 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2589 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2589")
end

yyval110 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_459 is
			--|#line 2591 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2591 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2591")
end

yyval110 := new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status >= yyContinue then
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

	yy_do_action_460 is
			--|#line 2593 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2593 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2593")
end

yyval110 := new_tuple_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_461 is
			--|#line 2595 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2595 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2595")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_tuple_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_462 is
			--|#line 2603 "et_eiffel_parser.y"
		local
			yyval110: ET_TYPE
		do
--|#line 2603 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2603")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval110 := new_tuple_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_463 is
			--|#line 2613 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 2613 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2613")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_464 is
			--|#line 2617 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2617 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2617")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_465 is
			--|#line 2619 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2619 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2619")
end

yyval27 := yyvs27.item (yyvsp27) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_466 is
			--|#line 2623 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2623 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2623")
end

yyval27 := ast_factory.new_actual_parameters (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_467 is
			--|#line 2626 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2626 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2626")
end

			yyval27 := yyvs27.item (yyvsp27)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_468 is
			--|#line 2634 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2634 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2634")
end

			add_symbol (yyvs23.item (yyvsp23))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_469 is
			--|#line 2641 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2641 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2641")
end

			if yyvs110.item (yyvsp110) /= Void then
				yyval27 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval27 /= Void then
					yyval27.put_first (yyvs110.item (yyvsp110))
				end
			else
				yyval27 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_470 is
			--|#line 2652 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2652 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2652")
end

			yyval27 := yyvs27.item (yyvsp27)
			add_to_actual_parameter_list (yyvs26.item (yyvsp26), yyval27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_471 is
			--|#line 2657 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2657 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2657")
end

			yyval27 := yyvs27.item (yyvsp27)
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_named_type (Void, yyvs13.item (yyvsp13), Void), yyvs5.item (yyvsp5)), yyval27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_472 is
			--|#line 2662 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2662 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2662")
end

			yyval27 := yyvs27.item (yyvsp27)
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_tuple_type (Void, yyvs13.item (yyvsp13), Void), yyvs5.item (yyvsp5)), yyval27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_473 is
			--|#line 2669 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2669 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2669")
end

			increment_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_474 is
			--|#line 2675 "et_eiffel_parser.y"
		local
			yyval26: ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2675 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2675")
end

			yyval26 := ast_factory.new_actual_parameter_comma (yyvs110.item (yyvsp110), yyvs5.item (yyvsp5))
			if yyval26 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_475 is
			--|#line 2684 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2684 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2684")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_476 is
			--|#line 2686 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2686 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2686")
end

yyval27 := yyvs27.item (yyvsp27) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_477 is
			--|#line 2690 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2690 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2690")
end

yyval27 := ast_factory.new_actual_parameters (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_478 is
			--|#line 2693 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2693 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2693")
end

			yyval27 := yyvs27.item (yyvsp27)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_479 is
			--|#line 2699 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2699 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2699")
end

			yyval27 := yyvs27.item (yyvsp27)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_480 is
			--|#line 2707 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2707 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2707")
end

			yyval27 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
			add_to_actual_parameter_list (ast_factory.new_labeled_actual_parameter (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110))), yyval27)
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_481 is
			--|#line 2712 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2712 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2712")
end

			yyval27 := yyvs27.item (yyvsp27)
			add_to_actual_parameter_list (yyvs26.item (yyvsp26), yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_482 is
			--|#line 2717 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2717 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2717")
end

			yyval27 := yyvs27.item (yyvsp27)
			add_to_actual_parameter_list (yyvs26.item (yyvsp26), yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_483 is
			--|#line 2722 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2722 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2722")
end

			yyval27 := yyvs27.item (yyvsp27)
			if yyval27 /= Void then
				if not yyval27.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyval27.first.type), yyval27)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), Void), yyval27)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_484 is
			--|#line 2733 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2733 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2733")
end

			yyval27 := yyvs27.item (yyvsp27)
			if yyval27 /= Void then
				if not yyval27.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyval27.first.type), yyval27)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), Void), yyval27)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_485 is
			--|#line 2744 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2744 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2744")
end

			yyval27 := yyvs27.item (yyvsp27)
			if yyval27 /= Void then
				if not yyval27.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyval27.first.type), yyval27)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), Void), yyval27)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_486 is
			--|#line 2757 "et_eiffel_parser.y"
		local
			yyval26: ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2757 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2757")
end

			yyval26 := ast_factory.new_labeled_actual_parameter (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)))
			if yyval26 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_487 is
			--|#line 2766 "et_eiffel_parser.y"
		local
			yyval26: ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2766 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2766")
end

			yyval26 := ast_factory.new_labeled_actual_parameter_semicolon (ast_factory.new_labeled_actual_parameter (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110))), yyvs22.item (yyvsp22))
			if yyval26 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_488 is
			--|#line 2775 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2775 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2775")
end

yyval88 := ast_factory.new_like_feature (Void, yyvs2.item (yyvsp2), yyvs13.item (yyvsp13)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_489 is
			--|#line 2777 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2777 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2777")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval88 := ast_factory.new_like_feature (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2), yyvs13.item (yyvsp13))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp88 := yyvsp88 + 1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_490 is
			--|#line 2785 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2785 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2785")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval88 := ast_factory.new_like_feature (yyvs24.item (yyvsp24), yyvs2.item (yyvsp2), yyvs13.item (yyvsp13))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp88 := yyvsp88 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_491 is
			--|#line 2793 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2793 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2793")
end

yyval88 := ast_factory.new_like_current (Void, yyvs2.item (yyvsp2), yyvs11.item (yyvsp11)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_492 is
			--|#line 2795 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2795 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2795")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval88 := ast_factory.new_like_current (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2), yyvs11.item (yyvsp11))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp88 := yyvsp88 + 1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_493 is
			--|#line 2803 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2803 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2803")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval88 := ast_factory.new_like_current (yyvs24.item (yyvsp24), yyvs2.item (yyvsp2), yyvs11.item (yyvsp11))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp88 := yyvsp88 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_494 is
			--|#line 2815 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2815 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2815")
end

yyval45 := ast_factory.new_do_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_495 is
			--|#line 2817 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2817 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2817")
end

			yyval45 := ast_factory.new_do_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_496 is
			--|#line 2824 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2824 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2824")
end

yyval45 := ast_factory.new_once_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_497 is
			--|#line 2826 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2826 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2826")
end

			yyval45 := ast_factory.new_once_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_498 is
			--|#line 2833 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2833 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2833")
end

yyval45 := ast_factory.new_then_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_499 is
			--|#line 2835 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2835 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2835")
end

			yyval45 := ast_factory.new_then_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_500 is
			--|#line 2842 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2842 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2842")
end

yyval45 := ast_factory.new_else_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_501 is
			--|#line 2844 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2844 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2844")
end

			yyval45 := ast_factory.new_else_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_502 is
			--|#line 2851 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2851 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2851")
end

yyval45 := ast_factory.new_rescue_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_503 is
			--|#line 2853 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2853 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2853")
end

			yyval45 := ast_factory.new_rescue_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_504 is
			--|#line 2860 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2860 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2860")
end

yyval45 := ast_factory.new_from_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_505 is
			--|#line 2862 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2862 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2862")
end

			yyval45 := ast_factory.new_from_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_506 is
			--|#line 2869 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2869 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2869")
end

yyval45 := ast_factory.new_loop_compound (yyvs2.item (yyvsp2), ast_factory.new_compound (0)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_507 is
			--|#line 2871 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2871 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2871")
end

			yyval45 := ast_factory.new_loop_compound (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45))
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_508 is
			--|#line 2878 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2878 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2878")
end

			if yyvs85.item (yyvsp85) /= Void then
				yyval45 := ast_factory.new_compound (counter_value + 1)
				if yyval45 /= Void then
					yyval45.put_first (yyvs85.item (yyvsp85))
				end
			else
				yyval45 := ast_factory.new_compound (counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_509 is
			--|#line 2889 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2889 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2889")
end

			yyval45 := yyvs45.item (yyvsp45)
			if yyval45 /= Void and yyvs85.item (yyvsp85) /= Void then
				yyval45.put_first (yyvs85.item (yyvsp85))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 -1
	yyvsp85 := yyvsp85 -1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_510 is
			--|#line 2889 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2889 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2889")
end

			if yyvs85.item (yyvsp85) /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_511 is
			--|#line 2910 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2910 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2910")
end

yyval85 := yyvs85.item (yyvsp85) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_512 is
			--|#line 2912 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2912 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2912")
end

yyval85 := yyvs85.item (yyvsp85) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_513 is
			--|#line 2914 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2914 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2914")
end

yyval85 := yyvs85.item (yyvsp85) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_514 is
			--|#line 2916 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2916 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2916")
end

yyval85 := ast_factory.new_assigner_instruction (yyvs37.item (yyvsp37), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_515 is
			--|#line 2918 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2918 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2918")
end

yyval85 := ast_factory.new_assigner_instruction (yyvs35.item (yyvsp35), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_516 is
			--|#line 2920 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2920 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2920")
end

yyval85 := ast_factory.new_assignment (yyvs116.item (yyvsp116), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_517 is
			--|#line 2922 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2922 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2922")
end

yyval85 := ast_factory.new_assignment_attempt (yyvs116.item (yyvsp116), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_518 is
			--|#line 2924 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2924 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2924")
end

yyval85 := yyvs77.item (yyvsp77) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_519 is
			--|#line 2926 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2926 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2926")
end

yyval85 := yyvs84.item (yyvsp84) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_520 is
			--|#line 2928 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2928 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2928")
end

yyval85 := ast_factory.new_loop_instruction (yyvs45.item (yyvsp45 - 1), yyvs92.item (yyvsp92), yyvs113.item (yyvsp113), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_521 is
			--|#line 2935 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2935 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2935")
end

yyval85 := yyvs57.item (yyvsp57) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_522 is
			--|#line 2937 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2937 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2937")
end

yyval85 := new_check_instruction (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_523 is
			--|#line 2939 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2939 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2939")
end

yyval85 := new_check_instruction (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_524 is
			--|#line 2941 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2941 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2941")
end

yyval85 := yyvs19.item (yyvsp19) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_525 is
			--|#line 2943 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2943 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2943")
end

yyval85 := ast_factory.new_null_instruction (yyvs22.item (yyvsp22)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_526 is
			--|#line 2949 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2949 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2949")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5), yyvs116.item (yyvsp116), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_527 is
			--|#line 2951 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2951 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2951")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1), yyvs116.item (yyvsp116), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_528 is
			--|#line 2953 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2953 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2953")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 1), Void, yyvs5.item (yyvsp5), yyvs116.item (yyvsp116), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_529 is
			--|#line 2955 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2955 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2955")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 2), Void, yyvs5.item (yyvsp5 - 1), yyvs116.item (yyvsp116), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_530 is
			--|#line 2959 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2959 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2959")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)), yyvs116.item (yyvsp116), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_531 is
			--|#line 2961 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2961 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2961")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), yyvs116.item (yyvsp116), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_532 is
			--|#line 2963 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2963 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2963")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), Void, yyvs116.item (yyvsp116), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_533 is
			--|#line 2965 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2965 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2965")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), Void, yyvs116.item (yyvsp116), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_534 is
			--|#line 2969 "et_eiffel_parser.y"
		local
			yyval54: ET_CREATE_EXPRESSION
		do
--|#line 2969 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2969")
end

yyval54 := ast_factory.new_create_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)), Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_535 is
			--|#line 2971 "et_eiffel_parser.y"
		local
			yyval54: ET_CREATE_EXPRESSION
		do
--|#line 2971 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2971")
end

yyval54 := ast_factory.new_create_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_536 is
			--|#line 2977 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 2977 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2977")
end

yyval77 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45), Void, Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_537 is
			--|#line 2979 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 2979 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2979")
end

yyval77 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45 - 1), Void, yyvs45.item (yyvsp45), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_538 is
			--|#line 2981 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 2981 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2981")
end

yyval77 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45), yyvs59.item (yyvsp59), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_539 is
			--|#line 2983 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 2983 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2983")
end

yyval77 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45 - 1), yyvs59.item (yyvsp59), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_540 is
			--|#line 2987 "et_eiffel_parser.y"
		local
			yyval59: ET_ELSEIF_PART_LIST
		do
--|#line 2987 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2987")
end

			yyval59 := yyvs59.item (yyvsp59)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs59.put (yyval59, yyvsp59)
end
		end

	yy_do_action_541 is
			--|#line 2994 "et_eiffel_parser.y"
		local
			yyval59: ET_ELSEIF_PART_LIST
		do
--|#line 2994 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2994")
end

			yyval59 := ast_factory.new_elseif_part_list (counter_value)
			if yyval59 /= Void and yyvs58.item (yyvsp58) /= Void then
				yyval59.put_first (yyvs58.item (yyvsp58))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_542 is
			--|#line 3001 "et_eiffel_parser.y"
		local
			yyval59: ET_ELSEIF_PART_LIST
		do
--|#line 3001 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3001")
end

			yyval59 := yyvs59.item (yyvsp59)
			if yyval59 /= Void and yyvs58.item (yyvsp58) /= Void then
				yyval59.put_first (yyvs58.item (yyvsp58))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp58 := yyvsp58 -1
	yyvs59.put (yyval59, yyvsp59)
end
		end

	yy_do_action_543 is
			--|#line 3010 "et_eiffel_parser.y"
		local
			yyval58: ET_ELSEIF_PART
		do
--|#line 3010 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3010")
end

			yyval58 := ast_factory.new_elseif_part (ast_factory.new_conditional (yyvs2.item (yyvsp2), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45))
			if yyval58 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_544 is
			--|#line 3021 "et_eiffel_parser.y"
		local
			yyval84: ET_INSPECT_INSTRUCTION
		do
--|#line 3021 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3021")
end

yyval84 := ast_factory.new_inspect_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs115.item (yyvsp115), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_545 is
			--|#line 3023 "et_eiffel_parser.y"
		local
			yyval84: ET_INSPECT_INSTRUCTION
		do
--|#line 3023 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3023")
end

yyval84 := ast_factory.new_inspect_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs115.item (yyvsp115), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_546 is
			--|#line 3027 "et_eiffel_parser.y"
		local
			yyval115: ET_WHEN_PART_LIST
		do
--|#line 3027 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3027")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_547 is
			--|#line 3029 "et_eiffel_parser.y"
		local
			yyval115: ET_WHEN_PART_LIST
		do
--|#line 3029 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3029")
end

			yyval115 := yyvs115.item (yyvsp115)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs115.put (yyval115, yyvsp115)
end
		end

	yy_do_action_548 is
			--|#line 3036 "et_eiffel_parser.y"
		local
			yyval115: ET_WHEN_PART_LIST
		do
--|#line 3036 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3036")
end

			yyval115 := ast_factory.new_when_part_list (counter_value)
			if yyval115 /= Void and yyvs114.item (yyvsp114) /= Void then
				yyval115.put_first (yyvs114.item (yyvsp114))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_549 is
			--|#line 3043 "et_eiffel_parser.y"
		local
			yyval115: ET_WHEN_PART_LIST
		do
--|#line 3043 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3043")
end

			yyval115 := yyvs115.item (yyvsp115)
			if yyval115 /= Void and yyvs114.item (yyvsp114) /= Void then
				yyval115.put_first (yyvs114.item (yyvsp114))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp114 := yyvsp114 -1
	yyvs115.put (yyval115, yyvsp115)
end
		end

	yy_do_action_550 is
			--|#line 3052 "et_eiffel_parser.y"
		local
			yyval114: ET_WHEN_PART
		do
--|#line 3052 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3052")
end

			yyval114 := ast_factory.new_when_part (yyvs41.item (yyvsp41), yyvs45.item (yyvsp45))
			if yyval114 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_551 is
			--|#line 3061 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3061 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3061")
end

yyval41 := ast_factory.new_choice_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_552 is
			--|#line 3063 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3063 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3063")
end

			yyval41 := yyvs41.item (yyvsp41)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 -1
	yyvsp2 := yyvsp2 -1
	yyvs41.put (yyval41, yyvsp41)
end
		end

	yy_do_action_553 is
			--|#line 3063 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3063 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3063")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_554 is
			--|#line 3076 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3076 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3076")
end

			if yyvs38.item (yyvsp38) /= Void then
				yyval41 := ast_factory.new_choice_list (last_keyword, counter_value + 1)
				if yyval41 /= Void then
					yyval41.put_first (yyvs38.item (yyvsp38))
				end
			else
				yyval41 := ast_factory.new_choice_list (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_555 is
			--|#line 3087 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3087 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3087")
end

			yyval41 := ast_factory.new_choice_list (last_keyword, counter_value)
			if yyval41 /= Void and yyvs40.item (yyvsp40) /= Void then
				yyval41.put_first (yyvs40.item (yyvsp40))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_556 is
			--|#line 3095 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3095 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3095")
end

			yyval41 := yyvs41.item (yyvsp41)
			if yyval41 /= Void and yyvs40.item (yyvsp40) /= Void then
				yyval41.put_first (yyvs40.item (yyvsp40))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp40 := yyvsp40 -1
	yyvs41.put (yyval41, yyvsp41)
end
		end

	yy_do_action_557 is
			--|#line 3104 "et_eiffel_parser.y"
		local
			yyval40: ET_CHOICE_ITEM
		do
--|#line 3104 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3104")
end

			yyval40 := ast_factory.new_choice_comma (yyvs38.item (yyvsp38), yyvs5.item (yyvsp5))
			if yyval40 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_558 is
			--|#line 3113 "et_eiffel_parser.y"
		local
			yyval38: ET_CHOICE
		do
--|#line 3113 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3113")
end

yyval38 := yyvs39.item (yyvsp39) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_559 is
			--|#line 3115 "et_eiffel_parser.y"
		local
			yyval38: ET_CHOICE
		do
--|#line 3115 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3115")
end

yyval38 := ast_factory.new_choice_range (yyvs39.item (yyvsp39 - 1), yyvs5.item (yyvsp5), yyvs39.item (yyvsp39)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_560 is
			--|#line 3119 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 3119 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3119")
end

yyval39 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_561 is
			--|#line 3121 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 3121 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3121")
end

yyval39 := yyvs10.item (yyvsp10) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_562 is
			--|#line 3123 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 3123 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3123")
end

yyval39 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_563 is
			--|#line 3125 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 3125 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3125")
end

yyval39 := yyvs108.item (yyvsp108) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_564 is
			--|#line 3131 "et_eiffel_parser.y"
		local
			yyval57: ET_DEBUG_INSTRUCTION
		do
--|#line 3131 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3131")
end

yyval57 := ast_factory.new_debug_instruction (yyvs95.item (yyvsp95), ast_factory.new_debug_compound (yyvs2.item (yyvsp2 - 1), ast_factory.new_compound (0)), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_565 is
			--|#line 3133 "et_eiffel_parser.y"
		local
			yyval57: ET_DEBUG_INSTRUCTION
		do
--|#line 3133 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3133")
end

			yyval57 := ast_factory.new_debug_instruction (yyvs95.item (yyvsp95), ast_factory.new_debug_compound (yyvs2.item (yyvsp2 - 1), yyvs45.item (yyvsp45)), yyvs2.item (yyvsp2))
			remove_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_566 is
			--|#line 3140 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3140 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3140")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_567 is
			--|#line 3142 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3142 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3142")
end

yyval95 := ast_factory.new_manifest_string_list (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_568 is
			--|#line 3144 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3144 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3144")
end

			yyval95 := yyvs95.item (yyvsp95)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp95 := yyvsp95 -1
	yyvsp5 := yyvsp5 -1
	yyvs95.put (yyval95, yyvsp95)
end
		end

	yy_do_action_569 is
			--|#line 3144 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3144 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3144")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_570 is
			--|#line 3157 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3157 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3157")
end

			if yyvs16.item (yyvsp16) /= Void then
				yyval95 := ast_factory.new_manifest_string_list (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval95 /= Void then
					yyval95.put_first (yyvs16.item (yyvsp16))
				end
			else
				yyval95 := ast_factory.new_manifest_string_list (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_571 is
			--|#line 3168 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3168 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3168")
end

			yyval95 := yyvs95.item (yyvsp95)
			if yyval95 /= Void and yyvs94.item (yyvsp94) /= Void then
				yyval95.put_first (yyvs94.item (yyvsp94))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp94 := yyvsp94 -1
	yyvs95.put (yyval95, yyvsp95)
end
		end

	yy_do_action_572 is
			--|#line 3177 "et_eiffel_parser.y"
		local
			yyval94: ET_MANIFEST_STRING_ITEM
		do
--|#line 3177 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3177")
end

			yyval94 := ast_factory.new_manifest_string_comma (yyvs16.item (yyvsp16), yyvs5.item (yyvsp5))
			if yyval94 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_573 is
			--|#line 3188 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3188 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3188")
end

yyval85 := new_unqualified_call_instruction (yyvs13.item (yyvsp13), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_574 is
			--|#line 3190 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3190 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3190")
end

yyval85 := ast_factory.new_call_instruction (yyvs62.item (yyvsp62), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_575 is
			--|#line 3192 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3192 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3192")
end

yyval85 := ast_factory.new_precursor_instruction (False, yyvs4.item (yyvsp4), Void, yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_576 is
			--|#line 3194 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3194 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3194")
end

yyval85 := ast_factory.new_precursor_instruction (False, yyvs4.item (yyvsp4), ast_factory.new_precursor_class_name (yyvs5.item (yyvsp5 - 1), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_577 is
			--|#line 3196 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3196 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3196")
end

yyval85 := ast_factory.new_static_call_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_578 is
			--|#line 3198 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3198 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3198")
end

yyval85 := ast_factory.new_static_call_instruction (Void, ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_579 is
			--|#line 3202 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3202 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3202")
end

yyval62 := new_unqualified_call_expression (yyvs13.item (yyvsp13), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_580 is
			--|#line 3204 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3204 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3204")
end

yyval62 := ast_factory.new_call_expression (yyvs62.item (yyvsp62), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_581 is
			--|#line 3208 "et_eiffel_parser.y"
		local
			yyval37: ET_CALL_EXPRESSION
		do
--|#line 3208 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3208")
end

yyval37 := ast_factory.new_call_expression (yyvs62.item (yyvsp62), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_582 is
			--|#line 3212 "et_eiffel_parser.y"
		local
			yyval108: ET_STATIC_CALL_EXPRESSION
		do
--|#line 3212 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3212")
end

yyval108 := ast_factory.new_static_call_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_583 is
			--|#line 3214 "et_eiffel_parser.y"
		local
			yyval108: ET_STATIC_CALL_EXPRESSION
		do
--|#line 3214 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3214")
end

yyval108 := ast_factory.new_static_call_expression (Void, ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_584 is
			--|#line 3218 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3218 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3218")
end

yyval62 := ast_factory.new_precursor_expression (False, yyvs4.item (yyvsp4), Void, yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_585 is
			--|#line 3220 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3220 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3220")
end

yyval62 := ast_factory.new_precursor_expression (False, yyvs4.item (yyvsp4), ast_factory.new_precursor_class_name (yyvs5.item (yyvsp5 - 1), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_586 is
			--|#line 3224 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3224 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3224")
end

yyval62 := new_unqualified_call_expression (yyvs13.item (yyvsp13), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_587 is
			--|#line 3226 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3226 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3226")
end

yyval62 := yyvs18.item (yyvsp18) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_588 is
			--|#line 3228 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3228 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3228")
end

yyval62 := yyvs11.item (yyvsp11) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_589 is
			--|#line 3230 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3230 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3230")
end

yyval62 := yyvs98.item (yyvsp98) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_590 is
			--|#line 3232 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3232 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3232")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_591 is
			--|#line 3234 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3234 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3234")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval62 := yyvs35.item (yyvsp35)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_592 is
			--|#line 3242 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3242 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3242")
end

yyval62 := yyvs108.item (yyvsp108) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_593 is
			--|#line 3244 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3244 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3244")
end

yyval62 := ast_factory.new_call_expression (yyvs62.item (yyvsp62), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_594 is
			--|#line 3250 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3250 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3250")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_595 is
			--|#line 3252 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3252 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3252")
end

yyval25 := ast_factory.new_actual_arguments (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_596 is
			--|#line 3254 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3254 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3254")
end

			yyval25 := yyvs25.item (yyvsp25)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 -1
	yyvsp5 := yyvsp5 -1
	yyvs25.put (yyval25, yyvsp25)
end
		end

	yy_do_action_597 is
			--|#line 3254 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3254 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3254")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_598 is
			--|#line 3267 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3267 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3267")
end

			if yyvs62.item (yyvsp62) /= Void then
				yyval25 := ast_factory.new_actual_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval25 /= Void then
					yyval25.put_first (yyvs62.item (yyvsp62))
				end
			else
				yyval25 := ast_factory.new_actual_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_599 is
			--|#line 3278 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3278 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3278")
end

			yyval25 := ast_factory.new_actual_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval25 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval25.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_600 is
			--|#line 3286 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3286 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3286")
end

			yyval25 := yyvs25.item (yyvsp25)
			if yyval25 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval25.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp63 := yyvsp63 -1
	yyvs25.put (yyval25, yyvsp25)
end
		end

	yy_do_action_601 is
			--|#line 3295 "et_eiffel_parser.y"
		local
			yyval63: ET_EXPRESSION_ITEM
		do
--|#line 3295 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3295")
end

			yyval63 := ast_factory.new_expression_comma (yyvs62.item (yyvsp62), yyvs5.item (yyvsp5))
			if yyval63 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_602 is
			--|#line 3304 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3304 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3304")
end

yyval62 := new_feature_address (yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_603 is
			--|#line 3306 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3306 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3306")
end

yyval62 := ast_factory.new_current_address (yyvs5.item (yyvsp5), yyvs11.item (yyvsp11)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_604 is
			--|#line 3308 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3308 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3308")
end

yyval62 := ast_factory.new_result_address (yyvs5.item (yyvsp5), yyvs18.item (yyvsp18)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_605 is
			--|#line 3310 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3310 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3310")
end

yyval62 := ast_factory.new_expression_address (yyvs5.item (yyvsp5), yyvs98.item (yyvsp98)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_606 is
			--|#line 3317 "et_eiffel_parser.y"
		local
			yyval116: ET_WRITABLE
		do
--|#line 3317 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3317")
end

yyval116 := new_writable (yyvs13.item (yyvsp13)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_607 is
			--|#line 3319 "et_eiffel_parser.y"
		local
			yyval116: ET_WRITABLE
		do
--|#line 3319 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3319")
end

yyval116 := yyvs18.item (yyvsp18) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_608 is
			--|#line 3325 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3325 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3325")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_609 is
			--|#line 3327 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3327 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3327")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_610 is
			--|#line 3331 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3331 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3331")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_free_operator (yyvs12.item (yyvsp12)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp12 := yyvsp12 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_611 is
			--|#line 3333 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3333 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3333")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_plus_operator (yyvs20.item (yyvsp20)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_612 is
			--|#line 3335 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3335 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3335")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_minus_operator (yyvs20.item (yyvsp20)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_613 is
			--|#line 3337 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3337 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3337")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_614 is
			--|#line 3339 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3339 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3339")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_615 is
			--|#line 3341 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3341 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3341")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_616 is
			--|#line 3343 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3343 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3343")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_617 is
			--|#line 3345 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3345 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3345")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_618 is
			--|#line 3347 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3347 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3347")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_619 is
			--|#line 3349 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3349 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3349")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_620 is
			--|#line 3351 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3351 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3351")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_621 is
			--|#line 3353 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3353 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3353")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_622 is
			--|#line 3355 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3355 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3355")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_623 is
			--|#line 3357 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3357 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3357")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_624 is
			--|#line 3359 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3359 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3359")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_625 is
			--|#line 3361 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3361 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3361")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_and_then_operator (yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvsp2 := yyvsp2 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_626 is
			--|#line 3363 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3363 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3363")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_or_else_operator (yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvsp2 := yyvsp2 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_627 is
			--|#line 3365 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3365 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3365")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_628 is
			--|#line 3367 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3367 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3367")
end

yyval62 := ast_factory.new_equality_expression (yyvs62.item (yyvsp62 - 1), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_629 is
			--|#line 3369 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3369 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3369")
end

yyval62 := ast_factory.new_equality_expression (yyvs62.item (yyvsp62 - 1), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_630 is
			--|#line 3373 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3373 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3373")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_631 is
			--|#line 3375 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3375 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3375")
end

yyval62 := yyvs35.item (yyvsp35) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_632 is
			--|#line 3377 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3377 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3377")
end

yyval62 := yyvs54.item (yyvsp54) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_633 is
			--|#line 3379 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3379 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3379")
end

yyval62 := yyvs96.item (yyvsp96) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_634 is
			--|#line 3381 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3381 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3381")
end

yyval62 := new_prefix_plus_expression (yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_635 is
			--|#line 3383 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3383 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3383")
end

yyval62 := new_prefix_minus_expression (yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_636 is
			--|#line 3385 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3385 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3385")
end

yyval62 := ast_factory.new_prefix_expression (yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_637 is
			--|#line 3387 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3387 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3387")
end

yyval62 := ast_factory.new_prefix_expression (ast_factory.new_prefix_free_operator (yyvs12.item (yyvsp12)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_638 is
			--|#line 3389 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3389 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3389")
end

yyval62 := ast_factory.new_old_expression (yyvs2.item (yyvsp2), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_639 is
			--|#line 3391 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3391 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3391")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval62 := new_object_test (yyvs5.item (yyvsp5 - 2), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp5 := yyvsp5 -3
	yyvsp13 := yyvsp13 -1
	yyvsp110 := yyvsp110 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_640 is
			--|#line 3401 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3401")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_641 is
			--|#line 3403 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3403 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3403")
end

yyval62 := yyvs108.item (yyvsp108) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_642 is
			--|#line 3405 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3405 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3405")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_643 is
			--|#line 3407 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3407 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3407")
end

yyval62 := yyvs18.item (yyvsp18) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_644 is
			--|#line 3409 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3409 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3409")
end

yyval62 := yyvs11.item (yyvsp11) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_645 is
			--|#line 3411 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3411 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3411")
end

yyval62 := yyvs98.item (yyvsp98) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_646 is
			--|#line 3413 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3413 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3413")
end

yyval62 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_647 is
			--|#line 3415 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3415 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3415")
end

yyval62 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_648 is
			--|#line 3417 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3417 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3417")
end

yyval62 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_649 is
			--|#line 3419 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3419 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3419")
end

yyval62 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_650 is
			--|#line 3421 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3421 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3421")
end

yyval62 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_651 is
			--|#line 3423 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3423 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3423")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_652 is
			--|#line 3425 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3425 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3425")
end

yyval62 := yyvs36.item (yyvsp36) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_653 is
			--|#line 3427 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3427 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3427")
end

yyval62 := yyvs83.item (yyvsp83) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_654 is
			--|#line 3429 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3429 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3429")
end

yyval62 := yyvs21.item (yyvsp21) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_655 is
			--|#line 3431 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3431 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3431")
end

yyval62 := yyvs10.item (yyvsp10) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_656 is
			--|#line 3433 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3433 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3433")
end

yyval62 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_657 is
			--|#line 3435 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3435 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3435")
end

yyval62 := new_once_manifest_string (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_658 is
			--|#line 3450 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3450 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3450")
end

yyval62 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_659 is
			--|#line 3452 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3452 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3452")
end

yyval62 := yyvs93.item (yyvsp93) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_660 is
			--|#line 3454 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3454 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3454")
end

yyval62 := yyvs109.item (yyvsp109) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_661 is
			--|#line 3456 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3456 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3456")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_662 is
			--|#line 3460 "et_eiffel_parser.y"
		local
			yyval35: ET_BRACKET_EXPRESSION
		do
--|#line 3460 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3460")
end

			yyval35 := ast_factory.new_bracket_expression (yyvs62.item (yyvsp62), yyvs23.item (yyvsp23), yyvs34.item (yyvsp34))
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp62 := yyvsp62 -1
	yyvsp23 := yyvsp23 -1
	yyvsp34 := yyvsp34 -1
	yyvs35.put (yyval35, yyvsp35)
end
		end

	yy_do_action_663 is
			--|#line 3460 "et_eiffel_parser.y"
		local
			yyval35: ET_BRACKET_EXPRESSION
		do
--|#line 3460 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3460")
end

			add_symbol (yyvs23.item (yyvsp23))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_664 is
			--|#line 3473 "et_eiffel_parser.y"
		local
			yyval34: ET_BRACKET_ARGUMENT_LIST
		do
--|#line 3473 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3473")
end

			if yyvs62.item (yyvsp62) /= Void then
				yyval34 := ast_factory.new_bracket_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval34 /= Void then
					yyval34.put_first (yyvs62.item (yyvsp62))
				end
			else
				yyval34 := ast_factory.new_bracket_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_665 is
			--|#line 3484 "et_eiffel_parser.y"
		local
			yyval34: ET_BRACKET_ARGUMENT_LIST
		do
--|#line 3484 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3484")
end

			yyval34 := ast_factory.new_bracket_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval34 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval34.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_666 is
			--|#line 3492 "et_eiffel_parser.y"
		local
			yyval34: ET_BRACKET_ARGUMENT_LIST
		do
--|#line 3492 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3492")
end

			yyval34 := yyvs34.item (yyvsp34)
			if yyval34 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval34.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp63 := yyvsp63 -1
	yyvs34.put (yyval34, yyvsp34)
end
		end

	yy_do_action_667 is
			--|#line 3501 "et_eiffel_parser.y"
		local
			yyval98: ET_PARENTHESIZED_EXPRESSION
		do
--|#line 3501 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3501")
end

			remove_symbol
			remove_counter
		 	yyval98 := ast_factory.new_parenthesized_expression (yyvs5.item (yyvsp5 - 1), yyvs62.item (yyvsp62), yyvs5.item (yyvsp5))
		 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_668 is
			--|#line 3509 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3509 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3509")
end

yyval62 := ast_factory.new_manifest_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_669 is
			--|#line 3513 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3513 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3513")
end

yyval93 := ast_factory.new_manifest_array (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_670 is
			--|#line 3515 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3515 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3515")
end

			yyval93 := yyvs93.item (yyvsp93)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp93 := yyvsp93 -1
	yyvsp5 := yyvsp5 -1
	yyvs93.put (yyval93, yyvsp93)
end
		end

	yy_do_action_671 is
			--|#line 3515 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3515 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3515")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_672 is
			--|#line 3528 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3528 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3528")
end

			if yyvs62.item (yyvsp62) /= Void then
				yyval93 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval93 /= Void then
					yyval93.put_first (yyvs62.item (yyvsp62))
				end
			else
				yyval93 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_673 is
			--|#line 3539 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3539 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3539")
end

			yyval93 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval93 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval93.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_674 is
			--|#line 3547 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3547 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3547")
end

			yyval93 := yyvs93.item (yyvsp93)
			if yyval93 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval93.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp63 := yyvsp63 -1
	yyvs93.put (yyval93, yyvsp93)
end
		end

	yy_do_action_675 is
			--|#line 3556 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3556 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3556")
end

yyval96 := ast_factory.new_manifest_tuple (yyvs23.item (yyvsp23), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_676 is
			--|#line 3558 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3558 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3558")
end

			yyval96 := yyvs96.item (yyvsp96)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 -1
	yyvsp23 := yyvsp23 -1
	yyvs96.put (yyval96, yyvsp96)
end
		end

	yy_do_action_677 is
			--|#line 3558 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3558 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3558")
end

			add_symbol (yyvs23.item (yyvsp23))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_678 is
			--|#line 3571 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3571 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3571")
end

			if yyvs62.item (yyvsp62) /= Void then
				yyval96 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval96 /= Void then
					yyval96.put_first (yyvs62.item (yyvsp62))
				end
			else
				yyval96 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_679 is
			--|#line 3582 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3582 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3582")
end

			yyval96 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval96 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval96.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_680 is
			--|#line 3590 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3590 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3590")
end

			yyval96 := yyvs96.item (yyvsp96)
			if yyval96 /= Void and yyvs63.item (yyvsp63) /= Void then
				yyval96.put_first (yyvs63.item (yyvsp63))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp63 := yyvsp63 -1
	yyvs96.put (yyval96, yyvsp96)
end
		end

	yy_do_action_681 is
			--|#line 3599 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3599 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3599")
end

yyval109 := ast_factory.new_strip_expression (yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_682 is
			--|#line 3601 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3601 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3601")
end

			yyval109 := yyvs109.item (yyvsp109)
			remove_keyword
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp109 := yyvsp109 -1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -1
	yyvs109.put (yyval109, yyvsp109)
end
		end

	yy_do_action_683 is
			--|#line 3601 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3601 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3601")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_684 is
			--|#line 3616 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3616 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3616")
end

			if yyvs69.item (yyvsp69) /= Void then
				yyval109 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval109 /= Void then
					yyval109.put_first (yyvs69.item (yyvsp69))
				end
			else
				yyval109 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_685 is
			--|#line 3627 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3627 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3627")
end

			yyval109 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval109 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval109.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_686 is
			--|#line 3635 "et_eiffel_parser.y"
		local
			yyval109: ET_STRIP_EXPRESSION
		do
--|#line 3635 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3635")
end

			yyval109 := yyvs109.item (yyvsp109)
			if yyval109 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval109.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyvs109.put (yyval109, yyvsp109)
end
		end

	yy_do_action_687 is
			--|#line 3644 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3644 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3644")
end

yyval46 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_688 is
			--|#line 3646 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3646 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3646")
end

yyval46 := yyvs10.item (yyvsp10) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_689 is
			--|#line 3648 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3648 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3648")
end

yyval46 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_690 is
			--|#line 3650 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3650 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3650")
end

yyval46 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_691 is
			--|#line 3652 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3652 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3652")
end

yyval46 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_692 is
			--|#line 3654 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3654 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3654")
end

yyval46 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_693 is
			--|#line 3660 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3660 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3660")
end

yyval36 := ast_factory.new_call_agent (yyvs3.item (yyvsp3), Void, yyvs69.item (yyvsp69), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_694 is
			--|#line 3662 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3662 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3662")
end

yyval36 := ast_factory.new_call_agent (yyvs3.item (yyvsp3), yyvs31.item (yyvsp31), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_695 is
			--|#line 3666 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3666 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3666")
end

yyval83 := ast_factory.new_do_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_696 is
			--|#line 3674 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3674 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3674")
end

yyval83 := ast_factory.new_do_function_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_697 is
			--|#line 3678 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3678 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3678")
end

yyval83 := ast_factory.new_once_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_698 is
			--|#line 3682 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3682 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3682")
end

yyval83 := ast_factory.new_once_function_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_699 is
			--|#line 3686 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3686 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3686")
end

yyval83 := ast_factory.new_external_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
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

	yy_do_action_700 is
			--|#line 3690 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3690 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3690")
end

yyval83 := ast_factory.new_external_function_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs110.item (yyvsp110)), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp110 := yyvsp110 -1
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_701 is
			--|#line 3694 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3694 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3694")
end

yyval83 := ast_factory.new_do_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_702 is
			--|#line 3698 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3698 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3698")
end

yyval83 := ast_factory.new_do_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_703 is
			--|#line 3702 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3702 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3702")
end

yyval83 := ast_factory.new_once_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_704 is
			--|#line 3706 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3706 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3706")
end

yyval83 := ast_factory.new_once_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), yyvs103.item (yyvsp103), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs102.item (yyvsp102), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp103 := yyvsp103 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp102 := yyvsp102 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_705 is
			--|#line 3710 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3710 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3710")
end

yyval83 := ast_factory.new_external_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
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

	yy_do_action_706 is
			--|#line 3714 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3714 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3714")
end

yyval83 := ast_factory.new_external_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), yyvs103.item (yyvsp103), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs102.item (yyvsp102), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp102 := yyvsp102 -1
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_707 is
			--|#line 3720 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 3720 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3720")
end

			yyval73 := yyvs73.item (yyvsp73)
			set_start_closure (yyval73)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_708 is
			--|#line 3727 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 3727 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3727")
end

set_start_closure (Void) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_709 is
			--|#line 3731 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 3731 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3731")
end

				-- Clean up after the inline agent has been parsed.
			set_end_closure
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_710 is
			--|#line 3738 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3738 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3738")
end

yyval31 := new_agent_identifier_target (yyvs13.item (yyvsp13)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_711 is
			--|#line 3740 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3740 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3740")
end

yyval31 := yyvs98.item (yyvsp98) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_712 is
			--|#line 3742 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3742 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3742")
end

yyval31 := yyvs18.item (yyvsp18) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_713 is
			--|#line 3744 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3744 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3744")
end

yyval31 := yyvs11.item (yyvsp11) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_714 is
			--|#line 3746 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3746 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3746")
end

yyval31 := ast_factory.new_agent_open_target (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_715 is
			--|#line 3750 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3750 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3750")
end


if yy_parsing_status >= yyContinue then
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

	yy_do_action_716 is
			--|#line 3752 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3752 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3752")
end

yyval30 := ast_factory.new_agent_argument_operands (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_717 is
			--|#line 3754 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3754 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3754")
end

			yyval30 := yyvs30.item (yyvsp30)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 -1
	yyvsp5 := yyvsp5 -1
	yyvs30.put (yyval30, yyvsp30)
end
		end

	yy_do_action_718 is
			--|#line 3754 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3754 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3754")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_719 is
			--|#line 3767 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3767 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3767")
end

			if yyvs28.item (yyvsp28) /= Void then
				yyval30 := ast_factory.new_agent_argument_operands (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval30 /= Void then
					yyval30.put_first (yyvs28.item (yyvsp28))
				end
			else
				yyval30 := ast_factory.new_agent_argument_operands (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_720 is
			--|#line 3778 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3778 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3778")
end

			yyval30 := ast_factory.new_agent_argument_operands (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval30 /= Void and yyvs29.item (yyvsp29) /= Void then
				yyval30.put_first (yyvs29.item (yyvsp29))
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_721 is
			--|#line 3786 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3786 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3786")
end

			yyval30 := yyvs30.item (yyvsp30)
			if yyval30 /= Void and yyvs29.item (yyvsp29) /= Void then
				yyval30.put_first (yyvs29.item (yyvsp29))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp29 := yyvsp29 -1
	yyvs30.put (yyval30, yyvsp30)
end
		end

	yy_do_action_722 is
			--|#line 3795 "et_eiffel_parser.y"
		local
			yyval29: ET_AGENT_ARGUMENT_OPERAND_ITEM
		do
--|#line 3795 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3795")
end

			yyval29 := ast_factory.new_agent_argument_operand_comma (yyvs28.item (yyvsp28), yyvs5.item (yyvsp5))
			if yyval29 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
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

	yy_do_action_723 is
			--|#line 3804 "et_eiffel_parser.y"
		local
			yyval28: ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 3804 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3804")
end

yyval28 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_724 is
			--|#line 3806 "et_eiffel_parser.y"
		local
			yyval28: ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 3806 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3806")
end

yyval28 := yyvs24.item (yyvsp24) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_725 is
			--|#line 3808 "et_eiffel_parser.y"
		local
			yyval28: ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 3808 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3808")
end

yyval28 := ast_factory.new_agent_typed_open_argument (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5), yyvs24.item (yyvsp24)) 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_726 is
			--|#line 3814 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3814 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3814")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_727 is
			--|#line 3816 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3816 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3816")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_728 is
			--|#line 3818 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3818 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3818")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_729 is
			--|#line 3820 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3820 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3820")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_730 is
			--|#line 3822 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3822 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3822")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_731 is
			--|#line 3824 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3824 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3824")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_732 is
			--|#line 3826 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3826 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3826")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_733 is
			--|#line 3828 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3828 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3828")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_734 is
			--|#line 3830 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3830 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3830")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_735 is
			--|#line 3832 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3832 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3832")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_736 is
			--|#line 3834 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3834 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3834")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_737 is
			--|#line 3836 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3836 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3836")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_738 is
			--|#line 3838 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3838 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3838")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_739 is
			--|#line 3840 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3840 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3840")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_740 is
			--|#line 3842 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3842 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3842")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_741 is
			--|#line 3844 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3844 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3844")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_742 is
			--|#line 3846 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3846 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3846")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_743 is
			--|#line 3848 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3848 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3848")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_744 is
			--|#line 3850 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3850 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3850")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_745 is
			--|#line 3852 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3852 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3852")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_746 is
			--|#line 3854 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3854 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3854")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_747 is
			--|#line 3856 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3856 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3856")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_748 is
			--|#line 3858 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3858 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3858")
end

abort 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_749 is
			--|#line 3862 "et_eiffel_parser.y"
		local
			yyval10: ET_CHARACTER_CONSTANT
		do
--|#line 3862 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3862")
end

yyval10 := yyvs10.item (yyvsp10) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs10.put (yyval10, yyvsp10)
end
		end

	yy_do_action_750 is
			--|#line 3864 "et_eiffel_parser.y"
		local
			yyval10: ET_CHARACTER_CONSTANT
		do
--|#line 3864 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3864")
end

abort 
if yy_parsing_status >= yyContinue then
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

	yy_do_action_751 is
			--|#line 3868 "et_eiffel_parser.y"
		local
			yyval8: ET_BOOLEAN_CONSTANT
		do
--|#line 3868 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3868")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs8.put (yyval8, yyvsp8)
end
		end

	yy_do_action_752 is
			--|#line 3870 "et_eiffel_parser.y"
		local
			yyval8: ET_BOOLEAN_CONSTANT
		do
--|#line 3870 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3870")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs8.put (yyval8, yyvsp8)
end
		end

	yy_do_action_753 is
			--|#line 3874 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3874 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3874")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_754 is
			--|#line 3876 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3876 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3876")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_755 is
			--|#line 3880 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3880 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3880")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_756 is
			--|#line 3882 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3882 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3882")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_757 is
			--|#line 3886 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3886 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3886")
end

			yyval14 := yyvs14.item (yyvsp14)
			yyval14.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_758 is
			--|#line 3891 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3891 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3891")
end

			yyval14 := yyvs14.item (yyvsp14)
			yyval14.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_759 is
			--|#line 3898 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3898 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3898")
end

			yyval14 := yyvs14.item (yyvsp14)
			yyval14.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_760 is
			--|#line 3905 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3905 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3905")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_761 is
			--|#line 3907 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3907 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3907")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_762 is
			--|#line 3911 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3911 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3911")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_763 is
			--|#line 3913 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3913 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3913")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_764 is
			--|#line 3917 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3917 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3917")
end

			yyval17 := yyvs17.item (yyvsp17)
			yyval17.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_765 is
			--|#line 3922 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3922 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3922")
end

			yyval17 := yyvs17.item (yyvsp17)
			yyval17.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_766 is
			--|#line 3929 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 3929 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3929")
end

			yyval17 := yyvs17.item (yyvsp17)
			yyval17.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs110.item (yyvsp110), yyvs5.item (yyvsp5)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp110 := yyvsp110 -1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_767 is
			--|#line 3936 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 3936 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3936")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_768 is
			--|#line 3938 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 3938 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3938")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_769 is
			--|#line 3940 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 3940 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3940")
end

				-- TO DO: reserved word `BIT'
			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_770 is
			--|#line 3949 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 3949 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3949")
end

add_counter 
if yy_parsing_status >= yyContinue then
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
			when 1382 then
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
			    0,  339,  339,  168,  340,  340,  341,  167,  167,  167,
			  167,  167,  167,  343,  167,  167,  342,  251,  251,  344,
			  252,  252,  253,  253,  253,  345,  253,  346,  254,  256,
			  256,  255,  255,  259,  259,  257,  257,  257,  257,  257,
			  257,  257,  257,  257,  258,  166,  166,  166,  166,  272,
			  272,  273,  273,  246,  246,  246,  348,  247,  247,  245,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  192,
			  192,  349,  193,  193,  193,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  187,

			  187,  186,  186,  188,  188,  188,  188,  183,  190,  190,
			  189,  189,  189,  191,  191,  191,  191,  191,  191,  184,
			  185,  299,  299,  304,  304,  304,  305,  352,  301,  301,
			  301,  301,  301,  301,  302,  306,  306,  306,  306,  306,
			  307,  307,  307,  307,  303,  303,  320,  320,  353,  321,
			  321,  321,  318,  319,  212,  212,  354,  213,  213,  214,
			  214,  355,  211,  211,  211,  356,  211,  232,  232,  232,
			  171,  357,  171,  172,  172,  172,  172,  169,  170,  280,
			  280,  358,  281,  281,  278,  278,  359,  279,  279,  276,
			  276,  360,  277,  277,  275,  275,  275,  234,  205,  205,

			  204,  206,  206,  361,  202,  202,  202,  362,  202,  363,
			  202,  202,  202,  364,  202,  365,  203,  203,  203,  235,
			  198,  198,  199,  366,  200,  200,  200,  197,  196,  196,
			  332,  332,  367,  333,  333,  331,  230,  230,  229,  231,
			  231,  227,  227,  228,  228,  368,  368,  368,  368,  312,
			  312,  312,  312,  312,  312,  310,  310,  310,  310,  310,
			  310,  313,  313,  313,  313,  313,  313,  313,  313,  313,
			  313,  313,  313,  313,  313,  313,  313,  313,  313,  313,
			  313,  313,  313,  311,  311,  311,  311,  311,  311,  311,
			  311,  274,  274,  322,  322,  226,  226,  154,  154,  233,

			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  225,  225,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  243,  240,  240,  326,  241,  241,
			  241,  241,  241,  241,  237,  236,  238,  239,  287,  287,
			  287,  369,  288,  288,  288,  288,  288,  288,  284,  283,
			  285,  286,  370,  370,  370,  370,  370,  370,  370,  370,

			  309,  309,  309,  309,  309,  308,  308,  308,  308,  308,
			  271,  271,  270,  270,  290,  290,  289,  289,  334,  334,
			  334,  334,  174,  174,  327,  327,  328,  328,  328,  328,
			  328,  328,  328,  328,  328,  328,  328,  328,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  330,  330,  330,  330,  330,  330,  330,  330,  330,  330,
			  330,  330,  330,  249,  142,  142,  144,  144,  350,  143,
			  143,  143,  143,  351,  139,  145,  145,  146,  146,  146,
			  147,  147,  147,  147,  147,  147,  140,  141,  282,  282,
			  282,  282,  282,  282,  175,  175,  176,  176,  177,  177,

			  178,  178,  179,  179,  180,  180,  181,  181,  173,  173,
			  371,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  263,  263,  263,  263,
			  265,  265,  265,  265,  201,  201,  250,  250,  250,  250,
			  209,  210,  210,  208,  261,  261,  337,  337,  336,  336,
			  335,  164,  164,  372,  165,  165,  165,  163,  161,  161,
			  162,  162,  162,  162,  207,  207,  296,  296,  296,  373,
			  295,  295,  294,  264,  264,  264,  264,  264,  264,  220,
			  220,  159,  323,  323,  217,  217,  216,  216,  216,  216,
			  216,  216,  216,  216,  137,  137,  137,  374,  138,  138,

			  138,  224,  219,  219,  219,  219,  338,  338,  215,  215,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  157,  375,  156,  156,  156,  300,  218,  291,
			  291,  376,  292,  292,  292,  297,  297,  377,  298,  298,
			  298,  324,  324,  378,  325,  325,  325,  182,  182,  182,
			  182,  182,  182,  158,  158,  260,  260,  260,  260,  260,

			  260,  260,  260,  260,  260,  260,  260,  242,  379,  380,
			  152,  152,  152,  152,  152,  150,  150,  150,  381,  151,
			  151,  151,  149,  148,  148,  148,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  293,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  293,  293,  293,  293,  160,
			  160,  155,  155,  266,  266,  268,  268,  269,  269,  267,
			  314,  314,  316,  316,  317,  317,  315,  248,  248,  248,
			  347, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1384)
			yytypes1_template_1 (an_array)
			yytypes1_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytypes1_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
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
			    2,    2,   13,   24,    5,   13,   13,   13,    2,    2,
			    2,    2,   13,   88,  110,  110,    5,   96,    2,   82,
			   13,   13,    5,    5,   76,    5,   56,    1,    2,    2,
			   53,   56,   67,   78,   86,    1,    1,   13,   99,   99,
			  100,  101,  101,   13,   13,   13,   13,    2,   13,   13,
			    2,   13,   23,   27,   27,    1,   20,   20,   13,   14,
			   13,   13,   13,   11,   13,   23,   27,    1,    5,   20,
			   20,    5,    5,    5,    2,   21,   18,   17,   15,   14,
			   12,   11,    7,    5,    4,    3,    2,    2,    2,    8,

			   35,   36,   10,   54,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   63,   13,   83,   14,   93,   16,   96,
			   96,   98,   17,  108,  109,    5,    5,    5,   24,    5,
			   13,   13,    2,    2,    2,   50,   13,   88,   53,   53,
			    2,    2,   55,   56,   53,   62,   13,    1,   67,   67,
			    1,   53,   86,   86,    2,    1,   78,    2,   56,   66,
			   66,   67,   27,   27,   22,  101,  101,   22,  101,  101,
			  101,  101,   27,   11,   13,   27,   27,   11,   13,   27,
			    5,   24,    5,   13,   13,   13,    2,    2,    2,   26,
			   26,   26,   27,   27,   13,   13,   88,  110,  110,   27,

			   27,   27,    5,   13,   13,   13,   27,    5,   62,   62,
			   18,   11,    2,    2,   69,   13,   98,   13,  110,   62,
			   62,   62,    5,   93,    5,    5,   25,    5,    5,   18,
			   11,   31,   69,   73,   73,   13,   98,    5,    1,    5,
			   16,    5,    5,    5,   20,   20,    5,    5,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   15,   15,   15,
			   15,   12,    5,   23,    5,   96,   25,   62,   50,   50,
			   13,   13,   13,   13,   23,   48,   48,    1,   13,   14,
			   13,   13,   13,    2,   49,   23,   48,   48,    1,   67,
			    5,   44,   55,   44,   55,   56,   51,   52,   53,   69,

			   22,    5,   62,   13,   86,   67,   78,    1,   42,    2,
			   44,   67,    2,   64,   69,   13,  104,  104,  105,  105,
			    1,    2,    2,    2,    2,    2,    2,   61,   87,   87,
			   87,  107,   13,   13,   13,   13,    5,   27,    5,   13,
			   14,    5,   13,   13,   13,   27,   13,   13,   13,   27,
			   27,    5,   27,    5,    5,    5,    5,   13,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,    5,    5,

			   62,   63,   93,    5,   25,   13,    5,  110,    5,    5,
			   30,    5,    2,  103,   71,   71,   72,   72,   73,   13,
			    5,  103,    5,  109,  110,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			    2,   62,    2,   62,   62,   13,   35,    5,   49,   49,
			   48,   48,   48,   48,    5,   24,    5,   13,   13,   13,
			    2,    2,    2,   47,   47,   47,   48,   48,   50,   50,
			   13,   13,   88,   48,   48,   48,    2,   49,    5,   13,
			   13,   13,   48,   86,    5,   44,   55,   55,   70,   13,
			   55,   55,   56,    5,   53,    5,    5,   22,   22,    5,

			   78,   86,    2,    1,    1,   42,    1,   64,  104,  105,
			    5,    5,    2,   73,   73,    2,  104,  105,    5,    2,
			   32,  104,  105,   87,   87,  107,   87,   61,   87,   87,
			    2,   87,   87,   87,   87,   61,   61,   27,   27,   27,
			   27,    1,    1,    1,   27,   27,   27,    5,    5,  110,
			    1,    1,   25,  110,    5,   14,   17,    5,    5,   93,
			   25,   62,   63,    5,    5,   69,    5,   30,  110,    2,
			    1,    2,    2,   91,   73,   13,   73,    5,   73,    5,
			   73,    5,    5,  110,    2,   91,   69,   70,  109,    5,
			   62,   62,   25,   34,   62,   63,   13,   13,   13,   13,

			    5,   48,    5,   13,   14,    5,   13,   13,   13,   48,
			   13,   13,   13,   48,   48,    5,    5,    5,   48,   49,
			   70,   13,    5,    5,   78,   43,   43,   44,   13,   55,
			   55,    5,   55,    5,  112,  112,   22,    2,   78,    1,
			   42,    1,    5,  104,  105,  104,  105,  110,    5,    2,
			   78,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   69,   70,   87,   87,   69,  106,  106,
			  107,   87,   22,   44,   60,   61,   87,   87,    2,   87,
			   27,   27,   27,   27,   27,    1,    1,   22,    5,    5,

			   13,    5,    5,   25,   25,   30,   24,    5,   28,   29,
			   30,   62,  103,    1,   91,   16,    2,    2,   45,   45,
			  110,  103,   16,   45,   45,    5,    5,    5,  109,    5,
			    5,    5,   34,   48,   48,   48,   48,    1,    1,    1,
			   48,   48,   48,    5,    5,   50,    2,   49,    2,    1,
			    1,    2,    5,   44,    5,   44,    5,    5,  112,    5,
			    1,    2,    1,  104,  105,    2,   33,  110,   78,   97,
			   87,    2,  107,    2,   60,   61,   87,    2,   87,   62,
			   25,  110,    5,    5,    5,   30,    2,   91,   13,   89,
			   89,   90,   90,   91,    2,   65,    1,    1,    2,  102,

			  102,   22,    2,   91,   65,  102,  102,   13,   48,   48,
			   48,   48,   48,    1,    1,   22,    5,    1,  110,  111,
			  112,    1,    1,   69,   22,    5,    2,   78,   33,   97,
			  103,   64,   68,   69,   70,   61,    2,   87,    5,   16,
			   45,   45,    5,    5,   91,   91,   91,   91,   16,  102,
			   22,    5,    5,   19,   18,    4,    2,    2,    2,    2,
			    2,    2,    2,   35,   37,   45,   45,   57,   62,   62,
			   13,   77,   84,   85,   85,   85,   85,  116,   45,    2,
			    1,    2,   45,   45,   45,   16,   45,   45,  102,   45,
			   45,   25,    1,    5,    5,  112,    1,    5,    7,    2, yyDummy>>,
			1, 1000, 0)
		end

	yytypes1_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    8,   10,   46,   14,   14,   14,   16,   17,   17,   17,
			    2,   46,   78,   97,    2,   78,  103,    2,    2,   91,
			    5,   68,    2,   24,   65,  102,  102,  110,    2,   24,
			    5,   13,   13,    2,    2,    2,   13,   88,  110,  110,
			    5,   25,   62,   62,    1,    5,    5,   95,    5,   18,
			   13,  116,    2,    1,    5,    5,    2,   92,   92,    5,
			   25,   45,    5,    5,    1,    1,    2,    2,   65,  102,
			  102,    2,    2,    2,  110,   22,   22,   22,   22,   22,
			   97,  103,   78,   97,    2,    2,   91,  102,   16,   45,
			   45,  102,   45,   45,   22,    1,   13,   13,   13,   13,

			   13,  116,   27,   13,   14,   13,   13,   13,   27,    5,
			    5,   13,  115,    1,    2,   45,   45,  110,    5,   95,
			    2,    1,  110,    5,    2,   62,   62,    1,    2,  113,
			   13,   45,   62,   62,   45,    1,    1,  102,   45,   45,
			    1,    1,    1,    5,  103,    2,    2,   91,   97,  103,
			  102,   16,   45,   45,    2,   65,  102,  102,    2,    2,
			    2,   30,   27,   27,   27,   27,    5,   27,   27,   27,
			  116,    5,    5,    2,    2,   45,    2,   41,  114,  115,
			    1,    2,   45,   59,    1,    5,   16,   94,   95,   45,
			    5,   13,   62,   13,    2,   25,   30,   30,    2,    2,

			    2,   30,   30,   30,    2,    2,   91,  102,   16,   45,
			   45,  103,    2,    2,   91,    2,   65,  102,  102,   22,
			  102,   45,   45,    1,    1,    1,   13,    5,   13,   25,
			    1,    2,   41,   45,  115,   45,    2,    2,   45,    2,
			   58,   59,    5,    5,    5,   95,    2,  116,   25,    5,
			   62,    1,    1,    1,  102,   16,   45,   45,    2,   65,
			  102,  102,    2,    2,   91,  102,   16,   45,   45,   22,
			  102,   45,   45,    2,    2,    2,   30,   30,   30,   25,
			   13,   25,   45,    5,   10,   38,   39,   40,   41,   13,
			   14,  108,    2,   62,   59,   13,    5,   62,    2,   45,

			   30,   30,   30,    2,   65,  102,  102,   22,  102,   45,
			   45,  102,   16,   45,   45,    2,   65,  102,  102,    2,
			    2,    2,   22,   22,   22,   25,  110,    5,    5,   41,
			   45,   25,   13,    1,    2,   22,  102,   45,   45,    2,
			    2,    2,    2,   65,  102,  102,   22,  102,   45,   45,
			   22,   22,   22,    5,   39,   25,   45,    2,    2,    2,
			   22,   22,   22,   22,  102,   45,   45,    2,    2,    2,
			   22,   22,   22,    2,    2,    2,   22,   22,   22,   22,
			   22,   22,    1,    1,    1, yyDummy>>,
			1, 385, 1000)
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
			create an_array.make (0, 1384)
			yydefact_template_1 (an_array)
			yydefact_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yydefact_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			   20,   20,   19,    1,   21,   49,    2,  770,   50,   53,
			    3,   51,   18,   25,   27,    0,   56,  121,   51,   51,
			   51,   52,    0,   31,  770,   32,  770,    0,    0,  748,
			  750,  762,  726,  745,  744,  743,  747,  746,  742,  741,
			  740,  739,  738,  737,  736,  735,  734,  733,  732,  731,
			  730,  729,  728,  727,  755,  768,  769,  767,  749,  751,
			  752,   41,    0,   36,   37,    0,   35,   28,   33,    0,
			   29,   38,  756,   40,   39,  763,   54,    0,    0,  123,
			    0,    0,    0,    0,   24,   26,  765,  758,  764,  757,
			    0,  677,   42,    0,    0,   44,   35,   34,    0,    0,

			    0,    0,   55,   60,  122,  127,  770,  770,    0,    0,
			    0,    0,   45,    0,    0,  475,    0,  463,    0,    0,
			    0,    0,  424,  432,    0,  425,  675,    0,   43,   30,
			   62,   61,   57,   59,   58,    0,  220,    0,  223,  412,
			  770,  220,  410,   16,   20,   15,    0,  464,  135,  140,
			  136,  125,  126,   48,   47,   46,  475,    0,  464,  475,
			    0,  464,  468,  435,  476,    0,    0,    0,  434,  433,
			  464,  464,  464,  491,  488,  468,  426,    0,  534,    0,
			    0,    0,  367,    0,    0,  654,  643,  648,    0,  647,
			    0,  644,  658,  671,  594,  708,    0,    0,    0,  646,

			  631,  652,  655,  632,    0,    0,  642,  651,  661,  640,
			  630,  608,  609,    0,  594,  653,  649,  659,  656,  633,
			  676,  645,  650,  641,  660,    0,    0,    0,    0,    0,
			  108,    0,    0,    0,    0,   63,   99,   81,  770,  221,
			  209,  215,  203,  199,    0,  392,  594,  413,  237,  410,
			    0,  770,  411,   20,   16,   13,    0,  244,  200,  239,
			  241,  238,  128,  465,  144,  137,  141,  145,  138,  142,
			  139,  143,  437,  493,  490,  431,  436,  492,  489,  430,
			  477,    0,    0,  768,  769,  767,    0,    0,    0,    0,
			    0,    0,  478,  479,    0,  424,  444,    0,    0,  428,

			  429,  427,  466,  475,    0,  463,  467,    0,  634,  635,
			  604,  603,    0,    0,  602,  299,  605,  463,    0,  638,
			  636,  637,  669,    0,  597,    0,  584,  367,    0,  712,
			  713,    0,  715,  707,  400,  710,  711,    0,  400,  683,
			  657,    0,    0,    0,    0,    0,  678,  601,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  663,  679,  680,  586,    0,   65,   64,
			  108,   99,  108,   99,  468,  109,   84,    0,   83,   82,
			   99,   99,   99,   71,   66,  468,  100,   75,    0,  410,
			  171,  207,    0,  213,    0,    0,  224,  225,  222,    0,

			  393,  394,  396,  594,   20,  410,    0,    6,   49,   16,
			  243,  240,    0,  291,  340,  299,  246,  255,  245,  249,
			  242,  186,  191,  148,  181,  156,  134,  187,    0,  182,
			  192,  157,  475,  464,  475,  464,  473,  476,  473,  446,
			  445,  473,  464,  464,  464,  470,  768,  769,  767,  482,
			  481,    0,  438,  469,  474,  473,  473,  594,  322,  300,
			  303,  337,  336,  335,  334,  333,  332,  331,  330,  329,
			  328,  327,  326,  325,  324,  323,  302,  301,  338,  339,
			  321,  319,  318,  316,  320,  317,  315,  314,  313,  312,
			  311,  310,  309,  308,  307,  306,  305,  304,    0,  668,

			    0,    0,  670,  595,    0,    0,  365,    0,    0,  718,
			  693,    0,  401,  378,    0,    0,    0,    0,  366,  594,
			    0,  378,  681,    0,    0,  629,  628,  611,  612,  613,
			  615,  617,  618,  620,  619,  621,  614,  616,  627,  624,
			    0,  623,    0,  622,  610,  594,    0,  667,   68,   67,
			   86,   80,   85,   79,  110,    0,    0,  768,  769,  767,
			    0,    0,    0,    0,    0,    0,  111,  112,    0,    0,
			    0,   99,   93,   77,   78,   76,   69,    0,  101,  108,
			    0,  463,  102,   20,  172,    0,    0,  208,  217,  216,
			    0,  214,  202,  227,  226,    0,    0,  395,  397,  398,

			    0,   20,   16,   14,   20,   12,    6,  291,  256,  250,
			    0,    0,  292,  364,  291,   20,  258,  252,    0,    0,
			  341,  248,  247,    0,    0,    0,    0,    0,  188,  182,
			  133,  183,  192,  193,    0,  158,  187,  449,  443,  448,
			  442,    0,    0,    0,  440,  441,  439,  473,  473,  486,
			    0,    0,  535,    0,    0,  759,  766,  672,  673,  674,
			  596,    0,    0,  594,  714,  715,  716,    0,  400,  402,
			  403,  381,    0,    0,  371,  375,  370,  368,  373,  369,
			  372,  374,    0,  400,    0,    0,    0,    0,  682,    0,
			  626,  625,  593,  662,    0,    0,  108,   99,  108,   99,

			  473,  109,  473,   95,   94,  473,   99,   99,   99,  104,
			  768,  769,  767,  115,  114,  103,  107,    0,  100,   70,
			    0,    0,  473,  473,    0,    0,    0,  170,  177,  206,
			  218,  219,  212,  232,  228,    0,  399,   16,    0,    6,
			    5,   11,    0,  260,  254,  257,  251,  297,    0,   20,
			  121,  363,  342,  361,  358,  362,  360,  357,  355,  359,
			  356,  354,  353,  352,  351,  350,  349,  348,  347,  346,
			  345,  344,  343,  194,  195,  185,  190,    0,  149,  150,
			  147,  180,  166,  165,  161,  155,  192,    0,  132,  182,
			  472,  484,  485,  471,  483,    0,    0,  487,  480,    0,

			  594,  598,  599,  600,  585,  694,  724,    0,    0,    0,
			  717,  723,  378,  404,    0,  295,  770,  770,  405,  405,
			  376,  378,  295,  405,  405,  197,  684,  685,  686,    0,
			  664,  665,  666,   98,   92,   97,   91,    0,    0,    0,
			   89,   90,   88,  473,  473,  119,   73,   74,   72,    0,
			    0,   16,  173,  176,  174,  175,  178,  230,    0,  229,
			    6,   16,   10,  259,  253,    0,  261,  297,  121,  400,
			  196,    0,  151,  162,    0,    0,    0,  131,  192,  639,
			  583,    0,  722,  719,  720,  721,    0,    0,  389,    0,
			    0,  382,  383,  380,    0,  405,    0,    0,  406,  422,

			  422,  377,    0,    0,  405,  422,  422,  594,  106,  117,
			  118,  105,  116,    0,    0,  120,  113,    6,    0,    0,
			  231,    9,    6,  298,  262,    0,   20,  121,   20,  400,
			  378,  152,  164,  167,  168,  160,  130,    0,  668,  295,
			  405,  405,  388,    0,  385,  384,  387,  386,  296,    0,
			  525,    0,    0,  524,  643,  594,    0,    0,  770,    0,
			  566,    0,    0,  591,    0,  497,  414,  521,    0,    0,
			  606,  518,  519,  510,  511,  513,  512,    0,  495,  407,
			  408,  770,    0,  423,    0,  295,  405,  405,    0,    0,
			    0,  582,    7,  235,  233,  234,    8,    0,  692,  293, yyDummy>>,
			1, 1000, 0)
		end

	yydefact_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  687,  688,  293,  689,  754,  753,  691,  690,  761,  760,
			  293,  293,  121,  400,   20,  121,  378,  405,    0,    0,
			  153,  169,  129,  725,  405,  422,  422,  390,  709,    0,
			    0,  475,    0,    0,    0,    0,  450,  457,    0,    0,
			    0,  584,  770,    0,    0,    0,  569,  770,    0,  607,
			  606,  532,  522,    0,    0,    0,  416,  415,  418,    0,
			  586,    0,    0,    0,  409,    0,  709,  709,  405,  422,
			  422,  709,  709,  709,    0,  294,  266,  264,  265,  263,
			  400,  378,  121,  400,  405,    0,    0,    0,  295,  405,
			  405,    0,    0,    0,  391,  715,  475,  464,  768,  767,

			    0,  528,  460,  459,  458,  464,  464,  464,  451,    0,
			  668,    0,    0,    0,  770,  770,  505,    0,  567,    0,
			  564,    0,    0,    0,  523,  515,  514,  417,  419,    0,
			  594,  509,  517,  516,  503,  715,  715,    0,    0,    0,
			  715,  715,  715,    0,  378,  405,    0,    0,  400,  378,
			    0,  295,  405,  405,  293,  405,  422,  422,  709,  709,
			  709,  706,  462,  456,  461,  455,    0,  453,  454,  452,
			  526,    0,  594,  545,  770,    0,  553,    0,  548,  547,
			    0,  536,    0,    0,    0,    0,    0,    0,  568,    0,
			    0,  594,  420,  594,    0,  593,  702,  704,  709,  709,

			  709,  705,  701,  703,  405,    0,    0,    0,  295,  405,
			  405,  378,  405,    0,    0,  293,  405,  422,  422,  287,
			    0,    0,    0,  715,  715,  715,  594,    0,  594,  585,
			    0,  544,    0,  550,  549,  499,  537,  538,    0,    0,
			  541,  540,    0,  572,  570,  571,  565,  530,  533,    0,
			    0,  715,  715,  715,    0,  295,  405,  405,  293,  405,
			  422,  422,  405,    0,    0,    0,  295,  405,  405,  288,
			    0,    0,    0,  293,  293,  293,  700,  696,  698,  529,
			  594,  583,  501,    0,  561,  554,  558,  555,  552,  562,
			  560,  563,  539,    0,  542,  594,    0,  421,  770,    0,

			  699,  695,  697,  293,  405,  422,  422,  276,    0,    0,
			    0,    0,  295,  405,  405,  293,  405,  422,  422,  293,
			  293,  293,  289,  283,  285,  527,    0,  557,    0,  556,
			  543,  582,  594,    0,  520,  275,    0,    0,    0,  293,
			  293,  293,  293,  405,  422,  422,  278,    0,    0,    0,
			  290,  284,  286,    0,  559,  531,  507,  293,  293,  293,
			  280,  268,  272,  277,    0,    0,    0,  293,  293,  293,
			  279,  267,  271,  293,  293,  293,  282,  270,  274,  281,
			  269,  273,    0,    0,    0, yyDummy>>,
			1, 385, 1000)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			  366,  660,  289,  290,  291,  262,  790,  263,  163,  164,
			  791,  808,  809,  510,  810,  331,  620,  866,  199,  693,
			  200,  201,  964,  202, 1285, 1286, 1287, 1177, 1288,    9,
			   10,    3,  725,  726,  783,  727,  965,  982,  818,  819,
			 1115, 1175,  983,  966, 1299, 1002,  563,  564,  565,  386,
			  387,  908,  375,  376,  909,  384,  719,  568,  569,  396,
			  397,  238,  239,  398,  203,  242,  587,  141,  136,  243,
			  967, 1240, 1183, 1241,  784,  427,  636,  785,  245,  205,
			  206,  207,  208,  209,  210,  211,  212,  213,  413,  895,
			  259,  260,  248,  249,  261,  932,  414,  774,  588,  514,

			  515,  516,  517,  613,  518,  334,  614,  100,  101,   17,
			  102,  214,  122,  971,    4,    5,   12,   13,   14,   67,
			   68,   69,   70,  215,  972,  973,  974,  975,  976, 1290,
			  216,  655,   72,  252,  253,   11,   22,  615,  775,  633,
			  634,  628,  629,  631,  632,  123,  889,  890,  891,  892,
			  673,  893, 1057, 1058,  217,  502,  218, 1187, 1188, 1047,
			  219,  220,   79,  221,  148,  149,  150,  106,  107,  151,
			  152,  899,  513,  416,  417,  418,  419, 1007,  222,  656,
			   75,  778,  779,  431,  780, 1076,  223,  224,  688,  225,
			  297,  125,  298, 1038,  919,  734,  920, 1129, 1178, 1179,

			 1112,  977, 1382,  603,  604,  145,  408,    7,   24,   26,
			   15,   77,  577,  177,  641,  108,  625,  627,  875,  874,
			  585,  626,  623,  624,  395,  586,  392,  590,  394,  244,
			  858,  420,  814,  247, 1061, 1232, 1119,  504,  546,  323,
			  127,  523,  338, 1095,  667, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1384)
			yypact_template_1 (an_array)
			yypact_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yypact_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			   53, 1002, 4404, -32768, -32768, 1240, -32768, -32768, -32768, 1253,
			 -32768,  513, -32768, 2007, 1219, 4301, 1262,  941, 1368, 1368,
			 1368, -32768, 1377, -32768, -32768, -32768, -32768,   39,   38, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, 1264, -32768, -32768,   51, 1254, -32768, 1251, 4301,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  889, 4871, 1350,
			 1365, 1364, 1363,  798, -32768, -32768, -32768, -32768, -32768, -32768,
			  717, 1241, -32768, 1340, 4301, -32768, -32768, -32768,  798,  798,

			  672,  889, -32768, 1295, -32768, 2351,  676, 4898,  942,  798,
			  798,  798, -32768,  561,  529,  804,  449, -32768,  942,  942,
			  942,  837,  767, -32768, 1231, -32768, -32768, 4233, -32768, -32768,
			 1293, 1292, -32768, -32768, -32768, 1319, 1296,  721, -32768, 4233,
			  309, 1296, 1238, 1332, 1002, -32768,  341,  767,   44,   14,
			  942, -32768, -32768, -32768, -32768, -32768,  804,  832,  767,  804,
			  824,  767, 1220, -32768, -32768, 1447, 1266, 1259, -32768, -32768,
			  767,  767,  767, -32768, -32768, 1206, -32768, 1348, 1205, 4233,
			 4233, 1508, -32768, 1287, 4233, -32768, 1201, -32768, 4233, -32768,
			 4233, 1199, -32768, 1246,  871,  666, 1203, 4871, 1204, -32768,

			 1190, -32768, -32768, -32768, 4690, 1185, 1184, -32768, -32768, -32768,
			  912, -32768, -32768, 4134,  275, -32768, -32768, -32768, -32768, -32768,
			 -32768, 1178, -32768, 1173, -32768, 4233, 1319, 1319,  501,  496,
			 1042,  449,  942,  942,  942, 1272, 1014, -32768,  309, -32768,
			  146,  109,  392, -32768,  614, 4576,  852, 4233, -32768, 1238,
			 1276,  309, -32768, 1002, -32768, -32768, 1275, 1179, -32768, 1276,
			  511, -32768,  799, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  482,  298,  693,  701,  677,  942,  942,  942, 1348,
			  989,  989, -32768, -32768, 1174,  767, 1171, 1170, 1169, -32768,

			 -32768, -32768, -32768,  401,  449, 1166, -32768,  798, -32768, -32768,
			 -32768, -32768, 4952, 4930, -32768, -32768, -32768, 1165, 1167, -32768,
			 -32768, -32768, -32768, 4233, 1164,  942, -32768, 1163,  717, -32768,
			 -32768, 1156,  391, -32768,   40, 2106, -32768, 4233,   21, 1160,
			 -32768,  717, 4233, 4233, 4233, 4233, -32768, -32768, 4233, 4233,
			 4233, 4233, 4233, 4233, 4233, 4233, 4233, 4233, 4233, 4035,
			 3936, 4233,  798, -32768, -32768, -32768, 1875, 4734, 1272, 1272,
			 1042, 1014, 1042, 1014, 1154, -32768, -32768, 1271, -32768, -32768,
			 1014, 1014, 1014, 1257, -32768, 1149, -32768, -32768, 1031, 1238,
			 1148, 2085,  798, 1715,  798,  721, 1146,  614, -32768,  845,

			 -32768, 1131, 4503,  811, 1002, 1238, 1249, 1105, 1240, -32768,
			 -32768, -32768,  614, 4386, -32768, 1256, -32768, -32768, -32768, -32768,
			  511,  217, 1244,  928,   77,  851, -32768, 1144, 1243, 1092,
			 1070, 1222,  804,  767,  804,  767, -32768, 1123, -32768, 1129,
			 1124, -32768,  767,  767,  767, -32768, 1118, 1117, 1113, -32768,
			 -32768,  717, 1110, -32768, -32768, -32768, -32768,  275, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  717,  494,

			 4517, 3837, -32768, -32768, 4233, 1114, -32768, 1109,  614, 1106,
			 -32768,  717, 3738,  525,  798,  798,  330,  120, -32768,  855,
			  717,  509, -32768,  614, 1102,  278,  278,  644,  644,   41,
			   41,   41,  278,  278,  278,  278,   41,   41, 1965, 4675,
			 4233, 4675, 4233, 4631, -32768,  275, 4233, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  273,  234,  498,  130,  295,
			  942,  942,  942, 1031,  927,  927, -32768, -32768, 1096, 1084,
			 1093, 1014, 1089, -32768, -32768, -32768, -32768,  798, -32768,  -31,
			  449, 1083, -32768, 1002, -32768,  798,  798, -32768,  798, 1081,
			  798, -32768, -32768, -32768, -32768, 1085, 1085, -32768, -32768, 1079,

			 1188, 1002, -32768, -32768, 1002, -32768, 1105, 1307, -32768, -32768,
			  511,  717, -32768, -32768,   42, 1002, -32768, -32768,  798, 4908,
			 -32768, -32768, -32768,  614,  614,  614,  614,    3, -32768, 1092,
			 -32768, -32768, 1070, -32768, 1187, -32768, 1144, 1074, 1073, 1072,
			 1071, 1447,  989, 1447, 1067, 1061, 1059, -32768, -32768,  357,
			 1348, 1348, -32768, 1043,  798, -32768, -32768, -32768, -32768, -32768,
			 -32768, 4646, 3639,  275, -32768,  391, -32768, 3144,  790, 4233,
			 4233,  268, 4871,  202, -32768,  553, -32768, -32768, -32768, -32768,
			 -32768, -32768,  717,  790, 4871,  202,  763,  285, -32768, 1049,
			 4675, 4631, 1740, -32768, 4587, 3540, 1042, 1014, 1042, 1014,

			 -32768, 1050, -32768, 1041, 1039, -32768, 1014, 1014, 1014, -32768,
			 1038, 1037, 1036, -32768, -32768, -32768, -32768, 1319, 1033, -32768,
			  175,   46, -32768, -32768, 1141,  378,  153, -32768, 1021, -32768,
			 -32768, -32768, -32768, 1034, -32768, 1020, -32768, -32768, 1127, 1105,
			 -32768, -32768,  511, -32768, -32768, -32768, -32768, 1062,  717, 1002,
			  941, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  971,  614, -32768, -32768, 1135, -32768,  614,
			 -32768, -32768, -32768,   86,  271, -32768, 1070, 1122, -32768, 1092,
			 -32768, -32768, -32768, -32768, -32768,  989,  989, -32768, -32768, 4233,

			  275, -32768, -32768, -32768, -32768, -32768, -32768, 1287,  669, 3045,
			 -32768, 4778,  490, 4233,  798,  419,  681,  591,  283,  283,
			  997,  428,  419,  283,  283, -32768, -32768, -32768, -32768,  798,
			 -32768, -32768, -32768, 1009, 1008, 1005, 1001, 1271,  927, 1271,
			 1000,  994,  993, -32768, -32768,  329, -32768, -32768, -32768, 1031,
			 1031, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  717, -32768,
			 1105, -32768, -32768, -32768, -32768,  614, 1121, 1062,  941,  790,
			 -32768,  614, -32768, -32768,  614,    3, 1101, -32768, 1070, -32768,
			 -32768,  987, -32768, -32768, -32768, -32768, 4871,  202,  467,  798,
			  798,  798,  798, -32768, 4871,  283, 2946, 2946, 3441,  253,

			  253, -32768, 4871,  202,  283,  253,  253,  275, -32768, -32768,
			 -32768, -32768, -32768,  927,  927, -32768, -32768, 1105,   95,  717,
			 -32768, -32768, 1105, -32768, -32768, 4470, 4382,  941,  461,  790,
			  729,  977, -32768,  971,  614, -32768, -32768, 1078,  197,  419,
			  283,  283, -32768,  717, -32768, -32768, -32768, -32768, -32768, 1077,
			 -32768,  961,  717, -32768,   11,  663, 4233, 4233,  294,  965,
			  944,  445, 3342, 1013, 1006, -32768, 1027, -32768,  924,  912,
			 1587, -32768, -32768, 1544, -32768, -32768, -32768,  606, -32768, 4233,
			 4233, 1029, 1028, -32768, 1026,  419,  283,  283, 1025, 1023,
			 1011, -32768, -32768, -32768, -32768, -32768, -32768,  717, -32768,   -4, yyDummy>>,
			1, 1000, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, -32768,   -4, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			   -4,   -4,  941,  790, 1002,  941,  724,  283, 4871,  202,
			 -32768, -32768, -32768, -32768,  283,  253,  253,  886, -32768,  100,
			  111,  804,  449,  942,  942,  942,  767, -32768,  891,  894,
			  942, 2847, 1394, 1953, 2946,  717,  881,  988,  717, -32768,
			 -32768,  859, -32768, 3243, 4233, 4233, 4233, -32768,  939,  798,
			 2366, 2946, 4233, 4233, 4233, 2946, -32768, -32768,  283,  253,
			  253, -32768, -32768, -32768,  857, -32768, -32768, -32768, -32768, -32768,
			  790,  689,  941,  790,  283, 4871,  202,  955,  419,  283,
			  283,  935,  929,  922, -32768,  391,  804,  767,  804,  787,

			  767,  780, -32768, -32768, -32768,  767,  767,  767, -32768,  588,
			  485,  771,  765,  682,  827,  756, -32768,  758, -32768, 4871,
			 -32768, 2946,  731,  798, -32768, 4778, 4778, 4233, 4233,  801,
			  275, -32768, 4778, 4778, -32768,  391,  391,  849,  819,  816,
			  391,  391,  391,  264,  684,  283, 4871,  202,  790,  636,
			  749,  419,  283,  283,   -4,  283,  253,  253, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  798, -32768, -32768, -32768,
			  694,  798,  275, -32768,  738,  712,  700,  675,  682, -32768,
			 2946, -32768,  698,  695,  618,  572,  115, 4871, -32768,  678,
			  588,  275, 4778,  192, 4233, 2236, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768,  283, 4871,  202,  649,  419,  283,
			  283,  193,  283, 4871,  202,   -4,  283,  253,  253, -32768,
			  638,  628,  622,  391,  391,  391,  275,  798,  275, 2730,
			 2946, -32768,  933, -32768, -32768, -32768, -32768, -32768,  605, 4233,
			  618, -32768,  798, -32768, -32768, -32768, -32768,  412, -32768, 4233,
			 4415,  391,  391,  391,  599,  419,  283,  283,   -4,  283,
			  253,  253,  283, 4871,  202,  580,  419,  283,  283, -32768,
			  571,  544,  538,   -4,   -4,   -4, -32768, -32768, -32768, -32768,
			  275, 2613, -32768,  717, -32768,  409,  438,  933, -32768, -32768,
			 -32768, -32768, -32768, 1953, -32768,  275,  798, 4778,  448,  441,

			 -32768, -32768, -32768,   -4,  283,  253,  253, -32768,  427,  424,
			  421,  414,  419,  283,  283,   -4,  283,  253,  253,   -4,
			   -4,   -4, -32768, -32768, -32768, -32768,  235, -32768,  933, -32768,
			 -32768, 2496,  275, 2946, -32768, -32768,  366,  358,  351,   -4,
			   -4,   -4,   -4,  283,  253,  253, -32768,  252,  249,  245,
			 -32768, -32768, -32768,  286, -32768, -32768, -32768,   -4,   -4,   -4,
			 -32768, -32768, -32768, -32768,  230,  198,  129,   -4,   -4,   -4,
			 -32768, -32768, -32768,   -4,   -4,   -4, -32768, -32768, -32768, -32768,
			 -32768, -32768,  103,   87, -32768, yyDummy>>,
			1, 385, 1000)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -160,  820, -32768, -32768, -32768, -149, -137, -120, -151, -279,
			 -158, -32768, -32768, -491,  671, -32768, -32768,  612,    5,  783,
			 -629, -32768, -32768,  -12, -32768,  144, -32768, -32768,  190, -32768,
			 1060,   10, -32768, -32768,  185,  227, -533,  121, -571, -607,
			 -1124, -1049, -32768, -32768, -32768,  536, -32768, -32768, -32768,  896,
			  -28, -345, -370, -320, -358,  549,  741, -119, -32768, -32768,
			 -32768, 1318, 1349, 1057,   82, -32768, -335, -32768, -32768, -108,
			 -32768, -32768, -32768,  211, -32768, 1022, -32768,  574,  116, -740,
			 -32768, -32768, -32768, -32768, -787, -32768,  803, -274, -385, -777,
			 -32768, -32768, 1336, -102, 1189,  507,  180, -488, -530, -32768,

			 -32768, -32768, -32768, 1245,  541, -32768, -32768, -32768, -32768, -32768,
			 1335,  -15, 1075, -32768, -32768,  -74, 1004, -32768, -32768, -32768,
			 -32768, -32768,  -13, -32768, -32768, -32768, -32768, -32768, -32768,  -68,
			 -895,  -14, -32768, 1326, -208, -32768, 1103,  821, -563, 1180,
			 -590, 1175,  796, 1172, -604,   23, -32768, -32768, -32768, -32768,
			 -503,  105, -32768, -32768, -32768,  916,   -2, -32768,  231, -32768,
			 1351, 1212, -645,  122, -32768, -32768, -32768, -32768, -32768,  950,
			  921,  305, -332, -369, 1012, -374, 1010, -32768,  -89,   -5,
			 -32768, -32768, -32768, -32768,  635,  171, -1161, -32768,  723, -178,
			  -64, -32768, -32768, -32768, -32768,  813,  486, -32768, -32768,  215,

			 -32768, -932, -32768, -518, -32768, -107, -32768, -32768, -32768, -32768,
			  -92, -32768, -32768,  705,  388, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -475, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -351, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5053)
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
			yyarray_subcopy (an_array, <<
			   66,   71,  176,   64,  437,  272,  521,  293,  276,  275,
			   74,    6,  279,   73,  137,  146,  235,  337,  685,  567,
			   63,  299,  300,  301,  437,  786,  124,  607,  292, 1051,
			 1004, 1004,  566,  143,  326,  687,  255,  670,  258,  617,
			  306,  404,  787,  582,  616,  904,  622,  720,  250,  501,
			  550,  621,  552, 1233,   96,   71,   97,   64,  512,  591,
			  848,  776,  103,  781,   74,   92, 1182,   73,  112,  612,
			  256, 1291, -607, -607,   63,    2,  104,  512,  824,   96,
			   71,  129,   64,  130,  131,  117,  103, 1384,  741,   74,
			  873, -179,   73,  722,  153,  154,  155,   65, 1101,   63,

			 -163,  168,  169, 1383,  374,  869,  174,  368,  369,  969,
			  969,  361,   89,   87,  823,  117, -179, -211, -211,  318,
			    1, -163,  390, -211,  246, -163, 1291, -211,  157, -163,
			 1075, -211,  449,  450, 1238, -211,  389,  782, -587,  160,
			   88,   86,  274, 1375,  520,  278,  250,  407,  267,  405,
			  294,   65,  445,  349, -205, -205,  968,  968,  237,  250,
			 -205, -211, 1024,  511, -205,  748,  315, 1291, -205, 1330,
			  731,  117, -205, 1096,  805,  452,   65, 1170,  264,  406,
			  335,  583, 1099,   56, 1098,  878,   91,  701,  296,  846,
			  720,   57,   56,   55,  813,  340,  876,  601, -205,  687,

			  296,   57,   56,   55,   54, -163,  713,  714, 1068,  701,
			 1263,  870, 1374,  817, 1049,  994,  378,  379,  709,  993,
			 -163,  862,  671,  929,   57,   56,   55,  501,  390,  315,
			  662, -184,  403,  744,  816,  618,  746, 1244,  743, 1243,
			 1262,  745,  679,  204, 1373,  415,   57,   56,   55,  237,
			  237,  729, -184,  730,  702,  732, -184,  969, 1247, 1369,
			  167,  166,  160, 1368,  507,  390, 1367,  963,  963,  439,
			  440,   54,  695,  854,  969,  294,  294,  524,  969, -379,
			  941,  637, 1013,  639,  638, -159,  640,  592,  937,  439,
			  440,  981,  457,  644,  645,  646,  987,  652,  898,   31,

			 -379,  157,  606,  316,  968,  117, -159,  698,  313,  887,
			 -159, 1155,  296,  324, -159, 1249,  940,  336,  903,  312,
			 -504,  968,  519, -236,  654,  968,  160,   28,   27,  204,
			  600, -236,  986, 1023,  969, -236,  812, 1004,   54, -504,
			 -504,  367,  921,  551,  117,  553,  696,  545,  361,  241,
			  240,  821,  573,  574,  575, 1353,   57,   56,   55,  257,
			   54,  314,  570,  402,  978, 1359,   31, 1080,  864,  117,
			 1083,  434, 1358,  863, 1216,  332,  833,  589,  835,  589,
			 1357,  968,  315,  356,  355,  692,  934,  649,  662,  350,
			  349,  348, 1004,  969,   28,   27,  324,  415,  415,  992,

			  572,   57,   56,   55,  996,  415, -201,  827,  345,  344,
			 -201,  572, 1090,  654, -201,  963,  167,  166, -201,  705,
			 -463,  695,  894,  980,  399,  391,  393, 1019, 1342,  618,
			 -463, 1259,  963, 1004,  653, 1341,  963, 1148, 1340,  500,
			  968, 1339,  410,  969, -201,  902,  934,  668, 1089,   57,
			   56,   55,  677,  367,  916, 1334,  683,  671,  525,  526,
			  527,  528, -506,  915,  529,  530,  531,  532,  533,  534,
			  535,  536,  537,  538,  539,  541,  543,  544, 1304, 1153,
			  910,  912,  798,    2,  792,  794,  931, 1053, 1014, 1316,
			  968,  797,  963,  315,  911,  739, 1328,  246,  852,  675,

			  675,  675,  675,  804, 1064,  911,  793,  886,  315,  724,
			  157, 1116,  509, 1086,  793, 1152,   57,   56,   55,  671,
			   57,   56,   55,   54,  160,  455,  684,  738, 1131,  157,
			   21,  412, 1134, 1327,  313, 1343,  162,  930,  671, 1296,
			 1210,  750,  672,  703,  704,  312,  969,  747, 1049,  570,
			  570,  963, 1321,  117,  671,  432,  912,  160, 1320,   54,
			   20,   19,  721,   18, 1048,  703,  704,  117,   54,  372,
			  728,  589,  117,  589,  370,  589, 1209,  399, 1147,  167,
			  166, 1127,   57,   56,   55, 1319,  572,   31, 1189,  157,
			  943,  942,  415,  968, 1315,  415,   31, 1016,  845, 1257,

			  117,  963,  159,  675, 1161, -494, -494, 1268,  315,  315,
			  315,  315, 1171, 1303,  740,   28,   27,  500,  820, 1292,
			  661,  654,  700, -108,   28,   27,  294,  294,  294, -494,
			  860, 1239,  117,  374,  156, 1256, 1275,  313,  794,  800,
			  880, 1206, 1274, 1267, 1196, 1197, 1214, 1235,  312, 1201,
			 1202, 1203, 1273, 1213,  246,  403,  690, 1314,  691,   57,
			   56,   55,  694, 1258,  296,  671,  296, 1063, 1062,  834,
			  815,  836,  315,  296,  296,  868,  682,  681,  840,  841,
			  842, 1081,  822, 1212,  867,   57,   56,   55,  665,  313,
			 -198, 1049, 1246, 1313, -198, -496, -496, 1282, -198, 1242,

			  312, 1205, -198,  686,  963,  721, 1146, 1174, 1264, 1237,
			  728,  728, 1236,  671,  361, 1135, 1136, 1114,  671, -496,
			 1140, 1141, 1142, 1176,  896,  897, 1231,  415, -198,  241,
			  240, 1204, 1276, 1277, 1278,  330, 1145,   57,   56,   55,
			  237, 1085, -551,  881,  917,  121, 1018,  991, 1144,  356,
			  355, 1149, -500,  671,  922,  350,  349,  348,  671,  315,
			 1300, 1301, 1302, 1215,  315,  120,  119,  118, 1174,  329,
			 1181, 1084,   57,   56,   55,   54, 1017, 1174,  661, 1173,
			  294,  294, 1040,  811,  324,  328,  402,  327,  117,  116,
			  115,  883,  927,  882,  918, 1041,  133,  132,  403,  888,

			 1356,  441, -463,  773,  773,  777,  773, 1223, 1224, 1225,
			 1060,  694, -463,  426,  907,  425, 1211,  436, -475, 1164,
			  165, 1227,  570,  570,  570,  438,  642,  512,  162,  643,
			 1200,  167,  166, 1199,  424,  423, 1008, 1008,  422, -498,
			 -498, -498,  421,  650,  651,  114, 1194, 1251, 1252, 1253,
			  315, 1190, 1012,  113, 1015,  918,  415, 1003, 1003,  315,
			  572,  165,  572, 1198,  165, -154, 1044,  686, -498,   57,
			   56,   55,  572,  572,  888,  888,  888,  888, 1185, 1027,
			 1102,  970,  970,  246,  939,  826, -154,  825, 1039, 1065,
			 -154, 1172,  948,  277, -154,   57,   56,   55,  570,  570,

			  985,  273,  175,   57,   56,   55,  173, 1166,   57,   56,
			   55, 1005, 1005, 1001, 1001,  879, 1108,  548,  549,  315,
			 1009, 1009, -463, 1006, 1006,  811, -375, -375, -375,  402,
			 1000, 1000,  324, 1074,  599,  377, 1160,   99,   98,  162,
			 1082,  388, -146, 1159, -146, 1162, 1050,  246, 1163, 1158,
			 1113,  198,  853,  855,  773, 1121, 1167, 1168, 1169,  777,
			   57,   56,   55, -146,  246,  403,  596, -146,  595, 1154,
			 1195, -146,   78,  324, 1037,  401,  324, 1143,  682,  681,
			 1165, 1117,  308,  309, 1122, 1128, 1123,  319,  165,  121,
			  325,  320,  324,  321,  944,  945,  946,  947,  712,  711, yyDummy>>,
			1, 1000, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  710,   58, 1120, 1118,   57,   56,   55,   54,  165, 1035,
			 1034, 1033, 1229,  117, 1110, 1050, 1088, 1103, 1104, 1109,
			 1094,  984, 1180, 1184,    2, 1073,  989,  990,   84,  970,
			   85, 1248,  117, 1032, 1031,  795,  796, 1072,  403, 1071,
			 1067,  246, 1066, -502, 1130,  923,  970,  363,   30,  403,
			  970, 1059, 1283, 1056,  933,  674,  676,  678,  680,  121,
			  448,  447,  446,  167,  166, 1046, 1279, 1055, 1281,  266,
			  269,  271, 1042, 1043, 1054,  377,  388,  377,  388,  562,
			  561,  560, 1230, 1151, 1045,  388,  388,  388,  837, 1030,
			  838, 1028, 1022,  839, 1050,  825,  402, 1029,  265,  268,

			  270, 1020,  581,  580,  579,   -4,  970,  938, 1191,  422,
			  849,  850,  403, 1193,  933,  936,  865, 1186,  -76,  -78,
			 1325,   80,   81,   82,  900,  -77,  -79,  424,  905,  906,
			  -85,  901,  -20,  -80,  -86, 1331,  877,  165,  -20,  165,
			  871,  861,  859,    2, 1208,  856, 1092, 1093,  926,  385,
			  -20, 1226,  -20,  -20,  857,  851, 1228,  -87,  -20,  556,
			  844,  702,  843,  799,  -82,  970,  -83,  555,  -20,  402,
			 1125, 1126, 1355, 1077,  -96, 1050,  829,  374, 1132, 1133,
			  402, 1078, 1079,  147, -427, 1186, -429,  421,  158,  161,
			 1138, 1139, -428,  170,  171,  172, -430, -436, -431, -437,

			  949,  788,  737, 1255,  733,  731, 1333,  723,  716,  988,
			  236, 1266, 1280,  736,  -81,  970,  717, 1289, 1005, 1326,
			 1284,  715,  689,  147,  147,  147,  -23, 1295,  666,  664,
			  -23,  913,  914,  -23,  663, -426,  -23,  648,  425,  -23,
			  295,  438,  647,  402, 1192, 1025, 1026, -447,  -23, -433,
			  -23,  -23,  295,  925, -434,  924,  -23,  630, -189,  619,
			    8, 1312,  377,  602,  139,  597,  -23,  -23,  584,  -23,
			  593,  576, 1289, 1005,  578, 1284,  388, 1221, 1222,  554,
			  383, 1332,  522,  508,  377,  506,  503,  499,  498,  409,
			  456, 1069, 1070,  454,  257,  453, -432,  451,  390,  121,

			 -592,  236,  236,  371,  373, -589,  322,  380,  381,  382,
			 1250, -590,  362, 1289, 1005,  121, 1284, -591,  970,  562,
			  561,  560, 1087,  341,  339, 1219, -588,  412, -587, 1091,
			  313,  302,  307,   89,  612,  120,  119,  118, 1271, 1272,
			   87,  312,  559,  558,  557,  280,  254,  121,  138,  227,
			  226,  178,  135,   25,  128, 1293,  433,  435,  317,  116,
			  115,  442,  443,  444,  295, 1297,  126,  234,  233,  232,
			  111,  110,  109, 1137,  105,   95,  121,   94,   57,   56,
			   55, 1309, 1310,   90,   83,   21, 1269,   76,   16, 1150,
			  117,  231,  230, 1234, 1156, 1157,  288,  287,  286,  556,

			  505,  377,  388,  377,  388,  995, -546,  555, -546,  735,
			  828,  388,  388,  388,  872,  114,   93,  659, 1245,  305,
			  304,  303,  609,  113,  608,  365, 1337, 1338,  327, 1307,
			  611,  742,  789,  144,  430,  749,  134,  429, 1348, 1349,
			  333, 1021,  428,  142, 1322, 1323, 1324,  229,  411,  935,
			 1207, 1294,  571,  635,  594,  228,  140, 1217, 1218,  251,
			 1220,  847, 1011,  571,  361, 1365, 1366,  718,  605,  360,
			  359,  358, 1354,  357, 1335,  121,  282, 1329,  832,  928,
			  885,    0,  803,    0,  281,    0, 1346,    0,    0,    0,
			 1350, 1351, 1352,    0,    0,  288,  287,  286,    0,  356,

			  355,  354,  353,  352,  351,  350,  349,  348,    0, 1254,
			 1360, 1361, 1362, 1363, 1260, 1261,    0, 1265,  285,  284,
			  283, 1270,    0,    0,  345,  344,  343,  342, 1370, 1371,
			 1372,  313,    0,    0,    0,    0,    0,    0, 1376, 1377,
			 1378,    0,  312,    0, 1379, 1380, 1381,    0,    0,    0,
			    0,    0,    0,    0,    0,    0, -508, -508, -508, -508,
			    0, 1305, 1306,    0, 1308,    0,    0, 1311,    0,    0,
			 -508,    0, 1317, 1318,    0,  282,    0,  311,    0,   57,
			   56,   55, -508,  281,    0, -508,    0,    0,    0, -508,
			 -508,    0,    0, -594,    0, -594,    0, -594,    0, -594,

			 -594, -594, -594,    0,    0, -594, -594,    0, -594, 1336,
			    0,  310, -594, -594,    0,    0,    0,    0, 1344, 1345,
			 -594, 1347,    0,    0,    0, -594,    0, -594, -594,  182,
			  697,  699, -594, -594,    0,  706,  707,  708,  571,    0,
			    0,    0, -594, -594,    0,    0, -594,    0, 1364,    0,
			    0, -594, -594, -594,    0, -594, -594,    0, -594, -594,
			 -594, -594,    0,    0,    0,    0,    0, -594, -594, -594,
			 -594, -594, -594, -594, -594, -594, -594, -594, -594, -594,
			 -594, -594, -594, -594, -594, -594, -594, -594, -594, -594,
			 -594, -594,    0,    0,    0,    0,    0,    0,    0,    0,

			    0, -594, -594, -594,    0,    0, -594,    0,  324,    0,
			    0,    0,    0, -594, -594, -594,  295,    0,  295,    0,
			    0, -594, -594, -210, -210,  295,  295,    0,    0, -210,
			    0,    0,    0, -210,    0,    0,  165, -210,    0,    0,
			    0, -210,    0,    0,    0,    0, -580,    0, -580,    0,
			 -580, -580, -580, -580, -580, -580,    0, -580, -580, -580,
			    0, -580, -580,    0,    0, -580, -580, -210,    0, -580,
			 -580,    0, -580, -580,    0,    0,    0,    0, -580,    0,
			 -580, -580, -580,    0,    0, -580, -580, -580,    0,    0,
			    0,    0,  236,    0,    0, -580, -580,    0,    0, -580,

			 -580,  165,    0,  165, -580, -580, -580,    0, -580, -580,
			 -580, -580, -580, -580, -580, -580, -580, -580, -580, -580,
			 -580, -580, -580, -580, -580, -580, -580, -580, -580, -580,
			 -580, -580, -580, -580, -580, -580, -580, -580, -580, -580,
			 -580, -580, -580, -580, -580, -580, -580, -580, -580, -580,
			 -580, -580, -580, -580, -580, -580, -580,    0, -580, -580,
			    0, -580, -580,    0, -580, -580, -580,    0, -580,    0,
			 -580, -580, -580, -580, -580, -580,    0,    0,    0,    0,
			    0, -579,    0, -579,    0, -579, -579, -579, -579, -579,
			 -579,    0, -579, -579, -579,    0, -579, -579,    0,    0,

			 -579, -579,    0,    0, -579, -579,    0, -579, -579,    0,
			    0,    0,  571, -579,  571, -579, -579, -579,    0,    0,
			 -579, -579, -579,    0,  571,  571,    0,    0,    0,    0,
			 -579, -579,    0,    0, -579, -579,    0,    0,    0, -579,
			 -579, -579,    0, -579, -579, -579, -579, -579, -579, -579,
			 -579, -579, -579, -579, -579, -579, -579, -579, -579, -579,
			 -579, -579, -579, -579, -579, -579, -579, -579, -579, -579,
			 -579, -579, -579, -579, -579, -579, -579, -579, -579, -579,
			 -579, -579, -579, -579, -579, -579, -579, -579, -579, -579,
			 -579, -579,    0, -579, -579, 1114, -579, -579,    0, -579, yyDummy>>,
			1, 1000, 1000)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #3 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -579, -579,    0, -579,    0, -579, -579, -579, -579, -579,
			 -579,    0,    0,    0,  -22,    0,    0,    0,  -22,    0,
			    0,  -22,    0,  361,  -22,    0, 1036,  -22,  360,  359,
			  358,    0,  357,    0,    0,  361,  -22,    0,  -22,  -22,
			  360,  359,  358,    0,  -22,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  -22,  -22,    0,  -22,  356,  355,
			  354,  353,  352,  351,  350,  349,  348,    0,    0,    0,
			  356,  355,  354,  353,  352,  351,  350,  349,  348,    0,
			    0,    0,    0,  345,  344,  343,  342,    0,    0,    0,
			    0,    0,    0, -204, -204,  345,  344,  343,  342, -204,

			    0,    0,    0, -204, 1097, 1100,    0, -204, 1105, 1106,
			 1107, -204, -299,    0, -299, 1111, -299, -299, -299, -299,
			 -299, -299,    0, -299, -299, -299,    0, -299, -299,    0,
			    0, -299, -299,    0,    0, -299, -299, -204, -299, -299,
			    0,   23,    0,    0, -299,    0, -299, -299, -299,    0,
			    0, -299, -299, -299,    0,    0,    0,    0,    0,    0,
			    0, -299, -299,    0,    0, -299, -299,    0,    0,    0,
			 -299, -299, -299,    0, -299, -299, -299, -299, -299, -299,
			 -299, -299, -299, -299, -299, -299, -299, -299, -299, -299,
			 -299, -299, -299, -299, -299, -299, -299, -299, -299, -299,

			 -299, -299, -299, -299, -299, -299, -299, -299, -299, -299,
			 -299, -299, -299, -299, -299, -299, -299, -299, -299, -299,
			 -299, -299, -299,    0, -299, -299,    0, -299, -299,    0,
			 -299, -299, -299,    0, -299,    0, -299, -299, -299, -299,
			 -299, -299, -574,    0, -574,    0, -574,    0, -574, -574,
			 -574, -574,    0,    0, -574, -574,    0, -574,    0,    0,
			    0, -574, -574,    0,    0,    0,    0,    0,    0, -574,
			    0,    0,    0,    0, -574,    0, -574, -574,    0,    0,
			    0, -574, -574,    0,    0,    0,    0,    0,    0,    0,
			    0, -574, -574,    0,    0, -574,    0, -581,    0,    0,

			 -574, -574, -574,    0, -574, -574,    0, -574, -574, -574,
			 -574,    0,    0,    0,    0,    0, -574, -574, -574, -574,
			 -574, -574, -574, -574, -574, -574, -574, -574, -574, -574,
			 -574, -574, -574, -574, -574, -574, -574, -574, -574, -574,
			 -574,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			 -574, -574, -574,    0,    0, -574,    0, -574,    0, -124,
			 -124,    0, -574,    0, -574, -124,    0,    0,    0, -124,
			 -574, -580, -573, -124, -573,    0, -573, -124, -573, -573,
			 -573, -573,    0,    0, -573, -573,    0, -573,    0,    0,
			    0, -573, -573,    0,    0,    0,    0,    0,    0, -573,

			    0,    0,    0, -124, -573,    0, -573, -573,    0,    0,
			    0, -573, -573,    0,    0,    0,    0,    0,    0,    0,
			    0, -573, -573,    0,    0, -573,    0,    0,    0,    0,
			 -573, -573, -573,    0, -573, -573,    0, -573, -573, -573,
			 -573,    0,    0,    0,    0,    0, -573, -573, -573, -573,
			 -573, -573, -573, -573, -573, -573, -573, -573, -573, -573,
			 -573, -573, -573, -573, -573, -573, -573, -573, -573, -573,
			 -573,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			 -573, -573, -573,    0,    0, -573,    0, -573,    0,    0,
			    0,    0, -573,    0, -573,    0,    0,    0,    0,    0,

			 -573, -579, -577,    0, -577,    0, -577,    0, -577, -577,
			 -577, -577,    0,    0, -577, -577,    0, -577,    0,    0,
			    0, -577, -577,    0,    0,    0,    0,    0,    0, -577,
			    0,    0,    0,    0, -577,    0, -577, -577,    0,    0,
			    0, -577, -577,    0,    0,    0,    0,    0,    0,    0,
			    0, -577, -577,    0,    0, -577,    0,    0,    0,    0,
			 -577, -577, -577,    0, -577, -577,    0, -577, -577, -577,
			 -577,    0,    0,    0,    0,    0, -577, -577, -577, -577,
			 -577, -577, -577, -577, -577, -577, -577, -577, -577, -577,
			 -577, -577, -577, -577, -577, -577, -577, -577, -577, -577,

			 -577,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			 -577, -577, -577,    0,    0, -577,    0, -577,    0, -578,
			    0, -578, -577, -578, -577, -578, -578, -578, -578,    0,
			 -577, -578, -578,    0, -578,    0,    0,    0, -578, -578,
			    0,    0,    0,    0,    0,    0, -578,    0,    0,    0,
			    0, -578,    0, -578, -578,    0,    0,    0, -578, -578,
			    0,    0,    0,    0,    0,    0,    0,    0, -578, -578,
			    0,    0, -578,    0,    0,    0,    0, -578, -578, -578,
			    0, -578, -578,    0, -578, -578, -578, -578,    0,    0,
			    0,    0,    0, -578, -578, -578, -578, -578, -578, -578,

			 -578, -578, -578, -578, -578, -578, -578, -578, -578, -578,
			 -578, -578, -578, -578, -578, -578, -578, -578,    0,    0,
			    0,    0,    0,    0,    0,    0,    0, -578, -578, -578,
			    0,    0, -578,    0, -578,    0, -576,    0, -576, -578,
			 -576, -578, -576, -576, -576, -576,    0, -578, -576, -576,
			    0, -576,    0,    0,    0, -576, -576,    0,    0,    0,
			    0,    0,    0, -576,    0,    0,    0,    0, -576,    0,
			 -576, -576,    0,    0,    0, -576, -576,    0,    0,    0,
			    0,    0,    0,    0,    0, -576, -576,    0,    0, -576,
			    0,    0,    0,    0, -576, -576, -576,    0, -576, -576,

			    0, -576, -576, -576, -576,    0,    0,    0,    0,    0,
			 -576, -576, -576, -576, -576, -576, -576, -576, -576, -576,
			 -576, -576, -576, -576, -576, -576, -576, -576, -576, -576,
			 -576, -576, -576, -576, -576,    0,    0,    0,    0,    0,
			    0,    0,    0,    0, -576, -576, -576,    0,    0, -576,
			    0, -576,    0, -575,    0, -575, -576, -575, -576, -575,
			 -575, -575, -575,    0, -576, -575, -575,    0, -575,    0,
			    0,    0, -575, -575,    0,    0,    0,    0,    0,    0,
			 -575,    0,    0,    0,    0, -575,    0, -575, -575,    0,
			    0,    0, -575, -575,    0,    0,    0,    0,    0,    0,

			    0,    0, -575, -575,    0,    0, -575,    0,    0,    0,
			    0, -575, -575, -575,    0, -575, -575,    0, -575, -575,
			 -575, -575,    0,    0,    0,    0,    0, -575, -575, -575,
			 -575, -575, -575, -575, -575, -575, -575, -575, -575, -575,
			 -575, -575, -575, -575, -575, -575, -575, -575, -575, -575,
			 -575, -575,  962,    0,  961,    0,  960,    0,    0,    0,
			    0, -575, -575, -575,  959,  958, -575,  957, -575,    0,
			    0,  956,    0, -575,    0, -575,    0,    0,    0,  197,
			    0, -575,    0,    0,    0,    0,  196,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 1000, 2000)
		end

	yytable_template_4 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #4 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,  195,  955,    0,    0,  193,    0,    0,    0,    0,
			  192,   60,   59,    0,   58,  191,    0,   57,   56,   55,
			  189,    0,    0,    0,    0,    0,   53,   52,   51,   50,
			   49,   48,   47,   46,   45,   44,   43,   42,   41,   40,
			   39,   38,   37,   36,   35,   34,   33,   32,  187,  954,
			  953,    0,    0,   62,    0,    0,    0,    0,    0,    0,
			  185,   30,   29,  198,    0,  952,    0,  182,    0,    0,
			    0,    0,  181,    0,  951,    0,    0,    0,  197,    0,
			  950,    0,    0,    0,    0,  196,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			  195,  194,    0,    0,  193,    0,    0,    0,    0,  192,
			   60,   59,    0,   58,  191,  190,   57,   56,   55,  189,
			    0,    0,    0,  188,    0,   53,   52,   51,   50,   49,
			   48,   47,   46,   45,   44,   43,   42,   41,   40,   39,
			   38,   37,   36,   35,   34,   33,   32,  187,  186,    0,
			    0,    0,   62,    0,    0,    0,    0,    0,    0,  185,
			   30,   29,  198,  184,  807,    0,  182,  884,    0,    0,
			    0,  181,    0,    0,    0,  180,  179,  197,    0,    0,
			   91,  806,    0,    0,  196,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  195,

			  194,    0,    0,  193,    0,    0,    0,    0,  192,   60,
			   59,    0,   58,  191,  190,   57,   56,   55,  189,    0,
			    0,    0,  188,    0,   53,   52,   51,   50,   49,   48,
			   47,   46,   45,   44,   43,   42,   41,   40,   39,   38,
			   37,   36,   35,   34,   33,   32,  187,  186,    0,    0,
			    0,   62,    0,    0,    0,    0,    0, 1124,  185,   30,
			   29,  198,  184,  807,    0,  182,    0,    0,    0,    0,
			  181,    0,    0,    0,  180,  179,  197,    0,    0,   91,
			  806,    0,    0,  196,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  195,  194,

			    0,    0,  193,    0,    0,    0,    0,  192,   60,   59,
			    0,   58,  191,  190,   57,   56,   55,  189,    0,    0,
			    0,  188,    0,   53,   52,   51,   50,   49,   48,   47,
			   46,   45,   44,   43,   42,   41,   40,   39,   38,   37,
			   36,   35,   34,   33,   32,  187,  186,    0,    0,    0,
			   62,    0,    0,    0,    0,    0, 1052,  185,   30,   29,
			  198,  184,  183,    0,  182,    0,    0,    0,    0,  181,
			    0,    0,    0,  180,  179,  197,    0,    0,   91,    0,
			    0,    0,  196,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  195,  194,    0,

			    0,  193,    0,    0,    0,    0,  192,   60,   59,    0,
			   58,  191,  190,   57,   56,   55,  189,    0,    0,    0,
			  188,    0,   53,   52,   51,   50,   49,   48,   47,   46,
			   45,   44,   43,   42,   41,   40,   39,   38,   37,   36,
			   35,   34,   33,   32,  187,  186,    0,    0,    0,   62,
			    0,    0,    0,    0,    0,    0,  185,   30,   29,  198,
			  184,  183,    0,  182,    0,    0,    0,    0,  181,    0,
			    0,    0,  180,  179,  197,    0,    0,   91,    0,    0,
			    0,  196,    0,  979,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  195,  194,    0,    0,

			  193,    0,    0,    0,    0,  192,   60,   59,    0,   58,
			  191,  190,   57,   56,   55,  189,    0,    0,    0,  188,
			    0,   53,   52,   51,   50,   49,   48,   47,   46,   45,
			   44,   43,   42,   41,   40,   39,   38,   37,   36,   35,
			   34,   33,   32,  187,  186,    0,    0,    0,   62,    0,
			    0,    0,    0,    0,    0,  185,   30,   29,  198,  184,
			  183,    0,  182,    0,    0,    0,    0,  181,    0,    0,
			    0,  180,  179,  197,    0,    0,   91,    0,    0,    0,
			  196,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  195,  194,    0,    0,  193,

			    0,    0,    0,    0,  192,   60,   59,    0,   58,  191,
			  190,   57,   56,   55,  189,    0,    0,    0,  188,    0,
			   53,   52,   51,   50,   49,   48,   47,   46,   45,   44,
			   43,   42,   41,   40,   39,   38,   37,   36,   35,   34,
			   33,   32,  187,  186,    0,    0,    0,   62,    0,    0,
			    0,    0,    0,    0,  185,   30,   29,  198,  184,  183,
			    0,  182,    0,    0,    0,  831,  181,    0,    0,    0,
			  180,  179,  197,    0,    0,   91,    0,    0,    0,  196,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  195,  194,    0,    0,  193,    0,

			    0,    0,    0,  192,   60,   59,    0,   58,  191,  190,
			   57,   56,   55,  189,    0,    0,    0,  188,    0,   53,
			   52,   51,   50,   49,   48,   47,   46,   45,   44,   43,
			   42,   41,   40,   39,   38,   37,   36,   35,   34,   33,
			   32,  187,  186,    0,    0,    0,   62,    0,    0,    0,
			  669,    0,    0,  185,   30,   29,  198,  184,  183,    0,
			  182,  802,    0,    0,    0,  181,    0,    0,    0,  180,
			  179,  197,    0,    0,   91,    0,    0,    0,  196,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  195,  194,    0,    0,  193,    0,    0,

			    0,    0,  192,   60,   59,    0,   58,  191,  190,   57,
			   56,   55,  189,    0,    0,    0,  188,    0,   53,   52,
			   51,   50,   49,   48,   47,   46,   45,   44,   43,   42,
			   41,   40,   39,   38,   37,   36,   35,   34,   33,   32,
			  187,  186,    0,    0,    0,   62,    0,    0,    0,    0,
			    0,    0,  185,   30,   29,  198,  184,  183,    0,  182,
			    0,    0,    0,    0,  181,    0,    0,    0,  180,  179,
			  197,    0,    0,   91,    0,    0,    0,  196,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  195,  194,    0,    0,  193,  658,    0,    0,

			    0,  192,   60,   59,    0,   58,  191,  190,   57,   56,
			   55,  189,    0,    0,    0,  188,    0,   53,   52,   51,
			   50,   49,   48,   47,   46,   45,   44,   43,   42,   41,
			   40,   39,   38,   37,   36,   35,   34,   33,   32,  187,
			  186,    0,    0,    0,   62,    0,    0,    0,    0,    0,
			    0,  185,   30,   29,  198,  184,  183,    0,  182,    0,
			    0,    0,    0,  181,    0,    0,    0,  180,  179,  197,
			    0,    0,   91,    0,    0,    0,  196,    0,  542,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  195,  194,    0,    0,  193,    0,    0,    0,    0, yyDummy>>,
			1, 1000, 3000)
		end

	yytable_template_5 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #5 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  192,   60,   59,    0,   58,  191,  190,   57,   56,   55,
			  189,    0,    0,    0,  188,    0,   53,   52,   51,   50,
			   49,   48,   47,   46,   45,   44,   43,   42,   41,   40,
			   39,   38,   37,   36,   35,   34,   33,   32,  187,  186,
			    0,    0,    0,   62,    0,    0,    0,  540,    0,    0,
			  185,   30,   29,  198,  184,  183,    0,  182,    0,    0,
			    0,    0,  181,    0,    0,    0,  180,  179,  197,    0,
			    0,   91,    0,    0,    0,  196,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  195,  194,    0,    0,  193,    0,    0,    0,    0,  192,

			   60,   59,    0,   58,  191,  190,   57,   56,   55,  189,
			    0,    0,    0,  188,    0,   53,   52,   51,   50,   49,
			   48,   47,   46,   45,   44,   43,   42,   41,   40,   39,
			   38,   37,   36,   35,   34,   33,   32,  187,  186,    0,
			    0,    0,   62,    0,    0,    0,    0,    0,    0,  185,
			   30,   29,  198,  184,  183,    0,  182,    0,    0,    0,
			    0,  181,    0,    0,    0,  180,  179,  197,    0,    0,
			   91,    0,    0,    0,  196,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  195,
			  194,    0,    0,  193,    0,    0,    0,    0,  192,   60,

			   59,    0,   58,  191,  190,   57,   56,   55,  189,    0,
			    0,    0,  188,    0,   53,   52,   51,   50,   49,   48,
			   47,   46,   45,   44,   43,   42,   41,   40,   39,   38,
			   37,   36,   35,   34,   33,   32,  187,  186,    0,    0,
			    0,   62,    0,    0,    0,    0,    0,    0,  185,   30,
			   29,  198,  184,  183,    0,  182,    0,    0,    0,  364,
			  181,    0,    0,    0,  180,  179,  197,    0,    0,   91,
			    0,    0,    0,  196,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  195,  194,
			    0,    0,  193,    0,    0,    0,    0,  192,   60,   59,

			    0,   58,  191,  190,   57,   56,   55,  189,    0,   62,
			    0,  188,    0,   53,   52,   51,   50,   49,   48,   47,
			   46,   45,   44,   43,   42,   41,   40,   39,   38,   37,
			   36,   35,   34,   33,   32,  187,  186,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  185,   30,   29,
			    0,  184,  183,    0,  182,    0,    0,    0,    0,  181,
			    0,    0,    0,  180,  179,   61,   60,   59,   91,   58,
			    0,    0,   57,   56,   55,   54,    0,    0,    0,    0,
			    0,   53,   52,   51,   50,   49,   48,   47,   46,   45,
			   44,   43,   42,   41,   40,   39,   38,   37,   36,   35,

			   34,   33,   32,   31,    2,    0,  412,    0,    0,  313,
			    0,  -17,    0,  612,    0,  -17,   30,   29,  -17,    0,
			  312,  -17,    0,    0,  -17,    0, 1010,    0,    0,    0,
			    0,   28,   27,  -17,    0,  -17,  -17,    0,    0,    0,
			    0,  -17,    0,    0,    0, 1298,  998,   60,   59,    0,
			   58,  -17,  -17,    0,  -17,    0,   54,   57,   56,   55,
			    0,    0,   53,   52,   51,   50,   49,   48,   47,   46,
			   45,   44,   43,   42,   41,   40,   39,   38,   37,   36,
			   35,   34,   33,   32,   31,  361,    0,    0,    0,    0,
			  360,  359,  358,    0,  357,    0,    0,   30,   29,    0,

			    0,  997,    0,    0,    0,    0,    0,  327,    0,  611,
			  610,    0,   28,   27,  999,    0,    0,    0,    0,    0,
			  356,  355,  354,  353,  352,  351,  350,  349,  348,    0,
			    0,    0,    0,    0,  998,   60,   59,    0,   58,    0,
			    0,    0,    0,    0,   54,  345,  344,  343,  342,    0,
			   53,   52,   51,   50,   49,   48,   47,   46,   45,   44,
			   43,   42,   41,   40,   39,   38,   37,   36,   35,   34,
			   33,   32,   31,  361,    0,    0,    0,  657,  360,  359,
			  358,    0,  357,    0,    0,   30,   29,  361,    0,  997,
			    0,    0,  360,  359,  358,    0,  357,    0,    0,    0,

			   28,   27,    0,    0,    0,    0,    0,    0,  356,  355,
			  354,  353,  352,  351,  350,  349,  348,    0,    0,    0,
			    0,    0,  356,  355,  354,  353,  352,  351,  350,  349,
			  348,    0,    0,  345,  344,  343,  342,  598,    0,    0,
			    0,  347,    0,    0,    0,    0,  361,  345,  344,  343,
			  342,  360,  359,  358,    0,  357,    0,  361,    0,    0,
			    0,    0,  360,  359,  358,    0,  357,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  356,  355,  354,  353,  352,  351,  350,  349,  348,
			    0,    0,  356,  355,  354,  353,  352,  351,  350,  349,

			  348,  361,    0,    0,    0,    0,  345,  344,  343,  342,
			  400,  347,  830,    0,    0,    0,  361,  345,  344,  343,
			  342,  360,  359,  358,    0,  357,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  356,  355,  354,  353,
			  352,  351,  350,  349,  348,  361,    0,    0,    0,    0,
			  360,  356,  355,  354,  353,  352,  351,  350,  349,  348,
			  361,  345,  344,  343,  342,  360,  359,  358,  801,  357,
			  347,    0,    0,    0,    0,    0,  345,  344,  343,  342,
			  356,  355,  354,  353,  352,  351,  350,  349,  348,    0,
			    0,    0,    0,    0,    0,  356,  355,  354,  353,  352,

			  351,  350,  349,  348,  361,  345,  344,  343,  342,  360,
			  359,  358,    0,  357,  347,  346,    0,    0,    0,    0,
			  345,  344,  343,  342,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  356,
			  355,  354,  353,  352,  351,  350,  349,  348,  361,    0,
			    0,    0,    0,  360,  359,  358,  547,  357,    0,    0,
			    0,    0,    0,    0,  345,  344,  343,  342,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  356,  355,  354,  353,  352,  351,  350,
			  349,  348,    0,    0,    0,    0,    0,    0,  -16,    0,

			    0,    0,    0,    0,    0,  -20,    0,    0,  345,  344,
			  343,  342,  -20,    0,    0,  -20,    0,    0,  -20,    0,
			    2,    0,    0,    0,  139,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  -20,  -20,    0,  -20,    0,
			  138,   53,   52,   51,   50,   49,   48,   47,   46,   45,
			   44,   43,   42,   41,   40,   39,   38,   37,   36,   35,
			   34,   33,   32,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   29,  772,  771,
			  770,  769,  768,  767,  766,  765,  764,  763,  762,  761, yyDummy>>,
			1, 1000, 4000)
		end

	yytable_template_6 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #6 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  760,  759,  758,  757,  756,  755,  754,  753,  752,  751,
			  497,  496,  495,  494,  493,  492,  491,  490,  489,  488,
			  487,  486,  485,  484,  483,  482,    0,    0,  481,  480,
			  479,  478,  477,  476,  475,  474,  473,  472,  471,  470,
			  469,  468,  467,  466,  465,  464,  463,  462,    0,    0,
			  461,  460,  459,  458, yyDummy>>,
			1, 54, 5000)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5053)
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
			yyarray_subcopy (an_array, <<
			   15,   15,  122,   15,  283,  156,  338,  165,  159,  158,
			   15,    1,  161,   15,  106,  107,  135,  195,  521,  377,
			   15,  170,  171,  172,  303,  629,   90,  412,  165,  961,
			  925,  926,  377,  107,  194,  523,  143,  512,  146,  413,
			  177,  249,  632,  388,  413,  822,  420,  577,  140,  323,
			  370,  420,  372, 1177,   69,   69,   69,   69,   37,  394,
			   14,  624,   77,  626,   69,   14, 1115,   69,   83,   27,
			  144, 1232,   61,   62,   69,   22,   78,   37,  685,   94,
			   94,   94,   94,   98,   99,   71,  101,    0,  606,   94,
			    4,   14,   94,  124,  109,  110,  111,   15, 1030,   94,

			   14,  116,  116,    0,  135,  750,  121,  226,  227,  896,
			  897,   70,   74,   74,  685,   71,   39,    8,    9,  183,
			   67,   35,  119,   14,  139,   39, 1287,   18,   28,   43,
			  134,   22,  290,  291, 1183,   26,  238,  134,  127,   28,
			  102,  102,  157,   14,  123,  160,  238,  254,  134,  251,
			  165,   69,  289,  112,    8,    9,  896,  897,  135,  251,
			   14,   52,  939,  123,   18,  123,  181, 1328,   22, 1293,
			  124,   71,   26,   73,  665,  295,   94, 1109,  134,  253,
			  195,  389,   71,   72,   73,  789,  135,  557,  165,   14,
			  720,   71,   72,   73,  669,  197,  786,  405,   52,  687,

			  177,   71,   72,   73,   74,  119,  564,  565,  985,  579,
			   17,  774,   14,   11,  103,  120,  231,  231,  563,  124,
			  134,  739,   29,  868,   71,   72,   73,  501,  119,  244,
			  504,   14,  247,  607,   32,  413,  610,  122,  607,  124,
			   47,  610,  122,  127,   14,  260,   71,   72,   73,  226,
			  227,  586,   35,  588,  124,  590,   39, 1044, 1190,   14,
			  130,  131,   28,   14,  328,  119,   14,  896,  897,  284,
			  284,   74,  546,  120, 1061,  290,  291,  341, 1065,   11,
			  887,  432,  927,  434,  433,   14,  435,  395,  878,  304,
			  304,   38,  307,  442,  443,  444,  903,  457,   15,  102,

			   32,   28,  409,  181, 1044,   71,   35,   73,   23,  812,
			   39, 1088,  289,  121,   43,  123,  887,  195,  821,   34,
			   26, 1061,  337,   14,  127, 1065,   28,  130,  131,  213,
			  404,   22,  903,  136, 1121,   26,  668, 1232,   74,   45,
			   46,  225,  860,  371,   71,  373,   73,  362,   70,    8,
			    9,  683,  380,  381,  382,  120,   71,   72,   73,   18,
			   74,  181,  377,  247,  897,   14,  102, 1012,  742,   71,
			 1015,   73,   14,  742, 1151,  195,  696,  392,  698,  394,
			   14, 1121,  397,  105,  106,  545,  874,  451,  662,  111,
			  112,  113, 1287, 1180,  130,  131,  121,  412,  413,  917,

			  377,   71,   72,   73,  922,  420,   14,  122,  130,  131,
			   18,  388, 1019,  127,   22, 1044,  130,  131,   26,  124,
			  125,  695,    3,  898,  244,  240,  241,  930,   14,  607,
			  135, 1208, 1061, 1328,  498,   14, 1065, 1082,   14,  323,
			 1180,   14,  257, 1230,   52,   17,  934,  511, 1019,   71,
			   72,   73,  122,  337,  125,   14,  520,   29,  342,  343,
			  344,  345,   14,  134,  348,  349,  350,  351,  352,  353,
			  354,  355,  356,  357,  358,  359,  360,  361, 1255, 1086,
			  838,  839,  125,   22,  642,  643,  871,  962,   27, 1266,
			 1230,  134, 1121,  508,  839,  602,   58,  512,  120,  514,

			  515,  516,  517,  663,  979,  850,  643,   17,  523,  583,
			   28, 1044,  121, 1016,  651, 1086,   71,   72,   73,   29,
			   71,   72,   73,   74,   28,  124,   17,  601, 1061,   28,
			   17,   20, 1065,  124,   23, 1312,  135,  869,   29,  127,
			 1147,  615,   17,  558,  558,   34, 1333,  611,  103,  564,
			  565, 1180,   14,   71,   29,   73,  914,   28,   14,   74,
			   47,   48,  577,   50,  119,  580,  580,   71,   74,   73,
			  585,  586,   71,  588,   73,  590, 1147,  397, 1081,  130,
			  131, 1056,   71,   72,   73,   14,  563,  102, 1121,   28,
			  123,  124,  607, 1333,   14,  610,  102,  929,  717, 1206,

			   71, 1230,   73,  618, 1095,   14,   15, 1214,  623,  624,
			  625,  626,  127,   14,  604,  130,  131,  501,  682,   14,
			  504,  127,  124,  125,  130,  131,  641,  642,  643,   38,
			  737,   13,   71,  135,   73, 1206,   14,   23,  796,  654,
			  800, 1144,   14, 1214, 1135, 1136, 1149, 1180,   34, 1140,
			 1141, 1142,   14,   17,  669,  670,  540, 1264,  542,   71,
			   72,   73,  546,   14,  641,   29,  643,   61,   62,  697,
			  672,  699,  687,  650,  651,  749,  123,  124,  706,  707,
			  708, 1013,  684,   47,  748,   71,   72,   73,  508,   23,
			   14,  103,   14, 1264,   18,   14,   15, 1230,   22,  127,

			   34,   17,   26,  523, 1333,  720,   17,   12, 1211,   14,
			  725,  726,   14,   29,   70, 1066, 1067,   42,   29,   38,
			 1071, 1072, 1073,   41,  816,  817,   14,  742,   52,    8,
			    9,   47, 1223, 1224, 1225,   69,   47,   71,   72,   73,
			  717,   17,   42,  807,  851,   28,   17,  907, 1080,  105,
			  106, 1083,   14,   29,  861,  111,  112,  113,   29,  774,
			 1251, 1252, 1253,   14,  779,   48,   49,   50,   12,  103,
			   14,   47,   71,   72,   73,   74,   47,   12,  662,   14,
			  795,  796,  119,  667,  121,  119,  670,  121,   71,   72,
			   73,  122,  866,  124,  858,  955,  124,  125,  813,  814,

			 1333,  124,  125,  623,  624,  625,  626, 1158, 1159, 1160,
			  970,  695,  135,   14,  829,   16, 1148,  124,  125, 1098,
			  115,  127,  837,  838,  839,  124,  438,   37,  135,  441,
			   14,  130,  131,   14,   35,   36,  925,  926,   39,   12,
			   13,   14,   43,  455,  456,  128,   45, 1198, 1199, 1200,
			  865,  120,  926,  136,  928,  919,  871,  925,  926,  874,
			  837,  156,  839,   14,  159,   14,  958,  687,   41,   71,
			   72,   73,  849,  850,  889,  890,  891,  892,  120,  943,
			 1031,  896,  897,  898,  886,  122,   35,  124,  952,  981,
			   39,  120,  894,   69,   43,   71,   72,   73,  913,  914,

			  902,   69,  135,   71,   72,   73,   69,  127,   71,   72,
			   73,  925,  926,  925,  926,  799, 1036,  368,  369,  934,
			  925,  926,  135,  925,  926,  809,   71,   72,   73,  813,
			  925,  926,  121,  997,  123,  230,   14,   48,   49,  135,
			 1014,  236,   14,   14,   16, 1096,  961,  962, 1097,   14,
			 1042,   18,  725,  726,  774, 1047, 1105, 1106, 1107,  779,
			   71,   72,   73,   35,  979,  980,  121,   39,  123,   14,
			 1130,   43,   31,  121,  951,  123,  121,  120,  123,  124,
			 1100, 1045,  179,  180, 1048,   46,  127,  184,  283,   28,
			  119,  188,  121,  190,  889,  890,  891,  892,   71,   72, yyDummy>>,
			1, 1000, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   73,   68,   14,  122,   71,   72,   73,   74,  303,   48,
			   49,   50, 1172,   71,  120, 1030, 1018, 1032, 1032,  128,
			  134,  900, 1114, 1115,   22,   14,  905,  906,   24, 1044,
			   26, 1191,   71,   72,   73,  647,  648,   14, 1053,   14,
			   14, 1056,   14,   14, 1059,  865, 1061,  135,  115, 1064,
			 1065,  127,  119,   26,  874,  514,  515,  516,  517,   28,
			   71,   72,   73,  130,  131,  121, 1226,   61, 1228,  148,
			  149,  150,  956,  957,   61,  370,  371,  372,  373,   48,
			   49,   50, 1174, 1085,  119,  380,  381,  382,  700,  128,
			  702,   14,   14,  705, 1109,  124,  980,  136,  148,  149,

			  150,  124,   71,   72,   73,    0, 1121,  120, 1123,   39,
			  722,  723, 1127, 1128,  934,   14,   54, 1119,  125,  125,
			 1280,   18,   19,   20,  819,  125,  125,   35,  823,  824,
			  125,  134,   11,  125,  125, 1295,   14,  432,   17,  434,
			    5,   14,  122,   22, 1146,  124, 1025, 1026,   27,  135,
			   29, 1166,   31,   32,  120,   14, 1171,  124,   37,  128,
			  124,  124,  124,  120,  125, 1180,  125,  136,   47, 1053,
			 1054, 1055, 1332, 1002,  124, 1190,  127,  135, 1062, 1063,
			 1064, 1010, 1011,  108,  125, 1187,  125,   43,  113,  114,
			 1069, 1070,  125,  118,  119,  120,  125,  125,  125,  125,

			  895,   14,   14, 1205,  119,  124, 1298,  124,  124,  904,
			  135, 1213, 1227,  134,  125, 1230,  123, 1232, 1232, 1283,
			 1232,  125,  120,  148,  149,  150,    7, 1242,  122,  120,
			   11,  843,  844,   14,  120,  125,   17,  124,   16,   20,
			  165,  124,  124, 1127, 1128,  940,  941,  124,   29,  125,
			   31,   32,  177,  132,  125,  134,   37,   14,   14,    3,
			   20, 1263,  557,   14,   26,  134,   47,   48,  120,   50,
			  124,   14, 1287, 1287,  125, 1287,  571, 1156, 1157,  125,
			    8, 1296,  122,  127,  579,  122,  122,  120,  123,   14,
			  124,  986,  987,  124,   18,  125,  125,  123,  119,   28,

			  127,  226,  227,  228,  229,  127,   60,  232,  233,  234,
			 1194,  127,  127, 1328, 1328,   28, 1328,  127, 1333,   48,
			   49,   50, 1017,  119,  121, 1154,  127,   20,  127, 1024,
			   23,  125,  127,   74,   27,   48,   49,   50, 1217, 1218,
			   74,   34,   71,   72,   73,  125,   14,   28,   52,   57,
			   57,  120,   57,  134,   14, 1239,  281,  282,   71,   72,
			   73,  286,  287,  288,  289, 1249,  125,   48,   49,   50,
			    7,    7,    7, 1068,   24,  124,   28,  123,   71,   72,
			   73, 1260, 1261,  119,    7,   17, 1215,  125,  135, 1084,
			   71,   72,   73, 1178, 1089, 1090,   48,   49,   50,  128,

			  325,  696,  697,  698,  699,  919,   12,  136,   14,  596,
			  687,  706,  707,  708,  779,  128,   65,  501, 1187,   71,
			   72,   73,  412,  136,  412,  213, 1305, 1306,  121, 1258,
			  123,  124,  636,  107,  262,  614,  101,  262, 1317, 1318,
			  195,  934,  262,  107, 1273, 1274, 1275,  128,  259,  875,
			 1145, 1240,  377,  431,  397,  136,  107, 1152, 1153,  141,
			 1155,  720,  926,  388,   70, 1344, 1345,  571,  408,   75,
			   76,   77, 1328,   79, 1303,   28,  128, 1287,  695,  867,
			  809,   -1,  662,   -1,  136,   -1, 1315,   -1,   -1,   -1,
			 1319, 1320, 1321,   -1,   -1,   48,   49,   50,   -1,  105,

			  106,  107,  108,  109,  110,  111,  112,  113,   -1, 1204,
			 1339, 1340, 1341, 1342, 1209, 1210,   -1, 1212,   71,   72,
			   73, 1216,   -1,   -1,  130,  131,  132,  133, 1357, 1358,
			 1359,   23,   -1,   -1,   -1,   -1,   -1,   -1, 1367, 1368,
			 1369,   -1,   34,   -1, 1373, 1374, 1375,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   12,   13,   14,   15,
			   -1, 1256, 1257,   -1, 1259,   -1,   -1, 1262,   -1,   -1,
			   26,   -1, 1267, 1268,   -1,  128,   -1,   69,   -1,   71,
			   72,   73,   38,  136,   -1,   41,   -1,   -1,   -1,   45,
			   46,   -1,   -1,    6,   -1,    8,   -1,   10,   -1,   12,

			   13,   14,   15,   -1,   -1,   18,   19,   -1,   21, 1304,
			   -1,  103,   25,   26,   -1,   -1,   -1,   -1, 1313, 1314,
			   33, 1316,   -1,   -1,   -1,   38,   -1,   40,   41,  121,
			  555,  556,   45,   46,   -1,  560,  561,  562,  563,   -1,
			   -1,   -1,   55,   56,   -1,   -1,   59,   -1, 1343,   -1,
			   -1,   64,   65,   66,   -1,   68,   69,   -1,   71,   72,
			   73,   74,   -1,   -1,   -1,   -1,   -1,   80,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,  114,  115,  116,   -1,   -1,  119,   -1,  121,   -1,
			   -1,   -1,   -1,  126,  127,  128,  641,   -1,  643,   -1,
			   -1,  134,  135,    8,    9,  650,  651,   -1,   -1,   14,
			   -1,   -1,   -1,   18,   -1,   -1, 1031,   22,   -1,   -1,
			   -1,   26,   -1,   -1,   -1,   -1,    6,   -1,    8,   -1,
			   10,   11,   12,   13,   14,   15,   -1,   17,   18,   19,
			   -1,   21,   22,   -1,   -1,   25,   26,   52,   -1,   29,
			   30,   -1,   32,   33,   -1,   -1,   -1,   -1,   38,   -1,
			   40,   41,   42,   -1,   -1,   45,   46,   47,   -1,   -1,
			   -1,   -1,  717,   -1,   -1,   55,   56,   -1,   -1,   59,

			   60, 1096,   -1, 1098,   64,   65,   66,   -1,   68,   69,
			   70,   71,   72,   73,   74,   75,   76,   77,   78,   79,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,  104,  105,  106,  107,  108,  109,
			  110,  111,  112,  113,  114,  115,  116,   -1,  118,  119,
			   -1,  121,  122,   -1,  124,  125,  126,   -1,  128,   -1,
			  130,  131,  132,  133,  134,  135,   -1,   -1,   -1,   -1,
			   -1,    6,   -1,    8,   -1,   10,   11,   12,   13,   14,
			   15,   -1,   17,   18,   19,   -1,   21,   22,   -1,   -1,

			   25,   26,   -1,   -1,   29,   30,   -1,   32,   33,   -1,
			   -1,   -1,  837,   38,  839,   40,   41,   42,   -1,   -1,
			   45,   46,   47,   -1,  849,  850,   -1,   -1,   -1,   -1,
			   55,   56,   -1,   -1,   59,   60,   -1,   -1,   -1,   64,
			   65,   66,   -1,   68,   69,   70,   71,   72,   73,   74,
			   75,   76,   77,   78,   79,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,
			  105,  106,  107,  108,  109,  110,  111,  112,  113,  114,
			  115,  116,   -1,  118,  119,   42,  121,  122,   -1,  124, yyDummy>>,
			1, 1000, 1000)
		end

	yycheck_template_3 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #3 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  125,  126,   -1,  128,   -1,  130,  131,  132,  133,  134,
			  135,   -1,   -1,   -1,    7,   -1,   -1,   -1,   11,   -1,
			   -1,   14,   -1,   70,   17,   -1,  951,   20,   75,   76,
			   77,   -1,   79,   -1,   -1,   70,   29,   -1,   31,   32,
			   75,   76,   77,   -1,   37,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   47,   48,   -1,   50,  105,  106,
			  107,  108,  109,  110,  111,  112,  113,   -1,   -1,   -1,
			  105,  106,  107,  108,  109,  110,  111,  112,  113,   -1,
			   -1,   -1,   -1,  130,  131,  132,  133,   -1,   -1,   -1,
			   -1,   -1,   -1,    8,    9,  130,  131,  132,  133,   14,

			   -1,   -1,   -1,   18, 1029, 1030,   -1,   22, 1033, 1034,
			 1035,   26,    6,   -1,    8, 1040,   10,   11,   12,   13,
			   14,   15,   -1,   17,   18,   19,   -1,   21,   22,   -1,
			   -1,   25,   26,   -1,   -1,   29,   30,   52,   32,   33,
			   -1,  134,   -1,   -1,   38,   -1,   40,   41,   42,   -1,
			   -1,   45,   46,   47,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   55,   56,   -1,   -1,   59,   60,   -1,   -1,   -1,
			   64,   65,   66,   -1,   68,   69,   70,   71,   72,   73,
			   74,   75,   76,   77,   78,   79,   80,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,

			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			  104,  105,  106,  107,  108,  109,  110,  111,  112,  113,
			  114,  115,  116,   -1,  118,  119,   -1,  121,  122,   -1,
			  124,  125,  126,   -1,  128,   -1,  130,  131,  132,  133,
			  134,  135,    6,   -1,    8,   -1,   10,   -1,   12,   13,
			   14,   15,   -1,   -1,   18,   19,   -1,   21,   -1,   -1,
			   -1,   25,   26,   -1,   -1,   -1,   -1,   -1,   -1,   33,
			   -1,   -1,   -1,   -1,   38,   -1,   40,   41,   -1,   -1,
			   -1,   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   55,   56,   -1,   -1,   59,   -1,   61,   -1,   -1,

			   64,   65,   66,   -1,   68,   69,   -1,   71,   72,   73,
			   74,   -1,   -1,   -1,   -1,   -1,   80,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			  104,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			  114,  115,  116,   -1,   -1,  119,   -1,  121,   -1,    8,
			    9,   -1,  126,   -1,  128,   14,   -1,   -1,   -1,   18,
			  134,  135,    6,   22,    8,   -1,   10,   26,   12,   13,
			   14,   15,   -1,   -1,   18,   19,   -1,   21,   -1,   -1,
			   -1,   25,   26,   -1,   -1,   -1,   -1,   -1,   -1,   33,

			   -1,   -1,   -1,   52,   38,   -1,   40,   41,   -1,   -1,
			   -1,   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   55,   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,
			   64,   65,   66,   -1,   68,   69,   -1,   71,   72,   73,
			   74,   -1,   -1,   -1,   -1,   -1,   80,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			  104,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			  114,  115,  116,   -1,   -1,  119,   -1,  121,   -1,   -1,
			   -1,   -1,  126,   -1,  128,   -1,   -1,   -1,   -1,   -1,

			  134,  135,    6,   -1,    8,   -1,   10,   -1,   12,   13,
			   14,   15,   -1,   -1,   18,   19,   -1,   21,   -1,   -1,
			   -1,   25,   26,   -1,   -1,   -1,   -1,   -1,   -1,   33,
			   -1,   -1,   -1,   -1,   38,   -1,   40,   41,   -1,   -1,
			   -1,   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   55,   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,
			   64,   65,   66,   -1,   68,   69,   -1,   71,   72,   73,
			   74,   -1,   -1,   -1,   -1,   -1,   80,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,

			  104,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			  114,  115,  116,   -1,   -1,  119,   -1,  121,   -1,    6,
			   -1,    8,  126,   10,  128,   12,   13,   14,   15,   -1,
			  134,   18,   19,   -1,   21,   -1,   -1,   -1,   25,   26,
			   -1,   -1,   -1,   -1,   -1,   -1,   33,   -1,   -1,   -1,
			   -1,   38,   -1,   40,   41,   -1,   -1,   -1,   45,   46,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,
			   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,
			   -1,   68,   69,   -1,   71,   72,   73,   74,   -1,   -1,
			   -1,   -1,   -1,   80,   81,   82,   83,   84,   85,   86,

			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,  116,
			   -1,   -1,  119,   -1,  121,   -1,    6,   -1,    8,  126,
			   10,  128,   12,   13,   14,   15,   -1,  134,   18,   19,
			   -1,   21,   -1,   -1,   -1,   25,   26,   -1,   -1,   -1,
			   -1,   -1,   -1,   33,   -1,   -1,   -1,   -1,   38,   -1,
			   40,   41,   -1,   -1,   -1,   45,   46,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,
			   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,

			   -1,   71,   72,   73,   74,   -1,   -1,   -1,   -1,   -1,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,  104,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,  114,  115,  116,   -1,   -1,  119,
			   -1,  121,   -1,    6,   -1,    8,  126,   10,  128,   12,
			   13,   14,   15,   -1,  134,   18,   19,   -1,   21,   -1,
			   -1,   -1,   25,   26,   -1,   -1,   -1,   -1,   -1,   -1,
			   33,   -1,   -1,   -1,   -1,   38,   -1,   40,   41,   -1,
			   -1,   -1,   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   55,   56,   -1,   -1,   59,   -1,   -1,   -1,
			   -1,   64,   65,   66,   -1,   68,   69,   -1,   71,   72,
			   73,   74,   -1,   -1,   -1,   -1,   -1,   80,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,    6,   -1,    8,   -1,   10,   -1,   -1,   -1,
			   -1,  114,  115,  116,   18,   19,  119,   21,  121,   -1,
			   -1,   25,   -1,  126,   -1,  128,   -1,   -1,   -1,   33,
			   -1,  134,   -1,   -1,   -1,   -1,   40,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 1000, 2000)
		end

	yycheck_template_4 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #4 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   55,   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,
			   64,   65,   66,   -1,   68,   69,   -1,   71,   72,   73,
			   74,   -1,   -1,   -1,   -1,   -1,   80,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			  104,   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,
			  114,  115,  116,   18,   -1,  119,   -1,  121,   -1,   -1,
			   -1,   -1,  126,   -1,  128,   -1,   -1,   -1,   33,   -1,
			  134,   -1,   -1,   -1,   -1,   40,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   55,   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,
			   65,   66,   -1,   68,   69,   70,   71,   72,   73,   74,
			   -1,   -1,   -1,   78,   -1,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,   -1,
			   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,  114,
			  115,  116,   18,  118,  119,   -1,  121,  122,   -1,   -1,
			   -1,  126,   -1,   -1,   -1,  130,  131,   33,   -1,   -1,
			  135,  136,   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,

			   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,
			   66,   -1,   68,   69,   70,   71,   72,   73,   74,   -1,
			   -1,   -1,   78,   -1,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,   -1,   -1,
			   -1,    8,   -1,   -1,   -1,   -1,   -1,   14,  114,  115,
			  116,   18,  118,  119,   -1,  121,   -1,   -1,   -1,   -1,
			  126,   -1,   -1,   -1,  130,  131,   33,   -1,   -1,  135,
			  136,   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,

			   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,
			   -1,   68,   69,   70,   71,   72,   73,   74,   -1,   -1,
			   -1,   78,   -1,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,   -1,   -1,   -1,
			    8,   -1,   -1,   -1,   -1,   -1,   14,  114,  115,  116,
			   18,  118,  119,   -1,  121,   -1,   -1,   -1,   -1,  126,
			   -1,   -1,   -1,  130,  131,   33,   -1,   -1,  135,   -1,
			   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,

			   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,   -1,
			   68,   69,   70,   71,   72,   73,   74,   -1,   -1,   -1,
			   78,   -1,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,   -1,   -1,   -1,    8,
			   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,  116,   18,
			  118,  119,   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,
			   -1,   -1,  130,  131,   33,   -1,   -1,  135,   -1,   -1,
			   -1,   40,   -1,   42,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,

			   59,   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,
			   69,   70,   71,   72,   73,   74,   -1,   -1,   -1,   78,
			   -1,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,   -1,   -1,   -1,    8,   -1,
			   -1,   -1,   -1,   -1,   -1,  114,  115,  116,   18,  118,
			  119,   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,   -1,
			   -1,  130,  131,   33,   -1,   -1,  135,   -1,   -1,   -1,
			   40,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,

			   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,
			   70,   71,   72,   73,   74,   -1,   -1,   -1,   78,   -1,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,   -1,   -1,   -1,    8,   -1,   -1,
			   -1,   -1,   -1,   -1,  114,  115,  116,   18,  118,  119,
			   -1,  121,   -1,   -1,   -1,  125,  126,   -1,   -1,   -1,
			  130,  131,   33,   -1,   -1,  135,   -1,   -1,   -1,   40,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,

			   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,   70,
			   71,   72,   73,   74,   -1,   -1,   -1,   78,   -1,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,   -1,   -1,   -1,    8,   -1,   -1,   -1,
			   12,   -1,   -1,  114,  115,  116,   18,  118,  119,   -1,
			  121,  122,   -1,   -1,   -1,  126,   -1,   -1,   -1,  130,
			  131,   33,   -1,   -1,  135,   -1,   -1,   -1,   40,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,   -1,

			   -1,   -1,   64,   65,   66,   -1,   68,   69,   70,   71,
			   72,   73,   74,   -1,   -1,   -1,   78,   -1,   80,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,
			   -1,   -1,  114,  115,  116,   18,  118,  119,   -1,  121,
			   -1,   -1,   -1,   -1,  126,   -1,   -1,   -1,  130,  131,
			   33,   -1,   -1,  135,   -1,   -1,   -1,   40,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   55,   56,   -1,   -1,   59,   60,   -1,   -1,

			   -1,   64,   65,   66,   -1,   68,   69,   70,   71,   72,
			   73,   74,   -1,   -1,   -1,   78,   -1,   80,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,
			   -1,  114,  115,  116,   18,  118,  119,   -1,  121,   -1,
			   -1,   -1,   -1,  126,   -1,   -1,   -1,  130,  131,   33,
			   -1,   -1,  135,   -1,   -1,   -1,   40,   -1,   42,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   55,   56,   -1,   -1,   59,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 1000, 3000)
		end

	yycheck_template_5 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #5 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   64,   65,   66,   -1,   68,   69,   70,   71,   72,   73,
			   74,   -1,   -1,   -1,   78,   -1,   80,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			   -1,   -1,   -1,    8,   -1,   -1,   -1,   12,   -1,   -1,
			  114,  115,  116,   18,  118,  119,   -1,  121,   -1,   -1,
			   -1,   -1,  126,   -1,   -1,   -1,  130,  131,   33,   -1,
			   -1,  135,   -1,   -1,   -1,   40,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   55,   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,

			   65,   66,   -1,   68,   69,   70,   71,   72,   73,   74,
			   -1,   -1,   -1,   78,   -1,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,   -1,
			   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,  114,
			  115,  116,   18,  118,  119,   -1,  121,   -1,   -1,   -1,
			   -1,  126,   -1,   -1,   -1,  130,  131,   33,   -1,   -1,
			  135,   -1,   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,
			   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,

			   66,   -1,   68,   69,   70,   71,   72,   73,   74,   -1,
			   -1,   -1,   78,   -1,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,   -1,   -1,
			   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,
			  116,   18,  118,  119,   -1,  121,   -1,   -1,   -1,  125,
			  126,   -1,   -1,   -1,  130,  131,   33,   -1,   -1,  135,
			   -1,   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,
			   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,

			   -1,   68,   69,   70,   71,   72,   73,   74,   -1,    8,
			   -1,   78,   -1,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,  116,
			   -1,  118,  119,   -1,  121,   -1,   -1,   -1,   -1,  126,
			   -1,   -1,   -1,  130,  131,   64,   65,   66,  135,   68,
			   -1,   -1,   71,   72,   73,   74,   -1,   -1,   -1,   -1,
			   -1,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,

			   99,  100,  101,  102,   22,   -1,   20,   -1,   -1,   23,
			   -1,    7,   -1,   27,   -1,   11,  115,  116,   14,   -1,
			   34,   17,   -1,   -1,   20,   -1,   44,   -1,   -1,   -1,
			   -1,  130,  131,   29,   -1,   31,   32,   -1,   -1,   -1,
			   -1,   37,   -1,   -1,   -1,   30,   64,   65,   66,   -1,
			   68,   47,   48,   -1,   50,   -1,   74,   71,   72,   73,
			   -1,   -1,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,   70,   -1,   -1,   -1,   -1,
			   75,   76,   77,   -1,   79,   -1,   -1,  115,  116,   -1,

			   -1,  119,   -1,   -1,   -1,   -1,   -1,  121,   -1,  123,
			  124,   -1,  130,  131,   44,   -1,   -1,   -1,   -1,   -1,
			  105,  106,  107,  108,  109,  110,  111,  112,  113,   -1,
			   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,   -1,
			   -1,   -1,   -1,   -1,   74,  130,  131,  132,  133,   -1,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,   70,   -1,   -1,   -1,   60,   75,   76,
			   77,   -1,   79,   -1,   -1,  115,  116,   70,   -1,  119,
			   -1,   -1,   75,   76,   77,   -1,   79,   -1,   -1,   -1,

			  130,  131,   -1,   -1,   -1,   -1,   -1,   -1,  105,  106,
			  107,  108,  109,  110,  111,  112,  113,   -1,   -1,   -1,
			   -1,   -1,  105,  106,  107,  108,  109,  110,  111,  112,
			  113,   -1,   -1,  130,  131,  132,  133,  134,   -1,   -1,
			   -1,  124,   -1,   -1,   -1,   -1,   70,  130,  131,  132,
			  133,   75,   76,   77,   -1,   79,   -1,   70,   -1,   -1,
			   -1,   -1,   75,   76,   77,   -1,   79,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  105,  106,  107,  108,  109,  110,  111,  112,  113,
			   -1,   -1,  105,  106,  107,  108,  109,  110,  111,  112,

			  113,   70,   -1,   -1,   -1,   -1,  130,  131,  132,  133,
			  134,  124,  125,   -1,   -1,   -1,   70,  130,  131,  132,
			  133,   75,   76,   77,   -1,   79,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  105,  106,  107,  108,
			  109,  110,  111,  112,  113,   70,   -1,   -1,   -1,   -1,
			   75,  105,  106,  107,  108,  109,  110,  111,  112,  113,
			   70,  130,  131,  132,  133,   75,   76,   77,  122,   79,
			  124,   -1,   -1,   -1,   -1,   -1,  130,  131,  132,  133,
			  105,  106,  107,  108,  109,  110,  111,  112,  113,   -1,
			   -1,   -1,   -1,   -1,   -1,  105,  106,  107,  108,  109,

			  110,  111,  112,  113,   70,  130,  131,  132,  133,   75,
			   76,   77,   -1,   79,  124,  125,   -1,   -1,   -1,   -1,
			  130,  131,  132,  133,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  105,
			  106,  107,  108,  109,  110,  111,  112,  113,   70,   -1,
			   -1,   -1,   -1,   75,   76,   77,  122,   79,   -1,   -1,
			   -1,   -1,   -1,   -1,  130,  131,  132,  133,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  105,  106,  107,  108,  109,  110,  111,
			  112,  113,   -1,   -1,   -1,   -1,   -1,   -1,    0,   -1,

			   -1,   -1,   -1,   -1,   -1,    7,   -1,   -1,  130,  131,
			  132,  133,   14,   -1,   -1,   17,   -1,   -1,   20,   -1,
			   22,   -1,   -1,   -1,   26,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   47,   48,   -1,   50,   -1,
			   52,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  116,   80,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91, yyDummy>>,
			1, 1000, 4000)
		end

	yycheck_template_6 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #6 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   -1,   -1,   98,   99,
			  100,  101,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   -1,   -1,
			   98,   99,  100,  101, yyDummy>>,
			1, 54, 5000)
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

	yyvs43: SPECIAL [ET_CLIENT_ITEM]
			-- Stack for semantic values of type ET_CLIENT_ITEM

	yyvsc43: INTEGER
			-- Capacity of semantic value stack `yyvs43'

	yyvsp43: INTEGER
			-- Top of semantic value stack `yyvs43'

	yyspecial_routines43: KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM]
			-- Routines that ought to be in SPECIAL [ET_CLIENT_ITEM]

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

	yyFinal: INTEGER is 1384
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 137
			-- Number of tokens

	yyLast: INTEGER is 5053
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 369
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 382
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



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
					if yy_goto = yyReduce then
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
					end
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
