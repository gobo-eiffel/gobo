indexing

	description:

		"Eiffel parsers"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EIFFEL_PARSER

inherit

	ET_EIFFEL_PARSER_SKELETON

	ET_EIFFEL_SCANNER
		rename
			make as make_eiffel_scanner
		end

creation

	make


feature {NONE} -- Implementation

	yy_build_parser_tables is
			-- Build parser tables.
		do
			yytranslate ?= yytranslate_template
			yyr1 ?= yyr1_template
			yyr2 ?= yyr2_template
			yydefact ?= yydefact_template
			yydefgoto ?= yydefgoto_template
			yypact ?= yypact_template
			yypgoto ?= yypgoto_template
			yytable ?= yytable_template
			yycheck ?= yycheck_template
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
			else
					-- No action
				yyval := yyval_default
			end
		end

	yy_do_action_1_200 (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			inspect yy_act
when 23 then
--|#line 173
	yy_do_action_23
when 24 then
--|#line 175
	yy_do_action_24
when 25 then
--|#line 177
	yy_do_action_25
when 26 then
--|#line 179
	yy_do_action_26
when 35 then
--|#line 202
	yy_do_action_35
when 37 then
--|#line 209
	yy_do_action_37
when 38 then
--|#line 213
	yy_do_action_38
when 39 then
--|#line 217
	yy_do_action_39
when 40 then
--|#line 221
	yy_do_action_40
when 41 then
--|#line 224
	yy_do_action_41
when 42 then
--|#line 227
	yy_do_action_42
when 43 then
--|#line 230
	yy_do_action_43
when 44 then
--|#line 233
	yy_do_action_44
when 45 then
--|#line 236
	yy_do_action_45
when 46 then
--|#line 239
	yy_do_action_46
when 47 then
--|#line 243
	yy_do_action_47
when 48 then
--|#line 247
	yy_do_action_48
when 49 then
--|#line 250
	yy_do_action_49
when 50 then
--|#line 253
	yy_do_action_50
when 51 then
--|#line 256
	yy_do_action_51
when 52 then
--|#line 259
	yy_do_action_52
when 58 then
--|#line 284
	yy_do_action_58
when 59 then
--|#line 288
	yy_do_action_59
when 60 then
--|#line 294
	yy_do_action_60
when 61 then
--|#line 302
	yy_do_action_61
when 75 then
--|#line 336
	yy_do_action_75
when 76 then
--|#line 342
	yy_do_action_76
when 77 then
--|#line 350
	yy_do_action_77
when 78 then
--|#line 359
	yy_do_action_78
when 79 then
--|#line 361
	yy_do_action_79
when 80 then
--|#line 365
	yy_do_action_80
when 81 then
--|#line 367
	yy_do_action_81
when 82 then
--|#line 371
	yy_do_action_82
when 83 then
--|#line 373
	yy_do_action_83
when 84 then
--|#line 375
	yy_do_action_84
when 85 then
--|#line 377
	yy_do_action_85
when 87 then
--|#line 385
	yy_do_action_87
when 89 then
--|#line 391
	yy_do_action_89
when 91 then
--|#line 397
	yy_do_action_91
when 93 then
--|#line 403
	yy_do_action_93
when 95 then
--|#line 409
	yy_do_action_95
when 97 then
--|#line 415
	yy_do_action_97
when 118 then
--|#line 467
	yy_do_action_118
when 119 then
--|#line 469
	yy_do_action_119
when 120 then
--|#line 471
	yy_do_action_120
when 121 then
--|#line 473
	yy_do_action_121
when 124 then
--|#line 481
	yy_do_action_124
when 125 then
--|#line 483
	yy_do_action_125
when 126 then
--|#line 485
	yy_do_action_126
when 127 then
--|#line 487
	yy_do_action_127
when 128 then
--|#line 489
	yy_do_action_128
when 129 then
--|#line 491
	yy_do_action_129
when 130 then
--|#line 493
	yy_do_action_130
when 131 then
--|#line 495
	yy_do_action_131
when 132 then
--|#line 497
	yy_do_action_132
when 133 then
--|#line 499
	yy_do_action_133
when 134 then
--|#line 501
	yy_do_action_134
when 135 then
--|#line 505
	yy_do_action_135
when 136 then
--|#line 509
	yy_do_action_136
when 137 then
--|#line 513
	yy_do_action_137
when 138 then
--|#line 517
	yy_do_action_138
when 139 then
--|#line 523
	yy_do_action_139
when 140 then
--|#line 529
	yy_do_action_140
when 141 then
--|#line 534
	yy_do_action_141
when 142 then
--|#line 540
	yy_do_action_142
when 143 then
--|#line 546
	yy_do_action_143
when 144 then
--|#line 552
	yy_do_action_144
when 145 then
--|#line 557
	yy_do_action_145
when 147 then
--|#line 565
	yy_do_action_147
when 148 then
--|#line 571
	yy_do_action_148
when 149 then
--|#line 573
	yy_do_action_149
when 150 then
--|#line 575
	yy_do_action_150
when 151 then
--|#line 577
	yy_do_action_151
when 152 then
--|#line 579
	yy_do_action_152
when 153 then
--|#line 581
	yy_do_action_153
when 154 then
--|#line 583
	yy_do_action_154
when 155 then
--|#line 585
	yy_do_action_155
when 156 then
--|#line 587
	yy_do_action_156
when 157 then
--|#line 589
	yy_do_action_157
when 158 then
--|#line 591
	yy_do_action_158
when 159 then
--|#line 593
	yy_do_action_159
when 160 then
--|#line 595
	yy_do_action_160
when 161 then
--|#line 597
	yy_do_action_161
when 162 then
--|#line 599
	yy_do_action_162
when 163 then
--|#line 601
	yy_do_action_163
when 164 then
--|#line 603
	yy_do_action_164
when 165 then
--|#line 605
	yy_do_action_165
when 166 then
--|#line 607
	yy_do_action_166
when 167 then
--|#line 609
	yy_do_action_167
when 168 then
--|#line 611
	yy_do_action_168
when 169 then
--|#line 613
	yy_do_action_169
when 170 then
--|#line 615
	yy_do_action_170
when 171 then
--|#line 618
	yy_do_action_171
when 172 then
--|#line 620
	yy_do_action_172
when 173 then
--|#line 622
	yy_do_action_173
when 174 then
--|#line 624
	yy_do_action_174
when 175 then
--|#line 626
	yy_do_action_175
when 176 then
--|#line 628
	yy_do_action_176
when 177 then
--|#line 630
	yy_do_action_177
when 178 then
--|#line 632
	yy_do_action_178
when 179 then
--|#line 634
	yy_do_action_179
when 180 then
--|#line 636
	yy_do_action_180
when 181 then
--|#line 638
	yy_do_action_181
when 182 then
--|#line 640
	yy_do_action_182
when 183 then
--|#line 642
	yy_do_action_183
when 184 then
--|#line 644
	yy_do_action_184
when 185 then
--|#line 646
	yy_do_action_185
when 186 then
--|#line 648
	yy_do_action_186
when 187 then
--|#line 650
	yy_do_action_187
when 188 then
--|#line 652
	yy_do_action_188
when 191 then
--|#line 662
	yy_do_action_191
when 192 then
--|#line 666
	yy_do_action_192
when 193 then
--|#line 668
	yy_do_action_193
when 194 then
--|#line 670
	yy_do_action_194
when 195 then
--|#line 672
	yy_do_action_195
when 196 then
--|#line 674
	yy_do_action_196
when 197 then
--|#line 676
	yy_do_action_197
when 200 then
--|#line 686
	yy_do_action_200
			else
					-- No action
				yyval := yyval_default
			end
		end

	yy_do_action_201_400 (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			inspect yy_act
when 201 then
--|#line 690
	yy_do_action_201
when 202 then
--|#line 692
	yy_do_action_202
when 203 then
--|#line 694
	yy_do_action_203
when 204 then
--|#line 696
	yy_do_action_204
when 205 then
--|#line 698
	yy_do_action_205
when 206 then
--|#line 700
	yy_do_action_206
when 208 then
--|#line 708
	yy_do_action_208
when 209 then
--|#line 710
	yy_do_action_209
when 210 then
--|#line 712
	yy_do_action_210
when 211 then
--|#line 714
	yy_do_action_211
when 213 then
--|#line 720
	yy_do_action_213
when 214 then
--|#line 722
	yy_do_action_214
when 215 then
--|#line 724
	yy_do_action_215
when 216 then
--|#line 726
	yy_do_action_216
when 219 then
--|#line 734
	yy_do_action_219
when 220 then
--|#line 738
	yy_do_action_220
when 221 then
--|#line 740
	yy_do_action_221
when 222 then
--|#line 742
	yy_do_action_222
when 223 then
--|#line 744
	yy_do_action_223
when 224 then
--|#line 748
	yy_do_action_224
when 225 then
--|#line 750
	yy_do_action_225
when 226 then
--|#line 752
	yy_do_action_226
when 227 then
--|#line 754
	yy_do_action_227
when 228 then
--|#line 758
	yy_do_action_228
when 229 then
--|#line 760
	yy_do_action_229
when 230 then
--|#line 762
	yy_do_action_230
when 231 then
--|#line 764
	yy_do_action_231
when 232 then
--|#line 768
	yy_do_action_232
when 233 then
--|#line 773
	yy_do_action_233
when 235 then
--|#line 782
	yy_do_action_235
when 236 then
--|#line 788
	yy_do_action_236
when 237 then
--|#line 790
	yy_do_action_237
when 238 then
--|#line 792
	yy_do_action_238
when 239 then
--|#line 794
	yy_do_action_239
when 240 then
--|#line 796
	yy_do_action_240
when 241 then
--|#line 798
	yy_do_action_241
when 242 then
--|#line 800
	yy_do_action_242
when 251 then
--|#line 823
	yy_do_action_251
when 252 then
--|#line 827
	yy_do_action_252
when 253 then
--|#line 829
	yy_do_action_253
when 254 then
--|#line 833
	yy_do_action_254
when 255 then
--|#line 835
	yy_do_action_255
when 256 then
--|#line 837
	yy_do_action_256
when 257 then
--|#line 839
	yy_do_action_257
when 258 then
--|#line 841
	yy_do_action_258
when 259 then
--|#line 843
	yy_do_action_259
when 260 then
--|#line 845
	yy_do_action_260
when 261 then
--|#line 847
	yy_do_action_261
when 262 then
--|#line 849
	yy_do_action_262
when 263 then
--|#line 851
	yy_do_action_263
when 264 then
--|#line 853
	yy_do_action_264
when 269 then
--|#line 867
	yy_do_action_269
when 270 then
--|#line 869
	yy_do_action_270
when 276 then
--|#line 886
	yy_do_action_276
when 277 then
--|#line 890
	yy_do_action_277
when 278 then
--|#line 896
	yy_do_action_278
when 279 then
--|#line 898
	yy_do_action_279
when 280 then
--|#line 902
	yy_do_action_280
when 281 then
--|#line 906
	yy_do_action_281
when 282 then
--|#line 908
	yy_do_action_282
when 283 then
--|#line 914
	yy_do_action_283
when 284 then
--|#line 916
	yy_do_action_284
when 297 then
--|#line 947
	yy_do_action_297
when 302 then
--|#line 960
	yy_do_action_302
when 308 then
--|#line 975
	yy_do_action_308
when 309 then
--|#line 977
	yy_do_action_309
when 310 then
--|#line 983
	yy_do_action_310
when 311 then
--|#line 985
	yy_do_action_311
when 312 then
--|#line 987
	yy_do_action_312
when 313 then
--|#line 989
	yy_do_action_313
when 314 then
--|#line 993
	yy_do_action_314
when 315 then
--|#line 995
	yy_do_action_315
when 316 then
--|#line 997
	yy_do_action_316
when 317 then
--|#line 999
	yy_do_action_317
when 318 then
--|#line 1003
	yy_do_action_318
when 319 then
--|#line 1005
	yy_do_action_319
when 320 then
--|#line 1007
	yy_do_action_320
when 321 then
--|#line 1009
	yy_do_action_321
when 322 then
--|#line 1011
	yy_do_action_322
when 323 then
--|#line 1013
	yy_do_action_323
when 324 then
--|#line 1015
	yy_do_action_324
when 327 then
--|#line 1025
	yy_do_action_327
when 328 then
--|#line 1029
	yy_do_action_328
when 329 then
--|#line 1031
	yy_do_action_329
when 330 then
--|#line 1035
	yy_do_action_330
when 331 then
--|#line 1037
	yy_do_action_331
when 332 then
--|#line 1039
	yy_do_action_332
when 333 then
--|#line 1044
	yy_do_action_333
when 334 then
--|#line 1048
	yy_do_action_334
when 335 then
--|#line 1050
	yy_do_action_335
when 336 then
--|#line 1056
	yy_do_action_336
when 337 then
--|#line 1058
	yy_do_action_337
when 338 then
--|#line 1060
	yy_do_action_338
when 339 then
--|#line 1062
	yy_do_action_339
when 340 then
--|#line 1064
	yy_do_action_340
when 341 then
--|#line 1066
	yy_do_action_341
when 342 then
--|#line 1068
	yy_do_action_342
when 343 then
--|#line 1070
	yy_do_action_343
when 344 then
--|#line 1072
	yy_do_action_344
when 345 then
--|#line 1074
	yy_do_action_345
when 346 then
--|#line 1076
	yy_do_action_346
when 347 then
--|#line 1078
	yy_do_action_347
when 348 then
--|#line 1080
	yy_do_action_348
when 349 then
--|#line 1082
	yy_do_action_349
when 350 then
--|#line 1084
	yy_do_action_350
when 351 then
--|#line 1086
	yy_do_action_351
when 352 then
--|#line 1088
	yy_do_action_352
when 353 then
--|#line 1090
	yy_do_action_353
when 354 then
--|#line 1092
	yy_do_action_354
when 355 then
--|#line 1094
	yy_do_action_355
when 356 then
--|#line 1096
	yy_do_action_356
when 357 then
--|#line 1098
	yy_do_action_357
when 358 then
--|#line 1100
	yy_do_action_358
when 359 then
--|#line 1102
	yy_do_action_359
when 360 then
--|#line 1104
	yy_do_action_360
when 361 then
--|#line 1106
	yy_do_action_361
when 362 then
--|#line 1108
	yy_do_action_362
when 363 then
--|#line 1110
	yy_do_action_363
when 364 then
--|#line 1112
	yy_do_action_364
when 365 then
--|#line 1114
	yy_do_action_365
when 366 then
--|#line 1116
	yy_do_action_366
when 367 then
--|#line 1118
	yy_do_action_367
when 368 then
--|#line 1120
	yy_do_action_368
when 369 then
--|#line 1122
	yy_do_action_369
when 370 then
--|#line 1124
	yy_do_action_370
when 371 then
--|#line 1126
	yy_do_action_371
when 372 then
--|#line 1128
	yy_do_action_372
when 373 then
--|#line 1130
	yy_do_action_373
when 374 then
--|#line 1132
	yy_do_action_374
when 387 then
--|#line 1154
	yy_do_action_387
when 388 then
--|#line 1156
	yy_do_action_388
when 389 then
--|#line 1158
	yy_do_action_389
when 390 then
--|#line 1160
	yy_do_action_390
when 391 then
--|#line 1162
	yy_do_action_391
when 392 then
--|#line 1164
	yy_do_action_392
when 393 then
--|#line 1166
	yy_do_action_393
when 394 then
--|#line 1168
	yy_do_action_394
when 395 then
--|#line 1170
	yy_do_action_395
when 396 then
--|#line 1172
	yy_do_action_396
when 397 then
--|#line 1174
	yy_do_action_397
when 398 then
--|#line 1176
	yy_do_action_398
when 399 then
--|#line 1178
	yy_do_action_399
when 400 then
--|#line 1180
	yy_do_action_400
			else
					-- No action
				yyval := yyval_default
			end
		end

	yy_do_action_401_600 (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			inspect yy_act
when 401 then
--|#line 1182
	yy_do_action_401
when 402 then
--|#line 1184
	yy_do_action_402
when 403 then
--|#line 1186
	yy_do_action_403
when 404 then
--|#line 1188
	yy_do_action_404
when 405 then
--|#line 1190
	yy_do_action_405
when 406 then
--|#line 1192
	yy_do_action_406
when 407 then
--|#line 1194
	yy_do_action_407
when 408 then
--|#line 1198
	yy_do_action_408
when 409 then
--|#line 1200
	yy_do_action_409
when 410 then
--|#line 1204
	yy_do_action_410
when 411 then
--|#line 1206
	yy_do_action_411
when 412 then
--|#line 1210
	yy_do_action_412
when 413 then
--|#line 1212
	yy_do_action_413
when 414 then
--|#line 1214
	yy_do_action_414
when 415 then
--|#line 1218
	yy_do_action_415
when 416 then
--|#line 1220
	yy_do_action_416
when 417 then
--|#line 1222
	yy_do_action_417
when 418 then
--|#line 1226
	yy_do_action_418
when 419 then
--|#line 1228
	yy_do_action_419
			else
					-- No action
				yyval := yyval_default
			end
		end

	yy_do_action_23 is
			--|#line 173
		local

		do
			yyval := yyval_default;
last_class := new_class (yytype5 (yyvs.item (yyvsp))) 

		end

	yy_do_action_24 is
			--|#line 175
		local

		do
			yyval := yyval_default;
last_class := new_deferred_class (yytype5 (yyvs.item (yyvsp))) 

		end

	yy_do_action_25 is
			--|#line 177
		local

		do
			yyval := yyval_default;
last_class := new_class (yytype5 (yyvs.item (yyvsp))) 

		end

	yy_do_action_26 is
			--|#line 179
		local

		do
			yyval := yyval_default;
last_class := new_class (yytype5 (yyvs.item (yyvsp))) 

		end

	yy_do_action_35 is
			--|#line 202
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_37 is
			--|#line 209
		local

		do
			yyval := yyval_default;
last_class.set_parents (yytype22 (yyvs.item (yyvsp))) 

		end

	yy_do_action_38 is
			--|#line 213
		local
			yyval22: ET_PARENTS
		do

yyval22 := new_parents (new_parent (yytype5 (yyvs.item (yyvsp - 10)), yyvs.item (yyvsp - 9), yytype30 (yyvs.item (yyvsp - 8)), yytype28 (yyvs.item (yyvsp - 7)), yytype29 (yyvs.item (yyvsp - 6)), yytype29 (yyvs.item (yyvsp - 5)), yytype29 (yyvs.item (yyvsp - 4)))) 
			yyval := yyval22
		end

	yy_do_action_39 is
			--|#line 217
		local
			yyval22: ET_PARENTS
		do

yyval22 := new_parents (new_parent (yytype5 (yyvs.item (yyvsp - 9)), yyvs.item (yyvsp - 8), Void, yytype28 (yyvs.item (yyvsp - 7)), yytype29 (yyvs.item (yyvsp - 6)), yytype29 (yyvs.item (yyvsp - 5)), yytype29 (yyvs.item (yyvsp - 4)))) 
			yyval := yyval22
		end

	yy_do_action_40 is
			--|#line 221
		local
			yyval22: ET_PARENTS
		do

yyval22 := new_parents (new_parent (yytype5 (yyvs.item (yyvsp - 8)), yyvs.item (yyvsp - 7), Void, Void, yytype29 (yyvs.item (yyvsp - 6)), yytype29 (yyvs.item (yyvsp - 5)), yytype29 (yyvs.item (yyvsp - 4)))) 
			yyval := yyval22
		end

	yy_do_action_41 is
			--|#line 224
		local
			yyval22: ET_PARENTS
		do

yyval22 := new_parents (new_parent (yytype5 (yyvs.item (yyvsp - 7)), yyvs.item (yyvsp - 6), Void, Void, Void, yytype29 (yyvs.item (yyvsp - 5)), yytype29 (yyvs.item (yyvsp - 4)))) 
			yyval := yyval22
		end

	yy_do_action_42 is
			--|#line 227
		local
			yyval22: ET_PARENTS
		do

yyval22 := new_parents (new_parent (yytype5 (yyvs.item (yyvsp - 6)), yyvs.item (yyvsp - 5), Void, Void, Void, Void, yytype29 (yyvs.item (yyvsp - 4)))) 
			yyval := yyval22
		end

	yy_do_action_43 is
			--|#line 230
		local
			yyval22: ET_PARENTS
		do

yyval22 := new_parents (new_parent (yytype5 (yyvs.item (yyvsp - 5)), yyvs.item (yyvsp - 4), Void, Void, Void, Void, Void)) 
			yyval := yyval22
		end

	yy_do_action_44 is
			--|#line 233
		local
			yyval22: ET_PARENTS
		do

yyval22 := new_parents (new_parent (yytype5 (yyvs.item (yyvsp - 4)), yyvs.item (yyvsp - 3), Void, Void, Void, Void, Void)) 
			yyval := yyval22
		end

	yy_do_action_45 is
			--|#line 236
		local
			yyval22: ET_PARENTS
		do

yyval22 := new_parents (new_parent (yytype5 (yyvs.item (yyvsp - 2)), yyvs.item (yyvsp - 1), Void, Void, Void, Void, Void)) 
			yyval := yyval22
		end

	yy_do_action_46 is
			--|#line 239
		local
			yyval22: ET_PARENTS
		do

yyval22 := yytype22 (yyvs.item (yyvsp)); yyval22.put_first (new_parent (yytype5 (yyvs.item (yyvsp - 9)), yyvs.item (yyvsp - 8), yytype30 (yyvs.item (yyvsp - 7)), yytype28 (yyvs.item (yyvsp - 6)), yytype29 (yyvs.item (yyvsp - 5)), yytype29 (yyvs.item (yyvsp - 4)), yytype29 (yyvs.item (yyvsp - 3)))) 
			yyval := yyval22
		end

	yy_do_action_47 is
			--|#line 243
		local
			yyval22: ET_PARENTS
		do

yyval22 := yytype22 (yyvs.item (yyvsp)); yyval22.put_first (new_parent (yytype5 (yyvs.item (yyvsp - 8)), yyvs.item (yyvsp - 7), Void, yytype28 (yyvs.item (yyvsp - 6)), yytype29 (yyvs.item (yyvsp - 5)), yytype29 (yyvs.item (yyvsp - 4)), yytype29 (yyvs.item (yyvsp - 3)))) 
			yyval := yyval22
		end

	yy_do_action_48 is
			--|#line 247
		local
			yyval22: ET_PARENTS
		do

yyval22 := yytype22 (yyvs.item (yyvsp)); yyval22.put_first (new_parent (yytype5 (yyvs.item (yyvsp - 7)), yyvs.item (yyvsp - 6), Void, Void, yytype29 (yyvs.item (yyvsp - 5)), yytype29 (yyvs.item (yyvsp - 4)), yytype29 (yyvs.item (yyvsp - 3)))) 
			yyval := yyval22
		end

	yy_do_action_49 is
			--|#line 250
		local
			yyval22: ET_PARENTS
		do

yyval22 := yytype22 (yyvs.item (yyvsp)); yyval22.put_first (new_parent (yytype5 (yyvs.item (yyvsp - 6)), yyvs.item (yyvsp - 5), Void, Void, Void, yytype29 (yyvs.item (yyvsp - 4)), yytype29 (yyvs.item (yyvsp - 3)))) 
			yyval := yyval22
		end

	yy_do_action_50 is
			--|#line 253
		local
			yyval22: ET_PARENTS
		do

yyval22 := yytype22 (yyvs.item (yyvsp)); yyval22.put_first (new_parent (yytype5 (yyvs.item (yyvsp - 5)), yyvs.item (yyvsp - 4), Void, Void, Void, Void, yytype29 (yyvs.item (yyvsp - 3)))) 
			yyval := yyval22
		end

	yy_do_action_51 is
			--|#line 256
		local
			yyval22: ET_PARENTS
		do

yyval22 := yytype22 (yyvs.item (yyvsp)); yyval22.put_first (new_parent (yytype5 (yyvs.item (yyvsp - 4)), yyvs.item (yyvsp - 3), Void, Void, Void, Void, Void)) 
			yyval := yyval22
		end

	yy_do_action_52 is
			--|#line 259
		local
			yyval22: ET_PARENTS
		do

yyval22 := yytype22 (yyvs.item (yyvsp)); yyval22.put_first (new_parent (yytype5 (yyvs.item (yyvsp - 3)), yyvs.item (yyvsp - 2), Void, Void, Void, Void, Void)) 
			yyval := yyval22
		end

	yy_do_action_58 is
			--|#line 284
		local
			yyval30: like new_rename_list
		do

yyval30 := yytype30 (yyvs.item (yyvsp)) 
			yyval := yyval30
		end

	yy_do_action_59 is
			--|#line 288
		local
			yyval30: like new_rename_list
		do

			yyval30 := new_rename_list (rename_list_count)
			rename_list_count := rename_list_count - 1
			yyval30.put (yytype25 (yyvs.item (yyvsp)), rename_list_count)
		
			yyval := yyval30
		end

	yy_do_action_60 is
			--|#line 294
		local
			yyval30: like new_rename_list
		do

			yyval30 := yytype30 (yyvs.item (yyvsp))
			rename_list_count := rename_list_count - 1
			yyval30.put (yytype25 (yyvs.item (yyvsp - 2)), rename_list_count)
		
			yyval := yyval30
		end

	yy_do_action_61 is
			--|#line 302
		local
			yyval25: ET_RENAME
		do

			yyval25 := new_rename (yytype17 (yyvs.item (yyvsp - 2)), yytype17 (yyvs.item (yyvsp)))
			rename_list_count := rename_list_count + 1
		
			yyval := yyval25
		end

	yy_do_action_75 is
			--|#line 336
		local
			yyval29: like new_feature_list
		do

			yyval29 := new_feature_list (feature_list_count)
			feature_list_count := feature_list_count - 1
			yyval29.put (yytype17 (yyvs.item (yyvsp)), feature_list_count)
		
			yyval := yyval29
		end

	yy_do_action_76 is
			--|#line 342
		local
			yyval29: like new_feature_list
		do

			yyval29 := yytype29 (yyvs.item (yyvsp))
			feature_list_count := feature_list_count - 1
			yyval29.put (yytype17 (yyvs.item (yyvsp - 2)), feature_list_count)
		
			yyval := yyval29
		end

	yy_do_action_77 is
			--|#line 350
		local
			yyval17: ET_FEATURE_NAME
		do

			yyval17 := yytype17 (yyvs.item (yyvsp))
			feature_list_count := feature_list_count + 1
		
			yyval := yyval17
		end

	yy_do_action_78 is
			--|#line 359
		local
			yyval13: ET_CLIENTS
		do

yyval13 := yytype13 (yyvs.item (yyvsp - 1)) 
			yyval := yyval13
		end

	yy_do_action_79 is
			--|#line 361
		local
			yyval13: ET_CLIENTS
		do

yyval13 := new_none_clients 
			yyval := yyval13
		end

	yy_do_action_80 is
			--|#line 365
		local
			yyval13: ET_CLIENTS
		do

yyval13 := new_any_clients 
			yyval := yyval13
		end

	yy_do_action_81 is
			--|#line 367
		local
			yyval13: ET_CLIENTS
		do

yyval13 := yytype13 (yyvs.item (yyvsp)) 
			yyval := yyval13
		end

	yy_do_action_82 is
			--|#line 371
		local
			yyval13: ET_CLIENTS
		do

yyval13 := new_clients (new_client (yytype5 (yyvs.item (yyvsp)))) 
			yyval := yyval13
		end

	yy_do_action_83 is
			--|#line 373
		local
			yyval13: ET_CLIENTS
		do

yyval13 := new_clients (new_client (yytype5 (yyvs.item (yyvsp - 1)))) 
			yyval := yyval13
		end

	yy_do_action_84 is
			--|#line 375
		local
			yyval13: ET_CLIENTS
		do

yyval13 := yytype13 (yyvs.item (yyvsp)); yyval13.put_first (new_client (yytype5 (yyvs.item (yyvsp - 2)))) 
			yyval := yyval13
		end

	yy_do_action_85 is
			--|#line 377
		local
			yyval13: ET_CLIENTS
		do

yyval13 := yytype13 (yyvs.item (yyvsp)); yyval13.put_first (new_client (yytype5 (yyvs.item (yyvsp - 1)))) 
			yyval := yyval13
		end

	yy_do_action_87 is
			--|#line 385
		local
			yyval29: like new_feature_list
		do

yyval29 := yytype29 (yyvs.item (yyvsp)) 
			yyval := yyval29
		end

	yy_do_action_89 is
			--|#line 391
		local
			yyval29: like new_feature_list
		do

yyval29 := yytype29 (yyvs.item (yyvsp)) 
			yyval := yyval29
		end

	yy_do_action_91 is
			--|#line 397
		local
			yyval29: like new_feature_list
		do

yyval29 := yytype29 (yyvs.item (yyvsp)) 
			yyval := yyval29
		end

	yy_do_action_93 is
			--|#line 403
		local
			yyval29: like new_feature_list
		do

yyval29 := yytype29 (yyvs.item (yyvsp)) 
			yyval := yyval29
		end

	yy_do_action_95 is
			--|#line 409
		local
			yyval29: like new_feature_list
		do

yyval29 := yytype29 (yyvs.item (yyvsp)) 
			yyval := yyval29
		end

	yy_do_action_97 is
			--|#line 415
		local
			yyval29: like new_feature_list
		do

yyval29 := yytype29 (yyvs.item (yyvsp)) 
			yyval := yyval29
		end

	yy_do_action_118 is
			--|#line 467
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)); register_feature (yyval16) 
			yyval := yyval16
		end

	yy_do_action_119 is
			--|#line 469
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)); register_frozen_feature (yyval16) 
			yyval := yyval16
		end

	yy_do_action_120 is
			--|#line 471
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)).synonym (yytype17 (yyvs.item (yyvsp - 2))); register_feature (yyval16) 
			yyval := yyval16
		end

	yy_do_action_121 is
			--|#line 473
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)).synonym (yytype17 (yyvs.item (yyvsp - 2))); register_frozen_feature (yyval16) 
			yyval := yyval16
		end

	yy_do_action_124 is
			--|#line 481
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)) 
			yyval := yyval16
		end

	yy_do_action_125 is
			--|#line 483
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)) 
			yyval := yyval16
		end

	yy_do_action_126 is
			--|#line 485
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)) 
			yyval := yyval16
		end

	yy_do_action_127 is
			--|#line 487
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)) 
			yyval := yyval16
		end

	yy_do_action_128 is
			--|#line 489
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)) 
			yyval := yyval16
		end

	yy_do_action_129 is
			--|#line 491
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)) 
			yyval := yyval16
		end

	yy_do_action_130 is
			--|#line 493
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)) 
			yyval := yyval16
		end

	yy_do_action_131 is
			--|#line 495
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)) 
			yyval := yyval16
		end

	yy_do_action_132 is
			--|#line 497
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)) 
			yyval := yyval16
		end

	yy_do_action_133 is
			--|#line 499
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)) 
			yyval := yyval16
		end

	yy_do_action_134 is
			--|#line 501
		local
			yyval16: ET_FEATURE
		do

