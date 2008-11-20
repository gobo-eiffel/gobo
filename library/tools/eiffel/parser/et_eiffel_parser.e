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
			yyvsp117 := -1
			yyvsp118 := -1
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
			if yyvs117 /= Void then
				yyvs117.clear_all
			end
			if yyvs118 /= Void then
				yyvs118.clear_all
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
			when 117 then
				yyvsp117 := yyvsp117 - 1
			when 118 then
				yyvsp118 := yyvsp118 - 1
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
					--|#line 222 "et_eiffel_parser.y"
				yy_do_action_1
			when 2 then
					--|#line 226 "et_eiffel_parser.y"
				yy_do_action_2
			when 3 then
					--|#line 234 "et_eiffel_parser.y"
				yy_do_action_3
			when 4 then
					--|#line 243 "et_eiffel_parser.y"
				yy_do_action_4
			when 5 then
					--|#line 244 "et_eiffel_parser.y"
				yy_do_action_5
			when 6 then
					--|#line 244 "et_eiffel_parser.y"
				yy_do_action_6
			when 7 then
					--|#line 255 "et_eiffel_parser.y"
				yy_do_action_7
			when 8 then
					--|#line 261 "et_eiffel_parser.y"
				yy_do_action_8
			when 9 then
					--|#line 267 "et_eiffel_parser.y"
				yy_do_action_9
			when 10 then
					--|#line 273 "et_eiffel_parser.y"
				yy_do_action_10
			when 11 then
					--|#line 279 "et_eiffel_parser.y"
				yy_do_action_11
			when 12 then
					--|#line 285 "et_eiffel_parser.y"
				yy_do_action_12
			when 13 then
					--|#line 285 "et_eiffel_parser.y"
				yy_do_action_13
			when 14 then
					--|#line 301 "et_eiffel_parser.y"
				yy_do_action_14
			when 15 then
					--|#line 306 "et_eiffel_parser.y"
				yy_do_action_15
			when 16 then
					--|#line 321 "et_eiffel_parser.y"
				yy_do_action_16
			when 17 then
					--|#line 326 "et_eiffel_parser.y"
				yy_do_action_17
			when 18 then
					--|#line 328 "et_eiffel_parser.y"
				yy_do_action_18
			when 19 then
					--|#line 328 "et_eiffel_parser.y"
				yy_do_action_19
			when 20 then
					--|#line 341 "et_eiffel_parser.y"
				yy_do_action_20
			when 21 then
					--|#line 343 "et_eiffel_parser.y"
				yy_do_action_21
			when 22 then
					--|#line 347 "et_eiffel_parser.y"
				yy_do_action_22
			when 23 then
					--|#line 358 "et_eiffel_parser.y"
				yy_do_action_23
			when 24 then
					--|#line 370 "et_eiffel_parser.y"
				yy_do_action_24
			when 25 then
					--|#line 370 "et_eiffel_parser.y"
				yy_do_action_25
			when 26 then
					--|#line 379 "et_eiffel_parser.y"
				yy_do_action_26
			when 27 then
					--|#line 379 "et_eiffel_parser.y"
				yy_do_action_27
			when 28 then
					--|#line 390 "et_eiffel_parser.y"
				yy_do_action_28
			when 29 then
					--|#line 397 "et_eiffel_parser.y"
				yy_do_action_29
			when 30 then
					--|#line 401 "et_eiffel_parser.y"
				yy_do_action_30
			when 31 then
					--|#line 407 "et_eiffel_parser.y"
				yy_do_action_31
			when 32 then
					--|#line 409 "et_eiffel_parser.y"
				yy_do_action_32
			when 33 then
					--|#line 414 "et_eiffel_parser.y"
				yy_do_action_33
			when 34 then
					--|#line 425 "et_eiffel_parser.y"
				yy_do_action_34
			when 35 then
					--|#line 434 "et_eiffel_parser.y"
				yy_do_action_35
			when 36 then
					--|#line 436 "et_eiffel_parser.y"
				yy_do_action_36
			when 37 then
					--|#line 438 "et_eiffel_parser.y"
				yy_do_action_37
			when 38 then
					--|#line 440 "et_eiffel_parser.y"
				yy_do_action_38
			when 39 then
					--|#line 442 "et_eiffel_parser.y"
				yy_do_action_39
			when 40 then
					--|#line 444 "et_eiffel_parser.y"
				yy_do_action_40
			when 41 then
					--|#line 446 "et_eiffel_parser.y"
				yy_do_action_41
			when 42 then
					--|#line 448 "et_eiffel_parser.y"
				yy_do_action_42
			when 43 then
					--|#line 450 "et_eiffel_parser.y"
				yy_do_action_43
			when 44 then
					--|#line 454 "et_eiffel_parser.y"
				yy_do_action_44
			when 45 then
					--|#line 465 "et_eiffel_parser.y"
				yy_do_action_45
			when 46 then
					--|#line 475 "et_eiffel_parser.y"
				yy_do_action_46
			when 47 then
					--|#line 486 "et_eiffel_parser.y"
				yy_do_action_47
			when 48 then
					--|#line 497 "et_eiffel_parser.y"
				yy_do_action_48
			when 49 then
					--|#line 510 "et_eiffel_parser.y"
				yy_do_action_49
			when 50 then
					--|#line 512 "et_eiffel_parser.y"
				yy_do_action_50
			when 51 then
					--|#line 516 "et_eiffel_parser.y"
				yy_do_action_51
			when 52 then
					--|#line 518 "et_eiffel_parser.y"
				yy_do_action_52
			when 53 then
					--|#line 524 "et_eiffel_parser.y"
				yy_do_action_53
			when 54 then
					--|#line 528 "et_eiffel_parser.y"
				yy_do_action_54
			when 55 then
					--|#line 534 "et_eiffel_parser.y"
				yy_do_action_55
			when 56 then
					--|#line 534 "et_eiffel_parser.y"
				yy_do_action_56
			when 57 then
					--|#line 548 "et_eiffel_parser.y"
				yy_do_action_57
			when 58 then
					--|#line 559 "et_eiffel_parser.y"
				yy_do_action_58
			when 59 then
					--|#line 568 "et_eiffel_parser.y"
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
					--|#line 626 "et_eiffel_parser.y"
				yy_do_action_67
			when 68 then
					--|#line 633 "et_eiffel_parser.y"
				yy_do_action_68
			when 69 then
					--|#line 642 "et_eiffel_parser.y"
				yy_do_action_69
			when 70 then
					--|#line 644 "et_eiffel_parser.y"
				yy_do_action_70
			when 71 then
					--|#line 644 "et_eiffel_parser.y"
				yy_do_action_71
			when 72 then
					--|#line 657 "et_eiffel_parser.y"
				yy_do_action_72
			when 73 then
					--|#line 668 "et_eiffel_parser.y"
				yy_do_action_73
			when 74 then
					--|#line 676 "et_eiffel_parser.y"
				yy_do_action_74
			when 75 then
					--|#line 685 "et_eiffel_parser.y"
				yy_do_action_75
			when 76 then
					--|#line 687 "et_eiffel_parser.y"
				yy_do_action_76
			when 77 then
					--|#line 689 "et_eiffel_parser.y"
				yy_do_action_77
			when 78 then
					--|#line 691 "et_eiffel_parser.y"
				yy_do_action_78
			when 79 then
					--|#line 693 "et_eiffel_parser.y"
				yy_do_action_79
			when 80 then
					--|#line 701 "et_eiffel_parser.y"
				yy_do_action_80
			when 81 then
					--|#line 709 "et_eiffel_parser.y"
				yy_do_action_81
			when 82 then
					--|#line 711 "et_eiffel_parser.y"
				yy_do_action_82
			when 83 then
					--|#line 713 "et_eiffel_parser.y"
				yy_do_action_83
			when 84 then
					--|#line 715 "et_eiffel_parser.y"
				yy_do_action_84
			when 85 then
					--|#line 717 "et_eiffel_parser.y"
				yy_do_action_85
			when 86 then
					--|#line 725 "et_eiffel_parser.y"
				yy_do_action_86
			when 87 then
					--|#line 735 "et_eiffel_parser.y"
				yy_do_action_87
			when 88 then
					--|#line 737 "et_eiffel_parser.y"
				yy_do_action_88
			when 89 then
					--|#line 739 "et_eiffel_parser.y"
				yy_do_action_89
			when 90 then
					--|#line 741 "et_eiffel_parser.y"
				yy_do_action_90
			when 91 then
					--|#line 743 "et_eiffel_parser.y"
				yy_do_action_91
			when 92 then
					--|#line 751 "et_eiffel_parser.y"
				yy_do_action_92
			when 93 then
					--|#line 759 "et_eiffel_parser.y"
				yy_do_action_93
			when 94 then
					--|#line 761 "et_eiffel_parser.y"
				yy_do_action_94
			when 95 then
					--|#line 763 "et_eiffel_parser.y"
				yy_do_action_95
			when 96 then
					--|#line 765 "et_eiffel_parser.y"
				yy_do_action_96
			when 97 then
					--|#line 767 "et_eiffel_parser.y"
				yy_do_action_97
			when 98 then
					--|#line 775 "et_eiffel_parser.y"
				yy_do_action_98
			when 99 then
					--|#line 785 "et_eiffel_parser.y"
				yy_do_action_99
			when 100 then
					--|#line 787 "et_eiffel_parser.y"
				yy_do_action_100
			when 101 then
					--|#line 791 "et_eiffel_parser.y"
				yy_do_action_101
			when 102 then
					--|#line 794 "et_eiffel_parser.y"
				yy_do_action_102
			when 103 then
					--|#line 802 "et_eiffel_parser.y"
				yy_do_action_103
			when 104 then
					--|#line 813 "et_eiffel_parser.y"
				yy_do_action_104
			when 105 then
					--|#line 818 "et_eiffel_parser.y"
				yy_do_action_105
			when 106 then
					--|#line 823 "et_eiffel_parser.y"
				yy_do_action_106
			when 107 then
					--|#line 830 "et_eiffel_parser.y"
				yy_do_action_107
			when 108 then
					--|#line 839 "et_eiffel_parser.y"
				yy_do_action_108
			when 109 then
					--|#line 841 "et_eiffel_parser.y"
				yy_do_action_109
			when 110 then
					--|#line 845 "et_eiffel_parser.y"
				yy_do_action_110
			when 111 then
					--|#line 848 "et_eiffel_parser.y"
				yy_do_action_111
			when 112 then
					--|#line 854 "et_eiffel_parser.y"
				yy_do_action_112
			when 113 then
					--|#line 862 "et_eiffel_parser.y"
				yy_do_action_113
			when 114 then
					--|#line 867 "et_eiffel_parser.y"
				yy_do_action_114
			when 115 then
					--|#line 872 "et_eiffel_parser.y"
				yy_do_action_115
			when 116 then
					--|#line 877 "et_eiffel_parser.y"
				yy_do_action_116
			when 117 then
					--|#line 888 "et_eiffel_parser.y"
				yy_do_action_117
			when 118 then
					--|#line 899 "et_eiffel_parser.y"
				yy_do_action_118
			when 119 then
					--|#line 912 "et_eiffel_parser.y"
				yy_do_action_119
			when 120 then
					--|#line 921 "et_eiffel_parser.y"
				yy_do_action_120
			when 121 then
					--|#line 932 "et_eiffel_parser.y"
				yy_do_action_121
			when 122 then
					--|#line 934 "et_eiffel_parser.y"
				yy_do_action_122
			when 123 then
					--|#line 940 "et_eiffel_parser.y"
				yy_do_action_123
			when 124 then
					--|#line 942 "et_eiffel_parser.y"
				yy_do_action_124
			when 125 then
					--|#line 944 "et_eiffel_parser.y"
				yy_do_action_125
			when 126 then
					--|#line 951 "et_eiffel_parser.y"
				yy_do_action_126
			when 127 then
					--|#line 959 "et_eiffel_parser.y"
				yy_do_action_127
			when 128 then
					--|#line 966 "et_eiffel_parser.y"
				yy_do_action_128
			when 129 then
					--|#line 973 "et_eiffel_parser.y"
				yy_do_action_129
			when 130 then
					--|#line 981 "et_eiffel_parser.y"
				yy_do_action_130
			when 131 then
					--|#line 988 "et_eiffel_parser.y"
				yy_do_action_131
			when 132 then
					--|#line 995 "et_eiffel_parser.y"
				yy_do_action_132
			when 133 then
					--|#line 1002 "et_eiffel_parser.y"
				yy_do_action_133
			when 134 then
					--|#line 1011 "et_eiffel_parser.y"
				yy_do_action_134
			when 135 then
					--|#line 1020 "et_eiffel_parser.y"
				yy_do_action_135
			when 136 then
					--|#line 1027 "et_eiffel_parser.y"
				yy_do_action_136
			when 137 then
					--|#line 1034 "et_eiffel_parser.y"
				yy_do_action_137
			when 138 then
					--|#line 1041 "et_eiffel_parser.y"
				yy_do_action_138
			when 139 then
					--|#line 1048 "et_eiffel_parser.y"
				yy_do_action_139
			when 140 then
					--|#line 1057 "et_eiffel_parser.y"
				yy_do_action_140
			when 141 then
					--|#line 1064 "et_eiffel_parser.y"
				yy_do_action_141
			when 142 then
					--|#line 1071 "et_eiffel_parser.y"
				yy_do_action_142
			when 143 then
					--|#line 1078 "et_eiffel_parser.y"
				yy_do_action_143
			when 144 then
					--|#line 1087 "et_eiffel_parser.y"
				yy_do_action_144
			when 145 then
					--|#line 1094 "et_eiffel_parser.y"
				yy_do_action_145
			when 146 then
					--|#line 1105 "et_eiffel_parser.y"
				yy_do_action_146
			when 147 then
					--|#line 1107 "et_eiffel_parser.y"
				yy_do_action_147
			when 148 then
					--|#line 1107 "et_eiffel_parser.y"
				yy_do_action_148
			when 149 then
					--|#line 1120 "et_eiffel_parser.y"
				yy_do_action_149
			when 150 then
					--|#line 1127 "et_eiffel_parser.y"
				yy_do_action_150
			when 151 then
					--|#line 1135 "et_eiffel_parser.y"
				yy_do_action_151
			when 152 then
					--|#line 1144 "et_eiffel_parser.y"
				yy_do_action_152
			when 153 then
					--|#line 1153 "et_eiffel_parser.y"
				yy_do_action_153
			when 154 then
					--|#line 1164 "et_eiffel_parser.y"
				yy_do_action_154
			when 155 then
					--|#line 1166 "et_eiffel_parser.y"
				yy_do_action_155
			when 156 then
					--|#line 1166 "et_eiffel_parser.y"
				yy_do_action_156
			when 157 then
					--|#line 1179 "et_eiffel_parser.y"
				yy_do_action_157
			when 158 then
					--|#line 1181 "et_eiffel_parser.y"
				yy_do_action_158
			when 159 then
					--|#line 1185 "et_eiffel_parser.y"
				yy_do_action_159
			when 160 then
					--|#line 1196 "et_eiffel_parser.y"
				yy_do_action_160
			when 161 then
					--|#line 1196 "et_eiffel_parser.y"
				yy_do_action_161
			when 162 then
					--|#line 1211 "et_eiffel_parser.y"
				yy_do_action_162
			when 163 then
					--|#line 1215 "et_eiffel_parser.y"
				yy_do_action_163
			when 164 then
					--|#line 1220 "et_eiffel_parser.y"
				yy_do_action_164
			when 165 then
					--|#line 1220 "et_eiffel_parser.y"
				yy_do_action_165
			when 166 then
					--|#line 1230 "et_eiffel_parser.y"
				yy_do_action_166
			when 167 then
					--|#line 1234 "et_eiffel_parser.y"
				yy_do_action_167
			when 168 then
					--|#line 1245 "et_eiffel_parser.y"
				yy_do_action_168
			when 169 then
					--|#line 1253 "et_eiffel_parser.y"
				yy_do_action_169
			when 170 then
					--|#line 1264 "et_eiffel_parser.y"
				yy_do_action_170
			when 171 then
					--|#line 1264 "et_eiffel_parser.y"
				yy_do_action_171
			when 172 then
					--|#line 1275 "et_eiffel_parser.y"
				yy_do_action_172
			when 173 then
					--|#line 1279 "et_eiffel_parser.y"
				yy_do_action_173
			when 174 then
					--|#line 1286 "et_eiffel_parser.y"
				yy_do_action_174
			when 175 then
					--|#line 1294 "et_eiffel_parser.y"
				yy_do_action_175
			when 176 then
					--|#line 1301 "et_eiffel_parser.y"
				yy_do_action_176
			when 177 then
					--|#line 1311 "et_eiffel_parser.y"
				yy_do_action_177
			when 178 then
					--|#line 1320 "et_eiffel_parser.y"
				yy_do_action_178
			when 179 then
					--|#line 1331 "et_eiffel_parser.y"
				yy_do_action_179
			when 180 then
					--|#line 1333 "et_eiffel_parser.y"
				yy_do_action_180
			when 181 then
					--|#line 1333 "et_eiffel_parser.y"
				yy_do_action_181
			when 182 then
					--|#line 1346 "et_eiffel_parser.y"
				yy_do_action_182
			when 183 then
					--|#line 1348 "et_eiffel_parser.y"
				yy_do_action_183
			when 184 then
					--|#line 1352 "et_eiffel_parser.y"
				yy_do_action_184
			when 185 then
					--|#line 1354 "et_eiffel_parser.y"
				yy_do_action_185
			when 186 then
					--|#line 1354 "et_eiffel_parser.y"
				yy_do_action_186
			when 187 then
					--|#line 1367 "et_eiffel_parser.y"
				yy_do_action_187
			when 188 then
					--|#line 1369 "et_eiffel_parser.y"
				yy_do_action_188
			when 189 then
					--|#line 1373 "et_eiffel_parser.y"
				yy_do_action_189
			when 190 then
					--|#line 1375 "et_eiffel_parser.y"
				yy_do_action_190
			when 191 then
					--|#line 1375 "et_eiffel_parser.y"
				yy_do_action_191
			when 192 then
					--|#line 1388 "et_eiffel_parser.y"
				yy_do_action_192
			when 193 then
					--|#line 1390 "et_eiffel_parser.y"
				yy_do_action_193
			when 194 then
					--|#line 1394 "et_eiffel_parser.y"
				yy_do_action_194
			when 195 then
					--|#line 1405 "et_eiffel_parser.y"
				yy_do_action_195
			when 196 then
					--|#line 1413 "et_eiffel_parser.y"
				yy_do_action_196
			when 197 then
					--|#line 1422 "et_eiffel_parser.y"
				yy_do_action_197
			when 198 then
					--|#line 1433 "et_eiffel_parser.y"
				yy_do_action_198
			when 199 then
					--|#line 1435 "et_eiffel_parser.y"
				yy_do_action_199
			when 200 then
					--|#line 1442 "et_eiffel_parser.y"
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
					--|#line 1449 "et_eiffel_parser.y"
				yy_do_action_201
			when 202 then
					--|#line 1460 "et_eiffel_parser.y"
				yy_do_action_202
			when 203 then
					--|#line 1460 "et_eiffel_parser.y"
				yy_do_action_203
			when 204 then
					--|#line 1475 "et_eiffel_parser.y"
				yy_do_action_204
			when 205 then
					--|#line 1477 "et_eiffel_parser.y"
				yy_do_action_205
			when 206 then
					--|#line 1479 "et_eiffel_parser.y"
				yy_do_action_206
			when 207 then
					--|#line 1479 "et_eiffel_parser.y"
				yy_do_action_207
			when 208 then
					--|#line 1491 "et_eiffel_parser.y"
				yy_do_action_208
			when 209 then
					--|#line 1491 "et_eiffel_parser.y"
				yy_do_action_209
			when 210 then
					--|#line 1503 "et_eiffel_parser.y"
				yy_do_action_210
			when 211 then
					--|#line 1505 "et_eiffel_parser.y"
				yy_do_action_211
			when 212 then
					--|#line 1507 "et_eiffel_parser.y"
				yy_do_action_212
			when 213 then
					--|#line 1507 "et_eiffel_parser.y"
				yy_do_action_213
			when 214 then
					--|#line 1519 "et_eiffel_parser.y"
				yy_do_action_214
			when 215 then
					--|#line 1519 "et_eiffel_parser.y"
				yy_do_action_215
			when 216 then
					--|#line 1533 "et_eiffel_parser.y"
				yy_do_action_216
			when 217 then
					--|#line 1544 "et_eiffel_parser.y"
				yy_do_action_217
			when 218 then
					--|#line 1552 "et_eiffel_parser.y"
				yy_do_action_218
			when 219 then
					--|#line 1561 "et_eiffel_parser.y"
				yy_do_action_219
			when 220 then
					--|#line 1572 "et_eiffel_parser.y"
				yy_do_action_220
			when 221 then
					--|#line 1574 "et_eiffel_parser.y"
				yy_do_action_221
			when 222 then
					--|#line 1578 "et_eiffel_parser.y"
				yy_do_action_222
			when 223 then
					--|#line 1578 "et_eiffel_parser.y"
				yy_do_action_223
			when 224 then
					--|#line 1591 "et_eiffel_parser.y"
				yy_do_action_224
			when 225 then
					--|#line 1598 "et_eiffel_parser.y"
				yy_do_action_225
			when 226 then
					--|#line 1605 "et_eiffel_parser.y"
				yy_do_action_226
			when 227 then
					--|#line 1614 "et_eiffel_parser.y"
				yy_do_action_227
			when 228 then
					--|#line 1623 "et_eiffel_parser.y"
				yy_do_action_228
			when 229 then
					--|#line 1627 "et_eiffel_parser.y"
				yy_do_action_229
			when 230 then
					--|#line 1633 "et_eiffel_parser.y"
				yy_do_action_230
			when 231 then
					--|#line 1635 "et_eiffel_parser.y"
				yy_do_action_231
			when 232 then
					--|#line 1635 "et_eiffel_parser.y"
				yy_do_action_232
			when 233 then
					--|#line 1648 "et_eiffel_parser.y"
				yy_do_action_233
			when 234 then
					--|#line 1659 "et_eiffel_parser.y"
				yy_do_action_234
			when 235 then
					--|#line 1668 "et_eiffel_parser.y"
				yy_do_action_235
			when 236 then
					--|#line 1679 "et_eiffel_parser.y"
				yy_do_action_236
			when 237 then
					--|#line 1684 "et_eiffel_parser.y"
				yy_do_action_237
			when 238 then
					--|#line 1688 "et_eiffel_parser.y"
				yy_do_action_238
			when 239 then
					--|#line 1696 "et_eiffel_parser.y"
				yy_do_action_239
			when 240 then
					--|#line 1703 "et_eiffel_parser.y"
				yy_do_action_240
			when 241 then
					--|#line 1712 "et_eiffel_parser.y"
				yy_do_action_241
			when 242 then
					--|#line 1719 "et_eiffel_parser.y"
				yy_do_action_242
			when 243 then
					--|#line 1728 "et_eiffel_parser.y"
				yy_do_action_243
			when 244 then
					--|#line 1733 "et_eiffel_parser.y"
				yy_do_action_244
			when 245 then
					--|#line 1740 "et_eiffel_parser.y"
				yy_do_action_245
			when 246 then
					--|#line 1741 "et_eiffel_parser.y"
				yy_do_action_246
			when 247 then
					--|#line 1742 "et_eiffel_parser.y"
				yy_do_action_247
			when 248 then
					--|#line 1743 "et_eiffel_parser.y"
				yy_do_action_248
			when 249 then
					--|#line 1748 "et_eiffel_parser.y"
				yy_do_action_249
			when 250 then
					--|#line 1753 "et_eiffel_parser.y"
				yy_do_action_250
			when 251 then
					--|#line 1759 "et_eiffel_parser.y"
				yy_do_action_251
			when 252 then
					--|#line 1764 "et_eiffel_parser.y"
				yy_do_action_252
			when 253 then
					--|#line 1770 "et_eiffel_parser.y"
				yy_do_action_253
			when 254 then
					--|#line 1776 "et_eiffel_parser.y"
				yy_do_action_254
			when 255 then
					--|#line 1785 "et_eiffel_parser.y"
				yy_do_action_255
			when 256 then
					--|#line 1790 "et_eiffel_parser.y"
				yy_do_action_256
			when 257 then
					--|#line 1796 "et_eiffel_parser.y"
				yy_do_action_257
			when 258 then
					--|#line 1801 "et_eiffel_parser.y"
				yy_do_action_258
			when 259 then
					--|#line 1807 "et_eiffel_parser.y"
				yy_do_action_259
			when 260 then
					--|#line 1813 "et_eiffel_parser.y"
				yy_do_action_260
			when 261 then
					--|#line 1822 "et_eiffel_parser.y"
				yy_do_action_261
			when 262 then
					--|#line 1824 "et_eiffel_parser.y"
				yy_do_action_262
			when 263 then
					--|#line 1826 "et_eiffel_parser.y"
				yy_do_action_263
			when 264 then
					--|#line 1828 "et_eiffel_parser.y"
				yy_do_action_264
			when 265 then
					--|#line 1836 "et_eiffel_parser.y"
				yy_do_action_265
			when 266 then
					--|#line 1838 "et_eiffel_parser.y"
				yy_do_action_266
			when 267 then
					--|#line 1846 "et_eiffel_parser.y"
				yy_do_action_267
			when 268 then
					--|#line 1849 "et_eiffel_parser.y"
				yy_do_action_268
			when 269 then
					--|#line 1858 "et_eiffel_parser.y"
				yy_do_action_269
			when 270 then
					--|#line 1862 "et_eiffel_parser.y"
				yy_do_action_270
			when 271 then
					--|#line 1872 "et_eiffel_parser.y"
				yy_do_action_271
			when 272 then
					--|#line 1875 "et_eiffel_parser.y"
				yy_do_action_272
			when 273 then
					--|#line 1884 "et_eiffel_parser.y"
				yy_do_action_273
			when 274 then
					--|#line 1888 "et_eiffel_parser.y"
				yy_do_action_274
			when 275 then
					--|#line 1898 "et_eiffel_parser.y"
				yy_do_action_275
			when 276 then
					--|#line 1900 "et_eiffel_parser.y"
				yy_do_action_276
			when 277 then
					--|#line 1908 "et_eiffel_parser.y"
				yy_do_action_277
			when 278 then
					--|#line 1911 "et_eiffel_parser.y"
				yy_do_action_278
			when 279 then
					--|#line 1920 "et_eiffel_parser.y"
				yy_do_action_279
			when 280 then
					--|#line 1923 "et_eiffel_parser.y"
				yy_do_action_280
			when 281 then
					--|#line 1932 "et_eiffel_parser.y"
				yy_do_action_281
			when 282 then
					--|#line 1936 "et_eiffel_parser.y"
				yy_do_action_282
			when 283 then
					--|#line 1948 "et_eiffel_parser.y"
				yy_do_action_283
			when 284 then
					--|#line 1951 "et_eiffel_parser.y"
				yy_do_action_284
			when 285 then
					--|#line 1955 "et_eiffel_parser.y"
				yy_do_action_285
			when 286 then
					--|#line 1958 "et_eiffel_parser.y"
				yy_do_action_286
			when 287 then
					--|#line 1962 "et_eiffel_parser.y"
				yy_do_action_287
			when 288 then
					--|#line 1964 "et_eiffel_parser.y"
				yy_do_action_288
			when 289 then
					--|#line 1967 "et_eiffel_parser.y"
				yy_do_action_289
			when 290 then
					--|#line 1970 "et_eiffel_parser.y"
				yy_do_action_290
			when 291 then
					--|#line 1976 "et_eiffel_parser.y"
				yy_do_action_291
			when 292 then
					--|#line 1984 "et_eiffel_parser.y"
				yy_do_action_292
			when 293 then
					--|#line 1988 "et_eiffel_parser.y"
				yy_do_action_293
			when 294 then
					--|#line 1990 "et_eiffel_parser.y"
				yy_do_action_294
			when 295 then
					--|#line 1994 "et_eiffel_parser.y"
				yy_do_action_295
			when 296 then
					--|#line 1996 "et_eiffel_parser.y"
				yy_do_action_296
			when 297 then
					--|#line 2000 "et_eiffel_parser.y"
				yy_do_action_297
			when 298 then
					--|#line 2002 "et_eiffel_parser.y"
				yy_do_action_298
			when 299 then
					--|#line 2008 "et_eiffel_parser.y"
				yy_do_action_299
			when 300 then
					--|#line 2010 "et_eiffel_parser.y"
				yy_do_action_300
			when 301 then
					--|#line 2012 "et_eiffel_parser.y"
				yy_do_action_301
			when 302 then
					--|#line 2014 "et_eiffel_parser.y"
				yy_do_action_302
			when 303 then
					--|#line 2016 "et_eiffel_parser.y"
				yy_do_action_303
			when 304 then
					--|#line 2018 "et_eiffel_parser.y"
				yy_do_action_304
			when 305 then
					--|#line 2020 "et_eiffel_parser.y"
				yy_do_action_305
			when 306 then
					--|#line 2022 "et_eiffel_parser.y"
				yy_do_action_306
			when 307 then
					--|#line 2024 "et_eiffel_parser.y"
				yy_do_action_307
			when 308 then
					--|#line 2026 "et_eiffel_parser.y"
				yy_do_action_308
			when 309 then
					--|#line 2028 "et_eiffel_parser.y"
				yy_do_action_309
			when 310 then
					--|#line 2030 "et_eiffel_parser.y"
				yy_do_action_310
			when 311 then
					--|#line 2032 "et_eiffel_parser.y"
				yy_do_action_311
			when 312 then
					--|#line 2034 "et_eiffel_parser.y"
				yy_do_action_312
			when 313 then
					--|#line 2036 "et_eiffel_parser.y"
				yy_do_action_313
			when 314 then
					--|#line 2038 "et_eiffel_parser.y"
				yy_do_action_314
			when 315 then
					--|#line 2040 "et_eiffel_parser.y"
				yy_do_action_315
			when 316 then
					--|#line 2042 "et_eiffel_parser.y"
				yy_do_action_316
			when 317 then
					--|#line 2044 "et_eiffel_parser.y"
				yy_do_action_317
			when 318 then
					--|#line 2046 "et_eiffel_parser.y"
				yy_do_action_318
			when 319 then
					--|#line 2048 "et_eiffel_parser.y"
				yy_do_action_319
			when 320 then
					--|#line 2050 "et_eiffel_parser.y"
				yy_do_action_320
			when 321 then
					--|#line 2052 "et_eiffel_parser.y"
				yy_do_action_321
			when 322 then
					--|#line 2055 "et_eiffel_parser.y"
				yy_do_action_322
			when 323 then
					--|#line 2057 "et_eiffel_parser.y"
				yy_do_action_323
			when 324 then
					--|#line 2059 "et_eiffel_parser.y"
				yy_do_action_324
			when 325 then
					--|#line 2061 "et_eiffel_parser.y"
				yy_do_action_325
			when 326 then
					--|#line 2063 "et_eiffel_parser.y"
				yy_do_action_326
			when 327 then
					--|#line 2065 "et_eiffel_parser.y"
				yy_do_action_327
			when 328 then
					--|#line 2067 "et_eiffel_parser.y"
				yy_do_action_328
			when 329 then
					--|#line 2069 "et_eiffel_parser.y"
				yy_do_action_329
			when 330 then
					--|#line 2071 "et_eiffel_parser.y"
				yy_do_action_330
			when 331 then
					--|#line 2073 "et_eiffel_parser.y"
				yy_do_action_331
			when 332 then
					--|#line 2075 "et_eiffel_parser.y"
				yy_do_action_332
			when 333 then
					--|#line 2077 "et_eiffel_parser.y"
				yy_do_action_333
			when 334 then
					--|#line 2079 "et_eiffel_parser.y"
				yy_do_action_334
			when 335 then
					--|#line 2081 "et_eiffel_parser.y"
				yy_do_action_335
			when 336 then
					--|#line 2083 "et_eiffel_parser.y"
				yy_do_action_336
			when 337 then
					--|#line 2085 "et_eiffel_parser.y"
				yy_do_action_337
			when 338 then
					--|#line 2087 "et_eiffel_parser.y"
				yy_do_action_338
			when 339 then
					--|#line 2089 "et_eiffel_parser.y"
				yy_do_action_339
			when 340 then
					--|#line 2093 "et_eiffel_parser.y"
				yy_do_action_340
			when 341 then
					--|#line 2095 "et_eiffel_parser.y"
				yy_do_action_341
			when 342 then
					--|#line 2099 "et_eiffel_parser.y"
				yy_do_action_342
			when 343 then
					--|#line 2101 "et_eiffel_parser.y"
				yy_do_action_343
			when 344 then
					--|#line 2103 "et_eiffel_parser.y"
				yy_do_action_344
			when 345 then
					--|#line 2105 "et_eiffel_parser.y"
				yy_do_action_345
			when 346 then
					--|#line 2107 "et_eiffel_parser.y"
				yy_do_action_346
			when 347 then
					--|#line 2109 "et_eiffel_parser.y"
				yy_do_action_347
			when 348 then
					--|#line 2111 "et_eiffel_parser.y"
				yy_do_action_348
			when 349 then
					--|#line 2113 "et_eiffel_parser.y"
				yy_do_action_349
			when 350 then
					--|#line 2115 "et_eiffel_parser.y"
				yy_do_action_350
			when 351 then
					--|#line 2117 "et_eiffel_parser.y"
				yy_do_action_351
			when 352 then
					--|#line 2119 "et_eiffel_parser.y"
				yy_do_action_352
			when 353 then
					--|#line 2121 "et_eiffel_parser.y"
				yy_do_action_353
			when 354 then
					--|#line 2123 "et_eiffel_parser.y"
				yy_do_action_354
			when 355 then
					--|#line 2125 "et_eiffel_parser.y"
				yy_do_action_355
			when 356 then
					--|#line 2127 "et_eiffel_parser.y"
				yy_do_action_356
			when 357 then
					--|#line 2129 "et_eiffel_parser.y"
				yy_do_action_357
			when 358 then
					--|#line 2131 "et_eiffel_parser.y"
				yy_do_action_358
			when 359 then
					--|#line 2133 "et_eiffel_parser.y"
				yy_do_action_359
			when 360 then
					--|#line 2135 "et_eiffel_parser.y"
				yy_do_action_360
			when 361 then
					--|#line 2137 "et_eiffel_parser.y"
				yy_do_action_361
			when 362 then
					--|#line 2139 "et_eiffel_parser.y"
				yy_do_action_362
			when 363 then
					--|#line 2142 "et_eiffel_parser.y"
				yy_do_action_363
			when 364 then
					--|#line 2148 "et_eiffel_parser.y"
				yy_do_action_364
			when 365 then
					--|#line 2155 "et_eiffel_parser.y"
				yy_do_action_365
			when 366 then
					--|#line 2157 "et_eiffel_parser.y"
				yy_do_action_366
			when 367 then
					--|#line 2165 "et_eiffel_parser.y"
				yy_do_action_367
			when 368 then
					--|#line 2176 "et_eiffel_parser.y"
				yy_do_action_368
			when 369 then
					--|#line 2183 "et_eiffel_parser.y"
				yy_do_action_369
			when 370 then
					--|#line 2190 "et_eiffel_parser.y"
				yy_do_action_370
			when 371 then
					--|#line 2200 "et_eiffel_parser.y"
				yy_do_action_371
			when 372 then
					--|#line 2211 "et_eiffel_parser.y"
				yy_do_action_372
			when 373 then
					--|#line 2218 "et_eiffel_parser.y"
				yy_do_action_373
			when 374 then
					--|#line 2227 "et_eiffel_parser.y"
				yy_do_action_374
			when 375 then
					--|#line 2236 "et_eiffel_parser.y"
				yy_do_action_375
			when 376 then
					--|#line 2245 "et_eiffel_parser.y"
				yy_do_action_376
			when 377 then
					--|#line 2254 "et_eiffel_parser.y"
				yy_do_action_377
			when 378 then
					--|#line 2265 "et_eiffel_parser.y"
				yy_do_action_378
			when 379 then
					--|#line 2267 "et_eiffel_parser.y"
				yy_do_action_379
			when 380 then
					--|#line 2269 "et_eiffel_parser.y"
				yy_do_action_380
			when 381 then
					--|#line 2269 "et_eiffel_parser.y"
				yy_do_action_381
			when 382 then
					--|#line 2282 "et_eiffel_parser.y"
				yy_do_action_382
			when 383 then
					--|#line 2289 "et_eiffel_parser.y"
				yy_do_action_383
			when 384 then
					--|#line 2296 "et_eiffel_parser.y"
				yy_do_action_384
			when 385 then
					--|#line 2306 "et_eiffel_parser.y"
				yy_do_action_385
			when 386 then
					--|#line 2317 "et_eiffel_parser.y"
				yy_do_action_386
			when 387 then
					--|#line 2324 "et_eiffel_parser.y"
				yy_do_action_387
			when 388 then
					--|#line 2333 "et_eiffel_parser.y"
				yy_do_action_388
			when 389 then
					--|#line 2342 "et_eiffel_parser.y"
				yy_do_action_389
			when 390 then
					--|#line 2351 "et_eiffel_parser.y"
				yy_do_action_390
			when 391 then
					--|#line 2360 "et_eiffel_parser.y"
				yy_do_action_391
			when 392 then
					--|#line 2371 "et_eiffel_parser.y"
				yy_do_action_392
			when 393 then
					--|#line 2373 "et_eiffel_parser.y"
				yy_do_action_393
			when 394 then
					--|#line 2375 "et_eiffel_parser.y"
				yy_do_action_394
			when 395 then
					--|#line 2377 "et_eiffel_parser.y"
				yy_do_action_395
			when 396 then
					--|#line 2379 "et_eiffel_parser.y"
				yy_do_action_396
			when 397 then
					--|#line 2381 "et_eiffel_parser.y"
				yy_do_action_397
			when 398 then
					--|#line 2383 "et_eiffel_parser.y"
				yy_do_action_398
			when 399 then
					--|#line 2385 "et_eiffel_parser.y"
				yy_do_action_399
			when 400 then
					--|#line 2389 "et_eiffel_parser.y"
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
					--|#line 2391 "et_eiffel_parser.y"
				yy_do_action_401
			when 402 then
					--|#line 2393 "et_eiffel_parser.y"
				yy_do_action_402
			when 403 then
					--|#line 2395 "et_eiffel_parser.y"
				yy_do_action_403
			when 404 then
					--|#line 2397 "et_eiffel_parser.y"
				yy_do_action_404
			when 405 then
					--|#line 2401 "et_eiffel_parser.y"
				yy_do_action_405
			when 406 then
					--|#line 2403 "et_eiffel_parser.y"
				yy_do_action_406
			when 407 then
					--|#line 2405 "et_eiffel_parser.y"
				yy_do_action_407
			when 408 then
					--|#line 2407 "et_eiffel_parser.y"
				yy_do_action_408
			when 409 then
					--|#line 2409 "et_eiffel_parser.y"
				yy_do_action_409
			when 410 then
					--|#line 2413 "et_eiffel_parser.y"
				yy_do_action_410
			when 411 then
					--|#line 2415 "et_eiffel_parser.y"
				yy_do_action_411
			when 412 then
					--|#line 2419 "et_eiffel_parser.y"
				yy_do_action_412
			when 413 then
					--|#line 2421 "et_eiffel_parser.y"
				yy_do_action_413
			when 414 then
					--|#line 2425 "et_eiffel_parser.y"
				yy_do_action_414
			when 415 then
					--|#line 2429 "et_eiffel_parser.y"
				yy_do_action_415
			when 416 then
					--|#line 2431 "et_eiffel_parser.y"
				yy_do_action_416
			when 417 then
					--|#line 2435 "et_eiffel_parser.y"
				yy_do_action_417
			when 418 then
					--|#line 2437 "et_eiffel_parser.y"
				yy_do_action_418
			when 419 then
					--|#line 2441 "et_eiffel_parser.y"
				yy_do_action_419
			when 420 then
					--|#line 2443 "et_eiffel_parser.y"
				yy_do_action_420
			when 421 then
					--|#line 2445 "et_eiffel_parser.y"
				yy_do_action_421
			when 422 then
					--|#line 2451 "et_eiffel_parser.y"
				yy_do_action_422
			when 423 then
					--|#line 2453 "et_eiffel_parser.y"
				yy_do_action_423
			when 424 then
					--|#line 2459 "et_eiffel_parser.y"
				yy_do_action_424
			when 425 then
					--|#line 2461 "et_eiffel_parser.y"
				yy_do_action_425
			when 426 then
					--|#line 2465 "et_eiffel_parser.y"
				yy_do_action_426
			when 427 then
					--|#line 2467 "et_eiffel_parser.y"
				yy_do_action_427
			when 428 then
					--|#line 2469 "et_eiffel_parser.y"
				yy_do_action_428
			when 429 then
					--|#line 2471 "et_eiffel_parser.y"
				yy_do_action_429
			when 430 then
					--|#line 2473 "et_eiffel_parser.y"
				yy_do_action_430
			when 431 then
					--|#line 2481 "et_eiffel_parser.y"
				yy_do_action_431
			when 432 then
					--|#line 2489 "et_eiffel_parser.y"
				yy_do_action_432
			when 433 then
					--|#line 2491 "et_eiffel_parser.y"
				yy_do_action_433
			when 434 then
					--|#line 2493 "et_eiffel_parser.y"
				yy_do_action_434
			when 435 then
					--|#line 2495 "et_eiffel_parser.y"
				yy_do_action_435
			when 436 then
					--|#line 2497 "et_eiffel_parser.y"
				yy_do_action_436
			when 437 then
					--|#line 2505 "et_eiffel_parser.y"
				yy_do_action_437
			when 438 then
					--|#line 2515 "et_eiffel_parser.y"
				yy_do_action_438
			when 439 then
					--|#line 2517 "et_eiffel_parser.y"
				yy_do_action_439
			when 440 then
					--|#line 2519 "et_eiffel_parser.y"
				yy_do_action_440
			when 441 then
					--|#line 2521 "et_eiffel_parser.y"
				yy_do_action_441
			when 442 then
					--|#line 2523 "et_eiffel_parser.y"
				yy_do_action_442
			when 443 then
					--|#line 2531 "et_eiffel_parser.y"
				yy_do_action_443
			when 444 then
					--|#line 2539 "et_eiffel_parser.y"
				yy_do_action_444
			when 445 then
					--|#line 2541 "et_eiffel_parser.y"
				yy_do_action_445
			when 446 then
					--|#line 2543 "et_eiffel_parser.y"
				yy_do_action_446
			when 447 then
					--|#line 2545 "et_eiffel_parser.y"
				yy_do_action_447
			when 448 then
					--|#line 2547 "et_eiffel_parser.y"
				yy_do_action_448
			when 449 then
					--|#line 2555 "et_eiffel_parser.y"
				yy_do_action_449
			when 450 then
					--|#line 2565 "et_eiffel_parser.y"
				yy_do_action_450
			when 451 then
					--|#line 2567 "et_eiffel_parser.y"
				yy_do_action_451
			when 452 then
					--|#line 2569 "et_eiffel_parser.y"
				yy_do_action_452
			when 453 then
					--|#line 2571 "et_eiffel_parser.y"
				yy_do_action_453
			when 454 then
					--|#line 2573 "et_eiffel_parser.y"
				yy_do_action_454
			when 455 then
					--|#line 2575 "et_eiffel_parser.y"
				yy_do_action_455
			when 456 then
					--|#line 2583 "et_eiffel_parser.y"
				yy_do_action_456
			when 457 then
					--|#line 2591 "et_eiffel_parser.y"
				yy_do_action_457
			when 458 then
					--|#line 2593 "et_eiffel_parser.y"
				yy_do_action_458
			when 459 then
					--|#line 2595 "et_eiffel_parser.y"
				yy_do_action_459
			when 460 then
					--|#line 2597 "et_eiffel_parser.y"
				yy_do_action_460
			when 461 then
					--|#line 2599 "et_eiffel_parser.y"
				yy_do_action_461
			when 462 then
					--|#line 2607 "et_eiffel_parser.y"
				yy_do_action_462
			when 463 then
					--|#line 2617 "et_eiffel_parser.y"
				yy_do_action_463
			when 464 then
					--|#line 2621 "et_eiffel_parser.y"
				yy_do_action_464
			when 465 then
					--|#line 2623 "et_eiffel_parser.y"
				yy_do_action_465
			when 466 then
					--|#line 2627 "et_eiffel_parser.y"
				yy_do_action_466
			when 467 then
					--|#line 2630 "et_eiffel_parser.y"
				yy_do_action_467
			when 468 then
					--|#line 2638 "et_eiffel_parser.y"
				yy_do_action_468
			when 469 then
					--|#line 2645 "et_eiffel_parser.y"
				yy_do_action_469
			when 470 then
					--|#line 2656 "et_eiffel_parser.y"
				yy_do_action_470
			when 471 then
					--|#line 2661 "et_eiffel_parser.y"
				yy_do_action_471
			when 472 then
					--|#line 2666 "et_eiffel_parser.y"
				yy_do_action_472
			when 473 then
					--|#line 2673 "et_eiffel_parser.y"
				yy_do_action_473
			when 474 then
					--|#line 2679 "et_eiffel_parser.y"
				yy_do_action_474
			when 475 then
					--|#line 2688 "et_eiffel_parser.y"
				yy_do_action_475
			when 476 then
					--|#line 2690 "et_eiffel_parser.y"
				yy_do_action_476
			when 477 then
					--|#line 2694 "et_eiffel_parser.y"
				yy_do_action_477
			when 478 then
					--|#line 2697 "et_eiffel_parser.y"
				yy_do_action_478
			when 479 then
					--|#line 2703 "et_eiffel_parser.y"
				yy_do_action_479
			when 480 then
					--|#line 2711 "et_eiffel_parser.y"
				yy_do_action_480
			when 481 then
					--|#line 2716 "et_eiffel_parser.y"
				yy_do_action_481
			when 482 then
					--|#line 2721 "et_eiffel_parser.y"
				yy_do_action_482
			when 483 then
					--|#line 2726 "et_eiffel_parser.y"
				yy_do_action_483
			when 484 then
					--|#line 2737 "et_eiffel_parser.y"
				yy_do_action_484
			when 485 then
					--|#line 2748 "et_eiffel_parser.y"
				yy_do_action_485
			when 486 then
					--|#line 2761 "et_eiffel_parser.y"
				yy_do_action_486
			when 487 then
					--|#line 2770 "et_eiffel_parser.y"
				yy_do_action_487
			when 488 then
					--|#line 2779 "et_eiffel_parser.y"
				yy_do_action_488
			when 489 then
					--|#line 2781 "et_eiffel_parser.y"
				yy_do_action_489
			when 490 then
					--|#line 2789 "et_eiffel_parser.y"
				yy_do_action_490
			when 491 then
					--|#line 2797 "et_eiffel_parser.y"
				yy_do_action_491
			when 492 then
					--|#line 2799 "et_eiffel_parser.y"
				yy_do_action_492
			when 493 then
					--|#line 2807 "et_eiffel_parser.y"
				yy_do_action_493
			when 494 then
					--|#line 2815 "et_eiffel_parser.y"
				yy_do_action_494
			when 495 then
					--|#line 2819 "et_eiffel_parser.y"
				yy_do_action_495
			when 496 then
					--|#line 2827 "et_eiffel_parser.y"
				yy_do_action_496
			when 497 then
					--|#line 2837 "et_eiffel_parser.y"
				yy_do_action_497
			when 498 then
					--|#line 2847 "et_eiffel_parser.y"
				yy_do_action_498
			when 499 then
					--|#line 2859 "et_eiffel_parser.y"
				yy_do_action_499
			when 500 then
					--|#line 2861 "et_eiffel_parser.y"
				yy_do_action_500
			when 501 then
					--|#line 2868 "et_eiffel_parser.y"
				yy_do_action_501
			when 502 then
					--|#line 2870 "et_eiffel_parser.y"
				yy_do_action_502
			when 503 then
					--|#line 2877 "et_eiffel_parser.y"
				yy_do_action_503
			when 504 then
					--|#line 2879 "et_eiffel_parser.y"
				yy_do_action_504
			when 505 then
					--|#line 2886 "et_eiffel_parser.y"
				yy_do_action_505
			when 506 then
					--|#line 2888 "et_eiffel_parser.y"
				yy_do_action_506
			when 507 then
					--|#line 2895 "et_eiffel_parser.y"
				yy_do_action_507
			when 508 then
					--|#line 2897 "et_eiffel_parser.y"
				yy_do_action_508
			when 509 then
					--|#line 2904 "et_eiffel_parser.y"
				yy_do_action_509
			when 510 then
					--|#line 2906 "et_eiffel_parser.y"
				yy_do_action_510
			when 511 then
					--|#line 2913 "et_eiffel_parser.y"
				yy_do_action_511
			when 512 then
					--|#line 2915 "et_eiffel_parser.y"
				yy_do_action_512
			when 513 then
					--|#line 2922 "et_eiffel_parser.y"
				yy_do_action_513
			when 514 then
					--|#line 2933 "et_eiffel_parser.y"
				yy_do_action_514
			when 515 then
					--|#line 2933 "et_eiffel_parser.y"
				yy_do_action_515
			when 516 then
					--|#line 2954 "et_eiffel_parser.y"
				yy_do_action_516
			when 517 then
					--|#line 2956 "et_eiffel_parser.y"
				yy_do_action_517
			when 518 then
					--|#line 2958 "et_eiffel_parser.y"
				yy_do_action_518
			when 519 then
					--|#line 2960 "et_eiffel_parser.y"
				yy_do_action_519
			when 520 then
					--|#line 2962 "et_eiffel_parser.y"
				yy_do_action_520
			when 521 then
					--|#line 2964 "et_eiffel_parser.y"
				yy_do_action_521
			when 522 then
					--|#line 2966 "et_eiffel_parser.y"
				yy_do_action_522
			when 523 then
					--|#line 2968 "et_eiffel_parser.y"
				yy_do_action_523
			when 524 then
					--|#line 2970 "et_eiffel_parser.y"
				yy_do_action_524
			when 525 then
					--|#line 2972 "et_eiffel_parser.y"
				yy_do_action_525
			when 526 then
					--|#line 2974 "et_eiffel_parser.y"
				yy_do_action_526
			when 527 then
					--|#line 2982 "et_eiffel_parser.y"
				yy_do_action_527
			when 528 then
					--|#line 2995 "et_eiffel_parser.y"
				yy_do_action_528
			when 529 then
					--|#line 2997 "et_eiffel_parser.y"
				yy_do_action_529
			when 530 then
					--|#line 2999 "et_eiffel_parser.y"
				yy_do_action_530
			when 531 then
					--|#line 3001 "et_eiffel_parser.y"
				yy_do_action_531
			when 532 then
					--|#line 3003 "et_eiffel_parser.y"
				yy_do_action_532
			when 533 then
					--|#line 3009 "et_eiffel_parser.y"
				yy_do_action_533
			when 534 then
					--|#line 3011 "et_eiffel_parser.y"
				yy_do_action_534
			when 535 then
					--|#line 3013 "et_eiffel_parser.y"
				yy_do_action_535
			when 536 then
					--|#line 3015 "et_eiffel_parser.y"
				yy_do_action_536
			when 537 then
					--|#line 3019 "et_eiffel_parser.y"
				yy_do_action_537
			when 538 then
					--|#line 3021 "et_eiffel_parser.y"
				yy_do_action_538
			when 539 then
					--|#line 3023 "et_eiffel_parser.y"
				yy_do_action_539
			when 540 then
					--|#line 3025 "et_eiffel_parser.y"
				yy_do_action_540
			when 541 then
					--|#line 3029 "et_eiffel_parser.y"
				yy_do_action_541
			when 542 then
					--|#line 3031 "et_eiffel_parser.y"
				yy_do_action_542
			when 543 then
					--|#line 3037 "et_eiffel_parser.y"
				yy_do_action_543
			when 544 then
					--|#line 3039 "et_eiffel_parser.y"
				yy_do_action_544
			when 545 then
					--|#line 3041 "et_eiffel_parser.y"
				yy_do_action_545
			when 546 then
					--|#line 3043 "et_eiffel_parser.y"
				yy_do_action_546
			when 547 then
					--|#line 3047 "et_eiffel_parser.y"
				yy_do_action_547
			when 548 then
					--|#line 3054 "et_eiffel_parser.y"
				yy_do_action_548
			when 549 then
					--|#line 3061 "et_eiffel_parser.y"
				yy_do_action_549
			when 550 then
					--|#line 3070 "et_eiffel_parser.y"
				yy_do_action_550
			when 551 then
					--|#line 3081 "et_eiffel_parser.y"
				yy_do_action_551
			when 552 then
					--|#line 3083 "et_eiffel_parser.y"
				yy_do_action_552
			when 553 then
					--|#line 3087 "et_eiffel_parser.y"
				yy_do_action_553
			when 554 then
					--|#line 3089 "et_eiffel_parser.y"
				yy_do_action_554
			when 555 then
					--|#line 3096 "et_eiffel_parser.y"
				yy_do_action_555
			when 556 then
					--|#line 3103 "et_eiffel_parser.y"
				yy_do_action_556
			when 557 then
					--|#line 3112 "et_eiffel_parser.y"
				yy_do_action_557
			when 558 then
					--|#line 3121 "et_eiffel_parser.y"
				yy_do_action_558
			when 559 then
					--|#line 3123 "et_eiffel_parser.y"
				yy_do_action_559
			when 560 then
					--|#line 3123 "et_eiffel_parser.y"
				yy_do_action_560
			when 561 then
					--|#line 3136 "et_eiffel_parser.y"
				yy_do_action_561
			when 562 then
					--|#line 3147 "et_eiffel_parser.y"
				yy_do_action_562
			when 563 then
					--|#line 3155 "et_eiffel_parser.y"
				yy_do_action_563
			when 564 then
					--|#line 3164 "et_eiffel_parser.y"
				yy_do_action_564
			when 565 then
					--|#line 3173 "et_eiffel_parser.y"
				yy_do_action_565
			when 566 then
					--|#line 3175 "et_eiffel_parser.y"
				yy_do_action_566
			when 567 then
					--|#line 3179 "et_eiffel_parser.y"
				yy_do_action_567
			when 568 then
					--|#line 3181 "et_eiffel_parser.y"
				yy_do_action_568
			when 569 then
					--|#line 3183 "et_eiffel_parser.y"
				yy_do_action_569
			when 570 then
					--|#line 3185 "et_eiffel_parser.y"
				yy_do_action_570
			when 571 then
					--|#line 3191 "et_eiffel_parser.y"
				yy_do_action_571
			when 572 then
					--|#line 3193 "et_eiffel_parser.y"
				yy_do_action_572
			when 573 then
					--|#line 3200 "et_eiffel_parser.y"
				yy_do_action_573
			when 574 then
					--|#line 3202 "et_eiffel_parser.y"
				yy_do_action_574
			when 575 then
					--|#line 3204 "et_eiffel_parser.y"
				yy_do_action_575
			when 576 then
					--|#line 3204 "et_eiffel_parser.y"
				yy_do_action_576
			when 577 then
					--|#line 3217 "et_eiffel_parser.y"
				yy_do_action_577
			when 578 then
					--|#line 3228 "et_eiffel_parser.y"
				yy_do_action_578
			when 579 then
					--|#line 3237 "et_eiffel_parser.y"
				yy_do_action_579
			when 580 then
					--|#line 3248 "et_eiffel_parser.y"
				yy_do_action_580
			when 581 then
					--|#line 3250 "et_eiffel_parser.y"
				yy_do_action_581
			when 582 then
					--|#line 3252 "et_eiffel_parser.y"
				yy_do_action_582
			when 583 then
					--|#line 3254 "et_eiffel_parser.y"
				yy_do_action_583
			when 584 then
					--|#line 3256 "et_eiffel_parser.y"
				yy_do_action_584
			when 585 then
					--|#line 3258 "et_eiffel_parser.y"
				yy_do_action_585
			when 586 then
					--|#line 3262 "et_eiffel_parser.y"
				yy_do_action_586
			when 587 then
					--|#line 3264 "et_eiffel_parser.y"
				yy_do_action_587
			when 588 then
					--|#line 3268 "et_eiffel_parser.y"
				yy_do_action_588
			when 589 then
					--|#line 3272 "et_eiffel_parser.y"
				yy_do_action_589
			when 590 then
					--|#line 3274 "et_eiffel_parser.y"
				yy_do_action_590
			when 591 then
					--|#line 3278 "et_eiffel_parser.y"
				yy_do_action_591
			when 592 then
					--|#line 3280 "et_eiffel_parser.y"
				yy_do_action_592
			when 593 then
					--|#line 3284 "et_eiffel_parser.y"
				yy_do_action_593
			when 594 then
					--|#line 3286 "et_eiffel_parser.y"
				yy_do_action_594
			when 595 then
					--|#line 3288 "et_eiffel_parser.y"
				yy_do_action_595
			when 596 then
					--|#line 3290 "et_eiffel_parser.y"
				yy_do_action_596
			when 597 then
					--|#line 3292 "et_eiffel_parser.y"
				yy_do_action_597
			when 598 then
					--|#line 3294 "et_eiffel_parser.y"
				yy_do_action_598
			when 599 then
					--|#line 3302 "et_eiffel_parser.y"
				yy_do_action_599
			when 600 then
					--|#line 3304 "et_eiffel_parser.y"
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
					--|#line 3310 "et_eiffel_parser.y"
				yy_do_action_601
			when 602 then
					--|#line 3312 "et_eiffel_parser.y"
				yy_do_action_602
			when 603 then
					--|#line 3314 "et_eiffel_parser.y"
				yy_do_action_603
			when 604 then
					--|#line 3314 "et_eiffel_parser.y"
				yy_do_action_604
			when 605 then
					--|#line 3327 "et_eiffel_parser.y"
				yy_do_action_605
			when 606 then
					--|#line 3338 "et_eiffel_parser.y"
				yy_do_action_606
			when 607 then
					--|#line 3346 "et_eiffel_parser.y"
				yy_do_action_607
			when 608 then
					--|#line 3355 "et_eiffel_parser.y"
				yy_do_action_608
			when 609 then
					--|#line 3364 "et_eiffel_parser.y"
				yy_do_action_609
			when 610 then
					--|#line 3366 "et_eiffel_parser.y"
				yy_do_action_610
			when 611 then
					--|#line 3368 "et_eiffel_parser.y"
				yy_do_action_611
			when 612 then
					--|#line 3370 "et_eiffel_parser.y"
				yy_do_action_612
			when 613 then
					--|#line 3377 "et_eiffel_parser.y"
				yy_do_action_613
			when 614 then
					--|#line 3379 "et_eiffel_parser.y"
				yy_do_action_614
			when 615 then
					--|#line 3385 "et_eiffel_parser.y"
				yy_do_action_615
			when 616 then
					--|#line 3387 "et_eiffel_parser.y"
				yy_do_action_616
			when 617 then
					--|#line 3391 "et_eiffel_parser.y"
				yy_do_action_617
			when 618 then
					--|#line 3393 "et_eiffel_parser.y"
				yy_do_action_618
			when 619 then
					--|#line 3395 "et_eiffel_parser.y"
				yy_do_action_619
			when 620 then
					--|#line 3397 "et_eiffel_parser.y"
				yy_do_action_620
			when 621 then
					--|#line 3399 "et_eiffel_parser.y"
				yy_do_action_621
			when 622 then
					--|#line 3401 "et_eiffel_parser.y"
				yy_do_action_622
			when 623 then
					--|#line 3403 "et_eiffel_parser.y"
				yy_do_action_623
			when 624 then
					--|#line 3405 "et_eiffel_parser.y"
				yy_do_action_624
			when 625 then
					--|#line 3407 "et_eiffel_parser.y"
				yy_do_action_625
			when 626 then
					--|#line 3409 "et_eiffel_parser.y"
				yy_do_action_626
			when 627 then
					--|#line 3411 "et_eiffel_parser.y"
				yy_do_action_627
			when 628 then
					--|#line 3413 "et_eiffel_parser.y"
				yy_do_action_628
			when 629 then
					--|#line 3415 "et_eiffel_parser.y"
				yy_do_action_629
			when 630 then
					--|#line 3417 "et_eiffel_parser.y"
				yy_do_action_630
			when 631 then
					--|#line 3419 "et_eiffel_parser.y"
				yy_do_action_631
			when 632 then
					--|#line 3421 "et_eiffel_parser.y"
				yy_do_action_632
			when 633 then
					--|#line 3423 "et_eiffel_parser.y"
				yy_do_action_633
			when 634 then
					--|#line 3425 "et_eiffel_parser.y"
				yy_do_action_634
			when 635 then
					--|#line 3427 "et_eiffel_parser.y"
				yy_do_action_635
			when 636 then
					--|#line 3429 "et_eiffel_parser.y"
				yy_do_action_636
			when 637 then
					--|#line 3431 "et_eiffel_parser.y"
				yy_do_action_637
			when 638 then
					--|#line 3433 "et_eiffel_parser.y"
				yy_do_action_638
			when 639 then
					--|#line 3437 "et_eiffel_parser.y"
				yy_do_action_639
			when 640 then
					--|#line 3439 "et_eiffel_parser.y"
				yy_do_action_640
			when 641 then
					--|#line 3441 "et_eiffel_parser.y"
				yy_do_action_641
			when 642 then
					--|#line 3443 "et_eiffel_parser.y"
				yy_do_action_642
			when 643 then
					--|#line 3445 "et_eiffel_parser.y"
				yy_do_action_643
			when 644 then
					--|#line 3447 "et_eiffel_parser.y"
				yy_do_action_644
			when 645 then
					--|#line 3449 "et_eiffel_parser.y"
				yy_do_action_645
			when 646 then
					--|#line 3451 "et_eiffel_parser.y"
				yy_do_action_646
			when 647 then
					--|#line 3453 "et_eiffel_parser.y"
				yy_do_action_647
			when 648 then
					--|#line 3455 "et_eiffel_parser.y"
				yy_do_action_648
			when 649 then
					--|#line 3465 "et_eiffel_parser.y"
				yy_do_action_649
			when 650 then
					--|#line 3467 "et_eiffel_parser.y"
				yy_do_action_650
			when 651 then
					--|#line 3469 "et_eiffel_parser.y"
				yy_do_action_651
			when 652 then
					--|#line 3471 "et_eiffel_parser.y"
				yy_do_action_652
			when 653 then
					--|#line 3473 "et_eiffel_parser.y"
				yy_do_action_653
			when 654 then
					--|#line 3475 "et_eiffel_parser.y"
				yy_do_action_654
			when 655 then
					--|#line 3477 "et_eiffel_parser.y"
				yy_do_action_655
			when 656 then
					--|#line 3479 "et_eiffel_parser.y"
				yy_do_action_656
			when 657 then
					--|#line 3481 "et_eiffel_parser.y"
				yy_do_action_657
			when 658 then
					--|#line 3483 "et_eiffel_parser.y"
				yy_do_action_658
			when 659 then
					--|#line 3485 "et_eiffel_parser.y"
				yy_do_action_659
			when 660 then
					--|#line 3487 "et_eiffel_parser.y"
				yy_do_action_660
			when 661 then
					--|#line 3489 "et_eiffel_parser.y"
				yy_do_action_661
			when 662 then
					--|#line 3491 "et_eiffel_parser.y"
				yy_do_action_662
			when 663 then
					--|#line 3493 "et_eiffel_parser.y"
				yy_do_action_663
			when 664 then
					--|#line 3495 "et_eiffel_parser.y"
				yy_do_action_664
			when 665 then
					--|#line 3497 "et_eiffel_parser.y"
				yy_do_action_665
			when 666 then
					--|#line 3499 "et_eiffel_parser.y"
				yy_do_action_666
			when 667 then
					--|#line 3514 "et_eiffel_parser.y"
				yy_do_action_667
			when 668 then
					--|#line 3516 "et_eiffel_parser.y"
				yy_do_action_668
			when 669 then
					--|#line 3518 "et_eiffel_parser.y"
				yy_do_action_669
			when 670 then
					--|#line 3520 "et_eiffel_parser.y"
				yy_do_action_670
			when 671 then
					--|#line 3524 "et_eiffel_parser.y"
				yy_do_action_671
			when 672 then
					--|#line 3524 "et_eiffel_parser.y"
				yy_do_action_672
			when 673 then
					--|#line 3537 "et_eiffel_parser.y"
				yy_do_action_673
			when 674 then
					--|#line 3548 "et_eiffel_parser.y"
				yy_do_action_674
			when 675 then
					--|#line 3556 "et_eiffel_parser.y"
				yy_do_action_675
			when 676 then
					--|#line 3565 "et_eiffel_parser.y"
				yy_do_action_676
			when 677 then
					--|#line 3573 "et_eiffel_parser.y"
				yy_do_action_677
			when 678 then
					--|#line 3577 "et_eiffel_parser.y"
				yy_do_action_678
			when 679 then
					--|#line 3579 "et_eiffel_parser.y"
				yy_do_action_679
			when 680 then
					--|#line 3579 "et_eiffel_parser.y"
				yy_do_action_680
			when 681 then
					--|#line 3592 "et_eiffel_parser.y"
				yy_do_action_681
			when 682 then
					--|#line 3603 "et_eiffel_parser.y"
				yy_do_action_682
			when 683 then
					--|#line 3611 "et_eiffel_parser.y"
				yy_do_action_683
			when 684 then
					--|#line 3620 "et_eiffel_parser.y"
				yy_do_action_684
			when 685 then
					--|#line 3622 "et_eiffel_parser.y"
				yy_do_action_685
			when 686 then
					--|#line 3622 "et_eiffel_parser.y"
				yy_do_action_686
			when 687 then
					--|#line 3635 "et_eiffel_parser.y"
				yy_do_action_687
			when 688 then
					--|#line 3646 "et_eiffel_parser.y"
				yy_do_action_688
			when 689 then
					--|#line 3654 "et_eiffel_parser.y"
				yy_do_action_689
			when 690 then
					--|#line 3663 "et_eiffel_parser.y"
				yy_do_action_690
			when 691 then
					--|#line 3665 "et_eiffel_parser.y"
				yy_do_action_691
			when 692 then
					--|#line 3665 "et_eiffel_parser.y"
				yy_do_action_692
			when 693 then
					--|#line 3680 "et_eiffel_parser.y"
				yy_do_action_693
			when 694 then
					--|#line 3691 "et_eiffel_parser.y"
				yy_do_action_694
			when 695 then
					--|#line 3699 "et_eiffel_parser.y"
				yy_do_action_695
			when 696 then
					--|#line 3708 "et_eiffel_parser.y"
				yy_do_action_696
			when 697 then
					--|#line 3710 "et_eiffel_parser.y"
				yy_do_action_697
			when 698 then
					--|#line 3712 "et_eiffel_parser.y"
				yy_do_action_698
			when 699 then
					--|#line 3714 "et_eiffel_parser.y"
				yy_do_action_699
			when 700 then
					--|#line 3716 "et_eiffel_parser.y"
				yy_do_action_700
			when 701 then
					--|#line 3718 "et_eiffel_parser.y"
				yy_do_action_701
			when 702 then
					--|#line 3724 "et_eiffel_parser.y"
				yy_do_action_702
			when 703 then
					--|#line 3726 "et_eiffel_parser.y"
				yy_do_action_703
			when 704 then
					--|#line 3730 "et_eiffel_parser.y"
				yy_do_action_704
			when 705 then
					--|#line 3741 "et_eiffel_parser.y"
				yy_do_action_705
			when 706 then
					--|#line 3748 "et_eiffel_parser.y"
				yy_do_action_706
			when 707 then
					--|#line 3755 "et_eiffel_parser.y"
				yy_do_action_707
			when 708 then
					--|#line 3762 "et_eiffel_parser.y"
				yy_do_action_708
			when 709 then
					--|#line 3769 "et_eiffel_parser.y"
				yy_do_action_709
			when 710 then
					--|#line 3776 "et_eiffel_parser.y"
				yy_do_action_710
			when 711 then
					--|#line 3783 "et_eiffel_parser.y"
				yy_do_action_711
			when 712 then
					--|#line 3790 "et_eiffel_parser.y"
				yy_do_action_712
			when 713 then
					--|#line 3797 "et_eiffel_parser.y"
				yy_do_action_713
			when 714 then
					--|#line 3804 "et_eiffel_parser.y"
				yy_do_action_714
			when 715 then
					--|#line 3811 "et_eiffel_parser.y"
				yy_do_action_715
			when 716 then
					--|#line 3820 "et_eiffel_parser.y"
				yy_do_action_716
			when 717 then
					--|#line 3827 "et_eiffel_parser.y"
				yy_do_action_717
			when 718 then
					--|#line 3831 "et_eiffel_parser.y"
				yy_do_action_718
			when 719 then
					--|#line 3843 "et_eiffel_parser.y"
				yy_do_action_719
			when 720 then
					--|#line 3845 "et_eiffel_parser.y"
				yy_do_action_720
			when 721 then
					--|#line 3847 "et_eiffel_parser.y"
				yy_do_action_721
			when 722 then
					--|#line 3849 "et_eiffel_parser.y"
				yy_do_action_722
			when 723 then
					--|#line 3851 "et_eiffel_parser.y"
				yy_do_action_723
			when 724 then
					--|#line 3855 "et_eiffel_parser.y"
				yy_do_action_724
			when 725 then
					--|#line 3857 "et_eiffel_parser.y"
				yy_do_action_725
			when 726 then
					--|#line 3859 "et_eiffel_parser.y"
				yy_do_action_726
			when 727 then
					--|#line 3859 "et_eiffel_parser.y"
				yy_do_action_727
			when 728 then
					--|#line 3872 "et_eiffel_parser.y"
				yy_do_action_728
			when 729 then
					--|#line 3883 "et_eiffel_parser.y"
				yy_do_action_729
			when 730 then
					--|#line 3891 "et_eiffel_parser.y"
				yy_do_action_730
			when 731 then
					--|#line 3900 "et_eiffel_parser.y"
				yy_do_action_731
			when 732 then
					--|#line 3909 "et_eiffel_parser.y"
				yy_do_action_732
			when 733 then
					--|#line 3911 "et_eiffel_parser.y"
				yy_do_action_733
			when 734 then
					--|#line 3913 "et_eiffel_parser.y"
				yy_do_action_734
			when 735 then
					--|#line 3919 "et_eiffel_parser.y"
				yy_do_action_735
			when 736 then
					--|#line 3921 "et_eiffel_parser.y"
				yy_do_action_736
			when 737 then
					--|#line 3923 "et_eiffel_parser.y"
				yy_do_action_737
			when 738 then
					--|#line 3925 "et_eiffel_parser.y"
				yy_do_action_738
			when 739 then
					--|#line 3927 "et_eiffel_parser.y"
				yy_do_action_739
			when 740 then
					--|#line 3929 "et_eiffel_parser.y"
				yy_do_action_740
			when 741 then
					--|#line 3931 "et_eiffel_parser.y"
				yy_do_action_741
			when 742 then
					--|#line 3933 "et_eiffel_parser.y"
				yy_do_action_742
			when 743 then
					--|#line 3935 "et_eiffel_parser.y"
				yy_do_action_743
			when 744 then
					--|#line 3937 "et_eiffel_parser.y"
				yy_do_action_744
			when 745 then
					--|#line 3939 "et_eiffel_parser.y"
				yy_do_action_745
			when 746 then
					--|#line 3941 "et_eiffel_parser.y"
				yy_do_action_746
			when 747 then
					--|#line 3943 "et_eiffel_parser.y"
				yy_do_action_747
			when 748 then
					--|#line 3945 "et_eiffel_parser.y"
				yy_do_action_748
			when 749 then
					--|#line 3947 "et_eiffel_parser.y"
				yy_do_action_749
			when 750 then
					--|#line 3949 "et_eiffel_parser.y"
				yy_do_action_750
			when 751 then
					--|#line 3951 "et_eiffel_parser.y"
				yy_do_action_751
			when 752 then
					--|#line 3953 "et_eiffel_parser.y"
				yy_do_action_752
			when 753 then
					--|#line 3955 "et_eiffel_parser.y"
				yy_do_action_753
			when 754 then
					--|#line 3957 "et_eiffel_parser.y"
				yy_do_action_754
			when 755 then
					--|#line 3959 "et_eiffel_parser.y"
				yy_do_action_755
			when 756 then
					--|#line 3961 "et_eiffel_parser.y"
				yy_do_action_756
			when 757 then
					--|#line 3963 "et_eiffel_parser.y"
				yy_do_action_757
			when 758 then
					--|#line 3967 "et_eiffel_parser.y"
				yy_do_action_758
			when 759 then
					--|#line 3969 "et_eiffel_parser.y"
				yy_do_action_759
			when 760 then
					--|#line 3973 "et_eiffel_parser.y"
				yy_do_action_760
			when 761 then
					--|#line 3975 "et_eiffel_parser.y"
				yy_do_action_761
			when 762 then
					--|#line 3979 "et_eiffel_parser.y"
				yy_do_action_762
			when 763 then
					--|#line 3981 "et_eiffel_parser.y"
				yy_do_action_763
			when 764 then
					--|#line 3985 "et_eiffel_parser.y"
				yy_do_action_764
			when 765 then
					--|#line 3987 "et_eiffel_parser.y"
				yy_do_action_765
			when 766 then
					--|#line 3991 "et_eiffel_parser.y"
				yy_do_action_766
			when 767 then
					--|#line 3996 "et_eiffel_parser.y"
				yy_do_action_767
			when 768 then
					--|#line 4003 "et_eiffel_parser.y"
				yy_do_action_768
			when 769 then
					--|#line 4010 "et_eiffel_parser.y"
				yy_do_action_769
			when 770 then
					--|#line 4012 "et_eiffel_parser.y"
				yy_do_action_770
			when 771 then
					--|#line 4016 "et_eiffel_parser.y"
				yy_do_action_771
			when 772 then
					--|#line 4018 "et_eiffel_parser.y"
				yy_do_action_772
			when 773 then
					--|#line 4022 "et_eiffel_parser.y"
				yy_do_action_773
			when 774 then
					--|#line 4027 "et_eiffel_parser.y"
				yy_do_action_774
			when 775 then
					--|#line 4034 "et_eiffel_parser.y"
				yy_do_action_775
			when 776 then
					--|#line 4041 "et_eiffel_parser.y"
				yy_do_action_776
			when 777 then
					--|#line 4043 "et_eiffel_parser.y"
				yy_do_action_777
			when 778 then
					--|#line 4045 "et_eiffel_parser.y"
				yy_do_action_778
			when 779 then
					--|#line 4054 "et_eiffel_parser.y"
				yy_do_action_779
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
			--|#line 222 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 222 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 222")
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
			--|#line 226 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 226 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 226")
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
			--|#line 234 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 234 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 234")
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
			--|#line 243 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 243 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 243")
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
			--|#line 244 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 244 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 244")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp42 := yyvsp42 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_6 is
			--|#line 244 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 244 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 244")
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
			--|#line 255 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 255 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 255")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs98.item (yyvsp98), yyvs102.item (yyvsp102), yyvs56.item (yyvsp56), yyvs53.item (yyvsp53), yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp76 := yyvsp76 -1
	yyvsp98 := yyvsp98 -1
	yyvsp102 := yyvsp102 -1
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
			--|#line 261 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 261 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 261")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs98.item (yyvsp98), yyvs102.item (yyvsp102), yyvs56.item (yyvsp56), yyvs53.item (yyvsp53), yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp76 := yyvsp76 -1
	yyvsp98 := yyvsp98 -1
	yyvsp102 := yyvsp102 -1
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
			--|#line 267 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 267 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 267")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs98.item (yyvsp98), yyvs102.item (yyvsp102), Void, yyvs53.item (yyvsp53), yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp76 := yyvsp76 -1
	yyvsp98 := yyvsp98 -1
	yyvsp102 := yyvsp102 -1
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
			--|#line 273 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 273 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 273")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs98.item (yyvsp98), yyvs102.item (yyvsp102), Void, Void, yyvs67.item (yyvsp67), yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp76 := yyvsp76 -1
	yyvsp98 := yyvsp98 -1
	yyvsp102 := yyvsp102 -1
	yyvsp67 := yyvsp67 -1
	yyvsp86 := yyvsp86 -1
	yyvsp78 := yyvsp78 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_11 is
			--|#line 279 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 279 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 279")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs98.item (yyvsp98), yyvs102.item (yyvsp102), Void, Void, Void, yyvs86.item (yyvsp86), yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp76 := yyvsp76 -1
	yyvsp98 := yyvsp98 -1
	yyvsp102 := yyvsp102 -1
	yyvsp86 := yyvsp86 -1
	yyvsp78 := yyvsp78 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_12 is
			--|#line 285 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 285 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 285")
