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
					--|#line 241 "et_eiffel_parser.y"
				yy_do_action_1
			when 2 then
					--|#line 245 "et_eiffel_parser.y"
				yy_do_action_2
			when 3 then
					--|#line 253 "et_eiffel_parser.y"
				yy_do_action_3
			when 4 then
					--|#line 262 "et_eiffel_parser.y"
				yy_do_action_4
			when 5 then
					--|#line 263 "et_eiffel_parser.y"
				yy_do_action_5
			when 6 then
					--|#line 263 "et_eiffel_parser.y"
				yy_do_action_6
			when 7 then
					--|#line 274 "et_eiffel_parser.y"
				yy_do_action_7
			when 8 then
					--|#line 282 "et_eiffel_parser.y"
				yy_do_action_8
			when 9 then
					--|#line 287 "et_eiffel_parser.y"
				yy_do_action_9
			when 10 then
					--|#line 289 "et_eiffel_parser.y"
				yy_do_action_10
			when 11 then
					--|#line 289 "et_eiffel_parser.y"
				yy_do_action_11
			when 12 then
					--|#line 300 "et_eiffel_parser.y"
				yy_do_action_12
			when 13 then
					--|#line 302 "et_eiffel_parser.y"
				yy_do_action_13
			when 14 then
					--|#line 302 "et_eiffel_parser.y"
				yy_do_action_14
			when 15 then
					--|#line 315 "et_eiffel_parser.y"
				yy_do_action_15
			when 16 then
					--|#line 317 "et_eiffel_parser.y"
				yy_do_action_16
			when 17 then
					--|#line 321 "et_eiffel_parser.y"
				yy_do_action_17
			when 18 then
					--|#line 332 "et_eiffel_parser.y"
				yy_do_action_18
			when 19 then
					--|#line 332 "et_eiffel_parser.y"
				yy_do_action_19
			when 20 then
					--|#line 341 "et_eiffel_parser.y"
				yy_do_action_20
			when 21 then
					--|#line 341 "et_eiffel_parser.y"
				yy_do_action_21
			when 22 then
					--|#line 352 "et_eiffel_parser.y"
				yy_do_action_22
			when 23 then
					--|#line 359 "et_eiffel_parser.y"
				yy_do_action_23
			when 24 then
					--|#line 365 "et_eiffel_parser.y"
				yy_do_action_24
			when 25 then
					--|#line 369 "et_eiffel_parser.y"
				yy_do_action_25
			when 26 then
					--|#line 380 "et_eiffel_parser.y"
				yy_do_action_26
			when 27 then
					--|#line 392 "et_eiffel_parser.y"
				yy_do_action_27
			when 28 then
					--|#line 392 "et_eiffel_parser.y"
				yy_do_action_28
			when 29 then
					--|#line 401 "et_eiffel_parser.y"
				yy_do_action_29
			when 30 then
					--|#line 401 "et_eiffel_parser.y"
				yy_do_action_30
			when 31 then
					--|#line 412 "et_eiffel_parser.y"
				yy_do_action_31
			when 32 then
					--|#line 419 "et_eiffel_parser.y"
				yy_do_action_32
			when 33 then
					--|#line 423 "et_eiffel_parser.y"
				yy_do_action_33
			when 34 then
					--|#line 429 "et_eiffel_parser.y"
				yy_do_action_34
			when 35 then
					--|#line 431 "et_eiffel_parser.y"
				yy_do_action_35
			when 36 then
					--|#line 436 "et_eiffel_parser.y"
				yy_do_action_36
			when 37 then
					--|#line 447 "et_eiffel_parser.y"
				yy_do_action_37
			when 38 then
					--|#line 456 "et_eiffel_parser.y"
				yy_do_action_38
			when 39 then
					--|#line 458 "et_eiffel_parser.y"
				yy_do_action_39
			when 40 then
					--|#line 460 "et_eiffel_parser.y"
				yy_do_action_40
			when 41 then
					--|#line 462 "et_eiffel_parser.y"
				yy_do_action_41
			when 42 then
					--|#line 464 "et_eiffel_parser.y"
				yy_do_action_42
			when 43 then
					--|#line 466 "et_eiffel_parser.y"
				yy_do_action_43
			when 44 then
					--|#line 468 "et_eiffel_parser.y"
				yy_do_action_44
			when 45 then
					--|#line 470 "et_eiffel_parser.y"
				yy_do_action_45
			when 46 then
					--|#line 474 "et_eiffel_parser.y"
				yy_do_action_46
			when 47 then
					--|#line 485 "et_eiffel_parser.y"
				yy_do_action_47
			when 48 then
					--|#line 497 "et_eiffel_parser.y"
				yy_do_action_48
			when 49 then
					--|#line 510 "et_eiffel_parser.y"
				yy_do_action_49
			when 50 then
					--|#line 523 "et_eiffel_parser.y"
				yy_do_action_50
			when 51 then
					--|#line 538 "et_eiffel_parser.y"
				yy_do_action_51
			when 52 then
					--|#line 540 "et_eiffel_parser.y"
				yy_do_action_52
			when 53 then
					--|#line 544 "et_eiffel_parser.y"
				yy_do_action_53
			when 54 then
					--|#line 546 "et_eiffel_parser.y"
				yy_do_action_54
			when 55 then
					--|#line 552 "et_eiffel_parser.y"
				yy_do_action_55
			when 56 then
					--|#line 556 "et_eiffel_parser.y"
				yy_do_action_56
			when 57 then
					--|#line 562 "et_eiffel_parser.y"
				yy_do_action_57
			when 58 then
					--|#line 562 "et_eiffel_parser.y"
				yy_do_action_58
			when 59 then
					--|#line 576 "et_eiffel_parser.y"
				yy_do_action_59
			when 60 then
					--|#line 587 "et_eiffel_parser.y"
				yy_do_action_60
			when 61 then
					--|#line 596 "et_eiffel_parser.y"
				yy_do_action_61
			when 62 then
					--|#line 605 "et_eiffel_parser.y"
				yy_do_action_62
			when 63 then
					--|#line 607 "et_eiffel_parser.y"
				yy_do_action_63
			when 64 then
					--|#line 609 "et_eiffel_parser.y"
				yy_do_action_64
			when 65 then
					--|#line 611 "et_eiffel_parser.y"
				yy_do_action_65
			when 66 then
					--|#line 613 "et_eiffel_parser.y"
				yy_do_action_66
			when 67 then
					--|#line 615 "et_eiffel_parser.y"
				yy_do_action_67
			when 68 then
					--|#line 617 "et_eiffel_parser.y"
				yy_do_action_68
			when 69 then
					--|#line 619 "et_eiffel_parser.y"
				yy_do_action_69
			when 70 then
					--|#line 621 "et_eiffel_parser.y"
				yy_do_action_70
			when 71 then
					--|#line 625 "et_eiffel_parser.y"
				yy_do_action_71
			when 72 then
					--|#line 632 "et_eiffel_parser.y"
				yy_do_action_72
			when 73 then
					--|#line 641 "et_eiffel_parser.y"
				yy_do_action_73
			when 74 then
					--|#line 641 "et_eiffel_parser.y"
				yy_do_action_74
			when 75 then
					--|#line 654 "et_eiffel_parser.y"
				yy_do_action_75
			when 76 then
					--|#line 665 "et_eiffel_parser.y"
				yy_do_action_76
			when 77 then
					--|#line 674 "et_eiffel_parser.y"
				yy_do_action_77
			when 78 then
					--|#line 683 "et_eiffel_parser.y"
				yy_do_action_78
			when 79 then
					--|#line 685 "et_eiffel_parser.y"
				yy_do_action_79
			when 80 then
					--|#line 685 "et_eiffel_parser.y"
				yy_do_action_80
			when 81 then
					--|#line 698 "et_eiffel_parser.y"
				yy_do_action_81
			when 82 then
					--|#line 709 "et_eiffel_parser.y"
				yy_do_action_82
			when 83 then
					--|#line 718 "et_eiffel_parser.y"
				yy_do_action_83
			when 84 then
					--|#line 727 "et_eiffel_parser.y"
				yy_do_action_84
			when 85 then
					--|#line 729 "et_eiffel_parser.y"
				yy_do_action_85
			when 86 then
					--|#line 733 "et_eiffel_parser.y"
				yy_do_action_86
			when 87 then
					--|#line 735 "et_eiffel_parser.y"
				yy_do_action_87
			when 88 then
					--|#line 735 "et_eiffel_parser.y"
				yy_do_action_88
			when 89 then
					--|#line 748 "et_eiffel_parser.y"
				yy_do_action_89
			when 90 then
					--|#line 760 "et_eiffel_parser.y"
				yy_do_action_90
			when 91 then
					--|#line 768 "et_eiffel_parser.y"
				yy_do_action_91
			when 92 then
					--|#line 777 "et_eiffel_parser.y"
				yy_do_action_92
			when 93 then
					--|#line 779 "et_eiffel_parser.y"
				yy_do_action_93
			when 94 then
					--|#line 781 "et_eiffel_parser.y"
				yy_do_action_94
			when 95 then
					--|#line 783 "et_eiffel_parser.y"
				yy_do_action_95
			when 96 then
					--|#line 785 "et_eiffel_parser.y"
				yy_do_action_96
			when 97 then
					--|#line 787 "et_eiffel_parser.y"
				yy_do_action_97
			when 98 then
					--|#line 789 "et_eiffel_parser.y"
				yy_do_action_98
			when 99 then
					--|#line 791 "et_eiffel_parser.y"
				yy_do_action_99
			when 100 then
					--|#line 793 "et_eiffel_parser.y"
				yy_do_action_100
			when 101 then
					--|#line 795 "et_eiffel_parser.y"
				yy_do_action_101
			when 102 then
					--|#line 797 "et_eiffel_parser.y"
				yy_do_action_102
			when 103 then
					--|#line 799 "et_eiffel_parser.y"
				yy_do_action_103
			when 104 then
					--|#line 801 "et_eiffel_parser.y"
				yy_do_action_104
			when 105 then
					--|#line 803 "et_eiffel_parser.y"
				yy_do_action_105
			when 106 then
					--|#line 805 "et_eiffel_parser.y"
				yy_do_action_106
			when 107 then
					--|#line 807 "et_eiffel_parser.y"
				yy_do_action_107
			when 108 then
					--|#line 809 "et_eiffel_parser.y"
				yy_do_action_108
			when 109 then
					--|#line 811 "et_eiffel_parser.y"
				yy_do_action_109
			when 110 then
					--|#line 813 "et_eiffel_parser.y"
				yy_do_action_110
			when 111 then
					--|#line 815 "et_eiffel_parser.y"
				yy_do_action_111
			when 112 then
					--|#line 817 "et_eiffel_parser.y"
				yy_do_action_112
			when 113 then
					--|#line 819 "et_eiffel_parser.y"
				yy_do_action_113
			when 114 then
					--|#line 823 "et_eiffel_parser.y"
				yy_do_action_114
			when 115 then
					--|#line 825 "et_eiffel_parser.y"
				yy_do_action_115
			when 116 then
					--|#line 827 "et_eiffel_parser.y"
				yy_do_action_116
			when 117 then
					--|#line 829 "et_eiffel_parser.y"
				yy_do_action_117
			when 118 then
					--|#line 831 "et_eiffel_parser.y"
				yy_do_action_118
			when 119 then
					--|#line 833 "et_eiffel_parser.y"
				yy_do_action_119
			when 120 then
					--|#line 835 "et_eiffel_parser.y"
				yy_do_action_120
			when 121 then
					--|#line 837 "et_eiffel_parser.y"
				yy_do_action_121
			when 122 then
					--|#line 839 "et_eiffel_parser.y"
				yy_do_action_122
			when 123 then
					--|#line 841 "et_eiffel_parser.y"
				yy_do_action_123
			when 124 then
					--|#line 843 "et_eiffel_parser.y"
				yy_do_action_124
			when 125 then
					--|#line 845 "et_eiffel_parser.y"
				yy_do_action_125
			when 126 then
					--|#line 847 "et_eiffel_parser.y"
				yy_do_action_126
			when 127 then
					--|#line 849 "et_eiffel_parser.y"
				yy_do_action_127
			when 128 then
					--|#line 851 "et_eiffel_parser.y"
				yy_do_action_128
			when 129 then
					--|#line 853 "et_eiffel_parser.y"
				yy_do_action_129
			when 130 then
					--|#line 855 "et_eiffel_parser.y"
				yy_do_action_130
			when 131 then
					--|#line 857 "et_eiffel_parser.y"
				yy_do_action_131
			when 132 then
					--|#line 859 "et_eiffel_parser.y"
				yy_do_action_132
			when 133 then
					--|#line 861 "et_eiffel_parser.y"
				yy_do_action_133
			when 134 then
					--|#line 863 "et_eiffel_parser.y"
				yy_do_action_134
			when 135 then
					--|#line 865 "et_eiffel_parser.y"
				yy_do_action_135
			when 136 then
					--|#line 869 "et_eiffel_parser.y"
				yy_do_action_136
			when 137 then
					--|#line 871 "et_eiffel_parser.y"
				yy_do_action_137
			when 138 then
					--|#line 875 "et_eiffel_parser.y"
				yy_do_action_138
			when 139 then
					--|#line 878 "et_eiffel_parser.y"
				yy_do_action_139
			when 140 then
					--|#line 886 "et_eiffel_parser.y"
				yy_do_action_140
			when 141 then
					--|#line 897 "et_eiffel_parser.y"
				yy_do_action_141
			when 142 then
					--|#line 902 "et_eiffel_parser.y"
				yy_do_action_142
			when 143 then
					--|#line 909 "et_eiffel_parser.y"
				yy_do_action_143
			when 144 then
					--|#line 918 "et_eiffel_parser.y"
				yy_do_action_144
			when 145 then
					--|#line 920 "et_eiffel_parser.y"
				yy_do_action_145
			when 146 then
					--|#line 924 "et_eiffel_parser.y"
				yy_do_action_146
			when 147 then
					--|#line 927 "et_eiffel_parser.y"
				yy_do_action_147
			when 148 then
					--|#line 933 "et_eiffel_parser.y"
				yy_do_action_148
			when 149 then
					--|#line 941 "et_eiffel_parser.y"
				yy_do_action_149
			when 150 then
					--|#line 946 "et_eiffel_parser.y"
				yy_do_action_150
			when 151 then
					--|#line 951 "et_eiffel_parser.y"
				yy_do_action_151
			when 152 then
					--|#line 956 "et_eiffel_parser.y"
				yy_do_action_152
			when 153 then
					--|#line 969 "et_eiffel_parser.y"
				yy_do_action_153
			when 154 then
					--|#line 978 "et_eiffel_parser.y"
				yy_do_action_154
			when 155 then
					--|#line 989 "et_eiffel_parser.y"
				yy_do_action_155
			when 156 then
					--|#line 991 "et_eiffel_parser.y"
				yy_do_action_156
			when 157 then
					--|#line 997 "et_eiffel_parser.y"
				yy_do_action_157
			when 158 then
					--|#line 999 "et_eiffel_parser.y"
				yy_do_action_158
			when 159 then
					--|#line 1006 "et_eiffel_parser.y"
				yy_do_action_159
			when 160 then
					--|#line 1017 "et_eiffel_parser.y"
				yy_do_action_160
			when 161 then
					--|#line 1017 "et_eiffel_parser.y"
				yy_do_action_161
			when 162 then
					--|#line 1032 "et_eiffel_parser.y"
				yy_do_action_162
			when 163 then
					--|#line 1039 "et_eiffel_parser.y"
				yy_do_action_163
			when 164 then
					--|#line 1039 "et_eiffel_parser.y"
				yy_do_action_164
			when 165 then
					--|#line 1055 "et_eiffel_parser.y"
				yy_do_action_165
			when 166 then
					--|#line 1062 "et_eiffel_parser.y"
				yy_do_action_166
			when 167 then
					--|#line 1070 "et_eiffel_parser.y"
				yy_do_action_167
			when 168 then
					--|#line 1077 "et_eiffel_parser.y"
				yy_do_action_168
			when 169 then
					--|#line 1084 "et_eiffel_parser.y"
				yy_do_action_169
			when 170 then
					--|#line 1091 "et_eiffel_parser.y"
				yy_do_action_170
			when 171 then
					--|#line 1100 "et_eiffel_parser.y"
				yy_do_action_171
			when 172 then
					--|#line 1107 "et_eiffel_parser.y"
				yy_do_action_172
			when 173 then
					--|#line 1114 "et_eiffel_parser.y"
				yy_do_action_173
			when 174 then
					--|#line 1121 "et_eiffel_parser.y"
				yy_do_action_174
			when 175 then
					--|#line 1130 "et_eiffel_parser.y"
				yy_do_action_175
			when 176 then
					--|#line 1141 "et_eiffel_parser.y"
				yy_do_action_176
			when 177 then
					--|#line 1143 "et_eiffel_parser.y"
				yy_do_action_177
			when 178 then
					--|#line 1143 "et_eiffel_parser.y"
				yy_do_action_178
			when 179 then
					--|#line 1156 "et_eiffel_parser.y"
				yy_do_action_179
			when 180 then
					--|#line 1163 "et_eiffel_parser.y"
				yy_do_action_180
			when 181 then
					--|#line 1172 "et_eiffel_parser.y"
				yy_do_action_181
			when 182 then
					--|#line 1181 "et_eiffel_parser.y"
				yy_do_action_182
			when 183 then
					--|#line 1190 "et_eiffel_parser.y"
				yy_do_action_183
			when 184 then
					--|#line 1201 "et_eiffel_parser.y"
				yy_do_action_184
			when 185 then
					--|#line 1203 "et_eiffel_parser.y"
				yy_do_action_185
			when 186 then
					--|#line 1203 "et_eiffel_parser.y"
				yy_do_action_186
			when 187 then
					--|#line 1216 "et_eiffel_parser.y"
				yy_do_action_187
			when 188 then
					--|#line 1218 "et_eiffel_parser.y"
				yy_do_action_188
			when 189 then
					--|#line 1222 "et_eiffel_parser.y"
				yy_do_action_189
			when 190 then
					--|#line 1233 "et_eiffel_parser.y"
				yy_do_action_190
			when 191 then
					--|#line 1233 "et_eiffel_parser.y"
				yy_do_action_191
			when 192 then
					--|#line 1248 "et_eiffel_parser.y"
				yy_do_action_192
			when 193 then
					--|#line 1252 "et_eiffel_parser.y"
				yy_do_action_193
			when 194 then
					--|#line 1257 "et_eiffel_parser.y"
				yy_do_action_194
			when 195 then
					--|#line 1257 "et_eiffel_parser.y"
				yy_do_action_195
			when 196 then
					--|#line 1267 "et_eiffel_parser.y"
				yy_do_action_196
			when 197 then
					--|#line 1271 "et_eiffel_parser.y"
				yy_do_action_197
			when 198 then
					--|#line 1282 "et_eiffel_parser.y"
				yy_do_action_198
			when 199 then
					--|#line 1290 "et_eiffel_parser.y"
				yy_do_action_199
			when 200 then
					--|#line 1301 "et_eiffel_parser.y"
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
					--|#line 1301 "et_eiffel_parser.y"
				yy_do_action_201
			when 202 then
					--|#line 1312 "et_eiffel_parser.y"
				yy_do_action_202
			when 203 then
					--|#line 1316 "et_eiffel_parser.y"
				yy_do_action_203
			when 204 then
					--|#line 1323 "et_eiffel_parser.y"
				yy_do_action_204
			when 205 then
					--|#line 1331 "et_eiffel_parser.y"
				yy_do_action_205
			when 206 then
					--|#line 1338 "et_eiffel_parser.y"
				yy_do_action_206
			when 207 then
					--|#line 1348 "et_eiffel_parser.y"
				yy_do_action_207
			when 208 then
					--|#line 1357 "et_eiffel_parser.y"
				yy_do_action_208
			when 209 then
					--|#line 1367 "et_eiffel_parser.y"
				yy_do_action_209
			when 210 then
					--|#line 1369 "et_eiffel_parser.y"
				yy_do_action_210
			when 211 then
					--|#line 1373 "et_eiffel_parser.y"
				yy_do_action_211
			when 212 then
					--|#line 1384 "et_eiffel_parser.y"
				yy_do_action_212
			when 213 then
					--|#line 1386 "et_eiffel_parser.y"
				yy_do_action_213
			when 214 then
					--|#line 1386 "et_eiffel_parser.y"
				yy_do_action_214
			when 215 then
					--|#line 1399 "et_eiffel_parser.y"
				yy_do_action_215
			when 216 then
					--|#line 1401 "et_eiffel_parser.y"
				yy_do_action_216
			when 217 then
					--|#line 1405 "et_eiffel_parser.y"
				yy_do_action_217
			when 218 then
					--|#line 1407 "et_eiffel_parser.y"
				yy_do_action_218
			when 219 then
					--|#line 1407 "et_eiffel_parser.y"
				yy_do_action_219
			when 220 then
					--|#line 1420 "et_eiffel_parser.y"
				yy_do_action_220
			when 221 then
					--|#line 1422 "et_eiffel_parser.y"
				yy_do_action_221
			when 222 then
					--|#line 1426 "et_eiffel_parser.y"
				yy_do_action_222
			when 223 then
					--|#line 1428 "et_eiffel_parser.y"
				yy_do_action_223
			when 224 then
					--|#line 1428 "et_eiffel_parser.y"
				yy_do_action_224
			when 225 then
					--|#line 1441 "et_eiffel_parser.y"
				yy_do_action_225
			when 226 then
					--|#line 1443 "et_eiffel_parser.y"
				yy_do_action_226
			when 227 then
					--|#line 1447 "et_eiffel_parser.y"
				yy_do_action_227
			when 228 then
					--|#line 1458 "et_eiffel_parser.y"
				yy_do_action_228
			when 229 then
					--|#line 1466 "et_eiffel_parser.y"
				yy_do_action_229
			when 230 then
					--|#line 1475 "et_eiffel_parser.y"
				yy_do_action_230
			when 231 then
					--|#line 1486 "et_eiffel_parser.y"
				yy_do_action_231
			when 232 then
					--|#line 1488 "et_eiffel_parser.y"
				yy_do_action_232
			when 233 then
					--|#line 1495 "et_eiffel_parser.y"
				yy_do_action_233
			when 234 then
					--|#line 1506 "et_eiffel_parser.y"
				yy_do_action_234
			when 235 then
					--|#line 1506 "et_eiffel_parser.y"
				yy_do_action_235
			when 236 then
					--|#line 1521 "et_eiffel_parser.y"
				yy_do_action_236
			when 237 then
					--|#line 1523 "et_eiffel_parser.y"
				yy_do_action_237
			when 238 then
					--|#line 1525 "et_eiffel_parser.y"
				yy_do_action_238
			when 239 then
					--|#line 1525 "et_eiffel_parser.y"
				yy_do_action_239
			when 240 then
					--|#line 1537 "et_eiffel_parser.y"
				yy_do_action_240
			when 241 then
					--|#line 1537 "et_eiffel_parser.y"
				yy_do_action_241
			when 242 then
					--|#line 1549 "et_eiffel_parser.y"
				yy_do_action_242
			when 243 then
					--|#line 1551 "et_eiffel_parser.y"
				yy_do_action_243
			when 244 then
					--|#line 1553 "et_eiffel_parser.y"
				yy_do_action_244
			when 245 then
					--|#line 1553 "et_eiffel_parser.y"
				yy_do_action_245
			when 246 then
					--|#line 1565 "et_eiffel_parser.y"
				yy_do_action_246
			when 247 then
					--|#line 1565 "et_eiffel_parser.y"
				yy_do_action_247
			when 248 then
					--|#line 1579 "et_eiffel_parser.y"
				yy_do_action_248
			when 249 then
					--|#line 1591 "et_eiffel_parser.y"
				yy_do_action_249
			when 250 then
					--|#line 1603 "et_eiffel_parser.y"
				yy_do_action_250
			when 251 then
					--|#line 1612 "et_eiffel_parser.y"
				yy_do_action_251
			when 252 then
					--|#line 1628 "et_eiffel_parser.y"
				yy_do_action_252
			when 253 then
					--|#line 1630 "et_eiffel_parser.y"
				yy_do_action_253
			when 254 then
					--|#line 1634 "et_eiffel_parser.y"
				yy_do_action_254
			when 255 then
					--|#line 1634 "et_eiffel_parser.y"
				yy_do_action_255
			when 256 then
					--|#line 1647 "et_eiffel_parser.y"
				yy_do_action_256
			when 257 then
					--|#line 1654 "et_eiffel_parser.y"
				yy_do_action_257
			when 258 then
					--|#line 1661 "et_eiffel_parser.y"
				yy_do_action_258
			when 259 then
					--|#line 1670 "et_eiffel_parser.y"
				yy_do_action_259
			when 260 then
					--|#line 1679 "et_eiffel_parser.y"
				yy_do_action_260
			when 261 then
					--|#line 1683 "et_eiffel_parser.y"
				yy_do_action_261
			when 262 then
					--|#line 1689 "et_eiffel_parser.y"
				yy_do_action_262
			when 263 then
					--|#line 1691 "et_eiffel_parser.y"
				yy_do_action_263
			when 264 then
					--|#line 1691 "et_eiffel_parser.y"
				yy_do_action_264
			when 265 then
					--|#line 1704 "et_eiffel_parser.y"
				yy_do_action_265
			when 266 then
					--|#line 1715 "et_eiffel_parser.y"
				yy_do_action_266
			when 267 then
					--|#line 1724 "et_eiffel_parser.y"
				yy_do_action_267
			when 268 then
					--|#line 1735 "et_eiffel_parser.y"
				yy_do_action_268
			when 269 then
					--|#line 1740 "et_eiffel_parser.y"
				yy_do_action_269
			when 270 then
					--|#line 1744 "et_eiffel_parser.y"
				yy_do_action_270
			when 271 then
					--|#line 1752 "et_eiffel_parser.y"
				yy_do_action_271
			when 272 then
					--|#line 1759 "et_eiffel_parser.y"
				yy_do_action_272
			when 273 then
					--|#line 1768 "et_eiffel_parser.y"
				yy_do_action_273
			when 274 then
					--|#line 1775 "et_eiffel_parser.y"
				yy_do_action_274
			when 275 then
					--|#line 1784 "et_eiffel_parser.y"
				yy_do_action_275
			when 276 then
					--|#line 1789 "et_eiffel_parser.y"
				yy_do_action_276
			when 277 then
					--|#line 1796 "et_eiffel_parser.y"
				yy_do_action_277
			when 278 then
					--|#line 1797 "et_eiffel_parser.y"
				yy_do_action_278
			when 279 then
					--|#line 1798 "et_eiffel_parser.y"
				yy_do_action_279
			when 280 then
					--|#line 1799 "et_eiffel_parser.y"
				yy_do_action_280
			when 281 then
					--|#line 1804 "et_eiffel_parser.y"
				yy_do_action_281
			when 282 then
					--|#line 1809 "et_eiffel_parser.y"
				yy_do_action_282
			when 283 then
					--|#line 1817 "et_eiffel_parser.y"
				yy_do_action_283
			when 284 then
					--|#line 1822 "et_eiffel_parser.y"
				yy_do_action_284
			when 285 then
					--|#line 1828 "et_eiffel_parser.y"
				yy_do_action_285
			when 286 then
					--|#line 1836 "et_eiffel_parser.y"
				yy_do_action_286
			when 287 then
					--|#line 1847 "et_eiffel_parser.y"
				yy_do_action_287
			when 288 then
					--|#line 1852 "et_eiffel_parser.y"
				yy_do_action_288
			when 289 then
					--|#line 1860 "et_eiffel_parser.y"
				yy_do_action_289
			when 290 then
					--|#line 1865 "et_eiffel_parser.y"
				yy_do_action_290
			when 291 then
					--|#line 1871 "et_eiffel_parser.y"
				yy_do_action_291
			when 292 then
					--|#line 1879 "et_eiffel_parser.y"
				yy_do_action_292
			when 293 then
					--|#line 1890 "et_eiffel_parser.y"
				yy_do_action_293
			when 294 then
					--|#line 1892 "et_eiffel_parser.y"
				yy_do_action_294
			when 295 then
					--|#line 1894 "et_eiffel_parser.y"
				yy_do_action_295
			when 296 then
					--|#line 1898 "et_eiffel_parser.y"
				yy_do_action_296
			when 297 then
					--|#line 1900 "et_eiffel_parser.y"
				yy_do_action_297
			when 298 then
					--|#line 1908 "et_eiffel_parser.y"
				yy_do_action_298
			when 299 then
					--|#line 1910 "et_eiffel_parser.y"
				yy_do_action_299
			when 300 then
					--|#line 1918 "et_eiffel_parser.y"
				yy_do_action_300
			when 301 then
					--|#line 1921 "et_eiffel_parser.y"
				yy_do_action_301
			when 302 then
					--|#line 1930 "et_eiffel_parser.y"
				yy_do_action_302
			when 303 then
					--|#line 1934 "et_eiffel_parser.y"
				yy_do_action_303
			when 304 then
					--|#line 1944 "et_eiffel_parser.y"
				yy_do_action_304
			when 305 then
					--|#line 1947 "et_eiffel_parser.y"
				yy_do_action_305
			when 306 then
					--|#line 1956 "et_eiffel_parser.y"
				yy_do_action_306
			when 307 then
					--|#line 1960 "et_eiffel_parser.y"
				yy_do_action_307
			when 308 then
					--|#line 1970 "et_eiffel_parser.y"
				yy_do_action_308
			when 309 then
					--|#line 1972 "et_eiffel_parser.y"
				yy_do_action_309
			when 310 then
					--|#line 1980 "et_eiffel_parser.y"
				yy_do_action_310
			when 311 then
					--|#line 1983 "et_eiffel_parser.y"
				yy_do_action_311
			when 312 then
					--|#line 1992 "et_eiffel_parser.y"
				yy_do_action_312
			when 313 then
					--|#line 1995 "et_eiffel_parser.y"
				yy_do_action_313
			when 314 then
					--|#line 2004 "et_eiffel_parser.y"
				yy_do_action_314
			when 315 then
					--|#line 2008 "et_eiffel_parser.y"
				yy_do_action_315
			when 316 then
					--|#line 2020 "et_eiffel_parser.y"
				yy_do_action_316
			when 317 then
					--|#line 2023 "et_eiffel_parser.y"
				yy_do_action_317
			when 318 then
					--|#line 2027 "et_eiffel_parser.y"
				yy_do_action_318
			when 319 then
					--|#line 2030 "et_eiffel_parser.y"
				yy_do_action_319
			when 320 then
					--|#line 2034 "et_eiffel_parser.y"
				yy_do_action_320
			when 321 then
					--|#line 2036 "et_eiffel_parser.y"
				yy_do_action_321
			when 322 then
					--|#line 2039 "et_eiffel_parser.y"
				yy_do_action_322
			when 323 then
					--|#line 2042 "et_eiffel_parser.y"
				yy_do_action_323
			when 324 then
					--|#line 2048 "et_eiffel_parser.y"
				yy_do_action_324
			when 325 then
					--|#line 2056 "et_eiffel_parser.y"
				yy_do_action_325
			when 326 then
					--|#line 2060 "et_eiffel_parser.y"
				yy_do_action_326
			when 327 then
					--|#line 2062 "et_eiffel_parser.y"
				yy_do_action_327
			when 328 then
					--|#line 2066 "et_eiffel_parser.y"
				yy_do_action_328
			when 329 then
					--|#line 2068 "et_eiffel_parser.y"
				yy_do_action_329
			when 330 then
					--|#line 2072 "et_eiffel_parser.y"
				yy_do_action_330
			when 331 then
					--|#line 2074 "et_eiffel_parser.y"
				yy_do_action_331
			when 332 then
					--|#line 2080 "et_eiffel_parser.y"
				yy_do_action_332
			when 333 then
					--|#line 2089 "et_eiffel_parser.y"
				yy_do_action_333
			when 334 then
					--|#line 2091 "et_eiffel_parser.y"
				yy_do_action_334
			when 335 then
					--|#line 2103 "et_eiffel_parser.y"
				yy_do_action_335
			when 336 then
					--|#line 2114 "et_eiffel_parser.y"
				yy_do_action_336
			when 337 then
					--|#line 2114 "et_eiffel_parser.y"
				yy_do_action_337
			when 338 then
					--|#line 2129 "et_eiffel_parser.y"
				yy_do_action_338
			when 339 then
					--|#line 2131 "et_eiffel_parser.y"
				yy_do_action_339
			when 340 then
					--|#line 2133 "et_eiffel_parser.y"
				yy_do_action_340
			when 341 then
					--|#line 2135 "et_eiffel_parser.y"
				yy_do_action_341
			when 342 then
					--|#line 2137 "et_eiffel_parser.y"
				yy_do_action_342
			when 343 then
					--|#line 2139 "et_eiffel_parser.y"
				yy_do_action_343
			when 344 then
					--|#line 2141 "et_eiffel_parser.y"
				yy_do_action_344
			when 345 then
					--|#line 2143 "et_eiffel_parser.y"
				yy_do_action_345
			when 346 then
					--|#line 2145 "et_eiffel_parser.y"
				yy_do_action_346
			when 347 then
					--|#line 2147 "et_eiffel_parser.y"
				yy_do_action_347
			when 348 then
					--|#line 2149 "et_eiffel_parser.y"
				yy_do_action_348
			when 349 then
					--|#line 2151 "et_eiffel_parser.y"
				yy_do_action_349
			when 350 then
					--|#line 2153 "et_eiffel_parser.y"
				yy_do_action_350
			when 351 then
					--|#line 2155 "et_eiffel_parser.y"
				yy_do_action_351
			when 352 then
					--|#line 2157 "et_eiffel_parser.y"
				yy_do_action_352
			when 353 then
					--|#line 2159 "et_eiffel_parser.y"
				yy_do_action_353
			when 354 then
					--|#line 2161 "et_eiffel_parser.y"
				yy_do_action_354
			when 355 then
					--|#line 2163 "et_eiffel_parser.y"
				yy_do_action_355
			when 356 then
					--|#line 2165 "et_eiffel_parser.y"
				yy_do_action_356
			when 357 then
					--|#line 2167 "et_eiffel_parser.y"
				yy_do_action_357
			when 358 then
					--|#line 2169 "et_eiffel_parser.y"
				yy_do_action_358
			when 359 then
					--|#line 2171 "et_eiffel_parser.y"
				yy_do_action_359
			when 360 then
					--|#line 2173 "et_eiffel_parser.y"
				yy_do_action_360
			when 361 then
					--|#line 2177 "et_eiffel_parser.y"
				yy_do_action_361
			when 362 then
					--|#line 2179 "et_eiffel_parser.y"
				yy_do_action_362
			when 363 then
					--|#line 2185 "et_eiffel_parser.y"
				yy_do_action_363
			when 364 then
					--|#line 2192 "et_eiffel_parser.y"
				yy_do_action_364
			when 365 then
					--|#line 2194 "et_eiffel_parser.y"
				yy_do_action_365
			when 366 then
					--|#line 2202 "et_eiffel_parser.y"
				yy_do_action_366
			when 367 then
					--|#line 2213 "et_eiffel_parser.y"
				yy_do_action_367
			when 368 then
					--|#line 2220 "et_eiffel_parser.y"
				yy_do_action_368
			when 369 then
					--|#line 2227 "et_eiffel_parser.y"
				yy_do_action_369
			when 370 then
					--|#line 2237 "et_eiffel_parser.y"
				yy_do_action_370
			when 371 then
					--|#line 2248 "et_eiffel_parser.y"
				yy_do_action_371
			when 372 then
					--|#line 2255 "et_eiffel_parser.y"
				yy_do_action_372
			when 373 then
					--|#line 2264 "et_eiffel_parser.y"
				yy_do_action_373
			when 374 then
					--|#line 2273 "et_eiffel_parser.y"
				yy_do_action_374
			when 375 then
					--|#line 2282 "et_eiffel_parser.y"
				yy_do_action_375
			when 376 then
					--|#line 2291 "et_eiffel_parser.y"
				yy_do_action_376
			when 377 then
					--|#line 2302 "et_eiffel_parser.y"
				yy_do_action_377
			when 378 then
					--|#line 2304 "et_eiffel_parser.y"
				yy_do_action_378
			when 379 then
					--|#line 2306 "et_eiffel_parser.y"
				yy_do_action_379
			when 380 then
					--|#line 2306 "et_eiffel_parser.y"
				yy_do_action_380
			when 381 then
					--|#line 2319 "et_eiffel_parser.y"
				yy_do_action_381
			when 382 then
					--|#line 2326 "et_eiffel_parser.y"
				yy_do_action_382
			when 383 then
					--|#line 2333 "et_eiffel_parser.y"
				yy_do_action_383
			when 384 then
					--|#line 2343 "et_eiffel_parser.y"
				yy_do_action_384
			when 385 then
					--|#line 2354 "et_eiffel_parser.y"
				yy_do_action_385
			when 386 then
					--|#line 2361 "et_eiffel_parser.y"
				yy_do_action_386
			when 387 then
					--|#line 2370 "et_eiffel_parser.y"
				yy_do_action_387
			when 388 then
					--|#line 2379 "et_eiffel_parser.y"
				yy_do_action_388
			when 389 then
					--|#line 2388 "et_eiffel_parser.y"
				yy_do_action_389
			when 390 then
					--|#line 2397 "et_eiffel_parser.y"
				yy_do_action_390
			when 391 then
					--|#line 2408 "et_eiffel_parser.y"
				yy_do_action_391
			when 392 then
					--|#line 2410 "et_eiffel_parser.y"
				yy_do_action_392
			when 393 then
					--|#line 2412 "et_eiffel_parser.y"
				yy_do_action_393
			when 394 then
					--|#line 2414 "et_eiffel_parser.y"
				yy_do_action_394
			when 395 then
					--|#line 2416 "et_eiffel_parser.y"
				yy_do_action_395
			when 396 then
					--|#line 2425 "et_eiffel_parser.y"
				yy_do_action_396
			when 397 then
					--|#line 2434 "et_eiffel_parser.y"
				yy_do_action_397
			when 398 then
					--|#line 2436 "et_eiffel_parser.y"
				yy_do_action_398
			when 399 then
					--|#line 2438 "et_eiffel_parser.y"
				yy_do_action_399
			when 400 then
					--|#line 2440 "et_eiffel_parser.y"
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
					--|#line 2442 "et_eiffel_parser.y"
				yy_do_action_401
			when 402 then
					--|#line 2451 "et_eiffel_parser.y"
				yy_do_action_402
			when 403 then
					--|#line 2462 "et_eiffel_parser.y"
				yy_do_action_403
			when 404 then
					--|#line 2466 "et_eiffel_parser.y"
				yy_do_action_404
			when 405 then
					--|#line 2468 "et_eiffel_parser.y"
				yy_do_action_405
			when 406 then
					--|#line 2470 "et_eiffel_parser.y"
				yy_do_action_406
			when 407 then
					--|#line 2472 "et_eiffel_parser.y"
				yy_do_action_407
			when 408 then
					--|#line 2474 "et_eiffel_parser.y"
				yy_do_action_408
			when 409 then
					--|#line 2478 "et_eiffel_parser.y"
				yy_do_action_409
			when 410 then
					--|#line 2482 "et_eiffel_parser.y"
				yy_do_action_410
			when 411 then
					--|#line 2484 "et_eiffel_parser.y"
				yy_do_action_411
			when 412 then
					--|#line 2486 "et_eiffel_parser.y"
				yy_do_action_412
			when 413 then
					--|#line 2488 "et_eiffel_parser.y"
				yy_do_action_413
			when 414 then
					--|#line 2490 "et_eiffel_parser.y"
				yy_do_action_414
			when 415 then
					--|#line 2494 "et_eiffel_parser.y"
				yy_do_action_415
			when 416 then
					--|#line 2498 "et_eiffel_parser.y"
				yy_do_action_416
			when 417 then
					--|#line 2500 "et_eiffel_parser.y"
				yy_do_action_417
			when 418 then
					--|#line 2504 "et_eiffel_parser.y"
				yy_do_action_418
			when 419 then
					--|#line 2506 "et_eiffel_parser.y"
				yy_do_action_419
			when 420 then
					--|#line 2510 "et_eiffel_parser.y"
				yy_do_action_420
			when 421 then
					--|#line 2514 "et_eiffel_parser.y"
				yy_do_action_421
			when 422 then
					--|#line 2518 "et_eiffel_parser.y"
				yy_do_action_422
			when 423 then
					--|#line 2520 "et_eiffel_parser.y"
				yy_do_action_423
			when 424 then
					--|#line 2524 "et_eiffel_parser.y"
				yy_do_action_424
			when 425 then
					--|#line 2526 "et_eiffel_parser.y"
				yy_do_action_425
			when 426 then
					--|#line 2530 "et_eiffel_parser.y"
				yy_do_action_426
			when 427 then
					--|#line 2532 "et_eiffel_parser.y"
				yy_do_action_427
			when 428 then
					--|#line 2536 "et_eiffel_parser.y"
				yy_do_action_428
			when 429 then
					--|#line 2538 "et_eiffel_parser.y"
				yy_do_action_429
			when 430 then
					--|#line 2544 "et_eiffel_parser.y"
				yy_do_action_430
			when 431 then
					--|#line 2546 "et_eiffel_parser.y"
				yy_do_action_431
			when 432 then
					--|#line 2552 "et_eiffel_parser.y"
				yy_do_action_432
			when 433 then
					--|#line 2554 "et_eiffel_parser.y"
				yy_do_action_433
			when 434 then
					--|#line 2558 "et_eiffel_parser.y"
				yy_do_action_434
			when 435 then
					--|#line 2560 "et_eiffel_parser.y"
				yy_do_action_435
			when 436 then
					--|#line 2562 "et_eiffel_parser.y"
				yy_do_action_436
			when 437 then
					--|#line 2564 "et_eiffel_parser.y"
				yy_do_action_437
			when 438 then
					--|#line 2566 "et_eiffel_parser.y"
				yy_do_action_438
			when 439 then
					--|#line 2568 "et_eiffel_parser.y"
				yy_do_action_439
			when 440 then
					--|#line 2570 "et_eiffel_parser.y"
				yy_do_action_440
			when 441 then
					--|#line 2572 "et_eiffel_parser.y"
				yy_do_action_441
			when 442 then
					--|#line 2574 "et_eiffel_parser.y"
				yy_do_action_442
			when 443 then
					--|#line 2576 "et_eiffel_parser.y"
				yy_do_action_443
			when 444 then
					--|#line 2578 "et_eiffel_parser.y"
				yy_do_action_444
			when 445 then
					--|#line 2580 "et_eiffel_parser.y"
				yy_do_action_445
			when 446 then
					--|#line 2582 "et_eiffel_parser.y"
				yy_do_action_446
			when 447 then
					--|#line 2584 "et_eiffel_parser.y"
				yy_do_action_447
			when 448 then
					--|#line 2586 "et_eiffel_parser.y"
				yy_do_action_448
			when 449 then
					--|#line 2588 "et_eiffel_parser.y"
				yy_do_action_449
			when 450 then
					--|#line 2590 "et_eiffel_parser.y"
				yy_do_action_450
			when 451 then
					--|#line 2592 "et_eiffel_parser.y"
				yy_do_action_451
			when 452 then
					--|#line 2594 "et_eiffel_parser.y"
				yy_do_action_452
			when 453 then
					--|#line 2596 "et_eiffel_parser.y"
				yy_do_action_453
			when 454 then
					--|#line 2598 "et_eiffel_parser.y"
				yy_do_action_454
			when 455 then
					--|#line 2600 "et_eiffel_parser.y"
				yy_do_action_455
			when 456 then
					--|#line 2604 "et_eiffel_parser.y"
				yy_do_action_456
			when 457 then
					--|#line 2606 "et_eiffel_parser.y"
				yy_do_action_457
			when 458 then
					--|#line 2608 "et_eiffel_parser.y"
				yy_do_action_458
			when 459 then
					--|#line 2610 "et_eiffel_parser.y"
				yy_do_action_459
			when 460 then
					--|#line 2612 "et_eiffel_parser.y"
				yy_do_action_460
			when 461 then
					--|#line 2614 "et_eiffel_parser.y"
				yy_do_action_461
			when 462 then
					--|#line 2616 "et_eiffel_parser.y"
				yy_do_action_462
			when 463 then
					--|#line 2618 "et_eiffel_parser.y"
				yy_do_action_463
			when 464 then
					--|#line 2620 "et_eiffel_parser.y"
				yy_do_action_464
			when 465 then
					--|#line 2622 "et_eiffel_parser.y"
				yy_do_action_465
			when 466 then
					--|#line 2624 "et_eiffel_parser.y"
				yy_do_action_466
			when 467 then
					--|#line 2626 "et_eiffel_parser.y"
				yy_do_action_467
			when 468 then
					--|#line 2628 "et_eiffel_parser.y"
				yy_do_action_468
			when 469 then
					--|#line 2630 "et_eiffel_parser.y"
				yy_do_action_469
			when 470 then
					--|#line 2632 "et_eiffel_parser.y"
				yy_do_action_470
			when 471 then
					--|#line 2634 "et_eiffel_parser.y"
				yy_do_action_471
			when 472 then
					--|#line 2636 "et_eiffel_parser.y"
				yy_do_action_472
			when 473 then
					--|#line 2638 "et_eiffel_parser.y"
				yy_do_action_473
			when 474 then
					--|#line 2640 "et_eiffel_parser.y"
				yy_do_action_474
			when 475 then
					--|#line 2642 "et_eiffel_parser.y"
				yy_do_action_475
			when 476 then
					--|#line 2644 "et_eiffel_parser.y"
				yy_do_action_476
			when 477 then
					--|#line 2646 "et_eiffel_parser.y"
				yy_do_action_477
			when 478 then
					--|#line 2650 "et_eiffel_parser.y"
				yy_do_action_478
			when 479 then
					--|#line 2652 "et_eiffel_parser.y"
				yy_do_action_479
			when 480 then
					--|#line 2654 "et_eiffel_parser.y"
				yy_do_action_480
			when 481 then
					--|#line 2656 "et_eiffel_parser.y"
				yy_do_action_481
			when 482 then
					--|#line 2658 "et_eiffel_parser.y"
				yy_do_action_482
			when 483 then
					--|#line 2660 "et_eiffel_parser.y"
				yy_do_action_483
			when 484 then
					--|#line 2662 "et_eiffel_parser.y"
				yy_do_action_484
			when 485 then
					--|#line 2664 "et_eiffel_parser.y"
				yy_do_action_485
			when 486 then
					--|#line 2666 "et_eiffel_parser.y"
				yy_do_action_486
			when 487 then
					--|#line 2668 "et_eiffel_parser.y"
				yy_do_action_487
			when 488 then
					--|#line 2670 "et_eiffel_parser.y"
				yy_do_action_488
			when 489 then
					--|#line 2672 "et_eiffel_parser.y"
				yy_do_action_489
			when 490 then
					--|#line 2674 "et_eiffel_parser.y"
				yy_do_action_490
			when 491 then
					--|#line 2676 "et_eiffel_parser.y"
				yy_do_action_491
			when 492 then
					--|#line 2678 "et_eiffel_parser.y"
				yy_do_action_492
			when 493 then
					--|#line 2680 "et_eiffel_parser.y"
				yy_do_action_493
			when 494 then
					--|#line 2682 "et_eiffel_parser.y"
				yy_do_action_494
			when 495 then
					--|#line 2684 "et_eiffel_parser.y"
				yy_do_action_495
			when 496 then
					--|#line 2686 "et_eiffel_parser.y"
				yy_do_action_496
			when 497 then
					--|#line 2688 "et_eiffel_parser.y"
				yy_do_action_497
			when 498 then
					--|#line 2690 "et_eiffel_parser.y"
				yy_do_action_498
			when 499 then
					--|#line 2692 "et_eiffel_parser.y"
				yy_do_action_499
			when 500 then
					--|#line 2694 "et_eiffel_parser.y"
				yy_do_action_500
			when 501 then
					--|#line 2698 "et_eiffel_parser.y"
				yy_do_action_501
			when 502 then
					--|#line 2700 "et_eiffel_parser.y"
				yy_do_action_502
			when 503 then
					--|#line 2704 "et_eiffel_parser.y"
				yy_do_action_503
			when 504 then
					--|#line 2706 "et_eiffel_parser.y"
				yy_do_action_504
			when 505 then
					--|#line 2710 "et_eiffel_parser.y"
				yy_do_action_505
			when 506 then
					--|#line 2713 "et_eiffel_parser.y"
				yy_do_action_506
			when 507 then
					--|#line 2721 "et_eiffel_parser.y"
				yy_do_action_507
			when 508 then
					--|#line 2728 "et_eiffel_parser.y"
				yy_do_action_508
			when 509 then
					--|#line 2739 "et_eiffel_parser.y"
				yy_do_action_509
			when 510 then
					--|#line 2744 "et_eiffel_parser.y"
				yy_do_action_510
			when 511 then
					--|#line 2749 "et_eiffel_parser.y"
				yy_do_action_511
			when 512 then
					--|#line 2754 "et_eiffel_parser.y"
				yy_do_action_512
			when 513 then
					--|#line 2761 "et_eiffel_parser.y"
				yy_do_action_513
			when 514 then
					--|#line 2767 "et_eiffel_parser.y"
				yy_do_action_514
			when 515 then
					--|#line 2776 "et_eiffel_parser.y"
				yy_do_action_515
			when 516 then
					--|#line 2778 "et_eiffel_parser.y"
				yy_do_action_516
			when 517 then
					--|#line 2782 "et_eiffel_parser.y"
				yy_do_action_517
			when 518 then
					--|#line 2785 "et_eiffel_parser.y"
				yy_do_action_518
			when 519 then
					--|#line 2791 "et_eiffel_parser.y"
				yy_do_action_519
			when 520 then
					--|#line 2799 "et_eiffel_parser.y"
				yy_do_action_520
			when 521 then
					--|#line 2804 "et_eiffel_parser.y"
				yy_do_action_521
			when 522 then
					--|#line 2809 "et_eiffel_parser.y"
				yy_do_action_522
			when 523 then
					--|#line 2814 "et_eiffel_parser.y"
				yy_do_action_523
			when 524 then
					--|#line 2825 "et_eiffel_parser.y"
				yy_do_action_524
			when 525 then
					--|#line 2836 "et_eiffel_parser.y"
				yy_do_action_525
			when 526 then
					--|#line 2849 "et_eiffel_parser.y"
				yy_do_action_526
			when 527 then
					--|#line 2858 "et_eiffel_parser.y"
				yy_do_action_527
			when 528 then
					--|#line 2867 "et_eiffel_parser.y"
				yy_do_action_528
			when 529 then
					--|#line 2869 "et_eiffel_parser.y"
				yy_do_action_529
			when 530 then
					--|#line 2871 "et_eiffel_parser.y"
				yy_do_action_530
			when 531 then
					--|#line 2875 "et_eiffel_parser.y"
				yy_do_action_531
			when 532 then
					--|#line 2877 "et_eiffel_parser.y"
				yy_do_action_532
			when 533 then
					--|#line 2879 "et_eiffel_parser.y"
				yy_do_action_533
			when 534 then
					--|#line 2881 "et_eiffel_parser.y"
				yy_do_action_534
			when 535 then
					--|#line 2883 "et_eiffel_parser.y"
				yy_do_action_535
			when 536 then
					--|#line 2885 "et_eiffel_parser.y"
				yy_do_action_536
			when 537 then
					--|#line 2887 "et_eiffel_parser.y"
				yy_do_action_537
			when 538 then
					--|#line 2889 "et_eiffel_parser.y"
				yy_do_action_538
			when 539 then
					--|#line 2891 "et_eiffel_parser.y"
				yy_do_action_539
			when 540 then
					--|#line 2893 "et_eiffel_parser.y"
				yy_do_action_540
			when 541 then
					--|#line 2895 "et_eiffel_parser.y"
				yy_do_action_541
			when 542 then
					--|#line 2897 "et_eiffel_parser.y"
				yy_do_action_542
			when 543 then
					--|#line 2899 "et_eiffel_parser.y"
				yy_do_action_543
			when 544 then
					--|#line 2901 "et_eiffel_parser.y"
				yy_do_action_544
			when 545 then
					--|#line 2903 "et_eiffel_parser.y"
				yy_do_action_545
			when 546 then
					--|#line 2905 "et_eiffel_parser.y"
				yy_do_action_546
			when 547 then
					--|#line 2907 "et_eiffel_parser.y"
				yy_do_action_547
			when 548 then
					--|#line 2909 "et_eiffel_parser.y"
				yy_do_action_548
			when 549 then
					--|#line 2911 "et_eiffel_parser.y"
				yy_do_action_549
			when 550 then
					--|#line 2913 "et_eiffel_parser.y"
				yy_do_action_550
			when 551 then
					--|#line 2915 "et_eiffel_parser.y"
				yy_do_action_551
			when 552 then
					--|#line 2919 "et_eiffel_parser.y"
				yy_do_action_552
			when 553 then
					--|#line 2921 "et_eiffel_parser.y"
				yy_do_action_553
			when 554 then
					--|#line 2925 "et_eiffel_parser.y"
				yy_do_action_554
			when 555 then
					--|#line 2927 "et_eiffel_parser.y"
				yy_do_action_555
			when 556 then
					--|#line 2929 "et_eiffel_parser.y"
				yy_do_action_556
			when 557 then
					--|#line 2931 "et_eiffel_parser.y"
				yy_do_action_557
			when 558 then
					--|#line 2933 "et_eiffel_parser.y"
				yy_do_action_558
			when 559 then
					--|#line 2935 "et_eiffel_parser.y"
				yy_do_action_559
			when 560 then
					--|#line 2937 "et_eiffel_parser.y"
				yy_do_action_560
			when 561 then
					--|#line 2945 "et_eiffel_parser.y"
				yy_do_action_561
			when 562 then
					--|#line 2953 "et_eiffel_parser.y"
				yy_do_action_562
			when 563 then
					--|#line 2961 "et_eiffel_parser.y"
				yy_do_action_563
			when 564 then
					--|#line 2969 "et_eiffel_parser.y"
				yy_do_action_564
			when 565 then
					--|#line 2971 "et_eiffel_parser.y"
				yy_do_action_565
			when 566 then
					--|#line 2973 "et_eiffel_parser.y"
				yy_do_action_566
			when 567 then
					--|#line 2975 "et_eiffel_parser.y"
				yy_do_action_567
			when 568 then
					--|#line 2977 "et_eiffel_parser.y"
				yy_do_action_568
			when 569 then
					--|#line 2979 "et_eiffel_parser.y"
				yy_do_action_569
			when 570 then
					--|#line 2981 "et_eiffel_parser.y"
				yy_do_action_570
			when 571 then
					--|#line 2983 "et_eiffel_parser.y"
				yy_do_action_571
			when 572 then
					--|#line 2985 "et_eiffel_parser.y"
				yy_do_action_572
			when 573 then
					--|#line 2991 "et_eiffel_parser.y"
				yy_do_action_573
			when 574 then
					--|#line 2995 "et_eiffel_parser.y"
				yy_do_action_574
			when 575 then
					--|#line 2999 "et_eiffel_parser.y"
				yy_do_action_575
			when 576 then
					--|#line 3003 "et_eiffel_parser.y"
				yy_do_action_576
			when 577 then
					--|#line 3007 "et_eiffel_parser.y"
				yy_do_action_577
			when 578 then
					--|#line 3011 "et_eiffel_parser.y"
				yy_do_action_578
			when 579 then
					--|#line 3015 "et_eiffel_parser.y"
				yy_do_action_579
			when 580 then
					--|#line 3019 "et_eiffel_parser.y"
				yy_do_action_580
			when 581 then
					--|#line 3023 "et_eiffel_parser.y"
				yy_do_action_581
			when 582 then
					--|#line 3025 "et_eiffel_parser.y"
				yy_do_action_582
			when 583 then
					--|#line 3029 "et_eiffel_parser.y"
				yy_do_action_583
			when 584 then
					--|#line 3033 "et_eiffel_parser.y"
				yy_do_action_584
			when 585 then
					--|#line 3040 "et_eiffel_parser.y"
				yy_do_action_585
			when 586 then
					--|#line 3042 "et_eiffel_parser.y"
				yy_do_action_586
			when 587 then
					--|#line 3046 "et_eiffel_parser.y"
				yy_do_action_587
			when 588 then
					--|#line 3048 "et_eiffel_parser.y"
				yy_do_action_588
			when 589 then
					--|#line 3052 "et_eiffel_parser.y"
				yy_do_action_589
			when 590 then
					--|#line 3063 "et_eiffel_parser.y"
				yy_do_action_590
			when 591 then
					--|#line 3063 "et_eiffel_parser.y"
				yy_do_action_591
			when 592 then
					--|#line 3084 "et_eiffel_parser.y"
				yy_do_action_592
			when 593 then
					--|#line 3086 "et_eiffel_parser.y"
				yy_do_action_593
			when 594 then
					--|#line 3088 "et_eiffel_parser.y"
				yy_do_action_594
			when 595 then
					--|#line 3090 "et_eiffel_parser.y"
				yy_do_action_595
			when 596 then
					--|#line 3092 "et_eiffel_parser.y"
				yy_do_action_596
			when 597 then
					--|#line 3094 "et_eiffel_parser.y"
				yy_do_action_597
			when 598 then
					--|#line 3096 "et_eiffel_parser.y"
				yy_do_action_598
			when 599 then
					--|#line 3098 "et_eiffel_parser.y"
				yy_do_action_599
			when 600 then
					--|#line 3100 "et_eiffel_parser.y"
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
					--|#line 3102 "et_eiffel_parser.y"
				yy_do_action_601
			when 602 then
					--|#line 3104 "et_eiffel_parser.y"
				yy_do_action_602
			when 603 then
					--|#line 3112 "et_eiffel_parser.y"
				yy_do_action_603
			when 604 then
					--|#line 3125 "et_eiffel_parser.y"
				yy_do_action_604
			when 605 then
					--|#line 3127 "et_eiffel_parser.y"
				yy_do_action_605
			when 606 then
					--|#line 3129 "et_eiffel_parser.y"
				yy_do_action_606
			when 607 then
					--|#line 3131 "et_eiffel_parser.y"
				yy_do_action_607
			when 608 then
					--|#line 3133 "et_eiffel_parser.y"
				yy_do_action_608
			when 609 then
					--|#line 3139 "et_eiffel_parser.y"
				yy_do_action_609
			when 610 then
					--|#line 3143 "et_eiffel_parser.y"
				yy_do_action_610
			when 611 then
					--|#line 3145 "et_eiffel_parser.y"
				yy_do_action_611
			when 612 then
					--|#line 3147 "et_eiffel_parser.y"
				yy_do_action_612
			when 613 then
					--|#line 3149 "et_eiffel_parser.y"
				yy_do_action_613
			when 614 then
					--|#line 3155 "et_eiffel_parser.y"
				yy_do_action_614
			when 615 then
					--|#line 3157 "et_eiffel_parser.y"
				yy_do_action_615
			when 616 then
					--|#line 3159 "et_eiffel_parser.y"
				yy_do_action_616
			when 617 then
					--|#line 3161 "et_eiffel_parser.y"
				yy_do_action_617
			when 618 then
					--|#line 3165 "et_eiffel_parser.y"
				yy_do_action_618
			when 619 then
					--|#line 3167 "et_eiffel_parser.y"
				yy_do_action_619
			when 620 then
					--|#line 3169 "et_eiffel_parser.y"
				yy_do_action_620
			when 621 then
					--|#line 3171 "et_eiffel_parser.y"
				yy_do_action_621
			when 622 then
					--|#line 3175 "et_eiffel_parser.y"
				yy_do_action_622
			when 623 then
					--|#line 3177 "et_eiffel_parser.y"
				yy_do_action_623
			when 624 then
					--|#line 3181 "et_eiffel_parser.y"
				yy_do_action_624
			when 625 then
					--|#line 3182 "et_eiffel_parser.y"
				yy_do_action_625
			when 626 then
					--|#line 3188 "et_eiffel_parser.y"
				yy_do_action_626
			when 627 then
					--|#line 3190 "et_eiffel_parser.y"
				yy_do_action_627
			when 628 then
					--|#line 3192 "et_eiffel_parser.y"
				yy_do_action_628
			when 629 then
					--|#line 3194 "et_eiffel_parser.y"
				yy_do_action_629
			when 630 then
					--|#line 3198 "et_eiffel_parser.y"
				yy_do_action_630
			when 631 then
					--|#line 3205 "et_eiffel_parser.y"
				yy_do_action_631
			when 632 then
					--|#line 3212 "et_eiffel_parser.y"
				yy_do_action_632
			when 633 then
					--|#line 3221 "et_eiffel_parser.y"
				yy_do_action_633
			when 634 then
					--|#line 3232 "et_eiffel_parser.y"
				yy_do_action_634
			when 635 then
					--|#line 3234 "et_eiffel_parser.y"
				yy_do_action_635
			when 636 then
					--|#line 3238 "et_eiffel_parser.y"
				yy_do_action_636
			when 637 then
					--|#line 3245 "et_eiffel_parser.y"
				yy_do_action_637
			when 638 then
					--|#line 3252 "et_eiffel_parser.y"
				yy_do_action_638
			when 639 then
					--|#line 3261 "et_eiffel_parser.y"
				yy_do_action_639
			when 640 then
					--|#line 3272 "et_eiffel_parser.y"
				yy_do_action_640
			when 641 then
					--|#line 3274 "et_eiffel_parser.y"
				yy_do_action_641
			when 642 then
					--|#line 3278 "et_eiffel_parser.y"
				yy_do_action_642
			when 643 then
					--|#line 3280 "et_eiffel_parser.y"
				yy_do_action_643
			when 644 then
					--|#line 3287 "et_eiffel_parser.y"
				yy_do_action_644
			when 645 then
					--|#line 3294 "et_eiffel_parser.y"
				yy_do_action_645
			when 646 then
					--|#line 3303 "et_eiffel_parser.y"
				yy_do_action_646
			when 647 then
					--|#line 3312 "et_eiffel_parser.y"
				yy_do_action_647
			when 648 then
					--|#line 3314 "et_eiffel_parser.y"
				yy_do_action_648
			when 649 then
					--|#line 3314 "et_eiffel_parser.y"
				yy_do_action_649
			when 650 then
					--|#line 3327 "et_eiffel_parser.y"
				yy_do_action_650
			when 651 then
					--|#line 3338 "et_eiffel_parser.y"
				yy_do_action_651
			when 652 then
					--|#line 3346 "et_eiffel_parser.y"
				yy_do_action_652
			when 653 then
					--|#line 3355 "et_eiffel_parser.y"
				yy_do_action_653
			when 654 then
					--|#line 3364 "et_eiffel_parser.y"
				yy_do_action_654
			when 655 then
					--|#line 3366 "et_eiffel_parser.y"
				yy_do_action_655
			when 656 then
					--|#line 3370 "et_eiffel_parser.y"
				yy_do_action_656
			when 657 then
					--|#line 3372 "et_eiffel_parser.y"
				yy_do_action_657
			when 658 then
					--|#line 3374 "et_eiffel_parser.y"
				yy_do_action_658
			when 659 then
					--|#line 3376 "et_eiffel_parser.y"
				yy_do_action_659
			when 660 then
					--|#line 3382 "et_eiffel_parser.y"
				yy_do_action_660
			when 661 then
					--|#line 3384 "et_eiffel_parser.y"
				yy_do_action_661
			when 662 then
					--|#line 3388 "et_eiffel_parser.y"
				yy_do_action_662
			when 663 then
					--|#line 3390 "et_eiffel_parser.y"
				yy_do_action_663
			when 664 then
					--|#line 3396 "et_eiffel_parser.y"
				yy_do_action_664
			when 665 then
					--|#line 3400 "et_eiffel_parser.y"
				yy_do_action_665
			when 666 then
					--|#line 3402 "et_eiffel_parser.y"
				yy_do_action_666
			when 667 then
					--|#line 3404 "et_eiffel_parser.y"
				yy_do_action_667
			when 668 then
					--|#line 3404 "et_eiffel_parser.y"
				yy_do_action_668
			when 669 then
					--|#line 3417 "et_eiffel_parser.y"
				yy_do_action_669
			when 670 then
					--|#line 3428 "et_eiffel_parser.y"
				yy_do_action_670
			when 671 then
					--|#line 3437 "et_eiffel_parser.y"
				yy_do_action_671
			when 672 then
					--|#line 3448 "et_eiffel_parser.y"
				yy_do_action_672
			when 673 then
					--|#line 3450 "et_eiffel_parser.y"
				yy_do_action_673
			when 674 then
					--|#line 3452 "et_eiffel_parser.y"
				yy_do_action_674
			when 675 then
					--|#line 3454 "et_eiffel_parser.y"
				yy_do_action_675
			when 676 then
					--|#line 3456 "et_eiffel_parser.y"
				yy_do_action_676
			when 677 then
					--|#line 3458 "et_eiffel_parser.y"
				yy_do_action_677
			when 678 then
					--|#line 3460 "et_eiffel_parser.y"
				yy_do_action_678
			when 679 then
					--|#line 3464 "et_eiffel_parser.y"
				yy_do_action_679
			when 680 then
					--|#line 3466 "et_eiffel_parser.y"
				yy_do_action_680
			when 681 then
					--|#line 3470 "et_eiffel_parser.y"
				yy_do_action_681
			when 682 then
					--|#line 3474 "et_eiffel_parser.y"
				yy_do_action_682
			when 683 then
					--|#line 3476 "et_eiffel_parser.y"
				yy_do_action_683
			when 684 then
					--|#line 3480 "et_eiffel_parser.y"
				yy_do_action_684
			when 685 then
					--|#line 3482 "et_eiffel_parser.y"
				yy_do_action_685
			when 686 then
					--|#line 3486 "et_eiffel_parser.y"
				yy_do_action_686
			when 687 then
					--|#line 3488 "et_eiffel_parser.y"
				yy_do_action_687
			when 688 then
					--|#line 3492 "et_eiffel_parser.y"
				yy_do_action_688
			when 689 then
					--|#line 3494 "et_eiffel_parser.y"
				yy_do_action_689
			when 690 then
					--|#line 3496 "et_eiffel_parser.y"
				yy_do_action_690
			when 691 then
					--|#line 3498 "et_eiffel_parser.y"
				yy_do_action_691
			when 692 then
					--|#line 3500 "et_eiffel_parser.y"
				yy_do_action_692
			when 693 then
					--|#line 3502 "et_eiffel_parser.y"
				yy_do_action_693
			when 694 then
					--|#line 3510 "et_eiffel_parser.y"
				yy_do_action_694
			when 695 then
					--|#line 3512 "et_eiffel_parser.y"
				yy_do_action_695
			when 696 then
					--|#line 3516 "et_eiffel_parser.y"
				yy_do_action_696
			when 697 then
					--|#line 3524 "et_eiffel_parser.y"
				yy_do_action_697
			when 698 then
					--|#line 3530 "et_eiffel_parser.y"
				yy_do_action_698
			when 699 then
					--|#line 3532 "et_eiffel_parser.y"
				yy_do_action_699
			when 700 then
					--|#line 3534 "et_eiffel_parser.y"
				yy_do_action_700
			when 701 then
					--|#line 3534 "et_eiffel_parser.y"
				yy_do_action_701
			when 702 then
					--|#line 3547 "et_eiffel_parser.y"
				yy_do_action_702
			when 703 then
					--|#line 3558 "et_eiffel_parser.y"
				yy_do_action_703
			when 704 then
					--|#line 3566 "et_eiffel_parser.y"
				yy_do_action_704
			when 705 then
					--|#line 3575 "et_eiffel_parser.y"
				yy_do_action_705
			when 706 then
					--|#line 3584 "et_eiffel_parser.y"
				yy_do_action_706
			when 707 then
					--|#line 3586 "et_eiffel_parser.y"
				yy_do_action_707
			when 708 then
					--|#line 3588 "et_eiffel_parser.y"
				yy_do_action_708
			when 709 then
					--|#line 3590 "et_eiffel_parser.y"
				yy_do_action_709
			when 710 then
					--|#line 3597 "et_eiffel_parser.y"
				yy_do_action_710
			when 711 then
					--|#line 3599 "et_eiffel_parser.y"
				yy_do_action_711
			when 712 then
					--|#line 3605 "et_eiffel_parser.y"
				yy_do_action_712
			when 713 then
					--|#line 3607 "et_eiffel_parser.y"
				yy_do_action_713
			when 714 then
					--|#line 3611 "et_eiffel_parser.y"
				yy_do_action_714
			when 715 then
					--|#line 3613 "et_eiffel_parser.y"
				yy_do_action_715
			when 716 then
					--|#line 3615 "et_eiffel_parser.y"
				yy_do_action_716
			when 717 then
					--|#line 3617 "et_eiffel_parser.y"
				yy_do_action_717
			when 718 then
					--|#line 3619 "et_eiffel_parser.y"
				yy_do_action_718
			when 719 then
					--|#line 3621 "et_eiffel_parser.y"
				yy_do_action_719
			when 720 then
					--|#line 3623 "et_eiffel_parser.y"
				yy_do_action_720
			when 721 then
					--|#line 3625 "et_eiffel_parser.y"
				yy_do_action_721
			when 722 then
					--|#line 3627 "et_eiffel_parser.y"
				yy_do_action_722
			when 723 then
					--|#line 3629 "et_eiffel_parser.y"
				yy_do_action_723
			when 724 then
					--|#line 3631 "et_eiffel_parser.y"
				yy_do_action_724
			when 725 then
					--|#line 3633 "et_eiffel_parser.y"
				yy_do_action_725
			when 726 then
					--|#line 3635 "et_eiffel_parser.y"
				yy_do_action_726
			when 727 then
					--|#line 3637 "et_eiffel_parser.y"
				yy_do_action_727
			when 728 then
					--|#line 3639 "et_eiffel_parser.y"
				yy_do_action_728
			when 729 then
					--|#line 3641 "et_eiffel_parser.y"
				yy_do_action_729
			when 730 then
					--|#line 3643 "et_eiffel_parser.y"
				yy_do_action_730
			when 731 then
					--|#line 3645 "et_eiffel_parser.y"
				yy_do_action_731
			when 732 then
					--|#line 3647 "et_eiffel_parser.y"
				yy_do_action_732
			when 733 then
					--|#line 3649 "et_eiffel_parser.y"
				yy_do_action_733
			when 734 then
					--|#line 3651 "et_eiffel_parser.y"
				yy_do_action_734
			when 735 then
					--|#line 3653 "et_eiffel_parser.y"
				yy_do_action_735
			when 736 then
					--|#line 3657 "et_eiffel_parser.y"
				yy_do_action_736
			when 737 then
					--|#line 3659 "et_eiffel_parser.y"
				yy_do_action_737
			when 738 then
					--|#line 3661 "et_eiffel_parser.y"
				yy_do_action_738
			when 739 then
					--|#line 3663 "et_eiffel_parser.y"
				yy_do_action_739
			when 740 then
					--|#line 3665 "et_eiffel_parser.y"
				yy_do_action_740
			when 741 then
					--|#line 3667 "et_eiffel_parser.y"
				yy_do_action_741
			when 742 then
					--|#line 3671 "et_eiffel_parser.y"
				yy_do_action_742
			when 743 then
					--|#line 3673 "et_eiffel_parser.y"
				yy_do_action_743
			when 744 then
					--|#line 3675 "et_eiffel_parser.y"
				yy_do_action_744
			when 745 then
					--|#line 3677 "et_eiffel_parser.y"
				yy_do_action_745
			when 746 then
					--|#line 3679 "et_eiffel_parser.y"
				yy_do_action_746
			when 747 then
					--|#line 3681 "et_eiffel_parser.y"
				yy_do_action_747
			when 748 then
					--|#line 3683 "et_eiffel_parser.y"
				yy_do_action_748
			when 749 then
					--|#line 3685 "et_eiffel_parser.y"
				yy_do_action_749
			when 750 then
					--|#line 3687 "et_eiffel_parser.y"
				yy_do_action_750
			when 751 then
					--|#line 3689 "et_eiffel_parser.y"
				yy_do_action_751
			when 752 then
					--|#line 3691 "et_eiffel_parser.y"
				yy_do_action_752
			when 753 then
					--|#line 3693 "et_eiffel_parser.y"
				yy_do_action_753
			when 754 then
					--|#line 3695 "et_eiffel_parser.y"
				yy_do_action_754
			when 755 then
					--|#line 3697 "et_eiffel_parser.y"
				yy_do_action_755
			when 756 then
					--|#line 3699 "et_eiffel_parser.y"
				yy_do_action_756
			when 757 then
					--|#line 3707 "et_eiffel_parser.y"
				yy_do_action_757
			when 758 then
					--|#line 3709 "et_eiffel_parser.y"
				yy_do_action_758
			when 759 then
					--|#line 3711 "et_eiffel_parser.y"
				yy_do_action_759
			when 760 then
					--|#line 3713 "et_eiffel_parser.y"
				yy_do_action_760
			when 761 then
					--|#line 3717 "et_eiffel_parser.y"
				yy_do_action_761
			when 762 then
					--|#line 3719 "et_eiffel_parser.y"
				yy_do_action_762
			when 763 then
					--|#line 3721 "et_eiffel_parser.y"
				yy_do_action_763
			when 764 then
					--|#line 3723 "et_eiffel_parser.y"
				yy_do_action_764
			when 765 then
					--|#line 3725 "et_eiffel_parser.y"
				yy_do_action_765
			when 766 then
					--|#line 3727 "et_eiffel_parser.y"
				yy_do_action_766
			when 767 then
					--|#line 3729 "et_eiffel_parser.y"
				yy_do_action_767
			when 768 then
					--|#line 3731 "et_eiffel_parser.y"
				yy_do_action_768
			when 769 then
					--|#line 3733 "et_eiffel_parser.y"
				yy_do_action_769
			when 770 then
					--|#line 3735 "et_eiffel_parser.y"
				yy_do_action_770
			when 771 then
					--|#line 3737 "et_eiffel_parser.y"
				yy_do_action_771
			when 772 then
					--|#line 3739 "et_eiffel_parser.y"
				yy_do_action_772
			when 773 then
					--|#line 3741 "et_eiffel_parser.y"
				yy_do_action_773
			when 774 then
					--|#line 3774 "et_eiffel_parser.y"
				yy_do_action_774
			when 775 then
					--|#line 3776 "et_eiffel_parser.y"
				yy_do_action_775
			when 776 then
					--|#line 3778 "et_eiffel_parser.y"
				yy_do_action_776
			when 777 then
					--|#line 3782 "et_eiffel_parser.y"
				yy_do_action_777
			when 778 then
					--|#line 3784 "et_eiffel_parser.y"
				yy_do_action_778
			when 779 then
					--|#line 3786 "et_eiffel_parser.y"
				yy_do_action_779
			when 780 then
					--|#line 3794 "et_eiffel_parser.y"
				yy_do_action_780
			when 781 then
					--|#line 3798 "et_eiffel_parser.y"
				yy_do_action_781
			when 782 then
					--|#line 3800 "et_eiffel_parser.y"
				yy_do_action_782
			when 783 then
					--|#line 3804 "et_eiffel_parser.y"
				yy_do_action_783
			when 784 then
					--|#line 3804 "et_eiffel_parser.y"
				yy_do_action_784
			when 785 then
					--|#line 3815 "et_eiffel_parser.y"
				yy_do_action_785
			when 786 then
					--|#line 3815 "et_eiffel_parser.y"
				yy_do_action_786
			when 787 then
					--|#line 3828 "et_eiffel_parser.y"
				yy_do_action_787
			when 788 then
					--|#line 3828 "et_eiffel_parser.y"
				yy_do_action_788
			when 789 then
					--|#line 3839 "et_eiffel_parser.y"
				yy_do_action_789
			when 790 then
					--|#line 3839 "et_eiffel_parser.y"
				yy_do_action_790
			when 791 then
					--|#line 3852 "et_eiffel_parser.y"
				yy_do_action_791
			when 792 then
					--|#line 3863 "et_eiffel_parser.y"
				yy_do_action_792
			when 793 then
					--|#line 3871 "et_eiffel_parser.y"
				yy_do_action_793
			when 794 then
					--|#line 3880 "et_eiffel_parser.y"
				yy_do_action_794
			when 795 then
					--|#line 3888 "et_eiffel_parser.y"
				yy_do_action_795
			when 796 then
					--|#line 3890 "et_eiffel_parser.y"
				yy_do_action_796
			when 797 then
					--|#line 3890 "et_eiffel_parser.y"
				yy_do_action_797
			when 798 then
					--|#line 3903 "et_eiffel_parser.y"
				yy_do_action_798
			when 799 then
					--|#line 3912 "et_eiffel_parser.y"
				yy_do_action_799
			when 800 then
					--|#line 3923 "et_eiffel_parser.y"
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
					--|#line 3931 "et_eiffel_parser.y"
				yy_do_action_801
			when 802 then
					--|#line 3940 "et_eiffel_parser.y"
				yy_do_action_802
			when 803 then
					--|#line 3942 "et_eiffel_parser.y"
				yy_do_action_803
			when 804 then
					--|#line 3942 "et_eiffel_parser.y"
				yy_do_action_804
			when 805 then
					--|#line 3955 "et_eiffel_parser.y"
				yy_do_action_805
			when 806 then
					--|#line 3966 "et_eiffel_parser.y"
				yy_do_action_806
			when 807 then
					--|#line 3974 "et_eiffel_parser.y"
				yy_do_action_807
			when 808 then
					--|#line 3983 "et_eiffel_parser.y"
				yy_do_action_808
			when 809 then
					--|#line 3985 "et_eiffel_parser.y"
				yy_do_action_809
			when 810 then
					--|#line 3985 "et_eiffel_parser.y"
				yy_do_action_810
			when 811 then
					--|#line 4000 "et_eiffel_parser.y"
				yy_do_action_811
			when 812 then
					--|#line 4011 "et_eiffel_parser.y"
				yy_do_action_812
			when 813 then
					--|#line 4019 "et_eiffel_parser.y"
				yy_do_action_813
			when 814 then
					--|#line 4028 "et_eiffel_parser.y"
				yy_do_action_814
			when 815 then
					--|#line 4030 "et_eiffel_parser.y"
				yy_do_action_815
			when 816 then
					--|#line 4032 "et_eiffel_parser.y"
				yy_do_action_816
			when 817 then
					--|#line 4034 "et_eiffel_parser.y"
				yy_do_action_817
			when 818 then
					--|#line 4036 "et_eiffel_parser.y"
				yy_do_action_818
			when 819 then
					--|#line 4040 "et_eiffel_parser.y"
				yy_do_action_819
			when 820 then
					--|#line 4044 "et_eiffel_parser.y"
				yy_do_action_820
			when 821 then
					--|#line 4048 "et_eiffel_parser.y"
				yy_do_action_821
			when 822 then
					--|#line 4050 "et_eiffel_parser.y"
				yy_do_action_822
			when 823 then
					--|#line 4056 "et_eiffel_parser.y"
				yy_do_action_823
			when 824 then
					--|#line 4058 "et_eiffel_parser.y"
				yy_do_action_824
			when 825 then
					--|#line 4062 "et_eiffel_parser.y"
				yy_do_action_825
			when 826 then
					--|#line 4069 "et_eiffel_parser.y"
				yy_do_action_826
			when 827 then
					--|#line 4079 "et_eiffel_parser.y"
				yy_do_action_827
			when 828 then
					--|#line 4085 "et_eiffel_parser.y"
				yy_do_action_828
			when 829 then
					--|#line 4091 "et_eiffel_parser.y"
				yy_do_action_829
			when 830 then
					--|#line 4097 "et_eiffel_parser.y"
				yy_do_action_830
			when 831 then
					--|#line 4103 "et_eiffel_parser.y"
				yy_do_action_831
			when 832 then
					--|#line 4109 "et_eiffel_parser.y"
				yy_do_action_832
			when 833 then
					--|#line 4115 "et_eiffel_parser.y"
				yy_do_action_833
			when 834 then
					--|#line 4121 "et_eiffel_parser.y"
				yy_do_action_834
			when 835 then
					--|#line 4127 "et_eiffel_parser.y"
				yy_do_action_835
			when 836 then
					--|#line 4132 "et_eiffel_parser.y"
				yy_do_action_836
			when 837 then
					--|#line 4138 "et_eiffel_parser.y"
				yy_do_action_837
			when 838 then
					--|#line 4146 "et_eiffel_parser.y"
				yy_do_action_838
			when 839 then
					--|#line 4153 "et_eiffel_parser.y"
				yy_do_action_839
			when 840 then
					--|#line 4157 "et_eiffel_parser.y"
				yy_do_action_840
			when 841 then
					--|#line 4159 "et_eiffel_parser.y"
				yy_do_action_841
			when 842 then
					--|#line 4161 "et_eiffel_parser.y"
				yy_do_action_842
			when 843 then
					--|#line 4163 "et_eiffel_parser.y"
				yy_do_action_843
			when 844 then
					--|#line 4165 "et_eiffel_parser.y"
				yy_do_action_844
			when 845 then
					--|#line 4169 "et_eiffel_parser.y"
				yy_do_action_845
			when 846 then
					--|#line 4171 "et_eiffel_parser.y"
				yy_do_action_846
			when 847 then
					--|#line 4173 "et_eiffel_parser.y"
				yy_do_action_847
			when 848 then
					--|#line 4173 "et_eiffel_parser.y"
				yy_do_action_848
			when 849 then
					--|#line 4186 "et_eiffel_parser.y"
				yy_do_action_849
			when 850 then
					--|#line 4197 "et_eiffel_parser.y"
				yy_do_action_850
			when 851 then
					--|#line 4205 "et_eiffel_parser.y"
				yy_do_action_851
			when 852 then
					--|#line 4214 "et_eiffel_parser.y"
				yy_do_action_852
			when 853 then
					--|#line 4223 "et_eiffel_parser.y"
				yy_do_action_853
			when 854 then
					--|#line 4225 "et_eiffel_parser.y"
				yy_do_action_854
			when 855 then
					--|#line 4227 "et_eiffel_parser.y"
				yy_do_action_855
			when 856 then
					--|#line 4233 "et_eiffel_parser.y"
				yy_do_action_856
			when 857 then
					--|#line 4235 "et_eiffel_parser.y"
				yy_do_action_857
			when 858 then
					--|#line 4239 "et_eiffel_parser.y"
				yy_do_action_858
			when 859 then
					--|#line 4241 "et_eiffel_parser.y"
				yy_do_action_859
			when 860 then
					--|#line 4243 "et_eiffel_parser.y"
				yy_do_action_860
			when 861 then
					--|#line 4245 "et_eiffel_parser.y"
				yy_do_action_861
			when 862 then
					--|#line 4247 "et_eiffel_parser.y"
				yy_do_action_862
			when 863 then
					--|#line 4249 "et_eiffel_parser.y"
				yy_do_action_863
			when 864 then
					--|#line 4251 "et_eiffel_parser.y"
				yy_do_action_864
			when 865 then
					--|#line 4253 "et_eiffel_parser.y"
				yy_do_action_865
			when 866 then
					--|#line 4255 "et_eiffel_parser.y"
				yy_do_action_866
			when 867 then
					--|#line 4257 "et_eiffel_parser.y"
				yy_do_action_867
			when 868 then
					--|#line 4259 "et_eiffel_parser.y"
				yy_do_action_868
			when 869 then
					--|#line 4261 "et_eiffel_parser.y"
				yy_do_action_869
			when 870 then
					--|#line 4263 "et_eiffel_parser.y"
				yy_do_action_870
			when 871 then
					--|#line 4265 "et_eiffel_parser.y"
				yy_do_action_871
			when 872 then
					--|#line 4267 "et_eiffel_parser.y"
				yy_do_action_872
			when 873 then
					--|#line 4269 "et_eiffel_parser.y"
				yy_do_action_873
			when 874 then
					--|#line 4271 "et_eiffel_parser.y"
				yy_do_action_874
			when 875 then
					--|#line 4273 "et_eiffel_parser.y"
				yy_do_action_875
			when 876 then
					--|#line 4275 "et_eiffel_parser.y"
				yy_do_action_876
			when 877 then
					--|#line 4277 "et_eiffel_parser.y"
				yy_do_action_877
			when 878 then
					--|#line 4279 "et_eiffel_parser.y"
				yy_do_action_878
			when 879 then
					--|#line 4281 "et_eiffel_parser.y"
				yy_do_action_879
			when 880 then
					--|#line 4283 "et_eiffel_parser.y"
				yy_do_action_880
			when 881 then
					--|#line 4285 "et_eiffel_parser.y"
				yy_do_action_881
			when 882 then
					--|#line 4289 "et_eiffel_parser.y"
				yy_do_action_882
			when 883 then
					--|#line 4298 "et_eiffel_parser.y"
				yy_do_action_883
			when 884 then
					--|#line 4300 "et_eiffel_parser.y"
				yy_do_action_884
			when 885 then
					--|#line 4304 "et_eiffel_parser.y"
				yy_do_action_885
			when 886 then
					--|#line 4306 "et_eiffel_parser.y"
				yy_do_action_886
			when 887 then
					--|#line 4310 "et_eiffel_parser.y"
				yy_do_action_887
			when 888 then
					--|#line 4319 "et_eiffel_parser.y"
				yy_do_action_888
			when 889 then
					--|#line 4321 "et_eiffel_parser.y"
				yy_do_action_889
			when 890 then
					--|#line 4325 "et_eiffel_parser.y"
				yy_do_action_890
			when 891 then
					--|#line 4327 "et_eiffel_parser.y"
				yy_do_action_891
			when 892 then
					--|#line 4331 "et_eiffel_parser.y"
				yy_do_action_892
			when 893 then
					--|#line 4333 "et_eiffel_parser.y"
				yy_do_action_893
			when 894 then
					--|#line 4337 "et_eiffel_parser.y"
				yy_do_action_894
			when 895 then
					--|#line 4344 "et_eiffel_parser.y"
				yy_do_action_895
			when 896 then
					--|#line 4353 "et_eiffel_parser.y"
				yy_do_action_896
			when 897 then
					--|#line 4362 "et_eiffel_parser.y"
				yy_do_action_897
			when 898 then
					--|#line 4364 "et_eiffel_parser.y"
				yy_do_action_898
			when 899 then
					--|#line 4368 "et_eiffel_parser.y"
				yy_do_action_899
			when 900 then
					--|#line 4370 "et_eiffel_parser.y"
				yy_do_action_900
			when 901 then
					--|#line 4374 "et_eiffel_parser.y"
				yy_do_action_901
			when 902 then
					--|#line 4381 "et_eiffel_parser.y"
				yy_do_action_902
			when 903 then
					--|#line 4390 "et_eiffel_parser.y"
				yy_do_action_903
			when 904 then
					--|#line 4399 "et_eiffel_parser.y"
				yy_do_action_904
			when 905 then
					--|#line 4401 "et_eiffel_parser.y"
				yy_do_action_905
			when 906 then
					--|#line 4403 "et_eiffel_parser.y"
				yy_do_action_906
			when 907 then
					--|#line 4409 "et_eiffel_parser.y"
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
			--|#line 241 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 241 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 241")
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
			--|#line 245 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 245 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 245")
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
			--|#line 253 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 253 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 253")
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
			--|#line 262 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 262 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 262")
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
			--|#line 263 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 263 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 263")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp44 := yyvsp44 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_6
			--|#line 263 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 263 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 263")
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
			--|#line 274 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 274 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 274")
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
			--|#line 282 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 282 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 282")
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
			--|#line 287 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 287 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 287")
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
			--|#line 289 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 289 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 289")
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
			--|#line 289 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 289 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 289")
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
			--|#line 300 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 300 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 300")
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
			--|#line 302 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 302 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 302")
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
			--|#line 302 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 302 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 302")
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
			--|#line 315 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 315 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 315")
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
			--|#line 317 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 317 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 317")
