note

	description:

		"Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_PARSER

inherit

	ET_EIFFEL_PARSER_SKELETON
		undefine
			read_token
		redefine
			yyparse,
			system_processor
		end

	ET_EIFFEL_SCANNER
		rename
			make as make_eiffel_scanner
		undefine
			reset, set_syntax_error
		redefine
			system_processor
		end

create

	make


feature {NONE} -- Implementation

	yy_build_parser_tables
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

	yy_create_value_stacks
			-- Create value stacks.
		do
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
			create yyspecial_routines3
			yyvsc3 := yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.make (yyvsc3)
			create yyspecial_routines4
			yyvsc4 := yyInitial_yyvs_size
			yyvs4 := yyspecial_routines4.make (yyvsc4)
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
			create yyspecial_routines8
			yyvsc8 := yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.make (yyvsc8)
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
			create yyspecial_routines10
			yyvsc10 := yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.make (yyvsc10)
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
			create yyspecial_routines12
			yyvsc12 := yyInitial_yyvs_size
			yyvs12 := yyspecial_routines12.make (yyvsc12)
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
			create yyspecial_routines14
			yyvsc14 := yyInitial_yyvs_size
			yyvs14 := yyspecial_routines14.make (yyvsc14)
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
			create yyspecial_routines17
			yyvsc17 := yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.make (yyvsc17)
			create yyspecial_routines18
			yyvsc18 := yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.make (yyvsc18)
			create yyspecial_routines19
			yyvsc19 := yyInitial_yyvs_size
			yyvs19 := yyspecial_routines19.make (yyvsc19)
			create yyspecial_routines20
			yyvsc20 := yyInitial_yyvs_size
			yyvs20 := yyspecial_routines20.make (yyvsc20)
			create yyspecial_routines21
			yyvsc21 := yyInitial_yyvs_size
			yyvs21 := yyspecial_routines21.make (yyvsc21)
			create yyspecial_routines22
			yyvsc22 := yyInitial_yyvs_size
			yyvs22 := yyspecial_routines22.make (yyvsc22)
			create yyspecial_routines23
			yyvsc23 := yyInitial_yyvs_size
			yyvs23 := yyspecial_routines23.make (yyvsc23)
			create yyspecial_routines24
			yyvsc24 := yyInitial_yyvs_size
			yyvs24 := yyspecial_routines24.make (yyvsc24)
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
			create yyspecial_routines28
			yyvsc28 := yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.make (yyvsc28)
			create yyspecial_routines29
			yyvsc29 := yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.make (yyvsc29)
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
			create yyspecial_routines46
			yyvsc46 := yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.make (yyvsc46)
			create yyspecial_routines47
			yyvsc47 := yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.make (yyvsc47)
			create yyspecial_routines48
			yyvsc48 := yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.make (yyvsc48)
			create yyspecial_routines49
			yyvsc49 := yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.make (yyvsc49)
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
			create yyspecial_routines51
			yyvsc51 := yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.make (yyvsc51)
			create yyspecial_routines52
			yyvsc52 := yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.make (yyvsc52)
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
			create yyspecial_routines54
			yyvsc54 := yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.make (yyvsc54)
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
			create yyspecial_routines56
			yyvsc56 := yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.make (yyvsc56)
			create yyspecial_routines57
			yyvsc57 := yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.make (yyvsc57)
			create yyspecial_routines58
			yyvsc58 := yyInitial_yyvs_size
			yyvs58 := yyspecial_routines58.make (yyvsc58)
			create yyspecial_routines59
			yyvsc59 := yyInitial_yyvs_size
			yyvs59 := yyspecial_routines59.make (yyvsc59)
			create yyspecial_routines60
			yyvsc60 := yyInitial_yyvs_size
			yyvs60 := yyspecial_routines60.make (yyvsc60)
			create yyspecial_routines61
			yyvsc61 := yyInitial_yyvs_size
			yyvs61 := yyspecial_routines61.make (yyvsc61)
			create yyspecial_routines62
			yyvsc62 := yyInitial_yyvs_size
			yyvs62 := yyspecial_routines62.make (yyvsc62)
			create yyspecial_routines63
			yyvsc63 := yyInitial_yyvs_size
			yyvs63 := yyspecial_routines63.make (yyvsc63)
			create yyspecial_routines64
			yyvsc64 := yyInitial_yyvs_size
			yyvs64 := yyspecial_routines64.make (yyvsc64)
			create yyspecial_routines65
			yyvsc65 := yyInitial_yyvs_size
			yyvs65 := yyspecial_routines65.make (yyvsc65)
			create yyspecial_routines66
			yyvsc66 := yyInitial_yyvs_size
			yyvs66 := yyspecial_routines66.make (yyvsc66)
			create yyspecial_routines67
			yyvsc67 := yyInitial_yyvs_size
			yyvs67 := yyspecial_routines67.make (yyvsc67)
			create yyspecial_routines68
			yyvsc68 := yyInitial_yyvs_size
			yyvs68 := yyspecial_routines68.make (yyvsc68)
			create yyspecial_routines69
			yyvsc69 := yyInitial_yyvs_size
			yyvs69 := yyspecial_routines69.make (yyvsc69)
			create yyspecial_routines70
			yyvsc70 := yyInitial_yyvs_size
			yyvs70 := yyspecial_routines70.make (yyvsc70)
			create yyspecial_routines71
			yyvsc71 := yyInitial_yyvs_size
			yyvs71 := yyspecial_routines71.make (yyvsc71)
			create yyspecial_routines72
			yyvsc72 := yyInitial_yyvs_size
			yyvs72 := yyspecial_routines72.make (yyvsc72)
			create yyspecial_routines73
			yyvsc73 := yyInitial_yyvs_size
			yyvs73 := yyspecial_routines73.make (yyvsc73)
			create yyspecial_routines74
			yyvsc74 := yyInitial_yyvs_size
			yyvs74 := yyspecial_routines74.make (yyvsc74)
			create yyspecial_routines75
			yyvsc75 := yyInitial_yyvs_size
			yyvs75 := yyspecial_routines75.make (yyvsc75)
			create yyspecial_routines76
			yyvsc76 := yyInitial_yyvs_size
			yyvs76 := yyspecial_routines76.make (yyvsc76)
			create yyspecial_routines77
			yyvsc77 := yyInitial_yyvs_size
			yyvs77 := yyspecial_routines77.make (yyvsc77)
			create yyspecial_routines78
			yyvsc78 := yyInitial_yyvs_size
			yyvs78 := yyspecial_routines78.make (yyvsc78)
			create yyspecial_routines79
			yyvsc79 := yyInitial_yyvs_size
			yyvs79 := yyspecial_routines79.make (yyvsc79)
			create yyspecial_routines80
			yyvsc80 := yyInitial_yyvs_size
			yyvs80 := yyspecial_routines80.make (yyvsc80)
			create yyspecial_routines81
			yyvsc81 := yyInitial_yyvs_size
			yyvs81 := yyspecial_routines81.make (yyvsc81)
			create yyspecial_routines82
			yyvsc82 := yyInitial_yyvs_size
			yyvs82 := yyspecial_routines82.make (yyvsc82)
			create yyspecial_routines83
			yyvsc83 := yyInitial_yyvs_size
			yyvs83 := yyspecial_routines83.make (yyvsc83)
			create yyspecial_routines84
			yyvsc84 := yyInitial_yyvs_size
			yyvs84 := yyspecial_routines84.make (yyvsc84)
			create yyspecial_routines85
			yyvsc85 := yyInitial_yyvs_size
			yyvs85 := yyspecial_routines85.make (yyvsc85)
			create yyspecial_routines86
			yyvsc86 := yyInitial_yyvs_size
			yyvs86 := yyspecial_routines86.make (yyvsc86)
			create yyspecial_routines87
			yyvsc87 := yyInitial_yyvs_size
			yyvs87 := yyspecial_routines87.make (yyvsc87)
			create yyspecial_routines88
			yyvsc88 := yyInitial_yyvs_size
			yyvs88 := yyspecial_routines88.make (yyvsc88)
			create yyspecial_routines89
			yyvsc89 := yyInitial_yyvs_size
			yyvs89 := yyspecial_routines89.make (yyvsc89)
			create yyspecial_routines90
			yyvsc90 := yyInitial_yyvs_size
			yyvs90 := yyspecial_routines90.make (yyvsc90)
			create yyspecial_routines91
			yyvsc91 := yyInitial_yyvs_size
			yyvs91 := yyspecial_routines91.make (yyvsc91)
			create yyspecial_routines92
			yyvsc92 := yyInitial_yyvs_size
			yyvs92 := yyspecial_routines92.make (yyvsc92)
			create yyspecial_routines93
			yyvsc93 := yyInitial_yyvs_size
			yyvs93 := yyspecial_routines93.make (yyvsc93)
			create yyspecial_routines94
			yyvsc94 := yyInitial_yyvs_size
			yyvs94 := yyspecial_routines94.make (yyvsc94)
			create yyspecial_routines95
			yyvsc95 := yyInitial_yyvs_size
			yyvs95 := yyspecial_routines95.make (yyvsc95)
			create yyspecial_routines96
			yyvsc96 := yyInitial_yyvs_size
			yyvs96 := yyspecial_routines96.make (yyvsc96)
			create yyspecial_routines97
			yyvsc97 := yyInitial_yyvs_size
			yyvs97 := yyspecial_routines97.make (yyvsc97)
			create yyspecial_routines98
			yyvsc98 := yyInitial_yyvs_size
			yyvs98 := yyspecial_routines98.make (yyvsc98)
			create yyspecial_routines99
			yyvsc99 := yyInitial_yyvs_size
			yyvs99 := yyspecial_routines99.make (yyvsc99)
			create yyspecial_routines100
			yyvsc100 := yyInitial_yyvs_size
			yyvs100 := yyspecial_routines100.make (yyvsc100)
			create yyspecial_routines101
			yyvsc101 := yyInitial_yyvs_size
			yyvs101 := yyspecial_routines101.make (yyvsc101)
			create yyspecial_routines102
			yyvsc102 := yyInitial_yyvs_size
			yyvs102 := yyspecial_routines102.make (yyvsc102)
			create yyspecial_routines103
			yyvsc103 := yyInitial_yyvs_size
			yyvs103 := yyspecial_routines103.make (yyvsc103)
			create yyspecial_routines104
			yyvsc104 := yyInitial_yyvs_size
			yyvs104 := yyspecial_routines104.make (yyvsc104)
			create yyspecial_routines105
			yyvsc105 := yyInitial_yyvs_size
			yyvs105 := yyspecial_routines105.make (yyvsc105)
			create yyspecial_routines106
			yyvsc106 := yyInitial_yyvs_size
			yyvs106 := yyspecial_routines106.make (yyvsc106)
			create yyspecial_routines107
			yyvsc107 := yyInitial_yyvs_size
			yyvs107 := yyspecial_routines107.make (yyvsc107)
			create yyspecial_routines108
			yyvsc108 := yyInitial_yyvs_size
			yyvs108 := yyspecial_routines108.make (yyvsc108)
			create yyspecial_routines109
			yyvsc109 := yyInitial_yyvs_size
			yyvs109 := yyspecial_routines109.make (yyvsc109)
			create yyspecial_routines110
			yyvsc110 := yyInitial_yyvs_size
			yyvs110 := yyspecial_routines110.make (yyvsc110)
			create yyspecial_routines111
			yyvsc111 := yyInitial_yyvs_size
			yyvs111 := yyspecial_routines111.make (yyvsc111)
			create yyspecial_routines112
			yyvsc112 := yyInitial_yyvs_size
			yyvs112 := yyspecial_routines112.make (yyvsc112)
			create yyspecial_routines113
			yyvsc113 := yyInitial_yyvs_size
			yyvs113 := yyspecial_routines113.make (yyvsc113)
			create yyspecial_routines114
			yyvsc114 := yyInitial_yyvs_size
			yyvs114 := yyspecial_routines114.make (yyvsc114)
			create yyspecial_routines115
			yyvsc115 := yyInitial_yyvs_size
			yyvs115 := yyspecial_routines115.make (yyvsc115)
			create yyspecial_routines116
			yyvsc116 := yyInitial_yyvs_size
			yyvs116 := yyspecial_routines116.make (yyvsc116)
			create yyspecial_routines117
			yyvsc117 := yyInitial_yyvs_size
			yyvs117 := yyspecial_routines117.make (yyvsc117)
			create yyspecial_routines118
			yyvsc118 := yyInitial_yyvs_size
			yyvs118 := yyspecial_routines118.make (yyvsc118)
			create yyspecial_routines119
			yyvsc119 := yyInitial_yyvs_size
			yyvs119 := yyspecial_routines119.make (yyvsc119)
			create yyspecial_routines120
			yyvsc120 := yyInitial_yyvs_size
			yyvs120 := yyspecial_routines120.make (yyvsc120)
		end

	yy_init_value_stacks
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
			yyvsp119 := -1
			yyvsp120 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
			yyvs3.keep_head (0)
			yyvs4.keep_head (0)
			yyvs5.keep_head (0)
			yyvs6.keep_head (0)
			yyvs7.keep_head (0)
			yyvs8.keep_head (0)
			yyvs9.keep_head (0)
			yyvs10.keep_head (0)
			yyvs11.keep_head (0)
			yyvs12.keep_head (0)
			yyvs13.keep_head (0)
			yyvs14.keep_head (0)
			yyvs15.keep_head (0)
			yyvs16.keep_head (0)
			yyvs17.keep_head (0)
			yyvs18.keep_head (0)
			yyvs19.keep_head (0)
			yyvs20.keep_head (0)
			yyvs21.keep_head (0)
			yyvs22.keep_head (0)
			yyvs23.keep_head (0)
			yyvs24.keep_head (0)
			yyvs25.keep_head (0)
			yyvs26.keep_head (0)
			yyvs27.keep_head (0)
			yyvs28.keep_head (0)
			yyvs29.keep_head (0)
			yyvs30.keep_head (0)
			yyvs31.keep_head (0)
			yyvs32.keep_head (0)
			yyvs33.keep_head (0)
			yyvs34.keep_head (0)
			yyvs35.keep_head (0)
			yyvs36.keep_head (0)
			yyvs37.keep_head (0)
			yyvs38.keep_head (0)
			yyvs39.keep_head (0)
			yyvs40.keep_head (0)
			yyvs41.keep_head (0)
			yyvs42.keep_head (0)
			yyvs43.keep_head (0)
			yyvs44.keep_head (0)
			yyvs45.keep_head (0)
			yyvs46.keep_head (0)
			yyvs47.keep_head (0)
			yyvs48.keep_head (0)
			yyvs49.keep_head (0)
			yyvs50.keep_head (0)
			yyvs51.keep_head (0)
			yyvs52.keep_head (0)
			yyvs53.keep_head (0)
			yyvs54.keep_head (0)
			yyvs55.keep_head (0)
			yyvs56.keep_head (0)
			yyvs57.keep_head (0)
			yyvs58.keep_head (0)
			yyvs59.keep_head (0)
			yyvs60.keep_head (0)
			yyvs61.keep_head (0)
			yyvs62.keep_head (0)
			yyvs63.keep_head (0)
			yyvs64.keep_head (0)
			yyvs65.keep_head (0)
			yyvs66.keep_head (0)
			yyvs67.keep_head (0)
			yyvs68.keep_head (0)
			yyvs69.keep_head (0)
			yyvs70.keep_head (0)
			yyvs71.keep_head (0)
			yyvs72.keep_head (0)
			yyvs73.keep_head (0)
			yyvs74.keep_head (0)
			yyvs75.keep_head (0)
			yyvs76.keep_head (0)
			yyvs77.keep_head (0)
			yyvs78.keep_head (0)
			yyvs79.keep_head (0)
			yyvs80.keep_head (0)
			yyvs81.keep_head (0)
			yyvs82.keep_head (0)
			yyvs83.keep_head (0)
			yyvs84.keep_head (0)
			yyvs85.keep_head (0)
			yyvs86.keep_head (0)
			yyvs87.keep_head (0)
			yyvs88.keep_head (0)
			yyvs89.keep_head (0)
			yyvs90.keep_head (0)
			yyvs91.keep_head (0)
			yyvs92.keep_head (0)
			yyvs93.keep_head (0)
			yyvs94.keep_head (0)
			yyvs95.keep_head (0)
			yyvs96.keep_head (0)
			yyvs97.keep_head (0)
			yyvs98.keep_head (0)
			yyvs99.keep_head (0)
			yyvs100.keep_head (0)
			yyvs101.keep_head (0)
			yyvs102.keep_head (0)
			yyvs103.keep_head (0)
			yyvs104.keep_head (0)
			yyvs105.keep_head (0)
			yyvs106.keep_head (0)
			yyvs107.keep_head (0)
			yyvs108.keep_head (0)
			yyvs109.keep_head (0)
			yyvs110.keep_head (0)
			yyvs111.keep_head (0)
			yyvs112.keep_head (0)
			yyvs113.keep_head (0)
			yyvs114.keep_head (0)
			yyvs115.keep_head (0)
			yyvs116.keep_head (0)
			yyvs117.keep_head (0)
			yyvs118.keep_head (0)
			yyvs119.keep_head (0)
			yyvs120.keep_head (0)
		end

	yy_push_last_value (yychar1: INTEGER)
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			inspect yytypes2.item (yychar1)
			when 1 then
				yyvsp1 := yyvsp1 + 1
				if yyvsp1 >= yyvsc1 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs1")
					end
					yyvsc1 := yyvsc1 + yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
				end
				yyspecial_routines1.force (yyvs1, last_detachable_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs2")
					end
					yyvsc2 := yyvsc2 + yyInitial_yyvs_size
					yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
				end
				yyspecial_routines2.force (yyvs2, last_detachable_et_keyword_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs3")
					end
					yyvsc3 := yyvsc3 + yyInitial_yyvs_size
					yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
				end
				yyspecial_routines3.force (yyvs3, last_detachable_et_agent_keyword_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs4")
					end
					yyvsc4 := yyvsc4 + yyInitial_yyvs_size
					yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
				end
				yyspecial_routines4.force (yyvs4, last_detachable_et_precursor_keyword_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs5")
					end
					yyvsc5 := yyvsc5 + yyInitial_yyvs_size
					yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
				end
				yyspecial_routines5.force (yyvs5, last_detachable_et_symbol_value, yyvsp5)
			when 6 then
				yyvsp6 := yyvsp6 + 1
				if yyvsp6 >= yyvsc6 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs6")
					end
					yyvsc6 := yyvsc6 + yyInitial_yyvs_size
					yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
				end
				yyspecial_routines6.force (yyvs6, last_detachable_et_position_value, yyvsp6)
			when 7 then
				yyvsp7 := yyvsp7 + 1
				if yyvsp7 >= yyvsc7 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs7")
					end
					yyvsc7 := yyvsc7 + yyInitial_yyvs_size
					yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
				end
				yyspecial_routines7.force (yyvs7, last_detachable_et_boolean_constant_value, yyvsp7)
			when 8 then
				yyvsp8 := yyvsp8 + 1
				if yyvsp8 >= yyvsc8 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs8")
					end
					yyvsc8 := yyvsc8 + yyInitial_yyvs_size
					yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
				end
				yyspecial_routines8.force (yyvs8, last_detachable_et_break_value, yyvsp8)
			when 9 then
				yyvsp9 := yyvsp9 + 1
				if yyvsp9 >= yyvsc9 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs9")
					end
					yyvsc9 := yyvsc9 + yyInitial_yyvs_size
					yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
				end
				yyspecial_routines9.force (yyvs9, last_detachable_et_character_constant_value, yyvsp9)
			when 10 then
				yyvsp10 := yyvsp10 + 1
				if yyvsp10 >= yyvsc10 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs10")
					end
					yyvsc10 := yyvsc10 + yyInitial_yyvs_size
					yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
				end
				yyspecial_routines10.force (yyvs10, last_detachable_et_current_value, yyvsp10)
			when 11 then
				yyvsp11 := yyvsp11 + 1
				if yyvsp11 >= yyvsc11 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs11")
					end
					yyvsc11 := yyvsc11 + yyInitial_yyvs_size
					yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
				end
				yyspecial_routines11.force (yyvs11, last_detachable_et_free_operator_value, yyvsp11)
			when 12 then
				yyvsp12 := yyvsp12 + 1
				if yyvsp12 >= yyvsc12 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs12")
					end
					yyvsc12 := yyvsc12 + yyInitial_yyvs_size
					yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
				end
				yyspecial_routines12.force (yyvs12, last_detachable_et_identifier_value, yyvsp12)
			when 13 then
				yyvsp13 := yyvsp13 + 1
				if yyvsp13 >= yyvsc13 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs13")
					end
					yyvsc13 := yyvsc13 + yyInitial_yyvs_size
					yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
				end
				yyspecial_routines13.force (yyvs13, last_detachable_et_integer_constant_value, yyvsp13)
			when 14 then
				yyvsp14 := yyvsp14 + 1
				if yyvsp14 >= yyvsc14 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs14")
					end
					yyvsc14 := yyvsc14 + yyInitial_yyvs_size
					yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
				end
				yyspecial_routines14.force (yyvs14, last_detachable_et_keyword_operator_value, yyvsp14)
			when 15 then
				yyvsp15 := yyvsp15 + 1
				if yyvsp15 >= yyvsc15 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs15")
					end
					yyvsc15 := yyvsc15 + yyInitial_yyvs_size
					yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
				end
				yyspecial_routines15.force (yyvs15, last_detachable_et_manifest_string_value, yyvsp15)
			when 16 then
				yyvsp16 := yyvsp16 + 1
				if yyvsp16 >= yyvsc16 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs16")
					end
					yyvsc16 := yyvsc16 + yyInitial_yyvs_size
					yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
				end
				yyspecial_routines16.force (yyvs16, last_detachable_et_real_constant_value, yyvsp16)
			when 17 then
				yyvsp17 := yyvsp17 + 1
				if yyvsp17 >= yyvsc17 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs17")
					end
					yyvsc17 := yyvsc17 + yyInitial_yyvs_size
					yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
				end
				yyspecial_routines17.force (yyvs17, last_detachable_et_result_value, yyvsp17)
			when 18 then
				yyvsp18 := yyvsp18 + 1
				if yyvsp18 >= yyvsc18 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs18")
					end
					yyvsc18 := yyvsc18 + yyInitial_yyvs_size
					yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
				end
				yyspecial_routines18.force (yyvs18, last_detachable_et_retry_instruction_value, yyvsp18)
			when 19 then
				yyvsp19 := yyvsp19 + 1
				if yyvsp19 >= yyvsc19 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs19")
					end
					yyvsc19 := yyvsc19 + yyInitial_yyvs_size
					yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
				end
				yyspecial_routines19.force (yyvs19, last_detachable_et_symbol_operator_value, yyvsp19)
			when 20 then
				yyvsp20 := yyvsp20 + 1
				if yyvsp20 >= yyvsc20 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs20")
					end
					yyvsc20 := yyvsc20 + yyInitial_yyvs_size
					yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
				end
				yyspecial_routines20.force (yyvs20, last_detachable_et_void_value, yyvsp20)
			when 21 then
				yyvsp21 := yyvsp21 + 1
				if yyvsp21 >= yyvsc21 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs21")
					end
					yyvsc21 := yyvsc21 + yyInitial_yyvs_size
					yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
				end
				yyspecial_routines21.force (yyvs21, last_detachable_et_semicolon_symbol_value, yyvsp21)
			when 22 then
				yyvsp22 := yyvsp22 + 1
				if yyvsp22 >= yyvsc22 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs22")
					end
					yyvsc22 := yyvsc22 + yyInitial_yyvs_size
					yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
				end
				yyspecial_routines22.force (yyvs22, last_detachable_et_bracket_symbol_value, yyvsp22)
			when 23 then
				yyvsp23 := yyvsp23 + 1
				if yyvsp23 >= yyvsc23 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs23")
					end
					yyvsc23 := yyvsc23 + yyInitial_yyvs_size
					yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
				end
				yyspecial_routines23.force (yyvs23, last_detachable_et_question_mark_symbol_value, yyvsp23)
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: not a token type: ")
					std.error.put_integer (yytypes2.item (yychar1))
					std.error.put_new_line
				end
				abort
			end
		end

	yy_push_error_value
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		local
			yyval1: detachable ANY
		do
			yyvsp1 := yyvsp1 + 1
			if yyvsp1 >= yyvsc1 then
				debug ("GEYACC")
					std.error.put_line ("Resize yyvs1")
				end
				yyvsc1 := yyvsc1 + yyInitial_yyvs_size
				yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
			end
			yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
		end

	yy_pop_last_value (yystate: INTEGER)
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
			when 119 then
				yyvsp119 := yyvsp119 - 1
			when 120 then
				yyvsp120 := yyvsp120 - 1
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown type id: ")
					std.error.put_integer (yy_type_id)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_run_geyacc
			-- You must run geyacc to regenerate this class.
		do
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER)
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
			elseif yy_act <= 1000 then
				yy_do_action_801_1000 (yy_act)
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_action_1_200 (yy_act: INTEGER)
			-- Execute semantic action.
		do
			inspect yy_act
			when 1 then
					--|#line 233 "et_eiffel_parser.y"
				yy_do_action_1
			when 2 then
					--|#line 237 "et_eiffel_parser.y"
				yy_do_action_2
			when 3 then
					--|#line 245 "et_eiffel_parser.y"
				yy_do_action_3
			when 4 then
					--|#line 254 "et_eiffel_parser.y"
				yy_do_action_4
			when 5 then
					--|#line 255 "et_eiffel_parser.y"
				yy_do_action_5
			when 6 then
					--|#line 255 "et_eiffel_parser.y"
				yy_do_action_6
			when 7 then
					--|#line 266 "et_eiffel_parser.y"
				yy_do_action_7
			when 8 then
					--|#line 274 "et_eiffel_parser.y"
				yy_do_action_8
			when 9 then
					--|#line 279 "et_eiffel_parser.y"
				yy_do_action_9
			when 10 then
					--|#line 281 "et_eiffel_parser.y"
				yy_do_action_10
			when 11 then
					--|#line 281 "et_eiffel_parser.y"
				yy_do_action_11
			when 12 then
					--|#line 292 "et_eiffel_parser.y"
				yy_do_action_12
			when 13 then
					--|#line 294 "et_eiffel_parser.y"
				yy_do_action_13
			when 14 then
					--|#line 294 "et_eiffel_parser.y"
				yy_do_action_14
			when 15 then
					--|#line 307 "et_eiffel_parser.y"
				yy_do_action_15
			when 16 then
					--|#line 309 "et_eiffel_parser.y"
				yy_do_action_16
			when 17 then
					--|#line 313 "et_eiffel_parser.y"
				yy_do_action_17
			when 18 then
					--|#line 324 "et_eiffel_parser.y"
				yy_do_action_18
			when 19 then
					--|#line 324 "et_eiffel_parser.y"
				yy_do_action_19
			when 20 then
					--|#line 333 "et_eiffel_parser.y"
				yy_do_action_20
			when 21 then
					--|#line 333 "et_eiffel_parser.y"
				yy_do_action_21
			when 22 then
					--|#line 344 "et_eiffel_parser.y"
				yy_do_action_22
			when 23 then
					--|#line 351 "et_eiffel_parser.y"
				yy_do_action_23
			when 24 then
					--|#line 357 "et_eiffel_parser.y"
				yy_do_action_24
			when 25 then
					--|#line 361 "et_eiffel_parser.y"
				yy_do_action_25
			when 26 then
					--|#line 372 "et_eiffel_parser.y"
				yy_do_action_26
			when 27 then
					--|#line 384 "et_eiffel_parser.y"
				yy_do_action_27
			when 28 then
					--|#line 384 "et_eiffel_parser.y"
				yy_do_action_28
			when 29 then
					--|#line 393 "et_eiffel_parser.y"
				yy_do_action_29
			when 30 then
					--|#line 393 "et_eiffel_parser.y"
				yy_do_action_30
			when 31 then
					--|#line 404 "et_eiffel_parser.y"
				yy_do_action_31
			when 32 then
					--|#line 411 "et_eiffel_parser.y"
				yy_do_action_32
			when 33 then
					--|#line 415 "et_eiffel_parser.y"
				yy_do_action_33
			when 34 then
					--|#line 421 "et_eiffel_parser.y"
				yy_do_action_34
			when 35 then
					--|#line 423 "et_eiffel_parser.y"
				yy_do_action_35
			when 36 then
					--|#line 428 "et_eiffel_parser.y"
				yy_do_action_36
			when 37 then
					--|#line 439 "et_eiffel_parser.y"
				yy_do_action_37
			when 38 then
					--|#line 448 "et_eiffel_parser.y"
				yy_do_action_38
			when 39 then
					--|#line 450 "et_eiffel_parser.y"
				yy_do_action_39
			when 40 then
					--|#line 452 "et_eiffel_parser.y"
				yy_do_action_40
			when 41 then
					--|#line 454 "et_eiffel_parser.y"
				yy_do_action_41
			when 42 then
					--|#line 456 "et_eiffel_parser.y"
				yy_do_action_42
			when 43 then
					--|#line 458 "et_eiffel_parser.y"
				yy_do_action_43
			when 44 then
					--|#line 460 "et_eiffel_parser.y"
				yy_do_action_44
			when 45 then
					--|#line 462 "et_eiffel_parser.y"
				yy_do_action_45
			when 46 then
					--|#line 466 "et_eiffel_parser.y"
				yy_do_action_46
			when 47 then
					--|#line 477 "et_eiffel_parser.y"
				yy_do_action_47
			when 48 then
					--|#line 489 "et_eiffel_parser.y"
				yy_do_action_48
			when 49 then
					--|#line 502 "et_eiffel_parser.y"
				yy_do_action_49
			when 50 then
					--|#line 515 "et_eiffel_parser.y"
				yy_do_action_50
			when 51 then
					--|#line 530 "et_eiffel_parser.y"
				yy_do_action_51
			when 52 then
					--|#line 532 "et_eiffel_parser.y"
				yy_do_action_52
			when 53 then
					--|#line 536 "et_eiffel_parser.y"
				yy_do_action_53
			when 54 then
					--|#line 538 "et_eiffel_parser.y"
				yy_do_action_54
			when 55 then
					--|#line 544 "et_eiffel_parser.y"
				yy_do_action_55
			when 56 then
					--|#line 548 "et_eiffel_parser.y"
				yy_do_action_56
			when 57 then
					--|#line 554 "et_eiffel_parser.y"
				yy_do_action_57
			when 58 then
					--|#line 554 "et_eiffel_parser.y"
				yy_do_action_58
			when 59 then
					--|#line 568 "et_eiffel_parser.y"
				yy_do_action_59
			when 60 then
					--|#line 579 "et_eiffel_parser.y"
				yy_do_action_60
			when 61 then
					--|#line 588 "et_eiffel_parser.y"
				yy_do_action_61
			when 62 then
					--|#line 597 "et_eiffel_parser.y"
				yy_do_action_62
			when 63 then
					--|#line 604 "et_eiffel_parser.y"
				yy_do_action_63
			when 64 then
					--|#line 611 "et_eiffel_parser.y"
				yy_do_action_64
			when 65 then
					--|#line 618 "et_eiffel_parser.y"
				yy_do_action_65
			when 66 then
					--|#line 625 "et_eiffel_parser.y"
				yy_do_action_66
			when 67 then
					--|#line 632 "et_eiffel_parser.y"
				yy_do_action_67
			when 68 then
					--|#line 639 "et_eiffel_parser.y"
				yy_do_action_68
			when 69 then
					--|#line 646 "et_eiffel_parser.y"
				yy_do_action_69
			when 70 then
					--|#line 653 "et_eiffel_parser.y"
				yy_do_action_70
			when 71 then
					--|#line 662 "et_eiffel_parser.y"
				yy_do_action_71
			when 72 then
					--|#line 664 "et_eiffel_parser.y"
				yy_do_action_72
			when 73 then
					--|#line 664 "et_eiffel_parser.y"
				yy_do_action_73
			when 74 then
					--|#line 677 "et_eiffel_parser.y"
				yy_do_action_74
			when 75 then
					--|#line 689 "et_eiffel_parser.y"
				yy_do_action_75
			when 76 then
					--|#line 697 "et_eiffel_parser.y"
				yy_do_action_76
			when 77 then
					--|#line 706 "et_eiffel_parser.y"
				yy_do_action_77
			when 78 then
					--|#line 708 "et_eiffel_parser.y"
				yy_do_action_78
			when 79 then
					--|#line 710 "et_eiffel_parser.y"
				yy_do_action_79
			when 80 then
					--|#line 712 "et_eiffel_parser.y"
				yy_do_action_80
			when 81 then
					--|#line 714 "et_eiffel_parser.y"
				yy_do_action_81
			when 82 then
					--|#line 716 "et_eiffel_parser.y"
				yy_do_action_82
			when 83 then
					--|#line 718 "et_eiffel_parser.y"
				yy_do_action_83
			when 84 then
					--|#line 720 "et_eiffel_parser.y"
				yy_do_action_84
			when 85 then
					--|#line 722 "et_eiffel_parser.y"
				yy_do_action_85
			when 86 then
					--|#line 724 "et_eiffel_parser.y"
				yy_do_action_86
			when 87 then
					--|#line 726 "et_eiffel_parser.y"
				yy_do_action_87
			when 88 then
					--|#line 728 "et_eiffel_parser.y"
				yy_do_action_88
			when 89 then
					--|#line 730 "et_eiffel_parser.y"
				yy_do_action_89
			when 90 then
					--|#line 732 "et_eiffel_parser.y"
				yy_do_action_90
			when 91 then
					--|#line 734 "et_eiffel_parser.y"
				yy_do_action_91
			when 92 then
					--|#line 736 "et_eiffel_parser.y"
				yy_do_action_92
			when 93 then
					--|#line 738 "et_eiffel_parser.y"
				yy_do_action_93
			when 94 then
					--|#line 740 "et_eiffel_parser.y"
				yy_do_action_94
			when 95 then
					--|#line 742 "et_eiffel_parser.y"
				yy_do_action_95
			when 96 then
					--|#line 744 "et_eiffel_parser.y"
				yy_do_action_96
			when 97 then
					--|#line 746 "et_eiffel_parser.y"
				yy_do_action_97
			when 98 then
					--|#line 748 "et_eiffel_parser.y"
				yy_do_action_98
			when 99 then
					--|#line 750 "et_eiffel_parser.y"
				yy_do_action_99
			when 100 then
					--|#line 754 "et_eiffel_parser.y"
				yy_do_action_100
			when 101 then
					--|#line 756 "et_eiffel_parser.y"
				yy_do_action_101
			when 102 then
					--|#line 758 "et_eiffel_parser.y"
				yy_do_action_102
			when 103 then
					--|#line 760 "et_eiffel_parser.y"
				yy_do_action_103
			when 104 then
					--|#line 762 "et_eiffel_parser.y"
				yy_do_action_104
			when 105 then
					--|#line 764 "et_eiffel_parser.y"
				yy_do_action_105
			when 106 then
					--|#line 766 "et_eiffel_parser.y"
				yy_do_action_106
			when 107 then
					--|#line 768 "et_eiffel_parser.y"
				yy_do_action_107
			when 108 then
					--|#line 770 "et_eiffel_parser.y"
				yy_do_action_108
			when 109 then
					--|#line 772 "et_eiffel_parser.y"
				yy_do_action_109
			when 110 then
					--|#line 774 "et_eiffel_parser.y"
				yy_do_action_110
			when 111 then
					--|#line 776 "et_eiffel_parser.y"
				yy_do_action_111
			when 112 then
					--|#line 778 "et_eiffel_parser.y"
				yy_do_action_112
			when 113 then
					--|#line 780 "et_eiffel_parser.y"
				yy_do_action_113
			when 114 then
					--|#line 782 "et_eiffel_parser.y"
				yy_do_action_114
			when 115 then
					--|#line 784 "et_eiffel_parser.y"
				yy_do_action_115
			when 116 then
					--|#line 786 "et_eiffel_parser.y"
				yy_do_action_116
			when 117 then
					--|#line 788 "et_eiffel_parser.y"
				yy_do_action_117
			when 118 then
					--|#line 790 "et_eiffel_parser.y"
				yy_do_action_118
			when 119 then
					--|#line 792 "et_eiffel_parser.y"
				yy_do_action_119
			when 120 then
					--|#line 794 "et_eiffel_parser.y"
				yy_do_action_120
			when 121 then
					--|#line 796 "et_eiffel_parser.y"
				yy_do_action_121
			when 122 then
					--|#line 798 "et_eiffel_parser.y"
				yy_do_action_122
			when 123 then
					--|#line 802 "et_eiffel_parser.y"
				yy_do_action_123
			when 124 then
					--|#line 804 "et_eiffel_parser.y"
				yy_do_action_124
			when 125 then
					--|#line 808 "et_eiffel_parser.y"
				yy_do_action_125
			when 126 then
					--|#line 811 "et_eiffel_parser.y"
				yy_do_action_126
			when 127 then
					--|#line 819 "et_eiffel_parser.y"
				yy_do_action_127
			when 128 then
					--|#line 830 "et_eiffel_parser.y"
				yy_do_action_128
			when 129 then
					--|#line 835 "et_eiffel_parser.y"
				yy_do_action_129
			when 130 then
					--|#line 842 "et_eiffel_parser.y"
				yy_do_action_130
			when 131 then
					--|#line 851 "et_eiffel_parser.y"
				yy_do_action_131
			when 132 then
					--|#line 853 "et_eiffel_parser.y"
				yy_do_action_132
			when 133 then
					--|#line 857 "et_eiffel_parser.y"
				yy_do_action_133
			when 134 then
					--|#line 860 "et_eiffel_parser.y"
				yy_do_action_134
			when 135 then
					--|#line 866 "et_eiffel_parser.y"
				yy_do_action_135
			when 136 then
					--|#line 874 "et_eiffel_parser.y"
				yy_do_action_136
			when 137 then
					--|#line 879 "et_eiffel_parser.y"
				yy_do_action_137
			when 138 then
					--|#line 884 "et_eiffel_parser.y"
				yy_do_action_138
			when 139 then
					--|#line 889 "et_eiffel_parser.y"
				yy_do_action_139
			when 140 then
					--|#line 902 "et_eiffel_parser.y"
				yy_do_action_140
			when 141 then
					--|#line 911 "et_eiffel_parser.y"
				yy_do_action_141
			when 142 then
					--|#line 922 "et_eiffel_parser.y"
				yy_do_action_142
			when 143 then
					--|#line 924 "et_eiffel_parser.y"
				yy_do_action_143
			when 144 then
					--|#line 930 "et_eiffel_parser.y"
				yy_do_action_144
			when 145 then
					--|#line 932 "et_eiffel_parser.y"
				yy_do_action_145
			when 146 then
					--|#line 939 "et_eiffel_parser.y"
				yy_do_action_146
			when 147 then
					--|#line 950 "et_eiffel_parser.y"
				yy_do_action_147
			when 148 then
					--|#line 950 "et_eiffel_parser.y"
				yy_do_action_148
			when 149 then
					--|#line 965 "et_eiffel_parser.y"
				yy_do_action_149
			when 150 then
					--|#line 972 "et_eiffel_parser.y"
				yy_do_action_150
			when 151 then
					--|#line 972 "et_eiffel_parser.y"
				yy_do_action_151
			when 152 then
					--|#line 988 "et_eiffel_parser.y"
				yy_do_action_152
			when 153 then
					--|#line 995 "et_eiffel_parser.y"
				yy_do_action_153
			when 154 then
					--|#line 1003 "et_eiffel_parser.y"
				yy_do_action_154
			when 155 then
					--|#line 1010 "et_eiffel_parser.y"
				yy_do_action_155
			when 156 then
					--|#line 1017 "et_eiffel_parser.y"
				yy_do_action_156
			when 157 then
					--|#line 1024 "et_eiffel_parser.y"
				yy_do_action_157
			when 158 then
					--|#line 1033 "et_eiffel_parser.y"
				yy_do_action_158
			when 159 then
					--|#line 1040 "et_eiffel_parser.y"
				yy_do_action_159
			when 160 then
					--|#line 1047 "et_eiffel_parser.y"
				yy_do_action_160
			when 161 then
					--|#line 1054 "et_eiffel_parser.y"
				yy_do_action_161
			when 162 then
					--|#line 1063 "et_eiffel_parser.y"
				yy_do_action_162
			when 163 then
					--|#line 1074 "et_eiffel_parser.y"
				yy_do_action_163
			when 164 then
					--|#line 1076 "et_eiffel_parser.y"
				yy_do_action_164
			when 165 then
					--|#line 1076 "et_eiffel_parser.y"
				yy_do_action_165
			when 166 then
					--|#line 1089 "et_eiffel_parser.y"
				yy_do_action_166
			when 167 then
					--|#line 1096 "et_eiffel_parser.y"
				yy_do_action_167
			when 168 then
					--|#line 1105 "et_eiffel_parser.y"
				yy_do_action_168
			when 169 then
					--|#line 1114 "et_eiffel_parser.y"
				yy_do_action_169
			when 170 then
					--|#line 1123 "et_eiffel_parser.y"
				yy_do_action_170
			when 171 then
					--|#line 1134 "et_eiffel_parser.y"
				yy_do_action_171
			when 172 then
					--|#line 1136 "et_eiffel_parser.y"
				yy_do_action_172
			when 173 then
					--|#line 1136 "et_eiffel_parser.y"
				yy_do_action_173
			when 174 then
					--|#line 1149 "et_eiffel_parser.y"
				yy_do_action_174
			when 175 then
					--|#line 1151 "et_eiffel_parser.y"
				yy_do_action_175
			when 176 then
					--|#line 1155 "et_eiffel_parser.y"
				yy_do_action_176
			when 177 then
					--|#line 1166 "et_eiffel_parser.y"
				yy_do_action_177
			when 178 then
					--|#line 1166 "et_eiffel_parser.y"
				yy_do_action_178
			when 179 then
					--|#line 1181 "et_eiffel_parser.y"
				yy_do_action_179
			when 180 then
					--|#line 1185 "et_eiffel_parser.y"
				yy_do_action_180
			when 181 then
					--|#line 1190 "et_eiffel_parser.y"
				yy_do_action_181
			when 182 then
					--|#line 1190 "et_eiffel_parser.y"
				yy_do_action_182
			when 183 then
					--|#line 1200 "et_eiffel_parser.y"
				yy_do_action_183
			when 184 then
					--|#line 1204 "et_eiffel_parser.y"
				yy_do_action_184
			when 185 then
					--|#line 1215 "et_eiffel_parser.y"
				yy_do_action_185
			when 186 then
					--|#line 1223 "et_eiffel_parser.y"
				yy_do_action_186
			when 187 then
					--|#line 1234 "et_eiffel_parser.y"
				yy_do_action_187
			when 188 then
					--|#line 1234 "et_eiffel_parser.y"
				yy_do_action_188
			when 189 then
					--|#line 1245 "et_eiffel_parser.y"
				yy_do_action_189
			when 190 then
					--|#line 1249 "et_eiffel_parser.y"
				yy_do_action_190
			when 191 then
					--|#line 1256 "et_eiffel_parser.y"
				yy_do_action_191
			when 192 then
					--|#line 1264 "et_eiffel_parser.y"
				yy_do_action_192
			when 193 then
					--|#line 1271 "et_eiffel_parser.y"
				yy_do_action_193
			when 194 then
					--|#line 1281 "et_eiffel_parser.y"
				yy_do_action_194
			when 195 then
					--|#line 1290 "et_eiffel_parser.y"
				yy_do_action_195
			when 196 then
					--|#line 1300 "et_eiffel_parser.y"
				yy_do_action_196
			when 197 then
					--|#line 1302 "et_eiffel_parser.y"
				yy_do_action_197
			when 198 then
					--|#line 1306 "et_eiffel_parser.y"
				yy_do_action_198
			when 199 then
					--|#line 1317 "et_eiffel_parser.y"
				yy_do_action_199
			when 200 then
					--|#line 1319 "et_eiffel_parser.y"
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

	yy_do_action_201_400 (yy_act: INTEGER)
			-- Execute semantic action.
		do
			inspect yy_act
			when 201 then
					--|#line 1319 "et_eiffel_parser.y"
				yy_do_action_201
			when 202 then
					--|#line 1332 "et_eiffel_parser.y"
				yy_do_action_202
			when 203 then
					--|#line 1334 "et_eiffel_parser.y"
				yy_do_action_203
			when 204 then
					--|#line 1338 "et_eiffel_parser.y"
				yy_do_action_204
			when 205 then
					--|#line 1340 "et_eiffel_parser.y"
				yy_do_action_205
			when 206 then
					--|#line 1340 "et_eiffel_parser.y"
				yy_do_action_206
			when 207 then
					--|#line 1353 "et_eiffel_parser.y"
				yy_do_action_207
			when 208 then
					--|#line 1355 "et_eiffel_parser.y"
				yy_do_action_208
			when 209 then
					--|#line 1359 "et_eiffel_parser.y"
				yy_do_action_209
			when 210 then
					--|#line 1361 "et_eiffel_parser.y"
				yy_do_action_210
			when 211 then
					--|#line 1361 "et_eiffel_parser.y"
				yy_do_action_211
			when 212 then
					--|#line 1374 "et_eiffel_parser.y"
				yy_do_action_212
			when 213 then
					--|#line 1376 "et_eiffel_parser.y"
				yy_do_action_213
			when 214 then
					--|#line 1380 "et_eiffel_parser.y"
				yy_do_action_214
			when 215 then
					--|#line 1391 "et_eiffel_parser.y"
				yy_do_action_215
			when 216 then
					--|#line 1399 "et_eiffel_parser.y"
				yy_do_action_216
			when 217 then
					--|#line 1408 "et_eiffel_parser.y"
				yy_do_action_217
			when 218 then
					--|#line 1419 "et_eiffel_parser.y"
				yy_do_action_218
			when 219 then
					--|#line 1421 "et_eiffel_parser.y"
				yy_do_action_219
			when 220 then
					--|#line 1428 "et_eiffel_parser.y"
				yy_do_action_220
			when 221 then
					--|#line 1439 "et_eiffel_parser.y"
				yy_do_action_221
			when 222 then
					--|#line 1439 "et_eiffel_parser.y"
				yy_do_action_222
			when 223 then
					--|#line 1454 "et_eiffel_parser.y"
				yy_do_action_223
			when 224 then
					--|#line 1456 "et_eiffel_parser.y"
				yy_do_action_224
			when 225 then
					--|#line 1458 "et_eiffel_parser.y"
				yy_do_action_225
			when 226 then
					--|#line 1458 "et_eiffel_parser.y"
				yy_do_action_226
			when 227 then
					--|#line 1470 "et_eiffel_parser.y"
				yy_do_action_227
			when 228 then
					--|#line 1470 "et_eiffel_parser.y"
				yy_do_action_228
			when 229 then
					--|#line 1482 "et_eiffel_parser.y"
				yy_do_action_229
			when 230 then
					--|#line 1484 "et_eiffel_parser.y"
				yy_do_action_230
			when 231 then
					--|#line 1486 "et_eiffel_parser.y"
				yy_do_action_231
			when 232 then
					--|#line 1486 "et_eiffel_parser.y"
				yy_do_action_232
			when 233 then
					--|#line 1498 "et_eiffel_parser.y"
				yy_do_action_233
			when 234 then
					--|#line 1498 "et_eiffel_parser.y"
				yy_do_action_234
			when 235 then
					--|#line 1512 "et_eiffel_parser.y"
				yy_do_action_235
			when 236 then
					--|#line 1524 "et_eiffel_parser.y"
				yy_do_action_236
			when 237 then
					--|#line 1536 "et_eiffel_parser.y"
				yy_do_action_237
			when 238 then
					--|#line 1545 "et_eiffel_parser.y"
				yy_do_action_238
			when 239 then
					--|#line 1561 "et_eiffel_parser.y"
				yy_do_action_239
			when 240 then
					--|#line 1563 "et_eiffel_parser.y"
				yy_do_action_240
			when 241 then
					--|#line 1567 "et_eiffel_parser.y"
				yy_do_action_241
			when 242 then
					--|#line 1567 "et_eiffel_parser.y"
				yy_do_action_242
			when 243 then
					--|#line 1580 "et_eiffel_parser.y"
				yy_do_action_243
			when 244 then
					--|#line 1587 "et_eiffel_parser.y"
				yy_do_action_244
			when 245 then
					--|#line 1594 "et_eiffel_parser.y"
				yy_do_action_245
			when 246 then
					--|#line 1603 "et_eiffel_parser.y"
				yy_do_action_246
			when 247 then
					--|#line 1612 "et_eiffel_parser.y"
				yy_do_action_247
			when 248 then
					--|#line 1616 "et_eiffel_parser.y"
				yy_do_action_248
			when 249 then
					--|#line 1622 "et_eiffel_parser.y"
				yy_do_action_249
			when 250 then
					--|#line 1624 "et_eiffel_parser.y"
				yy_do_action_250
			when 251 then
					--|#line 1624 "et_eiffel_parser.y"
				yy_do_action_251
			when 252 then
					--|#line 1637 "et_eiffel_parser.y"
				yy_do_action_252
			when 253 then
					--|#line 1648 "et_eiffel_parser.y"
				yy_do_action_253
			when 254 then
					--|#line 1657 "et_eiffel_parser.y"
				yy_do_action_254
			when 255 then
					--|#line 1668 "et_eiffel_parser.y"
				yy_do_action_255
			when 256 then
					--|#line 1673 "et_eiffel_parser.y"
				yy_do_action_256
			when 257 then
					--|#line 1677 "et_eiffel_parser.y"
				yy_do_action_257
			when 258 then
					--|#line 1685 "et_eiffel_parser.y"
				yy_do_action_258
			when 259 then
					--|#line 1692 "et_eiffel_parser.y"
				yy_do_action_259
			when 260 then
					--|#line 1701 "et_eiffel_parser.y"
				yy_do_action_260
			when 261 then
					--|#line 1708 "et_eiffel_parser.y"
				yy_do_action_261
			when 262 then
					--|#line 1717 "et_eiffel_parser.y"
				yy_do_action_262
			when 263 then
					--|#line 1722 "et_eiffel_parser.y"
				yy_do_action_263
			when 264 then
					--|#line 1729 "et_eiffel_parser.y"
				yy_do_action_264
			when 265 then
					--|#line 1730 "et_eiffel_parser.y"
				yy_do_action_265
			when 266 then
					--|#line 1731 "et_eiffel_parser.y"
				yy_do_action_266
			when 267 then
					--|#line 1732 "et_eiffel_parser.y"
				yy_do_action_267
			when 268 then
					--|#line 1737 "et_eiffel_parser.y"
				yy_do_action_268
			when 269 then
					--|#line 1742 "et_eiffel_parser.y"
				yy_do_action_269
			when 270 then
					--|#line 1750 "et_eiffel_parser.y"
				yy_do_action_270
			when 271 then
					--|#line 1755 "et_eiffel_parser.y"
				yy_do_action_271
			when 272 then
					--|#line 1761 "et_eiffel_parser.y"
				yy_do_action_272
			when 273 then
					--|#line 1769 "et_eiffel_parser.y"
				yy_do_action_273
			when 274 then
					--|#line 1780 "et_eiffel_parser.y"
				yy_do_action_274
			when 275 then
					--|#line 1785 "et_eiffel_parser.y"
				yy_do_action_275
			when 276 then
					--|#line 1793 "et_eiffel_parser.y"
				yy_do_action_276
			when 277 then
					--|#line 1798 "et_eiffel_parser.y"
				yy_do_action_277
			when 278 then
					--|#line 1804 "et_eiffel_parser.y"
				yy_do_action_278
			when 279 then
					--|#line 1812 "et_eiffel_parser.y"
				yy_do_action_279
			when 280 then
					--|#line 1823 "et_eiffel_parser.y"
				yy_do_action_280
			when 281 then
					--|#line 1825 "et_eiffel_parser.y"
				yy_do_action_281
			when 282 then
					--|#line 1827 "et_eiffel_parser.y"
				yy_do_action_282
			when 283 then
					--|#line 1831 "et_eiffel_parser.y"
				yy_do_action_283
			when 284 then
					--|#line 1833 "et_eiffel_parser.y"
				yy_do_action_284
			when 285 then
					--|#line 1841 "et_eiffel_parser.y"
				yy_do_action_285
			when 286 then
					--|#line 1843 "et_eiffel_parser.y"
				yy_do_action_286
			when 287 then
					--|#line 1851 "et_eiffel_parser.y"
				yy_do_action_287
			when 288 then
					--|#line 1854 "et_eiffel_parser.y"
				yy_do_action_288
			when 289 then
					--|#line 1863 "et_eiffel_parser.y"
				yy_do_action_289
			when 290 then
					--|#line 1867 "et_eiffel_parser.y"
				yy_do_action_290
			when 291 then
					--|#line 1877 "et_eiffel_parser.y"
				yy_do_action_291
			when 292 then
					--|#line 1880 "et_eiffel_parser.y"
				yy_do_action_292
			when 293 then
					--|#line 1889 "et_eiffel_parser.y"
				yy_do_action_293
			when 294 then
					--|#line 1893 "et_eiffel_parser.y"
				yy_do_action_294
			when 295 then
					--|#line 1903 "et_eiffel_parser.y"
				yy_do_action_295
			when 296 then
					--|#line 1905 "et_eiffel_parser.y"
				yy_do_action_296
			when 297 then
					--|#line 1913 "et_eiffel_parser.y"
				yy_do_action_297
			when 298 then
					--|#line 1916 "et_eiffel_parser.y"
				yy_do_action_298
			when 299 then
					--|#line 1925 "et_eiffel_parser.y"
				yy_do_action_299
			when 300 then
					--|#line 1928 "et_eiffel_parser.y"
				yy_do_action_300
			when 301 then
					--|#line 1937 "et_eiffel_parser.y"
				yy_do_action_301
			when 302 then
					--|#line 1941 "et_eiffel_parser.y"
				yy_do_action_302
			when 303 then
					--|#line 1953 "et_eiffel_parser.y"
				yy_do_action_303
			when 304 then
					--|#line 1956 "et_eiffel_parser.y"
				yy_do_action_304
			when 305 then
					--|#line 1960 "et_eiffel_parser.y"
				yy_do_action_305
			when 306 then
					--|#line 1963 "et_eiffel_parser.y"
				yy_do_action_306
			when 307 then
					--|#line 1967 "et_eiffel_parser.y"
				yy_do_action_307
			when 308 then
					--|#line 1969 "et_eiffel_parser.y"
				yy_do_action_308
			when 309 then
					--|#line 1972 "et_eiffel_parser.y"
				yy_do_action_309
			when 310 then
					--|#line 1975 "et_eiffel_parser.y"
				yy_do_action_310
			when 311 then
					--|#line 1981 "et_eiffel_parser.y"
				yy_do_action_311
			when 312 then
					--|#line 1989 "et_eiffel_parser.y"
				yy_do_action_312
			when 313 then
					--|#line 1993 "et_eiffel_parser.y"
				yy_do_action_313
			when 314 then
					--|#line 1995 "et_eiffel_parser.y"
				yy_do_action_314
			when 315 then
					--|#line 1999 "et_eiffel_parser.y"
				yy_do_action_315
			when 316 then
					--|#line 2001 "et_eiffel_parser.y"
				yy_do_action_316
			when 317 then
					--|#line 2005 "et_eiffel_parser.y"
				yy_do_action_317
			when 318 then
					--|#line 2007 "et_eiffel_parser.y"
				yy_do_action_318
			when 319 then
					--|#line 2013 "et_eiffel_parser.y"
				yy_do_action_319
			when 320 then
					--|#line 2020 "et_eiffel_parser.y"
				yy_do_action_320
			when 321 then
					--|#line 2022 "et_eiffel_parser.y"
				yy_do_action_321
			when 322 then
					--|#line 2024 "et_eiffel_parser.y"
				yy_do_action_322
			when 323 then
					--|#line 2026 "et_eiffel_parser.y"
				yy_do_action_323
			when 324 then
					--|#line 2028 "et_eiffel_parser.y"
				yy_do_action_324
			when 325 then
					--|#line 2030 "et_eiffel_parser.y"
				yy_do_action_325
			when 326 then
					--|#line 2032 "et_eiffel_parser.y"
				yy_do_action_326
			when 327 then
					--|#line 2034 "et_eiffel_parser.y"
				yy_do_action_327
			when 328 then
					--|#line 2036 "et_eiffel_parser.y"
				yy_do_action_328
			when 329 then
					--|#line 2038 "et_eiffel_parser.y"
				yy_do_action_329
			when 330 then
					--|#line 2040 "et_eiffel_parser.y"
				yy_do_action_330
			when 331 then
					--|#line 2042 "et_eiffel_parser.y"
				yy_do_action_331
			when 332 then
					--|#line 2044 "et_eiffel_parser.y"
				yy_do_action_332
			when 333 then
					--|#line 2046 "et_eiffel_parser.y"
				yy_do_action_333
			when 334 then
					--|#line 2048 "et_eiffel_parser.y"
				yy_do_action_334
			when 335 then
					--|#line 2050 "et_eiffel_parser.y"
				yy_do_action_335
			when 336 then
					--|#line 2052 "et_eiffel_parser.y"
				yy_do_action_336
			when 337 then
					--|#line 2054 "et_eiffel_parser.y"
				yy_do_action_337
			when 338 then
					--|#line 2056 "et_eiffel_parser.y"
				yy_do_action_338
			when 339 then
					--|#line 2058 "et_eiffel_parser.y"
				yy_do_action_339
			when 340 then
					--|#line 2060 "et_eiffel_parser.y"
				yy_do_action_340
			when 341 then
					--|#line 2062 "et_eiffel_parser.y"
				yy_do_action_341
			when 342 then
					--|#line 2065 "et_eiffel_parser.y"
				yy_do_action_342
			when 343 then
					--|#line 2067 "et_eiffel_parser.y"
				yy_do_action_343
			when 344 then
					--|#line 2069 "et_eiffel_parser.y"
				yy_do_action_344
			when 345 then
					--|#line 2071 "et_eiffel_parser.y"
				yy_do_action_345
			when 346 then
					--|#line 2073 "et_eiffel_parser.y"
				yy_do_action_346
			when 347 then
					--|#line 2075 "et_eiffel_parser.y"
				yy_do_action_347
			when 348 then
					--|#line 2077 "et_eiffel_parser.y"
				yy_do_action_348
			when 349 then
					--|#line 2079 "et_eiffel_parser.y"
				yy_do_action_349
			when 350 then
					--|#line 2081 "et_eiffel_parser.y"
				yy_do_action_350
			when 351 then
					--|#line 2083 "et_eiffel_parser.y"
				yy_do_action_351
			when 352 then
					--|#line 2085 "et_eiffel_parser.y"
				yy_do_action_352
			when 353 then
					--|#line 2087 "et_eiffel_parser.y"
				yy_do_action_353
			when 354 then
					--|#line 2089 "et_eiffel_parser.y"
				yy_do_action_354
			when 355 then
					--|#line 2091 "et_eiffel_parser.y"
				yy_do_action_355
			when 356 then
					--|#line 2093 "et_eiffel_parser.y"
				yy_do_action_356
			when 357 then
					--|#line 2095 "et_eiffel_parser.y"
				yy_do_action_357
			when 358 then
					--|#line 2097 "et_eiffel_parser.y"
				yy_do_action_358
			when 359 then
					--|#line 2099 "et_eiffel_parser.y"
				yy_do_action_359
			when 360 then
					--|#line 2103 "et_eiffel_parser.y"
				yy_do_action_360
			when 361 then
					--|#line 2105 "et_eiffel_parser.y"
				yy_do_action_361
			when 362 then
					--|#line 2116 "et_eiffel_parser.y"
				yy_do_action_362
			when 363 then
					--|#line 2118 "et_eiffel_parser.y"
				yy_do_action_363
			when 364 then
					--|#line 2120 "et_eiffel_parser.y"
				yy_do_action_364
			when 365 then
					--|#line 2122 "et_eiffel_parser.y"
				yy_do_action_365
			when 366 then
					--|#line 2124 "et_eiffel_parser.y"
				yy_do_action_366
			when 367 then
					--|#line 2126 "et_eiffel_parser.y"
				yy_do_action_367
			when 368 then
					--|#line 2128 "et_eiffel_parser.y"
				yy_do_action_368
			when 369 then
					--|#line 2130 "et_eiffel_parser.y"
				yy_do_action_369
			when 370 then
					--|#line 2132 "et_eiffel_parser.y"
				yy_do_action_370
			when 371 then
					--|#line 2134 "et_eiffel_parser.y"
				yy_do_action_371
			when 372 then
					--|#line 2136 "et_eiffel_parser.y"
				yy_do_action_372
			when 373 then
					--|#line 2138 "et_eiffel_parser.y"
				yy_do_action_373
			when 374 then
					--|#line 2140 "et_eiffel_parser.y"
				yy_do_action_374
			when 375 then
					--|#line 2142 "et_eiffel_parser.y"
				yy_do_action_375
			when 376 then
					--|#line 2144 "et_eiffel_parser.y"
				yy_do_action_376
			when 377 then
					--|#line 2146 "et_eiffel_parser.y"
				yy_do_action_377
			when 378 then
					--|#line 2148 "et_eiffel_parser.y"
				yy_do_action_378
			when 379 then
					--|#line 2150 "et_eiffel_parser.y"
				yy_do_action_379
			when 380 then
					--|#line 2152 "et_eiffel_parser.y"
				yy_do_action_380
			when 381 then
					--|#line 2154 "et_eiffel_parser.y"
				yy_do_action_381
			when 382 then
					--|#line 2156 "et_eiffel_parser.y"
				yy_do_action_382
			when 383 then
					--|#line 2158 "et_eiffel_parser.y"
				yy_do_action_383
			when 384 then
					--|#line 2160 "et_eiffel_parser.y"
				yy_do_action_384
			when 385 then
					--|#line 2166 "et_eiffel_parser.y"
				yy_do_action_385
			when 386 then
					--|#line 2173 "et_eiffel_parser.y"
				yy_do_action_386
			when 387 then
					--|#line 2175 "et_eiffel_parser.y"
				yy_do_action_387
			when 388 then
					--|#line 2183 "et_eiffel_parser.y"
				yy_do_action_388
			when 389 then
					--|#line 2194 "et_eiffel_parser.y"
				yy_do_action_389
			when 390 then
					--|#line 2201 "et_eiffel_parser.y"
				yy_do_action_390
			when 391 then
					--|#line 2208 "et_eiffel_parser.y"
				yy_do_action_391
			when 392 then
					--|#line 2218 "et_eiffel_parser.y"
				yy_do_action_392
			when 393 then
					--|#line 2229 "et_eiffel_parser.y"
				yy_do_action_393
			when 394 then
					--|#line 2236 "et_eiffel_parser.y"
				yy_do_action_394
			when 395 then
					--|#line 2245 "et_eiffel_parser.y"
				yy_do_action_395
			when 396 then
					--|#line 2254 "et_eiffel_parser.y"
				yy_do_action_396
			when 397 then
					--|#line 2263 "et_eiffel_parser.y"
				yy_do_action_397
			when 398 then
					--|#line 2272 "et_eiffel_parser.y"
				yy_do_action_398
			when 399 then
					--|#line 2283 "et_eiffel_parser.y"
				yy_do_action_399
			when 400 then
					--|#line 2285 "et_eiffel_parser.y"
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

	yy_do_action_401_600 (yy_act: INTEGER)
			-- Execute semantic action.
		do
			inspect yy_act
			when 401 then
					--|#line 2287 "et_eiffel_parser.y"
				yy_do_action_401
			when 402 then
					--|#line 2287 "et_eiffel_parser.y"
				yy_do_action_402
			when 403 then
					--|#line 2300 "et_eiffel_parser.y"
				yy_do_action_403
			when 404 then
					--|#line 2307 "et_eiffel_parser.y"
				yy_do_action_404
			when 405 then
					--|#line 2314 "et_eiffel_parser.y"
				yy_do_action_405
			when 406 then
					--|#line 2324 "et_eiffel_parser.y"
				yy_do_action_406
			when 407 then
					--|#line 2335 "et_eiffel_parser.y"
				yy_do_action_407
			when 408 then
					--|#line 2342 "et_eiffel_parser.y"
				yy_do_action_408
			when 409 then
					--|#line 2351 "et_eiffel_parser.y"
				yy_do_action_409
			when 410 then
					--|#line 2360 "et_eiffel_parser.y"
				yy_do_action_410
			when 411 then
					--|#line 2369 "et_eiffel_parser.y"
				yy_do_action_411
			when 412 then
					--|#line 2378 "et_eiffel_parser.y"
				yy_do_action_412
			when 413 then
					--|#line 2389 "et_eiffel_parser.y"
				yy_do_action_413
			when 414 then
					--|#line 2391 "et_eiffel_parser.y"
				yy_do_action_414
			when 415 then
					--|#line 2393 "et_eiffel_parser.y"
				yy_do_action_415
			when 416 then
					--|#line 2395 "et_eiffel_parser.y"
				yy_do_action_416
			when 417 then
					--|#line 2397 "et_eiffel_parser.y"
				yy_do_action_417
			when 418 then
					--|#line 2399 "et_eiffel_parser.y"
				yy_do_action_418
			when 419 then
					--|#line 2401 "et_eiffel_parser.y"
				yy_do_action_419
			when 420 then
					--|#line 2403 "et_eiffel_parser.y"
				yy_do_action_420
			when 421 then
					--|#line 2407 "et_eiffel_parser.y"
				yy_do_action_421
			when 422 then
					--|#line 2411 "et_eiffel_parser.y"
				yy_do_action_422
			when 423 then
					--|#line 2413 "et_eiffel_parser.y"
				yy_do_action_423
			when 424 then
					--|#line 2415 "et_eiffel_parser.y"
				yy_do_action_424
			when 425 then
					--|#line 2417 "et_eiffel_parser.y"
				yy_do_action_425
			when 426 then
					--|#line 2419 "et_eiffel_parser.y"
				yy_do_action_426
			when 427 then
					--|#line 2423 "et_eiffel_parser.y"
				yy_do_action_427
			when 428 then
					--|#line 2425 "et_eiffel_parser.y"
				yy_do_action_428
			when 429 then
					--|#line 2427 "et_eiffel_parser.y"
				yy_do_action_429
			when 430 then
					--|#line 2429 "et_eiffel_parser.y"
				yy_do_action_430
			when 431 then
					--|#line 2431 "et_eiffel_parser.y"
				yy_do_action_431
			when 432 then
					--|#line 2435 "et_eiffel_parser.y"
				yy_do_action_432
			when 433 then
					--|#line 2437 "et_eiffel_parser.y"
				yy_do_action_433
			when 434 then
					--|#line 2441 "et_eiffel_parser.y"
				yy_do_action_434
			when 435 then
					--|#line 2443 "et_eiffel_parser.y"
				yy_do_action_435
			when 436 then
					--|#line 2447 "et_eiffel_parser.y"
				yy_do_action_436
			when 437 then
					--|#line 2451 "et_eiffel_parser.y"
				yy_do_action_437
			when 438 then
					--|#line 2453 "et_eiffel_parser.y"
				yy_do_action_438
			when 439 then
					--|#line 2457 "et_eiffel_parser.y"
				yy_do_action_439
			when 440 then
					--|#line 2459 "et_eiffel_parser.y"
				yy_do_action_440
			when 441 then
					--|#line 2463 "et_eiffel_parser.y"
				yy_do_action_441
			when 442 then
					--|#line 2465 "et_eiffel_parser.y"
				yy_do_action_442
			when 443 then
					--|#line 2469 "et_eiffel_parser.y"
				yy_do_action_443
			when 444 then
					--|#line 2471 "et_eiffel_parser.y"
				yy_do_action_444
			when 445 then
					--|#line 2477 "et_eiffel_parser.y"
				yy_do_action_445
			when 446 then
					--|#line 2479 "et_eiffel_parser.y"
				yy_do_action_446
			when 447 then
					--|#line 2485 "et_eiffel_parser.y"
				yy_do_action_447
			when 448 then
					--|#line 2487 "et_eiffel_parser.y"
				yy_do_action_448
			when 449 then
					--|#line 2491 "et_eiffel_parser.y"
				yy_do_action_449
			when 450 then
					--|#line 2493 "et_eiffel_parser.y"
				yy_do_action_450
			when 451 then
					--|#line 2495 "et_eiffel_parser.y"
				yy_do_action_451
			when 452 then
					--|#line 2497 "et_eiffel_parser.y"
				yy_do_action_452
			when 453 then
					--|#line 2499 "et_eiffel_parser.y"
				yy_do_action_453
			when 454 then
					--|#line 2501 "et_eiffel_parser.y"
				yy_do_action_454
			when 455 then
					--|#line 2503 "et_eiffel_parser.y"
				yy_do_action_455
			when 456 then
					--|#line 2505 "et_eiffel_parser.y"
				yy_do_action_456
			when 457 then
					--|#line 2507 "et_eiffel_parser.y"
				yy_do_action_457
			when 458 then
					--|#line 2509 "et_eiffel_parser.y"
				yy_do_action_458
			when 459 then
					--|#line 2511 "et_eiffel_parser.y"
				yy_do_action_459
			when 460 then
					--|#line 2513 "et_eiffel_parser.y"
				yy_do_action_460
			when 461 then
					--|#line 2515 "et_eiffel_parser.y"
				yy_do_action_461
			when 462 then
					--|#line 2517 "et_eiffel_parser.y"
				yy_do_action_462
			when 463 then
					--|#line 2519 "et_eiffel_parser.y"
				yy_do_action_463
			when 464 then
					--|#line 2521 "et_eiffel_parser.y"
				yy_do_action_464
			when 465 then
					--|#line 2523 "et_eiffel_parser.y"
				yy_do_action_465
			when 466 then
					--|#line 2525 "et_eiffel_parser.y"
				yy_do_action_466
			when 467 then
					--|#line 2527 "et_eiffel_parser.y"
				yy_do_action_467
			when 468 then
					--|#line 2529 "et_eiffel_parser.y"
				yy_do_action_468
			when 469 then
					--|#line 2531 "et_eiffel_parser.y"
				yy_do_action_469
			when 470 then
					--|#line 2533 "et_eiffel_parser.y"
				yy_do_action_470
			when 471 then
					--|#line 2535 "et_eiffel_parser.y"
				yy_do_action_471
			when 472 then
					--|#line 2539 "et_eiffel_parser.y"
				yy_do_action_472
			when 473 then
					--|#line 2541 "et_eiffel_parser.y"
				yy_do_action_473
			when 474 then
					--|#line 2543 "et_eiffel_parser.y"
				yy_do_action_474
			when 475 then
					--|#line 2545 "et_eiffel_parser.y"
				yy_do_action_475
			when 476 then
					--|#line 2547 "et_eiffel_parser.y"
				yy_do_action_476
			when 477 then
					--|#line 2549 "et_eiffel_parser.y"
				yy_do_action_477
			when 478 then
					--|#line 2551 "et_eiffel_parser.y"
				yy_do_action_478
			when 479 then
					--|#line 2553 "et_eiffel_parser.y"
				yy_do_action_479
			when 480 then
					--|#line 2555 "et_eiffel_parser.y"
				yy_do_action_480
			when 481 then
					--|#line 2557 "et_eiffel_parser.y"
				yy_do_action_481
			when 482 then
					--|#line 2559 "et_eiffel_parser.y"
				yy_do_action_482
			when 483 then
					--|#line 2561 "et_eiffel_parser.y"
				yy_do_action_483
			when 484 then
					--|#line 2563 "et_eiffel_parser.y"
				yy_do_action_484
			when 485 then
					--|#line 2565 "et_eiffel_parser.y"
				yy_do_action_485
			when 486 then
					--|#line 2567 "et_eiffel_parser.y"
				yy_do_action_486
			when 487 then
					--|#line 2569 "et_eiffel_parser.y"
				yy_do_action_487
			when 488 then
					--|#line 2571 "et_eiffel_parser.y"
				yy_do_action_488
			when 489 then
					--|#line 2573 "et_eiffel_parser.y"
				yy_do_action_489
			when 490 then
					--|#line 2575 "et_eiffel_parser.y"
				yy_do_action_490
			when 491 then
					--|#line 2577 "et_eiffel_parser.y"
				yy_do_action_491
			when 492 then
					--|#line 2579 "et_eiffel_parser.y"
				yy_do_action_492
			when 493 then
					--|#line 2581 "et_eiffel_parser.y"
				yy_do_action_493
			when 494 then
					--|#line 2583 "et_eiffel_parser.y"
				yy_do_action_494
			when 495 then
					--|#line 2587 "et_eiffel_parser.y"
				yy_do_action_495
			when 496 then
					--|#line 2589 "et_eiffel_parser.y"
				yy_do_action_496
			when 497 then
					--|#line 2591 "et_eiffel_parser.y"
				yy_do_action_497
			when 498 then
					--|#line 2593 "et_eiffel_parser.y"
				yy_do_action_498
			when 499 then
					--|#line 2595 "et_eiffel_parser.y"
				yy_do_action_499
			when 500 then
					--|#line 2597 "et_eiffel_parser.y"
				yy_do_action_500
			when 501 then
					--|#line 2599 "et_eiffel_parser.y"
				yy_do_action_501
			when 502 then
					--|#line 2601 "et_eiffel_parser.y"
				yy_do_action_502
			when 503 then
					--|#line 2603 "et_eiffel_parser.y"
				yy_do_action_503
			when 504 then
					--|#line 2605 "et_eiffel_parser.y"
				yy_do_action_504
			when 505 then
					--|#line 2607 "et_eiffel_parser.y"
				yy_do_action_505
			when 506 then
					--|#line 2609 "et_eiffel_parser.y"
				yy_do_action_506
			when 507 then
					--|#line 2611 "et_eiffel_parser.y"
				yy_do_action_507
			when 508 then
					--|#line 2613 "et_eiffel_parser.y"
				yy_do_action_508
			when 509 then
					--|#line 2615 "et_eiffel_parser.y"
				yy_do_action_509
			when 510 then
					--|#line 2617 "et_eiffel_parser.y"
				yy_do_action_510
			when 511 then
					--|#line 2619 "et_eiffel_parser.y"
				yy_do_action_511
			when 512 then
					--|#line 2621 "et_eiffel_parser.y"
				yy_do_action_512
			when 513 then
					--|#line 2623 "et_eiffel_parser.y"
				yy_do_action_513
			when 514 then
					--|#line 2625 "et_eiffel_parser.y"
				yy_do_action_514
			when 515 then
					--|#line 2627 "et_eiffel_parser.y"
				yy_do_action_515
			when 516 then
					--|#line 2629 "et_eiffel_parser.y"
				yy_do_action_516
			when 517 then
					--|#line 2631 "et_eiffel_parser.y"
				yy_do_action_517
			when 518 then
					--|#line 2633 "et_eiffel_parser.y"
				yy_do_action_518
			when 519 then
					--|#line 2637 "et_eiffel_parser.y"
				yy_do_action_519
			when 520 then
					--|#line 2639 "et_eiffel_parser.y"
				yy_do_action_520
			when 521 then
					--|#line 2643 "et_eiffel_parser.y"
				yy_do_action_521
			when 522 then
					--|#line 2645 "et_eiffel_parser.y"
				yy_do_action_522
			when 523 then
					--|#line 2649 "et_eiffel_parser.y"
				yy_do_action_523
			when 524 then
					--|#line 2652 "et_eiffel_parser.y"
				yy_do_action_524
			when 525 then
					--|#line 2660 "et_eiffel_parser.y"
				yy_do_action_525
			when 526 then
					--|#line 2667 "et_eiffel_parser.y"
				yy_do_action_526
			when 527 then
					--|#line 2678 "et_eiffel_parser.y"
				yy_do_action_527
			when 528 then
					--|#line 2683 "et_eiffel_parser.y"
				yy_do_action_528
			when 529 then
					--|#line 2688 "et_eiffel_parser.y"
				yy_do_action_529
			when 530 then
					--|#line 2693 "et_eiffel_parser.y"
				yy_do_action_530
			when 531 then
					--|#line 2700 "et_eiffel_parser.y"
				yy_do_action_531
			when 532 then
					--|#line 2706 "et_eiffel_parser.y"
				yy_do_action_532
			when 533 then
					--|#line 2715 "et_eiffel_parser.y"
				yy_do_action_533
			when 534 then
					--|#line 2717 "et_eiffel_parser.y"
				yy_do_action_534
			when 535 then
					--|#line 2721 "et_eiffel_parser.y"
				yy_do_action_535
			when 536 then
					--|#line 2724 "et_eiffel_parser.y"
				yy_do_action_536
			when 537 then
					--|#line 2730 "et_eiffel_parser.y"
				yy_do_action_537
			when 538 then
					--|#line 2738 "et_eiffel_parser.y"
				yy_do_action_538
			when 539 then
					--|#line 2743 "et_eiffel_parser.y"
				yy_do_action_539
			when 540 then
					--|#line 2748 "et_eiffel_parser.y"
				yy_do_action_540
			when 541 then
					--|#line 2753 "et_eiffel_parser.y"
				yy_do_action_541
			when 542 then
					--|#line 2764 "et_eiffel_parser.y"
				yy_do_action_542
			when 543 then
					--|#line 2775 "et_eiffel_parser.y"
				yy_do_action_543
			when 544 then
					--|#line 2788 "et_eiffel_parser.y"
				yy_do_action_544
			when 545 then
					--|#line 2797 "et_eiffel_parser.y"
				yy_do_action_545
			when 546 then
					--|#line 2806 "et_eiffel_parser.y"
				yy_do_action_546
			when 547 then
					--|#line 2808 "et_eiffel_parser.y"
				yy_do_action_547
			when 548 then
					--|#line 2810 "et_eiffel_parser.y"
				yy_do_action_548
			when 549 then
					--|#line 2814 "et_eiffel_parser.y"
				yy_do_action_549
			when 550 then
					--|#line 2816 "et_eiffel_parser.y"
				yy_do_action_550
			when 551 then
					--|#line 2818 "et_eiffel_parser.y"
				yy_do_action_551
			when 552 then
					--|#line 2820 "et_eiffel_parser.y"
				yy_do_action_552
			when 553 then
					--|#line 2822 "et_eiffel_parser.y"
				yy_do_action_553
			when 554 then
					--|#line 2824 "et_eiffel_parser.y"
				yy_do_action_554
			when 555 then
					--|#line 2826 "et_eiffel_parser.y"
				yy_do_action_555
			when 556 then
					--|#line 2828 "et_eiffel_parser.y"
				yy_do_action_556
			when 557 then
					--|#line 2830 "et_eiffel_parser.y"
				yy_do_action_557
			when 558 then
					--|#line 2832 "et_eiffel_parser.y"
				yy_do_action_558
			when 559 then
					--|#line 2834 "et_eiffel_parser.y"
				yy_do_action_559
			when 560 then
					--|#line 2836 "et_eiffel_parser.y"
				yy_do_action_560
			when 561 then
					--|#line 2838 "et_eiffel_parser.y"
				yy_do_action_561
			when 562 then
					--|#line 2840 "et_eiffel_parser.y"
				yy_do_action_562
			when 563 then
					--|#line 2842 "et_eiffel_parser.y"
				yy_do_action_563
			when 564 then
					--|#line 2844 "et_eiffel_parser.y"
				yy_do_action_564
			when 565 then
					--|#line 2846 "et_eiffel_parser.y"
				yy_do_action_565
			when 566 then
					--|#line 2848 "et_eiffel_parser.y"
				yy_do_action_566
			when 567 then
					--|#line 2850 "et_eiffel_parser.y"
				yy_do_action_567
			when 568 then
					--|#line 2852 "et_eiffel_parser.y"
				yy_do_action_568
			when 569 then
					--|#line 2854 "et_eiffel_parser.y"
				yy_do_action_569
			when 570 then
					--|#line 2858 "et_eiffel_parser.y"
				yy_do_action_570
			when 571 then
					--|#line 2860 "et_eiffel_parser.y"
				yy_do_action_571
			when 572 then
					--|#line 2864 "et_eiffel_parser.y"
				yy_do_action_572
			when 573 then
					--|#line 2866 "et_eiffel_parser.y"
				yy_do_action_573
			when 574 then
					--|#line 2868 "et_eiffel_parser.y"
				yy_do_action_574
			when 575 then
					--|#line 2870 "et_eiffel_parser.y"
				yy_do_action_575
			when 576 then
					--|#line 2872 "et_eiffel_parser.y"
				yy_do_action_576
			when 577 then
					--|#line 2874 "et_eiffel_parser.y"
				yy_do_action_577
			when 578 then
					--|#line 2876 "et_eiffel_parser.y"
				yy_do_action_578
			when 579 then
					--|#line 2884 "et_eiffel_parser.y"
				yy_do_action_579
			when 580 then
					--|#line 2892 "et_eiffel_parser.y"
				yy_do_action_580
			when 581 then
					--|#line 2900 "et_eiffel_parser.y"
				yy_do_action_581
			when 582 then
					--|#line 2908 "et_eiffel_parser.y"
				yy_do_action_582
			when 583 then
					--|#line 2910 "et_eiffel_parser.y"
				yy_do_action_583
			when 584 then
					--|#line 2912 "et_eiffel_parser.y"
				yy_do_action_584
			when 585 then
					--|#line 2914 "et_eiffel_parser.y"
				yy_do_action_585
			when 586 then
					--|#line 2916 "et_eiffel_parser.y"
				yy_do_action_586
			when 587 then
					--|#line 2918 "et_eiffel_parser.y"
				yy_do_action_587
			when 588 then
					--|#line 2920 "et_eiffel_parser.y"
				yy_do_action_588
			when 589 then
					--|#line 2922 "et_eiffel_parser.y"
				yy_do_action_589
			when 590 then
					--|#line 2924 "et_eiffel_parser.y"
				yy_do_action_590
			when 591 then
					--|#line 2930 "et_eiffel_parser.y"
				yy_do_action_591
			when 592 then
					--|#line 2934 "et_eiffel_parser.y"
				yy_do_action_592
			when 593 then
					--|#line 2938 "et_eiffel_parser.y"
				yy_do_action_593
			when 594 then
					--|#line 2942 "et_eiffel_parser.y"
				yy_do_action_594
			when 595 then
					--|#line 2946 "et_eiffel_parser.y"
				yy_do_action_595
			when 596 then
					--|#line 2950 "et_eiffel_parser.y"
				yy_do_action_596
			when 597 then
					--|#line 2954 "et_eiffel_parser.y"
				yy_do_action_597
			when 598 then
					--|#line 2958 "et_eiffel_parser.y"
				yy_do_action_598
			when 599 then
					--|#line 2962 "et_eiffel_parser.y"
				yy_do_action_599
			when 600 then
					--|#line 2964 "et_eiffel_parser.y"
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

	yy_do_action_601_800 (yy_act: INTEGER)
			-- Execute semantic action.
		do
			inspect yy_act
			when 601 then
					--|#line 2968 "et_eiffel_parser.y"
				yy_do_action_601
			when 602 then
					--|#line 2972 "et_eiffel_parser.y"
				yy_do_action_602
			when 603 then
					--|#line 2979 "et_eiffel_parser.y"
				yy_do_action_603
			when 604 then
					--|#line 2981 "et_eiffel_parser.y"
				yy_do_action_604
			when 605 then
					--|#line 2985 "et_eiffel_parser.y"
				yy_do_action_605
			when 606 then
					--|#line 2987 "et_eiffel_parser.y"
				yy_do_action_606
			when 607 then
					--|#line 2991 "et_eiffel_parser.y"
				yy_do_action_607
			when 608 then
					--|#line 3002 "et_eiffel_parser.y"
				yy_do_action_608
			when 609 then
					--|#line 3002 "et_eiffel_parser.y"
				yy_do_action_609
			when 610 then
					--|#line 3023 "et_eiffel_parser.y"
				yy_do_action_610
			when 611 then
					--|#line 3025 "et_eiffel_parser.y"
				yy_do_action_611
			when 612 then
					--|#line 3027 "et_eiffel_parser.y"
				yy_do_action_612
			when 613 then
					--|#line 3029 "et_eiffel_parser.y"
				yy_do_action_613
			when 614 then
					--|#line 3031 "et_eiffel_parser.y"
				yy_do_action_614
			when 615 then
					--|#line 3033 "et_eiffel_parser.y"
				yy_do_action_615
			when 616 then
					--|#line 3035 "et_eiffel_parser.y"
				yy_do_action_616
			when 617 then
					--|#line 3037 "et_eiffel_parser.y"
				yy_do_action_617
			when 618 then
					--|#line 3039 "et_eiffel_parser.y"
				yy_do_action_618
			when 619 then
					--|#line 3041 "et_eiffel_parser.y"
				yy_do_action_619
			when 620 then
					--|#line 3043 "et_eiffel_parser.y"
				yy_do_action_620
			when 621 then
					--|#line 3051 "et_eiffel_parser.y"
				yy_do_action_621
			when 622 then
					--|#line 3064 "et_eiffel_parser.y"
				yy_do_action_622
			when 623 then
					--|#line 3066 "et_eiffel_parser.y"
				yy_do_action_623
			when 624 then
					--|#line 3068 "et_eiffel_parser.y"
				yy_do_action_624
			when 625 then
					--|#line 3070 "et_eiffel_parser.y"
				yy_do_action_625
			when 626 then
					--|#line 3072 "et_eiffel_parser.y"
				yy_do_action_626
			when 627 then
					--|#line 3078 "et_eiffel_parser.y"
				yy_do_action_627
			when 628 then
					--|#line 3080 "et_eiffel_parser.y"
				yy_do_action_628
			when 629 then
					--|#line 3082 "et_eiffel_parser.y"
				yy_do_action_629
			when 630 then
					--|#line 3084 "et_eiffel_parser.y"
				yy_do_action_630
			when 631 then
					--|#line 3090 "et_eiffel_parser.y"
				yy_do_action_631
			when 632 then
					--|#line 3092 "et_eiffel_parser.y"
				yy_do_action_632
			when 633 then
					--|#line 3094 "et_eiffel_parser.y"
				yy_do_action_633
			when 634 then
					--|#line 3096 "et_eiffel_parser.y"
				yy_do_action_634
			when 635 then
					--|#line 3100 "et_eiffel_parser.y"
				yy_do_action_635
			when 636 then
					--|#line 3102 "et_eiffel_parser.y"
				yy_do_action_636
			when 637 then
					--|#line 3104 "et_eiffel_parser.y"
				yy_do_action_637
			when 638 then
					--|#line 3106 "et_eiffel_parser.y"
				yy_do_action_638
			when 639 then
					--|#line 3110 "et_eiffel_parser.y"
				yy_do_action_639
			when 640 then
					--|#line 3112 "et_eiffel_parser.y"
				yy_do_action_640
			when 641 then
					--|#line 3116 "et_eiffel_parser.y"
				yy_do_action_641
			when 642 then
					--|#line 3117 "et_eiffel_parser.y"
				yy_do_action_642
			when 643 then
					--|#line 3122 "et_eiffel_parser.y"
				yy_do_action_643
			when 644 then
					--|#line 3124 "et_eiffel_parser.y"
				yy_do_action_644
			when 645 then
					--|#line 3126 "et_eiffel_parser.y"
				yy_do_action_645
			when 646 then
					--|#line 3128 "et_eiffel_parser.y"
				yy_do_action_646
			when 647 then
					--|#line 3132 "et_eiffel_parser.y"
				yy_do_action_647
			when 648 then
					--|#line 3139 "et_eiffel_parser.y"
				yy_do_action_648
			when 649 then
					--|#line 3146 "et_eiffel_parser.y"
				yy_do_action_649
			when 650 then
					--|#line 3155 "et_eiffel_parser.y"
				yy_do_action_650
			when 651 then
					--|#line 3166 "et_eiffel_parser.y"
				yy_do_action_651
			when 652 then
					--|#line 3168 "et_eiffel_parser.y"
				yy_do_action_652
			when 653 then
					--|#line 3172 "et_eiffel_parser.y"
				yy_do_action_653
			when 654 then
					--|#line 3174 "et_eiffel_parser.y"
				yy_do_action_654
			when 655 then
					--|#line 3181 "et_eiffel_parser.y"
				yy_do_action_655
			when 656 then
					--|#line 3188 "et_eiffel_parser.y"
				yy_do_action_656
			when 657 then
					--|#line 3197 "et_eiffel_parser.y"
				yy_do_action_657
			when 658 then
					--|#line 3206 "et_eiffel_parser.y"
				yy_do_action_658
			when 659 then
					--|#line 3208 "et_eiffel_parser.y"
				yy_do_action_659
			when 660 then
					--|#line 3208 "et_eiffel_parser.y"
				yy_do_action_660
			when 661 then
					--|#line 3221 "et_eiffel_parser.y"
				yy_do_action_661
			when 662 then
					--|#line 3232 "et_eiffel_parser.y"
				yy_do_action_662
			when 663 then
					--|#line 3240 "et_eiffel_parser.y"
				yy_do_action_663
			when 664 then
					--|#line 3249 "et_eiffel_parser.y"
				yy_do_action_664
			when 665 then
					--|#line 3258 "et_eiffel_parser.y"
				yy_do_action_665
			when 666 then
					--|#line 3260 "et_eiffel_parser.y"
				yy_do_action_666
			when 667 then
					--|#line 3264 "et_eiffel_parser.y"
				yy_do_action_667
			when 668 then
					--|#line 3266 "et_eiffel_parser.y"
				yy_do_action_668
			when 669 then
					--|#line 3268 "et_eiffel_parser.y"
				yy_do_action_669
			when 670 then
					--|#line 3270 "et_eiffel_parser.y"
				yy_do_action_670
			when 671 then
					--|#line 3276 "et_eiffel_parser.y"
				yy_do_action_671
			when 672 then
					--|#line 3280 "et_eiffel_parser.y"
				yy_do_action_672
			when 673 then
					--|#line 3282 "et_eiffel_parser.y"
				yy_do_action_673
			when 674 then
					--|#line 3288 "et_eiffel_parser.y"
				yy_do_action_674
			when 675 then
					--|#line 3292 "et_eiffel_parser.y"
				yy_do_action_675
			when 676 then
					--|#line 3294 "et_eiffel_parser.y"
				yy_do_action_676
			when 677 then
					--|#line 3296 "et_eiffel_parser.y"
				yy_do_action_677
			when 678 then
					--|#line 3296 "et_eiffel_parser.y"
				yy_do_action_678
			when 679 then
					--|#line 3309 "et_eiffel_parser.y"
				yy_do_action_679
			when 680 then
					--|#line 3320 "et_eiffel_parser.y"
				yy_do_action_680
			when 681 then
					--|#line 3329 "et_eiffel_parser.y"
				yy_do_action_681
			when 682 then
					--|#line 3340 "et_eiffel_parser.y"
				yy_do_action_682
			when 683 then
					--|#line 3342 "et_eiffel_parser.y"
				yy_do_action_683
			when 684 then
					--|#line 3344 "et_eiffel_parser.y"
				yy_do_action_684
			when 685 then
					--|#line 3346 "et_eiffel_parser.y"
				yy_do_action_685
			when 686 then
					--|#line 3348 "et_eiffel_parser.y"
				yy_do_action_686
			when 687 then
					--|#line 3350 "et_eiffel_parser.y"
				yy_do_action_687
			when 688 then
					--|#line 3352 "et_eiffel_parser.y"
				yy_do_action_688
			when 689 then
					--|#line 3356 "et_eiffel_parser.y"
				yy_do_action_689
			when 690 then
					--|#line 3358 "et_eiffel_parser.y"
				yy_do_action_690
			when 691 then
					--|#line 3362 "et_eiffel_parser.y"
				yy_do_action_691
			when 692 then
					--|#line 3366 "et_eiffel_parser.y"
				yy_do_action_692
			when 693 then
					--|#line 3368 "et_eiffel_parser.y"
				yy_do_action_693
			when 694 then
					--|#line 3372 "et_eiffel_parser.y"
				yy_do_action_694
			when 695 then
					--|#line 3374 "et_eiffel_parser.y"
				yy_do_action_695
			when 696 then
					--|#line 3378 "et_eiffel_parser.y"
				yy_do_action_696
			when 697 then
					--|#line 3380 "et_eiffel_parser.y"
				yy_do_action_697
			when 698 then
					--|#line 3384 "et_eiffel_parser.y"
				yy_do_action_698
			when 699 then
					--|#line 3386 "et_eiffel_parser.y"
				yy_do_action_699
			when 700 then
					--|#line 3388 "et_eiffel_parser.y"
				yy_do_action_700
			when 701 then
					--|#line 3390 "et_eiffel_parser.y"
				yy_do_action_701
			when 702 then
					--|#line 3392 "et_eiffel_parser.y"
				yy_do_action_702
			when 703 then
					--|#line 3394 "et_eiffel_parser.y"
				yy_do_action_703
			when 704 then
					--|#line 3402 "et_eiffel_parser.y"
				yy_do_action_704
			when 705 then
					--|#line 3404 "et_eiffel_parser.y"
				yy_do_action_705
			when 706 then
					--|#line 3408 "et_eiffel_parser.y"
				yy_do_action_706
			when 707 then
					--|#line 3416 "et_eiffel_parser.y"
				yy_do_action_707
			when 708 then
					--|#line 3422 "et_eiffel_parser.y"
				yy_do_action_708
			when 709 then
					--|#line 3424 "et_eiffel_parser.y"
				yy_do_action_709
			when 710 then
					--|#line 3426 "et_eiffel_parser.y"
				yy_do_action_710
			when 711 then
					--|#line 3426 "et_eiffel_parser.y"
				yy_do_action_711
			when 712 then
					--|#line 3439 "et_eiffel_parser.y"
				yy_do_action_712
			when 713 then
					--|#line 3450 "et_eiffel_parser.y"
				yy_do_action_713
			when 714 then
					--|#line 3458 "et_eiffel_parser.y"
				yy_do_action_714
			when 715 then
					--|#line 3467 "et_eiffel_parser.y"
				yy_do_action_715
			when 716 then
					--|#line 3476 "et_eiffel_parser.y"
				yy_do_action_716
			when 717 then
					--|#line 3478 "et_eiffel_parser.y"
				yy_do_action_717
			when 718 then
					--|#line 3480 "et_eiffel_parser.y"
				yy_do_action_718
			when 719 then
					--|#line 3482 "et_eiffel_parser.y"
				yy_do_action_719
			when 720 then
					--|#line 3489 "et_eiffel_parser.y"
				yy_do_action_720
			when 721 then
					--|#line 3491 "et_eiffel_parser.y"
				yy_do_action_721
			when 722 then
					--|#line 3497 "et_eiffel_parser.y"
				yy_do_action_722
			when 723 then
					--|#line 3499 "et_eiffel_parser.y"
				yy_do_action_723
			when 724 then
					--|#line 3503 "et_eiffel_parser.y"
				yy_do_action_724
			when 725 then
					--|#line 3505 "et_eiffel_parser.y"
				yy_do_action_725
			when 726 then
					--|#line 3507 "et_eiffel_parser.y"
				yy_do_action_726
			when 727 then
					--|#line 3509 "et_eiffel_parser.y"
				yy_do_action_727
			when 728 then
					--|#line 3511 "et_eiffel_parser.y"
				yy_do_action_728
			when 729 then
					--|#line 3513 "et_eiffel_parser.y"
				yy_do_action_729
			when 730 then
					--|#line 3515 "et_eiffel_parser.y"
				yy_do_action_730
			when 731 then
					--|#line 3517 "et_eiffel_parser.y"
				yy_do_action_731
			when 732 then
					--|#line 3519 "et_eiffel_parser.y"
				yy_do_action_732
			when 733 then
					--|#line 3521 "et_eiffel_parser.y"
				yy_do_action_733
			when 734 then
					--|#line 3523 "et_eiffel_parser.y"
				yy_do_action_734
			when 735 then
					--|#line 3525 "et_eiffel_parser.y"
				yy_do_action_735
			when 736 then
					--|#line 3527 "et_eiffel_parser.y"
				yy_do_action_736
			when 737 then
					--|#line 3529 "et_eiffel_parser.y"
				yy_do_action_737
			when 738 then
					--|#line 3531 "et_eiffel_parser.y"
				yy_do_action_738
			when 739 then
					--|#line 3533 "et_eiffel_parser.y"
				yy_do_action_739
			when 740 then
					--|#line 3535 "et_eiffel_parser.y"
				yy_do_action_740
			when 741 then
					--|#line 3537 "et_eiffel_parser.y"
				yy_do_action_741
			when 742 then
					--|#line 3539 "et_eiffel_parser.y"
				yy_do_action_742
			when 743 then
					--|#line 3541 "et_eiffel_parser.y"
				yy_do_action_743
			when 744 then
					--|#line 3543 "et_eiffel_parser.y"
				yy_do_action_744
			when 745 then
					--|#line 3545 "et_eiffel_parser.y"
				yy_do_action_745
			when 746 then
					--|#line 3549 "et_eiffel_parser.y"
				yy_do_action_746
			when 747 then
					--|#line 3551 "et_eiffel_parser.y"
				yy_do_action_747
			when 748 then
					--|#line 3553 "et_eiffel_parser.y"
				yy_do_action_748
			when 749 then
					--|#line 3555 "et_eiffel_parser.y"
				yy_do_action_749
			when 750 then
					--|#line 3557 "et_eiffel_parser.y"
				yy_do_action_750
			when 751 then
					--|#line 3559 "et_eiffel_parser.y"
				yy_do_action_751
			when 752 then
					--|#line 3563 "et_eiffel_parser.y"
				yy_do_action_752
			when 753 then
					--|#line 3565 "et_eiffel_parser.y"
				yy_do_action_753
			when 754 then
					--|#line 3567 "et_eiffel_parser.y"
				yy_do_action_754
			when 755 then
					--|#line 3569 "et_eiffel_parser.y"
				yy_do_action_755
			when 756 then
					--|#line 3571 "et_eiffel_parser.y"
				yy_do_action_756
			when 757 then
					--|#line 3573 "et_eiffel_parser.y"
				yy_do_action_757
			when 758 then
					--|#line 3575 "et_eiffel_parser.y"
				yy_do_action_758
			when 759 then
					--|#line 3577 "et_eiffel_parser.y"
				yy_do_action_759
			when 760 then
					--|#line 3579 "et_eiffel_parser.y"
				yy_do_action_760
			when 761 then
					--|#line 3581 "et_eiffel_parser.y"
				yy_do_action_761
			when 762 then
					--|#line 3583 "et_eiffel_parser.y"
				yy_do_action_762
			when 763 then
					--|#line 3585 "et_eiffel_parser.y"
				yy_do_action_763
			when 764 then
					--|#line 3587 "et_eiffel_parser.y"
				yy_do_action_764
			when 765 then
					--|#line 3589 "et_eiffel_parser.y"
				yy_do_action_765
			when 766 then
					--|#line 3597 "et_eiffel_parser.y"
				yy_do_action_766
			when 767 then
					--|#line 3599 "et_eiffel_parser.y"
				yy_do_action_767
			when 768 then
					--|#line 3601 "et_eiffel_parser.y"
				yy_do_action_768
			when 769 then
					--|#line 3603 "et_eiffel_parser.y"
				yy_do_action_769
			when 770 then
					--|#line 3607 "et_eiffel_parser.y"
				yy_do_action_770
			when 771 then
					--|#line 3609 "et_eiffel_parser.y"
				yy_do_action_771
			when 772 then
					--|#line 3611 "et_eiffel_parser.y"
				yy_do_action_772
			when 773 then
					--|#line 3613 "et_eiffel_parser.y"
				yy_do_action_773
			when 774 then
					--|#line 3615 "et_eiffel_parser.y"
				yy_do_action_774
			when 775 then
					--|#line 3617 "et_eiffel_parser.y"
				yy_do_action_775
			when 776 then
					--|#line 3619 "et_eiffel_parser.y"
				yy_do_action_776
			when 777 then
					--|#line 3621 "et_eiffel_parser.y"
				yy_do_action_777
			when 778 then
					--|#line 3623 "et_eiffel_parser.y"
				yy_do_action_778
			when 779 then
					--|#line 3625 "et_eiffel_parser.y"
				yy_do_action_779
			when 780 then
					--|#line 3627 "et_eiffel_parser.y"
				yy_do_action_780
			when 781 then
					--|#line 3629 "et_eiffel_parser.y"
				yy_do_action_781
			when 782 then
					--|#line 3631 "et_eiffel_parser.y"
				yy_do_action_782
			when 783 then
					--|#line 3664 "et_eiffel_parser.y"
				yy_do_action_783
			when 784 then
					--|#line 3666 "et_eiffel_parser.y"
				yy_do_action_784
			when 785 then
					--|#line 3668 "et_eiffel_parser.y"
				yy_do_action_785
			when 786 then
					--|#line 3672 "et_eiffel_parser.y"
				yy_do_action_786
			when 787 then
					--|#line 3674 "et_eiffel_parser.y"
				yy_do_action_787
			when 788 then
					--|#line 3676 "et_eiffel_parser.y"
				yy_do_action_788
			when 789 then
					--|#line 3680 "et_eiffel_parser.y"
				yy_do_action_789
			when 790 then
					--|#line 3682 "et_eiffel_parser.y"
				yy_do_action_790
			when 791 then
					--|#line 3686 "et_eiffel_parser.y"
				yy_do_action_791
			when 792 then
					--|#line 3686 "et_eiffel_parser.y"
				yy_do_action_792
			when 793 then
					--|#line 3699 "et_eiffel_parser.y"
				yy_do_action_793
			when 794 then
					--|#line 3699 "et_eiffel_parser.y"
				yy_do_action_794
			when 795 then
					--|#line 3712 "et_eiffel_parser.y"
				yy_do_action_795
			when 796 then
					--|#line 3723 "et_eiffel_parser.y"
				yy_do_action_796
			when 797 then
					--|#line 3731 "et_eiffel_parser.y"
				yy_do_action_797
			when 798 then
					--|#line 3740 "et_eiffel_parser.y"
				yy_do_action_798
			when 799 then
					--|#line 3748 "et_eiffel_parser.y"
				yy_do_action_799
			when 800 then
					--|#line 3750 "et_eiffel_parser.y"
				yy_do_action_800
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_action_801_1000 (yy_act: INTEGER)
			-- Execute semantic action.
		do
			inspect yy_act
			when 801 then
					--|#line 3750 "et_eiffel_parser.y"
				yy_do_action_801
			when 802 then
					--|#line 3763 "et_eiffel_parser.y"
				yy_do_action_802
			when 803 then
					--|#line 3774 "et_eiffel_parser.y"
				yy_do_action_803
			when 804 then
					--|#line 3782 "et_eiffel_parser.y"
				yy_do_action_804
			when 805 then
					--|#line 3791 "et_eiffel_parser.y"
				yy_do_action_805
			when 806 then
					--|#line 3793 "et_eiffel_parser.y"
				yy_do_action_806
			when 807 then
					--|#line 3793 "et_eiffel_parser.y"
				yy_do_action_807
			when 808 then
					--|#line 3806 "et_eiffel_parser.y"
				yy_do_action_808
			when 809 then
					--|#line 3817 "et_eiffel_parser.y"
				yy_do_action_809
			when 810 then
					--|#line 3825 "et_eiffel_parser.y"
				yy_do_action_810
			when 811 then
					--|#line 3834 "et_eiffel_parser.y"
				yy_do_action_811
			when 812 then
					--|#line 3836 "et_eiffel_parser.y"
				yy_do_action_812
			when 813 then
					--|#line 3836 "et_eiffel_parser.y"
				yy_do_action_813
			when 814 then
					--|#line 3851 "et_eiffel_parser.y"
				yy_do_action_814
			when 815 then
					--|#line 3862 "et_eiffel_parser.y"
				yy_do_action_815
			when 816 then
					--|#line 3870 "et_eiffel_parser.y"
				yy_do_action_816
			when 817 then
					--|#line 3879 "et_eiffel_parser.y"
				yy_do_action_817
			when 818 then
					--|#line 3881 "et_eiffel_parser.y"
				yy_do_action_818
			when 819 then
					--|#line 3883 "et_eiffel_parser.y"
				yy_do_action_819
			when 820 then
					--|#line 3885 "et_eiffel_parser.y"
				yy_do_action_820
			when 821 then
					--|#line 3887 "et_eiffel_parser.y"
				yy_do_action_821
			when 822 then
					--|#line 3891 "et_eiffel_parser.y"
				yy_do_action_822
			when 823 then
					--|#line 3895 "et_eiffel_parser.y"
				yy_do_action_823
			when 824 then
					--|#line 3899 "et_eiffel_parser.y"
				yy_do_action_824
			when 825 then
					--|#line 3905 "et_eiffel_parser.y"
				yy_do_action_825
			when 826 then
					--|#line 3907 "et_eiffel_parser.y"
				yy_do_action_826
			when 827 then
					--|#line 3911 "et_eiffel_parser.y"
				yy_do_action_827
			when 828 then
					--|#line 3918 "et_eiffel_parser.y"
				yy_do_action_828
			when 829 then
					--|#line 3928 "et_eiffel_parser.y"
				yy_do_action_829
			when 830 then
					--|#line 3934 "et_eiffel_parser.y"
				yy_do_action_830
			when 831 then
					--|#line 3940 "et_eiffel_parser.y"
				yy_do_action_831
			when 832 then
					--|#line 3946 "et_eiffel_parser.y"
				yy_do_action_832
			when 833 then
					--|#line 3952 "et_eiffel_parser.y"
				yy_do_action_833
			when 834 then
					--|#line 3958 "et_eiffel_parser.y"
				yy_do_action_834
			when 835 then
					--|#line 3964 "et_eiffel_parser.y"
				yy_do_action_835
			when 836 then
					--|#line 3970 "et_eiffel_parser.y"
				yy_do_action_836
			when 837 then
					--|#line 3976 "et_eiffel_parser.y"
				yy_do_action_837
			when 838 then
					--|#line 3981 "et_eiffel_parser.y"
				yy_do_action_838
			when 839 then
					--|#line 3987 "et_eiffel_parser.y"
				yy_do_action_839
			when 840 then
					--|#line 3995 "et_eiffel_parser.y"
				yy_do_action_840
			when 841 then
					--|#line 4002 "et_eiffel_parser.y"
				yy_do_action_841
			when 842 then
					--|#line 4006 "et_eiffel_parser.y"
				yy_do_action_842
			when 843 then
					--|#line 4008 "et_eiffel_parser.y"
				yy_do_action_843
			when 844 then
					--|#line 4010 "et_eiffel_parser.y"
				yy_do_action_844
			when 845 then
					--|#line 4012 "et_eiffel_parser.y"
				yy_do_action_845
			when 846 then
					--|#line 4014 "et_eiffel_parser.y"
				yy_do_action_846
			when 847 then
					--|#line 4018 "et_eiffel_parser.y"
				yy_do_action_847
			when 848 then
					--|#line 4020 "et_eiffel_parser.y"
				yy_do_action_848
			when 849 then
					--|#line 4022 "et_eiffel_parser.y"
				yy_do_action_849
			when 850 then
					--|#line 4022 "et_eiffel_parser.y"
				yy_do_action_850
			when 851 then
					--|#line 4035 "et_eiffel_parser.y"
				yy_do_action_851
			when 852 then
					--|#line 4046 "et_eiffel_parser.y"
				yy_do_action_852
			when 853 then
					--|#line 4054 "et_eiffel_parser.y"
				yy_do_action_853
			when 854 then
					--|#line 4063 "et_eiffel_parser.y"
				yy_do_action_854
			when 855 then
					--|#line 4072 "et_eiffel_parser.y"
				yy_do_action_855
			when 856 then
					--|#line 4074 "et_eiffel_parser.y"
				yy_do_action_856
			when 857 then
					--|#line 4076 "et_eiffel_parser.y"
				yy_do_action_857
			when 858 then
					--|#line 4082 "et_eiffel_parser.y"
				yy_do_action_858
			when 859 then
					--|#line 4084 "et_eiffel_parser.y"
				yy_do_action_859
			when 860 then
					--|#line 4088 "et_eiffel_parser.y"
				yy_do_action_860
			when 861 then
					--|#line 4090 "et_eiffel_parser.y"
				yy_do_action_861
			when 862 then
					--|#line 4092 "et_eiffel_parser.y"
				yy_do_action_862
			when 863 then
					--|#line 4094 "et_eiffel_parser.y"
				yy_do_action_863
			when 864 then
					--|#line 4096 "et_eiffel_parser.y"
				yy_do_action_864
			when 865 then
					--|#line 4098 "et_eiffel_parser.y"
				yy_do_action_865
			when 866 then
					--|#line 4100 "et_eiffel_parser.y"
				yy_do_action_866
			when 867 then
					--|#line 4102 "et_eiffel_parser.y"
				yy_do_action_867
			when 868 then
					--|#line 4104 "et_eiffel_parser.y"
				yy_do_action_868
			when 869 then
					--|#line 4106 "et_eiffel_parser.y"
				yy_do_action_869
			when 870 then
					--|#line 4108 "et_eiffel_parser.y"
				yy_do_action_870
			when 871 then
					--|#line 4110 "et_eiffel_parser.y"
				yy_do_action_871
			when 872 then
					--|#line 4112 "et_eiffel_parser.y"
				yy_do_action_872
			when 873 then
					--|#line 4114 "et_eiffel_parser.y"
				yy_do_action_873
			when 874 then
					--|#line 4116 "et_eiffel_parser.y"
				yy_do_action_874
			when 875 then
					--|#line 4118 "et_eiffel_parser.y"
				yy_do_action_875
			when 876 then
					--|#line 4120 "et_eiffel_parser.y"
				yy_do_action_876
			when 877 then
					--|#line 4122 "et_eiffel_parser.y"
				yy_do_action_877
			when 878 then
					--|#line 4124 "et_eiffel_parser.y"
				yy_do_action_878
			when 879 then
					--|#line 4126 "et_eiffel_parser.y"
				yy_do_action_879
			when 880 then
					--|#line 4128 "et_eiffel_parser.y"
				yy_do_action_880
			when 881 then
					--|#line 4130 "et_eiffel_parser.y"
				yy_do_action_881
			when 882 then
					--|#line 4132 "et_eiffel_parser.y"
				yy_do_action_882
			when 883 then
					--|#line 4134 "et_eiffel_parser.y"
				yy_do_action_883
			when 884 then
					--|#line 4138 "et_eiffel_parser.y"
				yy_do_action_884
			when 885 then
					--|#line 4147 "et_eiffel_parser.y"
				yy_do_action_885
			when 886 then
					--|#line 4149 "et_eiffel_parser.y"
				yy_do_action_886
			when 887 then
					--|#line 4153 "et_eiffel_parser.y"
				yy_do_action_887
			when 888 then
					--|#line 4155 "et_eiffel_parser.y"
				yy_do_action_888
			when 889 then
					--|#line 4159 "et_eiffel_parser.y"
				yy_do_action_889
			when 890 then
					--|#line 4168 "et_eiffel_parser.y"
				yy_do_action_890
			when 891 then
					--|#line 4170 "et_eiffel_parser.y"
				yy_do_action_891
			when 892 then
					--|#line 4174 "et_eiffel_parser.y"
				yy_do_action_892
			when 893 then
					--|#line 4176 "et_eiffel_parser.y"
				yy_do_action_893
			when 894 then
					--|#line 4180 "et_eiffel_parser.y"
				yy_do_action_894
			when 895 then
					--|#line 4182 "et_eiffel_parser.y"
				yy_do_action_895
			when 896 then
					--|#line 4186 "et_eiffel_parser.y"
				yy_do_action_896
			when 897 then
					--|#line 4193 "et_eiffel_parser.y"
				yy_do_action_897
			when 898 then
					--|#line 4202 "et_eiffel_parser.y"
				yy_do_action_898
			when 899 then
					--|#line 4211 "et_eiffel_parser.y"
				yy_do_action_899
			when 900 then
					--|#line 4213 "et_eiffel_parser.y"
				yy_do_action_900
			when 901 then
					--|#line 4217 "et_eiffel_parser.y"
				yy_do_action_901
			when 902 then
					--|#line 4219 "et_eiffel_parser.y"
				yy_do_action_902
			when 903 then
					--|#line 4223 "et_eiffel_parser.y"
				yy_do_action_903
			when 904 then
					--|#line 4230 "et_eiffel_parser.y"
				yy_do_action_904
			when 905 then
					--|#line 4239 "et_eiffel_parser.y"
				yy_do_action_905
			when 906 then
					--|#line 4248 "et_eiffel_parser.y"
				yy_do_action_906
			when 907 then
					--|#line 4250 "et_eiffel_parser.y"
				yy_do_action_907
			when 908 then
					--|#line 4252 "et_eiffel_parser.y"
				yy_do_action_908
			when 909 then
					--|#line 4258 "et_eiffel_parser.y"
				yy_do_action_909
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_action_1
			--|#line 233 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 233 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 233")
end

			-- END
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp43 := yyvsp43 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_2
			--|#line 237 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 237 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 237")
end

			if attached yyvs43.item (yyvsp43) as l_class_declaration then
				l_class_declaration.set_leading_break (yyvs8.item (yyvsp8))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp43 := yyvsp43 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_3
			--|#line 245 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CLASS
		do
--|#line 245 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 245")
end

			yyval43 := yyvs43.item (yyvsp43)
			if yyval43 /= Void then
				yyval43.set_first_indexing (yyvs80.item (yyvsp80))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp80 := yyvsp80 -1
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
		end

	yy_do_action_4
			--|#line 254 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 254 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 254")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_5
			--|#line 255 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 255 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 255")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp43 := yyvsp43 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_6
			--|#line 255 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 255 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 255")
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
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_7
			--|#line 266 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CLASS
		do
--|#line 266 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 266")
end

			yyval43 := yyvs43.item (yyvsp43)
			set_class_to_end (yyval43, yyvs99.item (yyvsp99), yyvs102.item (yyvsp102), yyvs58.item (yyvsp58), yyvs55.item (yyvsp55), yyvs69.item (yyvsp69), yyvs88.item (yyvsp88), yyvs80.item (yyvsp80), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp78 := yyvsp78 -1
	yyvsp99 := yyvsp99 -1
	yyvsp102 := yyvsp102 -1
	yyvsp58 := yyvsp58 -1
	yyvsp55 := yyvsp55 -1
	yyvsp69 := yyvsp69 -1
	yyvsp88 := yyvsp88 -1
	yyvsp80 := yyvsp80 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
		end

	yy_do_action_8
			--|#line 274 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 274 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 274")
end

set_class_providers 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_9
			--|#line 279 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 279 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 279")
end

yyval80 := ast_factory.new_indexings (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_10
			--|#line 281 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 281 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 281")
end

			yyval80 := yyvs80.item (yyvsp80)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp80 := yyvsp80 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_11
			--|#line 281 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 281 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 281")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp80 := yyvsp80 + 1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_12
			--|#line 292 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 292 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 292")
end

yyval80 := ast_factory.new_indexings (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_13
			--|#line 294 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 294 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 294")
end

			yyval80 := yyvs80.item (yyvsp80)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp80 := yyvsp80 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_14
			--|#line 294 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 294 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 294")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp80 := yyvsp80 + 1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_15
			--|#line 307 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 307 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 307")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp80 := yyvsp80 + 1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_16
			--|#line 309 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 309 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 309")
end

yyval80 := yyvs80.item (yyvsp80) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_17
			--|#line 313 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 313 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 313")
end

			if attached yyvs81.item (yyvsp81) as l_note then
				yyval80 := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if yyval80 /= Void then
					yyval80.put_first (l_note)
				end
			else
				yyval80 := ast_factory.new_indexings (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp81 := yyvsp81 -1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_18
			--|#line 324 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 324 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 324")
end

			yyval80 := yyvs80.item (yyvsp80)
			if yyval80 /= Void and attached yyvs81.item (yyvsp81) as l_note then
				yyval80.put_first (l_note)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp80 := yyvsp80 -1
	yyvsp81 := yyvsp81 -1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_19
			--|#line 324 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 324 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 324")
end

increment_counter 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp80 := yyvsp80 + 1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_20
			--|#line 333 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 333 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 333")
end

			yyval80 := yyvs80.item (yyvsp80)
			if yyval80 /= Void and attached yyvs81.item (yyvsp81) as l_note then
				yyval80.put_first (l_note)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp80 := yyvsp80 -1
	yyvsp81 := yyvsp81 -1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_21
			--|#line 333 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 333 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 333")
end

increment_counter 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp80 := yyvsp80 + 1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_22
			--|#line 344 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_INDEXING_ITEM
		do
--|#line 344 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 344")
end

			yyval81 := yyvs81.item (yyvsp81)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines81.force (yyvs81, yyval81, yyvsp81)
end
		end

	yy_do_action_23
			--|#line 351 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_INDEXING_ITEM
		do
--|#line 351 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 351")
end

			yyval81 := ast_factory.new_tagged_indexing (ast_factory.new_tag (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyvs84.item (yyvsp84))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp81 := yyvsp81 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp84 := yyvsp84 -1
	if yyvsp81 >= yyvsc81 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs81")
		end
		yyvsc81 := yyvsc81 + yyInitial_yyvs_size
		yyvs81 := yyspecial_routines81.aliased_resized_area (yyvs81, yyvsc81)
	end
	yyspecial_routines81.force (yyvs81, yyval81, yyvsp81)
end
		end

	yy_do_action_24
			--|#line 357 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_INDEXING_ITEM
		do
--|#line 357 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 357")
end

yyval81 := ast_factory.new_indexing_semicolon (yyvs81.item (yyvsp81), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 -1
	yyspecial_routines81.force (yyvs81, yyval81, yyvsp81)
end
		end

	yy_do_action_25
			--|#line 361 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 361 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 361")
end

			if attached yyvs81.item (yyvsp81) as l_indexing_clause then
				yyval80 := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if yyval80 /= Void then
					yyval80.put_first (l_indexing_clause)
				end
			else
				yyval80 := ast_factory.new_indexings (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp81 := yyvsp81 -1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_26
			--|#line 372 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 372 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 372")
end

			if attached yyvs81.item (yyvsp81) as l_indexing_clause then
				yyval80 := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if yyval80 /= Void then
					yyval80.put_first (l_indexing_clause)
				end
			else
				yyval80 := ast_factory.new_indexings (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp80 := yyvsp80 + 1
	yyvsp81 := yyvsp81 -1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_27
			--|#line 384 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 384 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 384")
end

			yyval80 := yyvs80.item (yyvsp80)
			if yyval80 /= Void and attached yyvs81.item (yyvsp81) as l_indexing_clause then
				yyval80.put_first (l_indexing_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp80 := yyvsp80 -1
	yyvsp81 := yyvsp81 -1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_28
			--|#line 384 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 384 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 384")
end

increment_counter 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp80 := yyvsp80 + 1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_29
			--|#line 393 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 393 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 393")
end

			yyval80 := yyvs80.item (yyvsp80)
			if yyval80 /= Void and attached yyvs81.item (yyvsp81) as l_indexing_clause then
				yyval80.put_first (l_indexing_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp80 := yyvsp80 -1
	yyvsp81 := yyvsp81 -1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_30
			--|#line 393 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_INDEXING_LIST
		do
--|#line 393 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 393")
end

increment_counter 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp80 := yyvsp80 + 1
	if yyvsp80 >= yyvsc80 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs80")
		end
		yyvsc80 := yyvsc80 + yyInitial_yyvs_size
		yyvs80 := yyspecial_routines80.aliased_resized_area (yyvs80, yyvsc80)
	end
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_31
			--|#line 404 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_INDEXING_ITEM
		do
--|#line 404 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 404")
end

			yyval81 := yyvs81.item (yyvsp81)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines81.force (yyvs81, yyval81, yyvsp81)
end
		end

	yy_do_action_32
			--|#line 411 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_INDEXING_ITEM
		do
--|#line 411 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 411")
end

			yyval81 := ast_factory.new_indexing (yyvs84.item (yyvsp84))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp81 := yyvsp81 + 1
	yyvsp84 := yyvsp84 -1
	if yyvsp81 >= yyvsc81 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs81")
		end
		yyvsc81 := yyvsc81 + yyInitial_yyvs_size
		yyvs81 := yyspecial_routines81.aliased_resized_area (yyvs81, yyvsc81)
	end
	yyspecial_routines81.force (yyvs81, yyval81, yyvsp81)
end
		end

	yy_do_action_33
			--|#line 415 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_INDEXING_ITEM
		do
--|#line 415 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 415")
end

			yyval81 := ast_factory.new_tagged_indexing (ast_factory.new_tag (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyvs84.item (yyvsp84))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp81 := yyvsp81 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp84 := yyvsp84 -1
	if yyvsp81 >= yyvsc81 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs81")
		end
		yyvsc81 := yyvsc81 + yyInitial_yyvs_size
		yyvs81 := yyspecial_routines81.aliased_resized_area (yyvs81, yyvsc81)
	end
	yyspecial_routines81.force (yyvs81, yyval81, yyvsp81)
end
		end

	yy_do_action_34
			--|#line 421 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_INDEXING_ITEM
		do
--|#line 421 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 421")
end

yyval81 := ast_factory.new_indexing_semicolon (yyvs81.item (yyvsp81), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 -1
	yyspecial_routines81.force (yyvs81, yyval81, yyvsp81)
end
		end

	yy_do_action_35
			--|#line 423 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_INDEXING_ITEM
		do
--|#line 423 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 423")
end

yyval81 := ast_factory.new_indexing_semicolon (yyvs81.item (yyvsp81), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 -1
	yyspecial_routines81.force (yyvs81, yyval81, yyvsp81)
end
		end

	yy_do_action_36
			--|#line 428 "et_eiffel_parser.y"
		local
			yyval84: detachable ET_INDEXING_TERM_LIST
		do
--|#line 428 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 428")
end

			if attached yyvs82.item (yyvsp82) as l_index_value then
				yyval84 := ast_factory.new_indexing_terms (counter_value + 1)
				if yyval84 /= Void then
					yyval84.put_first (l_index_value)
				end
			else
				yyval84 := ast_factory.new_indexing_terms (counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp84 := yyvsp84 + 1
	yyvsp82 := yyvsp82 -1
	if yyvsp84 >= yyvsc84 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs84")
		end
		yyvsc84 := yyvsc84 + yyInitial_yyvs_size
		yyvs84 := yyspecial_routines84.aliased_resized_area (yyvs84, yyvsc84)
	end
	yyspecial_routines84.force (yyvs84, yyval84, yyvsp84)
end
		end

	yy_do_action_37
			--|#line 439 "et_eiffel_parser.y"
		local
			yyval84: detachable ET_INDEXING_TERM_LIST
		do
--|#line 439 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 439")
end

			yyval84 := yyvs84.item (yyvsp84)
			if yyval84 /= Void and attached yyvs83.item (yyvsp83) as l_index_value then
				yyval84.put_first (l_index_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp83 := yyvsp83 -1
	yyspecial_routines84.force (yyvs84, yyval84, yyvsp84)
end
		end

	yy_do_action_38
			--|#line 448 "et_eiffel_parser.y"
		local
			yyval82: detachable ET_INDEXING_TERM
		do
--|#line 448 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 448")
end

yyval82 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp82 := yyvsp82 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp82 >= yyvsc82 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs82")
		end
		yyvsc82 := yyvsc82 + yyInitial_yyvs_size
		yyvs82 := yyspecial_routines82.aliased_resized_area (yyvs82, yyvsc82)
	end
	yyspecial_routines82.force (yyvs82, yyval82, yyvsp82)
end
		end

	yy_do_action_39
			--|#line 450 "et_eiffel_parser.y"
		local
			yyval82: detachable ET_INDEXING_TERM
		do
--|#line 450 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 450")
end

yyval82 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp82 := yyvsp82 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp82 >= yyvsc82 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs82")
		end
		yyvsc82 := yyvsc82 + yyInitial_yyvs_size
		yyvs82 := yyspecial_routines82.aliased_resized_area (yyvs82, yyvsc82)
	end
	yyspecial_routines82.force (yyvs82, yyval82, yyvsp82)
end
		end

	yy_do_action_40
			--|#line 452 "et_eiffel_parser.y"
		local
			yyval82: detachable ET_INDEXING_TERM
		do
--|#line 452 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 452")
end

yyval82 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp82 := yyvsp82 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp82 >= yyvsc82 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs82")
		end
		yyvsc82 := yyvsc82 + yyInitial_yyvs_size
		yyvs82 := yyspecial_routines82.aliased_resized_area (yyvs82, yyvsc82)
	end
	yyspecial_routines82.force (yyvs82, yyval82, yyvsp82)
end
		end

	yy_do_action_41
			--|#line 454 "et_eiffel_parser.y"
		local
			yyval82: detachable ET_INDEXING_TERM
		do
--|#line 454 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 454")
end

yyval82 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp82 := yyvsp82 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp82 >= yyvsc82 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs82")
		end
		yyvsc82 := yyvsc82 + yyInitial_yyvs_size
		yyvs82 := yyspecial_routines82.aliased_resized_area (yyvs82, yyvsc82)
	end
	yyspecial_routines82.force (yyvs82, yyval82, yyvsp82)
end
		end

	yy_do_action_42
			--|#line 456 "et_eiffel_parser.y"
		local
			yyval82: detachable ET_INDEXING_TERM
		do
--|#line 456 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 456")
end

yyval82 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp82 := yyvsp82 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp82 >= yyvsc82 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs82")
		end
		yyvsc82 := yyvsc82 + yyInitial_yyvs_size
		yyvs82 := yyspecial_routines82.aliased_resized_area (yyvs82, yyvsc82)
	end
	yyspecial_routines82.force (yyvs82, yyval82, yyvsp82)
end
		end

	yy_do_action_43
			--|#line 458 "et_eiffel_parser.y"
		local
			yyval82: detachable ET_INDEXING_TERM
		do
--|#line 458 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 458")
end

yyval82 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp82 := yyvsp82 + 1
	yyvsp15 := yyvsp15 -1
	if yyvsp82 >= yyvsc82 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs82")
		end
		yyvsc82 := yyvsc82 + yyInitial_yyvs_size
		yyvs82 := yyspecial_routines82.aliased_resized_area (yyvs82, yyvsc82)
	end
	yyspecial_routines82.force (yyvs82, yyval82, yyvsp82)
end
		end

	yy_do_action_44
			--|#line 460 "et_eiffel_parser.y"
		local
			yyval82: detachable ET_INDEXING_TERM
		do
--|#line 460 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 460")
end

yyval82 := ast_factory.new_custom_attribute (yyvs56.item (yyvsp56), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp82 := yyvsp82 + 1
	yyvsp56 := yyvsp56 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp82 >= yyvsc82 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs82")
		end
		yyvsc82 := yyvsc82 + yyInitial_yyvs_size
		yyvs82 := yyspecial_routines82.aliased_resized_area (yyvs82, yyvsc82)
	end
	yyspecial_routines82.force (yyvs82, yyval82, yyvsp82)
end
		end

	yy_do_action_45
			--|#line 462 "et_eiffel_parser.y"
		local
			yyval82: detachable ET_INDEXING_TERM
		do
--|#line 462 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 462")
end

yyval82 := ast_factory.new_custom_attribute (yyvs56.item (yyvsp56), yyvs98.item (yyvsp98), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp82 := yyvsp82 + 1
	yyvsp56 := yyvsp56 -1
	yyvsp98 := yyvsp98 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp82 >= yyvsc82 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs82")
		end
		yyvsc82 := yyvsc82 + yyInitial_yyvs_size
		yyvs82 := yyspecial_routines82.aliased_resized_area (yyvs82, yyvsc82)
	end
	yyspecial_routines82.force (yyvs82, yyval82, yyvsp82)
end
		end

	yy_do_action_46
			--|#line 466 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_INDEXING_TERM_ITEM
		do
--|#line 466 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 466")
end

			yyval83 := ast_factory.new_indexing_term_comma (yyvs82.item (yyvsp82), yyvs5.item (yyvsp5))
			if yyval83 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp83 := yyvsp83 + 1
	yyvsp82 := yyvsp82 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp83 >= yyvsc83 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs83")
		end
		yyvsc83 := yyvsc83 + yyInitial_yyvs_size
		yyvs83 := yyspecial_routines83.aliased_resized_area (yyvs83, yyvsc83)
	end
	yyspecial_routines83.force (yyvs83, yyval83, yyvsp83)
end
		end

	yy_do_action_47
			--|#line 477 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CLASS
		do
--|#line 477 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 477")
end

			yyval43 := new_class (yyvs12.item (yyvsp12))
			if yyval43 /= Void then
				if attached yyvs2.item (yyvsp2) as l_class_keyword then
					yyval43.set_class_keyword (l_class_keyword)
				end
				yyval43.set_frozen_keyword (yyvs2.item (yyvsp2 - 2))
				yyval43.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval43
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp43 := yyvsp43 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp12 := yyvsp12 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
		end

	yy_do_action_48
			--|#line 489 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CLASS
		do
--|#line 489 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 489")
end

			yyval43 := new_class (yyvs12.item (yyvsp12))
			if yyval43 /= Void then
				if attached yyvs2.item (yyvsp2) as l_class_keyword then
					yyval43.set_class_keyword (l_class_keyword)
				end
				yyval43.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval43.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval43.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval43
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp43 := yyvsp43 + 1
	yyvsp2 := yyvsp2 -4
	yyvsp12 := yyvsp12 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
		end

	yy_do_action_49
			--|#line 502 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CLASS
		do
--|#line 502 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 502")
end

			yyval43 := new_class (yyvs12.item (yyvsp12))
			if yyval43 /= Void then
				if attached yyvs2.item (yyvsp2) as l_class_keyword then
					yyval43.set_class_keyword (l_class_keyword)
				end
				yyval43.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval43.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval43.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval43
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp43 := yyvsp43 + 1
	yyvsp2 := yyvsp2 -4
	yyvsp12 := yyvsp12 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
		end

	yy_do_action_50
			--|#line 515 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CLASS
		do
--|#line 515 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 515")
end

			yyval43 := new_class (yyvs12.item (yyvsp12))
			if yyval43 /= Void then
				if attached yyvs2.item (yyvsp2) as l_class_keyword then
					yyval43.set_class_keyword (l_class_keyword)
				end
				yyval43.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval43.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval43.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval43
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp43 := yyvsp43 + 1
	yyvsp2 := yyvsp2 -4
	yyvsp12 := yyvsp12 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
		end

	yy_do_action_51
			--|#line 530 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 530 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 530")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_52
			--|#line 532 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 532 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 532")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_53
			--|#line 536 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 536 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 536")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_54
			--|#line 538 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 538 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 538")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_55
			--|#line 544 "et_eiffel_parser.y"
		local
			yyval78: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 544 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 544")
end

			set_formal_parameters (Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp78 := yyvsp78 + 1
	if yyvsp78 >= yyvsc78 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs78")
		end
		yyvsc78 := yyvsc78 + yyInitial_yyvs_size
		yyvs78 := yyspecial_routines78.aliased_resized_area (yyvs78, yyvsc78)
	end
	yyspecial_routines78.force (yyvs78, yyval78, yyvsp78)
end
		end

	yy_do_action_56
			--|#line 548 "et_eiffel_parser.y"
		local
			yyval78: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 548 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 548")
end

			yyval78 := ast_factory.new_formal_parameters (yyvs22.item (yyvsp22), yyvs5.item (yyvsp5), 0)
			set_formal_parameters (yyval78)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp78 := yyvsp78 + 1
	yyvsp22 := yyvsp22 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp78 >= yyvsc78 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs78")
		end
		yyvsc78 := yyvsc78 + yyInitial_yyvs_size
		yyvs78 := yyspecial_routines78.aliased_resized_area (yyvs78, yyvsc78)
	end
	yyspecial_routines78.force (yyvs78, yyval78, yyvsp78)
end
		end

	yy_do_action_57
			--|#line 554 "et_eiffel_parser.y"
		local
			yyval78: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 554 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 554")
end

			yyval78 := yyvs78.item (yyvsp78)
			set_formal_parameters (yyval78)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp78 := yyvsp78 -1
	yyvsp22 := yyvsp22 -1
	yyspecial_routines78.force (yyvs78, yyval78, yyvsp78)
end
		end

	yy_do_action_58
			--|#line 554 "et_eiffel_parser.y"
		local
			yyval78: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 554 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 554")
end

			add_symbol (yyvs22.item (yyvsp22))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp78 := yyvsp78 + 1
	if yyvsp78 >= yyvsc78 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs78")
		end
		yyvsc78 := yyvsc78 + yyInitial_yyvs_size
		yyvs78 := yyspecial_routines78.aliased_resized_area (yyvs78, yyvsc78)
	end
	yyspecial_routines78.force (yyvs78, yyval78, yyvsp78)
end
		end

	yy_do_action_59
			--|#line 568 "et_eiffel_parser.y"
		local
			yyval78: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 568 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 568")
end

			if attached yyvs76.item (yyvsp76) as l_formal_parameter then
				yyval78 := ast_factory.new_formal_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval78 /= Void then
					yyval78.put_first (l_formal_parameter)
				end
			else
				yyval78 := ast_factory.new_formal_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp78 := yyvsp78 + 1
	yyvsp76 := yyvsp76 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp78 >= yyvsc78 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs78")
		end
		yyvsc78 := yyvsc78 + yyInitial_yyvs_size
		yyvs78 := yyspecial_routines78.aliased_resized_area (yyvs78, yyvsc78)
	end
	yyspecial_routines78.force (yyvs78, yyval78, yyvsp78)
end
		end

	yy_do_action_60
			--|#line 579 "et_eiffel_parser.y"
		local
			yyval78: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 579 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 579")
end

			yyval78 := yyvs78.item (yyvsp78)
			if yyval78 /= Void and attached yyvs77.item (yyvsp77) as l_formal_parameter then
				yyval78.put_first (l_formal_parameter)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp77 := yyvsp77 -1
	yyspecial_routines78.force (yyvs78, yyval78, yyvsp78)
end
		end

	yy_do_action_61
			--|#line 588 "et_eiffel_parser.y"
		local
			yyval77: detachable ET_FORMAL_PARAMETER_ITEM
		do
--|#line 588 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 588")
end

			yyval77 := ast_factory.new_formal_parameter_comma (yyvs76.item (yyvsp76), yyvs5.item (yyvsp5))
			if yyval77 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp77 := yyvsp77 + 1
	yyvsp76 := yyvsp76 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp77 >= yyvsc77 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs77")
		end
		yyvsc77 := yyvsc77 + yyInitial_yyvs_size
		yyvs77 := yyspecial_routines77.aliased_resized_area (yyvs77, yyvsc77)
	end
	yyspecial_routines77.force (yyvs77, yyval77, yyvsp77)
end
		end

	yy_do_action_62
			--|#line 597 "et_eiffel_parser.y"
		local
			yyval76: detachable ET_FORMAL_PARAMETER
		do
--|#line 597 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 597")
end

			yyval76 := ast_factory.new_formal_parameter (Void, yyvs12.item (yyvsp12), last_class)
			if yyval76 /= Void then
				register_constraint (Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp76 := yyvsp76 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp76 >= yyvsc76 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs76")
		end
		yyvsc76 := yyvsc76 + yyInitial_yyvs_size
		yyvs76 := yyspecial_routines76.aliased_resized_area (yyvs76, yyvsc76)
	end
	yyspecial_routines76.force (yyvs76, yyval76, yyvsp76)
end
		end

	yy_do_action_63
			--|#line 604 "et_eiffel_parser.y"
		local
			yyval76: detachable ET_FORMAL_PARAMETER
		do
--|#line 604 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 604")
end

			yyval76 := ast_factory.new_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), last_class)
			if yyval76 /= Void then
				register_constraint (Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp76 := yyvsp76 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp76 >= yyvsc76 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs76")
		end
		yyvsc76 := yyvsc76 + yyInitial_yyvs_size
		yyvs76 := yyspecial_routines76.aliased_resized_area (yyvs76, yyvsc76)
	end
	yyspecial_routines76.force (yyvs76, yyval76, yyvsp76)
end
		end

	yy_do_action_64
			--|#line 611 "et_eiffel_parser.y"
		local
			yyval76: detachable ET_FORMAL_PARAMETER
		do
--|#line 611 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 611")
end

			yyval76 := ast_factory.new_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), last_class)
			if yyval76 /= Void then
				register_constraint (Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp76 := yyvsp76 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp76 >= yyvsc76 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs76")
		end
		yyvsc76 := yyvsc76 + yyInitial_yyvs_size
		yyvs76 := yyspecial_routines76.aliased_resized_area (yyvs76, yyvsc76)
	end
	yyspecial_routines76.force (yyvs76, yyval76, yyvsp76)
end
		end

	yy_do_action_65
			--|#line 618 "et_eiffel_parser.y"
		local
			yyval76: detachable ET_FORMAL_PARAMETER
		do
--|#line 618 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 618")
end

			yyval76 := ast_factory.new_constrained_formal_parameter (Void, yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), dummy_constraint (yyvs52.item (yyvsp52)), Void, last_class)
			if yyval76 /= Void then
				register_constraint (yyvs52.item (yyvsp52))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp76 := yyvsp76 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp52 := yyvsp52 -1
	if yyvsp76 >= yyvsc76 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs76")
		end
		yyvsc76 := yyvsc76 + yyInitial_yyvs_size
		yyvs76 := yyspecial_routines76.aliased_resized_area (yyvs76, yyvsc76)
	end
	yyspecial_routines76.force (yyvs76, yyval76, yyvsp76)
end
		end

	yy_do_action_66
			--|#line 625 "et_eiffel_parser.y"
		local
			yyval76: detachable ET_FORMAL_PARAMETER
		do
--|#line 625 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 625")
end

			yyval76 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), dummy_constraint (yyvs52.item (yyvsp52)), Void, last_class)
			if yyval76 /= Void then
				register_constraint (yyvs52.item (yyvsp52))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp76 := yyvsp76 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp52 := yyvsp52 -1
	if yyvsp76 >= yyvsc76 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs76")
		end
		yyvsc76 := yyvsc76 + yyInitial_yyvs_size
		yyvs76 := yyspecial_routines76.aliased_resized_area (yyvs76, yyvsc76)
	end
	yyspecial_routines76.force (yyvs76, yyval76, yyvsp76)
end
		end

	yy_do_action_67
			--|#line 632 "et_eiffel_parser.y"
		local
			yyval76: detachable ET_FORMAL_PARAMETER
		do
--|#line 632 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 632")
end

			yyval76 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), dummy_constraint (yyvs52.item (yyvsp52)), Void, last_class)
			if yyval76 /= Void then
				register_constraint (yyvs52.item (yyvsp52))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp76 := yyvsp76 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp52 := yyvsp52 -1
	if yyvsp76 >= yyvsc76 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs76")
		end
		yyvsc76 := yyvsc76 + yyInitial_yyvs_size
		yyvs76 := yyspecial_routines76.aliased_resized_area (yyvs76, yyvsc76)
	end
	yyspecial_routines76.force (yyvs76, yyval76, yyvsp76)
end
		end

	yy_do_action_68
			--|#line 639 "et_eiffel_parser.y"
		local
			yyval76: detachable ET_FORMAL_PARAMETER
		do
--|#line 639 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 639")
end

			yyval76 := ast_factory.new_constrained_formal_parameter (Void, yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), dummy_constraint (yyvs52.item (yyvsp52)), yyvs51.item (yyvsp51), last_class)
			if yyval76 /= Void then
				register_constraint (yyvs52.item (yyvsp52))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp76 := yyvsp76 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp52 := yyvsp52 -1
	yyvsp51 := yyvsp51 -1
	if yyvsp76 >= yyvsc76 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs76")
		end
		yyvsc76 := yyvsc76 + yyInitial_yyvs_size
		yyvs76 := yyspecial_routines76.aliased_resized_area (yyvs76, yyvsc76)
	end
	yyspecial_routines76.force (yyvs76, yyval76, yyvsp76)
end
		end

	yy_do_action_69
			--|#line 646 "et_eiffel_parser.y"
		local
			yyval76: detachable ET_FORMAL_PARAMETER
		do
--|#line 646 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 646")
end

			yyval76 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), dummy_constraint (yyvs52.item (yyvsp52)), yyvs51.item (yyvsp51), last_class)
			if yyval76 /= Void then
				register_constraint (yyvs52.item (yyvsp52))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp76 := yyvsp76 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp52 := yyvsp52 -1
	yyvsp51 := yyvsp51 -1
	if yyvsp76 >= yyvsc76 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs76")
		end
		yyvsc76 := yyvsc76 + yyInitial_yyvs_size
		yyvs76 := yyspecial_routines76.aliased_resized_area (yyvs76, yyvsc76)
	end
	yyspecial_routines76.force (yyvs76, yyval76, yyvsp76)
end
		end

	yy_do_action_70
			--|#line 653 "et_eiffel_parser.y"
		local
			yyval76: detachable ET_FORMAL_PARAMETER
		do
--|#line 653 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 653")
end

			yyval76 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), dummy_constraint (yyvs52.item (yyvsp52)), yyvs51.item (yyvsp51), last_class)
			if yyval76 /= Void then
				register_constraint (yyvs52.item (yyvsp52))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp76 := yyvsp76 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp52 := yyvsp52 -1
	yyvsp51 := yyvsp51 -1
	if yyvsp76 >= yyvsc76 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs76")
		end
		yyvsc76 := yyvsc76 + yyInitial_yyvs_size
		yyvs76 := yyspecial_routines76.aliased_resized_area (yyvs76, yyvsc76)
	end
	yyspecial_routines76.force (yyvs76, yyval76, yyvsp76)
end
		end

	yy_do_action_71
			--|#line 662 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 662 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 662")
end

yyval51 := ast_factory.new_constraint_creator (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp51 := yyvsp51 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_72
			--|#line 664 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 664 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 664")
end

			yyval51 := yyvs51.item (yyvsp51)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp51 := yyvsp51 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_73
			--|#line 664 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 664 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 664")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp51 := yyvsp51 + 1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_74
			--|#line 677 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 677 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 677")
end

			if attached yyvs12.item (yyvsp12) as l_identifier then
				l_identifier.set_feature_name (True)
				yyval51 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value + 1)
				if yyval51 /= Void then
					yyval51.put_first (l_identifier)
				end
			else
				yyval51 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp51 := yyvsp51 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_75
			--|#line 689 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 689 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 689")
end

			yyval51 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value)
			if yyval51 /= Void and attached yyvs72.item (yyvsp72) as l_creation_procedure then
				yyval51.put_first (l_creation_procedure)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp51 := yyvsp51 + 1
	yyvsp72 := yyvsp72 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_76
			--|#line 697 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 697 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 697")
end

			yyval51 := yyvs51.item (yyvsp51)
			if yyval51 /= Void and attached yyvs72.item (yyvsp72) as l_creation_procedure then
				yyval51.put_first (l_creation_procedure)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_77
			--|#line 706 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 706 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 706")
end

yyval52 := new_constraint_named_type (Void, yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp52 := yyvsp52 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_78
			--|#line 708 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 708 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 708")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_79
			--|#line 710 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 710 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 710")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_80
			--|#line 712 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 712 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 712")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_81
			--|#line 714 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 714 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 714")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_82
			--|#line 716 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 716 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 716")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_83
			--|#line 718 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 718 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 718")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_84
			--|#line 720 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 720 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 720")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_85
			--|#line 722 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 722 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 722")
end

yyval52 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_86
			--|#line 724 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 724 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 724")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_87
			--|#line 726 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 726 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 726")
end

yyval52 := new_constraint_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_88
			--|#line 728 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 728 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 728")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_89
			--|#line 730 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 730 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 730")
end

yyval52 := yyvs90.item (yyvsp90) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp90 := yyvsp90 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_90
			--|#line 732 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 732 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 732")
end

yyval52 := new_constraint_named_type (Void, yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp52 := yyvsp52 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_91
			--|#line 734 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 734 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 734")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_92
			--|#line 736 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 736 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 736")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_93
			--|#line 738 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 738 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 738")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_94
			--|#line 740 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 740 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 740")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_95
			--|#line 742 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 742 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 742")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_96
			--|#line 744 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 744 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 744")
end

yyval52 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_97
			--|#line 746 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 746 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 746")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_98
			--|#line 748 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 748 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 748")
end

yyval52 := new_constraint_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_99
			--|#line 750 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 750 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 750")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_100
			--|#line 754 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 754 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 754")
end

yyval52 := new_constraint_named_type (Void, yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp52 := yyvsp52 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_101
			--|#line 756 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 756 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 756")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_102
			--|#line 758 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 758 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 758")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_103
			--|#line 760 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 760 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 760")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_104
			--|#line 762 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 762 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 762")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_105
			--|#line 764 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 764 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 764")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_106
			--|#line 766 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 766 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 766")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_107
			--|#line 768 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 768 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 768")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_108
			--|#line 770 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 770 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 770")
end

yyval52 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_109
			--|#line 772 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 772 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 772")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_110
			--|#line 774 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 774 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 774")
end

yyval52 := new_constraint_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_111
			--|#line 776 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 776 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 776")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_112
			--|#line 778 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 778 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 778")
end

yyval52 := yyvs90.item (yyvsp90) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp90 := yyvsp90 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_113
			--|#line 780 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 780 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 780")
end

yyval52 := new_constraint_named_type (Void, yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp52 := yyvsp52 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_114
			--|#line 782 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 782 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 782")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_115
			--|#line 784 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 784 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 784")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_116
			--|#line 786 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 786 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 786")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_117
			--|#line 788 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 788 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 788")
end

yyval52 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_118
			--|#line 790 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 790 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 790")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_119
			--|#line 792 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 792 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 792")
end

yyval52 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_120
			--|#line 794 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 794 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 794")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_121
			--|#line 796 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 796 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 796")
end

yyval52 := new_constraint_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_122
			--|#line 798 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_TYPE
		do
--|#line 798 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 798")
end

yyval52 := new_constraint_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs50.item (yyvsp50)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp52 := yyvsp52 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp50 := yyvsp50 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_123
			--|#line 802 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 802 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 802")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp50 := yyvsp50 + 1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_124
			--|#line 804 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 804 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 804")
end

yyval50 := yyvs50.item (yyvsp50) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_125
			--|#line 808 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 808 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 808")
end

yyval50 := ast_factory.new_constraint_actual_parameters (yyvs22.item (yyvsp22), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp22 := yyvsp22 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_126
			--|#line 811 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 811 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 811")
end

			yyval50 := yyvs50.item (yyvsp50)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_127
			--|#line 819 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 819 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 819")
end

			if attached yyvs52.item (yyvsp52) as l_constraint_type then
				yyval50 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval50 /= Void then
					yyval50.put_first (l_constraint_type)
				end
			else
				yyval50 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp52 := yyvsp52 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_128
			--|#line 830 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 830 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 830")
end

			yyval50 := yyvs50.item (yyvsp50)
			add_to_constraint_actual_parameter_list (yyvs49.item (yyvsp49), yyval50)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp49 := yyvsp49 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_129
			--|#line 835 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 835 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 835")
end

			yyval50 := yyvs50.item (yyvsp50)
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_actual_parameter_comma (new_constraint_named_type (Void, yyvs12.item (yyvsp12), Void), yyvs5.item (yyvsp5)), yyval50)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_130
			--|#line 842 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 842 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 842")
end

			yyval49 := ast_factory.new_constraint_actual_parameter_comma (yyvs52.item (yyvsp52), yyvs5.item (yyvsp5))
			if yyval49 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp49 := yyvsp49 + 1
	yyvsp52 := yyvsp52 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
		end

	yy_do_action_131
			--|#line 851 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 851 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 851")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp50 := yyvsp50 + 1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_132
			--|#line 853 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 853 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 853")
end

yyval50 := yyvs50.item (yyvsp50) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_133
			--|#line 857 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 857 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 857")
end

yyval50 := ast_factory.new_constraint_actual_parameters (yyvs22.item (yyvsp22), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp22 := yyvsp22 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_134
			--|#line 860 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 860 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 860")
end

			yyval50 := yyvs50.item (yyvsp50)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_135
			--|#line 866 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 866 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 866")
end

			yyval50 := yyvs50.item (yyvsp50)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_136
			--|#line 874 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 874 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 874")
end

			yyval50 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_actual_parameter (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5 - 1), yyvs52.item (yyvsp52)), yyval50)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp50 := yyvsp50 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -2
	yyvsp52 := yyvsp52 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_137
			--|#line 879 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 879 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 879")
end

			yyval50 := yyvs50.item (yyvsp50)
			add_to_constraint_actual_parameter_list (yyvs49.item (yyvsp49), yyvs50.item (yyvsp50))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp49 := yyvsp49 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_138
			--|#line 884 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 884 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 884")
end

			yyval50 := yyvs50.item (yyvsp50)
			add_to_constraint_actual_parameter_list (yyvs49.item (yyvsp49), yyvs50.item (yyvsp50))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp49 := yyvsp49 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_139
			--|#line 889 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 889 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 889")
end

			yyval50 := yyvs50.item (yyvsp50)
			if yyval50 /= Void then
				if not yyval50.is_empty then
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyval50.first.type), yyval50)
				else
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), Void), yyval50)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
		end

	yy_do_action_140
			--|#line 902 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 902 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 902")
end

			yyval49 := ast_factory.new_constraint_labeled_actual_parameter (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs52.item (yyvsp52))
			if yyval49 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp49 := yyvsp49 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp52 := yyvsp52 -1
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
		end

	yy_do_action_141
			--|#line 911 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 911 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 911")
end

			yyval49 := ast_factory.new_constraint_labeled_actual_parameter_semicolon (ast_factory.new_constraint_labeled_actual_parameter (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs52.item (yyvsp52)), yyvs21.item (yyvsp21))
			if yyval49 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp49 := yyvsp49 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp52 := yyvsp52 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
		end

	yy_do_action_142
			--|#line 922 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_OBSOLETE
		do
--|#line 922 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 922")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp99 := yyvsp99 + 1
	if yyvsp99 >= yyvsc99 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs99")
		end
		yyvsc99 := yyvsc99 + yyInitial_yyvs_size
		yyvs99 := yyspecial_routines99.aliased_resized_area (yyvs99, yyvsc99)
	end
	yyspecial_routines99.force (yyvs99, yyval99, yyvsp99)
end
		end

	yy_do_action_143
			--|#line 924 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_OBSOLETE
		do
--|#line 924 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 924")
end

yyval99 := ast_factory.new_obsolete_message (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp99 := yyvsp99 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp99 >= yyvsc99 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs99")
		end
		yyvsc99 := yyvsc99 + yyInitial_yyvs_size
		yyvs99 := yyspecial_routines99.aliased_resized_area (yyvs99, yyvsc99)
	end
	yyspecial_routines99.force (yyvs99, yyval99, yyvsp99)
end
		end

	yy_do_action_144
			--|#line 930 "et_eiffel_parser.y"
		local
			yyval102: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 930 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 930")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp102 := yyvsp102 + 1
	if yyvsp102 >= yyvsc102 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs102")
		end
		yyvsc102 := yyvsc102 + yyInitial_yyvs_size
		yyvs102 := yyspecial_routines102.aliased_resized_area (yyvs102, yyvsc102)
	end
	yyspecial_routines102.force (yyvs102, yyval102, yyvsp102)
end
		end

	yy_do_action_145
			--|#line 932 "et_eiffel_parser.y"
		local
			yyval102: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 932 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 932")
end

			yyval102 := yyvs102.item (yyvsp102)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines102.force (yyvs102, yyval102, yyvsp102)
end
		end

	yy_do_action_146
			--|#line 939 "et_eiffel_parser.y"
		local
			yyval102: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 939 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 939")
end

			if attached yyvs104.item (yyvsp104) as l_inheritance_clause then
				yyval102 := ast_factory.new_parent_clauses (counter_value + 1)
				if yyval102 /= Void then
					yyval102.put_first (l_inheritance_clause)
				end
			else
				yyval102 := ast_factory.new_parent_clauses (counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp102 := yyvsp102 + 1
	yyvsp104 := yyvsp104 -1
	if yyvsp102 >= yyvsc102 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs102")
		end
		yyvsc102 := yyvsc102 + yyInitial_yyvs_size
		yyvs102 := yyspecial_routines102.aliased_resized_area (yyvs102, yyvsc102)
	end
	yyspecial_routines102.force (yyvs102, yyval102, yyvsp102)
end
		end

	yy_do_action_147
			--|#line 950 "et_eiffel_parser.y"
		local
			yyval102: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 950 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 950")
end

			yyval102 := yyvs102.item (yyvsp102)
			if yyval102 /= Void and attached yyvs104.item (yyvsp104) as l_inheritance_clause then
				yyval102.put_first (l_inheritance_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp102 := yyvsp102 -1
	yyvsp104 := yyvsp104 -1
	yyspecial_routines102.force (yyvs102, yyval102, yyvsp102)
end
		end

	yy_do_action_148
			--|#line 950 "et_eiffel_parser.y"
		local
			yyval102: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 950 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 950")
end

			if yyvs104.item (yyvsp104) /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp102 := yyvsp102 + 1
	if yyvsp102 >= yyvsc102 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs102")
		end
		yyvsc102 := yyvsc102 + yyInitial_yyvs_size
		yyvs102 := yyspecial_routines102.aliased_resized_area (yyvs102, yyvsc102)
	end
	yyspecial_routines102.force (yyvs102, yyval102, yyvsp102)
end
		end

	yy_do_action_149
			--|#line 965 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_PARENT_LIST
		do
--|#line 965 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 965")
end

			yyval104 := ast_factory.new_parents (yyvs2.item (yyvsp2), 0)
			if yyval104 /= Void then
				yyval104.set_clients_clause (yyvs45.item (yyvsp45))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp104 := yyvsp104 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp45 := yyvsp45 -1
	if yyvsp104 >= yyvsc104 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs104")
		end
		yyvsc104 := yyvsc104 + yyInitial_yyvs_size
		yyvs104 := yyspecial_routines104.aliased_resized_area (yyvs104, yyvsc104)
	end
	yyspecial_routines104.force (yyvs104, yyval104, yyvsp104)
end
		end

	yy_do_action_150
			--|#line 972 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_PARENT_LIST
		do
--|#line 972 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 972")
end

			yyval104 := yyvs104.item (yyvsp104)
			if yyval104 /= Void then
				yyval104.set_clients_clause (yyvs45.item (yyvsp45))
			end
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp104 := yyvsp104 -1
	yyvsp2 := yyvsp2 -1
	yyvsp45 := yyvsp45 -1
	yyspecial_routines104.force (yyvs104, yyval104, yyvsp104)
end
		end

	yy_do_action_151
			--|#line 972 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_PARENT_LIST
		do
--|#line 972 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 972")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp104 := yyvsp104 + 1
	if yyvsp104 >= yyvsc104 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs104")
		end
		yyvsc104 := yyvsc104 + yyInitial_yyvs_size
		yyvs104 := yyspecial_routines104.aliased_resized_area (yyvs104, yyvsc104)
	end
	yyspecial_routines104.force (yyvs104, yyval104, yyvsp104)
end
		end

	yy_do_action_152
			--|#line 988 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_PARENT
		do
--|#line 988 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 988")
end

			yyval101 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), Void, Void, Void, Void, Void, Void)
			if yyval101 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp101 := yyvsp101 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp101 >= yyvsc101 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs101")
		end
		yyvsc101 := yyvsc101 + yyInitial_yyvs_size
		yyvs101 := yyspecial_routines101.aliased_resized_area (yyvs101, yyvsc101)
	end
	yyspecial_routines101.force (yyvs101, yyval101, yyvsp101)
end
		end

	yy_do_action_153
			--|#line 995 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_PARENT
		do
--|#line 995 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 995")
end

			yyval101 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), yyvs111.item (yyvsp111), yyvs63.item (yyvsp63), yyvs89.item (yyvsp89 - 2), yyvs89.item (yyvsp89 - 1), yyvs89.item (yyvsp89), yyvs2.item (yyvsp2))
			if yyval101 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp101 := yyvsp101 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	yyvsp111 := yyvsp111 -1
	yyvsp63 := yyvsp63 -1
	yyvsp89 := yyvsp89 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp101 >= yyvsc101 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs101")
		end
		yyvsc101 := yyvsc101 + yyInitial_yyvs_size
		yyvs101 := yyspecial_routines101.aliased_resized_area (yyvs101, yyvsc101)
	end
	yyspecial_routines101.force (yyvs101, yyval101, yyvsp101)
end
		end

	yy_do_action_154
			--|#line 1003 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_PARENT
		do
--|#line 1003 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1003")
end

			yyval101 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), Void, yyvs63.item (yyvsp63), yyvs89.item (yyvsp89 - 2), yyvs89.item (yyvsp89 - 1), yyvs89.item (yyvsp89), yyvs2.item (yyvsp2))
			if yyval101 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp101 := yyvsp101 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	yyvsp63 := yyvsp63 -1
	yyvsp89 := yyvsp89 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp101 >= yyvsc101 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs101")
		end
		yyvsc101 := yyvsc101 + yyInitial_yyvs_size
		yyvs101 := yyspecial_routines101.aliased_resized_area (yyvs101, yyvsc101)
	end
	yyspecial_routines101.force (yyvs101, yyval101, yyvsp101)
end
		end

	yy_do_action_155
			--|#line 1010 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_PARENT
		do
--|#line 1010 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1010")
end

			yyval101 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), Void, Void, yyvs89.item (yyvsp89 - 2), yyvs89.item (yyvsp89 - 1), yyvs89.item (yyvsp89), yyvs2.item (yyvsp2))
			if yyval101 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp101 := yyvsp101 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	yyvsp89 := yyvsp89 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp101 >= yyvsc101 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs101")
		end
		yyvsc101 := yyvsc101 + yyInitial_yyvs_size
		yyvs101 := yyspecial_routines101.aliased_resized_area (yyvs101, yyvsc101)
	end
	yyspecial_routines101.force (yyvs101, yyval101, yyvsp101)
end
		end

	yy_do_action_156
			--|#line 1017 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_PARENT
		do
--|#line 1017 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1017")
end

			yyval101 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), Void, Void, Void, yyvs89.item (yyvsp89 - 1), yyvs89.item (yyvsp89), yyvs2.item (yyvsp2))
			if yyval101 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp101 := yyvsp101 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	yyvsp89 := yyvsp89 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp101 >= yyvsc101 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs101")
		end
		yyvsc101 := yyvsc101 + yyInitial_yyvs_size
		yyvs101 := yyspecial_routines101.aliased_resized_area (yyvs101, yyvsc101)
	end
	yyspecial_routines101.force (yyvs101, yyval101, yyvsp101)
end
		end

	yy_do_action_157
			--|#line 1024 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_PARENT
		do
--|#line 1024 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1024")
end

			yyval101 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), Void, Void, Void, Void, yyvs89.item (yyvsp89), yyvs2.item (yyvsp2))
			if yyval101 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp101 := yyvsp101 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	yyvsp89 := yyvsp89 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp101 >= yyvsc101 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs101")
		end
		yyvsc101 := yyvsc101 + yyInitial_yyvs_size
		yyvs101 := yyspecial_routines101.aliased_resized_area (yyvs101, yyvsc101)
	end
	yyspecial_routines101.force (yyvs101, yyval101, yyvsp101)
end
		end

	yy_do_action_158
			--|#line 1033 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_PARENT_LIST
		do
--|#line 1033 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1033")
end

			yyval104 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval104 /= Void and attached yyvs101.item (yyvsp101) as l_parent then
				yyval104.put_first (l_parent)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp104 := yyvsp104 + 1
	yyvsp101 := yyvsp101 -1
	if yyvsp104 >= yyvsc104 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs104")
		end
		yyvsc104 := yyvsc104 + yyInitial_yyvs_size
		yyvs104 := yyspecial_routines104.aliased_resized_area (yyvs104, yyvsc104)
	end
	yyspecial_routines104.force (yyvs104, yyval104, yyvsp104)
end
		end

	yy_do_action_159
			--|#line 1040 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_PARENT_LIST
		do
--|#line 1040 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1040")
end

			yyval104 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval104 /= Void and attached yyvs103.item (yyvsp103) as l_parent then
				yyval104.put_first (l_parent)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp104 := yyvsp104 + 1
	yyvsp103 := yyvsp103 -1
	if yyvsp104 >= yyvsc104 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs104")
		end
		yyvsc104 := yyvsc104 + yyInitial_yyvs_size
		yyvs104 := yyspecial_routines104.aliased_resized_area (yyvs104, yyvsc104)
	end
	yyspecial_routines104.force (yyvs104, yyval104, yyvsp104)
end
		end

	yy_do_action_160
			--|#line 1047 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_PARENT_LIST
		do
--|#line 1047 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1047")
end

			yyval104 := yyvs104.item (yyvsp104)
			if yyval104 /= Void and attached yyvs101.item (yyvsp101) as l_parent then
				yyval104.put_first (l_parent)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp101 := yyvsp101 -1
	yyspecial_routines104.force (yyvs104, yyval104, yyvsp104)
end
		end

	yy_do_action_161
			--|#line 1054 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_PARENT_LIST
		do
--|#line 1054 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1054")
end

			yyval104 := yyvs104.item (yyvsp104)
			if yyval104 /= Void and attached yyvs103.item (yyvsp103) as l_parent then
				yyval104.put_first (l_parent)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp103 := yyvsp103 -1
	yyspecial_routines104.force (yyvs104, yyval104, yyvsp104)
end
		end

	yy_do_action_162
			--|#line 1063 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_PARENT_ITEM
		do
--|#line 1063 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1063")
end

			yyval103 := ast_factory.new_parent_semicolon (yyvs101.item (yyvsp101), yyvs21.item (yyvsp21))
			if yyval103 /= Void and yyvs101.item (yyvsp101) = Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp103 := yyvsp103 + 1
	yyvsp101 := yyvsp101 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp103 >= yyvsc103 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs103")
		end
		yyvsc103 := yyvsc103 + yyInitial_yyvs_size
		yyvs103 := yyspecial_routines103.aliased_resized_area (yyvs103, yyvsc103)
	end
	yyspecial_routines103.force (yyvs103, yyval103, yyvsp103)
end
		end

	yy_do_action_163
			--|#line 1074 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_RENAME_LIST
		do
--|#line 1074 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1074")
end

yyval111 := ast_factory.new_renames (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp111 := yyvsp111 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp111 >= yyvsc111 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs111")
		end
		yyvsc111 := yyvsc111 + yyInitial_yyvs_size
		yyvs111 := yyspecial_routines111.aliased_resized_area (yyvs111, yyvsc111)
	end
	yyspecial_routines111.force (yyvs111, yyval111, yyvsp111)
end
		end

	yy_do_action_164
			--|#line 1076 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_RENAME_LIST
		do
--|#line 1076 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1076")
end

			yyval111 := yyvs111.item (yyvsp111)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp111 := yyvsp111 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines111.force (yyvs111, yyval111, yyvsp111)
end
		end

	yy_do_action_165
			--|#line 1076 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_RENAME_LIST
		do
--|#line 1076 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1076")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp111 := yyvsp111 + 1
	if yyvsp111 >= yyvsc111 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs111")
		end
		yyvsc111 := yyvsc111 + yyInitial_yyvs_size
		yyvs111 := yyspecial_routines111.aliased_resized_area (yyvs111, yyvsc111)
	end
	yyspecial_routines111.force (yyvs111, yyval111, yyvsp111)
end
		end

	yy_do_action_166
			--|#line 1089 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_RENAME_LIST
		do
--|#line 1089 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1089")
end

			yyval111 := ast_factory.new_renames (last_keyword, counter_value)
			if yyval111 /= Void and attached yyvs110.item (yyvsp110) as l_rename then
				yyval111.put_first (l_rename)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp111 := yyvsp111 + 1
	yyvsp110 := yyvsp110 -1
	if yyvsp111 >= yyvsc111 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs111")
		end
		yyvsc111 := yyvsc111 + yyInitial_yyvs_size
		yyvs111 := yyspecial_routines111.aliased_resized_area (yyvs111, yyvsc111)
	end
	yyspecial_routines111.force (yyvs111, yyval111, yyvsp111)
end
		end

	yy_do_action_167
			--|#line 1096 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_RENAME_LIST
		do
--|#line 1096 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1096")
end

			yyval111 := ast_factory.new_renames (last_keyword, counter_value)
			if yyval111 /= Void and attached yyvs110.item (yyvsp110) as l_rename then
				yyval111.put_first (l_rename)
			end
				-- TODO: syntax error.
			raise_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp111 := yyvsp111 + 1
	yyvsp110 := yyvsp110 -1
	if yyvsp111 >= yyvsc111 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs111")
		end
		yyvsc111 := yyvsc111 + yyInitial_yyvs_size
		yyvs111 := yyspecial_routines111.aliased_resized_area (yyvs111, yyvsc111)
	end
	yyspecial_routines111.force (yyvs111, yyval111, yyvsp111)
end
		end

	yy_do_action_168
			--|#line 1105 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_RENAME_LIST
		do
--|#line 1105 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1105")
end

			yyval111 := yyvs111.item (yyvsp111)
			if yyval111 /= Void and attached yyvs110.item (yyvsp110) as l_rename then
				yyval111.put_first (l_rename)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp110 := yyvsp110 -1
	yyspecial_routines111.force (yyvs111, yyval111, yyvsp111)
end
		end

	yy_do_action_169
			--|#line 1114 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_RENAME_ITEM
		do
--|#line 1114 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1114")
end

			yyval110 := ast_factory.new_rename (yyvs71.item (yyvsp71), yyvs2.item (yyvsp2), yyvs66.item (yyvsp66))
			if yyval110 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp110 := yyvsp110 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp2 := yyvsp2 -1
	yyvsp66 := yyvsp66 -1
	if yyvsp110 >= yyvsc110 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs110")
		end
		yyvsc110 := yyvsc110 + yyInitial_yyvs_size
		yyvs110 := yyspecial_routines110.aliased_resized_area (yyvs110, yyvsc110)
	end
	yyspecial_routines110.force (yyvs110, yyval110, yyvsp110)
end
		end

	yy_do_action_170
			--|#line 1123 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_RENAME_ITEM
		do
--|#line 1123 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1123")
end

			yyval110 := ast_factory.new_rename_comma (yyvs71.item (yyvsp71), yyvs2.item (yyvsp2), yyvs66.item (yyvsp66), yyvs5.item (yyvsp5))
			if yyval110 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp110 := yyvsp110 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp2 := yyvsp2 -1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp110 >= yyvsc110 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs110")
		end
		yyvsc110 := yyvsc110 + yyInitial_yyvs_size
		yyvs110 := yyspecial_routines110.aliased_resized_area (yyvs110, yyvsc110)
	end
	yyspecial_routines110.force (yyvs110, yyval110, yyvsp110)
end
		end

	yy_do_action_171
			--|#line 1134 "et_eiffel_parser.y"
		local
			yyval63: detachable ET_EXPORT_LIST
		do
--|#line 1134 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1134")
end

yyval63 := ast_factory.new_exports (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp63 := yyvsp63 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp63 >= yyvsc63 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs63")
		end
		yyvsc63 := yyvsc63 + yyInitial_yyvs_size
		yyvs63 := yyspecial_routines63.aliased_resized_area (yyvs63, yyvsc63)
	end
	yyspecial_routines63.force (yyvs63, yyval63, yyvsp63)
end
		end

	yy_do_action_172
			--|#line 1136 "et_eiffel_parser.y"
		local
			yyval63: detachable ET_EXPORT_LIST
		do
--|#line 1136 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1136")
end

			yyval63 := yyvs63.item (yyvsp63)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp63 := yyvsp63 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines63.force (yyvs63, yyval63, yyvsp63)
end
		end

	yy_do_action_173
			--|#line 1136 "et_eiffel_parser.y"
		local
			yyval63: detachable ET_EXPORT_LIST
		do
--|#line 1136 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1136")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp63 := yyvsp63 + 1
	if yyvsp63 >= yyvsc63 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs63")
		end
		yyvsc63 := yyvsc63 + yyInitial_yyvs_size
		yyvs63 := yyspecial_routines63.aliased_resized_area (yyvs63, yyvsc63)
	end
	yyspecial_routines63.force (yyvs63, yyval63, yyvsp63)
end
		end

	yy_do_action_174
			--|#line 1149 "et_eiffel_parser.y"
		local
			yyval63: detachable ET_EXPORT_LIST
		do
--|#line 1149 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1149")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp63 := yyvsp63 + 1
	if yyvsp63 >= yyvsc63 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs63")
		end
		yyvsc63 := yyvsc63 + yyInitial_yyvs_size
		yyvs63 := yyspecial_routines63.aliased_resized_area (yyvs63, yyvsc63)
	end
	yyspecial_routines63.force (yyvs63, yyval63, yyvsp63)
end
		end

	yy_do_action_175
			--|#line 1151 "et_eiffel_parser.y"
		local
			yyval63: detachable ET_EXPORT_LIST
		do
--|#line 1151 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1151")
end

yyval63 := yyvs63.item (yyvsp63) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines63.force (yyvs63, yyval63, yyvsp63)
end
		end

	yy_do_action_176
			--|#line 1155 "et_eiffel_parser.y"
		local
			yyval63: detachable ET_EXPORT_LIST
		do
--|#line 1155 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1155")
end

			if attached yyvs62.item (yyvsp62) as l_new_export then
				yyval63 := ast_factory.new_exports (last_keyword, counter_value + 1)
				if yyval63 /= Void then
					yyval63.put_first (l_new_export)
				end
			else
				yyval63 := ast_factory.new_exports (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp63 := yyvsp63 + 1
	yyvsp62 := yyvsp62 -1
	if yyvsp63 >= yyvsc63 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs63")
		end
		yyvsc63 := yyvsc63 + yyInitial_yyvs_size
		yyvs63 := yyspecial_routines63.aliased_resized_area (yyvs63, yyvsc63)
	end
	yyspecial_routines63.force (yyvs63, yyval63, yyvsp63)
end
		end

	yy_do_action_177
			--|#line 1166 "et_eiffel_parser.y"
		local
			yyval63: detachable ET_EXPORT_LIST
		do
--|#line 1166 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1166")
end

			yyval63 := yyvs63.item (yyvsp63)
			if yyval63 /= Void and attached yyvs62.item (yyvsp62) as l_new_export then
				yyval63.put_first (l_new_export)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp63 := yyvsp63 -1
	yyvsp62 := yyvsp62 -1
	yyspecial_routines63.force (yyvs63, yyval63, yyvsp63)
end
		end

	yy_do_action_178
			--|#line 1166 "et_eiffel_parser.y"
		local
			yyval63: detachable ET_EXPORT_LIST
		do
--|#line 1166 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1166")
end

			if yyvs62.item (yyvsp62) /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp63 := yyvsp63 + 1
	if yyvsp63 >= yyvsc63 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs63")
		end
		yyvsc63 := yyvsc63 + yyInitial_yyvs_size
		yyvs63 := yyspecial_routines63.aliased_resized_area (yyvs63, yyvsc63)
	end
	yyspecial_routines63.force (yyvs63, yyval63, yyvsp63)
end
		end

	yy_do_action_179
			--|#line 1181 "et_eiffel_parser.y"
		local
			yyval62: detachable ET_EXPORT
		do
--|#line 1181 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1181")
end

			yyval62 := ast_factory.new_all_export (yyvs45.item (yyvsp45), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp62 := yyvsp62 + 1
	yyvsp45 := yyvsp45 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp62 >= yyvsc62 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs62")
		end
		yyvsc62 := yyvsc62 + yyInitial_yyvs_size
		yyvs62 := yyspecial_routines62.aliased_resized_area (yyvs62, yyvsc62)
	end
	yyspecial_routines62.force (yyvs62, yyval62, yyvsp62)
end
		end

	yy_do_action_180
			--|#line 1185 "et_eiffel_parser.y"
		local
			yyval62: detachable ET_EXPORT
		do
--|#line 1185 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1185")
end

			last_export_clients := yyvs45.item (yyvsp45)
			yyval62 := ast_factory.new_feature_export (last_export_clients, 0)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp45 := yyvsp45 -1
	if yyvsp62 >= yyvsc62 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs62")
		end
		yyvsc62 := yyvsc62 + yyInitial_yyvs_size
		yyvs62 := yyspecial_routines62.aliased_resized_area (yyvs62, yyvsc62)
	end
	yyspecial_routines62.force (yyvs62, yyval62, yyvsp62)
end
		end

	yy_do_action_181
			--|#line 1190 "et_eiffel_parser.y"
		local
			yyval62: detachable ET_EXPORT
		do
--|#line 1190 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1190")
end

			yyval62 := yyvs70.item (yyvsp70)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 -1
	yyvsp70 := yyvsp70 -1
	yyspecial_routines62.force (yyvs62, yyval62, yyvsp62)
end
		end

	yy_do_action_182
			--|#line 1190 "et_eiffel_parser.y"
		local
			yyval62: detachable ET_EXPORT
		do
--|#line 1190 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1190")
end

			last_export_clients := yyvs45.item (yyvsp45)
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp62 := yyvsp62 + 1
	if yyvsp62 >= yyvsc62 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs62")
		end
		yyvsc62 := yyvsc62 + yyInitial_yyvs_size
		yyvs62 := yyspecial_routines62.aliased_resized_area (yyvs62, yyvsc62)
	end
	yyspecial_routines62.force (yyvs62, yyval62, yyvsp62)
end
		end

	yy_do_action_183
			--|#line 1200 "et_eiffel_parser.y"
		local
			yyval62: detachable ET_EXPORT
		do
--|#line 1200 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1200")
end

yyval62 := ast_factory.new_null_export (yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp62 := yyvsp62 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp62 >= yyvsc62 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs62")
		end
		yyvsc62 := yyvsc62 + yyInitial_yyvs_size
		yyvs62 := yyspecial_routines62.aliased_resized_area (yyvs62, yyvsc62)
	end
	yyspecial_routines62.force (yyvs62, yyval62, yyvsp62)
end
		end

	yy_do_action_184
			--|#line 1204 "et_eiffel_parser.y"
		local
			yyval70: detachable ET_FEATURE_EXPORT
		do
--|#line 1204 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1204")
end

			if attached yyvs71.item (yyvsp71) as l_feature_name then
				yyval70 := ast_factory.new_feature_export (last_export_clients, counter_value + 1)
				if yyval70 /= Void then
					yyval70.put_first (l_feature_name)
				end
			else
				yyval70 := ast_factory.new_feature_export (last_export_clients, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp71 := yyvsp71 -1
	if yyvsp70 >= yyvsc70 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs70")
		end
		yyvsc70 := yyvsc70 + yyInitial_yyvs_size
		yyvs70 := yyspecial_routines70.aliased_resized_area (yyvs70, yyvsc70)
	end
	yyspecial_routines70.force (yyvs70, yyval70, yyvsp70)
end
		end

	yy_do_action_185
			--|#line 1215 "et_eiffel_parser.y"
		local
			yyval70: detachable ET_FEATURE_EXPORT
		do
--|#line 1215 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1215")
end

			yyval70 := ast_factory.new_feature_export (last_export_clients, counter_value)
			if yyval70 /= Void and attached yyvs72.item (yyvsp72) as l_feature_name then
				yyval70.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp70 := yyvsp70 + 1
	yyvsp72 := yyvsp72 -1
	if yyvsp70 >= yyvsc70 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs70")
		end
		yyvsc70 := yyvsc70 + yyInitial_yyvs_size
		yyvs70 := yyspecial_routines70.aliased_resized_area (yyvs70, yyvsc70)
	end
	yyspecial_routines70.force (yyvs70, yyval70, yyvsp70)
end
		end

	yy_do_action_186
			--|#line 1223 "et_eiffel_parser.y"
		local
			yyval70: detachable ET_FEATURE_EXPORT
		do
--|#line 1223 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1223")
end

			yyval70 := yyvs70.item (yyvsp70)
			if yyval70 /= Void and attached yyvs72.item (yyvsp72) as l_feature_name then
				yyval70.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 -1
	yyspecial_routines70.force (yyvs70, yyval70, yyvsp70)
end
		end

	yy_do_action_187
			--|#line 1234 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENTS
		do
--|#line 1234 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1234")
end

			yyval45 := yyvs45.item (yyvsp45)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
		end

	yy_do_action_188
			--|#line 1234 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENTS
		do
--|#line 1234 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1234")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp45 := yyvsp45 + 1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
		end

	yy_do_action_189
			--|#line 1245 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENTS
		do
--|#line 1245 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1245")
end

yyval45 := ast_factory.new_none_clients (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp45 := yyvsp45 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
		end

	yy_do_action_190
			--|#line 1249 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENTS
		do
--|#line 1249 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1249")
end

			yyval45 := ast_factory.new_clients (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval45 /= Void and attached yyvs44.item (yyvsp44) as l_client then
				yyval45.put_first (l_client)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp45 := yyvsp45 + 1
	yyvsp44 := yyvsp44 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
		end

	yy_do_action_191
			--|#line 1256 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENTS
		do
--|#line 1256 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1256")
end

			yyval45 := ast_factory.new_clients (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval45 /= Void and attached yyvs44.item (yyvsp44) as l_client then
				yyval45.put_first (l_client)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp45 := yyvsp45 + 1
	yyvsp44 := yyvsp44 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
		end

	yy_do_action_192
			--|#line 1264 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENTS
		do
--|#line 1264 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1264")
end

			yyval45 := yyvs45.item (yyvsp45)
			if yyval45 /= Void and attached yyvs44.item (yyvsp44) as l_client then
				yyval45.put_first (l_client)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp44 := yyvsp44 -1
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
		end

	yy_do_action_193
			--|#line 1271 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENTS
		do
--|#line 1271 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1271")
end

			yyval45 := yyvs45.item (yyvsp45)
			if yyval45 /= Void and attached yyvs44.item (yyvsp44) as l_client then
				yyval45.put_first (l_client)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp44 := yyvsp44 -1
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
		end

	yy_do_action_194
			--|#line 1281 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLIENT_ITEM
		do
--|#line 1281 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1281")
end

			yyval44 := new_client (yyvs12.item (yyvsp12))
			if yyval44 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp44 := yyvsp44 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
		end

	yy_do_action_195
			--|#line 1290 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLIENT_ITEM
		do
--|#line 1290 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1290")
end

			yyval44 := new_client_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5))
			if yyval44 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp44 := yyvsp44 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
		end

	yy_do_action_196
			--|#line 1300 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENTS
		do
--|#line 1300 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1300")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp45 := yyvsp45 + 1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
		end

	yy_do_action_197
			--|#line 1302 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENTS
		do
--|#line 1302 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1302")
end

yyval45 := yyvs45.item (yyvsp45) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
		end

	yy_do_action_198
			--|#line 1306 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENTS
		do
--|#line 1306 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1306")
end

			yyval45 := ast_factory.new_clients (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 1)
			if yyval45 /= Void and attached new_client (yyvs12.item (yyvsp12)) as l_client then
				yyval45.put_first (l_client)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp12 := yyvsp12 -1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
		end

	yy_do_action_199
			--|#line 1317 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1317 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1317")
end

yyval89 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp89 := yyvsp89 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp89 >= yyvsc89 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs89")
		end
		yyvsc89 := yyvsc89 + yyInitial_yyvs_size
		yyvs89 := yyspecial_routines89.aliased_resized_area (yyvs89, yyvsc89)
	end
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_200
			--|#line 1319 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1319 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1319")
end

			yyval89 := yyvs89.item (yyvsp89)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp89 := yyvsp89 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_201
			--|#line 1319 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1319 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1319")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp89 := yyvsp89 + 1
	if yyvsp89 >= yyvsc89 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs89")
		end
		yyvsc89 := yyvsc89 + yyInitial_yyvs_size
		yyvs89 := yyspecial_routines89.aliased_resized_area (yyvs89, yyvsc89)
	end
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_202
			--|#line 1332 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1332 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1332")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp89 := yyvsp89 + 1
	if yyvsp89 >= yyvsc89 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs89")
		end
		yyvsc89 := yyvsc89 + yyInitial_yyvs_size
		yyvs89 := yyspecial_routines89.aliased_resized_area (yyvs89, yyvsc89)
	end
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_203
			--|#line 1334 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1334 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1334")
end

yyval89 := yyvs89.item (yyvsp89) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_204
			--|#line 1338 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1338 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1338")
end

yyval89 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp89 := yyvsp89 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp89 >= yyvsc89 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs89")
		end
		yyvsc89 := yyvsc89 + yyInitial_yyvs_size
		yyvs89 := yyspecial_routines89.aliased_resized_area (yyvs89, yyvsc89)
	end
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_205
			--|#line 1340 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1340 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1340")
end

			yyval89 := yyvs89.item (yyvsp89)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp89 := yyvsp89 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_206
			--|#line 1340 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1340 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1340")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp89 := yyvsp89 + 1
	if yyvsp89 >= yyvsc89 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs89")
		end
		yyvsc89 := yyvsc89 + yyInitial_yyvs_size
		yyvs89 := yyspecial_routines89.aliased_resized_area (yyvs89, yyvsc89)
	end
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_207
			--|#line 1353 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1353 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1353")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp89 := yyvsp89 + 1
	if yyvsp89 >= yyvsc89 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs89")
		end
		yyvsc89 := yyvsc89 + yyInitial_yyvs_size
		yyvs89 := yyspecial_routines89.aliased_resized_area (yyvs89, yyvsc89)
	end
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_208
			--|#line 1355 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1355 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1355")
end

yyval89 := yyvs89.item (yyvsp89) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_209
			--|#line 1359 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1359 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1359")
end

yyval89 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp89 := yyvsp89 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp89 >= yyvsc89 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs89")
		end
		yyvsc89 := yyvsc89 + yyInitial_yyvs_size
		yyvs89 := yyspecial_routines89.aliased_resized_area (yyvs89, yyvsc89)
	end
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_210
			--|#line 1361 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1361 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1361")
end

			yyval89 := yyvs89.item (yyvsp89)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp89 := yyvsp89 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_211
			--|#line 1361 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1361 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1361")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp89 := yyvsp89 + 1
	if yyvsp89 >= yyvsc89 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs89")
		end
		yyvsc89 := yyvsc89 + yyInitial_yyvs_size
		yyvs89 := yyspecial_routines89.aliased_resized_area (yyvs89, yyvsc89)
	end
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_212
			--|#line 1374 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1374 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1374")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp89 := yyvsp89 + 1
	if yyvsp89 >= yyvsc89 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs89")
		end
		yyvsc89 := yyvsc89 + yyInitial_yyvs_size
		yyvs89 := yyspecial_routines89.aliased_resized_area (yyvs89, yyvsc89)
	end
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_213
			--|#line 1376 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1376 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1376")
end

yyval89 := yyvs89.item (yyvsp89) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_214
			--|#line 1380 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1380 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1380")
end

			if attached yyvs71.item (yyvsp71) as l_feature_name then
				yyval89 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value + 1)
				if yyval89 /= Void then
					yyval89.put_first (l_feature_name)
				end
			else
				yyval89 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp89 := yyvsp89 + 1
	yyvsp71 := yyvsp71 -1
	if yyvsp89 >= yyvsc89 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs89")
		end
		yyvsc89 := yyvsc89 + yyInitial_yyvs_size
		yyvs89 := yyspecial_routines89.aliased_resized_area (yyvs89, yyvsc89)
	end
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_215
			--|#line 1391 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1391 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1391")
end

			yyval89 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			if yyval89 /= Void and attached yyvs72.item (yyvsp72) as l_feature_name then
				yyval89.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp89 := yyvsp89 + 1
	yyvsp72 := yyvsp72 -1
	if yyvsp89 >= yyvsc89 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs89")
		end
		yyvsc89 := yyvsc89 + yyInitial_yyvs_size
		yyvs89 := yyspecial_routines89.aliased_resized_area (yyvs89, yyvsc89)
	end
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_216
			--|#line 1399 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1399 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1399")
end

			yyval89 := yyvs89.item (yyvsp89)
			if yyval89 /= Void and attached yyvs72.item (yyvsp72) as l_feature_name then
				yyval89.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 -1
	yyspecial_routines89.force (yyvs89, yyval89, yyvsp89)
end
		end

	yy_do_action_217
			--|#line 1408 "et_eiffel_parser.y"
		local
			yyval72: detachable ET_FEATURE_NAME_ITEM
		do
--|#line 1408 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1408")
end

			yyval72 := ast_factory.new_feature_name_comma (yyvs71.item (yyvsp71), yyvs5.item (yyvsp5))
			if yyval72 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp72 >= yyvsc72 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs72")
		end
		yyvsc72 := yyvsc72 + yyInitial_yyvs_size
		yyvs72 := yyspecial_routines72.aliased_resized_area (yyvs72, yyvsc72)
	end
	yyspecial_routines72.force (yyvs72, yyval72, yyvsp72)
end
		end

	yy_do_action_218
			--|#line 1419 "et_eiffel_parser.y"
		local
			yyval58: detachable ET_CREATOR_LIST
		do
--|#line 1419 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1419")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp58 := yyvsp58 + 1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
		end

	yy_do_action_219
			--|#line 1421 "et_eiffel_parser.y"
		local
			yyval58: detachable ET_CREATOR_LIST
		do
--|#line 1421 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1421")
end

			yyval58 := yyvs58.item (yyvsp58)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
		end

	yy_do_action_220
			--|#line 1428 "et_eiffel_parser.y"
		local
			yyval58: detachable ET_CREATOR_LIST
		do
--|#line 1428 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1428")
end

			if attached yyvs57.item (yyvsp57) as l_creation_clause then
				yyval58 := ast_factory.new_creators (counter_value + 1)
				if yyval58 /= Void then
					yyval58.put_first (l_creation_clause)
				end
			else
				yyval58 := ast_factory.new_creators (counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp58 := yyvsp58 + 1
	yyvsp57 := yyvsp57 -1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
		end

	yy_do_action_221
			--|#line 1439 "et_eiffel_parser.y"
		local
			yyval58: detachable ET_CREATOR_LIST
		do
--|#line 1439 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1439")
end

			yyval58 := yyvs58.item (yyvsp58)
			if yyval58 /= Void and attached yyvs57.item (yyvsp57) as l_creation_clause then
				yyval58.put_first (l_creation_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp58 := yyvsp58 -1
	yyvsp57 := yyvsp57 -1
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
		end

	yy_do_action_222
			--|#line 1439 "et_eiffel_parser.y"
		local
			yyval58: detachable ET_CREATOR_LIST
		do
--|#line 1439 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1439")
end

			if yyvs57.item (yyvsp57) /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp58 := yyvsp58 + 1
	if yyvsp58 >= yyvsc58 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs58")
		end
		yyvsc58 := yyvsc58 + yyInitial_yyvs_size
		yyvs58 := yyspecial_routines58.aliased_resized_area (yyvs58, yyvsc58)
	end
	yyspecial_routines58.force (yyvs58, yyval58, yyvsp58)
end
		end

	yy_do_action_223
			--|#line 1454 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1454 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1454")
end

yyval57 := ast_factory.new_creator (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp57 := yyvsp57 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp45 := yyvsp45 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_224
			--|#line 1456 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1456 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1456")
end

yyval57 := ast_factory.new_creator (yyvs2.item (yyvsp2), new_any_clients (yyvs2.item (yyvsp2)), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_225
			--|#line 1458 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1458 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1458")
end

			yyval57 := yyvs57.item (yyvsp57)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp57 := yyvsp57 -1
	yyvsp2 := yyvsp2 -1
	yyvsp45 := yyvsp45 -1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_226
			--|#line 1458 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1458 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1458")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := yyvs45.item (yyvsp45)
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp57 := yyvsp57 + 1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_227
			--|#line 1470 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1470 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1470")
end

			yyval57 := yyvs57.item (yyvsp57)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp57 := yyvsp57 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_228
			--|#line 1470 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1470 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1470")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := new_any_clients (last_keyword)
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp57 := yyvsp57 + 1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_229
			--|#line 1482 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1482 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1482")
end

yyval57 := ast_factory.new_creator (yyvs2.item (yyvsp2), yyvs45.item (yyvsp45), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp57 := yyvsp57 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp45 := yyvsp45 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_230
			--|#line 1484 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1484 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1484")
end

yyval57 := ast_factory.new_creator (yyvs2.item (yyvsp2), new_any_clients (yyvs2.item (yyvsp2)), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_231
			--|#line 1486 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1486 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1486")
end

			yyval57 := yyvs57.item (yyvsp57)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp57 := yyvsp57 -1
	yyvsp2 := yyvsp2 -1
	yyvsp45 := yyvsp45 -1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_232
			--|#line 1486 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1486 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1486")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := yyvs45.item (yyvsp45)
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp57 := yyvsp57 + 1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_233
			--|#line 1498 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1498 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1498")
end

			yyval57 := yyvs57.item (yyvsp57)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp57 := yyvsp57 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_234
			--|#line 1498 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1498 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1498")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := new_any_clients (last_keyword)
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp57 := yyvsp57 + 1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_235
			--|#line 1512 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1512 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1512")
end

			if attached yyvs12.item (yyvsp12) as l_identifier then
				l_identifier.set_feature_name (True)
				yyval57 := ast_factory.new_creator (last_keyword, last_clients, counter_value + 1)
				if yyval57 /= Void then
					yyval57.put_first (l_identifier)
				end
			else
				yyval57 := ast_factory.new_creator (last_keyword, last_clients, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_236
			--|#line 1524 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1524 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1524")
end

			if current_system.is_ise then
				raise_error
			else
				yyval57 := ast_factory.new_creator (last_keyword, last_clients, counter_value)
				if yyval57 /= Void and attached yyvs72.item (yyvsp72) as l_creation_procedure then
					yyval57.put_first (l_creation_procedure)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp72 := yyvsp72 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_237
			--|#line 1536 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CREATOR
		do
--|#line 1536 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1536")
end

			yyval57 := yyvs57.item (yyvsp57)
			if yyval57 /= Void and attached yyvs72.item (yyvsp72) as l_creation_procedure then
				yyval57.put_first (l_creation_procedure)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 -1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_238
			--|#line 1545 "et_eiffel_parser.y"
		local
			yyval72: detachable ET_FEATURE_NAME_ITEM
		do
--|#line 1545 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1545")
end

			if attached yyvs12.item (yyvsp12) as l_identifier then
				l_identifier.set_feature_name (True)
				yyval72 := ast_factory.new_feature_name_comma (l_identifier, yyvs5.item (yyvsp5))
			else
				yyval72 := ast_factory.new_feature_name_comma (Void, yyvs5.item (yyvsp5))
			end
			if yyval72 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp72 >= yyvsc72 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs72")
		end
		yyvsc72 := yyvsc72 + yyInitial_yyvs_size
		yyvs72 := yyspecial_routines72.aliased_resized_area (yyvs72, yyvsc72)
	end
	yyspecial_routines72.force (yyvs72, yyval72, yyvsp72)
end
		end

	yy_do_action_239
			--|#line 1561 "et_eiffel_parser.y"
		local
			yyval55: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1561 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1561")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp55 := yyvsp55 + 1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
		end

	yy_do_action_240
			--|#line 1563 "et_eiffel_parser.y"
		local
			yyval55: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1563 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1563")
end

yyval55 := yyvs55.item (yyvsp55) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
		end

	yy_do_action_241
			--|#line 1567 "et_eiffel_parser.y"
		local
			yyval55: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1567 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1567")
end

			yyval55 := yyvs55.item (yyvsp55)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp55 := yyvsp55 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
		end

	yy_do_action_242
			--|#line 1567 "et_eiffel_parser.y"
		local
			yyval55: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1567 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1567")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp55 := yyvsp55 + 1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
		end

	yy_do_action_243
			--|#line 1580 "et_eiffel_parser.y"
		local
			yyval55: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1580 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1580")
end

			yyval55 := ast_factory.new_convert_features (last_keyword, counter_value + 1)
			if yyval55 /= Void and attached yyvs53.item (yyvsp53) as l_convert_feature then
				yyval55.put_first (l_convert_feature)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp53 := yyvsp53 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
		end

	yy_do_action_244
			--|#line 1587 "et_eiffel_parser.y"
		local
			yyval55: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1587 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1587")
end

			yyval55 := ast_factory.new_convert_features (last_keyword, counter_value)
			if yyval55 /= Void and attached yyvs54.item (yyvsp54) as l_convert_feature then
				yyval55.put_first (l_convert_feature)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp54 := yyvsp54 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
		end

	yy_do_action_245
			--|#line 1594 "et_eiffel_parser.y"
		local
			yyval55: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1594 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1594")
end

			yyval55 := yyvs55.item (yyvsp55)
			if yyval55 /= Void and attached yyvs54.item (yyvsp54) as l_convert_feature then
				yyval55.put_first (l_convert_feature)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp54 := yyvsp54 -1
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
		end

	yy_do_action_246
			--|#line 1603 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONVERT_FEATURE_ITEM
		do
--|#line 1603 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1603")
end

			yyval54 := ast_factory.new_convert_feature_comma (yyvs53.item (yyvsp53), yyvs5.item (yyvsp5))
			if yyval54 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp54 := yyvsp54 + 1
	yyvsp53 := yyvsp53 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
		end

	yy_do_action_247
			--|#line 1612 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONVERT_FEATURE
		do
--|#line 1612 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1612")
end

			yyval53 := ast_factory.new_convert_function (yyvs71.item (yyvsp71), yyvs5.item (yyvsp5), yyvs116.item (yyvsp116))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp53 := yyvsp53 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp116 := yyvsp116 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
		end

	yy_do_action_248
			--|#line 1616 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONVERT_FEATURE
		do
--|#line 1616 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1616")
end

			yyval53 := ast_factory.new_convert_procedure (yyvs71.item (yyvsp71), yyvs5.item (yyvsp5 - 1), yyvs116.item (yyvsp116), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp53 := yyvsp53 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -2
	yyvsp116 := yyvsp116 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
		end

	yy_do_action_249
			--|#line 1622 "et_eiffel_parser.y"
		local
			yyval116: detachable ET_TYPE_LIST
		do
--|#line 1622 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1622")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp116 := yyvsp116 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp116 >= yyvsc116 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs116")
		end
		yyvsc116 := yyvsc116 + yyInitial_yyvs_size
		yyvs116 := yyspecial_routines116.aliased_resized_area (yyvs116, yyvsc116)
	end
	yyspecial_routines116.force (yyvs116, yyval116, yyvsp116)
end
		end

	yy_do_action_250
			--|#line 1624 "et_eiffel_parser.y"
		local
			yyval116: detachable ET_TYPE_LIST
		do
--|#line 1624 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1624")
end

			yyval116 := yyvs116.item (yyvsp116)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp116 := yyvsp116 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines116.force (yyvs116, yyval116, yyvsp116)
end
		end

	yy_do_action_251
			--|#line 1624 "et_eiffel_parser.y"
		local
			yyval116: detachable ET_TYPE_LIST
		do
--|#line 1624 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1624")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp116 := yyvsp116 + 1
	if yyvsp116 >= yyvsc116 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs116")
		end
		yyvsc116 := yyvsc116 + yyInitial_yyvs_size
		yyvs116 := yyspecial_routines116.aliased_resized_area (yyvs116, yyvsc116)
	end
	yyspecial_routines116.force (yyvs116, yyval116, yyvsp116)
end
		end

	yy_do_action_252
			--|#line 1637 "et_eiffel_parser.y"
		local
			yyval116: detachable ET_TYPE_LIST
		do
--|#line 1637 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1637")
end

			if attached yyvs114.item (yyvsp114) as l_convert_type then
				yyval116 := ast_factory.new_convert_types (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval116 /= Void then
					yyval116.put_first (l_convert_type)
				end
			else
				yyval116 := ast_factory.new_convert_types (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp116 := yyvsp116 + 1
	yyvsp114 := yyvsp114 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp116 >= yyvsc116 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs116")
		end
		yyvsc116 := yyvsc116 + yyInitial_yyvs_size
		yyvs116 := yyspecial_routines116.aliased_resized_area (yyvs116, yyvsc116)
	end
	yyspecial_routines116.force (yyvs116, yyval116, yyvsp116)
end
		end

	yy_do_action_253
			--|#line 1648 "et_eiffel_parser.y"
		local
			yyval116: detachable ET_TYPE_LIST
		do
--|#line 1648 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1648")
end

			yyval116 := yyvs116.item (yyvsp116)
			if yyval116 /= Void and attached yyvs115.item (yyvsp115) as l_convert_type then
				yyval116.put_first (l_convert_type)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp115 := yyvsp115 -1
	yyspecial_routines116.force (yyvs116, yyval116, yyvsp116)
end
		end

	yy_do_action_254
			--|#line 1657 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_TYPE_ITEM
		do
--|#line 1657 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1657")
end

			yyval115 := ast_factory.new_type_comma (yyvs114.item (yyvsp114), yyvs5.item (yyvsp5))
			if yyval115 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp115 := yyvsp115 + 1
	yyvsp114 := yyvsp114 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp115 >= yyvsc115 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs115")
		end
		yyvsc115 := yyvsc115 + yyInitial_yyvs_size
		yyvs115 := yyspecial_routines115.aliased_resized_area (yyvs115, yyvsc115)
	end
	yyspecial_routines115.force (yyvs115, yyval115, yyvsp115)
end
		end

	yy_do_action_255
			--|#line 1668 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1668 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1668")
end

			-- $$ := Void
			set_class_features
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp69 := yyvsp69 + 1
	if yyvsp69 >= yyvsc69 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs69")
		end
		yyvsc69 := yyvsc69 + yyInitial_yyvs_size
		yyvs69 := yyspecial_routines69.aliased_resized_area (yyvs69, yyvsc69)
	end
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_256
			--|#line 1673 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1673 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1673")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_257
			--|#line 1677 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1677 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1677")
end

			yyval69 := yyvs69.item (yyvsp69)
			set_class_features
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_258
			--|#line 1685 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1685 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1685")
end

			yyval69 := ast_factory.new_feature_clauses (counter_value)
			if yyval69 /= Void and attached yyvs68.item (yyvsp68) as l_feature_clause then
				yyval69.put_first (l_feature_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp68 := yyvsp68 -1
	if yyvsp69 >= yyvsc69 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs69")
		end
		yyvsc69 := yyvsc69 + yyInitial_yyvs_size
		yyvs69 := yyspecial_routines69.aliased_resized_area (yyvs69, yyvsc69)
	end
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_259
			--|#line 1692 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1692 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1692")
end

			yyval69 := yyvs69.item (yyvsp69)
			if yyval69 /= Void and attached yyvs68.item (yyvsp68) as l_feature_clause then
				yyval69.put_first (l_feature_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp68 := yyvsp68 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_260
			--|#line 1701 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_FEATURE_CLAUSE
		do
--|#line 1701 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1701")
end

			yyval68 := last_feature_clause
			if yyval68 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines68.force (yyvs68, yyval68, yyvsp68)
end
		end

	yy_do_action_261
			--|#line 1708 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_FEATURE_CLAUSE
		do
--|#line 1708 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1708")
end

			yyval68 := last_feature_clause
			if yyval68 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines68.force (yyvs68, yyval68, yyvsp68)
end
		end

	yy_do_action_262
			--|#line 1717 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_FEATURE_CLAUSE
		do
--|#line 1717 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1717")
end

			last_clients := yyvs45.item (yyvsp45)
			last_feature_clause := ast_factory.new_feature_clause (yyvs2.item (yyvsp2), last_clients)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp68 := yyvsp68 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp45 := yyvsp45 -1
	if yyvsp68 >= yyvsc68 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs68")
		end
		yyvsc68 := yyvsc68 + yyInitial_yyvs_size
		yyvs68 := yyspecial_routines68.aliased_resized_area (yyvs68, yyvsc68)
	end
	yyspecial_routines68.force (yyvs68, yyval68, yyvsp68)
end
		end

	yy_do_action_263
			--|#line 1722 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_FEATURE_CLAUSE
		do
--|#line 1722 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1722")
end

			last_clients := new_any_clients (yyvs2.item (yyvsp2))
			last_feature_clause := ast_factory.new_feature_clause (yyvs2.item (yyvsp2), last_clients)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp68 := yyvsp68 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp68 >= yyvsc68 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs68")
		end
		yyvsc68 := yyvsc68 + yyInitial_yyvs_size
		yyvs68 := yyspecial_routines68.aliased_resized_area (yyvs68, yyvsc68)
	end
	yyspecial_routines68.force (yyvs68, yyval68, yyvsp68)
end
		end

	yy_do_action_264
			--|#line 1729 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 1729 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1729")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp109 := yyvsp109 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_265
			--|#line 1730 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 1730 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1730")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp107 := yyvsp107 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_266
			--|#line 1731 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 1731 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1731")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp109 := yyvsp109 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_267
			--|#line 1732 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 1732 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1732")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp107 := yyvsp107 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_268
			--|#line 1737 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1737 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1737")
end

			yyval109 := yyvs109.item (yyvsp109)
			register_query (yyval109)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_269
			--|#line 1742 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1742 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1742")
end

			yyval109 := yyvs109.item (yyvsp109)
			if yyval109 /= Void then
				yyval109.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_query (yyval109)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_270
			--|#line 1750 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1750 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1750")
end

			yyval109 := new_query_synonym (ast_factory.new_extended_feature_name_comma (yyvs66.item (yyvsp66), yyvs5.item (yyvsp5)), yyvs109.item (yyvsp109))
			register_query_synonym (yyval109)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_271
			--|#line 1755 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1755 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1755")
end

			yyval109 := new_query_synonym (yyvs66.item (yyvsp66), yyvs109.item (yyvsp109))
			register_query_synonym (yyval109)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp66 := yyvsp66 -1
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_272
			--|#line 1761 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1761 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1761")
end

			yyval109 := new_query_synonym (ast_factory.new_extended_feature_name_comma (yyvs66.item (yyvsp66), yyvs5.item (yyvsp5)), yyvs109.item (yyvsp109))
			if yyval109 /= Void then
				yyval109.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_query_synonym (yyval109)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_273
			--|#line 1769 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1769 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1769")
end

			yyval109 := new_query_synonym (yyvs66.item (yyvsp66), yyvs109.item (yyvsp109))
			if yyval109 /= Void then
				yyval109.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_query_synonym (yyval109)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp66 := yyvsp66 -1
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_274
			--|#line 1780 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1780 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1780")
end

			yyval107 := yyvs107.item (yyvsp107)
			register_procedure (yyval107)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_275
			--|#line 1785 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1785 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1785")
end

			yyval107 := yyvs107.item (yyvsp107)
			if yyval107 /= Void then
				yyval107.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_procedure (yyval107)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_276
			--|#line 1793 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1793 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1793")
end

			yyval107 := new_procedure_synonym (ast_factory.new_extended_feature_name_comma (yyvs66.item (yyvsp66), yyvs5.item (yyvsp5)), yyvs107.item (yyvsp107))
			register_procedure_synonym (yyval107)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_277
			--|#line 1798 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1798 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1798")
end

			yyval107 := new_procedure_synonym (yyvs66.item (yyvsp66), yyvs107.item (yyvsp107))
			register_procedure_synonym (yyval107)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp66 := yyvsp66 -1
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_278
			--|#line 1804 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1804 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1804")
end

			yyval107 := new_procedure_synonym (ast_factory.new_extended_feature_name_comma (yyvs66.item (yyvsp66), yyvs5.item (yyvsp5)), yyvs107.item (yyvsp107))
			if yyval107 /= Void then
				yyval107.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_procedure_synonym (yyval107)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_279
			--|#line 1812 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1812 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1812")
end

			yyval107 := new_procedure_synonym (yyvs66.item (yyvsp66), yyvs107.item (yyvsp107))
			if yyval107 /= Void then
				yyval107.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_procedure_synonym (yyval107)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp66 := yyvsp66 -1
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_280
			--|#line 1823 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1823 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1823")
end

yyval109 := ast_factory.new_attribute (yyvs66.item (yyvsp66), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), Void, last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_281
			--|#line 1825 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1825 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1825")
end

yyval109 := ast_factory.new_attribute (yyvs66.item (yyvsp66), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_282
			--|#line 1827 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1827 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1827")
end

			yyval109 := ast_factory.new_extended_attribute (yyvs66.item (yyvsp66), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs46.item (yyvsp46 - 1), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp2 := yyvsp2 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_283
			--|#line 1831 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1831 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1831")
end

yyval109 := ast_factory.new_constant_attribute (yyvs66.item (yyvsp66), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs2.item (yyvsp2), yyvs48.item (yyvsp48), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp2 := yyvsp2 -1
	yyvsp48 := yyvsp48 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_284
			--|#line 1833 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1833 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1833")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval109 := ast_factory.new_constant_attribute (yyvs66.item (yyvsp66), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs5.item (yyvsp5), yyvs48.item (yyvsp48), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp48 := yyvsp48 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_285
			--|#line 1841 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1841 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1841")
end

yyval109 := ast_factory.new_unique_attribute (yyvs66.item (yyvsp66), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp2 := yyvsp2 -2
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_286
			--|#line 1843 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1843 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1843")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval109 := ast_factory.new_unique_attribute (yyvs66.item (yyvsp66), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs5.item (yyvsp5), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp2 := yyvsp2 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_287
			--|#line 1851 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1851 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1851")
end

yyval109 := ast_factory.new_do_function (yyvs66.item (yyvsp66), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs2.item (yyvsp2 - 1), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs46.item (yyvsp46 - 1), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp2 := yyvsp2 -2
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_288
			--|#line 1854 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1854 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1854")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval109 := ast_factory.new_do_function (yyvs66.item (yyvsp66), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), Void, yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs46.item (yyvsp46 - 1), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp2 := yyvsp2 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_289
			--|#line 1863 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1863 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1863")
end

yyval109 := ast_factory.new_do_function (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs2.item (yyvsp2 - 1), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs46.item (yyvsp46 - 1), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 15
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp2 := yyvsp2 -2
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_290
			--|#line 1867 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1867 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1867")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval109 := ast_factory.new_do_function (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), Void, yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs46.item (yyvsp46 - 1), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp2 := yyvsp2 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_291
			--|#line 1877 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1877 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1877")
end

yyval109 := ast_factory.new_once_function (yyvs66.item (yyvsp66), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs97.item (yyvsp97), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46 - 1)), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 16
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp97 := yyvsp97 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_292
			--|#line 1880 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1880 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1880")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval109 := ast_factory.new_once_function (yyvs66.item (yyvsp66), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), Void, yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs97.item (yyvsp97), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46 - 1)), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 15
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp2 := yyvsp2 -2
	yyvsp97 := yyvsp97 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_293
			--|#line 1889 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1889 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1889")
end

yyval109 := ast_factory.new_once_function (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs97.item (yyvsp97), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46 - 1)), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 17
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp97 := yyvsp97 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_294
			--|#line 1893 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1893 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1893")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval109 := ast_factory.new_once_function (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), Void, yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs97.item (yyvsp97), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46 - 1)), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 16
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp2 := yyvsp2 -2
	yyvsp97 := yyvsp97 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_295
			--|#line 1903 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1903 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1903")
end

yyval109 := ast_factory.new_deferred_function (yyvs66.item (yyvsp66), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs2.item (yyvsp2 - 1), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_296
			--|#line 1905 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1905 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1905")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval109 := ast_factory.new_deferred_function (yyvs66.item (yyvsp66), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), Void, yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs2.item (yyvsp2 - 1), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp2 := yyvsp2 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_297
			--|#line 1913 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1913 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1913")
end

yyval109 := ast_factory.new_deferred_function (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs2.item (yyvsp2 - 1), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_298
			--|#line 1916 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1916 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1916")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval109 := ast_factory.new_deferred_function (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), Void, yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs2.item (yyvsp2 - 1), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp2 := yyvsp2 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_299
			--|#line 1925 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1925 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1925")
end

yyval109 := new_external_function (yyvs66.item (yyvsp66), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs67.item (yyvsp67), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp15 := yyvsp15 -1
	yyvsp67 := yyvsp67 -1
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_300
			--|#line 1928 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1928 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1928")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval109 := new_external_function (yyvs66.item (yyvsp66), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), Void, yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs67.item (yyvsp67), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp67 := yyvsp67 -1
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_301
			--|#line 1937 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1937 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1937")
end

yyval109 := new_external_function (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs67.item (yyvsp67), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 15
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp15 := yyvsp15 -1
	yyvsp67 := yyvsp67 -1
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_302
			--|#line 1941 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_QUERY
		do
--|#line 1941 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1941")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval109 := new_external_function (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs34.item (yyvsp34), Void, yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs67.item (yyvsp67), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp109 := yyvsp109 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp34 := yyvsp34 -1
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp67 := yyvsp67 -1
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp109 >= yyvsc109 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs109")
		end
		yyvsc109 := yyvsc109 + yyInitial_yyvs_size
		yyvs109 := yyspecial_routines109.aliased_resized_area (yyvs109, yyvsc109)
	end
	yyspecial_routines109.force (yyvs109, yyval109, yyvsp109)
end
		end

	yy_do_action_303
			--|#line 1953 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1953 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1953")
end

yyval107 := ast_factory.new_do_procedure (yyvs66.item (yyvsp66), Void, yyvs2.item (yyvsp2 - 1), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs46.item (yyvsp46 - 1), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp107 := yyvsp107 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp2 := yyvsp2 -2
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp107 >= yyvsc107 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs107")
		end
		yyvsc107 := yyvsc107 + yyInitial_yyvs_size
		yyvs107 := yyspecial_routines107.aliased_resized_area (yyvs107, yyvsc107)
	end
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_304
			--|#line 1956 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1956 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1956")
end

yyval107 := ast_factory.new_do_procedure (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), yyvs2.item (yyvsp2 - 1), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs46.item (yyvsp46 - 1), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp107 := yyvsp107 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp2 := yyvsp2 -2
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp107 >= yyvsc107 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs107")
		end
		yyvsc107 := yyvsc107 + yyInitial_yyvs_size
		yyvs107 := yyspecial_routines107.aliased_resized_area (yyvs107, yyvsc107)
	end
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_305
			--|#line 1960 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1960 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1960")
end

yyval107 := ast_factory.new_once_procedure (yyvs66.item (yyvsp66), Void, yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs97.item (yyvsp97), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46 - 1)), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp107 := yyvsp107 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp97 := yyvsp97 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp107 >= yyvsc107 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs107")
		end
		yyvsc107 := yyvsc107 + yyInitial_yyvs_size
		yyvs107 := yyspecial_routines107.aliased_resized_area (yyvs107, yyvsc107)
	end
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_306
			--|#line 1963 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1963 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1963")
end

yyval107 := ast_factory.new_once_procedure (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs97.item (yyvsp97), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46 - 1)), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp107 := yyvsp107 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp97 := yyvsp97 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp107 >= yyvsc107 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs107")
		end
		yyvsc107 := yyvsc107 + yyInitial_yyvs_size
		yyvs107 := yyspecial_routines107.aliased_resized_area (yyvs107, yyvsc107)
	end
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_307
			--|#line 1967 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1967 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1967")
end

yyval107 := ast_factory.new_deferred_procedure (yyvs66.item (yyvsp66), Void, yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs2.item (yyvsp2 - 1), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp107 := yyvsp107 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp107 >= yyvsc107 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs107")
		end
		yyvsc107 := yyvsc107 + yyInitial_yyvs_size
		yyvs107 := yyspecial_routines107.aliased_resized_area (yyvs107, yyvsc107)
	end
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_308
			--|#line 1969 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1969 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1969")
end

yyval107 := ast_factory.new_deferred_procedure (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), yyvs2.item (yyvsp2 - 1), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp107 := yyvsp107 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp107 >= yyvsc107 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs107")
		end
		yyvsc107 := yyvsc107 + yyInitial_yyvs_size
		yyvs107 := yyspecial_routines107.aliased_resized_area (yyvs107, yyvsc107)
	end
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_309
			--|#line 1972 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1972 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1972")
end

yyval107 := new_external_procedure (yyvs66.item (yyvsp66), Void, yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs67.item (yyvsp67), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp107 := yyvsp107 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp15 := yyvsp15 -1
	yyvsp67 := yyvsp67 -1
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp107 >= yyvsc107 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs107")
		end
		yyvsc107 := yyvsc107 + yyInitial_yyvs_size
		yyvs107 := yyspecial_routines107.aliased_resized_area (yyvs107, yyvsc107)
	end
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_310
			--|#line 1975 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PROCEDURE
		do
--|#line 1975 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1975")
end

yyval107 := new_external_procedure (yyvs66.item (yyvsp66), yyvs75.item (yyvsp75), yyvs2.item (yyvsp2 - 2), yyvs80.item (yyvsp80), yyvs99.item (yyvsp99), yyvs106.item (yyvsp106), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs67.item (yyvsp67), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp107 := yyvsp107 + 1
	yyvsp66 := yyvsp66 -1
	yyvsp75 := yyvsp75 -1
	yyvsp2 := yyvsp2 -3
	yyvsp80 := yyvsp80 -1
	yyvsp99 := yyvsp99 -1
	yyvsp106 := yyvsp106 -1
	yyvsp15 := yyvsp15 -1
	yyvsp67 := yyvsp67 -1
	yyvsp105 := yyvsp105 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp107 >= yyvsc107 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs107")
		end
		yyvsc107 := yyvsc107 + yyInitial_yyvs_size
		yyvs107 := yyspecial_routines107.aliased_resized_area (yyvs107, yyvsc107)
	end
	yyspecial_routines107.force (yyvs107, yyval107, yyvsp107)
end
		end

	yy_do_action_311
			--|#line 1981 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 1981 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1981")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval2 := Void
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp2 := yyvsp2 + 1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_312
			--|#line 1989 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 1989 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1989")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_313
			--|#line 1993 "et_eiffel_parser.y"
		local
			yyval21: detachable ET_SEMICOLON_SYMBOL
		do
--|#line 1993 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1993")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp21 := yyvsp21 + 1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_314
			--|#line 1995 "et_eiffel_parser.y"
		local
			yyval21: detachable ET_SEMICOLON_SYMBOL
		do
--|#line 1995 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1995")
end

yyval21 := yyvs21.item (yyvsp21) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_315
			--|#line 1999 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXTERNAL_ALIAS
		do
--|#line 1999 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1999")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp67 := yyvsp67 + 1
	if yyvsp67 >= yyvsc67 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs67")
		end
		yyvsc67 := yyvsc67 + yyInitial_yyvs_size
		yyvs67 := yyspecial_routines67.aliased_resized_area (yyvs67, yyvsc67)
	end
	yyspecial_routines67.force (yyvs67, yyval67, yyvsp67)
end
		end

	yy_do_action_316
			--|#line 2001 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXTERNAL_ALIAS
		do
--|#line 2001 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2001")
end

yyval67 := ast_factory.new_external_alias (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp67 := yyvsp67 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp67 >= yyvsc67 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs67")
		end
		yyvsc67 := yyvsc67 + yyInitial_yyvs_size
		yyvs67 := yyspecial_routines67.aliased_resized_area (yyvs67, yyvsc67)
	end
	yyspecial_routines67.force (yyvs67, yyval67, yyvsp67)
end
		end

	yy_do_action_317
			--|#line 2005 "et_eiffel_parser.y"
		local
			yyval34: detachable ET_ASSIGNER
		do
--|#line 2005 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2005")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp34 := yyvsp34 + 1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
		end

	yy_do_action_318
			--|#line 2007 "et_eiffel_parser.y"
		local
			yyval34: detachable ET_ASSIGNER
		do
--|#line 2007 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2007")
end

yyval34 := ast_factory.new_assigner (yyvs2.item (yyvsp2), yyvs71.item (yyvsp71)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp34 := yyvsp34 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp71 := yyvsp71 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
		end

	yy_do_action_319
			--|#line 2013 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2013 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2013")
end

			if attached yyvs12.item (yyvsp12) as l_identifier then
				l_identifier.set_feature_name (True)
				yyval71 := l_identifier 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp71 := yyvsp71 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_320
			--|#line 2020 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2020 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2020")
end

yyval71 := ast_factory.new_prefix_not_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_321
			--|#line 2022 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2022 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2022")
end

yyval71 := ast_factory.new_prefix_plus_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_322
			--|#line 2024 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2024 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2024")
end

yyval71 := ast_factory.new_prefix_minus_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_323
			--|#line 2026 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2026 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2026")
end

yyval71 := ast_factory.new_prefix_free_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_324
			--|#line 2028 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2028 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2028")
end

yyval71 := ast_factory.new_infix_plus_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_325
			--|#line 2030 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2030 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2030")
end

yyval71 := ast_factory.new_infix_minus_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_326
			--|#line 2032 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2032 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2032")
end

yyval71 := ast_factory.new_infix_times_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_327
			--|#line 2034 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2034 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2034")
end

yyval71 := ast_factory.new_infix_divide_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_328
			--|#line 2036 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2036 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2036")
end

yyval71 := ast_factory.new_infix_div_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_329
			--|#line 2038 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2038 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2038")
end

yyval71 := ast_factory.new_infix_mod_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_330
			--|#line 2040 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2040 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2040")
end

yyval71 := ast_factory.new_infix_power_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_331
			--|#line 2042 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2042 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2042")
end

yyval71 := ast_factory.new_infix_lt_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_332
			--|#line 2044 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2044 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2044")
end

yyval71 := ast_factory.new_infix_le_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_333
			--|#line 2046 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2046 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2046")
end

yyval71 := ast_factory.new_infix_gt_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_334
			--|#line 2048 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2048 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2048")
end

yyval71 := ast_factory.new_infix_ge_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_335
			--|#line 2050 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2050 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2050")
end

yyval71 := ast_factory.new_infix_and_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_336
			--|#line 2052 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2052 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2052")
end

yyval71 := ast_factory.new_infix_and_then_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_337
			--|#line 2054 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2054 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2054")
end

yyval71 := ast_factory.new_infix_or_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_338
			--|#line 2056 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2056 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2056")
end

yyval71 := ast_factory.new_infix_or_else_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_339
			--|#line 2058 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2058 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2058")
end

yyval71 := ast_factory.new_infix_implies_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_340
			--|#line 2060 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2060 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2060")
end

yyval71 := ast_factory.new_infix_xor_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_341
			--|#line 2062 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2062 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2062")
end

yyval71 := ast_factory.new_infix_free_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_342
			--|#line 2065 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2065 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2065")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_343
			--|#line 2067 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2067 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2067")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_344
			--|#line 2069 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2069 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2069")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_345
			--|#line 2071 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2071 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2071")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_346
			--|#line 2073 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2073 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2073")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_347
			--|#line 2075 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2075 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2075")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_348
			--|#line 2077 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2077 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2077")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_349
			--|#line 2079 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2079 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2079")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_350
			--|#line 2081 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2081 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2081")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_351
			--|#line 2083 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2083 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2083")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_352
			--|#line 2085 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2085 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2085")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_353
			--|#line 2087 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2087 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2087")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_354
			--|#line 2089 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2089 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2089")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_355
			--|#line 2091 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2091 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2091")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_356
			--|#line 2093 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2093 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2093")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_357
			--|#line 2095 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2095 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2095")
end

yyval71 := new_invalid_prefix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_358
			--|#line 2097 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2097 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2097")
end

yyval71 := new_invalid_infix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_359
			--|#line 2099 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_FEATURE_NAME
		do
--|#line 2099 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2099")
end

yyval71 := new_invalid_infix_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp71 >= yyvsc71 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs71")
		end
		yyvsc71 := yyvsc71 + yyInitial_yyvs_size
		yyvs71 := yyspecial_routines71.aliased_resized_area (yyvs71, yyvsc71)
	end
	yyspecial_routines71.force (yyvs71, yyval71, yyvsp71)
end
		end

	yy_do_action_360
			--|#line 2103 "et_eiffel_parser.y"
		local
			yyval66: detachable ET_EXTENDED_FEATURE_NAME
		do
--|#line 2103 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2103")
end

yyval66 := yyvs71.item (yyvsp71) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp66 := yyvsp66 + 1
	yyvsp71 := yyvsp71 -1
	if yyvsp66 >= yyvsc66 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs66")
		end
		yyvsc66 := yyvsc66 + yyInitial_yyvs_size
		yyvs66 := yyspecial_routines66.aliased_resized_area (yyvs66, yyvsc66)
	end
	yyspecial_routines66.force (yyvs66, yyval66, yyvsp66)
end
		end

	yy_do_action_361
			--|#line 2105 "et_eiffel_parser.y"
		local
			yyval66: detachable ET_EXTENDED_FEATURE_NAME
		do
--|#line 2105 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2105")
end

			if attached yyvs12.item (yyvsp12) as l_identifier then
				l_identifier.set_feature_name (True)
				yyval66 := ast_factory.new_aliased_feature_name (l_identifier, yyvs33.item (yyvsp33))
			else
				yyval66 := ast_factory.new_aliased_feature_name (Void, yyvs33.item (yyvsp33))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp66 := yyvsp66 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp33 := yyvsp33 -1
	if yyvsp66 >= yyvsc66 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs66")
		end
		yyvsc66 := yyvsc66 + yyInitial_yyvs_size
		yyvs66 := yyspecial_routines66.aliased_resized_area (yyvs66, yyvsc66)
	end
	yyspecial_routines66.force (yyvs66, yyval66, yyvsp66)
end
		end

	yy_do_action_362
			--|#line 2116 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2116 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2116")
end

yyval33 := ast_factory.new_alias_not_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_363
			--|#line 2118 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2118 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2118")
end

yyval33 := ast_factory.new_alias_plus_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_364
			--|#line 2120 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2120 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2120")
end

yyval33 := ast_factory.new_alias_minus_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_365
			--|#line 2122 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2122 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2122")
end

yyval33 := ast_factory.new_alias_times_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_366
			--|#line 2124 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2124 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2124")
end

yyval33 := ast_factory.new_alias_divide_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_367
			--|#line 2126 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2126 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2126")
end

yyval33 := ast_factory.new_alias_div_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_368
			--|#line 2128 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2128 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2128")
end

yyval33 := ast_factory.new_alias_mod_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_369
			--|#line 2130 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2130 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2130")
end

yyval33 := ast_factory.new_alias_power_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_370
			--|#line 2132 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2132 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2132")
end

yyval33 := ast_factory.new_alias_lt_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_371
			--|#line 2134 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2134 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2134")
end

yyval33 := ast_factory.new_alias_le_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_372
			--|#line 2136 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2136 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2136")
end

yyval33 := ast_factory.new_alias_gt_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_373
			--|#line 2138 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2138 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2138")
end

yyval33 := ast_factory.new_alias_ge_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_374
			--|#line 2140 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2140 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2140")
end

yyval33 := ast_factory.new_alias_and_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_375
			--|#line 2142 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2142 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2142")
end

yyval33 := ast_factory.new_alias_and_then_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_376
			--|#line 2144 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2144 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2144")
end

yyval33 := ast_factory.new_alias_or_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_377
			--|#line 2146 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2146 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2146")
end

yyval33 := ast_factory.new_alias_or_else_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_378
			--|#line 2148 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2148 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2148")
end

yyval33 := ast_factory.new_alias_implies_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_379
			--|#line 2150 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2150 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2150")
end

yyval33 := ast_factory.new_alias_xor_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_380
			--|#line 2152 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2152 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2152")
end

yyval33 := ast_factory.new_alias_dotdot_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_381
			--|#line 2154 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2154 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2154")
end

yyval33 := ast_factory.new_alias_free_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_382
			--|#line 2156 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2156 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2156")
end

yyval33 := ast_factory.new_alias_bracket_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_383
			--|#line 2158 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2158 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2158")
end

yyval33 := ast_factory.new_alias_parenthesis_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_384
			--|#line 2160 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2160 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2160")
end

yyval33 := new_invalid_alias_name (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
		end

	yy_do_action_385
			--|#line 2166 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2166 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2166")
end

			yyval75 := yyvs75.item (yyvsp75)
			set_start_closure (yyval75)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines75.force (yyvs75, yyval75, yyvsp75)
end
		end

	yy_do_action_386
			--|#line 2173 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2173 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2173")
end

yyval75 := new_formal_arguments (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp75 := yyvsp75 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp75 >= yyvsc75 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs75")
		end
		yyvsc75 := yyvsc75 + yyInitial_yyvs_size
		yyvs75 := yyspecial_routines75.aliased_resized_area (yyvs75, yyvsc75)
	end
	yyspecial_routines75.force (yyvs75, yyval75, yyvsp75)
end
		end

	yy_do_action_387
			--|#line 2175 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2175 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2175")
end

			yyval75 := yyvs75.item (yyvsp75)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines75.force (yyvs75, yyval75, yyvsp75)
end
		end

	yy_do_action_388
			--|#line 2183 "et_eiffel_parser.y"
		local
			yyval5: detachable ET_SYMBOL
		do
--|#line 2183 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2183")
end

			-- Needed to solve ambiguity when parsing:
			--   agent (a).f
			--   agent (a: A) do ... end
			yyval5 := yyvs5.item (yyvsp5)
			add_symbol (yyval5)
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
		end

	yy_do_action_389
			--|#line 2194 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2194 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2194")
end

			yyval75 := new_formal_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval75 /= Void and attached yyvs74.item (yyvsp74) as l_formal_argument then
				yyval75.put_first (l_formal_argument)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp75 := yyvsp75 + 1
	yyvsp74 := yyvsp74 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp75 >= yyvsc75 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs75")
		end
		yyvsc75 := yyvsc75 + yyInitial_yyvs_size
		yyvs75 := yyspecial_routines75.aliased_resized_area (yyvs75, yyvsc75)
	end
	yyspecial_routines75.force (yyvs75, yyval75, yyvsp75)
end
		end

	yy_do_action_390
			--|#line 2201 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2201 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2201")
end

			yyval75 := new_formal_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval75 /= Void and attached yyvs74.item (yyvsp74) as l_formal_argument then
				yyval75.put_first (l_formal_argument)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp75 := yyvsp75 + 1
	yyvsp74 := yyvsp74 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp75 >= yyvsc75 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs75")
		end
		yyvsc75 := yyvsc75 + yyInitial_yyvs_size
		yyvs75 := yyspecial_routines75.aliased_resized_area (yyvs75, yyvsc75)
	end
	yyspecial_routines75.force (yyvs75, yyval75, yyvsp75)
end
		end

	yy_do_action_391
			--|#line 2208 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2208 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2208")
end

			yyval75 := yyvs75.item (yyvsp75)
			if yyval75 /= Void and attached yyvs73.item (yyvsp73) as l_formal_argument then
				if not yyval75.is_empty then
					l_formal_argument.set_declared_type (yyval75.first.type)
					yyval75.put_first (l_formal_argument)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp73 := yyvsp73 -1
	yyspecial_routines75.force (yyvs75, yyval75, yyvsp75)
end
		end

	yy_do_action_392
			--|#line 2218 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2218 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2218")
end

			-- TODO: Syntax error
			yyval75 := yyvs75.item (yyvsp75)
			if yyval75 /= Void and attached yyvs73.item (yyvsp73) as l_formal_argument then
				if not yyval75.is_empty then
					l_formal_argument.set_declared_type (yyval75.first.type)
					yyval75.put_first (l_formal_argument)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp73 := yyvsp73 -1
	yyspecial_routines75.force (yyvs75, yyval75, yyvsp75)
end
		end

	yy_do_action_393
			--|#line 2229 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2229 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2229")
end

			yyval75 := yyvs75.item (yyvsp75)
			if yyval75 /= Void and attached yyvs74.item (yyvsp74) as l_formal_argument then
				yyval75.put_first (l_formal_argument)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp74 := yyvsp74 -1
	yyspecial_routines75.force (yyvs75, yyval75, yyvsp75)
end
		end

	yy_do_action_394
			--|#line 2236 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2236 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2236")
end

			yyval75 := yyvs75.item (yyvsp75)
			if yyval75 /= Void and attached yyvs74.item (yyvsp74) as l_formal_argument then
				yyval75.put_first (l_formal_argument)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp74 := yyvsp74 -1
	yyspecial_routines75.force (yyvs75, yyval75, yyvsp75)
end
		end

	yy_do_action_395
			--|#line 2245 "et_eiffel_parser.y"
		local
			yyval73: detachable ET_FORMAL_ARGUMENT
		do
--|#line 2245 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2245")
end

			yyval73 := ast_factory.new_formal_comma_argument (ast_factory.new_argument_name_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), dummy_type)
			if yyval73 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp73 := yyvsp73 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp73 >= yyvsc73 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs73")
		end
		yyvsc73 := yyvsc73 + yyInitial_yyvs_size
		yyvs73 := yyspecial_routines73.aliased_resized_area (yyvs73, yyvsc73)
	end
	yyspecial_routines73.force (yyvs73, yyval73, yyvsp73)
end
		end

	yy_do_action_396
			--|#line 2254 "et_eiffel_parser.y"
		local
			yyval73: detachable ET_FORMAL_ARGUMENT
		do
--|#line 2254 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2254")
end

			yyval73 := ast_factory.new_formal_comma_argument (yyvs12.item (yyvsp12), dummy_type)
			if yyval73 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp73 := yyvsp73 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp73 >= yyvsc73 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs73")
		end
		yyvsc73 := yyvsc73 + yyInitial_yyvs_size
		yyvs73 := yyspecial_routines73.aliased_resized_area (yyvs73, yyvsc73)
	end
	yyspecial_routines73.force (yyvs73, yyval73, yyvsp73)
end
		end

	yy_do_action_397
			--|#line 2263 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2263 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2263")
end

			yyval74 := ast_factory.new_formal_argument (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)))
			if yyval74 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp74 := yyvsp74 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	if yyvsp74 >= yyvsc74 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs74")
		end
		yyvsc74 := yyvsc74 + yyInitial_yyvs_size
		yyvs74 := yyspecial_routines74.aliased_resized_area (yyvs74, yyvsc74)
	end
	yyspecial_routines74.force (yyvs74, yyval74, yyvsp74)
end
		end

	yy_do_action_398
			--|#line 2272 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2272 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2272")
end

			yyval74 := ast_factory.new_formal_argument_semicolon (ast_factory.new_formal_argument (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114))), yyvs21.item (yyvsp21))
			if yyval74 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp74 := yyvsp74 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp74 >= yyvsc74 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs74")
		end
		yyvsc74 := yyvsc74 + yyInitial_yyvs_size
		yyvs74 := yyspecial_routines74.aliased_resized_area (yyvs74, yyvsc74)
	end
	yyspecial_routines74.force (yyvs74, yyval74, yyvsp74)
end
		end

	yy_do_action_399
			--|#line 2283 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2283 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2283")
end

yyval93 := Void 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp93 := yyvsp93 + 1
	if yyvsp93 >= yyvsc93 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs93")
		end
		yyvsc93 := yyvsc93 + yyInitial_yyvs_size
		yyvs93 := yyspecial_routines93.aliased_resized_area (yyvs93, yyvsc93)
	end
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_400
			--|#line 2285 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2285 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2285")
end

yyval93 := new_local_variables (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp93 := yyvsp93 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp93 >= yyvsc93 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs93")
		end
		yyvsc93 := yyvsc93 + yyInitial_yyvs_size
		yyvs93 := yyspecial_routines93.aliased_resized_area (yyvs93, yyvsc93)
	end
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_401
			--|#line 2287 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2287 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2287")
end

			yyval93 := yyvs93.item (yyvsp93)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp93 := yyvsp93 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_402
			--|#line 2287 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2287 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2287")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp93 := yyvsp93 + 1
	if yyvsp93 >= yyvsc93 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs93")
		end
		yyvsc93 := yyvsc93 + yyInitial_yyvs_size
		yyvs93 := yyspecial_routines93.aliased_resized_area (yyvs93, yyvsc93)
	end
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_403
			--|#line 2300 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2300 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2300")
end

			yyval93 := new_local_variables (last_keyword, counter_value)
			if yyval93 /= Void and attached yyvs92.item (yyvsp92) as l_local_variable then
				yyval93.put_first (l_local_variable)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp93 := yyvsp93 + 1
	yyvsp92 := yyvsp92 -1
	if yyvsp93 >= yyvsc93 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs93")
		end
		yyvsc93 := yyvsc93 + yyInitial_yyvs_size
		yyvs93 := yyspecial_routines93.aliased_resized_area (yyvs93, yyvsc93)
	end
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_404
			--|#line 2307 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2307 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2307")
end

			yyval93 := new_local_variables (last_keyword, counter_value)
			if yyval93 /= Void and attached yyvs92.item (yyvsp92) as l_local_variable then
				yyval93.put_first (l_local_variable)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp93 := yyvsp93 + 1
	yyvsp92 := yyvsp92 -1
	if yyvsp93 >= yyvsc93 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs93")
		end
		yyvsc93 := yyvsc93 + yyInitial_yyvs_size
		yyvs93 := yyspecial_routines93.aliased_resized_area (yyvs93, yyvsc93)
	end
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_405
			--|#line 2314 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2314 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2314")
end

			yyval93 := yyvs93.item (yyvsp93)
			if yyval93 /= Void and attached yyvs91.item (yyvsp91) as l_local_variable then
				if not yyval93.is_empty then
					l_local_variable.set_declared_type (yyval93.first.type)
					yyval93.put_first (l_local_variable)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp91 := yyvsp91 -1
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_406
			--|#line 2324 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2324 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2324")
end

			-- TODO: Syntax error
			yyval93 := yyvs93.item (yyvsp93)
			if yyval93 /= Void and attached yyvs91.item (yyvsp91) as l_local_variable then
				if not yyval93.is_empty then
					l_local_variable.set_declared_type (yyval93.first.type)
					yyval93.put_first (l_local_variable)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp91 := yyvsp91 -1
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_407
			--|#line 2335 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2335 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2335")
end

			yyval93 := yyvs93.item (yyvsp93)
			if yyval93 /= Void and attached yyvs92.item (yyvsp92) as l_local_variable then
				yyval93.put_first (l_local_variable)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp92 := yyvsp92 -1
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_408
			--|#line 2342 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2342 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2342")
end

			yyval93 := yyvs93.item (yyvsp93)
			if yyval93 /= Void and attached yyvs92.item (yyvsp92) as l_local_variable then
				yyval93.put_first (l_local_variable)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp92 := yyvsp92 -1
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_409
			--|#line 2351 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_LOCAL_VARIABLE
		do
--|#line 2351 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2351")
end

			yyval91 := ast_factory.new_local_comma_variable (ast_factory.new_local_name_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), dummy_type)
			if yyval91 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp91 := yyvsp91 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp91 >= yyvsc91 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs91")
		end
		yyvsc91 := yyvsc91 + yyInitial_yyvs_size
		yyvs91 := yyspecial_routines91.aliased_resized_area (yyvs91, yyvsc91)
	end
	yyspecial_routines91.force (yyvs91, yyval91, yyvsp91)
end
		end

	yy_do_action_410
			--|#line 2360 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_LOCAL_VARIABLE
		do
--|#line 2360 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2360")
end

			yyval91 := ast_factory.new_local_comma_variable (yyvs12.item (yyvsp12), dummy_type)
			if yyval91 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp91 := yyvsp91 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp91 >= yyvsc91 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs91")
		end
		yyvsc91 := yyvsc91 + yyInitial_yyvs_size
		yyvs91 := yyspecial_routines91.aliased_resized_area (yyvs91, yyvsc91)
	end
	yyspecial_routines91.force (yyvs91, yyval91, yyvsp91)
end
		end

	yy_do_action_411
			--|#line 2369 "et_eiffel_parser.y"
		local
			yyval92: detachable ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2369 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2369")
end

			yyval92 := ast_factory.new_local_variable (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)))
			if yyval92 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp92 := yyvsp92 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	if yyvsp92 >= yyvsc92 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs92")
		end
		yyvsc92 := yyvsc92 + yyInitial_yyvs_size
		yyvs92 := yyspecial_routines92.aliased_resized_area (yyvs92, yyvsc92)
	end
	yyspecial_routines92.force (yyvs92, yyval92, yyvsp92)
end
		end

	yy_do_action_412
			--|#line 2378 "et_eiffel_parser.y"
		local
			yyval92: detachable ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2378 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2378")
end

			yyval92 := ast_factory.new_local_variable_semicolon (ast_factory.new_local_variable (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114))), yyvs21.item (yyvsp21))
			if yyval92 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp92 := yyvsp92 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp92 >= yyvsc92 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs92")
		end
		yyvsc92 := yyvsc92 + yyInitial_yyvs_size
		yyvs92 := yyspecial_routines92.aliased_resized_area (yyvs92, yyvsc92)
	end
	yyspecial_routines92.force (yyvs92, yyval92, yyvsp92)
end
		end

	yy_do_action_413
			--|#line 2389 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2389 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2389")
end

add_expression_assertion (yyvs64.item (yyvsp64), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp64 := yyvsp64 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_414
			--|#line 2391 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2391 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2391")
end

add_expression_assertion (yyvs64.item (yyvsp64), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_415
			--|#line 2393 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2393 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2393")
end

add_tagged_assertion (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_416
			--|#line 2395 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2395 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2395")
end

add_tagged_assertion (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_417
			--|#line 2397 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2397 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2397")
end

add_expression_assertion (yyvs64.item (yyvsp64), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_418
			--|#line 2399 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2399 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2399")
end

add_expression_assertion (yyvs64.item (yyvsp64), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp21 := yyvsp21 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_419
			--|#line 2401 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2401")
end

add_tagged_assertion (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_420
			--|#line 2403 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2403 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2403")
end

add_tagged_assertion (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp21 := yyvsp21 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_421
			--|#line 2407 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2407 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2407")
end

start_assertions 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_422
			--|#line 2411 "et_eiffel_parser.y"
		local
			yyval106: detachable ET_PRECONDITIONS
		do
--|#line 2411 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2411")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp106 := yyvsp106 + 1
	if yyvsp106 >= yyvsc106 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs106")
		end
		yyvsc106 := yyvsc106 + yyInitial_yyvs_size
		yyvs106 := yyspecial_routines106.aliased_resized_area (yyvs106, yyvsc106)
	end
	yyspecial_routines106.force (yyvs106, yyval106, yyvsp106)
end
		end

	yy_do_action_423
			--|#line 2413 "et_eiffel_parser.y"
		local
			yyval106: detachable ET_PRECONDITIONS
		do
--|#line 2413 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2413")
end

yyval106 := new_preconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp106 := yyvsp106 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	if yyvsp106 >= yyvsc106 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs106")
		end
		yyvsc106 := yyvsc106 + yyInitial_yyvs_size
		yyvs106 := yyspecial_routines106.aliased_resized_area (yyvs106, yyvsc106)
	end
	yyspecial_routines106.force (yyvs106, yyval106, yyvsp106)
end
		end

	yy_do_action_424
			--|#line 2415 "et_eiffel_parser.y"
		local
			yyval106: detachable ET_PRECONDITIONS
		do
--|#line 2415 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2415")
end

yyval106 := new_preconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp106 := yyvsp106 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp106 >= yyvsc106 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs106")
		end
		yyvsc106 := yyvsc106 + yyInitial_yyvs_size
		yyvs106 := yyspecial_routines106.aliased_resized_area (yyvs106, yyvsc106)
	end
	yyspecial_routines106.force (yyvs106, yyval106, yyvsp106)
end
		end

	yy_do_action_425
			--|#line 2417 "et_eiffel_parser.y"
		local
			yyval106: detachable ET_PRECONDITIONS
		do
--|#line 2417 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2417")
end

yyval106 := new_preconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp106 := yyvsp106 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp106 >= yyvsc106 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs106")
		end
		yyvsc106 := yyvsc106 + yyInitial_yyvs_size
		yyvs106 := yyspecial_routines106.aliased_resized_area (yyvs106, yyvsc106)
	end
	yyspecial_routines106.force (yyvs106, yyval106, yyvsp106)
end
		end

	yy_do_action_426
			--|#line 2419 "et_eiffel_parser.y"
		local
			yyval106: detachable ET_PRECONDITIONS
		do
--|#line 2419 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2419")
end

yyval106 := new_preconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp106 := yyvsp106 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -2
	if yyvsp106 >= yyvsc106 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs106")
		end
		yyvsc106 := yyvsc106 + yyInitial_yyvs_size
		yyvs106 := yyspecial_routines106.aliased_resized_area (yyvs106, yyvsc106)
	end
	yyspecial_routines106.force (yyvs106, yyval106, yyvsp106)
end
		end

	yy_do_action_427
			--|#line 2423 "et_eiffel_parser.y"
		local
			yyval105: detachable ET_POSTCONDITIONS
		do
--|#line 2423 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2423")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp105 := yyvsp105 + 1
	if yyvsp105 >= yyvsc105 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs105")
		end
		yyvsc105 := yyvsc105 + yyInitial_yyvs_size
		yyvs105 := yyspecial_routines105.aliased_resized_area (yyvs105, yyvsc105)
	end
	yyspecial_routines105.force (yyvs105, yyval105, yyvsp105)
end
		end

	yy_do_action_428
			--|#line 2425 "et_eiffel_parser.y"
		local
			yyval105: detachable ET_POSTCONDITIONS
		do
--|#line 2425 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2425")
end

yyval105 := new_postconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp105 := yyvsp105 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	if yyvsp105 >= yyvsc105 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs105")
		end
		yyvsc105 := yyvsc105 + yyInitial_yyvs_size
		yyvs105 := yyspecial_routines105.aliased_resized_area (yyvs105, yyvsc105)
	end
	yyspecial_routines105.force (yyvs105, yyval105, yyvsp105)
end
		end

	yy_do_action_429
			--|#line 2427 "et_eiffel_parser.y"
		local
			yyval105: detachable ET_POSTCONDITIONS
		do
--|#line 2427 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2427")
end

yyval105 := new_postconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp105 := yyvsp105 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp105 >= yyvsc105 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs105")
		end
		yyvsc105 := yyvsc105 + yyInitial_yyvs_size
		yyvs105 := yyspecial_routines105.aliased_resized_area (yyvs105, yyvsc105)
	end
	yyspecial_routines105.force (yyvs105, yyval105, yyvsp105)
end
		end

	yy_do_action_430
			--|#line 2429 "et_eiffel_parser.y"
		local
			yyval105: detachable ET_POSTCONDITIONS
		do
--|#line 2429 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2429")
end

yyval105 := new_postconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp105 := yyvsp105 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp105 >= yyvsc105 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs105")
		end
		yyvsc105 := yyvsc105 + yyInitial_yyvs_size
		yyvs105 := yyspecial_routines105.aliased_resized_area (yyvs105, yyvsc105)
	end
	yyspecial_routines105.force (yyvs105, yyval105, yyvsp105)
end
		end

	yy_do_action_431
			--|#line 2431 "et_eiffel_parser.y"
		local
			yyval105: detachable ET_POSTCONDITIONS
		do
--|#line 2431 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2431")
end

yyval105 := new_postconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp105 := yyvsp105 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -2
	if yyvsp105 >= yyvsc105 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs105")
		end
		yyvsc105 := yyvsc105 + yyInitial_yyvs_size
		yyvs105 := yyspecial_routines105.aliased_resized_area (yyvs105, yyvsc105)
	end
	yyspecial_routines105.force (yyvs105, yyval105, yyvsp105)
end
		end

	yy_do_action_432
			--|#line 2435 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INVARIANTS
		do
--|#line 2435 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2435")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp88 := yyvsp88 + 1
	if yyvsp88 >= yyvsc88 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs88")
		end
		yyvsc88 := yyvsc88 + yyInitial_yyvs_size
		yyvs88 := yyspecial_routines88.aliased_resized_area (yyvs88, yyvsc88)
	end
	yyspecial_routines88.force (yyvs88, yyval88, yyvsp88)
end
		end

	yy_do_action_433
			--|#line 2437 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INVARIANTS
		do
--|#line 2437 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2437")
end

yyval88 := yyvs88.item (yyvsp88) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines88.force (yyvs88, yyval88, yyvsp88)
end
		end

	yy_do_action_434
			--|#line 2441 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INVARIANTS
		do
--|#line 2441 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2441")
end

yyval88 := new_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp88 := yyvsp88 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp88 >= yyvsc88 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs88")
		end
		yyvsc88 := yyvsc88 + yyInitial_yyvs_size
		yyvs88 := yyspecial_routines88.aliased_resized_area (yyvs88, yyvsc88)
	end
	yyspecial_routines88.force (yyvs88, yyval88, yyvsp88)
end
		end

	yy_do_action_435
			--|#line 2443 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INVARIANTS
		do
--|#line 2443 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2443")
end

yyval88 := new_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp88 := yyvsp88 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	if yyvsp88 >= yyvsc88 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs88")
		end
		yyvsc88 := yyvsc88 + yyInitial_yyvs_size
		yyvs88 := yyspecial_routines88.aliased_resized_area (yyvs88, yyvsc88)
	end
	yyspecial_routines88.force (yyvs88, yyval88, yyvsp88)
end
		end

	yy_do_action_436
			--|#line 2447 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2447 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2447")
end

set_start_closure (Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_437
			--|#line 2451 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_LOOP_INVARIANTS
		do
--|#line 2451 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2451")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp94 := yyvsp94 + 1
	if yyvsp94 >= yyvsc94 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs94")
		end
		yyvsc94 := yyvsc94 + yyInitial_yyvs_size
		yyvs94 := yyspecial_routines94.aliased_resized_area (yyvs94, yyvsc94)
	end
	yyspecial_routines94.force (yyvs94, yyval94, yyvsp94)
end
		end

	yy_do_action_438
			--|#line 2453 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_LOOP_INVARIANTS
		do
--|#line 2453 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2453")
end

yyval94 := yyvs94.item (yyvsp94) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines94.force (yyvs94, yyval94, yyvsp94)
end
		end

	yy_do_action_439
			--|#line 2457 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_LOOP_INVARIANTS
		do
--|#line 2457 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2457")
end

yyval94 := new_loop_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp94 := yyvsp94 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	if yyvsp94 >= yyvsc94 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs94")
		end
		yyvsc94 := yyvsc94 + yyInitial_yyvs_size
		yyvs94 := yyspecial_routines94.aliased_resized_area (yyvs94, yyvsc94)
	end
	yyspecial_routines94.force (yyvs94, yyval94, yyvsp94)
end
		end

	yy_do_action_440
			--|#line 2459 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_LOOP_INVARIANTS
		do
--|#line 2459 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2459")
end

yyval94 := new_loop_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp94 := yyvsp94 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp94 >= yyvsc94 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs94")
		end
		yyvsc94 := yyvsc94 + yyInitial_yyvs_size
		yyvs94 := yyspecial_routines94.aliased_resized_area (yyvs94, yyvsc94)
	end
	yyspecial_routines94.force (yyvs94, yyval94, yyvsp94)
end
		end

	yy_do_action_441
			--|#line 2463 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_VARIANT
		do
--|#line 2463 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2463")
end

yyval117 := ast_factory.new_variant (yyvs2.item (yyvsp2), Void, yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp117 := yyvsp117 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	if yyvsp117 >= yyvsc117 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs117")
		end
		yyvsc117 := yyvsc117 + yyInitial_yyvs_size
		yyvs117 := yyspecial_routines117.aliased_resized_area (yyvs117, yyvsc117)
	end
	yyspecial_routines117.force (yyvs117, yyval117, yyvsp117)
end
		end

	yy_do_action_442
			--|#line 2465 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_VARIANT
		do
--|#line 2465 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2465")
end

yyval117 := ast_factory.new_variant (yyvs2.item (yyvsp2), ast_factory.new_tag (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp117 := yyvsp117 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp64 := yyvsp64 -1
	if yyvsp117 >= yyvsc117 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs117")
		end
		yyvsc117 := yyvsc117 + yyInitial_yyvs_size
		yyvs117 := yyspecial_routines117.aliased_resized_area (yyvs117, yyvsc117)
	end
	yyspecial_routines117.force (yyvs117, yyval117, yyvsp117)
end
		end

	yy_do_action_443
			--|#line 2469 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_VARIANT
		do
--|#line 2469 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2469")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp117 := yyvsp117 + 1
	if yyvsp117 >= yyvsc117 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs117")
		end
		yyvsc117 := yyvsc117 + yyInitial_yyvs_size
		yyvs117 := yyspecial_routines117.aliased_resized_area (yyvs117, yyvsc117)
	end
	yyspecial_routines117.force (yyvs117, yyval117, yyvsp117)
end
		end

	yy_do_action_444
			--|#line 2471 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_VARIANT
		do
--|#line 2471 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2471")
end

yyval117 := yyvs117.item (yyvsp117) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines117.force (yyvs117, yyval117, yyvsp117)
end
		end

	yy_do_action_445
			--|#line 2477 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2477 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2477")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp46 := yyvsp46 + 1
	if yyvsp46 >= yyvsc46 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs46")
		end
		yyvsc46 := yyvsc46 + yyInitial_yyvs_size
		yyvs46 := yyspecial_routines46.aliased_resized_area (yyvs46, yyvsc46)
	end
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_446
			--|#line 2479 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2479 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2479")
end

yyval46 := yyvs46.item (yyvsp46) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_447
			--|#line 2485 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2485 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2485")
end

yyval114 := new_named_type (Void, yyvs12.item (yyvsp12), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp114 := yyvsp114 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_448
			--|#line 2487 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2487 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2487")
end

yyval114 := yyvs114.item (yyvsp114) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_449
			--|#line 2491 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2491 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2491")
end

yyval114 := new_named_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp114 := yyvsp114 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_450
			--|#line 2493 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2493 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2493")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_451
			--|#line 2495 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2495 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2495")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_452
			--|#line 2497 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2497 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2497")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_453
			--|#line 2499 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2499 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2499")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_454
			--|#line 2501 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2501 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2501")
end

yyval114 := new_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_455
			--|#line 2503 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2503 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2503")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_456
			--|#line 2505 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2505 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2505")
end

yyval114 := new_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_457
			--|#line 2507 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2507 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2507")
end

yyval114 := new_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_458
			--|#line 2509 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2509 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2509")
end

yyval114 := new_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_459
			--|#line 2511 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2511 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2511")
end

yyval114 := new_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_460
			--|#line 2513 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2513 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2513")
end

yyval114 := new_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_461
			--|#line 2515 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2515 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2515")
end

yyval114 := yyvs90.item (yyvsp90) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp114 := yyvsp114 + 1
	yyvsp90 := yyvsp90 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_462
			--|#line 2517 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2517 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2517")
end

yyval114 := new_tuple_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp114 := yyvsp114 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_463
			--|#line 2519 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2519 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2519")
end

yyval114 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_464
			--|#line 2521 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2521 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2521")
end

yyval114 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_465
			--|#line 2523 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2523 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2523")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_466
			--|#line 2525 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2525 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2525")
end

yyval114 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_467
			--|#line 2527 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2527 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2527")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_468
			--|#line 2529 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2529 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2529")
end

yyval114 := new_tuple_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_469
			--|#line 2531 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2531 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2531")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_470
			--|#line 2533 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2533 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2533")
end

yyval114 := new_tuple_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_471
			--|#line 2535 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2535 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2535")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_472
			--|#line 2539 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2539 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2539")
end

yyval114 := new_named_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp114 := yyvsp114 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_473
			--|#line 2541 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2541 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2541")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_474
			--|#line 2543 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2543 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2543")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_475
			--|#line 2545 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2545 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2545")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_476
			--|#line 2547 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2547 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2547")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_477
			--|#line 2549 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2549 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2549")
end

yyval114 := new_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_478
			--|#line 2551 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2551 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2551")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_479
			--|#line 2553 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2553 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2553")
end

yyval114 := new_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_480
			--|#line 2555 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2555 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2555")
end

yyval114 := new_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_481
			--|#line 2557 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2557 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2557")
end

yyval114 := new_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_482
			--|#line 2559 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2559 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2559")
end

yyval114 := new_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_483
			--|#line 2561 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2561 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2561")
end

yyval114 := new_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_484
			--|#line 2563 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2563 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2563")
end

yyval114 := yyvs90.item (yyvsp90) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp114 := yyvsp114 + 1
	yyvsp90 := yyvsp90 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_485
			--|#line 2565 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2565 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2565")
end

yyval114 := new_tuple_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp114 := yyvsp114 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_486
			--|#line 2567 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2567 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2567")
end

yyval114 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_487
			--|#line 2569 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2569 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2569")
end

yyval114 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_488
			--|#line 2571 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2571 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2571")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_489
			--|#line 2573 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2573 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2573")
end

yyval114 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_490
			--|#line 2575 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2575 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2575")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_491
			--|#line 2577 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2577 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2577")
end

yyval114 := new_tuple_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_492
			--|#line 2579 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2579 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2579")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_493
			--|#line 2581 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2581 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2581")
end

yyval114 := new_tuple_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_494
			--|#line 2583 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2583 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2583")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_495
			--|#line 2587 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2587 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2587")
end

yyval114 := new_named_type (Void, yyvs12.item (yyvsp12), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp114 := yyvsp114 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_496
			--|#line 2589 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2589 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2589")
end

yyval114 := new_named_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp114 := yyvsp114 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_497
			--|#line 2591 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2591 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2591")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_498
			--|#line 2593 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2593 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2593")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_499
			--|#line 2595 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2595 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2595")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_500
			--|#line 2597 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2597 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2597")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_501
			--|#line 2599 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2599 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2599")
end

yyval114 := new_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_502
			--|#line 2601 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2601 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2601")
end

yyval114 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_503
			--|#line 2603 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2603 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2603")
end

yyval114 := new_named_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_504
			--|#line 2605 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2605 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2605")
end

yyval114 := new_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_505
			--|#line 2607 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2607 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2607")
end

yyval114 := new_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_506
			--|#line 2609 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2609 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2609")
end

yyval114 := new_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_507
			--|#line 2611 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2611 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2611")
end

yyval114 := new_named_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_508
			--|#line 2613 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2613 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2613")
end

yyval114 := yyvs90.item (yyvsp90) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp114 := yyvsp114 + 1
	yyvsp90 := yyvsp90 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_509
			--|#line 2615 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2615 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2615")
end

yyval114 := new_tuple_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp114 := yyvsp114 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_510
			--|#line 2617 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2617 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2617")
end

yyval114 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_511
			--|#line 2619 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2619 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2619")
end

yyval114 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_512
			--|#line 2621 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2621 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2621")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_513
			--|#line 2623 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2623 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2623")
end

yyval114 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_514
			--|#line 2625 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2625 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2625")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_515
			--|#line 2627 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2627 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2627")
end

yyval114 := new_tuple_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_516
			--|#line 2629 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2629 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2629")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_517
			--|#line 2631 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2631 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2631")
end

yyval114 := new_tuple_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_518
			--|#line 2633 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_TYPE
		do
--|#line 2633 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2633")
end

yyval114 := new_tuple_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	if yyvsp114 >= yyvsc114 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs114")
		end
		yyvsc114 := yyvsc114 + yyInitial_yyvs_size
		yyvs114 := yyspecial_routines114.aliased_resized_area (yyvs114, yyvsc114)
	end
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_519
			--|#line 2637 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 2637 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2637")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_520
			--|#line 2639 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 2639 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2639")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_521
			--|#line 2643 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2643 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2643")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp28 := yyvsp28 + 1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_522
			--|#line 2645 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2645 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2645")
end

yyval28 := yyvs28.item (yyvsp28) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_523
			--|#line 2649 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2649 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2649")
end

yyval28 := ast_factory.new_actual_parameters (yyvs22.item (yyvsp22), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp28 := yyvsp28 + 1
	yyvsp22 := yyvsp22 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_524
			--|#line 2652 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2652 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2652")
end

			yyval28 := yyvs28.item (yyvsp28)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_525
			--|#line 2660 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2660 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2660")
end

			add_symbol (yyvs22.item (yyvsp22))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_526
			--|#line 2667 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2667 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2667")
end

			if attached yyvs114.item (yyvsp114) as l_type then
				yyval28 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval28 /= Void then
					yyval28.put_first (l_type)
				end
			else
				yyval28 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp28 := yyvsp28 + 1
	yyvsp114 := yyvsp114 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_527
			--|#line 2678 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2678 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2678")
end

			yyval28 := yyvs28.item (yyvsp28)
			add_to_actual_parameter_list (yyvs27.item (yyvsp27), yyval28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_528
			--|#line 2683 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2683 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2683")
end

			yyval28 := yyvs28.item (yyvsp28)
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_named_type (Void, yyvs12.item (yyvsp12), Void), yyvs5.item (yyvsp5)), yyval28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_529
			--|#line 2688 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2688 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2688")
end

			yyval28 := yyvs28.item (yyvsp28)
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_named_type (Void, yyvs12.item (yyvsp12), Void), yyvs5.item (yyvsp5)), yyval28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_530
			--|#line 2693 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2693 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2693")
end

			yyval28 := yyvs28.item (yyvsp28)
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_tuple_type (Void, yyvs12.item (yyvsp12), Void), yyvs5.item (yyvsp5)), yyval28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_531
			--|#line 2700 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2700 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2700")
end

			increment_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_532
			--|#line 2706 "et_eiffel_parser.y"
		local
			yyval27: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2706 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2706")
end

			yyval27 := ast_factory.new_actual_parameter_comma (yyvs114.item (yyvsp114), yyvs5.item (yyvsp5))
			if yyval27 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 + 1
	yyvsp114 := yyvsp114 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp27 >= yyvsc27 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs27")
		end
		yyvsc27 := yyvsc27 + yyInitial_yyvs_size
		yyvs27 := yyspecial_routines27.aliased_resized_area (yyvs27, yyvsc27)
	end
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
		end

	yy_do_action_533
			--|#line 2715 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2715 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2715")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp28 := yyvsp28 + 1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_534
			--|#line 2717 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2717 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2717")
end

yyval28 := yyvs28.item (yyvsp28) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_535
			--|#line 2721 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2721 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2721")
end

yyval28 := ast_factory.new_actual_parameters (yyvs22.item (yyvsp22), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp28 := yyvsp28 + 1
	yyvsp22 := yyvsp22 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_536
			--|#line 2724 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2724 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2724")
end

			yyval28 := yyvs28.item (yyvsp28)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_537
			--|#line 2730 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2730 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2730")
end

			yyval28 := yyvs28.item (yyvsp28)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_538
			--|#line 2738 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2738 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2738")
end

			yyval28 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
			add_to_actual_parameter_list (ast_factory.new_labeled_actual_parameter (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114))), yyval28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp28 := yyvsp28 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_539
			--|#line 2743 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2743 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2743")
end

			yyval28 := yyvs28.item (yyvsp28)
			add_to_actual_parameter_list (yyvs27.item (yyvsp27), yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_540
			--|#line 2748 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2748 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2748")
end

			yyval28 := yyvs28.item (yyvsp28)
			add_to_actual_parameter_list (yyvs27.item (yyvsp27), yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_541
			--|#line 2753 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2753 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2753")
end

			yyval28 := yyvs28.item (yyvsp28)
			if yyval28 /= Void then
				if not yyval28.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyval28.first.type), yyval28)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), Void), yyval28)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_542
			--|#line 2764 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2764 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2764")
end

			yyval28 := yyvs28.item (yyvsp28)
			if yyval28 /= Void then
				if not yyval28.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyval28.first.type), yyval28)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), Void), yyval28)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_543
			--|#line 2775 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2775 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2775")
end

			yyval28 := yyvs28.item (yyvsp28)
			if yyval28 /= Void then
				if not yyval28.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyval28.first.type), yyval28)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), Void), yyval28)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_544
			--|#line 2788 "et_eiffel_parser.y"
		local
			yyval27: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2788 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2788")
end

			yyval27 := ast_factory.new_labeled_actual_parameter (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)))
			if yyval27 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp27 := yyvsp27 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	if yyvsp27 >= yyvsc27 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs27")
		end
		yyvsc27 := yyvsc27 + yyInitial_yyvs_size
		yyvs27 := yyspecial_routines27.aliased_resized_area (yyvs27, yyvsc27)
	end
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
		end

	yy_do_action_545
			--|#line 2797 "et_eiffel_parser.y"
		local
			yyval27: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2797 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2797")
end

			yyval27 := ast_factory.new_labeled_actual_parameter_semicolon (ast_factory.new_labeled_actual_parameter (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114))), yyvs21.item (yyvsp21))
			if yyval27 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp27 := yyvsp27 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp21 := yyvsp21 -1
	if yyvsp27 >= yyvsc27 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs27")
		end
		yyvsc27 := yyvsc27 + yyInitial_yyvs_size
		yyvs27 := yyspecial_routines27.aliased_resized_area (yyvs27, yyvsc27)
	end
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
		end

	yy_do_action_546
			--|#line 2806 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2806 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2806")
end

yyval90 := new_like_feature (Void, yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_547
			--|#line 2808 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2808 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2808")
end

yyval90 := ast_factory.new_like_current (current_universe.implicit_attachment_type_mark, yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp10 := yyvsp10 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_548
			--|#line 2810 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2810 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2810")
end

yyval90 := yyvs108.item (yyvsp108) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp90 := yyvsp90 + 1
	yyvsp108 := yyvsp108 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_549
			--|#line 2814 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2814 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2814")
end

yyval90 := new_like_feature (Void, yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_550
			--|#line 2816 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2816 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2816")
end

yyval90 := new_like_feature (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_551
			--|#line 2818 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2818 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2818")
end

yyval90 := new_like_feature (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_552
			--|#line 2820 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2820 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2820")
end

yyval90 := new_like_feature (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp12 := yyvsp12 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_553
			--|#line 2822 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2822 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2822")
end

yyval90 := new_like_feature (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_554
			--|#line 2824 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2824 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2824")
end

yyval90 := new_like_feature (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp12 := yyvsp12 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_555
			--|#line 2826 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2826 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2826")
end

yyval90 := new_like_feature (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_556
			--|#line 2828 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2828 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2828")
end

yyval90 := new_like_feature (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp90 := yyvsp90 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_557
			--|#line 2830 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2830 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2830")
end

yyval90 := new_like_feature (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_558
			--|#line 2832 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2832 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2832")
end

yyval90 := new_like_feature (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp90 := yyvsp90 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_559
			--|#line 2834 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2834 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2834")
end

yyval90 := ast_factory.new_like_current (current_universe.implicit_attachment_type_mark, yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp10 := yyvsp10 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_560
			--|#line 2836 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2836 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2836")
end

yyval90 := ast_factory.new_like_current (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp10 := yyvsp10 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_561
			--|#line 2838 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2838 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2838")
end

yyval90 := ast_factory.new_like_current (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp10 := yyvsp10 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_562
			--|#line 2840 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2840 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2840")
end

yyval90 := ast_factory.new_like_current (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_563
			--|#line 2842 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2842 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2842")
end

yyval90 := ast_factory.new_like_current (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp10 := yyvsp10 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_564
			--|#line 2844 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2844 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2844")
end

yyval90 := ast_factory.new_like_current (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp90 := yyvsp90 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_565
			--|#line 2846 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2846 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2846")
end

yyval90 := ast_factory.new_like_current (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp10 := yyvsp10 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_566
			--|#line 2848 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2848 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2848")
end

yyval90 := ast_factory.new_like_current (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp90 := yyvsp90 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -2
	yyvsp10 := yyvsp10 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_567
			--|#line 2850 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2850 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2850")
end

yyval90 := ast_factory.new_like_current (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp90 := yyvsp90 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp10 := yyvsp10 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_568
			--|#line 2852 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2852 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2852")
end

yyval90 := ast_factory.new_like_current (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp90 := yyvsp90 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -2
	yyvsp10 := yyvsp10 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_569
			--|#line 2854 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_LIKE_TYPE
		do
--|#line 2854 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2854")
end

yyval90 := yyvs108.item (yyvsp108) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp90 := yyvsp90 + 1
	yyvsp108 := yyvsp108 -1
	if yyvsp90 >= yyvsc90 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs90")
		end
		yyvsc90 := yyvsc90 + yyInitial_yyvs_size
		yyvs90 := yyspecial_routines90.aliased_resized_area (yyvs90, yyvsc90)
	end
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_570
			--|#line 2858 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2858 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2858")
end

yyval108 := ast_factory.new_qualified_like_braced_type (Void, yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_571
			--|#line 2860 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2860 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2860")
end

yyval108 := ast_factory.new_qualified_like_type (Void, yyvs90.item (yyvsp90), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp108 := yyvsp108 + 1
	yyvsp90 := yyvsp90 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_572
			--|#line 2864 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2864 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2864")
end

yyval108 := yyvs108.item (yyvsp108) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_573
			--|#line 2866 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2866 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2866")
end

yyval108 := ast_factory.new_qualified_like_braced_type (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_574
			--|#line 2868 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2868 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2868")
end

yyval108 := ast_factory.new_qualified_like_braced_type (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_575
			--|#line 2870 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2870 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2870")
end

yyval108 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_576
			--|#line 2872 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2872 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2872")
end

yyval108 := ast_factory.new_qualified_like_braced_type (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_577
			--|#line 2874 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2874 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2874")
end

yyval108 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_578
			--|#line 2876 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2876 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2876")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_6_1_0 then
				raise_error
			else
				yyval108 := ast_factory.new_qualified_like_braced_type (yyvs5.item (yyvsp5 - 3), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp108 := yyvsp108 + 1
	yyvsp5 := yyvsp5 -4
	yyvsp2 := yyvsp2 -1
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_579
			--|#line 2884 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2884 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2884")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_6_1_0 then
				raise_error
			else
				yyval108 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5 - 3), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp108 := yyvsp108 + 1
	yyvsp5 := yyvsp5 -4
	yyvsp2 := yyvsp2 -2
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_580
			--|#line 2892 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2892 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2892")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_6_1_0 then
				raise_error
			else
				yyval108 := ast_factory.new_qualified_like_braced_type (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp108 := yyvsp108 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_581
			--|#line 2900 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2900 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2900")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_6_1_0 then
				raise_error
			else
				yyval108 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp108 := yyvsp108 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -2
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_582
			--|#line 2908 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2908 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2908")
end

yyval108 := ast_factory.new_qualified_like_type (yyvs2.item (yyvsp2), yyvs90.item (yyvsp90), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp90 := yyvsp90 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_583
			--|#line 2910 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2910 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2910")
end

yyval108 := ast_factory.new_qualified_like_type (yyvs2.item (yyvsp2), yyvs90.item (yyvsp90), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp90 := yyvsp90 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_584
			--|#line 2912 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2912 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2912")
end

yyval108 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs90.item (yyvsp90), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp90 := yyvsp90 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_585
			--|#line 2914 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2914 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2914")
end

yyval108 := ast_factory.new_qualified_like_type (yyvs2.item (yyvsp2), yyvs90.item (yyvsp90), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp90 := yyvsp90 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_586
			--|#line 2916 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2916 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2916")
end

yyval108 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_separate_keywords (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs90.item (yyvsp90), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp108 := yyvsp108 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp90 := yyvsp90 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_587
			--|#line 2918 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2918 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2918")
end

yyval108 := ast_factory.new_qualified_like_type (yyvs5.item (yyvsp5 - 1), yyvs90.item (yyvsp90), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp108 := yyvsp108 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp90 := yyvsp90 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_588
			--|#line 2920 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2920 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2920")
end

yyval108 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs5.item (yyvsp5 - 1), yyvs2.item (yyvsp2)), yyvs90.item (yyvsp90), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp108 := yyvsp108 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp2 := yyvsp2 -1
	yyvsp90 := yyvsp90 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_589
			--|#line 2922 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2922 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2922")
end

yyval108 := ast_factory.new_qualified_like_type (yyvs23.item (yyvsp23), yyvs90.item (yyvsp90), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp108 := yyvsp108 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp90 := yyvsp90 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_590
			--|#line 2924 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2924 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2924")
end

yyval108 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_symbol_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs90.item (yyvsp90), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)))
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp108 := yyvsp108 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp90 := yyvsp90 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp108 >= yyvsc108 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs108")
		end
		yyvsc108 := yyvsc108 + yyInitial_yyvs_size
		yyvs108 := yyspecial_routines108.aliased_resized_area (yyvs108, yyvsc108)
	end
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_591
			--|#line 2930 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2930 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2930")
end

yyval46 := ast_factory.new_do_compound (yyvs2.item (yyvsp2), yyvs46.item (yyvsp46)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_592
			--|#line 2934 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2934 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2934")
end

yyval46 := ast_factory.new_attribute_compound (yyvs2.item (yyvsp2), yyvs46.item (yyvsp46)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_593
			--|#line 2938 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2938 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2938")
end

yyval46 := ast_factory.new_then_compound (yyvs2.item (yyvsp2), yyvs46.item (yyvsp46)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_594
			--|#line 2942 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2942 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2942")
end

yyval46 := ast_factory.new_then_compound (yyvs2.item (yyvsp2), yyvs46.item (yyvsp46)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_595
			--|#line 2946 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2946 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2946")
end

yyval46 := ast_factory.new_else_compound (yyvs2.item (yyvsp2), yyvs46.item (yyvsp46)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_596
			--|#line 2950 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2950 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2950")
end

yyval46 := ast_factory.new_else_compound (yyvs2.item (yyvsp2), yyvs46.item (yyvsp46)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_597
			--|#line 2954 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2954 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2954")
end

yyval46 := ast_factory.new_rescue_compound (yyvs2.item (yyvsp2), yyvs46.item (yyvsp46)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_598
			--|#line 2958 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2958 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2958")
end

yyval46 := ast_factory.new_from_compound (yyvs2.item (yyvsp2), yyvs46.item (yyvsp46)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_599
			--|#line 2962 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2962 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2962")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp46 := yyvsp46 + 1
	if yyvsp46 >= yyvsc46 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs46")
		end
		yyvsc46 := yyvsc46 + yyInitial_yyvs_size
		yyvs46 := yyspecial_routines46.aliased_resized_area (yyvs46, yyvsc46)
	end
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_600
			--|#line 2964 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2964 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2964")
end

yyval46 := yyvs46.item (yyvsp46) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_601
			--|#line 2968 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2968 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2968")
end

yyval46 := ast_factory.new_loop_compound (yyvs2.item (yyvsp2), yyvs46.item (yyvsp46)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_602
			--|#line 2972 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2972 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2972")
end

			yyval46 := yyvs46.item (yyvsp46)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_603
			--|#line 2979 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2979 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2979")
end

yyval46 := ast_factory.new_empty_compound 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp46 := yyvsp46 + 1
	if yyvsp46 >= yyvsc46 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs46")
		end
		yyvsc46 := yyvsc46 + yyInitial_yyvs_size
		yyvs46 := yyspecial_routines46.aliased_resized_area (yyvs46, yyvsc46)
	end
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_604
			--|#line 2981 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2981 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2981")
end

yyval46 := yyvs46.item (yyvsp46) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_605
			--|#line 2985 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2985 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2985")
end

yyval46 := ast_factory.new_compound (0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp46 := yyvsp46 + 1
	if yyvsp46 >= yyvsc46 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs46")
		end
		yyvsc46 := yyvsc46 + yyInitial_yyvs_size
		yyvs46 := yyspecial_routines46.aliased_resized_area (yyvs46, yyvsc46)
	end
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_606
			--|#line 2987 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2987 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2987")
end

yyval46 := yyvs46.item (yyvsp46) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_607
			--|#line 2991 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 2991 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2991")
end

			if attached yyvs87.item (yyvsp87) as l_instruction then
				yyval46 := ast_factory.new_compound (counter_value + 1)
				if yyval46 /= Void then
					yyval46.put_first (l_instruction)
				end
			else
				yyval46 := ast_factory.new_compound (counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp46 := yyvsp46 + 1
	yyvsp87 := yyvsp87 -1
	if yyvsp46 >= yyvsc46 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs46")
		end
		yyvsc46 := yyvsc46 + yyInitial_yyvs_size
		yyvs46 := yyspecial_routines46.aliased_resized_area (yyvs46, yyvsc46)
	end
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_608
			--|#line 3002 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 3002 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3002")
end

			yyval46 := yyvs46.item (yyvsp46)
			if yyval46 /= Void and attached yyvs87.item (yyvsp87) as l_instruction then
				yyval46.put_first (l_instruction)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp46 := yyvsp46 -1
	yyvsp87 := yyvsp87 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_609
			--|#line 3002 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_COMPOUND
		do
--|#line 3002 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3002")
end

			if yyvs87.item (yyvsp87) /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp46 := yyvsp46 + 1
	if yyvsp46 >= yyvsc46 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs46")
		end
		yyvsc46 := yyvsc46 + yyInitial_yyvs_size
		yyvs46 := yyspecial_routines46.aliased_resized_area (yyvs46, yyvsc46)
	end
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_610
			--|#line 3023 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3023 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3023")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_611
			--|#line 3025 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3025 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3025")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_612
			--|#line 3027 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3027 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3027")
end

yyval87 := yyvs87.item (yyvsp87) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_613
			--|#line 3029 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3029 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3029")
end

yyval87 := ast_factory.new_assigner_instruction (yyvs37.item (yyvsp37), yyvs5.item (yyvsp5), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 + 1
	yyvsp37 := yyvsp37 -1
	yyvsp5 := yyvsp5 -1
	yyvsp64 := yyvsp64 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_614
			--|#line 3031 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3031 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3031")
end

yyval87 := ast_factory.new_assigner_instruction (yyvs35.item (yyvsp35), yyvs5.item (yyvsp5), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 + 1
	yyvsp35 := yyvsp35 -1
	yyvsp5 := yyvsp5 -1
	yyvsp64 := yyvsp64 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_615
			--|#line 3033 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3033 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3033")
end

yyval87 := ast_factory.new_assignment (yyvs120.item (yyvsp120), yyvs5.item (yyvsp5), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 + 1
	yyvsp120 := yyvsp120 -1
	yyvsp5 := yyvsp5 -1
	yyvsp64 := yyvsp64 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_616
			--|#line 3035 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3035 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3035")
end

yyval87 := ast_factory.new_assignment_attempt (yyvs120.item (yyvsp120), yyvs5.item (yyvsp5), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 + 1
	yyvsp120 := yyvsp120 -1
	yyvsp5 := yyvsp5 -1
	yyvsp64 := yyvsp64 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_617
			--|#line 3037 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3037 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3037")
end

yyval87 := yyvs79.item (yyvsp79) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp79 := yyvsp79 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_618
			--|#line 3039 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3039 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3039")
end

yyval87 := yyvs86.item (yyvsp86) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp86 := yyvsp86 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_619
			--|#line 3041 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3041 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3041")
end

yyval87 := ast_factory.new_loop_instruction_old_syntax (yyvs46.item (yyvsp46 - 1), yyvs94.item (yyvsp94), yyvs117.item (yyvsp117), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp87 := yyvsp87 + 1
	yyvsp46 := yyvsp46 -2
	yyvsp94 := yyvsp94 -1
	yyvsp117 := yyvsp117 -1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_620
			--|#line 3043 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3043 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3043")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_6_3_7_4554 then
				yyval87 := ast_factory.new_loop_instruction_old_syntax (yyvs46.item (yyvsp46 - 1), yyvs94.item (yyvsp94), Void, ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2))
			else
				yyval87 := ast_factory.new_loop_instruction (yyvs46.item (yyvsp46 - 1), yyvs94.item (yyvsp94), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs46.item (yyvsp46), Void, yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp87 := yyvsp87 + 1
	yyvsp46 := yyvsp46 -2
	yyvsp94 := yyvsp94 -1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_621
			--|#line 3051 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3051 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3051")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_6_3_7_4554 then
				raise_error
			else
				yyval87 := ast_factory.new_loop_instruction (yyvs46.item (yyvsp46 - 1), yyvs94.item (yyvsp94), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs46.item (yyvsp46), yyvs117.item (yyvsp117), yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp87 := yyvsp87 + 1
	yyvsp46 := yyvsp46 -2
	yyvsp94 := yyvsp94 -1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	yyvsp117 := yyvsp117 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_622
			--|#line 3064 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3064 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3064")
end

yyval87 := new_across_instruction (yyvs25.item (yyvsp25), yyvs46.item (yyvsp46 - 1), yyvs94.item (yyvsp94), yyvs47.item (yyvsp47), yyvs46.item (yyvsp46), yyvs117.item (yyvsp117), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp87 := yyvsp87 + 1
	yyvsp25 := yyvsp25 -1
	yyvsp46 := yyvsp46 -2
	yyvsp94 := yyvsp94 -1
	yyvsp47 := yyvsp47 -1
	yyvsp117 := yyvsp117 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_623
			--|#line 3066 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3066 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3066")
end

yyval87 := yyvs59.item (yyvsp59) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp59 := yyvsp59 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_624
			--|#line 3068 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3068 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3068")
end

yyval87 := yyvs38.item (yyvsp38) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp38 := yyvsp38 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_625
			--|#line 3070 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3070 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3070")
end

yyval87 := yyvs18.item (yyvsp18) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_626
			--|#line 3072 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3072 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3072")
end

yyval87 := ast_factory.new_null_instruction (yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_627
			--|#line 3078 "et_eiffel_parser.y"
		local
			yyval38: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3078 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3078")
end

yyval38 := new_check_instruction (yyvs2.item (yyvsp2 - 1), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
		end

	yy_do_action_628
			--|#line 3080 "et_eiffel_parser.y"
		local
			yyval38: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3080 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3080")
end

yyval38 := new_check_instruction (yyvs2.item (yyvsp2 - 1), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
		end

	yy_do_action_629
			--|#line 3082 "et_eiffel_parser.y"
		local
			yyval38: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3082 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3082")
end

yyval38 := new_check_instruction (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	yyvsp46 := yyvsp46 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
		end

	yy_do_action_630
			--|#line 3084 "et_eiffel_parser.y"
		local
			yyval38: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3084 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3084")
end

yyval38 := new_check_instruction (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp38 := yyvsp38 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -2
	yyvsp46 := yyvsp46 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
		end

	yy_do_action_631
			--|#line 3090 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3090 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3090")
end

yyval87 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5), yyvs120.item (yyvsp120), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp87 := yyvsp87 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	yyvsp120 := yyvsp120 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_632
			--|#line 3092 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3092 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3092")
end

yyval87 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), ast_factory.new_qualified_call (new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp87 := yyvsp87 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp120 := yyvsp120 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_633
			--|#line 3094 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3094 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3094")
end

yyval87 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 1), Void, yyvs5.item (yyvsp5), yyvs120.item (yyvsp120), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_634
			--|#line 3096 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3096 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3096")
end

yyval87 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 2), Void, yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), ast_factory.new_qualified_call (new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp87 := yyvsp87 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_635
			--|#line 3100 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3100 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3100")
end

yyval87 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5)), yyvs120.item (yyvsp120), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp87 := yyvsp87 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	yyvsp120 := yyvsp120 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_636
			--|#line 3102 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3102 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3102")
end

yyval87 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1)), yyvs120.item (yyvsp120), ast_factory.new_qualified_call (new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp87 := yyvsp87 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp120 := yyvsp120 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_637
			--|#line 3104 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3104 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3104")
end

yyval87 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), Void, yyvs120.item (yyvsp120), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp120 := yyvsp120 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_638
			--|#line 3106 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3106 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3106")
end

yyval87 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), Void, yyvs120.item (yyvsp120), ast_factory.new_qualified_call (new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp87 := yyvsp87 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp120 := yyvsp120 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_639
			--|#line 3110 "et_eiffel_parser.y"
		local
			yyval56: detachable ET_CREATE_EXPRESSION
		do
--|#line 3110 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3110")
end

yyval56 := ast_factory.new_create_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5)), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp56 := yyvsp56 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
		end

	yy_do_action_640
			--|#line 3112 "et_eiffel_parser.y"
		local
			yyval56: detachable ET_CREATE_EXPRESSION
		do
--|#line 3112 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3112")
end

yyval56 := ast_factory.new_create_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1)), ast_factory.new_qualified_call (new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp56 := yyvsp56 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
		end

	yy_do_action_641
			--|#line 3116 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 3116 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3116")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_642
			--|#line 3117 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 3117 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3117")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 + 1
	yyvsp19 := yyvsp19 -2
	yyvsp12 := yyvsp12 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_643
			--|#line 3122 "et_eiffel_parser.y"
		local
			yyval79: detachable ET_IF_INSTRUCTION
		do
--|#line 3122 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3122")
end

yyval79 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs46.item (yyvsp46), Void, Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp79 := yyvsp79 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	yyvsp46 := yyvsp46 -1
	if yyvsp79 >= yyvsc79 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs79")
		end
		yyvsc79 := yyvsc79 + yyInitial_yyvs_size
		yyvs79 := yyspecial_routines79.aliased_resized_area (yyvs79, yyvsc79)
	end
	yyspecial_routines79.force (yyvs79, yyval79, yyvsp79)
end
		end

	yy_do_action_644
			--|#line 3124 "et_eiffel_parser.y"
		local
			yyval79: detachable ET_IF_INSTRUCTION
		do
--|#line 3124 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3124")
end

yyval79 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs46.item (yyvsp46 - 1), Void, yyvs46.item (yyvsp46), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp79 := yyvsp79 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	yyvsp46 := yyvsp46 -2
	if yyvsp79 >= yyvsc79 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs79")
		end
		yyvsc79 := yyvsc79 + yyInitial_yyvs_size
		yyvs79 := yyspecial_routines79.aliased_resized_area (yyvs79, yyvsc79)
	end
	yyspecial_routines79.force (yyvs79, yyval79, yyvsp79)
end
		end

	yy_do_action_645
			--|#line 3126 "et_eiffel_parser.y"
		local
			yyval79: detachable ET_IF_INSTRUCTION
		do
--|#line 3126 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3126")
end

yyval79 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs46.item (yyvsp46), yyvs61.item (yyvsp61), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp79 := yyvsp79 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	yyvsp46 := yyvsp46 -1
	yyvsp61 := yyvsp61 -1
	if yyvsp79 >= yyvsc79 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs79")
		end
		yyvsc79 := yyvsc79 + yyInitial_yyvs_size
		yyvs79 := yyspecial_routines79.aliased_resized_area (yyvs79, yyvsc79)
	end
	yyspecial_routines79.force (yyvs79, yyval79, yyvsp79)
end
		end

	yy_do_action_646
			--|#line 3128 "et_eiffel_parser.y"
		local
			yyval79: detachable ET_IF_INSTRUCTION
		do
--|#line 3128 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3128")
end

yyval79 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs46.item (yyvsp46 - 1), yyvs61.item (yyvsp61), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp79 := yyvsp79 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	yyvsp46 := yyvsp46 -2
	yyvsp61 := yyvsp61 -1
	if yyvsp79 >= yyvsc79 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs79")
		end
		yyvsc79 := yyvsc79 + yyInitial_yyvs_size
		yyvs79 := yyspecial_routines79.aliased_resized_area (yyvs79, yyvsc79)
	end
	yyspecial_routines79.force (yyvs79, yyval79, yyvsp79)
end
		end

	yy_do_action_647
			--|#line 3132 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_ELSEIF_PART_LIST
		do
--|#line 3132 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3132")
end

			yyval61 := yyvs61.item (yyvsp61)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines61.force (yyvs61, yyval61, yyvsp61)
end
		end

	yy_do_action_648
			--|#line 3139 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_ELSEIF_PART_LIST
		do
--|#line 3139 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3139")
end

			yyval61 := ast_factory.new_elseif_part_list (counter_value)
			if yyval61 /= Void and attached yyvs60.item (yyvsp60) as l_elseif_part then
				yyval61.put_first (l_elseif_part)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp61 := yyvsp61 + 1
	yyvsp60 := yyvsp60 -1
	if yyvsp61 >= yyvsc61 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs61")
		end
		yyvsc61 := yyvsc61 + yyInitial_yyvs_size
		yyvs61 := yyspecial_routines61.aliased_resized_area (yyvs61, yyvsc61)
	end
	yyspecial_routines61.force (yyvs61, yyval61, yyvsp61)
end
		end

	yy_do_action_649
			--|#line 3146 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_ELSEIF_PART_LIST
		do
--|#line 3146 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3146")
end

			yyval61 := yyvs61.item (yyvsp61)
			if yyval61 /= Void and attached yyvs60.item (yyvsp60) as l_elseif_part then
				yyval61.put_first (l_elseif_part)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp60 := yyvsp60 -1
	yyspecial_routines61.force (yyvs61, yyval61, yyvsp61)
end
		end

	yy_do_action_650
			--|#line 3155 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_ELSEIF_PART
		do
--|#line 3155 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3155")
end

			yyval60 := ast_factory.new_elseif_part (ast_factory.new_conditional (yyvs2.item (yyvsp2), yyvs64.item (yyvsp64)), yyvs46.item (yyvsp46))
			if yyval60 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp60 := yyvsp60 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	yyvsp46 := yyvsp46 -1
	if yyvsp60 >= yyvsc60 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs60")
		end
		yyvsc60 := yyvsc60 + yyInitial_yyvs_size
		yyvs60 := yyspecial_routines60.aliased_resized_area (yyvs60, yyvsc60)
	end
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
		end

	yy_do_action_651
			--|#line 3166 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INSPECT_INSTRUCTION
		do
--|#line 3166 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3166")
end

yyval86 := ast_factory.new_inspect_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs119.item (yyvsp119), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp86 := yyvsp86 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	yyvsp119 := yyvsp119 -1
	yyvsp46 := yyvsp46 -1
	if yyvsp86 >= yyvsc86 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs86")
		end
		yyvsc86 := yyvsc86 + yyInitial_yyvs_size
		yyvs86 := yyspecial_routines86.aliased_resized_area (yyvs86, yyvsc86)
	end
	yyspecial_routines86.force (yyvs86, yyval86, yyvsp86)
end
		end

	yy_do_action_652
			--|#line 3168 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INSPECT_INSTRUCTION
		do
--|#line 3168 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3168")
end

yyval86 := ast_factory.new_inspect_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs119.item (yyvsp119), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp86 := yyvsp86 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	yyvsp119 := yyvsp119 -1
	if yyvsp86 >= yyvsc86 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs86")
		end
		yyvsc86 := yyvsc86 + yyInitial_yyvs_size
		yyvs86 := yyspecial_routines86.aliased_resized_area (yyvs86, yyvsc86)
	end
	yyspecial_routines86.force (yyvs86, yyval86, yyvsp86)
end
		end

	yy_do_action_653
			--|#line 3172 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_WHEN_PART_LIST
		do
--|#line 3172 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3172")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp119 := yyvsp119 + 1
	if yyvsp119 >= yyvsc119 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs119")
		end
		yyvsc119 := yyvsc119 + yyInitial_yyvs_size
		yyvs119 := yyspecial_routines119.aliased_resized_area (yyvs119, yyvsc119)
	end
	yyspecial_routines119.force (yyvs119, yyval119, yyvsp119)
end
		end

	yy_do_action_654
			--|#line 3174 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_WHEN_PART_LIST
		do
--|#line 3174 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3174")
end

			yyval119 := yyvs119.item (yyvsp119)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines119.force (yyvs119, yyval119, yyvsp119)
end
		end

	yy_do_action_655
			--|#line 3181 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_WHEN_PART_LIST
		do
--|#line 3181 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3181")
end

			yyval119 := ast_factory.new_when_part_list (counter_value)
			if yyval119 /= Void and attached yyvs118.item (yyvsp118) as l_when_part then
				yyval119.put_first (l_when_part)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp119 := yyvsp119 + 1
	yyvsp118 := yyvsp118 -1
	if yyvsp119 >= yyvsc119 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs119")
		end
		yyvsc119 := yyvsc119 + yyInitial_yyvs_size
		yyvs119 := yyspecial_routines119.aliased_resized_area (yyvs119, yyvsc119)
	end
	yyspecial_routines119.force (yyvs119, yyval119, yyvsp119)
end
		end

	yy_do_action_656
			--|#line 3188 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_WHEN_PART_LIST
		do
--|#line 3188 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3188")
end

			yyval119 := yyvs119.item (yyvsp119)
			if yyval119 /= Void and attached yyvs118.item (yyvsp118) as l_when_part then
				yyval119.put_first (l_when_part)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp118 := yyvsp118 -1
	yyspecial_routines119.force (yyvs119, yyval119, yyvsp119)
end
		end

	yy_do_action_657
			--|#line 3197 "et_eiffel_parser.y"
		local
			yyval118: detachable ET_WHEN_PART
		do
--|#line 3197 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3197")
end

			yyval118 := ast_factory.new_when_part (yyvs42.item (yyvsp42), yyvs46.item (yyvsp46))
			if yyval118 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp118 := yyvsp118 + 1
	yyvsp42 := yyvsp42 -1
	yyvsp46 := yyvsp46 -1
	if yyvsp118 >= yyvsc118 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs118")
		end
		yyvsc118 := yyvsc118 + yyInitial_yyvs_size
		yyvs118 := yyspecial_routines118.aliased_resized_area (yyvs118, yyvsc118)
	end
	yyspecial_routines118.force (yyvs118, yyval118, yyvsp118)
end
		end

	yy_do_action_658
			--|#line 3206 "et_eiffel_parser.y"
		local
			yyval42: detachable ET_CHOICE_LIST
		do
--|#line 3206 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3206")
end

yyval42 := ast_factory.new_choice_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp42 := yyvsp42 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
		end

	yy_do_action_659
			--|#line 3208 "et_eiffel_parser.y"
		local
			yyval42: detachable ET_CHOICE_LIST
		do
--|#line 3208 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3208")
end

			yyval42 := yyvs42.item (yyvsp42)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp42 := yyvsp42 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
		end

	yy_do_action_660
			--|#line 3208 "et_eiffel_parser.y"
		local
			yyval42: detachable ET_CHOICE_LIST
		do
--|#line 3208 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3208")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp42 := yyvsp42 + 1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
		end

	yy_do_action_661
			--|#line 3221 "et_eiffel_parser.y"
		local
			yyval42: detachable ET_CHOICE_LIST
		do
--|#line 3221 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3221")
end

			if attached yyvs39.item (yyvsp39) as l_choice then
				yyval42 := ast_factory.new_choice_list (last_keyword, counter_value + 1)
				if yyval42 /= Void then
					yyval42.put_first (l_choice)
				end
			else
				yyval42 := ast_factory.new_choice_list (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp42 := yyvsp42 + 1
	yyvsp39 := yyvsp39 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
		end

	yy_do_action_662
			--|#line 3232 "et_eiffel_parser.y"
		local
			yyval42: detachable ET_CHOICE_LIST
		do
--|#line 3232 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3232")
end

			yyval42 := ast_factory.new_choice_list (last_keyword, counter_value)
			if yyval42 /= Void and attached yyvs41.item (yyvsp41) as l_choice then
				yyval42.put_first (l_choice)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp42 := yyvsp42 + 1
	yyvsp41 := yyvsp41 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
		end

	yy_do_action_663
			--|#line 3240 "et_eiffel_parser.y"
		local
			yyval42: detachable ET_CHOICE_LIST
		do
--|#line 3240 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3240")
end

			yyval42 := yyvs42.item (yyvsp42)
			if yyval42 /= Void and attached yyvs41.item (yyvsp41) as l_choice then
				yyval42.put_first (l_choice)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp41 := yyvsp41 -1
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
		end

	yy_do_action_664
			--|#line 3249 "et_eiffel_parser.y"
		local
			yyval41: detachable ET_CHOICE_ITEM
		do
--|#line 3249 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3249")
end

			yyval41 := ast_factory.new_choice_comma (yyvs39.item (yyvsp39), yyvs5.item (yyvsp5))
			if yyval41 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp41 := yyvsp41 + 1
	yyvsp39 := yyvsp39 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
		end

	yy_do_action_665
			--|#line 3258 "et_eiffel_parser.y"
		local
			yyval39: detachable ET_CHOICE
		do
--|#line 3258 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3258")
end

yyval39 := yyvs40.item (yyvsp40) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp39 := yyvsp39 + 1
	yyvsp40 := yyvsp40 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
		end

	yy_do_action_666
			--|#line 3260 "et_eiffel_parser.y"
		local
			yyval39: detachable ET_CHOICE
		do
--|#line 3260 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3260")
end

yyval39 := ast_factory.new_choice_range (yyvs40.item (yyvsp40 - 1), yyvs5.item (yyvsp5), yyvs40.item (yyvsp40)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp40 := yyvsp40 -2
	yyvsp5 := yyvsp5 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
		end

	yy_do_action_667
			--|#line 3264 "et_eiffel_parser.y"
		local
			yyval40: detachable ET_CHOICE_CONSTANT
		do
--|#line 3264 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3264")
end

yyval40 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp40 := yyvsp40 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
		end

	yy_do_action_668
			--|#line 3266 "et_eiffel_parser.y"
		local
			yyval40: detachable ET_CHOICE_CONSTANT
		do
--|#line 3266 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3266")
end

yyval40 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp40 := yyvsp40 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
		end

	yy_do_action_669
			--|#line 3268 "et_eiffel_parser.y"
		local
			yyval40: detachable ET_CHOICE_CONSTANT
		do
--|#line 3268 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3268")
end

yyval40 := new_choice_attribute_constant (yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp40 := yyvsp40 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
		end

	yy_do_action_670
			--|#line 3270 "et_eiffel_parser.y"
		local
			yyval40: detachable ET_CHOICE_CONSTANT
		do
--|#line 3270 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3270")
end

yyval40 := yyvs112.item (yyvsp112) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp40 := yyvsp40 + 1
	yyvsp112 := yyvsp112 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
		end

	yy_do_action_671
			--|#line 3276 "et_eiffel_parser.y"
		local
			yyval25: detachable ET_ACROSS_INSTRUCTION
		do
--|#line 3276 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3276")
end

yyval25 := new_across_instruction_header (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp25 := yyvsp25 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp25 >= yyvsc25 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs25")
		end
		yyvsc25 := yyvsc25 + yyInitial_yyvs_size
		yyvs25 := yyspecial_routines25.aliased_resized_area (yyvs25, yyvsc25)
	end
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
		end

	yy_do_action_672
			--|#line 3280 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_CONDITIONAL
		do
--|#line 3280 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3280")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp47 := yyvsp47 + 1
	if yyvsp47 >= yyvsc47 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs47")
		end
		yyvsc47 := yyvsc47 + yyInitial_yyvs_size
		yyvs47 := yyspecial_routines47.aliased_resized_area (yyvs47, yyvsc47)
	end
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_673
			--|#line 3282 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_CONDITIONAL
		do
--|#line 3282 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3282")
end

yyval47 := ast_factory.new_conditional (yyvs2.item (yyvsp2), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp47 := yyvsp47 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp64 := yyvsp64 -1
	if yyvsp47 >= yyvsc47 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs47")
		end
		yyvsc47 := yyvsc47 + yyInitial_yyvs_size
		yyvs47 := yyspecial_routines47.aliased_resized_area (yyvs47, yyvsc47)
	end
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_674
			--|#line 3288 "et_eiffel_parser.y"
		local
			yyval59: detachable ET_DEBUG_INSTRUCTION
		do
--|#line 3288 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3288")
end

yyval59 := ast_factory.new_debug_instruction (yyvs97.item (yyvsp97), ast_factory.new_debug_compound (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46)), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp59 := yyvsp59 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp97 := yyvsp97 -1
	yyvsp46 := yyvsp46 -1
	if yyvsp59 >= yyvsc59 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs59")
		end
		yyvsc59 := yyvsc59 + yyInitial_yyvs_size
		yyvs59 := yyspecial_routines59.aliased_resized_area (yyvs59, yyvsc59)
	end
	yyspecial_routines59.force (yyvs59, yyval59, yyvsp59)
end
		end

	yy_do_action_675
			--|#line 3292 "et_eiffel_parser.y"
		local
			yyval97: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3292 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3292")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp97 := yyvsp97 + 1
	if yyvsp97 >= yyvsc97 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs97")
		end
		yyvsc97 := yyvsc97 + yyInitial_yyvs_size
		yyvs97 := yyspecial_routines97.aliased_resized_area (yyvs97, yyvsc97)
	end
	yyspecial_routines97.force (yyvs97, yyval97, yyvsp97)
end
		end

	yy_do_action_676
			--|#line 3294 "et_eiffel_parser.y"
		local
			yyval97: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3294 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3294")
end

yyval97 := ast_factory.new_manifest_string_list (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp97 := yyvsp97 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp97 >= yyvsc97 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs97")
		end
		yyvsc97 := yyvsc97 + yyInitial_yyvs_size
		yyvs97 := yyspecial_routines97.aliased_resized_area (yyvs97, yyvsc97)
	end
	yyspecial_routines97.force (yyvs97, yyval97, yyvsp97)
end
		end

	yy_do_action_677
			--|#line 3296 "et_eiffel_parser.y"
		local
			yyval97: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3296 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3296")
end

			yyval97 := yyvs97.item (yyvsp97)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp97 := yyvsp97 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines97.force (yyvs97, yyval97, yyvsp97)
end
		end

	yy_do_action_678
			--|#line 3296 "et_eiffel_parser.y"
		local
			yyval97: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3296 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3296")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp97 := yyvsp97 + 1
	if yyvsp97 >= yyvsc97 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs97")
		end
		yyvsc97 := yyvsc97 + yyInitial_yyvs_size
		yyvs97 := yyspecial_routines97.aliased_resized_area (yyvs97, yyvsc97)
	end
	yyspecial_routines97.force (yyvs97, yyval97, yyvsp97)
end
		end

	yy_do_action_679
			--|#line 3309 "et_eiffel_parser.y"
		local
			yyval97: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3309 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3309")
end

			if attached yyvs15.item (yyvsp15) as l_manifest_string then
				yyval97 := ast_factory.new_manifest_string_list (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval97 /= Void then
					yyval97.put_first (l_manifest_string)
				end
			else
				yyval97 := ast_factory.new_manifest_string_list (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp97 := yyvsp97 + 1
	yyvsp15 := yyvsp15 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp97 >= yyvsc97 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs97")
		end
		yyvsc97 := yyvsc97 + yyInitial_yyvs_size
		yyvs97 := yyspecial_routines97.aliased_resized_area (yyvs97, yyvsc97)
	end
	yyspecial_routines97.force (yyvs97, yyval97, yyvsp97)
end
		end

	yy_do_action_680
			--|#line 3320 "et_eiffel_parser.y"
		local
			yyval97: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3320 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3320")
end

			yyval97 := yyvs97.item (yyvsp97)
			if yyval97 /= Void and attached yyvs96.item (yyvsp96) as l_manifest_string then
				yyval97.put_first (l_manifest_string)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp96 := yyvsp96 -1
	yyspecial_routines97.force (yyvs97, yyval97, yyvsp97)
end
		end

	yy_do_action_681
			--|#line 3329 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_MANIFEST_STRING_ITEM
		do
--|#line 3329 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3329")
end

			yyval96 := ast_factory.new_manifest_string_comma (yyvs15.item (yyvsp15), yyvs5.item (yyvsp5))
			if yyval96 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp96 := yyvsp96 + 1
	yyvsp15 := yyvsp15 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp96 >= yyvsc96 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs96")
		end
		yyvsc96 := yyvsc96 + yyInitial_yyvs_size
		yyvs96 := yyspecial_routines96.aliased_resized_area (yyvs96, yyvsc96)
	end
	yyspecial_routines96.force (yyvs96, yyval96, yyvsp96)
end
		end

	yy_do_action_682
			--|#line 3340 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3340 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3340")
end

yyval87 := new_unqualified_call_instruction (yyvs12.item (yyvsp12), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp87 := yyvsp87 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_683
			--|#line 3342 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3342 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3342")
end

yyval87 := ast_factory.new_qualified_call_instruction (yyvs64.item (yyvsp64), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp87 := yyvsp87 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_684
			--|#line 3344 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3344 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3344")
end

yyval87 := ast_factory.new_qualified_call_instruction (yyvs64.item (yyvsp64), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp87 := yyvsp87 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_685
			--|#line 3346 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3346 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3346")
end

yyval87 := ast_factory.new_precursor_instruction (False, yyvs4.item (yyvsp4), Void, yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp87 := yyvsp87 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_686
			--|#line 3348 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3348 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3348")
end

yyval87 := ast_factory.new_precursor_instruction (False, yyvs4.item (yyvsp4), ast_factory.new_precursor_class_name (yyvs5.item (yyvsp5 - 1), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp87 := yyvsp87 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp5 := yyvsp5 -2
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_687
			--|#line 3350 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3350 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3350")
end

yyval87 := ast_factory.new_static_call_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1)), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp87 := yyvsp87 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_688
			--|#line 3352 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INSTRUCTION
		do
--|#line 3352 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3352")
end

yyval87 := ast_factory.new_static_call_instruction (Void, ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1)), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp87 := yyvsp87 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp87 >= yyvsc87 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs87")
		end
		yyvsc87 := yyvsc87 + yyInitial_yyvs_size
		yyvs87 := yyspecial_routines87.aliased_resized_area (yyvs87, yyvsc87)
	end
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_689
			--|#line 3356 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3356 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3356")
end

yyval64 := new_unqualified_call_expression (yyvs12.item (yyvsp12), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_690
			--|#line 3358 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3358 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3358")
end

yyval64 := ast_factory.new_qualified_call_expression (yyvs64.item (yyvsp64), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_691
			--|#line 3362 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3362 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3362")
end

yyval64 := ast_factory.new_qualified_call_expression (yyvs64.item (yyvsp64), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_692
			--|#line 3366 "et_eiffel_parser.y"
		local
			yyval37: detachable ET_QUALIFIED_CALL_EXPRESSION
		do
--|#line 3366 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3366")
end

yyval37 := ast_factory.new_qualified_call_expression (yyvs64.item (yyvsp64), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
		end

	yy_do_action_693
			--|#line 3368 "et_eiffel_parser.y"
		local
			yyval37: detachable ET_QUALIFIED_CALL_EXPRESSION
		do
--|#line 3368 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3368")
end

yyval37 := ast_factory.new_qualified_call_expression (yyvs64.item (yyvsp64), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
		end

	yy_do_action_694
			--|#line 3372 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_STATIC_CALL_EXPRESSION
		do
--|#line 3372 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3372")
end

yyval112 := ast_factory.new_static_call_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1)), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp112 >= yyvsc112 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs112")
		end
		yyvsc112 := yyvsc112 + yyInitial_yyvs_size
		yyvs112 := yyspecial_routines112.aliased_resized_area (yyvs112, yyvsc112)
	end
	yyspecial_routines112.force (yyvs112, yyval112, yyvsp112)
end
		end

	yy_do_action_695
			--|#line 3374 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_STATIC_CALL_EXPRESSION
		do
--|#line 3374 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3374")
end

yyval112 := ast_factory.new_static_call_expression (Void, ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5 - 1)), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp112 := yyvsp112 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp112 >= yyvsc112 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs112")
		end
		yyvsc112 := yyvsc112 + yyInitial_yyvs_size
		yyvs112 := yyspecial_routines112.aliased_resized_area (yyvs112, yyvsc112)
	end
	yyspecial_routines112.force (yyvs112, yyval112, yyvsp112)
end
		end

	yy_do_action_696
			--|#line 3378 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3378 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3378")
end

yyval64 := ast_factory.new_precursor_expression (False, yyvs4.item (yyvsp4), Void, yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_697
			--|#line 3380 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3380 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3380")
end

yyval64 := ast_factory.new_precursor_expression (False, yyvs4.item (yyvsp4), ast_factory.new_precursor_class_name (yyvs5.item (yyvsp5 - 1), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp64 := yyvsp64 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp5 := yyvsp5 -2
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_698
			--|#line 3384 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3384 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3384")
end

yyval64 := new_unqualified_call_expression (yyvs12.item (yyvsp12), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_699
			--|#line 3386 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3386 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3386")
end

yyval64 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_700
			--|#line 3388 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3388 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3388")
end

yyval64 := yyvs10.item (yyvsp10) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_701
			--|#line 3390 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3390 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3390")
end

yyval64 := yyvs100.item (yyvsp100) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp100 := yyvsp100 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_702
			--|#line 3392 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3392 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3392")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_703
			--|#line 3394 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3394 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3394")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval64 := yyvs35.item (yyvsp35)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_704
			--|#line 3402 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3402 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3402")
end

yyval64 := yyvs112.item (yyvsp112) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp112 := yyvsp112 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_705
			--|#line 3404 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3404 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3404")
end

yyval64 := ast_factory.new_qualified_call_expression (yyvs64.item (yyvsp64), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_706
			--|#line 3408 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3408 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3408")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_5_7_59914 then
				raise_error
			else
				yyval64 := yyvs35.item (yyvsp35)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_707
			--|#line 3416 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3416 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3416")
end

yyval64 := ast_factory.new_qualified_call_expression (yyvs64.item (yyvsp64), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_708
			--|#line 3422 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3422 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3422")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp26 := yyvsp26 + 1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_709
			--|#line 3424 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3424 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3424")
end

yyval26 := ast_factory.new_actual_arguments (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_710
			--|#line 3426 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3426 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3426")
end

			yyval26 := yyvs26.item (yyvsp26)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_711
			--|#line 3426 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3426 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3426")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp26 := yyvsp26 + 1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_712
			--|#line 3439 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3439 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3439")
end

			if attached yyvs64.item (yyvsp64) as l_expression then
				yyval26 := ast_factory.new_actual_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval26 /= Void then
					yyval26.put_first (l_expression)
				end
			else
				yyval26 := ast_factory.new_actual_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_713
			--|#line 3450 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3450 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3450")
end

			yyval26 := ast_factory.new_actual_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval26 /= Void and attached yyvs65.item (yyvsp65) as l_expression then
				yyval26.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 + 1
	yyvsp65 := yyvsp65 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_714
			--|#line 3458 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3458 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3458")
end

			yyval26 := yyvs26.item (yyvsp26)
			if yyval26 /= Void and attached yyvs65.item (yyvsp65) as l_expression then
				yyval26.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp65 := yyvsp65 -1
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_715
			--|#line 3467 "et_eiffel_parser.y"
		local
			yyval65: detachable ET_EXPRESSION_ITEM
		do
--|#line 3467 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3467")
end

			yyval65 := ast_factory.new_expression_comma (yyvs64.item (yyvsp64), yyvs5.item (yyvsp5))
			if yyval65 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp65 := yyvsp65 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp65 >= yyvsc65 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs65")
		end
		yyvsc65 := yyvsc65 + yyInitial_yyvs_size
		yyvs65 := yyspecial_routines65.aliased_resized_area (yyvs65, yyvsc65)
	end
	yyspecial_routines65.force (yyvs65, yyval65, yyvsp65)
end
		end

	yy_do_action_716
			--|#line 3476 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3476 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3476")
end

yyval64 := new_feature_address (yyvs5.item (yyvsp5), yyvs71.item (yyvsp71)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp71 := yyvsp71 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_717
			--|#line 3478 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3478 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3478")
end

yyval64 := ast_factory.new_current_address (yyvs5.item (yyvsp5), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp10 := yyvsp10 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_718
			--|#line 3480 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3480 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3480")
end

yyval64 := ast_factory.new_result_address (yyvs5.item (yyvsp5), yyvs17.item (yyvsp17)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp17 := yyvsp17 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_719
			--|#line 3482 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3482 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3482")
end

yyval64 := ast_factory.new_expression_address (yyvs5.item (yyvsp5), yyvs100.item (yyvsp100)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp100 := yyvsp100 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_720
			--|#line 3489 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_WRITABLE
		do
--|#line 3489 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3489")
end

yyval120 := new_writable (yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp120 := yyvsp120 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp120 >= yyvsc120 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs120")
		end
		yyvsc120 := yyvsc120 + yyInitial_yyvs_size
		yyvs120 := yyspecial_routines120.aliased_resized_area (yyvs120, yyvsc120)
	end
	yyspecial_routines120.force (yyvs120, yyval120, yyvsp120)
end
		end

	yy_do_action_721
			--|#line 3491 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_WRITABLE
		do
--|#line 3491 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3491")
end

yyval120 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp120 := yyvsp120 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp120 >= yyvsc120 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs120")
		end
		yyvsc120 := yyvsc120 + yyInitial_yyvs_size
		yyvs120 := yyspecial_routines120.aliased_resized_area (yyvs120, yyvsc120)
	end
	yyspecial_routines120.force (yyvs120, yyval120, yyvsp120)
end
		end

	yy_do_action_722
			--|#line 3497 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3497 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3497")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_723
			--|#line 3499 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3499 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3499")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_724
			--|#line 3503 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3503 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3503")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), ast_factory.new_infix_free_operator (yyvs11.item (yyvsp11)), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp11 := yyvsp11 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_725
			--|#line 3505 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3505 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3505")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), ast_factory.new_infix_plus_operator (yyvs19.item (yyvsp19)), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_726
			--|#line 3507 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3507 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3507")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), ast_factory.new_infix_minus_operator (yyvs19.item (yyvsp19)), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_727
			--|#line 3509 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3509 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3509")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs19.item (yyvsp19), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_728
			--|#line 3511 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3511 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3511")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs19.item (yyvsp19), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_729
			--|#line 3513 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3513 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3513")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs19.item (yyvsp19), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_730
			--|#line 3515 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3515 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3515")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs19.item (yyvsp19), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_731
			--|#line 3517 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3517 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3517")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs19.item (yyvsp19), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_732
			--|#line 3519 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3519 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3519")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs19.item (yyvsp19), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_733
			--|#line 3521 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3521 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3521")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs19.item (yyvsp19), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_734
			--|#line 3523 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3523 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3523")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs19.item (yyvsp19), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_735
			--|#line 3525 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3525 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3525")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs19.item (yyvsp19), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_736
			--|#line 3527 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3527 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3527")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs14.item (yyvsp14), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp14 := yyvsp14 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_737
			--|#line 3529 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3529 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3529")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs14.item (yyvsp14), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp14 := yyvsp14 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_738
			--|#line 3531 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3531 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3531")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs14.item (yyvsp14), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp14 := yyvsp14 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_739
			--|#line 3533 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3533 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3533")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), ast_factory.new_infix_and_then_operator (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2)), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp64 := yyvsp64 -1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_740
			--|#line 3535 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3535 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3535")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), ast_factory.new_infix_or_else_operator (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2)), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp64 := yyvsp64 -1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_741
			--|#line 3537 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3537 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3537")
end

yyval64 := ast_factory.new_infix_expression (yyvs64.item (yyvsp64 - 1), yyvs14.item (yyvsp14), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp14 := yyvsp14 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_742
			--|#line 3539 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3539 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3539")
end

yyval64 := ast_factory.new_equality_expression (yyvs64.item (yyvsp64 - 1), yyvs5.item (yyvsp5), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_743
			--|#line 3541 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3541 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3541")
end

yyval64 := ast_factory.new_equality_expression (yyvs64.item (yyvsp64 - 1), yyvs5.item (yyvsp5), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_744
			--|#line 3543 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3543 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3543")
end

yyval64 := ast_factory.new_object_equality_expression (yyvs64.item (yyvsp64 - 1), yyvs5.item (yyvsp5), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_745
			--|#line 3545 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3545 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3545")
end

yyval64 := ast_factory.new_object_equality_expression (yyvs64.item (yyvsp64 - 1), yyvs5.item (yyvsp5), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_746
			--|#line 3549 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3549 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3549")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_747
			--|#line 3551 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3551 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3551")
end

yyval64 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_748
			--|#line 3553 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3553 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3553")
end

yyval64 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_749
			--|#line 3555 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3555 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3555")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_750
			--|#line 3557 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3557 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3557")
end

yyval64 := yyvs35.item (yyvsp35) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_751
			--|#line 3559 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3559 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3559")
end

yyval64 := ast_factory.new_manifest_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp64 := yyvsp64 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_752
			--|#line 3563 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3563 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3563")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_753
			--|#line 3565 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3565 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3565")
end

yyval64 := yyvs35.item (yyvsp35) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_754
			--|#line 3567 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3567 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3567")
end

yyval64 := yyvs56.item (yyvsp56) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp56 := yyvsp56 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_755
			--|#line 3569 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3569 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3569")
end

yyval64 := yyvs24.item (yyvsp24) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_756
			--|#line 3571 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3571 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3571")
end

yyval64 := yyvs24.item (yyvsp24) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_757
			--|#line 3573 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3573 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3573")
end

yyval64 := yyvs98.item (yyvsp98) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp98 := yyvsp98 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_758
			--|#line 3575 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3575 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3575")
end

yyval64 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_759
			--|#line 3577 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3577 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3577")
end

yyval64 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_760
			--|#line 3579 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3579 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3579")
end

yyval64 := new_prefix_plus_expression (yyvs19.item (yyvsp19), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_761
			--|#line 3581 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3581 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3581")
end

yyval64 := new_prefix_minus_expression (yyvs19.item (yyvsp19), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_762
			--|#line 3583 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3583 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3583")
end

yyval64 := ast_factory.new_prefix_expression (yyvs14.item (yyvsp14), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_763
			--|#line 3585 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3585 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3585")
end

yyval64 := ast_factory.new_prefix_expression (ast_factory.new_prefix_free_operator (yyvs11.item (yyvsp11)), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_764
			--|#line 3587 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3587 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3587")
end

yyval64 := ast_factory.new_old_expression (yyvs2.item (yyvsp2), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_765
			--|#line 3589 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3589 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3589")
end

			if current_system.is_ise and then attached current_system.ise_version as l_ise_version and then l_ise_version < ise_6_1_0 then
				raise_error
			else
				yyval64 := new_old_object_test (yyvs5.item (yyvsp5 - 2), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5), yyvs64.item (yyvsp64))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp5 := yyvsp5 -3
	yyvsp12 := yyvsp12 -1
	yyvsp114 := yyvsp114 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_766
			--|#line 3597 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3597 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3597")
end

yyval64 := ast_factory.new_object_test (yyvs2.item (yyvsp2), Void, yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_767
			--|#line 3599 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3599 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3599")
end

yyval64 := ast_factory.new_object_test (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5)), yyvs64.item (yyvsp64)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_768
			--|#line 3601 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3601 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3601")
end

yyval64 := new_named_object_test (yyvs2.item (yyvsp2 - 1), Void, yyvs64.item (yyvsp64), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_769
			--|#line 3603 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3603 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3603")
end

yyval64 := new_named_object_test (yyvs2.item (yyvsp2 - 1), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5)), yyvs64.item (yyvsp64), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp2 := yyvsp2 -2
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	yyvsp12 := yyvsp12 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_770
			--|#line 3607 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3607 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3607")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_771
			--|#line 3609 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3609 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3609")
end

yyval64 := yyvs112.item (yyvsp112) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp112 := yyvsp112 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_772
			--|#line 3611 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3611 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3611")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_773
			--|#line 3613 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3613 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3613")
end

yyval64 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_774
			--|#line 3615 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3615 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3615")
end

yyval64 := yyvs10.item (yyvsp10) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_775
			--|#line 3617 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3617 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3617")
end

yyval64 := yyvs100.item (yyvsp100) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp100 := yyvsp100 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_776
			--|#line 3619 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3619 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3619")
end

yyval64 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_777
			--|#line 3621 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3621 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3621")
end

yyval64 := yyvs36.item (yyvsp36) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp36 := yyvsp36 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_778
			--|#line 3623 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3623 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3623")
end

yyval64 := yyvs85.item (yyvsp85) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp85 := yyvsp85 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_779
			--|#line 3625 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3625 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3625")
end

yyval64 := yyvs20.item (yyvsp20) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_780
			--|#line 3627 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3627 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3627")
end

yyval64 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_781
			--|#line 3629 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3629 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3629")
end

yyval64 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp15 := yyvsp15 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_782
			--|#line 3631 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3631 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3631")
end

yyval64 := new_once_manifest_string (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp64 := yyvsp64 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_783
			--|#line 3664 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3664 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3664")
end

yyval64 := yyvs95.item (yyvsp95) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp95 := yyvsp95 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_784
			--|#line 3666 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3666 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3666")
end

yyval64 := yyvs113.item (yyvsp113) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp113 := yyvsp113 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_785
			--|#line 3668 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3668 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3668")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_786
			--|#line 3672 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3672 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3672")
end

yyval64 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_787
			--|#line 3674 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3674 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3674")
end

yyval64 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp15 := yyvsp15 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_788
			--|#line 3676 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_EXPRESSION
		do
--|#line 3676 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3676")
end

yyval64 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp64 >= yyvsc64 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs64")
		end
		yyvsc64 := yyvsc64 + yyInitial_yyvs_size
		yyvs64 := yyspecial_routines64.aliased_resized_area (yyvs64, yyvsc64)
	end
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_789
			--|#line 3680 "et_eiffel_parser.y"
		local
			yyval35: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3680 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3680")
end

yyval35 := yyvs35.item (yyvsp35) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
		end

	yy_do_action_790
			--|#line 3682 "et_eiffel_parser.y"
		local
			yyval35: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3682 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3682")
end

yyval35 := yyvs35.item (yyvsp35) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
		end

	yy_do_action_791
			--|#line 3686 "et_eiffel_parser.y"
		local
			yyval35: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3686 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3686")
end

			yyval35 := ast_factory.new_bracket_expression (yyvs64.item (yyvsp64), yyvs22.item (yyvsp22), yyvs26.item (yyvsp26))
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp64 := yyvsp64 -1
	yyvsp22 := yyvsp22 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
		end

	yy_do_action_792
			--|#line 3686 "et_eiffel_parser.y"
		local
			yyval35: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3686 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3686")
end

			add_symbol (yyvs22.item (yyvsp22))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp35 := yyvsp35 + 1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
		end

	yy_do_action_793
			--|#line 3699 "et_eiffel_parser.y"
		local
			yyval35: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3699 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3699")
end

			yyval35 := ast_factory.new_bracket_expression (yyvs64.item (yyvsp64), yyvs22.item (yyvsp22), yyvs26.item (yyvsp26))
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp64 := yyvsp64 -1
	yyvsp22 := yyvsp22 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
		end

	yy_do_action_794
			--|#line 3699 "et_eiffel_parser.y"
		local
			yyval35: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3699 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3699")
end

			add_symbol (yyvs22.item (yyvsp22))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp35 := yyvsp35 + 1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
		end

	yy_do_action_795
			--|#line 3712 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3712 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3712")
end

			if attached yyvs64.item (yyvsp64) as l_expression then
				yyval26 := ast_factory.new_bracket_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval26 /= Void then
					yyval26.put_first (l_expression)
				end
			else
				yyval26 := ast_factory.new_bracket_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_796
			--|#line 3723 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3723 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3723")
end

			yyval26 := ast_factory.new_bracket_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval26 /= Void and attached yyvs65.item (yyvsp65) as l_expression then
				yyval26.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 + 1
	yyvsp65 := yyvsp65 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_797
			--|#line 3731 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3731 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3731")
end

			yyval26 := yyvs26.item (yyvsp26)
			if yyval26 /= Void and attached yyvs65.item (yyvsp65) as l_expression then
				yyval26.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp65 := yyvsp65 -1
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_798
			--|#line 3740 "et_eiffel_parser.y"
		local
			yyval100: detachable ET_PARENTHESIZED_EXPRESSION
		do
--|#line 3740 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3740")
end

			remove_symbol
			remove_counter
		 	yyval100 := ast_factory.new_parenthesized_expression (yyvs5.item (yyvsp5 - 1), yyvs64.item (yyvsp64), yyvs5.item (yyvsp5))
		 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp100 := yyvsp100 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp64 := yyvsp64 -1
	if yyvsp100 >= yyvsc100 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs100")
		end
		yyvsc100 := yyvsc100 + yyInitial_yyvs_size
		yyvs100 := yyspecial_routines100.aliased_resized_area (yyvs100, yyvsc100)
	end
	yyspecial_routines100.force (yyvs100, yyval100, yyvsp100)
end
		end

	yy_do_action_799
			--|#line 3748 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_MANIFEST_ARRAY
		do
--|#line 3748 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3748")
end

yyval95 := ast_factory.new_manifest_array (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp95 := yyvsp95 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp95 >= yyvsc95 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs95")
		end
		yyvsc95 := yyvsc95 + yyInitial_yyvs_size
		yyvs95 := yyspecial_routines95.aliased_resized_area (yyvs95, yyvsc95)
	end
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_800
			--|#line 3750 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_MANIFEST_ARRAY
		do
--|#line 3750 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3750")
end

			yyval95 := yyvs95.item (yyvsp95)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp95 := yyvsp95 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_801
			--|#line 3750 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_MANIFEST_ARRAY
		do
--|#line 3750 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3750")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp95 := yyvsp95 + 1
	if yyvsp95 >= yyvsc95 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs95")
		end
		yyvsc95 := yyvsc95 + yyInitial_yyvs_size
		yyvs95 := yyspecial_routines95.aliased_resized_area (yyvs95, yyvsc95)
	end
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_802
			--|#line 3763 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_MANIFEST_ARRAY
		do
--|#line 3763 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3763")
end

			if attached yyvs64.item (yyvsp64) as l_expression then
				yyval95 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval95 /= Void then
					yyval95.put_first (l_expression)
				end
			else
				yyval95 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp95 := yyvsp95 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp95 >= yyvsc95 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs95")
		end
		yyvsc95 := yyvsc95 + yyInitial_yyvs_size
		yyvs95 := yyspecial_routines95.aliased_resized_area (yyvs95, yyvsc95)
	end
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_803
			--|#line 3774 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_MANIFEST_ARRAY
		do
--|#line 3774 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3774")
end

			yyval95 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval95 /= Void and attached yyvs65.item (yyvsp65) as l_expression then
				yyval95.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp95 := yyvsp95 + 1
	yyvsp65 := yyvsp65 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp95 >= yyvsc95 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs95")
		end
		yyvsc95 := yyvsc95 + yyInitial_yyvs_size
		yyvs95 := yyspecial_routines95.aliased_resized_area (yyvs95, yyvsc95)
	end
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_804
			--|#line 3782 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_MANIFEST_ARRAY
		do
--|#line 3782 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3782")
end

			yyval95 := yyvs95.item (yyvsp95)
			if yyval95 /= Void and attached yyvs65.item (yyvsp65) as l_expression then
				yyval95.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp65 := yyvsp65 -1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_805
			--|#line 3791 "et_eiffel_parser.y"
		local
			yyval98: detachable ET_MANIFEST_TUPLE
		do
--|#line 3791 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3791")
end

yyval98 := ast_factory.new_manifest_tuple (yyvs22.item (yyvsp22), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp98 := yyvsp98 + 1
	yyvsp22 := yyvsp22 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp98 >= yyvsc98 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs98")
		end
		yyvsc98 := yyvsc98 + yyInitial_yyvs_size
		yyvs98 := yyspecial_routines98.aliased_resized_area (yyvs98, yyvsc98)
	end
	yyspecial_routines98.force (yyvs98, yyval98, yyvsp98)
end
		end

	yy_do_action_806
			--|#line 3793 "et_eiffel_parser.y"
		local
			yyval98: detachable ET_MANIFEST_TUPLE
		do
--|#line 3793 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3793")
end

			yyval98 := yyvs98.item (yyvsp98)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp98 := yyvsp98 -1
	yyvsp22 := yyvsp22 -1
	yyspecial_routines98.force (yyvs98, yyval98, yyvsp98)
end
		end

	yy_do_action_807
			--|#line 3793 "et_eiffel_parser.y"
		local
			yyval98: detachable ET_MANIFEST_TUPLE
		do
--|#line 3793 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3793")
end

			add_symbol (yyvs22.item (yyvsp22))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp98 := yyvsp98 + 1
	if yyvsp98 >= yyvsc98 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs98")
		end
		yyvsc98 := yyvsc98 + yyInitial_yyvs_size
		yyvs98 := yyspecial_routines98.aliased_resized_area (yyvs98, yyvsc98)
	end
	yyspecial_routines98.force (yyvs98, yyval98, yyvsp98)
end
		end

	yy_do_action_808
			--|#line 3806 "et_eiffel_parser.y"
		local
			yyval98: detachable ET_MANIFEST_TUPLE
		do
--|#line 3806 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3806")
end

			if attached yyvs64.item (yyvsp64) as l_expression then
				yyval98 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval98 /= Void then
					yyval98.put_first (l_expression)
				end
			else
				yyval98 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp98 := yyvsp98 + 1
	yyvsp64 := yyvsp64 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp98 >= yyvsc98 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs98")
		end
		yyvsc98 := yyvsc98 + yyInitial_yyvs_size
		yyvs98 := yyspecial_routines98.aliased_resized_area (yyvs98, yyvsc98)
	end
	yyspecial_routines98.force (yyvs98, yyval98, yyvsp98)
end
		end

	yy_do_action_809
			--|#line 3817 "et_eiffel_parser.y"
		local
			yyval98: detachable ET_MANIFEST_TUPLE
		do
--|#line 3817 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3817")
end

			yyval98 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval98 /= Void and attached yyvs65.item (yyvsp65) as l_expression then
				yyval98.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp98 := yyvsp98 + 1
	yyvsp65 := yyvsp65 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp98 >= yyvsc98 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs98")
		end
		yyvsc98 := yyvsc98 + yyInitial_yyvs_size
		yyvs98 := yyspecial_routines98.aliased_resized_area (yyvs98, yyvsc98)
	end
	yyspecial_routines98.force (yyvs98, yyval98, yyvsp98)
end
		end

	yy_do_action_810
			--|#line 3825 "et_eiffel_parser.y"
		local
			yyval98: detachable ET_MANIFEST_TUPLE
		do
--|#line 3825 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3825")
end

			yyval98 := yyvs98.item (yyvsp98)
			if yyval98 /= Void and attached yyvs65.item (yyvsp65) as l_expression then
				yyval98.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp65 := yyvsp65 -1
	yyspecial_routines98.force (yyvs98, yyval98, yyvsp98)
end
		end

	yy_do_action_811
			--|#line 3834 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_STRIP_EXPRESSION
		do
--|#line 3834 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3834")
end

yyval113 := ast_factory.new_strip_expression (yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp113 := yyvsp113 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -2
	if yyvsp113 >= yyvsc113 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs113")
		end
		yyvsc113 := yyvsc113 + yyInitial_yyvs_size
		yyvs113 := yyspecial_routines113.aliased_resized_area (yyvs113, yyvsc113)
	end
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_812
			--|#line 3836 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_STRIP_EXPRESSION
		do
--|#line 3836 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3836")
end

			yyval113 := yyvs113.item (yyvsp113)
			remove_keyword
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp113 := yyvsp113 -1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_813
			--|#line 3836 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_STRIP_EXPRESSION
		do
--|#line 3836 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3836")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp113 := yyvsp113 + 1
	if yyvsp113 >= yyvsc113 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs113")
		end
		yyvsc113 := yyvsc113 + yyInitial_yyvs_size
		yyvs113 := yyspecial_routines113.aliased_resized_area (yyvs113, yyvsc113)
	end
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_814
			--|#line 3851 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_STRIP_EXPRESSION
		do
--|#line 3851 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3851")
end

			if attached yyvs71.item (yyvsp71) as l_feature_name then
				yyval113 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval113 /= Void then
					yyval113.put_first (l_feature_name)
				end
			else
				yyval113 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp113 := yyvsp113 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp113 >= yyvsc113 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs113")
		end
		yyvsc113 := yyvsc113 + yyInitial_yyvs_size
		yyvs113 := yyspecial_routines113.aliased_resized_area (yyvs113, yyvsc113)
	end
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_815
			--|#line 3862 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_STRIP_EXPRESSION
		do
--|#line 3862 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3862")
end

			yyval113 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval113 /= Void and attached yyvs72.item (yyvsp72) as l_feature_name then
				yyval113.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp113 := yyvsp113 + 1
	yyvsp72 := yyvsp72 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp113 >= yyvsc113 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs113")
		end
		yyvsc113 := yyvsc113 + yyInitial_yyvs_size
		yyvs113 := yyspecial_routines113.aliased_resized_area (yyvs113, yyvsc113)
	end
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_816
			--|#line 3870 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_STRIP_EXPRESSION
		do
--|#line 3870 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3870")
end

			yyval113 := yyvs113.item (yyvsp113)
			if yyval113 /= Void and attached yyvs72.item (yyvsp72) as l_feature_name then
				yyval113.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 -1
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_817
			--|#line 3879 "et_eiffel_parser.y"
		local
			yyval48: detachable ET_CONSTANT
		do
--|#line 3879 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3879")
end

yyval48 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp48 := yyvsp48 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp48 >= yyvsc48 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs48")
		end
		yyvsc48 := yyvsc48 + yyInitial_yyvs_size
		yyvs48 := yyspecial_routines48.aliased_resized_area (yyvs48, yyvsc48)
	end
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
		end

	yy_do_action_818
			--|#line 3881 "et_eiffel_parser.y"
		local
			yyval48: detachable ET_CONSTANT
		do
--|#line 3881 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3881")
end

yyval48 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp48 := yyvsp48 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp48 >= yyvsc48 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs48")
		end
		yyvsc48 := yyvsc48 + yyInitial_yyvs_size
		yyvs48 := yyspecial_routines48.aliased_resized_area (yyvs48, yyvsc48)
	end
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
		end

	yy_do_action_819
			--|#line 3883 "et_eiffel_parser.y"
		local
			yyval48: detachable ET_CONSTANT
		do
--|#line 3883 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3883")
end

yyval48 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp48 := yyvsp48 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp48 >= yyvsc48 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs48")
		end
		yyvsc48 := yyvsc48 + yyInitial_yyvs_size
		yyvs48 := yyspecial_routines48.aliased_resized_area (yyvs48, yyvsc48)
	end
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
		end

	yy_do_action_820
			--|#line 3885 "et_eiffel_parser.y"
		local
			yyval48: detachable ET_CONSTANT
		do
--|#line 3885 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3885")
end

yyval48 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp48 := yyvsp48 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp48 >= yyvsc48 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs48")
		end
		yyvsc48 := yyvsc48 + yyInitial_yyvs_size
		yyvs48 := yyspecial_routines48.aliased_resized_area (yyvs48, yyvsc48)
	end
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
		end

	yy_do_action_821
			--|#line 3887 "et_eiffel_parser.y"
		local
			yyval48: detachable ET_CONSTANT
		do
--|#line 3887 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3887")
end

yyval48 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp48 := yyvsp48 + 1
	yyvsp15 := yyvsp15 -1
	if yyvsp48 >= yyvsc48 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs48")
		end
		yyvsc48 := yyvsc48 + yyInitial_yyvs_size
		yyvs48 := yyspecial_routines48.aliased_resized_area (yyvs48, yyvsc48)
	end
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
		end

	yy_do_action_822
			--|#line 3891 "et_eiffel_parser.y"
		local
			yyval24: detachable ET_ACROSS_EXPRESSION
		do
--|#line 3891 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3891")
end

yyval24 := new_across_some_expression (yyvs24.item (yyvsp24), yyvs94.item (yyvsp94), yyvs47.item (yyvsp47), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs117.item (yyvsp117), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp94 := yyvsp94 -1
	yyvsp47 := yyvsp47 -1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	yyvsp117 := yyvsp117 -1
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
		end

	yy_do_action_823
			--|#line 3895 "et_eiffel_parser.y"
		local
			yyval24: detachable ET_ACROSS_EXPRESSION
		do
--|#line 3895 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3895")
end

yyval24 := new_across_all_expression (yyvs24.item (yyvsp24), yyvs94.item (yyvsp94), yyvs47.item (yyvsp47), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64)), yyvs117.item (yyvsp117), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp94 := yyvsp94 -1
	yyvsp47 := yyvsp47 -1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	yyvsp117 := yyvsp117 -1
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
		end

	yy_do_action_824
			--|#line 3899 "et_eiffel_parser.y"
		local
			yyval24: detachable ET_ACROSS_EXPRESSION
		do
--|#line 3899 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3899")
end

yyval24 := new_across_expression_header (yyvs2.item (yyvsp2 - 1), yyvs64.item (yyvsp64), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp24 := yyvsp24 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp64 := yyvsp64 -1
	yyvsp12 := yyvsp12 -1
	if yyvsp24 >= yyvsc24 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs24")
		end
		yyvsc24 := yyvsc24 + yyInitial_yyvs_size
		yyvs24 := yyspecial_routines24.aliased_resized_area (yyvs24, yyvsc24)
	end
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
		end

	yy_do_action_825
			--|#line 3905 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_CALL_AGENT
		do
--|#line 3905 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3905")
end

yyval36 := ast_factory.new_call_agent (yyvs3.item (yyvsp3), Void, yyvs71.item (yyvsp71), yyvs31.item (yyvsp31)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp71 := yyvsp71 -1
	yyvsp31 := yyvsp31 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
		end

	yy_do_action_826
			--|#line 3907 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_CALL_AGENT
		do
--|#line 3907 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3907")
end

yyval36 := ast_factory.new_call_agent (yyvs3.item (yyvsp3), yyvs32.item (yyvsp32), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs71.item (yyvsp71)), yyvs31.item (yyvsp31)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp36 := yyvsp36 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp32 := yyvsp32 -1
	yyvsp5 := yyvsp5 -1
	yyvsp71 := yyvsp71 -1
	yyvsp31 := yyvsp31 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
		end

	yy_do_action_827
			--|#line 3911 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3911 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3911")
end

			set_inline_agent_actual_arguments (yyvs85.item (yyvsp85), yyvs31.item (yyvsp31))
			yyval85 := yyvs85.item (yyvsp85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp31 := yyvsp31 -1
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_828
			--|#line 3918 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3918 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3918")
end

			yyval85 := ast_factory.new_do_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs46.item (yyvsp46 - 1), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_829
			--|#line 3928 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3928 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3928")
end

			yyval85 := ast_factory.new_do_function_inline_agent (yyvs3.item (yyvsp3), yyvs75.item (yyvsp75), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs46.item (yyvsp46 - 1), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp75 := yyvsp75 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_830
			--|#line 3934 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3934 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3934")
end

			yyval85 := ast_factory.new_once_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs97.item (yyvsp97), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46 - 1)), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp2 := yyvsp2 -2
	yyvsp97 := yyvsp97 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_831
			--|#line 3940 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3940 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3940")
end

			yyval85 := ast_factory.new_once_function_inline_agent (yyvs3.item (yyvsp3), yyvs75.item (yyvsp75), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs97.item (yyvsp97), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46 - 1)), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp75 := yyvsp75 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp2 := yyvsp2 -2
	yyvsp97 := yyvsp97 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_832
			--|#line 3946 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3946 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3946")
end

			yyval85 := ast_factory.new_external_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs106.item (yyvsp106), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs67.item (yyvsp67), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp106 := yyvsp106 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp67 := yyvsp67 -1
	yyvsp105 := yyvsp105 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_833
			--|#line 3952 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3952 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3952")
end

			yyval85 := ast_factory.new_external_function_inline_agent (yyvs3.item (yyvsp3), yyvs75.item (yyvsp75), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs114.item (yyvsp114)), yyvs106.item (yyvsp106), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs67.item (yyvsp67), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp75 := yyvsp75 -1
	yyvsp5 := yyvsp5 -1
	yyvsp114 := yyvsp114 -1
	yyvsp106 := yyvsp106 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp67 := yyvsp67 -1
	yyvsp105 := yyvsp105 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_834
			--|#line 3958 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3958 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3958")
end

			yyval85 := ast_factory.new_do_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs46.item (yyvsp46 - 1), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_835
			--|#line 3964 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3964 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3964")
end

			yyval85 := ast_factory.new_do_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs75.item (yyvsp75), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs46.item (yyvsp46 - 1), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp75 := yyvsp75 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_836
			--|#line 3970 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3970 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3970")
end

			yyval85 := ast_factory.new_once_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs97.item (yyvsp97), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46 - 1)), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp2 := yyvsp2 -2
	yyvsp97 := yyvsp97 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_837
			--|#line 3976 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3976 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3976")
end

			yyval85 := ast_factory.new_once_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs75.item (yyvsp75), yyvs106.item (yyvsp106), yyvs93.item (yyvsp93), yyvs97.item (yyvsp97), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs46.item (yyvsp46 - 1)), yyvs105.item (yyvsp105), yyvs46.item (yyvsp46), yyvs2.item (yyvsp2), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp75 := yyvsp75 -1
	yyvsp106 := yyvsp106 -1
	yyvsp93 := yyvsp93 -1
	yyvsp2 := yyvsp2 -2
	yyvsp97 := yyvsp97 -1
	yyvsp46 := yyvsp46 -2
	yyvsp105 := yyvsp105 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_838
			--|#line 3981 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3981 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3981")
end

			yyval85 := ast_factory.new_external_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs106.item (yyvsp106), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs67.item (yyvsp67), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp106 := yyvsp106 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp67 := yyvsp67 -1
	yyvsp105 := yyvsp105 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_839
			--|#line 3987 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_INLINE_AGENT
		do
--|#line 3987 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3987")
end

			yyval85 := ast_factory.new_external_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs75.item (yyvsp75), yyvs106.item (yyvsp106), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs67.item (yyvsp67), yyvs105.item (yyvsp105), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval85)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp85 := yyvsp85 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp75 := yyvsp75 -1
	yyvsp106 := yyvsp106 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp67 := yyvsp67 -1
	yyvsp105 := yyvsp105 -1
	if yyvsp85 >= yyvsc85 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs85")
		end
		yyvsc85 := yyvsc85 + yyInitial_yyvs_size
		yyvs85 := yyspecial_routines85.aliased_resized_area (yyvs85, yyvsc85)
	end
	yyspecial_routines85.force (yyvs85, yyval85, yyvsp85)
end
		end

	yy_do_action_840
			--|#line 3995 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 3995 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3995")
end

			yyval75 := yyvs75.item (yyvsp75)
			set_start_closure (yyval75)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines75.force (yyvs75, yyval75, yyvsp75)
end
		end

	yy_do_action_841
			--|#line 4002 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 4002 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4002")
end

set_start_closure (Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_842
			--|#line 4006 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4006 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4006")
end

yyval32 := new_agent_identifier_target (yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp32 := yyvsp32 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
		end

	yy_do_action_843
			--|#line 4008 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4008 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4008")
end

yyval32 := yyvs100.item (yyvsp100) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp32 := yyvsp32 + 1
	yyvsp100 := yyvsp100 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
		end

	yy_do_action_844
			--|#line 4010 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4010 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4010")
end

yyval32 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp32 := yyvsp32 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
		end

	yy_do_action_845
			--|#line 4012 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4012 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4012")
end

yyval32 := yyvs10.item (yyvsp10) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp32 := yyvsp32 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
		end

	yy_do_action_846
			--|#line 4014 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4014 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4014")
end

yyval32 := ast_factory.new_agent_open_target (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
		end

	yy_do_action_847
			--|#line 4018 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4018 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4018")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp31 := yyvsp31 + 1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
		end

	yy_do_action_848
			--|#line 4020 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4020 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4020")
end

yyval31 := ast_factory.new_agent_argument_operands (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp31 := yyvsp31 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
		end

	yy_do_action_849
			--|#line 4022 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4022 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4022")
end

			yyval31 := yyvs31.item (yyvsp31)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
		end

	yy_do_action_850
			--|#line 4022 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4022 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4022")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp31 := yyvsp31 + 1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
		end

	yy_do_action_851
			--|#line 4035 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4035 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4035")
end

			if attached yyvs29.item (yyvsp29) as l_agent_actual then
				yyval31 := ast_factory.new_agent_argument_operands (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval31 /= Void then
					yyval31.put_first (l_agent_actual)
				end
			else
				yyval31 := ast_factory.new_agent_argument_operands (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp31 := yyvsp31 + 1
	yyvsp29 := yyvsp29 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
		end

	yy_do_action_852
			--|#line 4046 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4046 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4046")
end

			yyval31 := ast_factory.new_agent_argument_operands (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval31 /= Void and attached yyvs30.item (yyvsp30) as l_agent_actual then
				yyval31.put_first (l_agent_actual)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp31 := yyvsp31 + 1
	yyvsp30 := yyvsp30 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
		end

	yy_do_action_853
			--|#line 4054 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4054 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4054")
end

			yyval31 := yyvs31.item (yyvsp31)
			if yyval31 /= Void and attached yyvs30.item (yyvsp30) as l_agent_actual then
				yyval31.put_first (l_agent_actual)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp30 := yyvsp30 -1
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
		end

	yy_do_action_854
			--|#line 4063 "et_eiffel_parser.y"
		local
			yyval30: detachable ET_AGENT_ARGUMENT_OPERAND_ITEM
		do
--|#line 4063 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4063")
end

			yyval30 := ast_factory.new_agent_argument_operand_comma (yyvs29.item (yyvsp29), yyvs5.item (yyvsp5))
			if yyval30 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp30 := yyvsp30 + 1
	yyvsp29 := yyvsp29 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
		end

	yy_do_action_855
			--|#line 4072 "et_eiffel_parser.y"
		local
			yyval29: detachable ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 4072 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4072")
end

yyval29 := yyvs64.item (yyvsp64) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp64 := yyvsp64 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
		end

	yy_do_action_856
			--|#line 4074 "et_eiffel_parser.y"
		local
			yyval29: detachable ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 4074 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4074")
end

yyval29 := yyvs23.item (yyvsp23) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
		end

	yy_do_action_857
			--|#line 4076 "et_eiffel_parser.y"
		local
			yyval29: detachable ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 4076 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4076")
end

yyval29 := ast_factory.new_agent_typed_open_argument (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5), yyvs23.item (yyvsp23)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	yyvsp23 := yyvsp23 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
		end

	yy_do_action_858
			--|#line 4082 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4082 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4082")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_859
			--|#line 4084 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4084 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4084")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_860
			--|#line 4088 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4088 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4088")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_861
			--|#line 4090 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4090 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4090")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_862
			--|#line 4092 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4092 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4092")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_863
			--|#line 4094 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4094 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4094")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_864
			--|#line 4096 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4096 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4096")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_865
			--|#line 4098 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4098 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4098")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_866
			--|#line 4100 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4100 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4100")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_867
			--|#line 4102 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4102 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4102")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_868
			--|#line 4104 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4104 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4104")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_869
			--|#line 4106 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4106 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4106")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_870
			--|#line 4108 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4108 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4108")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_871
			--|#line 4110 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4110 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4110")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_872
			--|#line 4112 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4112 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4112")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_873
			--|#line 4114 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4114 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4114")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_874
			--|#line 4116 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4116 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4116")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_875
			--|#line 4118 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4118 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4118")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_876
			--|#line 4120 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4120 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4120")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_877
			--|#line 4122 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4122 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4122")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_878
			--|#line 4124 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4124 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4124")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_879
			--|#line 4126 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4126 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4126")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_880
			--|#line 4128 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4128 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4128")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_881
			--|#line 4130 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4130 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4130")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_882
			--|#line 4132 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4132 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4132")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_883
			--|#line 4134 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4134 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4134")
end

abort 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_884
			--|#line 4138 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4138 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4138")
end

			yyval15 := yyvs15.item (yyvsp15)
			if yyval15 /= Void then
				yyval15.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_885
			--|#line 4147 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4147 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4147")
end

yyval9 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_886
			--|#line 4149 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4149 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4149")
end

yyval9 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_887
			--|#line 4153 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4153 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4153")
end

yyval9 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_888
			--|#line 4155 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4155 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4155")
end

abort 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_889
			--|#line 4159 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4159 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4159")
end

			yyval9 := yyvs9.item (yyvsp9)
			if yyval9 /= Void then
				yyval9.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_890
			--|#line 4168 "et_eiffel_parser.y"
		local
			yyval7: detachable ET_BOOLEAN_CONSTANT
		do
--|#line 4168 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4168")
end

yyval7 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
		end

	yy_do_action_891
			--|#line 4170 "et_eiffel_parser.y"
		local
			yyval7: detachable ET_BOOLEAN_CONSTANT
		do
--|#line 4170 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4170")
end

yyval7 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
		end

	yy_do_action_892
			--|#line 4174 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4174 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4174")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_893
			--|#line 4176 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4176 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4176")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_894
			--|#line 4180 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4180 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4180")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_895
			--|#line 4182 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4182 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4182")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_896
			--|#line 4186 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4186 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4186")
end

			yyval13 := yyvs13.item (yyvsp13)
			if yyval13 /= Void then
				yyval13.set_sign (yyvs19.item (yyvsp19))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_897
			--|#line 4193 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4193 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4193")
end

			yyval13 := yyvs13.item (yyvsp13)
			if yyval13 /= Void then
				yyval13.set_sign (yyvs19.item (yyvsp19))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_898
			--|#line 4202 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4202 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4202")
end

			yyval13 := yyvs13.item (yyvsp13)
			if yyval13 /= Void then
				yyval13.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_899
			--|#line 4211 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4211 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4211")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_900
			--|#line 4213 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4213 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4213")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_901
			--|#line 4217 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4217 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4217")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_902
			--|#line 4219 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4219 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4219")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_903
			--|#line 4223 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4223 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4223")
end

			yyval16 := yyvs16.item (yyvsp16)
			if yyval16 /= Void then
				yyval16.set_sign (yyvs19.item (yyvsp19))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_904
			--|#line 4230 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4230 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4230")
end

			yyval16 := yyvs16.item (yyvsp16)
			if yyval16 /= Void then
				yyval16.set_sign (yyvs19.item (yyvsp19))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_905
			--|#line 4239 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4239 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4239")
end

			yyval16 := yyvs16.item (yyvsp16)
			if yyval16 /= Void then
				yyval16.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs114.item (yyvsp114), yyvs5.item (yyvsp5)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp114 := yyvsp114 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_906
			--|#line 4248 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 4248 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4248")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_907
			--|#line 4250 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 4250 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4250")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_908
			--|#line 4252 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 4252 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4252")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_909
			--|#line 4258 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 4258 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4258")
end

add_counter 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_error_action (yy_act: INTEGER)
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
			elseif yy_act <= 1799 then
				yy_do_error_action_1600_1799 (yy_act)
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_0_199 (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_200_399 (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_400_599 (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_600_799 (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_800_999 (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_1000_1199 (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_1200_1399 (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_1400_1599 (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_1600_1799 (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 1706 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER]
			-- Template for `yytranslate'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 375)
			yytranslate_template_1 (an_array)
			yytranslate_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytranslate_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytranslate'.
		do
			yyarray_subcopy (an_array, <<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  133,    2,    2,  131,    2,    2,    2,
			  126,  127,  118,  135,  129,  134,  132,  111,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,  128,  140,
			  115,  136,  113,  142,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,  141,    2,  130,  117,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  124,    2,  125,  137,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2, yyDummy>>,
			1, 200, 0)
		end

	yytranslate_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytranslate'.
		do
			yyarray_subcopy (an_array, <<
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
			  105,  106,  107,  108,  109,  110,  112,  114,  116,  119,
			  120,  121,  122,  123,  138,  139, yyDummy>>,
			1, 176, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 909)
			yyr1_template_1 (an_array)
			yyr1_template_2 (an_array)
			yyr1_template_3 (an_array)
			yyr1_template_4 (an_array)
			yyr1_template_5 (an_array)
			Result := yyfixed_array (an_array)
		end

	yyr1_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			    0,  375,  375,  183,  376,  376,  377,  182,  378,  277,
			  277,  379,  277,  277,  380,  278,  278,  280,  280,  381,
			  280,  382,  284,  286,  285,  279,  279,  279,  384,  279,
			  385,  281,  283,  283,  282,  282,  289,  289,  287,  287,
			  287,  287,  287,  287,  287,  287,  288,  181,  181,  181,
			  181,  303,  303,  304,  304,  272,  272,  272,  386,  273,
			  273,  271,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  216,  216,  387,  217,  217,  217,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,

			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  211,  211,  210,  210,  212,  212,  212,
			  207,  214,  214,  213,  213,  213,  215,  215,  215,  215,
			  208,  209,  333,  333,  336,  336,  337,  337,  390,  339,
			  339,  391,  335,  335,  335,  335,  335,  335,  340,  340,
			  340,  340,  338,  355,  355,  392,  356,  356,  356,  353,
			  354,  235,  235,  393,  236,  236,  237,  237,  394,  234,
			  234,  234,  395,  234,  258,  258,  258,  186,  396,  186,
			  187,  187,  187,  187,  184,  185,  189,  189,  188,  311, yyDummy>>,
			1, 200, 0)
		end

	yyr1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  311,  397,  312,  312,  309,  309,  398,  310,  310,  307,
			  307,  399,  308,  308,  306,  306,  306,  260,  228,  228,
			  229,  229,  400,  226,  226,  226,  401,  226,  402,  226,
			  226,  226,  403,  226,  404,  227,  227,  227,  261,  222,
			  222,  223,  405,  224,  224,  224,  221,  220,  220,  367,
			  367,  406,  368,  368,  366,  256,  256,  255,  257,  257,
			  253,  253,  254,  254,  407,  407,  407,  407,  347,  347,
			  347,  347,  347,  347,  343,  343,  343,  343,  343,  343,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,
			  348,  348,  348,  348,  348,  348,  348,  348,  348,  348,

			  348,  348,  348,  344,  344,  344,  344,  344,  344,  344,
			  344,  305,  305,  357,  357,  252,  252,  165,  165,  259,
			  259,  259,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  259,  259,  259,  259,  259,  259,  259,  259,
			  251,  251,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  269,  266,  266,  361,  267,
			  267,  267,  267,  267,  267,  263,  262,  264,  265,  319, yyDummy>>,
			1, 200, 200)
		end

	yyr1_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  319,  319,  408,  320,  320,  320,  320,  320,  320,  316,
			  315,  317,  318,  409,  409,  409,  409,  409,  409,  409,
			  409,  410,  342,  342,  342,  342,  342,  341,  341,  341,
			  341,  341,  302,  302,  301,  301,  411,  322,  322,  321,
			  321,  369,  369,  370,  370,  191,  191,  362,  362,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  365,  365,  365,  365,  365,

			  365,  365,  365,  365,  365,  365,  365,  365,  365,  365,
			  365,  365,  365,  365,  365,  365,  365,  365,  365,  275,
			  275,  153,  153,  155,  155,  388,  154,  154,  154,  154,
			  154,  389,  150,  156,  156,  157,  157,  157,  158,  158,
			  158,  158,  158,  158,  151,  152,  314,  314,  314,  313,
			  313,  313,  313,  313,  313,  313,  313,  313,  313,  313,
			  313,  313,  313,  313,  313,  313,  313,  313,  313,  313,
			  346,  346,  345,  345,  345,  345,  345,  345,  345,  345,
			  345,  345,  345,  345,  345,  345,  345,  345,  345,  345,
			  345,  192,  201,  193,  194,  195,  196,  197,  198,  199, yyDummy>>,
			1, 200, 400)
		end

	yyr1_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  199,  200,  190,  203,  203,  204,  204,  202,  202,  412,
			  293,  293,  293,  293,  293,  293,  293,  293,  293,  293,
			  293,  293,  293,  293,  293,  293,  293,  175,  175,  175,
			  175,  294,  294,  294,  294,  296,  296,  296,  296,  225,
			  225,  413,  413,  276,  276,  276,  276,  232,  233,  233,
			  231,  292,  292,  373,  373,  372,  372,  371,  179,  179,
			  414,  180,  180,  180,  178,  176,  176,  177,  177,  177,
			  177,  146,  205,  205,  230,  330,  330,  330,  415,  329,
			  329,  328,  295,  295,  295,  295,  295,  295,  295,  244,
			  244,  243,  171,  171,  358,  358,  241,  241,  240,  240,

			  240,  240,  240,  240,  240,  240,  239,  239,  147,  147,
			  147,  416,  148,  148,  148,  250,  242,  242,  242,  242,
			  374,  374,  238,  238,  247,  247,  247,  247,  247,  247,
			  247,  247,  247,  247,  247,  247,  247,  247,  247,  247,
			  247,  247,  247,  247,  247,  247,  248,  248,  248,  248,
			  248,  248,  249,  249,  249,  249,  249,  249,  249,  249,
			  249,  249,  249,  249,  249,  249,  249,  249,  249,  249,
			  246,  246,  246,  246,  246,  246,  246,  246,  246,  246,
			  246,  246,  246,  246,  246,  246,  245,  245,  245,  167,
			  167,  168,  417,  169,  418,  149,  149,  149,  334,  323, yyDummy>>,
			1, 200, 600)
		end

	yyr1_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  323,  419,  324,  324,  324,  331,  331,  420,  332,  332,
			  332,  359,  359,  421,  360,  360,  360,  206,  206,  206,
			  206,  206,  144,  143,  145,  170,  170,  290,  291,  291,
			  291,  291,  291,  291,  291,  291,  291,  291,  291,  291,
			  268,  422,  163,  163,  163,  163,  163,  161,  161,  161,
			  423,  162,  162,  162,  160,  159,  159,  159,  325,  325,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  326,  172,  172,  174,  174,  173,
			  166,  166,  297,  297,  299,  299,  300,  300,  298,  349,

			  349,  351,  351,  352,  352,  350,  274,  274,  274,  383, yyDummy>>,
			1, 110, 800)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1708)
			yytypes1_template_1 (an_array)
			yytypes1_template_2 (an_array)
			yytypes1_template_3 (an_array)
			yytypes1_template_4 (an_array)
			yytypes1_template_5 (an_array)
			yytypes1_template_6 (an_array)
			yytypes1_template_7 (an_array)
			yytypes1_template_8 (an_array)
			yytypes1_template_9 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytypes1_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    1,    8,    2,    2,   43,   80,   80,   43,   80,   80,
			    2,   43,   43,    2,   80,   81,   81,    1,   80,   81,
			   81,    1,   22,   78,    2,    2,    2,    2,    2,   21,
			   80,   80,   12,   12,   12,   12,   81,   21,   80,   21,
			   80,   19,   19,    5,    6,    6,   16,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   13,    9,    7,    7,    2,    7,    9,    9,    9,   56,
			   12,   81,   82,   83,   84,   13,   13,   13,   13,   15,
			   15,   15,   16,   16,   16,   16,    5,   78,    2,   99,

			    2,    2,    2,    2,   80,   80,    5,   80,   80,   16,
			   13,   16,   13,   23,    5,   12,   12,   12,    2,    2,
			    2,    2,    2,    2,   12,   90,   90,  108,  108,  114,
			  114,   19,    1,   22,    2,   98,    5,    5,   12,   84,
			    2,    2,   76,   77,   78,   12,    5,   15,  102,    1,
			    2,    2,    2,   12,   84,   12,    2,    2,   12,   90,
			  108,   12,    2,    2,   12,   90,   22,   28,   28,    1,
			   12,    2,    2,   12,   90,   12,    2,    2,   12,   90,
			   12,    2,   12,   90,   12,   12,    5,   10,   12,   22,
			   28,    1,    5,    5,   12,    5,    5,   98,    2,   84, yyDummy>>,
			1, 200, 0)
		end

	yytypes1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			   12,   12,    5,    5,   78,    5,  114,   58,    1,    2,
			  102,  104,   12,   12,   12,   28,   12,    2,   12,   90,
			    5,   10,   12,   28,   28,    5,   28,   12,    2,   12,
			   90,    5,   10,   12,   28,    5,    5,   23,    5,   12,
			   12,   12,    2,    2,    2,    2,    2,   27,   27,   27,
			   28,   28,   12,   12,   90,  114,  114,   28,   12,    2,
			   12,   90,    5,   10,   12,   28,    5,   28,   12,    2,
			   12,   90,    5,   10,   12,   28,    5,   28,    5,   10,
			   12,   28,    5,   28,   28,  114,    5,   12,   12,   12,
			   28,   12,    9,   13,   15,   16,   19,  114,   19,   19,

			    5,    5,    5,    2,   20,   17,   16,   14,   13,   11,
			   10,    5,    4,    3,    2,    2,    2,    2,    2,   24,
			   24,   24,    7,   35,   35,   36,    9,    9,   56,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   65,   12,   85,   85,   13,   95,   15,   15,   98,
			   98,  100,   16,  112,  113,    5,    5,    5,   23,    5,
			   12,    2,    2,    2,    2,    2,   52,   12,   90,    5,
			    2,   55,   55,    2,    2,   57,   58,    5,   45,   45,
			  102,   28,    5,   10,   12,   28,    5,  114,   12,   28,
			    5,   10,   12,   28,    5,  114,   12,   12,    2,   12, yyDummy>>,
			1, 200, 200)
		end

	yytypes1_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			   12,    2,   12,    5,    5,   28,    5,   12,    2,   12,
			   12,    2,   12,   12,   12,   12,   12,   28,   12,   12,
			   12,   28,   28,    5,   28,    5,    5,   28,    5,   10,
			   12,   28,    5,  114,   12,   28,    5,   10,   12,   28,
			    5,  114,   12,  114,   12,    5,    5,    5,    5,    5,
			   64,   64,   17,   10,    2,    2,   71,   12,  100,   12,
			   12,   12,   12,  114,   64,   64,   64,    5,   95,    5,
			    5,   26,    5,    5,   17,   10,   32,   71,   75,   75,
			   12,  100,    5,    1,   64,    5,   64,    5,   15,    5,
			    2,   94,   94,    5,    5,    5,    5,   19,   19,    5,

			    5,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   14,   14,   14,   14,   11,    5,    5,   22,   22,    5,
			   98,   26,    5,   31,   64,   52,   52,   12,    2,   12,
			   12,    2,   12,   22,   50,   50,    1,   12,    2,   12,
			   12,    2,   12,   12,   12,   12,   12,    2,   51,   22,
			   50,   50,    1,   55,   69,   69,    1,    5,   45,   57,
			   45,   57,   58,   12,  104,  102,  114,   12,    5,  114,
			   12,    5,   28,   12,   12,   28,   28,   12,   12,   28,
			    1,    1,    1,   28,   12,   12,   28,   28,   12,   12,
			   28,   28,   28,   28,   28,    5,    5,    5,  114,  114, yyDummy>>,
			1, 200, 400)
		end

	yytypes1_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			   12,    5,  114,   12,    5,    5,    5,    1,    1,    1,
			    5,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,    5,    5,   64,   65,   95,    5,   26,   12,    5,
			  114,    5,   31,    5,    2,  106,   73,   73,   74,   74,
			   75,   12,    5,  106,    2,  114,    2,    5,  113,  114,
			    1,    2,   47,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,

			    2,   64,    2,   64,   64,   12,   12,   35,   35,    5,
			   31,    5,   51,   51,   50,   12,   12,   50,   50,   12,
			   12,   50,    5,   23,    5,   12,    2,    2,    2,    2,
			    2,   49,   49,   49,   50,   50,   52,   52,   12,   12,
			   90,   50,   12,   12,   50,   50,   12,   12,   50,   50,
			   50,   50,   50,    2,   51,    5,   50,   12,   53,   54,
			   55,   71,    2,   88,   88,    2,   68,   68,   69,    5,
			   45,   57,   57,   72,   12,   57,   57,   58,    5,   12,
			  101,  103,  104,    5,    5,    5,    5,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28, yyDummy>>,
			1, 200, 600)
		end

	yytypes1_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			   28,    1,    1,    1,   21,    5,    5,    5,    5,    5,
			    5,   12,   12,  114,    5,    5,    5,   95,   26,   64,
			   65,    5,    5,   71,  114,    2,    1,    2,    2,   93,
			   75,   12,   75,    5,   75,    5,   75,    5,    5,  114,
			    2,   93,   12,    5,   12,   71,   72,  113,    5,   64,
			   12,    1,   64,    2,    2,   64,   64,   26,   26,   26,
			   64,   65,   26,   23,    5,   29,   30,   31,   64,   50,
			   50,   50,   50,   12,    2,   12,   12,    2,   12,   50,
			   12,    2,   12,   12,    2,   12,   12,   12,   12,   12,
			   50,   50,   12,   50,    5,    5,    5,    5,   50,   50,

			   50,   50,   50,   51,   72,   12,    5,    5,   55,    5,
			    5,    1,   80,   45,   69,    2,   66,   71,   12,  107,
			  107,  109,  109,    1,   44,   44,   45,   12,   57,   57,
			    5,   57,   28,   21,  104,  104,    5,   12,    5,   12,
			    5,   12,    5,   12,   12,   26,    5,   12,    5,    5,
			   26,   26,   31,  106,    1,    1,   93,   15,    2,    2,
			   46,  114,  106,   15,    2,   46,    5,   64,    5,    5,
			    5,  113,    5,   21,    5,   64,   12,   64,   64,    5,
			    5,   26,  114,    5,    5,    5,   31,   50,   12,   12,
			   50,   50,   12,   12,   50,   50,   12,   12,   50,   50, yyDummy>>,
			1, 200, 800)
		end

	yytypes1_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			   12,   12,   50,   50,   50,   50,   50,    5,    1,   52,
			    2,   51,    2,    1,    5,  116,  116,    1,    2,   66,
			  107,  109,    5,    5,    2,   75,   75,    2,  107,  109,
			    5,    2,   33,  107,  109,    5,   45,    5,   45,    5,
			    2,    2,    2,    2,    2,   63,   89,   89,   89,  111,
			   12,   12,   12,   12,   64,   26,    2,   93,    1,   12,
			   91,   91,   92,   92,   93,    2,   67,    5,   97,   46,
			   46,    1,    2,  105,   21,    2,   93,   67,   97,  105,
			  114,    2,   12,   21,   21,    5,    2,  117,  117,  117,
			    5,   50,   50,   50,   50,   50,   50,   50,   50,    1,

			   50,   50,   21,    5,    5,  116,    5,    1,    1,    5,
			  107,  109,  107,  109,  114,    5,    2,   80,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   89,   89,  111,   89,   63,   89,   89,    2,   89,
			   89,   89,   89,   63,   63,   15,    2,   46,    5,    5,
			   93,   93,   93,   93,   15,  105,    5,   97,   46,   21,
			    5,    5,   18,   17,    4,    2,    2,    2,    2,    2,
			    2,    2,    2,   25,   35,   35,   35,   37,   38,   46,
			   46,   59,   64,   64,   64,   64,   12,   79,   86,   87, yyDummy>>,
			1, 200, 1000)
		end

	yytypes1_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			   87,   87,   87,  120,    2,    1,    2,   46,   46,   15,
			    2,   46,  105,   46,   46,    5,   12,   26,   21,   64,
			   12,    2,    2,   23,  114,  115,  116,    1,    1,  107,
			  109,    2,   34,  114,   80,   99,   71,   72,   89,   89,
			   71,  110,  110,  111,   89,   21,   45,   62,   63,   89,
			   89,    2,   89,   67,   97,  105,  114,    2,   15,   96,
			   97,  105,   23,    5,   12,    2,    2,    2,    2,    2,
			   12,   90,  114,  114,    5,   26,   64,   64,   64,   46,
			    5,   97,    1,    1,   46,   46,    5,    5,   94,    5,
			    5,   26,   46,    5,    5,    1,    1,   46,    2,   67,

			   97,  105,    2,  105,    2,    5,    5,    5,  116,   43,
			   71,   21,    5,    2,   80,   34,   99,  106,   89,    2,
			  111,    2,   62,   63,   89,    2,   89,  105,   46,   46,
			   21,    5,    5,   97,   46,   12,    2,   12,   17,   12,
			    2,   12,   12,  120,   28,   12,    2,   12,   12,    2,
			   12,   12,   12,   12,   12,   28,    5,    5,   12,    2,
			  119,    1,    2,   46,  114,   46,    5,  120,    2,    2,
			   46,    1,   94,   64,   64,    2,  117,   12,   12,   46,
			   64,   64,    1,  105,   46,   46,   46,   64,    2,    7,
			    9,   48,   13,   15,   16,    2,   48,   80,   99,    2, yyDummy>>,
			1, 200, 1200)
		end

	yytypes1_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			   80,  106,    2,    2,   93,   66,   70,   71,   72,   63,
			    2,   89,    2,  105,    2,    2,   28,   12,   12,   28,
			   28,   12,   12,   28,    5,   28,   12,   12,   28,   28,
			   12,   12,   28,   28,   28,   28,   28,  120,    5,    5,
			   12,    2,    2,   46,    2,   42,  118,  119,   46,    2,
			    2,   46,   61,    1,    5,    2,  114,    5,   46,   46,
			    2,    2,   46,   47,   64,    2,   26,   26,    2,  105,
			    2,    2,   21,   21,   21,   21,   21,   99,  106,   80,
			   99,    2,    2,   93,  105,   15,    2,   46,    5,   70,
			    2,   46,   28,   28,   28,   28,   12,   28,   28,   28,

			   28,    5,   12,   26,   46,    2,   42,   46,  119,   46,
			    2,    2,   46,    2,   60,   61,    5,    5,   12,    2,
			    2,   46,   46,   64,   46,  106,    2,    2,   93,   99,
			  106,  105,   15,    2,   46,    2,   67,   97,  105,    2,
			   26,   12,   26,   19,   19,    5,    9,   39,   40,   41,
			   42,   12,   13,  112,    2,   64,   61,   12,  120,   26,
			   46,  117,    2,  117,   46,    2,    2,    2,   93,  105,
			   15,    2,    2,   46,   46,  106,    2,    2,   93,    2,
			   67,   97,  105,   21,  105,   46,   46,   26,  114,    5,
			    5,   42,   46,   26,    5,    2,    2,    2,  105,   15, yyDummy>>,
			1, 200, 1400)
		end

	yytypes1_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    2,   46,    2,   67,   46,   97,  105,  105,    2,    2,
			   93,  105,   15,    2,   46,   21,  105,   46,   46,    2,
			  105,    2,    5,   40,   12,    2,   67,   97,  105,   21,
			  105,   46,   46,   46,  105,   15,    2,   46,    2,   67,
			   97,  105,    2,  105,    2,   21,   46,   21,   26,   21,
			  105,   46,   46,    2,  105,    2,    2,    2,   67,   97,
			  105,   21,  105,   46,   46,   21,   46,   21,    2,    2,
			  105,    2,   21,   46,   21,   21,   21,  105,   46,   46,
			    2,  105,    2,    2,   21,   21,   46,   21,    2,    2,
			  105,    2,   21,   46,   21,   21,    2,   21,   21,   46,

			   21,    2,   21,    2,   21,   21,    1,    1,    1, yyDummy>>,
			1, 109, 1600)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    3,    4,    5,    5,    5,    5,    5,    5,    6,    7,
			    7,    8,    9,   10,   11,   12,   12,   12,   13,   14,
			   14,   14,   14,   14,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,

			   15,   15,   15,   15,   15,   15,   15,   16,   17,   18,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   20,
			    6,    6,    6,    2,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,   19,   19,    5,    5,    5,    5,
			   21,   22,   23, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1708)
			yydefact_template_1 (an_array)
			yydefact_template_2 (an_array)
			yydefact_template_3 (an_array)
			yydefact_template_4 (an_array)
			yydefact_template_5 (an_array)
			yydefact_template_6 (an_array)
			yydefact_template_7 (an_array)
			yydefact_template_8 (an_array)
			yydefact_template_9 (an_array)
			Result := yyfixed_array (an_array)
		end

	yydefact_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			   15,   15,   14,   11,    1,   16,   51,    2,  909,  909,
			   52,   55,    3,   53,   13,   19,   21,    0,   10,   28,
			   30,    0,   58,  142,   53,   53,   53,   54,    0,   24,
			  909,  909,  907,  908,  906,    0,   22,   34,  909,   35,
			  909,    0,    0,    0,  883,  888,  901,  860,  879,  878,
			  877,  882,  881,  880,  876,  875,  874,  873,  872,  871,
			  870,  869,  868,  867,  866,  865,  864,  863,  862,  861,
			  894,  887,  890,  891,  641,   39,   40,  886,  885,    0,
			   38,   31,   36,    0,   32,   41,  893,  892,  895,   43,
			  859,  858,   42,  900,  899,  902,   56,    0,    0,  909,

			    0,    0,    0,    0,   18,   20,    0,   27,   29,  904,
			  897,  903,  896,    0,    0,  520,  533,  519,    0,    0,
			    0,    0,    0,    0,  447,  461,    0,  569,  572,    0,
			  448,    0,    0,  807,   44,    0,    0,   46,   38,   37,
			    0,    0,    0,    0,   57,   62,    0,  143,  909,    0,
			    0,    0,    0,   47,   23,  533,    0,    0,  521,    0,
			  548,  533,    0,    0,  521,    0,  525,  462,  534,    0,
			  533,    0,    0,  521,    0,  533,    0,    0,  521,    0,
			  533,    0,  521,    0,  521,  521,    0,  559,  549,  525,
			  449,    0,    0,    0,    0,    0,  805,    0,   45,   33, yyDummy>>,
			1, 200, 0)
		end

	yydefact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			   64,   63,   59,   61,   60,    0,    0,  239,    0,  196,
			  145,  148,   50,   49,   48,  470,  533,    0,  521,    0,
			    0,  567,  557,  459,  522,    0,  468,  533,    0,  521,
			    0,    0,  565,  555,  457,    0,  535,    0,    0,  907,
			  908,  906,    0,    0,    0,    0,    0,    0,    0,    0,
			  536,  537,    0,  447,  484,    0,    0,  466,  533,    0,
			  521,    0,    0,  563,  553,  455,    0,  464,  533,    0,
			  521,    0,    0,  561,  551,  453,    0,  463,    0,  560,
			  550,  451,    0,  452,  450,    0,  523,  520,  533,  519,
			  524,  571,  889,  898,  884,  905,  642,    0,    0,    0,

			    0,  388,    0,    0,  779,  773,  759,    0,  758,    0,
			  774,  801,  708,  841,    0,    0,    0,    0,    0,  756,
			  755,  437,  776,  750,  753,  777,  788,  780,  754,    0,
			    0,    0,  772,  785,  786,  770,  749,  752,  722,  723,
			  746,    0,  708,  778,  847,  747,  783,  787,  781,  757,
			  806,  775,  748,  771,  784,    0,    0,    0,    0,    0,
			  131,    0,    0,    0,    0,    0,   65,  123,   89,    0,
			  242,  909,  240,  228,  234,  222,  219,    0,  197,  151,
			    0,  471,    0,  568,  558,  460,    0,    0,  589,  469,
			    0,  566,  556,  458,    0,    0,  587,  533,    0,  521, yyDummy>>,
			1, 200, 200)
		end

	yydefact_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  533,    0,  521,  531,  531,  534,  531,  533,    0,  521,
			  533,    0,  521,  533,  521,  521,  521,  527,  907,  908,
			  906,  540,  539,    0,  472,  526,  532,  467,    0,  564,
			  554,  456,    0,    0,  585,  465,    0,  562,  552,  454,
			    0,    0,  583,    0,  582,    0,  531,  531,  531,  639,
			  760,  761,  718,  717,    0,    0,  716,  319,  719,  907,
			  908,  906,    0,    0,  764,  762,  763,  799,    0,  711,
			    0,  696,  388,    0,  844,  845,    0,  847,  840,  422,
			  842,  843,    0,  422,    0,    0,  766,  813,  782,    0,
			  421,  438,  672,    0,    0,    0,    0,    0,    0,  808,

			  715,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  792,  794,  809,
			  810,  698,  850,  827,    0,   67,   66,  131,    0,  123,
			  131,    0,  123,  525,  132,   90,    0,  131,    0,  123,
			  131,    0,  123,  131,  123,  123,  123,   73,   68,  525,
			  124,   77,    0,    0,  256,  432,    0,  188,  226,    0,
			  232,    0,    0,    0,    0,  147,    0,  590,    0,    0,
			  588,    0,  493,  533,  521,  482,  491,  533,  521,  480,
			    0,    0,    0,  489,  533,  521,  478,  487,  533,  521,
			  476,  486,  474,  475,  473,  531,  531,  531,  544,    0, yyDummy>>,
			1, 200, 400)
		end

	yydefact_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  586,    0,    0,  584,    0,    0,    0,    0,    0,    0,
			    0,  342,  320,  323,  357,  356,  355,  354,  353,  352,
			  351,  350,  349,  348,  347,  346,  345,  344,  343,  322,
			  321,  358,  359,  341,  339,  338,  336,  340,  337,  335,
			  334,  333,  332,  331,  330,  329,  328,  327,  326,  325,
			  324,    0,  751,    0,    0,  800,  709,    0,    0,  386,
			    0,    0,  825,    0,  421,  399,    0,    0,    0,    0,
			  387,  708,    0,  399,    0,    0,    0,  811,    0,    0,
			  439,    0,    0,  745,  743,  744,  742,  725,  726,  727,
			  729,  731,  732,  734,  733,  735,  728,  730,  741,  738,

			    0,  737,    0,  736,  724,  708,  708,    0,    0,  848,
			    0,  798,   70,   69,   98,  131,  123,   87,   96,  131,
			  123,   85,  133,    0,    0,  908,    0,    0,    0,    0,
			    0,    0,    0,    0,  134,  135,    0,    0,    0,  123,
			  112,   94,  131,  123,   83,   92,  131,  123,   81,   91,
			   79,   80,   78,   71,    0,  125,  126,    0,  243,  244,
			  241,    0,  421,  433,   15,  263,  258,  260,  257,  189,
			    0,    0,  227,  236,  235,    0,  233,  221,  198,  521,
			  158,  159,  150,    0,    0,    0,    0,  494,  483,  492,
			  481,  529,  542,  530,  543,  528,  541,  490,  479,  488, yyDummy>>,
			1, 200, 600)
		end

	yydefact_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  477,    0,    0,    0,  545,  538,    0,    0,    0,    0,
			    0,  570,  708,    0,    0,  802,  803,  804,  710,    0,
			    0,  708,  846,  847,  422,  421,  423,  402,    0,    0,
			  392,  396,  391,  389,  394,  390,  393,  395,    0,  422,
			    0,    0,  824,    0,  768,    0,    0,  812,    0,  413,
			  708,  440,  673,    0,    0,  740,  739,  707,  705,  791,
			    0,    0,  793,  856,    0,    0,    0,  849,  855,   99,
			   88,   97,   86,  131,    0,  123,  131,    0,  123,  132,
			  131,    0,  123,  131,    0,  123,  131,  123,  123,  123,
			  128,  138,    0,  137,  127,  130,  531,    0,  124,   95,

			   84,   93,   82,   72,    0,    0,  531,  246,  245,    0,
			    0,  436,    0,  262,  259,    0,  311,  360,  319,  265,
			  274,  264,  268,  261,    0,    0,  187,  194,  225,  237,
			  238,  231,  152,  162,  160,  161,    0,  580,    0,  578,
			    0,  576,    0,  574,  573,  640,    0,  708,  712,  713,
			  714,  697,  826,  399,  424,  425,    0,  315,  675,  909,
			  427,  397,  399,  315,  675,  427,    0,  767,  217,  814,
			  815,  816,    0,  414,  415,  417,  708,  443,  443,  795,
			  796,  797,    0,  854,  851,  852,  853,  121,  131,  123,
			  110,  119,  131,  123,  108,  117,  131,  123,  106,  115, yyDummy>>,
			1, 200, 800)
		end

	yydefact_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  131,  123,  104,  114,  102,  103,  101,  531,    0,  140,
			   75,   76,   74,    0,  251,  247,    0,  434,    8,  311,
			  275,  269,    0,    0,  312,  385,  311,   15,  277,  271,
			    0,    0,  361,  267,  266,  190,  193,  191,  192,  195,
			  206,  211,  165,  201,  173,  207,    0,  202,  212,  174,
			  581,  579,  577,  575,  765,  695,    0,    0,  426,  410,
			    0,    0,  403,  404,  401,    0,  427,  678,  909,  604,
			  591,    0,  421,  445,  398,    0,    0,  427,  909,  445,
			    0,    0,  708,  416,  418,  419,    0,  444,    0,    0,
			  751,  122,  111,  120,  109,  118,  107,  116,  105,    0,

			  129,  139,  141,  136,  249,    0,  248,  435,    6,    0,
			  279,  273,  276,  270,  317,    0,   15,  142,  384,  362,
			  381,  378,  383,  382,  380,  377,  375,  379,  376,  374,
			  373,  372,  371,  370,  369,  368,  367,  366,  365,  364,
			  363,    0,    0,    0,    0,    0,  208,  202,  157,  203,
			  212,  213,    0,  175,  207,  315,  675,  427,  409,    0,
			  406,  405,  408,  407,  316,    0,  676,    0,  427,  626,
			    0,    0,  625,  773,  708,    0,    0,    0,  909,    0,
			  675,  641,  421,  599,    0,  789,  790,    0,  624,  437,
			  602,  623,    0,    0,    0,    0,  720,  617,  618,  609, yyDummy>>,
			1, 200, 1000)
		end

	yydefact_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  610,  612,  611,    0,  421,  428,  909,    0,  446,  315,
			  675,  427,    0,  427,    0,    0,  769,  694,  420,  441,
			  708,  822,  823,  857,    0,    0,  250,    7,   15,  278,
			  272,    0,  280,  317,  142,  422,  214,  215,  205,  210,
			    0,  166,  167,  164,  200,  183,  182,  178,  172,  212,
			    0,  156,  202,  427,  909,  445,  411,  839,    0,    0,
			  677,  445,    0,    0,  533,    0,    0,    0,    0,    0,
			  495,  508,    0,    0,    0,  696,    0,  909,    0,  598,
			    0,  909,    0,    0,  600,  437,    0,    0,    0,    0,
			    0,  698,    0,    0,    0,  429,  430,  597,  835,  427,

			  909,  445,  838,  445,  834,    0,  254,  252,  253,    5,
			  318,  281,    0,   15,  142,   15,  422,  399,  216,    0,
			  168,  179,    0,    0,    0,  155,  212,    0,  427,    0,
			  412,  681,  679,  680,    0,  533,    0,  521,  721,  908,
			    0,  720,    0,  633,  509,  533,    0,  521,  533,    0,
			  521,  533,  521,  521,  521,  496,    0,    0,    0,    0,
			    0,    0,  909,  909,    0,    0,    0,  637,  909,  627,
			    0,    0,  672,  614,  613,    0,    0,  708,  708,  608,
			  616,  615,  431,    0,  427,    0,    0,  442,  313,  817,
			  818,  313,  819,  821,  820,  313,  313,  142,  422,   15, yyDummy>>,
			1, 200, 1200)
		end

	yydefact_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  142,  399,  427,    0,    0,  169,  181,  184,  185,  177,
			  154,    0,  833,  445,  829,  837,  517,  533,  521,  506,
			  515,  533,  521,  504,    0,  513,  533,  521,  502,  511,
			  533,  521,  500,  510,  498,  499,  497,  631,    0,  708,
			  671,  652,  909,    0,  660,    0,  655,  654,  593,  643,
			  909,    0,    0,    0,    0,  674,    0,    0,  606,  594,
			  629,  628,    0,    0,    0,    0,  707,  705,  832,  445,
			  828,  836,  314,  286,  284,  285,  283,  422,  399,  142,
			  422,  427,    0,    0,    0,  315,  675,  427,  170,  186,
			  153,    0,  518,  507,  516,  505,  708,  514,  503,  512,

			  501,    0,  708,  697,  596,  651,    0,  657,  656,  595,
			  644,  645,    0,    0,  648,  647,    0,    0,  708,  630,
			  909,  443,    0,    0,    0,  399,  427,    0,    0,  422,
			  399,    0,  315,  675,  427,  313,  427,  909,  445,  831,
			  634,  708,  695,    0,    0,    0,  668,  661,  665,  662,
			  659,  669,  667,  670,  646,    0,  649,  708,  635,  638,
			  601,    0,  620,    0,    0,  830,  427,    0,    0,    0,
			  315,  909,  675,  427,  427,  399,  427,    0,    0,  313,
			  427,  909,  445,  307,    0,  427,    0,  632,    0,  664,
			    0,  663,  650,  694,    0,  622,  621,  619,    0,  315, yyDummy>>,
			1, 200, 1400)
		end

	yydefact_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  675,  427,  313,  427,  592,  909,  445,  445,  427,    0,
			    0,    0,  315,  675,  427,  308,    0,  427,    0,  313,
			  445,  313,    0,  666,  708,  313,  427,  909,  445,  296,
			    0,  427,    0,    0,    0,  315,  675,  427,  313,  427,
			  909,  445,  313,  445,  313,  309,    0,  303,  636,  295,
			    0,  427,    0,  313,  445,  313,  313,  313,  427,  909,
			  445,  298,    0,  427,    0,  310,    0,  304,  313,  313,
			  445,  313,  300,    0,  288,  282,  297,    0,  427,    0,
			  313,  445,  313,  313,  305,  299,    0,  287,  313,  313,
			  445,  313,  302,    0,  290,  306,  313,  292,  301,    0,

			  289,  313,  291,  313,  294,  293,    0,    0,    0, yyDummy>>,
			1, 109, 1600)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 280)
			yydefgoto_template_1 (an_array)
			yydefgoto_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yydefgoto_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yydefgoto'.
		do
			yyarray_subcopy (an_array, <<
			  319,  320,  321, 1183,  521,  818,  859,  247,  248,  249,
			  223,  791,  224,  167,  168,  792,  865,  866,  523,  867,
			  476, 1032, 1232,  322, 1184,  323,  324,  325, 1187,   76,
			  326,  327, 1188, 1547, 1548, 1549, 1445, 1550,   11,   12,
			    4,  924,  925, 1246,  926,  378,  379, 1069, 1207,  960,
			 1363, 1370, 1451, 1443, 1208, 1189, 1285, 1521, 1574, 1190,
			 1070, 1459,  682, 1391,  731,  732,  733,  550,  551, 1100,
			  534,  535, 1101,  548,  903,  736,  737,  758,  759,  371,
			  372,  760,  328,  375,  772,  207,  376, 1191, 1514, 1452,
			 1515, 1247, 1045, 1154, 1248,  849,  330,  331,  332,  333,

			  334,  335,  336,  337,  338,  339,  340,  861,  916, 1066,
			  766,  767,  554,  555,  768, 1406,  917, 1237,  773,  666,
			  667,  668,  669, 1025,  670,  479, 1026,  142,  143,   23,
			  144,  342,  124, 1197,    5,    6,   18,   14,   19,   20,
			   81,   15,   16,   36,   82,   83,   84,  343,  344, 1198,
			 1199, 1200, 1201, 1202,   85,  345,   87,   88,  763,  764,
			   13,   28, 1027, 1238, 1151, 1152, 1146, 1147, 1149, 1150,
			  125,  126, 1060, 1061, 1062, 1063,  829, 1064,  491,  492,
			  346,  655,   89,  347,  348, 1259, 1260, 1068,  349,  350,
			   99,  351,  780,  148,  210,  781,  211,  782, 1073,  665, yyDummy>>,
			1, 200, 0)
		end

	yydefgoto_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yydefgoto'.
		do
			yyarray_subcopy (an_array, <<
			  919,  920,  127,  128,  921,  922,   92,  352,   94,   95,
			 1241, 1242, 1049, 1243, 1473,  353,  354,  847,  355,  255,
			  130,  256, 1272, 1225, 1015, 1226, 1087, 1088, 1446, 1447,
			 1360, 1203, 1706, 1227, 1228, 1108,    9,    8,   30,   31,
			 1071,   38,   40,   97,  754,  191,  580,  380,  564, 1143,
			 1145, 1323, 1322,  770, 1144, 1141, 1142,  562,  771,  559,
			  775,  561,  553, 1105,  923,  956,  851,  680, 1017, 1292,
			  132, 1506, 1167,  657,  707,  708,  468,  197,  678,  483,
			  710, yyDummy>>,
			1, 81, 200)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1708)
			yypact_template_1 (an_array)
			yypact_template_2 (an_array)
			yypact_template_3 (an_array)
			yypact_template_4 (an_array)
			yypact_template_5 (an_array)
			yypact_template_6 (an_array)
			yypact_template_7 (an_array)
			yypact_template_8 (an_array)
			yypact_template_9 (an_array)
			Result := yyfixed_array (an_array)
		end

	yypact_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  132,  127, 2293, 2263, -32768, -32768, 1834, -32768, -32768, -32768,
			 -32768, 1712, -32768,  460, -32768, 1385, -32768, 1041, -32768, 1071,
			  382, 2687, 1720,  920, 1835, 1835, 1835, -32768, 1842, -32768,
			 -32768, -32768, -32768, -32768, -32768, 1715, -32768, -32768, -32768, -32768,
			 -32768,  221,  169,  753, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, 1172, -32768, -32768, -32768, -32768,   51,
			 1713, -32768, 1708, 2687, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  944, 6764, 2343,

			 1829, 1825, 1819, 1041, -32768, -32768, 2687, -32768, -32768, -32768,
			 -32768, -32768, -32768, 1392, 1381, -32768,  958, -32768, 1378, 1365,
			 1619,  174,  174,  939,  948, -32768, 1693, -32768, 1687, 1695,
			 -32768,  174, 1694, 1686, -32768, 1799, 2687, -32768, -32768, -32768,
			 1041, 1041,  817,  944, -32768, 1741,  753, -32768, 1539, 1685,
			 1041, 1041, 1041, -32768, -32768,  958, 1602,  915,  948, 1670,
			 -32768,  958, 1598,  844,  948, 1663, 1661, -32768, -32768, 1682,
			  958, 1595,  831,  948, 1658,  958, 1531,  777,  948, 1644,
			  958,  766,  948, 1643,  948,  948,  753, 1560, 1557, 1640,
			 -32768, 1672, 1041, 6663, 1656,  753, -32768, 5827, -32768, -32768, yyDummy>>,
			1, 200, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 1706, 1704, -32768, -32768, -32768, 1611, 1636, 1697,  876, 1622,
			 -32768, 2170, -32768, -32768, -32768, -32768,  958,  663,  948, 1628,
			  753, 1560, 1557, -32768, -32768, 1041, -32768,  958,  625,  948,
			 1618,  753, 1560, 1557, -32768, 1041, -32768, 1311, 1306,  682,
			  576,  375, 1301, 1296, 1528,  174,  174, 1672, 1188, 1188,
			 -32768, -32768, 1615,  948, 1621, 1612, 1616, -32768,  958,  619,
			  948, 1609,  753, 1560, 1557, -32768, 1041, -32768,  958,  457,
			  948, 1606,  753, 1560, 1557, -32768, 1041, -32768,  753, 1560,
			 1557, -32768, 1041, -32768, -32768, 1614, -32768, 1608,  326, 1607,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, 1605, 5827, 5827,

			  699, -32768, 1565, 5827, -32768, 1597, -32768, 5827, -32768, 5827,
			 1596, 1662,  746,  605, 5827, 5931, 1592, 6764, 1591, -32768,
			 -32768, 1171, -32768, 1139, 1136, -32768, -32768, -32768, -32768, 6408,
			 1587, 1585, 1584, -32768, -32768, -32768, 1102, 1100, -32768, -32768,
			 -32768, 5723,  482, -32768, 1324, -32768, -32768, -32768, -32768, -32768,
			 -32768, 1582, -32768, 1581, -32768, 5827, 1611, 1611, 1198, 1182,
			 1253, 1137, 1127, 1521,  174,  174, 1620, 1250, -32768, 3119,
			 -32768, 1076, -32768,  580,  316, 1004, -32768, 1635, -32768, 1775,
			 1685, -32768,  753, 1560, 1557, -32768, 1041, 1583, 1408, -32768,
			  753, 1560, 1557, -32768, 1041, 1580, 1408,  958, 1510,  948, yyDummy>>,
			1, 200, 200)
		end

	yypact_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  958, 1491,  948, -32768, -32768, 1573, -32768,  958, 1487,  948,
			  958, 1437,  948,  958,  948,  948,  948, -32768, 1572, 1570,
			 1561, -32768, -32768,  753, 1555, -32768, -32768, -32768,  753, 1560,
			 1557, -32768, 1041, 1568, 1408, -32768,  753, 1560, 1557, -32768,
			 1041, 1559, 1408, 1558, 1408, 1550, -32768, -32768, -32768, 1536,
			 -32768, -32768, -32768, -32768, 2362, 2296, -32768, -32768, -32768,  636,
			  182,  491, 1553, 1533, -32768, -32768, -32768, -32768, 5827, 1540,
			  174, -32768, 1532,  753, -32768, -32768, 1520, 1324, -32768,   62,
			 3568, -32768, 5827,   42, 2610, 1565, 1646, 1523, -32768,  753,
			 -32768, -32768, 1097, 5827, 5827, 5827, 5827, 5827, 5827, -32768,

			 -32768, 5827, 5827, 5827, 5827, 5827, 5827, 5827, 5827, 5827,
			 5827, 5827, 5619, 5515, 5827, 1041, 1041, -32768, -32768, -32768,
			 -32768, 3430, 1516, -32768, 6453, 1620, 1620, 1253, 1403, 1250,
			 1253, 1398, 1250, 1495, -32768, -32768,  812, 1253, 1279, 1250,
			 1253, 1179, 1250, 1253, 1250, 1250, 1250, 1613, -32768, 1490,
			 -32768, -32768,  812,  450, -32768, 1586, 1480, 1488, 1893, 1041,
			 1778, 1041,  876, 1486,  174, -32768, 1485, 1408, 1477, 1429,
			 1408, 1415, 1470,  958,  948, 1469, 1461,  958,  948, 1458,
			 1682, 1682, 1682, 1454,  958,  948, 1453, 1444,  958,  948,
			 1443, 1442, 1421, 1416, 1413, -32768, -32768, -32768,  219, 1417, yyDummy>>,
			1, 200, 400)
		end

	yypact_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 1408, 1409, 1410, 1408, 1407, 1400, 1041, 1672, 1672, 1672,
			 1041, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  753, 6611, 6181, 5411, -32768, -32768, 5827, 1404, -32768,
			 1399,  450, -32768,  753, 1511,  425, 1041, 1041,  242,  144,
			 -32768,  237,  753,  412, 1041, 1397, 1041, -32768,  450, 1395,
			 5827, 5827,  121,  758,  758,  758,  758, 1711, 1711,   38,
			   38,   38,  758,  758,  758,  758,   38,   38, 6543, 1897,

			 5827, 1897, 5827, 2095, -32768,  482,  482, 5827, 5827, -32768,
			 4668, -32768, -32768, -32768, -32768, 1253, 1250, -32768, -32768, 1253,
			 1250, -32768, -32768, 1119, 1109,  441, 1106, 1064, 1140,  174,
			  174,  812, 1041, 1041, -32768, -32768, 1386, 1382,  751, 1250,
			 1379, -32768, 1253, 1250, -32768, -32768, 1253, 1250, -32768, -32768,
			 -32768, -32768, -32768, -32768, 1041, -32768, -32768, 1377, 1372,  450,
			 -32768,  709, -32768, -32768,  127, 1376, 1480,  414, -32768, -32768,
			 1041, 1041, -32768, 1041, 1366, 1041, -32768, -32768, -32768,  948,
			  125,  174, -32768, 1358, 1041, 1349, 1041, 1357, 1356, 1354,
			 1352, -32768, -32768, -32768, -32768, -32768, -32768, 1347, 1346, 1341, yyDummy>>,
			1, 200, 600)
		end

	yypact_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 1340, 1188, 1188, 1188, -32768, -32768, 1334, 1041, 1330, 1041,
			 1041, -32768,  482, 1336, 1041, -32768, -32768, -32768, -32768, 6363,
			 5307,  482, -32768, 1324,  859, -32768, 5827,  384, 3119,  631,
			 -32768,  670, -32768, -32768, -32768, -32768, -32768, -32768,  753,  859,
			 3119,  618, -32768, 5203, -32768,  691,  285, -32768, 1328, 6283,
			  607, 5827, 6498, 5827, 5827, 1897, 2095, 3292, 3030, -32768,
			 6297, 5099, -32768, -32768, 1565,  626, 4564, -32768, 6498, -32768,
			 -32768, -32768, -32768, 1253, 1077, 1250, 1253,  999, 1250, 1320,
			 1253,  922, 1250, 1253,  675, 1250, 1253, 1250, 1250, 1250,
			 -32768, -32768,  641, -32768, -32768, -32768, -32768, 1611, 1318, -32768,

			 -32768, -32768, -32768, -32768,  133,   59, -32768, -32768, -32768, 1314,
			 1314, -32768, 1432, -32768, -32768,  450,  688, -32768, 1424, -32768,
			 -32768, -32768, -32768,  414,  502,  411, -32768, 1293, -32768, -32768,
			 -32768, -32768, 1305, -32768, -32768, -32768, 1041, 1231, 1041, 1231,
			 1041, 1231, 1041, 1231, 1231, -32768, 5827,  482, -32768, -32768,
			 -32768, -32768, -32768,  396, 5827, 5827, 1041,  569,  300,  252,
			  395, 1281,  358,  569,  300,  395, 1565, 1414, -32768, -32768,
			 -32768, -32768, 1041, -32768, 1275, 6168,  599, 6059, 6059, -32768,
			 -32768, -32768, 1265, -32768, -32768, -32768, -32768, 1283, 1253, 1250,
			 1280, 1277, 1253, 1250, 1274, 1273, 1253, 1250, 1270, 1268, yyDummy>>,
			1, 200, 800)
		end

	yypact_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 1253, 1250, 1255, 1249, 1245, 1244, 1240, -32768,  812,  -14,
			 -32768, -32768, -32768,  812, 1243, -32768, 1226, 5827, -32768,  515,
			 -32768, -32768,  414,  753, -32768, -32768,   50,  127, -32768, -32768,
			 1041, 6364, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  481, 1353, 1017,  308,  882, 1251, 1351, 1173, 1149, 1335,
			 1231, 1231, 1231, 1231, -32768, -32768, 3119,  604, 5827,  562,
			 1041, 1041, 1041, 1041, -32768, 3119,  395, 1221,  252, -32768,
			 -32768, 4787, 1297,  292, -32768, 3119,  584,  395,  252,  292,
			 1219, 1041,  482, -32768, -32768, 1197, 5827, -32768, 1319, 1288,
			 6249, 1201, 1196, 1195, 1186, 1185, 1184, 1175, 1174, 1041,

			 -32768, -32768, -32768, -32768, -32768,  753, -32768, 5827, 1299,  414,
			 -32768, -32768, -32768, -32768, 1170,  753,  127,  920, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  450,  450,  450,  450,  -42, -32768, 1173, -32768, -32768,
			 1149, -32768, 1282, -32768, 1251,  569,  300,  395, -32768,  753,
			 -32768, -32768, -32768, -32768, -32768, 1276, -32768, 3119,  395, -32768,
			  806,  753, -32768,   86,  606, 5827, 5827, 5827,  914, 1164,
			  300, 1172, -32768, 1262, 1212, 1139, 1136, 1200, -32768, 1171,
			 -32768, -32768, 1120, 1116, 1102, 1100, 3828, -32768, -32768, 1833, yyDummy>>,
			1, 200, 1000)
		end

	yypact_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, -32768, -32768,  392, -32768, 5827, 1026, 1222, -32768,  569,
			  300,  395, 1220,  395, 1214, 1091, -32768, -32768, -32768, 6498,
			  531, -32768, -32768, -32768,  416,  753, -32768, -32768,  127, -32768,
			 -32768,  450,  532, 1170,  920,  859,  968,  450, -32768, -32768,
			 1215, -32768,  450, -32768, -32768, -32768,  197,  742, -32768, 1149,
			 1205, -32768, 1173,  395,  252,  292, 1066, -32768,  497, 3119,
			 -32768,  292, 1036,  278,  958,  881,  716,  594,  174,  174,
			  948, -32768, 1068, 1073,  174, 4460, 1883, 5966, 6013, -32768,
			  753, 1026,  770, 4995, -32768, 1171, 5827, 5827,  236, 1041,
			 1041, 3964, 4787, 5827, 5827, 5827, 5827, -32768, -32768,  395,

			  252,  292, -32768,  292, -32768, 5827, -32768, -32768, -32768, -32768,
			 -32768, -32768, 6133, 3157,  920,  800,  859,  819, -32768,  450,
			 -32768, -32768,  450,  -42, 1176, -32768, 1149, 1166,  395, 1153,
			 -32768, -32768, -32768, -32768, 1135,  958,  524,  948, -32768,  958,
			  443, -32768,  948, 1034, -32768,  958,  369,  948,  958,  307,
			  948,  958,  948,  948,  948, -32768,  528, 6715, 1033, 1041,
			  600,  996, 1030,  517, 1031, 1130,  753, 1006, 1065, -32768,
			 1113, 4891, 1097, 6498, 6498, 5827, 1086,  482,  482, -32768,
			 6498, 6498, 5827, 1110,  395, 1096, 1094, 6498,   57, -32768,
			 -32768,   57, -32768, -32768, -32768,   57,   57,  920,  859,  127, yyDummy>>,
			1, 200, 1200)
		end

	yypact_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  920,  601,  395, 3119,  463,  972, -32768,  968,  450, -32768,
			 -32768, 1081, -32768,  292, -32768, -32768, -32768,  958,  948, -32768,
			 -32768,  958,  948, -32768, 1041, -32768,  958,  948, -32768, -32768,
			  958,  948, -32768, -32768, -32768, -32768, -32768,  952, 1041,  482,
			 -32768, -32768, 1065, 1046, 1027, 1008,  996, -32768, -32768, -32768,
			 1026, 1022,  487,  911,  900, -32768,  903, 1041, -32768, -32768,
			 -32768, -32768,  997,  956, 2864, 5827, 3704, 2831, -32768,  292,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  859,  359,  920,
			  859,  395, 3119,  428,  935,  569,  300,  395, -32768, -32768,
			 -32768,  924, -32768, -32768, -32768, -32768,  482, -32768, -32768, -32768,

			 -32768, 1041,  482, 4336, -32768, -32768,  328, -32768, -32768, -32768,
			 -32768, -32768,  916, 5827,  911, -32768, 1041,  528,  482, -32768,
			   93,  858,   72, 2864,  886,  322,  395, 3119,  184,  859,
			  214,  830,  569,  300,  395,   57,  395,  252,  292, -32768,
			 -32768,  482, 4212,  782,  737,  753, -32768,  655,  717,  328,
			 -32768, -32768, -32768, -32768, -32768, 6013, -32768,  482,  507, -32768,
			 -32768,  794, -32768,  781,  745, -32768,  395, 3119,  417,  731,
			  569,  252,  300,  395,  395,  210,  395, 3119,  368,   57,
			  395,  252,  292, -32768,  714,  395,  710, -32768,  494, -32768,
			  328, -32768, -32768, 4088, 1041, -32768, -32768, -32768,  700,  569, yyDummy>>,
			1, 200, 1400)
		end

	yypact_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  300,  395,   57,  395, -32768,  252,  292,  292,  395, 3119,
			  196,  695,  569,  300,  395, -32768,  685,  395,  669,   57,
			  292,   57,  346, -32768,  482,   57,  395,  252,  292, -32768,
			  665,  395,  661,  582,  573,  569,  300,  395,   57,  395,
			  252,  292,   57,  292,   57, -32768,  533, -32768, -32768, -32768,
			  530,  395,  523,   57,  292,   57,   57,   57,  395,  252,
			  292, -32768,  500,  395,  484, -32768,  478, -32768,   57,   57,
			  292,   57, -32768,  461, -32768, -32768, -32768,  454,  395,  409,
			   57,  292,   57,   57, -32768, -32768,  342, -32768,   57,   57,
			  292,   57, -32768,  202, -32768, -32768,   57, -32768, -32768,  199,

			 -32768,   57, -32768,   57, -32768, -32768,  143,  109, -32768, yyDummy>>,
			1, 109, 1600)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 280)
			yypgoto_template_1 (an_array)
			yypgoto_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yypgoto_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yypgoto'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, -32768, -32768, -32768, -297, 1122, -672, -32768, -32768, -32768,
			  823, -125, -111,  100, -233, -117, -32768, -32768, -445, 1078,
			 -32768, -32768,  708,    5, -32768, -995, -1002, -32768, -32768, -1254,
			  -12,  -21, -32768, -32768,  350, -32768, -32768,  390, -32768, -32768,
			    2, -32768, -32768, -344,  211, -32768, -32768, -1273, -110, -831,
			 -1371,  566,  479, -32768, -32768,  747, -32768, -1350, -32768,  637,
			  183,  485,  554,  608, -32768, -32768, -32768, 1183, 1339, -439,
			 1191, 1052, -473,  540, 1016, -181, -32768, -32768, -32768, -32768,
			 -32768, 1155,  108, -32768, -494, -32768, 1355, -32768, -32768, -32768,
			  399, -32768,  863, -32768,  587,  469, -1014, -1018, -32768, -32768,

			 -32768, -32768, -1020, -1024, -32768, -253, -288, -175, -887, -923,
			 -32768, -32768, -32768, -32768, 1142,  498, -208, -660, -679, -32768,
			 -32768, -32768, -32768, 1577,  506, -32768, -32768, -32768, -32768, -32768,
			 1761,  -13, 1535, -32768, -32768, -739,  875, 1024, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  258, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -1264,  -15, -192, -32768, -32768, -32768,
			 -32768, 1260,  861, -1043,  973, -1078,  963,  732,  957, -1069,
			  -24, 2009, -32768, -32768, -32768, -32768, -659,  101, -32768, -1100,
			 -32768, 1223,  -67,   -2,  -19, -32768,  617, -926, 1795, 1541,
			 -1057,   67, -32768, -32768, 1493, -32768, -32768,  244, 1080, -467, yyDummy>>,
			1, 200, 0)
		end

	yypgoto_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypgoto'.
		do
			yyarray_subcopy (an_array, <<
			 -717,  955, -32768, 1747, -718,  949, -310,    0, -176, -32768,
			 -32768, -32768, -32768,  620,  954, -1403, -32768, 1012, -293,  -38,
			 -32768, -32768, -32768, -32768,  959,  632, -1249, -955, -32768,  410,
			 -32768, -1221, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			    3, -32768, -32768, -32768, -32768, 1092, -286, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -789, -629, -32768, -32768,
			  674, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, yyDummy>>,
			1, 81, 200)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 6888)
			yytable_template_1 (an_array)
			yytable_template_2 (an_array)
			yytable_template_3 (an_array)
			yytable_template_4 (an_array)
			yytable_template_5 (an_array)
			yytable_template_6 (an_array)
			yytable_template_7 (an_array)
			yytable_template_8 (an_array)
			yytable_template_9 (an_array)
			yytable_template_10 (an_array)
			yytable_template_11 (an_array)
			yytable_template_12 (an_array)
			yytable_template_13 (an_array)
			yytable_template_14 (an_array)
			yytable_template_15 (an_array)
			yytable_template_16 (an_array)
			yytable_template_17 (an_array)
			yytable_template_18 (an_array)
			yytable_template_19 (an_array)
			yytable_template_20 (an_array)
			yytable_template_21 (an_array)
			yytable_template_22 (an_array)
			yytable_template_23 (an_array)
			yytable_template_24 (an_array)
			yytable_template_25 (an_array)
			yytable_template_26 (an_array)
			yytable_template_27 (an_array)
			yytable_template_28 (an_array)
			yytable_template_29 (an_array)
			yytable_template_30 (an_array)
			yytable_template_31 (an_array)
			yytable_template_32 (an_array)
			yytable_template_33 (an_array)
			yytable_template_34 (an_array)
			yytable_template_35 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytable_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   78,  293,   91,    7,   35,  129,   86,  405,   80,   77,
			  965,   17,   21,  190,  841,  471,  673,  295,  846,   90,
			  482,   93,  341, 1089,  366,  912,   75,  486, 1019,  558,
			  560,  147,  662,   17,   17,  826,  862,  955, 1078, 1376,
			 1077,   21, 1343,   21,  250,  450,  451, 1195, 1392, 1392,
			  464, 1194,  251, 1193,  465,  405,  466, 1192, 1390, 1390,
			 1235, 1367,   78,  735,   91,  134,  290,  776,   86, 1186,
			  138,   77, 1250, 1012, 1507,  904, 1185, 1024, 1249,   91,
			  664,   90,  557,   93,  145,   78, 1562,   91,   75, 1288,
			  153,   86,  456,  138,   77, 1458,   90,  734, 1245, 1239,

			  664, 1244,  149, 1553,   90,  477,   93, -603,  206, 1708,
			  188,   75,  514,  756, 1522,   78, 1103,   91,  581, 1086,
			  582,   86,  417,  138,   77,  854, 1102,  200,  201,   79,
			  145,  421,  422,  911,   90, 1437,   93,  212,  213,  214,
			 -603,   75,  424, 1707,  222,  254, 1553, 1010,  285,    3,
			  233,  208, -721, -721,    3,  502,  252,  297,    2,  264,
			  607,  608,  609,    2,  274, 1058,  341,  254,  280, 1458,
			  672, 1324,  292, 1564,  294,  525,  526, 1316, 1115,  291,
			  853,  368,  387, 1326, 1592, 1372,  846, 1553,  930,  981,
			  663,   79,  133,  395, 1318,  959,  954, 1472, 1029, 1028, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  117, 1321,  115,    1,  384, 1034, 1033,  959,   34,   33,
			   32, -180,  388, 1703,   79,  392, 1701, 1572, -699,   34,
			   33,   32,  396,  254,  433,  904, 1157, 1609, 1107, 1636,
			 1254, 1577, 1253, -180,  441,  252,  252, -180, 1571,  827,
			  443, -180, 1552,  827,   79, 1211,  430,  112, 1411,  117,
			  488,  115, 1546,  434, 1281,  215,  438, 1398, 1608,  891,
			  893,  226, 1576,  442,  463,  933, -603, -603, 1195,  444,
			  257,  835, 1194, 1563, 1193,  267,  111,  928, 1192,  929,
			  277,  931, 1375, 1086, 1300, 1552, 1299,  457, 1117,  462,
			 1186, -603,  890,  654, 1057, 1546, 1558, 1185,   91,  110,

			  480, 1111, 1110, 1076, 1113, 1112,  163, -533,  455,  801,
			  802,  803, -396, -396, -396,   90,  381,   34,   33,   32,
			  454, -180, -199,  166, -230, -230, 1552,  389,  109, 1340,
			 -230, 1206,  368,  368, -230,  269, 1546, -180, -230, 1567,
			 1477,  139, -230, 1480,  566,  761,  318, -230, -199,  805,
			  294,  827,  569,  461, 1339,  459, 1696,  953,  427,  804,
			   34,   33,   32,  469,  154,  838,  837,  458,  435,  833,
			 1566, -230,  962,  567,  556, 1075, 1527, 1234,  952,  959,
			  481,  570,  117, 1430,  115,  598, 1338,  827,  827,  -26,
			  599, 1230, 1229,  -26,  199, -400,  -26,  259,  602,  -26, yyDummy>>,
			1, 200, 200)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   71, 1613,  -26,   34,   33,   32,   70, 1526,  857,  858,
			 1072,  -26,  970, 1056,  -26,  -26, 1296, -400,   71,  600,
			  -26,  913, 1529, 1691,   70,  827, 1067,  603,  959,  840,
			  -26,  -26, 1405,  -26,  915,  660,  -26,  455, -400,  959,
			  557,  827,  828, 1205,  117, 1426,  115,  675,   45,  454,
			 1600,  679, 1545,  823,  827,  447,  793,  795, 1294, 1293,
			  293, 1533, 1544, 1543,  794,  796,   45,  166, 1689,  671,
			  845,  228,  462,  455,  959, 1688,  295,   27,  814,  654,
			 1544, 1543,  820,  793,  795,  454,   34,   33,   32,   34,
			   33,   32, 1683, 1314, 1371, -204, 1486,  572, 1682, 1450,

			  576, 1511,  705,  706,  406, -519, 1382,  583,   26,   25,
			  587,   24,  740,  591, 1680,  945, -519, -204,  117, 1421,
			  115, -204,   39,  738,  951,   34,   33,   32,  740, 1450,
			  437, 1449,   34,   33,   32,  915, 1037, 1671,  455,  757,
			  457, 1307, 1024,  -15, 1669, 1306,  774, 1668,  774,  -15,
			  454,  761,  217, 1283,    3,  967,  254,  254,  254, 1313,
			 1537,  -15, 1536,    2,  -15,  -15, 1561,  252,  252,  252,
			  -15, -131, 1065, 1487, 1397, 1295, 1400,   34,   33,   32,
			  -15,  436,  533,  254,  254,  254,  -15, 1657, -224, -224,
			   34,   33,   32,  811, -224,  959, 1656,  812, -224,  117, yyDummy>>,
			1, 200, 400)
		end

	yytable_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1417,  115, -224,   34,   33,   32, -224, 1581,  469, 1580,
			 1008, -224, 1442,  813, 1441,  959, -519, 1210, 1482, 1622,
			 1013, -519,  181, 1030, 1332,  824, 1331, 1035,  455,  959,
			  827,  292, -519,  294,  839, -224, 1338, 1156,  845, 1594,
			  454,  472,  959, 1023, 1109,  820, 1605, 1603,  457, 1481,
			 1055,  964, 1534,  831,  831,  831,  831,  469, 1404, 1305,
			 1479,  842, 1408,  844,  958,  457,  329,  850, 1312,  117,
			 1351,  115, 1311,  787, 1627, 1655, 1626,  789,  475, 1653,
			   34,   33,   32, 1644,  797,  794,  796, 1640,  799, 1639,
			 1159, 1158,  429, 1054,   34,   33,   32, 1573,  391, 1642,

			   34,   33,   32,  269,  557,  404, -533,  740,  915, 1638,
			 1659,  455, 1658,  474, 1625, 1024, 1009,  166,  757,  892,
			  892, 1099,  455,  454, 1621,  469, 1030, 1085, 1619,  473,
			 1274,  472,  469,  469,  454,  974,  383, 1601,   34,   33,
			   32,  905, 1483,  428,  177, 1602,  457, 1614, 1408,  390,
			  117, 1000,  115,  984,  918,  983, -176,  927,  774, 1597,
			  774, -520,  774,   34,   33,   32, -520, 1349, 1317,  897,
			 1007,  937,  453,  939,   34,   33,   32, -520, -176, 1637,
			 1590,  123, -176,  484, 1589, 1217, -176,  382,  252,  252,
			  252,  117, 1348,  115,  941, 1596,  943,  944,  838,  837, yyDummy>>,
			1, 200, 600)
		end

	yytable_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  961,  947,  122,  121,  120,  119,  118,  452, 1595,  957,
			  329,  403, -520,  850,  472,  112, 1023, 1022,  969, 1528,
			  968,  963,    3, -520,  524,  301,  982, 1399,  117,  116,
			  115,    2,  514,  457,  123,  910, 1403,  909,  976,  279,
			  123,   34,   33,   32, 1579,   34,   33,   32,  827, 1401,
			  273,  462,   34,   33,   32, 1269, 1268, 1267, 1266, 1265,
			  110,  730,  729,  728,  727,  726, 1568, 1402,  509,  508,
			  470, 1578,  469,  368,  503,  502,  501, 1275, 1338,  897,
			  896,  117, 1264,  115,  374,  373,  114,  461,  725,  459,
			  278,  905,  498,  497, 1366,  113, -171,  664,  293, 1291,

			 1565,  272,  918,  918,  263, 1086,   34,   33,   32,  172,
			  918,  927,  927,  107,  295,  108, 1610,  232, -171,   34,
			   33,   32, -171, 1050, 1513, 1051, -171, 1052, 1080, 1053,
			 1554, 1478, 1346, 1236, 1236, 1240, 1236,  653, 1539, 1263,
			 -603,  850,  976, 1059, -603,  724,  203,  202, 1262, 1535,
			  259,  524,   98,  462,  723,  262,  117, 1345,  115, 1082,
			 -603, -603,  683,  684,  685,  686,  687,  688,  231, 1214,
			  689,  690,  691,  692,  693,  694,  695,  696,  697,  698,
			  699,  701,  703,  704,  740, 1114, 1520,  234,  221,  740,
			   34,   33,   32,  141,  140,  738,  265,  117,  996,  115, yyDummy>>,
			1, 200, 800)
		end

	yytable_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  757,  275, 1394, 1394,  850,  281,  918,  283,  284,  918,
			 1525, 1519,  187, 1530,   34,   33,   32,  831, -220,   34,
			   33,   32, -220, 1310,  934,  935, -220,  228, 1517, 1236,
			 -220, -163, 1516, -163, 1240, -220, 1510, 1155, 1444,  220,
			 -603,  385, -603, -603, -603,  976, 1164, 1059, 1059, 1059,
			 1059, 1362,  393, -163,  104,  105, 1209, -163, 1196, -220,
			 1505, -163, 1575,  186,  157,  712,  713, 1224, 1216,  292,
			 -658,  294, -603, 1220,  117,  992,  115, 1233,  -25, -605,
			 1466, 1467,  -25,  431, 1501,  -25,  892, 1336,  -25,  189,
			 -255,  -25,  177,  439,  976, 1490,  918,  968, -255,  166,

			  -25, 1488, -255,  -25,  -25,  217, 1420, -255, 1471,  -25,
			 1470,  117, 1335,  115, 1407,  884,   34,   33,   32,  -25,
			  -25, 1256,  -25,  653, 1468,  -25,  819, 1460,  457,  457,
			  457,  457, 1465, 1273,  172, 1036, 1038,  163, 1457,  117,
			  883,  115, 1503,  681, 1455, 1329, 1271,  157, 1258, 1415,
			  852, 1334,  117,  988,  115,  177, 1454,  881, 1439, 1355,
			  877, 1160, 1161, 1162, 1163,  172, 1424, 1414,  181,  855,
			  874,  856,  830,  832,  834,  836,  860,  860,  541,  868,
			 1412,  117,  880,  115,  117,  876,  115, 1224,  538, 1041,
			 1410, 1385,  850, 1386,  117,  873,  115,  490, 1357, 1540, yyDummy>>,
			1, 200, 1000)
		end

	yytable_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1407, 1356,  117,  540,  115, 1542, 1330,  269,  169, 1043,
			  163,   37,  117,  537,  115,  117,  886,  115,  457, 1325,
			 1319, 1559,  575,  814,  457,  579,  157, 1231, 1304,  457,
			 1309, 1423,  586,  531, 1302,  590, 1298,  592,  593,  594,
			 1258,  518, 1364,  517, 1587, 1393, 1393,  169, 1290,  528,
			 1341, 1168, 1289,  169,  117,  746,  115,  117,  530,  115,
			 1593, 1213,  169,  420,  419,  418, 1287,  169, -703, 1341,
			  850, -706,  169,  117,  527,  115, 1377, 1378, 1286, 1196,
			 1361, 1178,  850,  976,  100,  101,  102,  131, 1280,  819,
			 1257,   78,   78,   91,   91, 1040, 1251,   86,   86,   -4,

			   77,   77, 1222, 1491,  -82,  -93,  918,  259,  169,  457,
			   90,   90,   93,   93,  -84,  -95,  -86, 1389, 1389,  169,
			  975, 1044,  977,  978,  177,  -97,  -88, 1648, 1456,  172,
			  860,  -99,  169, 1221,  163,  868,  292, 1218,  294,  157,
			 1204, 1043, 1042, 1341, 1215, 1041, 1440,  411, 1166, 1040,
			  169, 1044,  408, 1106,  117,  742,  115,  401,  976, 1524,
			  169, 1279,  398, -570, 1344, 1148, 1453, -209, 1104,  976,
			  -78,  117,  410,  115,  -80,  -79,  117,  407,  115,  -91,
			  169,  117,  400,  115, 1485,  -81,  117,  397,  115, 1297,
			 1090,  549,  -17,  177,  533,  457,  -17,  788,  -92,  -17, yyDummy>>,
			1, 200, 1200)
		end

	yytable_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  -83,  790,  -17,  -94,  -85,  -17,  172,  -96,  798,  163,
			  -87, 1496,  800,  -98,  -17, 1083,  176,  -17,  -17, 1081,
			  157, 1074, 1039,  -17,  975, 1502,  228, 1031, 1586,  171,
			  293,  217,  162,  -17,  -17, 1416,  -17, 1328, 1014,  -17,
			  117,  175,  115,  156, 1518, 1425, 1018, -100, 1429, -113,
			  522, 1433,  536,  117,  170,  115,  117,  161,  115,  552,
			  972,  946,  942, 1532, 1365,  269,  940,  117,  155,  115,
			 -454, -465, 1618,  117,  719,  115, -456, -467,  117,  715,
			  115,  938, -458, 1384, -469,   78, -460, -471, 1541,  169,
			  936,   86,  169, 1551,   77,  930, 1632, 1633,  765,  169,

			  557,  907,  169, 1557, 1341,  169,  906, 1588, 1570,  -89,
			 1646,  895,  117,  588,  115,  259,  894, 1492, 1652,  228,
			  848, 1494,  843,  825,  822,   29, 1497,  975,   78,  821,
			 1499, 1664,  810, 1666,   86,  808, 1551,   77,  217,  809,
			 -571,  807,  806, -450, 1673, 1448, -452,  786, 1599,  181,
			 1679, -451,  169, -218,  785, 1219,  181, -218, 1612,  269,
			 1686, -218,  117,  584,  115, -218,  117,  577,  115,   78,
			 -218, 1693, -463, -453, -464,   86,  975, 1551,   77,  714,
			 1699, 1624,  718, -455, -466,  117,  573,  115, -457,  741,
			 1635, -468,  745,  123, -218,  749,  117,  543,  115, -459, yyDummy>>,
			1, 200, 1400)
		end

	yytable_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -470,  292,  932,  117,  413,  115,  117,  268,  115,  784,
			  783,  778,  762,  769,  122,  121,  120,  119,  118,  536,
			  755,  552,  536,  259,  552,  722,  228,  753,  547,  536,
			  217,  552,  536, 1509,  552,  536,  552,  552,  552,  123,
			  461,  460,  459,  709, 1276, 1277, 1278,  181,  158,  164,
			  677,  676,  661,  173,  178,  182,  184,  185,  652,  659,
			  365,  364,  363,  362,  361,  169,  194,  656,  610,  169,
			  117,  258,  115,  117,  227,  115,  169,  117,  216,  115,
			  169,  651,  606,  605,  604, -449,  117,  360,  115, -546,
			  597,  218, -547,  601,  117,  180,  115,  229,  114,  596,

			  123,  595, -485, 1560,  253,  571,  260,  113,  568,  209,
			  123,  270,  563, -704, -701,  489, -702,  516,  487,  515,
			 1585,  246,  245,  244,  243,  242,  253,  467, -700, -699,
			  449,  246,  245,  244,  243,  242,  448,  446,  440,  445,
			  367,  432,  425,  423,  359,  426,  377,  289,  288,  287,
			  394, -461,  370,  358, 1604, 1373, 1374,  241,  240,  239,
			  386,  369, 1380, 1381, 1617,  975,  357,  869,  356,  296,
			  286,  871,  399,  402, 1387,  282,  276,  409,  412,  414,
			  415,  416,  253, -149, -149,  514, -229, -229, 1631, -149,
			  266,  236, -229, -149,  899,  235, -229, -149,  901, -149, yyDummy>>,
			1, 200, 1600)
		end

	yytable_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -229, -149,  225,  205, -229,  238, -149,  536,  552, -229,
			 1651,  536,  552,  198,  237,  238,  196,  536,  195, -548,
			  193,  509,  508, 1663,  237,  192,  152,  503,  502,  501,
			 -149,  552,  151, -229,  536,  552,  150,  137,  536,  552,
			  975,  136, 1678,  106, 1464, -607, -607, -607, -607,  103,
			   96,  975,   27,   22,   10, 1282, 1508, 1308,  971, -607,
			  160,  160, 1320, -607, 1021,  160,  160,  160,  717, 1016,
			 1020,  721, -607,  565,  135, -607, 1333,  817,  744, -607,
			 -607,  748,  520,  750,  751,  752, 1252, 1116, 1359, 1048,
			  478,  367,  367,  529,  532, 1047,  539,  542,  544,  545,

			  546, -223, -223,  160,  204, 1046, 1489, -223,  914,  160,
			 1409, -223, 1153, 1556,  908, -223,  879,  777,  160, -223,
			 1011, 1396,  898,  160, -223,  987, 1463, 1504,  991, 1379,
			 1284, 1512,  995,  574, 1523,  999,  578, 1462, 1003, 1591,
			 1623, 1315,  950,  585,  986,    0,  589,    0, -223,    0,
			    0,    0,    0,    0,    0,    0,    0,  514,    0,    0,
			    0,    0,  513,  512,  511,  536,  510,  552,  536,    0,
			  552,  514,  536,    0,  552,  536,  513,  552,  536,  552,
			  552,  552, 1555,    0,  160,  160,    0,    0,    0,  160,
			  160,  160,    0,  509,  508,  507,  506,  505,  504,  503, yyDummy>>,
			1, 200, 1800)
		end

	yytable_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  502,  501,    0,    0,    0,  658,    0,  509,  508,  507,
			  506,  505,  504,  503,  502,  501,    0,  498,  497,  496,
			  495,  494,  493,    0,    0,    0,    0,    0,    0,    0,
			    0,  498,  497,  496,  495,  494,  493,    0,    0,    0,
			 1091,    0,    0,    0, 1093, 1079,    0,    0, 1095,    0,
			    0,    0, 1097,    0,    0,  870,    0,    0,    0,  872,
			    0,    0,    0,  716,    0,    0,  720,    0,    0,    0,
			    0,  739,    0,  743,    0,    0,  747,    0,    0,    0,
			  536,  552,  900,    0,  536,  552,  902,  739,  536,  552,
			    0,    0,  536,  552,    0,    0,    0,    0,    0,  779,

			    0,    0,    0,    0,    0,  160,  160,    0,  160,  160,
			  160,    0,    0,    0,    0,  253,  253,  253,    0,    0,
			    0,    0,  159,  165,    0,    0,    0,  174,  179,  183,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  253,  253,  253,  160, 1165,    0,  160,    0,
			    0,    0,    0,    0,    0,  160,    0, 1212,  160,    0,
			 1419,    0,    0,    0,    0,  219,    0,    0,    0,  514,
			 1428,  230,    0, 1432,    0, 1434, 1435, 1436, -146, -146,
			  261,    0,    0,    0, -146,  271,    0,    0, -146,    0,
			    0,    0, -146,    0,    0,    0, -146,    0,    0,    0, yyDummy>>,
			1, 200, 2000)
		end

	yytable_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0, -146,    0,    0,    0,  509,  508,  507,  506,  505,
			  504,  503,  502,  501,  990,    0,    0,  994,    0,    0,
			    0,  998,    0,    0, 1002, -146, 1004, 1005, 1006,  498,
			  497,  496,  495,  494,  493,    0,    0, 1255,    0,    0,
			    0, 1493,    0,    0,    0, 1495,  159,  165, 1261,    0,
			 1498,  174,  179,  183, 1500,    0,    0,    0,  875,  878,
			    0,  882,  885,  887,  888,  889,  739,    0,    0,    0,
			   -9,    0,    0,    0,   -9,  160,    0,   -9,  160,    0,
			   -9,    0,    0,   -9,    0,  160,    0,    0,  160,    0,
			    0, 1301,   -9, 1303,    0,   -9,   -9,    0,    0,    0,

			  -12,   -9,    0,    0,  -12,    0,    0,  -12,    0,    0,
			  -12,   -9,   -9,  -12,   -9,  779,  779,   -9,    0,    0,
			    0,    0,  -12,    0,    0,  -12,  -12,    0, 1092,    0,
			    0,  -12, 1094, 1327,    0,    0, 1096,    0,    0,    0,
			 1098,  -12,  -12,    0,  -12, 1474,    0,  -12,    0, 1475,
			 1476, -144, -144,    0,    0,    0,  169, -144,    0,    0,
			    0, -144,    0,    0,    0, -144,    0,  159,  165, -144,
			  174,  179,  183,    0, -144,    0,    0,    0,    0, 1383,
			  650,  649,  648,  647,  646,  645,  644,  643,  642,  641,
			  640,  639,  638,  637,  636,  635,    0,    0, -144,  634, yyDummy>>,
			1, 200, 2200)
		end

	yytable_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  633,  632,  631,    0,    0,    0,    0,  219, 1413,  989,
			  230,    0,  993,    0,    0,    0,  997,  261,    0, 1001,
			  271,    0,    0,    0,    0,    0,    0,  169,    0,    0,
			    0,  169,  367,    0,    0,    0,    0,  169,    0,    0,
			  169,    0,    0,  169,    0,    0,  630,  629,  628,  627,
			  626,  625,  624,  623,  622,  621,  620,  619,  618,  617,
			  616,  615,    0,    0, 1469,  614,  613,  612,  611,    0,
			  160,  160,    0,  160,  160,  160,    0,    0,    0,    0,
			    0,    0, 1484,    0,    0,    0,    0,    0,    0, 1583,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,  169,
			    0,    0,    0,  169,    0,    0,    0,    0,  169,    0,
			    0,    0,  169,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0, 1615,    0,    0,    0,  219,    0,    0,
			  230,    0,    0,  739,    0,    0,    0,  261,  739,    0,
			  271,    0,    0,    0,    0,    0, 1629,    0,    0,    0,
			    0, 1531,    0,    0,    0,    0,    0, 1538,    0,    0,
			    0,    0,    0, 1645,    0, 1647,    0,    0,    0, 1649,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, 1661,    0,    0,    0, 1665,    0, 1667,    0, yyDummy>>,
			1, 200, 2400)
		end

	yytable_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0, 1569, 1672,    0, 1674,
			 1675, 1676,    0,    0, 1582,  674, 1584,    0,    0,    0,
			    0,  160, 1684, 1685,  160, 1687,    0,    0,  160,    0,
			    0,  160,    0,    0, 1692,    0, 1694, 1695,    0,    0,
			    0,    0, 1697, 1698,    0, 1700, 1598,    0,    0,    0,
			 1702,    0,    0, 1606, 1607, 1704, 1611, 1705,    0,    0,
			 1616,    0,    0,    0,    0, 1620,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0, 1628,    0, 1630,  514,    0,    0,    0, 1634,  513,
			  512,  511,    0,  510, 1641,   74,    0, 1643,    0,    0,

			    0,    0,    0,    0,    0, 1270, 1650,    0,    0,    0,
			    0, 1654,    0,    0,    0,    0,    0, 1660,    0, 1662,
			  509,  508,  507,  506,  505,  504,  503,  502,  501,    0,
			    0, 1670,  159,  165,    0,  174,  179,  183, 1677,    0,
			    0,    0,    0, 1681,  498,  497,  496,  495,  494,  493,
			    0,    0,    0,    0,    0,    0,   73,   72, 1690,   71,
			    0,    0,   34,   33,   32,   70,    0,    0,    0,    0,
			    0,   69,   68,   67,   66,   65,   64,   63,   62,   61,
			   60,   59,   58,   57,   56,   55,   54,   53,   52,   51,
			   50,   49,   48,   47,   46,    0,    0, 1337, 1342,    0, yyDummy>>,
			1, 200, 2600)
		end

	yytable_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1347, 1350, 1352, 1353, 1354,    0,    0,   45,   44, 1358,
			    0,   43,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   42,   41,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0, -684,    0, -684,
			    0, -684,    0, -684, -684, -684, -684,    0,    0, -684,
			 -684,    0, -684,    0,    0,    0, -684, -684,    0,    0,
			    0, -684,    0,    0,    0, -684,    0,    0,    0,    0,
			 -684, 1418, -684, -684,    0, 1422,    0, -684, -684,    0,
			    0, 1427,    0,  219, 1431,    0,  230,    0,    0, -684,
			  261, -684, -684,  271, 1520, -684,    0, -693,    0,    0,

			 -684, -684,    0, -684, -684,    0, -684, -684, -684,    0,
			    0,    0,    0,    0,    0, -684, -684, -684, -684, -684,
			 -684, -684, -684, -684, -684, -684, -684, -684, -684, -684,
			 -684, -684, -684, -684, -684, -684, -684, -684,  514, -684,
			 -684,    0,    0,  513,  512,  511,    0,  510,    0,    0,
			 -684, -684, -684,    0,    0, -684,    0, -684,    0,    0,
			    0,    0, -684,    0, -684,    0,    0,    0,    0,    0,
			    0, -684, -690,    0,  509,  508,  507,  506,  505,  504,
			  503,  502,  501,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  498,  497, yyDummy>>,
			1, 200, 2800)
		end

	yytable_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  496,  495,  494,  493,    0,    0,    0,    0,    0,  160,
			  160,    0,  160,  160,  160,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0, -690, -690, -690,    0, -690,    0,
			 -690, -690, -690, -690, -690, -690,    0, -690, -690, -690,
			    0, -690, -690,    0,    0, -690, -690,    0,    0, -690,
			 -690, -690,    0, -690, -690,    0,    0,    0,    0, -690,
			    0, -690, -690, -690,    0,    0, -690, -690, -690,    0,
			    0,    0, -690,  160, -690,    0,    0,  160, -690, -690,
			 -690, -690,    0,  160, -690, -690,  160,    0,    0, -690,

			 -690,    0, -690, -690, -690, -690, -690, -690, -690, -690,
			 -690, -690, -690, -690, -690, -690, -690, -690, -690, -690,
			 -690, -690, -690, -690, -690, -690, -690, -690, -690, -690,
			 -690, -690, -690, -690, -690, -690, -690, -690, -690, -690,
			 -690, -690, -690, -690, -690, -690, -690, -690, -690, -690,
			 -690, -690,    0, -690, -690,    0, -690, -690,    0, -690,
			 -690, -690,    0, -690, -690, -690, -690, -690, -690, -690,
			 -690, -690,    0,    0,    0,    0,    0,    0,    0,    3,
			    0,    0,    0,    0,    0,    0,    0,    0,    2,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 3000)
		end

	yytable_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0, 1395,   69,   68,   67,   66,   65,   64,   63,
			   62,   61,   60,   59,   58,   57,   56,   55,   54,   53,
			   52,   51,   50,   49,   48,   47,   73,   72,    0,   71,
			    0,    0,    0,    0,    0,   70,    0,    0,    0,    0,
			   44,   69,   68,   67,   66,   65,   64,   63,   62,   61,
			   60,   59,   58,   57,   56,   55,   54,   53,   52,   51,
			   50,   49,   48,   47,   46,    0,    0,    0,    0,    0,
			    0,  159,  165,    0,  174,  179,  183,   45,   44,    0,
			    0,   43,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   42,   41,    0,    0,    0, -691, -691, -691,    0,

			 -691,    0, -691, -691, -691, -691, -691, -691,    0, -691,
			 -691, -691,    0, -691, -691,    0,    0, -691, -691,    0,
			    0, -691, -691, -691,    0, -691, -691,    0,    0,    0,
			    0, -691,    0, -691, -691, -691,    0,    0, -691, -691,
			 -691,    0,    0,    0, -691,  219, -691,    0,    0,  230,
			 -691, -691, -691, -691,    0,  261, -691, -691,  271,    0,
			    0, -691, -691,    0, -691, -691, -691, -691, -691, -691,
			 -691, -691, -691, -691, -691, -691, -691, -691, -691, -691,
			 -691, -691, -691, -691, -691, -691, -691, -691, -691, -691,
			 -691, -691, -691, -691, -691, -691, -691, -691, -691, -691, yyDummy>>,
			1, 200, 3200)
		end

	yytable_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -691, -691, -691, -691, -691, -691, -691, -691, -691, -691,
			 -691, -691, -691, -691,    0, -691, -691,    0, -691, -691,
			    0, -691, -691, -691,    0, -691, -691, -691, -691, -691,
			 -691, -691, -691, -691, -689, -689, -689,    0, -689,    0,
			 -689, -689, -689, -689, -689, -689,    0, -689, -689, -689,
			    0, -689, -689,    0,    0, -689, -689,    0,    0, -689,
			 -689, -689,    0, -689, -689,    0,    0,    0,    0, -689,
			    0, -689, -689, -689,    0,    0, -689, -689, -689,    0,
			    0,    0, -689,    0, -689,    0,    0,    0, -689, -689,
			 -689, -689,    0,    0, -689, -689,    0,    0,    0, -689,

			 -689,    0, -689, -689, -689, -689, -689, -689, -689, -689,
			 -689, -689, -689, -689, -689, -689, -689, -689, -689, -689,
			 -689, -689, -689, -689, -689, -689, -689, -689, -689, -689,
			 -689, -689, -689, -689, -689, -689, -689, -689, -689, -689,
			 -689, -689, -689, -689, -689, -689, -689, -689, -689, -689,
			 -689, -689,    0, -689, -689,    0, -689, -689,    0, -689,
			 -689, -689,    0, -689, -689, -689, -689, -689, -689, -689,
			 -689, -689, -319, -319, -319,    0, -319,    0, -319, -319,
			 -319, -319, -319, -319,    0, -319, -319, -319,    0, -319,
			 -319,    0,    0, -319, -319,    0,    0, -319, -319, -319, yyDummy>>,
			1, 200, 3400)
		end

	yytable_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0, -319, -319,    0,    0,    0,    0, -319,    0, -319,
			 -319, -319,    0,    0, -319, -319, -319,    0,    0,    0,
			 -319,    0, -319,    0,    0,    0, -319, -319, -319, -319,
			    0,    0, -319, -319,    0,    0,    0, -319, -319,    0,
			 -319, -319, -319, -319, -319, -319, -319, -319, -319, -319,
			 -319, -319, -319, -319, -319, -319, -319, -319, -319, -319,
			 -319, -319, -319, -319, -319, -319, -319, -319, -319, -319,
			 -319, -319, -319, -319, -319, -319, -319, -319, -319, -319,
			 -319, -319, -319, -319, -319, -319, -319, -319, -319, -319,
			    0, -319, -319,    0, -319, -319,    0, -319, -319, -319,

			    0, -319, -319, -319, -319, -319, -319, -319, -319, -319,
			 -683,    0, -683,    0, -683,    0, -683, -683, -683, -683,
			    0,    0, -683, -683,    0, -683,    0,    0,    0, -683,
			 -683,    0,    0,    0, -683,    0,    0,    0, -683,    0,
			    0,    0,    0, -683,    0, -683, -683,    0,    0,    0,
			 -683, -683,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, -683,    0, -683, -683,    0,    0, -683,    0,
			 -692,    0,    0, -683, -683,    0, -683, -683,    0, -683,
			 -683, -683,    0,    0,    0,    0,    0,    0, -683, -683,
			 -683, -683, -683, -683, -683, -683, -683, -683, -683, -683, yyDummy>>,
			1, 200, 3600)
		end

	yytable_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -683, -683, -683, -683, -683, -683, -683, -683, -683, -683,
			 -683,    0, -683, -683,    0,    0,    0,    0,    0,    0,
			    0,    0,    0, -683, -683, -683,    0,    0, -683,    0,
			 -683,    0,    0,    0, -708, -683, -708, -683, -708,    0,
			 -708, -708, -708, -708, -683, -691, -708, -708,    0, -708,
			    0,    0,    0, -708, -708,    0,    0,    0, -708,    0,
			    0,    0, -708,    0,    0,    0,    0, -708,    0, -708,
			 -708,    0,    0,    0, -708, -708,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0, -708,    0, -708, -708,
			    0,    0, -708,    0,    0,    0,    0, -708, -708,    0,

			 -708, -708,    0, -708, -708, -708,    0,    0,    0,    0,
			    0,    0, -708, -708, -708, -708, -708, -708, -708, -708,
			 -708, -708, -708, -708, -708, -708, -708, -708, -708, -708,
			 -708, -708, -708, -708, -708,    0, -708, -708,    0,    0,
			    0,    0,    0,    0,    0,    0,    0, -708, -708, -708,
			    0,    0, -708,    0,  469,    0,    0,    0,    0, -708,
			 -708, -708,    0,    0,    0,    0,    0,    0, -708, -708,
			 -682,    0, -682,    0, -682,    0, -682, -682, -682, -682,
			    0,    0, -682, -682,    0, -682,    0,    0,    0, -682,
			 -682,    0,    0,    0, -682,    0,    0,    0, -682,    0, yyDummy>>,
			1, 200, 3800)
		end

	yytable_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0, -682,    0, -682, -682,    0,    0,    0,
			 -682, -682,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, -682,    0, -682, -682,    0,    0, -682,    0,
			    0,    0,    0, -682, -682,    0, -682, -682,    0, -682,
			 -682, -682,    0,    0,    0,    0,    0,    0, -682, -682,
			 -682, -682, -682, -682, -682, -682, -682, -682, -682, -682,
			 -682, -682, -682, -682, -682, -682, -682, -682, -682, -682,
			 -682,    0, -682, -682,    0,    0,    0,    0,    0,    0,
			    0,    0,    0, -682, -682, -682,    0,    0, -682,    0,
			 -682,    0,    0,    0, -687, -682, -687, -682, -687,    0,

			 -687, -687, -687, -687, -682, -689, -687, -687,    0, -687,
			    0,    0,    0, -687, -687,    0,    0,    0, -687,    0,
			    0,    0, -687,    0,    0,    0,    0, -687,    0, -687,
			 -687,    0,    0,    0, -687, -687,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0, -687,    0, -687, -687,
			    0,    0, -687,    0,    0,    0,    0, -687, -687,    0,
			 -687, -687,    0, -687, -687, -687,    0,    0,    0,    0,
			    0,    0, -687, -687, -687, -687, -687, -687, -687, -687,
			 -687, -687, -687, -687, -687, -687, -687, -687, -687, -687,
			 -687, -687, -687, -687, -687,    0, -687, -687,    0,    0, yyDummy>>,
			1, 200, 4000)
		end

	yytable_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0, -687, -687, -687,
			    0,    0, -687,    0, -687,    0,    0,    0, -688, -687,
			 -688, -687, -688,    0, -688, -688, -688, -688, -687,    0,
			 -688, -688,    0, -688,    0,    0,    0, -688, -688,    0,
			    0,    0, -688,    0,    0,    0, -688,    0,    0,    0,
			    0, -688,    0, -688, -688,    0,    0,    0, -688, -688,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			 -688,    0, -688, -688,    0,    0, -688,    0,    0,    0,
			    0, -688, -688,    0, -688, -688,    0, -688, -688, -688,
			    0,    0,    0,    0,    0,    0, -688, -688, -688, -688,

			 -688, -688, -688, -688, -688, -688, -688, -688, -688, -688,
			 -688, -688, -688, -688, -688, -688, -688, -688, -688,    0,
			 -688, -688,    0,    0,    0,    0,    0,    0,    0,    0,
			    0, -688, -688, -688,    0,    0, -688,    0, -688,    0,
			    0,    0, -686, -688, -686, -688, -686,    0, -686, -686,
			 -686, -686, -688,    0, -686, -686,    0, -686,    0,    0,
			    0, -686, -686,    0,    0,    0, -686,    0,    0,    0,
			 -686,    0,    0,    0,    0, -686,    0, -686, -686,    0,
			    0,    0, -686, -686,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0, -686,    0, -686, -686,    0,    0, yyDummy>>,
			1, 200, 4200)
		end

	yytable_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -686,    0,    0,    0,    0, -686, -686,    0, -686, -686,
			    0, -686, -686, -686,    0,    0,    0,    0,    0,    0,
			 -686, -686, -686, -686, -686, -686, -686, -686, -686, -686,
			 -686, -686, -686, -686, -686, -686, -686, -686, -686, -686,
			 -686, -686, -686,    0, -686, -686,    0,    0,    0,    0,
			    0,    0,    0,    0,    0, -686, -686, -686,    0,    0,
			 -686,    0, -686,    0,    0,    0, -685, -686, -685, -686,
			 -685,    0, -685, -685, -685, -685, -686,    0, -685, -685,
			    0, -685,    0,    0,    0, -685, -685,    0,    0,    0,
			 -685,    0,    0,    0, -685,    0,    0,    0,    0, -685,

			    0, -685, -685,    0,    0,    0, -685, -685,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0, -685,    0,
			 -685, -685,    0,    0, -685,    0,    0,    0,    0, -685,
			 -685,    0, -685, -685,    0, -685, -685, -685,    0,    0,
			    0,    0,    0,    0, -685, -685, -685, -685, -685, -685,
			 -685, -685, -685, -685, -685, -685, -685, -685, -685, -685,
			 -685, -685, -685, -685, -685, -685, -685,    0, -685, -685,
			    0,    0,   74,    0,    0,    0,    0,    0,    0, -685,
			 -685, -685,  318,    0, -685,    0, -685,    0,    0,    0,
			    0, -685,    0, -685,    0,    0,    0,    0,  317,    0, yyDummy>>,
			1, 200, 4400)
		end

	yytable_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -685,    0,    0,    0,    0,  316,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  315,    0,    0,    0,
			    0,    0,  314,    0,  313,  312,    0,    0,  311,    0,
			    0,    0,    0,   73,   72,    0,   71,  310,  309,   34,
			   33,   32,  308,    0,    0,    0,  307,    0,   69,   68,
			   67,   66,   65,   64,   63,   62,   61,   60,   59,   58,
			   57,   56,   55,   54,   53,   52,   51,   50,   49,   48,
			   47,  306,  305,    0,    0,    0,   74,    0,    0,    0,
			    0,    0,    0,  304,   45,   44,  318,  303,  864,    0,
			  301,  985,    0,    0,    0,  300,    0,    0,  299,  298,

			    0,    0,  317,    0,    0,  133,  863,    0,    0,  316,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  315,    0,    0,    0,    0,    0,  314,    0,  313,  312,
			    0,    0,  311,    0,    0,    0,    0,   73,   72,    0,
			   71,  310,  309,   34,   33,   32,  308,    0,    0,    0,
			  307,    0,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,  306,  305,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  304,   45,   44,
			    0,  303,  864, 1182,  301, 1181,    0, 1180,    0,  300, yyDummy>>,
			1, 200, 4600)
		end

	yytable_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,  299,  298,    0, 1179, 1178,    0, 1177,  133,
			  863,    0, 1176,    0,    0,    0,    0,    0,    0,    0,
			    0,  317,    0,    0,    0,    0,    0,    0,  316,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0, 1175,    0,  313, 1174,    0,
			    0,  311,    0,    0,    0,    0,   73,   72,    0,   71,
			  310,    0,   34,   33,   32,    0,    0,    0,    0,    0,
			    0,   69,   68,   67,   66,   65,   64,   63,   62,   61,
			   60,   59,   58,   57,   56,   55,   54,   53,   52,   51,
			   50,   49,   48,   47,    0, 1173, 1172,    0,    0,   74,

			    0,    0,    0,    0,    0, 1461,  304,   45,   44,  318,
			    0, 1171,    0,  301,    0,    0,    0,    0,  300,    0,
			 1170,    0,    0,    0,    0,  317,    0, 1169,    0,    0,
			    0,    0,  316,    0, 1368,    0,    0,    0,    0,    0,
			    0,    0,    0,  315,    0,    0,    0,    0,    0,  314,
			    0,  313,  312,    0,    0,  311,    0,    0,    0,    0,
			   73,   72,    0,   71,  310,  309,   34,   33,   32,  308,
			    0,    0,    0,  307,    0,   69,   68,   67,   66,   65,
			   64,   63,   62,   61,   60,   59,   58,   57,   56,   55,
			   54,   53,   52,   51,   50,   49,   48,   47,  306,  305, yyDummy>>,
			1, 200, 4800)
		end

	yytable_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,   74,    0,    0,    0,    0,    0, 1369,
			  304,   45,   44,  318,  303,  302,    0,  301,    0,    0,
			    0,    0,  300,    0,    0,  299,  298,    0,    0,  317,
			    0,    0,  133,    0,    0,    0,  316,    0, 1368,    0,
			    0,    0,    0,    0,    0,    0,    0,  315,    0,    0,
			    0,    0,    0,  314,    0,  313,  312,    0,    0,  311,
			    0,    0,    0,    0,   73,   72,    0,   71,  310,  309,
			   34,   33,   32,  308,    0,    0,    0,  307,    0,   69,
			   68,   67,   66,   65,   64,   63,   62,   61,   60,   59,
			   58,   57,   56,   55,   54,   53,   52,   51,   50,   49,

			   48,   47,  306,  305,    0,    0,    0,   74,    0,    0,
			    0,    0,    0,    0,  304,   45,   44,  318,  303,  302,
			    0,  301,    0,    0,    0,    0,  300,    0,    0,  299,
			  298,    0,    0,  317,    0,    0,  133,    0,    0,    0,
			  316,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  315,    0,    0,    0,    0,    0,  314,    0,  313,
			  312,    0,    0,  311,    0,    0,    0,    0,   73,   72,
			    0,   71,  310,  309,   34,   33,   32,  308,    0,    0,
			    0,  307,    0,   69,   68,   67,   66,   65,   64,   63,
			   62,   61,   60,   59,   58,   57,   56,   55,   54,   53, yyDummy>>,
			1, 200, 5000)
		end

	yytable_template_27 (an_array: ARRAY [INTEGER])
			-- Fill chunk #27 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   52,   51,   50,   49,   48,   47,  306,  305,    0,    0,
			    0,   74,    0,    0,    0,    0,    0,    0,  304,   45,
			   44,  318,  303,  302,    0,  301,    0,    0,    0,  980,
			  300,    0,    0,  299,  298,    0,    0,  317,    0,    0,
			  133,    0,    0,    0,  316,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  315,    0,    0,    0,    0,
			    0,  314,    0,  313,  312,    0,    0,  311,    0,    0,
			    0,    0,   73,   72,    0,   71,  310,  309,   34,   33,
			   32,  308,    0,    0,    0,  307,    0,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,   59,   58,   57,

			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47,
			  306,  305,    0,    0,    0,   74,    0,    0,    0,    0,
			    0,    0,  304,   45,   44,  318,  303,  966,    0,  301,
			    0,    0,    0,    0,  300,  814,    0,  299,  298,    0,
			    0,  317,    0,    0,  133,    0,    0,    0,  316,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  315,
			    0,    0,    0,    0,    0,  314,    0,  313,  312,    0,
			    0,  311,    0,    0,    0,    0,   73,   72,    0,   71,
			  310,  309,   34,   33,   32,  308,    0,    0,    0,  307,
			    0,   69,   68,   67,   66,   65,   64,   63,   62,   61, yyDummy>>,
			1, 200, 5200)
		end

	yytable_template_28 (an_array: ARRAY [INTEGER])
			-- Fill chunk #28 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   60,   59,   58,   57,   56,   55,   54,   53,   52,   51,
			   50,   49,   48,   47,  306,  305,    0,    0,    0,   74,
			    0,    0,    0,    0,    0,    0,  304,   45,   44,  318,
			  303,  302,    0,  301,  949,    0,    0,    0,  300,    0,
			    0,  299,  298,    0,    0,  317,    0,    0,  133,    0,
			    0,    0,  316,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  315,    0,    0,    0,    0,    0,  314,
			    0,  313,  312,    0,    0,  311,  816,    0,    0,    0,
			   73,   72,    0,   71,  310,  309,   34,   33,   32,  308,
			    0,    0,    0,  307,    0,   69,   68,   67,   66,   65,

			   64,   63,   62,   61,   60,   59,   58,   57,   56,   55,
			   54,   53,   52,   51,   50,   49,   48,   47,  306,  305,
			    0,    0,    0,   74,    0,    0,    0,    0,    0,    0,
			  304,   45,   44,  318,  303,  302,    0,  301,    0,    0,
			    0,    0,  300,    0,    0,  299,  298,    0,    0,  317,
			    0,    0,  133,    0,    0,    0,  316,    0,  702,    0,
			    0,    0,    0,    0,    0,    0,    0,  315,    0,    0,
			    0,    0,    0,  314,    0,  313,  312,    0,    0,  311,
			    0,    0,    0,    0,   73,   72,    0,   71,  310,  309,
			   34,   33,   32,  308,    0,    0,    0,  307,    0,   69, yyDummy>>,
			1, 200, 5400)
		end

	yytable_template_29 (an_array: ARRAY [INTEGER])
			-- Fill chunk #29 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   68,   67,   66,   65,   64,   63,   62,   61,   60,   59,
			   58,   57,   56,   55,   54,   53,   52,   51,   50,   49,
			   48,   47,  306,  305,    0,    0,    0,   74,    0,    0,
			    0,  700,    0,    0,  304,   45,   44,  318,  303,  302,
			    0,  301,    0,    0,    0,    0,  300,    0,    0,  299,
			  298,    0,    0,  317,    0,    0,  133,    0,    0,    0,
			  316,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  315,    0,    0,    0,    0,    0,  314,    0,  313,
			  312,    0,    0,  311,    0,    0,    0,    0,   73,   72,
			    0,   71,  310,  309,   34,   33,   32,  308,    0,    0,

			    0,  307,    0,   69,   68,   67,   66,   65,   64,   63,
			   62,   61,   60,   59,   58,   57,   56,   55,   54,   53,
			   52,   51,   50,   49,   48,   47,  306,  305,    0,    0,
			    0,   74,    0,    0,    0,    0,    0,    0,  304,   45,
			   44,  318,  303,  302,    0,  301,    0,    0,    0,    0,
			  300,    0,    0,  299,  298,    0,    0,  317,    0,    0,
			  133,    0,    0,    0,  316,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  315,    0,    0,    0,    0,
			    0,  314,    0,  313,  312,    0,    0,  311,    0,    0,
			    0,    0,   73,   72,    0,   71,  310,  309,   34,   33, yyDummy>>,
			1, 200, 5600)
		end

	yytable_template_30 (an_array: ARRAY [INTEGER])
			-- Fill chunk #30 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   32,  308,    0,    0,    0,  307,    0,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,   59,   58,   57,
			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47,
			  306,  305,    0,    0,    0,   74,    0,    0,    0,    0,
			    0,    0,  304,   45,   44,  318,  303,  302,    0,  301,
			    0,    0,    0,  519,  300,    0,    0,  299,  298,    0,
			    0,  317,    0,    0,  133,    0,    0,    0,  316,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  315,
			    0,    0,    0,    0,    0,  314,    0,  313,  312,    0,
			    0,  311,    0,    0,    0,    0,   73,   72,    0,   71,

			  310,  309,   34,   33,   32,  308,    0,    0,    0,  307,
			    0,   69,   68,   67,   66,   65,   64,   63,   62,   61,
			   60,   59,   58,   57,   56,   55,   54,   53,   52,   51,
			   50,   49,   48,   47,  306,  305,    0,    0,    0,   74,
			    0,    0,    0,    0,    0,    0,  304,   45,   44,  318,
			  303,  302,    0,  301,    0,    0,    0,    0,  300,    0,
			    0,  299,  298,    0,    0,  317,    0,    0,  133,    0,
			    0,    0,  316,    0,    0,    0,    0,    0, -653,    0,
			 -653,    0,    0,  315,    0,    0,    0,    0,    0,  314,
			    0,  313,  312,    0,    0,  311,    0,    0,    0,    0, yyDummy>>,
			1, 200, 5800)
		end

	yytable_template_31 (an_array: ARRAY [INTEGER])
			-- Fill chunk #31 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   73,   72,    0,   71,  310,  309,   34,   33,   32,  308,
			    0,    0,    0,  307,    0,   69,   68,   67,   66,   65,
			   64,   63,   62,   61,   60,   59,   58,   57,   56,   55,
			   54,   53,   52,   51,   50,   49,   48,   47,  306,  305,
			  514,    0,    0,    0,    0,  513,  512,  511,    0,  510,
			  304,   45,   44,    0,  303,  485, 1362,  301,    0,    0,
			    0,    0,  300,    0,    0,  299,  298,    0,    0,    0,
			    0,    0,  133,    0,    0,    0,  509,  508,  507,  506,
			  505,  504,  503,  502,  501,    0,    0,  514,    0,    0,
			    0,    0,  513,  512,  511,    0,  510,    0,    0,    0,

			  498,  497,  496,  495,  494,  493, 1086,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  509,  508,  507,  506,  505,  504,  503,
			  502,  501,    0,  514,    0,    0,    0,    0,  513,  512,
			  511,    0,  510,    0,    0,    0,    0,  498,  497,  496,
			  495,  494,  493,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  509,
			  508,  507,  506,  505,  504,  503,  502,  501, 1388,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  498,  497,  496,  495,  494,  493,    0, yyDummy>>,
			1, 200, 6000)
		end

	yytable_template_32 (an_array: ARRAY [INTEGER])
			-- Fill chunk #32 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,   73,   72,    0,   71,    0,    0,    0,    0,
			    0,   70,    0,    0,    0,    0,    0,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,   59,   58,   57,
			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47,
			   46,    0,  514,    0,    0,    0,  815,  513,  512,  511,
			    0,  510,    0,   45,   44,  514,    0,   43,    0,    0,
			  513,  512,  511,    0,  510,    0,    0,   42,   41,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  509,  508,
			  507,  506,  505,  504,  503,  502,  501,    0,    0,    0,
			    0,  509,  508,  507,  506,  505,  504,  503,  502,  501,

			    0,    0,  498,  497,  496,  495,  494,  493, 1084,    0,
			  500,    0,    0,    0,    0,  498,  497,  496,  495,  494,
			  493,   71,    0,    0,    0,    0,    0,   70,    0,    0,
			    0,    0,    0,   69,   68,   67,   66,   65,   64,   63,
			   62,   61,   60,   59,   58,   57,   56,   55,   54,   53,
			   52,   51,   50,   49,   48,   47,   46,  514,    0,    0,
			    0,    0,  513,  512,  511,    0,  510,    0,    0,   45,
			   44,  514,    0,    0,    0,    0,  513,  512,  511,    0,
			  510,  814,    0,   42,   41,    0,    0,    0,    0,    0,
			    0, 1223,    0,  509,  508,  507,  506,  505,  504,  503, yyDummy>>,
			1, 200, 6200)
		end

	yytable_template_33 (an_array: ARRAY [INTEGER])
			-- Fill chunk #33 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  502,  501,    0,    0,    0,    0,    0,  509,  508,  507,
			  506,  505,  504,  503,  502,  501,    0,  498,  497,  496,
			  495,  494,  493,  973,    0,    0,  500,  979,    0,    0,
			    0,  498,  497,  496,  495,  494,  493,  514,    0,    0,
			    0,    0,  513,  512,  511,    0,  510,    0, 1140, 1139,
			 1138, 1137, 1136, 1135, 1134, 1133, 1132, 1131, 1130, 1129,
			 1128, 1127, 1126, 1125, 1124, 1123, 1122, 1121, 1120, 1119,
			 1118,    0,    0,  509,  508,  507,  506,  505,  504,  503,
			  502,  501,  514,    0,    0,    0,    0,  513,  512,  511,
			  948,  510,  500,    0,    0,    0,    0,  498,  497,  496,

			  495,  494,  493,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  509,  508,
			  507,  506,  505,  504,  503,  502,  501,  514,    0,    0,
			    0,    0,  513,  512,  511,    0,  510,  500,  499,    0,
			    0,    0,  498,  497,  496,  495,  494,  493,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  509,  508,  507,  506,  505,  504,  503,
			  502,  501,  514,    0,    0,    0,    0,  513,  512,  511,
			  711,  510,    0,    0,    0,    0,    0,  498,  497,  496,
			  495,  494,  493,    0,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 6400)
		end

	yytable_template_34 (an_array: ARRAY [INTEGER])
			-- Fill chunk #34 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,  509,  508,
			  507,  506,  505,  504,  503,  502,  501,  514,    0,    0,
			    0,    0,  513,  512,  511,    0,    0,    0,    0,    0,
			    0,    0,  498,  497,  496,  495,  494,  493,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  509,  508,  507,  506,  505,  504,  503,
			  502,  501,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  498,  497,  496,
			  495,  494,  493,   71,    0,    0,    0,    0,    0,   70,
			    0,    0,    0,    0,    0,   69,   68,   67,   66,   65,

			   64,   63,   62,   61,   60,   59,   58,   57,   56,   55,
			   54,   53,   52,   51,   50,   49,   48,   47,   46,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   45,   44,    0,    0,   71,    0,    0,    0,    0,
			    0,   70,    0,  814,    0,   42,   41,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,   59,   58,   57,
			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47,
			   46,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   45,   44,    0,    0,   71,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   42,   41,   69, yyDummy>>,
			1, 200, 6600)
		end

	yytable_template_35 (an_array: ARRAY [INTEGER])
			-- Fill chunk #35 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   68,   67,   66,   65,   64,   63,   62,   61,   60,   59,
			   58,   57,   56,   55,   54,   53,   52,   51,   50,   49,
			   48,   47,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   45,   44,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0, 1438,   69,   68,
			   67,   66,   65,   64,   63,   62,   61,   60,   59,   58,
			   57,   56,   55,   54,   53,   52,   51,   50,   49,   48,
			   47,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   44,    0,    0,  146, yyDummy>>,
			1, 89, 6800)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 6888)
			yycheck_template_1 (an_array)
			yycheck_template_2 (an_array)
			yycheck_template_3 (an_array)
			yycheck_template_4 (an_array)
			yycheck_template_5 (an_array)
			yycheck_template_6 (an_array)
			yycheck_template_7 (an_array)
			yycheck_template_8 (an_array)
			yycheck_template_9 (an_array)
			yycheck_template_10 (an_array)
			yycheck_template_11 (an_array)
			yycheck_template_12 (an_array)
			yycheck_template_13 (an_array)
			yycheck_template_14 (an_array)
			yycheck_template_15 (an_array)
			yycheck_template_16 (an_array)
			yycheck_template_17 (an_array)
			yycheck_template_18 (an_array)
			yycheck_template_19 (an_array)
			yycheck_template_20 (an_array)
			yycheck_template_21 (an_array)
			yycheck_template_22 (an_array)
			yycheck_template_23 (an_array)
			yycheck_template_24 (an_array)
			yycheck_template_25 (an_array)
			yycheck_template_26 (an_array)
			yycheck_template_27 (an_array)
			yycheck_template_28 (an_array)
			yycheck_template_29 (an_array)
			yycheck_template_30 (an_array)
			yycheck_template_31 (an_array)
			yycheck_template_32 (an_array)
			yycheck_template_33 (an_array)
			yycheck_template_34 (an_array)
			yycheck_template_35 (an_array)
			Result := yyfixed_array (an_array)
		end

	yycheck_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   21,  193,   21,    1,   17,   43,   21,  240,   21,   21,
			  841,    8,    9,  124,  673,  312,  483,  193,  678,   21,
			  313,   21,  197,  978,  205,  764,   21,  315,  915,  373,
			  374,   98,  477,   30,   31,  664,  708,  826,  964, 1288,
			  963,   38, 1263,   40,  169,  298,  299, 1071, 1312, 1313,
			  303, 1071,  169, 1071,  307,  288,  309, 1071, 1312, 1313,
			 1117, 1282,   83,  536,   83,   14,  191,  561,   83, 1071,
			   83,   83, 1150,   14, 1445,  754, 1071,   27, 1147,   98,
			   38,   83,  124,   83,   97,  106,   14,  106,   83, 1189,
			  103,  106,  300,  106,  106, 1368,   98,  536,  140, 1142,

			   38, 1144,   99, 1506,  106,  313,  106,   14,  146,    0,
			  123,  106,   74,  552, 1464,  136,  130,  136,  404,   47,
			  406,  136,  247,  136,  136,    4,  140,  140,  141,   21,
			  143,  248,  249,  762,  136, 1356,  136,  150,  151,  152,
			   47,  136,  253,    0,  157,  169, 1549,   14,  186,   22,
			  163,  148,   66,   67,   22,  117,  169,  195,   31,  172,
			  446,  447,  448,   31,  177,  954,  341,  191,  181, 1442,
			  128, 1249,  193, 1523,  193,  356,  357, 1234,  128,  192,
			   59,  205,  220, 1252, 1555, 1285,  846, 1590,  129,  861,
			  128,   83,  141,  231, 1237,   11,  825,  140,  916,  916, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   75,    4,   77,   71,  217,  923,  923,   11,   75,   76,
			   77,   14,  225,   14,  106,  228,   14,   33,  132,   75,
			   76,   77,  235,  247,  262,  904, 1057,   17, 1017,   33,
			 1156,   17, 1155,   36,  272,  248,  249,   40,   54,   29,
			  278,   44, 1506,   29,  136, 1076,  259,   78, 1326,   75,
			  317,   77, 1506,  266, 1180,  155,  269, 1314,   48,  732,
			  733,  161,   48,  276,  302,  140,   14,   15, 1292,  282,
			  170,  127, 1292, 1522, 1292,  175,  107,  771, 1292,  773,
			  180,  775,   46,   47, 1210, 1549, 1209,  300, 1027,  302,
			 1292,   39,  731,  468,  953, 1549, 1517, 1292,  317,   78,

			  313, 1019, 1019,  962, 1022, 1022,   28,  125,   23,  595,
			  596,  597,   75,   76,   77,  317,  216,   75,   76,   77,
			   35,  124,   14,  141,    8,    9, 1590,  227,  107,   51,
			   14,   39,  356,  357,   18,   28, 1590,  140,   22,   17,
			 1397,   83,   26, 1400,  382,  553,   18,   31,   40,  130,
			  369,   29,  390,   75,   76,   77,   14,  824,  258,  140,
			   75,   76,   77,  126,  106,  128,  129,  300,  268,  127,
			   48,   55,  839,  386,  371,   17,   17, 1116,  823,   11,
			  313,  394,   75,   76,   77,  423,  108,   29,   29,    7,
			  428, 1109, 1109,   11,  136,   11,   14,   28,  436,   17, yyDummy>>,
			1, 200, 200)
		end

	yycheck_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   72,   33,   20,   75,   76,   77,   78,   48,  705,  706,
			   15,   29,  127,   17,   32,   33, 1205,   33,   72,  432,
			   38,  765, 1479,   14,   78,   29,  126,  440,   11,   17,
			   48,   49, 1319,   51,   20,  473,   54,   23,   54,   11,
			  124,   29,   17, 1072,   75,   76,   77,  485,  120,   35,
			   33,  489,  124,  661,   29,  129,  581,  582,   66,   67,
			  652,   33,  134,  135,  581,  582,  120,  141,   14,  482,
			  678,   28,  485,   23,   11,   14,  652,   17,  132,  654,
			  134,  135,  657,  608,  609,   35,   75,   76,   77,   75,
			   76,   77,   14, 1232, 1283,   14,   33,  397,   14,   12,

			  400,   14,  515,  516,  129,  130, 1295,  407,   48,   49,
			  410,   51,  536,  413,   14,  812,  141,   36,   75,   76,
			   77,   40,  140,  536,  821,   75,   76,   77,  552,   12,
			   73,   14,   75,   76,   77,   20,  125,   14,   23,  552,
			  553,  125,   27,   11,   14,  129,  559,   14,  561,   17,
			   35,  759,   28, 1182,   22,  843,  580,  581,  582,   27,
			 1486,   29, 1485,   31,   32,   33, 1521,  580,  581,  582,
			   38,  130,    3, 1404, 1313, 1204, 1315,   75,   76,   77,
			   48,  124,  141,  607,  608,  609,   54,   14,    8,    9,
			   75,   76,   77,  606,   14,   11,   14,  610,   18,   75, yyDummy>>,
			1, 200, 400)
		end

	yycheck_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   76,   77,   22,   75,   76,   77,   26, 1533,  126, 1532,
			  896,   31,   12,  651,   14,   11,  125,   33,   17,  125,
			  906,  130,   28,  916,  127,  663,  129,  125,   23,   11,
			   29,  652,  141,  652,  672,   55,  108,   33,  846,  132,
			   35,  126,   11,  128,  129,  820, 1572, 1570,  661,   48,
			  947,   33, 1483,  666,  667,  668,  669,  126, 1317,  128,
			 1399,  674, 1322,  676,   33,  678,  197,  680,  136,   75,
			   76,   77,  140,  573, 1600,   14, 1599,  577,   73,   14,
			   75,   76,   77,   14,  584,  802,  803, 1613,  588, 1612,
			  128,  129,   73,  946,   75,   76,   77, 1528,   73,   14,

			   75,   76,   77,   28,  124,  129,  130,  731,   20,   14,
			 1636,   23, 1635,  108,   14,   27,  897,  141,  731,  732,
			  733, 1007,   23,   35,   14,  126, 1019,  128,   14,  124,
			  124,  126,  126,  126,   35,  128,   73, 1568,   75,   76,
			   77,  754, 1401,  124,   28,   14,  759, 1578, 1408,  124,
			   75,   76,   77,  127,  767,  129,   14,  770,  771,   14,
			  773,  125,  775,   75,   76,   77,  130,   51, 1235,  128,
			  129,  784,   73,  786,   75,   76,   77,  141,   36, 1610,
			   63,   28,   40,  314,  129, 1082,   44,  124,  801,  802,
			  803,   75,   76,   77,  807,   14,  809,  810,  128,  129, yyDummy>>,
			1, 200, 600)
		end

	yycheck_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  838,  814,   49,   50,   51,   52,   53,  108,   14,  828,
			  341,  129,  130,  826,  126,   78,  128,  129,  127, 1478,
			  129,  840,   22,  141,  355,  126,  864,   27,   75,   76,
			   77,   31,   74,  846,   28,  126,   17,  128,  851,   73,
			   28,   75,   76,   77,   14,   75,   76,   77,   29, 1316,
			   73,  864,   75,   76,   77,   49,   50,   51,   52,   53,
			   78,   49,   50,   51,   52,   53, 1525,   48,  110,  111,
			  124, 1530,  126,  897,  116,  117,  118, 1174,  108,  128,
			  129,   75,   76,   77,    8,    9,  133,   75,   76,   77,
			  124,  904,  134,  135,  124,  142,   14,   38, 1090, 1196,

			   14,  124,  915,  916,   73,   47,   75,   76,   77,   28,
			  923,  924,  925,   38, 1090,   40, 1575,   73,   36,   75,
			   76,   77,   40,  936,   13,  938,   44,  940,  966,  942,
			   14, 1398,   51, 1141, 1142, 1143, 1144,  468,   14,  133,
			   26,  954,  955,  956,   30,  133,  129,  130,  142,   14,
			   28,  482,   32,  966,  142,  124,   75,   76,   77,  972,
			   46,   47,  493,  494,  495,  496,  497,  498,  124, 1079,
			  501,  502,  503,  504,  505,  506,  507,  508,  509,  510,
			  511,  512,  513,  514, 1008, 1023,   30,  164,   73, 1013,
			   75,   76,   77,   49,   50, 1008,  173,   75,   76,   77, yyDummy>>,
			1, 200, 800)
		end

	yycheck_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			 1013,  178, 1312, 1313, 1017,  182, 1019,  184,  185, 1022,
			 1477,   14,   73, 1480,   75,   76,   77, 1030,   14,   75,
			   76,   77,   18, 1231,  780,  781,   22,   28,  125, 1237,
			   26,   14,  132,   16, 1242,   31,   14, 1056,   42,  124,
			   14,  218,   12,   13,   14, 1058, 1065, 1060, 1061, 1062,
			 1063,   43,  229,   36,   30,   31, 1075,   40, 1071,   55,
			   14,   44, 1529,  124,   28,  525,  526, 1105, 1081, 1090,
			   43, 1090,   42, 1086,   75,   76,   77, 1115,    7,   14,
			 1377, 1378,   11,  260,  132,   14, 1099,   51,   17,  141,
			   14,   20,   28,  270, 1107,   14, 1109,  129,   22,  141,

			   29,  129,   26,   32,   33,   28, 1339,   31,   14,   38,
			   14,   75,   76,   77, 1322,   51,   75,   76,   77,   48,
			   49, 1159,   51,  654,   14,   54,  657,   14, 1141, 1142,
			 1143, 1144,   46, 1171,   28,  924,  925,   28,  132,   75,
			   76,   77, 1439,   46,   14, 1255, 1170,   28, 1167,   14,
			  681, 1261,   75,   76,   77,   28,  125,   51,  125, 1270,
			   51, 1060, 1061, 1062, 1063,   28,  132,   14,   28,  700,
			   51,  702,  666,  667,  668,  669,  707,  708,   51,  710,
			   14,   75,   76,   77,   75,   76,   77, 1225,   51,   40,
			   14, 1301, 1205, 1303,   75,   76,   77,   26,  125, 1496, yyDummy>>,
			1, 200, 1000)
		end

	yycheck_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			 1408,  133,   75,   76,   77, 1502,  140,   28,  116,   36,
			   28,  140,   75,   76,   77,   75,   76,   77, 1231,   14,
			    5, 1518,  399,  132, 1237,  402,   28,   57,   14, 1242,
			 1228, 1342,  409,   51,   14,  412,   14,  414,  415,  416,
			 1259,  141, 1280,  141, 1541, 1312, 1313,  155,  132,   51,
			 1263, 1068,  132,  161,   75,   76,   77,   75,   76,   77,
			 1557, 1078,  170,   75,   76,   77,   66,  175,  132, 1282,
			 1283,  132,  180,   75,   76,   77, 1289, 1290,   66, 1292,
			 1277,   19, 1295, 1296,   24,   25,   26,  115,  124,  820,
			   14, 1312, 1313, 1312, 1313,   44,   14, 1312, 1313,    0,

			 1312, 1313,   14, 1413,  130,  130, 1319,   28,  216, 1322,
			 1312, 1313, 1312, 1313,  130,  130,  130, 1312, 1313,  227,
			  851,   16,  853,  854,   28,  130,  130, 1624, 1366,   28,
			  861,  130,  240,   14,   28,  866, 1357,  140, 1357,   28,
			   43,   36,   37, 1356,  125,   40, 1359,   51,  127,   44,
			  258,   16,   51,  127,   75,   76,   77,   51, 1371, 1469,
			  268, 1178,   51,  132, 1264,   14, 1363,   14,  125, 1382,
			  130,   75,   76,   77,  130,  130,   75,   76,   77,  130,
			  288,   75,   76,   77, 1403,  130,   75,   76,   77, 1206,
			  125,  141,    7,   28,  141, 1408,   11,  574,  130,   14, yyDummy>>,
			1, 200, 1200)
		end

	yycheck_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  130,  578,   17,  130,  130,   20,   28,  130,  585,   28,
			  130, 1424,  589,  130,   29,  140,   51,   32,   33,    5,
			   28,  140,  129,   38,  955, 1438,   28,    3, 1538,   51,
			 1622,   28,   51,   48,   49, 1335,   51, 1254,  124,   54,
			   75,   76,   77,   51, 1457, 1345,   14,  129, 1348,  129,
			  126, 1351,  360,   75,   76,   77,   75,   76,   77,  367,
			  132,  125,  132, 1482, 1281,   28,  132,   75,   76,   77,
			  130,  130, 1582,   75,   76,   77,  130,  130,   75,   76,
			   77,  132,  130, 1300,  130, 1506,  130,  130, 1501,  397,
			  132, 1506,  400, 1506, 1506,  129, 1606, 1607,   18,  407,

			  124,  129,  410, 1516, 1517,  413,  129, 1545, 1527,  130,
			 1620,  129,   75,   76,   77,   28,  130, 1417, 1628,   28,
			  125, 1421,  125,   12,  125,  140, 1426, 1058, 1549,  125,
			 1430, 1641,  132, 1643, 1549,  125, 1549, 1549,   28,  132,
			  132,  132,  125,  130, 1654, 1362,  130,  132, 1567,   28,
			 1660,  130,  460,   14,  125, 1086,   28,   18, 1577,   28,
			 1670,   22,   75,   76,   77,   26,   75,   76,   77, 1590,
			   31, 1681,  130,  130,  130, 1590, 1107, 1590, 1590,  527,
			 1690, 1594,  530,  130,  130,   75,   76,   77,  130,  537,
			 1609,  130,  540,   28,   55,  543,   75,   76,   77,  130, yyDummy>>,
			1, 200, 1400)
		end

	yycheck_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  130, 1622,  779,   75,   76,   77,   75,   76,   77,  132,
			  125,  125,   26,  125,   49,   50,   51,   52,   53,  527,
			  130,  529,  530,   28,  532,  130,   28,   14,    8,  537,
			   28,  539,  540, 1450,  542,  543,  544,  545,  546,   28,
			   75,   76,   77,  127, 1175, 1176, 1177,   28,  113,  114,
			  127,    5,  132,  118,  119,  120,  121,  122,  125,  127,
			   49,   50,   51,   52,   53,  573,  131,  127,  132,  577,
			   75,   76,   77,   75,   76,   77,  584,   75,   76,   77,
			  588,  128,  132,  125,  125,  130,   75,   76,   77,  132,
			  129,  156,  132,  125,   75,   76,   77,  162,  133,  129,

			   28,  129,  129, 1520,  169,  125,  171,  142,  125,   24,
			   28,  176,   77,  132,  132,  124,  132,  132,  126,  132,
			 1537,   49,   50,   51,   52,   53,  191,   65,  132,  132,
			  125,   49,   50,   51,   52,   53,  129,  129,  132,  125,
			  205,  132,  130,  128,  133,  129,  124,   75,   76,   77,
			  132,  130,   55,  142, 1571, 1286, 1287,   75,   76,   77,
			  132,  125, 1293, 1294, 1581, 1296,   62,  715,   62,  113,
			  130,  719,  237,  238, 1305,  132,  132,  242,  243,  244,
			  245,  246,  247,    8,    9,   74,    8,    9, 1605,   14,
			  132,  130,   14,   18,  742,  132,   18,   22,  746,   24, yyDummy>>,
			1, 200, 1600)
		end

	yycheck_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   22,   26,  132,   62,   26,  133,   31,  715,  716,   31,
			 1627,  719,  720,   14,  142,  133,  130,  725,  124,  132,
			  125,  110,  111, 1640,  142,  132,    7,  116,  117,  118,
			   55,  739,    7,   55,  742,  743,    7,  129,  746,  747,
			 1371,  128, 1659,  128, 1375,   12,   13,   14,   15,    7,
			  130, 1382,   17,  141,   20, 1181, 1446, 1225,  846,   26,
			  113,  114, 1242,   30,  915,  118,  119,  120,  529,  910,
			  915,  532,   39,  380,   79,   42, 1259,  654,  539,   46,
			   47,  542,  341,  544,  545,  546, 1154, 1026,    5,  932,
			  313,  356,  357,  358,  359,  932,  361,  362,  363,  364,

			  365,    8,    9,  156,  143,  932, 1408,   14,  766,  162,
			 1323,   18, 1049, 1514,  759,   22,  725,  562,  171,   26,
			  904, 1313,  739,  176,   31,  873, 1372, 1442,  876, 1292,
			 1183, 1452,  880,  398, 1465,  883,  401, 1371,  886, 1549,
			 1590, 1233,  820,  408,  866,   -1,  411,   -1,   55,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   74,   -1,   -1,
			   -1,   -1,   79,   80,   81,  873,   83,  875,  876,   -1,
			  878,   74,  880,   -1,  882,  883,   79,  885,  886,  887,
			  888,  889, 1513,   -1,  237,  238,   -1,   -1,   -1,  242,
			  243,  244,   -1,  110,  111,  112,  113,  114,  115,  116, yyDummy>>,
			1, 200, 1800)
		end

	yycheck_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  117,  118,   -1,   -1,   -1,  470,   -1,  110,  111,  112,
			  113,  114,  115,  116,  117,  118,   -1,  134,  135,  136,
			  137,  138,  139,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  134,  135,  136,  137,  138,  139,   -1,   -1,   -1,
			  988,   -1,   -1,   -1,  992,  965,   -1,   -1,  996,   -1,
			   -1,   -1, 1000,   -1,   -1,  716,   -1,   -1,   -1,  720,
			   -1,   -1,   -1,  528,   -1,   -1,  531,   -1,   -1,   -1,
			   -1,  536,   -1,  538,   -1,   -1,  541,   -1,   -1,   -1,
			  988,  989,  743,   -1,  992,  993,  747,  552,  996,  997,
			   -1,   -1, 1000, 1001,   -1,   -1,   -1,   -1,   -1,  564,

			   -1,   -1,   -1,   -1,   -1,  358,  359,   -1,  361,  362,
			  363,   -1,   -1,   -1,   -1,  580,  581,  582,   -1,   -1,
			   -1,   -1,  113,  114,   -1,   -1,   -1,  118,  119,  120,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,  607,  608,  609,  398, 1066,   -1,  401,   -1,
			   -1,   -1,   -1,   -1,   -1,  408,   -1, 1077,  411,   -1,
			 1337,   -1,   -1,   -1,   -1,  156,   -1,   -1,   -1,   74,
			 1347,  162,   -1, 1350,   -1, 1352, 1353, 1354,    8,    9,
			  171,   -1,   -1,   -1,   14,  176,   -1,   -1,   18,   -1,
			   -1,   -1,   22,   -1,   -1,   -1,   26,   -1,   -1,   -1, yyDummy>>,
			1, 200, 2000)
		end

	yycheck_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   31,   -1,   -1,   -1,  110,  111,  112,  113,  114,
			  115,  116,  117,  118,  875,   -1,   -1,  878,   -1,   -1,
			   -1,  882,   -1,   -1,  885,   55,  887,  888,  889,  134,
			  135,  136,  137,  138,  139,   -1,   -1, 1157,   -1,   -1,
			   -1, 1418,   -1,   -1,   -1, 1422,  237,  238, 1168,   -1,
			 1427,  242,  243,  244, 1431,   -1,   -1,   -1,  723,  724,
			   -1,  726,  727,  728,  729,  730,  731,   -1,   -1,   -1,
			    7,   -1,   -1,   -1,   11,  528,   -1,   14,  531,   -1,
			   17,   -1,   -1,   20,   -1,  538,   -1,   -1,  541,   -1,
			   -1, 1211,   29, 1213,   -1,   32,   33,   -1,   -1,   -1,

			    7,   38,   -1,   -1,   11,   -1,   -1,   14,   -1,   -1,
			   17,   48,   49,   20,   51,  780,  781,   54,   -1,   -1,
			   -1,   -1,   29,   -1,   -1,   32,   33,   -1,  989,   -1,
			   -1,   38,  993, 1253,   -1,   -1,  997,   -1,   -1,   -1,
			 1001,   48,   49,   -1,   51, 1391,   -1,   54,   -1, 1395,
			 1396,    8,    9,   -1,   -1,   -1, 1264,   14,   -1,   -1,
			   -1,   18,   -1,   -1,   -1,   22,   -1,  358,  359,   26,
			  361,  362,  363,   -1,   31,   -1,   -1,   -1,   -1, 1299,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,   -1,   -1,   55,  103, yyDummy>>,
			1, 200, 2200)
		end

	yycheck_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  104,  105,  106,   -1,   -1,   -1,   -1,  398, 1328,  874,
			  401,   -1,  877,   -1,   -1,   -1,  881,  408,   -1,  884,
			  411,   -1,   -1,   -1,   -1,   -1,   -1, 1335,   -1,   -1,
			   -1, 1339,  897,   -1,   -1,   -1,   -1, 1345,   -1,   -1,
			 1348,   -1,   -1, 1351,   -1,   -1,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,   -1,   -1, 1384,  103,  104,  105,  106,   -1,
			  723,  724,   -1,  726,  727,  728,   -1,   -1,   -1,   -1,
			   -1,   -1, 1402,   -1,   -1,   -1,   -1,   -1,   -1, 1535,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 1417,
			   -1,   -1,   -1, 1421,   -1,   -1,   -1,   -1, 1426,   -1,
			   -1,   -1, 1430,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1, 1579,   -1,   -1,   -1,  528,   -1,   -1,
			  531,   -1,   -1, 1008,   -1,   -1,   -1,  538, 1013,   -1,
			  541,   -1,   -1,   -1,   -1,   -1, 1602,   -1,   -1,   -1,
			   -1, 1481,   -1,   -1,   -1,   -1,   -1, 1487,   -1,   -1,
			   -1,   -1,   -1, 1619,   -1, 1621,   -1,   -1,   -1, 1625,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1, 1638,   -1,   -1,   -1, 1642,   -1, 1644,   -1, yyDummy>>,
			1, 200, 2400)
		end

	yycheck_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   -1,   -1,   -1, 1526, 1653,   -1, 1655,
			 1656, 1657,   -1,   -1, 1534,    5, 1536,   -1,   -1,   -1,
			   -1,  874, 1668, 1669,  877, 1671,   -1,   -1,  881,   -1,
			   -1,  884,   -1,   -1, 1680,   -1, 1682, 1683,   -1,   -1,
			   -1,   -1, 1688, 1689,   -1, 1691, 1566,   -1,   -1,   -1,
			 1696,   -1,   -1, 1573, 1574, 1701, 1576, 1703,   -1,   -1,
			 1580,   -1,   -1,   -1,   -1, 1585,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1, 1601,   -1, 1603,   74,   -1,   -1,   -1, 1608,   79,
			   80,   81,   -1,   83, 1614,    8,   -1, 1617,   -1,   -1,

			   -1,   -1,   -1,   -1,   -1, 1170, 1626,   -1,   -1,   -1,
			   -1, 1631,   -1,   -1,   -1,   -1,   -1, 1637,   -1, 1639,
			  110,  111,  112,  113,  114,  115,  116,  117,  118,   -1,
			   -1, 1651,  723,  724,   -1,  726,  727,  728, 1658,   -1,
			   -1,   -1,   -1, 1663,  134,  135,  136,  137,  138,  139,
			   -1,   -1,   -1,   -1,   -1,   -1,   69,   70, 1678,   72,
			   -1,   -1,   75,   76,   77,   78,   -1,   -1,   -1,   -1,
			   -1,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,  105,  106,  107,   -1,   -1, 1262, 1263,   -1, yyDummy>>,
			1, 200, 2600)
		end

	yycheck_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			 1265, 1266, 1267, 1268, 1269,   -1,   -1,  120,  121, 1274,
			   -1,  124,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  134,  135,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,    6,   -1,    8,
			   -1,   10,   -1,   12,   13,   14,   15,   -1,   -1,   18,
			   19,   -1,   21,   -1,   -1,   -1,   25,   26,   -1,   -1,
			   -1,   30,   -1,   -1,   -1,   34,   -1,   -1,   -1,   -1,
			   39, 1336,   41,   42,   -1, 1340,   -1,   46,   47,   -1,
			   -1, 1346,   -1,  874, 1349,   -1,  877,   -1,   -1,   58,
			  881,   60,   61,  884,   30,   64,   -1,   66,   -1,   -1,

			   69,   70,   -1,   72,   73,   -1,   75,   76,   77,   -1,
			   -1,   -1,   -1,   -1,   -1,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,  106,   74,  108,
			  109,   -1,   -1,   79,   80,   81,   -1,   83,   -1,   -1,
			  119,  120,  121,   -1,   -1,  124,   -1,  126,   -1,   -1,
			   -1,   -1,  131,   -1,  133,   -1,   -1,   -1,   -1,   -1,
			   -1,  140,  141,   -1,  110,  111,  112,  113,  114,  115,
			  116,  117,  118,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  134,  135, yyDummy>>,
			1, 200, 2800)
		end

	yycheck_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  136,  137,  138,  139,   -1,   -1,   -1,   -1,   -1, 1262,
			 1263,   -1, 1265, 1266, 1267,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,    4,    5,    6,   -1,    8,   -1,
			   10,   11,   12,   13,   14,   15,   -1,   17,   18,   19,
			   -1,   21,   22,   -1,   -1,   25,   26,   -1,   -1,   29,
			   30,   31,   -1,   33,   34,   -1,   -1,   -1,   -1,   39,
			   -1,   41,   42,   43,   -1,   -1,   46,   47,   48,   -1,
			   -1,   -1,   52, 1336,   54,   -1,   -1, 1340,   58,   59,
			   60,   61,   -1, 1346,   64,   65, 1349,   -1,   -1,   69,

			   70,   -1,   72,   73,   74,   75,   76,   77,   78,   79,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,  104,  105,  106,  107,  108,  109,
			  110,  111,  112,  113,  114,  115,  116,  117,  118,  119,
			  120,  121,   -1,  123,  124,   -1,  126,  127,   -1,  129,
			  130,  131,   -1,  133,  134,  135,  136,  137,  138,  139,
			  140,  141,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   22,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   31,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 3000)
		end

	yycheck_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   45,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,  105,  106,   69,   70,   -1,   72,
			   -1,   -1,   -1,   -1,   -1,   78,   -1,   -1,   -1,   -1,
			  121,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,  105,  106,  107,   -1,   -1,   -1,   -1,   -1,
			   -1, 1262, 1263,   -1, 1265, 1266, 1267,  120,  121,   -1,
			   -1,  124,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  134,  135,   -1,   -1,   -1,    4,    5,    6,   -1,

			    8,   -1,   10,   11,   12,   13,   14,   15,   -1,   17,
			   18,   19,   -1,   21,   22,   -1,   -1,   25,   26,   -1,
			   -1,   29,   30,   31,   -1,   33,   34,   -1,   -1,   -1,
			   -1,   39,   -1,   41,   42,   43,   -1,   -1,   46,   47,
			   48,   -1,   -1,   -1,   52, 1336,   54,   -1,   -1, 1340,
			   58,   59,   60,   61,   -1, 1346,   64,   65, 1349,   -1,
			   -1,   69,   70,   -1,   72,   73,   74,   75,   76,   77,
			   78,   79,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,  105,  106,  107, yyDummy>>,
			1, 200, 3200)
		end

	yycheck_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  108,  109,  110,  111,  112,  113,  114,  115,  116,  117,
			  118,  119,  120,  121,   -1,  123,  124,   -1,  126,  127,
			   -1,  129,  130,  131,   -1,  133,  134,  135,  136,  137,
			  138,  139,  140,  141,    4,    5,    6,   -1,    8,   -1,
			   10,   11,   12,   13,   14,   15,   -1,   17,   18,   19,
			   -1,   21,   22,   -1,   -1,   25,   26,   -1,   -1,   29,
			   30,   31,   -1,   33,   34,   -1,   -1,   -1,   -1,   39,
			   -1,   41,   42,   43,   -1,   -1,   46,   47,   48,   -1,
			   -1,   -1,   52,   -1,   54,   -1,   -1,   -1,   58,   59,
			   60,   61,   -1,   -1,   64,   65,   -1,   -1,   -1,   69,

			   70,   -1,   72,   73,   74,   75,   76,   77,   78,   79,
			   80,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,  104,  105,  106,  107,  108,  109,
			  110,  111,  112,  113,  114,  115,  116,  117,  118,  119,
			  120,  121,   -1,  123,  124,   -1,  126,  127,   -1,  129,
			  130,  131,   -1,  133,  134,  135,  136,  137,  138,  139,
			  140,  141,    4,    5,    6,   -1,    8,   -1,   10,   11,
			   12,   13,   14,   15,   -1,   17,   18,   19,   -1,   21,
			   22,   -1,   -1,   25,   26,   -1,   -1,   29,   30,   31, yyDummy>>,
			1, 200, 3400)
		end

	yycheck_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   33,   34,   -1,   -1,   -1,   -1,   39,   -1,   41,
			   42,   43,   -1,   -1,   46,   47,   48,   -1,   -1,   -1,
			   52,   -1,   54,   -1,   -1,   -1,   58,   59,   60,   61,
			   -1,   -1,   64,   65,   -1,   -1,   -1,   69,   70,   -1,
			   72,   73,   74,   75,   76,   77,   78,   79,   80,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,  104,  105,  106,  107,  108,  109,  110,  111,
			  112,  113,  114,  115,  116,  117,  118,  119,  120,  121,
			   -1,  123,  124,   -1,  126,  127,   -1,  129,  130,  131,

			   -1,  133,  134,  135,  136,  137,  138,  139,  140,  141,
			    6,   -1,    8,   -1,   10,   -1,   12,   13,   14,   15,
			   -1,   -1,   18,   19,   -1,   21,   -1,   -1,   -1,   25,
			   26,   -1,   -1,   -1,   30,   -1,   -1,   -1,   34,   -1,
			   -1,   -1,   -1,   39,   -1,   41,   42,   -1,   -1,   -1,
			   46,   47,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   58,   -1,   60,   61,   -1,   -1,   64,   -1,
			   66,   -1,   -1,   69,   70,   -1,   72,   73,   -1,   75,
			   76,   77,   -1,   -1,   -1,   -1,   -1,   -1,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95, yyDummy>>,
			1, 200, 3600)
		end

	yycheck_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,   -1,  108,  109,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  119,  120,  121,   -1,   -1,  124,   -1,
			  126,   -1,   -1,   -1,    6,  131,    8,  133,   10,   -1,
			   12,   13,   14,   15,  140,  141,   18,   19,   -1,   21,
			   -1,   -1,   -1,   25,   26,   -1,   -1,   -1,   30,   -1,
			   -1,   -1,   34,   -1,   -1,   -1,   -1,   39,   -1,   41,
			   42,   -1,   -1,   -1,   46,   47,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   58,   -1,   60,   61,
			   -1,   -1,   64,   -1,   -1,   -1,   -1,   69,   70,   -1,

			   72,   73,   -1,   75,   76,   77,   -1,   -1,   -1,   -1,
			   -1,   -1,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,  104,  105,  106,   -1,  108,  109,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  119,  120,  121,
			   -1,   -1,  124,   -1,  126,   -1,   -1,   -1,   -1,  131,
			  132,  133,   -1,   -1,   -1,   -1,   -1,   -1,  140,  141,
			    6,   -1,    8,   -1,   10,   -1,   12,   13,   14,   15,
			   -1,   -1,   18,   19,   -1,   21,   -1,   -1,   -1,   25,
			   26,   -1,   -1,   -1,   30,   -1,   -1,   -1,   34,   -1, yyDummy>>,
			1, 200, 3800)
		end

	yycheck_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   39,   -1,   41,   42,   -1,   -1,   -1,
			   46,   47,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   58,   -1,   60,   61,   -1,   -1,   64,   -1,
			   -1,   -1,   -1,   69,   70,   -1,   72,   73,   -1,   75,
			   76,   77,   -1,   -1,   -1,   -1,   -1,   -1,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,   -1,  108,  109,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  119,  120,  121,   -1,   -1,  124,   -1,
			  126,   -1,   -1,   -1,    6,  131,    8,  133,   10,   -1,

			   12,   13,   14,   15,  140,  141,   18,   19,   -1,   21,
			   -1,   -1,   -1,   25,   26,   -1,   -1,   -1,   30,   -1,
			   -1,   -1,   34,   -1,   -1,   -1,   -1,   39,   -1,   41,
			   42,   -1,   -1,   -1,   46,   47,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   58,   -1,   60,   61,
			   -1,   -1,   64,   -1,   -1,   -1,   -1,   69,   70,   -1,
			   72,   73,   -1,   75,   76,   77,   -1,   -1,   -1,   -1,
			   -1,   -1,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,  104,  105,  106,   -1,  108,  109,   -1,   -1, yyDummy>>,
			1, 200, 4000)
		end

	yycheck_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  119,  120,  121,
			   -1,   -1,  124,   -1,  126,   -1,   -1,   -1,    6,  131,
			    8,  133,   10,   -1,   12,   13,   14,   15,  140,   -1,
			   18,   19,   -1,   21,   -1,   -1,   -1,   25,   26,   -1,
			   -1,   -1,   30,   -1,   -1,   -1,   34,   -1,   -1,   -1,
			   -1,   39,   -1,   41,   42,   -1,   -1,   -1,   46,   47,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   58,   -1,   60,   61,   -1,   -1,   64,   -1,   -1,   -1,
			   -1,   69,   70,   -1,   72,   73,   -1,   75,   76,   77,
			   -1,   -1,   -1,   -1,   -1,   -1,   84,   85,   86,   87,

			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,  105,  106,   -1,
			  108,  109,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  119,  120,  121,   -1,   -1,  124,   -1,  126,   -1,
			   -1,   -1,    6,  131,    8,  133,   10,   -1,   12,   13,
			   14,   15,  140,   -1,   18,   19,   -1,   21,   -1,   -1,
			   -1,   25,   26,   -1,   -1,   -1,   30,   -1,   -1,   -1,
			   34,   -1,   -1,   -1,   -1,   39,   -1,   41,   42,   -1,
			   -1,   -1,   46,   47,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   58,   -1,   60,   61,   -1,   -1, yyDummy>>,
			1, 200, 4200)
		end

	yycheck_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   64,   -1,   -1,   -1,   -1,   69,   70,   -1,   72,   73,
			   -1,   75,   76,   77,   -1,   -1,   -1,   -1,   -1,   -1,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			  104,  105,  106,   -1,  108,  109,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,  119,  120,  121,   -1,   -1,
			  124,   -1,  126,   -1,   -1,   -1,    6,  131,    8,  133,
			   10,   -1,   12,   13,   14,   15,  140,   -1,   18,   19,
			   -1,   21,   -1,   -1,   -1,   25,   26,   -1,   -1,   -1,
			   30,   -1,   -1,   -1,   34,   -1,   -1,   -1,   -1,   39,

			   -1,   41,   42,   -1,   -1,   -1,   46,   47,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   58,   -1,
			   60,   61,   -1,   -1,   64,   -1,   -1,   -1,   -1,   69,
			   70,   -1,   72,   73,   -1,   75,   76,   77,   -1,   -1,
			   -1,   -1,   -1,   -1,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,  104,  105,  106,   -1,  108,  109,
			   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,  119,
			  120,  121,   18,   -1,  124,   -1,  126,   -1,   -1,   -1,
			   -1,  131,   -1,  133,   -1,   -1,   -1,   -1,   34,   -1, yyDummy>>,
			1, 200, 4400)
		end

	yycheck_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  140,   -1,   -1,   -1,   -1,   41,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   52,   -1,   -1,   -1,
			   -1,   -1,   58,   -1,   60,   61,   -1,   -1,   64,   -1,
			   -1,   -1,   -1,   69,   70,   -1,   72,   73,   74,   75,
			   76,   77,   78,   -1,   -1,   -1,   82,   -1,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,  107,  108,   -1,   -1,   -1,    8,   -1,   -1,   -1,
			   -1,   -1,   -1,  119,  120,  121,   18,  123,  124,   -1,
			  126,  127,   -1,   -1,   -1,  131,   -1,   -1,  134,  135,

			   -1,   -1,   34,   -1,   -1,  141,  142,   -1,   -1,   41,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   52,   -1,   -1,   -1,   -1,   -1,   58,   -1,   60,   61,
			   -1,   -1,   64,   -1,   -1,   -1,   -1,   69,   70,   -1,
			   72,   73,   74,   75,   76,   77,   78,   -1,   -1,   -1,
			   82,   -1,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,  104,  105,  106,  107,  108,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  119,  120,  121,
			   -1,  123,  124,    6,  126,    8,   -1,   10,   -1,  131, yyDummy>>,
			1, 200, 4600)
		end

	yycheck_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,  134,  135,   -1,   18,   19,   -1,   21,  141,
			  142,   -1,   25,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   34,   -1,   -1,   -1,   -1,   -1,   -1,   41,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   58,   -1,   60,   61,   -1,
			   -1,   64,   -1,   -1,   -1,   -1,   69,   70,   -1,   72,
			   73,   -1,   75,   76,   77,   -1,   -1,   -1,   -1,   -1,
			   -1,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,  105,  106,   -1,  108,  109,   -1,   -1,    8,

			   -1,   -1,   -1,   -1,   -1,   14,  119,  120,  121,   18,
			   -1,  124,   -1,  126,   -1,   -1,   -1,   -1,  131,   -1,
			  133,   -1,   -1,   -1,   -1,   34,   -1,  140,   -1,   -1,
			   -1,   -1,   41,   -1,   43,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   52,   -1,   -1,   -1,   -1,   -1,   58,
			   -1,   60,   61,   -1,   -1,   64,   -1,   -1,   -1,   -1,
			   69,   70,   -1,   72,   73,   74,   75,   76,   77,   78,
			   -1,   -1,   -1,   82,   -1,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,  106,  107,  108, yyDummy>>,
			1, 200, 4800)
		end

	yycheck_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,   14,
			  119,  120,  121,   18,  123,  124,   -1,  126,   -1,   -1,
			   -1,   -1,  131,   -1,   -1,  134,  135,   -1,   -1,   34,
			   -1,   -1,  141,   -1,   -1,   -1,   41,   -1,   43,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   52,   -1,   -1,
			   -1,   -1,   -1,   58,   -1,   60,   61,   -1,   -1,   64,
			   -1,   -1,   -1,   -1,   69,   70,   -1,   72,   73,   74,
			   75,   76,   77,   78,   -1,   -1,   -1,   82,   -1,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,

			  105,  106,  107,  108,   -1,   -1,   -1,    8,   -1,   -1,
			   -1,   -1,   -1,   -1,  119,  120,  121,   18,  123,  124,
			   -1,  126,   -1,   -1,   -1,   -1,  131,   -1,   -1,  134,
			  135,   -1,   -1,   34,   -1,   -1,  141,   -1,   -1,   -1,
			   41,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   52,   -1,   -1,   -1,   -1,   -1,   58,   -1,   60,
			   61,   -1,   -1,   64,   -1,   -1,   -1,   -1,   69,   70,
			   -1,   72,   73,   74,   75,   76,   77,   78,   -1,   -1,
			   -1,   82,   -1,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100, yyDummy>>,
			1, 200, 5000)
		end

	yycheck_template_27 (an_array: ARRAY [INTEGER])
			-- Fill chunk #27 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  101,  102,  103,  104,  105,  106,  107,  108,   -1,   -1,
			   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,  119,  120,
			  121,   18,  123,  124,   -1,  126,   -1,   -1,   -1,  130,
			  131,   -1,   -1,  134,  135,   -1,   -1,   34,   -1,   -1,
			  141,   -1,   -1,   -1,   41,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   52,   -1,   -1,   -1,   -1,
			   -1,   58,   -1,   60,   61,   -1,   -1,   64,   -1,   -1,
			   -1,   -1,   69,   70,   -1,   72,   73,   74,   75,   76,
			   77,   78,   -1,   -1,   -1,   82,   -1,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,

			   97,   98,   99,  100,  101,  102,  103,  104,  105,  106,
			  107,  108,   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,
			   -1,   -1,  119,  120,  121,   18,  123,  124,   -1,  126,
			   -1,   -1,   -1,   -1,  131,  132,   -1,  134,  135,   -1,
			   -1,   34,   -1,   -1,  141,   -1,   -1,   -1,   41,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   52,
			   -1,   -1,   -1,   -1,   -1,   58,   -1,   60,   61,   -1,
			   -1,   64,   -1,   -1,   -1,   -1,   69,   70,   -1,   72,
			   73,   74,   75,   76,   77,   78,   -1,   -1,   -1,   82,
			   -1,   84,   85,   86,   87,   88,   89,   90,   91,   92, yyDummy>>,
			1, 200, 5200)
		end

	yycheck_template_28 (an_array: ARRAY [INTEGER])
			-- Fill chunk #28 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,  105,  106,  107,  108,   -1,   -1,   -1,    8,
			   -1,   -1,   -1,   -1,   -1,   -1,  119,  120,  121,   18,
			  123,  124,   -1,  126,  127,   -1,   -1,   -1,  131,   -1,
			   -1,  134,  135,   -1,   -1,   34,   -1,   -1,  141,   -1,
			   -1,   -1,   41,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   52,   -1,   -1,   -1,   -1,   -1,   58,
			   -1,   60,   61,   -1,   -1,   64,   65,   -1,   -1,   -1,
			   69,   70,   -1,   72,   73,   74,   75,   76,   77,   78,
			   -1,   -1,   -1,   82,   -1,   84,   85,   86,   87,   88,

			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,  106,  107,  108,
			   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,
			  119,  120,  121,   18,  123,  124,   -1,  126,   -1,   -1,
			   -1,   -1,  131,   -1,   -1,  134,  135,   -1,   -1,   34,
			   -1,   -1,  141,   -1,   -1,   -1,   41,   -1,   43,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   52,   -1,   -1,
			   -1,   -1,   -1,   58,   -1,   60,   61,   -1,   -1,   64,
			   -1,   -1,   -1,   -1,   69,   70,   -1,   72,   73,   74,
			   75,   76,   77,   78,   -1,   -1,   -1,   82,   -1,   84, yyDummy>>,
			1, 200, 5400)
		end

	yycheck_template_29 (an_array: ARRAY [INTEGER])
			-- Fill chunk #29 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,
			  105,  106,  107,  108,   -1,   -1,   -1,    8,   -1,   -1,
			   -1,   12,   -1,   -1,  119,  120,  121,   18,  123,  124,
			   -1,  126,   -1,   -1,   -1,   -1,  131,   -1,   -1,  134,
			  135,   -1,   -1,   34,   -1,   -1,  141,   -1,   -1,   -1,
			   41,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   52,   -1,   -1,   -1,   -1,   -1,   58,   -1,   60,
			   61,   -1,   -1,   64,   -1,   -1,   -1,   -1,   69,   70,
			   -1,   72,   73,   74,   75,   76,   77,   78,   -1,   -1,

			   -1,   82,   -1,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,  105,  106,  107,  108,   -1,   -1,
			   -1,    8,   -1,   -1,   -1,   -1,   -1,   -1,  119,  120,
			  121,   18,  123,  124,   -1,  126,   -1,   -1,   -1,   -1,
			  131,   -1,   -1,  134,  135,   -1,   -1,   34,   -1,   -1,
			  141,   -1,   -1,   -1,   41,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   52,   -1,   -1,   -1,   -1,
			   -1,   58,   -1,   60,   61,   -1,   -1,   64,   -1,   -1,
			   -1,   -1,   69,   70,   -1,   72,   73,   74,   75,   76, yyDummy>>,
			1, 200, 5600)
		end

	yycheck_template_30 (an_array: ARRAY [INTEGER])
			-- Fill chunk #30 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   77,   78,   -1,   -1,   -1,   82,   -1,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,  105,  106,
			  107,  108,   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,
			   -1,   -1,  119,  120,  121,   18,  123,  124,   -1,  126,
			   -1,   -1,   -1,  130,  131,   -1,   -1,  134,  135,   -1,
			   -1,   34,   -1,   -1,  141,   -1,   -1,   -1,   41,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   52,
			   -1,   -1,   -1,   -1,   -1,   58,   -1,   60,   61,   -1,
			   -1,   64,   -1,   -1,   -1,   -1,   69,   70,   -1,   72,

			   73,   74,   75,   76,   77,   78,   -1,   -1,   -1,   82,
			   -1,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,  105,  106,  107,  108,   -1,   -1,   -1,    8,
			   -1,   -1,   -1,   -1,   -1,   -1,  119,  120,  121,   18,
			  123,  124,   -1,  126,   -1,   -1,   -1,   -1,  131,   -1,
			   -1,  134,  135,   -1,   -1,   34,   -1,   -1,  141,   -1,
			   -1,   -1,   41,   -1,   -1,   -1,   -1,   -1,   12,   -1,
			   14,   -1,   -1,   52,   -1,   -1,   -1,   -1,   -1,   58,
			   -1,   60,   61,   -1,   -1,   64,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 5800)
		end

	yycheck_template_31 (an_array: ARRAY [INTEGER])
			-- Fill chunk #31 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   69,   70,   -1,   72,   73,   74,   75,   76,   77,   78,
			   -1,   -1,   -1,   82,   -1,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,  106,  107,  108,
			   74,   -1,   -1,   -1,   -1,   79,   80,   81,   -1,   83,
			  119,  120,  121,   -1,  123,  124,   43,  126,   -1,   -1,
			   -1,   -1,  131,   -1,   -1,  134,  135,   -1,   -1,   -1,
			   -1,   -1,  141,   -1,   -1,   -1,  110,  111,  112,  113,
			  114,  115,  116,  117,  118,   -1,   -1,   74,   -1,   -1,
			   -1,   -1,   79,   80,   81,   -1,   83,   -1,   -1,   -1,

			  134,  135,  136,  137,  138,  139,   47,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  110,  111,  112,  113,  114,  115,  116,
			  117,  118,   -1,   74,   -1,   -1,   -1,   -1,   79,   80,
			   81,   -1,   83,   -1,   -1,   -1,   -1,  134,  135,  136,
			  137,  138,  139,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  110,
			  111,  112,  113,  114,  115,  116,  117,  118,   45,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  134,  135,  136,  137,  138,  139,   -1, yyDummy>>,
			1, 200, 6000)
		end

	yycheck_template_32 (an_array: ARRAY [INTEGER])
			-- Fill chunk #32 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   69,   70,   -1,   72,   -1,   -1,   -1,   -1,
			   -1,   78,   -1,   -1,   -1,   -1,   -1,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,  105,  106,
			  107,   -1,   74,   -1,   -1,   -1,   65,   79,   80,   81,
			   -1,   83,   -1,  120,  121,   74,   -1,  124,   -1,   -1,
			   79,   80,   81,   -1,   83,   -1,   -1,  134,  135,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  110,  111,
			  112,  113,  114,  115,  116,  117,  118,   -1,   -1,   -1,
			   -1,  110,  111,  112,  113,  114,  115,  116,  117,  118,

			   -1,   -1,  134,  135,  136,  137,  138,  139,  140,   -1,
			  129,   -1,   -1,   -1,   -1,  134,  135,  136,  137,  138,
			  139,   72,   -1,   -1,   -1,   -1,   -1,   78,   -1,   -1,
			   -1,   -1,   -1,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,  105,  106,  107,   74,   -1,   -1,
			   -1,   -1,   79,   80,   81,   -1,   83,   -1,   -1,  120,
			  121,   74,   -1,   -1,   -1,   -1,   79,   80,   81,   -1,
			   83,  132,   -1,  134,  135,   -1,   -1,   -1,   -1,   -1,
			   -1,  142,   -1,  110,  111,  112,  113,  114,  115,  116, yyDummy>>,
			1, 200, 6200)
		end

	yycheck_template_33 (an_array: ARRAY [INTEGER])
			-- Fill chunk #33 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  117,  118,   -1,   -1,   -1,   -1,   -1,  110,  111,  112,
			  113,  114,  115,  116,  117,  118,   -1,  134,  135,  136,
			  137,  138,  139,  140,   -1,   -1,  129,  130,   -1,   -1,
			   -1,  134,  135,  136,  137,  138,  139,   74,   -1,   -1,
			   -1,   -1,   79,   80,   81,   -1,   83,   -1,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,   -1,   -1,  110,  111,  112,  113,  114,  115,  116,
			  117,  118,   74,   -1,   -1,   -1,   -1,   79,   80,   81,
			  127,   83,  129,   -1,   -1,   -1,   -1,  134,  135,  136,

			  137,  138,  139,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  110,  111,
			  112,  113,  114,  115,  116,  117,  118,   74,   -1,   -1,
			   -1,   -1,   79,   80,   81,   -1,   83,  129,  130,   -1,
			   -1,   -1,  134,  135,  136,  137,  138,  139,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  110,  111,  112,  113,  114,  115,  116,
			  117,  118,   74,   -1,   -1,   -1,   -1,   79,   80,   81,
			  127,   83,   -1,   -1,   -1,   -1,   -1,  134,  135,  136,
			  137,  138,  139,   -1,   -1,   -1,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 6400)
		end

	yycheck_template_34 (an_array: ARRAY [INTEGER])
			-- Fill chunk #34 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  110,  111,
			  112,  113,  114,  115,  116,  117,  118,   74,   -1,   -1,
			   -1,   -1,   79,   80,   81,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,  134,  135,  136,  137,  138,  139,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  110,  111,  112,  113,  114,  115,  116,
			  117,  118,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  134,  135,  136,
			  137,  138,  139,   72,   -1,   -1,   -1,   -1,   -1,   78,
			   -1,   -1,   -1,   -1,   -1,   84,   85,   86,   87,   88,

			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,  106,  107,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  120,  121,   -1,   -1,   72,   -1,   -1,   -1,   -1,
			   -1,   78,   -1,  132,   -1,  134,  135,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,  105,  106,
			  107,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  120,  121,   -1,   -1,   72,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  134,  135,   84, yyDummy>>,
			1, 200, 6600)
		end

	yycheck_template_35 (an_array: ARRAY [INTEGER])
			-- Fill chunk #35 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,
			  105,  106,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,  120,  121,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  132,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,  121,   -1,   -1,  124, yyDummy>>,
			1, 89, 6800)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [detachable ANY]
			-- Stack for semantic values of type detachable ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: KL_SPECIAL_ROUTINES [detachable ANY]
			-- Routines that ought to be in SPECIAL [detachable ANY]

	yyvs2: SPECIAL [detachable ET_KEYWORD]
			-- Stack for semantic values of type detachable ET_KEYWORD

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [detachable ET_KEYWORD]
			-- Routines that ought to be in SPECIAL [detachable ET_KEYWORD]

	yyvs3: SPECIAL [detachable ET_AGENT_KEYWORD]
			-- Stack for semantic values of type detachable ET_AGENT_KEYWORD

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [detachable ET_AGENT_KEYWORD]
			-- Routines that ought to be in SPECIAL [detachable ET_AGENT_KEYWORD]

	yyvs4: SPECIAL [detachable ET_PRECURSOR_KEYWORD]
			-- Stack for semantic values of type detachable ET_PRECURSOR_KEYWORD

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [detachable ET_PRECURSOR_KEYWORD]
			-- Routines that ought to be in SPECIAL [detachable ET_PRECURSOR_KEYWORD]

	yyvs5: SPECIAL [detachable ET_SYMBOL]
			-- Stack for semantic values of type detachable ET_SYMBOL

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [detachable ET_SYMBOL]
			-- Routines that ought to be in SPECIAL [detachable ET_SYMBOL]

	yyvs6: SPECIAL [detachable ET_POSITION]
			-- Stack for semantic values of type detachable ET_POSITION

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [detachable ET_POSITION]
			-- Routines that ought to be in SPECIAL [detachable ET_POSITION]

	yyvs7: SPECIAL [detachable ET_BOOLEAN_CONSTANT]
			-- Stack for semantic values of type detachable ET_BOOLEAN_CONSTANT

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [detachable ET_BOOLEAN_CONSTANT]
			-- Routines that ought to be in SPECIAL [detachable ET_BOOLEAN_CONSTANT]

	yyvs8: SPECIAL [detachable ET_BREAK]
			-- Stack for semantic values of type detachable ET_BREAK

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [detachable ET_BREAK]
			-- Routines that ought to be in SPECIAL [detachable ET_BREAK]

	yyvs9: SPECIAL [detachable ET_CHARACTER_CONSTANT]
			-- Stack for semantic values of type detachable ET_CHARACTER_CONSTANT

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [detachable ET_CHARACTER_CONSTANT]
			-- Routines that ought to be in SPECIAL [detachable ET_CHARACTER_CONSTANT]

	yyvs10: SPECIAL [detachable ET_CURRENT]
			-- Stack for semantic values of type detachable ET_CURRENT

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [detachable ET_CURRENT]
			-- Routines that ought to be in SPECIAL [detachable ET_CURRENT]

	yyvs11: SPECIAL [detachable ET_FREE_OPERATOR]
			-- Stack for semantic values of type detachable ET_FREE_OPERATOR

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [detachable ET_FREE_OPERATOR]
			-- Routines that ought to be in SPECIAL [detachable ET_FREE_OPERATOR]

	yyvs12: SPECIAL [detachable ET_IDENTIFIER]
			-- Stack for semantic values of type detachable ET_IDENTIFIER

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [detachable ET_IDENTIFIER]
			-- Routines that ought to be in SPECIAL [detachable ET_IDENTIFIER]

	yyvs13: SPECIAL [detachable ET_INTEGER_CONSTANT]
			-- Stack for semantic values of type detachable ET_INTEGER_CONSTANT

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [detachable ET_INTEGER_CONSTANT]
			-- Routines that ought to be in SPECIAL [detachable ET_INTEGER_CONSTANT]

	yyvs14: SPECIAL [detachable ET_KEYWORD_OPERATOR]
			-- Stack for semantic values of type detachable ET_KEYWORD_OPERATOR

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [detachable ET_KEYWORD_OPERATOR]
			-- Routines that ought to be in SPECIAL [detachable ET_KEYWORD_OPERATOR]

	yyvs15: SPECIAL [detachable ET_MANIFEST_STRING]
			-- Stack for semantic values of type detachable ET_MANIFEST_STRING

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_STRING]
			-- Routines that ought to be in SPECIAL [detachable ET_MANIFEST_STRING]

	yyvs16: SPECIAL [detachable ET_REAL_CONSTANT]
			-- Stack for semantic values of type detachable ET_REAL_CONSTANT

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [detachable ET_REAL_CONSTANT]
			-- Routines that ought to be in SPECIAL [detachable ET_REAL_CONSTANT]

	yyvs17: SPECIAL [detachable ET_RESULT]
			-- Stack for semantic values of type detachable ET_RESULT

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [detachable ET_RESULT]
			-- Routines that ought to be in SPECIAL [detachable ET_RESULT]

	yyvs18: SPECIAL [detachable ET_RETRY_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_RETRY_INSTRUCTION

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [detachable ET_RETRY_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_RETRY_INSTRUCTION]

	yyvs19: SPECIAL [detachable ET_SYMBOL_OPERATOR]
			-- Stack for semantic values of type detachable ET_SYMBOL_OPERATOR

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [detachable ET_SYMBOL_OPERATOR]
			-- Routines that ought to be in SPECIAL [detachable ET_SYMBOL_OPERATOR]

	yyvs20: SPECIAL [detachable ET_VOID]
			-- Stack for semantic values of type detachable ET_VOID

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [detachable ET_VOID]
			-- Routines that ought to be in SPECIAL [detachable ET_VOID]

	yyvs21: SPECIAL [detachable ET_SEMICOLON_SYMBOL]
			-- Stack for semantic values of type detachable ET_SEMICOLON_SYMBOL

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [detachable ET_SEMICOLON_SYMBOL]
			-- Routines that ought to be in SPECIAL [detachable ET_SEMICOLON_SYMBOL]

	yyvs22: SPECIAL [detachable ET_BRACKET_SYMBOL]
			-- Stack for semantic values of type detachable ET_BRACKET_SYMBOL

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [detachable ET_BRACKET_SYMBOL]
			-- Routines that ought to be in SPECIAL [detachable ET_BRACKET_SYMBOL]

	yyvs23: SPECIAL [detachable ET_QUESTION_MARK_SYMBOL]
			-- Stack for semantic values of type detachable ET_QUESTION_MARK_SYMBOL

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [detachable ET_QUESTION_MARK_SYMBOL]
			-- Routines that ought to be in SPECIAL [detachable ET_QUESTION_MARK_SYMBOL]

	yyvs24: SPECIAL [detachable ET_ACROSS_EXPRESSION]
			-- Stack for semantic values of type detachable ET_ACROSS_EXPRESSION

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [detachable ET_ACROSS_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_ACROSS_EXPRESSION]

	yyvs25: SPECIAL [detachable ET_ACROSS_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_ACROSS_INSTRUCTION

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [detachable ET_ACROSS_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_ACROSS_INSTRUCTION]

	yyvs26: SPECIAL [detachable ET_ACTUAL_ARGUMENT_LIST]
			-- Stack for semantic values of type detachable ET_ACTUAL_ARGUMENT_LIST

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [detachable ET_ACTUAL_ARGUMENT_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_ACTUAL_ARGUMENT_LIST]

	yyvs27: SPECIAL [detachable ET_ACTUAL_PARAMETER_ITEM]
			-- Stack for semantic values of type detachable ET_ACTUAL_PARAMETER_ITEM

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [detachable ET_ACTUAL_PARAMETER_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_ACTUAL_PARAMETER_ITEM]

	yyvs28: SPECIAL [detachable ET_ACTUAL_PARAMETER_LIST]
			-- Stack for semantic values of type detachable ET_ACTUAL_PARAMETER_LIST

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [detachable ET_ACTUAL_PARAMETER_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_ACTUAL_PARAMETER_LIST]

	yyvs29: SPECIAL [detachable ET_AGENT_ARGUMENT_OPERAND]
			-- Stack for semantic values of type detachable ET_AGENT_ARGUMENT_OPERAND

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [detachable ET_AGENT_ARGUMENT_OPERAND]
			-- Routines that ought to be in SPECIAL [detachable ET_AGENT_ARGUMENT_OPERAND]

	yyvs30: SPECIAL [detachable ET_AGENT_ARGUMENT_OPERAND_ITEM]
			-- Stack for semantic values of type detachable ET_AGENT_ARGUMENT_OPERAND_ITEM

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [detachable ET_AGENT_ARGUMENT_OPERAND_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_AGENT_ARGUMENT_OPERAND_ITEM]

	yyvs31: SPECIAL [detachable ET_AGENT_ARGUMENT_OPERAND_LIST]
			-- Stack for semantic values of type detachable ET_AGENT_ARGUMENT_OPERAND_LIST

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [detachable ET_AGENT_ARGUMENT_OPERAND_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_AGENT_ARGUMENT_OPERAND_LIST]

	yyvs32: SPECIAL [detachable ET_AGENT_TARGET]
			-- Stack for semantic values of type detachable ET_AGENT_TARGET

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [detachable ET_AGENT_TARGET]
			-- Routines that ought to be in SPECIAL [detachable ET_AGENT_TARGET]

	yyvs33: SPECIAL [detachable ET_ALIAS_NAME]
			-- Stack for semantic values of type detachable ET_ALIAS_NAME

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [detachable ET_ALIAS_NAME]
			-- Routines that ought to be in SPECIAL [detachable ET_ALIAS_NAME]

	yyvs34: SPECIAL [detachable ET_ASSIGNER]
			-- Stack for semantic values of type detachable ET_ASSIGNER

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [detachable ET_ASSIGNER]
			-- Routines that ought to be in SPECIAL [detachable ET_ASSIGNER]

	yyvs35: SPECIAL [detachable ET_BRACKET_EXPRESSION]
			-- Stack for semantic values of type detachable ET_BRACKET_EXPRESSION

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [detachable ET_BRACKET_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_BRACKET_EXPRESSION]

	yyvs36: SPECIAL [detachable ET_CALL_AGENT]
			-- Stack for semantic values of type detachable ET_CALL_AGENT

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [detachable ET_CALL_AGENT]
			-- Routines that ought to be in SPECIAL [detachable ET_CALL_AGENT]

	yyvs37: SPECIAL [detachable ET_QUALIFIED_CALL_EXPRESSION]
			-- Stack for semantic values of type detachable ET_QUALIFIED_CALL_EXPRESSION

	yyvsc37: INTEGER
			-- Capacity of semantic value stack `yyvs37'

	yyvsp37: INTEGER
			-- Top of semantic value stack `yyvs37'

	yyspecial_routines37: KL_SPECIAL_ROUTINES [detachable ET_QUALIFIED_CALL_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_QUALIFIED_CALL_EXPRESSION]

	yyvs38: SPECIAL [detachable ET_CHECK_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_CHECK_INSTRUCTION

	yyvsc38: INTEGER
			-- Capacity of semantic value stack `yyvs38'

	yyvsp38: INTEGER
			-- Top of semantic value stack `yyvs38'

	yyspecial_routines38: KL_SPECIAL_ROUTINES [detachable ET_CHECK_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_CHECK_INSTRUCTION]

	yyvs39: SPECIAL [detachable ET_CHOICE]
			-- Stack for semantic values of type detachable ET_CHOICE

	yyvsc39: INTEGER
			-- Capacity of semantic value stack `yyvs39'

	yyvsp39: INTEGER
			-- Top of semantic value stack `yyvs39'

	yyspecial_routines39: KL_SPECIAL_ROUTINES [detachable ET_CHOICE]
			-- Routines that ought to be in SPECIAL [detachable ET_CHOICE]

	yyvs40: SPECIAL [detachable ET_CHOICE_CONSTANT]
			-- Stack for semantic values of type detachable ET_CHOICE_CONSTANT

	yyvsc40: INTEGER
			-- Capacity of semantic value stack `yyvs40'

	yyvsp40: INTEGER
			-- Top of semantic value stack `yyvs40'

	yyspecial_routines40: KL_SPECIAL_ROUTINES [detachable ET_CHOICE_CONSTANT]
			-- Routines that ought to be in SPECIAL [detachable ET_CHOICE_CONSTANT]

	yyvs41: SPECIAL [detachable ET_CHOICE_ITEM]
			-- Stack for semantic values of type detachable ET_CHOICE_ITEM

	yyvsc41: INTEGER
			-- Capacity of semantic value stack `yyvs41'

	yyvsp41: INTEGER
			-- Top of semantic value stack `yyvs41'

	yyspecial_routines41: KL_SPECIAL_ROUTINES [detachable ET_CHOICE_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_CHOICE_ITEM]

	yyvs42: SPECIAL [detachable ET_CHOICE_LIST]
			-- Stack for semantic values of type detachable ET_CHOICE_LIST

	yyvsc42: INTEGER
			-- Capacity of semantic value stack `yyvs42'

	yyvsp42: INTEGER
			-- Top of semantic value stack `yyvs42'

	yyspecial_routines42: KL_SPECIAL_ROUTINES [detachable ET_CHOICE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_CHOICE_LIST]

	yyvs43: SPECIAL [detachable ET_CLASS]
			-- Stack for semantic values of type detachable ET_CLASS

	yyvsc43: INTEGER
			-- Capacity of semantic value stack `yyvs43'

	yyvsp43: INTEGER
			-- Top of semantic value stack `yyvs43'

	yyspecial_routines43: KL_SPECIAL_ROUTINES [detachable ET_CLASS]
			-- Routines that ought to be in SPECIAL [detachable ET_CLASS]

	yyvs44: SPECIAL [detachable ET_CLIENT_ITEM]
			-- Stack for semantic values of type detachable ET_CLIENT_ITEM

	yyvsc44: INTEGER
			-- Capacity of semantic value stack `yyvs44'

	yyvsp44: INTEGER
			-- Top of semantic value stack `yyvs44'

	yyspecial_routines44: KL_SPECIAL_ROUTINES [detachable ET_CLIENT_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_CLIENT_ITEM]

	yyvs45: SPECIAL [detachable ET_CLIENTS]
			-- Stack for semantic values of type detachable ET_CLIENTS

	yyvsc45: INTEGER
			-- Capacity of semantic value stack `yyvs45'

	yyvsp45: INTEGER
			-- Top of semantic value stack `yyvs45'

	yyspecial_routines45: KL_SPECIAL_ROUTINES [detachable ET_CLIENTS]
			-- Routines that ought to be in SPECIAL [detachable ET_CLIENTS]

	yyvs46: SPECIAL [detachable ET_COMPOUND]
			-- Stack for semantic values of type detachable ET_COMPOUND

	yyvsc46: INTEGER
			-- Capacity of semantic value stack `yyvs46'

	yyvsp46: INTEGER
			-- Top of semantic value stack `yyvs46'

	yyspecial_routines46: KL_SPECIAL_ROUTINES [detachable ET_COMPOUND]
			-- Routines that ought to be in SPECIAL [detachable ET_COMPOUND]

	yyvs47: SPECIAL [detachable ET_CONDITIONAL]
			-- Stack for semantic values of type detachable ET_CONDITIONAL

	yyvsc47: INTEGER
			-- Capacity of semantic value stack `yyvs47'

	yyvsp47: INTEGER
			-- Top of semantic value stack `yyvs47'

	yyspecial_routines47: KL_SPECIAL_ROUTINES [detachable ET_CONDITIONAL]
			-- Routines that ought to be in SPECIAL [detachable ET_CONDITIONAL]

	yyvs48: SPECIAL [detachable ET_CONSTANT]
			-- Stack for semantic values of type detachable ET_CONSTANT

	yyvsc48: INTEGER
			-- Capacity of semantic value stack `yyvs48'

	yyvsp48: INTEGER
			-- Top of semantic value stack `yyvs48'

	yyspecial_routines48: KL_SPECIAL_ROUTINES [detachable ET_CONSTANT]
			-- Routines that ought to be in SPECIAL [detachable ET_CONSTANT]

	yyvs49: SPECIAL [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM]
			-- Stack for semantic values of type detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM

	yyvsc49: INTEGER
			-- Capacity of semantic value stack `yyvs49'

	yyvsp49: INTEGER
			-- Top of semantic value stack `yyvs49'

	yyspecial_routines49: KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM]

	yyvs50: SPECIAL [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST]
			-- Stack for semantic values of type detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST

	yyvsc50: INTEGER
			-- Capacity of semantic value stack `yyvs50'

	yyvsp50: INTEGER
			-- Top of semantic value stack `yyvs50'

	yyspecial_routines50: KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST]

	yyvs51: SPECIAL [detachable ET_CONSTRAINT_CREATOR]
			-- Stack for semantic values of type detachable ET_CONSTRAINT_CREATOR

	yyvsc51: INTEGER
			-- Capacity of semantic value stack `yyvs51'

	yyvsp51: INTEGER
			-- Top of semantic value stack `yyvs51'

	yyspecial_routines51: KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_CREATOR]
			-- Routines that ought to be in SPECIAL [detachable ET_CONSTRAINT_CREATOR]

	yyvs52: SPECIAL [detachable ET_CONSTRAINT_TYPE]
			-- Stack for semantic values of type detachable ET_CONSTRAINT_TYPE

	yyvsc52: INTEGER
			-- Capacity of semantic value stack `yyvs52'

	yyvsp52: INTEGER
			-- Top of semantic value stack `yyvs52'

	yyspecial_routines52: KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_TYPE]
			-- Routines that ought to be in SPECIAL [detachable ET_CONSTRAINT_TYPE]

	yyvs53: SPECIAL [detachable ET_CONVERT_FEATURE]
			-- Stack for semantic values of type detachable ET_CONVERT_FEATURE

	yyvsc53: INTEGER
			-- Capacity of semantic value stack `yyvs53'

	yyvsp53: INTEGER
			-- Top of semantic value stack `yyvs53'

	yyspecial_routines53: KL_SPECIAL_ROUTINES [detachable ET_CONVERT_FEATURE]
			-- Routines that ought to be in SPECIAL [detachable ET_CONVERT_FEATURE]

	yyvs54: SPECIAL [detachable ET_CONVERT_FEATURE_ITEM]
			-- Stack for semantic values of type detachable ET_CONVERT_FEATURE_ITEM

	yyvsc54: INTEGER
			-- Capacity of semantic value stack `yyvs54'

	yyvsp54: INTEGER
			-- Top of semantic value stack `yyvs54'

	yyspecial_routines54: KL_SPECIAL_ROUTINES [detachable ET_CONVERT_FEATURE_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_CONVERT_FEATURE_ITEM]

	yyvs55: SPECIAL [detachable ET_CONVERT_FEATURE_LIST]
			-- Stack for semantic values of type detachable ET_CONVERT_FEATURE_LIST

	yyvsc55: INTEGER
			-- Capacity of semantic value stack `yyvs55'

	yyvsp55: INTEGER
			-- Top of semantic value stack `yyvs55'

	yyspecial_routines55: KL_SPECIAL_ROUTINES [detachable ET_CONVERT_FEATURE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_CONVERT_FEATURE_LIST]

	yyvs56: SPECIAL [detachable ET_CREATE_EXPRESSION]
			-- Stack for semantic values of type detachable ET_CREATE_EXPRESSION

	yyvsc56: INTEGER
			-- Capacity of semantic value stack `yyvs56'

	yyvsp56: INTEGER
			-- Top of semantic value stack `yyvs56'

	yyspecial_routines56: KL_SPECIAL_ROUTINES [detachable ET_CREATE_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_CREATE_EXPRESSION]

	yyvs57: SPECIAL [detachable ET_CREATOR]
			-- Stack for semantic values of type detachable ET_CREATOR

	yyvsc57: INTEGER
			-- Capacity of semantic value stack `yyvs57'

	yyvsp57: INTEGER
			-- Top of semantic value stack `yyvs57'

	yyspecial_routines57: KL_SPECIAL_ROUTINES [detachable ET_CREATOR]
			-- Routines that ought to be in SPECIAL [detachable ET_CREATOR]

	yyvs58: SPECIAL [detachable ET_CREATOR_LIST]
			-- Stack for semantic values of type detachable ET_CREATOR_LIST

	yyvsc58: INTEGER
			-- Capacity of semantic value stack `yyvs58'

	yyvsp58: INTEGER
			-- Top of semantic value stack `yyvs58'

	yyspecial_routines58: KL_SPECIAL_ROUTINES [detachable ET_CREATOR_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_CREATOR_LIST]

	yyvs59: SPECIAL [detachable ET_DEBUG_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_DEBUG_INSTRUCTION

	yyvsc59: INTEGER
			-- Capacity of semantic value stack `yyvs59'

	yyvsp59: INTEGER
			-- Top of semantic value stack `yyvs59'

	yyspecial_routines59: KL_SPECIAL_ROUTINES [detachable ET_DEBUG_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_DEBUG_INSTRUCTION]

	yyvs60: SPECIAL [detachable ET_ELSEIF_PART]
			-- Stack for semantic values of type detachable ET_ELSEIF_PART

	yyvsc60: INTEGER
			-- Capacity of semantic value stack `yyvs60'

	yyvsp60: INTEGER
			-- Top of semantic value stack `yyvs60'

	yyspecial_routines60: KL_SPECIAL_ROUTINES [detachable ET_ELSEIF_PART]
			-- Routines that ought to be in SPECIAL [detachable ET_ELSEIF_PART]

	yyvs61: SPECIAL [detachable ET_ELSEIF_PART_LIST]
			-- Stack for semantic values of type detachable ET_ELSEIF_PART_LIST

	yyvsc61: INTEGER
			-- Capacity of semantic value stack `yyvs61'

	yyvsp61: INTEGER
			-- Top of semantic value stack `yyvs61'

	yyspecial_routines61: KL_SPECIAL_ROUTINES [detachable ET_ELSEIF_PART_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_ELSEIF_PART_LIST]

	yyvs62: SPECIAL [detachable ET_EXPORT]
			-- Stack for semantic values of type detachable ET_EXPORT

	yyvsc62: INTEGER
			-- Capacity of semantic value stack `yyvs62'

	yyvsp62: INTEGER
			-- Top of semantic value stack `yyvs62'

	yyspecial_routines62: KL_SPECIAL_ROUTINES [detachable ET_EXPORT]
			-- Routines that ought to be in SPECIAL [detachable ET_EXPORT]

	yyvs63: SPECIAL [detachable ET_EXPORT_LIST]
			-- Stack for semantic values of type detachable ET_EXPORT_LIST

	yyvsc63: INTEGER
			-- Capacity of semantic value stack `yyvs63'

	yyvsp63: INTEGER
			-- Top of semantic value stack `yyvs63'

	yyspecial_routines63: KL_SPECIAL_ROUTINES [detachable ET_EXPORT_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_EXPORT_LIST]

	yyvs64: SPECIAL [detachable ET_EXPRESSION]
			-- Stack for semantic values of type detachable ET_EXPRESSION

	yyvsc64: INTEGER
			-- Capacity of semantic value stack `yyvs64'

	yyvsp64: INTEGER
			-- Top of semantic value stack `yyvs64'

	yyspecial_routines64: KL_SPECIAL_ROUTINES [detachable ET_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_EXPRESSION]

	yyvs65: SPECIAL [detachable ET_EXPRESSION_ITEM]
			-- Stack for semantic values of type detachable ET_EXPRESSION_ITEM

	yyvsc65: INTEGER
			-- Capacity of semantic value stack `yyvs65'

	yyvsp65: INTEGER
			-- Top of semantic value stack `yyvs65'

	yyspecial_routines65: KL_SPECIAL_ROUTINES [detachable ET_EXPRESSION_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_EXPRESSION_ITEM]

	yyvs66: SPECIAL [detachable ET_EXTENDED_FEATURE_NAME]
			-- Stack for semantic values of type detachable ET_EXTENDED_FEATURE_NAME

	yyvsc66: INTEGER
			-- Capacity of semantic value stack `yyvs66'

	yyvsp66: INTEGER
			-- Top of semantic value stack `yyvs66'

	yyspecial_routines66: KL_SPECIAL_ROUTINES [detachable ET_EXTENDED_FEATURE_NAME]
			-- Routines that ought to be in SPECIAL [detachable ET_EXTENDED_FEATURE_NAME]

	yyvs67: SPECIAL [detachable ET_EXTERNAL_ALIAS]
			-- Stack for semantic values of type detachable ET_EXTERNAL_ALIAS

	yyvsc67: INTEGER
			-- Capacity of semantic value stack `yyvs67'

	yyvsp67: INTEGER
			-- Top of semantic value stack `yyvs67'

	yyspecial_routines67: KL_SPECIAL_ROUTINES [detachable ET_EXTERNAL_ALIAS]
			-- Routines that ought to be in SPECIAL [detachable ET_EXTERNAL_ALIAS]

	yyvs68: SPECIAL [detachable ET_FEATURE_CLAUSE]
			-- Stack for semantic values of type detachable ET_FEATURE_CLAUSE

	yyvsc68: INTEGER
			-- Capacity of semantic value stack `yyvs68'

	yyvsp68: INTEGER
			-- Top of semantic value stack `yyvs68'

	yyspecial_routines68: KL_SPECIAL_ROUTINES [detachable ET_FEATURE_CLAUSE]
			-- Routines that ought to be in SPECIAL [detachable ET_FEATURE_CLAUSE]

	yyvs69: SPECIAL [detachable ET_FEATURE_CLAUSE_LIST]
			-- Stack for semantic values of type detachable ET_FEATURE_CLAUSE_LIST

	yyvsc69: INTEGER
			-- Capacity of semantic value stack `yyvs69'

	yyvsp69: INTEGER
			-- Top of semantic value stack `yyvs69'

	yyspecial_routines69: KL_SPECIAL_ROUTINES [detachable ET_FEATURE_CLAUSE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_FEATURE_CLAUSE_LIST]

	yyvs70: SPECIAL [detachable ET_FEATURE_EXPORT]
			-- Stack for semantic values of type detachable ET_FEATURE_EXPORT

	yyvsc70: INTEGER
			-- Capacity of semantic value stack `yyvs70'

	yyvsp70: INTEGER
			-- Top of semantic value stack `yyvs70'

	yyspecial_routines70: KL_SPECIAL_ROUTINES [detachable ET_FEATURE_EXPORT]
			-- Routines that ought to be in SPECIAL [detachable ET_FEATURE_EXPORT]

	yyvs71: SPECIAL [detachable ET_FEATURE_NAME]
			-- Stack for semantic values of type detachable ET_FEATURE_NAME

	yyvsc71: INTEGER
			-- Capacity of semantic value stack `yyvs71'

	yyvsp71: INTEGER
			-- Top of semantic value stack `yyvs71'

	yyspecial_routines71: KL_SPECIAL_ROUTINES [detachable ET_FEATURE_NAME]
			-- Routines that ought to be in SPECIAL [detachable ET_FEATURE_NAME]

	yyvs72: SPECIAL [detachable ET_FEATURE_NAME_ITEM]
			-- Stack for semantic values of type detachable ET_FEATURE_NAME_ITEM

	yyvsc72: INTEGER
			-- Capacity of semantic value stack `yyvs72'

	yyvsp72: INTEGER
			-- Top of semantic value stack `yyvs72'

	yyspecial_routines72: KL_SPECIAL_ROUTINES [detachable ET_FEATURE_NAME_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_FEATURE_NAME_ITEM]

	yyvs73: SPECIAL [detachable ET_FORMAL_ARGUMENT]
			-- Stack for semantic values of type detachable ET_FORMAL_ARGUMENT

	yyvsc73: INTEGER
			-- Capacity of semantic value stack `yyvs73'

	yyvsp73: INTEGER
			-- Top of semantic value stack `yyvs73'

	yyspecial_routines73: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_ARGUMENT]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_ARGUMENT]

	yyvs74: SPECIAL [detachable ET_FORMAL_ARGUMENT_ITEM]
			-- Stack for semantic values of type detachable ET_FORMAL_ARGUMENT_ITEM

	yyvsc74: INTEGER
			-- Capacity of semantic value stack `yyvs74'

	yyvsp74: INTEGER
			-- Top of semantic value stack `yyvs74'

	yyspecial_routines74: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_ARGUMENT_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_ARGUMENT_ITEM]

	yyvs75: SPECIAL [detachable ET_FORMAL_ARGUMENT_LIST]
			-- Stack for semantic values of type detachable ET_FORMAL_ARGUMENT_LIST

	yyvsc75: INTEGER
			-- Capacity of semantic value stack `yyvs75'

	yyvsp75: INTEGER
			-- Top of semantic value stack `yyvs75'

	yyspecial_routines75: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_ARGUMENT_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_ARGUMENT_LIST]

	yyvs76: SPECIAL [detachable ET_FORMAL_PARAMETER]
			-- Stack for semantic values of type detachable ET_FORMAL_PARAMETER

	yyvsc76: INTEGER
			-- Capacity of semantic value stack `yyvs76'

	yyvsp76: INTEGER
			-- Top of semantic value stack `yyvs76'

	yyspecial_routines76: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_PARAMETER]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_PARAMETER]

	yyvs77: SPECIAL [detachable ET_FORMAL_PARAMETER_ITEM]
			-- Stack for semantic values of type detachable ET_FORMAL_PARAMETER_ITEM

	yyvsc77: INTEGER
			-- Capacity of semantic value stack `yyvs77'

	yyvsp77: INTEGER
			-- Top of semantic value stack `yyvs77'

	yyspecial_routines77: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_PARAMETER_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_PARAMETER_ITEM]

	yyvs78: SPECIAL [detachable ET_FORMAL_PARAMETER_LIST]
			-- Stack for semantic values of type detachable ET_FORMAL_PARAMETER_LIST

	yyvsc78: INTEGER
			-- Capacity of semantic value stack `yyvs78'

	yyvsp78: INTEGER
			-- Top of semantic value stack `yyvs78'

	yyspecial_routines78: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_PARAMETER_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_PARAMETER_LIST]

	yyvs79: SPECIAL [detachable ET_IF_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_IF_INSTRUCTION

	yyvsc79: INTEGER
			-- Capacity of semantic value stack `yyvs79'

	yyvsp79: INTEGER
			-- Top of semantic value stack `yyvs79'

	yyspecial_routines79: KL_SPECIAL_ROUTINES [detachable ET_IF_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_IF_INSTRUCTION]

	yyvs80: SPECIAL [detachable ET_INDEXING_LIST]
			-- Stack for semantic values of type detachable ET_INDEXING_LIST

	yyvsc80: INTEGER
			-- Capacity of semantic value stack `yyvs80'

	yyvsp80: INTEGER
			-- Top of semantic value stack `yyvs80'

	yyspecial_routines80: KL_SPECIAL_ROUTINES [detachable ET_INDEXING_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_INDEXING_LIST]

	yyvs81: SPECIAL [detachable ET_INDEXING_ITEM]
			-- Stack for semantic values of type detachable ET_INDEXING_ITEM

	yyvsc81: INTEGER
			-- Capacity of semantic value stack `yyvs81'

	yyvsp81: INTEGER
			-- Top of semantic value stack `yyvs81'

	yyspecial_routines81: KL_SPECIAL_ROUTINES [detachable ET_INDEXING_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_INDEXING_ITEM]

	yyvs82: SPECIAL [detachable ET_INDEXING_TERM]
			-- Stack for semantic values of type detachable ET_INDEXING_TERM

	yyvsc82: INTEGER
			-- Capacity of semantic value stack `yyvs82'

	yyvsp82: INTEGER
			-- Top of semantic value stack `yyvs82'

	yyspecial_routines82: KL_SPECIAL_ROUTINES [detachable ET_INDEXING_TERM]
			-- Routines that ought to be in SPECIAL [detachable ET_INDEXING_TERM]

	yyvs83: SPECIAL [detachable ET_INDEXING_TERM_ITEM]
			-- Stack for semantic values of type detachable ET_INDEXING_TERM_ITEM

	yyvsc83: INTEGER
			-- Capacity of semantic value stack `yyvs83'

	yyvsp83: INTEGER
			-- Top of semantic value stack `yyvs83'

	yyspecial_routines83: KL_SPECIAL_ROUTINES [detachable ET_INDEXING_TERM_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_INDEXING_TERM_ITEM]

	yyvs84: SPECIAL [detachable ET_INDEXING_TERM_LIST]
			-- Stack for semantic values of type detachable ET_INDEXING_TERM_LIST

	yyvsc84: INTEGER
			-- Capacity of semantic value stack `yyvs84'

	yyvsp84: INTEGER
			-- Top of semantic value stack `yyvs84'

	yyspecial_routines84: KL_SPECIAL_ROUTINES [detachable ET_INDEXING_TERM_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_INDEXING_TERM_LIST]

	yyvs85: SPECIAL [detachable ET_INLINE_AGENT]
			-- Stack for semantic values of type detachable ET_INLINE_AGENT

	yyvsc85: INTEGER
			-- Capacity of semantic value stack `yyvs85'

	yyvsp85: INTEGER
			-- Top of semantic value stack `yyvs85'

	yyspecial_routines85: KL_SPECIAL_ROUTINES [detachable ET_INLINE_AGENT]
			-- Routines that ought to be in SPECIAL [detachable ET_INLINE_AGENT]

	yyvs86: SPECIAL [detachable ET_INSPECT_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_INSPECT_INSTRUCTION

	yyvsc86: INTEGER
			-- Capacity of semantic value stack `yyvs86'

	yyvsp86: INTEGER
			-- Top of semantic value stack `yyvs86'

	yyspecial_routines86: KL_SPECIAL_ROUTINES [detachable ET_INSPECT_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_INSPECT_INSTRUCTION]

	yyvs87: SPECIAL [detachable ET_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_INSTRUCTION

	yyvsc87: INTEGER
			-- Capacity of semantic value stack `yyvs87'

	yyvsp87: INTEGER
			-- Top of semantic value stack `yyvs87'

	yyspecial_routines87: KL_SPECIAL_ROUTINES [detachable ET_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_INSTRUCTION]

	yyvs88: SPECIAL [detachable ET_INVARIANTS]
			-- Stack for semantic values of type detachable ET_INVARIANTS

	yyvsc88: INTEGER
			-- Capacity of semantic value stack `yyvs88'

	yyvsp88: INTEGER
			-- Top of semantic value stack `yyvs88'

	yyspecial_routines88: KL_SPECIAL_ROUTINES [detachable ET_INVARIANTS]
			-- Routines that ought to be in SPECIAL [detachable ET_INVARIANTS]

	yyvs89: SPECIAL [detachable ET_KEYWORD_FEATURE_NAME_LIST]
			-- Stack for semantic values of type detachable ET_KEYWORD_FEATURE_NAME_LIST

	yyvsc89: INTEGER
			-- Capacity of semantic value stack `yyvs89'

	yyvsp89: INTEGER
			-- Top of semantic value stack `yyvs89'

	yyspecial_routines89: KL_SPECIAL_ROUTINES [detachable ET_KEYWORD_FEATURE_NAME_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_KEYWORD_FEATURE_NAME_LIST]

	yyvs90: SPECIAL [detachable ET_LIKE_TYPE]
			-- Stack for semantic values of type detachable ET_LIKE_TYPE

	yyvsc90: INTEGER
			-- Capacity of semantic value stack `yyvs90'

	yyvsp90: INTEGER
			-- Top of semantic value stack `yyvs90'

	yyspecial_routines90: KL_SPECIAL_ROUTINES [detachable ET_LIKE_TYPE]
			-- Routines that ought to be in SPECIAL [detachable ET_LIKE_TYPE]

	yyvs91: SPECIAL [detachable ET_LOCAL_VARIABLE]
			-- Stack for semantic values of type detachable ET_LOCAL_VARIABLE

	yyvsc91: INTEGER
			-- Capacity of semantic value stack `yyvs91'

	yyvsp91: INTEGER
			-- Top of semantic value stack `yyvs91'

	yyspecial_routines91: KL_SPECIAL_ROUTINES [detachable ET_LOCAL_VARIABLE]
			-- Routines that ought to be in SPECIAL [detachable ET_LOCAL_VARIABLE]

	yyvs92: SPECIAL [detachable ET_LOCAL_VARIABLE_ITEM]
			-- Stack for semantic values of type detachable ET_LOCAL_VARIABLE_ITEM

	yyvsc92: INTEGER
			-- Capacity of semantic value stack `yyvs92'

	yyvsp92: INTEGER
			-- Top of semantic value stack `yyvs92'

	yyspecial_routines92: KL_SPECIAL_ROUTINES [detachable ET_LOCAL_VARIABLE_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_LOCAL_VARIABLE_ITEM]

	yyvs93: SPECIAL [detachable ET_LOCAL_VARIABLE_LIST]
			-- Stack for semantic values of type detachable ET_LOCAL_VARIABLE_LIST

	yyvsc93: INTEGER
			-- Capacity of semantic value stack `yyvs93'

	yyvsp93: INTEGER
			-- Top of semantic value stack `yyvs93'

	yyspecial_routines93: KL_SPECIAL_ROUTINES [detachable ET_LOCAL_VARIABLE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_LOCAL_VARIABLE_LIST]

	yyvs94: SPECIAL [detachable ET_LOOP_INVARIANTS]
			-- Stack for semantic values of type detachable ET_LOOP_INVARIANTS

	yyvsc94: INTEGER
			-- Capacity of semantic value stack `yyvs94'

	yyvsp94: INTEGER
			-- Top of semantic value stack `yyvs94'

	yyspecial_routines94: KL_SPECIAL_ROUTINES [detachable ET_LOOP_INVARIANTS]
			-- Routines that ought to be in SPECIAL [detachable ET_LOOP_INVARIANTS]

	yyvs95: SPECIAL [detachable ET_MANIFEST_ARRAY]
			-- Stack for semantic values of type detachable ET_MANIFEST_ARRAY

	yyvsc95: INTEGER
			-- Capacity of semantic value stack `yyvs95'

	yyvsp95: INTEGER
			-- Top of semantic value stack `yyvs95'

	yyspecial_routines95: KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_ARRAY]
			-- Routines that ought to be in SPECIAL [detachable ET_MANIFEST_ARRAY]

	yyvs96: SPECIAL [detachable ET_MANIFEST_STRING_ITEM]
			-- Stack for semantic values of type detachable ET_MANIFEST_STRING_ITEM

	yyvsc96: INTEGER
			-- Capacity of semantic value stack `yyvs96'

	yyvsp96: INTEGER
			-- Top of semantic value stack `yyvs96'

	yyspecial_routines96: KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_STRING_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_MANIFEST_STRING_ITEM]

	yyvs97: SPECIAL [detachable ET_MANIFEST_STRING_LIST]
			-- Stack for semantic values of type detachable ET_MANIFEST_STRING_LIST

	yyvsc97: INTEGER
			-- Capacity of semantic value stack `yyvs97'

	yyvsp97: INTEGER
			-- Top of semantic value stack `yyvs97'

	yyspecial_routines97: KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_STRING_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_MANIFEST_STRING_LIST]

	yyvs98: SPECIAL [detachable ET_MANIFEST_TUPLE]
			-- Stack for semantic values of type detachable ET_MANIFEST_TUPLE

	yyvsc98: INTEGER
			-- Capacity of semantic value stack `yyvs98'

	yyvsp98: INTEGER
			-- Top of semantic value stack `yyvs98'

	yyspecial_routines98: KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_TUPLE]
			-- Routines that ought to be in SPECIAL [detachable ET_MANIFEST_TUPLE]

	yyvs99: SPECIAL [detachable ET_OBSOLETE]
			-- Stack for semantic values of type detachable ET_OBSOLETE

	yyvsc99: INTEGER
			-- Capacity of semantic value stack `yyvs99'

	yyvsp99: INTEGER
			-- Top of semantic value stack `yyvs99'

	yyspecial_routines99: KL_SPECIAL_ROUTINES [detachable ET_OBSOLETE]
			-- Routines that ought to be in SPECIAL [detachable ET_OBSOLETE]

	yyvs100: SPECIAL [detachable ET_PARENTHESIZED_EXPRESSION]
			-- Stack for semantic values of type detachable ET_PARENTHESIZED_EXPRESSION

	yyvsc100: INTEGER
			-- Capacity of semantic value stack `yyvs100'

	yyvsp100: INTEGER
			-- Top of semantic value stack `yyvs100'

	yyspecial_routines100: KL_SPECIAL_ROUTINES [detachable ET_PARENTHESIZED_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_PARENTHESIZED_EXPRESSION]

	yyvs101: SPECIAL [detachable ET_PARENT]
			-- Stack for semantic values of type detachable ET_PARENT

	yyvsc101: INTEGER
			-- Capacity of semantic value stack `yyvs101'

	yyvsp101: INTEGER
			-- Top of semantic value stack `yyvs101'

	yyspecial_routines101: KL_SPECIAL_ROUTINES [detachable ET_PARENT]
			-- Routines that ought to be in SPECIAL [detachable ET_PARENT]

	yyvs102: SPECIAL [detachable ET_PARENT_CLAUSE_LIST]
			-- Stack for semantic values of type detachable ET_PARENT_CLAUSE_LIST

	yyvsc102: INTEGER
			-- Capacity of semantic value stack `yyvs102'

	yyvsp102: INTEGER
			-- Top of semantic value stack `yyvs102'

	yyspecial_routines102: KL_SPECIAL_ROUTINES [detachable ET_PARENT_CLAUSE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_PARENT_CLAUSE_LIST]

	yyvs103: SPECIAL [detachable ET_PARENT_ITEM]
			-- Stack for semantic values of type detachable ET_PARENT_ITEM

	yyvsc103: INTEGER
			-- Capacity of semantic value stack `yyvs103'

	yyvsp103: INTEGER
			-- Top of semantic value stack `yyvs103'

	yyspecial_routines103: KL_SPECIAL_ROUTINES [detachable ET_PARENT_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_PARENT_ITEM]

	yyvs104: SPECIAL [detachable ET_PARENT_LIST]
			-- Stack for semantic values of type detachable ET_PARENT_LIST

	yyvsc104: INTEGER
			-- Capacity of semantic value stack `yyvs104'

	yyvsp104: INTEGER
			-- Top of semantic value stack `yyvs104'

	yyspecial_routines104: KL_SPECIAL_ROUTINES [detachable ET_PARENT_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_PARENT_LIST]

	yyvs105: SPECIAL [detachable ET_POSTCONDITIONS]
			-- Stack for semantic values of type detachable ET_POSTCONDITIONS

	yyvsc105: INTEGER
			-- Capacity of semantic value stack `yyvs105'

	yyvsp105: INTEGER
			-- Top of semantic value stack `yyvs105'

	yyspecial_routines105: KL_SPECIAL_ROUTINES [detachable ET_POSTCONDITIONS]
			-- Routines that ought to be in SPECIAL [detachable ET_POSTCONDITIONS]

	yyvs106: SPECIAL [detachable ET_PRECONDITIONS]
			-- Stack for semantic values of type detachable ET_PRECONDITIONS

	yyvsc106: INTEGER
			-- Capacity of semantic value stack `yyvs106'

	yyvsp106: INTEGER
			-- Top of semantic value stack `yyvs106'

	yyspecial_routines106: KL_SPECIAL_ROUTINES [detachable ET_PRECONDITIONS]
			-- Routines that ought to be in SPECIAL [detachable ET_PRECONDITIONS]

	yyvs107: SPECIAL [detachable ET_PROCEDURE]
			-- Stack for semantic values of type detachable ET_PROCEDURE

	yyvsc107: INTEGER
			-- Capacity of semantic value stack `yyvs107'

	yyvsp107: INTEGER
			-- Top of semantic value stack `yyvs107'

	yyspecial_routines107: KL_SPECIAL_ROUTINES [detachable ET_PROCEDURE]
			-- Routines that ought to be in SPECIAL [detachable ET_PROCEDURE]

	yyvs108: SPECIAL [detachable ET_QUALIFIED_LIKE_IDENTIFIER]
			-- Stack for semantic values of type detachable ET_QUALIFIED_LIKE_IDENTIFIER

	yyvsc108: INTEGER
			-- Capacity of semantic value stack `yyvs108'

	yyvsp108: INTEGER
			-- Top of semantic value stack `yyvs108'

	yyspecial_routines108: KL_SPECIAL_ROUTINES [detachable ET_QUALIFIED_LIKE_IDENTIFIER]
			-- Routines that ought to be in SPECIAL [detachable ET_QUALIFIED_LIKE_IDENTIFIER]

	yyvs109: SPECIAL [detachable ET_QUERY]
			-- Stack for semantic values of type detachable ET_QUERY

	yyvsc109: INTEGER
			-- Capacity of semantic value stack `yyvs109'

	yyvsp109: INTEGER
			-- Top of semantic value stack `yyvs109'

	yyspecial_routines109: KL_SPECIAL_ROUTINES [detachable ET_QUERY]
			-- Routines that ought to be in SPECIAL [detachable ET_QUERY]

	yyvs110: SPECIAL [detachable ET_RENAME_ITEM]
			-- Stack for semantic values of type detachable ET_RENAME_ITEM

	yyvsc110: INTEGER
			-- Capacity of semantic value stack `yyvs110'

	yyvsp110: INTEGER
			-- Top of semantic value stack `yyvs110'

	yyspecial_routines110: KL_SPECIAL_ROUTINES [detachable ET_RENAME_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_RENAME_ITEM]

	yyvs111: SPECIAL [detachable ET_RENAME_LIST]
			-- Stack for semantic values of type detachable ET_RENAME_LIST

	yyvsc111: INTEGER
			-- Capacity of semantic value stack `yyvs111'

	yyvsp111: INTEGER
			-- Top of semantic value stack `yyvs111'

	yyspecial_routines111: KL_SPECIAL_ROUTINES [detachable ET_RENAME_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_RENAME_LIST]

	yyvs112: SPECIAL [detachable ET_STATIC_CALL_EXPRESSION]
			-- Stack for semantic values of type detachable ET_STATIC_CALL_EXPRESSION

	yyvsc112: INTEGER
			-- Capacity of semantic value stack `yyvs112'

	yyvsp112: INTEGER
			-- Top of semantic value stack `yyvs112'

	yyspecial_routines112: KL_SPECIAL_ROUTINES [detachable ET_STATIC_CALL_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_STATIC_CALL_EXPRESSION]

	yyvs113: SPECIAL [detachable ET_STRIP_EXPRESSION]
			-- Stack for semantic values of type detachable ET_STRIP_EXPRESSION

	yyvsc113: INTEGER
			-- Capacity of semantic value stack `yyvs113'

	yyvsp113: INTEGER
			-- Top of semantic value stack `yyvs113'

	yyspecial_routines113: KL_SPECIAL_ROUTINES [detachable ET_STRIP_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_STRIP_EXPRESSION]

	yyvs114: SPECIAL [detachable ET_TYPE]
			-- Stack for semantic values of type detachable ET_TYPE

	yyvsc114: INTEGER
			-- Capacity of semantic value stack `yyvs114'

	yyvsp114: INTEGER
			-- Top of semantic value stack `yyvs114'

	yyspecial_routines114: KL_SPECIAL_ROUTINES [detachable ET_TYPE]
			-- Routines that ought to be in SPECIAL [detachable ET_TYPE]

	yyvs115: SPECIAL [detachable ET_TYPE_ITEM]
			-- Stack for semantic values of type detachable ET_TYPE_ITEM

	yyvsc115: INTEGER
			-- Capacity of semantic value stack `yyvs115'

	yyvsp115: INTEGER
			-- Top of semantic value stack `yyvs115'

	yyspecial_routines115: KL_SPECIAL_ROUTINES [detachable ET_TYPE_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_TYPE_ITEM]

	yyvs116: SPECIAL [detachable ET_TYPE_LIST]
			-- Stack for semantic values of type detachable ET_TYPE_LIST

	yyvsc116: INTEGER
			-- Capacity of semantic value stack `yyvs116'

	yyvsp116: INTEGER
			-- Top of semantic value stack `yyvs116'

	yyspecial_routines116: KL_SPECIAL_ROUTINES [detachable ET_TYPE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_TYPE_LIST]

	yyvs117: SPECIAL [detachable ET_VARIANT]
			-- Stack for semantic values of type detachable ET_VARIANT

	yyvsc117: INTEGER
			-- Capacity of semantic value stack `yyvs117'

	yyvsp117: INTEGER
			-- Top of semantic value stack `yyvs117'

	yyspecial_routines117: KL_SPECIAL_ROUTINES [detachable ET_VARIANT]
			-- Routines that ought to be in SPECIAL [detachable ET_VARIANT]

	yyvs118: SPECIAL [detachable ET_WHEN_PART]
			-- Stack for semantic values of type detachable ET_WHEN_PART

	yyvsc118: INTEGER
			-- Capacity of semantic value stack `yyvs118'

	yyvsp118: INTEGER
			-- Top of semantic value stack `yyvs118'

	yyspecial_routines118: KL_SPECIAL_ROUTINES [detachable ET_WHEN_PART]
			-- Routines that ought to be in SPECIAL [detachable ET_WHEN_PART]

	yyvs119: SPECIAL [detachable ET_WHEN_PART_LIST]
			-- Stack for semantic values of type detachable ET_WHEN_PART_LIST

	yyvsc119: INTEGER
			-- Capacity of semantic value stack `yyvs119'

	yyvsp119: INTEGER
			-- Top of semantic value stack `yyvs119'

	yyspecial_routines119: KL_SPECIAL_ROUTINES [detachable ET_WHEN_PART_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_WHEN_PART_LIST]

	yyvs120: SPECIAL [detachable ET_WRITABLE]
			-- Stack for semantic values of type detachable ET_WRITABLE

	yyvsc120: INTEGER
			-- Capacity of semantic value stack `yyvs120'

	yyvsp120: INTEGER
			-- Top of semantic value stack `yyvs120'

	yyspecial_routines120: KL_SPECIAL_ROUTINES [detachable ET_WRITABLE]
			-- Routines that ought to be in SPECIAL [detachable ET_WRITABLE]

feature {NONE} -- Constants

	yyFinal: INTEGER = 1708
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 143
			-- Number of tokens

	yyLast: INTEGER = 6888
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 375
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 424
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Access

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

feature -- Parsing

	yyparse
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
						if (yystate >= 0 and yystate <= yyLast) and then yycheck.item (yystate) = yyss_top then
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
						yyss := SPECIAL_INTEGER_.aliased_resized_area (yyss, yystacksize)
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
					SPECIAL_INTEGER_.force (yyss, yystate, yyssp)
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
						if (yyn < 0 or yyn > yyLast) or else yycheck.item (yyn) /= yychar1 then
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
						if (yystate >= 0 and yystate <= yyLast) and then yycheck.item (yystate) = yyss_top then
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
						if (yyn < 0 or yyn > yyLast) or else yycheck.item (yyn) /= yyTerror then
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