yyval16 := yytype16 (yyvs.item (yyvsp)) 
			yyval := yyval16
		end

	yy_do_action_135 is
			--|#line 505
		local
			yyval16: ET_FEATURE
		do

yyval16 := new_attribute (yytype17 (yyvs.item (yyvsp - 3)), yytype18 (yyvs.item (yyvsp - 2)), yytype26 (yyvs.item (yyvsp))) 
			yyval := yyval16
		end

	yy_do_action_136 is
			--|#line 509
		local
			yyval16: ET_FEATURE
		do

yyval16 := new_constant_attribute (yytype17 (yyvs.item (yyvsp - 5)), yytype18 (yyvs.item (yyvsp - 4)), yytype26 (yyvs.item (yyvsp - 2)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval16
		end

	yy_do_action_137 is
			--|#line 513
		local
			yyval16: ET_FEATURE
		do

yyval16 := new_unique_attribute (yytype17 (yyvs.item (yyvsp - 5)), yytype18 (yyvs.item (yyvsp - 4)), yytype26 (yyvs.item (yyvsp - 2))) 
			yyval := yyval16
		end

	yy_do_action_138 is
			--|#line 517
		local
			yyval16: ET_FEATURE
		do

yyval16 := new_do_procedure (yytype17 (yyvs.item (yyvsp - 10)), yytype18 (yyvs.item (yyvsp - 9)), yytype7 (yyvs.item (yyvsp - 7)), yytype24 (yyvs.item (yyvsp - 6)), yytype21 (yyvs.item (yyvsp - 5)), yytype14 (yyvs.item (yyvsp - 3)), yytype23 (yyvs.item (yyvsp - 2)), yytype14 (yyvs.item (yyvsp - 1))) 
			yyval := yyval16
		end

	yy_do_action_139 is
			--|#line 523
		local
			yyval16: ET_FEATURE
		do

yyval16 := new_once_procedure (yytype17 (yyvs.item (yyvsp - 10)), yytype18 (yyvs.item (yyvsp - 9)), yytype7 (yyvs.item (yyvsp - 7)), yytype24 (yyvs.item (yyvsp - 6)), yytype21 (yyvs.item (yyvsp - 5)), yytype14 (yyvs.item (yyvsp - 3)), yytype23 (yyvs.item (yyvsp - 2)), yytype14 (yyvs.item (yyvsp - 1))) 
			yyval := yyval16
		end

	yy_do_action_140 is
			--|#line 529
		local
			yyval16: ET_FEATURE
		do

yyval16 := new_deferred_procedure (yytype17 (yyvs.item (yyvsp - 7)), yytype18 (yyvs.item (yyvsp - 6)), yytype7 (yyvs.item (yyvsp - 4)), yytype24 (yyvs.item (yyvsp - 3)), yytype23 (yyvs.item (yyvsp - 1))) 
			yyval := yyval16
		end

	yy_do_action_141 is
			--|#line 534
		local
			yyval16: ET_FEATURE
		do

yyval16 := new_external_procedure (yytype17 (yyvs.item (yyvsp - 9)), yytype18 (yyvs.item (yyvsp - 8)), yytype7 (yyvs.item (yyvsp - 6)), yytype24 (yyvs.item (yyvsp - 5)), yytype7 (yyvs.item (yyvsp - 3)), yytype7 (yyvs.item (yyvsp - 2)), yytype23 (yyvs.item (yyvsp - 1))) 
			yyval := yyval16
		end

	yy_do_action_142 is
			--|#line 540
		local
			yyval16: ET_FEATURE
		do

yyval16 := new_do_function (yytype17 (yyvs.item (yyvsp - 12)), yytype18 (yyvs.item (yyvsp - 11)), yytype26 (yyvs.item (yyvsp - 9)), yytype7 (yyvs.item (yyvsp - 7)), yytype24 (yyvs.item (yyvsp - 6)), yytype21 (yyvs.item (yyvsp - 5)), yytype14 (yyvs.item (yyvsp - 3)), yytype23 (yyvs.item (yyvsp - 2)), yytype14 (yyvs.item (yyvsp - 1))) 
			yyval := yyval16
		end

	yy_do_action_143 is
			--|#line 546
		local
			yyval16: ET_FEATURE
		do

yyval16 := new_once_function (yytype17 (yyvs.item (yyvsp - 12)), yytype18 (yyvs.item (yyvsp - 11)), yytype26 (yyvs.item (yyvsp - 9)), yytype7 (yyvs.item (yyvsp - 7)), yytype24 (yyvs.item (yyvsp - 6)), yytype21 (yyvs.item (yyvsp - 5)), yytype14 (yyvs.item (yyvsp - 3)), yytype23 (yyvs.item (yyvsp - 2)), yytype14 (yyvs.item (yyvsp - 1))) 
			yyval := yyval16
		end

	yy_do_action_144 is
			--|#line 552
		local
			yyval16: ET_FEATURE
		do

yyval16 := new_deferred_function (yytype17 (yyvs.item (yyvsp - 9)), yytype18 (yyvs.item (yyvsp - 8)), yytype26 (yyvs.item (yyvsp - 6)), yytype7 (yyvs.item (yyvsp - 4)), yytype24 (yyvs.item (yyvsp - 3)), yytype23 (yyvs.item (yyvsp - 1))) 
			yyval := yyval16
		end

	yy_do_action_145 is
			--|#line 557
		local
			yyval16: ET_FEATURE
		do

yyval16 := new_external_function (yytype17 (yyvs.item (yyvsp - 11)), yytype18 (yyvs.item (yyvsp - 10)), yytype26 (yyvs.item (yyvsp - 8)), yytype7 (yyvs.item (yyvsp - 6)), yytype24 (yyvs.item (yyvsp - 5)), yytype7 (yyvs.item (yyvsp - 3)), yytype7 (yyvs.item (yyvsp - 2)), yytype23 (yyvs.item (yyvsp - 1))) 
			yyval := yyval16
		end

	yy_do_action_147 is
			--|#line 565
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_148 is
			--|#line 571
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := yytype5 (yyvs.item (yyvsp)) 
			yyval := yyval17
		end

	yy_do_action_149 is
			--|#line 573
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_prefix_not (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_150 is
			--|#line 575
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_prefix_plus (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_151 is
			--|#line 577
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_prefix_minus (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_152 is
			--|#line 579
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_prefix_freeop (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_153 is
			--|#line 581
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_plus (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_154 is
			--|#line 583
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_minus (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_155 is
			--|#line 585
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_times (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_156 is
			--|#line 587
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_divide (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_157 is
			--|#line 589
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_div (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_158 is
			--|#line 591
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_mod (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_159 is
			--|#line 593
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_power (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_160 is
			--|#line 595
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_lt (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_161 is
			--|#line 597
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_le (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_162 is
			--|#line 599
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_gt (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_163 is
			--|#line 601
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_ge (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_164 is
			--|#line 603
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_and (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_165 is
			--|#line 605
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_and_then (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_166 is
			--|#line 607
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_or (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_167 is
			--|#line 609
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_or_else (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_168 is
			--|#line 611
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_implies (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_169 is
			--|#line 613
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_xor (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_170 is
			--|#line 615
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_infix_freeop (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_171 is
			--|#line 618
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_172 is
			--|#line 620
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_173 is
			--|#line 622
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_174 is
			--|#line 624
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_175 is
			--|#line 626
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_176 is
			--|#line 628
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_177 is
			--|#line 630
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_178 is
			--|#line 632
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_179 is
			--|#line 634
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_180 is
			--|#line 636
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_181 is
			--|#line 638
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_182 is
			--|#line 640
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_183 is
			--|#line 642
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_184 is
			--|#line 644
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_185 is
			--|#line 646
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_186 is
			--|#line 648
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_prefix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_187 is
			--|#line 650
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_infix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_188 is
			--|#line 652
		local
			yyval17: ET_FEATURE_NAME
		do

yyval17 := new_invalid_infix (yytype7 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval17
		end

	yy_do_action_191 is
			--|#line 662
		local
			yyval18: ET_FORMAL_ARGUMENTS
		do

yyval18 := yytype18 (yyvs.item (yyvsp - 1)) 
			yyval := yyval18
		end

	yy_do_action_192 is
			--|#line 666
		local
			yyval18: ET_FORMAL_ARGUMENTS
		do

yyval18 := new_formal_arguments (yytype5 (yyvs.item (yyvsp - 2)), yytype26 (yyvs.item (yyvsp))) 
			yyval := yyval18
		end

	yy_do_action_193 is
			--|#line 668
		local
			yyval18: ET_FORMAL_ARGUMENTS
		do

yyval18 := new_formal_arguments (yytype5 (yyvs.item (yyvsp - 3)), yytype26 (yyvs.item (yyvsp - 1))) 
			yyval := yyval18
		end

	yy_do_action_194 is
			--|#line 670
		local
			yyval18: ET_FORMAL_ARGUMENTS
		do

yyval18 := yytype18 (yyvs.item (yyvsp)); yyval18.put_name_first (yytype5 (yyvs.item (yyvsp - 2))) 
			yyval := yyval18
		end

	yy_do_action_195 is
			--|#line 672
		local
			yyval18: ET_FORMAL_ARGUMENTS
		do

yyval18 := yytype18 (yyvs.item (yyvsp)); yyval18.put_name_first (yytype5 (yyvs.item (yyvsp - 1))) 
			yyval := yyval18
		end

	yy_do_action_196 is
			--|#line 674
		local
			yyval18: ET_FORMAL_ARGUMENTS
		do

yyval18 := yytype18 (yyvs.item (yyvsp)); yyval18.put_first (yytype5 (yyvs.item (yyvsp - 4)), yytype26 (yyvs.item (yyvsp - 2))) 
			yyval := yyval18
		end

	yy_do_action_197 is
			--|#line 676
		local
			yyval18: ET_FORMAL_ARGUMENTS
		do

yyval18 := yytype18 (yyvs.item (yyvsp)); yyval18.put_first (yytype5 (yyvs.item (yyvsp - 3)), yytype26 (yyvs.item (yyvsp - 1))) 
			yyval := yyval18
		end

	yy_do_action_200 is
			--|#line 686
		local
			yyval21: ET_LOCAL_VARIABLES
		do

yyval21 := yytype21 (yyvs.item (yyvsp)) 
			yyval := yyval21
		end

	yy_do_action_201 is
			--|#line 690
		local
			yyval21: ET_LOCAL_VARIABLES
		do

yyval21 := new_local_variables (yytype5 (yyvs.item (yyvsp - 2)), yytype26 (yyvs.item (yyvsp))) 
			yyval := yyval21
		end

	yy_do_action_202 is
			--|#line 692
		local
			yyval21: ET_LOCAL_VARIABLES
		do

yyval21 := new_local_variables (yytype5 (yyvs.item (yyvsp - 3)), yytype26 (yyvs.item (yyvsp - 1))) 
			yyval := yyval21
		end

	yy_do_action_203 is
			--|#line 694
		local
			yyval21: ET_LOCAL_VARIABLES
		do

yyval21 := yytype21 (yyvs.item (yyvsp)); yyval21.put_name_first (yytype5 (yyvs.item (yyvsp - 2))) 
			yyval := yyval21
		end

	yy_do_action_204 is
			--|#line 696
		local
			yyval21: ET_LOCAL_VARIABLES
		do

yyval21 := yytype21 (yyvs.item (yyvsp)); yyval21.put_name_first (yytype5 (yyvs.item (yyvsp - 1))) 
			yyval := yyval21
		end

	yy_do_action_205 is
			--|#line 698
		local
			yyval21: ET_LOCAL_VARIABLES
		do

yyval21 := yytype21 (yyvs.item (yyvsp)); yyval21.put_first (yytype5 (yyvs.item (yyvsp - 4)), yytype26 (yyvs.item (yyvsp - 2))) 
			yyval := yyval21
		end

	yy_do_action_206 is
			--|#line 700
		local
			yyval21: ET_LOCAL_VARIABLES
		do

yyval21 := yytype21 (yyvs.item (yyvsp)); yyval21.put_first (yytype5 (yyvs.item (yyvsp - 3)), yytype26 (yyvs.item (yyvsp - 1))) 
			yyval := yyval21
		end

	yy_do_action_208 is
			--|#line 708
		local
			yyval24: ET_PRECONDITIONS
		do

yyval24 := new_preconditions (new_comment_assertion (Void)) 
			yyval := yyval24
		end

	yy_do_action_209 is
			--|#line 710
		local
			yyval24: ET_PRECONDITIONS
		do

yyval24 := yytype24 (yyvs.item (yyvsp)) 
			yyval := yyval24
		end

	yy_do_action_210 is
			--|#line 712
		local
			yyval24: ET_PRECONDITIONS
		do

yyval24 := new_preconditions (new_comment_assertion (Void)); yyval24.set_require_else 
			yyval := yyval24
		end

	yy_do_action_211 is
			--|#line 714
		local
			yyval24: ET_PRECONDITIONS
		do

yyval24 := yytype24 (yyvs.item (yyvsp)); yyval24.set_require_else 
			yyval := yyval24
		end

	yy_do_action_213 is
			--|#line 720
		local
			yyval23: ET_POSTCONDITIONS
		do

yyval23 := new_postconditions (new_comment_assertion (Void)) 
			yyval := yyval23
		end

	yy_do_action_214 is
			--|#line 722
		local
			yyval23: ET_POSTCONDITIONS
		do

yyval23 := yytype23 (yyvs.item (yyvsp)) 
			yyval := yyval23
		end

	yy_do_action_215 is
			--|#line 724
		local
			yyval23: ET_POSTCONDITIONS
		do

yyval23 := new_postconditions (new_comment_assertion (Void)); yyval23.set_ensure_then 
			yyval := yyval23
		end

	yy_do_action_216 is
			--|#line 726
		local
			yyval23: ET_POSTCONDITIONS
		do

yyval23 := yytype23 (yyvs.item (yyvsp)); yyval23.set_ensure_then 
			yyval := yyval23
		end

	yy_do_action_219 is
			--|#line 734
		local
			yyval12: ET_ASSERTIONS
		do

yyval12 := yytype12 (yyvs.item (yyvsp)) 
			yyval := yyval12
		end

	yy_do_action_220 is
			--|#line 738
		local
			yyval12: ET_ASSERTIONS
		do

yyval12 := new_assertions (yytype11 (yyvs.item (yyvsp))) 
			yyval := yyval12
		end

	yy_do_action_221 is
			--|#line 740
		local
			yyval12: ET_ASSERTIONS
		do

yyval12 := new_assertions (yytype11 (yyvs.item (yyvsp - 1))) 
			yyval := yyval12
		end

	yy_do_action_222 is
			--|#line 742
		local
			yyval12: ET_ASSERTIONS
		do

yyval12 := yytype12 (yyvs.item (yyvsp)); yyval12.put_first (yytype11 (yyvs.item (yyvsp - 1))) 
			yyval := yyval12
		end

	yy_do_action_223 is
			--|#line 744
		local
			yyval12: ET_ASSERTIONS
		do

yyval12 := yytype12 (yyvs.item (yyvsp)); yyval12.put_first (yytype11 (yyvs.item (yyvsp - 2))) 
			yyval := yyval12
		end

	yy_do_action_224 is
			--|#line 748
		local
			yyval24: ET_PRECONDITIONS
		do

yyval24 := new_preconditions (yytype11 (yyvs.item (yyvsp))) 
			yyval := yyval24
		end

	yy_do_action_225 is
			--|#line 750
		local
			yyval24: ET_PRECONDITIONS
		do

yyval24 := new_preconditions (yytype11 (yyvs.item (yyvsp - 1))) 
			yyval := yyval24
		end

	yy_do_action_226 is
			--|#line 752
		local
			yyval24: ET_PRECONDITIONS
		do

yyval24 := yytype24 (yyvs.item (yyvsp)); yyval24.put_first (yytype11 (yyvs.item (yyvsp - 1))) 
			yyval := yyval24
		end

	yy_do_action_227 is
			--|#line 754
		local
			yyval24: ET_PRECONDITIONS
		do

yyval24 := yytype24 (yyvs.item (yyvsp)); yyval24.put_first (yytype11 (yyvs.item (yyvsp - 2))) 
			yyval := yyval24
		end

	yy_do_action_228 is
			--|#line 758
		local
			yyval23: ET_POSTCONDITIONS
		do

yyval23 := new_postconditions (yytype11 (yyvs.item (yyvsp))) 
			yyval := yyval23
		end

	yy_do_action_229 is
			--|#line 760
		local
			yyval23: ET_POSTCONDITIONS
		do

yyval23 := new_postconditions (yytype11 (yyvs.item (yyvsp - 1))) 
			yyval := yyval23
		end

	yy_do_action_230 is
			--|#line 762
		local
			yyval23: ET_POSTCONDITIONS
		do

yyval23 := yytype23 (yyvs.item (yyvsp)); yyval23.put_first (yytype11 (yyvs.item (yyvsp - 1))) 
			yyval := yyval23
		end

	yy_do_action_231 is
			--|#line 764
		local
			yyval23: ET_POSTCONDITIONS
		do

yyval23 := yytype23 (yyvs.item (yyvsp)); yyval23.put_first (yytype11 (yyvs.item (yyvsp - 2))) 
			yyval := yyval23
		end

	yy_do_action_232 is
			--|#line 768
		local
			yyval11: ET_ASSERTION
		do

yyval11 := new_expression_assertion (Void, yytype15 (yyvs.item (yyvsp))) 
			yyval := yyval11
		end

	yy_do_action_233 is
			--|#line 773
		local
			yyval11: ET_ASSERTION
		do

yyval11 := new_comment_assertion (yytype5 (yyvs.item (yyvsp - 1))) 
			yyval := yyval11
		end

	yy_do_action_235 is
			--|#line 782
		local
			yyval14: ET_COMPOUND
		do

yyval14 := yytype14 (yyvs.item (yyvsp)) 
			yyval := yyval14
		end

	yy_do_action_236 is
			--|#line 788
		local
			yyval26: ET_TYPE
		do

!ET_TYPE! yyval26 
			yyval := yyval26
		end

	yy_do_action_237 is
			--|#line 790
		local
			yyval26: ET_TYPE
		do

!ET_TYPE! yyval26 
			yyval := yyval26
		end

	yy_do_action_238 is
			--|#line 792
		local
			yyval26: ET_TYPE
		do

!ET_TYPE! yyval26 
			yyval := yyval26
		end

	yy_do_action_239 is
			--|#line 794
		local
			yyval26: ET_TYPE
		do

!ET_TYPE! yyval26 
			yyval := yyval26
		end

	yy_do_action_240 is
			--|#line 796
		local
			yyval26: ET_TYPE
		do

!ET_TYPE! yyval26 
			yyval := yyval26
		end

	yy_do_action_241 is
			--|#line 798
		local
			yyval26: ET_TYPE
		do

!ET_TYPE! yyval26 
			yyval := yyval26
		end

	yy_do_action_242 is
			--|#line 800
		local
			yyval26: ET_TYPE
		do

!ET_TYPE! yyval26 
			yyval := yyval26
		end

	yy_do_action_251 is
			--|#line 823
		local
			yyval14: ET_COMPOUND
		do

yyval14 := yytype14 (yyvs.item (yyvsp)) 
			yyval := yyval14
		end

	yy_do_action_252 is
			--|#line 827
		local
			yyval14: ET_COMPOUND
		do

yyval14 := new_compound (yytype20 (yyvs.item (yyvsp - 1))) 
			yyval := yyval14
		end

	yy_do_action_253 is
			--|#line 829
		local
			yyval14: ET_COMPOUND
		do

yyval14 := yytype14 (yyvs.item (yyvsp)); yyval14.add_instruction (yytype20 (yyvs.item (yyvsp - 1))) 
			yyval := yyval14
		end

	yy_do_action_254 is
			--|#line 833
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := yytype20 (yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_255 is
			--|#line 835
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := yytype20 (yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_256 is
			--|#line 837
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := yytype20 (yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_257 is
			--|#line 839
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := yytype20 (yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_258 is
			--|#line 841
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := yytype20 (yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_259 is
			--|#line 843
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := yytype19 (yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_260 is
			--|#line 845
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := yytype20 (yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_261 is
			--|#line 847
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := yytype20 (yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_262 is
			--|#line 849
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := yytype20 (yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_263 is
			--|#line 851
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := yytype20 (yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_264 is
			--|#line 853
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_retry_instruction 
			yyval := yyval20
		end

	yy_do_action_269 is
			--|#line 867
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_creation_instruction (yytype26 (yyvs.item (yyvsp - 3)), yytype27 (yyvs.item (yyvsp - 1)), yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_270 is
			--|#line 869
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_creation_instruction (Void, yytype27 (yyvs.item (yyvsp - 1)), yyvs.item (yyvsp)) 
			yyval := yyval20
		end

	yy_do_action_276 is
			--|#line 886
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_assignment (yytype27 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp))) 
			yyval := yyval20
		end

	yy_do_action_277 is
			--|#line 890
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_assignment_attempt (yytype27 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp))) 
			yyval := yyval20
		end

	yy_do_action_278 is
			--|#line 896
		local
			yyval19: ET_IF_INSTRUCTION
		do

yyval19 := yytype19 (yyvs.item (yyvsp - 1)) 
			yyval := yyval19
		end

	yy_do_action_279 is
			--|#line 898
		local
			yyval19: ET_IF_INSTRUCTION
		do

yyval19 := yytype19 (yyvs.item (yyvsp - 2)); yyval19.set_else_part (yytype14 (yyvs.item (yyvsp - 1))) 
			yyval := yyval19
		end

	yy_do_action_280 is
			--|#line 902
		local
			yyval14: ET_COMPOUND
		do

yyval14 := yytype14 (yyvs.item (yyvsp)) 
			yyval := yyval14
		end

	yy_do_action_281 is
			--|#line 906
		local
			yyval19: ET_IF_INSTRUCTION
		do

yyval19 := new_if_instruction (yytype15 (yyvs.item (yyvsp - 2)), yytype14 (yyvs.item (yyvsp))) 
			yyval := yyval19
		end

	yy_do_action_282 is
			--|#line 908
		local
			yyval19: ET_IF_INSTRUCTION
		do

yyval19 := yytype19 (yyvs.item (yyvsp - 4)); yyval19.add_conditional (yytype15 (yyvs.item (yyvsp - 2)), yytype14 (yyvs.item (yyvsp))) 
			yyval := yyval19
		end

	yy_do_action_283 is
			--|#line 914
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_inspect_instruction 
			yyval := yyval20
		end

	yy_do_action_284 is
			--|#line 916
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_inspect_instruction 
			yyval := yyval20
		end

	yy_do_action_297 is
			--|#line 947
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_loop_instruction 
			yyval := yyval20
		end

	yy_do_action_302 is
			--|#line 960
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_debug_instruction 
			yyval := yyval20
		end

	yy_do_action_308 is
			--|#line 975
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_check_instruction 
			yyval := yyval20
		end

	yy_do_action_309 is
			--|#line 977
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_check_instruction 
			yyval := yyval20
		end

	yy_do_action_310 is
			--|#line 983
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_call_instruction (Void, yytype5 (yyvs.item (yyvsp - 1)), yytype10 (yyvs.item (yyvsp))) 
			yyval := yyval20
		end

	yy_do_action_311 is
			--|#line 985
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_call_instruction (yytype15 (yyvs.item (yyvsp - 2)), yytype5 (yyvs.item (yyvsp - 1)), yytype10 (yyvs.item (yyvsp))) 
			yyval := yyval20
		end

	yy_do_action_312 is
			--|#line 987
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_precursor_instruction (Void, yytype10 (yyvs.item (yyvsp))) 
			yyval := yyval20
		end

	yy_do_action_313 is
			--|#line 989
		local
			yyval20: ET_INSTRUCTION
		do

yyval20 := new_precursor_instruction (yytype5 (yyvs.item (yyvsp - 3)), yytype10 (yyvs.item (yyvsp))) 
			yyval := yyval20
		end

	yy_do_action_314 is
			--|#line 993
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_call_expression (Void, yytype5 (yyvs.item (yyvsp - 1)), yytype10 (yyvs.item (yyvsp))) 
			yyval := yyval15
		end

	yy_do_action_315 is
			--|#line 995
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_call_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype5 (yyvs.item (yyvsp - 1)), yytype10 (yyvs.item (yyvsp))) 
			yyval := yyval15
		end

	yy_do_action_316 is
			--|#line 997
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_precursor_expression (Void, yytype10 (yyvs.item (yyvsp))) 
			yyval := yyval15
		end

	yy_do_action_317 is
			--|#line 999
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_precursor_expression (yytype5 (yyvs.item (yyvsp - 3)), yytype10 (yyvs.item (yyvsp))) 
			yyval := yyval15
		end

	yy_do_action_318 is
			--|#line 1003
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_call_expression (Void, yytype5 (yyvs.item (yyvsp - 2)), yytype10 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_319 is
			--|#line 1005
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_result (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_320 is
			--|#line 1007
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_current (yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_321 is
			--|#line 1009
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := yytype15 (yyvs.item (yyvsp - 2)) 
			yyval := yyval15
		end

	yy_do_action_322 is
			--|#line 1011
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_precursor_expression (Void, yytype10 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_323 is
			--|#line 1013
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_precursor_expression (yytype5 (yyvs.item (yyvsp - 4)), yytype10 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_324 is
			--|#line 1015
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_call_expression (yytype15 (yyvs.item (yyvsp - 3)), yytype5 (yyvs.item (yyvsp - 2)), yytype10 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_327 is
			--|#line 1025
		local
			yyval10: ET_ACTUAL_ARGUMENTS
		do

yyval10 := yytype10 (yyvs.item (yyvsp - 1)) 
			yyval := yyval10
		end

	yy_do_action_328 is
			--|#line 1029
		local
			yyval10: ET_ACTUAL_ARGUMENTS
		do

yyval10 := new_actual_arguments (yytype15 (yyvs.item (yyvsp))) 
			yyval := yyval10
		end

	yy_do_action_329 is
			--|#line 1031
		local
			yyval10: ET_ACTUAL_ARGUMENTS
		do

yyval10 := yytype10 (yyvs.item (yyvsp)); yyval10.add_argument (yytype15 (yyvs.item (yyvsp - 2))) 
			yyval := yyval10
		end

	yy_do_action_330 is
			--|#line 1035
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_feature_address 
			yyval := yyval15
		end

	yy_do_action_331 is
			--|#line 1037
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_current_address 
			yyval := yyval15
		end

	yy_do_action_332 is
			--|#line 1039
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_result_address 
			yyval := yyval15
		end

	yy_do_action_333 is
			--|#line 1044
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_expression_address (yytype15 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_334 is
			--|#line 1048
		local
			yyval27: ET_WRITABLE
		do

yyval27 := yytype5 (yyvs.item (yyvsp)) 
			yyval := yyval27
		end

	yy_do_action_335 is
			--|#line 1050
		local
			yyval27: ET_WRITABLE
		do

yyval27 := new_result (yytype1 (yyvs.item (yyvsp))) 
			yyval := yyval27
		end

	yy_do_action_336 is
			--|#line 1056
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := yytype15 (yyvs.item (yyvsp)) 
			yyval := yyval15
		end

	yy_do_action_337 is
			--|#line 1058
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := yytype15 (yyvs.item (yyvsp)) 
			yyval := yyval15
		end

	yy_do_action_338 is
			--|#line 1060
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_result (yytype1 (yyvs.item (yyvsp))) 
			yyval := yyval15
		end

	yy_do_action_339 is
			--|#line 1062
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_current (yytype1 (yyvs.item (yyvsp))) 
			yyval := yyval15
		end

	yy_do_action_340 is
			--|#line 1064
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := yytype15 (yyvs.item (yyvsp - 1)) 
			yyval := yyval15
		end

	yy_do_action_341 is
			--|#line 1066
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := yytype3 (yyvs.item (yyvsp)) 
			yyval := yyval15
		end

	yy_do_action_342 is
			--|#line 1068
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := yytype4 (yyvs.item (yyvsp)) 
			yyval := yyval15
		end

	yy_do_action_343 is
			--|#line 1070
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := yytype6 (yyvs.item (yyvsp)) 
			yyval := yyval15
		end

	yy_do_action_344 is
			--|#line 1072
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := yytype8 (yyvs.item (yyvsp)) 
			yyval := yyval15
		end

	yy_do_action_345 is
			--|#line 1074
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval15
		end

	yy_do_action_346 is
			--|#line 1076
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := yytype2 (yyvs.item (yyvsp)) 
			yyval := yyval15
		end

	yy_do_action_347 is
			--|#line 1078
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_manifest_array 
			yyval := yyval15
		end

	yy_do_action_348 is
			--|#line 1080
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_prefix_plus_expression (yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_349 is
			--|#line 1082
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_prefix_minus_expression (yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_350 is
			--|#line 1084
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_prefix_not_expression (yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_351 is
			--|#line 1086
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_prefix_freeop_expression (yytype9 (yyvs.item (yyvsp - 1)), yytype15 (yyvs.item (yyvsp))) 
			yyval := yyval15
		end

	yy_do_action_352 is
			--|#line 1088
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_freeop_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype9 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_353 is
			--|#line 1090
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_plus_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_354 is
			--|#line 1092
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_minus_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_355 is
			--|#line 1094
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_times_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_356 is
			--|#line 1096
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_divide_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_357 is
			--|#line 1098
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_power_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_358 is
			--|#line 1100
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_div_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_359 is
			--|#line 1102
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_mod_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_360 is
			--|#line 1104
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_equal_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp))) 
			yyval := yyval15
		end

	yy_do_action_361 is
			--|#line 1106
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_not_equal_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp))) 
			yyval := yyval15
		end

	yy_do_action_362 is
			--|#line 1108
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_lt_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_363 is
			--|#line 1110
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_gt_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_364 is
			--|#line 1112
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_le_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_365 is
			--|#line 1114
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_ge_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_366 is
			--|#line 1116
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_and_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_367 is
			--|#line 1118
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_or_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_368 is
			--|#line 1120
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_xor_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_369 is
			--|#line 1122
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_and_then_expression (yytype15 (yyvs.item (yyvsp - 3)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 2))) 
			yyval := yyval15
		end

	yy_do_action_370 is
			--|#line 1124
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_or_else_expression (yytype15 (yyvs.item (yyvsp - 3)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 2))) 
			yyval := yyval15
		end

	yy_do_action_371 is
			--|#line 1126
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_infix_implies_expression (yytype15 (yyvs.item (yyvsp - 2)), yytype15 (yyvs.item (yyvsp)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval15
		end

	yy_do_action_372 is
			--|#line 1128
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_old_expression (yytype15 (yyvs.item (yyvsp))) 
			yyval := yyval15
		end

	yy_do_action_373 is
			--|#line 1130
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := new_strip_expression 
			yyval := yyval15
		end

	yy_do_action_374 is
			--|#line 1132
		local
			yyval15: ET_EXPRESSION
		do

yyval15 := yytype15 (yyvs.item (yyvsp)) 
			yyval := yyval15
		end

	yy_do_action_387 is
			--|#line 1154
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_388 is
			--|#line 1156
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_389 is
			--|#line 1158
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_390 is
			--|#line 1160
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_391 is
			--|#line 1162
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_392 is
			--|#line 1164
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_393 is
			--|#line 1166
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_394 is
			--|#line 1168
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_395 is
			--|#line 1170
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_396 is
			--|#line 1172
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_397 is
			--|#line 1174
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_398 is
			--|#line 1176
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_399 is
			--|#line 1178
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_400 is
			--|#line 1180
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_401 is
			--|#line 1182
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_402 is
			--|#line 1184
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_403 is
			--|#line 1186
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_404 is
			--|#line 1188
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_405 is
			--|#line 1190
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_406 is
			--|#line 1192
		local
			yyval7: ET_MANIFEST_STRING
		do

yyval7 := yytype7 (yyvs.item (yyvsp)) 
			yyval := yyval7
		end

	yy_do_action_407 is
			--|#line 1194
		local
			yyval7: ET_MANIFEST_STRING
		do

abort 
			yyval := yyval7
		end

	yy_do_action_408 is
			--|#line 1198
		local
			yyval4: ET_CHARACTER_CONSTANT
		do

yyval4 := yytype4 (yyvs.item (yyvsp)) 
			yyval := yyval4
		end

	yy_do_action_409 is
			--|#line 1200
		local
			yyval4: ET_CHARACTER_CONSTANT
		do

abort 
			yyval := yyval4
		end

	yy_do_action_410 is
			--|#line 1204
		local
			yyval3: ET_BOOLEAN_CONSTANT
		do

yyval3 := yytype3 (yyvs.item (yyvsp)) 
			yyval := yyval3
		end

	yy_do_action_411 is
			--|#line 1206
		local
			yyval3: ET_BOOLEAN_CONSTANT
		do

yyval3 := yytype3 (yyvs.item (yyvsp)) 
			yyval := yyval3
		end

	yy_do_action_412 is
			--|#line 1210
		local
			yyval6: ET_INTEGER_CONSTANT
		do

yyval6 := yytype6 (yyvs.item (yyvsp)) 
			yyval := yyval6
		end

	yy_do_action_413 is
			--|#line 1212
		local
			yyval6: ET_INTEGER_CONSTANT
		do

yyval6 := yytype6 (yyvs.item (yyvsp)); yyval6.set_negative 
			yyval := yyval6
		end

	yy_do_action_414 is
			--|#line 1214
		local
			yyval6: ET_INTEGER_CONSTANT
		do

yyval6 := yytype6 (yyvs.item (yyvsp)) 
			yyval := yyval6
		end

	yy_do_action_415 is
			--|#line 1218
		local
			yyval8: ET_REAL_CONSTANT
		do

yyval8 := yytype8 (yyvs.item (yyvsp)) 
			yyval := yyval8
		end

	yy_do_action_416 is
			--|#line 1220
		local
			yyval8: ET_REAL_CONSTANT
		do

yyval8 := yytype8 (yyvs.item (yyvsp)); yyval8.set_negative 
			yyval := yyval8
		end

	yy_do_action_417 is
			--|#line 1222
		local
			yyval8: ET_REAL_CONSTANT
		do

yyval8 := yytype8 (yyvs.item (yyvsp)) 
			yyval := yyval8
		end

	yy_do_action_418 is
			--|#line 1226
		local
			yyval5: ET_IDENTIFIER
		do

yyval5 := yytype5 (yyvs.item (yyvsp)) 
			yyval := yyval5
		end

	yy_do_action_419 is
			--|#line 1228
		local
			yyval5: ET_IDENTIFIER
		do

				-- TO DO: reserved word `BIT'
			yyval5 := yytype5 (yyvs.item (yyvsp))
		
			yyval := yyval5
		end

feature {NONE} -- Table templates

	yytranslate_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  120,    2,    2,  122,    2,    2,    2,
			  118,  119,  104,  102,  112,  103,  121,  105,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,  111,  115,
			   98,   96,   99,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,  113,    2,  114,  108,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  116,    2,  117,    2,    2,    2,    2,
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
			   95,   97,  100,  101,  106,  107,  109,  110>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,  201,  201,  202,  202,  209,  203,  203,  210,  210,
			  211,  211,  213,  213,  214,  214,  215,  215,  215,  215,
			  215,  215,  215,  204,  204,  204,  204,  205,  205,  216,
			  216,  216,  217,  217,  176,  176,  208,  208,  179,  179,
			  179,  179,  179,  179,  179,  179,  179,  179,  179,  179,
			  179,  179,  179,  219,  219,  220,  220,  199,  199,  200,
			  200,  185,  189,  190,  190,  191,  191,  191,  221,  221,
			  221,  222,  223,  223,  223,  192,  192,  156,  130,  130,
			  131,  131,  132,  132,  132,  132,  197,  197,  198,  198,
			  195,  195,  196,  196,  193,  193,  194,  194,  206,  206,

			  224,  224,  225,  225,  226,  226,  226,  207,  207,  227,
			  227,  228,  229,  229,  229,  230,  230,  230,  142,  142,
			  142,  142,  231,  231,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  144,  145,  146,  147,  148,
			  149,  150,  151,  152,  153,  154,  178,  178,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  157,
			  157,  157,  158,  158,  158,  158,  158,  158,  174,  174,

			  174,  175,  175,  175,  175,  175,  175,  183,  183,  183,
			  183,  183,  181,  181,  181,  181,  181,  127,  127,  127,
			  126,  126,  126,  126,  182,  182,  182,  182,  180,  180,
			  180,  180,  125,  125,  136,  136,  186,  186,  186,  186,
			  186,  186,  186,  187,  160,  218,  218,  233,  233,  233,
			  133,  133,  134,  134,  163,  163,  163,  163,  163,  163,
			  163,  163,  163,  163,  163,  234,  234,  212,  212,  164,
			  164,  235,  235,  172,  172,  141,  165,  166,  161,  161,
			  135,  162,  162,  168,  168,  236,  236,  237,  237,  238,
			  238,  238,  239,  239,  240,  240,  240,  169,  241,  241,

			  241,  241,  170,  242,  242,  243,  243,  243,  171,  171,
			  167,  167,  167,  167,  138,  138,  138,  138,  139,  139,
			  139,  139,  139,  139,  139,  123,  123,  123,  124,  124,
			  140,  140,  140,  140,  188,  188,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  245,  245,  245,  244,  244,
			  244,  232,  232,  232,  232,  232,  232,  177,  177,  177,
			  177,  177,  177,  177,  177,  177,  177,  177,  177,  177,

			  177,  177,  177,  177,  177,  177,  177,  177,  129,  129,
			  128,  128,  173,  173,  173,  184,  184,  184,  159,  159>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    1,    2,    8,    5,    3,    0,    2,    0,    2,
			    1,    3,    1,    3,    1,    3,    1,    1,    1,    1,
			    1,    1,    1,    2,    3,    3,    3,    0,    3,    0,
			    2,    4,    0,    2,    0,    2,    3,    2,   11,   10,
			    9,    8,    7,    6,    5,    3,   10,    9,    8,    7,
			    6,    5,    4,    0,    1,    0,    1,    1,    2,    1,
			    3,    3,    2,    0,    1,    0,    1,    2,    1,    2,
			    3,    2,    0,    1,    1,    1,    3,    1,    3,    2,
			    0,    1,    1,    2,    3,    2,    1,    2,    0,    1,
			    1,    2,    0,    1,    1,    2,    0,    1,    0,    1,

			    1,    2,    3,    3,    0,    1,    3,    0,    1,    1,
			    2,    3,    0,    1,    2,    1,    2,    3,    1,    2,
			    3,    4,    0,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    4,    6,    6,   11,   11,
			    8,   10,   13,   13,   10,   12,    0,    2,    1,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    0,
			    2,    3,    3,    4,    3,    2,    5,    4,    0,    1,

			    2,    3,    4,    3,    2,    5,    4,    0,    1,    2,
			    2,    3,    0,    1,    2,    2,    3,    0,    1,    2,
			    1,    2,    2,    3,    1,    2,    2,    3,    1,    2,
			    2,    3,    1,    2,    0,    2,    1,    2,    2,    2,
			    2,    2,    2,    2,    1,    0,    3,    0,    1,    3,
			    1,    1,    3,    3,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    0,    2,    0,    2,    5,
			    3,    0,    3,    6,    3,    5,    3,    3,    2,    3,
			    2,    4,    5,    5,    4,    0,    1,    4,    5,    0,
			    1,    3,    1,    3,    1,    1,    1,    9,    0,    1,

			    2,    4,    4,    0,    3,    0,    1,    3,    3,    2,
			    2,    3,    2,    5,    2,    3,    2,    5,    3,    2,
			    2,    4,    3,    6,    4,    0,    2,    3,    1,    3,
			    2,    2,    2,    4,    1,    1,    1,    1,    1,    1,
			    3,    1,    1,    1,    1,    1,    1,    3,    2,    2,
			    2,    2,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    4,
			    4,    3,    2,    4,    1,    0,    1,    3,    0,    1,
			    3,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    2,    1,    2,    2,    1,    1>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    6,    8,    6,    1,    0,    0,    0,  407,  409,  415,
			  387,  406,  405,  404,  403,  402,  401,  400,  399,  398,
			  397,  396,  395,  394,  393,  392,  391,  390,  389,  388,
			  412,  419,  418,  408,  410,  411,   22,   17,   18,   16,
			   19,   21,   20,    7,  267,   10,   12,   14,    2,    0,
			    0,    0,    0,   27,  416,  413,  417,  414,    0,    9,
			    0,    0,    0,    0,   23,   29,   34,   16,   13,  268,
			   11,   15,   26,   25,   24,   32,    0,    0,   98,    0,
			   30,   28,    0,   35,   98,   80,   80,  107,    4,   99,
			  100,  244,  245,   33,   32,  245,   37,  107,    0,    0,

			   81,  104,  104,   80,  217,  108,  109,  101,  247,  243,
			   31,   55,  217,   36,   79,    0,   82,  105,  102,  103,
			  112,  218,    0,  110,    0,    0,    0,    0,  248,  236,
			    0,   56,   90,   94,   57,   86,   65,   55,   92,    0,
			   88,   96,   63,   98,    0,    5,   78,   83,   85,    0,
			    0,    0,    0,  115,  118,  124,  125,  126,  127,  128,
			  129,  130,  131,  132,  133,  134,  189,  148,  111,  113,
			    0,    0,    0,    0,    0,    0,    0,    0,  344,  343,
			  346,  325,  338,  339,    0,    0,  378,  220,  219,  341,
			  342,  232,  336,    0,  374,  337,  325,  345,    3,    0,

			    0,  242,  241,  238,  239,  240,  237,  246,    0,   77,
			   75,   91,   95,    0,   59,   58,   87,   72,   62,   66,
			   68,   98,    0,   93,   88,   55,   89,   96,   97,    0,
			   64,   92,    0,   52,   84,  106,  171,  149,  152,  186,
			  185,  184,  183,  182,  181,  180,  179,  178,  177,  176,
			  175,  174,  173,  172,  151,  150,  187,  188,  170,  168,
			  167,  165,  169,  166,  164,  163,  162,  161,  160,  159,
			  158,  157,  156,  155,  154,  153,  119,  189,    0,  123,
			    0,    0,  114,  116,    0,  332,  331,  330,    0,  325,
			    0,  372,  350,  349,  348,  351,    0,  316,  319,  320,

			  375,    0,  379,    0,  221,  222,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  325,  233,  314,  249,    0,    0,
			    0,   74,   73,   71,   67,   69,    0,   51,   96,   98,
			    0,    0,   55,   88,   44,    0,  190,    0,    0,    0,
			   34,  120,  117,    0,  340,    0,  326,    0,  328,  322,
			  376,    0,    0,    0,  347,  223,  357,  359,  358,  356,
			  355,  354,  353,  365,  364,  363,  362,  361,  360,    0,
			  366,  368,    0,  367,  371,  352,  315,  318,   76,   61,
			   60,   70,   43,    0,    0,   50,   55,   98,    0,   96,

			  121,  191,    0,    0,  195,  135,  207,  333,  321,  325,
			  327,    0,  373,    0,  271,  380,  369,  370,  324,   55,
			   42,   98,    0,    0,   49,    0,  194,  192,   34,  208,
			  198,  317,  329,  377,    0,  275,   98,    0,    0,   48,
			   41,   55,  193,  197,  386,  137,  381,  382,  383,  207,
			  385,  384,  136,  210,  224,  209,  199,    0,  212,    0,
			  323,  325,    0,   47,   40,   98,    0,  196,  198,  211,
			  225,  226,    0,  200,  146,  213,    0,  265,  265,  272,
			   39,    0,   46,    0,  212,    0,  227,    0,    0,  204,
			    0,  212,  215,  228,  214,  140,  212,  251,  250,  212,

			   38,  146,    0,  265,  265,  203,  201,  147,    0,  216,
			  229,  230,  234,    0,    0,    0,  266,  325,  335,    0,
			  264,    0,    0,  265,  303,    0,    0,    0,    0,  334,
			  259,    0,  265,  254,  257,  258,  256,  260,  261,  262,
			  263,  255,    0,  234,  212,  144,  212,  212,  202,  206,
			  141,  231,  265,    0,    0,    0,    0,  312,  285,    0,
			  217,  305,  265,    0,  335,  334,  271,  309,    0,  271,
			  325,  310,  278,    0,  265,    0,  253,  252,    0,    0,
			    0,    0,  234,  234,  205,  235,  139,    0,    0,    0,
			  289,    0,  286,  265,  298,  306,    0,    0,    0,  274,

			  308,  270,  311,    0,  280,  279,  277,  276,  138,  145,
			    0,    0,  271,  325,    0,  295,  296,  294,    0,  290,
			  292,  284,    0,  289,  281,  299,    0,  304,    0,  302,
			    0,  265,  143,  142,  269,  313,    0,  265,    0,  283,
			    0,  300,  325,    0,  307,  271,  282,  291,  287,  293,
			  265,    0,    0,  273,  288,  301,  265,    0,  297,    0,
			    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			  326,  357,  187,  188,  122,  189,  190,  100,  101,  115,
			  496,  497,  575,  553,  191,  192,  193,  194,  195,  153,
			  154,  155,  156,  157,  158,  159,  160,  161,  162,  163,
			  164,  165,  166,  210,  280,  347,  289,   92,  530,  531,
			  532,  533,  534,  535,  536,  537,  538,  539,  540,  541,
			   40,  459,  473,   78,  197,  491,   96,  494,  476,  455,
			  430,   42,  214,  128,  129,  542,  138,  231,  218,  211,
			  228,  229,  223,  224,  226,  227,  142,  215,    2,    3,
			    4,   53,   66,   97,  104,   88,   98,   43,   44,   59,
			   45,   46,   47,   76,   80,  109,  143,  144,  219,  220,

			  333,   89,   90,  118,  105,  106,  168,  169,  281,  452,
			  130,  498,  435,  591,  592,  618,  619,  620,  626,  562,
			  596,  303,  361>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			  503, 1732,   48, -32768,   32,  155,   72, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  422,
			 -32768, -32768, -32768, -32768, -32768, -32768,  412, -32768, -32768,  518,
			  512,  511,  101,  414, -32768, -32768, -32768, -32768, 1732, 1651,
			 1732,  101,  101,  101, -32768,  101,  437, -32768,  412, -32768,
			 -32768, -32768, -32768, -32768, -32768,  519,  282, 1852,  217,  445,
			 -32768, -32768,  101, -32768,   38,  369,  369,  488, -32768,  340,
			 -32768, -32768,  404, -32768,  519,  404, -32768,  488,  494,  -23,

			 -32768,  101,  101,  369,  362,  488, -32768, -32768,  389, -32768,
			 -32768,  149,  362, -32768, -32768,  397,   82, -32768,  400,  400,
			  287, 1443,  489, -32768,  194,  445,  300,  445, -32768, -32768,
			  206,  377,  298,  298,  298,  298,  369,  231,  440,  481,
			  439,  405,  475,  340,  371, -32768, -32768,  101, -32768,  101,
			 1896, 1876,  298, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  225, -32768, -32768,   46,
			  145, 1443,  101, 1443, 1443, 1443, 1443, 1443, -32768, -32768,
			 -32768,   67,   28,  301,  390,  386, 1443, 1357, -32768, -32768,
			 -32768, 1895, -32768,  101, -32768, -32768,   97, -32768, -32768,  432,

			  431, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  389, -32768,
			  382, -32768, -32768,  477,  379, -32768, -32768,  262, -32768,  299,
			 -32768,  340,  371, -32768,  439,    6, -32768,  405, -32768,  466,
			 -32768,  440,  464, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  225,   44, -32768,
			    9,  287,  287, -32768, 1443, -32768, -32768, -32768, 1800,   67,
			  370, -32768, -32768, -32768, -32768, -32768, 1271,  277, -32768, -32768,

			  101,  389, 1895,    4, 1443, -32768, 1443, 1443, 1443, 1443,
			 1443, 1443, 1443, 1443, 1443, 1443, 1443, 1443, 1443, 1185,
			 1443, 1099, 1443, 1443,   67, -32768,  249, -32768,  298,  298,
			  298, -32768, -32768, -32768,  369, -32768,  462, -32768,  405,  340,
			  371,  461,    6,  439, -32768,  287, -32768,  361,  223,  389,
			  437, -32768, -32768, 1772,  188,  420, -32768,  353, 1474, -32768,
			 -32768,   93,  349, 1443, -32768, -32768,   62,   62,   62,   62,
			   62,  313,  313,  574,  574,  574,  574,  574,  574, 1443,
			 1935, 1915, 1443, 1915,  599, -32768,  100, -32768, -32768, -32768,
			 -32768, -32768, -32768,  443,  436, -32768,    6,  340,  371,  405,

			 -32768, -32768,  101,  389, -32768,  416,  398, -32768, -32768,   67,
			 -32768, 1443, -32768,  101,  -61, 1895, 1935, 1915, -32768,    6,
			 -32768,  340,  371,  429, -32768,  428, -32768,   91, 1565, 1013,
			  288,  -35, -32768, -32768,  101, -32768,  340,  371,  426, -32768,
			 -32768,    6,  101, -32768, -32768, -32768, -32768, -32768, -32768,  398,
			 -32768, -32768, -32768, 1443,  927, -32768,  101, 1852,  385,  127,
			 -32768,   67,  418, -32768, -32768,  340,  371, -32768,  261, -32768,
			 1443, -32768,   88, -32768,  421,  841,  413, -32768, -32768, -32768,
			 -32768,  411, -32768, 1852,  385,   58, -32768,  101,  389, -32768,
			 1852,  385, 1443,  755, -32768, -32768,  385, -32768,  602,  385,

			 -32768,  421,  407, -32768, -32768, -32768,   76, -32768,  401, -32768,
			 1443, -32768,  275,  389, 1443,  101, -32768,   67,   28,  301,
			 -32768, 1443, 1443, -32768,  293,   18,  669,  210,  101,  537,
			 -32768,  347, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  381,  275,  385, -32768,  385,  385,  101, -32768,
			 -32768, -32768, -32768,  384,  283, 1744,  284,  277, 1684, 1603,
			  362, 1852, -32768,  389, -32768, -32768,  -61, -32768,  373,  -61,
			   67,  249, -32768, 1443, -32768,  338, -32768,  602, 1443, 1443,
			  323,  314,  275,  275, -32768, -32768, -32768,  210,  188,  234,
			  403,  250,  209, -32768,  189, -32768,   50,  215,  111, -32768,

			 -32768, -32768,  100, 1580, -32768, -32768, 1895, 1895, -32768, -32768,
			  196,  187,  -61,   67,   28, -32768, -32768, -32768,  -12, -32768,
			  110, -32768,  159,  403, -32768, 1443,   36, -32768, 1852, -32768,
			  210, -32768, -32768, -32768, -32768,  -35,  403, -32768,  403, -32768,
			  -15, 1895,  -71, 1443, -32768,  -61, -32768, -32768, -32768, -32768,
			 -32768, 1443, 1496, -32768, -32768, 1895, -32768,   22, -32768,   10,
			 -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -179,  167,  -29, -182, -111,   11,   -1, -130,  -51,  -65,
			 -345,   45,  -17, -400,   65, -321, -484, -32768, -32768, -156,
			  424, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -103, -32768, -32768, -310,    3, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -116,  105, -292, -327,   14,   69, -124, -258, -137, -129,
			  115,  134, -32768, -205,   61, -500,  427, -32768, -32768, -109,
			  457, -220,  455,  330,  452, -215, -32768,  226, -32768,  551,
			 -32768, -32768, -32768,  471,  450, -32768, -126, -32768, -32768, -32768,
			  496,  490,  486, -32768,  451,  449, -118, -119, -32768, -203,

			 -32768, -32768,  453,  441, -32768,  433, -32768, -32768,  264, -32768,
			 -32768,    7, -532, -32768, -32768,  -86, -101, -102, -32768, -32768,
			 -32768, -32768, -32768>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   38,  145,  297,  327,   39,  305,  217,  341,  202,  338,
			  660,  364,   37,  283,  528,   41,  335,  232,  222,  221,
			  233,  -53,  -53,  406,  212,  566,  216,  569,  -53,  209,
			  209,  213,  209,  -53,  599,  102,  650,  601,  404,  637,
			  651,  -53,   32,   31,  658,  350,   52,  296,  659,  277,
			   51,  148,  120,   86,   85,   64,   50,   38,   38,   38,
			  434,   67,   39,   67,   72,   73,   74,  287,   75,   37,
			   37,   37,   41,   41,   41,  152,  564,  504,  151,    1,
			  634,   49,  234,   32,   31,   94,  460,  612,  150,  217,
			  643,   83,  426,  528,  114,  336,  362,  636,  337,  503,

			  636,  449,  116,   95,  117,  117,  340,  339,  332,   32,
			   31,   32,   31,  653,  209,  638,  363,  443,  393,  116,
			  349,  131,  365,  167,  196,  351,  352,  201,  399,  205,
			  645,  391,  467,  499,  563,  167,  167,  167,  167,   57,
			   93,   32,   31,  580,  405,  386,  478,   32,   31,  298,
			  116,  323,  235,   32,   31,  167,   32,   31,  546,  547,
			   56,  282,  628,  346,  -53,  -53,   32,   31,  477,  627,
			  306,  137,  167,  167,  136,  290,  -53,  151,  560,  425,
			  489,  639,  610,  611,  -53,  296,  203,  150,  206,  400,
			  196,  548,  135,  134,  147,  505,  324,  133,  427,  488,

			  487,  132,  286,  285,  217,  413,  442,  585,  325,  633,
			   32,   31,  412,  394,  549,  296,  395,  597,  632,  388,
			  167,  418,   55,  398,  397,  209,  389,  213,  630,  604,
			  431,  -45,   86,   85,  509,  511,  288,  629,  291,  292,
			  293,  294,  295,   54,  625,  -45,  -53,  -53,  624,  -45,
			   84,  302,  551,  -53, -122,  -45,  584, -122,  -53,   32,
			   31,   30,  -45,  284,  131,  623,  -53, -122,  564,  616,
			  574,  423,  621,  331,  424,   32,   31,  422,  421,  484,
			  -45,  348,  479,  506,  167,  167,  646,  483,   32,   31,
			 -122, -122,  648,  613,  151,  438,  200,  199,  439,  456,

			  437,  436,  616,  360,  150,  654,  458,  196,  554,  408,
			  462,  657,  448,  463,  457,  616,  152,  616,  208,  151,
			  207,  552,  466,  465,  469,  471,  456,   32,   31,  150,
			  151,  167,  167,  167,  403,  402,  609,  279,  557,  481,
			  150,  486,  482,  278,  568,  608,  131,  502,  167,  353,
			  571,  348,   32,   31,  508,   86,   85,  204,  598,  512,
			  605,  358,  543,   32,   31,   32,   31,  574,  573,  572,
			  387,  366,  367,  368,  369,  370,  371,  372,  373,  374,
			  375,  376,  377,  378,  380,  381,  383,  384,  385,  579,
			  578,  602,  -54,  -54,   82,  600,   81,  121,  359,  -54,

			  454,  589,  323,  587,  -54,  348,  586,  581,  475,  582,
			  583,  561,  -54,  127,  334,   99,  433,  310,  309,  308,
			  307,  306,  299,  550,  454,  454,  126,  447,  415,  545,
			  348,  490,  196,  500,  635,  495,   95,  461,  125,  446,
			  480,  454,  450,  429,  416,  348,  493,  417,  464,  594,
			  441,  440,  428,  133,   91,  124,  196,  196,  420,  472,
			  519,  614,  181,  493,  493,  419,  414,   33,   32,   31,
			   30,  474,  410,  196,  617,  472,  358,   77,  196,  409,
			  401,  493,  135,  396,  392,   99,  344,  355,  342,  329,
			  472,  330,  132,    8,  328,  196,  196,  501,   57,   55,

			  136,  529,  301,  225,  507,  200,  199,  617,  300,  472,
			   91,  198,  149,  196,  146,  103,  113,  108,  556,  172,
			  617,  514,  617,   79,   60,   63,   62,   65,  565,  196,
			  565,  570,   61,   58,    1,  647,  649,  640,  123,  577,
			 -325,  345,  107,  119,  111,  110,   71,  112,   68,   87,
			 -325,  472, -325,   48, -325,   70,  390, -325, -325, -325,
			 -325,  343,  451,  141,  468, -325,  140, -325,  139,  230,
			  544, -325, -325,  485,  622,  595,  276,  576,  432,  555,
			  529,    0,    0, -325, -325,    0,  558,  559,    0,  615,
			  565, -325, -325, -325, -325, -325, -325,    0,    0,    0,

			    0,    0, -325, -325,    0,  527,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  526,    0,  525,    0,  524,
			    0,    0,  615,    0,    0,    0,    0,    0,  642,    0,
			  523,    0,  522,  565,    0,  615,  521,  615,  603,    0,
			    0,    0,  644,  606,  607,    0,    0,    0,    0,  520,
			    0,    0, -325, -325,    0,  296,    0, -325, -325,  519,
			  518,  517,    0,  323,    0,    0,    0,   32,   31,    0,
			    0,    0,    0,    0,    0,  186,  312,  311,  310,  309,
			  308,  307,  306,    0,  185,    0,    0,    0,  323,    0,
			  641,  567,  321,  320,  319,  318,  317,  316,  315,  314,

			  313,  312,  311,  310,  309,  308,  307,  306,  652,    0,
			    0,    0,    0,    0,    0,    0,  655,  516,  515,  184,
			  514,    0,  513,    0,    0,    0,  183,  182,  181,    0,
			  180,   35,   34,   33,   32,   31,  179,   29,   28,   27,
			   26,   25,   24,   23,   22,   21,   20,   19,   18,   17,
			   16,   15,   14,   13,   12,   11,   10,  178,  177,    8,
			    7,  186,    0,    0,    0,    0,    0,    0,    0,    0,
			  185,  176,  175,    0,    0,    0,    0,    0,  174,  173,
			    0,    0,    0,    0,    0,  172,    0,  171,    0,    0,
			    0,  170,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,  184,    0,    0,    0,    0,
			    0,    0,  183,  182,  181,    0,  180,   35,   34,   33,
			   32,   31,  179,   29,   28,   27,   26,   25,   24,   23,
			   22,   21,   20,   19,   18,   17,   16,   15,   14,   13,
			   12,   11,   10,  178,  177,    8,    7,  186,    0,    0,
			    0,    0,    0,    0,    0,    0,  185,  176,  175,    0,
			    0,    0,    0,    0,  174,  173,    0,    0,    0,    0,
			  510,  172,    0,  171,    0,    0,    0,  170,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  184,  492,    0,    0,    0,    0,    0,  183,  182,

			  181,    0,  180,   35,   34,   33,   32,   31,  179,   29,
			   28,   27,   26,   25,   24,   23,   22,   21,   20,   19,
			   18,   17,   16,   15,   14,   13,   12,   11,   10,  178,
			  177,    8,    7,  186,    0,    0,    0,    0,    0,    0,
			    0,    0,  185,  176,  175,    0,    0,    0,    0,    0,
			  174,  173,    0,    0,    0,    0,    0,  172,    0,  171,
			    0,    0,    0,  170,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  184,    0,    0,
			    0,    0,    0,    0,  183,  182,  181,    0,  180,   35,
			   34,   33,   32,   31,  179,   29,   28,   27,   26,   25,

			   24,   23,   22,   21,   20,   19,   18,   17,   16,   15,
			   14,   13,   12,   11,   10,  178,  177,    8,    7,  186,
			    0,    0,    0,    0,    0,    0,    0,    0,  185,  176,
			  175,    0,    0,  453,    0,    0,  174,  173,    0,    0,
			    0,    0,  470,  172,    0,  171,    0,    0,    0,  170,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  184,    0,    0,    0,    0,    0,    0,
			  183,  182,  181,    0,  180,   35,   34,   33,   32,   31,
			  179,   29,   28,   27,   26,   25,   24,   23,   22,   21,
			   20,   19,   18,   17,   16,   15,   14,   13,   12,   11,

			   10,  178,  177,    8,    7,  186,    0,    0,    0,    0,
			    0,    0,    0,    0,  185,  176,  175,    0,    0,  382,
			    0,    0,  174,  173,    0,    0,    0,    0,    0,  172,
			    0,  171,    0,    0,    0,  170,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  184,
			    0,    0,    0,    0,    0,    0,  183,  182,  181,    0,
			  180,   35,   34,   33,   32,   31,  179,   29,   28,   27,
			   26,   25,   24,   23,   22,   21,   20,   19,   18,   17,
			   16,   15,   14,   13,   12,   11,   10,  178,  177,    8,
			    7,  186,    0,    0,    0,    0,    0,    0,    0,    0,

			  185,  176,  175,    0,    0,    0,    0,    0,  174,  173,
			    0,    0,    0,    0,    0,  172,    0,  171,    0,    0,
			    0,  170,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  184,  379,    0,    0,    0,
			    0,    0,  183,  182,  181,    0,  180,   35,   34,   33,
			   32,   31,  179,   29,   28,   27,   26,   25,   24,   23,
			   22,   21,   20,   19,   18,   17,   16,   15,   14,   13,
			   12,   11,   10,  178,  177,    8,    7,  186,    0,    0,
			    0,    0,    0,    0,    0,    0,  185,  176,  175,    0,
			    0,    0,    0,    0,  174,  173,    0,    0,    0,    0,

			    0,  172,    0,  171,    0,    0,    0,  170,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  184,    0,    0,    0,    0,    0,    0,  183,  182,
			  181,    0,  180,   35,   34,   33,   32,   31,  179,   29,
			   28,   27,   26,   25,   24,   23,   22,   21,   20,   19,
			   18,   17,   16,   15,   14,   13,   12,   11,   10,  178,
			  177,    8,    7,  186,    0,    0,    0,    0,    0,    0,
			    0,    0,  185,  176,  175,    0,    0,    0,    0,    0,
			  174,  173,    0,    0,    0,    0,    0,  172,    0,  171,
			  356,    0,    0,  170,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,  184,    0,    0,
			    0,    0,    0,    0,  183,  182,  181,    0,  180,   35,
			   34,   33,   32,   31,  179,   29,   28,   27,   26,   25,
			   24,   23,   22,   21,   20,   19,   18,   17,   16,   15,
			   14,   13,   12,   11,   10,  178,  177,    8,    7,  186,
			    0,    0,    0,    0,    0,    0,    0,    0,  185,  176,
			  175,    0,    0,    0,    0,    0,  174,  173,    0,    0,
			    0,    0,  304,  172,    0,  171,    0,    0,    0,  170,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  184,    0,    0,    0,    0,    0,    0,

			  183,  182,  181,    0,  180,   35,   34,   33,   32,   31,
			  179,   29,   28,   27,   26,   25,   24,   23,   22,   21,
			   20,   19,   18,   17,   16,   15,   14,   13,   12,   11,
			   10,  178,  177,    8,    7,  656,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  176,  175,    0,    0,    0,
			    0,    0,  174,  173,    0,    0,    0,    0,    0,  172,
			    0,  171,    0,  323,    0,  170,  322,  321,  320,  319,
			  318,  317,  316,  315,  314,  313,  312,  311,  310,  309,
			  308,  307,  306,    0,    0,  323,  411,    0,  322,  321,
			  320,  319,  318,  317,  316,  315,  314,  313,  312,  311,

			  310,  309,  308,  307,  306,   77,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  445,    0,
			    0,    0,    0,    0,    0,    0,  444,   35,   34,   33,
			    0,  631,   30,   29,   28,   27,   26,   25,   24,   23,
			   22,   21,   20,   19,   18,   17,   16,   15,   14,   13,
			   12,   11,   10,    9,  593,    8,    7,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    6,    5,  323,
			    0,    0,  322,  321,  320,  319,  318,  317,  316,  315,
			  314,  313,  312,  311,  310,  309,  308,  307,  306,    0,
			    0,    0,  323,    0,    0,  322,  321,  320,  319,  318,

			  317,  316,  315,  314,  313,  312,  311,  310,  309,  308,
			  307,  306,   36,   35,   34,   33,   32,   31,   30,   29,
			   28,   27,   26,   25,   24,   23,   22,   21,   20,   19,
			   18,   17,   16,   15,   14,   13,   12,   11,   10,    9,
			  590,    8,    7,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    6,    5,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   69,    0,    0,    0,
			    0,    0,    0,  323,    0,    0,  322,  321,  320,  319,
			  318,  317,  316,  315,  314,  313,  312,  311,  310,  309,
			  308,  307,  306,   36,   35,   34,   33,   32,   31,   30,

			   29,   28,   27,   26,   25,   24,   23,   22,   21,   20,
			   19,   18,   17,   16,   15,   14,   13,   12,   11,   10,
			    9,    0,    8,    7,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  323,    6,    5,  322,  321,  320,  319,
			  318,  317,  316,  315,  314,  313,  312,  311,  310,  309,
			  308,  307,  306,    0,    0,    0,    0,    0,    0,    0,
			    0,  323,    0,  588,  322,  321,  320,  319,  318,  317,
			  316,  315,  314,  313,  312,  311,  310,  309,  308,  307,
			  306,    0,    0,    0,    0,    0,    0,    0,    0,  323,
			    0,  407,  322,  321,  320,  319,  318,  317,  316,  315,

			  314,  313,  312,  311,  310,  309,  308,  307,  306,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  354,
			   29,   28,   27,   26,   25,   24,   23,   22,   21,   20,
			   19,   18,   17,   16,   15,   14,   13,   12,   11,   10,
			    0,    0,    0,    7,  275,  274,  273,  272,  271,  270,
			  269,  268,  267,  266,  265,  264,  263,  262,  261,  260,
			  259,  258,  257,  256,  255,  254,  253,  252,  251,  250,
			  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,
			  239,  238,  237,  236,  323,    0,    0,  322,  321,  320,
			  319,  318,  317,  316,  315,  314,  313,  312,  311,  310,

			  309,  308,  307,  306,  323,    0,    0,    0,    0,    0,
			  319,  318,  317,  316,  315,  314,  313,  312,  311,  310,
			  309,  308,  307,  306,  323,    0,    0,    0,    0,    0,
			    0,  318,  317,  316,  315,  314,  313,  312,  311,  310,
			  309,  308,  307,  306>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    1,  112,  181,  208,    1,  187,  136,  227,  124,  224,
			    0,    7,    1,  169,  498,    1,  219,  143,  137,  137,
			  144,   15,   16,  350,  133,  525,  135,  527,   22,  132,
			  133,  134,  135,   27,  566,   86,   51,  569,  348,   51,
			  111,   35,   65,   66,   22,   36,   14,  118,    0,  152,
			   18,  116,  103,   15,   16,   52,   24,   58,   59,   60,
			  121,   58,   59,   60,   61,   62,   63,  170,   65,   58,
			   59,   60,   58,   59,   60,   29,   58,   19,   32,   31,
			  612,   49,  147,   65,   66,   82,  121,  587,   42,  219,
			   54,   77,  402,  577,  117,  221,  301,  112,  222,   41,

			  112,  428,   99,   65,  101,  102,  225,  225,  217,   65,
			   66,   65,   66,  645,  217,    5,  112,  427,  338,  116,
			  111,  115,  304,  120,  121,  281,  282,  124,  343,  126,
			  630,  334,  442,  478,  116,  132,  133,  134,  135,   67,
			   79,   65,   66,  543,  349,  324,   19,   65,   66,  121,
			  147,   89,  149,   65,   66,  152,   65,   66,  503,  504,
			   88,  115,  112,  119,   15,   16,   65,   66,   41,  119,
			  108,   22,  169,  170,   25,  172,   27,   32,  523,  399,
			  472,   22,  582,  583,   35,  118,  125,   42,  127,  345,
			  187,  115,   43,   44,  112,  487,  193,   48,  403,  111,

			  112,   52,   57,   58,  334,  112,  115,  552,  111,   22,
			   65,   66,  119,  339,  506,  118,  340,  562,   22,  328,
			  217,  121,   67,  342,  342,  328,  329,  330,  117,  574,
			  409,    0,   15,   16,  492,  493,  171,   22,  173,  174,
			  175,  176,  177,   88,   55,   14,   15,   16,  593,   18,
			   33,  186,  510,   22,   29,   24,  548,   32,   27,   65,
			   66,   67,   31,  118,  115,   56,   35,   42,   58,  590,
			   20,  397,   22,   11,  398,   65,   66,  396,  396,   18,
			   49,  278,  461,  488,  281,  282,  631,   26,   65,   66,
			   65,   66,  637,   59,   32,  421,  102,  103,  422,   38,

			  419,  419,  623,  300,   42,  650,   18,  304,  513,  121,
			  436,  656,  428,  437,   26,  636,   29,  638,  112,   32,
			  114,   46,  441,  441,  453,  454,   38,   65,   66,   42,
			   32,  328,  329,  330,  111,  112,   22,  112,  517,  465,
			   42,  470,  466,  118,  526,   22,  115,  484,  345,  284,
			  529,  348,   65,   66,  491,   15,   16,   57,  563,  496,
			   22,  296,  499,   65,   66,   65,   66,   20,   21,   22,
			  121,  306,  307,  308,  309,  310,  311,  312,  313,  314,
			  315,  316,  317,  318,  319,  320,  321,  322,  323,    8,
			    9,  570,   15,   16,  112,   22,  114,   35,  121,   22,

			  429,  117,   89,  120,   27,  402,   22,  544,   23,  546,
			  547,  118,   35,   24,  115,  116,  413,  104,  105,  106,
			  107,  108,  121,   22,  453,  454,   37,  428,  363,   22,
			  427,   10,  429,   22,  613,   22,   65,  434,   49,  428,
			   22,  470,  428,   45,  379,  442,  475,  382,   22,  560,
			   22,   22,   36,   48,   65,   66,  453,  454,   22,  456,
			   57,   58,   59,  492,  493,   22,  117,   64,   65,   66,
			   67,  457,  119,  470,  590,  472,  411,   40,  475,   59,
			  119,  510,   43,   22,   22,  116,   22,  117,   22,   12,
			  487,  112,   52,   90,  112,  492,  493,  483,   67,   67,

			   25,  498,  116,   22,  490,  102,  103,  623,  118,  506,
			   65,   22,  112,  510,  117,   27,   22,  113,  515,  116,
			  636,  118,  638,    4,  112,   14,   14,  113,  525,  526,
			  527,  528,   14,  111,   31,  636,  638,  623,  105,  532,
			    3,  277,   89,  102,   95,   94,   60,   97,   58,   78,
			   13,  548,   15,    2,   17,   59,  330,   20,   21,   22,
			   23,  231,  428,  111,  449,   28,  111,   30,  111,  142,
			  501,   34,   35,  468,  591,  561,  152,  532,  411,  514,
			  577,   -1,   -1,   46,   47,   -1,  521,  522,   -1,  590,
			  587,   54,   55,   56,   57,   58,   59,   -1,   -1,   -1,

			   -1,   -1,   65,   66,   -1,    3,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   13,   -1,   15,   -1,   17,
			   -1,   -1,  623,   -1,   -1,   -1,   -1,   -1,  625,   -1,
			   28,   -1,   30,  630,   -1,  636,   34,  638,  573,   -1,
			   -1,   -1,  628,  578,  579,   -1,   -1,   -1,   -1,   47,
			   -1,   -1,  115,  116,   -1,  118,   -1,  120,  121,   57,
			   58,   59,   -1,   89,   -1,   -1,   -1,   65,   66,   -1,
			   -1,   -1,   -1,   -1,   -1,    6,  102,  103,  104,  105,
			  106,  107,  108,   -1,   15,   -1,   -1,   -1,   89,   -1,
			  625,   22,   93,   94,   95,   96,   97,   98,   99,  100,

			  101,  102,  103,  104,  105,  106,  107,  108,  643,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  651,  115,  116,   50,
			  118,   -1,  120,   -1,   -1,   -1,   57,   58,   59,   -1,
			   61,   62,   63,   64,   65,   66,   67,   68,   69,   70,
			   71,   72,   73,   74,   75,   76,   77,   78,   79,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,    6,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   15,  102,  103,   -1,   -1,   -1,   -1,   -1,  109,  110,
			   -1,   -1,   -1,   -1,   -1,  116,   -1,  118,   -1,   -1,
			   -1,  122,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   -1,   -1,   -1,   50,   -1,   -1,   -1,   -1,
			   -1,   -1,   57,   58,   59,   -1,   61,   62,   63,   64,
			   65,   66,   67,   68,   69,   70,   71,   72,   73,   74,
			   75,   76,   77,   78,   79,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,    6,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   15,  102,  103,   -1,
			   -1,   -1,   -1,   -1,  109,  110,   -1,   -1,   -1,   -1,
			  115,  116,   -1,  118,   -1,   -1,   -1,  122,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   50,   51,   -1,   -1,   -1,   -1,   -1,   57,   58,

			   59,   -1,   61,   62,   63,   64,   65,   66,   67,   68,
			   69,   70,   71,   72,   73,   74,   75,   76,   77,   78,
			   79,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,    6,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   15,  102,  103,   -1,   -1,   -1,   -1,   -1,
			  109,  110,   -1,   -1,   -1,   -1,   -1,  116,   -1,  118,
			   -1,   -1,   -1,  122,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,   -1,   -1,
			   -1,   -1,   -1,   -1,   57,   58,   59,   -1,   61,   62,
			   63,   64,   65,   66,   67,   68,   69,   70,   71,   72,

			   73,   74,   75,   76,   77,   78,   79,   80,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,    6,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   15,  102,
			  103,   -1,   -1,   20,   -1,   -1,  109,  110,   -1,   -1,
			   -1,   -1,  115,  116,   -1,  118,   -1,   -1,   -1,  122,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   50,   -1,   -1,   -1,   -1,   -1,   -1,
			   57,   58,   59,   -1,   61,   62,   63,   64,   65,   66,
			   67,   68,   69,   70,   71,   72,   73,   74,   75,   76,
			   77,   78,   79,   80,   81,   82,   83,   84,   85,   86,

			   87,   88,   89,   90,   91,    6,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   15,  102,  103,   -1,   -1,   20,
			   -1,   -1,  109,  110,   -1,   -1,   -1,   -1,   -1,  116,
			   -1,  118,   -1,   -1,   -1,  122,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,
			   -1,   -1,   -1,   -1,   -1,   -1,   57,   58,   59,   -1,
			   61,   62,   63,   64,   65,   66,   67,   68,   69,   70,
			   71,   72,   73,   74,   75,   76,   77,   78,   79,   80,
			   81,   82,   83,   84,   85,   86,   87,   88,   89,   90,
			   91,    6,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   15,  102,  103,   -1,   -1,   -1,   -1,   -1,  109,  110,
			   -1,   -1,   -1,   -1,   -1,  116,   -1,  118,   -1,   -1,
			   -1,  122,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   50,   51,   -1,   -1,   -1,
			   -1,   -1,   57,   58,   59,   -1,   61,   62,   63,   64,
			   65,   66,   67,   68,   69,   70,   71,   72,   73,   74,
			   75,   76,   77,   78,   79,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,    6,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   15,  102,  103,   -1,
			   -1,   -1,   -1,   -1,  109,  110,   -1,   -1,   -1,   -1,

			   -1,  116,   -1,  118,   -1,   -1,   -1,  122,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   50,   -1,   -1,   -1,   -1,   -1,   -1,   57,   58,
			   59,   -1,   61,   62,   63,   64,   65,   66,   67,   68,
			   69,   70,   71,   72,   73,   74,   75,   76,   77,   78,
			   79,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   89,   90,   91,    6,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   15,  102,  103,   -1,   -1,   -1,   -1,   -1,
			  109,  110,   -1,   -1,   -1,   -1,   -1,  116,   -1,  118,
			  119,   -1,   -1,  122,   -1,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   50,   -1,   -1,
			   -1,   -1,   -1,   -1,   57,   58,   59,   -1,   61,   62,
			   63,   64,   65,   66,   67,   68,   69,   70,   71,   72,
			   73,   74,   75,   76,   77,   78,   79,   80,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,    6,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   15,  102,
			  103,   -1,   -1,   -1,   -1,   -1,  109,  110,   -1,   -1,
			   -1,   -1,  115,  116,   -1,  118,   -1,   -1,   -1,  122,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   50,   -1,   -1,   -1,   -1,   -1,   -1,

			   57,   58,   59,   -1,   61,   62,   63,   64,   65,   66,
			   67,   68,   69,   70,   71,   72,   73,   74,   75,   76,
			   77,   78,   79,   80,   81,   82,   83,   84,   85,   86,
			   87,   88,   89,   90,   91,   39,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,  102,  103,   -1,   -1,   -1,
			   -1,   -1,  109,  110,   -1,   -1,   -1,   -1,   -1,  116,
			   -1,  118,   -1,   89,   -1,  122,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,  107,  108,   -1,   -1,   89,  112,   -1,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,

			  104,  105,  106,  107,  108,   40,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   53,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   61,   62,   63,   64,
			   -1,   51,   67,   68,   69,   70,   71,   72,   73,   74,
			   75,   76,   77,   78,   79,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   51,   90,   91,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,  102,  103,   89,
			   -1,   -1,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,  104,  105,  106,  107,  108,   -1,
			   -1,   -1,   89,   -1,   -1,   92,   93,   94,   95,   96,

			   97,   98,   99,  100,  101,  102,  103,  104,  105,  106,
			  107,  108,   61,   62,   63,   64,   65,   66,   67,   68,
			   69,   70,   71,   72,   73,   74,   75,   76,   77,   78,
			   79,   80,   81,   82,   83,   84,   85,   86,   87,   88,
			   56,   90,   91,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,  102,  103,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  115,   -1,   -1,   -1,
			   -1,   -1,   -1,   89,   -1,   -1,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,  107,  108,   61,   62,   63,   64,   65,   66,   67,

			   68,   69,   70,   71,   72,   73,   74,   75,   76,   77,
			   78,   79,   80,   81,   82,   83,   84,   85,   86,   87,
			   88,   -1,   90,   91,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   89,  102,  103,   92,   93,   94,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,  107,  108,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   89,   -1,  119,   92,   93,   94,   95,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,  105,  106,  107,
			  108,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   89,
			   -1,  119,   92,   93,   94,   95,   96,   97,   98,   99,

			  100,  101,  102,  103,  104,  105,  106,  107,  108,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,  119,
			   68,   69,   70,   71,   72,   73,   74,   75,   76,   77,
			   78,   79,   80,   81,   82,   83,   84,   85,   86,   87,
			   -1,   -1,   -1,   91,   68,   69,   70,   71,   72,   73,
			   74,   75,   76,   77,   78,   79,   80,   81,   82,   83,
			   84,   85,   86,   87,   68,   69,   70,   71,   72,   73,
			   74,   75,   76,   77,   78,   79,   80,   81,   82,   83,
			   84,   85,   86,   87,   89,   -1,   -1,   92,   93,   94,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,

			  105,  106,  107,  108,   89,   -1,   -1,   -1,   -1,   -1,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,
			  105,  106,  107,  108,   89,   -1,   -1,   -1,   -1,   -1,
			   -1,   96,   97,   98,   99,  100,  101,  102,  103,  104,
			  105,  106,  107,  108>>)
		end

feature {NONE} -- Conversion

	yytype1 (v: ANY): ET_POSITION is
		require
			valid_type: yyis_type1 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type1 (v: ANY): BOOLEAN is
		local
			u: ET_POSITION
		do
			u ?= v
			Result := (u = v)
		end

	yytype2 (v: ANY): ET_BIT_CONSTANT is
		require
			valid_type: yyis_type2 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type2 (v: ANY): BOOLEAN is
		local
			u: ET_BIT_CONSTANT
		do
			u ?= v
			Result := (u = v)
		end

	yytype3 (v: ANY): ET_BOOLEAN_CONSTANT is
		require
			valid_type: yyis_type3 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type3 (v: ANY): BOOLEAN is
		local
			u: ET_BOOLEAN_CONSTANT
		do
			u ?= v
			Result := (u = v)
		end

	yytype4 (v: ANY): ET_CHARACTER_CONSTANT is
		require
			valid_type: yyis_type4 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type4 (v: ANY): BOOLEAN is
		local
			u: ET_CHARACTER_CONSTANT
		do
			u ?= v
			Result := (u = v)
		end

	yytype5 (v: ANY): ET_IDENTIFIER is
		require
			valid_type: yyis_type5 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type5 (v: ANY): BOOLEAN is
		local
			u: ET_IDENTIFIER
		do
			u ?= v
			Result := (u = v)
		end

	yytype6 (v: ANY): ET_INTEGER_CONSTANT is
		require
			valid_type: yyis_type6 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type6 (v: ANY): BOOLEAN is
		local
			u: ET_INTEGER_CONSTANT
		do
			u ?= v
			Result := (u = v)
		end

	yytype7 (v: ANY): ET_MANIFEST_STRING is
		require
			valid_type: yyis_type7 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type7 (v: ANY): BOOLEAN is
		local
			u: ET_MANIFEST_STRING
		do
			u ?= v
			Result := (u = v)
		end

	yytype8 (v: ANY): ET_REAL_CONSTANT is
		require
			valid_type: yyis_type8 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type8 (v: ANY): BOOLEAN is
		local
			u: ET_REAL_CONSTANT
		do
			u ?= v
			Result := (u = v)
		end

	yytype9 (v: ANY): ET_TOKEN is
		require
			valid_type: yyis_type9 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type9 (v: ANY): BOOLEAN is
		local
			u: ET_TOKEN
		do
			u ?= v
			Result := (u = v)
		end

	yytype10 (v: ANY): ET_ACTUAL_ARGUMENTS is
		require
			valid_type: yyis_type10 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type10 (v: ANY): BOOLEAN is
		local
			u: ET_ACTUAL_ARGUMENTS
		do
			u ?= v
			Result := (u = v)
		end

	yytype11 (v: ANY): ET_ASSERTION is
		require
			valid_type: yyis_type11 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type11 (v: ANY): BOOLEAN is
		local
			u: ET_ASSERTION
		do
			u ?= v
			Result := (u = v)
		end

	yytype12 (v: ANY): ET_ASSERTIONS is
		require
			valid_type: yyis_type12 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type12 (v: ANY): BOOLEAN is
		local
			u: ET_ASSERTIONS
		do
			u ?= v
			Result := (u = v)
		end

	yytype13 (v: ANY): ET_CLIENTS is
		require
			valid_type: yyis_type13 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type13 (v: ANY): BOOLEAN is
		local
			u: ET_CLIENTS
		do
			u ?= v
			Result := (u = v)
		end

	yytype14 (v: ANY): ET_COMPOUND is
		require
			valid_type: yyis_type14 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type14 (v: ANY): BOOLEAN is
		local
			u: ET_COMPOUND
		do
			u ?= v
			Result := (u = v)
		end

	yytype15 (v: ANY): ET_EXPRESSION is
		require
			valid_type: yyis_type15 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type15 (v: ANY): BOOLEAN is
		local
			u: ET_EXPRESSION
		do
			u ?= v
			Result := (u = v)
		end

	yytype16 (v: ANY): ET_FEATURE is
		require
			valid_type: yyis_type16 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type16 (v: ANY): BOOLEAN is
		local
			u: ET_FEATURE
		do
			u ?= v
			Result := (u = v)
		end

	yytype17 (v: ANY): ET_FEATURE_NAME is
		require
			valid_type: yyis_type17 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type17 (v: ANY): BOOLEAN is
		local
			u: ET_FEATURE_NAME
		do
			u ?= v
			Result := (u = v)
		end

	yytype18 (v: ANY): ET_FORMAL_ARGUMENTS is
		require
			valid_type: yyis_type18 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type18 (v: ANY): BOOLEAN is
		local
			u: ET_FORMAL_ARGUMENTS
		do
			u ?= v
			Result := (u = v)
		end

	yytype19 (v: ANY): ET_IF_INSTRUCTION is
		require
			valid_type: yyis_type19 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type19 (v: ANY): BOOLEAN is
		local
			u: ET_IF_INSTRUCTION
		do
			u ?= v
			Result := (u = v)
		end

	yytype20 (v: ANY): ET_INSTRUCTION is
		require
			valid_type: yyis_type20 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type20 (v: ANY): BOOLEAN is
		local
			u: ET_INSTRUCTION
		do
			u ?= v
			Result := (u = v)
		end

	yytype21 (v: ANY): ET_LOCAL_VARIABLES is
		require
			valid_type: yyis_type21 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type21 (v: ANY): BOOLEAN is
		local
			u: ET_LOCAL_VARIABLES
		do
			u ?= v
			Result := (u = v)
		end

	yytype22 (v: ANY): ET_PARENTS is
		require
			valid_type: yyis_type22 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type22 (v: ANY): BOOLEAN is
		local
			u: ET_PARENTS
		do
			u ?= v
			Result := (u = v)
		end

	yytype23 (v: ANY): ET_POSTCONDITIONS is
		require
			valid_type: yyis_type23 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type23 (v: ANY): BOOLEAN is
		local
			u: ET_POSTCONDITIONS
		do
			u ?= v
			Result := (u = v)
		end

	yytype24 (v: ANY): ET_PRECONDITIONS is
		require
			valid_type: yyis_type24 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type24 (v: ANY): BOOLEAN is
		local
			u: ET_PRECONDITIONS
		do
			u ?= v
			Result := (u = v)
		end

	yytype25 (v: ANY): ET_RENAME is
		require
			valid_type: yyis_type25 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type25 (v: ANY): BOOLEAN is
		local
			u: ET_RENAME
		do
			u ?= v
			Result := (u = v)
		end

	yytype26 (v: ANY): ET_TYPE is
		require
			valid_type: yyis_type26 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type26 (v: ANY): BOOLEAN is
		local
			u: ET_TYPE
		do
			u ?= v
			Result := (u = v)
		end

	yytype27 (v: ANY): ET_WRITABLE is
		require
			valid_type: yyis_type27 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type27 (v: ANY): BOOLEAN is
		local
			u: ET_WRITABLE
		do
			u ?= v
			Result := (u = v)
		end

	yytype28 (v: ANY): like new_export_list is
		require
			valid_type: yyis_type28 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type28 (v: ANY): BOOLEAN is
		local
			u: like new_export_list
		do
			u ?= v
			Result := (u = v)
		end

	yytype29 (v: ANY): like new_feature_list is
		require
			valid_type: yyis_type29 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type29 (v: ANY): BOOLEAN is
		local
			u: like new_feature_list
		do
			u ?= v
			Result := (u = v)
		end

	yytype30 (v: ANY): like new_rename_list is
		require
			valid_type: yyis_type30 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type30 (v: ANY): BOOLEAN is
		local
			u: like new_rename_list
		do
			u ?= v
			Result := (u = v)
		end


feature {NONE} -- Constants

	yyFinal: INTEGER is 660
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 123
			-- Number of tokens

	yyLast: INTEGER is 2043
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 357
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 246
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end -- class ET_EIFFEL_PARSER