end

			yyval42 := yyvs42.item (yyvsp42 - 2)
			set_class_to_inheritance_end (yyval42, yyvs98.item (yyvsp98), yyvs102.item (yyvsp102))
			if yyvs42.item (yyvsp42 - 1) /= Void then
				yyvs42.item (yyvsp42 - 1).set_first_indexing (yyvs78.item (yyvsp78))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp42 := yyvsp42 -2
	yyvsp76 := yyvsp76 -1
	yyvsp98 := yyvsp98 -1
	yyvsp102 := yyvsp102 -1
	yyvsp78 := yyvsp78 -1
	yyvsp1 := yyvsp1 -1
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_13 is
			--|#line 285 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 285 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 285")
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
			--|#line 301 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 301 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 301")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_end (yyval42, yyvs98.item (yyvsp98), yyvs102.item (yyvsp102), Void, Void, Void, Void, yyvs78.item (yyvsp78), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp76 := yyvsp76 -1
	yyvsp98 := yyvsp98 -1
	yyvsp102 := yyvsp102 -1
	yyvsp78 := yyvsp78 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_15 is
			--|#line 306 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 306 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 306")
end

			yyval42 := yyvs42.item (yyvsp42)
			set_class_to_inheritance_end (yyval42, yyvs98.item (yyvsp98), yyvs102.item (yyvsp102))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp76 := yyvsp76 -1
	yyvsp98 := yyvsp98 -1
	yyvsp102 := yyvsp102 -1
	yyvsp1 := yyvsp1 -1
	yyvs42.put (yyval42, yyvsp42)