end

yyval86 := yyvs86.item (yyvsp86) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines86.force (yyvs86, yyval86, yyvsp86)
end
		end

	yy_do_action_17
			--|#line 321 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 321 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 321")
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
			--|#line 332 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 332 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 332")
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
			--|#line 332 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 332 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 332")
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
			--|#line 341 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 341 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 341")
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
			--|#line 341 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 341 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 341")
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
			--|#line 352 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 352 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 352")
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
			--|#line 359 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 359 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 359")
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
			--|#line 365 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 365 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 365")
end

yyval87 := ast_factory.new_indexing_semicolon (yyvs87.item (yyvsp87), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 -1
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_25
			--|#line 369 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 369 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 369")
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
			--|#line 380 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 380 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 380")
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
			--|#line 392 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 392 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 392")
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
			--|#line 392 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 392 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 392")
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
			--|#line 401 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 401")
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
			--|#line 401 "et_eiffel_parser.y"
		local
			yyval86: detachable ET_INDEXING_LIST
		do
--|#line 401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 401")
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
			--|#line 412 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 412 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 412")
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
			--|#line 419 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 419 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 419")
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
			--|#line 423 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 423 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 423")
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
			--|#line 429 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 429 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 429")
end

yyval87 := ast_factory.new_indexing_semicolon (yyvs87.item (yyvsp87), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 -1
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_35
			--|#line 431 "et_eiffel_parser.y"
		local
			yyval87: detachable ET_INDEXING_ITEM
		do
--|#line 431 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 431")
end

yyval87 := ast_factory.new_indexing_semicolon (yyvs87.item (yyvsp87), yyvs21.item (yyvsp21)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp21 := yyvsp21 -1
	yyspecial_routines87.force (yyvs87, yyval87, yyvsp87)
end
		end

	yy_do_action_36
			--|#line 436 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_INDEXING_TERM_LIST
		do
--|#line 436 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 436")
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
			--|#line 447 "et_eiffel_parser.y"
		local
			yyval90: detachable ET_INDEXING_TERM_LIST
		do
--|#line 447 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 447")
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
			--|#line 456 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 456 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 456")
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
			--|#line 458 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 458 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 458")
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
			--|#line 460 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 460 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 460")
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
			--|#line 462 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 462 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 462")
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
			--|#line 464 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 464 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 464")
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
			--|#line 466 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 466 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 466")
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
			--|#line 468 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 468 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 468")
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
			--|#line 470 "et_eiffel_parser.y"
		local
			yyval88: detachable ET_INDEXING_TERM
		do
--|#line 470 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 470")
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
			--|#line 474 "et_eiffel_parser.y"
		local
			yyval89: detachable ET_INDEXING_TERM_ITEM
		do
--|#line 474 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 474")
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
			--|#line 485 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 485 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 485")
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
			--|#line 497 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 497 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 497")
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
			--|#line 510 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 510 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 510")
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
			--|#line 523 "et_eiffel_parser.y"
		local
			yyval44: detachable ET_CLASS
		do
--|#line 523 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 523")
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
			--|#line 538 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 538 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 538")
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
			--|#line 540 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 540 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 540")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_53
			--|#line 544 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 544 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 544")
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
			--|#line 546 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 546 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 546")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_55
			--|#line 552 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 552 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 552")
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
			--|#line 556 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 556 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 556")
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
			--|#line 562 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 562 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 562")
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
			--|#line 562 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 562 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 562")
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
			--|#line 576 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 576 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 576")
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
			--|#line 587 "et_eiffel_parser.y"
		local
			yyval83: detachable ET_FORMAL_PARAMETER_LIST
		do
--|#line 587 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 587")
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
			--|#line 596 "et_eiffel_parser.y"
		local
			yyval82: detachable ET_FORMAL_PARAMETER_ITEM
		do
--|#line 596 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 596")
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
			--|#line 605 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 605 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 605")
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
			--|#line 607 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 607 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 607")
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
			--|#line 609 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 609 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 609")
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
			--|#line 611 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 611 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 611")
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
			--|#line 613 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 613 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 613")
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
			--|#line 615 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 615 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 615")
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
			--|#line 617 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 617 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 617")
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
			--|#line 619 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 619 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 619")
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
			--|#line 621 "et_eiffel_parser.y"
		local
			yyval81: detachable ET_FORMAL_PARAMETER
		do
--|#line 621 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 621")
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
			--|#line 625 "et_eiffel_parser.y"
		local
			yyval121: detachable ET_TYPE_CONSTRAINT
		do
--|#line 625 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 625")
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
			--|#line 632 "et_eiffel_parser.y"
		local
			yyval121: detachable ET_TYPE_CONSTRAINT
		do
--|#line 632 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 632")
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
			--|#line 641 "et_eiffel_parser.y"
		local
			yyval123: detachable ET_TYPE_CONSTRAINT_LIST
		do
--|#line 641 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 641")
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
			--|#line 641 "et_eiffel_parser.y"
		local
			yyval123: detachable ET_TYPE_CONSTRAINT_LIST
		do
--|#line 641 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 641")
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
			--|#line 654 "et_eiffel_parser.y"
		local
			yyval123: detachable ET_TYPE_CONSTRAINT_LIST
		do
--|#line 654 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 654")
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
			--|#line 665 "et_eiffel_parser.y"
		local
			yyval123: detachable ET_TYPE_CONSTRAINT_LIST
		do
--|#line 665 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 665")
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
			--|#line 674 "et_eiffel_parser.y"
		local
			yyval122: detachable ET_TYPE_CONSTRAINT_ITEM
		do
--|#line 674 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 674")
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
			--|#line 683 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 683 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 683")
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
			--|#line 685 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 685 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 685")
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
			--|#line 685 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 685 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 685")
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
			--|#line 698 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 698 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 698")
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
			--|#line 709 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 709 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 709")
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
			--|#line 718 "et_eiffel_parser.y"
		local
			yyval53: detachable ET_CONSTRAINT_RENAME_LIST
		do
--|#line 718 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 718")
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
			--|#line 727 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 727 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 727")
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
			--|#line 729 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 729 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 729")
end

yyval52 := yyvs52.item (yyvsp52) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
		end

	yy_do_action_86
			--|#line 733 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 733 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 733")
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
			--|#line 735 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 735 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 735")
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
			--|#line 735 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 735 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 735")
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
			--|#line 748 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 748 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 748")
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
			--|#line 760 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 760 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 760")
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
			--|#line 768 "et_eiffel_parser.y"
		local
			yyval52: detachable ET_CONSTRAINT_CREATOR
		do
--|#line 768 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 768")
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
			--|#line 777 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 777 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 777")
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
			--|#line 779 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 779 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 779")
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
			--|#line 781 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 781 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 781")
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
			--|#line 783 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 783 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 783")
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
			--|#line 785 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 785 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 785")
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
			--|#line 787 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 787 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 787")
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
			--|#line 789 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 789 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 789")
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
			--|#line 791 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 791 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 791")
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
			--|#line 793 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 793 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 793")
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
			--|#line 795 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 795 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 795")
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
			--|#line 797 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 797 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 797")
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
			--|#line 799 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 799 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 799")
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
			--|#line 801 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 801 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 801")
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
			--|#line 803 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 803 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 803")
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
			--|#line 805 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 805 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 805")
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
			--|#line 807 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 807 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 807")
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
			--|#line 809 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 809 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 809")
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
			--|#line 811 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 811 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 811")
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
			--|#line 813 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 813 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 813")
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
			--|#line 815 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 815 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 815")
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
			--|#line 817 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 817 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 817")
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
			--|#line 819 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 819 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 819")
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
			--|#line 823 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 823 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 823")
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
			--|#line 825 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 825 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 825")
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
			--|#line 827 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 827 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 827")
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
			--|#line 829 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 829 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 829")
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
			--|#line 831 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 831 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 831")
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
			--|#line 833 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 833 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 833")
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
			--|#line 835 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 835 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 835")
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
			--|#line 837 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 837 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 837")
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
			--|#line 839 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 839 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 839")
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
			--|#line 841 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 841 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 841")
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
			--|#line 843 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 843 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 843")
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
			--|#line 845 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 845 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 845")
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
			--|#line 847 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 847 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 847")
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
			--|#line 849 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 849 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 849")
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
			--|#line 851 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 851 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 851")
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
			--|#line 853 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 853 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 853")
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
			--|#line 855 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 855 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 855")
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
			--|#line 857 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 857 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 857")
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
			--|#line 859 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 859 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 859")
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
			--|#line 861 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 861 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 861")
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
			--|#line 863 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 863 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 863")
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
			--|#line 865 "et_eiffel_parser.y"
		local
			yyval54: detachable ET_CONSTRAINT_TYPE
		do
--|#line 865 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 865")
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
			--|#line 869 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 869 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 869")
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
			--|#line 871 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 871 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 871")
end

yyval51 := yyvs51.item (yyvsp51) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_138
			--|#line 875 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 875 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 875")
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
			--|#line 878 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 878 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 878")
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
			--|#line 886 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 886 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 886")
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
			--|#line 897 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 897 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 897")
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
			--|#line 902 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 902 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 902")
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
			--|#line 909 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 909 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 909")
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
			--|#line 918 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 918 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 918")
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
			--|#line 920 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 920 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 920")
end

yyval51 := yyvs51.item (yyvsp51) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
		end

	yy_do_action_146
			--|#line 924 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 924 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 924")
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
			--|#line 927 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 927 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 927")
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
			--|#line 933 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 933 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 933")
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
			--|#line 941 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 941 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 941")
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
			--|#line 946 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 946 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 946")
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
			--|#line 951 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 951 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 951")
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
			--|#line 956 "et_eiffel_parser.y"
		local
			yyval51: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
--|#line 956 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 956")
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
			--|#line 969 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 969 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 969")
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
			--|#line 978 "et_eiffel_parser.y"
		local
			yyval50: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
--|#line 978 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 978")
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
			--|#line 989 "et_eiffel_parser.y"
		local
			yyval105: detachable ET_OBSOLETE
		do
--|#line 989 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 989")
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
			--|#line 991 "et_eiffel_parser.y"
		local
			yyval105: detachable ET_OBSOLETE
		do
--|#line 991 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 991")
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
			--|#line 997 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 997 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 997")
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
			--|#line 999 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 999 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 999")
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
			--|#line 1006 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 1006 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1006")
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
			--|#line 1017 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 1017 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1017")
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
			--|#line 1017 "et_eiffel_parser.y"
		local
			yyval108: detachable ET_PARENT_CLAUSE_LIST
		do
--|#line 1017 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1017")
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
			--|#line 1032 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1032 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1032")
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
			--|#line 1039 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1039 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1039")
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
			--|#line 1039 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1039 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1039")
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
			--|#line 1055 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1055 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1055")
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
			--|#line 1062 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1062 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1062")
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
			--|#line 1070 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1070 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1070")
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
			--|#line 1077 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1077 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1077")
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
			--|#line 1084 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1084 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1084")
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
			--|#line 1091 "et_eiffel_parser.y"
		local
			yyval107: detachable ET_PARENT
		do
--|#line 1091 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1091")
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
			--|#line 1100 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1100 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1100")
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
			--|#line 1107 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1107 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1107")
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
			--|#line 1114 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1114 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1114")
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
			--|#line 1121 "et_eiffel_parser.y"
		local
			yyval110: detachable ET_PARENT_LIST
		do
--|#line 1121 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1121")
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
			--|#line 1130 "et_eiffel_parser.y"
		local
			yyval109: detachable ET_PARENT_ITEM
		do
--|#line 1130 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1130")
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
			--|#line 1141 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1141 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1141")
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
			--|#line 1143 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1143 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1143")
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
			--|#line 1143 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1143 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1143")
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
			--|#line 1156 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1156 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1156")
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
			--|#line 1163 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1163 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1163")
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
			--|#line 1172 "et_eiffel_parser.y"
		local
			yyval117: detachable ET_RENAME_LIST
		do
--|#line 1172 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1172")
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
			--|#line 1181 "et_eiffel_parser.y"
		local
			yyval116: detachable ET_RENAME_ITEM
		do
--|#line 1181 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1181")
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
			--|#line 1190 "et_eiffel_parser.y"
		local
			yyval116: detachable ET_RENAME_ITEM
		do
--|#line 1190 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1190")
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
			--|#line 1201 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1201 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1201")
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
			--|#line 1203 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1203 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1203")
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
			--|#line 1203 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1203 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1203")
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
			--|#line 1216 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1216 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1216")
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
			--|#line 1218 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1218 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1218")
end

yyval68 := yyvs68.item (yyvsp68) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines68.force (yyvs68, yyval68, yyvsp68)
end
		end

	yy_do_action_189
			--|#line 1222 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1222 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1222")
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
			--|#line 1233 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1233 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1233")
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
			--|#line 1233 "et_eiffel_parser.y"
		local
			yyval68: detachable ET_EXPORT_LIST
		do
--|#line 1233 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1233")
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
			--|#line 1248 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXPORT
		do
--|#line 1248 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1248")
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
			--|#line 1252 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXPORT
		do
--|#line 1252 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1252")
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
			--|#line 1257 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXPORT
		do
--|#line 1257 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1257")
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
			--|#line 1257 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXPORT
		do
--|#line 1257 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1257")
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
			--|#line 1267 "et_eiffel_parser.y"
		local
			yyval67: detachable ET_EXPORT
		do
--|#line 1267 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1267")
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
			--|#line 1271 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FEATURE_EXPORT
		do
--|#line 1271 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1271")
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
			--|#line 1282 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FEATURE_EXPORT
		do
--|#line 1282 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1282")
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
			--|#line 1290 "et_eiffel_parser.y"
		local
			yyval75: detachable ET_FEATURE_EXPORT
		do
--|#line 1290 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1290")
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
			--|#line 1301 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1301 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1301")
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
			--|#line 1301 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1301 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1301")
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
			--|#line 1312 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1312 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1312")
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
			--|#line 1316 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1316 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1316")
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
			--|#line 1323 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1323 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1323")
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
			--|#line 1331 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1331 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1331")
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
			--|#line 1338 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1338 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1338")
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
			--|#line 1348 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENT_ITEM
		do
--|#line 1348 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1348")
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
			--|#line 1357 "et_eiffel_parser.y"
		local
			yyval45: detachable ET_CLIENT_ITEM
		do
--|#line 1357 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1357")
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
			--|#line 1367 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1367 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1367")
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
			--|#line 1369 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1369 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1369")
end

yyval46 := yyvs46.item (yyvsp46) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
		end

	yy_do_action_211
			--|#line 1373 "et_eiffel_parser.y"
		local
			yyval46: detachable ET_CLIENTS
		do
--|#line 1373 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1373")
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
			--|#line 1384 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1384 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1384")
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
			--|#line 1386 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1386 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1386")
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
			--|#line 1386 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1386 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1386")
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
			--|#line 1399 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1399 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1399")
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
			--|#line 1401 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1401")
end

yyval95 := yyvs95.item (yyvsp95) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_217
			--|#line 1405 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1405 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1405")
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
			--|#line 1407 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1407 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1407")
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
			--|#line 1407 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1407 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1407")
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
			--|#line 1420 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1420 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1420")
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
			--|#line 1422 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1422 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1422")
end

yyval95 := yyvs95.item (yyvsp95) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_222
			--|#line 1426 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1426 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1426")
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
			--|#line 1428 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1428 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1428")
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
			--|#line 1428 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1428 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1428")
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
			--|#line 1441 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1441 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1441")
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
			--|#line 1443 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1443 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1443")
end

yyval95 := yyvs95.item (yyvsp95) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines95.force (yyvs95, yyval95, yyvsp95)
end
		end

	yy_do_action_227
			--|#line 1447 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1447 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1447")
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
			--|#line 1458 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1458 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1458")
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
			--|#line 1466 "et_eiffel_parser.y"
		local
			yyval95: detachable ET_KEYWORD_FEATURE_NAME_LIST
		do
--|#line 1466 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1466")
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
			--|#line 1475 "et_eiffel_parser.y"
		local
			yyval77: detachable ET_FEATURE_NAME_ITEM
		do
--|#line 1475 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1475")
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
			--|#line 1486 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_CREATOR_LIST
		do
--|#line 1486 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1486")
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
			--|#line 1488 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_CREATOR_LIST
		do
--|#line 1488 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1488")
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
			--|#line 1495 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_CREATOR_LIST
		do
--|#line 1495 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1495")
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
			--|#line 1506 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_CREATOR_LIST
		do
--|#line 1506 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1506")
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
			--|#line 1506 "et_eiffel_parser.y"
		local
			yyval61: detachable ET_CREATOR_LIST
		do
--|#line 1506 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1506")
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
			--|#line 1521 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1521 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1521")
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
			--|#line 1523 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1523 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1523")
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
			--|#line 1525 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1525 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1525")
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
			--|#line 1525 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1525 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1525")
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
			--|#line 1537 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1537 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1537")
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
			--|#line 1537 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1537 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1537")
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
			--|#line 1549 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1549 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1549")
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
			--|#line 1551 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1551 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1551")
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
			--|#line 1553 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1553 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1553")
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
			--|#line 1553 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1553 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1553")
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
			--|#line 1565 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1565 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1565")
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
			--|#line 1565 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1565 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1565")
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
			--|#line 1579 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1579 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1579")
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
			--|#line 1591 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1591 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1591")
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
			--|#line 1603 "et_eiffel_parser.y"
		local
			yyval60: detachable ET_CREATOR
		do
--|#line 1603 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1603")
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
			--|#line 1612 "et_eiffel_parser.y"
		local
			yyval77: detachable ET_FEATURE_NAME_ITEM
		do
--|#line 1612 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1612")
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
			--|#line 1628 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1628 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1628")
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
			--|#line 1630 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1630 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1630")
end

yyval57 := yyvs57.item (yyvsp57) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
		end

	yy_do_action_254
			--|#line 1634 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1634 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1634")
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
			--|#line 1634 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1634 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1634")
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
			--|#line 1647 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1647 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1647")
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
			--|#line 1654 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1654 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1654")
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
			--|#line 1661 "et_eiffel_parser.y"
		local
			yyval57: detachable ET_CONVERT_FEATURE_LIST
		do
--|#line 1661 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1661")
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
			--|#line 1670 "et_eiffel_parser.y"
		local
			yyval56: detachable ET_CONVERT_FEATURE_ITEM
		do
--|#line 1670 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1670")
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
			--|#line 1679 "et_eiffel_parser.y"
		local
			yyval55: detachable ET_CONVERT_FEATURE
		do
--|#line 1679 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1679")
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
			--|#line 1683 "et_eiffel_parser.y"
		local
			yyval55: detachable ET_CONVERT_FEATURE
		do
--|#line 1683 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1683")
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
			--|#line 1689 "et_eiffel_parser.y"
		local
			yyval125: detachable ET_TYPE_LIST
		do
--|#line 1689 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1689")
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
			--|#line 1691 "et_eiffel_parser.y"
		local
			yyval125: detachable ET_TYPE_LIST
		do
--|#line 1691 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1691")
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
			--|#line 1691 "et_eiffel_parser.y"
		local
			yyval125: detachable ET_TYPE_LIST
		do
--|#line 1691 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1691")
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
			--|#line 1704 "et_eiffel_parser.y"
		local
			yyval125: detachable ET_TYPE_LIST
		do
--|#line 1704 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1704")
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
			--|#line 1715 "et_eiffel_parser.y"
		local
			yyval125: detachable ET_TYPE_LIST
		do
--|#line 1715 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1715")
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
			--|#line 1724 "et_eiffel_parser.y"
		local
			yyval124: detachable ET_TYPE_ITEM
		do
--|#line 1724 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1724")
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
			--|#line 1735 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1735 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1735")
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
			--|#line 1740 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1740 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1740")
end

yyval74 := yyvs74.item (yyvsp74) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines74.force (yyvs74, yyval74, yyvsp74)
end
		end

	yy_do_action_270
			--|#line 1744 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1744 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1744")
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
			--|#line 1752 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1752 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1752")
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
			--|#line 1759 "et_eiffel_parser.y"
		local
			yyval74: detachable ET_FEATURE_CLAUSE_LIST
		do
--|#line 1759 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1759")
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
			--|#line 1768 "et_eiffel_parser.y"
		local
			yyval73: detachable ET_FEATURE_CLAUSE
		do
--|#line 1768 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1768")
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
			--|#line 1775 "et_eiffel_parser.y"
		local
			yyval73: detachable ET_FEATURE_CLAUSE
		do
--|#line 1775 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1775")
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
			--|#line 1784 "et_eiffel_parser.y"
		local
			yyval73: detachable ET_FEATURE_CLAUSE
		do
--|#line 1784 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1784")
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
			--|#line 1789 "et_eiffel_parser.y"
		local
			yyval73: detachable ET_FEATURE_CLAUSE
		do
--|#line 1789 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1789")
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
			--|#line 1796 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 1796 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1796")
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
			--|#line 1798 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 1798 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1798")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp115 := yyvsp115 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_280
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
	yyvsp113 := yyvsp113 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_281
			--|#line 1804 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1804 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1804")
end

			yyval115 := yyvs115.item (yyvsp115)
			register_query (yyval115)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines115.force (yyvs115, yyval115, yyvsp115)
end
		end

	yy_do_action_282
			--|#line 1809 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1809 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1809")
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
			--|#line 1817 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1817 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1817")
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
			--|#line 1822 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1822 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1822")
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
			--|#line 1828 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1828 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1828")
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
			--|#line 1836 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1836 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1836")
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
			--|#line 1847 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1847 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1847")
end

			yyval113 := yyvs113.item (yyvsp113)
			register_procedure (yyval113)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines113.force (yyvs113, yyval113, yyvsp113)
end
		end

	yy_do_action_288
			--|#line 1852 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1852 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1852")
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
			--|#line 1860 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1860 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1860")
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
			--|#line 1865 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1865 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1865")
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
			--|#line 1871 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1871 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1871")
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
			--|#line 1879 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 1879 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1879")
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
			--|#line 1890 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1890 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1890")
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
			--|#line 1892 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1892 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1892")
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
			--|#line 1894 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1894 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1894")
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
			--|#line 1898 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1898 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1898")
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
			--|#line 1900 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1900 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1900")
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
			--|#line 1908 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1908 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1908")
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
			--|#line 1910 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1910 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1910")
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
			--|#line 1918 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1918 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1918")
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
			--|#line 1921 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1921 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1921")
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
			--|#line 1930 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1930 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1930")
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
			--|#line 1934 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1934 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1934")
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
			--|#line 1944 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1944 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1944")
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
			--|#line 1947 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1947 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1947")
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
			--|#line 1956 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1956 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1956")
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
			--|#line 1960 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1960 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1960")
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
			--|#line 1970 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1970 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1970")
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
			--|#line 1972 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1972 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1972")
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
			--|#line 1980 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1980 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1980")
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
			--|#line 1983 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1983 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1983")
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
			--|#line 1992 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1992 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1992")
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
			--|#line 1995 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 1995 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 1995")
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
			--|#line 2004 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 2004 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2004")
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
			--|#line 2008 "et_eiffel_parser.y"
		local
			yyval115: detachable ET_QUERY
		do
--|#line 2008 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2008")
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
			--|#line 2020 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2020 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2020")
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
			--|#line 2023 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2023 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2023")
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
			--|#line 2027 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2027 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2027")
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
			--|#line 2030 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2030 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2030")
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
			--|#line 2034 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2034 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2034")
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
			--|#line 2036 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2036 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2036")
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
			--|#line 2039 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2039 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2039")
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
			--|#line 2042 "et_eiffel_parser.y"
		local
			yyval113: detachable ET_PROCEDURE
		do
--|#line 2042 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2042")
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
			--|#line 2048 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 2048 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2048")
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
			--|#line 2056 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 2056 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2056")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_326
			--|#line 2060 "et_eiffel_parser.y"
		local
			yyval21: detachable ET_SEMICOLON_SYMBOL
		do
--|#line 2060 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2060")
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
			--|#line 2062 "et_eiffel_parser.y"
		local
			yyval21: detachable ET_SEMICOLON_SYMBOL
		do
--|#line 2062 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2062")
end

yyval21 := yyvs21.item (yyvsp21) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_328
			--|#line 2066 "et_eiffel_parser.y"
		local
			yyval72: detachable ET_EXTERNAL_ALIAS
		do
--|#line 2066 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2066")
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
			--|#line 2068 "et_eiffel_parser.y"
		local
			yyval72: detachable ET_EXTERNAL_ALIAS
		do
--|#line 2068 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2068")
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
			--|#line 2072 "et_eiffel_parser.y"
		local
			yyval35: detachable ET_ASSIGNER
		do
--|#line 2072 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2072")
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
			--|#line 2074 "et_eiffel_parser.y"
		local
			yyval35: detachable ET_ASSIGNER
		do
--|#line 2074 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2074")
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
			--|#line 2080 "et_eiffel_parser.y"
		local
			yyval76: detachable ET_FEATURE_NAME
		do
--|#line 2080 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2080")
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
			--|#line 2089 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_EXTENDED_FEATURE_NAME
		do
--|#line 2089 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2089")
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
			--|#line 2091 "et_eiffel_parser.y"
		local
			yyval71: detachable ET_EXTENDED_FEATURE_NAME
		do
--|#line 2091 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2091")
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
			--|#line 2103 "et_eiffel_parser.y"
		local
			yyval34: detachable ET_ALIAS_NAME_LIST
		do
--|#line 2103 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2103")
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
			--|#line 2114 "et_eiffel_parser.y"
		local
			yyval34: detachable ET_ALIAS_NAME_LIST
		do
--|#line 2114 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2114")
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
			--|#line 2114 "et_eiffel_parser.y"
		local
			yyval34: detachable ET_ALIAS_NAME_LIST
		do
--|#line 2114 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2114")
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
			--|#line 2129 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2129 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2129")
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
			--|#line 2131 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2131 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2131")
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
			--|#line 2133 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2133 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2133")
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
			--|#line 2135 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2135 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2135")
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
			--|#line 2137 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2137 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2137")
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
			--|#line 2139 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2139 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2139")
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
			--|#line 2141 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2141 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2141")
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
			--|#line 2143 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2143 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2143")
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
			--|#line 2145 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2145 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2145")
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
			--|#line 2147 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2147 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2147")
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
			--|#line 2149 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2149 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2149")
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
			--|#line 2151 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2151 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2151")
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
			--|#line 2153 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2153 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2153")
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
			--|#line 2155 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2155 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2155")
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
			--|#line 2157 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2157 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2157")
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
			--|#line 2159 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2159 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2159")
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
			--|#line 2161 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2161 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2161")
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
			--|#line 2163 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2163 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2163")
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
			--|#line 2165 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2165 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2165")
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
			--|#line 2167 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2167 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2167")
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
			--|#line 2169 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2169 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2169")
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
			--|#line 2171 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2171 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2171")
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
			--|#line 2173 "et_eiffel_parser.y"
		local
			yyval33: detachable ET_ALIAS_NAME
		do
--|#line 2173 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2173")
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
			--|#line 2177 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 2177 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2177")
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
			--|#line 2179 "et_eiffel_parser.y"
		local
			yyval2: detachable ET_KEYWORD
		do
--|#line 2179 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2179")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_363
			--|#line 2185 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2185 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2185")
end

			yyval80 := yyvs80.item (yyvsp80)
			set_start_closure (yyval80)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_364
			--|#line 2192 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2192 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2192")
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
			--|#line 2194 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2194 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2194")
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
			--|#line 2202 "et_eiffel_parser.y"
		local
			yyval5: detachable ET_SYMBOL
		do
--|#line 2202 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2202")
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
			--|#line 2213 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2213 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2213")
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
			--|#line 2220 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2220 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2220")
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
			--|#line 2227 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2227 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2227")
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
			--|#line 2237 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2237 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2237")
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
			--|#line 2248 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2248 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2248")
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
			--|#line 2255 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 2255 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2255")
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
			--|#line 2264 "et_eiffel_parser.y"
		local
			yyval78: detachable ET_FORMAL_ARGUMENT
		do
--|#line 2264 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2264")
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
			--|#line 2273 "et_eiffel_parser.y"
		local
			yyval78: detachable ET_FORMAL_ARGUMENT
		do
--|#line 2273 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2273")
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
			--|#line 2282 "et_eiffel_parser.y"
		local
			yyval79: detachable ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2282 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2282")
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
			--|#line 2291 "et_eiffel_parser.y"
		local
			yyval79: detachable ET_FORMAL_ARGUMENT_ITEM
		do
--|#line 2291 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2291")
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
			--|#line 2302 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2302 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2302")
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
			--|#line 2304 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2304 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2304")
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
			--|#line 2306 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2306 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2306")
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
			--|#line 2306 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2306 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2306")
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
			--|#line 2319 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2319 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2319")
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
			--|#line 2326 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2326 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2326")
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
			--|#line 2333 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2333 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2333")
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
			--|#line 2343 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2343 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2343")
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
			--|#line 2354 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2354 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2354")
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
			--|#line 2361 "et_eiffel_parser.y"
		local
			yyval99: detachable ET_LOCAL_VARIABLE_LIST
		do
--|#line 2361 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2361")
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
			--|#line 2370 "et_eiffel_parser.y"
		local
			yyval97: detachable ET_LOCAL_VARIABLE
		do
--|#line 2370 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2370")
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
			--|#line 2379 "et_eiffel_parser.y"
		local
			yyval97: detachable ET_LOCAL_VARIABLE
		do
--|#line 2379 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2379")
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
			--|#line 2388 "et_eiffel_parser.y"
		local
			yyval98: detachable ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2388 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2388")
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
			--|#line 2397 "et_eiffel_parser.y"
		local
			yyval98: detachable ET_LOCAL_VARIABLE_ITEM
		do
--|#line 2397 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2397")
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
			--|#line 2408 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2408 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2408")
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
			--|#line 2410 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2410 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2410")
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
			--|#line 2412 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2412 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2412")
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
			--|#line 2414 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2414 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2414")
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
			--|#line 2416 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2416 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2416")
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
			--|#line 2425 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2425 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2425")
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
			--|#line 2434 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2434 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2434")
end

add_expression_assertion (yyvs69.item (yyvsp69), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp69 := yyvsp69 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_398
			--|#line 2436 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2436 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2436")
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
			--|#line 2438 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2438 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2438")
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
			--|#line 2440 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2440 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2440")
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
			--|#line 2442 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2442 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2442")
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
			--|#line 2451 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2451 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2451")
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
			--|#line 2462 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2462 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2462")
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
			--|#line 2466 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_PRECONDITIONS
		do
--|#line 2466 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2466")
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
			--|#line 2468 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_PRECONDITIONS
		do
--|#line 2468 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2468")
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
			--|#line 2470 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_PRECONDITIONS
		do
--|#line 2470 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2470")
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
			--|#line 2472 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_PRECONDITIONS
		do
--|#line 2472 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2472")
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
			--|#line 2474 "et_eiffel_parser.y"
		local
			yyval112: detachable ET_PRECONDITIONS
		do
--|#line 2474 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2474")
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
			--|#line 2478 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2478 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2478")
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
			--|#line 2482 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_POSTCONDITIONS
		do
--|#line 2482 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2482")
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
			--|#line 2484 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_POSTCONDITIONS
		do
--|#line 2484 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2484")
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
			--|#line 2486 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_POSTCONDITIONS
		do
--|#line 2486 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2486")
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
			--|#line 2488 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_POSTCONDITIONS
		do
--|#line 2488 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2488")
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
			--|#line 2490 "et_eiffel_parser.y"
		local
			yyval111: detachable ET_POSTCONDITIONS
		do
--|#line 2490 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2490")
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
			--|#line 2494 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2494 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2494")
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
			--|#line 2498 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_INVARIANTS
		do
--|#line 2498 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2498")
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
			--|#line 2500 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_INVARIANTS
		do
--|#line 2500 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2500")
end

yyval94 := yyvs94.item (yyvsp94) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines94.force (yyvs94, yyval94, yyvsp94)
end
		end

	yy_do_action_418
			--|#line 2504 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_INVARIANTS
		do
--|#line 2504 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2504")
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
			--|#line 2506 "et_eiffel_parser.y"
		local
			yyval94: detachable ET_INVARIANTS
		do
--|#line 2506 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2506")
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
			--|#line 2510 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2510 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2510")
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
			--|#line 2514 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2514 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2514")
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
			--|#line 2518 "et_eiffel_parser.y"
		local
			yyval100: detachable ET_LOOP_INVARIANTS
		do
--|#line 2518 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2518")
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
			--|#line 2520 "et_eiffel_parser.y"
		local
			yyval100: detachable ET_LOOP_INVARIANTS
		do
--|#line 2520 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2520")
end

yyval100 := yyvs100.item (yyvsp100) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines100.force (yyvs100, yyval100, yyvsp100)
end
		end

	yy_do_action_424
			--|#line 2524 "et_eiffel_parser.y"
		local
			yyval100: detachable ET_LOOP_INVARIANTS
		do
--|#line 2524 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2524")
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
			--|#line 2526 "et_eiffel_parser.y"
		local
			yyval100: detachable ET_LOOP_INVARIANTS
		do
--|#line 2526 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2526")
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
			--|#line 2530 "et_eiffel_parser.y"
		local
			yyval126: detachable ET_VARIANT
		do
--|#line 2530 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2530")
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
			--|#line 2532 "et_eiffel_parser.y"
		local
			yyval126: detachable ET_VARIANT
		do
--|#line 2532 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2532")
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
			--|#line 2536 "et_eiffel_parser.y"
		local
			yyval126: detachable ET_VARIANT
		do
--|#line 2536 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2536")
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
			--|#line 2538 "et_eiffel_parser.y"
		local
			yyval126: detachable ET_VARIANT
		do
--|#line 2538 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2538")
end

yyval126 := yyvs126.item (yyvsp126) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines126.force (yyvs126, yyval126, yyvsp126)
end
		end

	yy_do_action_430
			--|#line 2544 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 2544 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2544")
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
			--|#line 2546 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 2546 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2546")
end

yyval47 := yyvs47.item (yyvsp47) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_432
			--|#line 2552 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2552 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2552")
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
			--|#line 2554 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2554 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2554")
end

yyval120 := yyvs120.item (yyvsp120) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines120.force (yyvs120, yyval120, yyvsp120)
end
		end

	yy_do_action_434
			--|#line 2558 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2558 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2558")
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
			--|#line 2560 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2560 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2560")
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
			--|#line 2562 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2562 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2562")
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
			--|#line 2564 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2564 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2564")
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
			--|#line 2566 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2566 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2566")
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
			--|#line 2568 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2568 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2568")
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
			--|#line 2570 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2570 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2570")
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
			--|#line 2572 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2572 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2572")
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
			--|#line 2574 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2574 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2574")
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
			--|#line 2576 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2576 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2576")
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
			--|#line 2578 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2578 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2578")
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
			--|#line 2580 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2580 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2580")
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
			--|#line 2582 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2582 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2582")
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
			--|#line 2584 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2584 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2584")
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
			--|#line 2586 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2586 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2586")
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
			--|#line 2588 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2588 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2588")
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
			--|#line 2590 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2590 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2590")
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
			--|#line 2592 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2592 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2592")
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
			--|#line 2594 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2594 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2594")
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
			--|#line 2596 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2596 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2596")
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
			--|#line 2598 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2598 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2598")
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
			--|#line 2600 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2600 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2600")
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
			--|#line 2604 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2604 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2604")
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
			--|#line 2606 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2606 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2606")
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
			--|#line 2608 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2608 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2608")
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
			--|#line 2610 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2610 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2610")
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
			--|#line 2612 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2612 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2612")
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
			--|#line 2614 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2614 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2614")
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
			--|#line 2616 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2616 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2616")
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
			--|#line 2618 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2618 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2618")
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
			--|#line 2620 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2620 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2620")
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
			--|#line 2622 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2622 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2622")
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
			--|#line 2624 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2624 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2624")
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
			--|#line 2626 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2626 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2626")
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
			--|#line 2628 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2628 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2628")
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
			--|#line 2630 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2630 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2630")
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
			--|#line 2632 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2632 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2632")
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
			--|#line 2634 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2634 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2634")
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
			--|#line 2636 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2636 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2636")
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
			--|#line 2638 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2638 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2638")
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
			--|#line 2640 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2640 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2640")
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
			--|#line 2642 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2642 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2642")
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
			--|#line 2644 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2644 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2644")
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
			--|#line 2646 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2646 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2646")
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
			--|#line 2650 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2650 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2650")
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
			--|#line 2652 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2652 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2652")
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
			--|#line 2654 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2654 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2654")
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
			--|#line 2656 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2656 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2656")
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
			--|#line 2658 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2658 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2658")
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
			--|#line 2660 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2660 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2660")
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
			--|#line 2662 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2662 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2662")
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
			--|#line 2664 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2664 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2664")
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
			--|#line 2666 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2666 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2666")
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
			--|#line 2668 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2668 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2668")
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
			--|#line 2670 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2670 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2670")
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
			--|#line 2672 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2672 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2672")
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
			--|#line 2674 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2674 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2674")
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
			--|#line 2676 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2676 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2676")
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
			--|#line 2678 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2678 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2678")
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
			--|#line 2680 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2680 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2680")
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
			--|#line 2682 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2682 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2682")
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
			--|#line 2684 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2684 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2684")
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
			--|#line 2686 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2686 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2686")
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
			--|#line 2688 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2688 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2688")
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
			--|#line 2690 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2690 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2690")
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
			--|#line 2692 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2692 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2692")
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
			--|#line 2694 "et_eiffel_parser.y"
		local
			yyval120: detachable ET_TYPE
		do
--|#line 2694 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2694")
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
			--|#line 2698 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 2698 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2698")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_502
			--|#line 2700 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 2700 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2700")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_503
			--|#line 2704 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2704 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2704")
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
			--|#line 2706 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2706 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2706")
end

yyval28 := yyvs28.item (yyvsp28) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_505
			--|#line 2710 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2710 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2710")
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
			--|#line 2713 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2713 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2713")
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
			--|#line 2721 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2721 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2721")
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
			--|#line 2728 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2728 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2728")
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
			--|#line 2739 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2739 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2739")
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
			--|#line 2744 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2744 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2744")
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
			--|#line 2749 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2749 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2749")
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
			--|#line 2754 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2754 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2754")
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
			--|#line 2761 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 2761 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2761")
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
			--|#line 2767 "et_eiffel_parser.y"
		local
			yyval27: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2767 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2767")
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
			--|#line 2776 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2776 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2776")
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
			--|#line 2778 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2778 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2778")
end

yyval28 := yyvs28.item (yyvsp28) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
		end

	yy_do_action_517
			--|#line 2782 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2782 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2782")
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
			--|#line 2785 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2785 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2785")
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
			--|#line 2791 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2791 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2791")
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
			--|#line 2799 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2799 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2799")
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
			--|#line 2804 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2804 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2804")
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
			--|#line 2809 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2809 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2809")
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
			--|#line 2814 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2814 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2814")
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
			--|#line 2825 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2825 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2825")
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
			--|#line 2836 "et_eiffel_parser.y"
		local
			yyval28: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 2836 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2836")
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
			--|#line 2849 "et_eiffel_parser.y"
		local
			yyval27: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2849 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2849")
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
			--|#line 2858 "et_eiffel_parser.y"
		local
			yyval27: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 2858 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2858")
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
			--|#line 2867 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2867 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2867")
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
			--|#line 2869 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2869 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2869")
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
			--|#line 2871 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2871 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2871")
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
			--|#line 2875 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2875 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2875")
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
			--|#line 2877 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2877 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2877")
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
			--|#line 2879 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2879 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2879")
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
			--|#line 2881 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2881 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2881")
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
			--|#line 2883 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2883 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2883")
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
			--|#line 2885 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2885 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2885")
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
			--|#line 2887 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2887 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2887")
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
			--|#line 2889 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2889 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2889")
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
			--|#line 2891 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2891 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2891")
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
			--|#line 2893 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2893 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2893")
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
			--|#line 2895 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2895 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2895")
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
			--|#line 2897 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2897 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2897")
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
			--|#line 2899 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2899 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2899")
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
			--|#line 2901 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2901 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2901")
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
			--|#line 2903 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2903 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2903")
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
			--|#line 2905 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2905 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2905")
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
			--|#line 2907 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2907 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2907")
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
			--|#line 2909 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2909 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2909")
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
			--|#line 2911 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2911 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2911")
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
			--|#line 2913 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2913 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2913")
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
			--|#line 2915 "et_eiffel_parser.y"
		local
			yyval96: detachable ET_LIKE_TYPE
		do
--|#line 2915 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2915")
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
			--|#line 2919 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2919 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2919")
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
			--|#line 2921 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2921 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2921")
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
			--|#line 2925 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2925 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2925")
end

yyval114 := yyvs114.item (yyvsp114) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines114.force (yyvs114, yyval114, yyvsp114)
end
		end

	yy_do_action_555
			--|#line 2927 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2927 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2927")
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
			--|#line 2929 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2929 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2929")
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
			--|#line 2931 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2931 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2931")
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
			--|#line 2933 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2933 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2933")
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
			--|#line 2935 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2935 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2935")
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
			--|#line 2937 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2937 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2937")
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
			--|#line 2945 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2945 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2945")
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
			--|#line 2953 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2953 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2953")
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
			--|#line 2961 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2961 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2961")
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
			--|#line 2969 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2969 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2969")
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
			--|#line 2971 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2971 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2971")
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
			--|#line 2973 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2973 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2973")
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
			--|#line 2975 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2975 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2975")
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
			--|#line 2977 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2977 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2977")
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
			--|#line 2979 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2979 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2979")
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
			--|#line 2981 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2981 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2981")
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
			--|#line 2983 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2983 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2983")
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
			--|#line 2985 "et_eiffel_parser.y"
		local
			yyval114: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 2985 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2985")
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
			--|#line 2991 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 2991 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2991")
end

yyval47 := ast_factory.new_do_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_574
			--|#line 2995 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 2995 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2995")
end

yyval47 := ast_factory.new_attribute_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_575
			--|#line 2999 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 2999 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 2999")
end

yyval47 := ast_factory.new_then_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_576
			--|#line 3003 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3003 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3003")
end

yyval47 := ast_factory.new_then_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_577
			--|#line 3007 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3007 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3007")
end

yyval47 := ast_factory.new_else_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_578
			--|#line 3011 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3011 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3011")
end

yyval47 := ast_factory.new_else_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_579
			--|#line 3015 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3015 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3015")
end

yyval47 := ast_factory.new_rescue_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_580
			--|#line 3019 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3019 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3019")
end

yyval47 := ast_factory.new_from_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_581
			--|#line 3023 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3023 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3023")
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
			--|#line 3025 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3025 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3025")
end

yyval47 := yyvs47.item (yyvsp47) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_583
			--|#line 3029 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3029 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3029")
end

yyval47 := ast_factory.new_loop_compound (yyvs2.item (yyvsp2), yyvs47.item (yyvsp47)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_584
			--|#line 3033 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3033 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3033")
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
			--|#line 3040 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3040 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3040")
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
			--|#line 3042 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3042 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3042")
end

yyval47 := yyvs47.item (yyvsp47) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_587
			--|#line 3046 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3046 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3046")
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
			--|#line 3048 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3048 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3048")
end

yyval47 := yyvs47.item (yyvsp47) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
		end

	yy_do_action_589
			--|#line 3052 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3052 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3052")
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
			--|#line 3063 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3063 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3063")
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
			--|#line 3063 "et_eiffel_parser.y"
		local
			yyval47: detachable ET_COMPOUND
		do
--|#line 3063 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3063")
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
			--|#line 3084 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3084 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3084")
end

yyval93 := yyvs93.item (yyvsp93) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_593
			--|#line 3086 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3086 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3086")
end

yyval93 := yyvs93.item (yyvsp93) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_594
			--|#line 3088 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3088 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3088")
end

yyval93 := yyvs93.item (yyvsp93) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines93.force (yyvs93, yyval93, yyvsp93)
end
		end

	yy_do_action_595
			--|#line 3090 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3090 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3090")
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
			--|#line 3092 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3092 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3092")
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
			--|#line 3094 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3094 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3094")
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
			--|#line 3096 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3096 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3096")
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
			--|#line 3098 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3098 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3098")
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
			--|#line 3100 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3100 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3100")
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
			--|#line 3102 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3102 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3102")
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
			--|#line 3104 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3104 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3104")
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
			--|#line 3112 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3112 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3112")
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
			--|#line 3125 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3125 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3125")
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
			--|#line 3127 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3127 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3127")
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
			--|#line 3129 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3129 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3129")
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
			--|#line 3131 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3131 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3131")
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
			--|#line 3133 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3133 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3133")
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
			--|#line 3139 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 3139 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3139")
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
			--|#line 3143 "et_eiffel_parser.y"
		local
			yyval39: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3143 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3143")
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
			--|#line 3145 "et_eiffel_parser.y"
		local
			yyval39: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3145 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3145")
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
			--|#line 3147 "et_eiffel_parser.y"
		local
			yyval39: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3147 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3147")
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
			--|#line 3149 "et_eiffel_parser.y"
		local
			yyval39: detachable ET_CHECK_INSTRUCTION
		do
--|#line 3149 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3149")
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
			--|#line 3155 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3155 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3155")
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
			--|#line 3157 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3157 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3157")
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
			--|#line 3159 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3159 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3159")
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
			--|#line 3161 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3161 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3161")
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
			--|#line 3165 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3165 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3165")
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
			--|#line 3167 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3167 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3167")
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
			--|#line 3169 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3169 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3169")
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
			--|#line 3171 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3171 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3171")
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
			--|#line 3175 "et_eiffel_parser.y"
		local
			yyval58: detachable ET_CREATE_EXPRESSION
		do
--|#line 3175 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3175")
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
			--|#line 3177 "et_eiffel_parser.y"
		local
			yyval58: detachable ET_CREATE_EXPRESSION
		do
--|#line 3177 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3177")
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
			--|#line 3181 "et_eiffel_parser.y"
		local
			yyval59: detachable ET_CREATION_REGION
		do
--|#line 3181 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3181")
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
			--|#line 3182 "et_eiffel_parser.y"
		local
			yyval59: detachable ET_CREATION_REGION
		do
--|#line 3182 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3182")
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
			--|#line 3188 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_IF_INSTRUCTION
		do
--|#line 3188 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3188")
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
			--|#line 3190 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_IF_INSTRUCTION
		do
--|#line 3190 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3190")
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
			--|#line 3192 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_IF_INSTRUCTION
		do
--|#line 3192 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3192")
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
			--|#line 3194 "et_eiffel_parser.y"
		local
			yyval85: detachable ET_IF_INSTRUCTION
		do
--|#line 3194 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3194")
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
			--|#line 3198 "et_eiffel_parser.y"
		local
			yyval66: detachable ET_ELSEIF_PART_LIST
		do
--|#line 3198 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3198")
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
			--|#line 3205 "et_eiffel_parser.y"
		local
			yyval66: detachable ET_ELSEIF_PART_LIST
		do
--|#line 3205 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3205")
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
			--|#line 3212 "et_eiffel_parser.y"
		local
			yyval66: detachable ET_ELSEIF_PART_LIST
		do
--|#line 3212 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3212")
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
			--|#line 3221 "et_eiffel_parser.y"
		local
			yyval65: detachable ET_ELSEIF_PART
		do
--|#line 3221 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3221")
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
			--|#line 3232 "et_eiffel_parser.y"
		local
			yyval84: detachable ET_IF_EXPRESSION
		do
--|#line 3232 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3232")
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
			--|#line 3234 "et_eiffel_parser.y"
		local
			yyval84: detachable ET_IF_EXPRESSION
		do
--|#line 3234 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3234")
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
			--|#line 3238 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_ELSEIF_EXPRESSION_LIST
		do
--|#line 3238 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3238")
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
			--|#line 3245 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_ELSEIF_EXPRESSION_LIST
		do
--|#line 3245 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3245")
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
			--|#line 3252 "et_eiffel_parser.y"
		local
			yyval64: detachable ET_ELSEIF_EXPRESSION_LIST
		do
--|#line 3252 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3252")
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
			--|#line 3261 "et_eiffel_parser.y"
		local
			yyval63: detachable ET_ELSEIF_EXPRESSION
		do
--|#line 3261 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3261")
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
			--|#line 3272 "et_eiffel_parser.y"
		local
			yyval92: detachable ET_INSPECT_INSTRUCTION
		do
--|#line 3272 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3272")
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
			--|#line 3274 "et_eiffel_parser.y"
		local
			yyval92: detachable ET_INSPECT_INSTRUCTION
		do
--|#line 3274 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3274")
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
			--|#line 3278 "et_eiffel_parser.y"
		local
			yyval128: detachable ET_WHEN_PART_LIST
		do
--|#line 3278 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3278")
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
			--|#line 3280 "et_eiffel_parser.y"
		local
			yyval128: detachable ET_WHEN_PART_LIST
		do
--|#line 3280 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3280")
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
			--|#line 3287 "et_eiffel_parser.y"
		local
			yyval128: detachable ET_WHEN_PART_LIST
		do
--|#line 3287 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3287")
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
			--|#line 3294 "et_eiffel_parser.y"
		local
			yyval128: detachable ET_WHEN_PART_LIST
		do
--|#line 3294 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3294")
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
			--|#line 3303 "et_eiffel_parser.y"
		local
			yyval127: detachable ET_WHEN_PART
		do
--|#line 3303 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3303")
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
			--|#line 3312 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3312 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3312")
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
			--|#line 3314 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3314 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3314")
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
			--|#line 3314 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3314 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3314")
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
			--|#line 3327 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3327 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3327")
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
			--|#line 3338 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3338 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3338")
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
			--|#line 3346 "et_eiffel_parser.y"
		local
			yyval43: detachable ET_CHOICE_LIST
		do
--|#line 3346 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3346")
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
			--|#line 3355 "et_eiffel_parser.y"
		local
			yyval42: detachable ET_CHOICE_ITEM
		do
--|#line 3355 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3355")
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
			--|#line 3364 "et_eiffel_parser.y"
		local
			yyval40: detachable ET_CHOICE
		do
--|#line 3364 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3364")
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
			--|#line 3366 "et_eiffel_parser.y"
		local
			yyval40: detachable ET_CHOICE
		do
--|#line 3366 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3366")
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
			--|#line 3370 "et_eiffel_parser.y"
		local
			yyval41: detachable ET_CHOICE_CONSTANT
		do
--|#line 3370 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3370")
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
			--|#line 3372 "et_eiffel_parser.y"
		local
			yyval41: detachable ET_CHOICE_CONSTANT
		do
--|#line 3372 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3372")
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
			--|#line 3374 "et_eiffel_parser.y"
		local
			yyval41: detachable ET_CHOICE_CONSTANT
		do
--|#line 3374 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3374")
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
			--|#line 3376 "et_eiffel_parser.y"
		local
			yyval41: detachable ET_CHOICE_CONSTANT
		do
--|#line 3376 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3376")
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
			--|#line 3382 "et_eiffel_parser.y"
		local
			yyval25: detachable ET_ACROSS_INSTRUCTION
		do
--|#line 3382 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3382")
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
			--|#line 3384 "et_eiffel_parser.y"
		local
			yyval25: detachable ET_ACROSS_INSTRUCTION
		do
--|#line 3384 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3384")
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
			--|#line 3388 "et_eiffel_parser.y"
		local
			yyval48: detachable ET_CONDITIONAL
		do
--|#line 3388 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3388")
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
			--|#line 3390 "et_eiffel_parser.y"
		local
			yyval48: detachable ET_CONDITIONAL
		do
--|#line 3390 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3390")
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
			--|#line 3396 "et_eiffel_parser.y"
		local
			yyval62: detachable ET_DEBUG_INSTRUCTION
		do
--|#line 3396 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3396")
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
			--|#line 3400 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3400 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3400")
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
			--|#line 3402 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3402 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3402")
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
			--|#line 3404 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3404 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3404")
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
			--|#line 3404 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3404 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3404")
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
			--|#line 3417 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3417 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3417")
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
			--|#line 3428 "et_eiffel_parser.y"
		local
			yyval103: detachable ET_MANIFEST_STRING_LIST
		do
--|#line 3428 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3428")
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
			--|#line 3437 "et_eiffel_parser.y"
		local
			yyval102: detachable ET_MANIFEST_STRING_ITEM
		do
--|#line 3437 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3437")
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
			--|#line 3448 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3448 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3448")
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
			--|#line 3450 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3450 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3450")
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
			--|#line 3452 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3452 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3452")
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
			--|#line 3454 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3454 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3454")
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
			--|#line 3456 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3456 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3456")
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
			--|#line 3458 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3458 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3458")
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
			--|#line 3460 "et_eiffel_parser.y"
		local
			yyval93: detachable ET_INSTRUCTION
		do
--|#line 3460 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3460")
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
			--|#line 3464 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3464 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3464")
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
			--|#line 3466 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3466 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3466")
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
			--|#line 3470 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3470 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3470")
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
			--|#line 3474 "et_eiffel_parser.y"
		local
			yyval38: detachable ET_QUALIFIED_CALL_EXPRESSION
		do
--|#line 3474 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3474")
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
			--|#line 3476 "et_eiffel_parser.y"
		local
			yyval38: detachable ET_QUALIFIED_CALL_EXPRESSION
		do
--|#line 3476 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3476")
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
			--|#line 3480 "et_eiffel_parser.y"
		local
			yyval118: detachable ET_STATIC_CALL_EXPRESSION
		do
--|#line 3480 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3480")
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
			--|#line 3482 "et_eiffel_parser.y"
		local
			yyval118: detachable ET_STATIC_CALL_EXPRESSION
		do
--|#line 3482 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3482")
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
			--|#line 3486 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3486 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3486")
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
			--|#line 3488 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3488 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3488")
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
			--|#line 3492 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3492 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3492")
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
			--|#line 3494 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3494 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3494")
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
			--|#line 3496 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3496 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3496")
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
			--|#line 3498 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3498 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3498")
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
			--|#line 3500 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3500 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3500")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_693
			--|#line 3502 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3502 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3502")
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
			--|#line 3510 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3510 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3510")
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
			--|#line 3512 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3512 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3512")
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
			--|#line 3516 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3516 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3516")
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
			--|#line 3524 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3524 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3524")
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
			--|#line 3530 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3530 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3530")
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
			--|#line 3532 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3532 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3532")
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
			--|#line 3534 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3534 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3534")
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
			--|#line 3534 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3534 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3534")
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
			--|#line 3547 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3547 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3547")
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
			--|#line 3558 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3558 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3558")
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
			--|#line 3566 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3566 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3566")
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
			--|#line 3575 "et_eiffel_parser.y"
		local
			yyval70: detachable ET_EXPRESSION_ITEM
		do
--|#line 3575 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3575")
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
			--|#line 3584 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3584 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3584")
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
			--|#line 3586 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3586 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3586")
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
			--|#line 3588 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3588 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3588")
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
			--|#line 3590 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3590 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3590")
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
			--|#line 3597 "et_eiffel_parser.y"
		local
			yyval129: detachable ET_WRITABLE
		do
--|#line 3597 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3597")
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
			--|#line 3599 "et_eiffel_parser.y"
		local
			yyval129: detachable ET_WRITABLE
		do
--|#line 3599 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3599")
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
			--|#line 3605 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3605 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3605")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_713
			--|#line 3607 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3607 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3607")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_714
			--|#line 3611 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3611 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3611")
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
			--|#line 3613 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3613 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3613")
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
			--|#line 3615 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3615 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3615")
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
			--|#line 3617 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3617 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3617")
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
			--|#line 3619 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3619 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3619")
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
			--|#line 3621 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3621 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3621")
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
			--|#line 3623 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3623 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3623")
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
			--|#line 3625 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3625 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3625")
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
			--|#line 3627 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3627 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3627")
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
			--|#line 3629 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3629 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3629")
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
			--|#line 3631 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3631 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3631")
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
			--|#line 3633 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3633 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3633")
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
			--|#line 3635 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3635 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3635")
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
			--|#line 3637 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3637 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3637")
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
			--|#line 3639 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3639 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3639")
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
			--|#line 3641 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3641 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3641")
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
			--|#line 3643 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3643 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3643")
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
			--|#line 3645 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3645 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3645")
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
			--|#line 3647 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3647 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3647")
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
			--|#line 3649 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3649 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3649")
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
			--|#line 3651 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3651 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3651")
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
			--|#line 3653 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3653 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3653")
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
			--|#line 3657 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3657 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3657")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_737
			--|#line 3659 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3659 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3659")
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
			--|#line 3661 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3661 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3661")
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
			--|#line 3663 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3663 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3663")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_740
			--|#line 3665 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3665 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3665")
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
			--|#line 3667 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3667 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3667")
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
			--|#line 3671 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3671 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3671")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_743
			--|#line 3673 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3673 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3673")
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
			--|#line 3675 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3675 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3675")
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
			--|#line 3677 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3677 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3677")
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
			--|#line 3679 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3679 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3679")
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
			--|#line 3681 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3681 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3681")
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
			--|#line 3683 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3683 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3683")
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
			--|#line 3685 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3685 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3685")
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
			--|#line 3687 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3687 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3687")
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
			--|#line 3689 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3689 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3689")
end

yyval69 := new_prefix_plus_expression (yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_752
			--|#line 3691 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3691 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3691")
end

yyval69 := new_prefix_minus_expression (yyvs19.item (yyvsp19), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_753
			--|#line 3693 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3693 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3693")
end

yyval69 := ast_factory.new_prefix_expression (yyvs14.item (yyvsp14), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp14 := yyvsp14 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_754
			--|#line 3695 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3695 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3695")
end

yyval69 := ast_factory.new_prefix_expression (ast_factory.new_prefix_free_operator (yyvs11.item (yyvsp11)), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp11 := yyvsp11 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_755
			--|#line 3697 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3697 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3697")
end

yyval69 := ast_factory.new_old_expression (yyvs2.item (yyvsp2), yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_756
			--|#line 3699 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3699 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3699")
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
			--|#line 3707 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3707 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3707")
end

yyval69 := ast_factory.new_object_test (yyvs2.item (yyvsp2), Void, yyvs69.item (yyvsp69)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_758
			--|#line 3709 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3709 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3709")
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
			--|#line 3711 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3711 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3711")
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
			--|#line 3713 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3713 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3713")
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
			--|#line 3717 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3717 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3717")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_762
			--|#line 3719 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3719 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3719")
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
			--|#line 3721 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3721 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3721")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_764
			--|#line 3723 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3723 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3723")
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
			--|#line 3725 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3725 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3725")
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
			--|#line 3727 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3727 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3727")
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
			--|#line 3729 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3729 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3729")
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
			--|#line 3731 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3731 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3731")
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
			--|#line 3733 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3733 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3733")
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
			--|#line 3735 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3735 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3735")
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
			--|#line 3737 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3737 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3737")
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
			--|#line 3739 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3739 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3739")
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
			--|#line 3741 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3741 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3741")
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
			--|#line 3774 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3774 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3774")
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
			--|#line 3776 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3776 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3776")
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
			--|#line 3778 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3778 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3778")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_777
			--|#line 3782 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3782 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3782")
end

yyval69 := yyvs69.item (yyvsp69) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines69.force (yyvs69, yyval69, yyvsp69)
end
		end

	yy_do_action_778
			--|#line 3784 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3784 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3784")
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
			--|#line 3786 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3786 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3786")
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
			--|#line 3794 "et_eiffel_parser.y"
		local
			yyval69: detachable ET_EXPRESSION
		do
--|#line 3794 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3794")
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
			--|#line 3798 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3798 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3798")
end

yyval36 := yyvs36.item (yyvsp36) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
		end

	yy_do_action_782
			--|#line 3800 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3800 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3800")
end

yyval36 := yyvs36.item (yyvsp36) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
		end

	yy_do_action_783
			--|#line 3804 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3804 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3804")
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
			--|#line 3804 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3804 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3804")
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
			--|#line 3815 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3815 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3815")
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
			--|#line 3815 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3815 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3815")
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
			--|#line 3828 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3828 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3828")
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
			--|#line 3828 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3828 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3828")
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
			--|#line 3839 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3839 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3839")
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
			--|#line 3839 "et_eiffel_parser.y"
		local
			yyval36: detachable ET_BRACKET_EXPRESSION
		do
--|#line 3839 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3839")
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
			--|#line 3852 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3852 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3852")
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
			--|#line 3863 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3863 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3863")
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
			--|#line 3871 "et_eiffel_parser.y"
		local
			yyval26: detachable ET_ACTUAL_ARGUMENT_LIST
		do
--|#line 3871 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3871")
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
			--|#line 3880 "et_eiffel_parser.y"
		local
			yyval106: detachable ET_PARENTHESIZED_EXPRESSION
		do
--|#line 3880 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3880")
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
			--|#line 3888 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3888 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3888")
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
			--|#line 3890 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3890 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3890")
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
			--|#line 3890 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3890 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3890")
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
			--|#line 3903 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3903 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3903")
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
			--|#line 3912 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3912 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3912")
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
			--|#line 3923 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3923 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3923")
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
			--|#line 3931 "et_eiffel_parser.y"
		local
			yyval101: detachable ET_MANIFEST_ARRAY
		do
--|#line 3931 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3931")
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
			--|#line 3940 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3940 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3940")
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
			--|#line 3942 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3942 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3942")
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
			--|#line 3942 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3942 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3942")
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
			--|#line 3955 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3955 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3955")
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
			--|#line 3966 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3966 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3966")
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
			--|#line 3974 "et_eiffel_parser.y"
		local
			yyval104: detachable ET_MANIFEST_TUPLE
		do
--|#line 3974 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3974")
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
			--|#line 3983 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 3983 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3983")
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
			--|#line 3985 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 3985 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3985")
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
			--|#line 3985 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 3985 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 3985")
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
			--|#line 4000 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 4000 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4000")
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
			--|#line 4011 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 4011 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4011")
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
			--|#line 4019 "et_eiffel_parser.y"
		local
			yyval119: detachable ET_STRIP_EXPRESSION
		do
--|#line 4019 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4019")
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
			--|#line 4028 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTANT
		do
--|#line 4028 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4028")
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
			--|#line 4030 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTANT
		do
--|#line 4030 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4030")
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
			--|#line 4032 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTANT
		do
--|#line 4032 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4032")
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
			--|#line 4034 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTANT
		do
--|#line 4034 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4034")
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
			--|#line 4036 "et_eiffel_parser.y"
		local
			yyval49: detachable ET_CONSTANT
		do
--|#line 4036 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4036")
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
			--|#line 4040 "et_eiffel_parser.y"
		local
			yyval24: detachable ET_ACROSS_EXPRESSION
		do
--|#line 4040 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4040")
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
			--|#line 4044 "et_eiffel_parser.y"
		local
			yyval24: detachable ET_ACROSS_EXPRESSION
		do
--|#line 4044 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4044")
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
			--|#line 4048 "et_eiffel_parser.y"
		local
			yyval24: detachable ET_ACROSS_EXPRESSION
		do
--|#line 4048 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4048")
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
			--|#line 4050 "et_eiffel_parser.y"
		local
			yyval24: detachable ET_ACROSS_EXPRESSION
		do
--|#line 4050 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4050")
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
			--|#line 4056 "et_eiffel_parser.y"
		local
			yyval37: detachable ET_CALL_AGENT
		do
--|#line 4056 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4056")
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
			--|#line 4058 "et_eiffel_parser.y"
		local
			yyval37: detachable ET_CALL_AGENT
		do
--|#line 4058 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4058")
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
			--|#line 4062 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4062 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4062")
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
			--|#line 4069 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4069 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4069")
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
			--|#line 4079 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4079 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4079")
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
			--|#line 4085 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4085 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4085")
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
			--|#line 4091 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4091 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4091")
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
			--|#line 4097 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4097 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4097")
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
			--|#line 4103 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4103 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4103")
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
			--|#line 4109 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4109 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4109")
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
			--|#line 4115 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4115 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4115")
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
			--|#line 4121 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4121 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4121")
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
			--|#line 4127 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4127 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4127")
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
			--|#line 4132 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4132 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4132")
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
			--|#line 4138 "et_eiffel_parser.y"
		local
			yyval91: detachable ET_INLINE_AGENT
		do
--|#line 4138 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4138")
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
			--|#line 4146 "et_eiffel_parser.y"
		local
			yyval80: detachable ET_FORMAL_ARGUMENT_LIST
		do
--|#line 4146 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4146")
end

			yyval80 := yyvs80.item (yyvsp80)
			set_start_closure (yyval80)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines80.force (yyvs80, yyval80, yyvsp80)
end
		end

	yy_do_action_839
			--|#line 4153 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 4153 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4153")
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
			--|#line 4157 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4157 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4157")
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
			--|#line 4159 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4159 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4159")
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
			--|#line 4161 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4161 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4161")
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
			--|#line 4163 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4163 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4163")
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
			--|#line 4165 "et_eiffel_parser.y"
		local
			yyval32: detachable ET_AGENT_TARGET
		do
--|#line 4165 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4165")
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
			--|#line 4169 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4169 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4169")
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
			--|#line 4171 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4171 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4171")
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
			--|#line 4173 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4173 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4173")
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
			--|#line 4173 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4173 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4173")
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
			--|#line 4186 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4186 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4186")
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
			--|#line 4197 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4197 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4197")
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
			--|#line 4205 "et_eiffel_parser.y"
		local
			yyval31: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
		do
--|#line 4205 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4205")
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
			--|#line 4214 "et_eiffel_parser.y"
		local
			yyval30: detachable ET_AGENT_ARGUMENT_OPERAND_ITEM
		do
--|#line 4214 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4214")
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
			--|#line 4223 "et_eiffel_parser.y"
		local
			yyval29: detachable ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 4223 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4223")
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
			--|#line 4225 "et_eiffel_parser.y"
		local
			yyval29: detachable ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 4225 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4225")
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
			--|#line 4227 "et_eiffel_parser.y"
		local
			yyval29: detachable ET_AGENT_ARGUMENT_OPERAND
		do
--|#line 4227 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4227")
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
			--|#line 4233 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4233 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4233")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_857
			--|#line 4235 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4235 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4235")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_858
			--|#line 4239 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4239 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4239")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_859
			--|#line 4241 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4241 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4241")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_860
			--|#line 4243 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4243 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4243")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_861
			--|#line 4245 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4245 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4245")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_862
			--|#line 4247 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4247 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4247")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_863
			--|#line 4249 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4249 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4249")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_864
			--|#line 4251 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4251 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4251")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_865
			--|#line 4253 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4253 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4253")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_866
			--|#line 4255 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4255 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4255")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_867
			--|#line 4257 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4257 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4257")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_868
			--|#line 4259 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4259 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4259")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_869
			--|#line 4261 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4261 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4261")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_870
			--|#line 4263 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4263 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4263")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_871
			--|#line 4265 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4265 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4265")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_872
			--|#line 4267 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4267 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4267")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_873
			--|#line 4269 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4269 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4269")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_874
			--|#line 4271 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4271 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4271")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_875
			--|#line 4273 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4273 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4273")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_876
			--|#line 4275 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4275 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4275")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_877
			--|#line 4277 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4277 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4277")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_878
			--|#line 4279 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4279 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4279")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_879
			--|#line 4281 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4281 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4281")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_880
			--|#line 4283 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4283 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4283")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_881
			--|#line 4285 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4285 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4285")
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
			--|#line 4289 "et_eiffel_parser.y"
		local
			yyval15: detachable ET_MANIFEST_STRING
		do
--|#line 4289 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4289")
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
			--|#line 4298 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4298 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4298")
end

yyval9 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_884
			--|#line 4300 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4300 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4300")
end

yyval9 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_885
			--|#line 4304 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4304 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4304")
end

yyval9 := yyvs9.item (yyvsp9) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
		end

	yy_do_action_886
			--|#line 4306 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4306 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4306")
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
			--|#line 4310 "et_eiffel_parser.y"
		local
			yyval9: detachable ET_CHARACTER_CONSTANT
		do
--|#line 4310 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4310")
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
			--|#line 4319 "et_eiffel_parser.y"
		local
			yyval7: detachable ET_BOOLEAN_CONSTANT
		do
--|#line 4319 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4319")
end

yyval7 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
		end

	yy_do_action_889
			--|#line 4321 "et_eiffel_parser.y"
		local
			yyval7: detachable ET_BOOLEAN_CONSTANT
		do
--|#line 4321 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4321")
end

yyval7 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
		end

	yy_do_action_890
			--|#line 4325 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4325 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4325")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_891
			--|#line 4327 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4327 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4327")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_892
			--|#line 4331 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4331 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4331")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_893
			--|#line 4333 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4333 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4333")
end

yyval13 := yyvs13.item (yyvsp13) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
		end

	yy_do_action_894
			--|#line 4337 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4337 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4337")
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
			--|#line 4344 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4344 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4344")
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
			--|#line 4353 "et_eiffel_parser.y"
		local
			yyval13: detachable ET_INTEGER_CONSTANT
		do
--|#line 4353 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4353")
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
			--|#line 4362 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4362 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4362")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_898
			--|#line 4364 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4364 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4364")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_899
			--|#line 4368 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4368 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4368")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_900
			--|#line 4370 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4370 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4370")
end

yyval16 := yyvs16.item (yyvsp16) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
		end

	yy_do_action_901
			--|#line 4374 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4374 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4374")
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
			--|#line 4381 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4381 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4381")
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
			--|#line 4390 "et_eiffel_parser.y"
		local
			yyval16: detachable ET_REAL_CONSTANT
		do
--|#line 4390 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4390")
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
			--|#line 4399 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 4399 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4399")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_905
			--|#line 4401 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 4401 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4401")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_906
			--|#line 4403 "et_eiffel_parser.y"
		local
			yyval12: detachable ET_IDENTIFIER
		do
--|#line 4403 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4403")
end

yyval12 := yyvs12.item (yyvsp12) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
		end

	yy_do_action_907
			--|#line 4409 "et_eiffel_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 4409 "et_eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_eiffel_parser.y' at line 4409")
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
			create an_array.make_filled (0, 0, 371)
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
			  122,  123,  115,  131,  125,  130,  128,  108,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,  124,  136,
			  112,  132,  110,  138,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,  137,    2,  126,  114,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  120,    2,  121,  133,    2,    2,    2,
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
			  134,  135, yyDummy>>,
			1, 172, 200)
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
			    0,  386,  386,  180,  387,  387,  388,  179,  389,  282,
			  282,  390,  282,  282,  391,  283,  283,  285,  285,  392,
			  285,  393,  289,  291,  290,  284,  284,  284,  395,  284,
			  396,  286,  288,  288,  287,  287,  294,  294,  292,  292,
			  292,  292,  292,  292,  292,  292,  293,  178,  178,  178,
			  178,  308,  308,  309,  309,  276,  276,  276,  397,  277,
			  277,  275,  274,  274,  274,  274,  274,  274,  274,  274,
			  274,  373,  373,  375,  398,  376,  376,  374,  216,  216,
			  399,  217,  217,  217,  214,  214,  213,  213,  400,  215,
			  215,  215,  218,  218,  218,  218,  218,  218,  218,  218,

			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  208,  208,  207,  207,
			  209,  209,  209,  204,  211,  211,  210,  210,  210,  212,
			  212,  212,  212,  205,  206,  340,  340,  343,  343,  344,
			  344,  403,  346,  346,  404,  342,  342,  342,  342,  342,
			  342,  347,  347,  347,  347,  345,  362,  362,  405,  363,
			  363,  363,  360,  361,  239,  239,  406,  240,  240,  241,
			  241,  407,  238,  238,  238,  408,  238,  262,  262,  262, yyDummy>>,
			1, 200, 0)
		end

	yyr1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  183,  409,  183,  184,  184,  184,  184,  181,  182,  186,
			  186,  185,  317,  317,  410,  318,  318,  315,  315,  411,
			  316,  316,  313,  313,  412,  314,  314,  312,  312,  312,
			  264,  229,  229,  230,  230,  413,  227,  227,  227,  414,
			  227,  415,  227,  227,  227,  416,  227,  417,  228,  228,
			  228,  265,  222,  222,  223,  418,  224,  224,  224,  221,
			  220,  220,  378,  378,  419,  379,  379,  377,  260,  260,
			  259,  261,  261,  257,  257,  258,  258,  420,  420,  420,
			  420,  354,  354,  354,  354,  354,  354,  350,  350,  350,
			  350,  350,  350,  355,  355,  355,  355,  355,  355,  355,

			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  351,  351,  351,  351,
			  351,  351,  351,  351,  310,  310,  364,  364,  256,  256,
			  162,  162,  263,  255,  255,  161,  161,  421,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  311,  311,  273,  270,  270,  368,  271,  271,  271,
			  271,  271,  271,  267,  266,  268,  269,  325,  325,  325,
			  422,  326,  326,  326,  326,  326,  326,  322,  321,  323,
			  324,  423,  423,  423,  423,  423,  423,  423,  423,  423, yyDummy>>,
			1, 200, 200)
		end

	yyr1_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  423,  423,  423,  424,  349,  349,  349,  349,  349,  425,
			  348,  348,  348,  348,  348,  426,  307,  307,  306,  306,
			  427,  428,  328,  328,  327,  327,  380,  380,  381,  381,
			  188,  188,  369,  369,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  372,  372,
			  372,  372,  372,  372,  372,  372,  372,  372,  372,  372,
			  372,  372,  372,  372,  372,  372,  372,  372,  372,  372,

			  372,  279,  279,  149,  149,  151,  151,  401,  150,  150,
			  150,  150,  150,  402,  146,  152,  152,  153,  153,  153,
			  154,  154,  154,  154,  154,  154,  147,  148,  320,  320,
			  320,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  353,  353,  352,  352,  352,  352,  352,  352,
			  352,  352,  352,  352,  352,  352,  352,  352,  352,  352,
			  352,  352,  352,  189,  198,  190,  191,  192,  193,  194,
			  195,  196,  196,  197,  187,  200,  200,  201,  201,  199,
			  199,  429,  298,  298,  298,  298,  298,  298,  298,  298, yyDummy>>,
			1, 200, 400)
		end

	yyr1_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  298,  298,  298,  298,  298,  298,  298,  298,  298,  430,
			  172,  172,  172,  172,  299,  299,  299,  299,  301,  301,
			  301,  301,  225,  225,  226,  226,  281,  281,  281,  281,
			  236,  237,  237,  235,  280,  280,  233,  234,  234,  232,
			  297,  297,  384,  384,  383,  383,  382,  176,  176,  431,
			  177,  177,  177,  175,  173,  173,  174,  174,  174,  174,
			  142,  142,  202,  202,  231,  337,  337,  337,  432,  336,
			  336,  335,  300,  300,  300,  300,  300,  300,  300,  248,
			  248,  247,  168,  168,  365,  365,  245,  245,  244,  244,
			  244,  244,  244,  244,  244,  244,  243,  243,  143,  143,

			  143,  433,  144,  144,  144,  254,  246,  246,  246,  246,
			  385,  385,  242,  242,  251,  251,  251,  251,  251,  251,
			  251,  251,  251,  251,  251,  251,  251,  251,  251,  251,
			  251,  251,  251,  251,  251,  251,  252,  252,  252,  252,
			  252,  252,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  250,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  249,  249,  249,
			  249,  164,  164,  165,  434,  165,  435,  166,  436,  166,
			  437,  145,  145,  145,  341,  330,  330,  438,  329,  331, yyDummy>>,
			1, 200, 600)
		end

	yyr1_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  331,  331,  338,  338,  439,  339,  339,  339,  366,  366,
			  440,  367,  367,  367,  203,  203,  203,  203,  203,  140,
			  139,  141,  141,  167,  167,  295,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  272,  441,
			  159,  159,  159,  159,  159,  157,  157,  157,  442,  158,
			  158,  158,  156,  155,  155,  155,  332,  332,  334,  334,
			  334,  334,  334,  334,  334,  334,  334,  334,  334,  334,
			  334,  334,  334,  334,  334,  334,  334,  334,  334,  334,
			  334,  334,  333,  169,  169,  171,  171,  170,  163,  163,
			  302,  302,  304,  304,  305,  305,  303,  356,  356,  358,

			  358,  359,  359,  357,  278,  278,  278,  394, yyDummy>>,
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
			   19,   19,    5,    5,    5,    5,   21,   22,   23, yyDummy>>)
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
			  132,  105, 7173, 2259, -32768, -32768, 1827, -32768, -32768, -32768,
			 -32768, 1706, -32768,  282, -32768, 2352, -32768,  923, -32768, 1046,
			  355, 2718, 1715,  898, 1823, 1823, 1823, -32768, 1825, -32768,
			 -32768, -32768, -32768, -32768, -32768, 1707, -32768, -32768, -32768, -32768,
			 -32768,  233,  144,  810, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, 1162, -32768, -32768, -32768, -32768,   89,
			 1698, -32768, 1705, 2718, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  832, 6889, 2161,

			 1818, 1816, 1813,  923, -32768, -32768, 2718, -32768, -32768, -32768,
			 -32768, -32768, -32768, 1724, 1632, -32768,  905, -32768, 1584, 1558,
			 1866,  400, 1138,  895, -32768, 1691, -32768, 1689, 1697, -32768,
			  400, 1696, 1687, -32768, 1791, 2718, -32768, -32768, -32768,  923,
			  923,  959,  832, -32768, 1741, -32768, 2212, 1677,  923,  923,
			  923, -32768, -32768,  905, 1836, 1130,  895, 1682, -32768,  905,
			 1815, 1119,  895, 1666, 1667, -32768, -32768, 1735,  905, 1784,
			 1114,  895, 1663,  905, 1777, 1052,  895, 1662,  905,  963,
			  895, 1659,  895,  810, 1559, 1555, 1657, -32768, 1686,  923,
			 7068, 1671,  810, -32768, 5892, -32768, -32768, 1720, 1718, -32768, yyDummy>>,
			1, 200, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, -32768,  472, 1725, 1059, 1655, -32768, 2118, -32768, -32768,
			 -32768, -32768,  905,  956,  895, 1646,  810, 1559, 1555, -32768,
			 -32768,  923, -32768,  905,  815,  895, 1636,  810, 1559, 1555,
			 -32768,  923, -32768, 1503, 1463,  964,  886,  782, 1459, 1391,
			 1772,  400, 1686, 1065, 1065, -32768, -32768, 1639,  895, 1635,
			 1624, 1617, -32768,  905,  517,  895, 1629,  810, 1559, 1555,
			 -32768,  923, -32768,  905,  478,  895, 1625,  810, 1559, 1555,
			 -32768,  923, -32768,  810, 1559, 1555, -32768,  923, -32768, 1622,
			 -32768, 1609,  210, 1594, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, 1604, 5892, 5892,  882, -32768, 1426, 5892, -32768, 1602,

			 -32768, 5892, -32768, 5892, 1598, 1656,  845,  680, 5892, 5995,
			 1599, 6759, 5892, 1597, -32768, -32768, 1158, -32768,  165,   24,
			 -32768, -32768, -32768, -32768, 6888, 1588, 1587, 1586, -32768, -32768,
			 -32768, 1106, 1101, -32768, -32768, -32768, 5789,  604, -32768, -32768,
			 1332, -32768, -32768, -32768, -32768, -32768, -32768, -32768, 1582, -32768,
			 1581, -32768, 5892,  472,  472, 1339, 1312, -32768, 1252, 1239,
			 1224, 1765,  400, 1672, 1243, -32768, 1621, 1621, -32768, 1080,
			 -32768,  381,  308, 2120, -32768, 1627, -32768, 2011, 1677, -32768,
			  810, 1559, 1555, -32768,  923, 1576, 1420, -32768,  810, 1559,
			 1555, -32768,  923, 1575, 1420,  905, 1762,  895,  905, 1729, yyDummy>>,
			1, 200, 200)
		end

	yypact_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  895, -32768, -32768, 1570, -32768,  905, 1695,  895,  905, 1616,
			  895,  905,  895,  895, -32768, 1568, 1567, 1566, -32768, -32768,
			  810, 1560, -32768, -32768, -32768,  810, 1559, 1555, -32768,  923,
			 1564, 1420, -32768,  810, 1559, 1555, -32768,  923, 1561, 1420,
			 1557, 1420, 1551, -32768, -32768, -32768, 1549, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  588,  287,  456, 1550, 1541, -32768,
			 -32768, -32768, -32768, 5892, 1538,  400, -32768, 1532,  810, -32768,
			 -32768, 1526, 1332, -32768,   81, 3463, -32768, 5892,   79, 2422,
			 1426, 1648, 1516,  810, -32768, 6381,  810, -32768, -32768, 1060,
			 -32768, -32768, 5892, 5892, 5892, 5892, 5892, 5892, -32768, -32768,

			 5892, 5892, 5892, 5892, 5892, 5892, 5892, 5892, 5892, 5892,
			 5892, 5686, 5583, 5892,  923,  923, -32768, -32768, -32768, -32768,
			 3329, 1514, -32768, 6953, 1621, 1621, 1621, 1621, 1252, 1500,
			 1243, 1252, 1432, 1243, 1591, 1509, -32768, -32768, 1104, 1252,
			 1429, 1243, 1252, 1422, 1243, 1252, 1243, 1243, 1614, -32768,
			 1496, -32768, -32768, 1104, 1595, -32768, -32768, -32768,  923, -32768,
			 1596, 1471, 1483, 1889,  923,  779,  923, 1059, 1482,  400,
			 -32768, 1478, 1420, 1472, 1477, 1420, 1461, 1466,  905,  895,
			 1462, 1458,  905,  895, 1457, 1735, 1735, 1735, 1454,  905,
			  895, 1453, 1452,  905,  895, 1444, 1441, 1440, 1424, -32768, yyDummy>>,
			1, 200, 400)
		end

	yypact_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, -32768,  392, 1442, 1420, 1434, 1439, 1420, 1419, 1418,
			  923, 1686, 1686, 1686,  923,  810, 3061, 6594, 5480, -32768,
			 -32768, 5892, 1423, -32768, 1413,  923, -32768,  810, 1513,  712,
			  923,  923,  340,  277, -32768,  320,  810,  699,  923,  923,
			 1408,  923, -32768,  923, 1403, 5892, 1394, 4848, 5892,  116,
			 5892, 5892,  545,  545,  545,  545, 2052, 2052,   75,   75,
			   75,  545,  545,  545,  545,   75,   75, 6809, 1974, 5892,
			 1974, 5892, 2302, -32768,  604,  604, 5892, 5892, -32768, 4951,
			 -32768, -32768, -32768, -32768, -32768, -32768, 1252, 1243, -32768, -32768,
			 1252, 1243, -32768,  620, 1591, -32768, -32768, 1210, 1198,  430,

			 1172, 1146, 1360,  400, 1104,  923,  923, -32768, -32768, 1395,
			 1392,  934, 1243, 1393, -32768, 1252, 1243, -32768, -32768, 1252,
			 1243, -32768, -32768, -32768, -32768, -32768,  923, -32768, -32768, 1389,
			 -32768,  923, 1388,  923, -32768,  823, -32768, -32768,  105, 1390,
			 1471,  166, -32768, -32768,  923,  923, -32768,  923, 1363,  923,
			 -32768, -32768, -32768,  895,   71,  400, -32768, 1381,  923, 1365,
			  923, 1361, 1359, 1357, 1356, -32768, -32768, -32768, -32768, -32768,
			 -32768, 1348, 1344, 1343, 1340, 1065, 1065, 1065, -32768, -32768,
			 1334,  923, 1333,  923,  923, -32768,  604, 1337,  923, -32768,
			 -32768, -32768, -32768, -32768, 6823, 5377,  604, -32768, 1332,  819, yyDummy>>,
			1, 200, 600)
		end

	yypact_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, 4848,  333, 6889,  707, -32768,  856, -32768, -32768, -32768,
			 -32768, -32768, -32768,  810,  819, 6889,  575, -32768, -32768, 5274,
			 -32768,  799,  241, -32768, 6889, 1537, 1329, 1319, 6692,  789,
			 4745, 7001, 5892, 5892, -32768, 6758, 5171, -32768, 1974, 2302,
			 3195, 2984, -32768, -32768, -32768, 1426,  770, 4642, -32768, 7001,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, 1252, 1323, 1243,
			 1252, 1254, 1243, 1327, 1252, 1195, 1243, 1252, 1154, 1243,
			 1252, 1243, 1243, -32768, -32768,  740, -32768, -32768, -32768, -32768,
			 1591, 1321, -32768, -32768, -32768, -32768, -32768, 1438, 1431,  251,
			 -32768, -32768,  238,   55, -32768, -32768, 1317, 1317, -32768, 1410,

			 -32768, -32768,  923,  897, -32768, 6230, -32768, -32768, -32768, -32768,
			  166,  583,  458, -32768, 1314, -32768, -32768, -32768, -32768,  778,
			 -32768, -32768, -32768,  923, 1235,  923, 1235,  923, 1235,  923,
			 1235, 1235, -32768, 5892,  604, -32768, -32768, -32768, -32768, -32768,
			  684, 4848, 4745,  923,  577,  334,  465,  383, 1300,  388,
			  577,  334,  383, 1426, 1417, -32768, -32768, -32768, -32768, 5892,
			 1404, 1331,  923, -32768, -32768, 1285, 1279, 6682,  750, 6426,
			 6426, -32768, -32768, -32768, 1258, -32768, -32768, -32768, -32768, 1288,
			 1252, 1243, 1282, 1280, 1252, 1243, 1278, 1277, 1252, 1243,
			 1275, 1267, 1252, 1243, 1266, 1265, 1257, 1251, -32768, 1104, yyDummy>>,
			1, 200, 800)
		end

	yypact_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  389,  923, -32768, -32768, -32768, 1104, -32768, -32768, -32768, 1253,
			 -32768, 1250, 4848, -32768,  803, -32768, -32768,  166,  810, -32768,
			 -32768,  107,  105, -32768, -32768,  923, 1206, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  601, 1353,  741,  139,  527, 1249,
			 1341, 1171, 1103, 1349, 1235, 1235, 1235, 1235, -32768, -32768,
			 6889,  503, 4745,  538,  923,  923,  923,  923, -32768, 6889,
			  383, 1230,  465, -32768, -32768, 5066, 1310,  258, -32768, 6889,
			  494,  383,  465,  258, 1228,  923, 6105, 5892, 5892, 1331,
			 -32768,  604, -32768, -32768, -32768, 1211, 5892, -32768, 1318, 1311,
			 6551, 1215, 1212, 1205, 1204, 1190, 1189, 1182, 1181,  923,

			 -32768, -32768, -32768, -32768, 1175, -32768,  810, -32768, 4745, 1299,
			  166, -32768, -32768, -32768, -32768, 1159,  810,  105,  898, 6954,
			 1326, -32768,  923,  923,  923,  923,  223, -32768, 1171, -32768,
			 -32768, 1103, -32768, 1281, -32768, 1249,  577,  334,  383, -32768,
			  810, -32768, -32768, -32768, -32768, -32768, 1263, -32768, 6889,  383,
			 -32768,  910,  810, -32768,   62,  716, 5892, 5892, 5892,  818,
			 1156,  334, 1162, -32768, 1245, 1199,  165,   24, 1193, -32768,
			 1158, -32768, -32768, 1125, 1124, 1106, 1101, 3715, -32768, -32768,
			 2416, -32768, -32768, -32768,  584, -32768, 4848,  971, 1227, -32768,
			  577,  334,  383, 1218,  383, 1217, 1102, -32768, -32768, 6095, yyDummy>>,
			1, 200, 1000)
		end

	yypact_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 6332, -32768, -32768, -32768, 7001,  645, -32768, -32768, -32768, -32768,
			  391,  810, -32768, -32768,  105, -32768, -32768,  923,  532, 1159,
			  898,  819, 1170, 1170, 1170, 1170, 1170, 1170, 1170, 1170,
			 1170, 1170, 1170, 1170, 1170, 1170, 1170, 1170, 1170, 1170,
			 1170, 1170, 1170, 1170, 1170, 1206,  922,  923, -32768, -32768,
			 -32768,  923, -32768, -32768, -32768,  342,  240, -32768, 1103, 1180,
			 -32768, 1171,  383,  465,  258, 1071, -32768,  367, 6889, -32768,
			  258, 1007,  539,  905,  926,  569, 1043,  400,  895, -32768,
			 1069, 1031,  400, 4327, 2206, 6030, 1855, -32768,  810,  971,
			  348, 4539, -32768, 1158, 5892, 5892,  396,  923,  923, 3847,

			 5066, 5892, 5892, 4848, 4745, -32768, -32768,  383,  465,  258,
			 -32768,  258, -32768, -32768, 5892, 5892, -32768, -32768, -32768, -32768,
			 -32768, -32768, 6499, 6241,  898,  752,  819,  675, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  923,  223, 1165, -32768,
			 1103, 1160,  383, 1121, -32768, -32768, -32768, -32768, 1113,  905,
			  919,  895, -32768,  905,  824, -32768,  895,  992, -32768,  905,
			  797,  895,  905,  634,  895,  905,  895,  895, -32768,  593,
			 6649,  997,  923,  923,  747,  937,  611,  526,  988, 1077, yyDummy>>,
			1, 200, 1200)
		end

	yypact_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  810,  979, 1001, -32768, 1058, 4432, 1060, 7001, 7001, 5892,
			 1021,  604,  604, -32768, 7001, 7001, 4745, 1047,  383, 1037,
			 1035, 7001, 7001,  -61, -32768, -32768,  -61, -32768, -32768, -32768,
			  -61,  -61,  898,  819,  105,  898,  460,  383, 6889,  416,
			 -32768,  922,  923, -32768, -32768, 1024, -32768,  258, -32768, -32768,
			 -32768,  905,  895, -32768, -32768,  905,  895, -32768,  923, -32768,
			  905,  895, -32768, -32768,  905,  895, -32768, -32768, -32768, -32768,
			  892,  923,  604, -32768, -32768, -32768, 1001,  991,  961,  948,
			  937, -32768, -32768, -32768,  971,  944,  202,  855,  816, -32768,
			  828,  923, -32768, -32768, -32768, -32768,  924,  904, 6286, 5892,

			 3595, 2848, -32768,  258, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  819,  454,  898,  819,  383, 6889,  398,  912,  577,
			  334,  383, -32768, -32768,  906, -32768, -32768, -32768, -32768,  604,
			 -32768, -32768, -32768, -32768,  923,  604, 4207, -32768, -32768,  364,
			 -32768, -32768, -32768, -32768, -32768,  901, 5892,  855, -32768,  923,
			  593,  604, -32768,  228,  857,  143, 6286,  844,  429,  383,
			 6889,  224,  819,  317,  831,  577,  334,  383,  -61,  383,
			  465,  258, -32768, -32768,  604, 4087,  777,  774,  810, -32768,
			  685,  773,  364, -32768, -32768, -32768, -32768, -32768, 1855, -32768,
			  604,  664, -32768, -32768,  812, -32768,  801,  793, -32768,  383, yyDummy>>,
			1, 200, 1400)
		end

	yypact_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 6889,  356,  775,  577,  465,  334,  383,  383,  148,  383,
			 6889,  321,  -61,  383,  465,  258, -32768,  767,  383,  757,
			 -32768,  630, -32768,  364, -32768, -32768, 3967,  923, -32768, -32768,
			 -32768,  729,  577,  334,  383,  -61,  383, -32768,  465,  258,
			  258,  383, 6889,  309,  718,  577,  334,  383, -32768,  709,
			  383,  696,  -61,  258,  -61,  442, -32768,  604,  -61,  383,
			  465,  258, -32768,  677,  383,  617,  594,  586,  577,  334,
			  383,  -61,  383,  465,  258,  -61,  258,  -61, -32768,  571,
			 -32768, -32768, -32768,  543,  383,  484,  -61,  258,  -61,  -61,
			  -61,  383,  465,  258, -32768,  451,  383,  435, -32768,  418,

			 -32768,  -61,  -61,  258,  -61, -32768,  411, -32768, -32768, -32768,
			  403,  383,  365,  -61,  258,  -61,  -61, -32768, -32768,  338,
			 -32768,  -61,  -61,  258,  -61, -32768,  230, -32768, -32768,  -61,
			 -32768, -32768,  227, -32768,  -61, -32768,  -61, -32768, -32768,  222,
			  179, -32768, yyDummy>>,
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
			 -32768, -32768, -32768, -32768, -215, 1200, -577, -32768, -32768, -32768,
			  566,  -79, -116,   56, -227,  -77, -32768, -32768, -440, 1147,
			 -32768, -32768,  746,  765,    1, -32768, -1006, -1011, -32768, -32768,
			 -1275,  -13,  -21, -32768, -32768,  357, -32768, -32768,  397, -32768,
			 -32768,    0, -32768, -32768, -342,  252, -32768, -32768, -1283, -553,
			 -793, -1358,  573,  488, -32768, -32768,  811, -32768, -1357, -32768,
			  673,  525,  496,  551,  638, -32768, -32768, -32768, 1248, 1208,
			 -455, 1260, 1613, -478, -32768, -255, 1066, -32768, 1067, -512,
			 -32768, -32768, -32768, -32768, -32768, 1222,  102,  792, -32768, -524,
			 -32768, 1384, -32768, -32768, -32768,  870, -32768, -32768,  401, -32768,

			  902, -32768,  587,  177, -1012, -1013, -32768, -32768, -32768, -32768,
			 -1016, -1019, -32768, -236, -282, -166, -800, -759, -32768, -32768,
			 -32768, -32768, 1203,  499, -283, -625, -681, -32768, -32768, -32768,
			 -32768, 1623,  796, -32768, -32768, -32768, -32768, -32768, 1785,  -11,
			 1506, -32768, -32768, -32768, -721,  987, 1127, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,   77, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -1284,  -17, -187, -32768, -32768, -32768, -32768,
			 1191,  908, 6003, -1029, 1006, -1060, 1004,  787,  998, -1065,
			 1242, 1863, -32768, -32768, -32768, -32768, -622,  112, -32768, -1057,
			 -32768, -604, 1302, -306,   -5,  -19, -32768,  650, -870, 1837, yyDummy>>,
			1, 200, 0)
		end

	yypgoto_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypgoto'.
		do
			yyarray_subcopy (an_array, <<
			 1577, -1078,  189, -32768, -32768, 1528, -32768, -32768,  393,  982,
			 -459, -830, 1002, -32768, 1652, -859,  999, -190,   -1, -169,
			 -32768, -1047, -1056, -32768,  649, 1028, -1442, -32768, 1072, -270,
			  -10, -32768, -32768, -32768,  -92, -32768,  790, 1186, -32768,  978,
			  666, -1265, -945, -32768,  372, -32768, -1214, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,    5, -32768, -32768, -32768, -32768,
			 -32768, -32768, 1012, -296, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -767, 1070,  663, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768, yyDummy>>,
			1, 104, 200)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 7247)
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
			   77, 1259,  137, 1023,  837, 1506, 1401, 1250,   90,  145,
			 1027, 1072,   93,  707,   75,   78,  144,   91,  245,   86,
			  246,  466,  151,   77, 1249,  137, 1253, 1586,  728,  842,

			  843,   90, 1014,  133,  147,   93,  586,   75,  587,  284,
			  366,  185,  557, 1296,   78,  628,   91,  628,   86, 1492,
			  833, 1540,   77,   79,  137, -711, -711,    3,  197,  198,
			   90,  144,  421, 1019,   93,    2,   75,  208,  209,  210,
			 1586, 1555, 1326,  117,  218,  115,  513,  611,  612,  613,
			  229,  204, -693, -212,    3, 1112,  247, 1595, 1114,  259,
			  138,  491,    2,  414,  269, 1642,  418,  419,  275,  286,
			  336,  288,  832,  279, 1052, 1470,  802, -212,  285, 1741,
			  917, 1586,  291,  152, 1111,   79,  902, 1113, 1086,  501,
			 -689, 1071,  709, 1492, 1641, 1251, 1360,  822, 1358, 1597, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    1, 1104,  382,  636, 1250,  627,  385,  920,   79,  211,
			  386,  892,  196,  390, 1484,  222, 1544,  393, 1353,  112,
			  394,  915, 1740,  916,  252,  918,  132,  874,  876,  262,
			 1625, 1116,  247,  247,  272,  946, 1406,   79,   34,   33,
			   32, 1736, -585,  427, 1734, 1108, 1433,  430,  111,  873,
			  431, 1216, 1006,  435, -189, 1585, 1605,  438, 1138,  973,
			  439,  524,  526,  440, 1579, 1003,  441, 1263,  379,  681,
			  682,  683,  684, -585, -189,  735, 1604, 1192, -189,  387,
			 1215, 1176, -189,  452, 1175,  457,  458, 1174, 1173, 1167,
			 1596, 1289,   91, -696, 1166, 1187,  475,  618, 1585,   27,

			 1445, 1118,  490,  775,  776,  777,   90, 1579,  110,  424,
			   34,   33,   32,   34,   33,   32, -243, -243, 1051,  432,
			  946, 1308, -243,   34,   33,   32, -243, 1070,   26,   25,
			 -243,   24,  946, -243, 1610,  444, 1591,  109, -243, 1585,
			  940, 1669,  798,  562, -378,  802, 1355,  164, 1579,   34,
			   33,   32, 1729, 1646, 1511,  949, -193, 1514,  939, 1254,
			  821, -243,  -26, 1609,  957, -378,  -26,  946, 1000,  -26,
			  571,  324,  -26,  572,  561,  -26, -193, 1262,  574, 1724,
			 -193,  575,  313,  -26, -193, -378,  -26,  -26, 1633, -237,
			 -237,  -26, -374, -374, -374, -237, 1220,  900, 1066, -237, yyDummy>>,
			1, 200, 200)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  810,  -26,  -26, -237,  -26, 1069, -237,  -26, -515,  946,
			  602, -237,   34,   33,   32,  603,  802, 1722,  604, 1304,
			   34,   33,   32,  606,  164, 1721,  607,  946,  562,  287,
			 1566, 1307, 1716,   71, -237, 1562,   34,   33,   32,   70,
			 1409, 1086,  464,  887,  813,  812, 1600,  289, 1520, 1715,
			  735,  577,  618, 1372,  581,  795, 1061,  802,  624,  840,
			  841,  588, -193,  808,  592, 1713,  635,  596, 1400,  457,
			  640, 1560,  117,  644,  115, 1599,  646, 1516, -193, -585,
			 -585,   45,  802,  453, 1578,  479,  789,  709,  802,  485,
			 1366,   39, 1365,  709, 1577, 1576,  476, 1324, 1704,  122,

			 1559,  562, -585,  674,  675,  946, 1515,  767,  769,  768,
			  770,   71, 1317,  324,  946, 1103, 1316,   70,  779,  362,
			 1195,  361,  360,  359, 1405, 1102, 1191,  711,  778,  523,
			   34,   33,   32,  767,  769, 1137, 1416,  954, 1484,  821,
			 1483, -184,  729,  -15,  117,  358,  115,  452,  434,  -15,
			   34,   33,   32,  748,    3,  748, -144, 1702, 1323,   45,
			  -15, -184,    2,  -15,  -15, -184,  161,  535,  -15, -184,
			  788,  932, 1577, 1576,  247,  247,  247, -501,  -15, 1031,
			 1059,  938, -501,  999,  -15, 1701,  946,  426, 1374,   34,
			   33,   32,  357, -501, 1005,  286,  175,  288,  433,  785, yyDummy>>,
			1, 200, 400)
		end

	yytable_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1690,  356, 1432,  786, 1435,  787,  887,  951, 1689, 1594,
			  355,  456, 1373,  454,  452, -217,  513,  799, 1383,  806,
			  806,  806,  806, -585, -585, -585,  814,  817,  818,  795,
			  820, 1688,  452, 1025,  761, -217,  829,  425,  763, -217,
			  617,  117, 1382,  115, 1372,  771, 1521, 1302, 1301,  773,
			 1570, -585,  508,  507,  523,   34,   33,   32,  502,  501,
			  500,  264, 1140, 1139, 1322,   34,   33,   32, 1321,  652,
			  653,  654,  655,  656,  657,  497,  496,  658,  659,  660,
			  661,  662,  663,  664,  665,  666,  667,  668,  670,  672,
			  673, 1686, 1438,  729,  875,  875, 1614, 1048, 1372,  768,

			  770, 1050, 1099,  802, 1029, 1439,  117, 1464,  115, -502,
			 1677, 1363,  802, 1513, -502,  452,  815, 1368,  946, 1049,
			  893, 1437,  452, 1675, 1567, -502,  464,  802,  230,  803,
			  905, 1442, 1671,  914,  748, 1638,  748,  260,  748,  945,
			  802,  855,  270, 1658, 1025,  854,  276,  924,  278,  926,
			  470, 1655,   34,   33,   32, -176, 1419, -176, 1420, 1476,
			 1569, 1475, 1327, 1660,  247,  247,  247,  464, 1606, 1315,
			  928, 1654,  930,  931,    3, -176, 1673,  934, 1434, -176,
			  383, 1652,    2, -176,  944,  469,  789, -242, -242, 1635,
			  829,  391, 1627, -242, 1038,  617,  950, -242,  794, 1692, yyDummy>>,
			1, 200, 600)
		end

	yytable_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  468, -242,  467,  948, -242,  288, 1613, 1630, 1634, -242,
			 1622,  452, 1037, 1036, 1517, 1629, 1035, 1442, 1647,  968,
			 1034,  428,  825,  902,  254,  831, 1628,  835,  835, 1019,
			  961,  436, -242, 1623,  457,  974, 1282,  122,  464, 1246,
			 1246,  887, 1246, -585, 1636, 1612,  838, -585,  839,  112,
			 1670,  224,  110,  835,  835,  628,  849,  121, 1598,  120,
			  119,  118, -585, -585,  880,  998, 1202, 1436, 1546,  117,
			 1460,  115,  464, 1659, 1085,   34,   33,   32,  452,  140,
			  139,  893,  117,  116,  115,  389, 1672,   34,   33,   32,
			 1561,  905,  905,  976, 1524,  975,  117, 1455,  115,  905,

			  914,  914, 1086,  287,   34,   33,   32,  404, -501, 1691,
			 1026,  464, 1044,  965, 1045, 1587, 1046,  902, 1047, -501,
			 1572,  289,  956, 1019,  955,  467, 1568, 1018, 1110,   98,
			  829,  968, 1053, 1553, 1320,  388, 1601,  122, 1552,  114,
			 1283, 1611,  457, 1074, 1549,  897,  213,  896,  113, 1550,
			 1557, 1081,  450,  170,   34,   33,   32, 1277, 1543, 1276,
			 1275, 1274, 1299,  580, 1246,  465,  584,  464,  887,   34,
			   33,   32,  794,  591, 1512, 1380,  595, 1478,  597,  598,
			  813,  812,  117, 1273,  115, -585, 1643,  449,  711, 1396,
			  905,  117, 1451,  115,  729,   34,   33,   32,  117, 1379, yyDummy>>,
			1, 200, 800)
		end

	yytable_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  115,  829, -647,  905,  295, 1538,  905,  967, 1115,  969,
			  970,  402, -515,  835,  806, -587, 1428, 1428, 1619,  467,
			 1534, 1018, 1017,  164,  849,  107,  381,  108,   34,   33,
			   32, 1136,  186,  274,  155,   34,   33,   32, 1523, 1272,
			 1145,  968,  164, 1053, 1053, 1053, 1053,  955, 1271, 1505,
			 1190, 1504, 1558,  -25, 1177, 1563, 1370,  -25,  880,  879,
			  -25, 1502, 1651,  -25, 1197, 1499,  -25,  372,  371,  286,
			  179,  288, 1494, 1441,  -25, 1205,  380,  -25,  -25,  117,
			 1369,  115,  -25,  273,  200,  199, 1665, 1666,  875,  401,
			 -502, 1489,  -25,  -25, -268,  -25, 1210,  968,  -25,  905,

			 1679, -502, -268, 1608,  648, -268, 1219, 1491, 1685, 1488,
			 -268,  452,  452,  452,  452,  117, 1385,  115, 1472,  967,
			 1458, 1697,  268, 1699,   34,   33,   32, 1449,  167, 1267,
			 1265,  122, 1429, 1429, 1706, 1448, 1076,  417,  416,  415,
			 1712, 1035, 1281,  525,  527,  762, 1454,  921,  922,  764,
			 1719,  703, 1390,  702,  701,  700,  772,  104,  105, 1441,
			  774, 1726, 1388, 1030, 1032,  167, 1141, 1142, 1143, 1144,
			 1732,  167,  267,  175, 1446,  829,  456,  699,  454, 1444,
			  167,  264,   37,  487,  258,  167,   34,   33,   32,  228,
			  167,   34,   33,   32, 1359,  868, 1500, 1501, 1389,  170, yyDummy>>,
			1, 200, 1000)
		end

	yytable_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  217, 1210,   34,   33,   32, 1037,  452, 1364,  184, 1119,
			   34,   33,   32, 1217, 1319,  100,  101,  102,  117,  867,
			  115,  865,  254, 1328,  167,  161,  117,  992,  115,  967,
			  788, 1312, 1310,  698,  257,  167,  452,  155,  517,  227,
			  452, 1306,  697,  516,  117,  864,  115,  861,  167, 1267,
			  216,  175, 1298, 1297, 1199, 1200, 1295, 1536,  183,  858,
			 1457, 1375, 1294, 1204, 1159,  167,  170,  117,  988,  115,
			  117,  860,  115,  543,  130,  167, 1288, 1266, 1398, 1375,
			  829,  224,  117,  857,  115,  967, 1411, 1412,  540, 1177,
			 1395, 1034,  829,  968,  167, 1260,  117,  542,  115,   -4,

			 1209,   78,   78,   91,   91,   86,   86,  -96, -107,   77,
			   77,  117,  539,  115, 1573,  -98, -109,   90,   90,  919,
			 1575,   93,   93, 1424, 1424, 1207,  117,  984,  115, 1378,
			 -100, -111, 1206, 1284, 1285, 1286, 1592, -335, -102,  161,
			 -335, -113, -335, -335, 1078,  452, -335, 1203, -335, 1196,
			  213, 1185, -335, 1147, -335, 1129, -335, -335, -335, 1620,
			 -335,  532, -335, -552, -335, 1038,  155, -222, -335,  286,
			  538,  288, -335, 1107, 1105, 1626,  553,  -93, 1375, 1090,
			  550, 1473, 1474,  -94,  117,  531,  115,  179,  529,  535,
			 1490, -105,  -95, -106,  968,  117,  980,  115, -335, -335, yyDummy>>,
			1, 200, 1200)
		end

	yytable_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -335,  -97, 1487, -108,  -99,  968, -110,  167, -101,  249,
			  167,  117,  528,  115, -112, 1083, 1077,  167,  175, 1519,
			  167, 1082, 1075,  167, 1013, 1450,  805,  807,  809,  811,
			  249,  452,  117,  870,  115, 1459, 1068, 1009, 1463, 1033,
			  409, 1467, 1681, 1001,  365, 1002, -114, 1529, -335,  264,
			 -335, -335, -126,  122,  521,  963,  254,  962,  933,  224,
			 1535,  929,  927,  117,  408,  115, -438,  167,  287, -449,
			 -440, 1407, 1408,  121, -451,  120,  119,  118, 1414, 1415,
			 1551,  967, -442, -453,  249, -444,  170, -455,  917,  739,
			  161, 1421, 1422,  925,  117,  719,  115, 1565,  456,  455,

			  454,  117,  715,  115,  117,  690,  115, 1525,  406,  923,
			  562, 1527,  399,  894,  890,  826, 1530,  878,   78, -103,
			 1532,  877,   86, 1574,  824,  800,   77,  213, 1584,  819,
			  155,  117,  405,  115,  797,  117,  398,  115, 1590, 1375,
			  538, 1603,  553,  538,  796,  553,  784,  783, -553,  959,
			 -435,  538,  396,  553,  538,  114,  553,  538,  553,  553,
			  782,   78,  781,  780,  113,   86, -436, -447, 1621,   77,
			 -437, 1584,  117,  686,  115,  117,  395,  115, -448, -439,
			 -450, 1632,  967, -441, -452,  175, 1498, 1149, -443,  760,
			  167, 1645, -454,  967,  167,  365,  365, 1194,  759,  757, yyDummy>>,
			1, 200, 1400)
		end

	yytable_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  758,  167,   78,  752,  743,  167,   86,  174,  513,  730,
			   77,  170, 1584,  512,  511,  510, 1657,  509,  122,  156,
			  162,  736,  727, 1668,  171,  176,  180,  182,  725,  554,
			  117,  173,  115,  169,  286,  696,  191,  678,  362,  642,
			  361,  360,  359,  264,  508,  507,  506,  505,  504,  503,
			  502,  501,  500,  641,  625,  623,  117,  168,  115,  161,
			  214,  620,  616,  117,  358,  115,  225,  497,  496,  495,
			  494,  493,  492,  248,  615,  255, 1556,  614,  609,  610,
			  265,  160,  608, -528, 1287,  605, -434, -529,  117,  593,
			  115,  601,  600,  599,  248, -468,  576,  573,  538,  553,

			  205,  568,  538,  553,  117,  159,  115,  548,  364, -694,
			 -691,  538, 1305,  122, -692,  515,  514,  486,  462,  445,
			  356,  482,  254, 1588,  553,  446, -690,  538,  553,  355,
			 -689,  538,  553,  241,  443,  240,  239,  238,  688,  397,
			  400,  692,  423,  442,  407,  410,  412,  413,  248,  717,
			  422,  155,  721,  437,  723,  724,  224,  429,  283,  282,
			  281, -445,  122,  420,  392,  158,  158,  117,  589,  115,
			  158,  158,  158,  154,  384,  375,  365,  354,  368,  353,
			  713,  290,  241,  280,  240,  239,  238,  277, 1362,  213,
			  271,  261,  179,  232,  231,  713,  117,  153,  115,  179, yyDummy>>,
			1, 200, 1600)
		end

	yytable_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  202,  117,  582,  115,  264,  195,  158,  237,  236,  235,
			  221,  254,  158,  193, 1399,  234,  192, -530,  190,  189,
			  150,  158,  135,  149,  233,  148,  158,  249,  249,  249,
			  136,  106,  103, 1418,  117,  578,  115,  117,  545,  115,
			   27,   96,  224,   22,  117,  411,  115,   10, 1303,  117,
			  263,  115, 1541,  249,  249,  249,  117,  253,  115,  364,
			  364,  530,  533,  213,  234,  541,  544,  546,  547,  538,
			  941,  553,  538,  233,  553, 1011,  538, 1318,  553,  538,
			  856,  553,  538,  553,  553,  158,  158,  117,  223,  115,
			  158,  158,  158,  179,  958,  851, 1396, -236, -236,  853,

			 1354, 1016,  579, -236, 1015,  583,  570, -236,  117,  212,
			  115, -236,  590,  519, -236,  594,  134, 1042, 1367, -236,
			  792, 1482, 1261, 1041,  883, 1040,  513,  201,  885, 1117,
			  473,  512,  511,  510, 1073,  509,  365, 1453,  117,  178,
			  115, 1522, -236,  901, 1443, 1134,  713, 1462, 1589, 1201,
			 1466,  751, 1468, 1469, 1290,  895, 1004, 1497, 1007,  863,
			  881, 1431,  508,  507,  506,  505,  504,  503,  502,  501,
			  500,  622, 1537, 1413, 1545, 1292,  157,  163, 1496, 1624,
			 1656,  172,  177,  181, 1325,  497,  496,  495,  494,  493,
			  492, 1352,  538,  553,  978,  937,  538,  553,    0,    0, yyDummy>>,
			1, 200, 1800)
		end

	yytable_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  538,  553,    0,    0,  538,  553,    0,  158,  158, 1542,
			    0,  158,  158,  158,    0,    0,    0,  215, 1526, -162,
			 -162,    0, 1528,  226,    0, -162,    0, 1531,    0, -162,
			    0, 1533,  256, -162, -162,  687, -162,  266,  691,    0,
			  364, -162, 1146,    0,  712,  513,  716,    0,  158,  720,
			  512,  158,    0, 1193,    0,    0,    0,    0,  158,  712,
			    0,  158,    0,    0, -162,    0,    0,  982,    0,    0,
			  986,    0,    0,    0,  990,  753,    0,  994, 1593,  996,
			  997,  508,  507,  506,  505,  504,  503,  502,  501,  500,
			    0,  248,  248,  248,    0, 1618,  157,  163,    0,    0,

			    0,  172,  177,  181,  497,  496,  495,  494,  493,  492,
			    0,    0,    0,    0,    0,    0,    0,  248,  248,  248,
			 1264,    0,  365,  513,    0,    0, -159, -159,    0, 1637,
			    0, 1270, -159,    0, -233,    0, -159,    0, -233, 1650,
			 -159,  685, -233, -159,  689, -233,    0,    0, -159,    0,
			 -233,    0,  714,    0,    0,  718,    0,    0,  722,  508,
			  507,    0,    0, 1664,    0,  502,  501,  500,    0, -157,
			 -157, -159,    0, -233, 1309, -157, 1311,    0,    0, -157,
			    0,  158,    0, -157,  158, 1684, -157,    0,    0, 1092,
			    0, -157,  158, 1094,    0,  158,    0, 1096, 1696,    0, yyDummy>>,
			1, 200, 2000)
		end

	yytable_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  364, 1098,    0,  859,  862,    0,  866,  869,  871,  872,
			  712, 1393,    0,    0, -157,    0,    0, 1711,  157,  163,
			    0,    0,  172,  177,  181,    0, -231,    0,    0,    0,
			 -231,    0, 1392,    0, -231,    0,    0, -231,    0,    0,
			    0,  713, -231,    0, 1361,    0,    0,  713,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  215,
			  753,  753,  226,    0,    0, -231,   -9,    0,    0,  256,
			   -9,    0,  266,   -9,    0,    0,   -9,  513,    0,   -9,
			    0,    0,  512,  511,  510,  167,  509,   -9,    0, 1417,
			   -9,   -9,    0,    0,    0,   -9,    0,    0,    0,  850,

			    0,    0,    0,  852,    0,   -9,   -9,    0,   -9,    0,
			    0,   -9,    0,  508,  507,  506,  505,  504,  503,  502,
			  501,  500,    0,    0,    0,    0,    0,    0,  882,    0,
			    0,    0,  884,    0,    0,    0,  497,  496,  495,  494,
			  493,  492,    0,    0, 1447,    0,    0,    0,    0,  158,
			  158,    0,  158,  158,  158,    0,    0,    0,    0,  -17,
			    0,    0,    0,  -17,  981,    0,  -17,  985,    0,  -17,
			    0,  989,  -17,  513,  993,    0,    0,    0,    0,    0,
			  -17,  167,    0,  -17,  -17,  167,  364,    0,  -17,    0,
			    0,  167,  215, 1279,  167,  226,    0,  167,  -17,  -17, yyDummy>>,
			1, 200, 2200)
		end

	yytable_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1503,  -17,    0,  256,  -17,    0,  266,    0,    0,  508,
			  507,  506,  505,  504,  503,  502,  501,  500,    0, 1518,
			    0,    0,    0,    0,    0,    0,    0,  639, -589, -589,
			 -589, -589,  497,  496,  495,  494,  493,  492,    0,    0,
			    0, -589,    0,    0,    0, -589,    0,    0,  638,    0,
			    0,    0,    0, -589, 1508,    0, -589,    0, 1509, 1510,
			 -589, -589,    0,  167,    0,    0,    0,  167,    0,    0,
			  979,    0,  167,  983,    0,    0,  167,  987,    0,    0,
			  991,    0,    0,  995,    0,    0,    0,    0,   29,    0,
			    0,    0,    0,  513,    0,    0,    0, 1564,  512,  511,

			  510,    0,  509, 1571,    0,  712,    0,    0,    0,    0,
			  158,  712,    0,  158,    0,    0,    0,  158,    0,    0,
			  158,    0,    0,    0,    0,    0,    0,    0,    0,  508,
			  507,  506,  505,  504,  503,  502,  501,  500,    0,    0,
			    0, 1602,    0,    0,    0,    0,    0,    0,    0, 1615,
			    0, 1617,  497,  496,  495,  494,  493,  492,    0,    0,
			  157,  163,    0,  172,  177,  181,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0, 1631,    0,    0,    0,    0,    0,    0, 1639, 1640,
			    0, 1644,    0, 1091,    0, 1649, 1616, 1093,    0,    0, yyDummy>>,
			1, 200, 2400)
		end

	yytable_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 1653, 1095,    0,    0,    0, 1097,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0, 1661,    0, 1663,    0,
			    0,    0,    0, 1667,    0,    0,    0,    0,    0, 1674,
			    0,    0, 1676,    0,    0,    0,    0,    0,    0,    0,
			 1648, 1683,    0,    0,    0,    0, 1687,    0,    0,    0,
			    0,    0, 1693,    0, 1695,    0,    0, 1278,    0,    0,
			    0,    0,    0, 1662,    0,    0, 1703,    0,    0,    0,
			    0,    0,    0, 1710,    0,    0,    0,    0, 1714,    0,
			 1678,    0, 1680,    0,    0,    0, 1682,    0,    0,    0,
			    0,    0,    0, 1723,    0,    0,    0,    0,    0, 1694,

			    0,    0,    0, 1698,    0, 1700,    0,    0,    0,    0,
			    0,    0,    0,    0, 1705,    0, 1707, 1708, 1709,    0,
			    0,  215,    0,    0,  226,    0,   74,    0,  256, 1717,
			 1718,  266, 1720,    0,    0,    0,    0,    0,    0,    0,
			    0, 1725,    0, 1727, 1728,    0,    0,    0,    0, 1730,
			 1731,    0, 1733,    0,    0,    0,    0, 1735,    0,    0,
			    0,    0, 1737,    0, 1738,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0, 1371, 1376,    0,
			 1381, 1384, 1386, 1387,   73,   72,    0,   71, 1391,    0,
			   34,   33,   32,   70,    0,    0,    0,    0,    0,   69, yyDummy>>,
			1, 200, 2600)
		end

	yytable_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   68,   67,   66,   65,   64,   63,   62,   61,   60,   59,
			   58,   57,   56,   55,   54,   53,   52,   51,   50,   49,
			   48,   47,   46,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   45,   44,    0,   43,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   42,   41,
			    0,    0,    0,    0, -674,    0, -674,    0, -674,    0,
			 -674, -674, -674, -674,    0,    0, -674, -674,    0, -674,
			    0,    0, -674, -674,    0,    0, 1452, -674,    0,    0,
			 1456, -674,    0,    0,    0, -674, 1461, -674, -674, 1465,
			    0,    0, -674, -674,    0,    0,    0,    0,    0,    0,

			    0,    0,    0, -674,    0, -674, -674,    0,    0, -674,
			    0, -683,    0,    0, -674, -674,    0, -674, -674,    0,
			 -674, -674, -674,  158,  158,    0,  158,  158,  158, -674,
			 -674, -674, -674, -674, -674, -674, -674, -674, -674, -674,
			 -674, -674, -674, -674, -674, -674, -674, -674, -674, -674,
			 -674, -674,    0, -674, -674,    0,    0,    0,    0,    0,
			    0,    0,    0,    0, -674, -674, -674,    0, -674,    0,
			 -674,    0,    0,    0,    0, -674,    0, -674,    0,    0,
			    0,    0,    0,    0, -674, -680,    0,    0, -680, -680,
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
			 -680, -680,    0, -680, -680, -680, -680, -680, -680, -680,
			 -680, -680,  305,    0,    0,    0,    0,    0,    0,    0,
			   71,    0,    0,    0,  157,  163,   70,  172,  177,  181,
			    0,    0,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,   46,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   45,   44,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  788,
			    0,   42,   41,    0,    0,    0,    0,    0,    0, -681, yyDummy>>,
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
			 -681, -681, -681,    0, -681, -681, -681, -681, -681, -681,
			 -681, -681, -681, -679, -679, -679, -679, -679,    0, -679,
			 -679, -679, -679, -679, -679,    0, -679, -679, -679,    0,
			 -679, -679,    0, -679, -679, -679,    0, -679, -679, -679,
			    0, -679, -679,    0,    0,    0, -679,    0, -679, -679,
			 -679,    0,    0, -679, -679, -679,    0,    0,    0, -679,
			    0, -679,    0,    0, -679, -679, -679, -679,    0,    0,
			 -679, -679,    0,    0,    0, -679, -679,    0, -679, -679, yyDummy>>,
			1, 200, 3200)
		end

	yytable_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -679, -679, -679, -679, -679, -679, -679, -679, -679, -679,
			 -679, -679, -679, -679, -679, -679, -679, -679, -679, -679,
			 -679, -679, -679, -679, -679, -679, -679, -679, -679, -679,
			 -679, -679, -679, -679, -679, -679, -679, -679, -679, -679,
			 -679, -679, -679, -679, -679, -679, -679, -679, -679, -679,
			    0, -679, -679,    0, -679, -679, -679,    0, -679, -679,
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
			 -332, -332, -332, -332,    0, -332, -332,    0, -332, -332,
			 -332,    0, -332, -332, -332, -332, -332, -332, -332, -332, yyDummy>>,
			1, 200, 3400)
		end

	yytable_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -332, -673,    0, -673,    0, -673,    0, -673, -673, -673,
			 -673,    0,    0, -673, -673,    0, -673,    0,    0, -673,
			 -673,    0,    0,    0, -673,    0,    0,    0, -673,    0,
			    0,    0, -673,    0, -673, -673,    0,    0,    0, -673,
			 -673,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			 -673,    0, -673, -673,    0,    0, -673,    0, -682,    0,
			    0, -673, -673,    0, -673, -673,    0, -673, -673, -673,
			    0,    0,    0,    0,    0,    0, -673, -673, -673, -673,
			 -673, -673, -673, -673, -673, -673, -673, -673, -673, -673,
			 -673, -673, -673, -673, -673, -673, -673, -673, -673,    0,

			 -673, -673,    0,    0,    0,    0,    0,    0,    0,    0,
			    0, -673, -673, -673,    0, -673,    0, -673,    0,    0,
			    0, -698, -673, -698, -673, -698,    0, -698, -698, -698,
			 -698, -673, -681, -698, -698,    0, -698,    0,    0, -698,
			 -698,    0,    0,    0, -698,    0,    0,    0, -698,    0,
			    0,    0, -698,    0, -698, -698,    0,    0,    0, -698,
			 -698,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			 -698,    0, -698, -698,    0,    0, -698,    0,    0,    0,
			    0, -698, -698,    0, -698, -698,    0, -698, -698, -698,
			    0,    0,    0,    0,    0,    0, -698, -698, -698, -698, yyDummy>>,
			1, 200, 3600)
		end

	yytable_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -698, -698, -698, -698, -698, -698, -698, -698, -698, -698,
			 -698, -698, -698, -698, -698, -698, -698, -698, -698,    0,
			 -698, -698,    0,    0,    0,    0,    0,    0,    0,    0,
			    0, -698, -698, -698,    0, -698,    0,  464,    0,    0,
			    0,    0, -698, -698, -698,    0,    0,    0,    0,    0,
			    0, -698, -698, -672,    0, -672,    0, -672,    0, -672,
			 -672, -672, -672,    0,    0, -672, -672,    0, -672,    0,
			    0, -672, -672,    0,    0,    0, -672,    0,    0,    0,
			 -672,    0,    0,    0, -672,    0, -672, -672,    0,    0,
			    0, -672, -672,    0,    0,    0,    0,    0,    0,    0,

			    0,    0, -672,    0, -672, -672,    0,    0, -672,    0,
			    0,    0,    0, -672, -672,    0, -672, -672,    0, -672,
			 -672, -672,    0,    0,    0,    0,    0,    0, -672, -672,
			 -672, -672, -672, -672, -672, -672, -672, -672, -672, -672,
			 -672, -672, -672, -672, -672, -672, -672, -672, -672, -672,
			 -672,    0, -672, -672,    0,    0,    0,    0,    0,    0,
			    0,    0,    0, -672, -672, -672,    0, -672,    0, -672,
			    0,    0,    0, -677, -672, -677, -672, -677,    0, -677,
			 -677, -677, -677, -672, -679, -677, -677,    0, -677,    0,
			    0, -677, -677,    0,    0,    0, -677,    0,    0,    0, yyDummy>>,
			1, 200, 3800)
		end

	yytable_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -677,    0,    0,    0, -677,    0, -677, -677,    0,    0,
			    0, -677, -677,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, -677,    0, -677, -677,    0,    0, -677,    0,
			    0,    0,    0, -677, -677,    0, -677, -677,    0, -677,
			 -677, -677,    0,    0,    0,    0,    0,    0, -677, -677,
			 -677, -677, -677, -677, -677, -677, -677, -677, -677, -677,
			 -677, -677, -677, -677, -677, -677, -677, -677, -677, -677,
			 -677,    0, -677, -677,    0,    0,    0,    0,    0,    0,
			    0,    0,    0, -677, -677, -677,    0, -677,    0, -677,
			    0,    0,    0, -678, -677, -678, -677, -678,    0, -678,

			 -678, -678, -678, -677,    0, -678, -678,    0, -678,    0,
			    0, -678, -678,    0,    0,    0, -678,    0,    0,    0,
			 -678,    0,    0,    0, -678,    0, -678, -678,    0,    0,
			    0, -678, -678,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, -678,    0, -678, -678,    0,    0, -678,    0,
			    0,    0,    0, -678, -678,    0, -678, -678,    0, -678,
			 -678, -678,    0,    0,    0,    0,    0,    0, -678, -678,
			 -678, -678, -678, -678, -678, -678, -678, -678, -678, -678,
			 -678, -678, -678, -678, -678, -678, -678, -678, -678, -678,
			 -678,    0, -678, -678,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 4000)
		end

	yytable_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0, -678, -678, -678,    0, -678,    0, -678,
			    0,    0,    0, -676, -678, -676, -678, -676,    0, -676,
			 -676, -676, -676, -678,    0, -676, -676,    0, -676,    0,
			    0, -676, -676,    0,    0,    0, -676,    0,    0,    0,
			 -676,    0,    0,    0, -676,    0, -676, -676,    0,    0,
			    0, -676, -676,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, -676,    0, -676, -676,    0,    0, -676,    0,
			    0,    0,    0, -676, -676,    0, -676, -676,    0, -676,
			 -676, -676,    0,    0,    0,    0,    0,    0, -676, -676,
			 -676, -676, -676, -676, -676, -676, -676, -676, -676, -676,

			 -676, -676, -676, -676, -676, -676, -676, -676, -676, -676,
			 -676,    0, -676, -676,    0,    0,    0,    0,    0,    0,
			    0,    0,    0, -676, -676, -676,    0, -676,    0, -676,
			    0,    0,    0, -675, -676, -675, -676, -675,    0, -675,
			 -675, -675, -675, -676,    0, -675, -675,    0, -675,    0,
			    0, -675, -675,    0,    0,    0, -675,    0,    0,    0,
			 -675,    0,    0,    0, -675,    0, -675, -675,    0,    0,
			    0, -675, -675,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, -675,    0, -675, -675,    0,    0, -675,    0,
			    0,    0,    0, -675, -675,    0, -675, -675,    0, -675, yyDummy>>,
			1, 200, 4200)
		end

	yytable_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			 -675, -675,    0,    0,    0,    0,    0,    0, -675, -675,
			 -675, -675, -675, -675, -675, -675, -675, -675, -675, -675,
			 -675, -675, -675, -675, -675, -675, -675, -675, -675, -675,
			 -675,    0, -675, -675,    0,    0,    0,    0,    0,  966,
			   74,    0,    0, -675, -675, -675, 1495, -675,    0, -675,
			  313,    0,    0,  312, -675,    0, -675,    0,    0,    0,
			    0,    0,    0, -675,    0,  311,    0,    0,    0,    0,
			    0,  310,    0, 1402,    0,    0,    0,    0,    0,    0,
			    0,    0,  309,    0,    0,    0,    0,  308,    0,  307,
			  306,    0,    0,  305,    0,    0,    0,    0,   73,   72,

			    0,   71,  304,  303,   34,   33,   32,  302,    0,    0,
			    0,  301,    0,   69,   68,   67,   66,   65,   64,   63,
			   62,   61,   60,   59,   58,   57,   56,   55,   54,   53,
			   52,   51,   50,   49,   48,   47,  300,  299,    0,    0,
			    0,    0,    0,    0,    0,    0,  827,   74,  298,   45,
			   44,  297,  296, 1403,  295,    0,    0,  313,    0,  294,
			  312,    0,  293,  292,    0,    0,    0,    0,    0,  132,
			    0,    0,  311,    0,    0,    0,    0,    0,  310,    0,
			 1402,    0,    0,    0,    0,    0,    0,    0,    0,  309,
			    0,    0,    0,    0,  308,    0,  307,  306,    0,    0, yyDummy>>,
			1, 200, 4400)
		end

	yytable_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  305,    0,    0,    0,    0,   73,   72,    0,   71,  304,
			  303,   34,   33,   32,  302,    0,    0,    0,  301,    0,
			   69,   68,   67,   66,   65,   64,   63,   62,   61,   60,
			   59,   58,   57,   56,   55,   54,   53,   52,   51,   50,
			   49,   48,   47,  300,  299,    0,    0,    0,    0,    0,
			   74,    0,    0,    0,    0,  298,   45,   44,  297,  296,
			  313,  295,    0,  312,    0,    0,  294,    0,    0,  293,
			  292,    0,    0,    0,    0,  311,  132,    0,    0,    0,
			    0,  310,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  309,    0,    0,    0,    0,  308,    0,  307,

			  306,    0,    0,  305,    0,    0,    0,    0,   73,   72,
			    0,   71,  304,  303,   34,   33,   32,  302,    0,    0,
			    0,  301,    0,   69,   68,   67,   66,   65,   64,   63,
			   62,   61,   60,   59,   58,   57,   56,   55,   54,   53,
			   52,   51,   50,   49,   48,   47,  300,  299,    0,    0,
			    0,    0,  966,   74,    0,    0,    0,    0,  298,   45,
			   44,  297,  845,  313,  295,  977,  312,    0,    0,  294,
			    0,    0,  293,  292,    0,    0,    0,    0,  311,  132,
			  844,    0,    0,    0,  310,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  309,    0,    0,    0,    0, yyDummy>>,
			1, 200, 4600)
		end

	yytable_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  308,    0,  307,  306,    0,    0,  305,    0,    0,    0,
			    0,   73,   72,    0,   71,  304,  303,   34,   33,   32,
			  302,    0,    0,    0,  301,    0,   69,   68,   67,   66,
			   65,   64,   63,   62,   61,   60,   59,   58,   57,   56,
			   55,   54,   53,   52,   51,   50,   49,   48,   47,  300,
			  299,    0,    0,    0,    0,  827,   74,    0,    0,    0,
			    0,  298,   45,   44,  297,  296,  313,  295,    0,  312,
			    0,    0,  294,    0,    0,  293,  292,    0,    0,    0,
			    0,  311,  132,    0,    0,    0,    0,  310,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  309,    0,

			    0,    0,    0,  308,    0,  307,  306,    0,    0,  305,
			    0,    0,    0,    0,   73,   72,    0,   71,  304,  303,
			   34,   33,   32,  302,    0,    0,    0,  301,    0,   69,
			   68,   67,   66,   65,   64,   63,   62,   61,   60,   59,
			   58,   57,   56,   55,   54,   53,   52,   51,   50,   49,
			   48,   47,  300,  299,    0,    0,    0,    0,    0,   74,
			    0,    0,    0,    0,  298,   45,   44,  297,  296,  313,
			  295,    0,  312,    0,    0,  294,    0,    0,  293,  292,
			    0,    0,    0,    0,  311,  132,    0,    0,    0,    0,
			  310,    0,    0,    0,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 4800)
		end

	yytable_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,  309,    0,    0,    0,    0,  308,    0,  307,  306,
			    0,    0,  305,    0,    0,    0,    0,   73,   72,    0,
			   71,  304,  303,   34,   33,   32,  302,    0,    0,    0,
			  301,    0,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,  300,  299,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  298,   45,   44,
			  297,  845, 1163,  295, 1162,    0, 1161,    0,  294,    0,
			    0,  293,  292,    0, 1160, 1159,    0, 1158,  132,  844,
			 1157,    0,    0,    0,    0,    0,    0,    0,    0,  311,

			    0,    0,    0,    0,    0,  310,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0, 1156,    0,  307, 1155,    0,    0,  305,    0,    0,
			    0,    0,   73,   72,    0,   71,  304,    0,   34,   33,
			   32,    0,    0,    0,    0,    0,    0,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,   59,   58,   57,
			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47,
			    0, 1154, 1153,    0,    0,    0,    0,    0,    0,   74,
			    0,    0,  298,   45,   44,    0, 1152,    0,  295,  313,
			    0,    0,  312,  294,    0, 1151,    0,    0,    0,    0, yyDummy>>,
			1, 200, 5000)
		end

	yytable_template_27 (an_array: ARRAY [INTEGER])
			-- Fill chunk #27 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0, 1150,    0,  311,    0,    0,    0,    0,    0,
			  310,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  309,    0,    0,    0,    0,  308,    0,  307,  306,
			    0,    0,  305,    0,    0,    0,    0,   73,   72,    0,
			   71,  304,  303,   34,   33,   32,  302,    0,    0,    0,
			  301,    0,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,  300,  299,    0,    0,    0,
			    0,    0,   74,    0,    0,    0,    0,  298,   45,   44,
			  297,  296,  313,  295,    0,  312,    0,  972,  294,    0,

			    0,  293,  292,    0,    0,    0,    0,  311,  132,    0,
			    0,    0,    0,  310,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  309,    0,    0,    0,    0,  308,
			    0,  307,  306,    0,    0,  305,    0,    0,    0,    0,
			   73,   72,    0,   71,  304,  303,   34,   33,   32,  302,
			    0,    0,    0,  301,    0,   69,   68,   67,   66,   65,
			   64,   63,   62,   61,   60,   59,   58,   57,   56,   55,
			   54,   53,   52,   51,   50,   49,   48,   47,  300,  299,
			    0,    0,    0,    0,    0,   74,    0,    0,    0,    0,
			  298,   45,   44,  297,  953,  313,  295,    0,  312,    0, yyDummy>>,
			1, 200, 5200)
		end

	yytable_template_28 (an_array: ARRAY [INTEGER])
			-- Fill chunk #28 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,  294,  788,    0,  293,  292,    0,    0,    0,    0,
			  311,  132,    0,    0,    0,    0,  310,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  309,    0,    0,
			    0,    0,  308,    0,  307,  306,    0,    0,  305,    0,
			    0,    0,    0,   73,   72,    0,   71,  304,  303,   34,
			   33,   32,  302,    0,    0,    0,  301,    0,   69,   68,
			   67,   66,   65,   64,   63,   62,   61,   60,   59,   58,
			   57,   56,   55,   54,   53,   52,   51,   50,   49,   48,
			   47,  300,  299,    0,    0,    0,    0,    0,   74,    0,
			    0,    0,    0,  298,   45,   44,  297,  296,  313,  295,

			  936,  312,    0,    0,  294,    0,    0,  293,  292,    0,
			    0,    0,    0,  311,  132,    0,    0,    0,    0,  310,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  309,    0,    0,    0,    0,  308,    0,  307,  306,    0,
			    0,  305,  791,    0,    0,    0,   73,   72,    0,   71,
			  304,  303,   34,   33,   32,  302,    0,    0,    0,  301,
			    0,   69,   68,   67,   66,   65,   64,   63,   62,   61,
			   60,   59,   58,   57,   56,   55,   54,   53,   52,   51,
			   50,   49,   48,   47,  300,  299,    0,    0,    0,    0,
			    0,   74,    0,    0,    0,    0,  298,   45,   44,  297, yyDummy>>,
			1, 200, 5400)
		end

	yytable_template_29 (an_array: ARRAY [INTEGER])
			-- Fill chunk #29 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  296,  313,  295,    0,  312,    0,    0,  294,    0,    0,
			  293,  292,    0,    0,    0,    0,  311,  132,    0,    0,
			    0,    0,  310,    0,  671,    0,    0,    0,    0,    0,
			    0,    0,    0,  309,    0,    0,    0,    0,  308,    0,
			  307,  306,    0,    0,  305,    0,    0,    0,    0,   73,
			   72,    0,   71,  304,  303,   34,   33,   32,  302,    0,
			    0,    0,  301,    0,   69,   68,   67,   66,   65,   64,
			   63,   62,   61,   60,   59,   58,   57,   56,   55,   54,
			   53,   52,   51,   50,   49,   48,   47,  300,  299,    0,
			    0,    0,    0,    0,   74,    0,    0,    0,  669,  298,

			   45,   44,  297,  296,  313,  295,    0,  312,    0,    0,
			  294,    0,    0,  293,  292,    0,    0,    0,    0,  311,
			  132,    0,    0,    0,    0,  310,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  309,    0,    0,    0,
			    0,  308,    0,  307,  306,    0,    0,  305,    0,    0,
			    0,    0,   73,   72,    0,   71,  304,  303,   34,   33,
			   32,  302,    0,    0,    0,  301,    0,   69,   68,   67,
			   66,   65,   64,   63,   62,   61,   60,   59,   58,   57,
			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47,
			  300,  299,    0,    0,    0,    0,    0,   74,    0,    0, yyDummy>>,
			1, 200, 5600)
		end

	yytable_template_30 (an_array: ARRAY [INTEGER])
			-- Fill chunk #30 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,  298,   45,   44,  297,  296,  313,  295,    0,
			  312,    0,    0,  294,    0,    0,  293,  292,    0,    0,
			    0,    0,  311,  132,    0,    0,    0,    0,  310,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  309,
			    0,    0,    0,    0,  308,    0,  307,  306,    0,    0,
			  305,    0,    0,    0,    0,   73,   72,    0,   71,  304,
			  303,   34,   33,   32,  302,    0,    0,    0,  301,    0,
			   69,   68,   67,   66,   65,   64,   63,   62,   61,   60,
			   59,   58,   57,   56,   55,   54,   53,   52,   51,   50,
			   49,   48,   47,  300,  299,    0,    0,    0,    0,    0,

			   74,    0,    0,    0,    0,  298,   45,   44,  297,  296,
			  313,  295,    0,  312,    0,  518,  294,    0,    0,  293,
			  292,    0,    0,    0,    0,  311,  132,    0,    0,    0,
			    0,  310,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  309,    0,    0,    0,    0,  308,    0,  307,
			  306,    0,    0,  305,    0,    0,    0,    0,   73,   72,
			    0,   71,  304,  303,   34,   33,   32,  302,    0,    0,
			    0,  301,    0,   69,   68,   67,   66,   65,   64,   63,
			   62,   61,   60,   59,   58,   57,   56,   55,   54,   53,
			   52,   51,   50,   49,   48,   47,  300,  299,    0,    0, yyDummy>>,
			1, 200, 5800)
		end

	yytable_template_31 (an_array: ARRAY [INTEGER])
			-- Fill chunk #31 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,   74,    0,    0,    0,    0,  298,   45,
			   44,  297,  296,  313,  295,    0,  312,    0,    0,  294,
			    0,    0,  293,  292,    0,    0,    0,    0,  311,  132,
			    0,    0,    0,    0,  310,    0,    0,    0,    0,    0,
			    0,    0, -642,    0, -642,  309,    0,    0,    0,    0,
			  308,    0,  307,  306,    0,    0,  305,    0,    0,    0,
			    0,   73,   72,    0,   71,  304,  303,   34,   33,   32,
			  302,    0,    0,    0,  301,    0,   69,   68,   67,   66,
			   65,   64,   63,   62,   61,   60,   59,   58,   57,   56,
			   55,   54,   53,   52,   51,   50,   49,   48,   47,  300,

			  299,  513,    0,    0,    0,    0,  512,  511,  510, 1313,
			  509,  298,   45,   44,  297,  480,    0,  295,    0, 1198,
			    0,    0,  294,    0,    0,  293,  292,    0,    0,    0,
			    0,    0,  132,    0,    0,    0,    0,  508,  507,  506,
			  505,  504,  503,  502,  501,  500,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  497,  496,  495,  494,  493,  492,  513,    0,    0,    0,
			    0,  512,  511,  510,    0,  509,  513,    0,    0,    0,
			    0,  512,  511,  510,    0,  509,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 6000)
		end

	yytable_template_32 (an_array: ARRAY [INTEGER])
			-- Fill chunk #32 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,  508,  507,  506,  505,  504,  503,  502,  501,
			  500,    0,  508,  507,  506,  505,  504,  503,  502,  501,
			  500,    0,    0,    0,    0,  497,  496,  495,  494,  493,
			  492,    0,    0,    0,    0,  497,  496,  495,  494,  493,
			  492, -332,    0,    0, -332,    0, -332, -332,    0,    0,
			 -332,    0, -332,    0,    0,    0, -332,    0, -332,    0,
			 -332, -332, -332,    3, -332,    0, -332,    0, -332,    0,
			    0,    2, -332,    0,    0,    0, -332,    0,    0,    0,
			    0,    0,    0,    0, 1430,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0, -332, -332, -332,    0,    0,   73,   72,    0,
			   71,    0,    0,    0,    0, 1553,   70,    0,    0,    0,
			    0,    0,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,   46,    0,    0,    0,    0,
			    0,    0, -332,    0, -332, -332,    0,  513,   45,   44,
			    0,   43,  512,  511,  510,    0,  509,    0,    0,    0,
			    0,   42,   41, 1314,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  508,  507,  506,  505,  504,  503,  502, yyDummy>>,
			1, 200, 6200)
		end

	yytable_template_33 (an_array: ARRAY [INTEGER])
			-- Fill chunk #33 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  501,  500,    0,  513,    0,    0,    0,    0,  512,  511,
			  510,    0,  509,    0,    0,    0,  497,  496,  495,  494,
			  493,  492,  645,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  508,
			  507,  506,  505,  504,  503,  502,  501,  500,    0,    0,
			    0,    0,  513,    0,    0,    0,    0,  512,  511,  510,
			    0,  509,  497,  496,  495,  494,  493,  492,    0,    0,
			    0, 1086,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  508,  507,
			  506,  505,  504,  503,  502,  501,  500,  513,    0,    0,

			    0,    0,  512,  511,  510,    0,  509,    0,    0,    0,
			    0,  497,  496,  495,  494,  493,  492,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  508,  507,  506,  505,  504,  503,  502,
			  501,  500, 1423,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  497,  496,  495,  494,
			  493,  492,    0,    0,    0,   73,   72,    0,   71,    0,
			    0,    0,    0,    0,   70,    0,    0,    0,    0,    0,
			   69,   68,   67,   66,   65,   64,   63,   62,   61,   60,
			   59,   58,   57,   56,   55,   54,   53,   52,   51,   50, yyDummy>>,
			1, 200, 6400)
		end

	yytable_template_34 (an_array: ARRAY [INTEGER])
			-- Fill chunk #34 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   49,   48,   47,   46,    0,    0,    0,    0,    0,    0,
			    0,    0,  305,    0,    0,    0,   45,   44,    0,   43,
			   71,    0,    0,    0,    0,    0,   70,    0,    0,   42,
			   41,    0,   69,   68,   67,   66,   65,   64,   63,   62,
			   61,   60,   59,   58,   57,   56,   55,   54,   53,   52,
			   51,   50,   49,   48,   47,   46,  790,    0,    0,    0,
			    0,    0,    0,    0,    0,  513,    0,    0,   45,   44,
			  512,  511,  510,    0,  509,    0,    0,    0,    0,  788,
			    0,   42,   41,    0,    0,    0,    0,    0,    0, 1208,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,  508,  507,  506,  505,  504,  503,  502,  501,  500,
			  305,    0,    0,    0,    0,    0,    0,    0,   71,  499,
			    0,    0,    0,    0,  497,  496,  495,  494,  493,  492,
			   69,   68,   67,   66,   65,   64,   63,   62,   61,   60,
			   59,   58,   57,   56,   55,   54,   53,   52,   51,   50,
			   49,   48,   47,  513,    0,    0,    0,    0,  512,  511,
			  510,    0,  509,  513,    0,    0,   45,   44,  512,  511,
			  510,    0,  509,    0,    0,    0,    0, 1471,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  508,
			  507,  506,  505,  504,  503,  502,  501,  500,    0,  508, yyDummy>>,
			1, 200, 6600)
		end

	yytable_template_35 (an_array: ARRAY [INTEGER])
			-- Fill chunk #35 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  507,  506,  505,  504,  503,  502,  501,  500,    0,    0,
			    0,    0,  497,  496,  495,  494,  493,  492, 1084,    0,
			    0,    0,  497,  496,  495,  494,  493,  492,  964,  513,
			    0,    0,    0,    0,  512,  511,  510,    0,  509,    0,
			   69,   68,   67,   66,   65,   64,   63,   62,   61,   60,
			   59,   58,   57,   56,   55,   54,   53,   52,   51,   50,
			   49,   48,   47,    0,    0,  508,  507,  506,  505,  504,
			  503,  502,  501,  500,    0,    0,    0,   44,    0,  483,
			  513,    0,    0,  499,  971,  512,  511,  510,  497,  496,
			  495,  494,  493,  492,  513,    0,    0,    0,    0,  512,

			  511,  510,    0,  509,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  508,  507,  506,  505,
			  504,  503,  502,  501,  500,    0,    0,    0,    0,    0,
			  508,  507,  506,  505,  504,  503,  502,  501,  500,  497,
			  496,  495,  494,  493,  492,    0,  935,    0,  499,    0,
			    0,    0,    0,  497,  496,  495,  494,  493,  492,  513,
			    0,    0,    0,    0,  512,  511,  510,    0,  509,    0,
			   69,   68,   67,   66,   65,   64,   63,   62,   61,   60,
			   59,   58,   57,   56,   55,   54,   53,   52,   51,   50,
			   49,   48,   47,    0,    0,  508,  507,  506,  505,  504, yyDummy>>,
			1, 200, 6800)
		end

	yytable_template_36 (an_array: ARRAY [INTEGER])
			-- Fill chunk #36 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  503,  502,  501,  500,    0,    0,    0,   44,    0,    0,
			    0,    0,    0,  499,  498,    0,    0,    0,  497,  496,
			  495,  494,  493,  492,  513,    0,    0,    0,    0,  512,
			  511,  510,    0,  509,    0, 1244, 1243, 1242, 1241, 1240,
			 1239, 1238, 1237, 1236, 1235, 1234, 1233, 1232, 1231, 1230,
			 1229, 1228, 1227, 1226, 1225, 1224, 1223, 1222,    0,    0,
			  508,  507,  506,  505,  504,  503,  502,  501,  500,    0,
			    0,    0,  513,    0,    0,    0,  680,  512,  511,  510,
			    0,  509,    0,  497,  496,  495,  494,  493,  492,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,  508,  507,
			  506,  505,  504,  503,  502,  501,  500,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  497,  496,  495,  494,  493,  492,   71,    0,    0,
			    0,    0,    0,   70,    0,    0,    0,    0,    0,   69,
			   68,   67,   66,   65,   64,   63,   62,   61,   60,   59,
			   58,   57,   56,   55,   54,   53,   52,   51,   50,   49,
			   48,   47,   46,    0,    0,    0,    0,    0,    0,    0,
			  -12,    0,    0,    0,  -12,   45,   44,  -12,    0,    0,
			  -12,    0,    0,  -12,    0,    0,    0,    0,   42,   41, yyDummy>>,
			1, 200, 7000)
		end

	yytable_template_37 (an_array: ARRAY [INTEGER])
			-- Fill chunk #37 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,  -12,    0,    0,  -12,  -12,    0,    0,    0,  -12,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  -12,
			  -12,    0,  -12,    0,    0,  -12, 1330, 1331, 1332, 1333,
			 1334, 1335, 1336, 1337, 1338, 1339, 1340, 1341, 1342, 1343,
			 1344, 1345, 1346, 1347, 1348, 1349, 1350, 1351, yyDummy>>,
			1, 48, 7200)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 7247)
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
			   83, 1131,   83,  903,  651,  136, 1290, 1124,   83,   98,
			  910,  951,   83,  538,   83,  106,   97,  106,  167,  106,
			  167,  306,  103,  106, 1123,  106, 1125, 1539,  553,  676,

			  677,  106,  902,   14,   99,  106,  402,  106,  404,  188,
			  202,  122,  367, 1170,  135,   36,  135,   36,  135, 1402,
			    4, 1479,  135,   21,  135,   63,   64,   22,  139,  140,
			  135,  142,  248,   26,  135,   30,  135,  148,  149,  150,
			 1582, 1498, 1220,   72,  155,   74,   71,  443,  444,  445,
			  161,  146,  128,   14,   22, 1014,  167,   14, 1017,  170,
			   83,  137,   30,  242,  175,   17,  243,  244,  179,  190,
			  336,  190,   56,  183,  941, 1389,   28,   38,  189,    0,
			  125, 1623,  192,  106, 1014,   83,   20, 1017,   45,  114,
			  128,  950,  704, 1476,   46, 1251, 1261,  822, 1258, 1556, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   68, 1001,  213,  124, 1251,  124,  216,  136,  106,  153,
			  221,  892,  135,  224,   12,  159,   14,  227, 1247,   75,
			  231,  745,    0,  747,  168,  749,  137,  705,  706,  173,
			 1588,  124,  243,  244,  178,   11, 1293,  135,   72,   73,
			   74,   14,   14,  254,   14, 1012, 1324,  257,  104,  704,
			  261, 1110,   14,  264,   14, 1539,   32,  267, 1051,  836,
			  271,  353,  354,  273, 1539,   14,  277, 1137,  212,  524,
			  525,  526,  527,   45,   34,  558,   52, 1070,   38,  223,
			 1110, 1300,   42,  294, 1300,  296,  296, 1300, 1300, 1300,
			 1555, 1161,  311,  128, 1300,   37,  307,  463, 1582,   17,

			 1360, 1022,  137,  599,  600,  601,  311, 1582,   75,  253,
			   72,   73,   74,   72,   73,   74,    8,    9,  940,  263,
			   11, 1191,   14,   72,   73,   74,   18,  949,   46,   47,
			   22,   49,   11,   25,   17,  125, 1550,  104,   30, 1623,
			  799,   32,  625,  120,   11,   28,    4,  137, 1623,   72,
			   73,   74,   14,   32, 1432,  814,   14, 1435,  798,  136,
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
			  123,   46,   47,   22,   49,   17,   25,   52,  121,   11,
			  420,   30,   72,   73,   74,  425,   28,   14,  429, 1186,
			   72,   73,   74,  433,  137,   14,  437,   11,  120,  616,
			   32, 1190,   14,   69,   53, 1513,   72,   73,   74,   75,
			   44,   45,  122,  726,  124,  125,   17,  616,   32,   14,
			  733,  395,  618,  105,  398,  621,  122,   28,  468,  674,
			  675,  405,  120,  123,  408,   14,  477,  411,  120,  480,
			  480,   17,   72,  483,   74,   46,  486,   17,  136,   14,
			   15,  117,   28,  294,  120,  308, 1090,  999,   28,  312,
			  123,  136,  125, 1005,  130,  131,  307, 1218,   14,   27,

			   46,  120,   37,  514,  515,   11,   46,  586,  587,  586,
			  587,   69,  121,  336,   11,  126,  125,   75,  126,   47,
			 1073,   49,   50,   51, 1291,  136,   32,  538,  136,  352,
			   72,   73,   74,  612,  613,   32, 1303,  819,   12,  822,
			   14,   14,  553,   11,   72,   73,   74,  558,   70,   17,
			   72,   73,   74,  564,   22,  566,  126,   14,   26,  117,
			   28,   34,   30,   31,   32,   38,   27,  137,   36,   42,
			  128,  786,  130,  131,  585,  586,  587,  121,   46,  121,
			    3,  796,  126,  879,   52,   14,   11,   70,   49,   72,
			   73,   74,  120,  137,  890,  616,   27,  616,  120,  610, yyDummy>>,
			1, 200, 400)
		end

	yycheck_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   14,  129, 1323,  614, 1325,  615,  889,   32,   14, 1554,
			  138,   72,   73,   74,  625,   14,   71,  627,   49,  630,
			  631,  632,  633,   12,   13,   14,  636,  638,  639,  795,
			  641,   14,  643,  903,  578,   34,  647,  120,  582,   38,
			  463,   72,   73,   74,  105,  589, 1439,   63,   64,  593,
			 1520,   40,  107,  108,  477,   72,   73,   74,  113,  114,
			  115,   27,  124,  125,  132,   72,   73,   74,  136,  492,
			  493,  494,  495,  496,  497,  130,  131,  500,  501,  502,
			  503,  504,  505,  506,  507,  508,  509,  510,  511,  512,
			  513,   14,   17,  704,  705,  706, 1566,  933,  105,  776,

			  777,   17,  998,   28,  121, 1327,   72,   73,   74,  121,
			   14, 1264,   28, 1434,  126,  726,   17, 1270,   11,  934,
			  731,   46,  733,   14, 1517,  137,  122,   28,  162,   17,
			  741, 1356,   14,  744,  745, 1605,  747,  171,  749,   32,
			   28,  121,  176,   14, 1014,  125,  180,  758,  182,  760,
			   70,  121,   72,   73,   74,   14, 1309,   16, 1311,   12,
			 1519,   14, 1221, 1633,  775,  776,  777,  122, 1561,  124,
			  781,   14,  783,  784,   22,   34, 1646,  788,   26,   38,
			  214,   14,   30,   42,  803,  105, 1390,    8,    9,   14,
			  801,  225,  128,   14,   16,  618,  815,   18,  621, 1669, yyDummy>>,
			1, 200, 600)
		end

	yycheck_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  120,   22,  122,  813,   25,  824, 1565,   14, 1601,   30,
			  125,  822,   34,   35, 1436,   14,   38, 1442, 1611,  830,
			   42,  255,  645,   20,   27,  648,   14,  650,  651,   26,
			  825,  265,   53,   60,  845,  845,  120,   27,  122, 1122,
			 1123, 1124, 1125,   25, 1603,   14,  669,   29,  671,   75,
			 1643,   27,   75,  676,  677,   36,  679,   47,   14,   49,
			   50,   51,   44,   45,  124,  125, 1081, 1326,   13,   72,
			   73,   74,  122, 1632,  124,   72,   73,   74,  889,   47,
			   48,  892,   72,   73,   74,   70, 1645,   72,   73,   74,
			 1512,  902,  903,  123, 1447,  125,   72,   73,   74,  910,

			  911,  912,   45, 1090,   72,   73,   74,  125,  126, 1668,
			  905,  122,  923,  124,  925,   14,  927,   20,  929,  137,
			   14, 1090,  123,   26,  125,  122,   14,  124,  125,   31,
			  941,  942,  943,   29, 1217,  120, 1558,   27,   14,  129,
			 1155, 1563,  953,  953,  128,  122,   27,  124,  138,  121,
			 1503,  962,   70,   27,   72,   73,   74,   47,   14,   49,
			   50,   51, 1177,  397, 1247,  120,  400,  122, 1251,   72,
			   73,   74,  795,  407, 1433,   49,  410,   40,  412,  413,
			  124,  125,   72,   73,   74,   14, 1608,  105,  999,   41,
			 1001,   72,   73,   74, 1005,   72,   73,   74,   72,   73, yyDummy>>,
			1, 200, 800)
		end

	yycheck_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   74, 1012,   41, 1014,  122,   14, 1017,  830, 1018,  832,
			  833,  125,  126,  836, 1025,   14, 1322, 1323, 1571,  122,
			  128,  124,  125,  137,  847,   38,   70,   40,   72,   73,
			   74, 1050,  137,   70,   27,   72,   73,   74,   14,  129,
			 1059, 1052,  137, 1054, 1055, 1056, 1057,  125,  138,   14,
			 1069,   14, 1511,    7, 1065, 1514,   49,   11,  124,  125,
			   14,   14, 1615,   17, 1075,   44,   20,    8,    9, 1090,
			   27, 1090,   14, 1356,   28, 1086,  120,   31,   32,   72,
			   73,   74,   36,  120,  125,  126, 1639, 1640, 1099,  125,
			  126,   14,   46,   47,   14,   49, 1106, 1108,   52, 1110,

			 1653,  137,   22, 1562,   44,   25, 1116,  128, 1661,  121,
			   30, 1122, 1123, 1124, 1125,   72,   73,   74,  121,  942,
			  128, 1674,   70, 1676,   72,   73,   74,   14,  116, 1148,
			 1140,   27, 1322, 1323, 1687,   14,  959,   72,   73,   74,
			 1693,   38, 1152,  353,  354,  579, 1373,  754,  755,  583,
			 1703,   47,  121,   49,   50,   51,  590,   30,   31, 1442,
			  594, 1714, 1278,  911,  912,  153, 1054, 1055, 1056, 1057,
			 1723,  159,  120,   27,   14, 1186,   72,   73,   74,   14,
			  168,   27,  136,   25,   70,  173,   72,   73,   74,   70,
			  178,   72,   73,   74,   14,   49, 1411, 1412,  129,   27, yyDummy>>,
			1, 200, 1000)
		end

	yycheck_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   70, 1211,   72,   73,   74,   34, 1217,  136,   70,    3,
			   72,   73,   74,   54, 1214,   24,   25,   26,   72,   73,
			   74,   49,   27,   53,  212,   27,   72,   73,   74, 1052,
			  128,   14,   14,  129,  120,  223, 1247,   27,  137,  120,
			 1251,   14,  138,  137,   72,   73,   74,   49,  236, 1268,
			  120,   27,  128,  128, 1077, 1078,   63, 1472,  120,   49,
			 1376, 1272,   63, 1086,   19,  253,   27,   72,   73,   74,
			   72,   73,   74,   49,  112,  263,  120,   14, 1288, 1290,
			 1291,   27,   72,   73,   74, 1108, 1297, 1298,   49, 1300,
			 1285,   42, 1303, 1304,  282,   14,   72,   73,   74,    0,

			  125, 1322, 1323, 1322, 1323, 1322, 1323,  126,  126, 1322,
			 1323,   72,   73,   74, 1529,  126,  126, 1322, 1323,  753,
			 1535, 1322, 1323, 1322, 1323,   14,   72,   73,   74, 1273,
			  126,  126,   14, 1156, 1157, 1158, 1551,   11,  126,   27,
			   14,  126,   16,   17,   13, 1356,   20,  136,   22,  121,
			   27,   41,   26,  123,   28,   14,   30,   31,   32, 1574,
			   34,   49,   36,  128,   38,   16,   27,   14,   42, 1390,
			  358, 1390,   46,  123,  121, 1590,  364,  126, 1389,  121,
			  137, 1392, 1393,  126,   72,   73,   74,   27,   49,  137,
			 1400,  126,  126,  126, 1405,   72,   73,   74,   72,   73, yyDummy>>,
			1, 200, 1200)
		end

	yycheck_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   74,  126, 1397,  126,  126, 1416,  126,  395,  126,  167,
			  398,   72,   73,   74,  126,  136,   12,  405,   27, 1438,
			  408,  136,    5,  411,   14, 1369,  630,  631,  632,  633,
			  188, 1442,   72,   73,   74, 1379,  136,  120, 1382,  125,
			   49, 1385, 1657,    5,  202,   14,  125, 1458,  122,   27,
			  124,  125,  125,   27,  122,  136,   27,  128,  121,   27,
			 1471,  128,  128,   72,   73,   74,  126,  455, 1655,  126,
			  126, 1294, 1295,   47,  126,   49,   50,   51, 1301, 1302,
			 1491, 1304,  126,  126,  242,  126,   27,  126,  125,   18,
			   27, 1314, 1315,  128,   72,   73,   74, 1516,   72,   73,

			   74,   72,   73,   74,   72,   73,   74, 1451,   49,  128,
			  120, 1455,   49,  125,  125,  121, 1460,  125, 1539,  126,
			 1464,  126, 1539, 1534,  121,   12, 1539,   27, 1539,  121,
			   27,   72,   73,   74,  121,   72,   73,   74, 1549, 1550,
			  528, 1560,  530,  531,  121,  533,  128,  128,  128,   12,
			  126,  539,   49,  541,  542,  129,  544,  545,  546,  547,
			  121, 1582,  128,  121,  138, 1582,  126,  126, 1578, 1582,
			  126, 1582,   72,   73,   74,   72,   73,   74,  126,  126,
			  126, 1600, 1405,  126,  126,   27, 1409, 1062,  126,  128,
			  578, 1610,  126, 1416,  582,  353,  354, 1072,  121,  121, yyDummy>>,
			1, 200, 1400)
		end

	yycheck_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  128,  589, 1623,  121,  121,  593, 1623,   49,   71,   14,
			 1623,   27, 1623,   76,   77,   78, 1627,   80,   27,  113,
			  114,   25,  126, 1642,  118,  119,  120,  121,   14,    8,
			   72,   73,   74,   49, 1655,  126,  130,  123,   47,  123,
			   49,   50,   51,   27,  107,  108,  109,  110,  111,  112,
			  113,  114,  115,    5,  128,  123,   72,   73,   74,   27,
			  154,  123,  121,   72,   73,   74,  160,  130,  131,  132,
			  133,  134,  135,  167,  124,  169, 1499,  128,  121,  128,
			  174,   49,  121,  128, 1159,  121,  126,  128,   72,   73,
			   74,  125,  125,  125,  188,  125,  121,  121,  686,  687,

			   23,   74,  690,  691,   72,   73,   74,   35,  202,  128,
			  128,  699, 1187,   27,  128,  128,  128,  120,   62,  125,
			  129,  122,   27, 1546,  712,  121,  128,  715,  716,  138,
			  128,  719,  720,   47,  125,   49,   50,   51,  530,  233,
			  234,  533,  125,  121,  238,  239,  240,  241,  242,  541,
			  126,   27,  544,  128,  546,  547,   27,  128,   72,   73,
			   74,  126,   27,  124,  128,  113,  114,   72,   73,   74,
			  118,  119,  120,   49,  128,  120,  534,   59,   53,   59,
			  538,  110,   47,  126,   49,   50,   51,  128, 1263,   27,
			  128,  128,   27,  126,  128,  553,   72,   73,   74,   27, yyDummy>>,
			1, 200, 1600)
		end

	yycheck_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   59,   72,   73,   74,   27,   14,  154,   72,   73,   74,
			  128,   27,  160,  126, 1289,  129,  120,  128,  121,  128,
			    7,  169,  124,    7,  138,    7,  174,  585,  586,  587,
			  125,  124,    7, 1308,   72,   73,   74,   72,   73,   74,
			   17,  126,   27,  137,   72,   73,   74,   20, 1185,   72,
			   73,   74, 1480,  611,  612,  613,   72,   73,   74,  353,
			  354,  355,  356,   27,  129,  359,  360,  361,  362,  857,
			  800,  859,  860,  138,  862,  897,  864, 1211,  866,  867,
			  694,  869,  870,  871,  872,  233,  234,   72,   73,   74,
			  238,  239,  240,   27,  822,  687,   41,    8,    9,  691,

			 1251,  902,  396,   14,  902,  399,  378,   18,   72,   73,
			   74,   22,  406,  336,   25,  409,   79,  919, 1268,   30,
			  618, 1396, 1135,  919,  716,  919,   71,  142,  720, 1021,
			  307,   76,   77,   78,  952,   80,  694, 1371,   72,   73,
			   74, 1442,   53,  740, 1357, 1043,  704, 1381, 1547, 1079,
			 1384,  567, 1386, 1387, 1162,  733,  889, 1406,  892,  699,
			  712, 1323,  107,  108,  109,  110,  111,  112,  113,  114,
			  115,  465, 1476, 1300, 1486, 1164,  113,  114, 1405, 1582,
			 1623,  118,  119,  120, 1219,  130,  131,  132,  133,  134,
			  135, 1245,  980,  981,  847,  795,  984,  985,   -1,   -1, yyDummy>>,
			1, 200, 1800)
		end

	yycheck_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  988,  989,   -1,   -1,  992,  993,   -1,  355,  356, 1484,
			   -1,  359,  360,  361,   -1,   -1,   -1,  154, 1452,    8,
			    9,   -1, 1456,  160,   -1,   14,   -1, 1461,   -1,   18,
			   -1, 1465,  169,   22,   23,  529,   25,  174,  532,   -1,
			  534,   30, 1060,   -1,  538,   71,  540,   -1,  396,  543,
			   76,  399,   -1, 1071,   -1,   -1,   -1,   -1,  406,  553,
			   -1,  409,   -1,   -1,   53,   -1,   -1,  859,   -1,   -1,
			  862,   -1,   -1,   -1,  866,  569,   -1,  869, 1553,  871,
			  872,  107,  108,  109,  110,  111,  112,  113,  114,  115,
			   -1,  585,  586,  587,   -1, 1570,  233,  234,   -1,   -1,

			   -1,  238,  239,  240,  130,  131,  132,  133,  134,  135,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  611,  612,  613,
			 1138,   -1,  880,   71,   -1,   -1,    8,    9,   -1, 1604,
			   -1, 1149,   14,   -1,   14,   -1,   18,   -1,   18, 1614,
			   22,  528,   22,   25,  531,   25,   -1,   -1,   30,   -1,
			   30,   -1,  539,   -1,   -1,  542,   -1,   -1,  545,  107,
			  108,   -1,   -1, 1638,   -1,  113,  114,  115,   -1,    8,
			    9,   53,   -1,   53, 1192,   14, 1194,   -1,   -1,   18,
			   -1,  529,   -1,   22,  532, 1660,   25,   -1,   -1,  981,
			   -1,   30,  540,  985,   -1,  543,   -1,  989, 1673,   -1, yyDummy>>,
			1, 200, 2000)
		end

	yycheck_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  694,  993,   -1,  697,  698,   -1,  700,  701,  702,  703,
			  704,    5,   -1,   -1,   53,   -1,   -1, 1692,  355,  356,
			   -1,   -1,  359,  360,  361,   -1,   14,   -1,   -1,   -1,
			   18,   -1,   26,   -1,   22,   -1,   -1,   25,   -1,   -1,
			   -1,  999,   30,   -1, 1262,   -1,   -1, 1005,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  396,
			  754,  755,  399,   -1,   -1,   53,    7,   -1,   -1,  406,
			   11,   -1,  409,   14,   -1,   -1,   17,   71,   -1,   20,
			   -1,   -1,   76,   77,   78, 1273,   80,   28,   -1, 1307,
			   31,   32,   -1,   -1,   -1,   36,   -1,   -1,   -1,  686,

			   -1,   -1,   -1,  690,   -1,   46,   47,   -1,   49,   -1,
			   -1,   52,   -1,  107,  108,  109,  110,  111,  112,  113,
			  114,  115,   -1,   -1,   -1,   -1,   -1,   -1,  715,   -1,
			   -1,   -1,  719,   -1,   -1,   -1,  130,  131,  132,  133,
			  134,  135,   -1,   -1, 1362,   -1,   -1,   -1,   -1,  697,
			  698,   -1,  700,  701,  702,   -1,   -1,   -1,   -1,    7,
			   -1,   -1,   -1,   11,  858,   -1,   14,  861,   -1,   17,
			   -1,  865,   20,   71,  868,   -1,   -1,   -1,   -1,   -1,
			   28, 1369,   -1,   31,   32, 1373,  880,   -1,   36,   -1,
			   -1, 1379,  529, 1151, 1382,  532,   -1, 1385,   46,   47, yyDummy>>,
			1, 200, 2200)
		end

	yycheck_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			 1418,   49,   -1,  540,   52,   -1,  543,   -1,   -1,  107,
			  108,  109,  110,  111,  112,  113,  114,  115,   -1, 1437,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,    5,   12,   13,
			   14,   15,  130,  131,  132,  133,  134,  135,   -1,   -1,
			   -1,   25,   -1,   -1,   -1,   29,   -1,   -1,   26,   -1,
			   -1,   -1,   -1,   37, 1426,   -1,   40,   -1, 1430, 1431,
			   44,   45,   -1, 1451,   -1,   -1,   -1, 1455,   -1,   -1,
			  857,   -1, 1460,  860,   -1,   -1, 1464,  864,   -1,   -1,
			  867,   -1,   -1,  870,   -1,   -1,   -1,   -1,  136,   -1,
			   -1,   -1,   -1,   71,   -1,   -1,   -1, 1515,   76,   77,

			   78,   -1,   80, 1521,   -1,  999,   -1,   -1,   -1,   -1,
			  858, 1005,   -1,  861,   -1,   -1,   -1,  865,   -1,   -1,
			  868,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  107,
			  108,  109,  110,  111,  112,  113,  114,  115,   -1,   -1,
			   -1, 1559,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 1567,
			   -1, 1569,  130,  131,  132,  133,  134,  135,   -1,   -1,
			  697,  698,   -1,  700,  701,  702,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1, 1599,   -1,   -1,   -1,   -1,   -1,   -1, 1606, 1607,
			   -1, 1609,   -1,  980,   -1, 1613, 1568,  984,   -1,   -1, yyDummy>>,
			1, 200, 2400)
		end

	yycheck_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			 1618,  988,   -1,   -1,   -1,  992,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1, 1634,   -1, 1636,   -1,
			   -1,   -1,   -1, 1641,   -1,   -1,   -1,   -1,   -1, 1647,
			   -1,   -1, 1650,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			 1612, 1659,   -1,   -1,   -1,   -1, 1664,   -1,   -1,   -1,
			   -1,   -1, 1670,   -1, 1672,   -1,   -1, 1151,   -1,   -1,
			   -1,   -1,   -1, 1635,   -1,   -1, 1684,   -1,   -1,   -1,
			   -1,   -1,   -1, 1691,   -1,   -1,   -1,   -1, 1696,   -1,
			 1652,   -1, 1654,   -1,   -1,   -1, 1658,   -1,   -1,   -1,
			   -1,   -1,   -1, 1711,   -1,   -1,   -1,   -1,   -1, 1671,

			   -1,   -1,   -1, 1675,   -1, 1677,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1, 1686,   -1, 1688, 1689, 1690,   -1,
			   -1,  858,   -1,   -1,  861,   -1,    8,   -1,  865, 1701,
			 1702,  868, 1704,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1, 1713,   -1, 1715, 1716,   -1,   -1,   -1,   -1, 1721,
			 1722,   -1, 1724,   -1,   -1,   -1,   -1, 1729,   -1,   -1,
			   -1,   -1, 1734,   -1, 1736,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1, 1271, 1272,   -1,
			 1274, 1275, 1276, 1277,   66,   67,   -1,   69, 1282,   -1,
			   72,   73,   74,   75,   -1,   -1,   -1,   -1,   -1,   81, yyDummy>>,
			1, 200, 2600)
		end

	yycheck_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,  104,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,  117,  118,   -1,  120,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  130,  131,
			   -1,   -1,   -1,   -1,    6,   -1,    8,   -1,   10,   -1,
			   12,   13,   14,   15,   -1,   -1,   18,   19,   -1,   21,
			   -1,   -1,   24,   25,   -1,   -1, 1370,   29,   -1,   -1,
			 1374,   33,   -1,   -1,   -1,   37, 1380,   39,   40, 1383,
			   -1,   -1,   44,   45,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   -1,   55,   -1,   57,   58,   -1,   -1,   61,
			   -1,   63,   -1,   -1,   66,   67,   -1,   69,   70,   -1,
			   72,   73,   74, 1271, 1272,   -1, 1274, 1275, 1276,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,   -1,  105,  106,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,  116,  117,  118,   -1,  120,   -1,
			  122,   -1,   -1,   -1,   -1,  127,   -1,  129,   -1,   -1,
			   -1,   -1,   -1,   -1,  136,  137,   -1,   -1,    4,    5,
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
			  126,  127,   -1,  129,  130,  131,  132,  133,  134,  135,
			  136,  137,   61,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   69,   -1,   -1,   -1, 1271, 1272,   75, 1274, 1275, 1276,
			   -1,   -1,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  117,  118,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  128,
			   -1,  130,  131,   -1,   -1,   -1,   -1,   -1,   -1,    4, yyDummy>>,
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
			  125,  126,  127,   -1,  129,  130,  131,  132,  133,  134,
			  135,  136,  137,    4,    5,    6,    7,    8,   -1,   10,
			   11,   12,   13,   14,   15,   -1,   17,   18,   19,   -1,
			   21,   22,   -1,   24,   25,   26,   -1,   28,   29,   30,
			   -1,   32,   33,   -1,   -1,   -1,   37,   -1,   39,   40,
			   41,   -1,   -1,   44,   45,   46,   -1,   -1,   -1,   50,
			   -1,   52,   -1,   -1,   55,   56,   57,   58,   -1,   -1,
			   61,   62,   -1,   -1,   -1,   66,   67,   -1,   69,   70, yyDummy>>,
			1, 200, 3200)
		end

	yycheck_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   71,   72,   73,   74,   75,   76,   77,   78,   79,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,  105,  106,  107,  108,  109,  110,
			  111,  112,  113,  114,  115,  116,  117,  118,  119,  120,
			   -1,  122,  123,   -1,  125,  126,  127,   -1,  129,  130,
			  131,  132,  133,  134,  135,  136,  137,    4,    5,    6,
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
			  117,  118,  119,  120,   -1,  122,  123,   -1,  125,  126,
			  127,   -1,  129,  130,  131,  132,  133,  134,  135,  136, yyDummy>>,
			1, 200, 3400)
		end

	yycheck_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  137,    6,   -1,    8,   -1,   10,   -1,   12,   13,   14,
			   15,   -1,   -1,   18,   19,   -1,   21,   -1,   -1,   24,
			   25,   -1,   -1,   -1,   29,   -1,   -1,   -1,   33,   -1,
			   -1,   -1,   37,   -1,   39,   40,   -1,   -1,   -1,   44,
			   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   55,   -1,   57,   58,   -1,   -1,   61,   -1,   63,   -1,
			   -1,   66,   67,   -1,   69,   70,   -1,   72,   73,   74,
			   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,   -1,

			  105,  106,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  116,  117,  118,   -1,  120,   -1,  122,   -1,   -1,
			   -1,    6,  127,    8,  129,   10,   -1,   12,   13,   14,
			   15,  136,  137,   18,   19,   -1,   21,   -1,   -1,   24,
			   25,   -1,   -1,   -1,   29,   -1,   -1,   -1,   33,   -1,
			   -1,   -1,   37,   -1,   39,   40,   -1,   -1,   -1,   44,
			   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   55,   -1,   57,   58,   -1,   -1,   61,   -1,   -1,   -1,
			   -1,   66,   67,   -1,   69,   70,   -1,   72,   73,   74,
			   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,   83,   84, yyDummy>>,
			1, 200, 3600)
		end

	yycheck_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,   -1,
			  105,  106,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  116,  117,  118,   -1,  120,   -1,  122,   -1,   -1,
			   -1,   -1,  127,  128,  129,   -1,   -1,   -1,   -1,   -1,
			   -1,  136,  137,    6,   -1,    8,   -1,   10,   -1,   12,
			   13,   14,   15,   -1,   -1,   18,   19,   -1,   21,   -1,
			   -1,   24,   25,   -1,   -1,   -1,   29,   -1,   -1,   -1,
			   33,   -1,   -1,   -1,   37,   -1,   39,   40,   -1,   -1,
			   -1,   44,   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,
			   -1,   -1,   -1,   66,   67,   -1,   69,   70,   -1,   72,
			   73,   74,   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,   -1,  105,  106,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  116,  117,  118,   -1,  120,   -1,  122,
			   -1,   -1,   -1,    6,  127,    8,  129,   10,   -1,   12,
			   13,   14,   15,  136,  137,   18,   19,   -1,   21,   -1,
			   -1,   24,   25,   -1,   -1,   -1,   29,   -1,   -1,   -1, yyDummy>>,
			1, 200, 3800)
		end

	yycheck_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   33,   -1,   -1,   -1,   37,   -1,   39,   40,   -1,   -1,
			   -1,   44,   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,
			   -1,   -1,   -1,   66,   67,   -1,   69,   70,   -1,   72,
			   73,   74,   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,   -1,  105,  106,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  116,  117,  118,   -1,  120,   -1,  122,
			   -1,   -1,   -1,    6,  127,    8,  129,   10,   -1,   12,

			   13,   14,   15,  136,   -1,   18,   19,   -1,   21,   -1,
			   -1,   24,   25,   -1,   -1,   -1,   29,   -1,   -1,   -1,
			   33,   -1,   -1,   -1,   37,   -1,   39,   40,   -1,   -1,
			   -1,   44,   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,
			   -1,   -1,   -1,   66,   67,   -1,   69,   70,   -1,   72,
			   73,   74,   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,   -1,  105,  106,   -1,   -1,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 4000)
		end

	yycheck_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,  116,  117,  118,   -1,  120,   -1,  122,
			   -1,   -1,   -1,    6,  127,    8,  129,   10,   -1,   12,
			   13,   14,   15,  136,   -1,   18,   19,   -1,   21,   -1,
			   -1,   24,   25,   -1,   -1,   -1,   29,   -1,   -1,   -1,
			   33,   -1,   -1,   -1,   37,   -1,   39,   40,   -1,   -1,
			   -1,   44,   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,
			   -1,   -1,   -1,   66,   67,   -1,   69,   70,   -1,   72,
			   73,   74,   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,

			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,   -1,  105,  106,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  116,  117,  118,   -1,  120,   -1,  122,
			   -1,   -1,   -1,    6,  127,    8,  129,   10,   -1,   12,
			   13,   14,   15,  136,   -1,   18,   19,   -1,   21,   -1,
			   -1,   24,   25,   -1,   -1,   -1,   29,   -1,   -1,   -1,
			   33,   -1,   -1,   -1,   37,   -1,   39,   40,   -1,   -1,
			   -1,   44,   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,
			   -1,   -1,   -1,   66,   67,   -1,   69,   70,   -1,   72, yyDummy>>,
			1, 200, 4200)
		end

	yycheck_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   73,   74,   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,   -1,  105,  106,   -1,   -1,   -1,   -1,   -1,    7,
			    8,   -1,   -1,  116,  117,  118,   14,  120,   -1,  122,
			   18,   -1,   -1,   21,  127,   -1,  129,   -1,   -1,   -1,
			   -1,   -1,   -1,  136,   -1,   33,   -1,   -1,   -1,   -1,
			   -1,   39,   -1,   41,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,   57,
			   58,   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,   67,

			   -1,   69,   70,   71,   72,   73,   74,   75,   -1,   -1,
			   -1,   79,   -1,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,  105,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,    7,    8,  116,  117,
			  118,  119,  120,   14,  122,   -1,   -1,   18,   -1,  127,
			   21,   -1,  130,  131,   -1,   -1,   -1,   -1,   -1,  137,
			   -1,   -1,   33,   -1,   -1,   -1,   -1,   -1,   39,   -1,
			   41,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,
			   -1,   -1,   -1,   -1,   55,   -1,   57,   58,   -1,   -1, yyDummy>>,
			1, 200, 4400)
		end

	yycheck_template_24 (an_array: ARRAY [INTEGER])
			-- Fill chunk #24 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   61,   -1,   -1,   -1,   -1,   66,   67,   -1,   69,   70,
			   71,   72,   73,   74,   75,   -1,   -1,   -1,   79,   -1,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,  105,   -1,   -1,   -1,   -1,   -1,
			    8,   -1,   -1,   -1,   -1,  116,  117,  118,  119,  120,
			   18,  122,   -1,   21,   -1,   -1,  127,   -1,   -1,  130,
			  131,   -1,   -1,   -1,   -1,   33,  137,   -1,   -1,   -1,
			   -1,   39,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,   57,

			   58,   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,   67,
			   -1,   69,   70,   71,   72,   73,   74,   75,   -1,   -1,
			   -1,   79,   -1,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,  105,   -1,   -1,
			   -1,   -1,    7,    8,   -1,   -1,   -1,   -1,  116,  117,
			  118,  119,  120,   18,  122,  123,   21,   -1,   -1,  127,
			   -1,   -1,  130,  131,   -1,   -1,   -1,   -1,   33,  137,
			  138,   -1,   -1,   -1,   39,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   50,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 4600)
		end

	yycheck_template_25 (an_array: ARRAY [INTEGER])
			-- Fill chunk #25 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   55,   -1,   57,   58,   -1,   -1,   61,   -1,   -1,   -1,
			   -1,   66,   67,   -1,   69,   70,   71,   72,   73,   74,
			   75,   -1,   -1,   -1,   79,   -1,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,
			  105,   -1,   -1,   -1,   -1,    7,    8,   -1,   -1,   -1,
			   -1,  116,  117,  118,  119,  120,   18,  122,   -1,   21,
			   -1,   -1,  127,   -1,   -1,  130,  131,   -1,   -1,   -1,
			   -1,   33,  137,   -1,   -1,   -1,   -1,   39,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,   -1,

			   -1,   -1,   -1,   55,   -1,   57,   58,   -1,   -1,   61,
			   -1,   -1,   -1,   -1,   66,   67,   -1,   69,   70,   71,
			   72,   73,   74,   75,   -1,   -1,   -1,   79,   -1,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,  104,  105,   -1,   -1,   -1,   -1,   -1,    8,
			   -1,   -1,   -1,   -1,  116,  117,  118,  119,  120,   18,
			  122,   -1,   21,   -1,   -1,  127,   -1,   -1,  130,  131,
			   -1,   -1,   -1,   -1,   33,  137,   -1,   -1,   -1,   -1,
			   39,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 4800)
		end

	yycheck_template_26 (an_array: ARRAY [INTEGER])
			-- Fill chunk #26 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,   57,   58,
			   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,   67,   -1,
			   69,   70,   71,   72,   73,   74,   75,   -1,   -1,   -1,
			   79,   -1,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  116,  117,  118,
			  119,  120,    6,  122,    8,   -1,   10,   -1,  127,   -1,
			   -1,  130,  131,   -1,   18,   19,   -1,   21,  137,  138,
			   24,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   33,

			   -1,   -1,   -1,   -1,   -1,   39,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,   -1,
			   -1,   -1,   66,   67,   -1,   69,   70,   -1,   72,   73,
			   74,   -1,   -1,   -1,   -1,   -1,   -1,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			   -1,  105,  106,   -1,   -1,   -1,   -1,   -1,   -1,    8,
			   -1,   -1,  116,  117,  118,   -1,  120,   -1,  122,   18,
			   -1,   -1,   21,  127,   -1,  129,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 5000)
		end

	yycheck_template_27 (an_array: ARRAY [INTEGER])
			-- Fill chunk #27 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,  136,   -1,   33,   -1,   -1,   -1,   -1,   -1,
			   39,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,   57,   58,
			   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,   67,   -1,
			   69,   70,   71,   72,   73,   74,   75,   -1,   -1,   -1,
			   79,   -1,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,   -1,   -1,   -1,
			   -1,   -1,    8,   -1,   -1,   -1,   -1,  116,  117,  118,
			  119,  120,   18,  122,   -1,   21,   -1,  126,  127,   -1,

			   -1,  130,  131,   -1,   -1,   -1,   -1,   33,  137,   -1,
			   -1,   -1,   -1,   39,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   50,   -1,   -1,   -1,   -1,   55,
			   -1,   57,   58,   -1,   -1,   61,   -1,   -1,   -1,   -1,
			   66,   67,   -1,   69,   70,   71,   72,   73,   74,   75,
			   -1,   -1,   -1,   79,   -1,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			   -1,   -1,   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,
			  116,  117,  118,  119,  120,   18,  122,   -1,   21,   -1, yyDummy>>,
			1, 200, 5200)
		end

	yycheck_template_28 (an_array: ARRAY [INTEGER])
			-- Fill chunk #28 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,  127,  128,   -1,  130,  131,   -1,   -1,   -1,   -1,
			   33,  137,   -1,   -1,   -1,   -1,   39,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,   -1,   -1,
			   -1,   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,
			   -1,   -1,   -1,   66,   67,   -1,   69,   70,   71,   72,
			   73,   74,   75,   -1,   -1,   -1,   79,   -1,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,  105,   -1,   -1,   -1,   -1,   -1,    8,   -1,
			   -1,   -1,   -1,  116,  117,  118,  119,  120,   18,  122,

			  123,   21,   -1,   -1,  127,   -1,   -1,  130,  131,   -1,
			   -1,   -1,   -1,   33,  137,   -1,   -1,   -1,   -1,   39,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   50,   -1,   -1,   -1,   -1,   55,   -1,   57,   58,   -1,
			   -1,   61,   62,   -1,   -1,   -1,   66,   67,   -1,   69,
			   70,   71,   72,   73,   74,   75,   -1,   -1,   -1,   79,
			   -1,   81,   82,   83,   84,   85,   86,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,  104,  105,   -1,   -1,   -1,   -1,
			   -1,    8,   -1,   -1,   -1,   -1,  116,  117,  118,  119, yyDummy>>,
			1, 200, 5400)
		end

	yycheck_template_29 (an_array: ARRAY [INTEGER])
			-- Fill chunk #29 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  120,   18,  122,   -1,   21,   -1,   -1,  127,   -1,   -1,
			  130,  131,   -1,   -1,   -1,   -1,   33,  137,   -1,   -1,
			   -1,   -1,   39,   -1,   41,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,
			   57,   58,   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,
			   67,   -1,   69,   70,   71,   72,   73,   74,   75,   -1,
			   -1,   -1,   79,   -1,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   92,   93,   94,   95,   96,
			   97,   98,   99,  100,  101,  102,  103,  104,  105,   -1,
			   -1,   -1,   -1,   -1,    8,   -1,   -1,   -1,   12,  116,

			  117,  118,  119,  120,   18,  122,   -1,   21,   -1,   -1,
			  127,   -1,   -1,  130,  131,   -1,   -1,   -1,   -1,   33,
			  137,   -1,   -1,   -1,   -1,   39,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   50,   -1,   -1,   -1,
			   -1,   55,   -1,   57,   58,   -1,   -1,   61,   -1,   -1,
			   -1,   -1,   66,   67,   -1,   69,   70,   71,   72,   73,
			   74,   75,   -1,   -1,   -1,   79,   -1,   81,   82,   83,
			   84,   85,   86,   87,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			  104,  105,   -1,   -1,   -1,   -1,   -1,    8,   -1,   -1, yyDummy>>,
			1, 200, 5600)
		end

	yycheck_template_30 (an_array: ARRAY [INTEGER])
			-- Fill chunk #30 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,  116,  117,  118,  119,  120,   18,  122,   -1,
			   21,   -1,   -1,  127,   -1,   -1,  130,  131,   -1,   -1,
			   -1,   -1,   33,  137,   -1,   -1,   -1,   -1,   39,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,
			   -1,   -1,   -1,   -1,   55,   -1,   57,   58,   -1,   -1,
			   61,   -1,   -1,   -1,   -1,   66,   67,   -1,   69,   70,
			   71,   72,   73,   74,   75,   -1,   -1,   -1,   79,   -1,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,  105,   -1,   -1,   -1,   -1,   -1,

			    8,   -1,   -1,   -1,   -1,  116,  117,  118,  119,  120,
			   18,  122,   -1,   21,   -1,  126,  127,   -1,   -1,  130,
			  131,   -1,   -1,   -1,   -1,   33,  137,   -1,   -1,   -1,
			   -1,   39,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   50,   -1,   -1,   -1,   -1,   55,   -1,   57,
			   58,   -1,   -1,   61,   -1,   -1,   -1,   -1,   66,   67,
			   -1,   69,   70,   71,   72,   73,   74,   75,   -1,   -1,
			   -1,   79,   -1,   81,   82,   83,   84,   85,   86,   87,
			   88,   89,   90,   91,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,  105,   -1,   -1, yyDummy>>,
			1, 200, 5800)
		end

	yycheck_template_31 (an_array: ARRAY [INTEGER])
			-- Fill chunk #31 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,    8,   -1,   -1,   -1,   -1,  116,  117,
			  118,  119,  120,   18,  122,   -1,   21,   -1,   -1,  127,
			   -1,   -1,  130,  131,   -1,   -1,   -1,   -1,   33,  137,
			   -1,   -1,   -1,   -1,   39,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   12,   -1,   14,   50,   -1,   -1,   -1,   -1,
			   55,   -1,   57,   58,   -1,   -1,   61,   -1,   -1,   -1,
			   -1,   66,   67,   -1,   69,   70,   71,   72,   73,   74,
			   75,   -1,   -1,   -1,   79,   -1,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,

			  105,   71,   -1,   -1,   -1,   -1,   76,   77,   78,   14,
			   80,  116,  117,  118,  119,  120,   -1,  122,   -1,   14,
			   -1,   -1,  127,   -1,   -1,  130,  131,   -1,   -1,   -1,
			   -1,   -1,  137,   -1,   -1,   -1,   -1,  107,  108,  109,
			  110,  111,  112,  113,  114,  115,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			  130,  131,  132,  133,  134,  135,   71,   -1,   -1,   -1,
			   -1,   76,   77,   78,   -1,   80,   71,   -1,   -1,   -1,
			   -1,   76,   77,   78,   -1,   80,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 6000)
		end

	yycheck_template_32 (an_array: ARRAY [INTEGER])
			-- Fill chunk #32 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,  107,  108,  109,  110,  111,  112,  113,  114,
			  115,   -1,  107,  108,  109,  110,  111,  112,  113,  114,
			  115,   -1,   -1,   -1,   -1,  130,  131,  132,  133,  134,
			  135,   -1,   -1,   -1,   -1,  130,  131,  132,  133,  134,
			  135,   11,   -1,   -1,   14,   -1,   16,   17,   -1,   -1,
			   20,   -1,   22,   -1,   -1,   -1,   26,   -1,   28,   -1,
			   30,   31,   32,   22,   34,   -1,   36,   -1,   38,   -1,
			   -1,   30,   42,   -1,   -1,   -1,   46,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   43,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   72,   73,   74,   -1,   -1,   66,   67,   -1,
			   69,   -1,   -1,   -1,   -1,   29,   75,   -1,   -1,   -1,
			   -1,   -1,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,   -1,   -1,   -1,   -1,
			   -1,   -1,  122,   -1,  124,  125,   -1,   71,  117,  118,
			   -1,  120,   76,   77,   78,   -1,   80,   -1,   -1,   -1,
			   -1,  130,  131,   41,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  107,  108,  109,  110,  111,  112,  113, yyDummy>>,
			1, 200, 6200)
		end

	yycheck_template_33 (an_array: ARRAY [INTEGER])
			-- Fill chunk #33 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  114,  115,   -1,   71,   -1,   -1,   -1,   -1,   76,   77,
			   78,   -1,   80,   -1,   -1,   -1,  130,  131,  132,  133,
			  134,  135,   41,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  107,
			  108,  109,  110,  111,  112,  113,  114,  115,   -1,   -1,
			   -1,   -1,   71,   -1,   -1,   -1,   -1,   76,   77,   78,
			   -1,   80,  130,  131,  132,  133,  134,  135,   -1,   -1,
			   -1,   45,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  107,  108,
			  109,  110,  111,  112,  113,  114,  115,   71,   -1,   -1,

			   -1,   -1,   76,   77,   78,   -1,   80,   -1,   -1,   -1,
			   -1,  130,  131,  132,  133,  134,  135,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  107,  108,  109,  110,  111,  112,  113,
			  114,  115,   43,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  130,  131,  132,  133,
			  134,  135,   -1,   -1,   -1,   66,   67,   -1,   69,   -1,
			   -1,   -1,   -1,   -1,   75,   -1,   -1,   -1,   -1,   -1,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100, yyDummy>>,
			1, 200, 6400)
		end

	yycheck_template_34 (an_array: ARRAY [INTEGER])
			-- Fill chunk #34 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  101,  102,  103,  104,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   61,   -1,   -1,   -1,  117,  118,   -1,  120,
			   69,   -1,   -1,   -1,   -1,   -1,   75,   -1,   -1,  130,
			  131,   -1,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,   62,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   71,   -1,   -1,  117,  118,
			   76,   77,   78,   -1,   80,   -1,   -1,   -1,   -1,  128,
			   -1,  130,  131,   -1,   -1,   -1,   -1,   -1,   -1,  138,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,  107,  108,  109,  110,  111,  112,  113,  114,  115,
			   61,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   69,  125,
			   -1,   -1,   -1,   -1,  130,  131,  132,  133,  134,  135,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,   71,   -1,   -1,   -1,   -1,   76,   77,
			   78,   -1,   80,   71,   -1,   -1,  117,  118,   76,   77,
			   78,   -1,   80,   -1,   -1,   -1,   -1,  128,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  107,
			  108,  109,  110,  111,  112,  113,  114,  115,   -1,  107, yyDummy>>,
			1, 200, 6600)
		end

	yycheck_template_35 (an_array: ARRAY [INTEGER])
			-- Fill chunk #35 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  108,  109,  110,  111,  112,  113,  114,  115,   -1,   -1,
			   -1,   -1,  130,  131,  132,  133,  134,  135,  136,   -1,
			   -1,   -1,  130,  131,  132,  133,  134,  135,  136,   71,
			   -1,   -1,   -1,   -1,   76,   77,   78,   -1,   80,   -1,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,   -1,   -1,  107,  108,  109,  110,  111,
			  112,  113,  114,  115,   -1,   -1,   -1,  118,   -1,  120,
			   71,   -1,   -1,  125,  126,   76,   77,   78,  130,  131,
			  132,  133,  134,  135,   71,   -1,   -1,   -1,   -1,   76,

			   77,   78,   -1,   80,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  107,  108,  109,  110,
			  111,  112,  113,  114,  115,   -1,   -1,   -1,   -1,   -1,
			  107,  108,  109,  110,  111,  112,  113,  114,  115,  130,
			  131,  132,  133,  134,  135,   -1,  123,   -1,  125,   -1,
			   -1,   -1,   -1,  130,  131,  132,  133,  134,  135,   71,
			   -1,   -1,   -1,   -1,   76,   77,   78,   -1,   80,   -1,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,   92,   93,   94,   95,   96,   97,   98,   99,  100,
			  101,  102,  103,   -1,   -1,  107,  108,  109,  110,  111, yyDummy>>,
			1, 200, 6800)
		end

	yycheck_template_36 (an_array: ARRAY [INTEGER])
			-- Fill chunk #36 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  112,  113,  114,  115,   -1,   -1,   -1,  118,   -1,   -1,
			   -1,   -1,   -1,  125,  126,   -1,   -1,   -1,  130,  131,
			  132,  133,  134,  135,   71,   -1,   -1,   -1,   -1,   76,
			   77,   78,   -1,   80,   -1,   81,   82,   83,   84,   85,
			   86,   87,   88,   89,   90,   91,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,   -1,   -1,
			  107,  108,  109,  110,  111,  112,  113,  114,  115,   -1,
			   -1,   -1,   71,   -1,   -1,   -1,  123,   76,   77,   78,
			   -1,   80,   -1,  130,  131,  132,  133,  134,  135,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  107,  108,
			  109,  110,  111,  112,  113,  114,  115,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  130,  131,  132,  133,  134,  135,   69,   -1,   -1,
			   -1,   -1,   -1,   75,   -1,   -1,   -1,   -1,   -1,   81,
			   82,   83,   84,   85,   86,   87,   88,   89,   90,   91,
			   92,   93,   94,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,  104,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			    7,   -1,   -1,   -1,   11,  117,  118,   14,   -1,   -1,
			   17,   -1,   -1,   20,   -1,   -1,   -1,   -1,  130,  131, yyDummy>>,
			1, 200, 7000)
		end

	yycheck_template_37 (an_array: ARRAY [INTEGER])
			-- Fill chunk #37 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   28,   -1,   -1,   31,   32,   -1,   -1,   -1,   36,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   46,
			   47,   -1,   49,   -1,   -1,   52, 1223, 1224, 1225, 1226,
			 1227, 1228, 1229, 1230, 1231, 1232, 1233, 1234, 1235, 1236,
			 1237, 1238, 1239, 1240, 1241, 1242, 1243, 1244, yyDummy>>,
			1, 48, 7200)
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

	yyNtbase: INTEGER = 139
			-- Number of tokens

	yyLast: INTEGER = 7247
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 371
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 443
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Access

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

end
