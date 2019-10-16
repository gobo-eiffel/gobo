note

	description:

		"Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_PARSER

inherit

	ET_EIFFEL_PARSER_SKELETON
		undefine
			read_token
		redefine
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
			create yyspecial_routines121
			yyvsc121 := yyInitial_yyvs_size
			yyvs121 := yyspecial_routines121.make (yyvsc121)
			create yyspecial_routines122
			yyvsc122 := yyInitial_yyvs_size
			yyvs122 := yyspecial_routines122.make (yyvsc122)
			create yyspecial_routines123
			yyvsc123 := yyInitial_yyvs_size
			yyvs123 := yyspecial_routines123.make (yyvsc123)
			create yyspecial_routines124
			yyvsc124 := yyInitial_yyvs_size
			yyvs124 := yyspecial_routines124.make (yyvsc124)
			create yyspecial_routines125
			yyvsc125 := yyInitial_yyvs_size
			yyvs125 := yyspecial_routines125.make (yyvsc125)
			create yyspecial_routines126
			yyvsc126 := yyInitial_yyvs_size
			yyvs126 := yyspecial_routines126.make (yyvsc126)
			create yyspecial_routines127
			yyvsc127 := yyInitial_yyvs_size
			yyvs127 := yyspecial_routines127.make (yyvsc127)
			create yyspecial_routines128
			yyvsc128 := yyInitial_yyvs_size
			yyvs128 := yyspecial_routines128.make (yyvsc128)
			create yyspecial_routines129
			yyvsc129 := yyInitial_yyvs_size
			yyvs129 := yyspecial_routines129.make (yyvsc129)
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
			yyvsp121 := -1
			yyvsp122 := -1
			yyvsp123 := -1
			yyvsp124 := -1
			yyvsp125 := -1
			yyvsp126 := -1
			yyvsp127 := -1
			yyvsp128 := -1
			yyvsp129 := -1
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
			yyvs121.keep_head (0)
			yyvs122.keep_head (0)
			yyvs123.keep_head (0)
			yyvs124.keep_head (0)
			yyvs125.keep_head (0)
			yyvs126.keep_head (0)
			yyvs127.keep_head (0)
			yyvs128.keep_head (0)
			yyvs129.keep_head (0)
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
			when 121 then
				yyvsp121 := yyvsp121 - 1
			when 122 then
				yyvsp122 := yyvsp122 - 1
			when 123 then
				yyvsp123 := yyvsp123 - 1
			when 124 then
				yyvsp124 := yyvsp124 - 1
			when 125 then
				yyvsp125 := yyvsp125 - 1
			when 126 then
				yyvsp126 := yyvsp126 - 1
			when 127 then
				yyvsp127 := yyvsp127 - 1
			when 128 then
				yyvsp128 := yyvsp128 - 1
			when 129 then
				yyvsp129 := yyvsp129 - 1
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
					--|#line 242 "et_eiffel_parser.y"
				yy_do_action_1
			when 2 then
					--|#line 246 "et_eiffel_parser.y"
				yy_do_action_2
			when 3 then
					--|#line 254 "et_eiffel_parser.y"
				yy_do_action_3
			when 4 then
					--|#line 263 "et_eiffel_parser.y"
				yy_do_action_4
			when 5 then
					--|#line 264 "et_eiffel_parser.y"
				yy_do_action_5
			when 6 then
					--|#line 264 "et_eiffel_parser.y"
				yy_do_action_6
			when 7 then
					--|#line 275 "et_eiffel_parser.y"
				yy_do_action_7
			when 8 then
					--|#line 283 "et_eiffel_parser.y"
				yy_do_action_8
			when 9 then
					--|#line 288 "et_eiffel_parser.y"
				yy_do_action_9
			when 10 then
					--|#line 290 "et_eiffel_parser.y"
				yy_do_action_10
			when 11 then
					--|#line 290 "et_eiffel_parser.y"
				yy_do_action_11
			when 12 then
					--|#line 301 "et_eiffel_parser.y"
				yy_do_action_12
			when 13 then
					--|#line 303 "et_eiffel_parser.y"
				yy_do_action_13
			when 14 then
					--|#line 303 "et_eiffel_parser.y"
				yy_do_action_14
			when 15 then
					--|#line 316 "et_eiffel_parser.y"
				yy_do_action_15
			when 16 then
					--|#line 318 "et_eiffel_parser.y"
				yy_do_action_16
			when 17 then
					--|#line 322 "et_eiffel_parser.y"
				yy_do_action_17
			when 18 then
					--|#line 333 "et_eiffel_parser.y"
				yy_do_action_18
			when 19 then
					--|#line 333 "et_eiffel_parser.y"
				yy_do_action_19
			when 20 then
					--|#line 342 "et_eiffel_parser.y"
				yy_do_action_20
			when 21 then
					--|#line 342 "et_eiffel_parser.y"
				yy_do_action_21
			when 22 then
					--|#line 353 "et_eiffel_parser.y"
				yy_do_action_22
			when 23 then
					--|#line 360 "et_eiffel_parser.y"
				yy_do_action_23
			when 24 then
					--|#line 366 "et_eiffel_parser.y"
				yy_do_action_24
			when 25 then
					--|#line 370 "et_eiffel_parser.y"
				yy_do_action_25
			when 26 then
					--|#line 381 "et_eiffel_parser.y"
				yy_do_action_26
			when 27 then
					--|#line 393 "et_eiffel_parser.y"
				yy_do_action_27
			when 28 then
					--|#line 393 "et_eiffel_parser.y"
				yy_do_action_28
			when 29 then
					--|#line 402 "et_eiffel_parser.y"
				yy_do_action_29
			when 30 then
					--|#line 402 "et_eiffel_parser.y"
				yy_do_action_30
			when 31 then
					--|#line 413 "et_eiffel_parser.y"
				yy_do_action_31
			when 32 then
					--|#line 420 "et_eiffel_parser.y"
				yy_do_action_32
			when 33 then
					--|#line 424 "et_eiffel_parser.y"
				yy_do_action_33
			when 34 then
					--|#line 430 "et_eiffel_parser.y"
				yy_do_action_34
			when 35 then
					--|#line 432 "et_eiffel_parser.y"
				yy_do_action_35
			when 36 then
					--|#line 437 "et_eiffel_parser.y"
				yy_do_action_36
			when 37 then
					--|#line 448 "et_eiffel_parser.y"
				yy_do_action_37
			when 38 then
					--|#line 457 "et_eiffel_parser.y"
				yy_do_action_38
			when 39 then
					--|#line 459 "et_eiffel_parser.y"
				yy_do_action_39
			when 40 then
					--|#line 461 "et_eiffel_parser.y"
				yy_do_action_40
			when 41 then
					--|#line 463 "et_eiffel_parser.y"
				yy_do_action_41
			when 42 then
					--|#line 465 "et_eiffel_parser.y"
				yy_do_action_42
			when 43 then
					--|#line 467 "et_eiffel_parser.y"
				yy_do_action_43
			when 44 then
					--|#line 469 "et_eiffel_parser.y"
				yy_do_action_44
			when 45 then
					--|#line 471 "et_eiffel_parser.y"
				yy_do_action_45
			when 46 then
					--|#line 475 "et_eiffel_parser.y"
				yy_do_action_46
			when 47 then
					--|#line 486 "et_eiffel_parser.y"
				yy_do_action_47
			when 48 then
					--|#line 498 "et_eiffel_parser.y"
				yy_do_action_48
			when 49 then
					--|#line 511 "et_eiffel_parser.y"
				yy_do_action_49
			when 50 then
					--|#line 524 "et_eiffel_parser.y"
				yy_do_action_50
			when 51 then
					--|#line 539 "et_eiffel_parser.y"
				yy_do_action_51
			when 52 then
					--|#line 541 "et_eiffel_parser.y"
				yy_do_action_52
			when 53 then
					--|#line 545 "et_eiffel_parser.y"
				yy_do_action_53
			when 54 then
					--|#line 547 "et_eiffel_parser.y"
				yy_do_action_54
			when 55 then
					--|#line 553 "et_eiffel_parser.y"
				yy_do_action_55
			when 56 then
					--|#line 557 "et_eiffel_parser.y"
				yy_do_action_56
			when 57 then
					--|#line 563 "et_eiffel_parser.y"
				yy_do_action_57
			when 58 then
					--|#line 563 "et_eiffel_parser.y"
				yy_do_action_58
			when 59 then
					--|#line 577 "et_eiffel_parser.y"
				yy_do_action_59
			when 60 then
					--|#line 588 "et_eiffel_parser.y"
				yy_do_action_60
			when 61 then
					--|#line 597 "et_eiffel_parser.y"
				yy_do_action_61
			when 62 then
					--|#line 606 "et_eiffel_parser.y"
				yy_do_action_62
			when 63 then
					--|#line 608 "et_eiffel_parser.y"
				yy_do_action_63
			when 64 then
					--|#line 610 "et_eiffel_parser.y"
				yy_do_action_64
			when 65 then
					--|#line 612 "et_eiffel_parser.y"
				yy_do_action_65
			when 66 then
					--|#line 614 "et_eiffel_parser.y"
				yy_do_action_66
			when 67 then
					--|#line 616 "et_eiffel_parser.y"
				yy_do_action_67
			when 68 then
					--|#line 618 "et_eiffel_parser.y"
				yy_do_action_68
			when 69 then
					--|#line 620 "et_eiffel_parser.y"
				yy_do_action_69
			when 70 then
					--|#line 622 "et_eiffel_parser.y"
				yy_do_action_70
			when 71 then
					--|#line 626 "et_eiffel_parser.y"
				yy_do_action_71
			when 72 then
					--|#line 633 "et_eiffel_parser.y"
				yy_do_action_72
			when 73 then
					--|#line 642 "et_eiffel_parser.y"
				yy_do_action_73
			when 74 then
					--|#line 642 "et_eiffel_parser.y"
				yy_do_action_74
			when 75 then
					--|#line 655 "et_eiffel_parser.y"
				yy_do_action_75
			when 76 then
					--|#line 666 "et_eiffel_parser.y"
				yy_do_action_76
			when 77 then
					--|#line 675 "et_eiffel_parser.y"
				yy_do_action_77
			when 78 then
					--|#line 684 "et_eiffel_parser.y"
				yy_do_action_78
			when 79 then
					--|#line 686 "et_eiffel_parser.y"
				yy_do_action_79
			when 80 then
					--|#line 686 "et_eiffel_parser.y"
				yy_do_action_80
			when 81 then
					--|#line 699 "et_eiffel_parser.y"
				yy_do_action_81
			when 82 then
					--|#line 710 "et_eiffel_parser.y"
				yy_do_action_82
			when 83 then
					--|#line 719 "et_eiffel_parser.y"
				yy_do_action_83
			when 84 then
					--|#line 728 "et_eiffel_parser.y"
				yy_do_action_84
			when 85 then
					--|#line 730 "et_eiffel_parser.y"
				yy_do_action_85
			when 86 then
					--|#line 734 "et_eiffel_parser.y"
				yy_do_action_86
			when 87 then
					--|#line 736 "et_eiffel_parser.y"
				yy_do_action_87
			when 88 then
					--|#line 736 "et_eiffel_parser.y"
				yy_do_action_88
			when 89 then
					--|#line 749 "et_eiffel_parser.y"
				yy_do_action_89
			when 90 then
					--|#line 761 "et_eiffel_parser.y"
				yy_do_action_90
			when 91 then
					--|#line 769 "et_eiffel_parser.y"
				yy_do_action_91
			when 92 then
					--|#line 778 "et_eiffel_parser.y"
				yy_do_action_92
			when 93 then
					--|#line 780 "et_eiffel_parser.y"
				yy_do_action_93
			when 94 then
					--|#line 782 "et_eiffel_parser.y"
				yy_do_action_94
			when 95 then
					--|#line 784 "et_eiffel_parser.y"
				yy_do_action_95
			when 96 then
					--|#line 786 "et_eiffel_parser.y"
				yy_do_action_96
			when 97 then
					--|#line 788 "et_eiffel_parser.y"
				yy_do_action_97
			when 98 then
					--|#line 790 "et_eiffel_parser.y"
				yy_do_action_98
			when 99 then
					--|#line 792 "et_eiffel_parser.y"
				yy_do_action_99
			when 100 then
					--|#line 794 "et_eiffel_parser.y"
				yy_do_action_100
			when 101 then
					--|#line 796 "et_eiffel_parser.y"
				yy_do_action_101
			when 102 then
					--|#line 798 "et_eiffel_parser.y"
				yy_do_action_102
			when 103 then
					--|#line 800 "et_eiffel_parser.y"
				yy_do_action_103
			when 104 then
					--|#line 802 "et_eiffel_parser.y"
				yy_do_action_104
			when 105 then
					--|#line 804 "et_eiffel_parser.y"
				yy_do_action_105
			when 106 then
					--|#line 806 "et_eiffel_parser.y"
				yy_do_action_106
			when 107 then
					--|#line 808 "et_eiffel_parser.y"
				yy_do_action_107
			when 108 then
					--|#line 810 "et_eiffel_parser.y"
				yy_do_action_108
			when 109 then
					--|#line 812 "et_eiffel_parser.y"
				yy_do_action_109
			when 110 then
					--|#line 814 "et_eiffel_parser.y"
				yy_do_action_110
			when 111 then
					--|#line 816 "et_eiffel_parser.y"
				yy_do_action_111
			when 112 then
					--|#line 818 "et_eiffel_parser.y"
				yy_do_action_112
			when 113 then
					--|#line 820 "et_eiffel_parser.y"
				yy_do_action_113
			when 114 then
					--|#line 824 "et_eiffel_parser.y"
				yy_do_action_114
			when 115 then
					--|#line 826 "et_eiffel_parser.y"
				yy_do_action_115
			when 116 then
					--|#line 828 "et_eiffel_parser.y"
				yy_do_action_116
			when 117 then
					--|#line 830 "et_eiffel_parser.y"
				yy_do_action_117
			when 118 then
					--|#line 832 "et_eiffel_parser.y"
				yy_do_action_118
			when 119 then
					--|#line 834 "et_eiffel_parser.y"
				yy_do_action_119
			when 120 then
					--|#line 836 "et_eiffel_parser.y"
				yy_do_action_120
			when 121 then
					--|#line 838 "et_eiffel_parser.y"
				yy_do_action_121
			when 122 then
					--|#line 840 "et_eiffel_parser.y"
				yy_do_action_122
			when 123 then
					--|#line 842 "et_eiffel_parser.y"
				yy_do_action_123
			when 124 then
					--|#line 844 "et_eiffel_parser.y"
				yy_do_action_124
			when 125 then
					--|#line 846 "et_eiffel_parser.y"
				yy_do_action_125
			when 126 then
					--|#line 848 "et_eiffel_parser.y"
				yy_do_action_126
			when 127 then
					--|#line 850 "et_eiffel_parser.y"
				yy_do_action_127
			when 128 then
					--|#line 852 "et_eiffel_parser.y"
				yy_do_action_128
			when 129 then
					--|#line 854 "et_eiffel_parser.y"
				yy_do_action_129
			when 130 then
					--|#line 856 "et_eiffel_parser.y"
				yy_do_action_130
			when 131 then
					--|#line 858 "et_eiffel_parser.y"
				yy_do_action_131
			when 132 then
					--|#line 860 "et_eiffel_parser.y"
				yy_do_action_132
			when 133 then
					--|#line 862 "et_eiffel_parser.y"
				yy_do_action_133
			when 134 then
					--|#line 864 "et_eiffel_parser.y"
				yy_do_action_134
			when 135 then
					--|#line 866 "et_eiffel_parser.y"
				yy_do_action_135
			when 136 then
					--|#line 870 "et_eiffel_parser.y"
				yy_do_action_136
			when 137 then
					--|#line 872 "et_eiffel_parser.y"
				yy_do_action_137
			when 138 then
					--|#line 876 "et_eiffel_parser.y"
				yy_do_action_138
			when 139 then
					--|#line 879 "et_eiffel_parser.y"
				yy_do_action_139
			when 140 then
					--|#line 887 "et_eiffel_parser.y"
				yy_do_action_140
			when 141 then
					--|#line 898 "et_eiffel_parser.y"
				yy_do_action_141
			when 142 then
					--|#line 903 "et_eiffel_parser.y"
				yy_do_action_142
			when 143 then
					--|#line 910 "et_eiffel_parser.y"
				yy_do_action_143
			when 144 then
					--|#line 919 "et_eiffel_parser.y"
				yy_do_action_144
			when 145 then
					--|#line 921 "et_eiffel_parser.y"
				yy_do_action_145
			when 146 then
					--|#line 925 "et_eiffel_parser.y"
				yy_do_action_146
			when 147 then
					--|#line 928 "et_eiffel_parser.y"
				yy_do_action_147
			when 148 then
					--|#line 934 "et_eiffel_parser.y"
				yy_do_action_148
			when 149 then
					--|#line 942 "et_eiffel_parser.y"
				yy_do_action_149
			when 150 then
					--|#line 947 "et_eiffel_parser.y"
				yy_do_action_150
			when 151 then
					--|#line 952 "et_eiffel_parser.y"
				yy_do_action_151
			when 152 then
					--|#line 957 "et_eiffel_parser.y"
				yy_do_action_152
			when 153 then
					--|#line 970 "et_eiffel_parser.y"
				yy_do_action_153
			when 154 then
					--|#line 979 "et_eiffel_parser.y"
				yy_do_action_154
			when 155 then
					--|#line 990 "et_eiffel_parser.y"
				yy_do_action_155
			when 156 then
					--|#line 992 "et_eiffel_parser.y"
				yy_do_action_156
			when 157 then
					--|#line 998 "et_eiffel_parser.y"
				yy_do_action_157
			when 158 then
					--|#line 1000 "et_eiffel_parser.y"
				yy_do_action_158
			when 159 then
					--|#line 1007 "et_eiffel_parser.y"
				yy_do_action_159
			when 160 then
					--|#line 1018 "et_eiffel_parser.y"
				yy_do_action_160
			when 161 then
					--|#line 1018 "et_eiffel_parser.y"
				yy_do_action_161
			when 162 then
					--|#line 1033 "et_eiffel_parser.y"
				yy_do_action_162
			when 163 then
					--|#line 1040 "et_eiffel_parser.y"
				yy_do_action_163
			when 164 then
					--|#line 1040 "et_eiffel_parser.y"
				yy_do_action_164
			when 165 then
					--|#line 1056 "et_eiffel_parser.y"
				yy_do_action_165
			when 166 then
					--|#line 1063 "et_eiffel_parser.y"
				yy_do_action_166
			when 167 then
					--|#line 1071 "et_eiffel_parser.y"
				yy_do_action_167
			when 168 then
					--|#line 1078 "et_eiffel_parser.y"
				yy_do_action_168
			when 169 then
					--|#line 1085 "et_eiffel_parser.y"
				yy_do_action_169
			when 170 then
					--|#line 1092 "et_eiffel_parser.y"
				yy_do_action_170
			when 171 then
					--|#line 1101 "et_eiffel_parser.y"
				yy_do_action_171
			when 172 then
					--|#line 1108 "et_eiffel_parser.y"
				yy_do_action_172
			when 173 then
					--|#line 1115 "et_eiffel_parser.y"
				yy_do_action_173
			when 174 then
					--|#line 1122 "et_eiffel_parser.y"
				yy_do_action_174
			when 175 then
					--|#line 1131 "et_eiffel_parser.y"
				yy_do_action_175
			when 176 then
					--|#line 1142 "et_eiffel_parser.y"
				yy_do_action_176
			when 177 then
					--|#line 1144 "et_eiffel_parser.y"
				yy_do_action_177
			when 178 then
					--|#line 1144 "et_eiffel_parser.y"
				yy_do_action_178
			when 179 then
					--|#line 1157 "et_eiffel_parser.y"
				yy_do_action_179
			when 180 then
					--|#line 1164 "et_eiffel_parser.y"
				yy_do_action_180
			when 181 then
					--|#line 1173 "et_eiffel_parser.y"
				yy_do_action_181
			when 182 then
					--|#line 1182 "et_eiffel_parser.y"
				yy_do_action_182
			when 183 then
					--|#line 1191 "et_eiffel_parser.y"
				yy_do_action_183
			when 184 then
					--|#line 1202 "et_eiffel_parser.y"
				yy_do_action_184
			when 185 then
					--|#line 1204 "et_eiffel_parser.y"
				yy_do_action_185
			when 186 then
					--|#line 1204 "et_eiffel_parser.y"
				yy_do_action_186
			when 187 then
					--|#line 1217 "et_eiffel_parser.y"
				yy_do_action_187
			when 188 then
					--|#line 1219 "et_eiffel_parser.y"
				yy_do_action_188
			when 189 then
					--|#line 1223 "et_eiffel_parser.y"
				yy_do_action_189
			when 190 then
					--|#line 1234 "et_eiffel_parser.y"
				yy_do_action_190
			when 191 then
					--|#line 1234 "et_eiffel_parser.y"
				yy_do_action_191
			when 192 then
					--|#line 1249 "et_eiffel_parser.y"
				yy_do_action_192
			when 193 then
					--|#line 1253 "et_eiffel_parser.y"
				yy_do_action_193
			when 194 then
					--|#line 1258 "et_eiffel_parser.y"
				yy_do_action_194
			when 195 then
					--|#line 1258 "et_eiffel_parser.y"
				yy_do_action_195
			when 196 then
					--|#line 1268 "et_eiffel_parser.y"
				yy_do_action_196
			when 197 then
					--|#line 1272 "et_eiffel_parser.y"
				yy_do_action_197
			when 198 then
					--|#line 1283 "et_eiffel_parser.y"
				yy_do_action_198
			when 199 then
					--|#line 1291 "et_eiffel_parser.y"
				yy_do_action_199
			when 200 then
					--|#line 1302 "et_eiffel_parser.y"
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
					--|#line 1302 "et_eiffel_parser.y"
				yy_do_action_201
			when 202 then
					--|#line 1313 "et_eiffel_parser.y"
				yy_do_action_202
			when 203 then
					--|#line 1317 "et_eiffel_parser.y"
				yy_do_action_203
			when 204 then
					--|#line 1324 "et_eiffel_parser.y"
				yy_do_action_204
			when 205 then
					--|#line 1332 "et_eiffel_parser.y"
				yy_do_action_205
			when 206 then
					--|#line 1339 "et_eiffel_parser.y"
				yy_do_action_206
			when 207 then
					--|#line 1349 "et_eiffel_parser.y"
				yy_do_action_207
			when 208 then
					--|#line 1358 "et_eiffel_parser.y"
				yy_do_action_208
			when 209 then
					--|#line 1368 "et_eiffel_parser.y"
				yy_do_action_209
			when 210 then
					--|#line 1370 "et_eiffel_parser.y"
				yy_do_action_210
			when 211 then
					--|#line 1374 "et_eiffel_parser.y"
				yy_do_action_211
			when 212 then
					--|#line 1385 "et_eiffel_parser.y"
				yy_do_action_212
			when 213 then
					--|#line 1387 "et_eiffel_parser.y"
				yy_do_action_213
			when 214 then
					--|#line 1387 "et_eiffel_parser.y"
				yy_do_action_214
			when 215 then
					--|#line 1400 "et_eiffel_parser.y"
				yy_do_action_215
			when 216 then
					--|#line 1402 "et_eiffel_parser.y"
				yy_do_action_216
			when 217 then
					--|#line 1406 "et_eiffel_parser.y"
				yy_do_action_217
			when 218 then
					--|#line 1408 "et_eiffel_parser.y"
				yy_do_action_218
			when 219 then
					--|#line 1408 "et_eiffel_parser.y"
				yy_do_action_219
			when 220 then
					--|#line 1421 "et_eiffel_parser.y"
				yy_do_action_220
			when 221 then
					--|#line 1423 "et_eiffel_parser.y"
				yy_do_action_221
			when 222 then
					--|#line 1427 "et_eiffel_parser.y"
				yy_do_action_222
			when 223 then
					--|#line 1429 "et_eiffel_parser.y"
				yy_do_action_223
			when 224 then
					--|#line 1429 "et_eiffel_parser.y"
				yy_do_action_224
			when 225 then
					--|#line 1442 "et_eiffel_parser.y"
				yy_do_action_225
			when 226 then
					--|#line 1444 "et_eiffel_parser.y"
				yy_do_action_226
			when 227 then
					--|#line 1448 "et_eiffel_parser.y"
				yy_do_action_227
			when 228 then
					--|#line 1459 "et_eiffel_parser.y"
				yy_do_action_228
			when 229 then
					--|#line 1467 "et_eiffel_parser.y"
				yy_do_action_229
			when 230 then
					--|#line 1476 "et_eiffel_parser.y"
				yy_do_action_230
			when 231 then
					--|#line 1487 "et_eiffel_parser.y"
				yy_do_action_231
			when 232 then
					--|#line 1489 "et_eiffel_parser.y"
				yy_do_action_232
			when 233 then
					--|#line 1496 "et_eiffel_parser.y"
				yy_do_action_233
			when 234 then
					--|#line 1507 "et_eiffel_parser.y"
				yy_do_action_234
			when 235 then
					--|#line 1507 "et_eiffel_parser.y"
				yy_do_action_235
			when 236 then
					--|#line 1522 "et_eiffel_parser.y"
				yy_do_action_236
			when 237 then
					--|#line 1524 "et_eiffel_parser.y"
				yy_do_action_237
			when 238 then
					--|#line 1526 "et_eiffel_parser.y"
				yy_do_action_238
			when 239 then
					--|#line 1526 "et_eiffel_parser.y"
				yy_do_action_239
			when 240 then
					--|#line 1538 "et_eiffel_parser.y"
				yy_do_action_240
			when 241 then
					--|#line 1538 "et_eiffel_parser.y"
				yy_do_action_241
			when 242 then
					--|#line 1550 "et_eiffel_parser.y"
				yy_do_action_242
			when 243 then
					--|#line 1552 "et_eiffel_parser.y"
				yy_do_action_243
			when 244 then
					--|#line 1554 "et_eiffel_parser.y"
				yy_do_action_244
			when 245 then
					--|#line 1554 "et_eiffel_parser.y"
				yy_do_action_245
			when 246 then
					--|#line 1566 "et_eiffel_parser.y"
				yy_do_action_246
			when 247 then
					--|#line 1566 "et_eiffel_parser.y"
				yy_do_action_247
			when 248 then
					--|#line 1580 "et_eiffel_parser.y"
				yy_do_action_248
			when 249 then
					--|#line 1592 "et_eiffel_parser.y"
				yy_do_action_249
			when 250 then
					--|#line 1604 "et_eiffel_parser.y"
				yy_do_action_250
			when 251 then
					--|#line 1613 "et_eiffel_parser.y"
				yy_do_action_251
			when 252 then
					--|#line 1629 "et_eiffel_parser.y"
				yy_do_action_252
			when 253 then
					--|#line 1631 "et_eiffel_parser.y"
				yy_do_action_253
			when 254 then
					--|#line 1635 "et_eiffel_parser.y"
				yy_do_action_254
			when 255 then
					--|#line 1635 "et_eiffel_parser.y"
				yy_do_action_255
			when 256 then
					--|#line 1648 "et_eiffel_parser.y"
				yy_do_action_256
			when 257 then
					--|#line 1655 "et_eiffel_parser.y"
				yy_do_action_257
			when 258 then
					--|#line 1662 "et_eiffel_parser.y"
				yy_do_action_258
			when 259 then
					--|#line 1671 "et_eiffel_parser.y"
				yy_do_action_259
			when 260 then
					--|#line 1680 "et_eiffel_parser.y"
				yy_do_action_260
			when 261 then
					--|#line 1684 "et_eiffel_parser.y"
				yy_do_action_261
			when 262 then
					--|#line 1690 "et_eiffel_parser.y"
				yy_do_action_262
			when 263 then
					--|#line 1692 "et_eiffel_parser.y"
				yy_do_action_263
			when 264 then
					--|#line 1692 "et_eiffel_parser.y"
				yy_do_action_264
			when 265 then
					--|#line 1705 "et_eiffel_parser.y"
				yy_do_action_265
			when 266 then
					--|#line 1716 "et_eiffel_parser.y"
				yy_do_action_266
			when 267 then
					--|#line 1725 "et_eiffel_parser.y"
				yy_do_action_267
			when 268 then
					--|#line 1736 "et_eiffel_parser.y"
				yy_do_action_268
			when 269 then
					--|#line 1741 "et_eiffel_parser.y"
				yy_do_action_269
			when 270 then
					--|#line 1745 "et_eiffel_parser.y"
				yy_do_action_270
			when 271 then
					--|#line 1753 "et_eiffel_parser.y"
				yy_do_action_271
			when 272 then
					--|#line 1760 "et_eiffel_parser.y"
				yy_do_action_272
			when 273 then
					--|#line 1769 "et_eiffel_parser.y"
				yy_do_action_273
			when 274 then
					--|#line 1776 "et_eiffel_parser.y"
				yy_do_action_274
			when 275 then
					--|#line 1785 "et_eiffel_parser.y"
				yy_do_action_275
			when 276 then
					--|#line 1790 "et_eiffel_parser.y"
				yy_do_action_276
			when 277 then
					--|#line 1797 "et_eiffel_parser.y"
				yy_do_action_277
			when 278 then
					--|#line 1798 "et_eiffel_parser.y"
				yy_do_action_278
			when 279 then
					--|#line 1799 "et_eiffel_parser.y"
				yy_do_action_279
			when 280 then
					--|#line 1800 "et_eiffel_parser.y"
				yy_do_action_280
			when 281 then
					--|#line 1805 "et_eiffel_parser.y"
				yy_do_action_281
			when 282 then
					--|#line 1810 "et_eiffel_parser.y"
				yy_do_action_282
			when 283 then
					--|#line 1818 "et_eiffel_parser.y"
				yy_do_action_283
			when 284 then
					--|#line 1823 "et_eiffel_parser.y"
				yy_do_action_284
			when 285 then
					--|#line 1829 "et_eiffel_parser.y"
				yy_do_action_285
			when 286 then
					--|#line 1837 "et_eiffel_parser.y"
				yy_do_action_286
			when 287 then
					--|#line 1848 "et_eiffel_parser.y"
				yy_do_action_287
			when 288 then
					--|#line 1853 "et_eiffel_parser.y"
				yy_do_action_288
			when 289 then
					--|#line 1861 "et_eiffel_parser.y"
				yy_do_action_289
			when 290 then
					--|#line 1866 "et_eiffel_parser.y"
				yy_do_action_290
			when 291 then
					--|#line 1872 "et_eiffel_parser.y"
				yy_do_action_291
			when 292 then
					--|#line 1880 "et_eiffel_parser.y"
				yy_do_action_292
			when 293 then
					--|#line 1891 "et_eiffel_parser.y"
				yy_do_action_293
			when 294 then
					--|#line 1893 "et_eiffel_parser.y"
				yy_do_action_294
			when 295 then
					--|#line 1895 "et_eiffel_parser.y"
				yy_do_action_295
			when 296 then
					--|#line 1899 "et_eiffel_parser.y"
				yy_do_action_296
			when 297 then
					--|#line 1901 "et_eiffel_parser.y"
				yy_do_action_297
			when 298 then
					--|#line 1909 "et_eiffel_parser.y"
				yy_do_action_298
			when 299 then
					--|#line 1911 "et_eiffel_parser.y"
				yy_do_action_299
			when 300 then
					--|#line 1919 "et_eiffel_parser.y"
				yy_do_action_300
			when 301 then
					--|#line 1922 "et_eiffel_parser.y"
				yy_do_action_301
			when 302 then
					--|#line 1931 "et_eiffel_parser.y"
				yy_do_action_302
			when 303 then
					--|#line 1935 "et_eiffel_parser.y"
				yy_do_action_303
			when 304 then
					--|#line 1945 "et_eiffel_parser.y"
				yy_do_action_304
			when 305 then
					--|#line 1948 "et_eiffel_parser.y"
				yy_do_action_305
			when 306 then
					--|#line 1957 "et_eiffel_parser.y"
				yy_do_action_306
			when 307 then
					--|#line 1961 "et_eiffel_parser.y"
				yy_do_action_307
			when 308 then
					--|#line 1971 "et_eiffel_parser.y"
				yy_do_action_308
			when 309 then
					--|#line 1973 "et_eiffel_parser.y"
				yy_do_action_309
			when 310 then
					--|#line 1981 "et_eiffel_parser.y"
				yy_do_action_310
			when 311 then
					--|#line 1984 "et_eiffel_parser.y"
				yy_do_action_311
			when 312 then
					--|#line 1993 "et_eiffel_parser.y"
				yy_do_action_312
			when 313 then
					--|#line 1996 "et_eiffel_parser.y"
				yy_do_action_313
			when 314 then
					--|#line 2005 "et_eiffel_parser.y"
				yy_do_action_314
			when 315 then
					--|#line 2009 "et_eiffel_parser.y"
				yy_do_action_315
			when 316 then
					--|#line 2021 "et_eiffel_parser.y"
				yy_do_action_316
			when 317 then
					--|#line 2024 "et_eiffel_parser.y"
				yy_do_action_317
			when 318 then
					--|#line 2028 "et_eiffel_parser.y"
				yy_do_action_318
			when 319 then
					--|#line 2031 "et_eiffel_parser.y"
				yy_do_action_319
			when 320 then
					--|#line 2035 "et_eiffel_parser.y"
				yy_do_action_320
			when 321 then
					--|#line 2037 "et_eiffel_parser.y"
				yy_do_action_321
			when 322 then
					--|#line 2040 "et_eiffel_parser.y"
				yy_do_action_322
			when 323 then
					--|#line 2043 "et_eiffel_parser.y"
				yy_do_action_323
			when 324 then
					--|#line 2049 "et_eiffel_parser.y"
				yy_do_action_324
			when 325 then
					--|#line 2057 "et_eiffel_parser.y"
				yy_do_action_325
			when 326 then
					--|#line 2061 "et_eiffel_parser.y"
				yy_do_action_326
			when 327 then
					--|#line 2063 "et_eiffel_parser.y"
				yy_do_action_327
			when 328 then
					--|#line 2067 "et_eiffel_parser.y"
				yy_do_action_328
			when 329 then
					--|#line 2069 "et_eiffel_parser.y"
				yy_do_action_329
			when 330 then
					--|#line 2073 "et_eiffel_parser.y"
				yy_do_action_330
			when 331 then
					--|#line 2075 "et_eiffel_parser.y"
				yy_do_action_331
			when 332 then
					--|#line 2081 "et_eiffel_parser.y"
				yy_do_action_332
			when 333 then
					--|#line 2090 "et_eiffel_parser.y"
				yy_do_action_333
			when 334 then
					--|#line 2092 "et_eiffel_parser.y"
				yy_do_action_334
			when 335 then
					--|#line 2104 "et_eiffel_parser.y"
				yy_do_action_335
			when 336 then
					--|#line 2115 "et_eiffel_parser.y"
				yy_do_action_336
			when 337 then
					--|#line 2115 "et_eiffel_parser.y"
				yy_do_action_337
			when 338 then
					--|#line 2130 "et_eiffel_parser.y"
				yy_do_action_338
			when 339 then
					--|#line 2132 "et_eiffel_parser.y"
				yy_do_action_339
			when 340 then
					--|#line 2134 "et_eiffel_parser.y"
				yy_do_action_340
			when 341 then
					--|#line 2136 "et_eiffel_parser.y"
				yy_do_action_341
			when 342 then
					--|#line 2138 "et_eiffel_parser.y"
				yy_do_action_342
			when 343 then
					--|#line 2140 "et_eiffel_parser.y"
				yy_do_action_343
			when 344 then
					--|#line 2142 "et_eiffel_parser.y"
				yy_do_action_344
			when 345 then
					--|#line 2144 "et_eiffel_parser.y"
				yy_do_action_345
			when 346 then
					--|#line 2146 "et_eiffel_parser.y"
				yy_do_action_346
			when 347 then
					--|#line 2148 "et_eiffel_parser.y"
				yy_do_action_347
			when 348 then
					--|#line 2150 "et_eiffel_parser.y"
				yy_do_action_348
			when 349 then
					--|#line 2152 "et_eiffel_parser.y"
				yy_do_action_349
			when 350 then
					--|#line 2154 "et_eiffel_parser.y"
				yy_do_action_350
			when 351 then
					--|#line 2156 "et_eiffel_parser.y"
				yy_do_action_351
			when 352 then
					--|#line 2158 "et_eiffel_parser.y"
				yy_do_action_352
			when 353 then
					--|#line 2160 "et_eiffel_parser.y"
				yy_do_action_353
			when 354 then
					--|#line 2162 "et_eiffel_parser.y"
				yy_do_action_354
			when 355 then
					--|#line 2164 "et_eiffel_parser.y"
				yy_do_action_355
			when 356 then
					--|#line 2166 "et_eiffel_parser.y"
				yy_do_action_356
			when 357 then
					--|#line 2168 "et_eiffel_parser.y"
				yy_do_action_357
			when 358 then
					--|#line 2170 "et_eiffel_parser.y"
				yy_do_action_358
			when 359 then
					--|#line 2172 "et_eiffel_parser.y"
				yy_do_action_359
			when 360 then
					--|#line 2174 "et_eiffel_parser.y"
				yy_do_action_360
			when 361 then
					--|#line 2178 "et_eiffel_parser.y"
				yy_do_action_361
			when 362 then
					--|#line 2180 "et_eiffel_parser.y"
				yy_do_action_362
			when 363 then
					--|#line 2186 "et_eiffel_parser.y"
				yy_do_action_363
			when 364 then
					--|#line 2193 "et_eiffel_parser.y"
				yy_do_action_364
			when 365 then
					--|#line 2195 "et_eiffel_parser.y"
				yy_do_action_365
			when 366 then
					--|#line 2203 "et_eiffel_parser.y"
				yy_do_action_366
			when 367 then
					--|#line 2214 "et_eiffel_parser.y"
				yy_do_action_367
			when 368 then
					--|#line 2221 "et_eiffel_parser.y"
				yy_do_action_368
			when 369 then
					--|#line 2228 "et_eiffel_parser.y"
				yy_do_action_369
			when 370 then
					--|#line 2238 "et_eiffel_parser.y"
				yy_do_action_370
			when 371 then
					--|#line 2249 "et_eiffel_parser.y"
				yy_do_action_371
			when 372 then
					--|#line 2256 "et_eiffel_parser.y"
				yy_do_action_372
			when 373 then
					--|#line 2265 "et_eiffel_parser.y"
				yy_do_action_373
			when 374 then
					--|#line 2274 "et_eiffel_parser.y"
				yy_do_action_374
			when 375 then
					--|#line 2283 "et_eiffel_parser.y"
				yy_do_action_375
			when 376 then
					--|#line 2292 "et_eiffel_parser.y"
				yy_do_action_376
			when 377 then
					--|#line 2303 "et_eiffel_parser.y"
				yy_do_action_377
			when 378 then
					--|#line 2305 "et_eiffel_parser.y"
				yy_do_action_378
			when 379 then
					--|#line 2307 "et_eiffel_parser.y"
				yy_do_action_379
			when 380 then
					--|#line 2307 "et_eiffel_parser.y"
				yy_do_action_380
			when 381 then
					--|#line 2320 "et_eiffel_parser.y"
				yy_do_action_381
			when 382 then
					--|#line 2327 "et_eiffel_parser.y"
				yy_do_action_382
			when 383 then
					--|#line 2334 "et_eiffel_parser.y"
				yy_do_action_383
			when 384 then
					--|#line 2344 "et_eiffel_parser.y"
				yy_do_action_384
			when 385 then
					--|#line 2355 "et_eiffel_parser.y"
				yy_do_action_385
			when 386 then
					--|#line 2362 "et_eiffel_parser.y"
				yy_do_action_386
			when 387 then
					--|#line 2371 "et_eiffel_parser.y"
				yy_do_action_387
			when 388 then
					--|#line 2380 "et_eiffel_parser.y"
				yy_do_action_388
			when 389 then
					--|#line 2389 "et_eiffel_parser.y"
				yy_do_action_389
			when 390 then
					--|#line 2398 "et_eiffel_parser.y"
				yy_do_action_390
			when 391 then
					--|#line 2409 "et_eiffel_parser.y"
				yy_do_action_391
			when 392 then
					--|#line 2411 "et_eiffel_parser.y"
				yy_do_action_392
			when 393 then
					--|#line 2413 "et_eiffel_parser.y"
				yy_do_action_393
			when 394 then
					--|#line 2415 "et_eiffel_parser.y"
				yy_do_action_394
			when 395 then
					--|#line 2417 "et_eiffel_parser.y"
				yy_do_action_395
			when 396 then
					--|#line 2426 "et_eiffel_parser.y"
				yy_do_action_396
			when 397 then
					--|#line 2435 "et_eiffel_parser.y"
				yy_do_action_397
			when 398 then
					--|#line 2437 "et_eiffel_parser.y"
				yy_do_action_398
			when 399 then
					--|#line 2439 "et_eiffel_parser.y"
				yy_do_action_399
			when 400 then
					--|#line 2441 "et_eiffel_parser.y"
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
					--|#line 2443 "et_eiffel_parser.y"
				yy_do_action_401
			when 402 then
					--|#line 2452 "et_eiffel_parser.y"
				yy_do_action_402
			when 403 then
					--|#line 2463 "et_eiffel_parser.y"
				yy_do_action_403
			when 404 then
					--|#line 2467 "et_eiffel_parser.y"
				yy_do_action_404
			when 405 then
					--|#line 2469 "et_eiffel_parser.y"
				yy_do_action_405
			when 406 then
					--|#line 2471 "et_eiffel_parser.y"
				yy_do_action_406
			when 407 then
					--|#line 2473 "et_eiffel_parser.y"
				yy_do_action_407
			when 408 then
					--|#line 2475 "et_eiffel_parser.y"
				yy_do_action_408
			when 409 then
					--|#line 2479 "et_eiffel_parser.y"
				yy_do_action_409
			when 410 then
					--|#line 2483 "et_eiffel_parser.y"
				yy_do_action_410
			when 411 then
					--|#line 2485 "et_eiffel_parser.y"
				yy_do_action_411
			when 412 then
					--|#line 2487 "et_eiffel_parser.y"
				yy_do_action_412
			when 413 then
					--|#line 2489 "et_eiffel_parser.y"
				yy_do_action_413
			when 414 then
					--|#line 2491 "et_eiffel_parser.y"
				yy_do_action_414
			when 415 then
					--|#line 2495 "et_eiffel_parser.y"
				yy_do_action_415
			when 416 then
					--|#line 2499 "et_eiffel_parser.y"
				yy_do_action_416
			when 417 then
					--|#line 2501 "et_eiffel_parser.y"
				yy_do_action_417
			when 418 then
					--|#line 2505 "et_eiffel_parser.y"
				yy_do_action_418
			when 419 then
					--|#line 2507 "et_eiffel_parser.y"
				yy_do_action_419
			when 420 then
					--|#line 2511 "et_eiffel_parser.y"
				yy_do_action_420
			when 421 then
					--|#line 2515 "et_eiffel_parser.y"
				yy_do_action_421
			when 422 then
					--|#line 2519 "et_eiffel_parser.y"
				yy_do_action_422
			when 423 then
					--|#line 2521 "et_eiffel_parser.y"
				yy_do_action_423
			when 424 then
					--|#line 2525 "et_eiffel_parser.y"
				yy_do_action_424
			when 425 then
					--|#line 2527 "et_eiffel_parser.y"
				yy_do_action_425
			when 426 then
					--|#line 2531 "et_eiffel_parser.y"
				yy_do_action_426
			when 427 then
					--|#line 2533 "et_eiffel_parser.y"
				yy_do_action_427
			when 428 then
					--|#line 2537 "et_eiffel_parser.y"
				yy_do_action_428
			when 429 then
					--|#line 2539 "et_eiffel_parser.y"
				yy_do_action_429
			when 430 then
					--|#line 2545 "et_eiffel_parser.y"
				yy_do_action_430
			when 431 then
					--|#line 2547 "et_eiffel_parser.y"
				yy_do_action_431
			when 432 then
					--|#line 2553 "et_eiffel_parser.y"
				yy_do_action_432
			when 433 then
					--|#line 2555 "et_eiffel_parser.y"
				yy_do_action_433
			when 434 then
					--|#line 2559 "et_eiffel_parser.y"
				yy_do_action_434
			when 435 then
					--|#line 2561 "et_eiffel_parser.y"
				yy_do_action_435
			when 436 then
					--|#line 2563 "et_eiffel_parser.y"
				yy_do_action_436
			when 437 then
					--|#line 2565 "et_eiffel_parser.y"
				yy_do_action_437
			when 438 then
					--|#line 2567 "et_eiffel_parser.y"
				yy_do_action_438
			when 439 then
					--|#line 2569 "et_eiffel_parser.y"
				yy_do_action_439
			when 440 then
					--|#line 2571 "et_eiffel_parser.y"
				yy_do_action_440
			when 441 then
					--|#line 2573 "et_eiffel_parser.y"
				yy_do_action_441
			when 442 then
					--|#line 2575 "et_eiffel_parser.y"
				yy_do_action_442
			when 443 then
					--|#line 2577 "et_eiffel_parser.y"
				yy_do_action_443
			when 444 then
					--|#line 2579 "et_eiffel_parser.y"
				yy_do_action_444
			when 445 then
					--|#line 2581 "et_eiffel_parser.y"
				yy_do_action_445
			when 446 then
					--|#line 2583 "et_eiffel_parser.y"
				yy_do_action_446
			when 447 then
					--|#line 2585 "et_eiffel_parser.y"
				yy_do_action_447
			when 448 then
					--|#line 2587 "et_eiffel_parser.y"
				yy_do_action_448
			when 449 then
					--|#line 2589 "et_eiffel_parser.y"
				yy_do_action_449
			when 450 then
					--|#line 2591 "et_eiffel_parser.y"
				yy_do_action_450
			when 451 then
					--|#line 2593 "et_eiffel_parser.y"
				yy_do_action_451
			when 452 then
					--|#line 2595 "et_eiffel_parser.y"
				yy_do_action_452
			when 453 then
					--|#line 2597 "et_eiffel_parser.y"
				yy_do_action_453
			when 454 then
					--|#line 2599 "et_eiffel_parser.y"
				yy_do_action_454
			when 455 then
					--|#line 2601 "et_eiffel_parser.y"
				yy_do_action_455
			when 456 then
					--|#line 2605 "et_eiffel_parser.y"
				yy_do_action_456
			when 457 then
					--|#line 2607 "et_eiffel_parser.y"
				yy_do_action_457
			when 458 then
					--|#line 2609 "et_eiffel_parser.y"
				yy_do_action_458
			when 459 then
					--|#line 2611 "et_eiffel_parser.y"
				yy_do_action_459
			when 460 then
					--|#line 2613 "et_eiffel_parser.y"
				yy_do_action_460
			when 461 then
					--|#line 2615 "et_eiffel_parser.y"
				yy_do_action_461
			when 462 then
					--|#line 2617 "et_eiffel_parser.y"
				yy_do_action_462
			when 463 then
					--|#line 2619 "et_eiffel_parser.y"
				yy_do_action_463
			when 464 then
					--|#line 2621 "et_eiffel_parser.y"
				yy_do_action_464
			when 465 then
					--|#line 2623 "et_eiffel_parser.y"
				yy_do_action_465
			when 466 then
					--|#line 2625 "et_eiffel_parser.y"
				yy_do_action_466
			when 467 then
					--|#line 2627 "et_eiffel_parser.y"
				yy_do_action_467
			when 468 then
					--|#line 2629 "et_eiffel_parser.y"
				yy_do_action_468
			when 469 then
					--|#line 2631 "et_eiffel_parser.y"
				yy_do_action_469
			when 470 then
					--|#line 2633 "et_eiffel_parser.y"
				yy_do_action_470
			when 471 then
					--|#line 2635 "et_eiffel_parser.y"
				yy_do_action_471
			when 472 then
					--|#line 2637 "et_eiffel_parser.y"
				yy_do_action_472
			when 473 then
					--|#line 2639 "et_eiffel_parser.y"
				yy_do_action_473
			when 474 then
					--|#line 2641 "et_eiffel_parser.y"
				yy_do_action_474
			when 475 then
					--|#line 2643 "et_eiffel_parser.y"
				yy_do_action_475
			when 476 then
					--|#line 2645 "et_eiffel_parser.y"
				yy_do_action_476
			when 477 then
					--|#line 2647 "et_eiffel_parser.y"
				yy_do_action_477
			when 478 then
					--|#line 2651 "et_eiffel_parser.y"
				yy_do_action_478
			when 479 then
					--|#line 2653 "et_eiffel_parser.y"
				yy_do_action_479
			when 480 then
					--|#line 2655 "et_eiffel_parser.y"
				yy_do_action_480
			when 481 then
					--|#line 2657 "et_eiffel_parser.y"
				yy_do_action_481
			when 482 then
					--|#line 2659 "et_eiffel_parser.y"
				yy_do_action_482
			when 483 then
					--|#line 2661 "et_eiffel_parser.y"
				yy_do_action_483
			when 484 then
					--|#line 2663 "et_eiffel_parser.y"
				yy_do_action_484
			when 485 then
					--|#line 2665 "et_eiffel_parser.y"
				yy_do_action_485
			when 486 then
					--|#line 2667 "et_eiffel_parser.y"
				yy_do_action_486
			when 487 then
					--|#line 2669 "et_eiffel_parser.y"
				yy_do_action_487
			when 488 then
					--|#line 2671 "et_eiffel_parser.y"
				yy_do_action_488
			when 489 then
					--|#line 2673 "et_eiffel_parser.y"
				yy_do_action_489
			when 490 then
					--|#line 2675 "et_eiffel_parser.y"
				yy_do_action_490
			when 491 then
					--|#line 2677 "et_eiffel_parser.y"
				yy_do_action_491
			when 492 then
					--|#line 2679 "et_eiffel_parser.y"
				yy_do_action_492
			when 493 then
					--|#line 2681 "et_eiffel_parser.y"
				yy_do_action_493
			when 494 then
					--|#line 2683 "et_eiffel_parser.y"
				yy_do_action_494
			when 495 then
					--|#line 2685 "et_eiffel_parser.y"
				yy_do_action_495
			when 496 then
					--|#line 2687 "et_eiffel_parser.y"
				yy_do_action_496
			when 497 then
					--|#line 2689 "et_eiffel_parser.y"
				yy_do_action_497
			when 498 then
					--|#line 2691 "et_eiffel_parser.y"
				yy_do_action_498
			when 499 then
					--|#line 2693 "et_eiffel_parser.y"
				yy_do_action_499
			when 500 then
					--|#line 2695 "et_eiffel_parser.y"
				yy_do_action_500
			when 501 then
					--|#line 2699 "et_eiffel_parser.y"
				yy_do_action_501
			when 502 then
					--|#line 2701 "et_eiffel_parser.y"
				yy_do_action_502
			when 503 then
					--|#line 2705 "et_eiffel_parser.y"
				yy_do_action_503
			when 504 then
					--|#line 2707 "et_eiffel_parser.y"
				yy_do_action_504
			when 505 then
					--|#line 2711 "et_eiffel_parser.y"
				yy_do_action_505
			when 506 then
					--|#line 2714 "et_eiffel_parser.y"
				yy_do_action_506
			when 507 then
					--|#line 2722 "et_eiffel_parser.y"
				yy_do_action_507
			when 508 then
					--|#line 2729 "et_eiffel_parser.y"
				yy_do_action_508
			when 509 then
					--|#line 2740 "et_eiffel_parser.y"
				yy_do_action_509
			when 510 then
					--|#line 2745 "et_eiffel_parser.y"
				yy_do_action_510
			when 511 then
					--|#line 2750 "et_eiffel_parser.y"
				yy_do_action_511
			when 512 then
					--|#line 2755 "et_eiffel_parser.y"
				yy_do_action_512
			when 513 then
					--|#line 2762 "et_eiffel_parser.y"
				yy_do_action_513
			when 514 then
					--|#line 2768 "et_eiffel_parser.y"
				yy_do_action_514
			when 515 then
					--|#line 2777 "et_eiffel_parser.y"
				yy_do_action_515
			when 516 then
					--|#line 2779 "et_eiffel_parser.y"
				yy_do_action_516
			when 517 then
					--|#line 2783 "et_eiffel_parser.y"
				yy_do_action_517
			when 518 then
					--|#line 2786 "et_eiffel_parser.y"
				yy_do_action_518
			when 519 then
					--|#line 2792 "et_eiffel_parser.y"
				yy_do_action_519
			when 520 then
					--|#line 2800 "et_eiffel_parser.y"
				yy_do_action_520
			when 521 then
					--|#line 2805 "et_eiffel_parser.y"
				yy_do_action_521
			when 522 then
					--|#line 2810 "et_eiffel_parser.y"
				yy_do_action_522
			when 523 then
					--|#line 2815 "et_eiffel_parser.y"
				yy_do_action_523
			when 524 then
					--|#line 2826 "et_eiffel_parser.y"
				yy_do_action_524
			when 525 then
					--|#line 2837 "et_eiffel_parser.y"
				yy_do_action_525
			when 526 then
					--|#line 2850 "et_eiffel_parser.y"
				yy_do_action_526
			when 527 then
					--|#line 2859 "et_eiffel_parser.y"
				yy_do_action_527
			when 528 then
					--|#line 2868 "et_eiffel_parser.y"
				yy_do_action_528
			when 529 then
					--|#line 2870 "et_eiffel_parser.y"
				yy_do_action_529
			when 530 then
					--|#line 2872 "et_eiffel_parser.y"
				yy_do_action_530
			when 531 then
					--|#line 2876 "et_eiffel_parser.y"
				yy_do_action_531
			when 532 then
					--|#line 2878 "et_eiffel_parser.y"
				yy_do_action_532
			when 533 then
					--|#line 2880 "et_eiffel_parser.y"
				yy_do_action_533
			when 534 then
					--|#line 2882 "et_eiffel_parser.y"
				yy_do_action_534
			when 535 then
					--|#line 2884 "et_eiffel_parser.y"
				yy_do_action_535
			when 536 then
					--|#line 2886 "et_eiffel_parser.y"
				yy_do_action_536
			when 537 then
					--|#line 2888 "et_eiffel_parser.y"
				yy_do_action_537
			when 538 then
					--|#line 2890 "et_eiffel_parser.y"
				yy_do_action_538
			when 539 then
					--|#line 2892 "et_eiffel_parser.y"
				yy_do_action_539
			when 540 then
					--|#line 2894 "et_eiffel_parser.y"
				yy_do_action_540
			when 541 then
					--|#line 2896 "et_eiffel_parser.y"
				yy_do_action_541
			when 542 then
					--|#line 2898 "et_eiffel_parser.y"
				yy_do_action_542
			when 543 then
					--|#line 2900 "et_eiffel_parser.y"
				yy_do_action_543
			when 544 then
					--|#line 2902 "et_eiffel_parser.y"
				yy_do_action_544
			when 545 then
					--|#line 2904 "et_eiffel_parser.y"
				yy_do_action_545
			when 546 then
					--|#line 2906 "et_eiffel_parser.y"
				yy_do_action_546
			when 547 then
					--|#line 2908 "et_eiffel_parser.y"
				yy_do_action_547
			when 548 then
					--|#line 2910 "et_eiffel_parser.y"
				yy_do_action_548
			when 549 then
					--|#line 2912 "et_eiffel_parser.y"
				yy_do_action_549
			when 550 then
					--|#line 2914 "et_eiffel_parser.y"
				yy_do_action_550
			when 551 then
					--|#line 2916 "et_eiffel_parser.y"
				yy_do_action_551
			when 552 then
					--|#line 2920 "et_eiffel_parser.y"
				yy_do_action_552
			when 553 then
					--|#line 2922 "et_eiffel_parser.y"
				yy_do_action_553
			when 554 then
					--|#line 2926 "et_eiffel_parser.y"
				yy_do_action_554
			when 555 then
					--|#line 2928 "et_eiffel_parser.y"
				yy_do_action_555
			when 556 then
					--|#line 2930 "et_eiffel_parser.y"
				yy_do_action_556
			when 557 then
					--|#line 2932 "et_eiffel_parser.y"
				yy_do_action_557
			when 558 then
					--|#line 2934 "et_eiffel_parser.y"
				yy_do_action_558
			when 559 then
					--|#line 2936 "et_eiffel_parser.y"
				yy_do_action_559
			when 560 then
					--|#line 2938 "et_eiffel_parser.y"
				yy_do_action_560
			when 561 then
					--|#line 2946 "et_eiffel_parser.y"
				yy_do_action_561
			when 562 then
					--|#line 2954 "et_eiffel_parser.y"
				yy_do_action_562
			when 563 then
					--|#line 2962 "et_eiffel_parser.y"
				yy_do_action_563
			when 564 then
					--|#line 2970 "et_eiffel_parser.y"
				yy_do_action_564
			when 565 then
					--|#line 2972 "et_eiffel_parser.y"
				yy_do_action_565
			when 566 then
					--|#line 2974 "et_eiffel_parser.y"
				yy_do_action_566
			when 567 then
					--|#line 2976 "et_eiffel_parser.y"
				yy_do_action_567
			when 568 then
					--|#line 2978 "et_eiffel_parser.y"
				yy_do_action_568
			when 569 then
					--|#line 2980 "et_eiffel_parser.y"
				yy_do_action_569
			when 570 then
					--|#line 2982 "et_eiffel_parser.y"
				yy_do_action_570
			when 571 then
					--|#line 2984 "et_eiffel_parser.y"
				yy_do_action_571
			when 572 then
					--|#line 2986 "et_eiffel_parser.y"
				yy_do_action_572
			when 573 then
					--|#line 2992 "et_eiffel_parser.y"
				yy_do_action_573
			when 574 then
					--|#line 2996 "et_eiffel_parser.y"
				yy_do_action_574
			when 575 then
					--|#line 3000 "et_eiffel_parser.y"
				yy_do_action_575
			when 576 then
					--|#line 3004 "et_eiffel_parser.y"
				yy_do_action_576
			when 577 then
					--|#line 3008 "et_eiffel_parser.y"
				yy_do_action_577
			when 578 then
					--|#line 3012 "et_eiffel_parser.y"
				yy_do_action_578
			when 579 then
					--|#line 3016 "et_eiffel_parser.y"
				yy_do_action_579
			when 580 then
					--|#line 3020 "et_eiffel_parser.y"
				yy_do_action_580
			when 581 then
					--|#line 3024 "et_eiffel_parser.y"
				yy_do_action_581
			when 582 then
					--|#line 3026 "et_eiffel_parser.y"
				yy_do_action_582
			when 583 then
					--|#line 3030 "et_eiffel_parser.y"
				yy_do_action_583
			when 584 then
					--|#line 3034 "et_eiffel_parser.y"
				yy_do_action_584
			when 585 then
					--|#line 3041 "et_eiffel_parser.y"
				yy_do_action_585
			when 586 then
					--|#line 3043 "et_eiffel_parser.y"
				yy_do_action_586
			when 587 then
					--|#line 3047 "et_eiffel_parser.y"
				yy_do_action_587
			when 588 then
					--|#line 3049 "et_eiffel_parser.y"
				yy_do_action_588
			when 589 then
					--|#line 3053 "et_eiffel_parser.y"
				yy_do_action_589
			when 590 then
					--|#line 3064 "et_eiffel_parser.y"
				yy_do_action_590
			when 591 then
					--|#line 3064 "et_eiffel_parser.y"
				yy_do_action_591
			when 592 then
					--|#line 3085 "et_eiffel_parser.y"
				yy_do_action_592
			when 593 then
					--|#line 3087 "et_eiffel_parser.y"
				yy_do_action_593
			when 594 then
					--|#line 3089 "et_eiffel_parser.y"
				yy_do_action_594
			when 595 then
					--|#line 3091 "et_eiffel_parser.y"
				yy_do_action_595
			when 596 then
					--|#line 3093 "et_eiffel_parser.y"
				yy_do_action_596
			when 597 then
					--|#line 3095 "et_eiffel_parser.y"
				yy_do_action_597
			when 598 then
					--|#line 3097 "et_eiffel_parser.y"
				yy_do_action_598
			when 599 then
					--|#line 3099 "et_eiffel_parser.y"
				yy_do_action_599
			when 600 then
					--|#line 3101 "et_eiffel_parser.y"
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
					--|#line 3103 "et_eiffel_parser.y"
				yy_do_action_601
			when 602 then
					--|#line 3105 "et_eiffel_parser.y"
				yy_do_action_602
			when 603 then
					--|#line 3113 "et_eiffel_parser.y"
				yy_do_action_603
			when 604 then
					--|#line 3126 "et_eiffel_parser.y"
				yy_do_action_604
			when 605 then
					--|#line 3128 "et_eiffel_parser.y"
				yy_do_action_605
			when 606 then
					--|#line 3130 "et_eiffel_parser.y"
				yy_do_action_606
			when 607 then
					--|#line 3132 "et_eiffel_parser.y"
				yy_do_action_607
			when 608 then
					--|#line 3134 "et_eiffel_parser.y"
				yy_do_action_608
			when 609 then
					--|#line 3140 "et_eiffel_parser.y"
				yy_do_action_609
			when 610 then
					--|#line 3144 "et_eiffel_parser.y"
				yy_do_action_610
			when 611 then
					--|#line 3146 "et_eiffel_parser.y"
				yy_do_action_611
			when 612 then
					--|#line 3148 "et_eiffel_parser.y"
				yy_do_action_612
			when 613 then
					--|#line 3150 "et_eiffel_parser.y"
				yy_do_action_613
			when 614 then
					--|#line 3156 "et_eiffel_parser.y"
				yy_do_action_614
			when 615 then
					--|#line 3158 "et_eiffel_parser.y"
				yy_do_action_615
			when 616 then
					--|#line 3160 "et_eiffel_parser.y"
				yy_do_action_616
			when 617 then
					--|#line 3162 "et_eiffel_parser.y"
				yy_do_action_617
			when 618 then
					--|#line 3166 "et_eiffel_parser.y"
				yy_do_action_618
			when 619 then
					--|#line 3168 "et_eiffel_parser.y"
				yy_do_action_619
			when 620 then
					--|#line 3170 "et_eiffel_parser.y"
				yy_do_action_620
			when 621 then
					--|#line 3172 "et_eiffel_parser.y"
				yy_do_action_621
			when 622 then
					--|#line 3176 "et_eiffel_parser.y"
				yy_do_action_622
			when 623 then
					--|#line 3178 "et_eiffel_parser.y"
				yy_do_action_623
			when 624 then
					--|#line 3182 "et_eiffel_parser.y"
				yy_do_action_624
			when 625 then
					--|#line 3183 "et_eiffel_parser.y"
				yy_do_action_625
			when 626 then
					--|#line 3189 "et_eiffel_parser.y"
				yy_do_action_626
			when 627 then
					--|#line 3191 "et_eiffel_parser.y"
				yy_do_action_627
			when 628 then
					--|#line 3193 "et_eiffel_parser.y"
				yy_do_action_628
			when 629 then
					--|#line 3195 "et_eiffel_parser.y"
				yy_do_action_629
			when 630 then
					--|#line 3199 "et_eiffel_parser.y"
				yy_do_action_630
			when 631 then
					--|#line 3206 "et_eiffel_parser.y"
				yy_do_action_631
			when 632 then
					--|#line 3213 "et_eiffel_parser.y"
				yy_do_action_632
			when 633 then
					--|#line 3222 "et_eiffel_parser.y"
				yy_do_action_633
			when 634 then
					--|#line 3233 "et_eiffel_parser.y"
				yy_do_action_634
			when 635 then
					--|#line 3235 "et_eiffel_parser.y"
				yy_do_action_635
			when 636 then
					--|#line 3239 "et_eiffel_parser.y"
				yy_do_action_636
			when 637 then
					--|#line 3246 "et_eiffel_parser.y"
				yy_do_action_637
			when 638 then
					--|#line 3253 "et_eiffel_parser.y"
				yy_do_action_638
			when 639 then
					--|#line 3262 "et_eiffel_parser.y"
				yy_do_action_639
			when 640 then
					--|#line 3273 "et_eiffel_parser.y"
				yy_do_action_640
			when 641 then
					--|#line 3275 "et_eiffel_parser.y"
				yy_do_action_641
			when 642 then
					--|#line 3279 "et_eiffel_parser.y"
				yy_do_action_642
			when 643 then
					--|#line 3281 "et_eiffel_parser.y"
				yy_do_action_643
			when 644 then
					--|#line 3288 "et_eiffel_parser.y"
				yy_do_action_644
			when 645 then
					--|#line 3295 "et_eiffel_parser.y"
				yy_do_action_645
			when 646 then
					--|#line 3304 "et_eiffel_parser.y"
				yy_do_action_646
			when 647 then
					--|#line 3313 "et_eiffel_parser.y"
				yy_do_action_647
			when 648 then
					--|#line 3315 "et_eiffel_parser.y"
				yy_do_action_648
			when 649 then
					--|#line 3315 "et_eiffel_parser.y"
				yy_do_action_649
			when 650 then
					--|#line 3328 "et_eiffel_parser.y"
				yy_do_action_650
			when 651 then
					--|#line 3339 "et_eiffel_parser.y"
				yy_do_action_651
			when 652 then
					--|#line 3347 "et_eiffel_parser.y"
				yy_do_action_652
			when 653 then
					--|#line 3356 "et_eiffel_parser.y"
				yy_do_action_653
			when 654 then
					--|#line 3365 "et_eiffel_parser.y"
				yy_do_action_654
			when 655 then
					--|#line 3367 "et_eiffel_parser.y"
				yy_do_action_655
			when 656 then
					--|#line 3371 "et_eiffel_parser.y"
				yy_do_action_656
			when 657 then
					--|#line 3373 "et_eiffel_parser.y"
				yy_do_action_657
			when 658 then
					--|#line 3375 "et_eiffel_parser.y"
				yy_do_action_658
			when 659 then
					--|#line 3377 "et_eiffel_parser.y"
				yy_do_action_659
			when 660 then
					--|#line 3383 "et_eiffel_parser.y"
				yy_do_action_660
			when 661 then
					--|#line 3385 "et_eiffel_parser.y"
				yy_do_action_661
			when 662 then
					--|#line 3389 "et_eiffel_parser.y"
				yy_do_action_662
			when 663 then
					--|#line 3391 "et_eiffel_parser.y"
				yy_do_action_663
			when 664 then
					--|#line 3397 "et_eiffel_parser.y"
				yy_do_action_664
			when 665 then
					--|#line 3401 "et_eiffel_parser.y"
				yy_do_action_665
			when 666 then
					--|#line 3403 "et_eiffel_parser.y"
				yy_do_action_666
			when 667 then
					--|#line 3405 "et_eiffel_parser.y"
				yy_do_action_667
			when 668 then
					--|#line 3405 "et_eiffel_parser.y"
				yy_do_action_668
			when 669 then
					--|#line 3418 "et_eiffel_parser.y"
				yy_do_action_669
			when 670 then
					--|#line 3429 "et_eiffel_parser.y"
				yy_do_action_670
			when 671 then
					--|#line 3438 "et_eiffel_parser.y"
				yy_do_action_671
			when 672 then
					--|#line 3449 "et_eiffel_parser.y"
				yy_do_action_672
			when 673 then
					--|#line 3451 "et_eiffel_parser.y"
				yy_do_action_673
			when 674 then
					--|#line 3453 "et_eiffel_parser.y"
				yy_do_action_674
			when 675 then
					--|#line 3455 "et_eiffel_parser.y"
				yy_do_action_675
			when 676 then
					--|#line 3457 "et_eiffel_parser.y"
				yy_do_action_676
			when 677 then
					--|#line 3459 "et_eiffel_parser.y"
				yy_do_action_677
			when 678 then
					--|#line 3461 "et_eiffel_parser.y"
				yy_do_action_678
			when 679 then
					--|#line 3465 "et_eiffel_parser.y"
				yy_do_action_679
			when 680 then
					--|#line 3467 "et_eiffel_parser.y"
				yy_do_action_680
			when 681 then
					--|#line 3471 "et_eiffel_parser.y"
				yy_do_action_681
			when 682 then
					--|#line 3475 "et_eiffel_parser.y"
				yy_do_action_682
			when 683 then
					--|#line 3477 "et_eiffel_parser.y"
				yy_do_action_683
			when 684 then
					--|#line 3481 "et_eiffel_parser.y"
				yy_do_action_684
			when 685 then
					--|#line 3483 "et_eiffel_parser.y"
				yy_do_action_685
			when 686 then
					--|#line 3487 "et_eiffel_parser.y"
				yy_do_action_686
			when 687 then
					--|#line 3489 "et_eiffel_parser.y"
				yy_do_action_687
			when 688 then
					--|#line 3493 "et_eiffel_parser.y"
				yy_do_action_688
			when 689 then
					--|#line 3495 "et_eiffel_parser.y"
				yy_do_action_689
			when 690 then
					--|#line 3497 "et_eiffel_parser.y"
				yy_do_action_690
			when 691 then
					--|#line 3499 "et_eiffel_parser.y"
				yy_do_action_691
			when 692 then
					--|#line 3501 "et_eiffel_parser.y"
				yy_do_action_692
			when 693 then
					--|#line 3503 "et_eiffel_parser.y"
				yy_do_action_693
			when 694 then
					--|#line 3511 "et_eiffel_parser.y"
				yy_do_action_694
			when 695 then
					--|#line 3513 "et_eiffel_parser.y"
				yy_do_action_695
			when 696 then
					--|#line 3517 "et_eiffel_parser.y"
				yy_do_action_696
			when 697 then
					--|#line 3525 "et_eiffel_parser.y"
				yy_do_action_697
			when 698 then
					--|#line 3531 "et_eiffel_parser.y"
				yy_do_action_698
			when 699 then
					--|#line 3533 "et_eiffel_parser.y"
				yy_do_action_699
			when 700 then
					--|#line 3535 "et_eiffel_parser.y"
				yy_do_action_700
			when 701 then
					--|#line 3535 "et_eiffel_parser.y"
				yy_do_action_701
			when 702 then
					--|#line 3548 "et_eiffel_parser.y"
				yy_do_action_702
			when 703 then
					--|#line 3559 "et_eiffel_parser.y"
				yy_do_action_703
			when 704 then
					--|#line 3567 "et_eiffel_parser.y"
				yy_do_action_704
			when 705 then
					--|#line 3576 "et_eiffel_parser.y"
				yy_do_action_705
			when 706 then
					--|#line 3585 "et_eiffel_parser.y"
				yy_do_action_706
			when 707 then
					--|#line 3587 "et_eiffel_parser.y"
				yy_do_action_707
			when 708 then
					--|#line 3589 "et_eiffel_parser.y"
				yy_do_action_708
			when 709 then
					--|#line 3591 "et_eiffel_parser.y"
				yy_do_action_709
			when 710 then
					--|#line 3598 "et_eiffel_parser.y"
				yy_do_action_710
			when 711 then
					--|#line 3600 "et_eiffel_parser.y"
				yy_do_action_711
			when 712 then
					--|#line 3606 "et_eiffel_parser.y"
				yy_do_action_712
			when 713 then
					--|#line 3608 "et_eiffel_parser.y"
				yy_do_action_713
			when 714 then
					--|#line 3612 "et_eiffel_parser.y"
				yy_do_action_714
			when 715 then
					--|#line 3614 "et_eiffel_parser.y"
				yy_do_action_715
			when 716 then
					--|#line 3616 "et_eiffel_parser.y"
				yy_do_action_716
			when 717 then
					--|#line 3618 "et_eiffel_parser.y"
				yy_do_action_717
			when 718 then
					--|#line 3620 "et_eiffel_parser.y"
				yy_do_action_718
			when 719 then
					--|#line 3622 "et_eiffel_parser.y"
				yy_do_action_719
			when 720 then
					--|#line 3624 "et_eiffel_parser.y"
				yy_do_action_720
			when 721 then
					--|#line 3626 "et_eiffel_parser.y"
				yy_do_action_721
			when 722 then
					--|#line 3628 "et_eiffel_parser.y"
				yy_do_action_722
			when 723 then
					--|#line 3630 "et_eiffel_parser.y"
				yy_do_action_723
			when 724 then
					--|#line 3632 "et_eiffel_parser.y"
				yy_do_action_724
			when 725 then
					--|#line 3634 "et_eiffel_parser.y"
				yy_do_action_725
			when 726 then
					--|#line 3636 "et_eiffel_parser.y"
				yy_do_action_726
			when 727 then
					--|#line 3638 "et_eiffel_parser.y"
				yy_do_action_727
			when 728 then
					--|#line 3640 "et_eiffel_parser.y"
				yy_do_action_728
			when 729 then
					--|#line 3642 "et_eiffel_parser.y"
				yy_do_action_729
			when 730 then
					--|#line 3644 "et_eiffel_parser.y"
				yy_do_action_730
			when 731 then
					--|#line 3646 "et_eiffel_parser.y"
				yy_do_action_731
			when 732 then
					--|#line 3648 "et_eiffel_parser.y"
				yy_do_action_732
			when 733 then
					--|#line 3650 "et_eiffel_parser.y"
				yy_do_action_733
			when 734 then
					--|#line 3652 "et_eiffel_parser.y"
				yy_do_action_734
			when 735 then
					--|#line 3654 "et_eiffel_parser.y"
				yy_do_action_735
			when 736 then
					--|#line 3658 "et_eiffel_parser.y"
				yy_do_action_736
			when 737 then
					--|#line 3660 "et_eiffel_parser.y"
				yy_do_action_737
			when 738 then
					--|#line 3662 "et_eiffel_parser.y"
				yy_do_action_738
			when 739 then
					--|#line 3664 "et_eiffel_parser.y"
				yy_do_action_739
			when 740 then
					--|#line 3666 "et_eiffel_parser.y"
				yy_do_action_740
			when 741 then
					--|#line 3668 "et_eiffel_parser.y"
				yy_do_action_741
			when 742 then
					--|#line 3672 "et_eiffel_parser.y"
				yy_do_action_742
			when 743 then
					--|#line 3674 "et_eiffel_parser.y"
				yy_do_action_743
			when 744 then
					--|#line 3676 "et_eiffel_parser.y"
				yy_do_action_744
			when 745 then
					--|#line 3678 "et_eiffel_parser.y"
				yy_do_action_745
			when 746 then
					--|#line 3680 "et_eiffel_parser.y"
				yy_do_action_746
			when 747 then
					--|#line 3682 "et_eiffel_parser.y"
				yy_do_action_747
			when 748 then
					--|#line 3684 "et_eiffel_parser.y"
				yy_do_action_748
			when 749 then
					--|#line 3686 "et_eiffel_parser.y"
				yy_do_action_749
			when 750 then
					--|#line 3688 "et_eiffel_parser.y"
				yy_do_action_750
			when 751 then
					--|#line 3690 "et_eiffel_parser.y"
				yy_do_action_751
			when 752 then
					--|#line 3692 "et_eiffel_parser.y"
				yy_do_action_752
			when 753 then
					--|#line 3694 "et_eiffel_parser.y"
				yy_do_action_753
			when 754 then
					--|#line 3696 "et_eiffel_parser.y"
				yy_do_action_754
			when 755 then
					--|#line 3698 "et_eiffel_parser.y"
				yy_do_action_755
			when 756 then
					--|#line 3700 "et_eiffel_parser.y"
				yy_do_action_756
			when 757 then
					--|#line 3708 "et_eiffel_parser.y"
				yy_do_action_757
			when 758 then
					--|#line 3710 "et_eiffel_parser.y"
				yy_do_action_758
			when 759 then
					--|#line 3712 "et_eiffel_parser.y"
				yy_do_action_759
			when 760 then
					--|#line 3714 "et_eiffel_parser.y"
				yy_do_action_760
			when 761 then
					--|#line 3718 "et_eiffel_parser.y"
				yy_do_action_761
			when 762 then
					--|#line 3720 "et_eiffel_parser.y"
				yy_do_action_762
			when 763 then
					--|#line 3722 "et_eiffel_parser.y"
				yy_do_action_763
			when 764 then
					--|#line 3724 "et_eiffel_parser.y"
				yy_do_action_764
			when 765 then
					--|#line 3726 "et_eiffel_parser.y"
				yy_do_action_765
			when 766 then
					--|#line 3728 "et_eiffel_parser.y"
				yy_do_action_766
			when 767 then
					--|#line 3730 "et_eiffel_parser.y"
				yy_do_action_767
			when 768 then
					--|#line 3732 "et_eiffel_parser.y"
				yy_do_action_768
			when 769 then
					--|#line 3734 "et_eiffel_parser.y"
				yy_do_action_769
			when 770 then
					--|#line 3736 "et_eiffel_parser.y"
				yy_do_action_770
			when 771 then
					--|#line 3738 "et_eiffel_parser.y"
				yy_do_action_771
			when 772 then
					--|#line 3740 "et_eiffel_parser.y"
				yy_do_action_772
			when 773 then
					--|#line 3742 "et_eiffel_parser.y"
				yy_do_action_773
			when 774 then
					--|#line 3775 "et_eiffel_parser.y"
				yy_do_action_774
			when 775 then
					--|#line 3777 "et_eiffel_parser.y"
				yy_do_action_775
			when 776 then
					--|#line 3779 "et_eiffel_parser.y"
				yy_do_action_776
			when 777 then
					--|#line 3783 "et_eiffel_parser.y"
				yy_do_action_777
			when 778 then
					--|#line 3785 "et_eiffel_parser.y"
				yy_do_action_778
			when 779 then
					--|#line 3787 "et_eiffel_parser.y"
				yy_do_action_779
			when 780 then
					--|#line 3795 "et_eiffel_parser.y"
				yy_do_action_780
			when 781 then
					--|#line 3799 "et_eiffel_parser.y"
				yy_do_action_781
			when 782 then
					--|#line 3801 "et_eiffel_parser.y"
				yy_do_action_782
			when 783 then
					--|#line 3805 "et_eiffel_parser.y"
				yy_do_action_783
			when 784 then
					--|#line 3805 "et_eiffel_parser.y"
				yy_do_action_784
			when 785 then
					--|#line 3816 "et_eiffel_parser.y"
				yy_do_action_785
			when 786 then
					--|#line 3816 "et_eiffel_parser.y"
				yy_do_action_786
			when 787 then
					--|#line 3829 "et_eiffel_parser.y"
				yy_do_action_787
			when 788 then
					--|#line 3829 "et_eiffel_parser.y"
				yy_do_action_788
			when 789 then
					--|#line 3840 "et_eiffel_parser.y"
				yy_do_action_789
			when 790 then
					--|#line 3840 "et_eiffel_parser.y"
				yy_do_action_790
			when 791 then
					--|#line 3853 "et_eiffel_parser.y"
				yy_do_action_791
			when 792 then
					--|#line 3864 "et_eiffel_parser.y"
				yy_do_action_792
			when 793 then
					--|#line 3872 "et_eiffel_parser.y"
				yy_do_action_793
			when 794 then
					--|#line 3881 "et_eiffel_parser.y"
				yy_do_action_794
			when 795 then
					--|#line 3889 "et_eiffel_parser.y"
				yy_do_action_795
			when 796 then
					--|#line 3891 "et_eiffel_parser.y"
				yy_do_action_796
			when 797 then
					--|#line 3891 "et_eiffel_parser.y"
				yy_do_action_797
			when 798 then
					--|#line 3904 "et_eiffel_parser.y"
				yy_do_action_798
			when 799 then
					--|#line 3913 "et_eiffel_parser.y"
				yy_do_action_799
			when 800 then
					--|#line 3924 "et_eiffel_parser.y"
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
					--|#line 3932 "et_eiffel_parser.y"
				yy_do_action_801
			when 802 then
					--|#line 3941 "et_eiffel_parser.y"
				yy_do_action_802
			when 803 then
					--|#line 3943 "et_eiffel_parser.y"
				yy_do_action_803
			when 804 then
					--|#line 3943 "et_eiffel_parser.y"
				yy_do_action_804
			when 805 then
					--|#line 3956 "et_eiffel_parser.y"
				yy_do_action_805
			when 806 then
					--|#line 3967 "et_eiffel_parser.y"
				yy_do_action_806
			when 807 then
					--|#line 3975 "et_eiffel_parser.y"
				yy_do_action_807
			when 808 then
					--|#line 3984 "et_eiffel_parser.y"
				yy_do_action_808
			when 809 then
					--|#line 3986 "et_eiffel_parser.y"
				yy_do_action_809
			when 810 then
					--|#line 3986 "et_eiffel_parser.y"
				yy_do_action_810
			when 811 then
					--|#line 4001 "et_eiffel_parser.y"
				yy_do_action_811
			when 812 then
					--|#line 4012 "et_eiffel_parser.y"
				yy_do_action_812
			when 813 then
					--|#line 4020 "et_eiffel_parser.y"
				yy_do_action_813
			when 814 then
					--|#line 4029 "et_eiffel_parser.y"
				yy_do_action_814
			when 815 then
					--|#line 4031 "et_eiffel_parser.y"
				yy_do_action_815
			when 816 then
					--|#line 4033 "et_eiffel_parser.y"
				yy_do_action_816
			when 817 then
					--|#line 4035 "et_eiffel_parser.y"
				yy_do_action_817
			when 818 then
					--|#line 4037 "et_eiffel_parser.y"
				yy_do_action_818
			when 819 then
					--|#line 4041 "et_eiffel_parser.y"
				yy_do_action_819
			when 820 then
					--|#line 4045 "et_eiffel_parser.y"
				yy_do_action_820
			when 821 then
					--|#line 4049 "et_eiffel_parser.y"
				yy_do_action_821
			when 822 then
					--|#line 4051 "et_eiffel_parser.y"
				yy_do_action_822
			when 823 then
					--|#line 4057 "et_eiffel_parser.y"
				yy_do_action_823
			when 824 then
					--|#line 4059 "et_eiffel_parser.y"
				yy_do_action_824
			when 825 then
					--|#line 4063 "et_eiffel_parser.y"
				yy_do_action_825
			when 826 then
					--|#line 4070 "et_eiffel_parser.y"
				yy_do_action_826
			when 827 then
					--|#line 4080 "et_eiffel_parser.y"
				yy_do_action_827
			when 828 then
					--|#line 4086 "et_eiffel_parser.y"
				yy_do_action_828
			when 829 then
					--|#line 4092 "et_eiffel_parser.y"
				yy_do_action_829
			when 830 then
					--|#line 4098 "et_eiffel_parser.y"
				yy_do_action_830
			when 831 then
					--|#line 4104 "et_eiffel_parser.y"
				yy_do_action_831
			when 832 then
					--|#line 4110 "et_eiffel_parser.y"
				yy_do_action_832
			when 833 then
					--|#line 4116 "et_eiffel_parser.y"
				yy_do_action_833
			when 834 then
					--|#line 4122 "et_eiffel_parser.y"
				yy_do_action_834
			when 835 then
					--|#line 4128 "et_eiffel_parser.y"
				yy_do_action_835
			when 836 then
					--|#line 4133 "et_eiffel_parser.y"
				yy_do_action_836
			when 837 then
					--|#line 4139 "et_eiffel_parser.y"
				yy_do_action_837
			when 838 then
					--|#line 4147 "et_eiffel_parser.y"
				yy_do_action_838
			when 839 then
					--|#line 4154 "et_eiffel_parser.y"
				yy_do_action_839
			when 840 then
					--|#line 4158 "et_eiffel_parser.y"
				yy_do_action_840
			when 841 then
					--|#line 4160 "et_eiffel_parser.y"
				yy_do_action_841
			when 842 then
					--|#line 4162 "et_eiffel_parser.y"
				yy_do_action_842
			when 843 then
					--|#line 4164 "et_eiffel_parser.y"
				yy_do_action_843
			when 844 then
					--|#line 4166 "et_eiffel_parser.y"
				yy_do_action_844
			when 845 then
					--|#line 4170 "et_eiffel_parser.y"
				yy_do_action_845
			when 846 then
					--|#line 4172 "et_eiffel_parser.y"
				yy_do_action_846
			when 847 then
					--|#line 4174 "et_eiffel_parser.y"
				yy_do_action_847
			when 848 then
					--|#line 4174 "et_eiffel_parser.y"
				yy_do_action_848
			when 849 then
					--|#line 4187 "et_eiffel_parser.y"
				yy_do_action_849
			when 850 then
					--|#line 4198 "et_eiffel_parser.y"
				yy_do_action_850
			when 851 then
					--|#line 4206 "et_eiffel_parser.y"
				yy_do_action_851
			when 852 then
					--|#line 4215 "et_eiffel_parser.y"
				yy_do_action_852
			when 853 then
					--|#line 4224 "et_eiffel_parser.y"
				yy_do_action_853
			when 854 then
					--|#line 4226 "et_eiffel_parser.y"
				yy_do_action_854
			when 855 then
					--|#line 4228 "et_eiffel_parser.y"
				yy_do_action_855
			when 856 then
					--|#line 4234 "et_eiffel_parser.y"
				yy_do_action_856
			when 857 then
					--|#line 4236 "et_eiffel_parser.y"
				yy_do_action_857
			when 858 then
					--|#line 4240 "et_eiffel_parser.y"
				yy_do_action_858
			when 859 then
					--|#line 4242 "et_eiffel_parser.y"
				yy_do_action_859
			when 860 then
					--|#line 4244 "et_eiffel_parser.y"
				yy_do_action_860
			when 861 then
					--|#line 4246 "et_eiffel_parser.y"
				yy_do_action_861
			when 862 then
					--|#line 4248 "et_eiffel_parser.y"
				yy_do_action_862
			when 863 then
					--|#line 4250 "et_eiffel_parser.y"
				yy_do_action_863
			when 864 then
					--|#line 4252 "et_eiffel_parser.y"
				yy_do_action_864
			when 865 then
					--|#line 4254 "et_eiffel_parser.y"
				yy_do_action_865
			when 866 then
					--|#line 4256 "et_eiffel_parser.y"
				yy_do_action_866
			when 867 then
					--|#line 4258 "et_eiffel_parser.y"
				yy_do_action_867
			when 868 then
					--|#line 4260 "et_eiffel_parser.y"
				yy_do_action_868
			when 869 then
					--|#line 4262 "et_eiffel_parser.y"
				yy_do_action_869
			when 870 then
					--|#line 4264 "et_eiffel_parser.y"
				yy_do_action_870
			when 871 then
					--|#line 4266 "et_eiffel_parser.y"
				yy_do_action_871
			when 872 then
					--|#line 4268 "et_eiffel_parser.y"
				yy_do_action_872
			when 873 then
					--|#line 4270 "et_eiffel_parser.y"
				yy_do_action_873
			when 874 then
					--|#line 4272 "et_eiffel_parser.y"
				yy_do_action_874
			when 875 then
					--|#line 4274 "et_eiffel_parser.y"
				yy_do_action_875
			when 876 then
					--|#line 4276 "et_eiffel_parser.y"
				yy_do_action_876
			when 877 then
					--|#line 4278 "et_eiffel_parser.y"
				yy_do_action_877
			when 878 then
					--|#line 4280 "et_eiffel_parser.y"
				yy_do_action_878
			when 879 then
					--|#line 4282 "et_eiffel_parser.y"
				yy_do_action_879
			when 880 then
					--|#line 4284 "et_eiffel_parser.y"
				yy_do_action_880
			when 881 then
					--|#line 4286 "et_eiffel_parser.y"
				yy_do_action_881
			when 882 then
					--|#line 4290 "et_eiffel_parser.y"
				yy_do_action_882
			when 883 then
					--|#line 4299 "et_eiffel_parser.y"
				yy_do_action_883
			when 884 then
					--|#line 4301 "et_eiffel_parser.y"
				yy_do_action_884
			when 885 then
					--|#line 4305 "et_eiffel_parser.y"
				yy_do_action_885
			when 886 then
					--|#line 4307 "et_eiffel_parser.y"
				yy_do_action_886
			when 887 then
					--|#line 4311 "et_eiffel_parser.y"
				yy_do_action_887
			when 888 then
					--|#line 4320 "et_eiffel_parser.y"
				yy_do_action_888
			when 889 then
					--|#line 4322 "et_eiffel_parser.y"
				yy_do_action_889
			when 890 then
					--|#line 4326 "et_eiffel_parser.y"
				yy_do_action_890
			when 891 then
					--|#line 4328 "et_eiffel_parser.y"
				yy_do_action_891
			when 892 then
					--|#line 4332 "et_eiffel_parser.y"
				yy_do_action_892
			when 893 then
					--|#line 4334 "et_eiffel_parser.y"
				yy_do_action_893
			when 894 then
					--|#line 4338 "et_eiffel_parser.y"
				yy_do_action_894
			when 895 then
					--|#line 4345 "et_eiffel_parser.y"
				yy_do_action_895
			when 896 then
					--|#line 4354 "et_eiffel_parser.y"
				yy_do_action_896
			when 897 then
					--|#line 4363 "et_eiffel_parser.y"
				yy_do_action_897
			when 898 then
					--|#line 4365 "et_eiffel_parser.y"
				yy_do_action_898
			when 899 then
					--|#line 4369 "et_eiffel_parser.y"
				yy_do_action_899
			when 900 then
					--|#line 4371 "et_eiffel_parser.y"
				yy_do_action_900
			when 901 then
					--|#line 4375 "et_eiffel_parser.y"
				yy_do_action_901
			when 902 then
					--|#line 4382 "et_eiffel_parser.y"
				yy_do_action_902
			when 903 then
					--|#line 4391 "et_eiffel_parser.y"
				yy_do_action_903
			when 904 then
					--|#line 4400 "et_eiffel_parser.y"
				yy_do_action_904
			when 905 then
					--|#line 4402 "et_eiffel_parser.y"
				yy_do_action_905
			when 906 then
					--|#line 4404 "et_eiffel_parser.y"
				yy_do_action_906
			when 907 then
					--|#line 4410 "et_eiffel_parser.y"
				yy_do_action_907
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
			--|#line 242 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 242 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 242")
end

			-- END
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp44 := yyvsp44 -1
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
			--|#line 246 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 246 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 246")
end

			if attached yyvs44.item (yyvsp44) as l_class_declaration then
				l_class_declaration.set_leading_break (yyvs8.item (yyvsp8))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp44 := yyvsp44 -1
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
			--|#line 254 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 254 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 254")
end

			yyval44 := yyvs44.item (yyvsp44)
			if yyval44 /= Void then
				yyval44.set_first_indexing (yyvs86.item (yyvsp86))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp86 := yyvsp86 -1
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
		end

	yy_do_action_4
			--|#line 263 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 263 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 263")
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
			--|#line 264 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 264 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 264")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp44 := yyvsp44 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_6
			--|#line 264 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 264 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 264")
end

			if not system_processor.preparse_multiple_mode then
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
			--|#line 275 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 275 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 275")
end

			yyval44 := yyvs44.item (yyvsp44)
			set_class_to_end (yyval44, yyvs105.item (yyvsp105), yyvs108.item (yyvsp108), yyvs61.item (yyvsp61), yyvs57.item (yyvsp57), yyvs74.item (yyvsp74), yyvs94.item (yyvsp94), yyvs86.item (yyvsp86), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp83 := yyvsp83 -1
	yyvsp105 := yyvsp105 -1
	yyvsp108 := yyvsp108 -1
	yyvsp61 := yyvsp61 -1
	yyvsp57 := yyvsp57 -1
	yyvsp74 := yyvsp74 -1
	yyvsp94 := yyvsp94 -1
	yyvsp86 := yyvsp86 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
		end

	yy_do_action_8
			--|#line 283 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 283 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 283")
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
			--|#line 288 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 288 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 288")
end

yyval86 := ast_factory.new_indexings (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp86 := yyvsp86 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_10
			--|#line 290 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 290 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 290")
end

			yyval86 := yyvs86.item (yyvsp86)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp86 := yyvsp86 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines86.force (yyvs86, yyval86, yyvsp86)
end
		end

	yy_do_action_11
			--|#line 290 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 290 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 290")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp86 := yyvsp86 + 1
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

	yy_do_action_12
			--|#line 301 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 301 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 301")
end

yyval86 := ast_factory.new_indexings (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp86 := yyvsp86 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_13
			--|#line 303 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 303 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 303")
end

			yyval86 := yyvs86.item (yyvsp86)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp86 := yyvsp86 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines86.force (yyvs86, yyval86, yyvsp86)
end
		end

	yy_do_action_14
			--|#line 303 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 303 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 303")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp86 := yyvsp86 + 1
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

	yy_do_action_15
			--|#line 316 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 316 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 316")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp86 := yyvsp86 + 1
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

	yy_do_action_16
			--|#line 318 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 318 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 318")
end

yyval86 := yyvs86.item (yyvsp86) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines86.force (yyvs86, yyval86, yyvsp86)
end
		end

	yy_do_action_17
			--|#line 322 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 322 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 322")
end

			if attached yyvs87.item (yyvsp87) as l_note then
				yyval86 := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if yyval86 /= Void then
					yyval86.put_first (l_note)
				end
			else
				yyval86 := ast_factory.new_indexings (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp86 := yyvsp86 + 1
	yyvsp87 := yyvsp87 -1
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

	yy_do_action_18
			--|#line 333 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 333 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 333")
end

			yyval86 := yyvs86.item (yyvsp86)
			if yyval86 /= Void and attached yyvs87.item (yyvsp87) as l_note then
				yyval86.put_first (l_note)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp86 := yyvsp86 -1
	yyvsp87 := yyvsp87 -1
	yyspecial_routines86.force (yyvs86, yyval86, yyvsp86)
end
		end

	yy_do_action_19
			--|#line 333 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 333 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 333")
end

increment_counter 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp86 := yyvsp86 + 1
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

	yy_do_action_20
			--|#line 342 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 342 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 342")
end

			yyval86 := yyvs86.item (yyvsp86)
			if yyval86 /= Void and attached yyvs87.item (yyvsp87) as l_note then
				yyval86.put_first (l_note)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp86 := yyvsp86 -1
	yyvsp87 := yyvsp87 -1
	yyspecial_routines86.force (yyvs86, yyval86, yyvsp86)
end
		end

	yy_do_action_21
			--|#line 342 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 342 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 342")
end

increment_counter 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp86 := yyvsp86 + 1
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

	yy_do_action_22
			--|#line 353 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 353 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 353")
end

			yyval87 := yyvs87.item (yyvsp87)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_23
			--|#line 360 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 360 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 360")
end

			yyval87 := ast_factory.new_tagged_indexing (ast_factory.new_tag (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyvs90.item (yyvsp90))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp90 := yyvsp90 -1
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

	yy_do_action_24
			--|#line 366 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 366 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 366")
end

yyval87 := ast_factory.new_indexing_semicolon (yyvs87.item (yyvsp87), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 -1
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_25
			--|#line 370 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 370 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 370")
end

			if attached yyvs87.item (yyvsp87) as l_indexing_clause then
				yyval86 := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if yyval86 /= Void then
					yyval86.put_first (l_indexing_clause)
				end
			else
				yyval86 := ast_factory.new_indexings (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp86 := yyvsp86 + 1
	yyvsp87 := yyvsp87 -1
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

	yy_do_action_26
			--|#line 381 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 381 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 381")
end

			if attached yyvs87.item (yyvsp87) as l_indexing_clause then
				yyval86 := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if yyval86 /= Void then
					yyval86.put_first (l_indexing_clause)
				end
			else
				yyval86 := ast_factory.new_indexings (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp86 := yyvsp86 + 1
	yyvsp87 := yyvsp87 -1
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

	yy_do_action_27
			--|#line 393 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 393 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 393")
end

			yyval86 := yyvs86.item (yyvsp86)
			if yyval86 /= Void and attached yyvs87.item (yyvsp87) as l_indexing_clause then
				yyval86.put_first (l_indexing_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp86 := yyvsp86 -1
	yyvsp87 := yyvsp87 -1
	yyspecial_routines86.force (yyvs86, yyval86, yyvsp86)
end
		end

	yy_do_action_28
			--|#line 393 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 393 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 393")
end

increment_counter 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp86 := yyvsp86 + 1
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

	yy_do_action_29
			--|#line 402 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 402 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 402")
end

			yyval86 := yyvs86.item (yyvsp86)
			if yyval86 /= Void and attached yyvs87.item (yyvsp87) as l_indexing_clause then
				yyval86.put_first (l_indexing_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp86 := yyvsp86 -1
	yyvsp87 := yyvsp87 -1
	yyspecial_routines86.force (yyvs86, yyval86, yyvsp86)
end
		end

	yy_do_action_30
			--|#line 402 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 402 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 402")
end

increment_counter 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp86 := yyvsp86 + 1
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

	yy_do_action_31
			--|#line 413 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 413 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 413")
end

			yyval87 := yyvs87.item (yyvsp87)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_32
			--|#line 420 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 420 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 420")
end

			yyval87 := ast_factory.new_indexing (yyvs90.item (yyvsp90))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp87 := yyvsp87 + 1
	yyvsp90 := yyvsp90 -1
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

	yy_do_action_33
			--|#line 424 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 424 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 424")
end

			yyval87 := ast_factory.new_tagged_indexing (ast_factory.new_tag (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyvs90.item (yyvsp90))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp87 := yyvsp87 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp90 := yyvsp90 -1
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

	yy_do_action_34
			--|#line 430 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 430 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 430")
end

yyval87 := ast_factory.new_indexing_semicolon (yyvs87.item (yyvsp87), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 -1
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_35
			--|#line 432 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 432 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 432")
end

yyval87 := ast_factory.new_indexing_semicolon (yyvs87.item (yyvsp87), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 -1
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_36
			--|#line 437 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_INDEXING_TERM_LIST
		do
--|#line 437 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 437")
end

			if attached yyvs88.item (yyvsp88) as l_index_value then
				yyval90 := ast_factory.new_indexing_terms (counter_value + 1)
				if yyval90 /= Void then
					yyval90.put_first (l_index_value)
				end
			else
				yyval90 := ast_factory.new_indexing_terms (counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp90 := yyvsp90 + 1
	yyvsp88 := yyvsp88 -1
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

	yy_do_action_37
			--|#line 448 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_INDEXING_TERM_LIST
		do
--|#line 448 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 448")
end

			yyval90 := yyvs90.item (yyvsp90)
			if yyval90 /= Void and attached yyvs89.item (yyvsp89) as l_index_value then
				yyval90.put_first (l_index_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp89 := yyvsp89 -1
	yyspecial_routines90.force (yyvs90, yyval90, yyvsp90)
end
		end

	yy_do_action_38
			--|#line 457 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 457 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 457")
end

yyval88 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp88 := yyvsp88 + 1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_39
			--|#line 459 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 459 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 459")
end

yyval88 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp88 := yyvsp88 + 1
	yyvsp7 := yyvsp7 -1
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

	yy_do_action_40
			--|#line 461 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 461 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 461")
end

yyval88 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp88 := yyvsp88 + 1
	yyvsp9 := yyvsp9 -1
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

	yy_do_action_41
			--|#line 463 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 463 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 463")
end

yyval88 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp88 := yyvsp88 + 1
	yyvsp13 := yyvsp13 -1
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

	yy_do_action_42
			--|#line 465 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 465 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 465")
end

yyval88 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp88 := yyvsp88 + 1
	yyvsp16 := yyvsp16 -1
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

	yy_do_action_43
			--|#line 467 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 467 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 467")
end

yyval88 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp88 := yyvsp88 + 1
	yyvsp15 := yyvsp15 -1
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

	yy_do_action_44
			--|#line 469 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 469 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 469")
end

yyval88 := ast_factory.new_custom_attribute (yyvs58.item (yyvsp58), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp88 := yyvsp88 + 1
	yyvsp58 := yyvsp58 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_45
			--|#line 471 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 471 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 471")
end

yyval88 := ast_factory.new_custom_attribute (yyvs58.item (yyvsp58), yyvs104.item (yyvsp104), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp88 := yyvsp88 + 1
	yyvsp58 := yyvsp58 -1
	yyvsp104 := yyvsp104 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_46
			--|#line 475 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_INDEXING_TERM_ITEM
		do
--|#line 475 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 475")
end

			yyval89 := ast_factory.new_indexing_term_comma (yyvs88.item (yyvsp88), yyvs5.item (yyvsp5))
			if yyval89 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp89 := yyvsp89 + 1
	yyvsp88 := yyvsp88 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_47
			--|#line 486 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 486 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 486")
end

			yyval44 := new_class (yyvs12.item (yyvsp12))
			if yyval44 /= Void then
				if attached yyvs2.item (yyvsp2) as l_class_keyword then
					yyval44.set_class_keyword (l_class_keyword)
				end
				yyval44.set_frozen_keyword (yyvs2.item (yyvsp2 - 2))
				yyval44.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval44
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp44 := yyvsp44 + 1
	yyvsp2 := yyvsp2 -3
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

	yy_do_action_48
			--|#line 498 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 498 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 498")
end

			yyval44 := new_class (yyvs12.item (yyvsp12))
			if yyval44 /= Void then
				if attached yyvs2.item (yyvsp2) as l_class_keyword then
					yyval44.set_class_keyword (l_class_keyword)
				end
				yyval44.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval44.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval44.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval44
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp44 := yyvsp44 + 1
	yyvsp2 := yyvsp2 -4
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

	yy_do_action_49
			--|#line 511 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 511 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 511")
end

			yyval44 := new_class (yyvs12.item (yyvsp12))
			if yyval44 /= Void then
				if attached yyvs2.item (yyvsp2) as l_class_keyword then
					yyval44.set_class_keyword (l_class_keyword)
				end
				yyval44.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval44.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval44.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval44
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp44 := yyvsp44 + 1
	yyvsp2 := yyvsp2 -4
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

	yy_do_action_50
			--|#line 524 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 524 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 524")
end

			yyval44 := new_class (yyvs12.item (yyvsp12))
			if yyval44 /= Void then
				if attached yyvs2.item (yyvsp2) as l_class_keyword then
					yyval44.set_class_keyword (l_class_keyword)
				end
				yyval44.set_class_mark (yyvs2.item (yyvsp2 - 2))
				yyval44.set_frozen_keyword (yyvs2.item (yyvsp2 - 3))
				yyval44.set_external_keyword (yyvs2.item (yyvsp2 - 1))
			end
			last_class := yyval44
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp44 := yyvsp44 + 1
	yyvsp2 := yyvsp2 -4
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

	yy_do_action_51
			--|#line 539 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 539 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 539")
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
			--|#line 541 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 541 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 541")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_53
			--|#line 545 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 545 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 545")
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
			--|#line 547 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 547 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 547")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_55
			--|#line 553 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 553 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 553")
end

			set_formal_parameters (Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
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

	yy_do_action_56
			--|#line 557 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 557 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 557")
end

			yyval83 := ast_factory.new_formal_parameters (yyvs22.item (yyvsp22), yyvs5.item (yyvsp5), 0)
			set_formal_parameters (yyval83)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp83 := yyvsp83 + 1
	yyvsp22 := yyvsp22 -1
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

	yy_do_action_57
			--|#line 563 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 563 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 563")
end

			yyval83 := yyvs83.item (yyvsp83)
			set_formal_parameters (yyval83)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp83 := yyvsp83 -1
	yyvsp22 := yyvsp22 -1
	yyspecial_routines83.force (yyvs83, yyval83, yyvsp83)
end
		end

	yy_do_action_58
			--|#line 563 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 563 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 563")
end

			add_symbol (yyvs22.item (yyvsp22))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp83 := yyvsp83 + 1
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

	yy_do_action_59
			--|#line 577 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 577 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 577")
end

			if attached yyvs81.item (yyvsp81) as l_formal_parameter then
				yyval83 := ast_factory.new_formal_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval83 /= Void then
					yyval83.put_first (l_formal_parameter)
				end
			else
				yyval83 := ast_factory.new_formal_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp83 := yyvsp83 + 1
	yyvsp81 := yyvsp81 -1
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

	yy_do_action_60
			--|#line 588 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 588 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 588")
end

			yyval83 := yyvs83.item (yyvsp83)
			if yyval83 /= Void and attached yyvs82.item (yyvsp82) as l_formal_parameter then
				yyval83.put_first (l_formal_parameter)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp82 := yyvsp82 -1
	yyspecial_routines83.force (yyvs83, yyval83, yyvsp83)
end
		end

	yy_do_action_61
			--|#line 597 "et_eiffel_parser.y"
		local
			yyval82: detachable ET_FORMAL_PARAMETER_ITEM
		do
--|#line 597 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 597")
end

			yyval82 := ast_factory.new_formal_parameter_comma (yyvs81.item (yyvsp81), yyvs5.item (yyvsp5))
			if yyval82 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp82 := yyvsp82 + 1
	yyvsp81 := yyvsp81 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_62
			--|#line 606 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 606 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 606")
end

yyval81 := ast_factory.new_formal_parameter (Void, yyvs12.item (yyvsp12), last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp81 := yyvsp81 + 1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_63
			--|#line 608 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 608 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 608")
end

yyval81 := ast_factory.new_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp81 := yyvsp81 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_64
			--|#line 610 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 610 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 610")
end

yyval81 := ast_factory.new_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp81 := yyvsp81 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_65
			--|#line 612 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 612 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 612")
end

yyval81 := ast_factory.new_constrained_formal_parameter (Void, yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs121.item (yyvsp121), yyvs52.item (yyvsp52), last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp81 := yyvsp81 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp121 := yyvsp121 -1
	yyvsp52 := yyvsp52 -1
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

	yy_do_action_66
			--|#line 614 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 614 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 614")
end

yyval81 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs121.item (yyvsp121), yyvs52.item (yyvsp52), last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp81 := yyvsp81 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp121 := yyvsp121 -1
	yyvsp52 := yyvsp52 -1
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

	yy_do_action_67
			--|#line 616 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 616 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 616")
end

yyval81 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs121.item (yyvsp121), yyvs52.item (yyvsp52), last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp81 := yyvsp81 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp121 := yyvsp121 -1
	yyvsp52 := yyvsp52 -1
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

	yy_do_action_68
			--|#line 618 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 618 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 618")
end

yyval81 := ast_factory.new_constrained_formal_parameter (Void, yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs123.item (yyvsp123), yyvs52.item (yyvsp52), last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp81 := yyvsp81 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp123 := yyvsp123 -1
	yyvsp52 := yyvsp52 -1
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

	yy_do_action_69
			--|#line 620 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 620 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 620")
end

yyval81 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs123.item (yyvsp123), yyvs52.item (yyvsp52), last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp81 := yyvsp81 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp123 := yyvsp123 -1
	yyvsp52 := yyvsp52 -1
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

	yy_do_action_70
			--|#line 622 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 622 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 622")
end

yyval81 := ast_factory.new_constrained_formal_parameter (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs123.item (yyvsp123), yyvs52.item (yyvsp52), last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp81 := yyvsp81 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp123 := yyvsp123 -1
	yyvsp52 := yyvsp52 -1
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

	yy_do_action_71
			--|#line 626 "et_eiffel_parser.y"
		local
			yyval121: detachable ET_TYPE_CONSTRAINT
		do
--|#line 626 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 626")
end

			yyval121 := dummy_constraint (yyvs54.item (yyvsp54))
			if yyval121 /= Void then
				register_constraint (yyvs54.item (yyvsp54))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp121 := yyvsp121 + 1
	yyvsp54 := yyvsp54 -1
	if yyvsp121 >= yyvsc121 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs121")
		end
		yyvsc121 := yyvsc121 + yyInitial_yyvs_size
		yyvs121 := yyspecial_routines121.aliased_resized_area (yyvs121, yyvsc121)
	end
	yyspecial_routines121.force (yyvs121, yyval121, yyvsp121)
end
		end

	yy_do_action_72
			--|#line 633 "et_eiffel_parser.y"
		local
			yyval121: detachable ET_TYPE_CONSTRAINT
		do
--|#line 633 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 633")
end

			yyval121 := ast_factory.new_type_rename_constraint (dummy_constraint (yyvs54.item (yyvsp54)), yyvs53.item (yyvsp53))
			if yyval121 /= Void then
				register_constraint (yyvs54.item (yyvsp54))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp121 := yyvsp121 + 1
	yyvsp54 := yyvsp54 -1
	yyvsp53 := yyvsp53 -1
	if yyvsp121 >= yyvsc121 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs121")
		end
		yyvsc121 := yyvsc121 + yyInitial_yyvs_size
		yyvs121 := yyspecial_routines121.aliased_resized_area (yyvs121, yyvsc121)
	end
	yyspecial_routines121.force (yyvs121, yyval121, yyvsp121)
end
		end

	yy_do_action_73
			--|#line 642 "et_eiffel_parser.y"
		local
			yyval123: detachable ET_TYPE_CONSTRAINT_LIST
		do
--|#line 642 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 642")
end

			yyval123 := yyvs123.item (yyvsp123)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp123 := yyvsp123 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines123.force (yyvs123, yyval123, yyvsp123)
end
		end

	yy_do_action_74
			--|#line 642 "et_eiffel_parser.y"
		local
			yyval123: detachable ET_TYPE_CONSTRAINT_LIST
		do
--|#line 642 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 642")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp123 := yyvsp123 + 1
	if yyvsp123 >= yyvsc123 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs123")
		end
		yyvsc123 := yyvsc123 + yyInitial_yyvs_size
		yyvs123 := yyspecial_routines123.aliased_resized_area (yyvs123, yyvsc123)
	end
	yyspecial_routines123.force (yyvs123, yyval123, yyvsp123)
end
		end

	yy_do_action_75
			--|#line 655 "et_eiffel_parser.y"
		local
			yyval123: detachable ET_TYPE_CONSTRAINT_LIST
		do
--|#line 655 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 655")
end

			if attached yyvs121.item (yyvsp121) as l_type_constraint then
				yyval123 := ast_factory.new_type_constraint_list (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval123 /= Void then
					yyval123.put_first (l_type_constraint)
				end
			else
				yyval123 := ast_factory.new_type_constraint_list (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp123 := yyvsp123 + 1
	yyvsp121 := yyvsp121 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp123 >= yyvsc123 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs123")
		end
		yyvsc123 := yyvsc123 + yyInitial_yyvs_size
		yyvs123 := yyspecial_routines123.aliased_resized_area (yyvs123, yyvsc123)
	end
	yyspecial_routines123.force (yyvs123, yyval123, yyvsp123)
end
		end

	yy_do_action_76
			--|#line 666 "et_eiffel_parser.y"
		local
			yyval123: detachable ET_TYPE_CONSTRAINT_LIST
		do
--|#line 666 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 666")
end

			yyval123 := yyvs123.item (yyvsp123)
			if yyval123 /= Void and attached yyvs122.item (yyvsp122) as l_type_constraint then
				yyval123.put_first (l_type_constraint)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp122 := yyvsp122 -1
	yyspecial_routines123.force (yyvs123, yyval123, yyvsp123)
end
		end

	yy_do_action_77
			--|#line 675 "et_eiffel_parser.y"
		local
			yyval122: detachable ET_TYPE_CONSTRAINT_ITEM
		do
--|#line 675 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 675")
end

			yyval122 := ast_factory.new_type_constraint_comma (yyvs121.item (yyvsp121), yyvs5.item (yyvsp5))
			if yyval122 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp122 := yyvsp122 + 1
	yyvsp121 := yyvsp121 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp122 >= yyvsc122 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs122")
		end
		yyvsc122 := yyvsc122 + yyInitial_yyvs_size
		yyvs122 := yyspecial_routines122.aliased_resized_area (yyvs122, yyvsc122)
	end
	yyspecial_routines122.force (yyvs122, yyval122, yyvsp122)
end
		end

	yy_do_action_78
			--|#line 684 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 684 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 684")
end

yyval53 := ast_factory.new_constraint_renames (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp53 := yyvsp53 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_79
			--|#line 686 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 686 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 686")
end

			yyval53 := yyvs53.item (yyvsp53)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp53 := yyvsp53 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
		end

	yy_do_action_80
			--|#line 686 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 686 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 686")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp53 := yyvsp53 + 1
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

	yy_do_action_81
			--|#line 699 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 699 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 699")
end

			if attached yyvs116.item (yyvsp116) as l_rename then
				yyval53 := ast_factory.new_constraint_renames (last_keyword, yyvs2.item (yyvsp2), counter_value + 1)
				if yyval53 /= Void then
					yyval53.put_first (l_rename)
				end
			else
				yyval53 := ast_factory.new_constraint_renames (last_keyword, yyvs2.item (yyvsp2), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp53 := yyvsp53 + 1
	yyvsp116 := yyvsp116 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_82
			--|#line 710 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 710 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 710")
end

			yyval53 := ast_factory.new_constraint_renames (last_keyword, yyvs2.item (yyvsp2), counter_value)
			if yyval53 /= Void and attached yyvs116.item (yyvsp116) as l_rename then
				yyval53.put_first (l_rename)
			end
				-- TODO: syntax error.
			raise_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp53 := yyvsp53 + 1
	yyvsp116 := yyvsp116 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_83
			--|#line 719 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 719 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 719")
end

			yyval53 := yyvs53.item (yyvsp53)
			if yyval53 /= Void and attached yyvs116.item (yyvsp116) as l_rename then
				yyval53.put_first (l_rename)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp116 := yyvsp116 -1
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
		end

	yy_do_action_84
			--|#line 728 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 728 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 728")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp52 := yyvsp52 + 1
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
			--|#line 730 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 730 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 730")
end

yyval52 := yyvs52.item (yyvsp52) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_86
			--|#line 734 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 734 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 734")
end

yyval52 := ast_factory.new_constraint_creator (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -2
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
			--|#line 736 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 736 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 736")
end

			yyval52 := yyvs52.item (yyvsp52)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_88
			--|#line 736 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 736 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 736")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp52 := yyvsp52 + 1
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
			--|#line 749 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 749 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 749")
end

			if attached yyvs12.item (yyvsp12) as l_identifier then
				l_identifier.set_feature_name (True)
				yyval52 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value + 1)
				if yyval52 /= Void then
					yyval52.put_first (l_identifier)
				end
			else
				yyval52 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp52 := yyvsp52 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp2 := yyvsp2 -1
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
			--|#line 761 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 761 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 761")
end

			yyval52 := ast_factory.new_constraint_creator (last_keyword, yyvs2.item (yyvsp2), counter_value)
			if yyval52 /= Void and attached yyvs77.item (yyvsp77) as l_creation_procedure then
				yyval52.put_first (l_creation_procedure)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp52 := yyvsp52 + 1
	yyvsp77 := yyvsp77 -1
	yyvsp2 := yyvsp2 -1
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
			--|#line 769 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 769 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 769")
end

			yyval52 := yyvs52.item (yyvsp52)
			if yyval52 /= Void and attached yyvs77.item (yyvsp77) as l_creation_procedure then
				yyval52.put_first (l_creation_procedure)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp77 := yyvsp77 -1
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_92
			--|#line 778 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 778 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 778")
end

yyval54 := new_constraint_named_type (Void, yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp54 := yyvsp54 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_93
			--|#line 780 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 780 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 780")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_94
			--|#line 782 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 782 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 782")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_95
			--|#line 784 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 784 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 784")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_96
			--|#line 786 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 786 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 786")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_97
			--|#line 788 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 788 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 788")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_98
			--|#line 790 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 790 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 790")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_99
			--|#line 792 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 792 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 792")
end

yyval54 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_100
			--|#line 794 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 794 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 794")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_101
			--|#line 796 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 796 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 796")
end

yyval54 := new_constraint_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_102
			--|#line 798 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 798 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 798")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_103
			--|#line 800 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 800 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 800")
end

yyval54 := yyvs96.item (yyvsp96) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp96 := yyvsp96 -1
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

	yy_do_action_104
			--|#line 802 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 802 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 802")
end

yyval54 := new_constraint_named_type (Void, yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp54 := yyvsp54 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_105
			--|#line 804 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 804 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 804")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_106
			--|#line 806 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 806 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 806")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_107
			--|#line 808 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 808 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 808")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_108
			--|#line 810 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 810 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 810")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_109
			--|#line 812 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 812 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 812")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_110
			--|#line 814 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 814 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 814")
end

yyval54 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_111
			--|#line 816 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 816 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 816")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_112
			--|#line 818 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 818 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 818")
end

yyval54 := new_constraint_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_113
			--|#line 820 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 820 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 820")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_114
			--|#line 824 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 824 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 824")
end

yyval54 := new_constraint_named_type (Void, yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp54 := yyvsp54 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_115
			--|#line 826 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 826 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 826")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_116
			--|#line 828 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 828 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 828")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_117
			--|#line 830 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 830 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 830")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_118
			--|#line 832 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 832 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 832")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_119
			--|#line 834 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 834 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 834")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_120
			--|#line 836 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 836 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 836")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_121
			--|#line 838 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 838 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 838")
end

yyval54 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_122
			--|#line 840 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 840 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 840")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_123
			--|#line 842 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 842 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 842")
end

yyval54 := new_constraint_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_124
			--|#line 844 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 844 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 844")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_125
			--|#line 846 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 846 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 846")
end

yyval54 := yyvs96.item (yyvsp96) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp96 := yyvsp96 -1
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

	yy_do_action_126
			--|#line 848 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 848 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 848")
end

yyval54 := new_constraint_named_type (Void, yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp54 := yyvsp54 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_127
			--|#line 850 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 850 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 850")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_128
			--|#line 852 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 852 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 852")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_129
			--|#line 854 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 854 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 854")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_130
			--|#line 856 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 856 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 856")
end

yyval54 := new_constraint_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_131
			--|#line 858 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 858 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 858")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_132
			--|#line 860 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 860 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 860")
end

yyval54 := new_constraint_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_133
			--|#line 862 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 862 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 862")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_134
			--|#line 864 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 864 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 864")
end

yyval54 := new_constraint_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp54 := yyvsp54 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_135
			--|#line 866 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 866 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 866")
end

yyval54 := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs51.item (yyvsp51)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp54 := yyvsp54 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp51 := yyvsp51 -1
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

	yy_do_action_136
			--|#line 870 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 870 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 870")
end


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

	yy_do_action_137
			--|#line 872 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 872 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 872")
end

yyval51 := yyvs51.item (yyvsp51) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_138
			--|#line 876 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 876 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 876")
end

yyval51 := ast_factory.new_constraint_actual_parameters (yyvs22.item (yyvsp22), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp51 := yyvsp51 + 1
	yyvsp22 := yyvsp22 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_139
			--|#line 879 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 879 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 879")
end

			yyval51 := yyvs51.item (yyvsp51)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_140
			--|#line 887 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 887 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 887")
end

			if attached yyvs54.item (yyvsp54) as l_constraint_type then
				yyval51 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval51 /= Void then
					yyval51.put_first (l_constraint_type)
				end
			else
				yyval51 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp51 := yyvsp51 + 1
	yyvsp54 := yyvsp54 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_141
			--|#line 898 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 898 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 898")
end

			yyval51 := yyvs51.item (yyvsp51)
			add_to_constraint_actual_parameter_list (yyvs50.item (yyvsp50), yyval51)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_142
			--|#line 903 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 903 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 903")
end

			yyval51 := yyvs51.item (yyvsp51)
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_actual_parameter_comma (new_constraint_named_type (Void, yyvs12.item (yyvsp12), Void), yyvs5.item (yyvsp5)), yyval51)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_143
			--|#line 910 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 910 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 910")
end

			yyval50 := ast_factory.new_constraint_actual_parameter_comma (yyvs54.item (yyvsp54), yyvs5.item (yyvsp5))
			if yyval50 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 + 1
	yyvsp54 := yyvsp54 -1
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

	yy_do_action_144
			--|#line 919 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 919 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 919")
end


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

	yy_do_action_145
			--|#line 921 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 921 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 921")
end

yyval51 := yyvs51.item (yyvsp51) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_146
			--|#line 925 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 925 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 925")
end

yyval51 := ast_factory.new_constraint_actual_parameters (yyvs22.item (yyvsp22), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp51 := yyvsp51 + 1
	yyvsp22 := yyvsp22 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_147
			--|#line 928 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 928 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 928")
end

			yyval51 := yyvs51.item (yyvsp51)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_148
			--|#line 934 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 934 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 934")
end

			yyval51 := yyvs51.item (yyvsp51)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_149
			--|#line 942 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 942 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 942")
end

			yyval51 := ast_factory.new_constraint_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_actual_parameter (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5 - 1), yyvs54.item (yyvsp54)), yyval51)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp51 := yyvsp51 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -2
	yyvsp54 := yyvsp54 -1
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

	yy_do_action_150
			--|#line 947 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 947 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 947")
end

			yyval51 := yyvs51.item (yyvsp51)
			add_to_constraint_actual_parameter_list (yyvs50.item (yyvsp50), yyvs51.item (yyvsp51))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_151
			--|#line 952 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 952 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 952")
end

			yyval51 := yyvs51.item (yyvsp51)
			add_to_constraint_actual_parameter_list (yyvs50.item (yyvsp50), yyvs51.item (yyvsp51))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp50 := yyvsp50 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_152
			--|#line 957 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 957 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 957")
end

			yyval51 := yyvs51.item (yyvsp51)
			if yyval51 /= Void then
				if not yyval51.is_empty then
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyval51.first.type), yyval51)
				else
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), Void), yyval51)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_153
			--|#line 970 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 970 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 970")
end

			yyval50 := ast_factory.new_constraint_labeled_actual_parameter (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs54.item (yyvsp54))
			if yyval50 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp50 := yyvsp50 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp54 := yyvsp54 -1
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

	yy_do_action_154
			--|#line 979 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 979 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 979")
end

			yyval50 := ast_factory.new_constraint_labeled_actual_parameter_semicolon (ast_factory.new_constraint_labeled_actual_parameter (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), yyvs54.item (yyvsp54)), yyvs21.item (yyvsp21))
			if yyval50 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp50 := yyvsp50 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp54 := yyvsp54 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_155
			--|#line 990 "et_eiffel_parser.y"
		local
			yyval105: detachable ET_OBSOLETE
		do
--|#line 990 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 990")
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

	yy_do_action_156
			--|#line 992 "et_eiffel_parser.y"
		local
			yyval105: detachable ET_OBSOLETE
		do
--|#line 992 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 992")
end

yyval105 := ast_factory.new_obsolete_message (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp105 := yyvsp105 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
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

	yy_do_action_157
			--|#line 998 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 998 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 998")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp108 := yyvsp108 + 1
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

	yy_do_action_158
			--|#line 1000 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 1000 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1000")
end

			yyval108 := yyvs108.item (yyvsp108)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_159
			--|#line 1007 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 1007 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1007")
end

			if attached yyvs110.item (yyvsp110) as l_inheritance_clause then
				yyval108 := ast_factory.new_parent_clauses (counter_value + 1)
				if yyval108 /= Void then
					yyval108.put_first (l_inheritance_clause)
				end
			else
				yyval108 := ast_factory.new_parent_clauses (counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp108 := yyvsp108 + 1
	yyvsp110 := yyvsp110 -1
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

	yy_do_action_160
			--|#line 1018 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 1018 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1018")
end

			yyval108 := yyvs108.item (yyvsp108)
			if yyval108 /= Void and attached yyvs110.item (yyvsp110) as l_inheritance_clause then
				yyval108.put_first (l_inheritance_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp108 := yyvsp108 -1
	yyvsp110 := yyvsp110 -1
	yyspecial_routines108.force (yyvs108, yyval108, yyvsp108)
end
		end

	yy_do_action_161
			--|#line 1018 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 1018 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1018")
end

			if yyvs110.item (yyvsp110) /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp108 := yyvsp108 + 1
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

	yy_do_action_162
			--|#line 1033 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1033 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1033")
end

			yyval110 := ast_factory.new_parents (yyvs2.item (yyvsp2), 0)
			if yyval110 /= Void then
				yyval110.set_clients_clause (yyvs46.item (yyvsp46))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp110 := yyvsp110 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp46 := yyvsp46 -1
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

	yy_do_action_163
			--|#line 1040 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1040 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1040")
end

			yyval110 := yyvs110.item (yyvsp110)
			if yyval110 /= Void then
				yyval110.set_clients_clause (yyvs46.item (yyvsp46))
			end
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp110 := yyvsp110 -1
	yyvsp2 := yyvsp2 -1
	yyvsp46 := yyvsp46 -1
	yyspecial_routines110.force (yyvs110, yyval110, yyvsp110)
end
		end

	yy_do_action_164
			--|#line 1040 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1040 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1040")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp110 := yyvsp110 + 1
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

	yy_do_action_165
			--|#line 1056 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1056 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1056")
end

			yyval107 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), Void, Void, Void, Void, Void, Void)
			if yyval107 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp107 := yyvsp107 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_166
			--|#line 1063 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1063 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1063")
end

			yyval107 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), yyvs117.item (yyvsp117), yyvs68.item (yyvsp68), yyvs95.item (yyvsp95 - 2), yyvs95.item (yyvsp95 - 1), yyvs95.item (yyvsp95), yyvs2.item (yyvsp2))
			if yyval107 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp107 := yyvsp107 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	yyvsp117 := yyvsp117 -1
	yyvsp68 := yyvsp68 -1
	yyvsp95 := yyvsp95 -3
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_167
			--|#line 1071 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1071 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1071")
end

			yyval107 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), Void, yyvs68.item (yyvsp68), yyvs95.item (yyvsp95 - 2), yyvs95.item (yyvsp95 - 1), yyvs95.item (yyvsp95), yyvs2.item (yyvsp2))
			if yyval107 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp107 := yyvsp107 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	yyvsp68 := yyvsp68 -1
	yyvsp95 := yyvsp95 -3
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_168
			--|#line 1078 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1078 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1078")
end

			yyval107 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), Void, Void, yyvs95.item (yyvsp95 - 2), yyvs95.item (yyvsp95 - 1), yyvs95.item (yyvsp95), yyvs2.item (yyvsp2))
			if yyval107 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp107 := yyvsp107 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	yyvsp95 := yyvsp95 -3
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_169
			--|#line 1085 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1085 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1085")
end

			yyval107 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), Void, Void, Void, yyvs95.item (yyvsp95 - 1), yyvs95.item (yyvsp95), yyvs2.item (yyvsp2))
			if yyval107 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp107 := yyvsp107 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	yyvsp95 := yyvsp95 -2
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_170
			--|#line 1092 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1092 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1092")
end

			yyval107 := new_parent (yyvs12.item (yyvsp12), yyvs28.item (yyvsp28), Void, Void, Void, Void, yyvs95.item (yyvsp95), yyvs2.item (yyvsp2))
			if yyval107 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp107 := yyvsp107 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
	yyvsp95 := yyvsp95 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_171
			--|#line 1101 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1101 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1101")
end

			yyval110 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval110 /= Void and attached yyvs107.item (yyvsp107) as l_parent then
				yyval110.put_first (l_parent)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp110 := yyvsp110 + 1
	yyvsp107 := yyvsp107 -1
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

	yy_do_action_172
			--|#line 1108 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1108 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1108")
end

			yyval110 := ast_factory.new_parents (last_keyword, counter_value)
			if yyval110 /= Void and attached yyvs109.item (yyvsp109) as l_parent then
				yyval110.put_first (l_parent)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp110 := yyvsp110 + 1
	yyvsp109 := yyvsp109 -1
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

	yy_do_action_173
			--|#line 1115 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1115 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1115")
end

			yyval110 := yyvs110.item (yyvsp110)
			if yyval110 /= Void and attached yyvs107.item (yyvsp107) as l_parent then
				yyval110.put_first (l_parent)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp107 := yyvsp107 -1
	yyspecial_routines110.force (yyvs110, yyval110, yyvsp110)
end
		end

	yy_do_action_174
			--|#line 1122 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1122 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1122")
end

			yyval110 := yyvs110.item (yyvsp110)
			if yyval110 /= Void and attached yyvs109.item (yyvsp109) as l_parent then
				yyval110.put_first (l_parent)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp109 := yyvsp109 -1
	yyspecial_routines110.force (yyvs110, yyval110, yyvsp110)
end
		end

	yy_do_action_175
			--|#line 1131 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_PARENT_ITEM
		do
--|#line 1131 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1131")
end

			yyval109 := ast_factory.new_parent_semicolon (yyvs107.item (yyvsp107), yyvs21.item (yyvsp21))
			if yyval109 /= Void and yyvs107.item (yyvsp107) = Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp109 := yyvsp109 + 1
	yyvsp107 := yyvsp107 -1
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

	yy_do_action_176
			--|#line 1142 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1142 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1142")
end

yyval117 := ast_factory.new_renames (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp117 := yyvsp117 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_177
			--|#line 1144 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1144 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1144")
end

			yyval117 := yyvs117.item (yyvsp117)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp117 := yyvsp117 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines117.force (yyvs117, yyval117, yyvsp117)
end
		end

	yy_do_action_178
			--|#line 1144 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1144 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1144")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
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

	yy_do_action_179
			--|#line 1157 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1157 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1157")
end

			yyval117 := ast_factory.new_renames (last_keyword, counter_value)
			if yyval117 /= Void and attached yyvs116.item (yyvsp116) as l_rename then
				yyval117.put_first (l_rename)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp117 := yyvsp117 + 1
	yyvsp116 := yyvsp116 -1
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

	yy_do_action_180
			--|#line 1164 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1164 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1164")
end

			yyval117 := ast_factory.new_renames (last_keyword, counter_value)
			if yyval117 /= Void and attached yyvs116.item (yyvsp116) as l_rename then
				yyval117.put_first (l_rename)
			end
				-- TODO: syntax error.
			raise_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp117 := yyvsp117 + 1
	yyvsp116 := yyvsp116 -1
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

	yy_do_action_181
			--|#line 1173 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1173 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1173")
end

			yyval117 := yyvs117.item (yyvsp117)
			if yyval117 /= Void and attached yyvs116.item (yyvsp116) as l_rename then
				yyval117.put_first (l_rename)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp116 := yyvsp116 -1
	yyspecial_routines117.force (yyvs117, yyval117, yyvsp117)
end
		end

	yy_do_action_182
			--|#line 1182 "et_eiffel_parser.y"
		local
			yyval116: detachable ET_RENAME_ITEM
		do
--|#line 1182 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1182")
end

			yyval116 := ast_factory.new_rename (yyvs76.item (yyvsp76), yyvs2.item (yyvsp2), yyvs71.item (yyvsp71))
			if yyval116 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp116 := yyvsp116 + 1
	yyvsp76 := yyvsp76 -1
	yyvsp2 := yyvsp2 -1
	yyvsp71 := yyvsp71 -1
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

	yy_do_action_183
			--|#line 1191 "et_eiffel_parser.y"
		local
			yyval116: detachable ET_RENAME_ITEM
		do
--|#line 1191 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1191")
end

			yyval116 := ast_factory.new_rename_comma (yyvs76.item (yyvsp76), yyvs2.item (yyvsp2), yyvs71.item (yyvsp71), yyvs5.item (yyvsp5))
			if yyval116 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp116 := yyvsp116 + 1
	yyvsp76 := yyvsp76 -1
	yyvsp2 := yyvsp2 -1
	yyvsp71 := yyvsp71 -1
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

	yy_do_action_184
			--|#line 1202 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1202 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1202")
end

yyval68 := ast_factory.new_exports (yyvs2.item (yyvsp2), 0) 
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

	yy_do_action_185
			--|#line 1204 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1204 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1204")
end

			yyval68 := yyvs68.item (yyvsp68)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp68 := yyvsp68 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines68.force (yyvs68, yyval68, yyvsp68)
end
		end

	yy_do_action_186
			--|#line 1204 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1204 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1204")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp68 := yyvsp68 + 1
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

	yy_do_action_187
			--|#line 1217 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1217 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1217")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp68 := yyvsp68 + 1
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

	yy_do_action_188
			--|#line 1219 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1219 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1219")
end

yyval68 := yyvs68.item (yyvsp68) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines68.force (yyvs68, yyval68, yyvsp68)
end
		end

	yy_do_action_189
			--|#line 1223 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1223 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1223")
end

			if attached yyvs67.item (yyvsp67) as l_new_export then
				yyval68 := ast_factory.new_exports (last_keyword, counter_value + 1)
				if yyval68 /= Void then
					yyval68.put_first (l_new_export)
				end
			else
				yyval68 := ast_factory.new_exports (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp68 := yyvsp68 + 1
	yyvsp67 := yyvsp67 -1
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

	yy_do_action_190
			--|#line 1234 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1234 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1234")
end

			yyval68 := yyvs68.item (yyvsp68)
			if yyval68 /= Void and attached yyvs67.item (yyvsp67) as l_new_export then
				yyval68.put_first (l_new_export)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp68 := yyvsp68 -1
	yyvsp67 := yyvsp67 -1
	yyspecial_routines68.force (yyvs68, yyval68, yyvsp68)
end
		end

	yy_do_action_191
			--|#line 1234 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1234 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1234")
end

			if yyvs67.item (yyvsp67) /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp68 := yyvsp68 + 1
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

	yy_do_action_192
			--|#line 1249 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXPORT
		do
--|#line 1249 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1249")
end

			yyval67 := ast_factory.new_all_export (yyvs46.item (yyvsp46), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp67 := yyvsp67 + 1
	yyvsp46 := yyvsp46 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_193
			--|#line 1253 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXPORT
		do
--|#line 1253 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1253")
end

			last_export_clients := yyvs46.item (yyvsp46)
			yyval67 := ast_factory.new_feature_export (last_export_clients, 0)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp67 := yyvsp67 + 1
	yyvsp46 := yyvsp46 -1
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

	yy_do_action_194
			--|#line 1258 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXPORT
		do
--|#line 1258 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1258")
end

			yyval67 := yyvs75.item (yyvsp75)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp46 := yyvsp46 -1
	yyvsp75 := yyvsp75 -1
	yyspecial_routines67.force (yyvs67, yyval67, yyvsp67)
end
		end

	yy_do_action_195
			--|#line 1258 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXPORT
		do
--|#line 1258 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1258")
end

			last_export_clients := yyvs46.item (yyvsp46)
			add_counter
		
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

	yy_do_action_196
			--|#line 1268 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXPORT
		do
--|#line 1268 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1268")
end

yyval67 := ast_factory.new_null_export (yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp67 := yyvsp67 + 1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_197
			--|#line 1272 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FEATURE_EXPORT
		do
--|#line 1272 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1272")
end

			if attached yyvs76.item (yyvsp76) as l_feature_name then
				yyval75 := ast_factory.new_feature_export (last_export_clients, counter_value + 1)
				if yyval75 /= Void then
					yyval75.put_first (l_feature_name)
				end
			else
				yyval75 := ast_factory.new_feature_export (last_export_clients, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp75 := yyvsp75 + 1
	yyvsp76 := yyvsp76 -1
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

	yy_do_action_198
			--|#line 1283 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FEATURE_EXPORT
		do
--|#line 1283 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1283")
end

			yyval75 := ast_factory.new_feature_export (last_export_clients, counter_value)
			if yyval75 /= Void and attached yyvs77.item (yyvsp77) as l_feature_name then
				yyval75.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp75 := yyvsp75 + 1
	yyvsp77 := yyvsp77 -1
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

	yy_do_action_199
			--|#line 1291 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FEATURE_EXPORT
		do
--|#line 1291 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1291")
end

			yyval75 := yyvs75.item (yyvsp75)
			if yyval75 /= Void and attached yyvs77.item (yyvsp77) as l_feature_name then
				yyval75.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp77 := yyvsp77 -1
	yyspecial_routines75.force (yyvs75, yyval75, yyvsp75)
end
		end

	yy_do_action_200
			--|#line 1302 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1302 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1302")
end

			yyval46 := yyvs46.item (yyvsp46)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp46 := yyvsp46 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_201
			--|#line 1302 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1302 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1302")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
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

	yy_do_action_202
			--|#line 1313 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1313 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1313")
end

yyval46 := ast_factory.new_none_clients (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp46 := yyvsp46 + 1
	yyvsp5 := yyvsp5 -2
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

	yy_do_action_203
			--|#line 1317 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1317 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1317")
end

			yyval46 := ast_factory.new_clients (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval46 /= Void and attached yyvs45.item (yyvsp45) as l_client then
				yyval46.put_first (l_client)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp46 := yyvsp46 + 1
	yyvsp45 := yyvsp45 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_204
			--|#line 1324 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1324 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1324")
end

			yyval46 := ast_factory.new_clients (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval46 /= Void and attached yyvs45.item (yyvsp45) as l_client then
				yyval46.put_first (l_client)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp46 := yyvsp46 + 1
	yyvsp45 := yyvsp45 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_205
			--|#line 1332 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1332 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1332")
end

			yyval46 := yyvs46.item (yyvsp46)
			if yyval46 /= Void and attached yyvs45.item (yyvsp45) as l_client then
				yyval46.put_first (l_client)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp45 := yyvsp45 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_206
			--|#line 1339 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1339 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1339")
end

			yyval46 := yyvs46.item (yyvsp46)
			if yyval46 /= Void and attached yyvs45.item (yyvsp45) as l_client then
				yyval46.put_first (l_client)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp45 := yyvsp45 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_207
			--|#line 1349 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENT_ITEM
		do
--|#line 1349 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1349")
end

			yyval45 := new_client (yyvs12.item (yyvsp12))
			if yyval45 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp45 := yyvsp45 + 1
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

	yy_do_action_208
			--|#line 1358 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENT_ITEM
		do
--|#line 1358 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1358")
end

			yyval45 := new_client_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5))
			if yyval45 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp45 := yyvsp45 + 1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_209
			--|#line 1368 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1368 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1368")
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

	yy_do_action_210
			--|#line 1370 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1370 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1370")
end

yyval46 := yyvs46.item (yyvsp46) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_211
			--|#line 1374 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1374 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1374")
end

			yyval46 := ast_factory.new_clients (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 1)
			if yyval46 /= Void and attached new_client (yyvs12.item (yyvsp12)) as l_client then
				yyval46.put_first (l_client)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp46 := yyvsp46 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_212
			--|#line 1385 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1385 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1385")
end

yyval95 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp95 := yyvsp95 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_213
			--|#line 1387 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1387 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1387")
end

			yyval95 := yyvs95.item (yyvsp95)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp95 := yyvsp95 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_214
			--|#line 1387 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1387 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1387")
end

			add_keyword (yyvs2.item (yyvsp2))
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

	yy_do_action_215
			--|#line 1400 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1400 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1400")
end


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

	yy_do_action_216
			--|#line 1402 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1402 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1402")
end

yyval95 := yyvs95.item (yyvsp95) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_217
			--|#line 1406 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1406 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1406")
end

yyval95 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp95 := yyvsp95 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_218
			--|#line 1408 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1408 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1408")
end

			yyval95 := yyvs95.item (yyvsp95)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp95 := yyvsp95 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_219
			--|#line 1408 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1408 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1408")
end

			add_keyword (yyvs2.item (yyvsp2))
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

	yy_do_action_220
			--|#line 1421 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1421 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1421")
end


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

	yy_do_action_221
			--|#line 1423 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1423 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1423")
end

yyval95 := yyvs95.item (yyvsp95) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_222
			--|#line 1427 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1427 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1427")
end

yyval95 := ast_factory.new_keyword_feature_name_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp95 := yyvsp95 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_223
			--|#line 1429 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1429 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1429")
end

			yyval95 := yyvs95.item (yyvsp95)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp95 := yyvsp95 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_224
			--|#line 1429 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1429 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1429")
end

			add_keyword (yyvs2.item (yyvsp2))
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

	yy_do_action_225
			--|#line 1442 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1442 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1442")
end


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

	yy_do_action_226
			--|#line 1444 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1444 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1444")
end

yyval95 := yyvs95.item (yyvsp95) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_227
			--|#line 1448 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1448 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1448")
end

			if attached yyvs76.item (yyvsp76) as l_feature_name then
				yyval95 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value + 1)
				if yyval95 /= Void then
					yyval95.put_first (l_feature_name)
				end
			else
				yyval95 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp95 := yyvsp95 + 1
	yyvsp76 := yyvsp76 -1
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

	yy_do_action_228
			--|#line 1459 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1459 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1459")
end

			yyval95 := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			if yyval95 /= Void and attached yyvs77.item (yyvsp77) as l_feature_name then
				yyval95.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp95 := yyvsp95 + 1
	yyvsp77 := yyvsp77 -1
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

	yy_do_action_229
			--|#line 1467 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1467 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1467")
end

			yyval95 := yyvs95.item (yyvsp95)
			if yyval95 /= Void and attached yyvs77.item (yyvsp77) as l_feature_name then
				yyval95.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp77 := yyvsp77 -1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_230
			--|#line 1476 "et_eiffel_parser.y"
		local
			yyval77: detachable ET_FEATURE_NAME_ITEM
		do
--|#line 1476 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1476")
end

			yyval77 := ast_factory.new_feature_name_comma (yyvs76.item (yyvsp76), yyvs5.item (yyvsp5))
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

	yy_do_action_231
			--|#line 1487 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_CREATOR_LIST
		do
--|#line 1487 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1487")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp61 := yyvsp61 + 1
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

	yy_do_action_232
			--|#line 1489 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_CREATOR_LIST
		do
--|#line 1489 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1489")
end

			yyval61 := yyvs61.item (yyvsp61)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines61.force (yyvs61, yyval61, yyvsp61)
end
		end

	yy_do_action_233
			--|#line 1496 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_CREATOR_LIST
		do
--|#line 1496 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1496")
end

			if attached yyvs60.item (yyvsp60) as l_creation_clause then
				yyval61 := ast_factory.new_creators (counter_value + 1)
				if yyval61 /= Void then
					yyval61.put_first (l_creation_clause)
				end
			else
				yyval61 := ast_factory.new_creators (counter_value)
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

	yy_do_action_234
			--|#line 1507 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_CREATOR_LIST
		do
--|#line 1507 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1507")
end

			yyval61 := yyvs61.item (yyvsp61)
			if yyval61 /= Void and attached yyvs60.item (yyvsp60) as l_creation_clause then
				yyval61.put_first (l_creation_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp61 := yyvsp61 -1
	yyvsp60 := yyvsp60 -1
	yyspecial_routines61.force (yyvs61, yyval61, yyvsp61)
end
		end

	yy_do_action_235
			--|#line 1507 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_CREATOR_LIST
		do
--|#line 1507 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1507")
end

			if yyvs60.item (yyvsp60) /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp61 := yyvsp61 + 1
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

	yy_do_action_236
			--|#line 1522 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1522 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1522")
end

yyval60 := ast_factory.new_creator (yyvs2.item (yyvsp2), yyvs46.item (yyvsp46), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp60 := yyvsp60 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_237
			--|#line 1524 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1524 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1524")
end

yyval60 := ast_factory.new_creator (yyvs2.item (yyvsp2), new_any_clients (yyvs2.item (yyvsp2)), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_238
			--|#line 1526 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1526 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1526")
end

			yyval60 := yyvs60.item (yyvsp60)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp60 := yyvsp60 -1
	yyvsp2 := yyvsp2 -1
	yyvsp46 := yyvsp46 -1
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
		end

	yy_do_action_239
			--|#line 1526 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1526 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1526")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := yyvs46.item (yyvsp46)
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp60 := yyvsp60 + 1
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

	yy_do_action_240
			--|#line 1538 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1538 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1538")
end

			yyval60 := yyvs60.item (yyvsp60)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp60 := yyvsp60 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
		end

	yy_do_action_241
			--|#line 1538 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1538 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1538")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := new_any_clients (last_keyword)
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp60 := yyvsp60 + 1
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

	yy_do_action_242
			--|#line 1550 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1550 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1550")
end

yyval60 := ast_factory.new_creator (yyvs2.item (yyvsp2), yyvs46.item (yyvsp46), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp60 := yyvsp60 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_243
			--|#line 1552 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1552 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1552")
end

yyval60 := ast_factory.new_creator (yyvs2.item (yyvsp2), new_any_clients (yyvs2.item (yyvsp2)), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_244
			--|#line 1554 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1554 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1554")
end

			yyval60 := yyvs60.item (yyvsp60)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp60 := yyvsp60 -1
	yyvsp2 := yyvsp2 -1
	yyvsp46 := yyvsp46 -1
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
		end

	yy_do_action_245
			--|#line 1554 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1554 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1554")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := yyvs46.item (yyvsp46)
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp60 := yyvsp60 + 1
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

	yy_do_action_246
			--|#line 1566 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1566 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1566")
end

			yyval60 := yyvs60.item (yyvsp60)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp60 := yyvsp60 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
		end

	yy_do_action_247
			--|#line 1566 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1566 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1566")
end

			add_keyword (yyvs2.item (yyvsp2))
			last_clients := new_any_clients (last_keyword)
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp60 := yyvsp60 + 1
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

	yy_do_action_248
			--|#line 1580 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1580 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1580")
end

			if attached yyvs12.item (yyvsp12) as l_identifier then
				l_identifier.set_feature_name (True)
				yyval60 := ast_factory.new_creator (last_keyword, last_clients, counter_value + 1)
				if yyval60 /= Void then
					yyval60.put_first (l_identifier)
				end
			else
				yyval60 := ast_factory.new_creator (last_keyword, last_clients, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_249
			--|#line 1592 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1592 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1592")
end

			if system_processor.is_ise then
				raise_error
			else
				yyval60 := ast_factory.new_creator (last_keyword, last_clients, counter_value)
				if yyval60 /= Void and attached yyvs77.item (yyvsp77) as l_creation_procedure then
					yyval60.put_first (l_creation_procedure)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp60 := yyvsp60 + 1
	yyvsp77 := yyvsp77 -1
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

	yy_do_action_250
			--|#line 1604 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1604 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1604")
end

			yyval60 := yyvs60.item (yyvsp60)
			if yyval60 /= Void and attached yyvs77.item (yyvsp77) as l_creation_procedure then
				yyval60.put_first (l_creation_procedure)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp77 := yyvsp77 -1
	yyspecial_routines60.force (yyvs60, yyval60, yyvsp60)
end
		end

	yy_do_action_251
			--|#line 1613 "et_eiffel_parser.y"
		local
			yyval77: detachable ET_FEATURE_NAME_ITEM
		do
--|#line 1613 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1613")
end

			if attached yyvs12.item (yyvsp12) as l_identifier then
				l_identifier.set_feature_name (True)
				yyval77 := ast_factory.new_feature_name_comma (l_identifier, yyvs5.item (yyvsp5))
			else
				yyval77 := ast_factory.new_feature_name_comma (Void, yyvs5.item (yyvsp5))
			end
			if yyval77 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp77 := yyvsp77 + 1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_252
			--|#line 1629 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1629 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1629")
end


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

	yy_do_action_253
			--|#line 1631 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1631 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1631")
end

yyval57 := yyvs57.item (yyvsp57) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_254
			--|#line 1635 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1635 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1635")
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

	yy_do_action_255
			--|#line 1635 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1635 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1635")
end

			add_keyword (yyvs2.item (yyvsp2))
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

	yy_do_action_256
			--|#line 1648 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1648 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1648")
end

			yyval57 := ast_factory.new_convert_features (last_keyword, counter_value + 1)
			if yyval57 /= Void and attached yyvs55.item (yyvsp55) as l_convert_feature then
				yyval57.put_first (l_convert_feature)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp55 := yyvsp55 -1
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

	yy_do_action_257
			--|#line 1655 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1655 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1655")
end

			yyval57 := ast_factory.new_convert_features (last_keyword, counter_value)
			if yyval57 /= Void and attached yyvs56.item (yyvsp56) as l_convert_feature then
				yyval57.put_first (l_convert_feature)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp56 := yyvsp56 -1
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

	yy_do_action_258
			--|#line 1662 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1662 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1662")
end

			yyval57 := yyvs57.item (yyvsp57)
			if yyval57 /= Void and attached yyvs56.item (yyvsp56) as l_convert_feature then
				yyval57.put_first (l_convert_feature)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp56 := yyvsp56 -1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_259
			--|#line 1671 "et_eiffel_parser.y"
		local
			yyval56: detachable ET_CONVERT_FEATURE_ITEM
		do
--|#line 1671 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1671")
end

			yyval56 := ast_factory.new_convert_feature_comma (yyvs55.item (yyvsp55), yyvs5.item (yyvsp5))
			if yyval56 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp56 := yyvsp56 + 1
	yyvsp55 := yyvsp55 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_260
			--|#line 1680 "et_eiffel_parser.y"
		local
			yyval55: detachable ET_CONVERT_FEATURE
		do
--|#line 1680 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1680")
end

			yyval55 := ast_factory.new_convert_function (yyvs76.item (yyvsp76), yyvs5.item (yyvsp5), yyvs125.item (yyvsp125))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp55 := yyvsp55 + 1
	yyvsp76 := yyvsp76 -1
	yyvsp5 := yyvsp5 -1
	yyvsp125 := yyvsp125 -1
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

	yy_do_action_261
			--|#line 1684 "et_eiffel_parser.y"
		local
			yyval55: detachable ET_CONVERT_FEATURE
		do
--|#line 1684 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1684")
end

			yyval55 := ast_factory.new_convert_procedure (yyvs76.item (yyvsp76), yyvs5.item (yyvsp5 - 1), yyvs125.item (yyvsp125), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp55 := yyvsp55 + 1
	yyvsp76 := yyvsp76 -1
	yyvsp5 := yyvsp5 -2
	yyvsp125 := yyvsp125 -1
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

	yy_do_action_262
			--|#line 1690 "et_eiffel_parser.y"
		local
			yyval125: detachable ET_TYPE_LIST
		do
--|#line 1690 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1690")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp125 := yyvsp125 + 1
	yyvsp5 := yyvsp5 -2
	if yyvsp125 >= yyvsc125 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs125")
		end
		yyvsc125 := yyvsc125 + yyInitial_yyvs_size
		yyvs125 := yyspecial_routines125.aliased_resized_area (yyvs125, yyvsc125)
	end
	yyspecial_routines125.force (yyvs125, yyval125, yyvsp125)
end
		end

	yy_do_action_263
			--|#line 1692 "et_eiffel_parser.y"
		local
			yyval125: detachable ET_TYPE_LIST
		do
--|#line 1692 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1692")
end

			yyval125 := yyvs125.item (yyvsp125)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp125 := yyvsp125 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines125.force (yyvs125, yyval125, yyvsp125)
end
		end

	yy_do_action_264
			--|#line 1692 "et_eiffel_parser.y"
		local
			yyval125: detachable ET_TYPE_LIST
		do
--|#line 1692 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1692")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp125 := yyvsp125 + 1
	if yyvsp125 >= yyvsc125 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs125")
		end
		yyvsc125 := yyvsc125 + yyInitial_yyvs_size
		yyvs125 := yyspecial_routines125.aliased_resized_area (yyvs125, yyvsc125)
	end
	yyspecial_routines125.force (yyvs125, yyval125, yyvsp125)
end
		end

	yy_do_action_265
			--|#line 1705 "et_eiffel_parser.y"
		local
			yyval125: detachable ET_TYPE_LIST
		do
--|#line 1705 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1705")
end

			if attached yyvs120.item (yyvsp120) as l_convert_type then
				yyval125 := ast_factory.new_convert_types (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval125 /= Void then
					yyval125.put_first (l_convert_type)
				end
			else
				yyval125 := ast_factory.new_convert_types (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp125 := yyvsp125 + 1
	yyvsp120 := yyvsp120 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp125 >= yyvsc125 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs125")
		end
		yyvsc125 := yyvsc125 + yyInitial_yyvs_size
		yyvs125 := yyspecial_routines125.aliased_resized_area (yyvs125, yyvsc125)
	end
	yyspecial_routines125.force (yyvs125, yyval125, yyvsp125)
end
		end

	yy_do_action_266
			--|#line 1716 "et_eiffel_parser.y"
		local
			yyval125: detachable ET_TYPE_LIST
		do
--|#line 1716 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1716")
end

			yyval125 := yyvs125.item (yyvsp125)
			if yyval125 /= Void and attached yyvs124.item (yyvsp124) as l_convert_type then
				yyval125.put_first (l_convert_type)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp124 := yyvsp124 -1
	yyspecial_routines125.force (yyvs125, yyval125, yyvsp125)
end
		end

	yy_do_action_267
			--|#line 1725 "et_eiffel_parser.y"
		local
			yyval124: detachable ET_TYPE_ITEM
		do
--|#line 1725 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1725")
end

			yyval124 := ast_factory.new_type_comma (yyvs120.item (yyvsp120), yyvs5.item (yyvsp5))
			if yyval124 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp124 := yyvsp124 + 1
	yyvsp120 := yyvsp120 -1
	yyvsp5 := yyvsp5 -1
	if yyvsp124 >= yyvsc124 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs124")
		end
		yyvsc124 := yyvsc124 + yyInitial_yyvs_size
		yyvs124 := yyspecial_routines124.aliased_resized_area (yyvs124, yyvsc124)
	end
	yyspecial_routines124.force (yyvs124, yyval124, yyvsp124)
end
		end

	yy_do_action_268
			--|#line 1736 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1736 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1736")
end

			-- $$ := Void
			set_class_features
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp74 := yyvsp74 + 1
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

	yy_do_action_269
			--|#line 1741 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1741 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1741")
end

yyval74 := yyvs74.item (yyvsp74) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines74.force (yyvs74, yyval74, yyvsp74)
end
		end

	yy_do_action_270
			--|#line 1745 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1745 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1745")
end

			yyval74 := yyvs74.item (yyvsp74)
			set_class_features
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines74.force (yyvs74, yyval74, yyvsp74)
end
		end

	yy_do_action_271
			--|#line 1753 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1753 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1753")
end

			yyval74 := ast_factory.new_feature_clauses (counter_value)
			if yyval74 /= Void and attached yyvs73.item (yyvsp73) as l_feature_clause then
				yyval74.put_first (l_feature_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp74 := yyvsp74 + 1
	yyvsp73 := yyvsp73 -1
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

	yy_do_action_272
			--|#line 1760 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1760 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1760")
end

			yyval74 := yyvs74.item (yyvsp74)
			if yyval74 /= Void and attached yyvs73.item (yyvsp73) as l_feature_clause then
				yyval74.put_first (l_feature_clause)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp73 := yyvsp73 -1
	yyspecial_routines74.force (yyvs74, yyval74, yyvsp74)
end
		end

	yy_do_action_273
			--|#line 1769 "et_eiffel_parser.y"
		local
			yyval73: detachable ET_FEATURE_CLAUSE
		do
--|#line 1769 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1769")
end

			yyval73 := last_feature_clause
			if yyval73 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines73.force (yyvs73, yyval73, yyvsp73)
end
		end

	yy_do_action_274
			--|#line 1776 "et_eiffel_parser.y"
		local
			yyval73: detachable ET_FEATURE_CLAUSE
		do
--|#line 1776 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1776")
end

			yyval73 := last_feature_clause
			if yyval73 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines73.force (yyvs73, yyval73, yyvsp73)
end
		end

	yy_do_action_275
			--|#line 1785 "et_eiffel_parser.y"
		local
			yyval73: detachable ET_FEATURE_CLAUSE
		do
--|#line 1785 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1785")
end

			last_clients := yyvs46.item (yyvsp46)
			last_feature_clause := ast_factory.new_feature_clause (yyvs2.item (yyvsp2), last_clients)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp73 := yyvsp73 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp46 := yyvsp46 -1
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

	yy_do_action_276
			--|#line 1790 "et_eiffel_parser.y"
		local
			yyval73: detachable ET_FEATURE_CLAUSE
		do
--|#line 1790 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1790")
end

			last_clients := new_any_clients (yyvs2.item (yyvsp2))
			last_feature_clause := ast_factory.new_feature_clause (yyvs2.item (yyvsp2), last_clients)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp73 := yyvsp73 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_277
			--|#line 1797 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 1797 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1797")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp115 := yyvsp115 -1
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

	yy_do_action_278
			--|#line 1798 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 1798 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1798")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp113 := yyvsp113 -1
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

	yy_do_action_279
			--|#line 1799 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 1799 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1799")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp115 := yyvsp115 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_280
			--|#line 1800 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 1800 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1800")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp113 := yyvsp113 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_281
			--|#line 1805 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1805 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1805")
end

			yyval115 := yyvs115.item (yyvsp115)
			register_query (yyval115)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines115.force (yyvs115, yyval115, yyvsp115)
end
		end

	yy_do_action_282
			--|#line 1810 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1810 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1810")
end

			yyval115 := yyvs115.item (yyvsp115)
			if yyval115 /= Void then
				yyval115.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_query (yyval115)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines115.force (yyvs115, yyval115, yyvsp115)
end
		end

	yy_do_action_283
			--|#line 1818 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1818 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1818")
end

			yyval115 := new_query_synonym (ast_factory.new_extended_feature_name_comma (yyvs71.item (yyvsp71), yyvs5.item (yyvsp5)), yyvs115.item (yyvsp115))
			register_query_synonym (yyval115)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines115.force (yyvs115, yyval115, yyvsp115)
end
		end

	yy_do_action_284
			--|#line 1823 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1823 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1823")
end

			yyval115 := new_query_synonym (yyvs71.item (yyvsp71), yyvs115.item (yyvsp115))
			register_query_synonym (yyval115)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 -1
	yyspecial_routines115.force (yyvs115, yyval115, yyvsp115)
end
		end

	yy_do_action_285
			--|#line 1829 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1829 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1829")
end

			yyval115 := new_query_synonym (ast_factory.new_extended_feature_name_comma (yyvs71.item (yyvsp71), yyvs5.item (yyvsp5)), yyvs115.item (yyvsp115))
			if yyval115 /= Void then
				yyval115.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_query_synonym (yyval115)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines115.force (yyvs115, yyval115, yyvsp115)
end
		end

	yy_do_action_286
			--|#line 1837 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1837 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1837")
end

			yyval115 := new_query_synonym (yyvs71.item (yyvsp71), yyvs115.item (yyvsp115))
			if yyval115 /= Void then
				yyval115.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_query_synonym (yyval115)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp71 := yyvsp71 -1
	yyspecial_routines115.force (yyvs115, yyval115, yyvsp115)
end
		end

	yy_do_action_287
			--|#line 1848 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1848 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1848")
end

			yyval113 := yyvs113.item (yyvsp113)
			register_procedure (yyval113)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_288
			--|#line 1853 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1853 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1853")
end

			yyval113 := yyvs113.item (yyvsp113)
			if yyval113 /= Void then
				yyval113.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_procedure (yyval113)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_289
			--|#line 1861 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1861 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1861")
end

			yyval113 := new_procedure_synonym (ast_factory.new_extended_feature_name_comma (yyvs71.item (yyvsp71), yyvs5.item (yyvsp5)), yyvs113.item (yyvsp113))
			register_procedure_synonym (yyval113)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_290
			--|#line 1866 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1866 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1866")
end

			yyval113 := new_procedure_synonym (yyvs71.item (yyvsp71), yyvs113.item (yyvsp113))
			register_procedure_synonym (yyval113)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp71 := yyvsp71 -1
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_291
			--|#line 1872 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1872 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1872")
end

			yyval113 := new_procedure_synonym (ast_factory.new_extended_feature_name_comma (yyvs71.item (yyvsp71), yyvs5.item (yyvsp5)), yyvs113.item (yyvsp113))
			if yyval113 /= Void then
				yyval113.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_procedure_synonym (yyval113)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_292
			--|#line 1880 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1880 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1880")
end

			yyval113 := new_procedure_synonym (yyvs71.item (yyvsp71), yyvs113.item (yyvsp113))
			if yyval113 /= Void then
				yyval113.set_frozen_keyword (yyvs2.item (yyvsp2))
				register_procedure_synonym (yyval113)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp71 := yyvsp71 -1
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_293
			--|#line 1891 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1891 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1891")
end

yyval115 := ast_factory.new_attribute (yyvs71.item (yyvsp71), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), Void, last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
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

	yy_do_action_294
			--|#line 1893 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1893 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1893")
end

yyval115 := ast_factory.new_attribute (yyvs71.item (yyvsp71), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_295
			--|#line 1895 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1895 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1895")
end

			yyval115 := ast_factory.new_extended_attribute (yyvs71.item (yyvsp71), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs47.item (yyvsp47 - 1), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp2 := yyvsp2 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_296
			--|#line 1899 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1899 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1899")
end

yyval115 := ast_factory.new_constant_attribute (yyvs71.item (yyvsp71), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs2.item (yyvsp2), yyvs49.item (yyvsp49), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp2 := yyvsp2 -1
	yyvsp49 := yyvsp49 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_297
			--|#line 1901 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1901 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1901")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval115 := ast_factory.new_constant_attribute (yyvs71.item (yyvsp71), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs5.item (yyvsp5), yyvs49.item (yyvsp49), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp49 := yyvsp49 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_298
			--|#line 1909 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1909 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1909")
end

yyval115 := ast_factory.new_unique_attribute (yyvs71.item (yyvsp71), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp2 := yyvsp2 -2
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_299
			--|#line 1911 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1911 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1911")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval115 := ast_factory.new_unique_attribute (yyvs71.item (yyvsp71), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs5.item (yyvsp5), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp2 := yyvsp2 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_300
			--|#line 1919 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1919 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1919")
end

yyval115 := ast_factory.new_do_function (yyvs71.item (yyvsp71), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs2.item (yyvsp2 - 1), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs47.item (yyvsp47 - 1), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp2 := yyvsp2 -2
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_301
			--|#line 1922 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1922 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1922")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval115 := ast_factory.new_do_function (yyvs71.item (yyvsp71), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), Void, yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs47.item (yyvsp47 - 1), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp2 := yyvsp2 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_302
			--|#line 1931 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1931 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1931")
end

yyval115 := ast_factory.new_do_function (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs2.item (yyvsp2 - 1), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs47.item (yyvsp47 - 1), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 15
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp2 := yyvsp2 -2
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_303
			--|#line 1935 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1935 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1935")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval115 := ast_factory.new_do_function (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), Void, yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs47.item (yyvsp47 - 1), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp2 := yyvsp2 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_304
			--|#line 1945 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1945 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1945")
end

yyval115 := ast_factory.new_once_function (yyvs71.item (yyvsp71), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs103.item (yyvsp103), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47 - 1)), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 16
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp103 := yyvsp103 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_305
			--|#line 1948 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1948 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1948")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval115 := ast_factory.new_once_function (yyvs71.item (yyvsp71), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), Void, yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs103.item (yyvsp103), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47 - 1)), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 15
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp2 := yyvsp2 -2
	yyvsp103 := yyvsp103 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_306
			--|#line 1957 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1957 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1957")
end

yyval115 := ast_factory.new_once_function (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs103.item (yyvsp103), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47 - 1)), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 17
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp103 := yyvsp103 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_307
			--|#line 1961 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1961 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1961")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval115 := ast_factory.new_once_function (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), Void, yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs103.item (yyvsp103), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47 - 1)), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 16
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp2 := yyvsp2 -2
	yyvsp103 := yyvsp103 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_308
			--|#line 1971 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1971 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1971")
end

yyval115 := ast_factory.new_deferred_function (yyvs71.item (yyvsp71), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs2.item (yyvsp2 - 1), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_309
			--|#line 1973 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1973 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1973")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval115 := ast_factory.new_deferred_function (yyvs71.item (yyvsp71), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), Void, yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs2.item (yyvsp2 - 1), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp2 := yyvsp2 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_310
			--|#line 1981 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1981 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1981")
end

yyval115 := ast_factory.new_deferred_function (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs2.item (yyvsp2 - 1), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_311
			--|#line 1984 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1984 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1984")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval115 := ast_factory.new_deferred_function (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), Void, yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs2.item (yyvsp2 - 1), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp2 := yyvsp2 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_312
			--|#line 1993 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1993 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1993")
end

yyval115 := new_external_function (yyvs71.item (yyvsp71), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs72.item (yyvsp72), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp15 := yyvsp15 -1
	yyvsp72 := yyvsp72 -1
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_313
			--|#line 1996 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1996 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1996")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval115 := new_external_function (yyvs71.item (yyvsp71), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), Void, yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs72.item (yyvsp72), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp72 := yyvsp72 -1
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_314
			--|#line 2005 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 2005 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2005")
end

yyval115 := new_external_function (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs72.item (yyvsp72), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 15
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp15 := yyvsp15 -1
	yyvsp72 := yyvsp72 -1
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_315
			--|#line 2009 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 2009 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2009")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval115 := new_external_function (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs35.item (yyvsp35), Void, yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs72.item (yyvsp72), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp115 := yyvsp115 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp35 := yyvsp35 -1
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp72 := yyvsp72 -1
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_316
			--|#line 2021 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2021 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2021")
end

yyval113 := ast_factory.new_do_procedure (yyvs71.item (yyvsp71), Void, yyvs2.item (yyvsp2 - 1), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs47.item (yyvsp47 - 1), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp113 := yyvsp113 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp2 := yyvsp2 -2
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_317
			--|#line 2024 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2024 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2024")
end

yyval113 := ast_factory.new_do_procedure (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), yyvs2.item (yyvsp2 - 1), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs47.item (yyvsp47 - 1), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp113 := yyvsp113 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp2 := yyvsp2 -2
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_318
			--|#line 2028 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2028 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2028")
end

yyval113 := ast_factory.new_once_procedure (yyvs71.item (yyvsp71), Void, yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs103.item (yyvsp103), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47 - 1)), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 13
	yyvsp113 := yyvsp113 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp103 := yyvsp103 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_319
			--|#line 2031 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2031 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2031")
end

yyval113 := ast_factory.new_once_procedure (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs103.item (yyvsp103), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47 - 1)), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 14
	yyvsp113 := yyvsp113 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp103 := yyvsp103 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_320
			--|#line 2035 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2035 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2035")
end

yyval113 := ast_factory.new_deferred_procedure (yyvs71.item (yyvsp71), Void, yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs2.item (yyvsp2 - 1), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp113 := yyvsp113 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_321
			--|#line 2037 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2037 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2037")
end

yyval113 := ast_factory.new_deferred_procedure (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), yyvs2.item (yyvsp2 - 1), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp113 := yyvsp113 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_322
			--|#line 2040 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2040 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2040")
end

yyval113 := new_external_procedure (yyvs71.item (yyvsp71), Void, yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs72.item (yyvsp72), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 11
	yyvsp113 := yyvsp113 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp15 := yyvsp15 -1
	yyvsp72 := yyvsp72 -1
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_323
			--|#line 2043 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2043 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2043")
end

yyval113 := new_external_procedure (yyvs71.item (yyvsp71), yyvs80.item (yyvsp80), yyvs2.item (yyvsp2 - 2), yyvs86.item (yyvsp86), yyvs105.item (yyvsp105), yyvs112.item (yyvsp112), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs72.item (yyvsp72), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), yyvs21.item (yyvsp21), last_clients, last_feature_clause, last_class) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp113 := yyvsp113 + 1
	yyvsp71 := yyvsp71 -1
	yyvsp80 := yyvsp80 -1
	yyvsp2 := yyvsp2 -3
	yyvsp86 := yyvsp86 -1
	yyvsp105 := yyvsp105 -1
	yyvsp112 := yyvsp112 -1
	yyvsp15 := yyvsp15 -1
	yyvsp72 := yyvsp72 -1
	yyvsp111 := yyvsp111 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_324
			--|#line 2049 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 2049 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2049")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
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

	yy_do_action_325
			--|#line 2057 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 2057 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2057")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_326
			--|#line 2061 "et_eiffel_parser.y"
		local
			yyval21: detachable ET_SEMICOLON_SYMBOL
		do
--|#line 2061 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2061")
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

	yy_do_action_327
			--|#line 2063 "et_eiffel_parser.y"
		local
			yyval21: detachable ET_SEMICOLON_SYMBOL
		do
--|#line 2063 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2063")
end

yyval21 := yyvs21.item (yyvsp21) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_328
			--|#line 2067 "et_eiffel_parser.y"
		local
			yyval72: detachable ET_EXTERNAL_ALIAS
		do
--|#line 2067 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2067")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp72 := yyvsp72 + 1
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

	yy_do_action_329
			--|#line 2069 "et_eiffel_parser.y"
		local
			yyval72: detachable ET_EXTERNAL_ALIAS
		do
--|#line 2069 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2069")
end

yyval72 := ast_factory.new_external_alias (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp72 := yyvsp72 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
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

	yy_do_action_330
			--|#line 2073 "et_eiffel_parser.y"
		local
			yyval35: detachable ET_ASSIGNER
		do
--|#line 2073 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2073")
end


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

	yy_do_action_331
			--|#line 2075 "et_eiffel_parser.y"
		local
			yyval35: detachable ET_ASSIGNER
		do
--|#line 2075 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2075")
end

yyval35 := ast_factory.new_assigner (yyvs2.item (yyvsp2), yyvs76.item (yyvsp76)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp35 := yyvsp35 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp76 := yyvsp76 -1
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

	yy_do_action_332
			--|#line 2081 "et_eiffel_parser.y"
		local
			yyval76: detachable ET_FEATURE_NAME
		do
--|#line 2081 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2081")
end

			if attached yyvs12.item (yyvsp12) as l_identifier then
				l_identifier.set_feature_name (True)
				yyval76 := l_identifier 
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

	yy_do_action_333
			--|#line 2090 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_EXTENDED_FEATURE_NAME
		do
--|#line 2090 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2090")
end

yyval71 := yyvs76.item (yyvsp76) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp71 := yyvsp71 + 1
	yyvsp76 := yyvsp76 -1
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
			--|#line 2092 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_EXTENDED_FEATURE_NAME
		do
--|#line 2092 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2092")
end

			if attached yyvs12.item (yyvsp12) as l_identifier then
				l_identifier.set_feature_name (True)
				yyval71 := ast_factory.new_aliased_feature_name (l_identifier, yyvs34.item (yyvsp34))
			else
				yyval71 := ast_factory.new_aliased_feature_name (Void, yyvs34.item (yyvsp34))
			end
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp71 := yyvsp71 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp1 := yyvsp1 -1
	yyvsp34 := yyvsp34 -1
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
			--|#line 2104 "et_eiffel_parser.y"
		local
			yyval34: detachable ET_ALIAS_NAME_LIST
		do
--|#line 2104 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2104")
end

			if attached yyvs33.item (yyvsp33) as l_alias_name then
				yyval34 := ast_factory.new_alias_name_list (counter_value + 1)
				if yyval34 /= Void then
					yyval34.put_first (l_alias_name)
				end
			else
				yyval34 := ast_factory.new_alias_name_list (counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp34 := yyvsp34 + 1
	yyvsp33 := yyvsp33 -1
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

	yy_do_action_336
			--|#line 2115 "et_eiffel_parser.y"
		local
			yyval34: detachable ET_ALIAS_NAME_LIST
		do
--|#line 2115 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2115")
end

			yyval34 := yyvs34.item (yyvsp34)
			if yyval34 /= Void and attached yyvs33.item (yyvsp33) as l_alias_name then
				yyval34.put_first (l_alias_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 -1
	yyvsp33 := yyvsp33 -1
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
		end

	yy_do_action_337
			--|#line 2115 "et_eiffel_parser.y"
		local
			yyval34: detachable ET_ALIAS_NAME_LIST
		do
--|#line 2115 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2115")
end

			if yyvs33.item (yyvsp33) /= Void then
				increment_counter
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

	yy_do_action_338
			--|#line 2130 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2130 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2130")
end

yyval33 := ast_factory.new_alias_not_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_339
			--|#line 2132 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2132 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2132")
end

yyval33 := ast_factory.new_alias_plus_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_340
			--|#line 2134 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2134 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2134")
end

yyval33 := ast_factory.new_alias_minus_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_341
			--|#line 2136 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2136 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2136")
end

yyval33 := ast_factory.new_alias_times_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_342
			--|#line 2138 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2138 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2138")
end

yyval33 := ast_factory.new_alias_divide_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_343
			--|#line 2140 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2140 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2140")
end

yyval33 := ast_factory.new_alias_div_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_344
			--|#line 2142 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2142 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2142")
end

yyval33 := ast_factory.new_alias_mod_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_345
			--|#line 2144 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2144 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2144")
end

yyval33 := ast_factory.new_alias_power_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_346
			--|#line 2146 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2146 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2146")
end

yyval33 := ast_factory.new_alias_lt_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_347
			--|#line 2148 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2148 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2148")
end

yyval33 := ast_factory.new_alias_le_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_348
			--|#line 2150 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2150 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2150")
end

yyval33 := ast_factory.new_alias_gt_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_349
			--|#line 2152 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2152 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2152")
end

yyval33 := ast_factory.new_alias_ge_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_350
			--|#line 2154 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2154 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2154")
end

yyval33 := ast_factory.new_alias_and_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_351
			--|#line 2156 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2156 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2156")
end

yyval33 := ast_factory.new_alias_and_then_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_352
			--|#line 2158 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2158 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2158")
end

yyval33 := ast_factory.new_alias_or_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_353
			--|#line 2160 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2160 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2160")
end

yyval33 := ast_factory.new_alias_or_else_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_354
			--|#line 2162 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2162 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2162")
end

yyval33 := ast_factory.new_alias_implies_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_355
			--|#line 2164 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2164 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2164")
end

yyval33 := ast_factory.new_alias_xor_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_356
			--|#line 2166 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2166 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2166")
end

yyval33 := ast_factory.new_alias_dotdot_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_357
			--|#line 2168 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2168 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2168")
end

yyval33 := ast_factory.new_alias_free_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_358
			--|#line 2170 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2170 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2170")
end

yyval33 := ast_factory.new_alias_bracket_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_359
			--|#line 2172 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2172 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2172")
end

yyval33 := ast_factory.new_alias_parenthesis_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_360
			--|#line 2174 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2174 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2174")
end

yyval33 := new_invalid_alias_name (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp2 := yyvsp2 -2
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

	yy_do_action_361
			--|#line 2178 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 2178 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2178")
end

yyval2 := Void 
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

	yy_do_action_362
			--|#line 2180 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 2180 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2180")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_363
			--|#line 2186 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2186 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2186")
end

			yyval80 := yyvs80.item (yyvsp80)
			set_start_closure (yyval80)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_364
			--|#line 2193 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2193 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2193")
end

yyval80 := new_formal_arguments (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp80 := yyvsp80 + 1
	yyvsp5 := yyvsp5 -2
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

	yy_do_action_365
			--|#line 2195 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2195 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2195")
end

			yyval80 := yyvs80.item (yyvsp80)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_366
			--|#line 2203 "et_eiffel_parser.y"
		local
			yyval5: detachable ET_SYMBOL
		do
--|#line 2203 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2203")
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

	yy_do_action_367
			--|#line 2214 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2214 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2214")
end

			yyval80 := new_formal_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval80 /= Void and attached yyvs79.item (yyvsp79) as l_formal_argument then
				yyval80.put_first (l_formal_argument)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp80 := yyvsp80 + 1
	yyvsp79 := yyvsp79 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_368
			--|#line 2221 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2221 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2221")
end

			yyval80 := new_formal_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval80 /= Void and attached yyvs79.item (yyvsp79) as l_formal_argument then
				yyval80.put_first (l_formal_argument)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp80 := yyvsp80 + 1
	yyvsp79 := yyvsp79 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_369
			--|#line 2228 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2228 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2228")
end

			yyval80 := yyvs80.item (yyvsp80)
			if yyval80 /= Void and attached yyvs78.item (yyvsp78) as l_formal_argument then
				if not yyval80.is_empty then
					l_formal_argument.set_declared_type (yyval80.first.type)
					yyval80.put_first (l_formal_argument)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp78 := yyvsp78 -1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_370
			--|#line 2238 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2238 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2238")
end

			-- TODO: Syntax error
			yyval80 := yyvs80.item (yyvsp80)
			if yyval80 /= Void and attached yyvs78.item (yyvsp78) as l_formal_argument then
				if not yyval80.is_empty then
					l_formal_argument.set_declared_type (yyval80.first.type)
					yyval80.put_first (l_formal_argument)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp78 := yyvsp78 -1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_371
			--|#line 2249 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2249 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2249")
end

			yyval80 := yyvs80.item (yyvsp80)
			if yyval80 /= Void and attached yyvs79.item (yyvsp79) as l_formal_argument then
				yyval80.put_first (l_formal_argument)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp79 := yyvsp79 -1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_372
			--|#line 2256 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2256 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2256")
end

			yyval80 := yyvs80.item (yyvsp80)
			if yyval80 /= Void and attached yyvs79.item (yyvsp79) as l_formal_argument then
				yyval80.put_first (l_formal_argument)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp79 := yyvsp79 -1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_373
			--|#line 2265 "et_eiffel_parser.y"
		local
			yyval78: detachable ET_FORMAL_ARGUMENT
		do
--|#line 2265 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2265")
end

			yyval78 := ast_factory.new_formal_comma_argument (ast_factory.new_argument_name_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), dummy_type)
			if yyval78 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp78 := yyvsp78 + 1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_374
			--|#line 2274 "et_eiffel_parser.y"
		local
			yyval78: detachable ET_FORMAL_ARGUMENT
		do
--|#line 2274 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2274")
end

			yyval78 := ast_factory.new_formal_comma_argument (yyvs12.item (yyvsp12), dummy_type)
			if yyval78 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp78 := yyvsp78 + 1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_375
			--|#line 2283 "et_eiffel_parser.y"
		local
			yyval79: detachable ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2283 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2283")
end

			yyval79 := ast_factory.new_formal_argument (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)))
			if yyval79 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp79 := yyvsp79 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_376
			--|#line 2292 "et_eiffel_parser.y"
		local
			yyval79: detachable ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2292 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2292")
end

			yyval79 := ast_factory.new_formal_argument_semicolon (ast_factory.new_formal_argument (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120))), yyvs21.item (yyvsp21))
			if yyval79 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp79 := yyvsp79 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_377
			--|#line 2303 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2303 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2303")
end

yyval99 := Void 
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

	yy_do_action_378
			--|#line 2305 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2305 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2305")
end

yyval99 := new_local_variables (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp99 := yyvsp99 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_379
			--|#line 2307 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2307 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2307")
end

			yyval99 := yyvs99.item (yyvsp99)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp99 := yyvsp99 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines99.force (yyvs99, yyval99, yyvsp99)
end
		end

	yy_do_action_380
			--|#line 2307 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2307 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2307")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
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

	yy_do_action_381
			--|#line 2320 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2320 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2320")
end

			yyval99 := new_local_variables (last_keyword, counter_value)
			if yyval99 /= Void and attached yyvs98.item (yyvsp98) as l_local_variable then
				yyval99.put_first (l_local_variable)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp99 := yyvsp99 + 1
	yyvsp98 := yyvsp98 -1
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

	yy_do_action_382
			--|#line 2327 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2327 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2327")
end

			yyval99 := new_local_variables (last_keyword, counter_value)
			if yyval99 /= Void and attached yyvs98.item (yyvsp98) as l_local_variable then
				yyval99.put_first (l_local_variable)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp99 := yyvsp99 + 1
	yyvsp98 := yyvsp98 -1
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

	yy_do_action_383
			--|#line 2334 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2334 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2334")
end

			yyval99 := yyvs99.item (yyvsp99)
			if yyval99 /= Void and attached yyvs97.item (yyvsp97) as l_local_variable then
				if not yyval99.is_empty then
					l_local_variable.set_declared_type (yyval99.first.type)
					yyval99.put_first (l_local_variable)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp97 := yyvsp97 -1
	yyspecial_routines99.force (yyvs99, yyval99, yyvsp99)
end
		end

	yy_do_action_384
			--|#line 2344 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2344 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2344")
end

			-- TODO: Syntax error
			yyval99 := yyvs99.item (yyvsp99)
			if yyval99 /= Void and attached yyvs97.item (yyvsp97) as l_local_variable then
				if not yyval99.is_empty then
					l_local_variable.set_declared_type (yyval99.first.type)
					yyval99.put_first (l_local_variable)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp97 := yyvsp97 -1
	yyspecial_routines99.force (yyvs99, yyval99, yyvsp99)
end
		end

	yy_do_action_385
			--|#line 2355 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2355 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2355")
end

			yyval99 := yyvs99.item (yyvsp99)
			if yyval99 /= Void and attached yyvs98.item (yyvsp98) as l_local_variable then
				yyval99.put_first (l_local_variable)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp98 := yyvsp98 -1
	yyspecial_routines99.force (yyvs99, yyval99, yyvsp99)
end
		end

	yy_do_action_386
			--|#line 2362 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2362 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2362")
end

			yyval99 := yyvs99.item (yyvsp99)
			if yyval99 /= Void and attached yyvs98.item (yyvsp98) as l_local_variable then
				yyval99.put_first (l_local_variable)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp98 := yyvsp98 -1
	yyspecial_routines99.force (yyvs99, yyval99, yyvsp99)
end
		end

	yy_do_action_387
			--|#line 2371 "et_eiffel_parser.y"
		local
			yyval97: detachable ET_LOCAL_VARIABLE
		do
--|#line 2371 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2371")
end

			yyval97 := ast_factory.new_local_comma_variable (ast_factory.new_local_name_comma (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), dummy_type)
			if yyval97 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp97 := yyvsp97 + 1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_388
			--|#line 2380 "et_eiffel_parser.y"
		local
			yyval97: detachable ET_LOCAL_VARIABLE
		do
--|#line 2380 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2380")
end

			yyval97 := ast_factory.new_local_comma_variable (yyvs12.item (yyvsp12), dummy_type)
			if yyval97 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp97 := yyvsp97 + 1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_389
			--|#line 2389 "et_eiffel_parser.y"
		local
			yyval98: detachable ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2389 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2389")
end

			yyval98 := ast_factory.new_local_variable (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)))
			if yyval98 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp98 := yyvsp98 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_390
			--|#line 2398 "et_eiffel_parser.y"
		local
			yyval98: detachable ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2398 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2398")
end

			yyval98 := ast_factory.new_local_variable_semicolon (ast_factory.new_local_variable (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120))), yyvs21.item (yyvsp21))
			if yyval98 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp98 := yyvsp98 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_391
			--|#line 2409 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2409 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2409")
end

add_expression_assertion (yyvs69.item (yyvsp69), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_392
			--|#line 2411 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2411 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2411")
end

add_expression_assertion (yyvs69.item (yyvsp69), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_393
			--|#line 2413 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2413 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2413")
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

	yy_do_action_394
			--|#line 2415 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2415 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2415")
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

	yy_do_action_395
			--|#line 2417 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2417 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2417")
end

			if assertion_kind = assertion_kind_postcondition then
					-- 'class' assertions only allowed in postconditions.
				add_class_assertion (ast_factory.new_class_assertion (yyvs2.item (yyvsp2)), Void)
			else
				raise_error
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_396
			--|#line 2426 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2426 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2426")
end

			if assertion_kind = assertion_kind_postcondition then
					-- 'class' assertions only allowed in postconditions.
				add_class_assertion (ast_factory.new_class_assertion (yyvs2.item (yyvsp2)), yyvs21.item (yyvsp21))
			else
				raise_error
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_397
			--|#line 2435 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2435 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2435")
end

add_expression_assertion (yyvs69.item (yyvsp69), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_398
			--|#line 2437 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2437 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2437")
end

add_expression_assertion (yyvs69.item (yyvsp69), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp21 := yyvsp21 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_399
			--|#line 2439 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2439 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2439")
end

add_tagged_assertion (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_400
			--|#line 2441 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2441 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2441")
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

	yy_do_action_401
			--|#line 2443 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2443 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2443")
end

			if assertion_kind = assertion_kind_postcondition then
					-- 'class' assertions only allowed in postconditions.
				add_class_assertion (ast_factory.new_class_assertion (yyvs2.item (yyvsp2)), Void)
			else
				raise_error
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_402
			--|#line 2452 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2452 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2452")
end

			if assertion_kind = assertion_kind_postcondition then
					-- 'class' assertions only allowed in postconditions.
				add_class_assertion (ast_factory.new_class_assertion (yyvs2.item (yyvsp2)), yyvs21.item (yyvsp21))
			else
				raise_error
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp21 := yyvsp21 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_403
			--|#line 2463 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2463 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2463")
end

start_precondition 
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

	yy_do_action_404
			--|#line 2467 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_PRECONDITIONS
		do
--|#line 2467 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2467")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp112 := yyvsp112 + 1
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

	yy_do_action_405
			--|#line 2469 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_PRECONDITIONS
		do
--|#line 2469 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2469")
end

yyval112 := new_preconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_406
			--|#line 2471 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_PRECONDITIONS
		do
--|#line 2471 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2471")
end

yyval112 := new_preconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_407
			--|#line 2473 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_PRECONDITIONS
		do
--|#line 2473 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2473")
end

yyval112 := new_preconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
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

	yy_do_action_408
			--|#line 2475 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_PRECONDITIONS
		do
--|#line 2475 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2475")
end

yyval112 := new_preconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp112 := yyvsp112 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -2
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

	yy_do_action_409
			--|#line 2479 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2479 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2479")
end

start_postcondition 
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

	yy_do_action_410
			--|#line 2483 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_POSTCONDITIONS
		do
--|#line 2483 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2483")
end


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

	yy_do_action_411
			--|#line 2485 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_POSTCONDITIONS
		do
--|#line 2485 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2485")
end

yyval111 := new_postconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp111 := yyvsp111 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_412
			--|#line 2487 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_POSTCONDITIONS
		do
--|#line 2487 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2487")
end

yyval111 := new_postconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp111 := yyvsp111 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_413
			--|#line 2489 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_POSTCONDITIONS
		do
--|#line 2489 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2489")
end

yyval111 := new_postconditions (yyvs2.item (yyvsp2), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp111 := yyvsp111 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
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

	yy_do_action_414
			--|#line 2491 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_POSTCONDITIONS
		do
--|#line 2491 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2491")
end

yyval111 := new_postconditions (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp111 := yyvsp111 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -2
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

	yy_do_action_415
			--|#line 2495 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2495 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2495")
end

start_invariant 
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

	yy_do_action_416
			--|#line 2499 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_INVARIANTS
		do
--|#line 2499 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2499")
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

	yy_do_action_417
			--|#line 2501 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_INVARIANTS
		do
--|#line 2501 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2501")
end

yyval94 := yyvs94.item (yyvsp94) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines94.force (yyvs94, yyval94, yyvsp94)
end
		end

	yy_do_action_418
			--|#line 2505 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_INVARIANTS
		do
--|#line 2505 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2505")
end

yyval94 := new_invariants (yyvs2.item (yyvsp2)) 
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

	yy_do_action_419
			--|#line 2507 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_INVARIANTS
		do
--|#line 2507 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2507")
end

yyval94 := new_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp94 := yyvsp94 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
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

	yy_do_action_420
			--|#line 2511 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2511 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2511")
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

	yy_do_action_421
			--|#line 2515 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2515 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2515")
end

start_loop_invariant 
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
			--|#line 2519 "et_eiffel_parser.y"
		local
			yyval100: detachable ET_LOOP_INVARIANTS
		do
--|#line 2519 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2519")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp100 := yyvsp100 + 1
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

	yy_do_action_423
			--|#line 2521 "et_eiffel_parser.y"
		local
			yyval100: detachable ET_LOOP_INVARIANTS
		do
--|#line 2521 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2521")
end

yyval100 := yyvs100.item (yyvsp100) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines100.force (yyvs100, yyval100, yyvsp100)
end
		end

	yy_do_action_424
			--|#line 2525 "et_eiffel_parser.y"
		local
			yyval100: detachable ET_LOOP_INVARIANTS
		do
--|#line 2525 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2525")
end

yyval100 := new_loop_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp100 := yyvsp100 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_425
			--|#line 2527 "et_eiffel_parser.y"
		local
			yyval100: detachable ET_LOOP_INVARIANTS
		do
--|#line 2527 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2527")
end

yyval100 := new_loop_invariants (yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp100 := yyvsp100 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
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

	yy_do_action_426
			--|#line 2531 "et_eiffel_parser.y"
		local
			yyval126: detachable ET_VARIANT
		do
--|#line 2531 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2531")
end

yyval126 := ast_factory.new_variant (yyvs2.item (yyvsp2), Void, yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp126 := yyvsp126 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp69 := yyvsp69 -1
	if yyvsp126 >= yyvsc126 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs126")
		end
		yyvsc126 := yyvsc126 + yyInitial_yyvs_size
		yyvs126 := yyspecial_routines126.aliased_resized_area (yyvs126, yyvsc126)
	end
	yyspecial_routines126.force (yyvs126, yyval126, yyvsp126)
end
		end

	yy_do_action_427
			--|#line 2533 "et_eiffel_parser.y"
		local
			yyval126: detachable ET_VARIANT
		do
--|#line 2533 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2533")
end

yyval126 := ast_factory.new_variant (yyvs2.item (yyvsp2), ast_factory.new_tag (yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp126 := yyvsp126 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
	if yyvsp126 >= yyvsc126 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs126")
		end
		yyvsc126 := yyvsc126 + yyInitial_yyvs_size
		yyvs126 := yyspecial_routines126.aliased_resized_area (yyvs126, yyvsc126)
	end
	yyspecial_routines126.force (yyvs126, yyval126, yyvsp126)
end
		end

	yy_do_action_428
			--|#line 2537 "et_eiffel_parser.y"
		local
			yyval126: detachable ET_VARIANT
		do
--|#line 2537 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2537")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp126 := yyvsp126 + 1
	if yyvsp126 >= yyvsc126 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs126")
		end
		yyvsc126 := yyvsc126 + yyInitial_yyvs_size
		yyvs126 := yyspecial_routines126.aliased_resized_area (yyvs126, yyvsc126)
	end
	yyspecial_routines126.force (yyvs126, yyval126, yyvsp126)
end
		end

	yy_do_action_429
			--|#line 2539 "et_eiffel_parser.y"
		local
			yyval126: detachable ET_VARIANT
		do
--|#line 2539 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2539")
end

yyval126 := yyvs126.item (yyvsp126) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines126.force (yyvs126, yyval126, yyvsp126)
end
		end

	yy_do_action_430
			--|#line 2545 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 2545 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2545")
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

	yy_do_action_431
			--|#line 2547 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 2547 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2547")
end

yyval47 := yyvs47.item (yyvsp47) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_432
			--|#line 2553 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2553 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2553")
end

yyval120 := new_named_type (Void, yyvs12.item (yyvsp12), Void) 
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

	yy_do_action_433
			--|#line 2555 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2555 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2555")
end

yyval120 := yyvs120.item (yyvsp120) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines120.force (yyvs120, yyval120, yyvsp120)
end
		end

	yy_do_action_434
			--|#line 2559 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2559 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2559")
end

yyval120 := new_named_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp120 := yyvsp120 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_435
			--|#line 2561 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2561 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2561")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_436
			--|#line 2563 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2563 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2563")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_437
			--|#line 2565 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2565 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2565")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_438
			--|#line 2567 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2567 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2567")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_439
			--|#line 2569 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2569 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2569")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_440
			--|#line 2571 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2571 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2571")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_441
			--|#line 2573 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2573 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2573")
end

yyval120 := new_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_442
			--|#line 2575 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2575 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2575")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_443
			--|#line 2577 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2577 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2577")
end

yyval120 := new_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_444
			--|#line 2579 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2579 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2579")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_445
			--|#line 2581 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2581 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2581")
end

yyval120 := yyvs96.item (yyvsp96) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp120 := yyvsp120 + 1
	yyvsp96 := yyvsp96 -1
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

	yy_do_action_446
			--|#line 2583 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2583 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2583")
end

yyval120 := new_tuple_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp120 := yyvsp120 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_447
			--|#line 2585 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2585 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2585")
end

yyval120 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_448
			--|#line 2587 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2587 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2587")
end

yyval120 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_449
			--|#line 2589 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2589 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2589")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_450
			--|#line 2591 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2591 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2591")
end

yyval120 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_451
			--|#line 2593 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2593 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2593")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_452
			--|#line 2595 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2595 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2595")
end

yyval120 := new_tuple_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_453
			--|#line 2597 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2597 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2597")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_454
			--|#line 2599 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2599 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2599")
end

yyval120 := new_tuple_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_455
			--|#line 2601 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2601 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2601")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_456
			--|#line 2605 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2605 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2605")
end

yyval120 := new_named_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp120 := yyvsp120 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_457
			--|#line 2607 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2607 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2607")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_458
			--|#line 2609 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2609 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2609")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_459
			--|#line 2611 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2611 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2611")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_460
			--|#line 2613 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2613 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2613")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_461
			--|#line 2615 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2615 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2615")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_462
			--|#line 2617 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2617 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2617")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_463
			--|#line 2619 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2619 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2619")
end

yyval120 := new_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_464
			--|#line 2621 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2621 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2621")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_465
			--|#line 2623 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2623 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2623")
end

yyval120 := new_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_466
			--|#line 2625 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2625 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2625")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_467
			--|#line 2627 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2627 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2627")
end

yyval120 := yyvs96.item (yyvsp96) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp120 := yyvsp120 + 1
	yyvsp96 := yyvsp96 -1
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

	yy_do_action_468
			--|#line 2629 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2629 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2629")
end

yyval120 := new_tuple_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp120 := yyvsp120 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_469
			--|#line 2631 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2631 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2631")
end

yyval120 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_470
			--|#line 2633 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2633 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2633")
end

yyval120 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_471
			--|#line 2635 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2635 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2635")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_472
			--|#line 2637 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2637 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2637")
end

yyval120 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_473
			--|#line 2639 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2639 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2639")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_474
			--|#line 2641 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2641 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2641")
end

yyval120 := new_tuple_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_475
			--|#line 2643 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2643 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2643")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_476
			--|#line 2645 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2645 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2645")
end

yyval120 := new_tuple_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_477
			--|#line 2647 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2647 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2647")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_478
			--|#line 2651 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2651 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2651")
end

yyval120 := new_named_type (Void, yyvs12.item (yyvsp12), Void) 
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

	yy_do_action_479
			--|#line 2653 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2653 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2653")
end

yyval120 := new_named_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp120 := yyvsp120 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_480
			--|#line 2655 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2655 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2655")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_481
			--|#line 2657 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2657 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2657")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_482
			--|#line 2659 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2659 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2659")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_483
			--|#line 2661 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2661 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2661")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_484
			--|#line 2663 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2663 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2663")
end

yyval120 := new_named_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_485
			--|#line 2665 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2665 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2665")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_486
			--|#line 2667 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2667 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2667")
end

yyval120 := new_named_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_487
			--|#line 2669 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2669 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2669")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_488
			--|#line 2671 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2671 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2671")
end

yyval120 := new_named_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_489
			--|#line 2673 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2673 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2673")
end

yyval120 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_490
			--|#line 2675 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2675 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2675")
end

yyval120 := yyvs96.item (yyvsp96) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp120 := yyvsp120 + 1
	yyvsp96 := yyvsp96 -1
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

	yy_do_action_491
			--|#line 2677 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2677 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2677")
end

yyval120 := new_tuple_type (Void, yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp120 := yyvsp120 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_492
			--|#line 2679 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2679 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2679")
end

yyval120 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_493
			--|#line 2681 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2681 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2681")
end

yyval120 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_494
			--|#line 2683 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2683 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2683")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_495
			--|#line 2685 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2685 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2685")
end

yyval120 := new_tuple_type (yyvs2.item (yyvsp2), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_496
			--|#line 2687 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2687 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2687")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_497
			--|#line 2689 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2689 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2689")
end

yyval120 := new_tuple_type (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_498
			--|#line 2691 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2691 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2691")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_499
			--|#line 2693 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2693 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2693")
end

yyval120 := new_tuple_type (yyvs23.item (yyvsp23), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_500
			--|#line 2695 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2695 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2695")
end

yyval120 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs12.item (yyvsp12), yyvs28.item (yyvsp28)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp120 := yyvsp120 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
	yyvsp28 := yyvsp28 -1
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

	yy_do_action_501
			--|#line 2699 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 2699 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2699")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_502
			--|#line 2701 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 2701 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2701")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_503
			--|#line 2705 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2705 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2705")
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

	yy_do_action_504
			--|#line 2707 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2707 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2707")
end

yyval28 := yyvs28.item (yyvsp28) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_505
			--|#line 2711 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2711 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2711")
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

	yy_do_action_506
			--|#line 2714 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2714 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2714")
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

	yy_do_action_507
			--|#line 2722 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2722 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2722")
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

	yy_do_action_508
			--|#line 2729 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2729 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2729")
end

			if attached yyvs120.item (yyvsp120) as l_type then
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
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_509
			--|#line 2740 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2740 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2740")
end

			yyval28 := yyvs28.item (yyvsp28)
			add_to_actual_parameter_list (yyvs27.item (yyvsp27), yyval28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_510
			--|#line 2745 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2745 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2745")
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

	yy_do_action_511
			--|#line 2750 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2750 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2750")
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

	yy_do_action_512
			--|#line 2755 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2755 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2755")
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

	yy_do_action_513
			--|#line 2762 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2762 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2762")
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

	yy_do_action_514
			--|#line 2768 "et_eiffel_parser.y"
		local
			yyval27: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2768 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2768")
end

			yyval27 := ast_factory.new_actual_parameter_comma (yyvs120.item (yyvsp120), yyvs5.item (yyvsp5))
			if yyval27 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 + 1
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_515
			--|#line 2777 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2777 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2777")
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

	yy_do_action_516
			--|#line 2779 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2779 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2779")
end

yyval28 := yyvs28.item (yyvsp28) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_517
			--|#line 2783 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2783 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2783")
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

	yy_do_action_518
			--|#line 2786 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2786 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2786")
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

	yy_do_action_519
			--|#line 2792 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2792 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2792")
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

	yy_do_action_520
			--|#line 2800 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2800 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2800")
end

			yyval28 := ast_factory.new_actual_parameters (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
			add_to_actual_parameter_list (ast_factory.new_labeled_actual_parameter (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120))), yyval28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp28 := yyvsp28 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_521
			--|#line 2805 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2805 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2805")
end

			yyval28 := yyvs28.item (yyvsp28)
			add_to_actual_parameter_list (yyvs27.item (yyvsp27), yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_522
			--|#line 2810 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2810 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2810")
end

			yyval28 := yyvs28.item (yyvsp28)
			add_to_actual_parameter_list (yyvs27.item (yyvsp27), yyvs28.item (yyvsp28))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp27 := yyvsp27 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_523
			--|#line 2815 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2815 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2815")
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

	yy_do_action_524
			--|#line 2826 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2826 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2826")
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

	yy_do_action_525
			--|#line 2837 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2837 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2837")
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

	yy_do_action_526
			--|#line 2850 "et_eiffel_parser.y"
		local
			yyval27: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2850 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2850")
end

			yyval27 := ast_factory.new_labeled_actual_parameter (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)))
			if yyval27 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp27 := yyvsp27 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_527
			--|#line 2859 "et_eiffel_parser.y"
		local
			yyval27: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2859 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2859")
end

			yyval27 := ast_factory.new_labeled_actual_parameter_semicolon (ast_factory.new_labeled_actual_parameter (yyvs12.item (yyvsp12), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120))), yyvs21.item (yyvsp21))
			if yyval27 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp27 := yyvsp27 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_528
			--|#line 2868 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2868 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2868")
end

yyval96 := new_like_feature (Void, yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_529
			--|#line 2870 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2870 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2870")
end

yyval96 := ast_factory.new_like_current (tokens.implicit_attached_type_mark, yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_530
			--|#line 2872 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2872 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2872")
end

yyval96 := yyvs114.item (yyvsp114) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp96 := yyvsp96 + 1
	yyvsp114 := yyvsp114 -1
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

	yy_do_action_531
			--|#line 2876 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2876 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2876")
end

yyval96 := new_like_feature (Void, yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_532
			--|#line 2878 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2878 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2878")
end

yyval96 := new_like_feature (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_533
			--|#line 2880 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2880 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2880")
end

yyval96 := new_like_feature (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_534
			--|#line 2882 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2882 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2882")
end

yyval96 := new_like_feature (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_535
			--|#line 2884 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2884 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2884")
end

yyval96 := new_like_feature (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_536
			--|#line 2886 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2886 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2886")
end

yyval96 := new_like_feature (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_537
			--|#line 2888 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2888 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2888")
end

yyval96 := new_like_feature (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_538
			--|#line 2890 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2890 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2890")
end

yyval96 := new_like_feature (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp96 := yyvsp96 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_539
			--|#line 2892 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2892 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2892")
end

yyval96 := new_like_feature (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_540
			--|#line 2894 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2894 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2894")
end

yyval96 := new_like_feature (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp96 := yyvsp96 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_541
			--|#line 2896 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2896 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2896")
end

yyval96 := ast_factory.new_like_current (tokens.implicit_attached_type_mark, yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_542
			--|#line 2898 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2898 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2898")
end

yyval96 := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword (tokens.implicit_attached_type_mark, yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_543
			--|#line 2900 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2900 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2900")
end

yyval96 := ast_factory.new_like_current (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_544
			--|#line 2902 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2902 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2902")
end

yyval96 := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_545
			--|#line 2904 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2904 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2904")
end

yyval96 := ast_factory.new_like_current (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_546
			--|#line 2906 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2906 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2906")
end

yyval96 := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp96 := yyvsp96 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_547
			--|#line 2908 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2908 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2908")
end

yyval96 := ast_factory.new_like_current (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -1
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_548
			--|#line 2910 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2910 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2910")
end

yyval96 := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp96 := yyvsp96 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp2 := yyvsp2 -2
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_549
			--|#line 2912 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2912 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2912")
end

yyval96 := ast_factory.new_like_current (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp96 := yyvsp96 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_550
			--|#line 2914 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2914 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2914")
end

yyval96 := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp96 := yyvsp96 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -2
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_551
			--|#line 2916 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2916 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2916")
end

yyval96 := yyvs114.item (yyvsp114) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp96 := yyvsp96 + 1
	yyvsp114 := yyvsp114 -1
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

	yy_do_action_552
			--|#line 2920 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2920 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2920")
end

yyval114 := ast_factory.new_qualified_like_braced_type (Void, yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_553
			--|#line 2922 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2922 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2922")
end

yyval114 := ast_factory.new_qualified_like_type (Void, yyvs96.item (yyvsp96), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp114 := yyvsp114 + 1
	yyvsp96 := yyvsp96 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_554
			--|#line 2926 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2926 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2926")
end

yyval114 := yyvs114.item (yyvsp114) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_555
			--|#line 2928 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2928 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2928")
end

yyval114 := ast_factory.new_qualified_like_braced_type (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_556
			--|#line 2930 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2930 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2930")
end

yyval114 := ast_factory.new_qualified_like_braced_type (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_557
			--|#line 2932 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2932 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2932")
end

yyval114 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_558
			--|#line 2934 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2934 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2934")
end

yyval114 := ast_factory.new_qualified_like_braced_type (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_559
			--|#line 2936 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2936 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2936")
end

yyval114 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_560
			--|#line 2938 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2938 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2938")
end

			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				yyval114 := ast_factory.new_qualified_like_braced_type (yyvs5.item (yyvsp5 - 3), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -4
	yyvsp2 := yyvsp2 -1
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_561
			--|#line 2946 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2946 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2946")
end

			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				yyval114 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5 - 3), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -4
	yyvsp2 := yyvsp2 -2
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_562
			--|#line 2954 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2954 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2954")
end

			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				yyval114 := ast_factory.new_qualified_like_braced_type (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_563
			--|#line 2962 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2962 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2962")
end

			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				yyval114 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -2
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_564
			--|#line 2970 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2970 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2970")
end

yyval114 := ast_factory.new_qualified_like_type (yyvs2.item (yyvsp2), yyvs96.item (yyvsp96), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp96 := yyvsp96 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_565
			--|#line 2972 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2972 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2972")
end

yyval114 := ast_factory.new_qualified_like_type (yyvs2.item (yyvsp2), yyvs96.item (yyvsp96), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp96 := yyvsp96 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_566
			--|#line 2974 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2974 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2974")
end

yyval114 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs96.item (yyvsp96), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp96 := yyvsp96 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_567
			--|#line 2976 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2976 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2976")
end

yyval114 := ast_factory.new_qualified_like_type (yyvs2.item (yyvsp2), yyvs96.item (yyvsp96), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp96 := yyvsp96 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_568
			--|#line 2978 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2978 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2978")
end

yyval114 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs96.item (yyvsp96), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp114 := yyvsp114 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp96 := yyvsp96 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_569
			--|#line 2980 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2980 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2980")
end

yyval114 := ast_factory.new_qualified_like_type (yyvs5.item (yyvsp5 - 1), yyvs96.item (yyvsp96), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp96 := yyvsp96 -1
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

	yy_do_action_570
			--|#line 2982 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2982 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2982")
end

yyval114 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword (yyvs5.item (yyvsp5 - 1), yyvs2.item (yyvsp2)), yyvs96.item (yyvsp96), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp114 := yyvsp114 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp2 := yyvsp2 -1
	yyvsp96 := yyvsp96 -1
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

	yy_do_action_571
			--|#line 2984 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2984 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2984")
end

yyval114 := ast_factory.new_qualified_like_type (yyvs23.item (yyvsp23), yyvs96.item (yyvsp96), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp96 := yyvsp96 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_572
			--|#line 2986 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2986 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2986")
end

yyval114 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword (yyvs23.item (yyvsp23), yyvs2.item (yyvsp2)), yyvs96.item (yyvsp96), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), last_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp114 := yyvsp114 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp2 := yyvsp2 -1
	yyvsp96 := yyvsp96 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_573
			--|#line 2992 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 2992 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2992")
end

yyval47 := ast_factory.new_do_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_574
			--|#line 2996 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 2996 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2996")
end

yyval47 := ast_factory.new_attribute_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_575
			--|#line 3000 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3000 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3000")
end

yyval47 := ast_factory.new_then_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_576
			--|#line 3004 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3004 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3004")
end

yyval47 := ast_factory.new_then_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_577
			--|#line 3008 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3008 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3008")
end

yyval47 := ast_factory.new_else_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_578
			--|#line 3012 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3012 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3012")
end

yyval47 := ast_factory.new_else_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_579
			--|#line 3016 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3016 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3016")
end

yyval47 := ast_factory.new_rescue_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_580
			--|#line 3020 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3020 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3020")
end

yyval47 := ast_factory.new_from_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_581
			--|#line 3024 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3024 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3024")
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

	yy_do_action_582
			--|#line 3026 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3026 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3026")
end

yyval47 := yyvs47.item (yyvsp47) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_583
			--|#line 3030 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3030 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3030")
end

yyval47 := ast_factory.new_loop_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_584
			--|#line 3034 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3034 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3034")
end

			yyval47 := yyvs47.item (yyvsp47)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_585
			--|#line 3041 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3041 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3041")
end

yyval47 := ast_factory.new_empty_compound 
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

	yy_do_action_586
			--|#line 3043 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3043 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3043")
end

yyval47 := yyvs47.item (yyvsp47) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_587
			--|#line 3047 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3047 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3047")
end

yyval47 := ast_factory.new_compound (0) 
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

	yy_do_action_588
			--|#line 3049 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3049 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3049")
end

yyval47 := yyvs47.item (yyvsp47) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_589
			--|#line 3053 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3053 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3053")
end

			if attached yyvs93.item (yyvsp93) as l_instruction then
				yyval47 := ast_factory.new_compound (counter_value + 1)
				if yyval47 /= Void then
					yyval47.put_first (l_instruction)
				end
			else
				yyval47 := ast_factory.new_compound (counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp47 := yyvsp47 + 1
	yyvsp93 := yyvsp93 -1
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

	yy_do_action_590
			--|#line 3064 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3064 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3064")
end

			yyval47 := yyvs47.item (yyvsp47)
			if yyval47 /= Void and attached yyvs93.item (yyvsp93) as l_instruction then
				yyval47.put_first (l_instruction)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp47 := yyvsp47 -1
	yyvsp93 := yyvsp93 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_591
			--|#line 3064 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3064 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3064")
end

			if yyvs93.item (yyvsp93) /= Void then
				increment_counter
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

	yy_do_action_592
			--|#line 3085 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3085 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3085")
end

yyval93 := yyvs93.item (yyvsp93) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_593
			--|#line 3087 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3087 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3087")
end

yyval93 := yyvs93.item (yyvsp93) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_594
			--|#line 3089 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3089 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3089")
end

yyval93 := yyvs93.item (yyvsp93) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_595
			--|#line 3091 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3091 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3091")
end

yyval93 := ast_factory.new_assigner_instruction (yyvs38.item (yyvsp38), yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp93 := yyvsp93 + 1
	yyvsp38 := yyvsp38 -1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_596
			--|#line 3093 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3093 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3093")
end

yyval93 := ast_factory.new_assigner_instruction (yyvs36.item (yyvsp36), yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp93 := yyvsp93 + 1
	yyvsp36 := yyvsp36 -1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_597
			--|#line 3095 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3095 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3095")
end

yyval93 := ast_factory.new_assignment (yyvs129.item (yyvsp129), yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp93 := yyvsp93 + 1
	yyvsp129 := yyvsp129 -1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_598
			--|#line 3097 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3097 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3097")
end

yyval93 := ast_factory.new_assignment_attempt (yyvs129.item (yyvsp129), yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp93 := yyvsp93 + 1
	yyvsp129 := yyvsp129 -1
	yyvsp5 := yyvsp5 -1
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_599
			--|#line 3099 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3099 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3099")
end

yyval93 := yyvs85.item (yyvsp85) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp93 := yyvsp93 + 1
	yyvsp85 := yyvsp85 -1
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

	yy_do_action_600
			--|#line 3101 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3101 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3101")
end

yyval93 := yyvs92.item (yyvsp92) 
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

	yy_do_action_601
			--|#line 3103 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3103 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3103")
end

yyval93 := ast_factory.new_loop_instruction_old_syntax (yyvs47.item (yyvsp47 - 1), yyvs100.item (yyvsp100), yyvs126.item (yyvsp126), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp93 := yyvsp93 + 1
	yyvsp47 := yyvsp47 -2
	yyvsp100 := yyvsp100 -1
	yyvsp126 := yyvsp126 -1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_602
			--|#line 3105 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3105 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3105")
end

			if system_processor.older_ise_version (ise_6_3_7_4554) then
				yyval93 := ast_factory.new_loop_instruction_old_syntax (yyvs47.item (yyvsp47 - 1), yyvs100.item (yyvsp100), Void, ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2))
			else
				yyval93 := ast_factory.new_loop_instruction (yyvs47.item (yyvsp47 - 1), yyvs100.item (yyvsp100), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs47.item (yyvsp47), Void, yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp93 := yyvsp93 + 1
	yyvsp47 := yyvsp47 -2
	yyvsp100 := yyvsp100 -1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_603
			--|#line 3113 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3113 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3113")
end

			if system_processor.older_ise_version (ise_6_3_7_4554) then
				raise_error
			else
				yyval93 := ast_factory.new_loop_instruction (yyvs47.item (yyvsp47 - 1), yyvs100.item (yyvsp100), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs47.item (yyvsp47), yyvs126.item (yyvsp126), yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp93 := yyvsp93 + 1
	yyvsp47 := yyvsp47 -2
	yyvsp100 := yyvsp100 -1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
	yyvsp126 := yyvsp126 -1
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

	yy_do_action_604
			--|#line 3126 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3126 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3126")
end

yyval93 := new_across_instruction (yyvs25.item (yyvsp25), yyvs47.item (yyvsp47 - 1), yyvs100.item (yyvsp100), yyvs48.item (yyvsp48), yyvs47.item (yyvsp47), yyvs126.item (yyvsp126), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp93 := yyvsp93 + 1
	yyvsp25 := yyvsp25 -1
	yyvsp47 := yyvsp47 -2
	yyvsp100 := yyvsp100 -1
	yyvsp48 := yyvsp48 -1
	yyvsp126 := yyvsp126 -1
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

	yy_do_action_605
			--|#line 3128 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3128 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3128")
end

yyval93 := yyvs62.item (yyvsp62) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp93 := yyvsp93 + 1
	yyvsp62 := yyvsp62 -1
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

	yy_do_action_606
			--|#line 3130 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3130 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3130")
end

yyval93 := yyvs39.item (yyvsp39) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp93 := yyvsp93 + 1
	yyvsp39 := yyvsp39 -1
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

	yy_do_action_607
			--|#line 3132 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3132 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3132")
end

yyval93 := yyvs18.item (yyvsp18) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp93 := yyvsp93 + 1
	yyvsp18 := yyvsp18 -1
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

	yy_do_action_608
			--|#line 3134 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3134 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3134")
end

yyval93 := ast_factory.new_null_instruction (yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp93 := yyvsp93 + 1
	yyvsp21 := yyvsp21 -1
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

	yy_do_action_609
			--|#line 3140 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 3140 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3140")
end

start_check_instruction 
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

	yy_do_action_610
			--|#line 3144 "et_eiffel_parser.y"
		local
			yyval39: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3144 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3144")
end

yyval39 := new_check_instruction (yyvs2.item (yyvsp2 - 1), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
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

	yy_do_action_611
			--|#line 3146 "et_eiffel_parser.y"
		local
			yyval39: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3146 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3146")
end

yyval39 := new_check_instruction (yyvs2.item (yyvsp2 - 1), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -2
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

	yy_do_action_612
			--|#line 3148 "et_eiffel_parser.y"
		local
			yyval39: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3148 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3148")
end

yyval39 := new_check_instruction (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	yyvsp47 := yyvsp47 -1
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

	yy_do_action_613
			--|#line 3150 "et_eiffel_parser.y"
		local
			yyval39: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3150 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3150")
end

yyval39 := new_check_instruction (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp39 := yyvsp39 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -2
	yyvsp47 := yyvsp47 -1
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

	yy_do_action_614
			--|#line 3156 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3156 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3156")
end

yyval93 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5), yyvs129.item (yyvsp129), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp93 := yyvsp93 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	yyvsp129 := yyvsp129 -1
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

	yy_do_action_615
			--|#line 3158 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3158 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3158")
end

yyval93 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1), yyvs129.item (yyvsp129), ast_factory.new_qualified_call (new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp93 := yyvsp93 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
	yyvsp129 := yyvsp129 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_616
			--|#line 3160 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3160 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3160")
end

yyval93 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 1), Void, yyvs5.item (yyvsp5), yyvs129.item (yyvsp129), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp93 := yyvsp93 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp129 := yyvsp129 -1
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

	yy_do_action_617
			--|#line 3162 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3162 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3162")
end

yyval93 := ast_factory.new_bang_instruction (yyvs5.item (yyvsp5 - 2), Void, yyvs5.item (yyvsp5 - 1), yyvs129.item (yyvsp129), ast_factory.new_qualified_call (new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp93 := yyvsp93 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp129 := yyvsp129 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_618
			--|#line 3166 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3166 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3166")
end

yyval93 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), yyvs59.item (yyvsp59), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5)), yyvs129.item (yyvsp129), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp93 := yyvsp93 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp59 := yyvsp59 -1
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	yyvsp129 := yyvsp129 -1
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

	yy_do_action_619
			--|#line 3168 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3168 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3168")
end

yyval93 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), yyvs59.item (yyvsp59), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1)), yyvs129.item (yyvsp129), ast_factory.new_qualified_call (new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp93 := yyvsp93 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp59 := yyvsp59 -1
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
	yyvsp129 := yyvsp129 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_620
			--|#line 3170 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3170 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3170")
end

yyval93 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), yyvs59.item (yyvsp59), Void, yyvs129.item (yyvsp129), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp93 := yyvsp93 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp59 := yyvsp59 -1
	yyvsp129 := yyvsp129 -1
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

	yy_do_action_621
			--|#line 3172 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3172 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3172")
end

yyval93 := ast_factory.new_create_instruction (yyvs2.item (yyvsp2), yyvs59.item (yyvsp59), Void, yyvs129.item (yyvsp129), ast_factory.new_qualified_call (new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp93 := yyvsp93 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp59 := yyvsp59 -1
	yyvsp129 := yyvsp129 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_622
			--|#line 3176 "et_eiffel_parser.y"
		local
			yyval58: detachable ET_CREATE_EXPRESSION
		do
--|#line 3176 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3176")
end

yyval58 := ast_factory.new_create_expression (yyvs2.item (yyvsp2), yyvs59.item (yyvsp59), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5)), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp58 := yyvsp58 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp59 := yyvsp59 -1
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_623
			--|#line 3178 "et_eiffel_parser.y"
		local
			yyval58: detachable ET_CREATE_EXPRESSION
		do
--|#line 3178 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3178")
end

yyval58 := ast_factory.new_create_expression (yyvs2.item (yyvsp2), yyvs59.item (yyvsp59), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1)), ast_factory.new_qualified_call (new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26))) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp58 := yyvsp58 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp59 := yyvsp59 -1
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_624
			--|#line 3182 "et_eiffel_parser.y"
		local
			yyval59: detachable ET_CREATION_REGION
		do
--|#line 3182 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3182")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp59 := yyvsp59 + 1
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

	yy_do_action_625
			--|#line 3183 "et_eiffel_parser.y"
		local
			yyval59: detachable ET_CREATION_REGION
		do
--|#line 3183 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3183")
end

yyval59 := ast_factory.new_creation_region (yyvs19.item (yyvsp19 - 1), yyvs12.item (yyvsp12), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp59 := yyvsp59 + 1
	yyvsp19 := yyvsp19 -2
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_626
			--|#line 3189 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_IF_INSTRUCTION
		do
--|#line 3189 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3189")
end

yyval85 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs47.item (yyvsp47), Void, Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
	yyvsp47 := yyvsp47 -1
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

	yy_do_action_627
			--|#line 3191 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_IF_INSTRUCTION
		do
--|#line 3191 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3191")
end

yyval85 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs47.item (yyvsp47 - 1), Void, yyvs47.item (yyvsp47), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
	yyvsp47 := yyvsp47 -2
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

	yy_do_action_628
			--|#line 3193 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_IF_INSTRUCTION
		do
--|#line 3193 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3193")
end

yyval85 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs47.item (yyvsp47), yyvs66.item (yyvsp66), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
	yyvsp47 := yyvsp47 -1
	yyvsp66 := yyvsp66 -1
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

	yy_do_action_629
			--|#line 3195 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_IF_INSTRUCTION
		do
--|#line 3195 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3195")
end

yyval85 := ast_factory.new_if_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs47.item (yyvsp47 - 1), yyvs66.item (yyvsp66), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp85 := yyvsp85 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
	yyvsp47 := yyvsp47 -2
	yyvsp66 := yyvsp66 -1
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

	yy_do_action_630
			--|#line 3199 "et_eiffel_parser.y"
		local
			yyval66: detachable ET_ELSEIF_PART_LIST
		do
--|#line 3199 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3199")
end

			yyval66 := yyvs66.item (yyvsp66)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines66.force (yyvs66, yyval66, yyvsp66)
end
		end

	yy_do_action_631
			--|#line 3206 "et_eiffel_parser.y"
		local
			yyval66: detachable ET_ELSEIF_PART_LIST
		do
--|#line 3206 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3206")
end

			yyval66 := ast_factory.new_elseif_part_list (counter_value)
			if yyval66 /= Void and attached yyvs65.item (yyvsp65) as l_elseif_part then
				yyval66.put_first (l_elseif_part)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp66 := yyvsp66 + 1
	yyvsp65 := yyvsp65 -1
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

	yy_do_action_632
			--|#line 3213 "et_eiffel_parser.y"
		local
			yyval66: detachable ET_ELSEIF_PART_LIST
		do
--|#line 3213 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3213")
end

			yyval66 := yyvs66.item (yyvsp66)
			if yyval66 /= Void and attached yyvs65.item (yyvsp65) as l_elseif_part then
				yyval66.put_first (l_elseif_part)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp65 := yyvsp65 -1
	yyspecial_routines66.force (yyvs66, yyval66, yyvsp66)
end
		end

	yy_do_action_633
			--|#line 3222 "et_eiffel_parser.y"
		local
			yyval65: detachable ET_ELSEIF_PART
		do
--|#line 3222 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3222")
end

			yyval65 := ast_factory.new_elseif_part (ast_factory.new_conditional (yyvs2.item (yyvsp2), yyvs69.item (yyvsp69)), yyvs47.item (yyvsp47))
			if yyval65 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp65 := yyvsp65 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp69 := yyvsp69 -1
	yyvsp47 := yyvsp47 -1
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

	yy_do_action_634
			--|#line 3233 "et_eiffel_parser.y"
		local
			yyval84: detachable ET_IF_EXPRESSION
		do
--|#line 3233 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3233")
end

yyval84 := ast_factory.new_if_expression (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 3), yyvs69.item (yyvsp69 - 2)), yyvs2.item (yyvsp2 - 2), yyvs69.item (yyvsp69 - 1), Void, yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp84 := yyvsp84 + 1
	yyvsp2 := yyvsp2 -4
	yyvsp69 := yyvsp69 -3
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

	yy_do_action_635
			--|#line 3235 "et_eiffel_parser.y"
		local
			yyval84: detachable ET_IF_EXPRESSION
		do
--|#line 3235 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3235")
end

yyval84 := ast_factory.new_if_expression (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 3), yyvs69.item (yyvsp69 - 2)), yyvs2.item (yyvsp2 - 2), yyvs69.item (yyvsp69 - 1), yyvs64.item (yyvsp64), yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp84 := yyvsp84 + 1
	yyvsp2 := yyvsp2 -4
	yyvsp69 := yyvsp69 -3
	yyvsp64 := yyvsp64 -1
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

	yy_do_action_636
			--|#line 3239 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_ELSEIF_EXPRESSION_LIST
		do
--|#line 3239 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3239")
end

			yyval64 := yyvs64.item (yyvsp64)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_637
			--|#line 3246 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_ELSEIF_EXPRESSION_LIST
		do
--|#line 3246 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3246")
end

			yyval64 := ast_factory.new_elseif_expression_list (counter_value)
			if yyval64 /= Void and attached yyvs63.item (yyvsp63) as l_elseif_part then
				yyval64.put_first (l_elseif_part)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp64 := yyvsp64 + 1
	yyvsp63 := yyvsp63 -1
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

	yy_do_action_638
			--|#line 3253 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_ELSEIF_EXPRESSION_LIST
		do
--|#line 3253 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3253")
end

			yyval64 := yyvs64.item (yyvsp64)
			if yyval64 /= Void and attached yyvs63.item (yyvsp63) as l_elseif_part then
				yyval64.put_first (l_elseif_part)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp63 := yyvsp63 -1
	yyspecial_routines64.force (yyvs64, yyval64, yyvsp64)
end
		end

	yy_do_action_639
			--|#line 3262 "et_eiffel_parser.y"
		local
			yyval63: detachable ET_ELSEIF_EXPRESSION
		do
--|#line 3262 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3262")
end

			yyval63 := ast_factory.new_elseif_expression (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69 - 1)), yyvs2.item (yyvsp2), yyvs69.item (yyvsp69))
			if yyval63 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp63 := yyvsp63 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -2
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

	yy_do_action_640
			--|#line 3273 "et_eiffel_parser.y"
		local
			yyval92: detachable ET_INSPECT_INSTRUCTION
		do
--|#line 3273 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3273")
end

yyval92 := ast_factory.new_inspect_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs128.item (yyvsp128), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp92 := yyvsp92 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
	yyvsp128 := yyvsp128 -1
	yyvsp47 := yyvsp47 -1
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

	yy_do_action_641
			--|#line 3275 "et_eiffel_parser.y"
		local
			yyval92: detachable ET_INSPECT_INSTRUCTION
		do
--|#line 3275 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3275")
end

yyval92 := ast_factory.new_inspect_instruction (ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs128.item (yyvsp128), Void, yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp92 := yyvsp92 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
	yyvsp128 := yyvsp128 -1
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

	yy_do_action_642
			--|#line 3279 "et_eiffel_parser.y"
		local
			yyval128: detachable ET_WHEN_PART_LIST
		do
--|#line 3279 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3279")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp128 := yyvsp128 + 1
	if yyvsp128 >= yyvsc128 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs128")
		end
		yyvsc128 := yyvsc128 + yyInitial_yyvs_size
		yyvs128 := yyspecial_routines128.aliased_resized_area (yyvs128, yyvsc128)
	end
	yyspecial_routines128.force (yyvs128, yyval128, yyvsp128)
end
		end

	yy_do_action_643
			--|#line 3281 "et_eiffel_parser.y"
		local
			yyval128: detachable ET_WHEN_PART_LIST
		do
--|#line 3281 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3281")
end

			yyval128 := yyvs128.item (yyvsp128)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines128.force (yyvs128, yyval128, yyvsp128)
end
		end

	yy_do_action_644
			--|#line 3288 "et_eiffel_parser.y"
		local
			yyval128: detachable ET_WHEN_PART_LIST
		do
--|#line 3288 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3288")
end

			yyval128 := ast_factory.new_when_part_list (counter_value)
			if yyval128 /= Void and attached yyvs127.item (yyvsp127) as l_when_part then
				yyval128.put_first (l_when_part)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp128 := yyvsp128 + 1
	yyvsp127 := yyvsp127 -1
	if yyvsp128 >= yyvsc128 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs128")
		end
		yyvsc128 := yyvsc128 + yyInitial_yyvs_size
		yyvs128 := yyspecial_routines128.aliased_resized_area (yyvs128, yyvsc128)
	end
	yyspecial_routines128.force (yyvs128, yyval128, yyvsp128)
end
		end

	yy_do_action_645
			--|#line 3295 "et_eiffel_parser.y"
		local
			yyval128: detachable ET_WHEN_PART_LIST
		do
--|#line 3295 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3295")
end

			yyval128 := yyvs128.item (yyvsp128)
			if yyval128 /= Void and attached yyvs127.item (yyvsp127) as l_when_part then
				yyval128.put_first (l_when_part)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp127 := yyvsp127 -1
	yyspecial_routines128.force (yyvs128, yyval128, yyvsp128)
end
		end

	yy_do_action_646
			--|#line 3304 "et_eiffel_parser.y"
		local
			yyval127: detachable ET_WHEN_PART
		do
--|#line 3304 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3304")
end

			yyval127 := ast_factory.new_when_part (yyvs43.item (yyvsp43), yyvs47.item (yyvsp47))
			if yyval127 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp127 := yyvsp127 + 1
	yyvsp43 := yyvsp43 -1
	yyvsp47 := yyvsp47 -1
	if yyvsp127 >= yyvsc127 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs127")
		end
		yyvsc127 := yyvsc127 + yyInitial_yyvs_size
		yyvs127 := yyspecial_routines127.aliased_resized_area (yyvs127, yyvsc127)
	end
	yyspecial_routines127.force (yyvs127, yyval127, yyvsp127)
end
		end

	yy_do_action_647
			--|#line 3313 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3313 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3313")
end

yyval43 := ast_factory.new_choice_list (yyvs2.item (yyvsp2), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp43 := yyvsp43 + 1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_648
			--|#line 3315 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3315 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3315")
end

			yyval43 := yyvs43.item (yyvsp43)
			remove_keyword
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp43 := yyvsp43 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
		end

	yy_do_action_649
			--|#line 3315 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3315 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3315")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp43 := yyvsp43 + 1
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

	yy_do_action_650
			--|#line 3328 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3328 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3328")
end

			if attached yyvs40.item (yyvsp40) as l_choice then
				yyval43 := ast_factory.new_choice_list (last_keyword, counter_value + 1)
				if yyval43 /= Void then
					yyval43.put_first (l_choice)
				end
			else
				yyval43 := ast_factory.new_choice_list (last_keyword, counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp43 := yyvsp43 + 1
	yyvsp40 := yyvsp40 -1
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

	yy_do_action_651
			--|#line 3339 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3339 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3339")
end

			yyval43 := ast_factory.new_choice_list (last_keyword, counter_value)
			if yyval43 /= Void and attached yyvs42.item (yyvsp42) as l_choice then
				yyval43.put_first (l_choice)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp43 := yyvsp43 + 1
	yyvsp42 := yyvsp42 -1
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

	yy_do_action_652
			--|#line 3347 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3347 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3347")
end

			yyval43 := yyvs43.item (yyvsp43)
			if yyval43 /= Void and attached yyvs42.item (yyvsp42) as l_choice then
				yyval43.put_first (l_choice)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp42 := yyvsp42 -1
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
		end

	yy_do_action_653
			--|#line 3356 "et_eiffel_parser.y"
		local
			yyval42: detachable ET_CHOICE_ITEM
		do
--|#line 3356 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3356")
end

			yyval42 := ast_factory.new_choice_comma (yyvs40.item (yyvsp40), yyvs5.item (yyvsp5))
			if yyval42 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp42 := yyvsp42 + 1
	yyvsp40 := yyvsp40 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_654
			--|#line 3365 "et_eiffel_parser.y"
		local
			yyval40: detachable ET_CHOICE
		do
--|#line 3365 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3365")
end

yyval40 := yyvs41.item (yyvsp41) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp40 := yyvsp40 + 1
	yyvsp41 := yyvsp41 -1
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

	yy_do_action_655
			--|#line 3367 "et_eiffel_parser.y"
		local
			yyval40: detachable ET_CHOICE
		do
--|#line 3367 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3367")
end

yyval40 := ast_factory.new_choice_range (yyvs41.item (yyvsp41 - 1), yyvs5.item (yyvsp5), yyvs41.item (yyvsp41)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp40 := yyvsp40 + 1
	yyvsp41 := yyvsp41 -2
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_656
			--|#line 3371 "et_eiffel_parser.y"
		local
			yyval41: detachable ET_CHOICE_CONSTANT
		do
--|#line 3371 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3371")
end

yyval41 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp41 := yyvsp41 + 1
	yyvsp13 := yyvsp13 -1
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

	yy_do_action_657
			--|#line 3373 "et_eiffel_parser.y"
		local
			yyval41: detachable ET_CHOICE_CONSTANT
		do
--|#line 3373 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3373")
end

yyval41 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp41 := yyvsp41 + 1
	yyvsp9 := yyvsp9 -1
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

	yy_do_action_658
			--|#line 3375 "et_eiffel_parser.y"
		local
			yyval41: detachable ET_CHOICE_CONSTANT
		do
--|#line 3375 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3375")
end

yyval41 := new_choice_attribute_constant (yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp41 := yyvsp41 + 1
	yyvsp12 := yyvsp12 -1
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

	yy_do_action_659
			--|#line 3377 "et_eiffel_parser.y"
		local
			yyval41: detachable ET_CHOICE_CONSTANT
		do
--|#line 3377 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3377")
end

yyval41 := yyvs118.item (yyvsp118) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp41 := yyvsp41 + 1
	yyvsp118 := yyvsp118 -1
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

	yy_do_action_660
			--|#line 3383 "et_eiffel_parser.y"
		local
			yyval25: detachable ET_ACROSS_INSTRUCTION
		do
--|#line 3383 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3383")
end

yyval25 := new_across_instruction_header (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp25 := yyvsp25 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_661
			--|#line 3385 "et_eiffel_parser.y"
		local
			yyval25: detachable ET_ACROSS_INSTRUCTION
		do
--|#line 3385 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3385")
end

yyval25 := new_across_instruction_header (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp25 := yyvsp25 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_662
			--|#line 3389 "et_eiffel_parser.y"
		local
			yyval48: detachable ET_CONDITIONAL
		do
--|#line 3389 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3389")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp48 := yyvsp48 + 1
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

	yy_do_action_663
			--|#line 3391 "et_eiffel_parser.y"
		local
			yyval48: detachable ET_CONDITIONAL
		do
--|#line 3391 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3391")
end

yyval48 := ast_factory.new_conditional (yyvs2.item (yyvsp2), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp48 := yyvsp48 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_664
			--|#line 3397 "et_eiffel_parser.y"
		local
			yyval62: detachable ET_DEBUG_INSTRUCTION
		do
--|#line 3397 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3397")
end

yyval62 := ast_factory.new_debug_instruction (yyvs103.item (yyvsp103), ast_factory.new_debug_compound (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47)), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp62 := yyvsp62 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp103 := yyvsp103 -1
	yyvsp47 := yyvsp47 -1
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

	yy_do_action_665
			--|#line 3401 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3401")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp103 := yyvsp103 + 1
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

	yy_do_action_666
			--|#line 3403 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3403 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3403")
end

yyval103 := ast_factory.new_manifest_string_list (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp103 := yyvsp103 + 1
	yyvsp5 := yyvsp5 -2
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

	yy_do_action_667
			--|#line 3405 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3405 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3405")
end

			yyval103 := yyvs103.item (yyvsp103)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp103 := yyvsp103 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines103.force (yyvs103, yyval103, yyvsp103)
end
		end

	yy_do_action_668
			--|#line 3405 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3405 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3405")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp103 := yyvsp103 + 1
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

	yy_do_action_669
			--|#line 3418 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3418 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3418")
end

			if attached yyvs15.item (yyvsp15) as l_manifest_string then
				yyval103 := ast_factory.new_manifest_string_list (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval103 /= Void then
					yyval103.put_first (l_manifest_string)
				end
			else
				yyval103 := ast_factory.new_manifest_string_list (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp103 := yyvsp103 + 1
	yyvsp15 := yyvsp15 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_670
			--|#line 3429 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3429 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3429")
end

			yyval103 := yyvs103.item (yyvsp103)
			if yyval103 /= Void and attached yyvs102.item (yyvsp102) as l_manifest_string then
				yyval103.put_first (l_manifest_string)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp102 := yyvsp102 -1
	yyspecial_routines103.force (yyvs103, yyval103, yyvsp103)
end
		end

	yy_do_action_671
			--|#line 3438 "et_eiffel_parser.y"
		local
			yyval102: detachable ET_MANIFEST_STRING_ITEM
		do
--|#line 3438 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3438")
end

			yyval102 := ast_factory.new_manifest_string_comma (yyvs15.item (yyvsp15), yyvs5.item (yyvsp5))
			if yyval102 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp102 := yyvsp102 + 1
	yyvsp15 := yyvsp15 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_672
			--|#line 3449 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3449 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3449")
end

yyval93 := new_unqualified_call_instruction (yyvs12.item (yyvsp12), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp93 := yyvsp93 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_673
			--|#line 3451 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3451 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3451")
end

yyval93 := ast_factory.new_qualified_call_instruction (yyvs69.item (yyvsp69), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp93 := yyvsp93 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_674
			--|#line 3453 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3453 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3453")
end

yyval93 := ast_factory.new_qualified_call_instruction (yyvs69.item (yyvsp69), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp93 := yyvsp93 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_675
			--|#line 3455 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3455 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3455")
end

yyval93 := ast_factory.new_precursor_instruction (False, yyvs4.item (yyvsp4), Void, yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp93 := yyvsp93 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_676
			--|#line 3457 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3457 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3457")
end

yyval93 := ast_factory.new_precursor_instruction (False, yyvs4.item (yyvsp4), ast_factory.new_precursor_class_name (yyvs5.item (yyvsp5 - 1), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp93 := yyvsp93 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp5 := yyvsp5 -2
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_677
			--|#line 3459 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3459 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3459")
end

yyval93 := ast_factory.new_static_call_instruction (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1)), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp93 := yyvsp93 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_678
			--|#line 3461 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3461 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3461")
end

yyval93 := ast_factory.new_static_call_instruction (Void, ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1)), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp93 := yyvsp93 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_679
			--|#line 3465 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3465 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3465")
end

yyval69 := new_unqualified_call_expression (yyvs12.item (yyvsp12), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_680
			--|#line 3467 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3467 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3467")
end

yyval69 := ast_factory.new_qualified_call_expression (yyvs69.item (yyvsp69), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_681
			--|#line 3471 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3471 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3471")
end

yyval69 := ast_factory.new_qualified_call_expression (yyvs69.item (yyvsp69), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_682
			--|#line 3475 "et_eiffel_parser.y"
		local
			yyval38: detachable ET_QUALIFIED_CALL_EXPRESSION
		do
--|#line 3475 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3475")
end

yyval38 := ast_factory.new_qualified_call_expression (yyvs69.item (yyvsp69), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_683
			--|#line 3477 "et_eiffel_parser.y"
		local
			yyval38: detachable ET_QUALIFIED_CALL_EXPRESSION
		do
--|#line 3477 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3477")
end

yyval38 := ast_factory.new_qualified_call_expression (yyvs69.item (yyvsp69), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_684
			--|#line 3481 "et_eiffel_parser.y"
		local
			yyval118: detachable ET_STATIC_CALL_EXPRESSION
		do
--|#line 3481 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3481")
end

yyval118 := ast_factory.new_static_call_expression (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1)), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp118 := yyvsp118 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_685
			--|#line 3483 "et_eiffel_parser.y"
		local
			yyval118: detachable ET_STATIC_CALL_EXPRESSION
		do
--|#line 3483 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3483")
end

yyval118 := ast_factory.new_static_call_expression (Void, ast_factory.new_target_type (yyvs5.item (yyvsp5 - 2), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5 - 1)), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp118 := yyvsp118 + 1
	yyvsp5 := yyvsp5 -3
	yyvsp120 := yyvsp120 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_686
			--|#line 3487 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3487 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3487")
end

yyval69 := ast_factory.new_precursor_expression (False, yyvs4.item (yyvsp4), Void, yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_687
			--|#line 3489 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3489 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3489")
end

yyval69 := ast_factory.new_precursor_expression (False, yyvs4.item (yyvsp4), ast_factory.new_precursor_class_name (yyvs5.item (yyvsp5 - 1), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp69 := yyvsp69 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp5 := yyvsp5 -2
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_688
			--|#line 3493 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3493 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3493")
end

yyval69 := new_unqualified_call_expression (yyvs12.item (yyvsp12), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
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

	yy_do_action_689
			--|#line 3495 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3495 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3495")
end

yyval69 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp17 := yyvsp17 -1
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

	yy_do_action_690
			--|#line 3497 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3497 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3497")
end

yyval69 := yyvs10.item (yyvsp10) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_691
			--|#line 3499 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3499 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3499")
end

yyval69 := yyvs106.item (yyvsp106) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp106 := yyvsp106 -1
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

	yy_do_action_692
			--|#line 3501 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3501 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3501")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_693
			--|#line 3503 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3503 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3503")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval69 := yyvs36.item (yyvsp36)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp36 := yyvsp36 -1
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

	yy_do_action_694
			--|#line 3511 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3511 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3511")
end

yyval69 := yyvs118.item (yyvsp118) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp118 := yyvsp118 -1
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

	yy_do_action_695
			--|#line 3513 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3513 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3513")
end

yyval69 := ast_factory.new_qualified_call_expression (yyvs69.item (yyvsp69), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_696
			--|#line 3517 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3517 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3517")
end

			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				yyval69 := yyvs36.item (yyvsp36)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp36 := yyvsp36 -1
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

	yy_do_action_697
			--|#line 3525 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3525 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3525")
end

yyval69 := ast_factory.new_qualified_call_expression (yyvs69.item (yyvsp69), new_dot_feature_name (yyvs5.item (yyvsp5), yyvs12.item (yyvsp12)), yyvs26.item (yyvsp26)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -1
	yyvsp12 := yyvsp12 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_698
			--|#line 3531 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3531 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3531")
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

	yy_do_action_699
			--|#line 3533 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3533 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3533")
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

	yy_do_action_700
			--|#line 3535 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3535 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3535")
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

	yy_do_action_701
			--|#line 3535 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3535 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3535")
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

	yy_do_action_702
			--|#line 3548 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3548 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3548")
end

			if attached yyvs69.item (yyvsp69) as l_expression then
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
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_703
			--|#line 3559 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3559 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3559")
end

			yyval26 := ast_factory.new_actual_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval26 /= Void and attached yyvs70.item (yyvsp70) as l_expression then
				yyval26.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 + 1
	yyvsp70 := yyvsp70 -1
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

	yy_do_action_704
			--|#line 3567 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3567 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3567")
end

			yyval26 := yyvs26.item (yyvsp26)
			if yyval26 /= Void and attached yyvs70.item (yyvsp70) as l_expression then
				yyval26.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_705
			--|#line 3576 "et_eiffel_parser.y"
		local
			yyval70: detachable ET_EXPRESSION_ITEM
		do
--|#line 3576 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3576")
end

			yyval70 := ast_factory.new_expression_comma (yyvs69.item (yyvsp69), yyvs5.item (yyvsp5))
			if yyval70 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_706
			--|#line 3585 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3585 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3585")
end

yyval69 := new_feature_address (yyvs5.item (yyvsp5), yyvs76.item (yyvsp76)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp76 := yyvsp76 -1
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

	yy_do_action_707
			--|#line 3587 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3587 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3587")
end

yyval69 := ast_factory.new_current_address (yyvs5.item (yyvsp5), yyvs10.item (yyvsp10)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_708
			--|#line 3589 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3589 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3589")
end

yyval69 := ast_factory.new_result_address (yyvs5.item (yyvsp5), yyvs17.item (yyvsp17)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp17 := yyvsp17 -1
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

	yy_do_action_709
			--|#line 3591 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3591 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3591")
end

yyval69 := ast_factory.new_expression_address (yyvs5.item (yyvsp5), yyvs106.item (yyvsp106)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp106 := yyvsp106 -1
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

	yy_do_action_710
			--|#line 3598 "et_eiffel_parser.y"
		local
			yyval129: detachable ET_WRITABLE
		do
--|#line 3598 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3598")
end

yyval129 := new_writable (yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp129 := yyvsp129 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp129 >= yyvsc129 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs129")
		end
		yyvsc129 := yyvsc129 + yyInitial_yyvs_size
		yyvs129 := yyspecial_routines129.aliased_resized_area (yyvs129, yyvsc129)
	end
	yyspecial_routines129.force (yyvs129, yyval129, yyvsp129)
end
		end

	yy_do_action_711
			--|#line 3600 "et_eiffel_parser.y"
		local
			yyval129: detachable ET_WRITABLE
		do
--|#line 3600 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3600")
end

yyval129 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp129 := yyvsp129 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp129 >= yyvsc129 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs129")
		end
		yyvsc129 := yyvsc129 + yyInitial_yyvs_size
		yyvs129 := yyspecial_routines129.aliased_resized_area (yyvs129, yyvsc129)
	end
	yyspecial_routines129.force (yyvs129, yyval129, yyvsp129)
end
		end

	yy_do_action_712
			--|#line 3606 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3606 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3606")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_713
			--|#line 3608 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3608 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3608")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_714
			--|#line 3612 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3612 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3612")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), ast_factory.new_infix_free_operator (yyvs11.item (yyvsp11)), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp11 := yyvsp11 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_715
			--|#line 3614 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3614 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3614")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), ast_factory.new_infix_plus_operator (yyvs19.item (yyvsp19)), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_716
			--|#line 3616 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3616 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3616")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), ast_factory.new_infix_minus_operator (yyvs19.item (yyvsp19)), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_717
			--|#line 3618 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3618 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3618")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_718
			--|#line 3620 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3620 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3620")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_719
			--|#line 3622 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3622 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3622")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_720
			--|#line 3624 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3624 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3624")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_721
			--|#line 3626 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3626 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3626")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_722
			--|#line 3628 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3628 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3628")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_723
			--|#line 3630 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3630 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3630")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_724
			--|#line 3632 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3632 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3632")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_725
			--|#line 3634 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3634 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3634")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_726
			--|#line 3636 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3636 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3636")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs14.item (yyvsp14), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp14 := yyvsp14 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_727
			--|#line 3638 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3638 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3638")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs14.item (yyvsp14), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp14 := yyvsp14 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_728
			--|#line 3640 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3640 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3640")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs14.item (yyvsp14), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp14 := yyvsp14 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_729
			--|#line 3642 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3642 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3642")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), ast_factory.new_infix_and_then_operator (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2)), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp69 := yyvsp69 -1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_730
			--|#line 3644 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3644 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3644")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), ast_factory.new_infix_or_else_operator (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2)), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp69 := yyvsp69 -1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_731
			--|#line 3646 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3646 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3646")
end

yyval69 := ast_factory.new_infix_expression (yyvs69.item (yyvsp69 - 1), yyvs14.item (yyvsp14), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp14 := yyvsp14 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_732
			--|#line 3648 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3648 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3648")
end

yyval69 := ast_factory.new_equality_expression (yyvs69.item (yyvsp69 - 1), yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_733
			--|#line 3650 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3650 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3650")
end

yyval69 := ast_factory.new_equality_expression (yyvs69.item (yyvsp69 - 1), yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_734
			--|#line 3652 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3652 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3652")
end

yyval69 := ast_factory.new_object_equality_expression (yyvs69.item (yyvsp69 - 1), yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_735
			--|#line 3654 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3654 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3654")
end

yyval69 := ast_factory.new_object_equality_expression (yyvs69.item (yyvsp69 - 1), yyvs5.item (yyvsp5), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_736
			--|#line 3658 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3658 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3658")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_737
			--|#line 3660 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3660 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3660")
end

yyval69 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp13 := yyvsp13 -1
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

	yy_do_action_738
			--|#line 3662 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3662 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3662")
end

yyval69 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp16 := yyvsp16 -1
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

	yy_do_action_739
			--|#line 3664 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3664 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3664")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_740
			--|#line 3666 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3666 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3666")
end

yyval69 := yyvs36.item (yyvsp36) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp36 := yyvsp36 -1
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

	yy_do_action_741
			--|#line 3668 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3668 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3668")
end

yyval69 := ast_factory.new_manifest_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp69 := yyvsp69 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_742
			--|#line 3672 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3672 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3672")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_743
			--|#line 3674 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3674 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3674")
end

yyval69 := yyvs36.item (yyvsp36) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp36 := yyvsp36 -1
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

	yy_do_action_744
			--|#line 3676 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3676 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3676")
end

yyval69 := yyvs58.item (yyvsp58) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp58 := yyvsp58 -1
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

	yy_do_action_745
			--|#line 3678 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3678 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3678")
end

yyval69 := yyvs24.item (yyvsp24) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_746
			--|#line 3680 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3680 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3680")
end

yyval69 := yyvs24.item (yyvsp24) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp24 := yyvsp24 -1
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

	yy_do_action_747
			--|#line 3682 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3682 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3682")
end

yyval69 := yyvs84.item (yyvsp84) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp84 := yyvsp84 -1
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

	yy_do_action_748
			--|#line 3684 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3684 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3684")
end

yyval69 := yyvs104.item (yyvsp104) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp104 := yyvsp104 -1
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

	yy_do_action_749
			--|#line 3686 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3686 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3686")
end

yyval69 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp13 := yyvsp13 -1
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

	yy_do_action_750
			--|#line 3688 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3688 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3688")
end

yyval69 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp16 := yyvsp16 -1
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

	yy_do_action_751
			--|#line 3690 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3690 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3690")
end

yyval69 := new_prefix_plus_expression (yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_752
			--|#line 3692 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3692 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3692")
end

yyval69 := new_prefix_minus_expression (yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_753
			--|#line 3694 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3694 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3694")
end

yyval69 := ast_factory.new_prefix_expression (yyvs14.item (yyvsp14), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_754
			--|#line 3696 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3696 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3696")
end

yyval69 := ast_factory.new_prefix_expression (ast_factory.new_prefix_free_operator (yyvs11.item (yyvsp11)), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_755
			--|#line 3698 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3698 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3698")
end

yyval69 := ast_factory.new_old_expression (yyvs2.item (yyvsp2), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_756
			--|#line 3700 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3700 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3700")
end

			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				yyval69 := new_old_object_test (yyvs5.item (yyvsp5 - 2), yyvs12.item (yyvsp12), yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5), yyvs69.item (yyvsp69))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp5 := yyvsp5 -3
	yyvsp12 := yyvsp12 -1
	yyvsp120 := yyvsp120 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_757
			--|#line 3708 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3708 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3708")
end

yyval69 := ast_factory.new_object_test (yyvs2.item (yyvsp2), Void, yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_758
			--|#line 3710 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3710 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3710")
end

yyval69 := ast_factory.new_object_test (yyvs2.item (yyvsp2), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5)), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_759
			--|#line 3712 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3712 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3712")
end

yyval69 := new_named_object_test (yyvs2.item (yyvsp2 - 1), Void, yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -2
	yyvsp12 := yyvsp12 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_760
			--|#line 3714 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3714 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3714")
end

yyval69 := new_named_object_test (yyvs2.item (yyvsp2 - 1), ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5)), yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp2 := yyvsp2 -2
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	yyvsp12 := yyvsp12 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_761
			--|#line 3718 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3718 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3718")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_762
			--|#line 3720 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3720 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3720")
end

yyval69 := yyvs118.item (yyvsp118) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp118 := yyvsp118 -1
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

	yy_do_action_763
			--|#line 3722 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3722 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3722")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_764
			--|#line 3724 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3724 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3724")
end

yyval69 := yyvs17.item (yyvsp17) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp17 := yyvsp17 -1
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

	yy_do_action_765
			--|#line 3726 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3726 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3726")
end

yyval69 := yyvs10.item (yyvsp10) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp10 := yyvsp10 -1
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

	yy_do_action_766
			--|#line 3728 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3728 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3728")
end

yyval69 := yyvs106.item (yyvsp106) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp106 := yyvsp106 -1
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

	yy_do_action_767
			--|#line 3730 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3730 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3730")
end

yyval69 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp7 := yyvsp7 -1
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

	yy_do_action_768
			--|#line 3732 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3732 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3732")
end

yyval69 := yyvs37.item (yyvsp37) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp37 := yyvsp37 -1
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

	yy_do_action_769
			--|#line 3734 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3734 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3734")
end

yyval69 := yyvs91.item (yyvsp91) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp91 := yyvsp91 -1
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

	yy_do_action_770
			--|#line 3736 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3736 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3736")
end

yyval69 := yyvs20.item (yyvsp20) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp20 := yyvsp20 -1
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

	yy_do_action_771
			--|#line 3738 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3738 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3738")
end

yyval69 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp9 := yyvsp9 -1
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

	yy_do_action_772
			--|#line 3740 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3740 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3740")
end

yyval69 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp15 := yyvsp15 -1
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

	yy_do_action_773
			--|#line 3742 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3742 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3742")
end

yyval69 := new_once_manifest_string (yyvs2.item (yyvsp2), yyvs15.item (yyvsp15)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp15 := yyvsp15 -1
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

	yy_do_action_774
			--|#line 3775 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3775 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3775")
end

yyval69 := yyvs101.item (yyvsp101) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp101 := yyvsp101 -1
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

	yy_do_action_775
			--|#line 3777 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3777 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3777")
end

yyval69 := yyvs119.item (yyvsp119) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp119 := yyvsp119 -1
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

	yy_do_action_776
			--|#line 3779 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3779 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3779")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_777
			--|#line 3783 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3783 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3783")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_778
			--|#line 3785 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3785 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3785")
end

yyval69 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp15 := yyvsp15 -1
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

	yy_do_action_779
			--|#line 3787 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3787 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3787")
end

			if system_processor.older_ise_version (ise_17_11_0) then
				raise_error
			else
				yyval69 := yyvs101.item (yyvsp101)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp101 := yyvsp101 -1
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

	yy_do_action_780
			--|#line 3795 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3795 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3795")
end

yyval69 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp69 := yyvsp69 + 1
	yyvsp9 := yyvsp9 -1
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

	yy_do_action_781
			--|#line 3799 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3799 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3799")
end

yyval36 := yyvs36.item (yyvsp36) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
		end

	yy_do_action_782
			--|#line 3801 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3801 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3801")
end

yyval36 := yyvs36.item (yyvsp36) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
		end

	yy_do_action_783
			--|#line 3805 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3805 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3805")
end

			yyval36 := ast_factory.new_bracket_expression (yyvs69.item (yyvsp69), yyvs22.item (yyvsp22), yyvs26.item (yyvsp26))
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp69 := yyvsp69 -1
	yyvsp22 := yyvsp22 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
		end

	yy_do_action_784
			--|#line 3805 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3805 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3805")
end

			add_symbol (yyvs22.item (yyvsp22))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp36 := yyvsp36 + 1
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

	yy_do_action_785
			--|#line 3816 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3816 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3816")
end

			yyval36 := ast_factory.new_bracket_expression (yyvs36.item (yyvsp36 - 1), yyvs22.item (yyvsp22), yyvs26.item (yyvsp26))
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 -1
	yyvsp22 := yyvsp22 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
		end

	yy_do_action_786
			--|#line 3816 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3816 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3816")
end

			add_symbol (yyvs22.item (yyvsp22))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp36 := yyvsp36 + 1
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

	yy_do_action_787
			--|#line 3829 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3829 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3829")
end

			yyval36 := ast_factory.new_bracket_expression (yyvs69.item (yyvsp69), yyvs22.item (yyvsp22), yyvs26.item (yyvsp26))
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp69 := yyvsp69 -1
	yyvsp22 := yyvsp22 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
		end

	yy_do_action_788
			--|#line 3829 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3829 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3829")
end

			add_symbol (yyvs22.item (yyvsp22))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp36 := yyvsp36 + 1
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

	yy_do_action_789
			--|#line 3840 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3840 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3840")
end

			yyval36 := ast_factory.new_bracket_expression (yyvs36.item (yyvsp36 - 1), yyvs22.item (yyvsp22), yyvs26.item (yyvsp26))
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp36 := yyvsp36 -1
	yyvsp22 := yyvsp22 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
		end

	yy_do_action_790
			--|#line 3840 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3840 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3840")
end

			add_symbol (yyvs22.item (yyvsp22))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp36 := yyvsp36 + 1
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

	yy_do_action_791
			--|#line 3853 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3853 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3853")
end

			if attached yyvs69.item (yyvsp69) as l_expression then
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
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_792
			--|#line 3864 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3864 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3864")
end

			yyval26 := ast_factory.new_bracket_arguments (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval26 /= Void and attached yyvs70.item (yyvsp70) as l_expression then
				yyval26.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp26 := yyvsp26 + 1
	yyvsp70 := yyvsp70 -1
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

	yy_do_action_793
			--|#line 3872 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3872 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3872")
end

			yyval26 := yyvs26.item (yyvsp26)
			if yyval26 /= Void and attached yyvs70.item (yyvsp70) as l_expression then
				yyval26.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
		end

	yy_do_action_794
			--|#line 3881 "et_eiffel_parser.y"
		local
			yyval106: detachable ET_PARENTHESIZED_EXPRESSION
		do
--|#line 3881 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3881")
end

			remove_symbol
			remove_counter
		 	yyval106 := ast_factory.new_parenthesized_expression (yyvs5.item (yyvsp5 - 1), yyvs69.item (yyvsp69), yyvs5.item (yyvsp5))
		 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp106 := yyvsp106 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_795
			--|#line 3889 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3889 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3889")
end

yyval101 := ast_factory.new_manifest_array (yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp101 := yyvsp101 + 1
	yyvsp5 := yyvsp5 -2
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

	yy_do_action_796
			--|#line 3891 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3891 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3891")
end

			yyval101 := yyvs101.item (yyvsp101)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp101 := yyvsp101 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines101.force (yyvs101, yyval101, yyvsp101)
end
		end

	yy_do_action_797
			--|#line 3891 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3891 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3891")
end

			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp101 := yyvsp101 + 1
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

	yy_do_action_798
			--|#line 3904 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3904 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3904")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void then
				yyval101.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	yyspecial_routines101.force (yyvs101, yyval101, yyvsp101)
end
		end

	yy_do_action_799
			--|#line 3913 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3913 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3913")
end

			if attached yyvs69.item (yyvsp69) as l_expression then
				yyval101 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval101 /= Void then
					yyval101.put_first (l_expression)
				end
			else
				yyval101 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp101 := yyvsp101 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_800
			--|#line 3924 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3924 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3924")
end

			yyval101 := ast_factory.new_manifest_array (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval101 /= Void and attached yyvs70.item (yyvsp70) as l_expression then
				yyval101.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp101 := yyvsp101 + 1
	yyvsp70 := yyvsp70 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_801
			--|#line 3932 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3932 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3932")
end

			yyval101 := yyvs101.item (yyvsp101)
			if yyval101 /= Void and attached yyvs70.item (yyvsp70) as l_expression then
				yyval101.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyspecial_routines101.force (yyvs101, yyval101, yyvsp101)
end
		end

	yy_do_action_802
			--|#line 3941 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3941 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3941")
end

yyval104 := ast_factory.new_manifest_tuple (yyvs22.item (yyvsp22), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp104 := yyvsp104 + 1
	yyvsp22 := yyvsp22 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_803
			--|#line 3943 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3943 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3943")
end

			yyval104 := yyvs104.item (yyvsp104)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp104 := yyvsp104 -1
	yyvsp22 := yyvsp22 -1
	yyspecial_routines104.force (yyvs104, yyval104, yyvsp104)
end
		end

	yy_do_action_804
			--|#line 3943 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3943 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3943")
end

			add_symbol (yyvs22.item (yyvsp22))
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

	yy_do_action_805
			--|#line 3956 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3956 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3956")
end

			if attached yyvs69.item (yyvsp69) as l_expression then
				yyval104 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval104 /= Void then
					yyval104.put_first (l_expression)
				end
			else
				yyval104 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp104 := yyvsp104 + 1
	yyvsp69 := yyvsp69 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_806
			--|#line 3967 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3967 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3967")
end

			yyval104 := ast_factory.new_manifest_tuple (last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval104 /= Void and attached yyvs70.item (yyvsp70) as l_expression then
				yyval104.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp104 := yyvsp104 + 1
	yyvsp70 := yyvsp70 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_807
			--|#line 3975 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3975 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3975")
end

			yyval104 := yyvs104.item (yyvsp104)
			if yyval104 /= Void and attached yyvs70.item (yyvsp70) as l_expression then
				yyval104.put_first (l_expression)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp70 := yyvsp70 -1
	yyspecial_routines104.force (yyvs104, yyval104, yyvsp104)
end
		end

	yy_do_action_808
			--|#line 3984 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 3984 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3984")
end

yyval119 := ast_factory.new_strip_expression (yyvs2.item (yyvsp2), yyvs5.item (yyvsp5 - 1), yyvs5.item (yyvsp5), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp119 := yyvsp119 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -2
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

	yy_do_action_809
			--|#line 3986 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 3986 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3986")
end

			yyval119 := yyvs119.item (yyvsp119)
			remove_keyword
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp119 := yyvsp119 -1
	yyvsp2 := yyvsp2 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines119.force (yyvs119, yyval119, yyvsp119)
end
		end

	yy_do_action_810
			--|#line 3986 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 3986 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3986")
end

			add_keyword (yyvs2.item (yyvsp2))
			add_symbol (yyvs5.item (yyvsp5))
			add_counter
		
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

	yy_do_action_811
			--|#line 4001 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 4001 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4001")
end

			if attached yyvs76.item (yyvsp76) as l_feature_name then
				yyval119 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value + 1)
				if yyval119 /= Void then
					yyval119.put_first (l_feature_name)
				end
			else
				yyval119 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp119 := yyvsp119 + 1
	yyvsp76 := yyvsp76 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_812
			--|#line 4012 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 4012 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4012")
end

			yyval119 := ast_factory.new_strip_expression (last_keyword, last_symbol, yyvs5.item (yyvsp5), counter_value)
			if yyval119 /= Void and attached yyvs77.item (yyvsp77) as l_feature_name then
				yyval119.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp119 := yyvsp119 + 1
	yyvsp77 := yyvsp77 -1
	yyvsp5 := yyvsp5 -1
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

	yy_do_action_813
			--|#line 4020 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 4020 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4020")
end

			yyval119 := yyvs119.item (yyvsp119)
			if yyval119 /= Void and attached yyvs77.item (yyvsp77) as l_feature_name then
				yyval119.put_first (l_feature_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp77 := yyvsp77 -1
	yyspecial_routines119.force (yyvs119, yyval119, yyvsp119)
end
		end

	yy_do_action_814
			--|#line 4029 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTANT
		do
--|#line 4029 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4029")
end

yyval49 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp49 := yyvsp49 + 1
	yyvsp7 := yyvsp7 -1
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

	yy_do_action_815
			--|#line 4031 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTANT
		do
--|#line 4031 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4031")
end

yyval49 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp49 := yyvsp49 + 1
	yyvsp9 := yyvsp9 -1
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

	yy_do_action_816
			--|#line 4033 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTANT
		do
--|#line 4033 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4033")
end

yyval49 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp49 := yyvsp49 + 1
	yyvsp13 := yyvsp13 -1
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

	yy_do_action_817
			--|#line 4035 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTANT
		do
--|#line 4035 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4035")
end

yyval49 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp49 := yyvsp49 + 1
	yyvsp16 := yyvsp16 -1
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

	yy_do_action_818
			--|#line 4037 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTANT
		do
--|#line 4037 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4037")
end

yyval49 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp49 := yyvsp49 + 1
	yyvsp15 := yyvsp15 -1
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

	yy_do_action_819
			--|#line 4041 "et_eiffel_parser.y"
		local
			yyval24: detachable ET_ACROSS_EXPRESSION
		do
--|#line 4041 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4041")
end

yyval24 := new_across_some_expression (yyvs24.item (yyvsp24), yyvs100.item (yyvsp100), yyvs48.item (yyvsp48), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs126.item (yyvsp126), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp100 := yyvsp100 -1
	yyvsp48 := yyvsp48 -1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
	yyvsp126 := yyvsp126 -1
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
		end

	yy_do_action_820
			--|#line 4045 "et_eiffel_parser.y"
		local
			yyval24: detachable ET_ACROSS_EXPRESSION
		do
--|#line 4045 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4045")
end

yyval24 := new_across_all_expression (yyvs24.item (yyvsp24), yyvs100.item (yyvsp100), yyvs48.item (yyvsp48), ast_factory.new_conditional (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69)), yyvs126.item (yyvsp126), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp100 := yyvsp100 -1
	yyvsp48 := yyvsp48 -1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
	yyvsp126 := yyvsp126 -1
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
		end

	yy_do_action_821
			--|#line 4049 "et_eiffel_parser.y"
		local
			yyval24: detachable ET_ACROSS_EXPRESSION
		do
--|#line 4049 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4049")
end

yyval24 := new_across_expression_header (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp24 := yyvsp24 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_822
			--|#line 4051 "et_eiffel_parser.y"
		local
			yyval24: detachable ET_ACROSS_EXPRESSION
		do
--|#line 4051 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4051")
end

yyval24 := new_across_expression_header (yyvs2.item (yyvsp2 - 1), yyvs69.item (yyvsp69), yyvs2.item (yyvsp2), yyvs12.item (yyvsp12)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp24 := yyvsp24 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_823
			--|#line 4057 "et_eiffel_parser.y"
		local
			yyval37: detachable ET_CALL_AGENT
		do
--|#line 4057 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4057")
end

yyval37 := ast_factory.new_call_agent (yyvs3.item (yyvsp3), Void, yyvs76.item (yyvsp76), yyvs31.item (yyvsp31)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp76 := yyvsp76 -1
	yyvsp31 := yyvsp31 -1
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

	yy_do_action_824
			--|#line 4059 "et_eiffel_parser.y"
		local
			yyval37: detachable ET_CALL_AGENT
		do
--|#line 4059 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4059")
end

yyval37 := ast_factory.new_call_agent (yyvs3.item (yyvsp3), yyvs32.item (yyvsp32), ast_factory.new_dot_feature_name (yyvs5.item (yyvsp5), yyvs76.item (yyvsp76)), yyvs31.item (yyvsp31)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp37 := yyvsp37 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp32 := yyvsp32 -1
	yyvsp5 := yyvsp5 -1
	yyvsp76 := yyvsp76 -1
	yyvsp31 := yyvsp31 -1
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

	yy_do_action_825
			--|#line 4063 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4063 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4063")
end

			set_inline_agent_actual_arguments (yyvs91.item (yyvsp91), yyvs31.item (yyvsp31))
			yyval91 := yyvs91.item (yyvsp91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp31 := yyvsp31 -1
	yyspecial_routines91.force (yyvs91, yyval91, yyvsp91)
end
		end

	yy_do_action_826
			--|#line 4070 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4070 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4070")
end

			yyval91 := ast_factory.new_do_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs47.item (yyvsp47 - 1), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_827
			--|#line 4080 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4080 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4080")
end

			yyval91 := ast_factory.new_do_function_inline_agent (yyvs3.item (yyvsp3), yyvs80.item (yyvsp80), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs47.item (yyvsp47 - 1), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_828
			--|#line 4086 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4086 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4086")
end

			yyval91 := ast_factory.new_once_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs103.item (yyvsp103), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47 - 1)), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp2 := yyvsp2 -2
	yyvsp103 := yyvsp103 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
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

	yy_do_action_829
			--|#line 4092 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4092 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4092")
end

			yyval91 := ast_factory.new_once_function_inline_agent (yyvs3.item (yyvsp3), yyvs80.item (yyvsp80), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs103.item (yyvsp103), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47 - 1)), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 12
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp2 := yyvsp2 -2
	yyvsp103 := yyvsp103 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
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

	yy_do_action_830
			--|#line 4098 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4098 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4098")
end

			yyval91 := ast_factory.new_external_function_inline_agent (yyvs3.item (yyvsp3), Void, ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs112.item (yyvsp112), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs72.item (yyvsp72), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp112 := yyvsp112 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp72 := yyvsp72 -1
	yyvsp111 := yyvsp111 -1
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

	yy_do_action_831
			--|#line 4104 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4104 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4104")
end

			yyval91 := ast_factory.new_external_function_inline_agent (yyvs3.item (yyvsp3), yyvs80.item (yyvsp80), ast_factory.new_colon_type (yyvs5.item (yyvsp5), yyvs120.item (yyvsp120)), yyvs112.item (yyvsp112), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs72.item (yyvsp72), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp80 := yyvsp80 -1
	yyvsp5 := yyvsp5 -1
	yyvsp120 := yyvsp120 -1
	yyvsp112 := yyvsp112 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp72 := yyvsp72 -1
	yyvsp111 := yyvsp111 -1
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

	yy_do_action_832
			--|#line 4110 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4110 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4110")
end

			yyval91 := ast_factory.new_do_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs47.item (yyvsp47 - 1), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_833
			--|#line 4116 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4116 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4116")
end

			yyval91 := ast_factory.new_do_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs80.item (yyvsp80), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs47.item (yyvsp47 - 1), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp80 := yyvsp80 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
	yyvsp2 := yyvsp2 -1
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

	yy_do_action_834
			--|#line 4122 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4122 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4122")
end

			yyval91 := ast_factory.new_once_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs103.item (yyvsp103), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47 - 1)), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp2 := yyvsp2 -2
	yyvsp103 := yyvsp103 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
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

	yy_do_action_835
			--|#line 4128 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4128 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4128")
end

			yyval91 := ast_factory.new_once_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs80.item (yyvsp80), yyvs112.item (yyvsp112), yyvs99.item (yyvsp99), yyvs103.item (yyvsp103), ast_factory.new_once_compound (yyvs2.item (yyvsp2 - 1), yyvs47.item (yyvsp47 - 1)), yyvs111.item (yyvsp111), yyvs47.item (yyvsp47), yyvs2.item (yyvsp2), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 10
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp80 := yyvsp80 -1
	yyvsp112 := yyvsp112 -1
	yyvsp99 := yyvsp99 -1
	yyvsp2 := yyvsp2 -2
	yyvsp103 := yyvsp103 -1
	yyvsp47 := yyvsp47 -2
	yyvsp111 := yyvsp111 -1
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

	yy_do_action_836
			--|#line 4133 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4133 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4133")
end

			yyval91 := ast_factory.new_external_procedure_inline_agent (yyvs3.item (yyvsp3), Void, yyvs112.item (yyvsp112), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs72.item (yyvsp72), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvsp112 := yyvsp112 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp72 := yyvsp72 -1
	yyvsp111 := yyvsp111 -1
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

	yy_do_action_837
			--|#line 4139 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4139 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4139")
end

			yyval91 := ast_factory.new_external_procedure_inline_agent (yyvs3.item (yyvsp3), yyvs80.item (yyvsp80), yyvs112.item (yyvsp112), ast_factory.new_external_language (yyvs2.item (yyvsp2 - 1), yyvs15.item (yyvsp15)), yyvs72.item (yyvsp72), yyvs111.item (yyvsp111), yyvs2.item (yyvsp2), Void)
			register_inline_agent (yyval91)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp91 := yyvsp91 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp80 := yyvsp80 -1
	yyvsp112 := yyvsp112 -1
	yyvsp2 := yyvsp2 -2
	yyvsp15 := yyvsp15 -1
	yyvsp72 := yyvsp72 -1
	yyvsp111 := yyvsp111 -1
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

	yy_do_action_838
			--|#line 4147 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 4147 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4147")
end

			yyval80 := yyvs80.item (yyvsp80)
			set_start_closure (yyval80)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_839
			--|#line 4154 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 4154 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4154")
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

	yy_do_action_840
			--|#line 4158 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4158 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4158")
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

	yy_do_action_841
			--|#line 4160 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4160 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4160")
end

yyval32 := yyvs106.item (yyvsp106) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp32 := yyvsp32 + 1
	yyvsp106 := yyvsp106 -1
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

	yy_do_action_842
			--|#line 4162 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4162 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4162")
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

	yy_do_action_843
			--|#line 4164 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4164 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4164")
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

	yy_do_action_844
			--|#line 4166 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4166 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4166")
end

yyval32 := ast_factory.new_agent_open_target (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
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
			--|#line 4170 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4170 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4170")
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

	yy_do_action_846
			--|#line 4172 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4172 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4172")
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

	yy_do_action_847
			--|#line 4174 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4174 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4174")
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

	yy_do_action_848
			--|#line 4174 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4174 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4174")
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

	yy_do_action_849
			--|#line 4187 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4187 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4187")
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

	yy_do_action_850
			--|#line 4198 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4198 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4198")
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

	yy_do_action_851
			--|#line 4206 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4206 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4206")
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

	yy_do_action_852
			--|#line 4215 "et_eiffel_parser.y"
		local
			yyval30: detachable ET_AGENT_ARGUMENT_OPERAND_ITEM
		do
--|#line 4215 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4215")
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

	yy_do_action_853
			--|#line 4224 "et_eiffel_parser.y"
		local
			yyval29: detachable ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 4224 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4224")
end

yyval29 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp69 := yyvsp69 -1
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

	yy_do_action_854
			--|#line 4226 "et_eiffel_parser.y"
		local
			yyval29: detachable ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 4226 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4226")
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

	yy_do_action_855
			--|#line 4228 "et_eiffel_parser.y"
		local
			yyval29: detachable ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 4228 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4228")
end

yyval29 := ast_factory.new_agent_typed_open_argument (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5), yyvs23.item (yyvsp23)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
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

	yy_do_action_856
			--|#line 4234 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4234 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4234")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_857
			--|#line 4236 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4236 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4236")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_858
			--|#line 4240 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4240 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4240")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_859
			--|#line 4242 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4242 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4242")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_860
			--|#line 4244 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4244 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4244")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_861
			--|#line 4246 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4246 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4246")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_862
			--|#line 4248 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4248 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4248")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_863
			--|#line 4250 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4250 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4250")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_864
			--|#line 4252 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4252 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4252")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_865
			--|#line 4254 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4254 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4254")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_866
			--|#line 4256 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4256 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4256")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_867
			--|#line 4258 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4258 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4258")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_868
			--|#line 4260 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4260 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4260")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_869
			--|#line 4262 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4262 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4262")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_870
			--|#line 4264 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4264 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4264")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_871
			--|#line 4266 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4266 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4266")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_872
			--|#line 4268 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4268 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4268")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_873
			--|#line 4270 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4270 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4270")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_874
			--|#line 4272 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4272 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4272")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_875
			--|#line 4274 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4274 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4274")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_876
			--|#line 4276 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4276 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4276")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_877
			--|#line 4278 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4278 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4278")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_878
			--|#line 4280 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4280 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4280")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_879
			--|#line 4282 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4282 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4282")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_880
			--|#line 4284 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4284 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4284")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_881
			--|#line 4286 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4286 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4286")
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

	yy_do_action_882
			--|#line 4290 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4290 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4290")
end

			yyval15 := yyvs15.item (yyvsp15)
			if yyval15 /= Void then
				yyval15.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_883
			--|#line 4299 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4299 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4299")
end

yyval9 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_884
			--|#line 4301 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4301 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4301")
end

yyval9 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_885
			--|#line 4305 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4305 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4305")
end

yyval9 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_886
			--|#line 4307 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4307 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4307")
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

	yy_do_action_887
			--|#line 4311 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4311 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4311")
end

			yyval9 := yyvs9.item (yyvsp9)
			if yyval9 /= Void then
				yyval9.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_888
			--|#line 4320 "et_eiffel_parser.y"
		local
			yyval7: detachable ET_BOOLEAN_CONSTANT
		do
--|#line 4320 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4320")
end

yyval7 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
		end

	yy_do_action_889
			--|#line 4322 "et_eiffel_parser.y"
		local
			yyval7: detachable ET_BOOLEAN_CONSTANT
		do
--|#line 4322 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4322")
end

yyval7 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
		end

	yy_do_action_890
			--|#line 4326 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4326 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4326")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_891
			--|#line 4328 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4328 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4328")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_892
			--|#line 4332 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4332 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4332")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_893
			--|#line 4334 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4334 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4334")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_894
			--|#line 4338 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4338 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4338")
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

	yy_do_action_895
			--|#line 4345 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4345 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4345")
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

	yy_do_action_896
			--|#line 4354 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4354 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4354")
end

			yyval13 := yyvs13.item (yyvsp13)
			if yyval13 /= Void then
				yyval13.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_897
			--|#line 4363 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4363 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4363")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_898
			--|#line 4365 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4365 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4365")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_899
			--|#line 4369 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4369 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4369")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_900
			--|#line 4371 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4371 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4371")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_901
			--|#line 4375 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4375 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4375")
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

	yy_do_action_902
			--|#line 4382 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4382 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4382")
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

	yy_do_action_903
			--|#line 4391 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4391 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4391")
end

			yyval16 := yyvs16.item (yyvsp16)
			if yyval16 /= Void then
				yyval16.set_cast_type (ast_factory.new_target_type (yyvs5.item (yyvsp5 - 1), yyvs120.item (yyvsp120), yyvs5.item (yyvsp5)))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp120 := yyvsp120 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_904
			--|#line 4400 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 4400 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4400")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_905
			--|#line 4402 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 4402 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4402")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_906
			--|#line 4404 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 4404 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4404")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_907
			--|#line 4410 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 4410 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4410")
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
			when 1739 then
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
			create an_array.make_filled (0, 0, 376)
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
			    2,    2,    2,  129,    2,    2,  127,    2,    2,    2,
			  122,  123,  115,  136,  125,  135,  128,  108,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,  124,  141,
			  112,  137,  110,  143,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,  142,    2,  126,  114,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  120,    2,  121,  138,    2,    2,    2,
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
			  105,  106,  107,  109,  111,  113,  116,  117,  118,  119,
			  130,  131,  132,  133,  134,  139,  140, yyDummy>>,
			1, 177, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 907)
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
			    0,  391,  391,  185,  392,  392,  393,  184,  394,  287,
			  287,  395,  287,  287,  396,  288,  288,  290,  290,  397,
			  290,  398,  294,  296,  295,  289,  289,  289,  400,  289,
			  401,  291,  293,  293,  292,  292,  299,  299,  297,  297,
			  297,  297,  297,  297,  297,  297,  298,  183,  183,  183,
			  183,  313,  313,  314,  314,  281,  281,  281,  402,  282,
			  282,  280,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  378,  378,  380,  403,  381,  381,  379,  221,  221,
			  404,  222,  222,  222,  219,  219,  218,  218,  405,  220,
			  220,  220,  223,  223,  223,  223,  223,  223,  223,  223,

			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  213,  213,  212,  212,
			  214,  214,  214,  209,  216,  216,  215,  215,  215,  217,
			  217,  217,  217,  210,  211,  345,  345,  348,  348,  349,
			  349,  408,  351,  351,  409,  347,  347,  347,  347,  347,
			  347,  352,  352,  352,  352,  350,  367,  367,  410,  368,
			  368,  368,  365,  366,  244,  244,  411,  245,  245,  246,
			  246,  412,  243,  243,  243,  413,  243,  267,  267,  267, yyDummy>>,
			1, 200, 0)
		end

	yyr1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  188,  414,  188,  189,  189,  189,  189,  186,  187,  191,
			  191,  190,  322,  322,  415,  323,  323,  320,  320,  416,
			  321,  321,  318,  318,  417,  319,  319,  317,  317,  317,
			  269,  234,  234,  235,  235,  418,  232,  232,  232,  419,
			  232,  420,  232,  232,  232,  421,  232,  422,  233,  233,
			  233,  270,  227,  227,  228,  423,  229,  229,  229,  226,
			  225,  225,  383,  383,  424,  384,  384,  382,  265,  265,
			  264,  266,  266,  262,  262,  263,  263,  425,  425,  425,
			  425,  359,  359,  359,  359,  359,  359,  355,  355,  355,
			  355,  355,  355,  360,  360,  360,  360,  360,  360,  360,

			  360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
			  360,  360,  360,  360,  360,  360,  356,  356,  356,  356,
			  356,  356,  356,  356,  315,  315,  369,  369,  261,  261,
			  167,  167,  268,  260,  260,  166,  166,  426,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  316,  316,  278,  275,  275,  373,  276,  276,  276,
			  276,  276,  276,  272,  271,  273,  274,  330,  330,  330,
			  427,  331,  331,  331,  331,  331,  331,  327,  326,  328,
			  329,  428,  428,  428,  428,  428,  428,  428,  428,  428, yyDummy>>,
			1, 200, 200)
		end

	yyr1_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  428,  428,  428,  429,  354,  354,  354,  354,  354,  430,
			  353,  353,  353,  353,  353,  431,  312,  312,  311,  311,
			  432,  433,  333,  333,  332,  332,  385,  385,  386,  386,
			  193,  193,  374,  374,  375,  375,  375,  375,  375,  375,
			  375,  375,  375,  375,  375,  375,  375,  375,  375,  375,
			  375,  375,  375,  375,  375,  375,  376,  376,  376,  376,
			  376,  376,  376,  376,  376,  376,  376,  376,  376,  376,
			  376,  376,  376,  376,  376,  376,  376,  376,  377,  377,
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377,

			  377,  284,  284,  154,  154,  156,  156,  406,  155,  155,
			  155,  155,  155,  407,  151,  157,  157,  158,  158,  158,
			  159,  159,  159,  159,  159,  159,  152,  153,  325,  325,
			  325,  324,  324,  324,  324,  324,  324,  324,  324,  324,
			  324,  324,  324,  324,  324,  324,  324,  324,  324,  324,
			  324,  324,  358,  358,  357,  357,  357,  357,  357,  357,
			  357,  357,  357,  357,  357,  357,  357,  357,  357,  357,
			  357,  357,  357,  194,  203,  195,  196,  197,  198,  199,
			  200,  201,  201,  202,  192,  205,  205,  206,  206,  204,
			  204,  434,  303,  303,  303,  303,  303,  303,  303,  303, yyDummy>>,
			1, 200, 400)
		end

	yyr1_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  303,  303,  303,  303,  303,  303,  303,  303,  303,  435,
			  177,  177,  177,  177,  304,  304,  304,  304,  306,  306,
			  306,  306,  230,  230,  231,  231,  286,  286,  286,  286,
			  241,  242,  242,  240,  285,  285,  238,  239,  239,  237,
			  302,  302,  389,  389,  388,  388,  387,  181,  181,  436,
			  182,  182,  182,  180,  178,  178,  179,  179,  179,  179,
			  147,  147,  207,  207,  236,  342,  342,  342,  437,  341,
			  341,  340,  305,  305,  305,  305,  305,  305,  305,  253,
			  253,  252,  173,  173,  370,  370,  250,  250,  249,  249,
			  249,  249,  249,  249,  249,  249,  248,  248,  148,  148,

			  148,  438,  149,  149,  149,  259,  251,  251,  251,  251,
			  390,  390,  247,  247,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  256,  256,  256,  256,
			  256,  256,  256,  256,  256,  256,  257,  257,  257,  257,
			  257,  257,  258,  258,  258,  258,  258,  258,  258,  258,
			  258,  258,  258,  258,  258,  258,  258,  258,  258,  258,
			  258,  255,  255,  255,  255,  255,  255,  255,  255,  255,
			  255,  255,  255,  255,  255,  255,  255,  254,  254,  254,
			  254,  169,  169,  170,  439,  170,  440,  171,  441,  171,
			  442,  150,  150,  150,  346,  335,  335,  443,  334,  336, yyDummy>>,
			1, 200, 600)
		end

	yyr1_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  336,  336,  343,  343,  444,  344,  344,  344,  371,  371,
			  445,  372,  372,  372,  208,  208,  208,  208,  208,  145,
			  144,  146,  146,  172,  172,  300,  301,  301,  301,  301,
			  301,  301,  301,  301,  301,  301,  301,  301,  277,  446,
			  164,  164,  164,  164,  164,  162,  162,  162,  447,  163,
			  163,  163,  161,  160,  160,  160,  337,  337,  339,  339,
			  339,  339,  339,  339,  339,  339,  339,  339,  339,  339,
			  339,  339,  339,  339,  339,  339,  339,  339,  339,  339,
			  339,  339,  338,  174,  174,  176,  176,  175,  168,  168,
			  307,  307,  309,  309,  310,  310,  308,  361,  361,  363,

			  363,  364,  364,  362,  283,  283,  283,  399, yyDummy>>,
			1, 108, 800)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1741)
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
			    1,    8,    2,    2,   44,   86,   86,   44,   86,   86,
			    2,   44,   44,    2,   86,   87,   87,    1,   86,   87,
			   87,    1,   22,   83,    2,    2,    2,    2,    2,   21,
			   86,   86,   12,   12,   12,   12,   87,   21,   86,   21,
			   86,   19,   19,    5,    6,    6,   16,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   13,    9,    7,    7,    2,    7,    9,    9,    9,   58,
			   12,   87,   88,   89,   90,   13,   13,   13,   13,   15,
			   15,   15,   16,   16,   16,   16,    5,   83,    2,  105,

			    2,    2,    2,    2,   86,   86,    5,   86,   86,   16,
			   13,   16,   13,   23,    5,   12,   12,   12,    2,    2,
			    2,    2,    2,   12,   96,   96,  114,  114,  120,  120,
			   19,   59,   22,    2,  104,    5,    5,   12,   90,    2,
			    2,   81,   82,   83,   12,   15,  108,    1,    2,    2,
			    2,   12,   90,   12,    2,    2,   12,   96,  114,   12,
			    2,    2,   12,   96,   22,   28,   28,    1,   12,    2,
			    2,   12,   96,   12,    2,    2,   12,   96,   12,    2,
			   12,   96,   12,    5,   10,   12,   22,   28,    1,    5,
			    5,   12,    5,    5,  104,    2,   90,   12,   12,    5, yyDummy>>,
			1, 200, 0)
		end

	yytypes1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    5,   83,    5,   61,    1,    2,  108,  110,   12,   12,
			   12,   28,   12,    2,   12,   96,    5,   10,   12,   28,
			   28,    5,   28,   12,    2,   12,   96,    5,   10,   12,
			   28,    5,    5,   23,    5,   12,   12,   12,    2,    2,
			    2,    2,   27,   27,   27,   28,   28,   12,   12,   96,
			  120,  120,   28,   12,    2,   12,   96,    5,   10,   12,
			   28,    5,   28,   12,    2,   12,   96,    5,   10,   12,
			   28,    5,   28,    5,   10,   12,   28,    5,   28,  120,
			    5,   12,   12,   12,   28,   12,    9,   13,   15,   16,
			   19,  120,   19,   19,    5,    5,    5,    2,   20,   17,

			   16,   14,   13,   11,   10,    5,    4,    3,    2,    2,
			    2,    2,    2,    2,   24,   24,   24,    7,   36,   36,
			   37,    9,    9,   58,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   70,   12,   84,   91,
			   91,   13,  101,  101,   15,   15,  104,  104,  106,   16,
			  118,  119,    5,    5,    5,   23,    5,    5,   12,    2,
			    2,    2,    2,   54,   12,   96,  121,  123,    2,   57,
			   57,    2,    2,   60,   61,    5,   46,   46,  108,   28,
			    5,   10,   12,   28,    5,  120,   12,   28,    5,   10,
			   12,   28,    5,  120,   12,   12,    2,   12,   12,    2, yyDummy>>,
			1, 200, 200)
		end

	yytypes1_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			   12,    5,    5,   28,    5,   12,    2,   12,   12,    2,
			   12,   12,   12,   12,   28,   12,   12,   12,   28,   28,
			    5,   28,    5,    5,   28,    5,   10,   12,   28,    5,
			  120,   12,   28,    5,   10,   12,   28,    5,  120,   12,
			  120,   12,    5,    5,    5,    5,    5,   69,   69,   17,
			   10,   76,   12,  106,   12,   12,   12,   12,  120,   69,
			   69,   69,    5,  101,    5,    5,   26,    5,    5,   17,
			   10,   32,   76,   80,   80,   12,  106,    5,    1,   69,
			    5,   69,    5,    5,   15,   69,    5,    2,  100,  100,
			   22,   22,    5,    5,    5,    5,   19,   19,    5,    5,

			   19,   19,   19,   19,   19,   19,   19,   19,   19,   14,
			   14,   14,   14,   11,    5,    5,   22,   22,    5,  104,
			   26,    5,   31,   69,  121,  123,  121,  123,   12,    2,
			   12,   12,    2,   12,  123,   22,   51,   51,    1,   12,
			    2,   12,   12,    2,   12,   12,   12,   12,    2,   53,
			   22,   51,   51,    1,    2,   52,   52,   52,   57,   74,
			   74,    1,    5,   46,   60,   46,   60,   61,   12,  110,
			  108,  120,   12,    5,  120,   12,    5,   28,   12,   12,
			   28,   28,   12,   12,   28,    1,    1,    1,   28,   12,
			   12,   28,   28,   12,   12,   28,   28,   28,   28,    5, yyDummy>>,
			1, 200, 400)
		end

	yytypes1_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    5,    5,  120,  120,   12,    5,  120,   12,    5,    5,
			    5,    1,    1,    1,    5,    5,    5,   69,   70,  101,
			    5,   26,   12,    5,  120,    5,   31,    5,    2,  112,
			   78,   78,   79,   79,   80,   12,    5,  112,    2,    2,
			  120,    2,    5,  119,  120,    2,  120,    1,    2,   48,
			   36,   36,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,    2,
			   69,    2,   69,   69,   12,   12,   36,   36,    5,   31,
			    5,   52,   52,   52,   52,   51,   12,   12,   51,   51,
			   12,   12,   51,  121,  122,  123,    5,   23,    5,   12,

			    2,    2,    2,    2,   50,   50,   50,   51,   51,   54,
			   54,   12,   12,   96,   51,   12,   12,   51,   51,   12,
			   12,   51,   51,   51,   51,    2,   53,    5,   51,   12,
			    2,   52,   55,   56,   57,   76,    2,   94,   94,    2,
			   73,   73,   74,    5,   46,   60,   60,   77,   12,   60,
			   60,   61,    5,   12,  107,  109,  110,    5,    5,    5,
			    5,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,    1,    1,    1,   21,    5,
			    5,    5,    5,    5,    5,   12,   12,  120,    5,  101,
			    5,    5,  101,   26,   69,   70,    5,    5,   76,  120, yyDummy>>,
			1, 200, 600)
		end

	yytypes1_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    2,    1,    2,    2,   99,   80,   12,   80,    5,   80,
			    5,   80,    5,    5,  120,    2,   99,   12,   12,    5,
			   12,   76,   77,  119,    5,   69,    5,    2,   69,   12,
			    1,   69,    2,    2,   26,   69,   70,   26,   69,   69,
			   26,   26,   26,   26,   23,    5,   29,   30,   31,   69,
			   51,   51,   51,   51,    5,    5,  123,   12,    2,   12,
			   12,    2,   12,   51,   12,    2,   12,   12,    2,   12,
			   12,   12,   12,   51,   51,   12,   51,    5,    5,    5,
			    5,   51,   51,   51,   51,   51,   53,   76,  116,  116,
			    5,   52,   77,   12,    5,   57,    5,    5,    1,   86,

			   46,   74,    2,   71,   76,   12,  113,  113,  115,  115,
			    1,   45,   45,   46,   12,   60,   60,    5,   60,   28,
			   21,  110,  110,    5,   12,    5,   12,    5,   12,    5,
			   12,   12,   26,    5,   12,    5,    5,   26,   26,   31,
			  112,    1,    1,   99,   15,    2,    2,   47,  120,  112,
			   15,    2,   47,    5,   69,    5,    5,    5,  119,    2,
			   64,    1,    5,   21,   21,    5,    2,   69,   12,   69,
			   69,    5,    5,   26,  120,    5,    5,    5,   31,   51,
			   12,   12,   51,   51,   12,   12,   51,   51,   12,   12,
			   51,   51,   12,   12,   51,   51,   51,   51,    5,    1, yyDummy>>,
			1, 200, 800)
		end

	yytypes1_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			   54,    2,    2,    2,   53,    1,    2,   52,    2,    5,
			  125,  125,    1,    2,   71,  113,  115,    5,    5,    2,
			   80,   80,    2,  113,  115,    5,    1,  113,  115,    5,
			   46,    5,   46,    5,    2,    2,    2,    2,    2,   68,
			   95,   95,   95,  117,   12,   12,   12,   12,   69,   26,
			    2,   99,    1,   12,   97,   97,   98,   98,   99,    2,
			   72,    5,  103,   47,   47,    1,    2,  111,   21,    2,
			   99,   72,  103,  111,  120,    2,   69,    2,    2,   63,
			   64,   12,   21,   21,   21,    5,    2,  126,  126,  126,
			    5,   51,   51,   51,   51,   51,   51,   51,   51,    1,

			   51,   51,   21,    5,   71,    5,  125,    5,    1,    1,
			    5,  113,  115,  113,  115,  120,    5,    2,   86,    2,
			   33,   34,   95,   95,  117,   95,   68,   95,   95,    2,
			   95,   95,   95,   95,   68,   68,   15,    2,   47,    5,
			    5,   99,   99,   99,   99,   15,  111,    5,  103,   47,
			   21,    5,    5,   18,   17,    4,    2,    2,    2,    2,
			    2,    2,    2,    2,   25,   36,   36,   36,   38,   39,
			   47,   47,   62,   69,   69,   69,   69,   12,   85,   92,
			   93,   93,   93,   93,  129,    2,    1,    2,   47,   47,
			   15,    2,   47,  111,   47,   47,    5,   12,    2,   69, yyDummy>>,
			1, 200, 1000)
		end

	yytypes1_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			   69,   64,   26,   21,   69,   12,    2,    2,   23,    5,
			  120,  124,  125,    1,    1,  113,  115,    2,   35,  120,
			   86,  105,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   34,   76,   77,   95,   95,
			  116,  116,  117,   95,   21,   46,   67,   68,   95,   95,
			    2,   95,   72,  103,  111,  120,    2,   15,  102,  103,
			  111,   23,    5,   12,    2,    2,    2,    2,   12,   96,
			  120,  120,    5,   26,   69,   69,   69,   47,    5,  103,
			   59,    1,   47,   47,    5,    5,  100,    5,    5,   26,

			   47,    5,    5,    1,    1,   47,    2,   72,  103,  111,
			    2,  111,    2,    2,    2,    5,    5,    5,  125,   44,
			   76,   21,    5,    2,   86,   35,  105,  112,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,   34,   95,  117,    2,   67,   68,   95,    2,
			   95,  111,   47,   47,   21,    5,    5,  103,   47,   12,
			    2,   12,   17,   12,    2,   12,   12,  129,   28,   12,
			    2,   12,   12,    2,   12,   12,   12,   12,   28,    5,
			    5,   12,    2,    2,  128,    1,    2,   47,  120,   47, yyDummy>>,
			1, 200, 1200)
		end

	yytypes1_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    5,  129,    2,    2,   47,    1,  100,   69,   69,    2,
			  126,   12,   12,   47,   69,   69,    1,  111,   47,   47,
			   47,   69,   69,    2,    7,    9,   49,   13,   15,   16,
			    2,   49,   86,  105,    2,   86,  112,    2,    2,   99,
			   75,   76,   77,   68,    2,   95,    2,  111,    2,    2,
			   28,   12,   12,   28,   28,   12,   12,   28,    5,   28,
			   12,   12,   28,   28,   12,   12,   28,   28,   28,   28,
			  129,    5,    5,   12,   12,    2,    2,   47,    2,   43,
			  127,  128,   47,    2,    2,   47,   66,    1,    5,    2,
			  120,    5,   47,   47,    2,    2,   47,   48,   69,    2,

			   26,   26,    2,  111,    2,    2,   21,   21,   21,   21,
			   21,  105,  112,   86,  105,    2,    2,   99,  111,   15,
			    2,   47,   75,    2,   47,   28,   28,   28,   28,   12,
			   28,   28,   28,   28,    5,   12,   26,   47,    2,   43,
			   47,  128,   47,    2,    2,   47,    2,   65,   66,    5,
			    5,   12,    2,    2,   47,   47,   69,   47,  112,    2,
			    2,   99,  105,  112,  111,   15,    2,   47,    2,   72,
			  103,  111,    2,   26,   12,   26,   19,   19,    5,    9,
			   40,   41,   42,   43,   12,   13,  118,    2,   69,   66,
			   12,  129,   26,   47,  126,    2,  126,   47,    2,    2, yyDummy>>,
			1, 200, 1400)
		end

	yytypes1_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    2,   99,  111,   15,    2,    2,   47,   47,  112,    2,
			    2,   99,    2,   72,  103,  111,   21,  111,   47,   47,
			   26,  120,    5,    5,   43,   47,   26,    5,    2,    2,
			    2,  111,   15,    2,   47,    2,   72,   47,  103,  111,
			  111,    2,    2,   99,  111,   15,    2,   47,   21,  111,
			   47,   47,    2,  111,    2,    5,   41,   12,    2,   72,
			  103,  111,   21,  111,   47,   47,   47,  111,   15,    2,
			   47,    2,   72,  103,  111,    2,  111,    2,   21,   47,
			   21,   26,   21,  111,   47,   47,    2,  111,    2,    2,
			    2,   72,  103,  111,   21,  111,   47,   47,   21,   47,

			   21,    2,    2,  111,    2,   21,   47,   21,   21,   21,
			  111,   47,   47,    2,  111,    2,    2,   21,   21,   47,
			   21,    2,    2,  111,    2,   21,   47,   21,   21,    2,
			   21,   21,   47,   21,    2,   21,    2,   21,   21,    1,
			    1,    1, yyDummy>>,
			1, 142, 1600)
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
			    2,    2,    2,    2,    2,    2,    2,    3,    4,    5,
			    5,    5,    5,    5,    5,    6,    7,    7,    8,    9,
			   10,   11,   12,   12,   12,   13,   14,   14,   14,   14,
			   14,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,

			   15,   15,   15,   15,   16,   17,   18,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   20,    6,    6,    2,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,   19,   19,    5,    5,    5,
			    5,   21,   22,   23, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1741)
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
			   15,   15,   14,   11,    1,   16,   51,    2,  907,  907,
			   52,   55,    3,   53,   13,   19,   21,    0,   10,   28,
			   30,    0,   58,  155,   53,   53,   53,   54,    0,   24,
			  907,  907,  905,  906,  904,    0,   22,   34,  907,   35,
			  907,    0,    0,    0,  881,  886,  899,  858,  877,  876,
			  875,  880,  879,  878,  874,  873,  872,  871,  870,  869,
			  868,  867,  866,  865,  864,  863,  862,  861,  860,  859,
			  892,  885,  888,  889,  624,   39,   40,  884,  883,    0,
			   38,   31,   36,    0,   32,   41,  891,  890,  893,   43,
			  857,  856,   42,  898,  897,  900,   56,    0,    0,  907,

			    0,    0,    0,    0,   18,   20,    0,   27,   29,  902,
			  895,  901,  894,    0,    0,  502,  515,  501,    0,    0,
			    0,    0,    0,  432,  445,    0,  551,  554,    0,  433,
			    0,    0,  804,   44,    0,    0,   46,   38,   37,    0,
			    0,    0,    0,   57,   62,  156,  907,    0,    0,    0,
			    0,   47,   23,  515,    0,    0,  503,    0,  530,  515,
			    0,    0,  503,    0,  507,  446,  516,    0,  515,    0,
			    0,  503,    0,  515,    0,    0,  503,    0,  515,    0,
			  503,    0,  503,    0,  541,  531,  507,  434,    0,    0,
			    0,    0,    0,  802,    0,   45,   33,   64,   63,   59, yyDummy>>,
			1, 200, 0)
		end

	yydefact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			   61,   60,    0,  252,    0,  209,  158,  161,   50,   49,
			   48,  454,  515,    0,  503,    0,    0,  549,  539,  443,
			  504,    0,  452,  515,    0,  503,    0,    0,  547,  537,
			  441,    0,  517,    0,    0,  905,  906,  904,    0,    0,
			    0,    0,    0,    0,    0,  518,  519,    0,  432,  467,
			    0,    0,  450,  515,    0,  503,    0,    0,  545,  535,
			  439,    0,  448,  515,    0,  503,    0,    0,  543,  533,
			  437,    0,  447,    0,  542,  532,  436,    0,  435,    0,
			  505,  502,  515,  501,  506,  553,  887,  896,  882,  903,
			  625,    0,    0,    0,    0,  366,    0,    0,  770,  764,

			  750,    0,  749,    0,  765,  797,  698,  839,    0,    0,
			    0,    0,    0,    0,  746,  745,  422,  767,  740,  743,
			  768,  780,  771,  744,    0,    0,    0,  763,  776,  777,
			  761,  739,  742,  712,  713,  736,    0,  698,  747,  769,
			  845,  737,  779,  774,  778,  772,  748,  803,  766,  738,
			  762,  775,    0,    0,    0,    0,    0,   74,  144,    0,
			    0,    0,    0,   71,  136,  103,   84,   84,  255,  907,
			  253,  241,  247,  235,  232,    0,  210,  164,    0,  455,
			    0,  550,  540,  444,    0,    0,  571,  453,    0,  548,
			  538,  442,    0,    0,  569,  515,    0,  503,  515,    0, yyDummy>>,
			1, 200, 200)
		end

	yydefact_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  503,  513,  513,  516,  513,  515,    0,  503,  515,    0,
			  503,  515,  503,  503,  509,  905,  906,  904,  522,  521,
			    0,  456,  508,  514,  451,    0,  546,  536,  440,    0,
			    0,  567,  449,    0,  544,  534,  438,    0,    0,  565,
			    0,  564,    0,  513,  513,  513,  622,  751,  752,  708,
			  707,  706,  332,  709,  905,  906,  904,    0,    0,  755,
			  753,  754,  795,    0,  701,    0,  686,  366,    0,  842,
			  843,    0,  845,  838,  404,  840,  841,    0,  404,    0,
			    0,  757,  810,    0,  773,    0,    0,  421,  423,  662,
			  786,  790,    0,    0,    0,    0,    0,    0,  805,  705,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  784,  788,  806,  807,
			  688,  848,  825,    0,   84,   84,   84,   84,  144,    0,
			  136,  144,    0,  136,    0,  507,  145,  104,    0,  144,
			    0,  136,  144,    0,  136,  144,  136,  136,   80,   72,
			  507,  137,   92,    0,   88,   85,   65,   68,    0,  269,
			  416,    0,  201,  239,    0,  245,    0,    0,    0,    0,
			  160,    0,  572,    0,    0,  570,    0,  476,  515,  503,
			  465,  474,  515,  503,  463,    0,    0,    0,  472,  515,
			  503,  461,  470,  515,  503,  459,  469,  458,  457,  513, yyDummy>>,
			1, 200, 400)
		end

	yydefact_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  513,  513,  526,    0,  568,    0,    0,  566,    0,    0,
			    0,    0,    0,    0,    0,    0,  741,    0,    0,  796,
			  699,    0,    0,  364,    0,    0,  823,    0,  403,  377,
			    0,    0,    0,    0,  365,  698,    0,  377,    0,    0,
			    0,    0,  808,    0,    0,    0,    0,  424,    0,    0,
			    0,    0,  735,  733,  734,  732,  715,  716,  717,  719,
			  721,  722,  724,  723,  725,  718,  720,  731,  728,    0,
			  727,    0,  726,  714,  698,  698,    0,    0,  846,    0,
			  794,   67,   70,   66,   69,  112,  144,  136,  101,  110,
			  144,  136,   99,    0,    0,   73,  146,    0,    0,  906,

			    0,    0,    0,    0,    0,    0,    0,  147,  148,    0,
			    0,    0,  136,  125,  108,  144,  136,   97,  106,  144,
			  136,   95,  105,   94,   93,   78,    0,  138,  139,    0,
			   86,    0,  256,  257,  254,    0,  415,  417,   15,  276,
			  271,  273,  270,  202,    0,    0,  240,  249,  248,    0,
			  246,  234,  211,  503,  171,  172,  163,    0,    0,    0,
			    0,  477,  466,  475,  464,  511,  524,  512,  525,  510,
			  523,  473,  462,  471,  460,    0,    0,    0,  527,  520,
			    0,    0,    0,    0,    0,  552,  698,    0,    0,  798,
			  799,  800,  801,  700,    0,    0,  698,  844,  845,  404, yyDummy>>,
			1, 200, 600)
		end

	yydefact_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  403,  405,  380,    0,    0,  370,  374,  369,  367,  372,
			  368,  371,  373,    0,  404,    0,    0,  822,  821,    0,
			  759,    0,    0,  809,    0,  907,    0,  395,  391,  698,
			  425,  663,    0,    0,  785,    0,    0,  789,  730,  729,
			  697,  695,  783,  787,  854,    0,    0,    0,  847,  853,
			  113,  102,  111,  100,   77,   75,   76,  144,    0,  136,
			  144,    0,  136,  145,  144,    0,  136,  144,    0,  136,
			  144,  136,  136,  141,  151,    0,  150,  140,  143,  513,
			    0,  137,  109,   98,  107,   96,   79,    0,    0,    0,
			  513,   87,    0,    0,  259,  258,    0,    0,  420,    0,

			  275,  272,    0,  324,  333,  907,  278,  287,  277,  281,
			  274,    0,    0,  200,  207,  238,  250,  251,  244,  165,
			  175,  173,  174,    0,  562,    0,  560,    0,  558,    0,
			  556,  555,  623,    0,  698,  702,  703,  704,  687,  824,
			  377,  406,  407,    0,  328,  665,  907,  410,  375,  377,
			  328,  665,  410,    0,  758,  230,  811,  812,  813,    0,
			    0,    0,    0,  396,  392,  393,  401,  397,  698,  428,
			  428,  791,  792,  793,    0,  852,  849,  850,  851,  134,
			  144,  136,  123,  132,  144,  136,  121,  130,  144,  136,
			  119,  128,  144,  136,  117,  127,  116,  115,  513,    0, yyDummy>>,
			1, 200, 800)
		end

	yydefact_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  153,    0,   81,   82,   83,    0,   90,   91,   89,  264,
			  260,    0,  418,    8,  324,  288,  282,    0,    0,  325,
			  363,  324,   15,  290,  284,    0,    0,  280,  279,  203,
			  206,  204,  205,  208,  219,  224,  178,  214,  186,  220,
			    0,  215,  225,  187,  563,  561,  559,  557,  756,  685,
			    0,    0,  408,  388,    0,    0,  381,  382,  379,    0,
			  410,  668,  907,  586,  573,    0,  409,  430,  376,    0,
			    0,  410,  907,  430,    0,    0,    0,    0,    0,  637,
			  636,  698,  394,  402,  398,  399,    0,  429,    0,    0,
			  741,  135,  124,  133,  122,  131,  120,  129,  118,    0,

			  142,  152,  154,  149,  182,  262,    0,  261,  419,    6,
			    0,  292,  286,  289,  283,  330,    0,   15,  155,    0,
			  337,  334,    0,    0,    0,    0,    0,  221,  215,  170,
			  216,  225,  226,    0,  188,  220,  328,  665,  410,  387,
			    0,  384,  383,  386,  385,  329,    0,  666,    0,  410,
			  608,    0,    0,  607,  764,  698,    0,    0,    0,  907,
			    0,  665,  624,  609,  581,    0,  781,  782,    0,  606,
			  422,  584,  605,    0,    0,    0,    0,  710,  599,  600,
			  591,  592,  594,  593,    0,  409,  411,  907,    0,  431,
			  328,  665,  410,    0,  410,    0,    0,  760,  634,    0, yyDummy>>,
			1, 200, 1000)
		end

	yydefact_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    0,  638,  684,  400,  426,  698,  819,  820,  855,  183,
			    0,    0,  263,    7,   15,  291,  285,    0,  293,  330,
			  155,  404,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,    0,  227,  228,  218,  223,
			  179,  180,  177,  213,  196,  195,  191,  185,  225,    0,
			  169,  215,  410,  907,  430,  389,  837,    0,    0,  667,
			  430,    0,    0,  515,    0,    0,    0,    0,  478,  490,
			    0,    0,    0,  686,    0,  907,    0,  580,    0,  907,
			    0,    0,  582,  422,    0,    0,    0,    0,    0,  688,

			    0,    0,    0,  412,  413,  579,  833,  410,  907,  430,
			  836,  430,  832,  635,    0,    0,  267,  265,  266,    5,
			  331,  294,    0,   15,  155,   15,  404,  377,  362,  360,
			  338,  357,  354,  359,  358,  356,  353,  351,  355,  352,
			  350,  349,  348,  347,  346,  345,  344,  343,  342,  341,
			  340,  339,  336,  229,  181,  192,    0,    0,    0,  168,
			  225,    0,  410,    0,  390,  671,  669,  670,    0,  515,
			    0,  503,  711,  906,    0,  710,    0,  616,  491,  515,
			    0,  503,  515,    0,  503,  515,  503,  503,  479,    0,
			    0,    0,    0,    0,    0,    0,  907,  907,    0,    0, yyDummy>>,
			1, 200, 1200)
		end

	yydefact_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    0,  620,  907,  610,    0,    0,  662,  596,  595,    0,
			    0,  698,  698,  590,  598,  597,  414,    0,  410,    0,
			    0,  639,  427,  326,  814,  815,  326,  816,  818,  817,
			  326,  326,  155,  404,   15,  155,  377,  410,    0,    0,
			  194,  197,  198,  190,  167,    0,  831,  430,  827,  835,
			  499,  515,  503,  488,  497,  515,  503,  486,    0,  495,
			  515,  503,  484,  493,  515,  503,  482,  492,  481,  480,
			  614,    0,  698,  661,  660,  641,  907,    0,  649,    0,
			  644,  643,  575,  626,  907,    0,    0,    0,    0,  664,
			    0,    0,  588,  576,  612,  611,    0,    0,    0,    0,

			  697,  695,  830,  430,  826,  834,  327,  299,  297,  298,
			  296,  404,  377,  155,  404,  410,    0,    0,    0,  328,
			  665,  410,  199,  166,    0,  500,  489,  498,  487,  698,
			  496,  485,  494,  483,    0,  698,  687,  578,  640,    0,
			  646,  645,  577,  627,  628,    0,    0,  631,  630,    0,
			    0,  698,  613,  907,  428,    0,    0,    0,  377,  410,
			    0,    0,  404,  377,    0,  328,  665,  410,  326,  410,
			  907,  430,  829,  617,  698,  685,    0,    0,    0,  657,
			  650,  654,  651,  648,  658,  656,  659,  629,    0,  632,
			  698,  618,  621,  583,    0,  602,    0,    0,  828,  410, yyDummy>>,
			1, 200, 1400)
		end

	yydefact_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,  328,  907,  665,  410,  410,  377,  410,
			    0,    0,  326,  410,  907,  430,  320,    0,  410,    0,
			  615,    0,  653,    0,  652,  633,  684,    0,  604,  603,
			  601,    0,  328,  665,  410,  326,  410,  574,  907,  430,
			  430,  410,    0,    0,    0,  328,  665,  410,  321,    0,
			  410,    0,  326,  430,  326,    0,  655,  698,  326,  410,
			  907,  430,  309,    0,  410,    0,    0,    0,  328,  665,
			  410,  326,  410,  907,  430,  326,  430,  326,  322,    0,
			  316,  619,  308,    0,  410,    0,  326,  430,  326,  326,
			  326,  410,  907,  430,  311,    0,  410,    0,  323,    0,

			  317,  326,  326,  430,  326,  313,    0,  301,  295,  310,
			    0,  410,    0,  326,  430,  326,  326,  318,  312,    0,
			  300,  326,  326,  430,  326,  315,    0,  303,  319,  326,
			  305,  314,    0,  302,  326,  304,  326,  307,  306,    0,
			    0,    0, yyDummy>>,
			1, 142, 1600)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 303)
			yydefgoto_template_1 (an_array)
			yydefgoto_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yydefgoto_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yydefgoto'.
		do
			yyarray_subcopy (an_array, <<
			  314,  315,  316, 1164,  520,  793,  834,  242,  243,  244,
			  219,  765,  220,  165,  166,  766,  846,  847,  522,  848,
			  471, 1120, 1121, 1218,  317, 1165,  318,  319,  320, 1168,
			   76,  321,  322, 1169, 1580, 1581, 1582, 1479, 1583,   11,
			   12,    4,  911,  912, 1255,  913,  376,  377, 1063, 1188,
			  947, 1397, 1404, 1485, 1477, 1189, 1170, 1293, 1554, 1607,
			 1171, 1064, 1493,  649, 1426,  704,  705,  706,  551,  552,
			 1100,  536,  537, 1101,  555,  556,  891,  549,  886,  363,
			  710,  732,  733,  369,  370,  734,  323,  131,  373,  746,
			  203,  374, 1172, 1079,  960, 1080, 1547, 1486, 1548, 1256,

			 1039, 1135, 1257,  828,  325,  326,  327,  328,  329,  330,
			  331,  332,  333,  334,  335,  836,  903, 1060,  740,  741,
			  559,  560,  742, 1440,  904, 1247,  747,  630,  631,  632,
			  633, 1020,  634,  474, 1021,  141,  142,   23,  143,  337,
			  123,  338, 1178,    5,    6,   18,   14,   19,   20,   81,
			   15,   16,   36,   82,   83,   84,  339,  340, 1179, 1180,
			 1181, 1182, 1183,   85,  341,   87,   88,  737,  738,   13,
			   28, 1022, 1329, 1248, 1132, 1133, 1127, 1128, 1130, 1131,
			  124,  125, 1054, 1055, 1056, 1057,  804, 1058,  488,  489,
			  342,  343,  619,   89,  344,  345, 1268, 1269, 1062,  346, yyDummy>>,
			1, 200, 0)
		end

	yydefgoto_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yydefgoto'.
		do
			yyarray_subcopy (an_array, <<
			  347,   99,  348,  754,  146,  206,  755,  207,  756, 1067,
			  629,  906,  907,  126,  127,  908,  909,   92,  349,   94,
			   95,  888,  889, 1043, 1252, 1507,  350,  351,  823,  352,
			  250,  129,  251, 1280,  693,  694,  367,  695, 1211, 1010,
			 1212, 1087, 1088, 1480, 1481, 1394, 1184, 1739, 1213, 1214,
			 1109,    9,    8,   30,   31, 1065,   38,   40,   97,  534,
			  726,  731,  188,  585,  378,  569, 1124, 1126, 1357, 1356,
			  744, 1125, 1122, 1123,  567,  745,  564,  749,  566,  558,
			 1106,  910, 1245,  943,  830,  801, 1186,  898, 1012,  647,
			 1300, 1291, 1539, 1148,  621,  676,  650,  677,  651,  463,

			  194,  643,  478,  679, yyDummy>>,
			1, 104, 200)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1741)
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
			  111,  313, 7101, 1886, -32768, -32768, 1878, -32768, -32768, -32768,
			 -32768, 1759, -32768,  282, -32768, 2218, -32768,  709, -32768, 1046,
			  355, 6125, 1770,  898, 1877, 1877, 1877, -32768, 1882, -32768,
			 -32768, -32768, -32768, -32768, -32768, 1764, -32768, -32768, -32768, -32768,
			 -32768,  169,   86,  513, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, 1129, -32768, -32768, -32768, -32768,   61,
			 1763, -32768, 1755, 6125, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, 1441, 7073, 2265,

			 1870, 1868, 1866,  709, -32768, -32768, 6125, -32768, -32768, -32768,
			 -32768, -32768, -32768, 1709, 1647, -32768,  952, -32768, 1632, 1558,
			 1765,  697, 1325,  923, -32768, 1742, -32768, 1730, 1743, -32768,
			  697, 1737, 1726, -32768, 1837, 6125, -32768, -32768, -32768,  709,
			  709,  942, 1441, -32768, 1784, -32768, 2135, 1706,  709,  709,
			  709, -32768, -32768,  952, 1762, 1319,  923, 1728, -32768,  952,
			 1758, 1283,  923, 1722, 1723, -32768, -32768, 1311,  952, 1750,
			 1267,  923, 1717,  952, 1746, 1119,  923, 1716,  952, 1052,
			  923, 1714,  923,  513, 1582, 1581, 1691, -32768, 1300,  709,
			 3061, 1715,  513, -32768, 5948, -32768, -32768, 1757, 1756, -32768, yyDummy>>,
			1, 200, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, -32768,  519, 1760, 1003, 1680, -32768, 2161, -32768, -32768,
			 -32768, -32768,  952,  956,  923, 1683,  513, 1582, 1581, -32768,
			 -32768,  709, -32768,  952,  919,  923, 1682,  513, 1582, 1581,
			 -32768,  709, -32768, 1503, 1475,  601,  583,  299, 1463, 1436,
			 1735,  697, 1300,  926,  926, -32768, -32768, 1667,  923, 1679,
			 1664, 1674, -32768,  952,  875,  923, 1666,  513, 1582, 1581,
			 -32768,  709, -32768,  952,  832,  923, 1665,  513, 1582, 1581,
			 -32768,  709, -32768,  513, 1582, 1581, -32768,  709, -32768, 1663,
			 -32768, 1662,   89, 1661, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, 1654, 5948, 5948,  815, -32768, 1104, 5948, -32768, 1651,

			 -32768, 5948, -32768, 5948, 1650, 1712,  913,  680, 5948, 6053,
			 1638, 6752, 5948, 1637, -32768, -32768, 1156, -32768,  456,   88,
			 -32768, -32768, -32768, -32768, 6821, 1636, 1635, 1633, -32768, -32768,
			 -32768, 1089, 1086, -32768, -32768, -32768, 5841,  522, -32768, -32768,
			 1333, -32768, -32768, -32768, -32768, -32768, -32768, -32768, 1631, -32768,
			 1625, -32768, 5948,  519,  519, 1426, 1421, -32768, 1246, 1384,
			 1377, 1729,  697, 1707, 1221, -32768, 1649, 1649, -32768,  833,
			 -32768,  381,  308, 2120, -32768, 1659, -32768, 2011, 1706, -32768,
			  513, 1582, 1581, -32768,  709, 1629, 1450, -32768,  513, 1582,
			 1581, -32768,  709, 1622, 1450,  952, 1724,  923,  952, 1695, yyDummy>>,
			1, 200, 200)
		end

	yypact_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  923, -32768, -32768, 1612, -32768,  952, 1590,  923,  952, 1500,
			  923,  952,  923,  923, -32768, 1610, 1609, 1605, -32768, -32768,
			  513, 1600, -32768, -32768, -32768,  513, 1582, 1581, -32768,  709,
			 1604, 1450, -32768,  513, 1582, 1581, -32768,  709, 1586, 1450,
			 1580, 1450, 1572, -32768, -32768, -32768, 1569, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  489,  534,  306, 1571, 1562, -32768,
			 -32768, -32768, -32768, 5948, 1559,  697, -32768, 1556,  513, -32768,
			 -32768, 1550, 1333, -32768,   83, 3473, -32768, 5948,   81, 2200,
			 1104, 1672, 1542,  513, -32768, 6336,  513, -32768, -32768, 1094,
			 -32768, -32768, 5948, 5948, 5948, 5948, 5948, 5948, -32768, -32768,

			 5948, 5948, 5948, 5948, 5948, 5948, 5948, 5948, 5948, 5948,
			 5948, 5736, 5623, 5948,  709,  709, -32768, -32768, -32768, -32768,
			 3334, 1538, -32768, 6872, 1649, 1649, 1649, 1649, 1246, 1490,
			 1221, 1246, 1459, 1221, 1223, 1522, -32768, -32768,  908, 1246,
			 1432, 1221, 1246, 1340, 1221, 1246, 1221, 1221, 1624, -32768,
			 1511, -32768, -32768,  908, 1621, -32768, -32768, -32768,  709, -32768,
			 1608, 1478, 1508, 2118,  709,  779,  709, 1003, 1507,  697,
			 -32768, 1501, 1450, 1493, 1497, 1450, 1461, 1489,  952,  923,
			 1488, 1487,  952,  923, 1485, 1311, 1311, 1311, 1483,  952,
			  923, 1474, 1473,  952,  923, 1472, 1466, 1458, 1454, -32768, yyDummy>>,
			1, 200, 400)
		end

	yypact_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, -32768,  575, 1467, 1450, 1451, 1446, 1450, 1442, 1438,
			  709, 1300, 1300, 1300,  709,  513, 6636, 6564, 5518, -32768,
			 -32768, 5948, 1439, -32768, 1434,  709, -32768,  513, 1517,  690,
			  709,  709,  340,  277, -32768,  320,  513,  624,  709,  709,
			 1429,  709, -32768,  709, 1425, 5948, 1423, 4886, 5948,  156,
			 5948, 5948,  408,  408,  408,  408, 1733, 1733,   74,   74,
			   74,  408,  408,  408,  408,   74,   74, 6942, 1532, 5948,
			 1532, 5948, 1974, -32768,  522,  522, 5948, 5948, -32768, 4991,
			 -32768, -32768, -32768, -32768, -32768, -32768, 1246, 1221, -32768, -32768,
			 1246, 1221, -32768,  636, 1223, -32768, -32768, 1239, 1137,   20,

			 1007,  948, 1226,  697,  908,  709,  709, -32768, -32768, 1408,
			 1400,  798, 1221, 1395, -32768, 1246, 1221, -32768, -32768, 1246,
			 1221, -32768, -32768, -32768, -32768, -32768,  709, -32768, -32768, 1394,
			 -32768,  709, 1378,  709, -32768,  901, -32768, -32768,  313, 1381,
			 1478,  166, -32768, -32768,  709,  709, -32768,  709, 1362,  709,
			 -32768, -32768, -32768,  923,   53,  697, -32768, 1355,  709, 1338,
			  709, 1356, 1351, 1350, 1348, -32768, -32768, -32768, -32768, -32768,
			 -32768, 1347, 1343, 1339, 1335,  926,  926,  926, -32768, -32768,
			 1336,  709, 1334,  709,  709, -32768,  522, 1331,  709, -32768,
			 -32768, -32768, -32768, -32768, 6802, 5411,  522, -32768, 1333,  813, yyDummy>>,
			1, 200, 600)
		end

	yypact_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, 4886,  333, 7073,  569, -32768,  783, -32768, -32768, -32768,
			 -32768, -32768, -32768,  513,  813, 7073,  550, -32768, -32768, 5306,
			 -32768,  831,  241, -32768, 7073, 6170, 1318, 1295, 6680,  843,
			 4781, 6891, 5948, 5948, -32768, 6751, 5199, -32768, 1532, 1974,
			 3195, 2984, -32768, -32768, -32768, 1104,  792, 4674, -32768, 6891,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, 1246, 1172, 1221,
			 1246, 1131, 1221, 1312, 1246, 1110, 1221, 1246, 1043, 1221,
			 1246, 1221, 1221, -32768, -32768,  755, -32768, -32768, -32768, -32768,
			 1223, 1309, -32768, -32768, -32768, -32768, -32768, 1427, 1414,  251,
			 -32768, -32768,  238,   55, -32768, -32768, 1304, 1304, -32768, 1407,

			 -32768, -32768,  709,  803, -32768, 6389, -32768, -32768, -32768, -32768,
			  166,  585,  516, -32768, 1293, -32768, -32768, -32768, -32768,  778,
			 -32768, -32768, -32768,  709, 1203,  709, 1203,  709, 1203,  709,
			 1203, 1203, -32768, 5948,  522, -32768, -32768, -32768, -32768, -32768,
			  388, 4886, 4781,  709,  542,  416,  990,  383, 1286,  137,
			  542,  416,  383, 1104, 1411, -32768, -32768, -32768, -32768, 5948,
			 1403, 1303,  709, -32768, -32768, 1281, 1224, 6670,  789, 6388,
			 6388, -32768, -32768, -32768, 1247, -32768, -32768, -32768, -32768, 1282,
			 1246, 1221, 1280, 1275, 1246, 1221, 1274, 1270, 1246, 1221,
			 1260, 1254, 1246, 1221, 1253, 1251, 1238, 1220, -32768,  908, yyDummy>>,
			1, 200, 800)
		end

	yypact_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  211,  709, -32768, -32768, -32768,  908, -32768, -32768, -32768, 1233,
			 -32768, 1225, 4886, -32768,  539, -32768, -32768,  166,  513, -32768,
			 -32768,   95,  313, -32768, -32768,  709, 1209, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  457, 1330,  464,  294,  609, 1214,
			 1329, 1166, 1136, 1326, 1203, 1203, 1203, 1203, -32768, -32768,
			 7073,  540, 4781,  654,  709,  709,  709,  709, -32768, 7073,
			  383, 1207,  990, -32768, -32768, 5096, 1285,  310, -32768, 7073,
			  520,  383,  990,  310, 1204,  709, 2302, 5948, 5948, 1303,
			 -32768,  522, -32768, -32768, -32768, 1174, 5948, -32768, 1277, 1248,
			 6521, 1182, 1181, 1151, 1150, 1145, 1143, 1142, 1141,  709,

			 -32768, -32768, -32768, -32768, 1139, -32768,  513, -32768, 4781, 1259,
			  166, -32768, -32768, -32768, -32768, 1164,  513,  313,  898, 7111,
			 6356, -32768,  709,  709,  709,  709,  336, -32768, 1166, -32768,
			 -32768, 1136, -32768, 1244, -32768, 1214,  542,  416,  383, -32768,
			  513, -32768, -32768, -32768, -32768, -32768, 1237, -32768, 7073,  383,
			 -32768,  810,  513, -32768,  113,  773, 5948, 5948, 5948,  730,
			 1132,  416, 1129, -32768, 1219, 1171,  456,   88, 1169, -32768,
			 1156, -32768, -32768, 1114, 1102, 1089, 1086, 3860, -32768, -32768,
			 2630, -32768, -32768, -32768,  676, -32768, 4886, 1001, 1212, -32768,
			  542,  416,  383, 1211,  383, 1206, 1088, -32768, -32768, 1849, yyDummy>>,
			1, 200, 1000)
		end

	yypact_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 2840, -32768, -32768, -32768, 6891,  721, -32768, -32768, -32768, -32768,
			  589,  513, -32768, -32768,  313, -32768, -32768,  709, 1191, 1164,
			  898,  813, 1162, 1162, 1162, 1162, 1162, 1162, 1162, 1162,
			 1162, 1162, 1162, 1162, 1162, 1162, 1162, 1162, 1162, 1162,
			 1162, 1162, 1162, 1162, 1162, 1209,  993,  709, -32768, -32768,
			 -32768,  709, -32768, -32768, -32768,  342,  240, -32768, 1136, 1193,
			 -32768, 1166,  383,  990,  310, 1057, -32768,  713, 7073, -32768,
			  310,  911,  445,  952,  897,  505, 1011,  697,  923, -32768,
			 1066, 1067,  697, 4464, 1578, 2418, 2499, -32768,  513, 1001,
			  348, 4569, -32768, 1156, 5948, 5948,  155,  709,  709, 3985,

			 5096, 5948, 5948, 4886, 4781, -32768, -32768,  383,  990,  310,
			 -32768,  310, -32768, -32768, 5948, 5948, -32768, -32768, -32768, -32768,
			 -32768, -32768, 6463, 6245,  898,  842,  813,  695, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  709,  336, 1165, -32768,
			 1136, 1159,  383, 1155, -32768, -32768, -32768, -32768, 1149,  952,
			  975,  923, -32768,  952,  824, -32768,  923, 1029, -32768,  952,
			  797,  923,  952,  484,  923,  952,  923,  923, -32768,  593,
			 7002, 1031,  709,  709,  604,  979, 1154,  478, 1027, 1133, yyDummy>>,
			1, 200, 1200)
		end

	yypact_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  513, 1013, 1044, -32768, 1125, 2752, 1094, 6891, 6891, 5948,
			 1091,  522,  522, -32768, 6891, 6891, 4781, 1113,  383, 1106,
			 1093, 6891, 6891,  101, -32768, -32768,  101, -32768, -32768, -32768,
			  101,  101,  898,  813,  313,  898,  675,  383, 7073,  503,
			 -32768,  993,  709, -32768, -32768, 1058, -32768,  310, -32768, -32768,
			 -32768,  952,  923, -32768, -32768,  952,  923, -32768,  709, -32768,
			  952,  923, -32768, -32768,  952,  923, -32768, -32768, -32768, -32768,
			  914,  709,  522, -32768, -32768, -32768, 1044, 1022,  991,  955,
			  979, -32768, -32768, -32768, 1001,  973,  281,  852,  849, -32768,
			  840,  709, -32768, -32768, -32768, -32768,  930,  904, 2829, 5948,

			 3735, 3610, -32768,  310, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  813,  607,  898,  813,  383, 7073,  494,  912,  542,
			  416,  383, -32768, -32768,  905, -32768, -32768, -32768, -32768,  522,
			 -32768, -32768, -32768, -32768,  709,  522, 4346, -32768, -32768,  364,
			 -32768, -32768, -32768, -32768, -32768,  860, 5948,  852, -32768,  709,
			  593,  522, -32768,  138,  817,  112, 2829,  838,  579,  383,
			 7073,  224,  813,  429,  819,  542,  416,  383,  101,  383,
			  990,  310, -32768, -32768,  522, 4228,  751,  740,  513, -32768,
			  685,  732,  364, -32768, -32768, -32768, -32768, -32768, 2499, -32768,
			  522,  576, -32768, -32768,  793, -32768,  775,  753, -32768,  383, yyDummy>>,
			1, 200, 1400)
		end

	yypact_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 7073,  398,  737,  542,  990,  416,  383,  383,  317,  383,
			 7073,  356,  101,  383,  990,  310, -32768,  731,  383,  718,
			 -32768,  547, -32768,  364, -32768, -32768, 4110,  709, -32768, -32768,
			 -32768,  715,  542,  416,  383,  101,  383, -32768,  990,  310,
			  310,  383, 7073,  309,  677,  542,  416,  383, -32768,  661,
			  383,  646,  101,  310,  101,  413, -32768,  522,  101,  383,
			  990,  310, -32768,  594,  383,  586,  559,  553,  542,  416,
			  383,  101,  383,  990,  310,  101,  310,  101, -32768,  514,
			 -32768, -32768, -32768,  460,  383,  451,  101,  310,  101,  101,
			  101,  383,  990,  310, -32768,  435,  383,  426, -32768,  403,

			 -32768,  101,  101,  310,  101, -32768,  394, -32768, -32768, -32768,
			  365,  383,  345,  101,  310,  101,  101, -32768, -32768,  339,
			 -32768,  101,  101,  310,  101, -32768,  288, -32768, -32768,  101,
			 -32768, -32768,  234, -32768,  101, -32768,  101, -32768, -32768,  236,
			  153, -32768, yyDummy>>,
			1, 142, 1600)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 303)
			yypgoto_template_1 (an_array)
			yypgoto_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yypgoto_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yypgoto'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, -32768, -32768, -32768, -215, 1229, -577, -32768, -32768, -32768,
			  566,  -79, -116,   56, -227,  -77, -32768, -32768, -440, 1163,
			 -32768, -32768,  761,  784,    1, -32768, -1006, -1011, -32768, -32768,
			 -1275,  -13,  -21, -32768, -32768,  375, -32768, -32768,  417, -32768,
			 -32768,    0, -32768, -32768, -342,  232, -32768, -32768, -1287, -553,
			 -793, -1366,  597,  509, -32768, -32768,  826, -32768, -1363, -32768,
			  694,  525,  515,  574,  656, -32768, -32768, -32768, 1266, 1208,
			 -455, 1276, 1613, -478, -32768, -255, 1080, -32768, 1081, -512,
			 -32768, -32768, -32768, -32768, -32768, 1241,  102,  811, -32768, -524,
			 -32768, 1402, -32768, -32768, -32768,  889, -32768, -32768,  419, -32768,

			  924, -32768,  608,  177, -1012, -1013, -32768, -32768, -32768, -32768,
			 -1016, -1019, -32768, -236, -282, -166, -800, -759, -32768, -32768,
			 -32768, -32768, 1215,  512, -283, -625, -681, -32768, -32768, -32768,
			 -32768, 1644, 1020, -32768, -32768, -32768, -32768, -32768, 1807,  -11,
			 1506, -32768, -32768, -32768, -721, 1021, 1079, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,   37, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -1284,  -17, -187, -32768, -32768, -32768, -32768,
			 1065,  927, 5992, -1029, 1026, -1060, 1025,  808, 1023, -1065,
			 1242, 1863, -32768, -32768, -32768, -32768, -622,  227, -32768, -1067,
			 -32768, -604, 1323, -306,   -5,  -19, -32768,  648, -870, 1852, yyDummy>>,
			1, 200, 0)
		end

	yypgoto_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypgoto'.
		do
			yyarray_subcopy (an_array, <<
			 1594, -1078,  218, -32768, -32768, 1545, -32768, -32768,  378,  982,
			 -459, -830, 1038, -32768, 1652, -859, 1037, -218,   -1, -169,
			 -32768, -1047, -1056, -32768,  662, 1028, -1442, -32768, 1097, -270,
			  -10, -32768, -32768, -32768,  -92, -32768,  748, 1216, -32768, 1014,
			  698, -1265, -945, -32768,  428, -32768, -1214, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,    5, -32768, -32768, -32768, -32768,
			 -32768, -32768, 1012, -296, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -767, 1107,  719, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768, yyDummy>>,
			1, 104, 200)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 7236)
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
			yytable_template_36 (an_array)
			yytable_template_37 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytable_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   78,    7,   91,  287,   86,  484,   35,  187,   77,  403,
			   80,  451,  789,   17,   21,  816,   90,  899,  822,  637,
			   93,  289,   75,  952,  472, 1089,  709,  481,  336,  563,
			  565, 1410,  626,  128,  942,   17,   17,  477, 1427, 1427,
			 1221,  709,  750,   21, 1024,   21, 1176, 1425, 1425, 1175,
			  892, 1028, 1174, 1173, 1167,  403,  447,  448, 1377, 1166,
			  708,  459,   78, 1258,   91,  460,   86,  461, 1251, 1008,
			   77, 1259,  137, 1023,  837,  133, 1401, 1250,   90,  145,
			 1027, 1072,   93,  707,   75,   78,  144,   91,  245,   86,
			  246,  466,  151,   77, 1249,  137, 1253, 1586,  728,  842,

			  843,   90, 1014, 1296,  147,   93,  586,   75,  587,  284,
			  366,  185,  557, 1540,   78, 1492,   91,  628,   86,  628,
			  138, 1019,   77,   79,  137,  117, 1595,  115,  197,  198,
			   90,  144,  421,    3,   93, 1555,   75,  208,  209,  210,
			 1586,    2, 1326,  152,  218,  513, -144,  611,  612,  613,
			  229,  204, -585, 1741, 1069, 1112,  247, 1086, 1114,  259,
			  833,  112,  535,  414,  269,  802,  418,  419,  275,  286,
			  336,  288,  196,  279, 1052, 1470, -711, -711,  285,    1,
			  917, 1586,  291, -585, 1111,   79,  902, 1113,  501, 1492,
			  111, 1071,  709, 1597,  920, 1251, 1360,  822, 1358, 1409, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1086, 1104,  382,  132, 1250,  636,  385,  627,   79,  211,
			  386,  892,  832,  390,  444,  222, -693,  393, 1353, 1116,
			  394,  915, 1625,  916,  252,  918, 1406,  874,  876,  262,
			  491,  164,  247,  247,  272,  946, 1740,   79,   34,   33,
			   32, -689, 1506,  427,  110, 1108, 1433,  430, 1736,  873,
			  431, 1216, 1006,  435, -189, 1585, 1605,  438, 1138,  973,
			  439,  524,  526,  440, 1579, 1003,  441, 1263,  379,  681,
			  682,  683,  684,  109, -189,  735, 1604, 1192, -189,  387,
			 1215, 1176, -189,  452, 1175,  457,  458, 1174, 1173, 1167,
			 1596, 1289,   91, 1484, 1166, 1544,  475,  618, 1585,   27,

			 1445, 1118, 1734,  775,  776,  777,   90, 1579, -212,  424,
			   34,   33,   32,   34,   33,   32, -243, -243, 1051,  432,
			  946, 1308, -243,   34,   33,   32, -243, 1070,   26,   25,
			 -243,   24, -212, -243, 1642,    3, 1591, 1103, -243, 1585,
			  940, 1669,  798,    2, -378,  802, 1355, 1187, 1579,   34,
			   33,   32, 1102, 1729, 1511,  949, -193, 1514,  939, 1724,
			  821, -243,  -26, 1641,  957, -378,  -26,  946, 1000,  -26,
			  571,  324,  -26,  572,  561,  -26, -193, 1262,  574, 1722,
			 -193,  575,  313,  -26, -193, -378,  -26,  -26, 1646, -237,
			 -237,  -26, -374, -374, -374, -237, 1220,  900, 1066, -237, yyDummy>>,
			1, 200, 200)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  810,  -26,  -26, -237,  -26, 1050, -237,  -26, 1721,  946,
			  602, -237,   34,   33,   32,  603,  802, 1716,  604, 1304,
			   34,   33,   32,  606,  404, -501,  607, -501,  562,  287,
			 1633, 1307, -501,   71, -237, 1562,   34,   33,   32,   70,
			 1715, -501,  464,  887,  813,  812, 1610,  289, -501, 1713,
			  735,  577,  618, 1372,  581,  795,  562,  802,  624,  840,
			  841,  588, -193,  808,  592, 1704,  635,  596, 1400,  457,
			  640, -217,  161,  644, 1702, 1609,  646, 1254, -176,  513,
			 -176,   45,   71, -193, 1578,  479,  789,  709,   70,  485,
			 1484, -217, 1483,  709, 1374, -217,   39, 1324, -176, 1577,

			 1576,  562, -176,  674,  675,  946, -176,  767,  769,  768,
			  770,  264,  453,  324,  946,  508,  507,  456, 1373,  454,
			 1195,  502,  501,  500, 1405,  476, 1566,  711, 1701,  523,
			   45,  946,  175,  767,  769, 1520, 1416,  954, 1061,  821,
			  122,  788,  729,  497,  496, 1059,  122,  452, 1577, 1576,
			 1372,  946, 1191,  748, 1383,  748,  117, 1464,  115,  902,
			  121,  946,  120,  119,  118, 1019,  362, 1690,  361,  360,
			  359,  932, 1137, 1689,  247,  247,  247,  117, 1382,  115,
			  946,  938,  951,  999, -696,  117,  116,  115,   34,   33,
			   32,  117,  358,  115, 1005,  286, 1600,  288,  490,  785, yyDummy>>,
			1, 200, 400)
		end

	yytable_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1688,  945, 1432,  786, 1435,  787,  887,  802, 1686, 1594,
			 -502,   34,   33,   32,  452, -502, 1476,  799, 1475,  806,
			  806,  806,  806, -184, 1560, 1599,  814,  817,  818,  795,
			  820, -502,  452, 1025,  761,  802,  829, 1031,  763,  357,
			  617,  815,  114, -184,  464,  771, 1521, -184,  356,  773,
			 1570, -184,  802, 1559,  523, -515,  113,   34,   33,   32,
			 1677,  467,  355, 1018, 1110,   34,   33,   32, 1655,  652,
			  653,  654,  655,  656,  657, 1675,  164,  658,  659,  660,
			  661,  662,  663,  664,  665,  666,  667,  668,  670,  672,
			  673, 1671, 1516,  729,  875,  875, 1614, 1048, 1372,  768,

			  770,  779, 1099,  802, 1627, 1439, 1029,  803,  402, -515,
			 1317, 1363, 1438, 1513, 1316,  452,  778, 1368,  802, 1049,
			  893, 1515,  452,  802, 1567,  164,  401, -502,  230, 1658,
			  905, 1442, 1654,  914,  748, 1638,  748,  260,  748, 1302,
			 1301, 1437,  270, -502, 1025, 1652,  276,  924,  278,  926,
			  470, 1635,   34,   33,   32, -585, 1419,  855, 1420, -585,
			 1569,  854, 1327, 1660,  247,  247,  247, 1630, 1606,  117,
			  928,  115,  930,  931, -585, -585, 1673,  934, 1140, 1139,
			  383,   34,   33,   32,  944,  469,  789, -242, -242, 1629,
			  829,  391, 1623, -242, 1038,  617,  950, -242,  794, 1692, yyDummy>>,
			1, 200, 600)
		end

	yytable_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  468, -242,  467,  948, -242,  288, 1613, 1628, 1634, -242,
			 1622,  452, 1037, 1036, 1517,  112, 1035, 1442, 1647,  968,
			 1034,  428,  825,  902,  254,  831,  110,  835,  835, 1019,
			  961,  436, -242, 1612,  457,  974, 1366,  122, 1365, 1246,
			 1246,  887, 1246,  464, 1636, 1315,  838, -268,  839,  628,
			 1670,  224, 1598,  835,  835, -268,  849, 1277, -268, 1276,
			 1275, 1274, 1086, -268,    3, 1546, 1202, 1436, 1434,  117,
			 1460,  115,    2, 1659, 1587,   34,   33,   32,  452,  880,
			  998,  893,  117, 1273,  115,  450, 1672,   34,   33,   32,
			 1561,  905,  905, 1282, 1524,  464,  117, 1455,  115,  905,

			  914,  914,  434,  287,   34,   33,   32,  813,  812, 1691,
			 1026,  464, 1044, 1085, 1045,  976, 1046,  975, 1047, 1572,
			  449,  289,  880,  879,  170,  467, 1568, 1018, 1017,   98,
			  829,  968, 1053, 1553, 1320,  122, 1601,  295,  155, 1272,
			 1283, 1611,  457, 1074, 1552,  426, 1380,   34,   33,   32,
			 1557, 1081,  433, 1271,  956,  703,  955,  702,  701,  700,
			 1370, 1550, 1299,  580, 1246,  464,  584,  965,  887,  117,
			 1379,  115,  794,  591, 1512,  175,  595, 1549,  597,  598,
			  456,  699,  454,  117, 1369,  115, 1643, 1543,  711,  389,
			  905,   34,   33,   32,  729,  425, 1396,  868,  417,  416, yyDummy>>,
			1, 200, 800)
		end

	yytable_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  415,  829,  213,  905, -585, -585,  905,  967, 1115,  969,
			  970,  372,  371,  835,  806, -585, 1428, 1428, 1619, 1478,
			  117,  867,  115,  897,  849,  896,  381, -585,   34,   33,
			   32, 1136, -647,  465,  170,  464, 1538,  698,  179,  388,
			 1145,  968, 1534, 1053, 1053, 1053, 1053,  117, 1451,  115,
			 1190,  697, 1558,  -25, 1177, 1563,  865,  -25, -587,  107,
			  -25,  108, 1651,  -25, 1197,  186,  -25,  200,  199,  286,
			  264,  288, 1523, 1441,  -25, 1205,  380,  -25,  -25,  117,
			  864,  115,  -25,  117, 1385,  115, 1665, 1666,  875,  100,
			  101,  102,  -25,  -25,  164,  -25, 1210,  968,  -25,  905,

			 1679,  525,  527, 1608, 1429, 1429, 1219, 1505, 1685,  104,
			  105,  452,  452,  452,  452,  117,  992,  115,  955,  967,
			 1504, 1697,  274, 1699,   34,   33,   32, 1502,  167, 1267,
			 1265,  122,  921,  922, 1706, 1499, 1076,  254,  648, 1494,
			 1712, 1491, 1281, 1030, 1032,  762, 1454, 1489, 1488,  764,
			 1719,  121, 1472,  120,  119,  118,  772, 1458,  224, 1441,
			  774, 1726, 1388, 1449,  161,  167, -585, -585, -585, 1448,
			 1732,  167,  273, 1446, 1035,  829,  456,  455,  454, 1444,
			  167,  487,  117,  988,  115,  167,  861,   37, 1390,  268,
			  167,   34,   33,   32, -585, 1389, 1500, 1501, 1364,  213, yyDummy>>,
			1, 200, 1000)
		end

	yytable_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1037, 1210,  -15,  117,  984,  115,  452, 1359,  -15,  117,
			  860,  115, 1119,    3, 1319, 1328,  788, 1323, 1217,  -15,
			 1312,    2,  -15,  -15,  167, 1310, 1306,  -15,  517,  967,
			 1298,  516, 1295,  114, 1294,  167,  452,  -15, 1159,  267,
			  452,  130, 1297,  -15,  117,  980,  115,  113,  167, 1267,
			  122, 1266, 1288,  179, 1199, 1200, 1034, 1536, 1260,   -4,
			 1457, 1375, 1207, 1204, 1209,  167,  155,  -96, -107,  -98,
			  362, -109,  361,  360,  359,  167, -100, -111, 1398, 1375,
			  829, 1141, 1142, 1143, 1144,  967, 1411, 1412,  858, 1177,
			 1395, 1206,  829,  968,  167,  117,  358,  115,  117,  870,

			  115,   78,   78,   91,   91,   86,   86, -102, -113,   77,
			   77,  117,  857,  115, 1573, 1203, 1078,   90,   90,  919,
			 1575,   93,   93, 1424, 1424, 1196, 1185,  122, 1322, 1378,
			 1147, -552, 1321, 1284, 1285, 1286, 1592,  258,  122,   34,
			   33,   32, 1038, 1129, -222,  452,  -93,  241, 1107,  240,
			  239,  238,  356,  228, 1105,   34,   33,   32,  241, 1620,
			  240,  239,  238,  550,  -94, 1083,  355,  264, 1090,  286,
			  538,  288,  283,  282,  281, 1626,  553, -105, 1375,  -95,
			 -106, 1473, 1474,  237,  236,  235,  -97,  257,  535,  217,
			 1490,   34,   33,   32,  968,  184, -108,   34,   33,   32, yyDummy>>,
			1, 200, 1200)
		end

	yytable_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  -99, -110, 1487,  227,  175,  968, -101,  167, -112,  249,
			  167,  170,  117,  719,  115, 1077, 1075,  167, 1033, 1519,
			  167, 1013, 1082,  167, 1009, 1450,  543, 1068, 1002,  234,
			  249,  452, 1001,  540, -114, 1459,  963, -126, 1463,  216,
			  234, 1467, 1681,  233,  365,  183,  962, 1529,  161,  117,
			  542,  115,  933,  155,  233,  521,  117,  539,  115,  254,
			 1535, -438,  929,  175,  927, -449,  925,  167,  287, -440,
			  532, 1407, 1408, -451, -442,  529, -453, -444, 1414, 1415,
			 1551,  967, -455,  923,  249,  409,  224,  917,  140,  139,
			  170, 1421, 1422,  117,  531,  115,  739, 1565,  117,  528,

			  115,  562,  161,  894,  117,  715,  115, 1525,  117,  408,
			  115, 1527,  406,   34,   33,   32, 1530,  213,   78,  890,
			 1532, -103,   86, 1574,  399,  878,   77,  264, 1584,  800,
			  155,  117,  690,  115,  877,  117,  405,  115, 1590, 1375,
			  538, 1603,  553,  538,  826,  553,  824,  117,  398,  115,
			  819,  538,  396,  553,  538,  797,  553,  538,  553,  553,
			  796,   78,  117,  686,  115,   86,  784,  782, 1621,   77,
			  783, 1584,  117,  593,  115,  117,  395,  115, -553,  781,
			 -435, 1632,  967, 1393, -436,  175, 1498, 1149,  780,  760,
			  167, 1645, -447,  967,  167,  365,  365, 1194, -437, -448, yyDummy>>,
			1, 200, 1400)
		end

	yytable_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -439,  167,   78,  513, 1392,  167,   86,  174,  512, -450,
			   77, -441, 1584, -452, -443, -454, 1657,  254,  759,  156,
			  162,  758,  757, 1668,  171,  176,  180,  182,  752,  743,
			  117,  173,  115,  736,  286,  730,  191,  727,  725,  508,
			  507,  506,  505,  504,  503,  502,  501,  500,  696,  513,
			  805,  807,  809,  811,  512,  511,  510,  554,  509,  170,
			  214,  678,  117,  589,  115,  642,  225,  497,  496,  495,
			  494,  493,  492,  248,  161,  255, 1556,  641,  625,  623,
			  265,  169,  620,  616, 1287,  508,  507,  506,  505,  504,
			  503,  502,  501,  500,  248,  615,  160,  614,  538,  553,

			  610,  609,  538,  553,  117,  168,  115,  608,  364, -528,
			 -529,  538, 1305,  497,  496,  495,  494,  493,  492,  117,
			  159,  115,  224, 1588,  553,  605, -434,  538,  553,  205,
			  601,  538,  553,  568,  600,  599,  155, -468,  688,  397,
			  400,  692,  548,  576,  407,  410,  412,  413,  248,  717,
			  573,  213,  721, -694,  723,  724,  179,  486,  154, -691,
			  482, -692,  179,  515,  514,  158,  158,  117,  582,  115,
			  158,  158,  158,  264,  462,  446,  365,  254, -690, -689,
			  713,  117,  153,  115,  442,  224,  445,  443, 1362,  213,
			  422,  420,  179,  437,  429,  713,  117,  578,  115,  423, yyDummy>>,
			1, 200, 1600)
		end

	yytable_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  375,  117,  545,  115,  513, -445,  158,  117,  411,  115,
			  392,  384,  158,  368, 1399,  354,  353,  280,  117,  263,
			  115,  158,  117,  253,  115,  290,  158,  249,  249,  249,
			  117,  223,  115, 1418,  117,  212,  115,  117,  178,  115,
			  508,  507,  277,  202,  271,  261,  502,  501,  500,  232,
			  231,  195,  193,  249,  249,  249,  221,  192, -530,  364,
			  364,  530,  533, 1313,  190,  541,  544,  546,  547,  538,
			  189,  553,  538,  150,  553,  149,  538,  148,  553,  538,
			  136,  553,  538,  553,  553,  158,  158,  135,  106,  103,
			  158,  158,  158,   -9,   27,  851,   96,   -9,   10,  853,

			   -9,   22,  579,   -9, 1303,  583,   -9,  941, 1541, 1318,
			  856, 1011,  590, 1354,   -9,  594, 1367,   -9,   -9,  958,
			  513, 1482,   -9,  570,  883,  512,  511,  510,  885,  509,
			  519,  134,   -9,   -9, 1073,   -9,  365, 1453,   -9, 1016,
			 1015,  792, 1042, 1261, 1041, 1040,  713, 1462, 1117,  201,
			 1466,  473, 1468, 1469, 1522,  901,  508,  507,  506,  505,
			  504,  503,  502,  501,  500, 1443, 1589, 1134, 1201,  751,
			 1004,  622, 1007, 1290,  895,  863,  157,  163,  881, 1431,
			 1497,  172,  177,  181,  497,  496,  495,  494,  493,  492,
			 1292, 1537,  538,  553, 1413, 1545,  538,  553, 1656, 1624, yyDummy>>,
			1, 200, 1800)
		end

	yytable_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  538,  553, 1496, 1325,  538,  553, 1352,  158,  158, 1542,
			  978,  158,  158,  158,    0,    0,    0,  215, 1526, -162,
			 -162,    0, 1528,  226,  937, -162,    0, 1531,    0, -162,
			    0, 1533,  256, -162, -162,  687, -162,  266,  691,    0,
			  364, -162, 1146,    0,  712,  513,  716,    0,  158,  720,
			    0,  158,    0, 1193,    0,    0,    0,    0,  158,  712,
			    0,  158,    0,    0, -162,    0,    0,  982,    0,    0,
			  986,    0,    0,    0,  990,  753,    0,  994, 1593,  996,
			  997,  508,  507,  506,  505,  504,  503,  502,  501,  500,
			    0,  248,  248,  248,    0, 1618,  157,  163,    0,    0,

			    0,  172,  177,  181,    0,    0,    0,    0,    0,  497,
			  496,  495,  494,  493,  492,    0,    0,  248,  248,  248,
			 1264,    0,  365,    0,    0,    0, -236, -236,    0, 1637,
			    0, 1270, -236,    0, -233,    0, -236,    0, -233, 1650,
			 -236,  685, -233, -236,  689, -233,    0,    0, -236, -231,
			 -233,    0,  714, -231,    0,  718,    0, -231,  722,    0,
			 -231,    0,    0, 1664,    0, -231,    0,    0,    0, -159,
			 -159, -236,    0, -233, 1309, -159, 1311,    0,    0, -159,
			    0,  158,    0, -159,  158, 1684, -159,    0, -231, 1092,
			    0, -159,  158, 1094,    0,  158,    0, 1096, 1696,    0, yyDummy>>,
			1, 200, 2000)
		end

	yytable_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  364, 1098,    0,  859,  862,  639,  866,  869,  871,  872,
			  712,    0,    0,    0, -159,    0,    0, 1711,  157,  163,
			    0,    0,  172,  177,  181,  -17,  638,    0,    0,  -17,
			    0,    0,  -17,    0,    0,  -17,    0,    0,  -17,    0,
			    0,  713,    0,    0, 1361,    0,  -17,  713,    0,  -17,
			  -17,    0,    0,    0,  -17,    0,    0,    0,    0,  215,
			  753,  753,  226,    0,  -17,  -17,    0,  -17,    0,  256,
			  -17,  513,  266, -157, -157,    0,  512,  511,  510, -157,
			  509,    0,    0, -157,    0,  167,    0, -157,    0, 1417,
			 -157,    0,    0,    0,    0, -157,    0,    0,    0,  850,

			    0,    0,    0,  852,    0,    0,    0,  508,  507,  506,
			  505,  504,  503,  502,  501,  500, 1198,    0, -157,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  882,    0,
			    0,    0,  884,    0,    0,  497,  496,  495,  494,  493,
			  492,    0,    0,    0, 1447,    0,    0,    0,    0,  158,
			  158,    0,  158,  158,  158,    0,    0,    0,    0,   29,
			    0,    0,    0,    0,  981,    0,    0,  985,    0,    0,
			    0,  989,    0,  513,  993,    0,    0,    0,  512,  511,
			  510,  167,  509,    0,    0,  167,  364,    0,    0,    0,
			    0,  167,  215, 1279,  167,  226,    0,  167,    0,    0, yyDummy>>,
			1, 200, 2200)
		end

	yytable_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1503,    0,    0,  256,    0,    0,  266,    0,    0,  508,
			  507,  506,  505,  504,  503,  502,  501,  500,    0, 1518,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			 -642,    0, -642,    0,    0,    0,    0,  497,  496,  495,
			  494,  493,  492,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0, 1508,    0,    0,    0, 1509, 1510,
			    0,    0,    0,  167,    0,    0,    0,  167,    0,    0,
			  979,    0,  167,  983,    0,    0,  167,  987,    0,    0,
			  991,    0,    0,  995,    0,    0,    0,    0,    0,  513,
			    0,    0,    0,    0,  512,  511,  510, 1564,  509,    0,

			    0,    0,    0, 1571,    0,  712,    0,    0,    0,    0,
			  158,  712,    0,  158,    0,    0,    0,  158,    0,    0,
			  158,    0,    0,    0,    0,  508,  507,  506,  505,  504,
			  503,  502,  501,  500,    0,    0,    0,    0,    0,    0,
			 1396, 1602,    0,    0,    0,    0,    0,    0,    0, 1615,
			    0, 1617,    0,  497,  496,  495,  494,  493,  492,    0,
			  157,  163,    0,  172,  177,  181,    0,    0,    0,    0,
			  513,    0,    0,    0,    0,  512,  511,  510,    0,  509,
			    0, 1631,    0,    0,    0,    0,    0,    0, 1639, 1640,
			    0, 1644,    0, 1091,    0, 1649, 1616, 1093,    0,    0, yyDummy>>,
			1, 200, 2400)
		end

	yytable_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1653, 1095,    0,    0,    0, 1097,  508,  507,  506,  505,
			  504,  503,  502,  501,  500,    0, 1661,    0, 1663,    0,
			    0,    0,    0, 1667,    0,    0,    0,    0,    0, 1674,
			    0,    0, 1676,    0,  497,  496,  495,  494,  493,  492,
			 1648, 1683, -589, -589, -589, -589, 1687,    0,    0,    0,
			    0,    0, 1693,    0, 1695, -589,    0, 1278,    0, -589,
			    0,    0,    0, 1662,    0,    0, 1703, -589,    0,    0,
			 -589,    0,    0, 1710, -589, -589,    0,    0, 1714,    0,
			 1678,    0, 1680,    0,    0,    0, 1682,    0,    0,    0,
			    0,    0,    0, 1723,    0,    0,    0,    0,    0, 1694,

			    0,    0,    0, 1698,    0, 1700,    0,    0,    0,    0,
			    0,    0,    0,    0, 1705,    0, 1707, 1708, 1709,    0,
			    0,  215,    0,    0,  226,    0,    0,    0,  256, 1717,
			 1718,  266, 1720,    0,    0,    0,    0,    0,    0,    0,
			    0, 1725,    0, 1727, 1728,    0,    0,    0,    0, 1730,
			 1731,    0, 1733,    0,    0,    0,    0, 1735,    0,  966,
			   74,    0, 1737,    0, 1738,    0, 1495,    0,    0,    0,
			  313,    0,    0,  312,    0,    0,    0, 1371, 1376,    0,
			 1381, 1384, 1386, 1387,    0,  311,    0,    0, 1391,    0,
			    0,  310,    0, 1402,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 2600)
		end

	yytable_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,  309,    0,    0,    0,    0,  308,    0,  307,
			  306,    0,    0,  305,    0,    0,    0,    0,   73,   72,
			    0,   71,  304,  303,   34,   33,   32,  302,    0,    0,
			    0,  301,    0,   69,   68,   67,   66,   65,   64,   63,
			   62,   61,   60,   59,   58,   57,   56,   55,   54,   53,
			   52,   51,   50,   49,   48,   47,  300,  299, 1553,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  298,   45,
			   44,  297,  296,    0,  295,    0, 1452,    0,    0,  294,
			 1456, 1314,    0,    0,    0,    0, 1461,  293,  292, 1465,
			    0,    0,    0,    0,  132,    0,    0,    0,    0,    0,

			  513,    0,    0,    0,    0,  512,  511,  510,    0,  509,
			    0,  513,    0,    0,    0,    0,  512,  511,  510,    0,
			  509,    0,    0,  158,  158,    0,  158,  158,  158,    0,
			    0,    0,    0,    0,    0,    0,  508,  507,  506,  505,
			  504,  503,  502,  501,  500,    0,    0,  508,  507,  506,
			  505,  504,  503,  502,  501,  500,    0,    0,    0,    0,
			    0,    0,    0,    0,  497,  496,  495,  494,  493,  492,
			    0,    0,    0,    0,    0,  497,  496,  495,  494,  493,
			  492,    0,    0,    0,    0,    0,    0,    0, -680, -680,
			 -680, -680, -680,    0, -680, -680, -680, -680, -680, -680, yyDummy>>,
			1, 200, 2800)
		end

	yytable_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0, -680, -680, -680,    0, -680, -680,    0, -680, -680,
			 -680,    0, -680, -680, -680,    0, -680, -680,    0,    0,
			    0, -680,  158, -680, -680, -680,  158,    0, -680, -680,
			 -680,    0,  158,    0, -680,  158, -680,    0,    0, -680,
			 -680, -680, -680,    0,    0, -680, -680,    0,    0,    0,
			 -680, -680,    0, -680, -680, -680, -680, -680, -680, -680,
			 -680, -680, -680, -680, -680, -680, -680, -680, -680, -680,
			 -680, -680, -680, -680, -680, -680, -680, -680, -680, -680,
			 -680, -680, -680, -680, -680, -680, -680, -680, -680, -680,
			 -680, -680, -680, -680, -680, -680, -680, -680, -680, -680,

			 -680, -680, -680, -680, -680,    0, -680, -680,    0, -680,
			 -680, -680,    0, -680,    0,    0,    0,    0,    0, -680,
			 -680, -680, -680, -680, -680, -680, -680,    0,    0,    0,
			   71,    0,    0,    0,  157,  163,   70,  172,  177,  181,
			    0,    0,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,   46,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   45,   44,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   42,   41,    0, -681, yyDummy>>,
			1, 200, 3000)
		end

	yytable_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -681, -681, -681, -681,    0, -681, -681, -681, -681, -681,
			 -681,    0, -681, -681, -681,    0, -681, -681,    0, -681,
			 -681, -681,    0, -681, -681, -681,    0, -681, -681,    0,
			    0,    0, -681,  215, -681, -681, -681,  226,    0, -681,
			 -681, -681,    0,  256,    0, -681,  266, -681,    0,    0,
			 -681, -681, -681, -681,    0,    0, -681, -681,    0,    0,
			    0, -681, -681,    0, -681, -681, -681, -681, -681, -681,
			 -681, -681, -681, -681, -681, -681, -681, -681, -681, -681,
			 -681, -681, -681, -681, -681, -681, -681, -681, -681, -681,
			 -681, -681, -681, -681, -681, -681, -681, -681, -681, -681,

			 -681, -681, -681, -681, -681, -681, -681, -681, -681, -681,
			 -681, -681, -681, -681, -681, -681,    0, -681, -681,    0,
			 -681, -681, -681,    0, -681,    0,    0,    0,    0,    0,
			 -681, -681, -681, -681, -681, -681, -681, -681, -679, -679,
			 -679, -679, -679,    0, -679, -679, -679, -679, -679, -679,
			    0, -679, -679, -679,    0, -679, -679,    0, -679, -679,
			 -679,    0, -679, -679, -679,    0, -679, -679,    0,    0,
			    0, -679,    0, -679, -679, -679,    0,    0, -679, -679,
			 -679,    0,    0,    0, -679,    0, -679,    0,    0, -679,
			 -679, -679, -679,    0,    0, -679, -679,    0,    0,    0, yyDummy>>,
			1, 200, 3200)
		end

	yytable_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -679, -679,    0, -679, -679, -679, -679, -679, -679, -679,
			 -679, -679, -679, -679, -679, -679, -679, -679, -679, -679,
			 -679, -679, -679, -679, -679, -679, -679, -679, -679, -679,
			 -679, -679, -679, -679, -679, -679, -679, -679, -679, -679,
			 -679, -679, -679, -679, -679, -679, -679, -679, -679, -679,
			 -679, -679, -679, -679, -679,    0, -679, -679,    0, -679,
			 -679, -679,    0, -679,    0,    0,    0,    0,    0, -679,
			 -679, -679, -679, -679, -679, -679, -679, -332, -332, -332,
			 -332, -332,    0, -332, -332, -332, -332, -332, -332,    0,
			 -332, -332, -332,    0, -332, -332,    0, -332, -332, -332,

			    0, -332, -332, -332,    0, -332, -332,    0,    0,    0,
			 -332,    0, -332, -332, -332,    0,    0, -332, -332, -332,
			    0,    0,    0, -332,    0, -332,    0,    0, -332, -332,
			 -332, -332,    0,    0, -332, -332,    0,    0,    0, -332,
			 -332,    0, -332, -332, -332, -332, -332, -332, -332, -332,
			 -332, -332, -332, -332, -332, -332, -332, -332, -332, -332,
			 -332, -332, -332, -332, -332, -332, -332, -332, -332, -332,
			 -332, -332, -332, -332, -332, -332, -332, -332, -332, -332,
			 -332, -332, -332, -332, -332, -332, -332, -332, -332, -332,
			 -332, -332, -332, -332,    0, -332, -332,    0, -332, -332, yyDummy>>,
			1, 200, 3400)
		end

	yytable_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -332,    0, -332,    0,    0,    0,    0,    0, -332, -332,
			 -332, -332, -332, -332, -332, -332, -674,    0, -674,    0,
			 -674,    0, -674, -674, -674, -674,    0,    0, -674, -674,
			    0, -674,    0,    0, -674, -674,    0,    0,    0, -674,
			    0,    0,    0, -674,    0,    0,    0, -674,    0, -674,
			 -674,    0,    0,    0, -674, -674,    0,    0,    0,    0,
			    0,    0,    0,    0,    0, -674,    0, -674, -674,    0,
			    0, -674,    0, -683,    0,    0, -674, -674,    0, -674,
			 -674,    0, -674, -674, -674,    0,    0,    0,    0,    0,
			    0, -674, -674, -674, -674, -674, -674, -674, -674, -674,

			 -674, -674, -674, -674, -674, -674, -674, -674, -674, -674,
			 -674, -674, -674, -674,    0, -674, -674,    0,    0,    0,
			    0,    0,    0,    0,    0,    0, -674, -674, -674,    0,
			 -674,    0, -674,    0,    0,    0,    0, -674,    0, -674,
			    0, -673,    0, -673,    0, -673,    0, -673, -673, -673,
			 -673, -674, -680, -673, -673,    0, -673,    0,    0, -673,
			 -673,    0,    0,    0, -673,    0,    0,    0, -673,    0,
			    0,    0, -673,    0, -673, -673,    0,    0,    0, -673,
			 -673,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			 -673,    0, -673, -673,    0,    0, -673,    0, -682,    0, yyDummy>>,
			1, 200, 3600)
		end

	yytable_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0, -673, -673,    0, -673, -673,    0, -673, -673, -673,
			    0,    0,    0,    0,    0,    0, -673, -673, -673, -673,
			 -673, -673, -673, -673, -673, -673, -673, -673, -673, -673,
			 -673, -673, -673, -673, -673, -673, -673, -673, -673,    0,
			 -673, -673,    0,    0,    0,    0,    0,    0,    0,    0,
			    0, -673, -673, -673,    0, -673,    0, -673,    0,    0,
			    0,    0, -673,    0, -673,    0, -698,    0, -698,    0,
			 -698,    0, -698, -698, -698, -698, -673, -681, -698, -698,
			    0, -698,    0,    0, -698, -698,    0,    0,    0, -698,
			    0,    0,    0, -698,    0,    0,    0, -698,    0, -698,

			 -698,    0,    0,    0, -698, -698,    0,    0,    0,    0,
			    0,    0,    0,    0,    0, -698,    0, -698, -698,    0,
			    0, -698,    0,    0,    0,    0, -698, -698,    0, -698,
			 -698,    0, -698, -698, -698,    0,    0,    0,    0,    0,
			    0, -698, -698, -698, -698, -698, -698, -698, -698, -698,
			 -698, -698, -698, -698, -698, -698, -698, -698, -698, -698,
			 -698, -698, -698, -698,    0, -698, -698,    0,    0,    0,
			    0,    0,    0,    0,    0,    0, -698, -698, -698,    0,
			 -698,    0,  464,    0,    0,    0,    0, -698, -698, -698,
			    0, -672,    0, -672,    0, -672,    0, -672, -672, -672, yyDummy>>,
			1, 200, 3800)
		end

	yytable_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -672, -698, -698, -672, -672,    0, -672,    0,    0, -672,
			 -672,    0,    0,    0, -672,    0,    0,    0, -672,    0,
			    0,    0, -672,    0, -672, -672,    0,    0,    0, -672,
			 -672,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			 -672,    0, -672, -672,    0,    0, -672,    0,    0,    0,
			    0, -672, -672,    0, -672, -672,    0, -672, -672, -672,
			    0,    0,    0,    0,    0,    0, -672, -672, -672, -672,
			 -672, -672, -672, -672, -672, -672, -672, -672, -672, -672,
			 -672, -672, -672, -672, -672, -672, -672, -672, -672,    0,
			 -672, -672,    0,    0,    0,    0,    0,    0,    0,    0,

			    0, -672, -672, -672,    0, -672,    0, -672,    0,    0,
			    0,    0, -672,    0, -672,    0, -677,    0, -677,    0,
			 -677,    0, -677, -677, -677, -677, -672, -679, -677, -677,
			    0, -677,    0,    0, -677, -677,    0,    0,    0, -677,
			    0,    0,    0, -677,    0,    0,    0, -677,    0, -677,
			 -677,    0,    0,    0, -677, -677,    0,    0,    0,    0,
			    0,    0,    0,    0,    0, -677,    0, -677, -677,    0,
			    0, -677,    0,    0,    0,    0, -677, -677,    0, -677,
			 -677,    0, -677, -677, -677,    0,    0,    0,    0,    0,
			    0, -677, -677, -677, -677, -677, -677, -677, -677, -677, yyDummy>>,
			1, 200, 4000)
		end

	yytable_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -677, -677, -677, -677, -677, -677, -677, -677, -677, -677,
			 -677, -677, -677, -677,    0, -677, -677,    0,    0,    0,
			    0,    0,    0,    0,    0,    0, -677, -677, -677,    0,
			 -677,    0, -677,    0, -678,    0, -678, -677, -678, -677,
			 -678, -678, -678, -678,    0,    0, -678, -678,    0, -678,
			    0, -677, -678, -678,    0,    0,    0, -678,    0,    0,
			    0, -678,    0,    0,    0, -678,    0, -678, -678,    0,
			    0,    0, -678, -678,    0,    0,    0,    0,    0,    0,
			    0,    0,    0, -678,    0, -678, -678,    0,    0, -678,
			    0,    0,    0,    0, -678, -678,    0, -678, -678,    0,

			 -678, -678, -678,    0,    0,    0,    0,    0,    0, -678,
			 -678, -678, -678, -678, -678, -678, -678, -678, -678, -678,
			 -678, -678, -678, -678, -678, -678, -678, -678, -678, -678,
			 -678, -678,    0, -678, -678,    0,    0,    0,    0,    0,
			    0,    0,    0,    0, -678, -678, -678,    0, -678,    0,
			 -678,    0, -676,    0, -676, -678, -676, -678, -676, -676,
			 -676, -676,    0,    0, -676, -676,    0, -676,    0, -678,
			 -676, -676,    0,    0,    0, -676,    0,    0,    0, -676,
			    0,    0,    0, -676,    0, -676, -676,    0,    0,    0,
			 -676, -676,    0,    0,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 4200)
		end

	yytable_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0, -676,    0, -676, -676,    0,    0, -676,    0,    0,
			    0,    0, -676, -676,    0, -676, -676,    0, -676, -676,
			 -676,    0,    0,    0,    0,    0,    0, -676, -676, -676,
			 -676, -676, -676, -676, -676, -676, -676, -676, -676, -676,
			 -676, -676, -676, -676, -676, -676, -676, -676, -676, -676,
			    0, -676, -676,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, -676, -676, -676,    0, -676,    0, -676,    0,
			 -675,    0, -675, -676, -675, -676, -675, -675, -675, -675,
			    0,    0, -675, -675,    0, -675,    0, -676, -675, -675,
			    0,    0,    0, -675,    0,    0,    0, -675,    0,    0,

			    0, -675,    0, -675, -675,    0,    0,    0, -675, -675,
			    0,    0,    0,    0,    0,    0,    0,    0,    0, -675,
			    0, -675, -675,    0,    0, -675,    0,    0,    0,    0,
			 -675, -675,    0, -675, -675,    0, -675, -675, -675,    0,
			    0,    0,    0,    0,    0, -675, -675, -675, -675, -675,
			 -675, -675, -675, -675, -675, -675, -675, -675, -675, -675,
			 -675, -675, -675, -675, -675, -675, -675, -675,    0, -675,
			 -675,    0,    0,    0,    0,    0,  827,   74,    0,    0,
			 -675, -675, -675, 1403, -675,    0, -675,  313,    0,    0,
			  312, -675,    0, -675,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 4400)
		end

	yytable_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,  311,    0,    0, -675,    0,    0,  310,    0,
			 1402,    0,    0,    0,    0,    0,    0,    0,    0,  309,
			    0,    0,    0,    0,  308,    0,  307,  306,    0,    0,
			  305,    0,    0,    0,    0,   73,   72,    0,   71,  304,
			  303,   34,   33,   32,  302,    0,    0,    0,  301,    0,
			   69,   68,   67,   66,   65,   64,   63,   62,   61,   60,
			   59,   58,   57,   56,   55,   54,   53,   52,   51,   50,
			   49,   48,   47,  300,  299,    0,    0,    0,    0,    0,
			    0,    0,   74,    0,    0,  298,   45,   44,  297,  296,
			    0,  295,  313,    0,    0,  312,  294,    0,    0,    0,

			    0,    0,    0,    0,  293,  292,    0,  311,    0,    0,
			    0,  132,    0,  310,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  309,    0,    0,    0,    0,  308,
			    0,  307,  306,    0,    0,  305,    0,    0,    0,    0,
			   73,   72,    0,   71,  304,  303,   34,   33,   32,  302,
			    0,    0,    0,  301,    0,   69,   68,   67,   66,   65,
			   64,   63,   62,   61,   60,   59,   58,   57,   56,   55,
			   54,   53,   52,   51,   50,   49,   48,   47,  300,  299,
			    0,    0,    0,    0,    0,    0,    0,    0,  966,   74,
			  298,   45,   44,  297,  845,    0,  295,  977,    0,  313, yyDummy>>,
			1, 200, 4600)
		end

	yytable_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,  294,  312,    0,    0,    0,    0,    0,    0,  293,
			  292,    0,    0,    0,  311,    0,  132,  844,    0,    0,
			  310,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  309,    0,    0,    0,    0,  308,    0,  307,  306,
			    0,    0,  305,    0,    0,    0,    0,   73,   72,    0,
			   71,  304,  303,   34,   33,   32,  302,    0,    0,    0,
			  301,    0,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,  300,  299,    0,    0,    0,
			    0,    0,    0,  827,   74,    0,    0,  298,   45,   44,

			  297,  296,    0,  295,  313,    0,    0,  312,  294,    0,
			    0,    0,    0,    0,    0,    0,  293,  292,    0,  311,
			    0,    0,    0,  132,    0,  310,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  309,    0,    0,    0,
			    0,  308,    0,  307,  306,    0,    0,  305,    0,    0,
			    0,    0,   73,   72,    0,   71,  304,  303,   34,   33,
			   32,  302,    0,    0,    0,  301,    0,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,   59,   58,   57,
			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47,
			  300,  299,    0,    0,    0,    0,    0,    0,    0,   74, yyDummy>>,
			1, 200, 4800)
		end

	yytable_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,  298,   45,   44,  297,  296,    0,  295,  313,
			    0,    0,  312,  294,    0,    0,    0,    0,    0,    0,
			    0,  293,  292,    0,  311,    0,    0,    0,  132,    0,
			  310,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  309,    0,    0,    0,    0,  308,    0,  307,  306,
			    0,    0,  305,    0,    0,    0,    0,   73,   72,    0,
			   71,  304,  303,   34,   33,   32,  302,    0,    0,    0,
			  301,    0,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,  300,  299,    0,    0,    0,

			    0,    0, 1163,    0, 1162,    0, 1161,  298,   45,   44,
			  297,  845,    0,  295, 1160, 1159,    0, 1158,  294,    0,
			 1157,    0,    0,    0,    0,    0,  293,  292,    0,  311,
			    0,    0,    0,  132,  844,  310,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0, 1156,    0,  307, 1155,    0,    0,  305,    0,    0,
			    0,    0,   73,   72,    0,   71,  304,    0,   34,   33,
			   32,    0,    0,    0,    0,    0,    0,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,   59,   58,   57,
			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47, yyDummy>>,
			1, 200, 5000)
		end

	yytable_template_27 (an_array: ARRAY [INTEGER])
			-- Fill chunk #27 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0, 1154, 1153,    0,    0,    0,    0,   74,    0,    0,
			    0,    0,  298,   45,   44,    0, 1152,  313,  295,    0,
			  312,    0,    0,  294,    0, 1151,    0,    0,    0,    0,
			    0,    0,  311,    0,    0,    0,    0, 1150,  310,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  309,
			    0,    0,    0,    0,  308,    0,  307,  306,    0,    0,
			  305,    0,    0,    0,    0,   73,   72,    0,   71,  304,
			  303,   34,   33,   32,  302,    0,    0,    0,  301,    0,
			   69,   68,   67,   66,   65,   64,   63,   62,   61,   60,
			   59,   58,   57,   56,   55,   54,   53,   52,   51,   50,

			   49,   48,   47,  300,  299,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   74,  298,   45,   44,  297,  296,
			    0,  295,    0,    0,  313,  972,  294,  312,    0,    0,
			    0,    0,    0,    0,  293,  292,    0,    0,    0,  311,
			    0,  132,    0,    0,    0,  310,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  309,    0,    0,    0,
			    0,  308,    0,  307,  306,    0,    0,  305,    0,    0,
			    0,    0,   73,   72,    0,   71,  304,  303,   34,   33,
			   32,  302,    0,    0,    0,  301,    0,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,   59,   58,   57, yyDummy>>,
			1, 200, 5200)
		end

	yytable_template_28 (an_array: ARRAY [INTEGER])
			-- Fill chunk #28 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47,
			  300,  299,    0,    0,    0,    0,    0,    0,    0,   74,
			    0,    0,  298,   45,   44,  297,  953,    0,  295,  313,
			    0,    0,  312,  294,  788,    0,    0,    0,    0,    0,
			    0,  293,  292,    0,  311,    0,    0,    0,  132,    0,
			  310,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  309,    0,    0,    0,    0,  308,    0,  307,  306,
			    0,    0,  305,    0,    0,    0,    0,   73,   72,    0,
			   71,  304,  303,   34,   33,   32,  302,    0,    0,    0,
			  301,    0,   69,   68,   67,   66,   65,   64,   63,   62,

			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,  300,  299,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   74,  298,   45,   44,
			  297,  296,    0,  295,  936,    0,  313,    0,  294,  312,
			    0,    0,    0,    0,    0,    0,  293,  292,    0,    0,
			    0,  311,    0,  132,    0,    0,    0,  310,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  309,    0,
			    0,    0,    0,  308,    0,  307,  306,    0,    0,  305,
			  791,    0,    0,    0,   73,   72,    0,   71,  304,  303,
			   34,   33,   32,  302,    0,    0,    0,  301,    0,   69, yyDummy>>,
			1, 200, 5400)
		end

	yytable_template_29 (an_array: ARRAY [INTEGER])
			-- Fill chunk #29 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   68,   67,   66,   65,   64,   63,   62,   61,   60,   59,
			   58,   57,   56,   55,   54,   53,   52,   51,   50,   49,
			   48,   47,  300,  299,    0,    0,    0,    0,    0,    0,
			    0,   74,    0,    0,  298,   45,   44,  297,  296,    0,
			  295,  313,    0,    0,  312,  294,    0,    0,    0,    0,
			    0,    0,    0,  293,  292,    0,  311,    0,    0,    0,
			  132,    0,  310,    0,  671,    0,    0,    0,    0,    0,
			    0,    0,    0,  309,    0,    0,    0,    0,  308,    0,
			  307,  306,    0,    0,  305,    0,    0,    0,    0,   73,
			   72,    0,   71,  304,  303,   34,   33,   32,  302,    0,

			    0,    0,  301,    0,   69,   68,   67,   66,   65,   64,
			   63,   62,   61,   60,   59,   58,   57,   56,   55,   54,
			   53,   52,   51,   50,   49,   48,   47,  300,  299,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  298,
			   45,   44,  297,  296,   74,  295,    0,    0,  669,    0,
			  294,    0,    0,    0,  313,    0,    0,  312,  293,  292,
			    0,    0,    0,    0,    0,  132,    0,    0,    0,  311,
			    0,    0,    0,    0,    0,  310,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  309,    0,    0,    0,
			    0,  308,    0,  307,  306,    0,    0,  305,    0,    0, yyDummy>>,
			1, 200, 5600)
		end

	yytable_template_30 (an_array: ARRAY [INTEGER])
			-- Fill chunk #30 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,   73,   72,    0,   71,  304,  303,   34,   33,
			   32,  302,    0,    0,    0,  301,    0,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,   59,   58,   57,
			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47,
			  300,  299,    0,    0,    0,    0,    0,    0,    0,   74,
			    0,    0,  298,   45,   44,  297,  296,    0,  295,  313,
			    0,    0,  312,  294,    0,    0,    0,    0,    0,    0,
			    0,  293,  292,    0,  311,    0,    0,    0,  132,    0,
			  310,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  309,    0,    0,    0,    0,  308,    0,  307,  306,

			    0,    0,  305,    0,    0,    0,    0,   73,   72,    0,
			   71,  304,  303,   34,   33,   32,  302,    0,    0,    0,
			  301,    0,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,  300,  299,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   74,  298,   45,   44,
			  297,  296,    0,  295,    0,    0,  313,  518,  294,  312,
			    0,    0,    0,    0,    0,    0,  293,  292,    0,    0,
			    0,  311,    0,  132,    0,    0,    0,  310,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  309,    0, yyDummy>>,
			1, 200, 5800)
		end

	yytable_template_31 (an_array: ARRAY [INTEGER])
			-- Fill chunk #31 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,  308,    0,  307,  306,    0,    0,  305,
			    0,    0,    0,    0,   73,   72,    0,   71,  304,  303,
			   34,   33,   32,  302,    0,    0,    0,  301,    0,   69,
			   68,   67,   66,   65,   64,   63,   62,   61,   60,   59,
			   58,   57,   56,   55,   54,   53,   52,   51,   50,   49,
			   48,   47,  300,  299,    0,    0,    0,    0,    0,    0,
			    0,   74,    0,    0,  298,   45,   44,  297,  296,    0,
			  295,  313,    0,    0,  312,  294,    0,    0,    0,    0,
			    0,    0,    0,  293,  292,    0,  311,    0,    0,    0,
			  132,    0,  310,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,  309,    0,    0,    0,    0,  308,    0,
			  307,  306,    0,    0,  305,    0,    0,    0,    0,   73,
			   72,    0,   71,  304,  303,   34,   33,   32,  302,    0,
			    0,    0,  301,   74,   69,   68,   67,   66,   65,   64,
			   63,   62,   61,   60,   59,   58,   57,   56,   55,   54,
			   53,   52,   51,   50,   49,   48,   47,  300,  299,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  298,
			   45,   44,  297,  480,    0,  295,    0,    0,    0,    0,
			  294,    0,  959,    0,    0,    0,    0,    0,  293,  292,
			    0,   73,   72,    0,   71,  132,    0,   34,   33,   32, yyDummy>>,
			1, 200, 6000)
		end

	yytable_template_32 (an_array: ARRAY [INTEGER])
			-- Fill chunk #32 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   70,    0,    0,    0,    0,    0,   69,   68,   67,   66,
			   65,   64,   63,   62,   61,   60,   59,   58,   57,   56,
			   55,   54,   53,   52,   51,   50,   49,   48,   47,   46,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  513,   45,   44,    0,   43,  512,  511,  510,    0,
			  509,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   42,   41,    0,    0,    0,    0,    0,    3,    0,    0,
			    0,    0,    0,    0,    0,    2,    0,  508,  507,  506,
			  505,  504,  503,  502,  501,  500,    0,    0, 1430,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,  497,  496,  495,  494,  493,
			  492,   73,   72,    0,   71,    0,    0,    0,    0,    0,
			   70,    0,    0,    0,    0,    0,   69,   68,   67,   66,
			   65,   64,   63,   62,   61,   60,   59,   58,   57,   56,
			   55,   54,   53,   52,   51,   50,   49,   48,   47,   46,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   45,   44,    0,   43,    0, -335,    0,    0,
			 -335,    0, -335, -335,    0,    0, -335,  645, -335,    0,
			   42,   41, -335,    0, -335,    0, -335, -335, -335,    0,
			 -335,    0, -335,    0, -335,    0,    0,    0, -335,    0, yyDummy>>,
			1, 200, 6200)
		end

	yytable_template_33 (an_array: ARRAY [INTEGER])
			-- Fill chunk #33 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -332,    0, -335, -332,    0, -332, -332,  513,    0, -332,
			    0, -332,  512,  511,  510, -332,  509, -332,    0, -332,
			 -332, -332,    0, -332,    0, -332,    0, -332, -335, -335,
			 -335, -332,    0, 1086,    0, -332,    0,    0,    0,    0,
			    0,    0,    0,  508,  507,  506,  505,  504,  503,  502,
			  501,  500,    0,    0,    0,    0,    0,    0,    0,  513,
			    0, -332, -332, -332,  512,  511,  510,    0,  509,    0,
			    0,  497,  496,  495,  494,  493,  492,    0, -335,    0,
			 -335, -335,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  508,  507,  506,  505,  504,

			  503,  502,  501,  500,    0,    0, 1423,    0,    0,    0,
			    0, -332,    0, -332, -332,    0,    0,    0,    0,    0,
			    0,    0,    0,  497,  496,  495,  494,  493,  492,   73,
			   72,    0,   71,    0,    0,    0,    0,    0,   70,    0,
			    0,    0,    0,    0,   69,   68,   67,   66,   65,   64,
			   63,   62,   61,   60,   59,   58,   57,   56,   55,   54,
			   53,   52,   51,   50,   49,   48,   47,   46,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   45,   44,  305,   43,    0,    0,    0,    0,    0,    0,
			   71,    0,    0,    0,    0,    0,   70,    0,   42,   41, yyDummy>>,
			1, 200, 6400)
		end

	yytable_template_34 (an_array: ARRAY [INTEGER])
			-- Fill chunk #34 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,   46,  790,    0,    0,    0,
			    0,    0,    0,    0,    0,  513,    0,    0,   45,   44,
			  512,  511,  510,    0,  509,    0,    0,    0,    0,  788,
			    0,    0,    0,    0,    0,    0,   42,   41,    0,    0,
			    0,    0,    0,    0, 1208,    0,    0,    0,    0,    0,
			    0,  508,  507,  506,  505,  504,  503,  502,  501,  500,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  499,
			    0,    0,    0,    0,    0,    0,    0,  305,    0,  497,

			  496,  495,  494,  493,  492,   71,    0,    0,    0,    0,
			    0,   70,    0,    0,    0,    0,    0,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,   59,   58,   57,
			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47,
			   46,  513,    0,    0,    0,    0,  512,  511,  510,    0,
			  509,  513,    0,   45,   44,    0,  512,  511,  510,    0,
			  509,    0,    0,    0,  788,    0,    0,    0,    0,    0,
			    0,   42,   41,    0,    0,    0,    0,  508,  507,  506,
			  505,  504,  503,  502,  501,  500,    0,  508,  507,  506,
			  505,  504,  503,  502,  501,  500,    0,    0,    0,    0, yyDummy>>,
			1, 200, 6600)
		end

	yytable_template_35 (an_array: ARRAY [INTEGER])
			-- Fill chunk #35 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,  497,  496,  495,  494,  493,
			  492, 1084,    0,    0,    0,  497,  496,  495,  494,  493,
			  492,  964,  513,    0,    0,    0,    0,  512,  511,  510,
			    0,  509,    0,   69,   68,   67,   66,   65,   64,   63,
			   62,   61,   60,   59,   58,   57,   56,   55,   54,   53,
			   52,   51,   50,   49,   48,   47,    0,    0,  508,  507,
			  506,  505,  504,  503,  502,  501,  500,    0,    0,    0,
			   44,    0,  483,  513,    0,    0,  499,  971,  512,  511,
			  510,    0,  509,    0,    0,    0,  497,  496,  495,  494,
			  493,  492,  513,    0,    0,    0,    0,  512,  511,  510,

			    0,  509,    0,    0,    0,    0,    0,    0,    0,  508,
			  507,  506,  505,  504,  503,  502,  501,  500,    0,    0,
			    0,    0,    0,    0,    0,  935,    0,  499,  508,  507,
			  506,  505,  504,  503,  502,  501,  500,  497,  496,  495,
			  494,  493,  492,  513,    0,    0,  499,  498,  512,  511,
			  510,    0,  509,    0,    0,    0,  497,  496,  495,  494,
			  493,  492,  513,    0,    0,    0,    0,  512,  511,  510,
			    0,  509,    0,    0,    0,    0,    0,    0,    0,  508,
			  507,  506,  505,  504,  503,  502,  501,  500,    0,    0,
			    0,    0,    0,    0,    0,  680,    0,    0,  508,  507, yyDummy>>,
			1, 200, 6800)
		end

	yytable_template_36 (an_array: ARRAY [INTEGER])
			-- Fill chunk #36 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  506,  505,  504,  503,  502,  501,  500,  497,  496,  495,
			  494,  493,  492,  513,    0,    0,    0,    0,  512,  511,
			  510,    0,    0,    0,    0,    0,  497,  496,  495,  494,
			  493,  492,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  508,
			  507,  506,  505,  504,  503,  502,  501,  500,    0,    0,
			    0,    0,    0,  305,    0,    0,    0,    0,    0,    0,
			    0,   71,    0,    0,    0,    0,    0,  497,  496,  495,
			  494,  493,  492,   69,   68,   67,   66,   65,   64,   63,
			   62,   61,   60,   59,   58,   57,   56,   55,   54,   53,

			   52,   51,   50,   49,   48,   47,    0,    0,  -12,    0,
			    0,    0,  -12,    0,    0,  -12,    0,    0,  -12,   45,
			   44,  -12,    0,    0,    0,    0,    0,    0,    0,  -12,
			 1471,    0,  -12,  -12,    0,    0,    0,  -12,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  -12,  -12,    0,
			  -12,    0,    0,  -12,   69,   68,   67,   66,   65,   64,
			   63,   62,   61,   60,   59,   58,   57,   56,   55,   54,
			   53,   52,   51,   50,   49,   48,   47,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   44, 1244, 1243, 1242, 1241, 1240, 1239, 1238, 1237, yyDummy>>,
			1, 200, 7000)
		end

	yytable_template_37 (an_array: ARRAY [INTEGER])
			-- Fill chunk #37 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1236, 1235, 1234, 1233, 1232, 1231, 1230, 1229, 1228, 1227,
			 1226, 1225, 1224, 1223, 1222, 1330, 1331, 1332, 1333, 1334,
			 1335, 1336, 1337, 1338, 1339, 1340, 1341, 1342, 1343, 1344,
			 1345, 1346, 1347, 1348, 1349, 1350, 1351, yyDummy>>,
			1, 37, 7200)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 7236)
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
			yycheck_template_36 (an_array)
			yycheck_template_37 (an_array)
			Result := yyfixed_array (an_array)
		end

	yycheck_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   21,    1,   21,  190,   21,  311,   17,  123,   21,  236,
			   21,  294,  616,    8,    9,  637,   21,  738,  643,  478,
			   21,  190,   21,  816,  307,  970,  538,  309,  194,  371,
			  372, 1296,  472,   43,  801,   30,   31,  307, 1322, 1323,
			 1118,  553,  566,   38,  903,   40, 1065, 1322, 1323, 1065,
			  731,  910, 1065, 1065, 1065,  282,  292,  293, 1272, 1065,
			  538,  297,   83, 1128,   83,  301,   83,  303, 1124,   14,
			   83, 1131,   83,  903,  651,   14, 1290, 1124,   83,   98,
			  910,  951,   83,  538,   83,  106,   97,  106,  167,  106,
			  167,  306,  103,  106, 1123,  106, 1125, 1539,  553,  676,

			  677,  106,  902, 1170,   99,  106,  402,  106,  404,  188,
			  202,  122,  367, 1479,  135, 1402,  135,   36,  135,   36,
			   83,   26,  135,   21,  135,   72,   14,   74,  139,  140,
			  135,  142,  248,   22,  135, 1498,  135,  148,  149,  150,
			 1582,   30, 1220,  106,  155,   71,  126,  443,  444,  445,
			  161,  146,   14,    0,   17, 1014,  167,   45, 1017,  170,
			    4,   75,  142,  242,  175,   28,  243,  244,  179,  190,
			  336,  190,  135,  183,  941, 1389,   63,   64,  189,   68,
			  125, 1623,  192,   45, 1014,   83,   20, 1017,  114, 1476,
			  104,  950,  704, 1556,  141, 1251, 1261,  822, 1258,   44, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   45, 1001,  213,  142, 1251,  124,  216,  124,  106,  153,
			  221,  892,   56,  224,  125,  159,  128,  227, 1247,  124,
			  231,  745, 1588,  747,  168,  749, 1293,  705,  706,  173,
			  142,  142,  243,  244,  178,   11,    0,  135,   72,   73,
			   74,  128,  141,  254,   75, 1012, 1324,  257,   14,  704,
			  261, 1110,   14,  264,   14, 1539,   32,  267, 1051,  836,
			  271,  353,  354,  273, 1539,   14,  277, 1137,  212,  524,
			  525,  526,  527,  104,   34,  558,   52, 1070,   38,  223,
			 1110, 1300,   42,  294, 1300,  296,  296, 1300, 1300, 1300,
			 1555, 1161,  311,   12, 1300,   14,  307,  463, 1582,   17,

			 1360, 1022,   14,  599,  600,  601,  311, 1582,   14,  253,
			   72,   73,   74,   72,   73,   74,    8,    9,  940,  263,
			   11, 1191,   14,   72,   73,   74,   18,  949,   46,   47,
			   22,   49,   38,   25,   17,   22, 1550,  126,   30, 1623,
			  799,   32,  625,   30,   11,   28,    4,   37, 1623,   72,
			   73,   74,  141,   14, 1432,  814,   14, 1435,  798,   14,
			  643,   53,    7,   46,  123,   32,   11,   11,  880,   14,
			  380,  194,   17,  384,  369,   20,   34, 1136,  388,   14,
			   38,  392,   18,   28,   42,   52,   31,   32,   32,    8,
			    9,   36,   72,   73,   74,   14, 1117,  739,   15,   18, yyDummy>>,
			1, 200, 200)
		end

	yycheck_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  123,   46,   47,   22,   49,   17,   25,   52,   14,   11,
			  420,   30,   72,   73,   74,  425,   28,   14,  429, 1186,
			   72,   73,   74,  433,  125,  126,  437,  121,  120,  616,
			   32, 1190,  126,   69,   53, 1513,   72,   73,   74,   75,
			   14,  142,  122,  726,  124,  125,   17,  616,  142,   14,
			  733,  395,  618,  105,  398,  621,  120,   28,  468,  674,
			  675,  405,  120,  123,  408,   14,  477,  411,  120,  480,
			  480,   14,   27,  483,   14,   46,  486,  141,   14,   71,
			   16,  117,   69,  141,  120,  308, 1090,  999,   75,  312,
			   12,   34,   14, 1005,   49,   38,  141, 1218,   34,  135,

			  136,  120,   38,  514,  515,   11,   42,  586,  587,  586,
			  587,   27,  294,  336,   11,  107,  108,   72,   73,   74,
			 1073,  113,  114,  115, 1291,  307,   32,  538,   14,  352,
			  117,   11,   27,  612,  613,   32, 1303,  819,  122,  822,
			   27,  128,  553,  135,  136,    3,   27,  558,  135,  136,
			  105,   11,   32,  564,   49,  566,   72,   73,   74,   20,
			   47,   11,   49,   50,   51,   26,   47,   14,   49,   50,
			   51,  786,   32,   14,  585,  586,  587,   72,   73,   74,
			   11,  796,   32,  879,  128,   72,   73,   74,   72,   73,
			   74,   72,   73,   74,  890,  616,   17,  616,  142,  610, yyDummy>>,
			1, 200, 400)
		end

	yycheck_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   14,   32, 1323,  614, 1325,  615,  889,   28,   14, 1554,
			  121,   72,   73,   74,  625,  126,   12,  627,   14,  630,
			  631,  632,  633,   14,   17,   46,  636,  638,  639,  795,
			  641,  142,  643,  903,  578,   28,  647,  121,  582,  120,
			  463,   17,  129,   34,  122,  589, 1439,   38,  129,  593,
			 1520,   42,   28,   46,  477,  121,  143,   72,   73,   74,
			   14,  122,  143,  124,  125,   72,   73,   74,  121,  492,
			  493,  494,  495,  496,  497,   14,  142,  500,  501,  502,
			  503,  504,  505,  506,  507,  508,  509,  510,  511,  512,
			  513,   14,   17,  704,  705,  706, 1566,  933,  105,  776,

			  777,  126,  998,   28,  128, 1327,  121,   17,  125,  126,
			  121, 1264,   17, 1434,  125,  726,  141, 1270,   28,  934,
			  731,   46,  733,   28, 1517,  142,  125,  126,  162,   14,
			  741, 1356,   14,  744,  745, 1605,  747,  171,  749,   63,
			   64,   46,  176,  142, 1014,   14,  180,  758,  182,  760,
			   70,   14,   72,   73,   74,   25, 1309,  121, 1311,   29,
			 1519,  125, 1221, 1633,  775,  776,  777,   14, 1561,   72,
			  781,   74,  783,  784,   44,   45, 1646,  788,  124,  125,
			  214,   72,   73,   74,  803,  105, 1390,    8,    9,   14,
			  801,  225,   60,   14,   16,  618,  815,   18,  621, 1669, yyDummy>>,
			1, 200, 600)
		end

	yycheck_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  120,   22,  122,  813,   25,  824, 1565,   14, 1601,   30,
			  125,  822,   34,   35, 1436,   75,   38, 1442, 1611,  830,
			   42,  255,  645,   20,   27,  648,   75,  650,  651,   26,
			  825,  265,   53,   14,  845,  845,  123,   27,  125, 1122,
			 1123, 1124, 1125,  122, 1603,  124,  669,   14,  671,   36,
			 1643,   27,   14,  676,  677,   22,  679,   47,   25,   49,
			   50,   51,   45,   30,   22,   13, 1081, 1326,   26,   72,
			   73,   74,   30, 1632,   14,   72,   73,   74,  889,  124,
			  125,  892,   72,   73,   74,   70, 1645,   72,   73,   74,
			 1512,  902,  903,  120, 1447,  122,   72,   73,   74,  910,

			  911,  912,   70, 1090,   72,   73,   74,  124,  125, 1668,
			  905,  122,  923,  124,  925,  123,  927,  125,  929,   14,
			  105, 1090,  124,  125,   27,  122,   14,  124,  125,   31,
			  941,  942,  943,   29, 1217,   27, 1558,  122,   27,  129,
			 1155, 1563,  953,  953,   14,   70,   49,   72,   73,   74,
			 1503,  962,  120,  143,  123,   47,  125,   49,   50,   51,
			   49,  121, 1177,  397, 1247,  122,  400,  124, 1251,   72,
			   73,   74,  795,  407, 1433,   27,  410,  128,  412,  413,
			   72,   73,   74,   72,   73,   74, 1608,   14,  999,   70,
			 1001,   72,   73,   74, 1005,  120,   41,   49,   72,   73, yyDummy>>,
			1, 200, 800)
		end

	yycheck_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   74, 1012,   27, 1014,   14,   15, 1017,  830, 1018,  832,
			  833,    8,    9,  836, 1025,   14, 1322, 1323, 1571,   40,
			   72,   73,   74,  122,  847,  124,   70,   37,   72,   73,
			   74, 1050,   41,  120,   27,  122,   14,  129,   27,  120,
			 1059, 1052,  128, 1054, 1055, 1056, 1057,   72,   73,   74,
			 1069,  143, 1511,    7, 1065, 1514,   49,   11,   14,   38,
			   14,   40, 1615,   17, 1075,  142,   20,  125,  126, 1090,
			   27, 1090,   14, 1356,   28, 1086,  120,   31,   32,   72,
			   73,   74,   36,   72,   73,   74, 1639, 1640, 1099,   24,
			   25,   26,   46,   47,  142,   49, 1106, 1108,   52, 1110,

			 1653,  353,  354, 1562, 1322, 1323, 1116,   14, 1661,   30,
			   31, 1122, 1123, 1124, 1125,   72,   73,   74,  125,  942,
			   14, 1674,   70, 1676,   72,   73,   74,   14,  116, 1148,
			 1140,   27,  754,  755, 1687,   44,  959,   27,   44,   14,
			 1693,  128, 1152,  911,  912,  579, 1373,   14,  121,  583,
			 1703,   47,  121,   49,   50,   51,  590,  128,   27, 1442,
			  594, 1714, 1278,   14,   27,  153,   12,   13,   14,   14,
			 1723,  159,  120,   14,   38, 1186,   72,   73,   74,   14,
			  168,   25,   72,   73,   74,  173,   49,  141,  121,   70,
			  178,   72,   73,   74,   40,  129, 1411, 1412,  141,   27, yyDummy>>,
			1, 200, 1000)
		end

	yycheck_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   34, 1211,   11,   72,   73,   74, 1217,   14,   17,   72,
			   73,   74,    3,   22, 1214,   53,  128,   26,   54,   28,
			   14,   30,   31,   32,  212,   14,   14,   36,  142, 1052,
			  128,  142,   63,  129,   63,  223, 1247,   46,   19,  120,
			 1251,  112,  128,   52,   72,   73,   74,  143,  236, 1268,
			   27,   14,  120,   27, 1077, 1078,   42, 1472,   14,    0,
			 1376, 1272,   14, 1086,  125,  253,   27,  126,  126,  126,
			   47,  126,   49,   50,   51,  263,  126,  126, 1288, 1290,
			 1291, 1054, 1055, 1056, 1057, 1108, 1297, 1298,   49, 1300,
			 1285,   14, 1303, 1304,  282,   72,   73,   74,   72,   73,

			   74, 1322, 1323, 1322, 1323, 1322, 1323,  126,  126, 1322,
			 1323,   72,   73,   74, 1529,  141,   13, 1322, 1323,  753,
			 1535, 1322, 1323, 1322, 1323,  121,   41,   27,  137, 1273,
			  123,  128,  141, 1156, 1157, 1158, 1551,   70,   27,   72,
			   73,   74,   16,   14,   14, 1356,  126,   47,  123,   49,
			   50,   51,  129,   70,  121,   72,   73,   74,   47, 1574,
			   49,   50,   51,  142,  126,  141,  143,   27,  121, 1390,
			  358, 1390,   72,   73,   74, 1590,  364,  126, 1389,  126,
			  126, 1392, 1393,   72,   73,   74,  126,  120,  142,   70,
			 1400,   72,   73,   74, 1405,   70,  126,   72,   73,   74, yyDummy>>,
			1, 200, 1200)
		end

	yycheck_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  126,  126, 1397,  120,   27, 1416,  126,  395,  126,  167,
			  398,   27,   72,   73,   74,   12,    5,  405,  125, 1438,
			  408,   14,  141,  411,  120, 1369,   49,  141,   14,  129,
			  188, 1442,    5,   49,  125, 1379,  141,  125, 1382,  120,
			  129, 1385, 1657,  143,  202,  120,  128, 1458,   27,   72,
			   73,   74,  121,   27,  143,  122,   72,   73,   74,   27,
			 1471,  126,  128,   27,  128,  126,  128,  455, 1655,  126,
			   49, 1294, 1295,  126,  126,   49,  126,  126, 1301, 1302,
			 1491, 1304,  126,  128,  242,   49,   27,  125,   47,   48,
			   27, 1314, 1315,   72,   73,   74,   18, 1516,   72,   73,

			   74,  120,   27,  125,   72,   73,   74, 1451,   72,   73,
			   74, 1455,   49,   72,   73,   74, 1460,   27, 1539,  125,
			 1464,  126, 1539, 1534,   49,  125, 1539,   27, 1539,   12,
			   27,   72,   73,   74,  126,   72,   73,   74, 1549, 1550,
			  528, 1560,  530,  531,  121,  533,  121,   72,   73,   74,
			  121,  539,   49,  541,  542,  121,  544,  545,  546,  547,
			  121, 1582,   72,   73,   74, 1582,  128,  121, 1578, 1582,
			  128, 1582,   72,   73,   74,   72,   73,   74,  128,  128,
			  126, 1600, 1405,    5,  126,   27, 1409, 1062,  121,  128,
			  578, 1610,  126, 1416,  582,  353,  354, 1072,  126,  126, yyDummy>>,
			1, 200, 1400)
		end

	yycheck_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  126,  589, 1623,   71,   26,  593, 1623,   49,   76,  126,
			 1623,  126, 1623,  126,  126,  126, 1627,   27,  121,  113,
			  114,  128,  121, 1642,  118,  119,  120,  121,  121,  121,
			   72,   73,   74,   25, 1655,   14,  130,  126,   14,  107,
			  108,  109,  110,  111,  112,  113,  114,  115,  126,   71,
			  630,  631,  632,  633,   76,   77,   78,    8,   80,   27,
			  154,  123,   72,   73,   74,  123,  160,  135,  136,  137,
			  138,  139,  140,  167,   27,  169, 1499,    5,  128,  123,
			  174,   49,  123,  121, 1159,  107,  108,  109,  110,  111,
			  112,  113,  114,  115,  188,  124,   49,  128,  686,  687,

			  128,  121,  690,  691,   72,   73,   74,  121,  202,  128,
			  128,  699, 1187,  135,  136,  137,  138,  139,  140,   72,
			   73,   74,   27, 1546,  712,  121,  126,  715,  716,   23,
			  125,  719,  720,   74,  125,  125,   27,  125,  530,  233,
			  234,  533,   35,  121,  238,  239,  240,  241,  242,  541,
			  121,   27,  544,  128,  546,  547,   27,  120,   49,  128,
			  122,  128,   27,  128,  128,  113,  114,   72,   73,   74,
			  118,  119,  120,   27,   62,  121,  534,   27,  128,  128,
			  538,   72,   73,   74,  121,   27,  125,  125, 1263,   27,
			  126,  124,   27,  128,  128,  553,   72,   73,   74,  125, yyDummy>>,
			1, 200, 1600)
		end

	yycheck_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  120,   72,   73,   74,   71,  126,  154,   72,   73,   74,
			  128,  128,  160,   53, 1289,   59,   59,  126,   72,   73,
			   74,  169,   72,   73,   74,  110,  174,  585,  586,  587,
			   72,   73,   74, 1308,   72,   73,   74,   72,   73,   74,
			  107,  108,  128,   59,  128,  128,  113,  114,  115,  126,
			  128,   14,  126,  611,  612,  613,  128,  120,  128,  353,
			  354,  355,  356,   14,  121,  359,  360,  361,  362,  857,
			  128,  859,  860,    7,  862,    7,  864,    7,  866,  867,
			  125,  869,  870,  871,  872,  233,  234,  124,  124,    7,
			  238,  239,  240,    7,   17,  687,  126,   11,   20,  691,

			   14,  142,  396,   17, 1185,  399,   20,  800, 1480, 1211,
			  694,  897,  406, 1251,   28,  409, 1268,   31,   32,  822,
			   71, 1396,   36,  378,  716,   76,   77,   78,  720,   80,
			  336,   79,   46,   47,  952,   49,  694, 1371,   52,  902,
			  902,  618,  919, 1135,  919,  919,  704, 1381, 1021,  142,
			 1384,  307, 1386, 1387, 1442,  740,  107,  108,  109,  110,
			  111,  112,  113,  114,  115, 1357, 1547, 1043, 1079,  567,
			  889,  465,  892, 1162,  733,  699,  113,  114,  712, 1323,
			 1406,  118,  119,  120,  135,  136,  137,  138,  139,  140,
			 1164, 1476,  980,  981, 1300, 1486,  984,  985, 1623, 1582, yyDummy>>,
			1, 200, 1800)
		end

	yycheck_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  988,  989, 1405, 1219,  992,  993, 1245,  355,  356, 1484,
			  847,  359,  360,  361,   -1,   -1,   -1,  154, 1452,    8,
			    9,   -1, 1456,  160,  795,   14,   -1, 1461,   -1,   18,
			   -1, 1465,  169,   22,   23,  529,   25,  174,  532,   -1,
			  534,   30, 1060,   -1,  538,   71,  540,   -1,  396,  543,
			   -1,  399,   -1, 1071,   -1,   -1,   -1,   -1,  406,  553,
			   -1,  409,   -1,   -1,   53,   -1,   -1,  859,   -1,   -1,
			  862,   -1,   -1,   -1,  866,  569,   -1,  869, 1553,  871,
			  872,  107,  108,  109,  110,  111,  112,  113,  114,  115,
			   -1,  585,  586,  587,   -1, 1570,  233,  234,   -1,   -1,

			   -1,  238,  239,  240,   -1,   -1,   -1,   -1,   -1,  135,
			  136,  137,  138,  139,  140,   -1,   -1,  611,  612,  613,
			 1138,   -1,  880,   -1,   -1,   -1,    8,    9,   -1, 1604,
			   -1, 1149,   14,   -1,   14,   -1,   18,   -1,   18, 1614,
			   22,  528,   22,   25,  531,   25,   -1,   -1,   30,   14,
			   30,   -1,  539,   18,   -1,  542,   -1,   22,  545,   -1,
			   25,   -1,   -1, 1638,   -1,   30,   -1,   -1,   -1,    8,
			    9,   53,   -1,   53, 1192,   14, 1194,   -1,   -1,   18,
			   -1,  529,   -1,   22,  532, 1660,   25,   -1,   53,  981,
			   -1,   30,  540,  985,   -1,  543,   -1,  989, 1673,   -1, yyDummy>>,
			1, 200, 2000)
		end

	yycheck_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  694,  993,   -1,  697,  698,    5,  700,  701,  702,  703,
			  704,   -1,   -1,   -1,   53,   -1,   -1, 1692,  355,  356,
			   -1,   -1,  359,  360,  361,    7,   26,   -1,   -1,   11,
			   -1,   -1,   14,   -1,   -1,   17,   -1,   -1,   20,   -1,
			   -1,  999,   -1,   -1, 1262,   -1,   28, 1005,   -1,   31,
			   32,   -1,   -1,   -1,   36,   -1,   -1,   -1,   -1,  396,
			  754,  755,  399,   -1,   46,   47,   -1,   49,   -1,  406,
			   52,   71,  409,    8,    9,   -1,   76,   77,   78,   14,
			   80,   -1,   -1,   18,   -1, 1273,   -1,   22,   -1, 1307,
			   25,   -1,   -1,   -1,   -1,   30,   -1,   -1,   -1,  686,

			   -1,   -1,   -1,  690,   -1,   -1,   -1,  107,  108,  109,
			  110,  111,  112,  113,  114,  115,   14,   -1,   53,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  715,   -1,
			   -1,   -1,  719,   -1,   -1,  135,  136,  137,  138,  139,
			  140,   -1,   -1,   -1, 1362,   -1,   -1,   -1,   -1,  697,
			  698,   -1,  700,  701,  702,   -1,   -1,   -1,   -1,  141,
			   -1,   -1,   -1,   -1,  858,   -1,   -1,  861,   -1,   -1,
			   -1,  865,   -1,   71,  868,   -1,   -1,   -1,   76,   77,
			   78, 1369,   80,   -1,   -1, 1373,  880,   -1,   -1,   -1,
			   -1, 1379,  529, 1151, 1382,  532,   -1, 1385,   -1,   -1, yyDummy>>,
			1, 200, 2200)
		end

	yycheck_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			 1418,   -1,   -1,  540,   -1,   -1,  543,   -1,   -1,  107,
			  108,  109,  110,  111,  112,  113,  114,  115,   -1, 1437,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   12,   -1,   14,   -1,   -1,   -1,   -1,  135,  136,  137,
			  138,  139,  140,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1, 1426,   -1,   -1,   -1, 1430, 1431,
			   -1,   -1,   -1, 1451,   -1,   -1,   -1, 1455,   -1,   -1,
			  857,   -1, 1460,  860,   -1,   -1, 1464,  864,   -1,   -1,
			  867,   -1,   -1,  870,   -1,   -1,   -1,   -1,   -1,   71,
			   -1,   -1,   -1,   -1,   76,   77,   78, 1515,   80,   -1,

			   -1,   -1,   -1, 1521,   -1,  999,   -1,   -1,   -1,   -1,
			  858, 1005,   -1,  861,   -1,   -1,   -1,  865,   -1,   -1,
			  868,   -1,   -1,   -1,   -1,  107,  108,  109,  110,  111,
			  112,  113,  114,  115,   -1,   -1,   -1,   -1,   -1,   -1,
			   41, 1559,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 1567,
			   -1, 1569,   -1,  135,  136,  137,  138,  139,  140,   -1,
			  697,  698,   -1,  700,  701,  702,   -1,   -1,   -1,   -1,
			   71,   -1,   -1,   -1,   -1,   76,   77,   78,   -1,   80,
			   -1, 1599,   -1,   -1,   -1,   -1,   -1,   -1, 1606, 1607,
			   -1, 1609,   -1,  980,   -1, 1613, 1568,  984,   -1,   -1, yyDummy>>,
			1, 200, 2400)
		end

	yycheck_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			 1618,  988,   -1,   -1,   -1,  992,  107,  108,  109,  110,
			  111,  112,  113,  114,  115,   -1, 1634,   -1, 1636,   -1,
			   -1,   -1,   -1, 1641,   -1,   -1,   -1,   -1,   -1, 1647,
			   -1,   -1, 1650,   -1,  135,  136,  137,  138,  139,  140,
			 1612, 1659,   12,   13,   14,   15, 1664,   -1,   -1,   -1,
			   -1,   -1, 1670,   -1, 1672,   25,   -1, 1151,   -1,   29,
			   -1,   -1,   -1, 1635,   -1,   -1, 1684,   37,   -1,   -1,
			   40,   -1,   -1, 1691,   44,   45,   -1,   -1, 1696,   -1,
			 1652,   -1, 1654,   -1,   -1,   -1, 1658,   -1,   -1,   -1,
			   -1,   -1,   -1, 1711,   -1,   -1,   -1,   -1,   -1, 1671,

			   -1,   -1,   -1, 1675,   -1, 1677,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1, 1686,   -1, 1688, 1689, 1690,   -1,
			   -1,  858,   -1,   -1,  861,   -1,   -1,   -1,  865, 1701,
			 1702,  868, 1704,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1, 1713,   -1, 1715, 1716,   -1,   -1,   -1,   -1, 1721,
			 1722,   -1, 1724,   -1,   -1,   -1,   -1, 1729,   -1,    7,
			    8,   -1, 1734,   -1, 1736,   -1,   14,   -1,   -1,   -1,
			   18,   -1,   -1,   21,   -1,   -1,   -1, 1271, 1272,   -1,
			 1274, 1275, 1276, 1277,   -1,   33,   -1,   -1, 1282,   -1,
			   -1,   39,   -1,   41,   -1,   -1,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 2600)
		end

	yycheck_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,   57,
			   58,   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,   67,
			   -1,   69,   70,   71,   72,   73,   74,   75,   -1,   -1,
			   -1,   79,   -1,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,  105,   29,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  116,  117,
			  118,  119,  120,   -1,  122,   -1, 1370,   -1,   -1,  127,
			 1374,   41,   -1,   -1,   -1,   -1, 1380,  135,  136, 1383,
			   -1,   -1,   -1,   -1,  142,   -1,   -1,   -1,   -1,   -1,

			   71,   -1,   -1,   -1,   -1,   76,   77,   78,   -1,   80,
			   -1,   71,   -1,   -1,   -1,   -1,   76,   77,   78,   -1,
			   80,   -1,   -1, 1271, 1272,   -1, 1274, 1275, 1276,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  107,  108,  109,  110,
			  111,  112,  113,  114,  115,   -1,   -1,  107,  108,  109,
			  110,  111,  112,  113,  114,  115,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,  135,  136,  137,  138,  139,  140,
			   -1,   -1,   -1,   -1,   -1,  135,  136,  137,  138,  139,
			  140,   -1,   -1,   -1,   -1,   -1,   -1,   -1,    4,    5,
			    6,    7,    8,   -1,   10,   11,   12,   13,   14,   15, yyDummy>>,
			1, 200, 2800)
		end

	yycheck_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   17,   18,   19,   -1,   21,   22,   -1,   24,   25,
			   26,   -1,   28,   29,   30,   -1,   32,   33,   -1,   -1,
			   -1,   37, 1370,   39,   40,   41, 1374,   -1,   44,   45,
			   46,   -1, 1380,   -1,   50, 1383,   52,   -1,   -1,   55,
			   56,   57,   58,   -1,   -1,   61,   62,   -1,   -1,   -1,
			   66,   67,   -1,   69,   70,   71,   72,   73,   74,   75,
			   76,   77,   78,   79,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,  107,  108,  109,  110,  111,  112,  113,  114,  115,

			  116,  117,  118,  119,  120,   -1,  122,  123,   -1,  125,
			  126,  127,   -1,  129,   -1,   -1,   -1,   -1,   -1,  135,
			  136,  137,  138,  139,  140,  141,  142,   -1,   -1,   -1,
			   69,   -1,   -1,   -1, 1271, 1272,   75, 1274, 1275, 1276,
			   -1,   -1,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  117,  118,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  135,  136,   -1,    4, yyDummy>>,
			1, 200, 3000)
		end

	yycheck_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			    5,    6,    7,    8,   -1,   10,   11,   12,   13,   14,
			   15,   -1,   17,   18,   19,   -1,   21,   22,   -1,   24,
			   25,   26,   -1,   28,   29,   30,   -1,   32,   33,   -1,
			   -1,   -1,   37, 1370,   39,   40,   41, 1374,   -1,   44,
			   45,   46,   -1, 1380,   -1,   50, 1383,   52,   -1,   -1,
			   55,   56,   57,   58,   -1,   -1,   61,   62,   -1,   -1,
			   -1,   66,   67,   -1,   69,   70,   71,   72,   73,   74,
			   75,   76,   77,   78,   79,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,

			  105,  106,  107,  108,  109,  110,  111,  112,  113,  114,
			  115,  116,  117,  118,  119,  120,   -1,  122,  123,   -1,
			  125,  126,  127,   -1,  129,   -1,   -1,   -1,   -1,   -1,
			  135,  136,  137,  138,  139,  140,  141,  142,    4,    5,
			    6,    7,    8,   -1,   10,   11,   12,   13,   14,   15,
			   -1,   17,   18,   19,   -1,   21,   22,   -1,   24,   25,
			   26,   -1,   28,   29,   30,   -1,   32,   33,   -1,   -1,
			   -1,   37,   -1,   39,   40,   41,   -1,   -1,   44,   45,
			   46,   -1,   -1,   -1,   50,   -1,   52,   -1,   -1,   55,
			   56,   57,   58,   -1,   -1,   61,   62,   -1,   -1,   -1, yyDummy>>,
			1, 200, 3200)
		end

	yycheck_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   66,   67,   -1,   69,   70,   71,   72,   73,   74,   75,
			   76,   77,   78,   79,   80,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,  107,  108,  109,  110,  111,  112,  113,  114,  115,
			  116,  117,  118,  119,  120,   -1,  122,  123,   -1,  125,
			  126,  127,   -1,  129,   -1,   -1,   -1,   -1,   -1,  135,
			  136,  137,  138,  139,  140,  141,  142,    4,    5,    6,
			    7,    8,   -1,   10,   11,   12,   13,   14,   15,   -1,
			   17,   18,   19,   -1,   21,   22,   -1,   24,   25,   26,

			   -1,   28,   29,   30,   -1,   32,   33,   -1,   -1,   -1,
			   37,   -1,   39,   40,   41,   -1,   -1,   44,   45,   46,
			   -1,   -1,   -1,   50,   -1,   52,   -1,   -1,   55,   56,
			   57,   58,   -1,   -1,   61,   62,   -1,   -1,   -1,   66,
			   67,   -1,   69,   70,   71,   72,   73,   74,   75,   76,
			   77,   78,   79,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,  105,  106,
			  107,  108,  109,  110,  111,  112,  113,  114,  115,  116,
			  117,  118,  119,  120,   -1,  122,  123,   -1,  125,  126, yyDummy>>,
			1, 200, 3400)
		end

	yycheck_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  127,   -1,  129,   -1,   -1,   -1,   -1,   -1,  135,  136,
			  137,  138,  139,  140,  141,  142,    6,   -1,    8,   -1,
			   10,   -1,   12,   13,   14,   15,   -1,   -1,   18,   19,
			   -1,   21,   -1,   -1,   24,   25,   -1,   -1,   -1,   29,
			   -1,   -1,   -1,   33,   -1,   -1,   -1,   37,   -1,   39,
			   40,   -1,   -1,   -1,   44,   45,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   55,   -1,   57,   58,   -1,
			   -1,   61,   -1,   63,   -1,   -1,   66,   67,   -1,   69,
			   70,   -1,   72,   73,   74,   -1,   -1,   -1,   -1,   -1,
			   -1,   81,   82,   83,   84,   85,   86,   87,   88,   89,

			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,   -1,  105,  106,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  116,  117,  118,   -1,
			  120,   -1,  122,   -1,   -1,   -1,   -1,  127,   -1,  129,
			   -1,    6,   -1,    8,   -1,   10,   -1,   12,   13,   14,
			   15,  141,  142,   18,   19,   -1,   21,   -1,   -1,   24,
			   25,   -1,   -1,   -1,   29,   -1,   -1,   -1,   33,   -1,
			   -1,   -1,   37,   -1,   39,   40,   -1,   -1,   -1,   44,
			   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   55,   -1,   57,   58,   -1,   -1,   61,   -1,   63,   -1, yyDummy>>,
			1, 200, 3600)
		end

	yycheck_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   66,   67,   -1,   69,   70,   -1,   72,   73,   74,
			   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,   -1,
			  105,  106,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  116,  117,  118,   -1,  120,   -1,  122,   -1,   -1,
			   -1,   -1,  127,   -1,  129,   -1,    6,   -1,    8,   -1,
			   10,   -1,   12,   13,   14,   15,  141,  142,   18,   19,
			   -1,   21,   -1,   -1,   24,   25,   -1,   -1,   -1,   29,
			   -1,   -1,   -1,   33,   -1,   -1,   -1,   37,   -1,   39,

			   40,   -1,   -1,   -1,   44,   45,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   55,   -1,   57,   58,   -1,
			   -1,   61,   -1,   -1,   -1,   -1,   66,   67,   -1,   69,
			   70,   -1,   72,   73,   74,   -1,   -1,   -1,   -1,   -1,
			   -1,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,   -1,  105,  106,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  116,  117,  118,   -1,
			  120,   -1,  122,   -1,   -1,   -1,   -1,  127,  128,  129,
			   -1,    6,   -1,    8,   -1,   10,   -1,   12,   13,   14, yyDummy>>,
			1, 200, 3800)
		end

	yycheck_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   15,  141,  142,   18,   19,   -1,   21,   -1,   -1,   24,
			   25,   -1,   -1,   -1,   29,   -1,   -1,   -1,   33,   -1,
			   -1,   -1,   37,   -1,   39,   40,   -1,   -1,   -1,   44,
			   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   55,   -1,   57,   58,   -1,   -1,   61,   -1,   -1,   -1,
			   -1,   66,   67,   -1,   69,   70,   -1,   72,   73,   74,
			   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,   -1,
			  105,  106,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,  116,  117,  118,   -1,  120,   -1,  122,   -1,   -1,
			   -1,   -1,  127,   -1,  129,   -1,    6,   -1,    8,   -1,
			   10,   -1,   12,   13,   14,   15,  141,  142,   18,   19,
			   -1,   21,   -1,   -1,   24,   25,   -1,   -1,   -1,   29,
			   -1,   -1,   -1,   33,   -1,   -1,   -1,   37,   -1,   39,
			   40,   -1,   -1,   -1,   44,   45,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   55,   -1,   57,   58,   -1,
			   -1,   61,   -1,   -1,   -1,   -1,   66,   67,   -1,   69,
			   70,   -1,   72,   73,   74,   -1,   -1,   -1,   -1,   -1,
			   -1,   81,   82,   83,   84,   85,   86,   87,   88,   89, yyDummy>>,
			1, 200, 4000)
		end

	yycheck_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,   -1,  105,  106,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  116,  117,  118,   -1,
			  120,   -1,  122,   -1,    6,   -1,    8,  127,   10,  129,
			   12,   13,   14,   15,   -1,   -1,   18,   19,   -1,   21,
			   -1,  141,   24,   25,   -1,   -1,   -1,   29,   -1,   -1,
			   -1,   33,   -1,   -1,   -1,   37,   -1,   39,   40,   -1,
			   -1,   -1,   44,   45,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   55,   -1,   57,   58,   -1,   -1,   61,
			   -1,   -1,   -1,   -1,   66,   67,   -1,   69,   70,   -1,

			   72,   73,   74,   -1,   -1,   -1,   -1,   -1,   -1,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,   -1,  105,  106,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,  116,  117,  118,   -1,  120,   -1,
			  122,   -1,    6,   -1,    8,  127,   10,  129,   12,   13,
			   14,   15,   -1,   -1,   18,   19,   -1,   21,   -1,  141,
			   24,   25,   -1,   -1,   -1,   29,   -1,   -1,   -1,   33,
			   -1,   -1,   -1,   37,   -1,   39,   40,   -1,   -1,   -1,
			   44,   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 4200)
		end

	yycheck_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,   -1,
			   -1,   -1,   66,   67,   -1,   69,   70,   -1,   72,   73,
			   74,   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			   -1,  105,  106,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,  116,  117,  118,   -1,  120,   -1,  122,   -1,
			    6,   -1,    8,  127,   10,  129,   12,   13,   14,   15,
			   -1,   -1,   18,   19,   -1,   21,   -1,  141,   24,   25,
			   -1,   -1,   -1,   29,   -1,   -1,   -1,   33,   -1,   -1,

			   -1,   37,   -1,   39,   40,   -1,   -1,   -1,   44,   45,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   55,
			   -1,   57,   58,   -1,   -1,   61,   -1,   -1,   -1,   -1,
			   66,   67,   -1,   69,   70,   -1,   72,   73,   74,   -1,
			   -1,   -1,   -1,   -1,   -1,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,   -1,  105,
			  106,   -1,   -1,   -1,   -1,   -1,    7,    8,   -1,   -1,
			  116,  117,  118,   14,  120,   -1,  122,   18,   -1,   -1,
			   21,  127,   -1,  129,   -1,   -1,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 4400)
		end

	yycheck_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   33,   -1,   -1,  141,   -1,   -1,   39,   -1,
			   41,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,
			   -1,   -1,   -1,   -1,   55,   -1,   57,   58,   -1,   -1,
			   61,   -1,   -1,   -1,   -1,   66,   67,   -1,   69,   70,
			   71,   72,   73,   74,   75,   -1,   -1,   -1,   79,   -1,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,  105,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,    8,   -1,   -1,  116,  117,  118,  119,  120,
			   -1,  122,   18,   -1,   -1,   21,  127,   -1,   -1,   -1,

			   -1,   -1,   -1,   -1,  135,  136,   -1,   33,   -1,   -1,
			   -1,  142,   -1,   39,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   50,   -1,   -1,   -1,   -1,   55,
			   -1,   57,   58,   -1,   -1,   61,   -1,   -1,   -1,   -1,
			   66,   67,   -1,   69,   70,   71,   72,   73,   74,   75,
			   -1,   -1,   -1,   79,   -1,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,    7,    8,
			  116,  117,  118,  119,  120,   -1,  122,  123,   -1,   18, yyDummy>>,
			1, 200, 4600)
		end

	yycheck_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,  127,   21,   -1,   -1,   -1,   -1,   -1,   -1,  135,
			  136,   -1,   -1,   -1,   33,   -1,  142,  143,   -1,   -1,
			   39,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,   57,   58,
			   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,   67,   -1,
			   69,   70,   71,   72,   73,   74,   75,   -1,   -1,   -1,
			   79,   -1,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,   -1,   -1,   -1,
			   -1,   -1,   -1,    7,    8,   -1,   -1,  116,  117,  118,

			  119,  120,   -1,  122,   18,   -1,   -1,   21,  127,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  135,  136,   -1,   33,
			   -1,   -1,   -1,  142,   -1,   39,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   50,   -1,   -1,   -1,
			   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,   -1,
			   -1,   -1,   66,   67,   -1,   69,   70,   71,   72,   73,
			   74,   75,   -1,   -1,   -1,   79,   -1,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			  104,  105,   -1,   -1,   -1,   -1,   -1,   -1,   -1,    8, yyDummy>>,
			1, 200, 4800)
		end

	yycheck_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,  116,  117,  118,  119,  120,   -1,  122,   18,
			   -1,   -1,   21,  127,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  135,  136,   -1,   33,   -1,   -1,   -1,  142,   -1,
			   39,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,   57,   58,
			   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,   67,   -1,
			   69,   70,   71,   72,   73,   74,   75,   -1,   -1,   -1,
			   79,   -1,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,   -1,   -1,   -1,

			   -1,   -1,    6,   -1,    8,   -1,   10,  116,  117,  118,
			  119,  120,   -1,  122,   18,   19,   -1,   21,  127,   -1,
			   24,   -1,   -1,   -1,   -1,   -1,  135,  136,   -1,   33,
			   -1,   -1,   -1,  142,  143,   39,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,   -1,
			   -1,   -1,   66,   67,   -1,   69,   70,   -1,   72,   73,
			   74,   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103, yyDummy>>,
			1, 200, 5000)
		end

	yycheck_template_27 (an_array: ARRAY [INTEGER])
			-- Fill chunk #27 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,  105,  106,   -1,   -1,   -1,   -1,    8,   -1,   -1,
			   -1,   -1,  116,  117,  118,   -1,  120,   18,  122,   -1,
			   21,   -1,   -1,  127,   -1,  129,   -1,   -1,   -1,   -1,
			   -1,   -1,   33,   -1,   -1,   -1,   -1,  141,   39,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,
			   -1,   -1,   -1,   -1,   55,   -1,   57,   58,   -1,   -1,
			   61,   -1,   -1,   -1,   -1,   66,   67,   -1,   69,   70,
			   71,   72,   73,   74,   75,   -1,   -1,   -1,   79,   -1,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,

			  101,  102,  103,  104,  105,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,    8,  116,  117,  118,  119,  120,
			   -1,  122,   -1,   -1,   18,  126,  127,   21,   -1,   -1,
			   -1,   -1,   -1,   -1,  135,  136,   -1,   -1,   -1,   33,
			   -1,  142,   -1,   -1,   -1,   39,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   50,   -1,   -1,   -1,
			   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,   -1,
			   -1,   -1,   66,   67,   -1,   69,   70,   71,   72,   73,
			   74,   75,   -1,   -1,   -1,   79,   -1,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93, yyDummy>>,
			1, 200, 5200)
		end

	yycheck_template_28 (an_array: ARRAY [INTEGER])
			-- Fill chunk #28 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			  104,  105,   -1,   -1,   -1,   -1,   -1,   -1,   -1,    8,
			   -1,   -1,  116,  117,  118,  119,  120,   -1,  122,   18,
			   -1,   -1,   21,  127,  128,   -1,   -1,   -1,   -1,   -1,
			   -1,  135,  136,   -1,   33,   -1,   -1,   -1,  142,   -1,
			   39,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,   57,   58,
			   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,   67,   -1,
			   69,   70,   71,   72,   73,   74,   75,   -1,   -1,   -1,
			   79,   -1,   81,   82,   83,   84,   85,   86,   87,   88,

			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,    8,  116,  117,  118,
			  119,  120,   -1,  122,  123,   -1,   18,   -1,  127,   21,
			   -1,   -1,   -1,   -1,   -1,   -1,  135,  136,   -1,   -1,
			   -1,   33,   -1,  142,   -1,   -1,   -1,   39,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,   -1,
			   -1,   -1,   -1,   55,   -1,   57,   58,   -1,   -1,   61,
			   62,   -1,   -1,   -1,   66,   67,   -1,   69,   70,   71,
			   72,   73,   74,   75,   -1,   -1,   -1,   79,   -1,   81, yyDummy>>,
			1, 200, 5400)
		end

	yycheck_template_29 (an_array: ARRAY [INTEGER])
			-- Fill chunk #29 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,  104,  105,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,    8,   -1,   -1,  116,  117,  118,  119,  120,   -1,
			  122,   18,   -1,   -1,   21,  127,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  135,  136,   -1,   33,   -1,   -1,   -1,
			  142,   -1,   39,   -1,   41,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,
			   57,   58,   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,
			   67,   -1,   69,   70,   71,   72,   73,   74,   75,   -1,

			   -1,   -1,   79,   -1,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,  105,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  116,
			  117,  118,  119,  120,    8,  122,   -1,   -1,   12,   -1,
			  127,   -1,   -1,   -1,   18,   -1,   -1,   21,  135,  136,
			   -1,   -1,   -1,   -1,   -1,  142,   -1,   -1,   -1,   33,
			   -1,   -1,   -1,   -1,   -1,   39,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   50,   -1,   -1,   -1,
			   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,   -1, yyDummy>>,
			1, 200, 5600)
		end

	yycheck_template_30 (an_array: ARRAY [INTEGER])
			-- Fill chunk #30 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   66,   67,   -1,   69,   70,   71,   72,   73,
			   74,   75,   -1,   -1,   -1,   79,   -1,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			  104,  105,   -1,   -1,   -1,   -1,   -1,   -1,   -1,    8,
			   -1,   -1,  116,  117,  118,  119,  120,   -1,  122,   18,
			   -1,   -1,   21,  127,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  135,  136,   -1,   33,   -1,   -1,   -1,  142,   -1,
			   39,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,   57,   58,

			   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,   67,   -1,
			   69,   70,   71,   72,   73,   74,   75,   -1,   -1,   -1,
			   79,   -1,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,    8,  116,  117,  118,
			  119,  120,   -1,  122,   -1,   -1,   18,  126,  127,   21,
			   -1,   -1,   -1,   -1,   -1,   -1,  135,  136,   -1,   -1,
			   -1,   33,   -1,  142,   -1,   -1,   -1,   39,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,   -1, yyDummy>>,
			1, 200, 5800)
		end

	yycheck_template_31 (an_array: ARRAY [INTEGER])
			-- Fill chunk #31 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   55,   -1,   57,   58,   -1,   -1,   61,
			   -1,   -1,   -1,   -1,   66,   67,   -1,   69,   70,   71,
			   72,   73,   74,   75,   -1,   -1,   -1,   79,   -1,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,  104,  105,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,    8,   -1,   -1,  116,  117,  118,  119,  120,   -1,
			  122,   18,   -1,   -1,   21,  127,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  135,  136,   -1,   33,   -1,   -1,   -1,
			  142,   -1,   39,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,
			   57,   58,   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,
			   67,   -1,   69,   70,   71,   72,   73,   74,   75,   -1,
			   -1,   -1,   79,    8,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,  105,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  116,
			  117,  118,  119,  120,   -1,  122,   -1,   -1,   -1,   -1,
			  127,   -1,   12,   -1,   -1,   -1,   -1,   -1,  135,  136,
			   -1,   66,   67,   -1,   69,  142,   -1,   72,   73,   74, yyDummy>>,
			1, 200, 6000)
		end

	yycheck_template_32 (an_array: ARRAY [INTEGER])
			-- Fill chunk #32 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   75,   -1,   -1,   -1,   -1,   -1,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   71,  117,  118,   -1,  120,   76,   77,   78,   -1,
			   80,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			  135,  136,   -1,   -1,   -1,   -1,   -1,   22,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   30,   -1,  107,  108,  109,
			  110,  111,  112,  113,  114,  115,   -1,   -1,   43,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   -1,   -1,   -1,  135,  136,  137,  138,  139,
			  140,   66,   67,   -1,   69,   -1,   -1,   -1,   -1,   -1,
			   75,   -1,   -1,   -1,   -1,   -1,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,  117,  118,   -1,  120,   -1,   11,   -1,   -1,
			   14,   -1,   16,   17,   -1,   -1,   20,   41,   22,   -1,
			  135,  136,   26,   -1,   28,   -1,   30,   31,   32,   -1,
			   34,   -1,   36,   -1,   38,   -1,   -1,   -1,   42,   -1, yyDummy>>,
			1, 200, 6200)
		end

	yycheck_template_33 (an_array: ARRAY [INTEGER])
			-- Fill chunk #33 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   11,   -1,   46,   14,   -1,   16,   17,   71,   -1,   20,
			   -1,   22,   76,   77,   78,   26,   80,   28,   -1,   30,
			   31,   32,   -1,   34,   -1,   36,   -1,   38,   72,   73,
			   74,   42,   -1,   45,   -1,   46,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  107,  108,  109,  110,  111,  112,  113,
			  114,  115,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   71,
			   -1,   72,   73,   74,   76,   77,   78,   -1,   80,   -1,
			   -1,  135,  136,  137,  138,  139,  140,   -1,  122,   -1,
			  124,  125,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,  107,  108,  109,  110,  111,

			  112,  113,  114,  115,   -1,   -1,   43,   -1,   -1,   -1,
			   -1,  122,   -1,  124,  125,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  135,  136,  137,  138,  139,  140,   66,
			   67,   -1,   69,   -1,   -1,   -1,   -1,   -1,   75,   -1,
			   -1,   -1,   -1,   -1,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			  117,  118,   61,  120,   -1,   -1,   -1,   -1,   -1,   -1,
			   69,   -1,   -1,   -1,   -1,   -1,   75,   -1,  135,  136, yyDummy>>,
			1, 200, 6400)
		end

	yycheck_template_34 (an_array: ARRAY [INTEGER])
			-- Fill chunk #34 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,   62,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   71,   -1,   -1,  117,  118,
			   76,   77,   78,   -1,   80,   -1,   -1,   -1,   -1,  128,
			   -1,   -1,   -1,   -1,   -1,   -1,  135,  136,   -1,   -1,
			   -1,   -1,   -1,   -1,  143,   -1,   -1,   -1,   -1,   -1,
			   -1,  107,  108,  109,  110,  111,  112,  113,  114,  115,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  125,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   61,   -1,  135,

			  136,  137,  138,  139,  140,   69,   -1,   -1,   -1,   -1,
			   -1,   75,   -1,   -1,   -1,   -1,   -1,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			  104,   71,   -1,   -1,   -1,   -1,   76,   77,   78,   -1,
			   80,   71,   -1,  117,  118,   -1,   76,   77,   78,   -1,
			   80,   -1,   -1,   -1,  128,   -1,   -1,   -1,   -1,   -1,
			   -1,  135,  136,   -1,   -1,   -1,   -1,  107,  108,  109,
			  110,  111,  112,  113,  114,  115,   -1,  107,  108,  109,
			  110,  111,  112,  113,  114,  115,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 6600)
		end

	yycheck_template_35 (an_array: ARRAY [INTEGER])
			-- Fill chunk #35 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   -1,   -1,  135,  136,  137,  138,  139,
			  140,  141,   -1,   -1,   -1,  135,  136,  137,  138,  139,
			  140,  141,   71,   -1,   -1,   -1,   -1,   76,   77,   78,
			   -1,   80,   -1,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,   -1,   -1,  107,  108,
			  109,  110,  111,  112,  113,  114,  115,   -1,   -1,   -1,
			  118,   -1,  120,   71,   -1,   -1,  125,  126,   76,   77,
			   78,   -1,   80,   -1,   -1,   -1,  135,  136,  137,  138,
			  139,  140,   71,   -1,   -1,   -1,   -1,   76,   77,   78,

			   -1,   80,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  107,
			  108,  109,  110,  111,  112,  113,  114,  115,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,  123,   -1,  125,  107,  108,
			  109,  110,  111,  112,  113,  114,  115,  135,  136,  137,
			  138,  139,  140,   71,   -1,   -1,  125,  126,   76,   77,
			   78,   -1,   80,   -1,   -1,   -1,  135,  136,  137,  138,
			  139,  140,   71,   -1,   -1,   -1,   -1,   76,   77,   78,
			   -1,   80,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  107,
			  108,  109,  110,  111,  112,  113,  114,  115,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,  123,   -1,   -1,  107,  108, yyDummy>>,
			1, 200, 6800)
		end

	yycheck_template_36 (an_array: ARRAY [INTEGER])
			-- Fill chunk #36 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  109,  110,  111,  112,  113,  114,  115,  135,  136,  137,
			  138,  139,  140,   71,   -1,   -1,   -1,   -1,   76,   77,
			   78,   -1,   -1,   -1,   -1,   -1,  135,  136,  137,  138,
			  139,  140,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  107,
			  108,  109,  110,  111,  112,  113,  114,  115,   -1,   -1,
			   -1,   -1,   -1,   61,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   69,   -1,   -1,   -1,   -1,   -1,  135,  136,  137,
			  138,  139,  140,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,

			   98,   99,  100,  101,  102,  103,   -1,   -1,    7,   -1,
			   -1,   -1,   11,   -1,   -1,   14,   -1,   -1,   17,  117,
			  118,   20,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   28,
			  128,   -1,   31,   32,   -1,   -1,   -1,   36,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   46,   47,   -1,
			   49,   -1,   -1,   52,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  118,   81,   82,   83,   84,   85,   86,   87,   88, yyDummy>>,
			1, 200, 7000)
		end

	yycheck_template_37 (an_array: ARRAY [INTEGER])
			-- Fill chunk #37 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103, 1223, 1224, 1225, 1226, 1227,
			 1228, 1229, 1230, 1231, 1232, 1233, 1234, 1235, 1236, 1237,
			 1238, 1239, 1240, 1241, 1242, 1243, 1244, yyDummy>>,
			1, 37, 7200)
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

	yyvs34: SPECIAL [detachable ET_ALIAS_NAME_LIST]
			-- Stack for semantic values of type detachable ET_ALIAS_NAME_LIST

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [detachable ET_ALIAS_NAME_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_ALIAS_NAME_LIST]

	yyvs35: SPECIAL [detachable ET_ASSIGNER]
			-- Stack for semantic values of type detachable ET_ASSIGNER

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [detachable ET_ASSIGNER]
			-- Routines that ought to be in SPECIAL [detachable ET_ASSIGNER]

	yyvs36: SPECIAL [detachable ET_BRACKET_EXPRESSION]
			-- Stack for semantic values of type detachable ET_BRACKET_EXPRESSION

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [detachable ET_BRACKET_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_BRACKET_EXPRESSION]

	yyvs37: SPECIAL [detachable ET_CALL_AGENT]
			-- Stack for semantic values of type detachable ET_CALL_AGENT

	yyvsc37: INTEGER
			-- Capacity of semantic value stack `yyvs37'

	yyvsp37: INTEGER
			-- Top of semantic value stack `yyvs37'

	yyspecial_routines37: KL_SPECIAL_ROUTINES [detachable ET_CALL_AGENT]
			-- Routines that ought to be in SPECIAL [detachable ET_CALL_AGENT]

	yyvs38: SPECIAL [detachable ET_QUALIFIED_CALL_EXPRESSION]
			-- Stack for semantic values of type detachable ET_QUALIFIED_CALL_EXPRESSION

	yyvsc38: INTEGER
			-- Capacity of semantic value stack `yyvs38'

	yyvsp38: INTEGER
			-- Top of semantic value stack `yyvs38'

	yyspecial_routines38: KL_SPECIAL_ROUTINES [detachable ET_QUALIFIED_CALL_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_QUALIFIED_CALL_EXPRESSION]

	yyvs39: SPECIAL [detachable ET_CHECK_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_CHECK_INSTRUCTION

	yyvsc39: INTEGER
			-- Capacity of semantic value stack `yyvs39'

	yyvsp39: INTEGER
			-- Top of semantic value stack `yyvs39'

	yyspecial_routines39: KL_SPECIAL_ROUTINES [detachable ET_CHECK_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_CHECK_INSTRUCTION]

	yyvs40: SPECIAL [detachable ET_CHOICE]
			-- Stack for semantic values of type detachable ET_CHOICE

	yyvsc40: INTEGER
			-- Capacity of semantic value stack `yyvs40'

	yyvsp40: INTEGER
			-- Top of semantic value stack `yyvs40'

	yyspecial_routines40: KL_SPECIAL_ROUTINES [detachable ET_CHOICE]
			-- Routines that ought to be in SPECIAL [detachable ET_CHOICE]

	yyvs41: SPECIAL [detachable ET_CHOICE_CONSTANT]
			-- Stack for semantic values of type detachable ET_CHOICE_CONSTANT

	yyvsc41: INTEGER
			-- Capacity of semantic value stack `yyvs41'

	yyvsp41: INTEGER
			-- Top of semantic value stack `yyvs41'

	yyspecial_routines41: KL_SPECIAL_ROUTINES [detachable ET_CHOICE_CONSTANT]
			-- Routines that ought to be in SPECIAL [detachable ET_CHOICE_CONSTANT]

	yyvs42: SPECIAL [detachable ET_CHOICE_ITEM]
			-- Stack for semantic values of type detachable ET_CHOICE_ITEM

	yyvsc42: INTEGER
			-- Capacity of semantic value stack `yyvs42'

	yyvsp42: INTEGER
			-- Top of semantic value stack `yyvs42'

	yyspecial_routines42: KL_SPECIAL_ROUTINES [detachable ET_CHOICE_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_CHOICE_ITEM]

	yyvs43: SPECIAL [detachable ET_CHOICE_LIST]
			-- Stack for semantic values of type detachable ET_CHOICE_LIST

	yyvsc43: INTEGER
			-- Capacity of semantic value stack `yyvs43'

	yyvsp43: INTEGER
			-- Top of semantic value stack `yyvs43'

	yyspecial_routines43: KL_SPECIAL_ROUTINES [detachable ET_CHOICE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_CHOICE_LIST]

	yyvs44: SPECIAL [detachable ET_CLASS]
			-- Stack for semantic values of type detachable ET_CLASS

	yyvsc44: INTEGER
			-- Capacity of semantic value stack `yyvs44'

	yyvsp44: INTEGER
			-- Top of semantic value stack `yyvs44'

	yyspecial_routines44: KL_SPECIAL_ROUTINES [detachable ET_CLASS]
			-- Routines that ought to be in SPECIAL [detachable ET_CLASS]

	yyvs45: SPECIAL [detachable ET_CLIENT_ITEM]
			-- Stack for semantic values of type detachable ET_CLIENT_ITEM

	yyvsc45: INTEGER
			-- Capacity of semantic value stack `yyvs45'

	yyvsp45: INTEGER
			-- Top of semantic value stack `yyvs45'

	yyspecial_routines45: KL_SPECIAL_ROUTINES [detachable ET_CLIENT_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_CLIENT_ITEM]

	yyvs46: SPECIAL [detachable ET_CLIENTS]
			-- Stack for semantic values of type detachable ET_CLIENTS

	yyvsc46: INTEGER
			-- Capacity of semantic value stack `yyvs46'

	yyvsp46: INTEGER
			-- Top of semantic value stack `yyvs46'

	yyspecial_routines46: KL_SPECIAL_ROUTINES [detachable ET_CLIENTS]
			-- Routines that ought to be in SPECIAL [detachable ET_CLIENTS]

	yyvs47: SPECIAL [detachable ET_COMPOUND]
			-- Stack for semantic values of type detachable ET_COMPOUND

	yyvsc47: INTEGER
			-- Capacity of semantic value stack `yyvs47'

	yyvsp47: INTEGER
			-- Top of semantic value stack `yyvs47'

	yyspecial_routines47: KL_SPECIAL_ROUTINES [detachable ET_COMPOUND]
			-- Routines that ought to be in SPECIAL [detachable ET_COMPOUND]

	yyvs48: SPECIAL [detachable ET_CONDITIONAL]
			-- Stack for semantic values of type detachable ET_CONDITIONAL

	yyvsc48: INTEGER
			-- Capacity of semantic value stack `yyvs48'

	yyvsp48: INTEGER
			-- Top of semantic value stack `yyvs48'

	yyspecial_routines48: KL_SPECIAL_ROUTINES [detachable ET_CONDITIONAL]
			-- Routines that ought to be in SPECIAL [detachable ET_CONDITIONAL]

	yyvs49: SPECIAL [detachable ET_CONSTANT]
			-- Stack for semantic values of type detachable ET_CONSTANT

	yyvsc49: INTEGER
			-- Capacity of semantic value stack `yyvs49'

	yyvsp49: INTEGER
			-- Top of semantic value stack `yyvs49'

	yyspecial_routines49: KL_SPECIAL_ROUTINES [detachable ET_CONSTANT]
			-- Routines that ought to be in SPECIAL [detachable ET_CONSTANT]

	yyvs50: SPECIAL [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM]
			-- Stack for semantic values of type detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM

	yyvsc50: INTEGER
			-- Capacity of semantic value stack `yyvs50'

	yyvsp50: INTEGER
			-- Top of semantic value stack `yyvs50'

	yyspecial_routines50: KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM]

	yyvs51: SPECIAL [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST]
			-- Stack for semantic values of type detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST

	yyvsc51: INTEGER
			-- Capacity of semantic value stack `yyvs51'

	yyvsp51: INTEGER
			-- Top of semantic value stack `yyvs51'

	yyspecial_routines51: KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST]

	yyvs52: SPECIAL [detachable ET_CONSTRAINT_CREATOR]
			-- Stack for semantic values of type detachable ET_CONSTRAINT_CREATOR

	yyvsc52: INTEGER
			-- Capacity of semantic value stack `yyvs52'

	yyvsp52: INTEGER
			-- Top of semantic value stack `yyvs52'

	yyspecial_routines52: KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_CREATOR]
			-- Routines that ought to be in SPECIAL [detachable ET_CONSTRAINT_CREATOR]

	yyvs53: SPECIAL [detachable ET_CONSTRAINT_RENAME_LIST]
			-- Stack for semantic values of type detachable ET_CONSTRAINT_RENAME_LIST

	yyvsc53: INTEGER
			-- Capacity of semantic value stack `yyvs53'

	yyvsp53: INTEGER
			-- Top of semantic value stack `yyvs53'

	yyspecial_routines53: KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_RENAME_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_CONSTRAINT_RENAME_LIST]

	yyvs54: SPECIAL [detachable ET_CONSTRAINT_TYPE]
			-- Stack for semantic values of type detachable ET_CONSTRAINT_TYPE

	yyvsc54: INTEGER
			-- Capacity of semantic value stack `yyvs54'

	yyvsp54: INTEGER
			-- Top of semantic value stack `yyvs54'

	yyspecial_routines54: KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_TYPE]
			-- Routines that ought to be in SPECIAL [detachable ET_CONSTRAINT_TYPE]

	yyvs55: SPECIAL [detachable ET_CONVERT_FEATURE]
			-- Stack for semantic values of type detachable ET_CONVERT_FEATURE

	yyvsc55: INTEGER
			-- Capacity of semantic value stack `yyvs55'

	yyvsp55: INTEGER
			-- Top of semantic value stack `yyvs55'

	yyspecial_routines55: KL_SPECIAL_ROUTINES [detachable ET_CONVERT_FEATURE]
			-- Routines that ought to be in SPECIAL [detachable ET_CONVERT_FEATURE]

	yyvs56: SPECIAL [detachable ET_CONVERT_FEATURE_ITEM]
			-- Stack for semantic values of type detachable ET_CONVERT_FEATURE_ITEM

	yyvsc56: INTEGER
			-- Capacity of semantic value stack `yyvs56'

	yyvsp56: INTEGER
			-- Top of semantic value stack `yyvs56'

	yyspecial_routines56: KL_SPECIAL_ROUTINES [detachable ET_CONVERT_FEATURE_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_CONVERT_FEATURE_ITEM]

	yyvs57: SPECIAL [detachable ET_CONVERT_FEATURE_LIST]
			-- Stack for semantic values of type detachable ET_CONVERT_FEATURE_LIST

	yyvsc57: INTEGER
			-- Capacity of semantic value stack `yyvs57'

	yyvsp57: INTEGER
			-- Top of semantic value stack `yyvs57'

	yyspecial_routines57: KL_SPECIAL_ROUTINES [detachable ET_CONVERT_FEATURE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_CONVERT_FEATURE_LIST]

	yyvs58: SPECIAL [detachable ET_CREATE_EXPRESSION]
			-- Stack for semantic values of type detachable ET_CREATE_EXPRESSION

	yyvsc58: INTEGER
			-- Capacity of semantic value stack `yyvs58'

	yyvsp58: INTEGER
			-- Top of semantic value stack `yyvs58'

	yyspecial_routines58: KL_SPECIAL_ROUTINES [detachable ET_CREATE_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_CREATE_EXPRESSION]

	yyvs59: SPECIAL [detachable ET_CREATION_REGION]
			-- Stack for semantic values of type detachable ET_CREATION_REGION

	yyvsc59: INTEGER
			-- Capacity of semantic value stack `yyvs59'

	yyvsp59: INTEGER
			-- Top of semantic value stack `yyvs59'

	yyspecial_routines59: KL_SPECIAL_ROUTINES [detachable ET_CREATION_REGION]
			-- Routines that ought to be in SPECIAL [detachable ET_CREATION_REGION]

	yyvs60: SPECIAL [detachable ET_CREATOR]
			-- Stack for semantic values of type detachable ET_CREATOR

	yyvsc60: INTEGER
			-- Capacity of semantic value stack `yyvs60'

	yyvsp60: INTEGER
			-- Top of semantic value stack `yyvs60'

	yyspecial_routines60: KL_SPECIAL_ROUTINES [detachable ET_CREATOR]
			-- Routines that ought to be in SPECIAL [detachable ET_CREATOR]

	yyvs61: SPECIAL [detachable ET_CREATOR_LIST]
			-- Stack for semantic values of type detachable ET_CREATOR_LIST

	yyvsc61: INTEGER
			-- Capacity of semantic value stack `yyvs61'

	yyvsp61: INTEGER
			-- Top of semantic value stack `yyvs61'

	yyspecial_routines61: KL_SPECIAL_ROUTINES [detachable ET_CREATOR_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_CREATOR_LIST]

	yyvs62: SPECIAL [detachable ET_DEBUG_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_DEBUG_INSTRUCTION

	yyvsc62: INTEGER
			-- Capacity of semantic value stack `yyvs62'

	yyvsp62: INTEGER
			-- Top of semantic value stack `yyvs62'

	yyspecial_routines62: KL_SPECIAL_ROUTINES [detachable ET_DEBUG_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_DEBUG_INSTRUCTION]

	yyvs63: SPECIAL [detachable ET_ELSEIF_EXPRESSION]
			-- Stack for semantic values of type detachable ET_ELSEIF_EXPRESSION

	yyvsc63: INTEGER
			-- Capacity of semantic value stack `yyvs63'

	yyvsp63: INTEGER
			-- Top of semantic value stack `yyvs63'

	yyspecial_routines63: KL_SPECIAL_ROUTINES [detachable ET_ELSEIF_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_ELSEIF_EXPRESSION]

	yyvs64: SPECIAL [detachable ET_ELSEIF_EXPRESSION_LIST]
			-- Stack for semantic values of type detachable ET_ELSEIF_EXPRESSION_LIST

	yyvsc64: INTEGER
			-- Capacity of semantic value stack `yyvs64'

	yyvsp64: INTEGER
			-- Top of semantic value stack `yyvs64'

	yyspecial_routines64: KL_SPECIAL_ROUTINES [detachable ET_ELSEIF_EXPRESSION_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_ELSEIF_EXPRESSION_LIST]

	yyvs65: SPECIAL [detachable ET_ELSEIF_PART]
			-- Stack for semantic values of type detachable ET_ELSEIF_PART

	yyvsc65: INTEGER
			-- Capacity of semantic value stack `yyvs65'

	yyvsp65: INTEGER
			-- Top of semantic value stack `yyvs65'

	yyspecial_routines65: KL_SPECIAL_ROUTINES [detachable ET_ELSEIF_PART]
			-- Routines that ought to be in SPECIAL [detachable ET_ELSEIF_PART]

	yyvs66: SPECIAL [detachable ET_ELSEIF_PART_LIST]
			-- Stack for semantic values of type detachable ET_ELSEIF_PART_LIST

	yyvsc66: INTEGER
			-- Capacity of semantic value stack `yyvs66'

	yyvsp66: INTEGER
			-- Top of semantic value stack `yyvs66'

	yyspecial_routines66: KL_SPECIAL_ROUTINES [detachable ET_ELSEIF_PART_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_ELSEIF_PART_LIST]

	yyvs67: SPECIAL [detachable ET_EXPORT]
			-- Stack for semantic values of type detachable ET_EXPORT

	yyvsc67: INTEGER
			-- Capacity of semantic value stack `yyvs67'

	yyvsp67: INTEGER
			-- Top of semantic value stack `yyvs67'

	yyspecial_routines67: KL_SPECIAL_ROUTINES [detachable ET_EXPORT]
			-- Routines that ought to be in SPECIAL [detachable ET_EXPORT]

	yyvs68: SPECIAL [detachable ET_EXPORT_LIST]
			-- Stack for semantic values of type detachable ET_EXPORT_LIST

	yyvsc68: INTEGER
			-- Capacity of semantic value stack `yyvs68'

	yyvsp68: INTEGER
			-- Top of semantic value stack `yyvs68'

	yyspecial_routines68: KL_SPECIAL_ROUTINES [detachable ET_EXPORT_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_EXPORT_LIST]

	yyvs69: SPECIAL [detachable ET_EXPRESSION]
			-- Stack for semantic values of type detachable ET_EXPRESSION

	yyvsc69: INTEGER
			-- Capacity of semantic value stack `yyvs69'

	yyvsp69: INTEGER
			-- Top of semantic value stack `yyvs69'

	yyspecial_routines69: KL_SPECIAL_ROUTINES [detachable ET_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_EXPRESSION]

	yyvs70: SPECIAL [detachable ET_EXPRESSION_ITEM]
			-- Stack for semantic values of type detachable ET_EXPRESSION_ITEM

	yyvsc70: INTEGER
			-- Capacity of semantic value stack `yyvs70'

	yyvsp70: INTEGER
			-- Top of semantic value stack `yyvs70'

	yyspecial_routines70: KL_SPECIAL_ROUTINES [detachable ET_EXPRESSION_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_EXPRESSION_ITEM]

	yyvs71: SPECIAL [detachable ET_EXTENDED_FEATURE_NAME]
			-- Stack for semantic values of type detachable ET_EXTENDED_FEATURE_NAME

	yyvsc71: INTEGER
			-- Capacity of semantic value stack `yyvs71'

	yyvsp71: INTEGER
			-- Top of semantic value stack `yyvs71'

	yyspecial_routines71: KL_SPECIAL_ROUTINES [detachable ET_EXTENDED_FEATURE_NAME]
			-- Routines that ought to be in SPECIAL [detachable ET_EXTENDED_FEATURE_NAME]

	yyvs72: SPECIAL [detachable ET_EXTERNAL_ALIAS]
			-- Stack for semantic values of type detachable ET_EXTERNAL_ALIAS

	yyvsc72: INTEGER
			-- Capacity of semantic value stack `yyvs72'

	yyvsp72: INTEGER
			-- Top of semantic value stack `yyvs72'

	yyspecial_routines72: KL_SPECIAL_ROUTINES [detachable ET_EXTERNAL_ALIAS]
			-- Routines that ought to be in SPECIAL [detachable ET_EXTERNAL_ALIAS]

	yyvs73: SPECIAL [detachable ET_FEATURE_CLAUSE]
			-- Stack for semantic values of type detachable ET_FEATURE_CLAUSE

	yyvsc73: INTEGER
			-- Capacity of semantic value stack `yyvs73'

	yyvsp73: INTEGER
			-- Top of semantic value stack `yyvs73'

	yyspecial_routines73: KL_SPECIAL_ROUTINES [detachable ET_FEATURE_CLAUSE]
			-- Routines that ought to be in SPECIAL [detachable ET_FEATURE_CLAUSE]

	yyvs74: SPECIAL [detachable ET_FEATURE_CLAUSE_LIST]
			-- Stack for semantic values of type detachable ET_FEATURE_CLAUSE_LIST

	yyvsc74: INTEGER
			-- Capacity of semantic value stack `yyvs74'

	yyvsp74: INTEGER
			-- Top of semantic value stack `yyvs74'

	yyspecial_routines74: KL_SPECIAL_ROUTINES [detachable ET_FEATURE_CLAUSE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_FEATURE_CLAUSE_LIST]

	yyvs75: SPECIAL [detachable ET_FEATURE_EXPORT]
			-- Stack for semantic values of type detachable ET_FEATURE_EXPORT

	yyvsc75: INTEGER
			-- Capacity of semantic value stack `yyvs75'

	yyvsp75: INTEGER
			-- Top of semantic value stack `yyvs75'

	yyspecial_routines75: KL_SPECIAL_ROUTINES [detachable ET_FEATURE_EXPORT]
			-- Routines that ought to be in SPECIAL [detachable ET_FEATURE_EXPORT]

	yyvs76: SPECIAL [detachable ET_FEATURE_NAME]
			-- Stack for semantic values of type detachable ET_FEATURE_NAME

	yyvsc76: INTEGER
			-- Capacity of semantic value stack `yyvs76'

	yyvsp76: INTEGER
			-- Top of semantic value stack `yyvs76'

	yyspecial_routines76: KL_SPECIAL_ROUTINES [detachable ET_FEATURE_NAME]
			-- Routines that ought to be in SPECIAL [detachable ET_FEATURE_NAME]

	yyvs77: SPECIAL [detachable ET_FEATURE_NAME_ITEM]
			-- Stack for semantic values of type detachable ET_FEATURE_NAME_ITEM

	yyvsc77: INTEGER
			-- Capacity of semantic value stack `yyvs77'

	yyvsp77: INTEGER
			-- Top of semantic value stack `yyvs77'

	yyspecial_routines77: KL_SPECIAL_ROUTINES [detachable ET_FEATURE_NAME_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_FEATURE_NAME_ITEM]

	yyvs78: SPECIAL [detachable ET_FORMAL_ARGUMENT]
			-- Stack for semantic values of type detachable ET_FORMAL_ARGUMENT

	yyvsc78: INTEGER
			-- Capacity of semantic value stack `yyvs78'

	yyvsp78: INTEGER
			-- Top of semantic value stack `yyvs78'

	yyspecial_routines78: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_ARGUMENT]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_ARGUMENT]

	yyvs79: SPECIAL [detachable ET_FORMAL_ARGUMENT_ITEM]
			-- Stack for semantic values of type detachable ET_FORMAL_ARGUMENT_ITEM

	yyvsc79: INTEGER
			-- Capacity of semantic value stack `yyvs79'

	yyvsp79: INTEGER
			-- Top of semantic value stack `yyvs79'

	yyspecial_routines79: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_ARGUMENT_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_ARGUMENT_ITEM]

	yyvs80: SPECIAL [detachable ET_FORMAL_ARGUMENT_LIST]
			-- Stack for semantic values of type detachable ET_FORMAL_ARGUMENT_LIST

	yyvsc80: INTEGER
			-- Capacity of semantic value stack `yyvs80'

	yyvsp80: INTEGER
			-- Top of semantic value stack `yyvs80'

	yyspecial_routines80: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_ARGUMENT_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_ARGUMENT_LIST]

	yyvs81: SPECIAL [detachable ET_FORMAL_PARAMETER]
			-- Stack for semantic values of type detachable ET_FORMAL_PARAMETER

	yyvsc81: INTEGER
			-- Capacity of semantic value stack `yyvs81'

	yyvsp81: INTEGER
			-- Top of semantic value stack `yyvs81'

	yyspecial_routines81: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_PARAMETER]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_PARAMETER]

	yyvs82: SPECIAL [detachable ET_FORMAL_PARAMETER_ITEM]
			-- Stack for semantic values of type detachable ET_FORMAL_PARAMETER_ITEM

	yyvsc82: INTEGER
			-- Capacity of semantic value stack `yyvs82'

	yyvsp82: INTEGER
			-- Top of semantic value stack `yyvs82'

	yyspecial_routines82: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_PARAMETER_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_PARAMETER_ITEM]

	yyvs83: SPECIAL [detachable ET_FORMAL_PARAMETER_LIST]
			-- Stack for semantic values of type detachable ET_FORMAL_PARAMETER_LIST

	yyvsc83: INTEGER
			-- Capacity of semantic value stack `yyvs83'

	yyvsp83: INTEGER
			-- Top of semantic value stack `yyvs83'

	yyspecial_routines83: KL_SPECIAL_ROUTINES [detachable ET_FORMAL_PARAMETER_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_FORMAL_PARAMETER_LIST]

	yyvs84: SPECIAL [detachable ET_IF_EXPRESSION]
			-- Stack for semantic values of type detachable ET_IF_EXPRESSION

	yyvsc84: INTEGER
			-- Capacity of semantic value stack `yyvs84'

	yyvsp84: INTEGER
			-- Top of semantic value stack `yyvs84'

	yyspecial_routines84: KL_SPECIAL_ROUTINES [detachable ET_IF_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_IF_EXPRESSION]

	yyvs85: SPECIAL [detachable ET_IF_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_IF_INSTRUCTION

	yyvsc85: INTEGER
			-- Capacity of semantic value stack `yyvs85'

	yyvsp85: INTEGER
			-- Top of semantic value stack `yyvs85'

	yyspecial_routines85: KL_SPECIAL_ROUTINES [detachable ET_IF_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_IF_INSTRUCTION]

	yyvs86: SPECIAL [detachable ET_INDEXING_LIST]
			-- Stack for semantic values of type detachable ET_INDEXING_LIST

	yyvsc86: INTEGER
			-- Capacity of semantic value stack `yyvs86'

	yyvsp86: INTEGER
			-- Top of semantic value stack `yyvs86'

	yyspecial_routines86: KL_SPECIAL_ROUTINES [detachable ET_INDEXING_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_INDEXING_LIST]

	yyvs87: SPECIAL [detachable ET_INDEXING_ITEM]
			-- Stack for semantic values of type detachable ET_INDEXING_ITEM

	yyvsc87: INTEGER
			-- Capacity of semantic value stack `yyvs87'

	yyvsp87: INTEGER
			-- Top of semantic value stack `yyvs87'

	yyspecial_routines87: KL_SPECIAL_ROUTINES [detachable ET_INDEXING_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_INDEXING_ITEM]

	yyvs88: SPECIAL [detachable ET_INDEXING_TERM]
			-- Stack for semantic values of type detachable ET_INDEXING_TERM

	yyvsc88: INTEGER
			-- Capacity of semantic value stack `yyvs88'

	yyvsp88: INTEGER
			-- Top of semantic value stack `yyvs88'

	yyspecial_routines88: KL_SPECIAL_ROUTINES [detachable ET_INDEXING_TERM]
			-- Routines that ought to be in SPECIAL [detachable ET_INDEXING_TERM]

	yyvs89: SPECIAL [detachable ET_INDEXING_TERM_ITEM]
			-- Stack for semantic values of type detachable ET_INDEXING_TERM_ITEM

	yyvsc89: INTEGER
			-- Capacity of semantic value stack `yyvs89'

	yyvsp89: INTEGER
			-- Top of semantic value stack `yyvs89'

	yyspecial_routines89: KL_SPECIAL_ROUTINES [detachable ET_INDEXING_TERM_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_INDEXING_TERM_ITEM]

	yyvs90: SPECIAL [detachable ET_INDEXING_TERM_LIST]
			-- Stack for semantic values of type detachable ET_INDEXING_TERM_LIST

	yyvsc90: INTEGER
			-- Capacity of semantic value stack `yyvs90'

	yyvsp90: INTEGER
			-- Top of semantic value stack `yyvs90'

	yyspecial_routines90: KL_SPECIAL_ROUTINES [detachable ET_INDEXING_TERM_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_INDEXING_TERM_LIST]

	yyvs91: SPECIAL [detachable ET_INLINE_AGENT]
			-- Stack for semantic values of type detachable ET_INLINE_AGENT

	yyvsc91: INTEGER
			-- Capacity of semantic value stack `yyvs91'

	yyvsp91: INTEGER
			-- Top of semantic value stack `yyvs91'

	yyspecial_routines91: KL_SPECIAL_ROUTINES [detachable ET_INLINE_AGENT]
			-- Routines that ought to be in SPECIAL [detachable ET_INLINE_AGENT]

	yyvs92: SPECIAL [detachable ET_INSPECT_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_INSPECT_INSTRUCTION

	yyvsc92: INTEGER
			-- Capacity of semantic value stack `yyvs92'

	yyvsp92: INTEGER
			-- Top of semantic value stack `yyvs92'

	yyspecial_routines92: KL_SPECIAL_ROUTINES [detachable ET_INSPECT_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_INSPECT_INSTRUCTION]

	yyvs93: SPECIAL [detachable ET_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_INSTRUCTION

	yyvsc93: INTEGER
			-- Capacity of semantic value stack `yyvs93'

	yyvsp93: INTEGER
			-- Top of semantic value stack `yyvs93'

	yyspecial_routines93: KL_SPECIAL_ROUTINES [detachable ET_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_INSTRUCTION]

	yyvs94: SPECIAL [detachable ET_INVARIANTS]
			-- Stack for semantic values of type detachable ET_INVARIANTS

	yyvsc94: INTEGER
			-- Capacity of semantic value stack `yyvs94'

	yyvsp94: INTEGER
			-- Top of semantic value stack `yyvs94'

	yyspecial_routines94: KL_SPECIAL_ROUTINES [detachable ET_INVARIANTS]
			-- Routines that ought to be in SPECIAL [detachable ET_INVARIANTS]

	yyvs95: SPECIAL [detachable ET_KEYWORD_FEATURE_NAME_LIST]
			-- Stack for semantic values of type detachable ET_KEYWORD_FEATURE_NAME_LIST

	yyvsc95: INTEGER
			-- Capacity of semantic value stack `yyvs95'

	yyvsp95: INTEGER
			-- Top of semantic value stack `yyvs95'

	yyspecial_routines95: KL_SPECIAL_ROUTINES [detachable ET_KEYWORD_FEATURE_NAME_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_KEYWORD_FEATURE_NAME_LIST]

	yyvs96: SPECIAL [detachable ET_LIKE_TYPE]
			-- Stack for semantic values of type detachable ET_LIKE_TYPE

	yyvsc96: INTEGER
			-- Capacity of semantic value stack `yyvs96'

	yyvsp96: INTEGER
			-- Top of semantic value stack `yyvs96'

	yyspecial_routines96: KL_SPECIAL_ROUTINES [detachable ET_LIKE_TYPE]
			-- Routines that ought to be in SPECIAL [detachable ET_LIKE_TYPE]

	yyvs97: SPECIAL [detachable ET_LOCAL_VARIABLE]
			-- Stack for semantic values of type detachable ET_LOCAL_VARIABLE

	yyvsc97: INTEGER
			-- Capacity of semantic value stack `yyvs97'

	yyvsp97: INTEGER
			-- Top of semantic value stack `yyvs97'

	yyspecial_routines97: KL_SPECIAL_ROUTINES [detachable ET_LOCAL_VARIABLE]
			-- Routines that ought to be in SPECIAL [detachable ET_LOCAL_VARIABLE]

	yyvs98: SPECIAL [detachable ET_LOCAL_VARIABLE_ITEM]
			-- Stack for semantic values of type detachable ET_LOCAL_VARIABLE_ITEM

	yyvsc98: INTEGER
			-- Capacity of semantic value stack `yyvs98'

	yyvsp98: INTEGER
			-- Top of semantic value stack `yyvs98'

	yyspecial_routines98: KL_SPECIAL_ROUTINES [detachable ET_LOCAL_VARIABLE_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_LOCAL_VARIABLE_ITEM]

	yyvs99: SPECIAL [detachable ET_LOCAL_VARIABLE_LIST]
			-- Stack for semantic values of type detachable ET_LOCAL_VARIABLE_LIST

	yyvsc99: INTEGER
			-- Capacity of semantic value stack `yyvs99'

	yyvsp99: INTEGER
			-- Top of semantic value stack `yyvs99'

	yyspecial_routines99: KL_SPECIAL_ROUTINES [detachable ET_LOCAL_VARIABLE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_LOCAL_VARIABLE_LIST]

	yyvs100: SPECIAL [detachable ET_LOOP_INVARIANTS]
			-- Stack for semantic values of type detachable ET_LOOP_INVARIANTS

	yyvsc100: INTEGER
			-- Capacity of semantic value stack `yyvs100'

	yyvsp100: INTEGER
			-- Top of semantic value stack `yyvs100'

	yyspecial_routines100: KL_SPECIAL_ROUTINES [detachable ET_LOOP_INVARIANTS]
			-- Routines that ought to be in SPECIAL [detachable ET_LOOP_INVARIANTS]

	yyvs101: SPECIAL [detachable ET_MANIFEST_ARRAY]
			-- Stack for semantic values of type detachable ET_MANIFEST_ARRAY

	yyvsc101: INTEGER
			-- Capacity of semantic value stack `yyvs101'

	yyvsp101: INTEGER
			-- Top of semantic value stack `yyvs101'

	yyspecial_routines101: KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_ARRAY]
			-- Routines that ought to be in SPECIAL [detachable ET_MANIFEST_ARRAY]

	yyvs102: SPECIAL [detachable ET_MANIFEST_STRING_ITEM]
			-- Stack for semantic values of type detachable ET_MANIFEST_STRING_ITEM

	yyvsc102: INTEGER
			-- Capacity of semantic value stack `yyvs102'

	yyvsp102: INTEGER
			-- Top of semantic value stack `yyvs102'

	yyspecial_routines102: KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_STRING_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_MANIFEST_STRING_ITEM]

	yyvs103: SPECIAL [detachable ET_MANIFEST_STRING_LIST]
			-- Stack for semantic values of type detachable ET_MANIFEST_STRING_LIST

	yyvsc103: INTEGER
			-- Capacity of semantic value stack `yyvs103'

	yyvsp103: INTEGER
			-- Top of semantic value stack `yyvs103'

	yyspecial_routines103: KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_STRING_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_MANIFEST_STRING_LIST]

	yyvs104: SPECIAL [detachable ET_MANIFEST_TUPLE]
			-- Stack for semantic values of type detachable ET_MANIFEST_TUPLE

	yyvsc104: INTEGER
			-- Capacity of semantic value stack `yyvs104'

	yyvsp104: INTEGER
			-- Top of semantic value stack `yyvs104'

	yyspecial_routines104: KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_TUPLE]
			-- Routines that ought to be in SPECIAL [detachable ET_MANIFEST_TUPLE]

	yyvs105: SPECIAL [detachable ET_OBSOLETE]
			-- Stack for semantic values of type detachable ET_OBSOLETE

	yyvsc105: INTEGER
			-- Capacity of semantic value stack `yyvs105'

	yyvsp105: INTEGER
			-- Top of semantic value stack `yyvs105'

	yyspecial_routines105: KL_SPECIAL_ROUTINES [detachable ET_OBSOLETE]
			-- Routines that ought to be in SPECIAL [detachable ET_OBSOLETE]

	yyvs106: SPECIAL [detachable ET_PARENTHESIZED_EXPRESSION]
			-- Stack for semantic values of type detachable ET_PARENTHESIZED_EXPRESSION

	yyvsc106: INTEGER
			-- Capacity of semantic value stack `yyvs106'

	yyvsp106: INTEGER
			-- Top of semantic value stack `yyvs106'

	yyspecial_routines106: KL_SPECIAL_ROUTINES [detachable ET_PARENTHESIZED_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_PARENTHESIZED_EXPRESSION]

	yyvs107: SPECIAL [detachable ET_PARENT]
			-- Stack for semantic values of type detachable ET_PARENT

	yyvsc107: INTEGER
			-- Capacity of semantic value stack `yyvs107'

	yyvsp107: INTEGER
			-- Top of semantic value stack `yyvs107'

	yyspecial_routines107: KL_SPECIAL_ROUTINES [detachable ET_PARENT]
			-- Routines that ought to be in SPECIAL [detachable ET_PARENT]

	yyvs108: SPECIAL [detachable ET_PARENT_CLAUSE_LIST]
			-- Stack for semantic values of type detachable ET_PARENT_CLAUSE_LIST

	yyvsc108: INTEGER
			-- Capacity of semantic value stack `yyvs108'

	yyvsp108: INTEGER
			-- Top of semantic value stack `yyvs108'

	yyspecial_routines108: KL_SPECIAL_ROUTINES [detachable ET_PARENT_CLAUSE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_PARENT_CLAUSE_LIST]

	yyvs109: SPECIAL [detachable ET_PARENT_ITEM]
			-- Stack for semantic values of type detachable ET_PARENT_ITEM

	yyvsc109: INTEGER
			-- Capacity of semantic value stack `yyvs109'

	yyvsp109: INTEGER
			-- Top of semantic value stack `yyvs109'

	yyspecial_routines109: KL_SPECIAL_ROUTINES [detachable ET_PARENT_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_PARENT_ITEM]

	yyvs110: SPECIAL [detachable ET_PARENT_LIST]
			-- Stack for semantic values of type detachable ET_PARENT_LIST

	yyvsc110: INTEGER
			-- Capacity of semantic value stack `yyvs110'

	yyvsp110: INTEGER
			-- Top of semantic value stack `yyvs110'

	yyspecial_routines110: KL_SPECIAL_ROUTINES [detachable ET_PARENT_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_PARENT_LIST]

	yyvs111: SPECIAL [detachable ET_POSTCONDITIONS]
			-- Stack for semantic values of type detachable ET_POSTCONDITIONS

	yyvsc111: INTEGER
			-- Capacity of semantic value stack `yyvs111'

	yyvsp111: INTEGER
			-- Top of semantic value stack `yyvs111'

	yyspecial_routines111: KL_SPECIAL_ROUTINES [detachable ET_POSTCONDITIONS]
			-- Routines that ought to be in SPECIAL [detachable ET_POSTCONDITIONS]

	yyvs112: SPECIAL [detachable ET_PRECONDITIONS]
			-- Stack for semantic values of type detachable ET_PRECONDITIONS

	yyvsc112: INTEGER
			-- Capacity of semantic value stack `yyvs112'

	yyvsp112: INTEGER
			-- Top of semantic value stack `yyvs112'

	yyspecial_routines112: KL_SPECIAL_ROUTINES [detachable ET_PRECONDITIONS]
			-- Routines that ought to be in SPECIAL [detachable ET_PRECONDITIONS]

	yyvs113: SPECIAL [detachable ET_PROCEDURE]
			-- Stack for semantic values of type detachable ET_PROCEDURE

	yyvsc113: INTEGER
			-- Capacity of semantic value stack `yyvs113'

	yyvsp113: INTEGER
			-- Top of semantic value stack `yyvs113'

	yyspecial_routines113: KL_SPECIAL_ROUTINES [detachable ET_PROCEDURE]
			-- Routines that ought to be in SPECIAL [detachable ET_PROCEDURE]

	yyvs114: SPECIAL [detachable ET_QUALIFIED_LIKE_IDENTIFIER]
			-- Stack for semantic values of type detachable ET_QUALIFIED_LIKE_IDENTIFIER

	yyvsc114: INTEGER
			-- Capacity of semantic value stack `yyvs114'

	yyvsp114: INTEGER
			-- Top of semantic value stack `yyvs114'

	yyspecial_routines114: KL_SPECIAL_ROUTINES [detachable ET_QUALIFIED_LIKE_IDENTIFIER]
			-- Routines that ought to be in SPECIAL [detachable ET_QUALIFIED_LIKE_IDENTIFIER]

	yyvs115: SPECIAL [detachable ET_QUERY]
			-- Stack for semantic values of type detachable ET_QUERY

	yyvsc115: INTEGER
			-- Capacity of semantic value stack `yyvs115'

	yyvsp115: INTEGER
			-- Top of semantic value stack `yyvs115'

	yyspecial_routines115: KL_SPECIAL_ROUTINES [detachable ET_QUERY]
			-- Routines that ought to be in SPECIAL [detachable ET_QUERY]

	yyvs116: SPECIAL [detachable ET_RENAME_ITEM]
			-- Stack for semantic values of type detachable ET_RENAME_ITEM

	yyvsc116: INTEGER
			-- Capacity of semantic value stack `yyvs116'

	yyvsp116: INTEGER
			-- Top of semantic value stack `yyvs116'

	yyspecial_routines116: KL_SPECIAL_ROUTINES [detachable ET_RENAME_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_RENAME_ITEM]

	yyvs117: SPECIAL [detachable ET_RENAME_LIST]
			-- Stack for semantic values of type detachable ET_RENAME_LIST

	yyvsc117: INTEGER
			-- Capacity of semantic value stack `yyvs117'

	yyvsp117: INTEGER
			-- Top of semantic value stack `yyvs117'

	yyspecial_routines117: KL_SPECIAL_ROUTINES [detachable ET_RENAME_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_RENAME_LIST]

	yyvs118: SPECIAL [detachable ET_STATIC_CALL_EXPRESSION]
			-- Stack for semantic values of type detachable ET_STATIC_CALL_EXPRESSION

	yyvsc118: INTEGER
			-- Capacity of semantic value stack `yyvs118'

	yyvsp118: INTEGER
			-- Top of semantic value stack `yyvs118'

	yyspecial_routines118: KL_SPECIAL_ROUTINES [detachable ET_STATIC_CALL_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_STATIC_CALL_EXPRESSION]

	yyvs119: SPECIAL [detachable ET_STRIP_EXPRESSION]
			-- Stack for semantic values of type detachable ET_STRIP_EXPRESSION

	yyvsc119: INTEGER
			-- Capacity of semantic value stack `yyvs119'

	yyvsp119: INTEGER
			-- Top of semantic value stack `yyvs119'

	yyspecial_routines119: KL_SPECIAL_ROUTINES [detachable ET_STRIP_EXPRESSION]
			-- Routines that ought to be in SPECIAL [detachable ET_STRIP_EXPRESSION]

	yyvs120: SPECIAL [detachable ET_TYPE]
			-- Stack for semantic values of type detachable ET_TYPE

	yyvsc120: INTEGER
			-- Capacity of semantic value stack `yyvs120'

	yyvsp120: INTEGER
			-- Top of semantic value stack `yyvs120'

	yyspecial_routines120: KL_SPECIAL_ROUTINES [detachable ET_TYPE]
			-- Routines that ought to be in SPECIAL [detachable ET_TYPE]

	yyvs121: SPECIAL [detachable ET_TYPE_CONSTRAINT]
			-- Stack for semantic values of type detachable ET_TYPE_CONSTRAINT

	yyvsc121: INTEGER
			-- Capacity of semantic value stack `yyvs121'

	yyvsp121: INTEGER
			-- Top of semantic value stack `yyvs121'

	yyspecial_routines121: KL_SPECIAL_ROUTINES [detachable ET_TYPE_CONSTRAINT]
			-- Routines that ought to be in SPECIAL [detachable ET_TYPE_CONSTRAINT]

	yyvs122: SPECIAL [detachable ET_TYPE_CONSTRAINT_ITEM]
			-- Stack for semantic values of type detachable ET_TYPE_CONSTRAINT_ITEM

	yyvsc122: INTEGER
			-- Capacity of semantic value stack `yyvs122'

	yyvsp122: INTEGER
			-- Top of semantic value stack `yyvs122'

	yyspecial_routines122: KL_SPECIAL_ROUTINES [detachable ET_TYPE_CONSTRAINT_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_TYPE_CONSTRAINT_ITEM]

	yyvs123: SPECIAL [detachable ET_TYPE_CONSTRAINT_LIST]
			-- Stack for semantic values of type detachable ET_TYPE_CONSTRAINT_LIST

	yyvsc123: INTEGER
			-- Capacity of semantic value stack `yyvs123'

	yyvsp123: INTEGER
			-- Top of semantic value stack `yyvs123'

	yyspecial_routines123: KL_SPECIAL_ROUTINES [detachable ET_TYPE_CONSTRAINT_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_TYPE_CONSTRAINT_LIST]

	yyvs124: SPECIAL [detachable ET_TYPE_ITEM]
			-- Stack for semantic values of type detachable ET_TYPE_ITEM

	yyvsc124: INTEGER
			-- Capacity of semantic value stack `yyvs124'

	yyvsp124: INTEGER
			-- Top of semantic value stack `yyvs124'

	yyspecial_routines124: KL_SPECIAL_ROUTINES [detachable ET_TYPE_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_TYPE_ITEM]

	yyvs125: SPECIAL [detachable ET_TYPE_LIST]
			-- Stack for semantic values of type detachable ET_TYPE_LIST

	yyvsc125: INTEGER
			-- Capacity of semantic value stack `yyvs125'

	yyvsp125: INTEGER
			-- Top of semantic value stack `yyvs125'

	yyspecial_routines125: KL_SPECIAL_ROUTINES [detachable ET_TYPE_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_TYPE_LIST]

	yyvs126: SPECIAL [detachable ET_VARIANT]
			-- Stack for semantic values of type detachable ET_VARIANT

	yyvsc126: INTEGER
			-- Capacity of semantic value stack `yyvs126'

	yyvsp126: INTEGER
			-- Top of semantic value stack `yyvs126'

	yyspecial_routines126: KL_SPECIAL_ROUTINES [detachable ET_VARIANT]
			-- Routines that ought to be in SPECIAL [detachable ET_VARIANT]

	yyvs127: SPECIAL [detachable ET_WHEN_PART]
			-- Stack for semantic values of type detachable ET_WHEN_PART

	yyvsc127: INTEGER
			-- Capacity of semantic value stack `yyvs127'

	yyvsp127: INTEGER
			-- Top of semantic value stack `yyvs127'

	yyspecial_routines127: KL_SPECIAL_ROUTINES [detachable ET_WHEN_PART]
			-- Routines that ought to be in SPECIAL [detachable ET_WHEN_PART]

	yyvs128: SPECIAL [detachable ET_WHEN_PART_LIST]
			-- Stack for semantic values of type detachable ET_WHEN_PART_LIST

	yyvsc128: INTEGER
			-- Capacity of semantic value stack `yyvs128'

	yyvsp128: INTEGER
			-- Top of semantic value stack `yyvs128'

	yyspecial_routines128: KL_SPECIAL_ROUTINES [detachable ET_WHEN_PART_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_WHEN_PART_LIST]

	yyvs129: SPECIAL [detachable ET_WRITABLE]
			-- Stack for semantic values of type detachable ET_WRITABLE

	yyvsc129: INTEGER
			-- Capacity of semantic value stack `yyvs129'

	yyvsp129: INTEGER
			-- Top of semantic value stack `yyvs129'

	yyspecial_routines129: KL_SPECIAL_ROUTINES [detachable ET_WRITABLE]
			-- Routines that ought to be in SPECIAL [detachable ET_WRITABLE]

feature {NONE} -- Constants

	yyFinal: INTEGER = 1741
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 144
			-- Number of tokens

	yyLast: INTEGER = 7236
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 376
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 448
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Access

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

end