end
		end

	yy_do_action_16 is
			--|#line 321 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 321 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 321")
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
			--|#line 326 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 326 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 326")
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
			--|#line 328 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 328 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 328")
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
			--|#line 328 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 328 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 328")
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
			--|#line 341 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 341 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 341")
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
			--|#line 343 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 343 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 343")
end

yyval78 := yyvs78.item (yyvsp78) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs78.put (yyval78, yyvsp78)
end
		end

	yy_do_action_22 is
			--|#line 347 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 347 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 347")
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
			--|#line 358 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 358 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 358")
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
			--|#line 370 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 370 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 370")
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
			--|#line 370 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 370 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 370")
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
			--|#line 379 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 379 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 379")
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
			--|#line 379 "et_eiffel_parser.y"
		local
			yyval78: ET_INDEXING_LIST
		do
--|#line 379 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 379")
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
			--|#line 390 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 390 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 390")
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
			--|#line 397 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 397 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 397")
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
			--|#line 401 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 401")
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

	yy_do_action_32 is
			--|#line 409 "et_eiffel_parser.y"
		local
			yyval79: ET_INDEXING_ITEM
		do
--|#line 409 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 409")
end

yyval79 := ast_factory.new_indexing_semicolon (yyvs79.item (yyvsp79), yyvs22.item (yyvsp22)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 -1
	yyvs79.put (yyval79, yyvsp79)
end
		end

	yy_do_action_33 is
			--|#line 414 "et_eiffel_parser.y"
		local
			yyval82: ET_INDEXING_TERM_LIST
		do
--|#line 414 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 414")
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
			--|#line 425 "et_eiffel_parser.y"
		local
			yyval82: ET_INDEXING_TERM_LIST
		do
--|#line 425 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 425")
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
			--|#line 434 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 434 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 434")
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
			--|#line 436 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 436 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 436")
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
			--|#line 438 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 438 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 438")
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
			--|#line 440 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 440 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 440")
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
			--|#line 442 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 442 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 442")
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
			--|#line 444 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 444 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 444")
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
			--|#line 446 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 446 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 446")
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
			--|#line 448 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 448 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 448")
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
			--|#line 450 "et_eiffel_parser.y"
		local
			yyval80: ET_INDEXING_TERM
		do
--|#line 450 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 450")
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
			--|#line 454 "et_eiffel_parser.y"
		local
			yyval81: ET_INDEXING_TERM_ITEM
		do
--|#line 454 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 454")
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
			--|#line 465 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 465 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 465")
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
			--|#line 475 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 475 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 475")
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
			--|#line 486 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 486 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 486")
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
			--|#line 497 "et_eiffel_parser.y"
		local
			yyval42: ET_CLASS
		do
--|#line 497 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 497")
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
			--|#line 510 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 510 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 510")
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
			--|#line 512 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 512 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 512")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_51 is
			--|#line 516 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 516 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 516")
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
			--|#line 518 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 518 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 518")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_53 is
			--|#line 524 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 524 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 524")
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
			--|#line 528 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 528 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 528")
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
			--|#line 534 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 534 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 534")
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
			--|#line 534 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 534 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 534")
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
			--|#line 548 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 548 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 548")
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
			--|#line 559 "et_eiffel_parser.y"
		local
			yyval76: ET_FORMAL_PARAMETER_LIST
		do
--|#line 559 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 559")
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
			--|#line 568 "et_eiffel_parser.y"
		local
			yyval75: ET_FORMAL_PARAMETER_ITEM
		do
--|#line 568 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 568")
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
			--|#line 577 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 577 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 577")
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
			--|#line 584 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 584 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 584")
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
			--|#line 591 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 591 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 591")
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
			--|#line 598 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 598 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 598")
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
			--|#line 605 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 605 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 605")
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
			--|#line 612 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 612 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 612")
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
			--|#line 619 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 619 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 619")
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
			--|#line 626 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 626 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 626")
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
			--|#line 633 "et_eiffel_parser.y"
		local
			yyval74: ET_FORMAL_PARAMETER
		do
--|#line 633 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 633")
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
			--|#line 642 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 642 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 642")
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
			--|#line 644 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 644 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 644")
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
			--|#line 644 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 644 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 644")
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
			--|#line 657 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 657 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 657")
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
			--|#line 668 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 668 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 668")
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
			--|#line 676 "et_eiffel_parser.y"
		local
			yyval49: ET_CONSTRAINT_CREATOR
		do
--|#line 676 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 676")
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
			--|#line 685 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 685 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 685")
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

	yy_do_action_77 is
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

	yy_do_action_78 is
			--|#line 691 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 691 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 691")
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
			--|#line 693 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 693 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 693")
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
			--|#line 701 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 701 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 701")
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
			--|#line 709 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 709 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 709")
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
			--|#line 711 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 711 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 711")
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
			--|#line 713 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 713 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 713")
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
			--|#line 715 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 715 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 715")
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
			--|#line 717 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 717 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 717")
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
			--|#line 725 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 725 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 725")
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
			--|#line 735 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 735 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 735")
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

	yy_do_action_89 is
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

	yy_do_action_90 is
			--|#line 741 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 741 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 741")
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
			--|#line 743 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 743 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 743")
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
			--|#line 751 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 751 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 751")
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
			--|#line 759 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 759 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 759")
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
			--|#line 761 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 761 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 761")
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
			--|#line 763 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 763 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 763")
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
			--|#line 765 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 765 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 765")
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
			--|#line 767 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 767 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 767")
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
			--|#line 775 "et_eiffel_parser.y"
		local
			yyval50: ET_CONSTRAINT_TYPE
		do
--|#line 775 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 775")
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
			--|#line 785 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 785 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 785")
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
			--|#line 787 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 787 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 787")
end

yyval48 := yyvs48.item (yyvsp48) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_101 is
			--|#line 791 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 791 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 791")
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
			--|#line 794 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 794 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 794")
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
			--|#line 802 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 802 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 802")
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
			--|#line 813 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 813 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 813")
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
			--|#line 818 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 818 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 818")
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
			--|#line 823 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 823 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 823")
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
			--|#line 830 "et_eiffel_parser.y"
		local
			yyval47: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 830 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 830")
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
			--|#line 839 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 839 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 839")
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
			--|#line 841 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 841 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 841")
end

yyval48 := yyvs48.item (yyvsp48) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs48.put (yyval48, yyvsp48)
end
		end

	yy_do_action_110 is
			--|#line 845 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 845 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 845")
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
			--|#line 848 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 848 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 848")
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
			--|#line 854 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 854 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 854")
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
			--|#line 862 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 862 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 862")
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
			--|#line 867 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 867 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 867")
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
			--|#line 872 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 872 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 872")
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
			--|#line 877 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 877 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 877")
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
			--|#line 888 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 888 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 888")
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
			--|#line 899 "et_eiffel_parser.y"
		local
			yyval48: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 899 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 899")
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
			--|#line 912 "et_eiffel_parser.y"
		local
			yyval47: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 912 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 912")
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
			--|#line 921 "et_eiffel_parser.y"
		local
			yyval47: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 921 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 921")
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
			--|#line 932 "et_eiffel_parser.y"
		local
			yyval98: ET_OBSOLETE
		do
--|#line 932 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 932")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp98 := yyvsp98 + 1
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

	yy_do_action_122 is
			--|#line 934 "et_eiffel_parser.y"
		local
			yyval98: ET_OBSOLETE
		do
--|#line 934 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 934")
end

yyval98 := ast_factory.new_obsolete_message (yyvs2.item (yyvsp2), yyvs16.item (yyvsp16)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp98 := yyvsp98 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp16 := yyvsp16 -1
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

	yy_do_action_123 is
			--|#line 940 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 940 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 940")
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

	yy_do_action_124 is
			--|#line 942 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 942 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 942")
end

yyval102 := ast_factory.new_parents (yyvs2.item (yyvsp2), 0) 
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

	yy_do_action_125 is
			--|#line 944 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 944 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 944")
end

			yyval102 := yyvs102.item (yyvsp102)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_126 is
			--|#line 951 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 951 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 951")
end

			yyval102 := yyvs102.item (yyvsp102)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_127 is
			--|#line 959 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 959 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 959")
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
			--|#line 966 "et_eiffel_parser.y"
		local
			yyval100: ET_PARENT
		do
--|#line 966 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 966")
end

			yyval100 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, Void, Void, Void)
			if yyval100 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_129 is
			--|#line 973 "et_eiffel_parser.y"
		local
			yyval100: ET_PARENT
		do
--|#line 973 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 973")
end

			yyval100 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), yyvs109.item (yyvsp109), yyvs61.item (yyvsp61), yyvs87.item (yyvsp87 - 2), yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval100 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp100 := yyvsp100 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp109 := yyvsp109 -1
	yyvsp61 := yyvsp61 -1
	yyvsp87 := yyvsp87 -3
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_130 is
			--|#line 981 "et_eiffel_parser.y"
		local
			yyval100: ET_PARENT
		do
--|#line 981 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 981")
end

			yyval100 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, yyvs61.item (yyvsp61), yyvs87.item (yyvsp87 - 2), yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval100 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp100 := yyvsp100 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp61 := yyvsp61 -1
	yyvsp87 := yyvsp87 -3
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_131 is
			--|#line 988 "et_eiffel_parser.y"
		local
			yyval100: ET_PARENT
		do
--|#line 988 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 988")
end

			yyval100 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, yyvs87.item (yyvsp87 - 2), yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval100 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp100 := yyvsp100 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp87 := yyvsp87 -3
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_132 is
			--|#line 995 "et_eiffel_parser.y"
		local
			yyval100: ET_PARENT
		do
--|#line 995 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 995")
end

			yyval100 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, yyvs87.item (yyvsp87 - 1), yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval100 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp100 := yyvsp100 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp87 := yyvsp87 -2
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_133 is
			--|#line 1002 "et_eiffel_parser.y"
		local
			yyval100: ET_PARENT
		do
--|#line 1002 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1002")
end

			yyval100 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, Void, yyvs87.item (yyvsp87), yyvs2.item (yyvsp2))
			if yyval100 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp100 := yyvsp100 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp87 := yyvsp87 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_134 is
			--|#line 1011 "et_eiffel_parser.y"
		local
			yyval100: ET_PARENT
		do
--|#line 1011 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1011")
end

			yyval100 := new_parent (yyvs13.item (yyvsp13), yyvs27.item (yyvsp27), Void, Void, Void, Void, Void, yyvs2.item (yyvsp2))
			if yyval100 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp100 := yyvsp100 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
	yyvsp2 := yyvsp2 -1
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
			--|#line 1020 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 1020 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1020")
end

			yyval102 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval102 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval102.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp102 := yyvsp102 + 1
	yyvsp100 := yyvsp100 -1
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

	yy_do_action_136 is
			--|#line 1027 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 1027 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1027")
end

			yyval102 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval102 /= Void and yyvs101.item (yyvsp101) /= Void then
				yyval102.put_first (yyvs101.item (yyvsp101))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp102 := yyvsp102 + 1
	yyvsp101 := yyvsp101 -1
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

	yy_do_action_137 is
			--|#line 1034 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 1034 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1034")
end

			yyval102 := yyvs102.item (yyvsp102)
			if yyval102 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval102.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 -1
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_138 is
			--|#line 1041 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 1041 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1041")
end

			yyval102 := yyvs102.item (yyvsp102)
			if yyval102 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval102.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 -1
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_139 is
			--|#line 1048 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 1048 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1048")
end

			yyval102 := yyvs102.item (yyvsp102)
			if yyval102 /= Void and yyvs101.item (yyvsp101) /= Void then
				yyval102.put_first (yyvs101.item (yyvsp101))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp101 := yyvsp101 -1
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_140 is
			--|#line 1057 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 1057 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1057")
end

			yyval102 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval102 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval102.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp102 := yyvsp102 + 1
	yyvsp100 := yyvsp100 -1
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

	yy_do_action_141 is
			--|#line 1064 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 1064 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1064")
end

			yyval102 := yyvs102.item (yyvsp102)
			if yyval102 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval102.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 -1
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_142 is
			--|#line 1071 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 1071 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1071")
end

			yyval102 := yyvs102.item (yyvsp102)
			if yyval102 /= Void and yyvs100.item (yyvsp100) /= Void then
				yyval102.put_first (yyvs100.item (yyvsp100))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 -1
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_143 is
			--|#line 1078 "et_eiffel_parser.y"
		local
			yyval102: ET_PARENT_LIST
		do
--|#line 1078 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1078")
end

			yyval102 := yyvs102.item (yyvsp102)
			if yyval102 /= Void and yyvs101.item (yyvsp101) /= Void then
				yyval102.put_first (yyvs101.item (yyvsp101))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp101 := yyvsp101 -1
	yyvs102.put (yyval102, yyvsp102)
end
		end

	yy_do_action_144 is
			--|#line 1087 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_ITEM
		do
--|#line 1087 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1087")
end

			yyval101 := ast_factory.new_parent_semicolon (yyvs100.item (yyvsp100), yyvs22.item (yyvsp22))
			if yyval101 /= Void and yyvs100.item (yyvsp100) = Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp101 := yyvsp101 + 1
	yyvsp100 := yyvsp100 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_145 is
			--|#line 1094 "et_eiffel_parser.y"
		local
			yyval101: ET_PARENT_ITEM
		do
--|#line 1094 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1094")
end

			yyval101 := ast_factory.new_parent_semicolon (yyvs100.item (yyvsp100), yyvs22.item (yyvsp22))
			if yyval101 /= Void and yyvs100.item (yyvsp100) = Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp101 := yyvsp101 + 1
	yyvsp100 := yyvsp100 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_146 is
			--|#line 1105 "et_eiffel_parser.y"
		local
			yyval109: ET_RENAME_LIST
		do
--|#line 1105 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1105")
end

yyval109 := ast_factory.new_renames (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp109 := yyvsp109 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_147 is
			--|#line 1107 "et_eiffel_parser.y"
		local
			yyval109: ET_RENAME_LIST
		do
--|#line 1107 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1107")
end

			yyval109 := yyvs109.item (yyvsp109)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp109 := yyvsp109 -1
	yyvsp2 := yyvsp2 -1
	yyvs109.put (yyval109, yyvsp109)
end
		end

	yy_do_action_148 is
			--|#line 1107 "et_eiffel_parser.y"
		local
			yyval109: ET_RENAME_LIST
		do
--|#line 1107 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1107")
end

			add_keyword (yyvs2.item (yyvsp2))
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

	yy_do_action_149 is
			--|#line 1120 "et_eiffel_parser.y"
		local
			yyval109: ET_RENAME_LIST
		do
--|#line 1120 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1120")
end

			yyval109 := ast_factory.new_renames (last_keyword, counter_value)
			if yyval109 /= Void and yyvs108.item (yyvsp108) /= Void then
				yyval109.put_first (yyvs108.item (yyvsp108))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp109 := yyvsp109 + 1
	yyvsp108 := yyvsp108 -1
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

	yy_do_action_150 is
			--|#line 1127 "et_eiffel_parser.y"
		local
			yyval109: ET_RENAME_LIST
		do
--|#line 1127 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1127")
end

			yyval109 := ast_factory.new_renames (last_keyword, counter_value)
			if yyval109 /= Void and yyvs108.item (yyvsp108) /= Void then
				yyval109.put_first (yyvs108.item (yyvsp108))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp109 := yyvsp109 + 1
	yyvsp108 := yyvsp108 -1
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

	yy_do_action_151 is
			--|#line 1135 "et_eiffel_parser.y"
		local
			yyval109: ET_RENAME_LIST
		do
--|#line 1135 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1135")
end

			yyval109 := yyvs109.item (yyvsp109)
			if yyval109 /= Void and yyvs108.item (yyvsp108) /= Void then
				yyval109.put_first (yyvs108.item (yyvsp108))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp108 := yyvsp108 -1
	yyvs109.put (yyval109, yyvsp109)
end
		end

	yy_do_action_152 is
			--|#line 1144 "et_eiffel_parser.y"
		local
			yyval108: ET_RENAME_ITEM
		do
--|#line 1144 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1144")
end

			yyval108 := ast_factory.new_rename (yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs64.item (yyvsp64))
			if yyval108 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp108 := yyvsp108 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
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

	yy_do_action_153 is
			--|#line 1153 "et_eiffel_parser.y"
		local
			yyval108: ET_RENAME_ITEM
		do
--|#line 1153 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1153")
end

			yyval108 := ast_factory.new_rename_comma (yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs64.item (yyvsp64), yyvs5.item (yyvsp5))
			if yyval108 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp108 := yyvsp108 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_154 is
			--|#line 1164 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1164 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1164")
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
			--|#line 1166 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1166 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1166")
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
			--|#line 1166 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1166 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1166")
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
			--|#line 1179 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1179 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1179")
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
			--|#line 1181 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1181 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1181")
end

yyval61 := yyvs61.item (yyvsp61) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs61.put (yyval61, yyvsp61)
end
		end

	yy_do_action_159 is
			--|#line 1185 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1185 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1185")
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
			--|#line 1196 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1196 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1196")
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
			--|#line 1196 "et_eiffel_parser.y"
		local
			yyval61: ET_EXPORT_LIST
		do
--|#line 1196 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1196")
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
			--|#line 1211 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1211 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1211")
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
			--|#line 1215 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1215 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1215")
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
			--|#line 1220 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1220 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1220")
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
			--|#line 1220 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1220 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1220")
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
			--|#line 1230 "et_eiffel_parser.y"
		local
			yyval60: ET_EXPORT
		do
--|#line 1230 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1230")
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
			--|#line 1234 "et_eiffel_parser.y"
		local
			yyval68: ET_FEATURE_EXPORT
		do
--|#line 1234 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1234")
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
			--|#line 1245 "et_eiffel_parser.y"
		local
			yyval68: ET_FEATURE_EXPORT
		do
--|#line 1245 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1245")
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
			--|#line 1253 "et_eiffel_parser.y"
		local
			yyval68: ET_FEATURE_EXPORT
		do
--|#line 1253 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1253")
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
			--|#line 1264 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1264 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1264")
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
			--|#line 1264 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1264 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1264")
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
			--|#line 1275 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1275 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1275")
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
			--|#line 1279 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1279 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1279")
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
			--|#line 1286 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1286 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1286")
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
			--|#line 1294 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1294 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1294")
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
			--|#line 1301 "et_eiffel_parser.y"
		local
			yyval44: ET_CLIENTS
		do
--|#line 1301 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1301")
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
			--|#line 1311 "et_eiffel_parser.y"
		local
			yyval43: ET_CLIENT_ITEM
		do
--|#line 1311 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1311")
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
			--|#line 1320 "et_eiffel_parser.y"
		local
			yyval43: ET_CLIENT_ITEM
		do
--|#line 1320 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1320")
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
			--|#line 1331 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1331 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1331")
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
			--|#line 1333 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1333 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1333")
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
			--|#line 1333 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1333 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1333")
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
			--|#line 1346 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1346 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1346")
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
			--|#line 1348 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1348 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1348")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_184 is
			--|#line 1352 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1352 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1352")
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
			--|#line 1354 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1354 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1354")
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
			--|#line 1354 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1354 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1354")
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
			--|#line 1367 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1367 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1367")
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
			--|#line 1369 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1369 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1369")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_189 is
			--|#line 1373 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1373 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1373")
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
			--|#line 1375 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1375 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1375")
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
			--|#line 1375 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1375 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1375")
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
			--|#line 1388 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1388 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1388")
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
			--|#line 1390 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1390 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1390")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs87.put (yyval87, yyvsp87)
end
		end

	yy_do_action_194 is
			--|#line 1394 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1394 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1394")
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
			--|#line 1405 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1405 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1405")
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
			--|#line 1413 "et_eiffel_parser.y"
		local
			yyval87: ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1413 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1413")
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
			--|#line 1422 "et_eiffel_parser.y"
		local
			yyval70: ET_FEATURE_NAME_ITEM
		do
--|#line 1422 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1422")
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
			--|#line 1433 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1433 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1433")
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
			--|#line 1435 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1435 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1435")
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
			--|#line 1442 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1442 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1442")
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
			--|#line 1449 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1449 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1449")
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
			--|#line 1460 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1460 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1460")
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
			--|#line 1460 "et_eiffel_parser.y"
		local
			yyval56: ET_CREATOR_LIST
		do
--|#line 1460 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1460")
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
			--|#line 1475 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1475 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1475")
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
			--|#line 1477 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1477 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1477")
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
			--|#line 1479 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1479 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1479")
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
			--|#line 1479 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1479 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1479")
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
			--|#line 1491 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1491 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1491")
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
			--|#line 1491 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1491 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1491")
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
			--|#line 1503 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1503 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1503")
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
			--|#line 1505 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1505 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1505")
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
			--|#line 1507 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1507 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1507")
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
			--|#line 1507 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1507 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1507")
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
			--|#line 1519 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1519 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1519")
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
			--|#line 1519 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1519 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1519")
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
			--|#line 1533 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1533 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1533")
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
			--|#line 1544 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1544 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1544")
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
			--|#line 1552 "et_eiffel_parser.y"
		local
			yyval55: ET_CREATOR
		do
--|#line 1552 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1552")
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
			--|#line 1561 "et_eiffel_parser.y"
		local
			yyval70: ET_FEATURE_NAME_ITEM
		do
--|#line 1561 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1561")
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
			--|#line 1572 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1572 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1572")
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
			--|#line 1574 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1574 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1574")
end

yyval53 := yyvs53.item (yyvsp53) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs53.put (yyval53, yyvsp53)
end
		end

	yy_do_action_222 is
			--|#line 1578 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1578 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1578")
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
			--|#line 1578 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1578 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1578")
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
			--|#line 1591 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1591 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1591")
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
			--|#line 1598 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1598 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1598")
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
			--|#line 1605 "et_eiffel_parser.y"
		local
			yyval53: ET_CONVERT_FEATURE_LIST
		do
--|#line 1605 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1605")
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
			--|#line 1614 "et_eiffel_parser.y"
		local
			yyval52: ET_CONVERT_FEATURE_ITEM
		do
--|#line 1614 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1614")
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
			--|#line 1623 "et_eiffel_parser.y"
		local
			yyval51: ET_CONVERT_FEATURE
		do
--|#line 1623 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1623")
end

			yyval51 := ast_factory.new_convert_function (yyvs69.item (yyvsp69), yyvs5.item (yyvsp5), yyvs114.item (yyvsp114))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp51 := yyvsp51 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
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
			--|#line 1627 "et_eiffel_parser.y"
		local
			yyval51: ET_CONVERT_FEATURE
		do
--|#line 1627 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1627")
end

			yyval51 := ast_factory.new_convert_procedure (yyvs69.item (yyvsp69), yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp51 := yyvsp51 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
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
			--|#line 1633 "et_eiffel_parser.y"
		local
			yyval114: ET_TYPE_LIST
		do
--|#line 1633 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1633")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -2
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

	yy_do_action_231 is
			--|#line 1635 "et_eiffel_parser.y"
		local
			yyval114: ET_TYPE_LIST
		do
--|#line 1635 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1635")
end

			yyval114 := yyvs114.item (yyvsp114)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 -1
	yyvsp5 := yyvsp5 -1
	yyvs114.put (yyval114, yyvsp114)
end
		end

	yy_do_action_232 is
			--|#line 1635 "et_eiffel_parser.y"
		local
			yyval114: ET_TYPE_LIST
		do
--|#line 1635 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1635")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp114 := yyvsp114 + 1
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

	yy_do_action_233 is
			--|#line 1648 "et_eiffel_parser.y"
		local
			yyval114: ET_TYPE_LIST
		do
--|#line 1648 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1648")
end

			if yyvs112.item (yyvsp112) /= Void then
				yyval114 := ast_factory.new_convert_types (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval114 /= Void then
					yyval114.put_first (yyvs112.item (yyvsp112))
				end
			else
				yyval114 := ast_factory.new_convert_types (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp114 := yyvsp114 + 1
	yyvsp112 := yyvsp112 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_234 is
			--|#line 1659 "et_eiffel_parser.y"
		local
			yyval114: ET_TYPE_LIST
		do
--|#line 1659 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1659")
end

			yyval114 := yyvs114.item (yyvsp114)
			if yyval114 /= Void and yyvs113.item (yyvsp113) /= Void then
				yyval114.put_first (yyvs113.item (yyvsp113))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp113 := yyvsp113 -1
	yyvs114.put (yyval114, yyvsp114)
end
		end

	yy_do_action_235 is
			--|#line 1668 "et_eiffel_parser.y"
		local
			yyval113: ET_TYPE_ITEM
		do
--|#line 1668 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1668")
end

			yyval113 := ast_factory.new_type_comma (yyvs112.item (yyvsp112), yyvs5.item (yyvsp5))
			if yyval113 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp113 := yyvsp113 + 1
	yyvsp112 := yyvsp112 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_236 is
			--|#line 1679 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1679 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1679")
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
			--|#line 1684 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1684 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1684")
end

yyval67 := yyvs67.item (yyvsp67) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs67.put (yyval67, yyvsp67)
end
		end

	yy_do_action_238 is
			--|#line 1688 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1688 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1688")
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
			--|#line 1696 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1696 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1696")
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
			--|#line 1703 "et_eiffel_parser.y"
		local
			yyval67: ET_FEATURE_CLAUSE_LIST
		do
--|#line 1703 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1703")
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
			--|#line 1712 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1712 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1712")
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
			--|#line 1719 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1719 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1719")
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
			--|#line 1728 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1728 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1728")
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
			--|#line 1733 "et_eiffel_parser.y"
		local
			yyval66: ET_FEATURE_CLAUSE
		do
--|#line 1733 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1733")
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
			--|#line 1740 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1740 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1740")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp107 := yyvsp107 -1
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
			--|#line 1741 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1741 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1741")
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

	yy_do_action_247 is
			--|#line 1742 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1742 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1742")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp107 := yyvsp107 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_248 is
			--|#line 1743 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 1743 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1743")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp105 := yyvsp105 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_249 is
			--|#line 1748 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1748 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1748")
end

			yyval107 := yyvs107.item (yyvsp107)
			register_query (yyval107)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_250 is
			--|#line 1753 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1753 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1753")
end

			yyval107 := yyvs107.item (yyvsp107)
			yyval107.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_query (yyval107)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_251 is
			--|#line 1759 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1759 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1759")
end

			yyval107 := new_query_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs107.item (yyvsp107))
			register_query_synonym (yyval107)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_252 is
			--|#line 1764 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1764 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1764")
end

			yyval107 := new_query_synonym (yyvs64.item (yyvsp64), yyvs107.item (yyvsp107))
			register_query_synonym (yyval107)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 -1
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_253 is
			--|#line 1770 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1770 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1770")
end

			yyval107 := new_query_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs107.item (yyvsp107))
			yyval107.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_query_synonym (yyval107)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_254 is
			--|#line 1776 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1776 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1776")
end

			yyval107 := new_query_synonym (yyvs64.item (yyvsp64), yyvs107.item (yyvsp107))
			yyval107.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_query_synonym (yyval107)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvs107.put (yyval107, yyvsp107)
end
		end

	yy_do_action_255 is
			--|#line 1785 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1785 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1785")
end

			yyval105 := yyvs105.item (yyvsp105)
			register_procedure (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_256 is
			--|#line 1790 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1790 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1790")
end

			yyval105 := yyvs105.item (yyvsp105)
			yyval105.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_procedure (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_257 is
			--|#line 1796 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1796 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1796")
end

			yyval105 := new_procedure_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs105.item (yyvsp105))
			register_procedure_synonym (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_258 is
			--|#line 1801 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1801 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1801")
end

			yyval105 := new_procedure_synonym (yyvs64.item (yyvsp64), yyvs105.item (yyvsp105))
			register_procedure_synonym (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_259 is
			--|#line 1807 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1807 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1807")
end

			yyval105 := new_procedure_synonym (ast_factory.new_extended_feature_name_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5)), yyvs105.item (yyvsp105))
			yyval105.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_procedure_synonym (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_260 is
			--|#line 1813 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1813 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1813")
end

			yyval105 := new_procedure_synonym (yyvs64.item (yyvsp64), yyvs105.item (yyvsp105))
			yyval105.set_frozen_keyword (yyvs2.item (yyvsp2))
			register_procedure_synonym (yyval105)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvs105.put (yyval105, yyvsp105)
end
		end

	yy_do_action_261 is
			--|#line 1822 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1822 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1822")
end

yyval107 := ast_factory.new_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), Void, last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
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

	yy_do_action_262 is
			--|#line 1824 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1824 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1824")
end

yyval107 := ast_factory.new_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_263 is
			--|#line 1826 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1826 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1826")
end

yyval107 := ast_factory.new_constant_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2), yyvs46.item (yyvsp46), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -1
	yyvsp46 := yyvsp46 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_264 is
			--|#line 1828 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1828 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1828")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval107 := ast_factory.new_constant_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs5.item (yyvsp5), yyvs46.item (yyvsp46), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp46 := yyvsp46 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_265 is
			--|#line 1836 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1836 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1836")
end

yyval107 := ast_factory.new_unique_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -2
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_266 is
			--|#line 1838 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1838 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1838")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval107 := ast_factory.new_unique_attribute (yyvs64.item (yyvsp64), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs5.item (yyvsp5), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_267 is
			--|#line 1846 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1846 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1846")
end

yyval107 := ast_factory.new_do_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_268 is
			--|#line 1849 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1849 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1849")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval107 := ast_factory.new_do_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_269 is
			--|#line 1858 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1858 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1858")
end

yyval107 := ast_factory.new_do_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 15
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_270 is
			--|#line 1862 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1862 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1862")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval107 := ast_factory.new_do_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_271 is
			--|#line 1872 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1872 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1872")
end

yyval107 := ast_factory.new_once_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_272 is
			--|#line 1875 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1875 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1875")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval107 := ast_factory.new_once_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_273 is
			--|#line 1884 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1884 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1884")
end

yyval107 := ast_factory.new_once_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 15
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_274 is
			--|#line 1888 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1888 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1888")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval107 := ast_factory.new_once_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_275 is
			--|#line 1898 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1898 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1898")
end

yyval107 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs2.item (yyvsp2 - 1), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_276 is
			--|#line 1900 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1900 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1900")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval107 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs2.item (yyvsp2 - 1), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp2 := yyvsp2 -2
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_277 is
			--|#line 1908 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1908 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1908")
end

yyval107 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs2.item (yyvsp2 - 1), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_278 is
			--|#line 1911 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1911 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1911")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval107 := ast_factory.new_deferred_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs2.item (yyvsp2 - 1), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp2 := yyvsp2 -2
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_279 is
			--|#line 1920 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1920 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1920")
end

yyval107 := new_external_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_280 is
			--|#line 1923 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1923 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1923")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval107 := new_external_function (yyvs64.item (yyvsp64), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_281 is
			--|#line 1932 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1932 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1932")
end

yyval107 := new_external_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 15
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_282 is
			--|#line 1936 "et_eiffel_parser.y"
		local
			yyval107: ET_QUERY
		do
--|#line 1936 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1936")
end

			if current_system.is_ise and then current_system.ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval107 := new_external_function (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs33.item (yyvsp33), Void, yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp107 := yyvsp107 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp33 := yyvsp33 -1
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp103 := yyvsp103 -1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_283 is
			--|#line 1948 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1948 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1948")
end

yyval105 := ast_factory.new_do_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
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

	yy_do_action_284 is
			--|#line 1951 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1951 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1951")
end

yyval105 := ast_factory.new_do_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
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

	yy_do_action_285 is
			--|#line 1955 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1955 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1955")
end

yyval105 := ast_factory.new_once_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
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

	yy_do_action_286 is
			--|#line 1958 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1958 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1958")
end

yyval105 := ast_factory.new_once_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 1), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp2 := yyvsp2 -2
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
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

	yy_do_action_287 is
			--|#line 1962 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1962 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1962")
end

yyval105 := ast_factory.new_deferred_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs2.item (yyvsp2 - 1), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp103 := yyvsp103 -1
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

	yy_do_action_288 is
			--|#line 1964 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1964 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1964")
end

yyval105 := ast_factory.new_deferred_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), yyvs2.item (yyvsp2 - 1), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp103 := yyvsp103 -1
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

	yy_do_action_289 is
			--|#line 1967 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1967 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1967")
end

yyval105 := new_external_procedure (yyvs64.item (yyvsp64), Void, yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp103 := yyvsp103 -1
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

	yy_do_action_290 is
			--|#line 1970 "et_eiffel_parser.y"
		local
			yyval105: ET_PROCEDURE
		do
--|#line 1970 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1970")
end

yyval105 := new_external_procedure (yyvs64.item (yyvsp64), yyvs73.item (yyvsp73), yyvs2.item (yyvsp2 - 2), yyvs78.item (yyvsp78), yyvs98.item (yyvsp98), yyvs104.item (yyvsp104), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs22.item (yyvsp22), last_clients, last_feature_clause, last_class.master_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp105 := yyvsp105 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp73 := yyvsp73 -1
	yyvsp2 := yyvsp2 -3
	yyvsp78 := yyvsp78 -1
	yyvsp98 := yyvsp98 -1
	yyvsp104 := yyvsp104 -1
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp103 := yyvsp103 -1
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

	yy_do_action_291 is
			--|#line 1976 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 1976 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1976")
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
			--|#line 1984 "et_eiffel_parser.y"
		local
			yyval2: ET_KEYWORD
		do
--|#line 1984 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1984")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
		end

	yy_do_action_293 is
			--|#line 1988 "et_eiffel_parser.y"
		local
			yyval22: ET_SEMICOLON_SYMBOL
		do
--|#line 1988 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1988")
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
			--|#line 1990 "et_eiffel_parser.y"
		local
			yyval22: ET_SEMICOLON_SYMBOL
		do
--|#line 1990 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1990")
end

yyval22 := yyvs22.item (yyvsp22) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs22.put (yyval22, yyvsp22)
end
		end

	yy_do_action_295 is
			--|#line 1994 "et_eiffel_parser.y"
		local
			yyval65: ET_EXTERNAL_ALIAS
		do
--|#line 1994 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1994")
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
			--|#line 1996 "et_eiffel_parser.y"
		local
			yyval65: ET_EXTERNAL_ALIAS
		do
--|#line 1996 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1996")
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
			--|#line 2000 "et_eiffel_parser.y"
		local
			yyval33: ET_ASSIGNER
		do
--|#line 2000 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2000")
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
			--|#line 2002 "et_eiffel_parser.y"
		local
			yyval33: ET_ASSIGNER
		do
--|#line 2002 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2002")
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
			--|#line 2008 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2008 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2008")
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
			--|#line 2010 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2010 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2010")
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
			--|#line 2012 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2012 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2012")
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
			--|#line 2014 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2014 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2014")
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
			--|#line 2016 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2016 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2016")
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
			--|#line 2018 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2018 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2018")
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
			--|#line 2020 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2020 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2020")
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
			--|#line 2022 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2022 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2022")
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
			--|#line 2024 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2024 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2024")
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
			--|#line 2026 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2026 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2026")
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
			--|#line 2028 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2028 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2028")
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
			--|#line 2030 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2030 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2030")
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
			--|#line 2032 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2032 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2032")
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
			--|#line 2034 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2034 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2034")
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
			--|#line 2036 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2036 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2036")
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
			--|#line 2038 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2038 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2038")
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
			--|#line 2040 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2040 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2040")
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
			--|#line 2042 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2042 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2042")
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
			--|#line 2044 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2044 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2044")
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
			--|#line 2046 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2046 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2046")
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
			--|#line 2048 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2048 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2048")
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
			--|#line 2050 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2050 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2050")
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
			--|#line 2052 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2052 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2052")
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

	yy_do_action_323 is
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

	yy_do_action_324 is
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

	yy_do_action_325 is
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

	yy_do_action_326 is
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

	yy_do_action_327 is
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

	yy_do_action_328 is
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

	yy_do_action_329 is
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

	yy_do_action_330 is
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

	yy_do_action_331 is
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

	yy_do_action_332 is
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

	yy_do_action_333 is
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

	yy_do_action_334 is
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

	yy_do_action_335 is
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

	yy_do_action_336 is
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

	yy_do_action_337 is
			--|#line 2085 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2085 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2085")
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

	yy_do_action_339 is
			--|#line 2089 "et_eiffel_parser.y"
		local
			yyval69: ET_FEATURE_NAME
		do
--|#line 2089 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2089")
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
			--|#line 2093 "et_eiffel_parser.y"
		local
			yyval64: ET_EXTENDED_FEATURE_NAME
		do
--|#line 2093 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2093")
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
			--|#line 2095 "et_eiffel_parser.y"
		local
			yyval64: ET_EXTENDED_FEATURE_NAME
		do
--|#line 2095 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2095")
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
			--|#line 2099 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2099 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2099")
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
			--|#line 2101 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2101 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2101")
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
			--|#line 2103 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2103 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2103")
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
			--|#line 2105 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2105 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2105")
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
			--|#line 2107 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2107 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2107")
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
			--|#line 2109 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2109 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2109")
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
			--|#line 2111 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2111 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2111")
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
			--|#line 2113 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2113 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2113")
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
			--|#line 2115 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2115 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2115")
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
			--|#line 2117 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2117 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2117")
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
			--|#line 2119 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2119 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2119")
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
			--|#line 2121 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2121 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2121")
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
			--|#line 2123 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2123 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2123")
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
			--|#line 2125 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2125 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2125")
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
			--|#line 2127 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2127 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2127")
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
			--|#line 2129 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2129 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2129")
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
			--|#line 2131 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2131 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2131")
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
			--|#line 2133 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2133 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2133")
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
			--|#line 2135 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2135 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2135")
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
			--|#line 2137 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2137 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2137")
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
			--|#line 2139 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2139 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2139")
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
			--|#line 2142 "et_eiffel_parser.y"
		local
			yyval32: ET_ALIAS_NAME
		do
--|#line 2142 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2142")
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
			--|#line 2148 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2148 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2148")
end

			yyval73 := yyvs73.item (yyvsp73)
			set_start_closure (yyval73)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_365 is
			--|#line 2155 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2155 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2155")
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
			--|#line 2157 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2157 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2157")
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
			--|#line 2165 "et_eiffel_parser.y"
		local
			yyval5: ET_SYMBOL
		do
--|#line 2165 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2165")
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
			--|#line 2176 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2176 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2176")
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
			--|#line 2183 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2183 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2183")
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
			--|#line 2190 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2190 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2190")
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
			--|#line 2200 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2200 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2200")
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
			--|#line 2211 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2211 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2211")
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
			--|#line 2218 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2218 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2218")
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
			--|#line 2227 "et_eiffel_parser.y"
		local
			yyval71: ET_FORMAL_ARGUMENT
		do
--|#line 2227 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2227")
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
			--|#line 2236 "et_eiffel_parser.y"
		local
			yyval71: ET_FORMAL_ARGUMENT
		do
--|#line 2236 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2236")
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
			--|#line 2245 "et_eiffel_parser.y"
		local
			yyval72: ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2245 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2245")
end

			yyval72 := ast_factory.new_formal_argument (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)))
			if yyval72 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp72 := yyvsp72 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
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
			--|#line 2254 "et_eiffel_parser.y"
		local
			yyval72: ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2254 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2254")
end

			yyval72 := ast_factory.new_formal_argument_semicolon (ast_factory.new_formal_argument (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112))), yyvs22.item (yyvsp22))
			if yyval72 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp72 := yyvsp72 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
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
			--|#line 2265 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2265 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2265")
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
			--|#line 2267 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2267 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2267")
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
			--|#line 2269 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2269 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2269")
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
			--|#line 2269 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2269 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2269")
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
			--|#line 2282 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2282 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2282")
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
			--|#line 2289 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2289 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2289")
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
			--|#line 2296 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2296 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2296")
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
			--|#line 2306 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2306 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2306")
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
			--|#line 2317 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2317 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2317")
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
			--|#line 2324 "et_eiffel_parser.y"
		local
			yyval91: ET_LOCAL_VARIABLE_LIST
		do
--|#line 2324 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2324")
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
			--|#line 2333 "et_eiffel_parser.y"
		local
			yyval89: ET_LOCAL_VARIABLE
		do
--|#line 2333 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2333")
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
			--|#line 2342 "et_eiffel_parser.y"
		local
			yyval89: ET_LOCAL_VARIABLE
		do
--|#line 2342 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2342")
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
			--|#line 2351 "et_eiffel_parser.y"
		local
			yyval90: ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2351 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2351")
end

			yyval90 := ast_factory.new_local_variable (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)))
			if yyval90 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
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
			--|#line 2360 "et_eiffel_parser.y"
		local
			yyval90: ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2360 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2360")
end

			yyval90 := ast_factory.new_local_variable_semicolon (ast_factory.new_local_variable (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112))), yyvs22.item (yyvsp22))
			if yyval90 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp90 := yyvsp90 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
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
			--|#line 2371 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2371 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2371")
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
			--|#line 2373 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2373 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2373")
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
			--|#line 2375 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2375 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2375")
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
			--|#line 2377 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2377 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2377")
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
			--|#line 2379 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2379 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2379")
end

add_expression_assertion (yyvs62.item (yyvsp62), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 -1
	yyvs1.put (yyval1, yyvsp1)
end
		end

	yy_do_action_397 is
			--|#line 2381 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2381 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2381")
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
			--|#line 2383 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2383 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2383")
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
			--|#line 2385 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2385 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2385")
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
			--|#line 2389 "et_eiffel_parser.y"
		local
			yyval104: ET_PRECONDITIONS
		do
--|#line 2389 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2389")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp104 := yyvsp104 + 1
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

	yy_do_action_401 is
			--|#line 2391 "et_eiffel_parser.y"
		local
			yyval104: ET_PRECONDITIONS
		do
--|#line 2391 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2391")
end

yyval104 := new_preconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp104 := yyvsp104 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_402 is
			--|#line 2393 "et_eiffel_parser.y"
		local
			yyval104: ET_PRECONDITIONS
		do
--|#line 2393 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2393")
end

yyval104 := new_preconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp104 := yyvsp104 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_403 is
			--|#line 2395 "et_eiffel_parser.y"
		local
			yyval104: ET_PRECONDITIONS
		do
--|#line 2395 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2395")
end

yyval104 := new_preconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp104 := yyvsp104 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_404 is
			--|#line 2397 "et_eiffel_parser.y"
		local
			yyval104: ET_PRECONDITIONS
		do
--|#line 2397 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2397")
end

yyval104 := new_preconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp104 := yyvsp104 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_405 is
			--|#line 2401 "et_eiffel_parser.y"
		local
			yyval103: ET_POSTCONDITIONS
		do
--|#line 2401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2401")
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

	yy_do_action_406 is
			--|#line 2403 "et_eiffel_parser.y"
		local
			yyval103: ET_POSTCONDITIONS
		do
--|#line 2403 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2403")
end

yyval103 := new_postconditions (yyvs2.item (yyvsp2), Void) 
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

	yy_do_action_407 is
			--|#line 2405 "et_eiffel_parser.y"
		local
			yyval103: ET_POSTCONDITIONS
		do
--|#line 2405 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2405")
end

yyval103 := new_postconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
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

	yy_do_action_408 is
			--|#line 2407 "et_eiffel_parser.y"
		local
			yyval103: ET_POSTCONDITIONS
		do
--|#line 2407 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2407")
end

yyval103 := new_postconditions (yyvs2.item (yyvsp2), Void) 
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

	yy_do_action_409 is
			--|#line 2409 "et_eiffel_parser.y"
		local
			yyval103: ET_POSTCONDITIONS
		do
--|#line 2409 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2409")
end

yyval103 := new_postconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
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

	yy_do_action_410 is
			--|#line 2413 "et_eiffel_parser.y"
		local
			yyval86: ET_INVARIANTS
		do
--|#line 2413 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2413")
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
			--|#line 2415 "et_eiffel_parser.y"
		local
			yyval86: ET_INVARIANTS
		do
--|#line 2415 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2415")
end

yyval86 := yyvs86.item (yyvsp86) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs86.put (yyval86, yyvsp86)
end
		end

	yy_do_action_412 is
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

	yy_do_action_413 is
			--|#line 2421 "et_eiffel_parser.y"
		local
			yyval86: ET_INVARIANTS
		do
--|#line 2421 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2421")
end

yyval86 := new_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp86 := yyvsp86 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
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
			--|#line 2425 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2425 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2425")
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

	yy_do_action_415 is
			--|#line 2429 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2429 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2429")
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

	yy_do_action_416 is
			--|#line 2431 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2431 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2431")
end

yyval92 := yyvs92.item (yyvsp92) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs92.put (yyval92, yyvsp92)
end
		end

	yy_do_action_417 is
			--|#line 2435 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2435 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2435")
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

	yy_do_action_418 is
			--|#line 2437 "et_eiffel_parser.y"
		local
			yyval92: ET_LOOP_INVARIANTS
		do
--|#line 2437 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2437")
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

	yy_do_action_419 is
			--|#line 2441 "et_eiffel_parser.y"
		local
			yyval115: ET_VARIANT
		do
--|#line 2441 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2441")
end

yyval115 := ast_factory.new_variant (yyvs2.item (yyvsp2), Void, Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp115 := yyvsp115 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_420 is
			--|#line 2443 "et_eiffel_parser.y"
		local
			yyval115: ET_VARIANT
		do
--|#line 2443 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2443")
end

yyval115 := ast_factory.new_variant (yyvs2.item (yyvsp2), Void, yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp115 := yyvsp115 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp62 := yyvsp62 -1
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

	yy_do_action_421 is
			--|#line 2445 "et_eiffel_parser.y"
		local
			yyval115: ET_VARIANT
		do
--|#line 2445 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2445")
end

yyval115 := ast_factory.new_variant (yyvs2.item (yyvsp2), ast_factory.new_tag (yyvs13.item (yyvsp13), yyvs5.item (yyvsp5)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp115 := yyvsp115 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp62 := yyvsp62 -1
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

	yy_do_action_422 is
			--|#line 2451 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2451 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2451")
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
			--|#line 2453 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2453 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2453")
end

yyval45 := yyvs45.item (yyvsp45) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs45.put (yyval45, yyvsp45)
end
		end

	yy_do_action_424 is
			--|#line 2459 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2459 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2459")
end

yyval112 := new_named_type (Void, yyvs13.item (yyvsp13), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -1
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

	yy_do_action_425 is
			--|#line 2461 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2461 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2461")
end

yyval112 := yyvs112.item (yyvsp112) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs112.put (yyval112, yyvsp112)
end
		end

	yy_do_action_426 is
			--|#line 2465 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2465 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2465")
end

yyval112 := new_named_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_427 is
			--|#line 2467 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2467 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2467")
end

yyval112 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_428 is
			--|#line 2469 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2469 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2469")
end

yyval112 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_429 is
			--|#line 2471 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2471 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2471")
end

yyval112 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_430 is
			--|#line 2473 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2473 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2473")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_named_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_431 is
			--|#line 2481 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2481 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2481")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_named_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp24 := yyvsp24 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_432 is
			--|#line 2489 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2489 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2489")
end

yyval112 := yyvs88.item (yyvsp88) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp112 := yyvsp112 + 1
	yyvsp88 := yyvsp88 -1
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

	yy_do_action_433 is
			--|#line 2491 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2491 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2491")
end

yyval112 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp14 := yyvsp14 -1
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

	yy_do_action_434 is
			--|#line 2493 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2493 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2493")
end

yyval112 := new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -2
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

	yy_do_action_435 is
			--|#line 2495 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2495 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2495")
end

yyval112 := new_tuple_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_436 is
			--|#line 2497 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2497 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2497")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_tuple_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_437 is
			--|#line 2505 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2505 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2505")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_tuple_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp24 := yyvsp24 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_438 is
			--|#line 2515 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2515 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2515")
end

yyval112 := new_named_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_439 is
			--|#line 2517 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2517 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2517")
end

yyval112 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_440 is
			--|#line 2519 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2519 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2519")
end

yyval112 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_441 is
			--|#line 2521 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2521 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2521")
end

yyval112 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_442 is
			--|#line 2523 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2523 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2523")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_named_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_443 is
			--|#line 2531 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2531 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2531")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_named_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp24 := yyvsp24 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_444 is
			--|#line 2539 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2539 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2539")
end

yyval112 := yyvs88.item (yyvsp88) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp112 := yyvsp112 + 1
	yyvsp88 := yyvsp88 -1
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

	yy_do_action_445 is
			--|#line 2541 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2541 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2541")
end

yyval112 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp14 := yyvsp14 -1
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

	yy_do_action_446 is
			--|#line 2543 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2543 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2543")
end

yyval112 := new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -2
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

	yy_do_action_447 is
			--|#line 2545 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2545 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2545")
end

yyval112 := new_tuple_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_448 is
			--|#line 2547 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2547 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2547")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_tuple_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_449 is
			--|#line 2555 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2555 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2555")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_tuple_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp24 := yyvsp24 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_450 is
			--|#line 2565 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2565 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2565")
end

yyval112 := new_named_type (Void, yyvs13.item (yyvsp13), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -1
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

	yy_do_action_451 is
			--|#line 2567 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2567 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2567")
end

yyval112 := new_named_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_452 is
			--|#line 2569 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2569 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2569")
end

yyval112 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_453 is
			--|#line 2571 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2571 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2571")
end

yyval112 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_454 is
			--|#line 2573 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2573 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2573")
end

yyval112 := new_named_type (yyvs2.item (yyvsp2), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_455 is
			--|#line 2575 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2575 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2575")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_named_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_456 is
			--|#line 2583 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2583 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2583")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_named_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp24 := yyvsp24 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_457 is
			--|#line 2591 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2591 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2591")
end

yyval112 := yyvs88.item (yyvsp88) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp112 := yyvsp112 + 1
	yyvsp88 := yyvsp88 -1
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

	yy_do_action_458 is
			--|#line 2593 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2593 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2593")
end

yyval112 := new_bit_n (yyvs13.item (yyvsp13), yyvs14.item (yyvsp14)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp14 := yyvsp14 -1
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

	yy_do_action_459 is
			--|#line 2595 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2595 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2595")
end

yyval112 := new_bit_feature (yyvs13.item (yyvsp13 - 1), yyvs13.item (yyvsp13))  
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -2
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

	yy_do_action_460 is
			--|#line 2597 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2597 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2597")
end

yyval112 := new_tuple_type (Void, yyvs13.item (yyvsp13), yyvs27.item (yyvsp27)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_461 is
			--|#line 2599 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2599 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2599")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_tuple_type (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_462 is
			--|#line 2607 "et_eiffel_parser.y"
		local
			yyval112: ET_TYPE
		do
--|#line 2607 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2607")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval112 := new_tuple_type (yyvs24.item (yyvsp24), yyvs13.item (yyvsp13), yyvs27.item (yyvsp27))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp24 := yyvsp24 -1
	yyvsp13 := yyvsp13 -1
	yyvsp27 := yyvsp27 -1
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

	yy_do_action_463 is
			--|#line 2617 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 2617 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2617")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_464 is
			--|#line 2621 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2621 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2621")
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
			--|#line 2623 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2623 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2623")
end

yyval27 := yyvs27.item (yyvsp27) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_466 is
			--|#line 2627 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2627 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2627")
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
			--|#line 2630 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2630 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2630")
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
			--|#line 2638 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2638 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2638")
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
			--|#line 2645 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2645 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2645")
end

			if yyvs112.item (yyvsp112) /= Void then
				yyval27 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval27 /= Void then
					yyval27.put_first (yyvs112.item (yyvsp112))
				end
			else
				yyval27 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 + 1
	yyvsp112 := yyvsp112 -1
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
			--|#line 2656 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2656 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2656")
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
			--|#line 2661 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2661 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2661")
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
			--|#line 2666 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2666 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2666")
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
			--|#line 2673 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 2673 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2673")
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
			--|#line 2679 "et_eiffel_parser.y"
		local
			yyval26: ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2679 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2679")
end

			yyval26 := ast_factory.new_actual_parameter_comma (yyvs112.item (yyvsp112), yyvs5.item (yyvsp5))
			if yyval26 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 + 1
	yyvsp112 := yyvsp112 -1
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
			--|#line 2688 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2688 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2688")
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
			--|#line 2690 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2690 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2690")
end

yyval27 := yyvs27.item (yyvsp27) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs27.put (yyval27, yyvsp27)
end
		end

	yy_do_action_477 is
			--|#line 2694 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2694 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2694")
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
			--|#line 2697 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2697 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2697")
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
			--|#line 2703 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2703 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2703")
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
			--|#line 2711 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2711 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2711")
end

			yyval27 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
			add_to_actual_parameter_list (ast_factory.new_labeled_actual_parameter (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112))), yyval27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp27 := yyvsp27 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
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
			--|#line 2716 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2716 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2716")
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
			--|#line 2721 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2721 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2721")
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
			--|#line 2726 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2726 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2726")
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
			--|#line 2737 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2737 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2737")
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
			--|#line 2748 "et_eiffel_parser.y"
		local
			yyval27: ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2748 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2748")
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
			--|#line 2761 "et_eiffel_parser.y"
		local
			yyval26: ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2761 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2761")
end

			yyval26 := ast_factory.new_labeled_actual_parameter (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)))
			if yyval26 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
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
			--|#line 2770 "et_eiffel_parser.y"
		local
			yyval26: ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2770 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2770")
end

			yyval26 := ast_factory.new_labeled_actual_parameter_semicolon (ast_factory.new_labeled_actual_parameter (yyvs13.item (yyvsp13), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112))), yyvs22.item (yyvsp22))
			if yyval26 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp26 := yyvsp26 + 1
	yyvsp13 := yyvsp13 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
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
			--|#line 2779 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2779 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2779")
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
			--|#line 2781 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2781 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2781")
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
			--|#line 2789 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2789 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2789")
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
			--|#line 2797 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2797 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2797")
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
			--|#line 2799 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2799 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2799")
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
			--|#line 2807 "et_eiffel_parser.y"
		local
			yyval88: ET_LIKE_TYPE
		do
--|#line 2807 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2807")
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
			yyval88: ET_LIKE_TYPE
		do
--|#line 2815 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2815")
end

yyval88 := yyvs106.item (yyvsp106) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp88 := yyvsp88 + 1
	yyvsp106 := yyvsp106 -1
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

	yy_do_action_495 is
			--|#line 2819 "et_eiffel_parser.y"
		local
			yyval106: ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2819 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2819")
end

			if not current_system.qualified_anchored_types_enabled then
				raise_error
			else
				yyval106 := ast_factory.new_qualified_like_braced_type (Void, yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp106 := yyvsp106 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp112 := yyvsp112 -1
	yyvsp13 := yyvsp13 -1
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

	yy_do_action_496 is
			--|#line 2827 "et_eiffel_parser.y"
		local
			yyval106: ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2827 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2827")
end

			if not current_system.qualified_anchored_types_enabled then
				raise_error
			elseif current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval106 := ast_factory.new_qualified_like_braced_type (yyvs5.item (yyvsp5 - 3), yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp106 := yyvsp106 + 1
	yyvsp5 := yyvsp5 -4
	yyvsp2 := yyvsp2 -1
	yyvsp112 := yyvsp112 -1
	yyvsp13 := yyvsp13 -1
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

	yy_do_action_497 is
			--|#line 2837 "et_eiffel_parser.y"
		local
			yyval106: ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2837 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2837")
end

			if not current_system.qualified_anchored_types_enabled then
				raise_error
			elseif current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval106 := ast_factory.new_qualified_like_braced_type (yyvs24.item (yyvsp24), yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp106 := yyvsp106 + 1
	yyvsp24 := yyvsp24 -1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp112 := yyvsp112 -1
	yyvsp13 := yyvsp13 -1
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

	yy_do_action_498 is
			--|#line 2847 "et_eiffel_parser.y"
		local
			yyval106: ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2847 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2847")
end

			if not current_system.qualified_anchored_types_enabled then
				raise_error
			else
				yyval106 := ast_factory.new_qualified_like_type (yyvs88.item (yyvsp88), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp106 := yyvsp106 + 1
	yyvsp88 := yyvsp88 -1
	yyvsp5 := yyvsp5 -1
	yyvsp13 := yyvsp13 -1
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

	yy_do_action_499 is
			--|#line 2859 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2859 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2859")
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

	yy_do_action_500 is
			--|#line 2861 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2861 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2861")
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

	yy_do_action_501 is
			--|#line 2868 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2868 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2868")
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

	yy_do_action_502 is
			--|#line 2870 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2870 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2870")
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

	yy_do_action_503 is
			--|#line 2877 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2877 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2877")
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

	yy_do_action_504 is
			--|#line 2879 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2879 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2879")
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

	yy_do_action_505 is
			--|#line 2886 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2886 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2886")
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

	yy_do_action_506 is
			--|#line 2888 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2888 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2888")
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

	yy_do_action_507 is
			--|#line 2895 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2895 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2895")
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

	yy_do_action_508 is
			--|#line 2897 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2897 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2897")
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

	yy_do_action_509 is
			--|#line 2904 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2904 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2904")
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

	yy_do_action_510 is
			--|#line 2906 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2906 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2906")
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

	yy_do_action_511 is
			--|#line 2913 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2913 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2913")
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

	yy_do_action_512 is
			--|#line 2915 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2915 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2915")
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

	yy_do_action_513 is
			--|#line 2922 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2922 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2922")
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

	yy_do_action_514 is
			--|#line 2933 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2933 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2933")
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

	yy_do_action_515 is
			--|#line 2933 "et_eiffel_parser.y"
		local
			yyval45: ET_COMPOUND
		do
--|#line 2933 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2933")
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

	yy_do_action_516 is
			--|#line 2954 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2954 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2954")
end

yyval85 := yyvs85.item (yyvsp85) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_517 is
			--|#line 2956 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2956 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2956")
end

yyval85 := yyvs85.item (yyvsp85) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_518 is
			--|#line 2958 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2958 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2958")
end

yyval85 := yyvs85.item (yyvsp85) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs85.put (yyval85, yyvsp85)
end
		end

	yy_do_action_519 is
			--|#line 2960 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2960 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2960")
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

	yy_do_action_520 is
			--|#line 2962 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2962 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2962")
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

	yy_do_action_521 is
			--|#line 2964 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2964 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2964")
end

yyval85 := ast_factory.new_assignment (yyvs118.item (yyvsp118), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp85 := yyvsp85 + 1
	yyvsp118 := yyvsp118 -1
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

	yy_do_action_522 is
			--|#line 2966 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2966 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2966")
end

yyval85 := ast_factory.new_assignment_attempt (yyvs118.item (yyvsp118), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp85 := yyvsp85 + 1
	yyvsp118 := yyvsp118 -1
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

	yy_do_action_523 is
			--|#line 2968 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2968 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2968")
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

	yy_do_action_524 is
			--|#line 2970 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2970 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2970")
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

	yy_do_action_525 is
			--|#line 2972 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2972 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2972")
end

yyval85 := ast_factory.new_loop_instruction_old_syntax (yyvs45.item (yyvsp45 - 1), yyvs92.item (yyvsp92), yyvs115.item (yyvsp115), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp85 := yyvsp85 + 1
	yyvsp45 := yyvsp45 -2
	yyvsp92 := yyvsp92 -1
	yyvsp115 := yyvsp115 -1
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

	yy_do_action_526 is
			--|#line 2974 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2974 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2974")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_3_7_4554 then
				yyval85 := ast_factory.new_loop_instruction_old_syntax (yyvs45.item (yyvsp45 - 1), yyvs92.item (yyvsp92), Void, ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2))
			else
				yyval85 := ast_factory.new_loop_instruction (yyvs45.item (yyvsp45 - 1), yyvs92.item (yyvsp92), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45), Void, yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp85 := yyvsp85 + 1
	yyvsp45 := yyvsp45 -2
	yyvsp92 := yyvsp92 -1
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

	yy_do_action_527 is
			--|#line 2982 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2982 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2982")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_3_7_4554 then
				raise_error
			else
				yyval85 := ast_factory.new_loop_instruction (yyvs45.item (yyvsp45 - 1), yyvs92.item (yyvsp92), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs45.item (yyvsp45), yyvs115.item (yyvsp115), yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp85 := yyvsp85 + 1
	yyvsp45 := yyvsp45 -2
	yyvsp92 := yyvsp92 -1
	yyvsp2 := yyvsp2 -2
	yyvsp62 := yyvsp62 -1
	yyvsp115 := yyvsp115 -1
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
			--|#line 2995 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2995 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2995")
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

	yy_do_action_529 is
			--|#line 2997 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2997 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2997")
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

	yy_do_action_530 is
			--|#line 2999 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 2999 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2999")
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

	yy_do_action_531 is
			--|#line 3001 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3001 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3001")
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

	yy_do_action_532 is
			--|#line 3003 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3003 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3003")
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

	yy_do_action_533 is
			--|#line 3009 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3009 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3009")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5), yyvs118.item (yyvsp118), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp85 := yyvsp85 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
	yyvsp118 := yyvsp118 -1
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
			--|#line 3011 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3011 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3011")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 2), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5 - 1), yyvs118.item (yyvsp118), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp85 := yyvsp85 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp112 := yyvsp112 -1
	yyvsp118 := yyvsp118 -1
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

	yy_do_action_535 is
			--|#line 3013 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3013 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3013")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 1), Void, yyvs5.item (yyvsp5), yyvs118.item (yyvsp118), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp85 := yyvsp85 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp118 := yyvsp118 -1
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

	yy_do_action_536 is
			--|#line 3015 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3015 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3015")
end

yyval85 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 2), Void, yyvs5.item (yyvsp5 - 1), yyvs118.item (yyvsp118), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp85 := yyvsp85 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp118 := yyvsp118 -1
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

	yy_do_action_537 is
			--|#line 3019 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3019 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3019")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5)), yyvs118.item (yyvsp118), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
	yyvsp118 := yyvsp118 -1
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

	yy_do_action_538 is
			--|#line 3021 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3021 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3021")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5 - 1)), yyvs118.item (yyvsp118), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp112 := yyvsp112 -1
	yyvsp118 := yyvsp118 -1
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
			--|#line 3023 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3023 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3023")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), Void, yyvs118.item (yyvsp118), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp118 := yyvsp118 -1
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
			--|#line 3025 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3025 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3025")
end

yyval85 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), Void, yyvs118.item (yyvsp118), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp118 := yyvsp118 -1
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

	yy_do_action_541 is
			--|#line 3029 "et_eiffel_parser.y"
		local
			yyval54: ET_CREATE_EXPRESSION
		do
--|#line 3029 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3029")
end

yyval54 := ast_factory.new_create_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5)), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
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

	yy_do_action_542 is
			--|#line 3031 "et_eiffel_parser.y"
		local
			yyval54: ET_CREATE_EXPRESSION
		do
--|#line 3031 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3031")
end

yyval54 := ast_factory.new_create_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5 - 1)), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp112 := yyvsp112 -1
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

	yy_do_action_543 is
			--|#line 3037 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 3037 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3037")
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

	yy_do_action_544 is
			--|#line 3039 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 3039 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3039")
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

	yy_do_action_545 is
			--|#line 3041 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 3041 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3041")
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

	yy_do_action_546 is
			--|#line 3043 "et_eiffel_parser.y"
		local
			yyval77: ET_IF_INSTRUCTION
		do
--|#line 3043 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3043")
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

	yy_do_action_547 is
			--|#line 3047 "et_eiffel_parser.y"
		local
			yyval59: ET_ELSEIF_PART_LIST
		do
--|#line 3047 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3047")
end

			yyval59 := yyvs59.item (yyvsp59)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs59.put (yyval59, yyvsp59)
end
		end

	yy_do_action_548 is
			--|#line 3054 "et_eiffel_parser.y"
		local
			yyval59: ET_ELSEIF_PART_LIST
		do
--|#line 3054 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3054")
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

	yy_do_action_549 is
			--|#line 3061 "et_eiffel_parser.y"
		local
			yyval59: ET_ELSEIF_PART_LIST
		do
--|#line 3061 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3061")
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

	yy_do_action_550 is
			--|#line 3070 "et_eiffel_parser.y"
		local
			yyval58: ET_ELSEIF_PART
		do
--|#line 3070 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3070")
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

	yy_do_action_551 is
			--|#line 3081 "et_eiffel_parser.y"
		local
			yyval84: ET_INSPECT_INSTRUCTION
		do
--|#line 3081 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3081")
end

yyval84 := ast_factory.new_inspect_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs117.item (yyvsp117), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp84 := yyvsp84 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp62 := yyvsp62 -1
	yyvsp117 := yyvsp117 -1
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

	yy_do_action_552 is
			--|#line 3083 "et_eiffel_parser.y"
		local
			yyval84: ET_INSPECT_INSTRUCTION
		do
--|#line 3083 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3083")
end

yyval84 := ast_factory.new_inspect_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs62.item (yyvsp62)), yyvs117.item (yyvsp117), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp84 := yyvsp84 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp62 := yyvsp62 -1
	yyvsp117 := yyvsp117 -1
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

	yy_do_action_553 is
			--|#line 3087 "et_eiffel_parser.y"
		local
			yyval117: ET_WHEN_PART_LIST
		do
--|#line 3087 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3087")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp117 := yyvsp117 + 1
	if yyvsp117 >= yyvsc117 then
		if yyvs117 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs117")
			end
			create yyspecial_routines117
			yyvsc117 := yyInitial_yyvs_size
			yyvs117 := yyspecial_routines117.make (yyvsc117)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs117")
			end
			yyvsc117 := yyvsc117 + yyInitial_yyvs_size
			yyvs117 := yyspecial_routines117.resize (yyvs117, yyvsc117)
		end
	end
	yyvs117.put (yyval117, yyvsp117)
end
		end

	yy_do_action_554 is
			--|#line 3089 "et_eiffel_parser.y"
		local
			yyval117: ET_WHEN_PART_LIST
		do
--|#line 3089 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3089")
end

			yyval117 := yyvs117.item (yyvsp117)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs117.put (yyval117, yyvsp117)
end
		end

	yy_do_action_555 is
			--|#line 3096 "et_eiffel_parser.y"
		local
			yyval117: ET_WHEN_PART_LIST
		do
--|#line 3096 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3096")
end

			yyval117 := ast_factory.new_when_part_list (counter_value)
			if yyval117 /= Void and yyvs116.item (yyvsp116) /= Void then
				yyval117.put_first (yyvs116.item (yyvsp116))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp117 := yyvsp117 + 1
	yyvsp116 := yyvsp116 -1
	if yyvsp117 >= yyvsc117 then
		if yyvs117 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs117")
			end
			create yyspecial_routines117
			yyvsc117 := yyInitial_yyvs_size
			yyvs117 := yyspecial_routines117.make (yyvsc117)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs117")
			end
			yyvsc117 := yyvsc117 + yyInitial_yyvs_size
			yyvs117 := yyspecial_routines117.resize (yyvs117, yyvsc117)
		end
	end
	yyvs117.put (yyval117, yyvsp117)
end
		end

	yy_do_action_556 is
			--|#line 3103 "et_eiffel_parser.y"
		local
			yyval117: ET_WHEN_PART_LIST
		do
--|#line 3103 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3103")
end

			yyval117 := yyvs117.item (yyvsp117)
			if yyval117 /= Void and yyvs116.item (yyvsp116) /= Void then
				yyval117.put_first (yyvs116.item (yyvsp116))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp116 := yyvsp116 -1
	yyvs117.put (yyval117, yyvsp117)
end
		end

	yy_do_action_557 is
			--|#line 3112 "et_eiffel_parser.y"
		local
			yyval116: ET_WHEN_PART
		do
--|#line 3112 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3112")
end

			yyval116 := ast_factory.new_when_part (yyvs41.item (yyvsp41), yyvs45.item (yyvsp45))
			if yyval116 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp116 := yyvsp116 + 1
	yyvsp41 := yyvsp41 -1
	yyvsp45 := yyvsp45 -1
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

	yy_do_action_558 is
			--|#line 3121 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3121 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3121")
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

	yy_do_action_559 is
			--|#line 3123 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3123 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3123")
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

	yy_do_action_560 is
			--|#line 3123 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3123 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3123")
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

	yy_do_action_561 is
			--|#line 3136 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3136 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3136")
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

	yy_do_action_562 is
			--|#line 3147 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3147 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3147")
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

	yy_do_action_563 is
			--|#line 3155 "et_eiffel_parser.y"
		local
			yyval41: ET_CHOICE_LIST
		do
--|#line 3155 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3155")
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

	yy_do_action_564 is
			--|#line 3164 "et_eiffel_parser.y"
		local
			yyval40: ET_CHOICE_ITEM
		do
--|#line 3164 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3164")
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

	yy_do_action_565 is
			--|#line 3173 "et_eiffel_parser.y"
		local
			yyval38: ET_CHOICE
		do
--|#line 3173 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3173")
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

	yy_do_action_566 is
			--|#line 3175 "et_eiffel_parser.y"
		local
			yyval38: ET_CHOICE
		do
--|#line 3175 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3175")
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

	yy_do_action_567 is
			--|#line 3179 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 3179 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3179")
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

	yy_do_action_568 is
			--|#line 3181 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 3181 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3181")
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

	yy_do_action_569 is
			--|#line 3183 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 3183 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3183")
end

yyval39 := new_choice_attribute_constant (yyvs13.item (yyvsp13)) 
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

	yy_do_action_570 is
			--|#line 3185 "et_eiffel_parser.y"
		local
			yyval39: ET_CHOICE_CONSTANT
		do
--|#line 3185 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3185")
end

yyval39 := yyvs110.item (yyvsp110) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp39 := yyvsp39 + 1
	yyvsp110 := yyvsp110 -1
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

	yy_do_action_571 is
			--|#line 3191 "et_eiffel_parser.y"
		local
			yyval57: ET_DEBUG_INSTRUCTION
		do
--|#line 3191 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3191")
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

	yy_do_action_572 is
			--|#line 3193 "et_eiffel_parser.y"
		local
			yyval57: ET_DEBUG_INSTRUCTION
		do
--|#line 3193 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3193")
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

	yy_do_action_573 is
			--|#line 3200 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3200 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3200")
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

	yy_do_action_574 is
			--|#line 3202 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3202 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3202")
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

	yy_do_action_575 is
			--|#line 3204 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3204 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3204")
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

	yy_do_action_576 is
			--|#line 3204 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3204 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3204")
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

	yy_do_action_577 is
			--|#line 3217 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3217 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3217")
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

	yy_do_action_578 is
			--|#line 3228 "et_eiffel_parser.y"
		local
			yyval95: ET_MANIFEST_STRING_LIST
		do
--|#line 3228 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3228")
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

	yy_do_action_579 is
			--|#line 3237 "et_eiffel_parser.y"
		local
			yyval94: ET_MANIFEST_STRING_ITEM
		do
--|#line 3237 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3237")
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

	yy_do_action_580 is
			--|#line 3248 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3248 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3248")
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

	yy_do_action_581 is
			--|#line 3250 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3250 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3250")
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

	yy_do_action_582 is
			--|#line 3252 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3252 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3252")
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

	yy_do_action_583 is
			--|#line 3254 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3254 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3254")
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

	yy_do_action_584 is
			--|#line 3256 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3256 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3256")
end

yyval85 := ast_factory.new_static_call_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp112 := yyvsp112 -1
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

	yy_do_action_585 is
			--|#line 3258 "et_eiffel_parser.y"
		local
			yyval85: ET_INSTRUCTION
		do
--|#line 3258 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3258")
end

yyval85 := ast_factory.new_static_call_instruction (Void, ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp85 := yyvsp85 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp112 := yyvsp112 -1
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

	yy_do_action_586 is
			--|#line 3262 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3262 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3262")
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
			--|#line 3264 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3264 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3264")
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

	yy_do_action_588 is
			--|#line 3268 "et_eiffel_parser.y"
		local
			yyval37: ET_CALL_EXPRESSION
		do
--|#line 3268 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3268")
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

	yy_do_action_589 is
			--|#line 3272 "et_eiffel_parser.y"
		local
			yyval110: ET_STATIC_CALL_EXPRESSION
		do
--|#line 3272 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3272")
end

yyval110 := ast_factory.new_static_call_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp110 := yyvsp110 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp112 := yyvsp112 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
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

	yy_do_action_590 is
			--|#line 3274 "et_eiffel_parser.y"
		local
			yyval110: ET_STATIC_CALL_EXPRESSION
		do
--|#line 3274 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3274")
end

yyval110 := ast_factory.new_static_call_expression (Void, ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5 - 1)), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs13.item (yyvsp13)), yyvs25.item (yyvsp25)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp110 := yyvsp110 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp112 := yyvsp112 -1
	yyvsp13 := yyvsp13 -1
	yyvsp25 := yyvsp25 -1
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

	yy_do_action_591 is
			--|#line 3278 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3278 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3278")
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

	yy_do_action_592 is
			--|#line 3280 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3280 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3280")
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

	yy_do_action_593 is
			--|#line 3284 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3284 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3284")
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

	yy_do_action_594 is
			--|#line 3286 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3286 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3286")
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

	yy_do_action_595 is
			--|#line 3288 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3288 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3288")
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

	yy_do_action_596 is
			--|#line 3290 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3290 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3290")
end

yyval62 := yyvs99.item (yyvsp99) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp99 := yyvsp99 -1
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
			--|#line 3292 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3292 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3292")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_598 is
			--|#line 3294 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3294 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3294")
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

	yy_do_action_599 is
			--|#line 3302 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3302 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3302")
end

yyval62 := yyvs110.item (yyvsp110) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
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

	yy_do_action_600 is
			--|#line 3304 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3304 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3304")
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

	yy_do_action_601 is
			--|#line 3310 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3310 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3310")
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

	yy_do_action_602 is
			--|#line 3312 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3312 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3312")
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

	yy_do_action_603 is
			--|#line 3314 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3314 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3314")
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

	yy_do_action_604 is
			--|#line 3314 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3314 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3314")
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

	yy_do_action_605 is
			--|#line 3327 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3327 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3327")
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

	yy_do_action_606 is
			--|#line 3338 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3338 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3338")
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

	yy_do_action_607 is
			--|#line 3346 "et_eiffel_parser.y"
		local
			yyval25: ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3346 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3346")
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

	yy_do_action_608 is
			--|#line 3355 "et_eiffel_parser.y"
		local
			yyval63: ET_EXPRESSION_ITEM
		do
--|#line 3355 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3355")
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

	yy_do_action_609 is
			--|#line 3364 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3364 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3364")
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

	yy_do_action_610 is
			--|#line 3366 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3366 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3366")
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

	yy_do_action_611 is
			--|#line 3368 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3368 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3368")
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

	yy_do_action_612 is
			--|#line 3370 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3370 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3370")
end

yyval62 := ast_factory.new_expression_address (yyvs5.item (yyvsp5), yyvs99.item (yyvsp99)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp99 := yyvsp99 -1
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
			--|#line 3377 "et_eiffel_parser.y"
		local
			yyval118: ET_WRITABLE
		do
--|#line 3377 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3377")
end

yyval118 := new_writable (yyvs13.item (yyvsp13)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp118 := yyvsp118 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp118 >= yyvsc118 then
		if yyvs118 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs118")
			end
			create yyspecial_routines118
			yyvsc118 := yyInitial_yyvs_size
			yyvs118 := yyspecial_routines118.make (yyvsc118)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs118")
			end
			yyvsc118 := yyvsc118 + yyInitial_yyvs_size
			yyvs118 := yyspecial_routines118.resize (yyvs118, yyvsc118)
		end
	end
	yyvs118.put (yyval118, yyvsp118)
end
		end

	yy_do_action_614 is
			--|#line 3379 "et_eiffel_parser.y"
		local
			yyval118: ET_WRITABLE
		do
--|#line 3379 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3379")
end

yyval118 := yyvs18.item (yyvsp18) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp118 := yyvsp118 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp118 >= yyvsc118 then
		if yyvs118 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs118")
			end
			create yyspecial_routines118
			yyvsc118 := yyInitial_yyvs_size
			yyvs118 := yyspecial_routines118.make (yyvsc118)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs118")
			end
			yyvsc118 := yyvsc118 + yyInitial_yyvs_size
			yyvs118 := yyspecial_routines118.resize (yyvs118, yyvsc118)
		end
	end
	yyvs118.put (yyval118, yyvsp118)
end
		end

	yy_do_action_615 is
			--|#line 3385 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3385 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3385")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_616 is
			--|#line 3387 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3387 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3387")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_617 is
			--|#line 3391 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3391 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3391")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_free_operator (yyvs12.item (yyvsp12)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp12 := yyvsp12 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_618 is
			--|#line 3393 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3393 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3393")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_plus_operator (yyvs20.item (yyvsp20)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_619 is
			--|#line 3395 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3395 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3395")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), ast_factory.new_infix_minus_operator (yyvs20.item (yyvsp20)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_620 is
			--|#line 3397 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3397 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3397")
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
			--|#line 3399 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3399 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3399")
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
			--|#line 3401 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3401")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_623 is
			--|#line 3403 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3403 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3403")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_624 is
			--|#line 3405 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3405 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3405")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_625 is
			--|#line 3407 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3407 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3407")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_626 is
			--|#line 3409 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3409 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3409")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_627 is
			--|#line 3411 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3411 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3411")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_628 is
			--|#line 3413 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3413 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3413")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_629 is
			--|#line 3415 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3415 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3415")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_630 is
			--|#line 3417 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3417 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3417")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_631 is
			--|#line 3419 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3419 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3419")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_632 is
			--|#line 3421 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3421 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3421")
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

	yy_do_action_633 is
			--|#line 3423 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3423 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3423")
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

	yy_do_action_634 is
			--|#line 3425 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3425 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3425")
end

yyval62 := ast_factory.new_infix_expression (yyvs62.item (yyvsp62 - 1), yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_635 is
			--|#line 3427 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3427 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3427")
end

yyval62 := ast_factory.new_equality_expression (yyvs62.item (yyvsp62 - 1), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_636 is
			--|#line 3429 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3429 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3429")
end

yyval62 := ast_factory.new_equality_expression (yyvs62.item (yyvsp62 - 1), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_637 is
			--|#line 3431 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3431 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3431")
end

yyval62 := ast_factory.new_object_equality_expression (yyvs62.item (yyvsp62 - 1), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_638 is
			--|#line 3433 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3433 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3433")
end

yyval62 := ast_factory.new_object_equality_expression (yyvs62.item (yyvsp62 - 1), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 -1
	yyvsp5 := yyvsp5 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_639 is
			--|#line 3437 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3437 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3437")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_640 is
			--|#line 3439 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3439 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3439")
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

	yy_do_action_641 is
			--|#line 3441 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3441 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3441")
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

	yy_do_action_642 is
			--|#line 3443 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3443 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3443")
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

	yy_do_action_643 is
			--|#line 3445 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3445 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3445")
end

yyval62 := new_prefix_plus_expression (yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_644 is
			--|#line 3447 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3447 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3447")
end

yyval62 := new_prefix_minus_expression (yyvs20.item (yyvsp20), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_645 is
			--|#line 3449 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3449 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3449")
end

yyval62 := ast_factory.new_prefix_expression (yyvs15.item (yyvsp15), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp15 := yyvsp15 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_646 is
			--|#line 3451 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3451 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3451")
end

yyval62 := ast_factory.new_prefix_expression (ast_factory.new_prefix_free_operator (yyvs12.item (yyvsp12)), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp12 := yyvsp12 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_647 is
			--|#line 3453 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3453 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3453")
end

yyval62 := ast_factory.new_old_expression (yyvs2.item (yyvsp2), yyvs62.item (yyvsp62)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_648 is
			--|#line 3455 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3455 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3455")
end

			if current_system.is_ise and then current_system.ise_version < ise_6_1_0 then
				raise_error
			else
				yyval62 := new_object_test (yyvs5.item (yyvsp5 - 2), yyvs13.item (yyvsp13), yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5), yyvs62.item (yyvsp62))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp5 := yyvsp5 -3
	yyvsp13 := yyvsp13 -1
	yyvsp112 := yyvsp112 -1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_649 is
			--|#line 3465 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3465 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3465")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_650 is
			--|#line 3467 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3467 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3467")
end

yyval62 := yyvs110.item (yyvsp110) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
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

	yy_do_action_651 is
			--|#line 3469 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3469 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3469")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_652 is
			--|#line 3471 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3471 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3471")
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

	yy_do_action_653 is
			--|#line 3473 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3473 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3473")
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

	yy_do_action_654 is
			--|#line 3475 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3475 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3475")
end

yyval62 := yyvs99.item (yyvsp99) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp99 := yyvsp99 -1
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
			--|#line 3477 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3477 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3477")
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

	yy_do_action_656 is
			--|#line 3479 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3479 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3479")
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

	yy_do_action_657 is
			--|#line 3481 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3481 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3481")
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

	yy_do_action_658 is
			--|#line 3483 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3483 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3483")
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

	yy_do_action_659 is
			--|#line 3485 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3485 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3485")
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

	yy_do_action_660 is
			--|#line 3487 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3487 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3487")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_661 is
			--|#line 3489 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3489 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3489")
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

	yy_do_action_662 is
			--|#line 3491 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3491 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3491")
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

	yy_do_action_663 is
			--|#line 3493 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3493 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3493")
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

	yy_do_action_664 is
			--|#line 3495 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3495 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3495")
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

	yy_do_action_665 is
			--|#line 3497 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3497 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3497")
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

	yy_do_action_666 is
			--|#line 3499 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3499 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3499")
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

	yy_do_action_667 is
			--|#line 3514 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3514 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3514")
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

	yy_do_action_668 is
			--|#line 3516 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3516 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3516")
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

	yy_do_action_669 is
			--|#line 3518 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3518 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3518")
end

yyval62 := yyvs111.item (yyvsp111) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp111 := yyvsp111 -1
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

	yy_do_action_670 is
			--|#line 3520 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3520 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3520")
end

yyval62 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs62.put (yyval62, yyvsp62)
end
		end

	yy_do_action_671 is
			--|#line 3524 "et_eiffel_parser.y"
		local
			yyval35: ET_BRACKET_EXPRESSION
		do
--|#line 3524 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3524")
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

	yy_do_action_672 is
			--|#line 3524 "et_eiffel_parser.y"
		local
			yyval35: ET_BRACKET_EXPRESSION
		do
--|#line 3524 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3524")
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

	yy_do_action_673 is
			--|#line 3537 "et_eiffel_parser.y"
		local
			yyval34: ET_BRACKET_ARGUMENT_LIST
		do
--|#line 3537 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3537")
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

	yy_do_action_674 is
			--|#line 3548 "et_eiffel_parser.y"
		local
			yyval34: ET_BRACKET_ARGUMENT_LIST
		do
--|#line 3548 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3548")
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

	yy_do_action_675 is
			--|#line 3556 "et_eiffel_parser.y"
		local
			yyval34: ET_BRACKET_ARGUMENT_LIST
		do
--|#line 3556 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3556")
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

	yy_do_action_676 is
			--|#line 3565 "et_eiffel_parser.y"
		local
			yyval99: ET_PARENTHESIZED_EXPRESSION
		do
--|#line 3565 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3565")
end

			remove_symbol
			remove_counter
		 	yyval99 := ast_factory.new_parenthesized_expression (yyvs5.item (yyvsp5 - 1), yyvs62.item (yyvsp62), yyvs5.item (yyvsp5))
		 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp99 := yyvsp99 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp62 := yyvsp62 -1
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

	yy_do_action_677 is
			--|#line 3573 "et_eiffel_parser.y"
		local
			yyval62: ET_EXPRESSION
		do
--|#line 3573 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3573")
end

yyval62 := ast_factory.new_manifest_type (yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp62 := yyvsp62 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
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

	yy_do_action_678 is
			--|#line 3577 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3577 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3577")
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

	yy_do_action_679 is
			--|#line 3579 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3579 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3579")
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

	yy_do_action_680 is
			--|#line 3579 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3579 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3579")
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

	yy_do_action_681 is
			--|#line 3592 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3592 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3592")
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

	yy_do_action_682 is
			--|#line 3603 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3603 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3603")
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

	yy_do_action_683 is
			--|#line 3611 "et_eiffel_parser.y"
		local
			yyval93: ET_MANIFEST_ARRAY
		do
--|#line 3611 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3611")
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

	yy_do_action_684 is
			--|#line 3620 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3620 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3620")
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

	yy_do_action_685 is
			--|#line 3622 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3622 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3622")
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

	yy_do_action_686 is
			--|#line 3622 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3622 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3622")
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

	yy_do_action_687 is
			--|#line 3635 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3635 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3635")
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

	yy_do_action_688 is
			--|#line 3646 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3646 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3646")
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

	yy_do_action_689 is
			--|#line 3654 "et_eiffel_parser.y"
		local
			yyval96: ET_MANIFEST_TUPLE
		do
--|#line 3654 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3654")
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

	yy_do_action_690 is
			--|#line 3663 "et_eiffel_parser.y"
		local
			yyval111: ET_STRIP_EXPRESSION
		do
--|#line 3663 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3663")
end

yyval111 := ast_factory.new_strip_expression (yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp111 := yyvsp111 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -2
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

	yy_do_action_691 is
			--|#line 3665 "et_eiffel_parser.y"
		local
			yyval111: ET_STRIP_EXPRESSION
		do
--|#line 3665 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3665")
end

			yyval111 := yyvs111.item (yyvsp111)
			remove_keyword
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp111 := yyvsp111 -1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -1
	yyvs111.put (yyval111, yyvsp111)
end
		end

	yy_do_action_692 is
			--|#line 3665 "et_eiffel_parser.y"
		local
			yyval111: ET_STRIP_EXPRESSION
		do
--|#line 3665 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3665")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp111 := yyvsp111 + 1
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

	yy_do_action_693 is
			--|#line 3680 "et_eiffel_parser.y"
		local
			yyval111: ET_STRIP_EXPRESSION
		do
--|#line 3680 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3680")
end

			if yyvs69.item (yyvsp69) /= Void then
				yyval111 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval111 /= Void then
					yyval111.put_first (yyvs69.item (yyvsp69))
				end
			else
				yyval111 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp111 := yyvsp111 + 1
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_694 is
			--|#line 3691 "et_eiffel_parser.y"
		local
			yyval111: ET_STRIP_EXPRESSION
		do
--|#line 3691 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3691")
end

			yyval111 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval111 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval111.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp111 := yyvsp111 + 1
	yyvsp70 := yyvsp70 -1
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

	yy_do_action_695 is
			--|#line 3699 "et_eiffel_parser.y"
		local
			yyval111: ET_STRIP_EXPRESSION
		do
--|#line 3699 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3699")
end

			yyval111 := yyvs111.item (yyvsp111)
			if yyval111 /= Void and yyvs70.item (yyvsp70) /= Void then
				yyval111.put_first (yyvs70.item (yyvsp70))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyvs111.put (yyval111, yyvsp111)
end
		end

	yy_do_action_696 is
			--|#line 3708 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3708 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3708")
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

	yy_do_action_697 is
			--|#line 3710 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3710 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3710")
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

	yy_do_action_698 is
			--|#line 3712 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3712 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3712")
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

	yy_do_action_699 is
			--|#line 3714 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3714 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3714")
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

	yy_do_action_700 is
			--|#line 3716 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3716 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3716")
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

	yy_do_action_701 is
			--|#line 3718 "et_eiffel_parser.y"
		local
			yyval46: ET_CONSTANT
		do
--|#line 3718 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3718")
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

	yy_do_action_702 is
			--|#line 3724 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3724 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3724")
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

	yy_do_action_703 is
			--|#line 3726 "et_eiffel_parser.y"
		local
			yyval36: ET_CALL_AGENT
		do
--|#line 3726 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3726")
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

	yy_do_action_704 is
			--|#line 3730 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3730 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3730")
end

			yyval83 := ast_factory.new_do_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp97 := yyvsp97 -1
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
			--|#line 3741 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3741 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3741")
end

			yyval83 := ast_factory.new_do_function_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp97 := yyvsp97 -1
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
			--|#line 3748 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3748 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3748")
end

			yyval83 := ast_factory.new_once_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp97 := yyvsp97 -1
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
			--|#line 3755 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3755 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3755")
end

			yyval83 := ast_factory.new_once_function_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp97 := yyvsp97 -1
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

	yy_do_action_708 is
			--|#line 3762 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3762 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3762")
end

			yyval83 := ast_factory.new_external_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs104.item (yyvsp104), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp104 := yyvsp104 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp103 := yyvsp103 -1
	yyvsp97 := yyvsp97 -1
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

	yy_do_action_709 is
			--|#line 3769 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3769 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3769")
end

			yyval83 := ast_factory.new_external_function_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs112.item (yyvsp112)), yyvs104.item (yyvsp104), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp5 := yyvsp5 -1
	yyvsp112 := yyvsp112 -1
	yyvsp104 := yyvsp104 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp103 := yyvsp103 -1
	yyvsp97 := yyvsp97 -1
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

	yy_do_action_710 is
			--|#line 3776 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3776 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3776")
end

			yyval83 := ast_factory.new_do_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp97 := yyvsp97 -1
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

	yy_do_action_711 is
			--|#line 3783 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3783 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3783")
end

			yyval83 := ast_factory.new_do_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp97 := yyvsp97 -1
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

	yy_do_action_712 is
			--|#line 3790 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3790 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3790")
end

			yyval83 := ast_factory.new_once_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp97 := yyvsp97 -1
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

	yy_do_action_713 is
			--|#line 3797 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3797 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3797")
end

			yyval83 := ast_factory.new_once_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), yyvs104.item (yyvsp104), yyvs91.item (yyvsp91), yyvs45.item (yyvsp45 - 1), yyvs103.item (yyvsp103), yyvs45.item (yyvsp45), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp104 := yyvsp104 -1
	yyvsp91 := yyvsp91 -1
	yyvsp45 := yyvsp45 -2
	yyvsp103 := yyvsp103 -1
	yyvsp2 := yyvsp2 -1
	yyvsp97 := yyvsp97 -1
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

	yy_do_action_714 is
			--|#line 3804 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3804 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3804")
end

			yyval83 := ast_factory.new_external_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs104.item (yyvsp104), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp104 := yyvsp104 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp103 := yyvsp103 -1
	yyvsp97 := yyvsp97 -1
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

	yy_do_action_715 is
			--|#line 3811 "et_eiffel_parser.y"
		local
			yyval83: ET_INLINE_AGENT
		do
--|#line 3811 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3811")
end

			yyval83 := ast_factory.new_external_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs73.item (yyvsp73), yyvs104.item (yyvsp104), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs16.item (yyvsp16)), yyvs65.item (yyvsp65), yyvs103.item (yyvsp103), yyvs2.item (yyvsp2), yyvs30.item (yyvsp30))
			yyval83.set_object_tests (yyvs97.item (yyvsp97))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp83 := yyvsp83 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp73 := yyvsp73 -1
	yyvsp104 := yyvsp104 -1
	yyvsp2 := yyvsp2 -2
	yyvsp16 := yyvsp16 -1
	yyvsp65 := yyvsp65 -1
	yyvsp103 := yyvsp103 -1
	yyvsp97 := yyvsp97 -1
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

	yy_do_action_716 is
			--|#line 3820 "et_eiffel_parser.y"
		local
			yyval73: ET_FORMAL_ARGUMENT_LIST
		do
--|#line 3820 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3820")
end

			yyval73 := yyvs73.item (yyvsp73)
			set_start_closure (yyval73)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs73.put (yyval73, yyvsp73)
end
		end

	yy_do_action_717 is
			--|#line 3827 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 3827 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3827")
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

	yy_do_action_718 is
			--|#line 3831 "et_eiffel_parser.y"
		local
			yyval97: ET_OBJECT_TEST_LIST
		do
--|#line 3831 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3831")
end

			if last_object_tests /= Void then
				yyval97 := last_object_tests.cloned_object_test_list
			else
				yyval97 := Void
			end
				-- Clean up after the inline agent has been parsed.
			set_end_closure
		
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

	yy_do_action_719 is
			--|#line 3843 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3843 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3843")
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

	yy_do_action_720 is
			--|#line 3845 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3845 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3845")
end

yyval31 := yyvs99.item (yyvsp99) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp31 := yyvsp31 + 1
	yyvsp99 := yyvsp99 -1
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

	yy_do_action_721 is
			--|#line 3847 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3847 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3847")
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

	yy_do_action_722 is
			--|#line 3849 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3849 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3849")
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

	yy_do_action_723 is
			--|#line 3851 "et_eiffel_parser.y"
		local
			yyval31: ET_AGENT_TARGET
		do
--|#line 3851 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3851")
end

yyval31 := ast_factory.new_agent_open_target (yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
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

	yy_do_action_724 is
			--|#line 3855 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3855 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3855")
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

	yy_do_action_725 is
			--|#line 3857 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3857 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3857")
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

	yy_do_action_726 is
			--|#line 3859 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3859 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3859")
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

	yy_do_action_727 is
			--|#line 3859 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3859 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3859")
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

	yy_do_action_728 is
			--|#line 3872 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3872 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3872")
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

	yy_do_action_729 is
			--|#line 3883 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3883 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3883")
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

	yy_do_action_730 is
			--|#line 3891 "et_eiffel_parser.y"
		local
			yyval30: ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 3891 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3891")
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

	yy_do_action_731 is
			--|#line 3900 "et_eiffel_parser.y"
		local
			yyval29: ET_AGENT_ARGUMENT_OPERAND_ITEM
		do
--|#line 3900 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3900")
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

	yy_do_action_732 is
			--|#line 3909 "et_eiffel_parser.y"
		local
			yyval28: ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 3909 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3909")
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

	yy_do_action_733 is
			--|#line 3911 "et_eiffel_parser.y"
		local
			yyval28: ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 3911 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3911")
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

	yy_do_action_734 is
			--|#line 3913 "et_eiffel_parser.y"
		local
			yyval28: ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 3913 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3913")
end

yyval28 := ast_factory.new_agent_typed_open_argument (yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5), yyvs24.item (yyvsp24)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp28 := yyvsp28 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
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

	yy_do_action_735 is
			--|#line 3919 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3919 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3919")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_736 is
			--|#line 3921 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3921 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3921")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_737 is
			--|#line 3923 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3923 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3923")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_738 is
			--|#line 3925 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3925 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3925")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_739 is
			--|#line 3927 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3927 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3927")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_740 is
			--|#line 3929 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3929 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3929")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_741 is
			--|#line 3931 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3931 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3931")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_742 is
			--|#line 3933 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3933 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3933")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_743 is
			--|#line 3935 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3935 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3935")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_744 is
			--|#line 3937 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3937 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3937")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_745 is
			--|#line 3939 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3939 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3939")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_746 is
			--|#line 3941 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3941 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3941")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_747 is
			--|#line 3943 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3943 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3943")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_748 is
			--|#line 3945 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3945 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3945")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_749 is
			--|#line 3947 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3947 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3947")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_750 is
			--|#line 3949 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3949 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3949")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_751 is
			--|#line 3951 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3951 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3951")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_752 is
			--|#line 3953 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3953 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3953")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_753 is
			--|#line 3955 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3955 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3955")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_754 is
			--|#line 3957 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3957 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3957")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_755 is
			--|#line 3959 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3959 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3959")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_756 is
			--|#line 3961 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3961 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3961")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs16.put (yyval16, yyvsp16)
end
		end

	yy_do_action_757 is
			--|#line 3963 "et_eiffel_parser.y"
		local
			yyval16: ET_MANIFEST_STRING
		do
--|#line 3963 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3963")
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

	yy_do_action_758 is
			--|#line 3967 "et_eiffel_parser.y"
		local
			yyval10: ET_CHARACTER_CONSTANT
		do
--|#line 3967 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3967")
end

yyval10 := yyvs10.item (yyvsp10) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs10.put (yyval10, yyvsp10)
end
		end

	yy_do_action_759 is
			--|#line 3969 "et_eiffel_parser.y"
		local
			yyval10: ET_CHARACTER_CONSTANT
		do
--|#line 3969 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3969")
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

	yy_do_action_760 is
			--|#line 3973 "et_eiffel_parser.y"
		local
			yyval8: ET_BOOLEAN_CONSTANT
		do
--|#line 3973 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3973")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs8.put (yyval8, yyvsp8)
end
		end

	yy_do_action_761 is
			--|#line 3975 "et_eiffel_parser.y"
		local
			yyval8: ET_BOOLEAN_CONSTANT
		do
--|#line 3975 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3975")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs8.put (yyval8, yyvsp8)
end
		end

	yy_do_action_762 is
			--|#line 3979 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3979 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3979")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_763 is
			--|#line 3981 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3981 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3981")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_764 is
			--|#line 3985 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3985 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3985")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_765 is
			--|#line 3987 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3987 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3987")
end

yyval14 := yyvs14.item (yyvsp14) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_766 is
			--|#line 3991 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3991 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3991")
end

			yyval14 := yyvs14.item (yyvsp14)
			yyval14.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_767 is
			--|#line 3996 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 3996 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3996")
end

			yyval14 := yyvs14.item (yyvsp14)
			yyval14.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_768 is
			--|#line 4003 "et_eiffel_parser.y"
		local
			yyval14: ET_INTEGER_CONSTANT
		do
--|#line 4003 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4003")
end

			yyval14 := yyvs14.item (yyvsp14)
			yyval14.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
	yyvs14.put (yyval14, yyvsp14)
end
		end

	yy_do_action_769 is
			--|#line 4010 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 4010 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4010")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_770 is
			--|#line 4012 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 4012 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4012")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_771 is
			--|#line 4016 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 4016 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4016")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_772 is
			--|#line 4018 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 4018 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4018")
end

yyval17 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_773 is
			--|#line 4022 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 4022 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4022")
end

			yyval17 := yyvs17.item (yyvsp17)
			yyval17.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_774 is
			--|#line 4027 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 4027 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4027")
end

			yyval17 := yyvs17.item (yyvsp17)
			yyval17.set_sign (yyvs20.item (yyvsp20))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 -1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_775 is
			--|#line 4034 "et_eiffel_parser.y"
		local
			yyval17: ET_REAL_CONSTANT
		do
--|#line 4034 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4034")
end

			yyval17 := yyvs17.item (yyvsp17)
			yyval17.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs112.item (yyvsp112), yyvs5.item (yyvsp5)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp112 := yyvsp112 -1
	yyvs17.put (yyval17, yyvsp17)
end
		end

	yy_do_action_776 is
			--|#line 4041 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 4041 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4041")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_777 is
			--|#line 4043 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 4043 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4043")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_778 is
			--|#line 4045 "et_eiffel_parser.y"
		local
			yyval13: ET_IDENTIFIER
		do
--|#line 4045 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4045")
end

				-- TO DO: reserved word `BIT'
			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs13.put (yyval13, yyvsp13)
end
		end

	yy_do_action_779 is
			--|#line 4054 "et_eiffel_parser.y"
		local
			yyval1: ANY
		do
--|#line 4054 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4054")
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
			elseif yy_act <= 1599 then
				yy_do_error_action_1400_1599 (yy_act)
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
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_1400_1599 (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			when 1411 then
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
			  121,  122,  113,  130,  124,  129,  127,  106,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,  123,  135,
			  110,  131,  108,  137,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,  136,    2,  125,  112,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  119,    2,  120,  132,    2,    2,    2,
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
			  105,  107,  109,  111,  114,  115,  116,  117,  118,  133,
			  134, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  342,  342,  169,  343,  343,  344,  168,  168,  168,
			  168,  168,  168,  346,  168,  168,  345,  252,  252,  347,
			  253,  253,  254,  254,  254,  348,  254,  349,  255,  257,
			  257,  256,  256,  260,  260,  258,  258,  258,  258,  258,
			  258,  258,  258,  258,  259,  167,  167,  167,  167,  273,
			  273,  274,  274,  247,  247,  247,  351,  248,  248,  246,
			  245,  245,  245,  245,  245,  245,  245,  245,  245,  193,
			  193,  352,  194,  194,  194,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  188,

			  188,  187,  187,  189,  189,  189,  189,  184,  191,  191,
			  190,  190,  190,  192,  192,  192,  192,  192,  192,  185,
			  186,  301,  301,  306,  306,  306,  307,  355,  303,  303,
			  303,  303,  303,  303,  304,  308,  308,  308,  308,  308,
			  309,  309,  309,  309,  305,  305,  323,  323,  356,  324,
			  324,  324,  321,  322,  213,  213,  357,  214,  214,  215,
			  215,  358,  212,  212,  212,  359,  212,  233,  233,  233,
			  172,  360,  172,  173,  173,  173,  173,  170,  171,  281,
			  281,  361,  282,  282,  279,  279,  362,  280,  280,  277,
			  277,  363,  278,  278,  276,  276,  276,  235,  206,  206,

			  205,  207,  207,  364,  203,  203,  203,  365,  203,  366,
			  203,  203,  203,  367,  203,  368,  204,  204,  204,  236,
			  199,  199,  200,  369,  201,  201,  201,  198,  197,  197,
			  335,  335,  370,  336,  336,  334,  231,  231,  230,  232,
			  232,  228,  228,  229,  229,  371,  371,  371,  371,  315,
			  315,  315,  315,  315,  315,  312,  312,  312,  312,  312,
			  312,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  316,  316,  316,  316,  316,  316,  316,
			  316,  316,  316,  313,  313,  313,  313,  313,  313,  313,
			  313,  275,  275,  325,  325,  227,  227,  155,  155,  234,

			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  226,  226,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  244,  241,  241,  329,  242,  242,
			  242,  242,  242,  242,  238,  237,  239,  240,  288,  288,
			  288,  372,  289,  289,  289,  289,  289,  289,  285,  284,
			  286,  287,  373,  373,  373,  373,  373,  373,  373,  373,

			  311,  311,  311,  311,  311,  310,  310,  310,  310,  310,
			  272,  272,  271,  271,  374,  291,  291,  290,  290,  337,
			  337,  337,  175,  175,  330,  330,  331,  331,  331,  331,
			  331,  331,  331,  331,  331,  331,  331,  331,  332,  332,
			  332,  332,  332,  332,  332,  332,  332,  332,  332,  332,
			  333,  333,  333,  333,  333,  333,  333,  333,  333,  333,
			  333,  333,  333,  250,  143,  143,  145,  145,  353,  144,
			  144,  144,  144,  354,  140,  146,  146,  147,  147,  147,
			  148,  148,  148,  148,  148,  148,  141,  142,  283,  283,
			  283,  283,  283,  283,  283,  314,  314,  314,  314,  176,

			  176,  177,  177,  178,  178,  179,  179,  180,  180,  181,
			  181,  182,  182,  174,  174,  375,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  264,  264,  264,  264,  266,  266,  266,
			  266,  202,  202,  251,  251,  251,  251,  210,  211,  211,
			  209,  262,  262,  340,  340,  339,  339,  338,  165,  165,
			  376,  166,  166,  166,  164,  162,  162,  163,  163,  163,
			  163,  208,  208,  297,  297,  297,  377,  296,  296,  295,
			  265,  265,  265,  265,  265,  265,  221,  221,  160,  326,
			  326,  218,  218,  217,  217,  217,  217,  217,  217,  217,

			  217,  138,  138,  138,  378,  139,  139,  139,  225,  220,
			  220,  220,  220,  341,  341,  216,  216,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  158,  379,  157,  157,  157,  302,  219,  292,  292,
			  380,  293,  293,  293,  298,  298,  381,  299,  299,  299,
			  327,  327,  382,  328,  328,  328,  183,  183,  183,  183,

			  183,  183,  159,  159,  261,  261,  261,  261,  261,  261,
			  261,  261,  261,  261,  261,  261,  243,  383,  300,  153,
			  153,  153,  153,  153,  151,  151,  151,  384,  152,  152,
			  152,  150,  149,  149,  149,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  161,  161,
			  156,  156,  267,  267,  269,  269,  270,  270,  268,  317,
			  317,  319,  319,  320,  320,  318,  249,  249,  249,  350, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1413)
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
			   82,   14,   14,   16,   17,   17,    5,   76,    2,   98,
			    2,    2,    2,    2,   78,   78,   17,   14,   17,   14,
			    5,   23,    2,   96,    5,    5,   13,   82,    2,    2,

			   74,   75,   76,   13,   16,    2,  102,  102,    1,    2,
			    2,    2,   13,   24,    5,   13,   13,   13,    2,    2,
			    2,    2,   13,   88,  106,  112,  112,    5,   96,    2,
			   82,   13,   13,    5,    5,   76,    5,   56,    1,    2,
			    2,   53,   56,   67,   78,   86,    1,    1,   13,  100,
			  100,  101,  102,  102,   13,   13,   13,   13,    2,   13,
			   13,    2,   13,   23,   27,   27,    1,   20,   20,   13,
			   14,   13,   13,   13,    5,   11,   13,   23,   27,    1,
			    5,    5,   20,   20,    5,    5,    5,    2,   21,   18,
			   17,   15,   14,   12,   11,    7,    5,    4,    3,    2,

			    2,    2,    8,   35,   36,   10,   54,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   63,   13,   83,   14,
			   93,   16,   96,   96,   99,   17,  110,  111,    5,    5,
			    5,   24,    5,   13,   13,    2,    2,    2,   50,   13,
			   88,   53,   53,    2,    2,   55,   56,   53,    1,   67,
			   67,    1,   53,   86,   86,    2,    1,   78,    2,   56,
			   66,   66,   67,   27,   27,   22,  102,  102,   22,  102,
			  102,  102,  102,   27,    5,   11,   13,   27,   27,    5,
			   11,   13,   27,    5,   24,    5,   13,   13,   13,    2,
			    2,    2,   26,   26,   26,   27,   27,   13,   13,   88,

			  112,  112,   27,   27,   27,  112,    5,   13,   13,   13,
			   27,   13,    5,   62,   62,   18,   11,    2,    2,   69,
			   13,   99,   13,  112,   62,   62,   62,    5,   93,    5,
			    5,   25,    5,    5,   18,   11,   31,   69,   73,   73,
			   13,   99,    5,    1,    5,   16,    5,    5,    5,    5,
			    5,   20,   20,    5,    5,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   15,   15,   15,   15,   12,    5,
			   23,    5,   96,   25,   62,   50,   50,   13,   13,   13,
			   13,   23,   48,   48,    1,   13,   14,   13,   13,   13,
			    2,   49,   23,   48,   48,    1,   67,    5,   44,   55,

			   44,   55,   56,   51,   52,   53,   69,   62,   13,    1,
			   86,   67,   78,    1,   42,    2,   44,   67,    2,   64,
			   69,   13,  105,  105,  107,  107,    1,    2,    2,    2,
			    2,    2,    2,   61,   87,   87,   87,  109,  112,  112,
			   13,   13,   13,   13,    5,   27,    5,   13,   14,    5,
			   13,   13,   13,   27,   13,   13,   13,   27,   27,    5,
			   27,    5,    5,    5,    5,    5,   13,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,

			   16,   16,   16,   16,   16,   16,   16,    5,    5,   62,
			   63,   93,    5,   25,   13,    5,  112,    5,    5,   30,
			    5,    2,  104,   71,   71,   72,   72,   73,   13,    5,
			  104,    5,  111,  112,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,    2,   62,    2,   62,   62,   13,   35,    5,   49,
			   49,   48,   48,   48,   48,    5,   24,    5,   13,   13,
			   13,    2,    2,    2,   47,   47,   47,   48,   48,   50,
			   50,   13,   13,   88,   48,   48,   48,    2,   49,    5,
			   13,   13,   13,   48,   86,    5,   44,   55,   55,   70,

			   13,   55,   55,   56,    5,   53,    5,    5,   22,    5,
			   62,   13,   78,   86,    2,    1,    1,   42,    1,   64,
			  105,  107,    5,    5,    2,   73,   73,    2,  105,  107,
			    5,    2,   32,  105,  107,   87,   87,  109,   87,   61,
			   87,   87,    2,   87,   87,   87,   87,   61,   61,    5,
			    5,   27,   27,   27,   27,    1,    1,    1,   27,   27,
			   27,    5,    5,  112,    5,    1,    1,   25,  112,    5,
			   14,   17,    5,    5,   93,   25,   62,   63,    5,    5,
			   69,    5,   30,  112,    2,    1,    2,    2,   91,   73,
			   13,   73,    5,   73,    5,   73,    5,    5,  112,    2,

			   91,   69,   70,  111,    5,   62,   62,   25,   34,   62,
			   63,   13,   13,   13,   13,    5,   48,    5,   13,   14,
			    5,   13,   13,   13,   48,   13,   13,   13,   48,   48,
			    5,    5,    5,   48,   49,   70,   13,    5,    5,   78,
			   43,   43,   44,   13,   55,   55,    5,   55,    5,  114,
			  114,   22,   22,    5,    2,   78,    1,   42,    1,    5,
			  105,  107,  105,  107,  112,    5,    2,   78,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   69,   70,   87,   87,   69,  108,  108,  109,   87,   22,

			   44,   60,   61,   87,   87,    2,   87,    5,    5,   27,
			   27,   27,   27,   27,    1,    1,   22,    5,   13,    5,
			   13,    5,    5,   25,   25,   30,   24,    5,   28,   29,
			   30,   62,  104,    1,   91,   16,    2,    2,   45,   45,
			  112,  104,   16,   45,   45,    5,    5,    5,  111,    5,
			    5,    5,   34,   48,   48,   48,   48,    1,    1,    1,
			   48,   48,   48,    5,    5,   50,    2,   49,    2,    1,
			    1,    2,    5,   44,    5,   44,    5,    5,  114,    5,
			   22,    1,    2,    1,  105,  107,    2,   33,  112,   78,
			   98,   87,    2,  109,    2,   60,   61,   87,    2,   87,

			   13,   13,   62,   25,  112,    5,    5,    5,   30,    2,
			   91,   13,   89,   89,   90,   90,   91,    2,   65,    1,
			    1,    2,  103,  103,   22,    2,   91,   65,  103,  103,
			   13,   48,   48,   48,   48,   48,    1,    1,   22,    5,
			    1,  112,  113,  114,    1,    1,   69,   22,    5,    2,
			   78,   33,   98,  104,   64,   68,   69,   70,   61,    2,
			   87,    5,   16,   45,   45,    5,    5,   91,   91,   91,
			   91,   16,  103,   22,    5,    5,   19,   18,    4,    2,
			    2,    2,    2,    2,    2,    2,   35,   37,   45,   45,
			   57,   62,   62,   13,   77,   84,   85,   85,   85,   85, yyDummy>>,
			1, 1000, 0)
		end

	yytypes1_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			  118,   45,    2,    1,    2,   45,   45,   45,   16,   45,
			   45,  103,   45,   45,   25,    1,    5,    5,  114,    1,
			    5,    7,    2,    8,   10,   46,   14,   14,   14,   16,
			   17,   17,   17,    2,   46,   78,   98,    2,   78,  104,
			    2,    2,   91,    5,   68,    2,   24,   65,  103,  103,
			  112,    2,   24,    5,   13,   13,    2,    2,    2,   13,
			   88,  112,  112,    5,   25,   62,   62,    1,    5,    5,
			   95,    5,   18,   13,  118,    2,    1,    5,    5,    2,
			   92,   92,    5,   25,   45,    5,    5,    1,    1,    2,
			    2,   65,  103,  103,    2,    2,    2,  112,   22,   22,

			   22,   22,   22,   98,  104,   78,   98,    2,    2,   91,
			  103,   16,   45,   45,  103,   45,   45,   22,   97,   13,
			   13,   13,   13,   13,  118,   27,   13,   14,   13,   13,
			   13,   27,    5,    5,   13,  117,    1,    2,   45,   45,
			  112,    5,   95,    2,    1,  112,    5,    2,   62,   62,
			    1,    2,    2,  115,   13,   45,   62,   62,   45,   97,
			   97,  103,   45,   45,   97,   97,   97,    5,  104,    2,
			    2,   91,   98,  104,  103,   16,   45,   45,    2,   65,
			  103,  103,    2,    2,    2,   30,   27,   27,   27,   27,
			    5,   27,   27,   27,  118,    5,    5,    2,    2,   45,

			    2,   41,  116,  117,    1,    2,   45,   59,    1,    5,
			   16,   94,   95,   45,    5,   13,   62,   13,   62,    2,
			   25,   30,   30,    2,    2,    2,   30,   30,   30,    2,
			    2,   91,  103,   16,   45,   45,  104,    2,    2,   91,
			    2,   65,  103,  103,   22,  103,   45,   45,   97,   97,
			   97,   13,    5,   13,   25,    1,    2,   41,   45,  117,
			   45,    2,    2,   45,    2,   58,   59,    5,    5,    5,
			   95,    2,  118,   25,    5,    2,   45,   62,   97,   97,
			   97,  103,   16,   45,   45,    2,   65,  103,  103,    2,
			    2,   91,  103,   16,   45,   45,   22,  103,   45,   45,

			    2,    2,    2,   30,   30,   30,   25,   13,   25,   45,
			    5,   10,   38,   39,   40,   41,   13,   14,  110,    2,
			   62,   59,   13,    5,   62,    1,    2,  115,   45,   30,
			   30,   30,    2,   65,  103,  103,   22,  103,   45,   45,
			  103,   16,   45,   45,    2,   65,  103,  103,    2,    2,
			    2,   22,   22,   22,   25,  112,    5,    5,   41,   45,
			   25,   13,   45,    2,    2,   22,  103,   45,   45,    2,
			    2,    2,    2,   65,  103,  103,   22,  103,   45,   45,
			   22,   22,   22,    5,   39,   25,    2,    2,    2,   22,
			   22,   22,   22,  103,   45,   45,    2,    2,    2,   22,

			   22,   22,    2,    2,    2,   22,   22,   22,   22,   22,
			   22,    1,    1,    1, yyDummy>>,
			1, 414, 1000)
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
			    5,    5,    5,    5,    5,    5,    5,    5,    5,   20,
			   20,    5,    5,    5,    5,   22,   23,   24, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1413)
			yydefact_template_1 (an_array)
			yydefact_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yydefact_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			   20,   20,   19,    1,   21,   49,    2,  779,   50,   53,
			    3,   51,   18,   25,   27,    0,   56,  121,   51,   51,
			   51,   52,    0,   31,  779,   32,  779,    0,    0,  757,
			  759,  771,  735,  754,  753,  752,  756,  755,  751,  750,
			  749,  748,  747,  746,  745,  744,  743,  742,  741,  740,
			  739,  738,  737,  736,  764,  777,  778,  776,  758,  760,
			  761,   41,    0,   36,   37,    0,   35,   28,   33,    0,
			   29,   38,  765,   40,   39,  772,   54,    0,    0,  123,
			    0,    0,    0,    0,   24,   26,  774,  767,  773,  766,
			    0,  686,   42,    0,    0,   44,   35,   34,    0,    0,

			    0,    0,   55,   60,  122,  127,  779,  779,    0,    0,
			    0,    0,   45,    0,    0,  475,    0,  463,    0,    0,
			    0,    0,  424,  432,  494,    0,  425,  684,    0,   43,
			   30,   62,   61,   57,   59,   58,    0,  220,    0,  223,
			  414,  779,  220,  410,   16,   20,   15,    0,  464,  135,
			  140,  136,  125,  126,   48,   47,   46,  475,    0,  464,
			  475,    0,  464,  468,  435,  476,    0,    0,    0,  434,
			  433,  464,  464,  464,    0,  491,  488,  468,  426,    0,
			    0,  541,    0,    0,    0,  367,    0,    0,  663,  652,
			  657,    0,  656,    0,  653,  667,  680,  601,  717,    0,

			    0,    0,  655,  640,  661,  664,  641,    0,    0,  651,
			  660,  670,  649,  639,  615,  616,    0,  601,  662,  658,
			  668,  665,  642,  685,  654,  659,  650,  669,    0,    0,
			    0,    0,    0,  108,    0,    0,    0,    0,   63,   99,
			   81,  779,  221,  209,  215,  203,  199,    0,  412,  237,
			  410,    0,  779,  411,   20,   16,   13,    0,  244,  200,
			  239,  241,  238,  128,  465,  144,  137,  141,  145,  138,
			  142,  139,  143,  437,    0,  493,  490,  431,  436,    0,
			  492,  489,  430,  477,    0,    0,  777,  778,  776,    0,
			    0,    0,    0,    0,    0,  478,  479,    0,  424,  444,

			    0,    0,  428,  429,  427,    0,  466,  475,    0,  463,
			  467,  498,    0,  643,  644,  611,  610,    0,    0,  609,
			  299,  612,  463,    0,  647,  645,  646,  678,    0,  604,
			    0,  591,  367,    0,  721,  722,    0,  724,  716,  400,
			  719,  720,    0,  400,  692,  666,    0,    0,    0,    0,
			    0,    0,    0,  687,  608,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  672,  688,  689,  593,    0,   65,   64,  108,   99,  108,
			   99,  468,  109,   84,    0,   83,   82,   99,   99,   99,
			   71,   66,  468,  100,   75,    0,  410,  171,  207,    0,

			  213,    0,    0,  224,  225,  222,    0,  392,  601,  413,
			   20,  410,    0,    6,   49,   16,  243,  240,    0,  291,
			  340,  299,  246,  255,  245,  249,  242,  186,  191,  148,
			  181,  156,  134,  187,    0,  182,  192,  157,    0,    0,
			  475,  464,  475,  464,  473,  476,  473,  446,  445,  473,
			  464,  464,  464,  470,  777,  778,  776,  482,  481,    0,
			  438,  469,  474,    0,  473,  473,  601,  322,  300,  303,
			  337,  336,  335,  334,  333,  332,  331,  330,  329,  328,
			  327,  326,  325,  324,  323,  302,  301,  338,  339,  321,
			  319,  318,  316,  320,  317,  315,  314,  313,  312,  311,

			  310,  309,  308,  307,  306,  305,  304,    0,  677,    0,
			    0,  679,  602,    0,    0,  365,    0,    0,  727,  702,
			    0,  401,  378,    0,    0,    0,    0,  366,  601,    0,
			  378,  690,    0,    0,  638,  636,  637,  635,  618,  619,
			  620,  622,  624,  625,  627,  626,  628,  621,  623,  634,
			  631,    0,  630,    0,  629,  617,  601,    0,  676,   68,
			   67,   86,   80,   85,   79,  110,    0,    0,  777,  778,
			  776,    0,    0,    0,    0,    0,    0,  111,  112,    0,
			    0,    0,   99,   93,   77,   78,   76,   69,    0,  101,
			  108,    0,  463,  102,   20,  172,    0,    0,  208,  217,

			  216,    0,  214,  202,  227,  226,    0,    0,  393,  394,
			  396,  601,    0,   20,   16,   14,   20,   12,    6,  291,
			  256,  250,    0,    0,  292,  364,  291,   20,  258,  252,
			    0,    0,  341,  248,  247,    0,    0,    0,    0,    0,
			  188,  182,  133,  183,  192,  193,    0,  158,  187,    0,
			    0,  449,  443,  448,  442,    0,    0,    0,  440,  441,
			  439,  473,  473,  486,    0,    0,    0,  542,    0,    0,
			  768,  775,  681,  682,  683,  603,    0,    0,  601,  723,
			  724,  725,    0,  400,  402,  403,  381,    0,    0,  371,
			  375,  370,  368,  373,  369,  372,  374,    0,  400,    0,

			    0,    0,    0,  691,    0,  633,  632,  600,  671,    0,
			    0,  108,   99,  108,   99,  473,  109,  473,   95,   94,
			  473,   99,   99,   99,  104,  777,  778,  776,  115,  114,
			  103,  107,    0,  100,   70,    0,    0,  473,  473,    0,
			    0,    0,  170,  177,  206,  218,  219,  212,  232,  228,
			    0,  395,  397,  398,   16,    0,    6,    5,   11,    0,
			  260,  254,  257,  251,  297,    0,   20,  121,  363,  342,
			  361,  358,  362,  360,  357,  355,  359,  356,  354,  353,
			  352,  351,  350,  349,  348,  347,  346,  345,  344,  343,
			  194,  195,  185,  190,    0,  149,  150,  147,  180,  166,

			  165,  161,  155,  192,    0,  132,  182,    0,    0,  472,
			  484,  485,  471,  483,    0,    0,  487,  480,  495,    0,
			  601,  605,  606,  607,  592,  703,  733,    0,    0,    0,
			  726,  732,  378,  404,    0,  295,  779,  779,  405,  405,
			  376,  378,  295,  405,  405,  197,  693,  694,  695,    0,
			  673,  674,  675,   98,   92,   97,   91,    0,    0,    0,
			   89,   90,   88,  473,  473,  119,   73,   74,   72,    0,
			    0,   16,  173,  176,  174,  175,  178,  230,    0,  229,
			  399,    6,   16,   10,  259,  253,    0,  261,  297,  121,
			  400,  196,    0,  151,  162,    0,    0,    0,  131,  192,

			  497,  496,  648,  590,    0,  731,  728,  729,  730,    0,
			    0,  389,    0,    0,  382,  383,  380,    0,  405,    0,
			    0,  406,  422,  422,  377,    0,    0,  405,  422,  422,
			  601,  106,  117,  118,  105,  116,    0,    0,  120,  113,
			    6,    0,    0,  231,    9,    6,  298,  262,    0,   20,
			  121,   20,  400,  378,  152,  164,  167,  168,  160,  130,
			    0,  677,  295,  405,  405,  388,    0,  385,  384,  387,
			  386,  296,    0,  532,    0,    0,  531,  652,  601,    0,
			    0,  779,    0,  573,    0,    0,  598,    0,  502,  415,
			  528,    0,    0,  613,  523,  524,  515,  516,  518,  517, yyDummy>>,
			1, 1000, 0)
		end

	yydefact_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    0,  500,  407,  408,  779,    0,  423,    0,  295,  405,
			  405,    0,    0,    0,  589,    7,  235,  233,  234,    8,
			    0,  701,  293,  696,  697,  293,  698,  763,  762,  700,
			  699,  770,  769,  293,  293,  121,  400,   20,  121,  378,
			  405,    0,    0,  153,  169,  129,  734,  405,  422,  422,
			  390,  718,    0,    0,  475,    0,    0,    0,    0,  450,
			  457,    0,    0,    0,  591,  779,    0,    0,    0,  576,
			  779,    0,  614,  613,  539,  529,    0,    0,    0,  417,
			  416,    0,    0,  593,    0,    0,    0,  409,    0,  718,
			  718,  405,  422,  422,  718,  718,  718,    0,  294,  266,

			  264,  265,  263,  400,  378,  121,  400,  405,    0,    0,
			    0,  295,  405,  405,    0,    0,    0,  391,  724,  475,
			  464,  777,  776,    0,  535,  460,  459,  458,  464,  464,
			  464,  451,    0,  677,    0,    0,    0,  779,  779,  510,
			    0,  574,    0,  571,    0,    0,    0,  530,  520,  519,
			  418,  419,    0,    0,  601,  514,  522,  521,  508,  724,
			  724,    0,    0,    0,  724,  724,  724,    0,  378,  405,
			    0,    0,  400,  378,    0,  295,  405,  405,  293,  405,
			  422,  422,  718,  718,  718,  715,  462,  456,  461,  455,
			    0,  453,  454,  452,  533,    0,  601,  552,  779,    0,

			  560,    0,  555,  554,    0,  543,    0,    0,    0,    0,
			    0,    0,  575,    0,    0,  601,  420,  601,    0,    0,
			  600,  711,  713,  718,  718,  718,  714,  710,  712,  405,
			    0,    0,    0,  295,  405,  405,  378,  405,    0,    0,
			  293,  405,  422,  422,  287,    0,    0,    0,  724,  724,
			  724,  601,    0,  601,  592,    0,  551,    0,  557,  556,
			  504,  544,  545,    0,    0,  548,  547,    0,  579,  577,
			  578,  572,  537,  540,    0,  779,    0,    0,  724,  724,
			  724,    0,  295,  405,  405,  293,  405,  422,  422,  405,
			    0,    0,    0,  295,  405,  405,  288,    0,    0,    0,

			  293,  293,  293,  709,  705,  707,  536,  601,  590,  506,
			    0,  568,  561,  565,  562,  559,  569,  567,  570,  546,
			    0,  549,  601,    0,  421,    0,  526,    0,    0,  708,
			  704,  706,  293,  405,  422,  422,  276,    0,    0,    0,
			    0,  295,  405,  405,  293,  405,  422,  422,  293,  293,
			  293,  289,  283,  285,  534,    0,  564,    0,  563,  550,
			  589,  601,  512,  527,  525,  275,    0,    0,    0,  293,
			  293,  293,  293,  405,  422,  422,  278,    0,    0,    0,
			  290,  284,  286,    0,  566,  538,  293,  293,  293,  280,
			  268,  272,  277,    0,    0,    0,  293,  293,  293,  279,

			  267,  271,  293,  293,  293,  282,  270,  274,  281,  269,
			  273,    0,    0,    0, yyDummy>>,
			1, 414, 1000)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			  373,  675,  292,  293,  294,  263,  809,  264,  164,  165,
			  810,  828,  829,  519,  830,  336,  632,  887,  202,  708,
			  203,  204,  987,  205, 1312, 1313, 1314, 1201, 1315,    9,
			   10,    3,  740,  741,  800,  742,  988, 1005,  838,  839,
			 1138, 1199, 1006,  989, 1276, 1025,  574,  575,  576,  393,
			  394,  931,  382,  383,  932,  391,  734,  579,  580,  403,
			  404,  241,  242,  405,  206,  245,  598,  142,  137,  246,
			  990, 1265, 1207, 1266,  801,  433,  648,  802,  407,  208,
			  209,  210,  211,  212,  213,  214,  215,  216,  419,  918,
			  260,  261,  249,  250,  262,  955,  420,  791,  599,  523,

			  524,  525,  526,  625,  527,  339,  626,  100,  101,   17,
			  102,  217,  122,  994,    4,    5,   12,   13,   14,   67,
			   68,   69,   70,  218,  995,  996,  997,  998,  999, 1317,
			  219,  670,   72,  253,  254,   11,   22,  627,  792,  645,
			  646,  640,  641,  643,  644,  123,  912,  913,  914,  915,
			  688,  916, 1080, 1081,  220,  511,  221, 1211, 1212, 1070,
			  222,  223, 1118,   79,  224,  149,  150,  151,  106,  107,
			  152,  153,  922,  522,  422,  423,  124,  424,  425, 1030,
			  225,  671,   75,  795,  796,  437,  797, 1099,  226,  227,
			  703,  228,  300,  126,  301, 1061,  942,  749,  943, 1153,

			 1202, 1203, 1135, 1000, 1411,  615,  616,  146,  414,    7,
			   24,   26,   15,   77,  588,  179,  655,  108,  637,  639,
			  896,  895,  596,  638,  635,  636,  402,  597,  399,  601,
			  401,  247,  878,  426,  834,  409,  248, 1084, 1257, 1142,
			  513,  557,  328,  128,  532,  343,  682, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1413)
			yypact_template_1 (an_array)
			yypact_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yypact_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			   65, 1112, 5057, -32768, -32768, 1329, -32768, -32768, -32768, 1353,
			 -32768,  425, -32768, 1333,  305, 1410, 1363, 1049, 1470, 1470,
			 1470, -32768, 1479, -32768, -32768, -32768, -32768,  160,   29, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, 1366, -32768, -32768,   39, 1357, -32768, 1355, 1410,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  815, 1831, 1453,
			 1465, 1462, 1460,  919, -32768, -32768, -32768, -32768, -32768, -32768,
			  343, 1341, -32768, 1451, 1410, -32768, -32768, -32768,  919,  919,

			  691,  815, -32768, 1404, -32768, 1360,  831, 1388, 1037,  919,
			  919,  919, -32768,  535,  525,  873,  881, -32768, 1037, 1037,
			 1037,  498,  850,  998, -32768, 1339, -32768, -32768, 4377, -32768,
			 -32768, 1403, 1401, -32768, -32768, -32768, 1522, 1402,  635, -32768,
			 -32768,  669, 1402, 1326, 1438, 1112, -32768,  585,  850,   42,
			   18, 1037, -32768, -32768, -32768, -32768, -32768,  873,  456,  850,
			  873,  395,  850, 1331, -32768, -32768, 1650, 1369, 1368, -32768,
			 -32768,  850,  850,  850,  343, -32768, -32768, 1328, -32768, 1569,
			  919, 1330, 4377, 4377, 1092, -32768, 1493, 4377, -32768, 1318,
			 -32768, 4377, -32768, 4377, 1314, -32768, 1379,  990,  735, 1316,

			 1831, 1315, -32768, 1294, -32768, -32768, -32768, 4797, 1290, 1288,
			 -32768, -32768, -32768, 1031, -32768, -32768, 4278,  373, -32768, -32768,
			 -32768, -32768, -32768, -32768, 1286, -32768, 1282, -32768, 4377, 1522,
			 1522,  519,  485, 1126,  881, 1037, 1037, 1037, 1351, 1119,
			  998,  669, -32768,  666,  130,  783, -32768,  287, 4377, -32768,
			 1326, 1371,  669, -32768, 1112, -32768, -32768, 1390, 1284, -32768,
			 1371,  941, -32768,  986, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  343, -32768, -32768, -32768, -32768,  343,
			 -32768, -32768, -32768, -32768,  467,  346,  784,  801,  654, 1037,
			 1037, 1037, 1569,  971,  971, -32768, -32768, 1268,  850,  950,

			 1272, 1266, -32768, -32768, -32768, 1264, -32768,  667,  881, 1255,
			 -32768, -32768,  919, -32768, -32768, -32768, -32768, 5050, 5028, -32768,
			 -32768, -32768, 1250, 1252, -32768, -32768, -32768, -32768, 4377, 1245,
			 1037, -32768, 1241,  343, -32768, -32768, 1244,  478, -32768,   51,
			 2352, -32768, 4377,   40, 1238, -32768,  343, 4377, 4377, 4377,
			 4377, 4377, 4377, -32768, -32768, 4377, 4377, 4377, 4377, 4377,
			 4377, 4377, 4377, 4377, 4377, 4377, 4179, 4080, 4377,  919,
			 -32768, -32768, -32768, 2221, 4841, 1351, 1351, 1126, 1119, 1126,
			 1119, 1236, -32768, -32768, 1327, -32768, -32768, 1119, 1119, 1119,
			 1343, -32768, 1233, -32768, -32768, 1177, 1326, 1234, 1182,  919,

			 1096,  919,  635, 1232,  287, -32768,  945, 4676,  927, 4377,
			 1112, 1326, 1337, 1198, 1329, -32768, -32768, -32768,  287, 1684,
			 -32768, 1345, -32768, -32768, -32768, -32768,  941,  420, 1332, 1010,
			   95,  984, -32768, 1235, 1325, 1194, 1164, 1322, 1217, 1203,
			  873,  850,  873,  850, -32768, 1209, -32768, 1211, 1210, -32768,
			  850,  850,  850, -32768, 1208, 1206, 1200, -32768, -32768,  343,
			 1197, -32768, -32768, 1185, -32768, -32768,  373, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  343,  308, 4611,
			 3981, -32768, -32768, 4377, 1199, -32768, 1196,  287, 1175, -32768,
			  343, 3882,  731,  919,  919,  204,   69, -32768,  768,  343,
			  713, -32768,  287, 1195,  318,  318,  318,  318,  754,  754,
			    3,    3,    3,  318,  318,  318,  318,    3,    3, 1619,
			 4929, 4377, 4929, 4377, 4915, -32768,  373, 4377, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  336,  164,  554,  701,
			  406, 1037, 1037, 1037, 1177,  964,  964, -32768, -32768, 1176,
			 1189, 1188, 1119,  903, -32768, -32768, -32768, -32768,  919, -32768,
			  604,  881, 1174, -32768, 1112, -32768,  919,  919, -32768,  919,

			 1172,  919, -32768, -32768, -32768, -32768, 1173, 1173, -32768, 1160,
			 4597,  885, 1269, 1112, -32768, -32768, 1112, -32768, 1198, 1528,
			 -32768, -32768,  941,  343, -32768, -32768,   44, 1112, -32768, -32768,
			  919, 4754, -32768, -32768, -32768,  287,  287,  287,  287,  189,
			 -32768, 1194, -32768, -32768, 1164, -32768, 1265, -32768, 1235, 1167,
			 1166, 1165, 1157, 1156, 1155, 1650,  971, 1650, 1152, 1151,
			 1150, -32768, -32768,  145,  919, 1569, 1569, -32768, 1154,  919,
			 -32768, -32768, -32768, -32768, -32768, -32768, 4753, 3783,  373, -32768,
			  478, -32768, 3288,  818, 4377, 4377,  136, 1831,   86, -32768,
			  627, -32768, -32768, -32768, -32768, -32768, -32768,  343,  818, 1831,

			   86,  875,  132, -32768, 1134, 4929, 4915, 2090, -32768, 4688,
			 3684, 1126, 1119, 1126, 1119, -32768, 1140, -32768, 1145, 1144,
			 -32768, 1119, 1119, 1119, -32768, 1139, 1136, 1135, -32768, -32768,
			 -32768, -32768, 1522, 1132, -32768,  171,   47, -32768, -32768, 1240,
			  326,  193, -32768, 1129, -32768, -32768, -32768, -32768, 1131, -32768,
			 1117, -32768, -32768, 1106, -32768, 1224, 1198, -32768, -32768,  941,
			 -32768, -32768, -32768, -32768, 1153,  343, 1112, 1049, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 1070,  287, -32768, -32768, 1230, -32768,  287, -32768, -32768, -32768,

			   77,  946, -32768, 1164, 1219, -32768, 1194,  919,  919, -32768,
			 -32768, -32768, -32768, -32768,  971,  971, -32768, -32768, -32768, 4377,
			  373, -32768, -32768, -32768, -32768, -32768, -32768, 1493,  858, 3189,
			 -32768, 4885,  633, 4377,  919,  494,  694,  246,  387,  387,
			 1082,  520,  494,  387,  387, -32768, -32768, -32768, -32768,  919,
			 -32768, -32768, -32768, 1107, 1099, 1098, 1097, 1327,  964, 1327,
			 1094, 1091, 1089, -32768, -32768,  122, -32768, -32768, -32768, 1177,
			 1177, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  343, -32768,
			 -32768, 1198, -32768, -32768, -32768, -32768,  287,  702, 1153, 1049,
			  818, -32768,  287, -32768, -32768,  287,  189, 1192, -32768, 1164,

			 -32768, -32768, -32768, -32768, 1081, -32768, -32768, -32768, -32768, 1831,
			   86,   83,  919,  919,  919,  919, -32768, 1831,  387, 1773,
			 1773, 3585,  263,  263, -32768, 1831,   86,  387,  263,  263,
			  373, -32768, -32768, -32768, -32768, -32768,  964,  964, -32768, -32768,
			 1198,  211,  343, -32768, -32768, 1198, -32768, -32768, 4564, 4460,
			 1049,  391,  818,  639, 1073, -32768, 1070,  287, -32768, -32768,
			 1179,  721,  494,  387,  387, -32768,  343, -32768, -32768, -32768,
			 -32768, -32768, 1178, -32768,  923,  343, -32768,   43,  844, 4377,
			 4377,  302, 1069, 1060,  665, 3486, 1118, 1113, -32768, 1147,
			 -32768, 1042, 1031, 2483, -32768, -32768, 1758, -32768, -32768, -32768, yyDummy>>,
			1, 1000, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  428, -32768, 4377, 4377, 1148, 1138, -32768, 1137,  494,  387,
			  387, 1128, 1127, 1125, -32768, -32768, -32768, -32768, -32768, -32768,
			  343, -32768,   41, -32768, -32768,   41, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   41,   41, 1049,  818, 1112, 1049,  601,
			  387, 1831,   86, -32768, -32768, -32768, -32768,  387,  263,  263,
			  997, -32768,  153,  463,  873,  881, 1037, 1037, 1037,  850,
			  998,  988,  993, 1037, 3090, 1317, 4493, 1773,  343,  981,
			 1074,  343, -32768, -32768,  960, -32768, 3387, 4377, 4377, 4377,
			 -32768,   62,  919, 2614, 1773, 4377, 4377, 4377, 1773, -32768,
			 -32768,  387,  263,  263, -32768, -32768, -32768,  954, -32768, -32768,

			 -32768, -32768, -32768,  818,  599, 1049,  818,  387, 1831,   86,
			 1057,  494,  387,  387, 1056, 1043, 1018, -32768,  478,  873,
			  850,  873,  867,  850,  866, -32768, -32768, -32768,  850,  850,
			  850, -32768,  600,  216,  863,  898,  686,  741,  889, -32768,
			  846, -32768, 1831, -32768, 1773,  823,  919, -32768, 4885, 4885,
			 4377, 4377, 4377,  888,  373, -32768, 4885, 4885, -32768,  478,
			  478,  924,  910,  868,  478,  478,  478,  166,  379,  387,
			 1831,   86,  818,  334,  838,  494,  387,  387,   41,  387,
			  263,  263, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  919, -32768, -32768, -32768,  749,  919,  373, -32768,  822,  788,

			  728,  725,  686, -32768, 1773, -32768,  747,  782,  663,  630,
			  505, 1831, -32768,  733,  600,  373, 4885,  247, 1633, 4377,
			 1931, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  387,
			 1831,   86,  729,  494,  387,  387,  184,  387, 1831,   86,
			   41,  387,  263,  263, -32768,  707,  693,  690,  478,  478,
			  478,  373,  919,  373, 2971, 1773, -32768,  587, -32768, -32768,
			 -32768, -32768, -32768,  668, 4377,  663, -32768,  919, -32768, -32768,
			 -32768, -32768,  526, -32768, 4377,  172,  143, 1633,  478,  478,
			  478,  649,  494,  387,  387,   41,  387,  263,  263,  387,
			 1831,   86,  623,  494,  387,  387, -32768,  605,  595,  588,

			   41,   41,   41, -32768, -32768, -32768, -32768,  373, 2852, -32768,
			  343, -32768,  454,  530,  587, -32768, -32768, -32768, -32768, -32768,
			 4493, -32768,  373,  919, 4885, 1773, -32768,  551,  548, -32768,
			 -32768, -32768,   41,  387,  263,  263, -32768,  534,  502,  491,
			  486,  494,  387,  387,   41,  387,  263,  263,   41,   41,
			   41, -32768, -32768, -32768, -32768,  349, -32768,  587, -32768, -32768,
			 2733,  373, -32768, -32768, -32768, -32768,  444,  414,  408,   41,
			   41,   41,   41,  387,  263,  263, -32768,  351,  348,  325,
			 -32768, -32768, -32768,  123, -32768, -32768,   41,   41,   41, -32768,
			 -32768, -32768, -32768,  315,  267,  214,   41,   41,   41, -32768,

			 -32768, -32768,   41,   41,   41, -32768, -32768, -32768, -32768, -32768,
			 -32768,   74,   59, -32768, yyDummy>>,
			1, 414, 1000)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -195,  913, -32768, -32768, -32768, -152, -134, -118, -135, -274,
			 -158, -32768, -32768, -614,  753, -32768, -32768,  699,   -4,  871,
			 -499, -32768, -32768,  -12, -32768,  222, -32768, -32768,  262, -32768,
			 1161,   22, -32768, -32768,  238,  217, -493, -164, -652, -659,
			 -1132, -1074, -32768, -32768,  297,  619, -32768, -32768, -32768,  979,
			 -261, -344, -445, -333, -337,  573,  825, -131, -32768, -32768,
			 -32768, 1416, 1452, 1169,   55, -32768, -372, -32768, -32768,  -98,
			 -32768, -32768, -32768,  291, -32768, 1120, -32768,  658,  734, -711,
			 -32768, -32768, -32768, -32768, -889, -32768,  872, -265, -391, -808,
			 -32768, -32768, 1445, -141, 1289,  590,  -25, -508, -545, -32768,

			 -32768, -32768, -32768, 1348,  634, -32768, -32768, -32768, -32768, -32768,
			 1444,  -15, 1036, -32768, -32768,  -70, 1104, -32768, -32768, -32768,
			 -32768, -32768,  281, -32768, -32768, -32768, -32768, -32768, -32768,  -31,
			 -913,  -14, -32768, 1437, -232, -32768, 1158,  912, -580, 1274,
			 -616, 1273,  886, 1270, -589,   57, -32768, -32768, -32768, -32768,
			 -521,  -19, -32768, -32768, -32768, 1022,   -2, -32768,  319, -32768,
			 1457, 1301, -396, -729,  104, -32768, -32768, -32768, -32768, -32768,
			  996,  970,  294, -326, -289, 1109, -32768, -305, 1102, -32768,
			  -80,   -9, -32768, -32768, -32768, -32768,  723,  284, -1185, -32768,
			  816, -156,  -64, -32768, -32768, -32768, -32768,  909,  572,  239,

			 -32768,  311, -32768, -891, -32768, -540, -32768, -130, -32768, -32768,
			 -32768, -32768,  -91, -32768, -32768,   99,  569, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -482, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5151)
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
			   66,   71,  331,   64,  178,  238,   74,  277,  296,  700,
			  282,   63,  445,   73,  256,  138,  147,  530,  410,  302,
			  303,  304,  273,    6,  702,  278,  125,  619,  804,  602,
			  992,  992,  295,  445,  927, 1027, 1027,  144,  890,  685,
			  577,  844,  342,  735,  561,  310,  563,  578,  843,  259,
			  251,  593,  803,   92,   96,   71,  793,   64,  798, 1413,
			   74,  868,  103,  510, 1206,   63,  825,   73,  112, 1258,
			   65,  624, 1318,  368, 1412,  257,  104,  521,  758,   96,
			   71,  894,   64,  131,  132,   74,  103,    2,  521,  117,
			   63, -163,   73, 1074,  154,  155,  156,  837,  375,  376,

			  396,  169,  170,   89, -614, -614,  176, 1152, 1151, -179,
			  305,  411, -163,  117,  629,  356, -163,  562,  836,  564,
			 -163,  634,  323,  716,   65,  413,  584,  585,  586, 1318,
			  628,   88,    1, 1263, -179,  457,  458,  633, -211, -211,
			   57,   56,   55,  276, -211,  716,  281, -379, -211,   65,
			  251,  297, -211,  268, 1047,  318, -211, 1326,  453,  319,
			  952,  251, 1124,  529,  594,  311,  317,  765, -379,  320,
			 -594,  746, 1318,  337,  520,   91, 1098,  265,  992,  613,
			  460,  158, -211,  340,  412,  866, -511,  897, 1359, 1151,
			  735,  694,  161,  240,  702,  992, -163,   54,  345,  992,

			 1091, 1290,  833,   57,   56,   55,  966,  965,  991,  991,
			  438,  891, -163,  686,  166,  439,  883,  899, -511,  385,
			  386, 1036,  406,  299,  117,  744, 1119,  745, 1404,  747,
			  724, 1289,  320,  408,   87,  117,  299,  713,  728,  729,
			   54, 1194,   57,   56,   55,  510,  421,  939,  677,  397,
			  669,  964,  168,  167,  847,  992,  166,  938,  963,  166,
			 -499, -499,   86,  630,   57,   56,   55, 1010,   31,  516,
			  817,  667,  447,  448, 1009,   57,   56,   55,  297,  297,
			  816, 1403,  533,  960, -499,  618,  240,  240,  321,  652,
			   54,  654,  710,  447,  448,   28,   27,  466,  658,  659,

			  660, 1004,  341, 1179,  603,  651, 1103,  653,  397, 1106,
			  318,  910,  -23,  874,  761,  992,  -23,  763,   31,  -23,
			  926,  317,  -23, 1272,  799,  -23,  692,  528, -509, 1402,
			  760, 1017,  384,  762,  -23, 1016,  -23,  -23,  395, 1398,
			  612,  944,  -23, 1195, 1027,   28,   27, -509, -509,  299,
			   97, 1238,  -23,  -23,  556,  -23,  991,  832,   57,   56,
			   55,  707, 1397,  686,  158, 1396,  992, 1241,  329,  581,
			 1274,  121,  841,  991,  161,  130, 1172,  991,  853,  406,
			  855, 1237,   54, 1113,  600,  166,  600,  957,  368,  320,
			 1112,  120,  119,  118,  611,  663, 1230,   57,   56,   55,

			 1015, 1027,  921,  421,  421, 1019,  166,  117,  686,  711,
			   31,  421,  677,    2,  117,  116,  115,  117, 1037,  442,
			  986,  986, 1388,  363,  362, 1286, 1229, 1001, 1387,  357,
			  356,  355, 1042,  991, -184,  669,  992,   28,   27, 1003,
			   25,  583,   21,  668, 1027,  710,  872,  352,  351,  957,
			 1177,  854,  583,  856,  885, -184,  683, 1176, 1386, -184,
			  860,  861,  862,  630,  280,  698,   57,   56,   55, 1383,
			  884,  114,   20,   19, 1333,   18,  384,  395,  384,  395,
			  113,  398,  400,  824,  756, 1345,  395,  395,  395, 1086,
			 1085,  161,  680,  991,  329,  158,  416,  917,  811,  813,

			 1372,  954,  320, 1076, 1185, 1371,  408,  701,  690,  690,
			  690,  690, 1235,  161,  279,  934, 1370,  320, 1109, 1234,
			 1087,  933,  935,  812,  739,  275,  934,   57,   56,   55,
			  720, -463,  812, 1373, 1122,   56, 1121,  925,  117,  166,
			  440,  166, -463,  755,  991, 1221, 1222,  158, 1369,  686,
			 1226, 1227, 1228,  161,  718,  719,  117,  767,  379,  764,
			  581,  581, 1364,  158,  953, 1363, 1072,  175,  986,   57,
			   56,   55, 1284,  736, 1139,  274,  718,  719, 1356, 1283,
			 1295,  743,  600, 1171,  600,  986,  600, 1294, 1357,  986,
			  117, 1155,  377,  244,  243, 1158,  117, 1150,  160,  518,

			  935,  865, 1350,  258,  421,  201,  117,  421,  157, 1349,
			  790,  790,  794,  790,  991,  690, 1170,  174, 1108, 1348,
			  320,  320,  320,  320,  881,  903, 1039, 1269,  686, 1268,
			  686,  583, 1343,  840, 1303, 1304, 1305, 1344,  757, 1342,
			  297,  297,  297,  244,  243,  986, 1169, 1231, 1107,  818,
			  909, 1213, 1239, 1323,  820,   58, 1041,  813,   57,   56,
			   55,   54,  686, 1332, 1329, 1330, 1331,  384,  686,  408,
			  611,   57,   56,   55, -205, -205, 1264,  701,  715, -108,
			 -205,  395, 1319, -236, -205,  835, 1040,  320, -205,  384,
			  381, -236, -205, 1159, 1160, -236,  889,  842, 1164, 1165,

			 1166,  888,   30, 1072, 1302,  986, 1310, 1301, -501, -501,
			 1104, 1260,  299,  -20,  299, 1291,  168,  167, -205,  -20,
			  736, 1300,  299,  299,    2,  743,  743, 1200,  737,  949,
			  699,  -20, -501,  -20,  -20, 1014,   57,   56,   55,  -20,
			  381,  940,  686, 1285,  421,  919,  920, 1271,  687,  -20,
			  697,  696,  945, -503, -503, -503,  986, 1267,  318, 1007,
			  686, 1261, 1309,  904, 1012, 1013,  790, 1137, 1072,  317,
			 -558,  794,   57,   56,   55,   54,  320, 1168,  449, -463,
			 1173,  320, -503, 1064, 1071,  397, 1248, 1249, 1250,  240,
			 -463,  464,  900,  901, 1198,   54, 1262, -201, 1083,  297,

			  297, -201, 1256,  163,  335, -201,   57,   56,   55, -201,
			  384,  395,  384,  395,  941,  134,  133,  950,  611,  911,
			  395,  395,  395,   31,  368,  717,  986, 1278, 1279, 1280,
			  168,  167, 1362,  948,  930, -201, -505,  947,  334, -375,
			 -375, -375,  581,  581,  581, -198, 1236, 1188,  669, -198,
			   28,   27, 1240, -198,  333,  521,  332, -198, 1046,  363,
			  362,  946,  207,   99,   98,  357,  356,  355, 1031, 1031,
			  956,  320,   57,   56,   55,   54, 1252,  421,  941, 1035,
			  320, 1038, 1225, -198, 1115, 1116,   57,   56,   55,  329,
			 1067,  697,  696,  967,  968,  969,  970,  911,  911,  911,

			  911, 1198, 1050, 1205,  993,  993,  408,  962,  444, -475,
			 1198, 1062, 1197, 1088,  583,  971,  583, 1026, 1026, 1125,
			  163,  581,  581, 1008, 1224,  446,  583,  583, 1162, 1163,
			  168,  167,  956, 1219, 1028, 1028, 1024, 1024, 1223, 1032,
			 1032, 1131,  320, 1214, 1023, 1023, 1029, 1029,  559,  560,
			  207,  121,   57,   56,   55,   54, 1097,  873,  875, 1220,
			 -159,  418,  374, 1063,  318,  329, 1209, 1105, 1187, 1073,
			  408, 1058, 1057, 1056, 1136,  317, 1191, 1192, 1193, 1144,
			  906, -159,  905, 1196, 1186, -159,  177,  408,  611, -159,
			   57,   56,   55, 1190,  117, 1055, 1054,  846, -154,  845, yyDummy>>,
			1, 1000, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  432, 1254,  431, -463, 1140, 1189,  329, 1145,  753,  163,
			  168,  167,   57,   56,   55,  656, 1246, 1247,  657, -154,
			 1273,  430,  429, -154, -146,  428, -146, -154,  -81,  427,
			  180, 1060, 1184,  665,  666,  727,  726,  725, 1073, 1111,
			 1126, 1127,  456,  455,  454, -146, 1204, 1208,  329, -146,
			  609, 1053,  993, -146,  313,  314, 1306, 1183, 1308,  324,
			 1052,  611,  509,  325,  408,  326,  607, 1154,  606,  993,
			 1182, 1178,  611,  993, 1167, -432,  374,  180, 1298, 1299,
			   78,  534,  535,  536,  537,  538,  539, 1146, 1143,  540,
			  541,  542,  543,  544,  545,  546,  547,  548,  549,  550,

			  552,  554,  555, 1141, -210, -210, 1175, 1255,  117,  330,
			 -210,  329, 1354, 1133, -210,  318, 1132, 1073, -210,  267,
			  270,  272, -210, 1338, 1339,  180,  317, 1360,   84,  993,
			   85, 1215, 1117,  923,    2,  611, 1217,  928,  929, 1096,
			 1210, 1095, 1094,  610,  148,  266,  269,  271, -210,  159,
			  162, 1090, 1089,  166,  171,  172,  173,  689,  691,  693,
			  695,  316, -507,   57,   56,   55, 1385,  370, 1233, 1082,
			 1367, 1368,  239, 1079, 1078, 1251,   80,   81,   82, 1077,
			 1253, 1069, 1378, 1379, 1325,  148,  148,  148, 1068,  993,
			 -204, -204, 1051, 1045,  845,  315, -204, 1043,   -4, 1073,

			 -204,  961,  298,  428, -204,  121,  959,  886, -204, 1210,
			 1394, 1395,  972,  185,  -76,  298,  -78,  924,  166,  -77,
			  166, 1011,  -79,  -85,  -80,  573,  572,  571, 1282,  430,
			  814,  815,  -86,  898, -204,  892, 1293, 1307,  882,  879,
			  993,  880, 1316, 1028,  509, 1311, 1355,  676,  592,  591,
			  590,  877, 1322,  876,  871,  392,  -87, 1048, 1049,  864,
			  717,  849,  381,  863,  -96,  239,  239,  378,  380,  -82,
			  -83,  387,  388,  389,  819, -427, -429, -428,  427,  805,
			 -430, -436, -431,  754,  857,  705,  858,  706, 1341,  859,
			 -437,  709,  748,  808,  807,  751,  746,  681,  738, 1316,

			 1028,  730, 1311, 1092, 1093,  567,  869,  870, 1361, 1100,
			  993,  732,  664,  731,  566,  704,  679, 1101, 1102,  678,
			  441,  443, -426,  650,  662,  450,  451,  452,  298, -553,
			  446, -553,  661, -447, 1110, -433, -434,  649,  431,  642,
			  -22, 1114, 1316, 1028,  -22, 1311, -189,  -22,  631,    8,
			  -22,  614,  140,  -22,  595,  121,  604,  587,  589,  390,
			  531,  565,  -22,  515,  -22,  -22,  514,  512, -124, -124,
			  -22,  517,  508,  507, -124,  573,  572,  571, -124,  465,
			  -22,  -22, -124,  -22,  463, 1161, -124,  368,  -16,  258,
			  462,  459,  367,  366,  365,  -20,  364,  461,  570,  569,

			  568, 1174,  -20,  397,  415,  -20, 1180, 1181,  -20, -599,
			    2,  676, -124, -596,  140, -597,  831,  369,   62,  610,
			  582, -598,  363,  362,  361,  360,  359,  358,  357,  356,
			  355,  582,  936,  937,  346,  -20,  -20,  344,  -20,  327,
			  139, -595,   89,   87,  709, -594,  352,  351,  350,  349,
			  348,  347,  255,  306,  139,  567,  283,  312,  230,  181,
			  229,  136, 1244, 1232,  566,  129,  127,  111,   23,  110,
			 1242, 1243,  109, 1245,   61,   60,   59,  105,   58,   95,
			   94,   57,   56,   55,   54,   90,   83,   21,   76,   16,
			   53,   52,   51,   50,   49,   48,   47,   46,   45,   44,

			   43,   42,   41,   40,   39,   38,   37,   36,   35,   34,
			   33,   32,   31, 1259, 1018, 1327,  750,  372,  848,  893,
			  621,  121,   93, 1281, 1296,   30,   29,  620, 1287, 1288,
			 1270, 1292,  674,  436,  806, 1297,  435,  434,  766,   28,
			   27,  120,  119,  118,  145,  135,  338, 1044,  418,  417,
			  121,  318,  143,  902,  958,  624, 1321,  647,  252,  141,
			  867,  733,  317,  831,  322,  116,  115,  610, 1034, 1336,
			  237,  236,  235,  605, 1328,  617, 1358, 1334, 1335, 1384,
			 1337,  852,  908, 1340, 1351, 1352, 1353,  951, 1346, 1347,
			  823,    0,    0,  117,  234,  233,    0,  121,    0,   57,

			   56,   55,  712,  714,    0,    0,    0,  721,  722,  723,
			  582,    0,    0,    0,    0,    0, 1365,  291,  290,  289,
			    0,  114,    0,    0,    0,    0,    0, 1366, 1376,    0,
			  113,    0, 1380, 1381, 1382,    0, 1374, 1375,    0, 1377,
			  309,  308,  307,    0,    0,    0,    0,    0,    0,  332,
			  232,  623,  759, 1389, 1390, 1391, 1392,    0,    0,  231,
			    0,    0,    0, 1275,    0,    0,    0, 1393,    0,    0,
			 1399, 1400, 1401,    0,    0,    0,    0,    0,  121,    0,
			 1405, 1406, 1407,    0,    0,    0, 1408, 1409, 1410,  368,
			    0,  298,    0,  298,  367,  366,  365,  285,  291,  290,

			  289,  298,  298,  368,  418,    0,  284,  318,  367,  366,
			  365,  624,  364, 1065, 1066,    0,    0,    0,  317,    0,
			    0,  288,  287,  286,  363,  362,  361,  360,  359,  358,
			  357,  356,  355,    0,    0,    0,    0,  610,  363,  362,
			  361,  360,  359,  358,  357,  356,  355,    0,  352,  351,
			  350,  349,  348,  347,    0,   57,   56,   55,    0,    0,
			    0,    0,  352,  351,  350,  349,  348,  347,  239,    0,
			 -513, -513, -513, -513,    0,    0,    0,    0,  285,  985,
			    0,  984,    0,  983, -513,    0,    0,  284,    0,    0,
			    0,  982,  981,    0,  980,    0, -513,    0,  979, -513,

			    0,    0,    0, -513, -513,  332,  200,  623,  622,    0,
			  610, 1148, 1149,  199,    0,    0,    0,    0,    0, 1156,
			 1157,  610,    0,    0,    0,    0,    0,    0,  198,  978,
			    0,    0,  196,    0,    0,    0,    0,  195,   60,   59,
			    0,   58,  194,    0,   57,   56,   55,  192,    0,    0,
			    0,    0,    0,   53,   52,   51,   50,   49,   48,   47,
			   46,   45,   44,   43,   42,   41,   40,   39,   38,   37,
			   36,   35,   34,   33,   32,  190,  977,  976,    0,    0,
			    0,    0,    0,    0,  610, 1216, 1218,  188,   30,   29,
			    0,    0,  975,  582,  185,  582,    0,    0,    0,  184,

			    0,  974,    0,    0,    0,  582,  582,    0,  973,    0,
			    0,   53,   52,   51,   50,   49,   48,   47,   46,   45,
			   44,   43,   42,   41,   40,   39,   38,   37,   36,   35,
			   34,   33,   32,    0,    0,    0,    0, -581,    0, -581,
			    0, -581,    0, -581, -581, -581, -581,   29,    0, -581,
			 -581,    0, -581, 1277,    0,    0, -581, -581,    0,    0,
			    0,    0,    0,    0, -581,    0,    0,    0,    0, -581,
			    0, -581, -581,    0,    0,    0, -581, -581,    0,    0,
			    0,    0,    0,    0,    0,    0, -581, -581,    0,    0,
			 -581,    0, -588,    0,    0, -581, -581, -581, 1320, -581, yyDummy>>,
			1, 1000, 1000)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #3 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -581,    0, -581, -581, -581, -581,    0,    0, 1324,    0,
			 1059, -581, -581, -581, -581, -581, -581, -581, -581, -581,
			 -581, -581, -581, -581, -581, -581, -581, -581, -581, -581,
			 -581, -581, -581, -581, -581, -581,    0,    0,    0,    0,
			    0,    0,    0,    0,    0, -581, -581, -581,    0,    0,
			 -581,    0, -581,    0,    0,    0,    0, -581,    0, -581,
			    0,    0,    0,    0,    0,    0, -581, -587,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0, 1120, 1123,
			    0,    0, 1128, 1129, 1130,    0, -587,    0, -587, 1134,

			 -587, -587, -587, -587, -587, -587,    0, -587, -587, -587,
			    0, -587, -587,    0,    0, -587, -587,    0,    0, -587,
			 -587,    0, -587, -587,    0,    0,    0,    0, -587,    0,
			 -587, -587, -587,    0,    0, -587, -587, -587,    0,    0,
			    0,    0,    0,    0,    0, -587, -587,    0,    0, -587,
			 -587,    0,    0,    0, -587, -587, -587,    0, -587, -587,
			 -587, -587, -587, -587, -587, -587, -587, -587, -587, -587,
			 -587, -587, -587, -587, -587, -587, -587, -587, -587, -587,
			 -587, -587, -587, -587, -587, -587, -587, -587, -587, -587,
			 -587, -587, -587, -587, -587, -587, -587, -587, -587, -587,

			 -587, -587, -587, -587, -587, -587, -587,    0, -587, -587,
			    0, -587, -587,    0, -587, -587, -587,    0, -587, -587,
			 -587, -587, -587, -587, -587, -587, -587, -586,    0, -586,
			    0, -586, -586, -586, -586, -586, -586,    0, -586, -586,
			 -586,    0, -586, -586,    0,    0, -586, -586,    0,    0,
			 -586, -586,    0, -586, -586,    0,    0,    0,    0, -586,
			    0, -586, -586, -586,    0,    0, -586, -586, -586,    0,
			    0,    0,    0,    0,    0,    0, -586, -586,    0,    0,
			 -586, -586,    0,    0,    0, -586, -586, -586,    0, -586,
			 -586, -586, -586, -586, -586, -586, -586, -586, -586, -586,

			 -586, -586, -586, -586, -586, -586, -586, -586, -586, -586,
			 -586, -586, -586, -586, -586, -586, -586, -586, -586, -586,
			 -586, -586, -586, -586, -586, -586, -586, -586, -586, -586,
			 -586, -586, -586, -586, -586, -586, -586, -586,    0, -586,
			 -586,    0, -586, -586,    0, -586, -586, -586,    0, -586,
			 -586, -586, -586, -586, -586, -586, -586, -586, -299,    0,
			 -299,    0, -299, -299, -299, -299, -299, -299,    0, -299,
			 -299, -299,    0, -299, -299,    0,    0, -299, -299,    0,
			    0, -299, -299,    0, -299, -299,    0,    0,    0,    0,
			 -299,    0, -299, -299, -299,    0,    0, -299, -299, -299,

			    0,    0,    0,    0,    0,    0,    0, -299, -299,    0,
			    0, -299, -299,    0,    0,    0, -299, -299, -299,    0,
			 -299, -299, -299, -299, -299, -299, -299, -299, -299, -299,
			 -299, -299, -299, -299, -299, -299, -299, -299, -299, -299,
			 -299, -299, -299, -299, -299, -299, -299, -299, -299, -299,
			 -299, -299, -299, -299, -299, -299, -299, -299, -299, -299,
			 -299, -299, -299, -299, -299, -299, -299, -299, -299,    0,
			 -299, -299,    0, -299, -299,    0, -299, -299, -299,    0,
			 -299, -299, -299, -299, -299, -299, -299, -299, -299, -601,
			    0, -601,    0, -601,    0, -601, -601, -601, -601,    0,

			    0, -601, -601,    0, -601,    0,    0,    0, -601, -601,
			    0,    0,    0,    0,    0,    0, -601,    0,    0,    0,
			    0, -601,    0, -601, -601,    0,    0,    0, -601, -601,
			    0,    0,    0,    0,    0,    0,    0,    0, -601, -601,
			    0,    0, -601,    0,    0,    0,    0, -601, -601, -601,
			    0, -601, -601,    0, -601, -601, -601, -601,    0,    0,
			    0,    0,    0, -601, -601, -601, -601, -601, -601, -601,
			 -601, -601, -601, -601, -601, -601, -601, -601, -601, -601,
			 -601, -601, -601, -601, -601, -601, -601, -601,    0,    0,
			    0,    0,    0,    0,    0,    0,    0, -601, -601, -601,

			    0,    0, -601,    0,  329,    0,    0,    0,    0, -601,
			 -601, -601,    0,    0,    0,    0,    0,    0, -601, -601,
			 -580,    0, -580,    0, -580,    0, -580, -580, -580, -580,
			    0,    0, -580, -580,    0, -580,    0,    0,    0, -580,
			 -580,    0,    0,    0,    0,    0,    0, -580,    0,    0,
			    0,    0, -580,    0, -580, -580,    0,    0,    0, -580,
			 -580,    0,    0,    0,    0,    0,    0,    0,    0, -580,
			 -580,    0,    0, -580,    0,    0,    0,    0, -580, -580,
			 -580,    0, -580, -580,    0, -580, -580, -580, -580,    0,
			    0,    0,    0,    0, -580, -580, -580, -580, -580, -580,

			 -580, -580, -580, -580, -580, -580, -580, -580, -580, -580,
			 -580, -580, -580, -580, -580, -580, -580, -580, -580,    0,
			    0,    0,    0,    0,    0,    0,    0,    0, -580, -580,
			 -580,    0,    0, -580,    0, -580,    0,    0,    0, -584,
			 -580, -584, -580, -584,    0, -584, -584, -584, -584, -580,
			 -586, -584, -584,    0, -584,    0,    0,    0, -584, -584,
			    0,    0,    0,    0,    0,    0, -584,    0,    0,    0,
			    0, -584,    0, -584, -584,    0,    0,    0, -584, -584,
			    0,    0,    0,    0,    0,    0,    0,    0, -584, -584,
			    0,    0, -584,    0,    0,    0,    0, -584, -584, -584,

			    0, -584, -584,    0, -584, -584, -584, -584,    0,    0,
			    0,    0,    0, -584, -584, -584, -584, -584, -584, -584,
			 -584, -584, -584, -584, -584, -584, -584, -584, -584, -584,
			 -584, -584, -584, -584, -584, -584, -584, -584,    0,    0,
			    0,    0,    0,    0,    0,    0,    0, -584, -584, -584,
			    0,    0, -584,    0, -584,    0,    0,    0, -585, -584,
			 -585, -584, -585,    0, -585, -585, -585, -585, -584,    0,
			 -585, -585,    0, -585,    0,    0,    0, -585, -585,    0,
			    0,    0,    0,    0,    0, -585,    0,    0,    0,    0,
			 -585,    0, -585, -585,    0,    0,    0, -585, -585,    0,

			    0,    0,    0,    0,    0,    0,    0, -585, -585,    0,
			    0, -585,    0,    0,    0,    0, -585, -585, -585,    0,
			 -585, -585,    0, -585, -585, -585, -585,    0,    0,    0,
			    0,    0, -585, -585, -585, -585, -585, -585, -585, -585,
			 -585, -585, -585, -585, -585, -585, -585, -585, -585, -585,
			 -585, -585, -585, -585, -585, -585, -585,    0,    0,    0,
			    0,    0,    0,    0,    0,    0, -585, -585, -585,    0,
			    0, -585,    0, -585,    0,    0,    0, -583, -585, -583,
			 -585, -583,    0, -583, -583, -583, -583, -585,    0, -583,
			 -583,    0, -583,    0,    0,    0, -583, -583,    0,    0, yyDummy>>,
			1, 1000, 2000)
		end

	yytable_template_4 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #4 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0, -583,    0,    0,    0,    0, -583,
			    0, -583, -583,    0,    0,    0, -583, -583,    0,    0,
			    0,    0,    0,    0,    0,    0, -583, -583,    0,    0,
			 -583,    0,    0,    0,    0, -583, -583, -583,    0, -583,
			 -583,    0, -583, -583, -583, -583,    0,    0,    0,    0,
			    0, -583, -583, -583, -583, -583, -583, -583, -583, -583,
			 -583, -583, -583, -583, -583, -583, -583, -583, -583, -583,
			 -583, -583, -583, -583, -583, -583,    0,    0,    0,    0,
			    0,    0,    0,    0,    0, -583, -583, -583,    0,    0,
			 -583,    0, -583,    0,    0,    0, -582, -583, -582, -583,

			 -582,    0, -582, -582, -582, -582, -583,    0, -582, -582,
			    0, -582,    0,    0,    0, -582, -582,    0,    0,    0,
			    0,    0,    0, -582,    0,    0,    0,    0, -582,    0,
			 -582, -582,    0,    0,    0, -582, -582,    0,    0,    0,
			    0,    0,    0,    0,    0, -582, -582,    0,    0, -582,
			    0,    0,    0,    0, -582, -582, -582,    0, -582, -582,
			    0, -582, -582, -582, -582,    0,    0,    0,    0,    0,
			 -582, -582, -582, -582, -582, -582, -582, -582, -582, -582,
			 -582, -582, -582, -582, -582, -582, -582, -582, -582, -582,
			 -582, -582, -582, -582, -582,    0,    0,   62,    0,    0,

			    0,    0,    0,    0, -582, -582, -582,  201,    0, -582,
			    0, -582,    0,    0,    0,    0, -582,    0, -582,    0,
			    0,    0,  200,    0,    0, -582,    0,    0,    0,  199,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  198,  197,    0,    0,  196,    0,
			    0,    0,    0,  195,   60,   59,    0,   58,  194,  193,
			   57,   56,   55,  192,    0,    0,    0,  191,    0,   53,
			   52,   51,   50,   49,   48,   47,   46,   45,   44,   43,
			   42,   41,   40,   39,   38,   37,   36,   35,   34,   33,
			   32,  190,  189,    0,    0,    0,   62,    0,    0,    0,

			    0,    0,    0,  188,   30,   29,  201,  187,  827,    0,
			  185,  907,    0,    0,    0,  184,    0,    0,  183,  182,
			    0,  200,    0,    0,    0,   91,  826,    0,  199,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  198,  197,    0,    0,  196,    0,    0,
			    0,    0,  195,   60,   59,    0,   58,  194,  193,   57,
			   56,   55,  192,    0,    0,    0,  191,    0,   53,   52,
			   51,   50,   49,   48,   47,   46,   45,   44,   43,   42,
			   41,   40,   39,   38,   37,   36,   35,   34,   33,   32,
			  190,  189,    0,    0,    0,   62,    0,    0,    0,    0,

			    0, 1147,  188,   30,   29,  201,  187,  827,    0,  185,
			    0,    0,    0,    0,  184,    0,    0,  183,  182,    0,
			  200,    0,    0,    0,   91,  826,    0,  199,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  198,  197,    0,    0,  196,    0,    0,    0,
			    0,  195,   60,   59,    0,   58,  194,  193,   57,   56,
			   55,  192,    0,    0,    0,  191,    0,   53,   52,   51,
			   50,   49,   48,   47,   46,   45,   44,   43,   42,   41,
			   40,   39,   38,   37,   36,   35,   34,   33,   32,  190,
			  189,    0,    0,    0,   62,    0,    0,    0,    0,    0,

			 1075,  188,   30,   29,  201,  187,  186,    0,  185,    0,
			    0,    0,    0,  184,    0,    0,  183,  182,    0,  200,
			    0,    0,    0,   91,    0,    0,  199,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  198,  197,    0,    0,  196,    0,    0,    0,    0,
			  195,   60,   59,    0,   58,  194,  193,   57,   56,   55,
			  192,    0,    0,    0,  191,    0,   53,   52,   51,   50,
			   49,   48,   47,   46,   45,   44,   43,   42,   41,   40,
			   39,   38,   37,   36,   35,   34,   33,   32,  190,  189,
			    0,    0,    0,   62,    0,    0,    0,    0,    0,    0,

			  188,   30,   29,  201,  187,  186,    0,  185,    0,    0,
			    0,    0,  184,    0,    0,  183,  182,    0,  200,    0,
			    0,    0,   91,    0,    0,  199,    0, 1002,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  198,  197,    0,    0,  196,    0,    0,    0,    0,  195,
			   60,   59,    0,   58,  194,  193,   57,   56,   55,  192,
			    0,    0,    0,  191,    0,   53,   52,   51,   50,   49,
			   48,   47,   46,   45,   44,   43,   42,   41,   40,   39,
			   38,   37,   36,   35,   34,   33,   32,  190,  189,    0,
			    0,    0,   62,    0,    0,    0,    0,    0,    0,  188,

			   30,   29,  201,  187,  186,    0,  185,    0,    0,    0,
			    0,  184,    0,    0,  183,  182,    0,  200,    0,    0,
			    0,   91,    0,    0,  199,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  198,
			  197,    0,    0,  196,    0,    0,    0,    0,  195,   60,
			   59,    0,   58,  194,  193,   57,   56,   55,  192,    0,
			    0,    0,  191,    0,   53,   52,   51,   50,   49,   48,
			   47,   46,   45,   44,   43,   42,   41,   40,   39,   38,
			   37,   36,   35,   34,   33,   32,  190,  189,    0,    0,
			    0,   62,    0,    0,    0,    0,    0,    0,  188,   30,

			   29,  201,  187,  186,    0,  185,    0,    0,    0,  851,
			  184,    0,    0,  183,  182,    0,  200,    0,    0,    0,
			   91,    0,    0,  199,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  198,  197,
			    0,    0,  196,    0,    0,    0,    0,  195,   60,   59,
			    0,   58,  194,  193,   57,   56,   55,  192,    0,    0,
			    0,  191,    0,   53,   52,   51,   50,   49,   48,   47,
			   46,   45,   44,   43,   42,   41,   40,   39,   38,   37,
			   36,   35,   34,   33,   32,  190,  189,    0,    0,    0,
			   62,    0,    0,    0,  684,    0,    0,  188,   30,   29,

			  201,  187,  186,    0,  185,  822,    0,    0,    0,  184,
			    0,    0,  183,  182,    0,  200,    0,    0,    0,   91,
			    0,    0,  199,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  198,  197,    0,
			    0,  196,    0,    0,    0,    0,  195,   60,   59,    0,
			   58,  194,  193,   57,   56,   55,  192,    0,    0,    0,
			  191,    0,   53,   52,   51,   50,   49,   48,   47,   46,
			   45,   44,   43,   42,   41,   40,   39,   38,   37,   36,
			   35,   34,   33,   32,  190,  189,    0,    0,    0,   62,
			    0,    0,    0,    0,    0,    0,  188,   30,   29,  201, yyDummy>>,
			1, 1000, 3000)
		end

	yytable_template_5 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #5 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  187,  186,    0,  185,    0,    0,    0,    0,  184,    0,
			    0,  183,  182,    0,  200,    0,    0,    0,   91,    0,
			    0,  199,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  198,  197,    0,    0,
			  196,  673,    0,    0,    0,  195,   60,   59,    0,   58,
			  194,  193,   57,   56,   55,  192,    0,    0,    0,  191,
			    0,   53,   52,   51,   50,   49,   48,   47,   46,   45,
			   44,   43,   42,   41,   40,   39,   38,   37,   36,   35,
			   34,   33,   32,  190,  189,    0,    0,    0,   62,    0,
			    0,    0,    0,    0,    0,  188,   30,   29,  201,  187,

			  186,    0,  185,    0,    0,    0,    0,  184,    0,    0,
			  183,  182,    0,  200,    0,    0,    0,   91,    0,    0,
			  199,    0,  553,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  198,  197,    0,    0,  196,
			    0,    0,    0,    0,  195,   60,   59,    0,   58,  194,
			  193,   57,   56,   55,  192,    0,    0,    0,  191,    0,
			   53,   52,   51,   50,   49,   48,   47,   46,   45,   44,
			   43,   42,   41,   40,   39,   38,   37,   36,   35,   34,
			   33,   32,  190,  189,    0,    0,    0,   62,    0,    0,
			    0,  551,    0,    0,  188,   30,   29,  201,  187,  186,

			    0,  185,    0,    0,    0,    0,  184,    0,    0,  183,
			  182,    0,  200,    0,    0,    0,   91,    0,    0,  199,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  198,  197,    0,    0,  196,    0,
			    0,    0,    0,  195,   60,   59,    0,   58,  194,  193,
			   57,   56,   55,  192,    0,    0,    0,  191,    0,   53,
			   52,   51,   50,   49,   48,   47,   46,   45,   44,   43,
			   42,   41,   40,   39,   38,   37,   36,   35,   34,   33,
			   32,  190,  189,    0,    0,    0,   62,    0,    0,    0,
			    0,    0,    0,  188,   30,   29,  201,  187,  186,    0,

			  185,    0,    0,    0,    0,  184,    0,    0,  183,  182,
			    0,  200,    0,    0,    0,   91,    0,    0,  199,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  198,  197,    0,    0,  196,    0,    0,
			    0,    0,  195,   60,   59,    0,   58,  194,  193,   57,
			   56,   55,  192,    0,    0,    0,  191,    0,   53,   52,
			   51,   50,   49,   48,   47,   46,   45,   44,   43,   42,
			   41,   40,   39,   38,   37,   36,   35,   34,   33,   32,
			  190,  189,    0,    0,    0,   62,    0,    0,    0,    0,
			    0,    0,  188,   30,   29,  201,  187,  186,    0,  185,

			    0,    0,    0,  371,  184,    0,    0,  183,  182,    0,
			  200,    0,    0,    0,   91,    0,    0,  199,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  198,  197,    0,    0,  196,    0,    0,    0,
			    0,  195,   60,   59,    0,   58,  194,  193,   57,   56,
			   55,  192,    0,    0,    0,  191,    0,   53,   52,   51,
			   50,   49,   48,   47,   46,   45,   44,   43,   42,   41,
			   40,   39,   38,   37,   36,   35,   34,   33,   32,  190,
			  189,    0,    2,    0,    0,    0,    0,    0,    0,    0,
			    0,  188,   30,   29,    0,  187,  186,    0,  185,    0,

			    0,    0,    0,  184, 1033,    0,  183,  182,    0,    0,
			    0,    0,    0,   91,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0, 1021,   60,   59,    0,   58,    0,
			    0,    0,    0,    0,   54, 1137,    0,    0,    0,    0,
			   53,   52,   51,   50,   49,   48,   47,   46,   45,   44,
			   43,   42,   41,   40,   39,   38,   37,   36,   35,   34,
			   33,   32,   31,  368,    0,    0,    0,    0,  367,  366,
			  365,    0,  364,    0,    0,   30,   29,    0,    0, 1020,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   28,
			   27,    0,    0,    0,    0,    0,    0,    0,  363,  362,

			  361,  360,  359,  358,  357,  356,  355,    0, 1022,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  352,  351,  350,  349,  348,  347, 1021,   60,
			   59,    0,   58,    0,    0,    0,    0,    0,   54,    0,
			    0,    0,    0,    0,   53,   52,   51,   50,   49,   48,
			   47,   46,   45,   44,   43,   42,   41,   40,   39,   38,
			   37,   36,   35,   34,   33,   32,   31,  368,    0,    0,
			    0,  672,  367,  366,  365,    0,  364,    0,    0,   30,
			   29,  368,    0, 1020,    0,    0,  367,  366,  365,    0,
			  364,    0,    0,   28,   27,    0,    0,    0,    0,    0,

			    0,    0,  363,  362,  361,  360,  359,  358,  357,  356,
			  355,    0,    0,    0,    0,    0,  363,  362,  361,  360,
			  359,  358,  357,  356,  355,    0,  352,  351,  350,  349,
			  348,  347,  752,    0,    0,  354,    0,    0,    0,    0,
			  352,  351,  350,  349,  348,  347,  368,    0,    0,    0,
			    0,  367,  366,  365,    0,  364,    0,    0,  368,    0,
			    0,    0,    0,  367,  366,  365,    0,  364,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  363,  362,  361,  360,  359,  358,  357,  356,  355,
			    0,    0,    0,  363,  362,  361,  360,  359,  358,  357,

			  356,  355,    0,    0,    0,  352,  351,  350,  349,  348,
			  347,  608,  354,  850,    0,    0,    0,  352,  351,  350,
			  349,  348,  347,  368,    0,    0,    0,    0,  367,  366,
			  365,    0,  364,    0,  789,  788,  787,  786,  785,  784,
			  783,  782,  781,  780,  779,  778,  777,  776,  775,  774,
			  773,  772,  771,  770,  769,  768,    0,    0,  363,  362,
			  361,  360,  359,  358,  357,  356,  355,  368,    0,    0,
			    0,    0,  367,  366,  365,  821,  364,  354,    0,    0,
			    0,    0,  352,  351,  350,  349,  348,  347,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,  363,  362,  361,  360,  359,  358,  357,  356,
			  355,  368,    0,    0,    0,    0,  367,  366,  365,    0,
			  364,  354,  353,    0,    0,    0,  352,  351,  350,  349,
			  348,  347,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  363,  362,  361,  360,
			  359,  358,  357,  356,  355,  368,    0,    0,    0,    0,
			  367,  366,  365,  558,  364,    0,    0,    0,    0,    0,
			  352,  351,  350,  349,  348,  347,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  368,    0,    0,    0,    0,
			  363,  362,  361,  360,  359,  358,  357,  356,  355,  368, yyDummy>>,
			1, 1000, 4000)
		end

	yytable_template_6 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #6 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,  367,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  352,  351,  350,  349,  348,  347,
			  363,  362,  361,  360,  359,  358,  357,  356,  355,    0,
			    0,    0,    0,    0,  363,  362,  361,  360,  359,  358,
			  357,  356,  355,    0,  352,  351,  350,  349,  348,  347,
			    0,    0,    0,    0,    0,    0,    0,    0,  352,  351,
			  350,  349,  348,  347,  -17,    0,    0,    0,  -17,    0,
			    0,  -17,    0,    0,  -17,    0,    0,  -17,    0,    0,
			    0,    0,    0,    0,    0,    0,  -17,    0,  -17,  -17,
			    0,    0,    0,    0,  -17,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,  -17,  -17,    0,  -17,  506,  505,
			  504,  503,  502,  501,  500,  499,  498,  497,  496,  495,
			  494,  493,  492,  491,    0,    0,  490,  489,  488,  487,
			  486,  485,  484,  483,  482,  481,  480,  479,  478,  477,
			  476,  475,  474,  473,  472,  471,    0,    0,  470,  469,
			  468,  467, yyDummy>>,
			1, 152, 5000)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 5151)
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
			   15,   15,  197,   15,  122,  136,   15,  159,  166,  530,
			  162,   15,  286,   15,  144,  106,  107,  343,  250,  171,
			  172,  173,  157,    1,  532,  160,   90,  418,  644,  401,
			  919,  920,  166,  307,  842,  948,  949,  107,  767,  521,
			  384,  700,  198,  588,  377,  179,  379,  384,  700,  147,
			  141,  395,  641,   14,   69,   69,  636,   69,  638,    0,
			   69,   14,   77,  328, 1138,   69,  680,   69,   83, 1201,
			   15,   27, 1257,   70,    0,  145,   78,   37,  618,   94,
			   94,    4,   94,   98,   99,   94,  101,   22,   37,   71,
			   94,   14,   94,  984,  109,  110,  111,   11,  229,  230,

			  241,  116,  116,   74,   61,   62,  121,   45,   46,   14,
			  174,  252,   35,   71,  419,  112,   39,  378,   32,  380,
			   43,  426,  186,  568,   69,  255,  387,  388,  389, 1314,
			  419,  102,   67, 1207,   39,  293,  294,  426,    8,    9,
			   71,   72,   73,  158,   14,  590,  161,   11,   18,   94,
			  241,  166,   22,  135,  962,   23,   26,   14,  292,  184,
			  889,  252, 1053,  123,  396,  180,   34,  123,   32,  184,
			  127,  124, 1357,  198,  123,  136,  135,  135, 1067,  411,
			  298,   28,   52,  198,  254,   14,   14,  803, 1320,   46,
			  735,  122,   28,  136,  702, 1084,  119,   74,  200, 1088,

			 1008,   17,  684,   71,   72,   73,  123,  124,  919,  920,
			  274,  791,  135,   29,  115,  279,  756,  806,   46,  234,
			  234,  950,  247,  166,   71,  597,   73,  599,   14,  601,
			  574,   47,  247,  248,   74,   71,  179,   73,  575,  576,
			   74, 1132,   71,   72,   73,  510,  261,  125,  513,  119,
			  127,  910,  129,  130,  122, 1144,  157,  135,  910,  160,
			   14,   15,  102,  419,   71,   72,   73,  926,  102,  333,
			  125,  466,  287,  287,  926,   71,   72,   73,  293,  294,
			  135,   14,  346,  899,   38,  415,  229,  230,  184,  441,
			   74,  443,  557,  308,  308,  129,  130,  312,  450,  451,

			  452,   38,  198, 1111,  402,  440, 1035,  442,  119, 1038,
			   23,  832,    7,  120,  619, 1204,   11,  622,  102,   14,
			  841,   34,   17, 1214,  135,   20,  122,  342,   26,   14,
			  619,  120,  233,  622,   29,  124,   31,   32,  239,   14,
			  410,  881,   37,  127, 1257,  129,  130,   45,   46,  292,
			   69,   17,   47,   48,  369,   50, 1067,  683,   71,   72,
			   73,  556,   14,   29,   28,   14, 1255, 1175,  121,  384,
			  123,   28,  698, 1084,   28,   94, 1105, 1088,  711,  404,
			  713,   47,   74, 1042,  399,  286,  401,  895,   70,  404,
			 1042,   48,   49,   50,  409,  459,   17,   71,   72,   73,

			  940, 1314,   15,  418,  419,  945,  307,   71,   29,   73,
			  102,  426,  677,   22,   71,   72,   73,   71,   27,   73,
			  919,  920,   14,  105,  106, 1233,   47,  920,   14,  111,
			  112,  113,  953, 1144,   14,  127, 1325,  129,  130,  921,
			  135,  384,   17,  507, 1357,  710,  120,  129,  130,  957,
			 1109,  712,  395,  714,  759,   35,  520, 1109,   14,   39,
			  721,  722,  723,  619,   69,  529,   71,   72,   73,  120,
			  759,  128,   47,   48, 1282,   50,  377,  378,  379,  380,
			  137,  243,  244,  678,  614, 1293,  387,  388,  389,   61,
			   62,   28,  517, 1204,  121,   28,  258,    3,  656,  657,

			   14,  892,  517,  985, 1118,   14,  521,  532,  523,  524,
			  525,  526, 1171,   28,  119,  859,   14,  532, 1039, 1171,
			 1002,  858,  859,  657,  594,   69,  870,   71,   72,   73,
			  124,  125,  666, 1341,   71,   72,   73,   17,   71,  440,
			   73,  442,  136,  613, 1255, 1159, 1160,   28,   14,   29,
			 1164, 1165, 1166,   28,  569,  569,   71,  627,   73,  623,
			  575,  576,   14,   28,  890,   14,  103,   69, 1067,   71,
			   72,   73, 1231,  588, 1067,  119,  591,  591,  124, 1231,
			 1239,  596,  597, 1104,  599, 1084,  601, 1239,   58, 1088,
			   71, 1084,   73,    8,    9, 1088,   71, 1079,   73,  121,

			  937,  732,   14,   18,  619,   18,   71,  622,   73,   14,
			  635,  636,  637,  638, 1325,  630,   17,  119,   17,   14,
			  635,  636,  637,  638,  754,  820,  952,  122,   29,  124,
			   29,  574, 1291,  697, 1248, 1249, 1250,   14,  616, 1291,
			  655,  656,  657,    8,    9, 1144,   47, 1168,   47,  664,
			   17, 1144, 1173,  127,  669,   68,   17,  815,   71,   72,
			   73,   74,   29,   14, 1278, 1279, 1280,  568,   29,  684,
			  685,   71,   72,   73,    8,    9,   13,  702,  124,  125,
			   14,  582,   14,   14,   18,  687,   47,  702,   22,  590,
			  136,   22,   26, 1089, 1090,   26,  766,  699, 1094, 1095,

			 1096,  765,  115,  103,   14, 1204,  119,   14,   14,   15,
			 1036, 1204,  655,   11,  657, 1236,  129,  130,   52,   17,
			  735,   14,  665,  666,   22,  740,  741,   41,  124,   27,
			   17,   29,   38,   31,   32,  930,   71,   72,   73,   37,
			  136,  871,   29,   14,  759,  836,  837,   14,   17,   47,
			  123,  124,  882,   12,   13,   14, 1255,  127,   23,  923,
			   29,   14, 1255,  827,  928,  929,  791,   42,  103,   34,
			   42,  796,   71,   72,   73,   74,  791, 1103,  124,  125,
			 1106,  796,   41,  978,  119,  119, 1182, 1183, 1184,  732,
			  136,  124,  807,  808,   12,   74,   14,   14,  993,  814,

			  815,   18,   14,  136,   69,   22,   71,   72,   73,   26,
			  711,  712,  713,  714,  878,  124,  125,  887,  833,  834,
			  721,  722,  723,  102,   70,  124, 1325, 1223, 1224, 1225,
			  129,  130, 1325,  131,  849,   52,   14,  135,  103,   71,
			   72,   73,  857,  858,  859,   14, 1172, 1121,  127,   18,
			  129,  130,   14,   22,  119,   37,  121,   26,  137,  105,
			  106,  886,  128,   48,   49,  111,  112,  113,  948,  949,
			  895,  886,   71,   72,   73,   74,  127,  892,  942,  949,
			  895,  951,   14,   52, 1048, 1049,   71,   72,   73,  121,
			  981,  123,  124,  912,  913,  914,  915,  912,  913,  914,

			  915,   12,  966,   14,  919,  920,  921,  909,  124,  125,
			   12,  975,   14, 1004,  857,  917,  859,  948,  949, 1054,
			  136,  936,  937,  925,   14,  124,  869,  870, 1092, 1093,
			  129,  130,  957,   45,  948,  949,  948,  949,   14,  948,
			  949, 1059,  957,  120,  948,  949,  948,  949,  375,  376,
			  216,   28,   71,   72,   73,   74, 1020,  740,  741, 1154,
			   14,   20,  228,  119,   23,  121,  120, 1037, 1120,  984,
			  985,   48,   49,   50, 1065,   34, 1128, 1129, 1130, 1070,
			  122,   35,  124,  120, 1119,   39,  136, 1002, 1003,   43,
			   71,   72,   73,  127,   71,   72,   73,  122,   14,  124, yyDummy>>,
			1, 1000, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   14, 1196,   16,  136, 1068, 1123,  121, 1071,  123,  136,
			  129,  130,   71,   72,   73,  446, 1180, 1181,  449,   35,
			 1215,   35,   36,   39,   14,   39,   16,   43,  125,   43,
			  127,  974,   14,  464,  465,   71,   72,   73, 1053, 1041,
			 1055, 1055,   71,   72,   73,   35, 1137, 1138,  121,   39,
			  123,  128, 1067,   43,  182,  183, 1251,   14, 1253,  187,
			  137, 1076,  328,  191, 1079,  193,  121, 1082,  123, 1084,
			   14,   14, 1087, 1088,  120,  125,  342,  127, 1242, 1243,
			   31,  347,  348,  349,  350,  351,  352,  127,   14,  355,
			  356,  357,  358,  359,  360,  361,  362,  363,  364,  365,

			  366,  367,  368,  122,    8,    9, 1108, 1198,   71,  119,
			   14,  121, 1307,  120,   18,   23,  128, 1132,   22,  149,
			  150,  151,   26, 1287, 1288,  127,   34, 1322,   24, 1144,
			   26, 1146,  135,  839,   22, 1150, 1151,  843,  844,   14,
			 1142,   14,   14,  409,  108,  149,  150,  151,   52,  113,
			  114,   14,   14, 1054,  118,  119,  120,  523,  524,  525,
			  526,   69,   14,   71,   72,   73, 1361,  136, 1170,  127,
			 1334, 1335,  136,   26,   61, 1190,   18,   19,   20,   61,
			 1195,  121, 1346, 1347, 1275,  149,  150,  151,  119, 1204,
			    8,    9,   14,   14,  124,  103,   14,  124,    0, 1214,

			   18,  120,  166,   39,   22,   28,   14,   54,   26, 1211,
			 1374, 1375,  918,  121,  125,  179,  125,  135, 1119,  125,
			 1121,  927,  125,  125,  125,   48,   49,   50, 1230,   35,
			  661,  662,  125,   14,   52,    5, 1238, 1252,   14,  122,
			 1255,  135, 1257, 1257,  510, 1257, 1310,  513,   71,   72,
			   73,  120, 1267,  124,   14,  136,  124,  963,  964,  124,
			  124,  127,  136,  124,  124,  229,  230,  231,  232,  125,
			  125,  235,  236,  237,  120,  125,  125,  125,   43,   14,
			  125,  125,  125,   14,  715,  551,  717,  553, 1290,  720,
			  125,  557,  119,  127,  127,  135,  124,  122,  124, 1314,

			 1314,  125, 1314, 1009, 1010,  128,  737,  738, 1323, 1025,
			 1325,  123,  127,  124,  137,  120,  120, 1033, 1034,  120,
			  284,  285,  125,  120,  124,  289,  290,  291,  292,   12,
			  124,   14,  124,  124, 1040,  125,  125,  120,   16,   14,
			    7, 1047, 1357, 1357,   11, 1357,   14,   14,    3,   20,
			   17,   14,   26,   20,  120,   28,  124,   14,  125,    8,
			  122,  125,   29,  122,   31,   32,  330,  122,    8,    9,
			   37,  127,  120,  123,   14,   48,   49,   50,   18,  124,
			   47,   48,   22,   50,  120, 1091,   26,   70,    0,   18,
			  124,  123,   75,   76,   77,    7,   79,  125,   71,   72,

			   73, 1107,   14,  119,   14,   17, 1112, 1113,   20,  127,
			   22,  677,   52,  127,   26,  127,  682,  127,    8,  685,
			  384,  127,  105,  106,  107,  108,  109,  110,  111,  112,
			  113,  395,  863,  864,  119,   47,   48,  121,   50,   60,
			   52,  127,   74,   74,  710,  127,  129,  130,  131,  132,
			  133,  134,   14,  125,   52,  128,  125,  127,   57,  120,
			   57,   57, 1178, 1169,  137,   14,  125,    7,  135,    7,
			 1176, 1177,    7, 1179,   64,   65,   66,   24,   68,  124,
			  123,   71,   72,   73,   74,  119,    7,   17,  125,  136,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,

			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102, 1202,  942, 1276,  607,  216,  702,  796,
			  418,   28,   65, 1229, 1240,  115,  116,  418, 1234, 1235,
			 1211, 1237,  510,  263,  648, 1241,  263,  263,  626,  129,
			  130,   48,   49,   50,  107,  101,  198,  957,   20,  260,
			   28,   23,  107,  819,  896,   27, 1265,  437,  142,  107,
			  735,  582,   34,  829,   71,   72,   73,  833,  949, 1285,
			   48,   49,   50,  404, 1277,  414, 1314, 1283, 1284, 1357,
			 1286,  710,  829, 1289, 1300, 1301, 1302,  888, 1294, 1295,
			  677,   -1,   -1,   71,   72,   73,   -1,   28,   -1,   71,

			   72,   73,  566,  567,   -1,   -1,   -1,  571,  572,  573,
			  574,   -1,   -1,   -1,   -1,   -1, 1332,   48,   49,   50,
			   -1,  128,   -1,   -1,   -1,   -1,   -1, 1333, 1344,   -1,
			  137,   -1, 1348, 1349, 1350,   -1, 1342, 1343,   -1, 1345,
			   71,   72,   73,   -1,   -1,   -1,   -1,   -1,   -1,  121,
			  128,  123,  124, 1369, 1370, 1371, 1372,   -1,   -1,  137,
			   -1,   -1,   -1,   30,   -1,   -1,   -1, 1373,   -1,   -1,
			 1386, 1387, 1388,   -1,   -1,   -1,   -1,   -1,   28,   -1,
			 1396, 1397, 1398,   -1,   -1,   -1, 1402, 1403, 1404,   70,
			   -1,  655,   -1,  657,   75,   76,   77,  128,   48,   49,

			   50,  665,  666,   70,   20,   -1,  137,   23,   75,   76,
			   77,   27,   79,  979,  980,   -1,   -1,   -1,   34,   -1,
			   -1,   71,   72,   73,  105,  106,  107,  108,  109,  110,
			  111,  112,  113,   -1,   -1,   -1,   -1, 1003,  105,  106,
			  107,  108,  109,  110,  111,  112,  113,   -1,  129,  130,
			  131,  132,  133,  134,   -1,   71,   72,   73,   -1,   -1,
			   -1,   -1,  129,  130,  131,  132,  133,  134,  732,   -1,
			   12,   13,   14,   15,   -1,   -1,   -1,   -1,  128,    6,
			   -1,    8,   -1,   10,   26,   -1,   -1,  137,   -1,   -1,
			   -1,   18,   19,   -1,   21,   -1,   38,   -1,   25,   41,

			   -1,   -1,   -1,   45,   46,  121,   33,  123,  124,   -1,
			 1076, 1077, 1078,   40,   -1,   -1,   -1,   -1,   -1, 1085,
			 1086, 1087,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,
			   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,
			   -1,   68,   69,   -1,   71,   72,   73,   74,   -1,   -1,
			   -1,   -1,   -1,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,   -1,   -1,
			   -1,   -1,   -1,   -1, 1150, 1151, 1152,  114,  115,  116,
			   -1,   -1,  119,  857,  121,  859,   -1,   -1,   -1,  126,

			   -1,  128,   -1,   -1,   -1,  869,  870,   -1,  135,   -1,
			   -1,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,   -1,   -1,   -1,   -1,    6,   -1,    8,
			   -1,   10,   -1,   12,   13,   14,   15,  116,   -1,   18,
			   19,   -1,   21, 1219,   -1,   -1,   25,   26,   -1,   -1,
			   -1,   -1,   -1,   -1,   33,   -1,   -1,   -1,   -1,   38,
			   -1,   40,   41,   -1,   -1,   -1,   45,   46,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,
			   59,   -1,   61,   -1,   -1,   64,   65,   66, 1264,   68, yyDummy>>,
			1, 1000, 1000)
		end

	yycheck_template_3 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #3 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   69,   -1,   71,   72,   73,   74,   -1,   -1, 1274,   -1,
			  974,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,  114,  115,  116,   -1,   -1,
			  119,   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,  128,
			   -1,   -1,   -1,   -1,   -1,   -1,  135,  136,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 1052, 1053,
			   -1,   -1, 1056, 1057, 1058,   -1,    6,   -1,    8, 1063,

			   10,   11,   12,   13,   14,   15,   -1,   17,   18,   19,
			   -1,   21,   22,   -1,   -1,   25,   26,   -1,   -1,   29,
			   30,   -1,   32,   33,   -1,   -1,   -1,   -1,   38,   -1,
			   40,   41,   42,   -1,   -1,   45,   46,   47,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,
			   60,   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,
			   70,   71,   72,   73,   74,   75,   76,   77,   78,   79,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,  104,  105,  106,  107,  108,  109,

			  110,  111,  112,  113,  114,  115,  116,   -1,  118,  119,
			   -1,  121,  122,   -1,  124,  125,  126,   -1,  128,  129,
			  130,  131,  132,  133,  134,  135,  136,    6,   -1,    8,
			   -1,   10,   11,   12,   13,   14,   15,   -1,   17,   18,
			   19,   -1,   21,   22,   -1,   -1,   25,   26,   -1,   -1,
			   29,   30,   -1,   32,   33,   -1,   -1,   -1,   -1,   38,
			   -1,   40,   41,   42,   -1,   -1,   45,   46,   47,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,
			   59,   60,   -1,   -1,   -1,   64,   65,   66,   -1,   68,
			   69,   70,   71,   72,   73,   74,   75,   76,   77,   78,

			   79,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,  106,  107,  108,
			  109,  110,  111,  112,  113,  114,  115,  116,   -1,  118,
			  119,   -1,  121,  122,   -1,  124,  125,  126,   -1,  128,
			  129,  130,  131,  132,  133,  134,  135,  136,    6,   -1,
			    8,   -1,   10,   11,   12,   13,   14,   15,   -1,   17,
			   18,   19,   -1,   21,   22,   -1,   -1,   25,   26,   -1,
			   -1,   29,   30,   -1,   32,   33,   -1,   -1,   -1,   -1,
			   38,   -1,   40,   41,   42,   -1,   -1,   45,   46,   47,

			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,
			   -1,   59,   60,   -1,   -1,   -1,   64,   65,   66,   -1,
			   68,   69,   70,   71,   72,   73,   74,   75,   76,   77,
			   78,   79,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,  105,  106,  107,
			  108,  109,  110,  111,  112,  113,  114,  115,  116,   -1,
			  118,  119,   -1,  121,  122,   -1,  124,  125,  126,   -1,
			  128,  129,  130,  131,  132,  133,  134,  135,  136,    6,
			   -1,    8,   -1,   10,   -1,   12,   13,   14,   15,   -1,

			   -1,   18,   19,   -1,   21,   -1,   -1,   -1,   25,   26,
			   -1,   -1,   -1,   -1,   -1,   -1,   33,   -1,   -1,   -1,
			   -1,   38,   -1,   40,   41,   -1,   -1,   -1,   45,   46,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,
			   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,
			   -1,   68,   69,   -1,   71,   72,   73,   74,   -1,   -1,
			   -1,   -1,   -1,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,  116,

			   -1,   -1,  119,   -1,  121,   -1,   -1,   -1,   -1,  126,
			  127,  128,   -1,   -1,   -1,   -1,   -1,   -1,  135,  136,
			    6,   -1,    8,   -1,   10,   -1,   12,   13,   14,   15,
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
			  116,   -1,   -1,  119,   -1,  121,   -1,   -1,   -1,    6,
			  126,    8,  128,   10,   -1,   12,   13,   14,   15,  135,
			  136,   18,   19,   -1,   21,   -1,   -1,   -1,   25,   26,
			   -1,   -1,   -1,   -1,   -1,   -1,   33,   -1,   -1,   -1,
			   -1,   38,   -1,   40,   41,   -1,   -1,   -1,   45,   46,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,
			   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,

			   -1,   68,   69,   -1,   71,   72,   73,   74,   -1,   -1,
			   -1,   -1,   -1,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,  116,
			   -1,   -1,  119,   -1,  121,   -1,   -1,   -1,    6,  126,
			    8,  128,   10,   -1,   12,   13,   14,   15,  135,   -1,
			   18,   19,   -1,   21,   -1,   -1,   -1,   25,   26,   -1,
			   -1,   -1,   -1,   -1,   -1,   33,   -1,   -1,   -1,   -1,
			   38,   -1,   40,   41,   -1,   -1,   -1,   45,   46,   -1,

			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,
			   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,   -1,
			   68,   69,   -1,   71,   72,   73,   74,   -1,   -1,   -1,
			   -1,   -1,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,  116,   -1,
			   -1,  119,   -1,  121,   -1,   -1,   -1,    6,  126,    8,
			  128,   10,   -1,   12,   13,   14,   15,  135,   -1,   18,
			   19,   -1,   21,   -1,   -1,   -1,   25,   26,   -1,   -1, yyDummy>>,
			1, 1000, 2000)
		end

	yycheck_template_4 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #4 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   -1,   33,   -1,   -1,   -1,   -1,   38,
			   -1,   40,   41,   -1,   -1,   -1,   45,   46,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,
			   59,   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,
			   69,   -1,   71,   72,   73,   74,   -1,   -1,   -1,   -1,
			   -1,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,  114,  115,  116,   -1,   -1,
			  119,   -1,  121,   -1,   -1,   -1,    6,  126,    8,  128,

			   10,   -1,   12,   13,   14,   15,  135,   -1,   18,   19,
			   -1,   21,   -1,   -1,   -1,   25,   26,   -1,   -1,   -1,
			   -1,   -1,   -1,   33,   -1,   -1,   -1,   -1,   38,   -1,
			   40,   41,   -1,   -1,   -1,   45,   46,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,
			   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,
			   -1,   71,   72,   73,   74,   -1,   -1,   -1,   -1,   -1,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,  104,   -1,   -1,    8,   -1,   -1,

			   -1,   -1,   -1,   -1,  114,  115,  116,   18,   -1,  119,
			   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,  128,   -1,
			   -1,   -1,   33,   -1,   -1,  135,   -1,   -1,   -1,   40,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,
			   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,   70,
			   71,   72,   73,   74,   -1,   -1,   -1,   78,   -1,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,   -1,   -1,   -1,    8,   -1,   -1,   -1,

			   -1,   -1,   -1,  114,  115,  116,   18,  118,  119,   -1,
			  121,  122,   -1,   -1,   -1,  126,   -1,   -1,  129,  130,
			   -1,   33,   -1,   -1,   -1,  136,  137,   -1,   40,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,   -1,
			   -1,   -1,   64,   65,   66,   -1,   68,   69,   70,   71,
			   72,   73,   74,   -1,   -1,   -1,   78,   -1,   80,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,

			   -1,   14,  114,  115,  116,   18,  118,  119,   -1,  121,
			   -1,   -1,   -1,   -1,  126,   -1,   -1,  129,  130,   -1,
			   33,   -1,   -1,   -1,  136,  137,   -1,   40,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   55,   56,   -1,   -1,   59,   -1,   -1,   -1,
			   -1,   64,   65,   66,   -1,   68,   69,   70,   71,   72,
			   73,   74,   -1,   -1,   -1,   78,   -1,   80,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,

			   14,  114,  115,  116,   18,  118,  119,   -1,  121,   -1,
			   -1,   -1,   -1,  126,   -1,   -1,  129,  130,   -1,   33,
			   -1,   -1,   -1,  136,   -1,   -1,   40,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   55,   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,
			   64,   65,   66,   -1,   68,   69,   70,   71,   72,   73,
			   74,   -1,   -1,   -1,   78,   -1,   80,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,

			  114,  115,  116,   18,  118,  119,   -1,  121,   -1,   -1,
			   -1,   -1,  126,   -1,   -1,  129,  130,   -1,   33,   -1,
			   -1,   -1,  136,   -1,   -1,   40,   -1,   42,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   55,   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,
			   65,   66,   -1,   68,   69,   70,   71,   72,   73,   74,
			   -1,   -1,   -1,   78,   -1,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,   -1,
			   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,  114,

			  115,  116,   18,  118,  119,   -1,  121,   -1,   -1,   -1,
			   -1,  126,   -1,   -1,  129,  130,   -1,   33,   -1,   -1,
			   -1,  136,   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,
			   56,   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,
			   66,   -1,   68,   69,   70,   71,   72,   73,   74,   -1,
			   -1,   -1,   78,   -1,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,   -1,   -1,
			   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,

			  116,   18,  118,  119,   -1,  121,   -1,   -1,   -1,  125,
			  126,   -1,   -1,  129,  130,   -1,   33,   -1,   -1,   -1,
			  136,   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,
			   -1,   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,
			   -1,   68,   69,   70,   71,   72,   73,   74,   -1,   -1,
			   -1,   78,   -1,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,   -1,   -1,   -1,
			    8,   -1,   -1,   -1,   12,   -1,   -1,  114,  115,  116,

			   18,  118,  119,   -1,  121,  122,   -1,   -1,   -1,  126,
			   -1,   -1,  129,  130,   -1,   33,   -1,   -1,   -1,  136,
			   -1,   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,
			   -1,   59,   -1,   -1,   -1,   -1,   64,   65,   66,   -1,
			   68,   69,   70,   71,   72,   73,   74,   -1,   -1,   -1,
			   78,   -1,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,   -1,   -1,   -1,    8,
			   -1,   -1,   -1,   -1,   -1,   -1,  114,  115,  116,   18, yyDummy>>,
			1, 1000, 3000)
		end

	yycheck_template_5 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #5 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  118,  119,   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,
			   -1,  129,  130,   -1,   33,   -1,   -1,   -1,  136,   -1,
			   -1,   40,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,
			   59,   60,   -1,   -1,   -1,   64,   65,   66,   -1,   68,
			   69,   70,   71,   72,   73,   74,   -1,   -1,   -1,   78,
			   -1,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,   -1,   -1,   -1,    8,   -1,
			   -1,   -1,   -1,   -1,   -1,  114,  115,  116,   18,  118,

			  119,   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,   -1,
			  129,  130,   -1,   33,   -1,   -1,   -1,  136,   -1,   -1,
			   40,   -1,   42,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,
			   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,
			   70,   71,   72,   73,   74,   -1,   -1,   -1,   78,   -1,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,   -1,   -1,   -1,    8,   -1,   -1,
			   -1,   12,   -1,   -1,  114,  115,  116,   18,  118,  119,

			   -1,  121,   -1,   -1,   -1,   -1,  126,   -1,   -1,  129,
			  130,   -1,   33,   -1,   -1,   -1,  136,   -1,   -1,   40,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,
			   -1,   -1,   -1,   64,   65,   66,   -1,   68,   69,   70,
			   71,   72,   73,   74,   -1,   -1,   -1,   78,   -1,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,   -1,   -1,   -1,    8,   -1,   -1,   -1,
			   -1,   -1,   -1,  114,  115,  116,   18,  118,  119,   -1,

			  121,   -1,   -1,   -1,   -1,  126,   -1,   -1,  129,  130,
			   -1,   33,   -1,   -1,   -1,  136,   -1,   -1,   40,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   55,   56,   -1,   -1,   59,   -1,   -1,
			   -1,   -1,   64,   65,   66,   -1,   68,   69,   70,   71,
			   72,   73,   74,   -1,   -1,   -1,   78,   -1,   80,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,
			   -1,   -1,  114,  115,  116,   18,  118,  119,   -1,  121,

			   -1,   -1,   -1,  125,  126,   -1,   -1,  129,  130,   -1,
			   33,   -1,   -1,   -1,  136,   -1,   -1,   40,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   55,   56,   -1,   -1,   59,   -1,   -1,   -1,
			   -1,   64,   65,   66,   -1,   68,   69,   70,   71,   72,
			   73,   74,   -1,   -1,   -1,   78,   -1,   80,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,   -1,   22,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  114,  115,  116,   -1,  118,  119,   -1,  121,   -1,

			   -1,   -1,   -1,  126,   44,   -1,  129,  130,   -1,   -1,
			   -1,   -1,   -1,  136,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   64,   65,   66,   -1,   68,   -1,
			   -1,   -1,   -1,   -1,   74,   42,   -1,   -1,   -1,   -1,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,   70,   -1,   -1,   -1,   -1,   75,   76,
			   77,   -1,   79,   -1,   -1,  115,  116,   -1,   -1,  119,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  129,
			  130,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  105,  106,

			  107,  108,  109,  110,  111,  112,  113,   -1,   44,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,  129,  130,  131,  132,  133,  134,   64,   65,
			   66,   -1,   68,   -1,   -1,   -1,   -1,   -1,   74,   -1,
			   -1,   -1,   -1,   -1,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,   70,   -1,   -1,
			   -1,   60,   75,   76,   77,   -1,   79,   -1,   -1,  115,
			  116,   70,   -1,  119,   -1,   -1,   75,   76,   77,   -1,
			   79,   -1,   -1,  129,  130,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,  105,  106,  107,  108,  109,  110,  111,  112,
			  113,   -1,   -1,   -1,   -1,   -1,  105,  106,  107,  108,
			  109,  110,  111,  112,  113,   -1,  129,  130,  131,  132,
			  133,  134,  135,   -1,   -1,  124,   -1,   -1,   -1,   -1,
			  129,  130,  131,  132,  133,  134,   70,   -1,   -1,   -1,
			   -1,   75,   76,   77,   -1,   79,   -1,   -1,   70,   -1,
			   -1,   -1,   -1,   75,   76,   77,   -1,   79,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  105,  106,  107,  108,  109,  110,  111,  112,  113,
			   -1,   -1,   -1,  105,  106,  107,  108,  109,  110,  111,

			  112,  113,   -1,   -1,   -1,  129,  130,  131,  132,  133,
			  134,  135,  124,  125,   -1,   -1,   -1,  129,  130,  131,
			  132,  133,  134,   70,   -1,   -1,   -1,   -1,   75,   76,
			   77,   -1,   79,   -1,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,   -1,   -1,  105,  106,
			  107,  108,  109,  110,  111,  112,  113,   70,   -1,   -1,
			   -1,   -1,   75,   76,   77,  122,   79,  124,   -1,   -1,
			   -1,   -1,  129,  130,  131,  132,  133,  134,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,  105,  106,  107,  108,  109,  110,  111,  112,
			  113,   70,   -1,   -1,   -1,   -1,   75,   76,   77,   -1,
			   79,  124,  125,   -1,   -1,   -1,  129,  130,  131,  132,
			  133,  134,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  105,  106,  107,  108,
			  109,  110,  111,  112,  113,   70,   -1,   -1,   -1,   -1,
			   75,   76,   77,  122,   79,   -1,   -1,   -1,   -1,   -1,
			  129,  130,  131,  132,  133,  134,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   70,   -1,   -1,   -1,   -1,
			  105,  106,  107,  108,  109,  110,  111,  112,  113,   70, yyDummy>>,
			1, 1000, 4000)
		end

	yycheck_template_6 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #6 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   -1,   75,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,  129,  130,  131,  132,  133,  134,
			  105,  106,  107,  108,  109,  110,  111,  112,  113,   -1,
			   -1,   -1,   -1,   -1,  105,  106,  107,  108,  109,  110,
			  111,  112,  113,   -1,  129,  130,  131,  132,  133,  134,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  129,  130,
			  131,  132,  133,  134,    7,   -1,   -1,   -1,   11,   -1,
			   -1,   14,   -1,   -1,   17,   -1,   -1,   20,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   29,   -1,   31,   32,
			   -1,   -1,   -1,   -1,   37,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   -1,   -1,   47,   48,   -1,   50,   80,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   -1,   -1,   98,   99,  100,  101,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   -1,   -1,   98,   99,
			  100,  101, yyDummy>>,
			1, 152, 5000)
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

	yyvs97: SPECIAL [ET_OBJECT_TEST_LIST]
			-- Stack for semantic values of type ET_OBJECT_TEST_LIST

	yyvsc97: INTEGER
			-- Capacity of semantic value stack `yyvs97'

	yyvsp97: INTEGER
			-- Top of semantic value stack `yyvs97'

	yyspecial_routines97: KL_SPECIAL_ROUTINES [ET_OBJECT_TEST_LIST]
			-- Routines that ought to be in SPECIAL [ET_OBJECT_TEST_LIST]

	yyvs98: SPECIAL [ET_OBSOLETE]
			-- Stack for semantic values of type ET_OBSOLETE

	yyvsc98: INTEGER
			-- Capacity of semantic value stack `yyvs98'

	yyvsp98: INTEGER
			-- Top of semantic value stack `yyvs98'

	yyspecial_routines98: KL_SPECIAL_ROUTINES [ET_OBSOLETE]
			-- Routines that ought to be in SPECIAL [ET_OBSOLETE]

	yyvs99: SPECIAL [ET_PARENTHESIZED_EXPRESSION]
			-- Stack for semantic values of type ET_PARENTHESIZED_EXPRESSION

	yyvsc99: INTEGER
			-- Capacity of semantic value stack `yyvs99'

	yyvsp99: INTEGER
			-- Top of semantic value stack `yyvs99'

	yyspecial_routines99: KL_SPECIAL_ROUTINES [ET_PARENTHESIZED_EXPRESSION]
			-- Routines that ought to be in SPECIAL [ET_PARENTHESIZED_EXPRESSION]

	yyvs100: SPECIAL [ET_PARENT]
			-- Stack for semantic values of type ET_PARENT

	yyvsc100: INTEGER
			-- Capacity of semantic value stack `yyvs100'

	yyvsp100: INTEGER
			-- Top of semantic value stack `yyvs100'

	yyspecial_routines100: KL_SPECIAL_ROUTINES [ET_PARENT]
			-- Routines that ought to be in SPECIAL [ET_PARENT]

	yyvs101: SPECIAL [ET_PARENT_ITEM]
			-- Stack for semantic values of type ET_PARENT_ITEM

	yyvsc101: INTEGER
			-- Capacity of semantic value stack `yyvs101'

	yyvsp101: INTEGER
			-- Top of semantic value stack `yyvs101'

	yyspecial_routines101: KL_SPECIAL_ROUTINES [ET_PARENT_ITEM]
			-- Routines that ought to be in SPECIAL [ET_PARENT_ITEM]

	yyvs102: SPECIAL [ET_PARENT_LIST]
			-- Stack for semantic values of type ET_PARENT_LIST

	yyvsc102: INTEGER
			-- Capacity of semantic value stack `yyvs102'

	yyvsp102: INTEGER
			-- Top of semantic value stack `yyvs102'

	yyspecial_routines102: KL_SPECIAL_ROUTINES [ET_PARENT_LIST]
			-- Routines that ought to be in SPECIAL [ET_PARENT_LIST]

	yyvs103: SPECIAL [ET_POSTCONDITIONS]
			-- Stack for semantic values of type ET_POSTCONDITIONS

	yyvsc103: INTEGER
			-- Capacity of semantic value stack `yyvs103'

	yyvsp103: INTEGER
			-- Top of semantic value stack `yyvs103'

	yyspecial_routines103: KL_SPECIAL_ROUTINES [ET_POSTCONDITIONS]
			-- Routines that ought to be in SPECIAL [ET_POSTCONDITIONS]

	yyvs104: SPECIAL [ET_PRECONDITIONS]
			-- Stack for semantic values of type ET_PRECONDITIONS

	yyvsc104: INTEGER
			-- Capacity of semantic value stack `yyvs104'

	yyvsp104: INTEGER
			-- Top of semantic value stack `yyvs104'

	yyspecial_routines104: KL_SPECIAL_ROUTINES [ET_PRECONDITIONS]
			-- Routines that ought to be in SPECIAL [ET_PRECONDITIONS]

	yyvs105: SPECIAL [ET_PROCEDURE]
			-- Stack for semantic values of type ET_PROCEDURE

	yyvsc105: INTEGER
			-- Capacity of semantic value stack `yyvs105'

	yyvsp105: INTEGER
			-- Top of semantic value stack `yyvs105'

	yyspecial_routines105: KL_SPECIAL_ROUTINES [ET_PROCEDURE]
			-- Routines that ought to be in SPECIAL [ET_PROCEDURE]

	yyvs106: SPECIAL [ET_QUALIFIED_LIKE_IDENTIFIER]
			-- Stack for semantic values of type ET_QUALIFIED_LIKE_IDENTIFIER

	yyvsc106: INTEGER
			-- Capacity of semantic value stack `yyvs106'

	yyvsp106: INTEGER
			-- Top of semantic value stack `yyvs106'

	yyspecial_routines106: KL_SPECIAL_ROUTINES [ET_QUALIFIED_LIKE_IDENTIFIER]
			-- Routines that ought to be in SPECIAL [ET_QUALIFIED_LIKE_IDENTIFIER]

	yyvs107: SPECIAL [ET_QUERY]
			-- Stack for semantic values of type ET_QUERY

	yyvsc107: INTEGER
			-- Capacity of semantic value stack `yyvs107'

	yyvsp107: INTEGER
			-- Top of semantic value stack `yyvs107'

	yyspecial_routines107: KL_SPECIAL_ROUTINES [ET_QUERY]
			-- Routines that ought to be in SPECIAL [ET_QUERY]

	yyvs108: SPECIAL [ET_RENAME_ITEM]
			-- Stack for semantic values of type ET_RENAME_ITEM

	yyvsc108: INTEGER
			-- Capacity of semantic value stack `yyvs108'

	yyvsp108: INTEGER
			-- Top of semantic value stack `yyvs108'

	yyspecial_routines108: KL_SPECIAL_ROUTINES [ET_RENAME_ITEM]
			-- Routines that ought to be in SPECIAL [ET_RENAME_ITEM]

	yyvs109: SPECIAL [ET_RENAME_LIST]
			-- Stack for semantic values of type ET_RENAME_LIST

	yyvsc109: INTEGER
			-- Capacity of semantic value stack `yyvs109'

	yyvsp109: INTEGER
			-- Top of semantic value stack `yyvs109'

	yyspecial_routines109: KL_SPECIAL_ROUTINES [ET_RENAME_LIST]
			-- Routines that ought to be in SPECIAL [ET_RENAME_LIST]

	yyvs110: SPECIAL [ET_STATIC_CALL_EXPRESSION]
			-- Stack for semantic values of type ET_STATIC_CALL_EXPRESSION

	yyvsc110: INTEGER
			-- Capacity of semantic value stack `yyvs110'

	yyvsp110: INTEGER
			-- Top of semantic value stack `yyvs110'

	yyspecial_routines110: KL_SPECIAL_ROUTINES [ET_STATIC_CALL_EXPRESSION]
			-- Routines that ought to be in SPECIAL [ET_STATIC_CALL_EXPRESSION]

	yyvs111: SPECIAL [ET_STRIP_EXPRESSION]
			-- Stack for semantic values of type ET_STRIP_EXPRESSION

	yyvsc111: INTEGER
			-- Capacity of semantic value stack `yyvs111'

	yyvsp111: INTEGER
			-- Top of semantic value stack `yyvs111'

	yyspecial_routines111: KL_SPECIAL_ROUTINES [ET_STRIP_EXPRESSION]
			-- Routines that ought to be in SPECIAL [ET_STRIP_EXPRESSION]

	yyvs112: SPECIAL [ET_TYPE]
			-- Stack for semantic values of type ET_TYPE

	yyvsc112: INTEGER
			-- Capacity of semantic value stack `yyvs112'

	yyvsp112: INTEGER
			-- Top of semantic value stack `yyvs112'

	yyspecial_routines112: KL_SPECIAL_ROUTINES [ET_TYPE]
			-- Routines that ought to be in SPECIAL [ET_TYPE]

	yyvs113: SPECIAL [ET_TYPE_ITEM]
			-- Stack for semantic values of type ET_TYPE_ITEM

	yyvsc113: INTEGER
			-- Capacity of semantic value stack `yyvs113'

	yyvsp113: INTEGER
			-- Top of semantic value stack `yyvs113'

	yyspecial_routines113: KL_SPECIAL_ROUTINES [ET_TYPE_ITEM]
			-- Routines that ought to be in SPECIAL [ET_TYPE_ITEM]

	yyvs114: SPECIAL [ET_TYPE_LIST]
			-- Stack for semantic values of type ET_TYPE_LIST

	yyvsc114: INTEGER
			-- Capacity of semantic value stack `yyvs114'

	yyvsp114: INTEGER
			-- Top of semantic value stack `yyvs114'

	yyspecial_routines114: KL_SPECIAL_ROUTINES [ET_TYPE_LIST]
			-- Routines that ought to be in SPECIAL [ET_TYPE_LIST]

	yyvs115: SPECIAL [ET_VARIANT]
			-- Stack for semantic values of type ET_VARIANT

	yyvsc115: INTEGER
			-- Capacity of semantic value stack `yyvs115'

	yyvsp115: INTEGER
			-- Top of semantic value stack `yyvs115'

	yyspecial_routines115: KL_SPECIAL_ROUTINES [ET_VARIANT]
			-- Routines that ought to be in SPECIAL [ET_VARIANT]

	yyvs116: SPECIAL [ET_WHEN_PART]
			-- Stack for semantic values of type ET_WHEN_PART

	yyvsc116: INTEGER
			-- Capacity of semantic value stack `yyvs116'

	yyvsp116: INTEGER
			-- Top of semantic value stack `yyvs116'

	yyspecial_routines116: KL_SPECIAL_ROUTINES [ET_WHEN_PART]
			-- Routines that ought to be in SPECIAL [ET_WHEN_PART]

	yyvs117: SPECIAL [ET_WHEN_PART_LIST]
			-- Stack for semantic values of type ET_WHEN_PART_LIST

	yyvsc117: INTEGER
			-- Capacity of semantic value stack `yyvs117'

	yyvsp117: INTEGER
			-- Top of semantic value stack `yyvs117'

	yyspecial_routines117: KL_SPECIAL_ROUTINES [ET_WHEN_PART_LIST]
			-- Routines that ought to be in SPECIAL [ET_WHEN_PART_LIST]

	yyvs118: SPECIAL [ET_WRITABLE]
			-- Stack for semantic values of type ET_WRITABLE

	yyvsc118: INTEGER
			-- Capacity of semantic value stack `yyvs118'

	yyvsp118: INTEGER
			-- Top of semantic value stack `yyvs118'

	yyspecial_routines118: KL_SPECIAL_ROUTINES [ET_WRITABLE]
			-- Routines that ought to be in SPECIAL [ET_WRITABLE]

feature {NONE} -- Constants

	yyFinal: INTEGER is 1413
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 138
			-- Number of tokens

	yyLast: INTEGER is 5151
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 370
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 385
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
