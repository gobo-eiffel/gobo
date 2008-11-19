#include "gexace.h"

#ifdef __cplusplus
extern "C" {
#endif

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_debug */
T0* T77f137(T0* C)
{
	T0* R = 0;
	if (ge1279os2509) {
		return ge1279ov2509;
	} else {
		ge1279os2509 = '\1';
		ge1279ov2509 = R;
	}
	R = GE_ms8("debug", 5);
	ge1279ov2509 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_optimize */
T0* T77f136(T0* C)
{
	T0* R = 0;
	if (ge1279os2510) {
		return ge1279ov2510;
	} else {
		ge1279os2510 = '\1';
		ge1279ov2510 = R;
	}
	R = GE_ms8("optimize", 8);
	ge1279ov2510 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_check */
T0* T77f134(T0* C)
{
	T0* R = 0;
	if (ge1279os2508) {
		return ge1279ov2508;
	} else {
		ge1279os2508 = '\1';
		ge1279ov2508 = R;
	}
	R = GE_ms8("check", 5);
	ge1279ov2508 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_loop */
T0* T77f131(T0* C)
{
	T0* R = 0;
	if (ge1279os2507) {
		return ge1279ov2507;
	} else {
		ge1279os2507 = '\1';
		ge1279ov2507 = R;
	}
	R = GE_ms8("loop", 4);
	ge1279ov2507 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_invariant */
T0* T77f129(T0* C)
{
	T0* R = 0;
	if (ge1279os2506) {
		return ge1279ov2506;
	} else {
		ge1279os2506 = '\1';
		ge1279ov2506 = R;
	}
	R = GE_ms8("invariant", 9);
	ge1279ov2506 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_ensure */
T0* T77f127(T0* C)
{
	T0* R = 0;
	if (ge1279os2505) {
		return ge1279ov2505;
	} else {
		ge1279os2505 = '\1';
		ge1279ov2505 = R;
	}
	R = GE_ms8("ensure", 6);
	ge1279ov2505 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_enable */
T0* T77f125(T0* C)
{
	T0* R = 0;
	if (ge1279os2503) {
		return ge1279ov2503;
	} else {
		ge1279os2503 = '\1';
		ge1279ov2503 = R;
	}
	R = GE_ms8("enable", 6);
	ge1279ov2503 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_require */
T0* T77f124(T0* C)
{
	T0* R = 0;
	if (ge1279os2504) {
		return ge1279ov2504;
	} else {
		ge1279os2504 = '\1';
		ge1279ov2504 = R;
	}
	R = GE_ms8("require", 7);
	ge1279ov2504 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.is_false */
T1 T77f123(T0* C, T0* a1)
{
	T0* t1;
	T1 R = 0;
	t1 = (T77f19(C));
	R = (T47f11(GE_void(t1), a1, ge1282ov4224));
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.is_true */
T1 T77f122(T0* C, T0* a1)
{
	T0* t1;
	T1 R = 0;
	t1 = (T77f19(C));
	R = (T47f11(GE_void(t1), a1, ge1282ov4223));
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.option_codes */
T0* T77f29(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge1251os4412) {
		return ge1251ov4412;
	} else {
		ge1251os4412 = '\1';
		ge1251ov4412 = R;
	}
	R = T150c35((T6)(GE_int32(93)));
	ge1251ov4412 = R;
	t1 = (T77f13(C));
	T150f37(GE_void(R), t1);
	T150f38(GE_void(R), (T6)(GE_int32(1)), ge1251ov4226);
	T150f38(GE_void(R), (T6)(GE_int32(2)), ge1251ov4227);
	T150f38(GE_void(R), (T6)(GE_int32(3)), ge1251ov4228);
	T150f38(GE_void(R), (T6)(GE_int32(4)), ge1251ov4229);
	T150f38(GE_void(R), (T6)(GE_int32(5)), ge1251ov4230);
	T150f38(GE_void(R), (T6)(GE_int32(6)), ge1251ov4231);
	T150f38(GE_void(R), (T6)(GE_int32(7)), ge1251ov4232);
	T150f38(GE_void(R), (T6)(GE_int32(8)), ge1251ov4233);
	T150f38(GE_void(R), (T6)(GE_int32(9)), ge1251ov4234);
	T150f38(GE_void(R), (T6)(GE_int32(10)), ge1251ov4235);
	T150f38(GE_void(R), (T6)(GE_int32(11)), ge1251ov4236);
	T150f38(GE_void(R), (T6)(GE_int32(12)), ge1251ov4237);
	T150f38(GE_void(R), (T6)(GE_int32(13)), ge1251ov4238);
	T150f38(GE_void(R), (T6)(GE_int32(14)), ge1251ov4239);
	T150f38(GE_void(R), (T6)(GE_int32(15)), ge1251ov4240);
	T150f38(GE_void(R), (T6)(GE_int32(16)), ge1251ov4241);
	T150f38(GE_void(R), (T6)(GE_int32(17)), ge1251ov4242);
	T150f38(GE_void(R), (T6)(GE_int32(18)), ge1251ov4243);
	T150f38(GE_void(R), (T6)(GE_int32(19)), ge1251ov4244);
	T150f38(GE_void(R), (T6)(GE_int32(20)), ge1251ov4245);
	T150f38(GE_void(R), (T6)(GE_int32(21)), ge1251ov4246);
	T150f38(GE_void(R), (T6)(GE_int32(22)), ge1251ov4247);
	T150f38(GE_void(R), (T6)(GE_int32(23)), ge1251ov4248);
	T150f38(GE_void(R), (T6)(GE_int32(24)), ge1251ov4249);
	T150f38(GE_void(R), (T6)(GE_int32(25)), ge1251ov4250);
	T150f38(GE_void(R), (T6)(GE_int32(26)), ge1251ov4251);
	T150f38(GE_void(R), (T6)(GE_int32(27)), ge1251ov4252);
	T150f38(GE_void(R), (T6)(GE_int32(28)), ge1251ov4253);
	T150f38(GE_void(R), (T6)(GE_int32(29)), ge1251ov4254);
	T150f38(GE_void(R), (T6)(GE_int32(30)), ge1251ov4255);
	T150f38(GE_void(R), (T6)(GE_int32(31)), ge1251ov4256);
	T150f38(GE_void(R), (T6)(GE_int32(32)), ge1251ov4257);
	T150f38(GE_void(R), (T6)(GE_int32(33)), ge1251ov4258);
	T150f38(GE_void(R), (T6)(GE_int32(34)), ge1251ov4259);
	T150f38(GE_void(R), (T6)(GE_int32(35)), ge1251ov4260);
	T150f38(GE_void(R), (T6)(GE_int32(36)), ge1251ov4261);
	T150f38(GE_void(R), (T6)(GE_int32(37)), ge1251ov4262);
	T150f38(GE_void(R), (T6)(GE_int32(38)), ge1251ov4263);
	T150f38(GE_void(R), (T6)(GE_int32(39)), ge1251ov4264);
	T150f38(GE_void(R), (T6)(GE_int32(40)), ge1251ov4265);
	T150f38(GE_void(R), (T6)(GE_int32(41)), ge1251ov4266);
	T150f38(GE_void(R), (T6)(GE_int32(42)), ge1251ov4267);
	T150f38(GE_void(R), (T6)(GE_int32(43)), ge1251ov4268);
	T150f38(GE_void(R), (T6)(GE_int32(44)), ge1251ov4269);
	T150f38(GE_void(R), (T6)(GE_int32(45)), ge1251ov4270);
	T150f38(GE_void(R), (T6)(GE_int32(46)), ge1251ov4271);
	T150f38(GE_void(R), (T6)(GE_int32(47)), ge1251ov4272);
	T150f38(GE_void(R), (T6)(GE_int32(48)), ge1251ov4273);
	T150f38(GE_void(R), (T6)(GE_int32(49)), ge1251ov4274);
	T150f38(GE_void(R), (T6)(GE_int32(50)), ge1251ov4275);
	T150f38(GE_void(R), (T6)(GE_int32(51)), ge1251ov4276);
	T150f38(GE_void(R), (T6)(GE_int32(52)), ge1251ov4277);
	T150f38(GE_void(R), (T6)(GE_int32(53)), ge1251ov4278);
	T150f38(GE_void(R), (T6)(GE_int32(54)), ge1251ov4279);
	T150f38(GE_void(R), (T6)(GE_int32(55)), ge1251ov4280);
	T150f38(GE_void(R), (T6)(GE_int32(56)), ge1251ov4281);
	T150f38(GE_void(R), (T6)(GE_int32(57)), ge1251ov4282);
	T150f38(GE_void(R), (T6)(GE_int32(58)), ge1251ov4283);
	T150f38(GE_void(R), (T6)(GE_int32(59)), ge1251ov4284);
	T150f38(GE_void(R), (T6)(GE_int32(60)), ge1251ov4285);
	T150f38(GE_void(R), (T6)(GE_int32(61)), ge1251ov4286);
	T150f38(GE_void(R), (T6)(GE_int32(62)), ge1251ov4287);
	T150f38(GE_void(R), (T6)(GE_int32(63)), ge1251ov4288);
	T150f38(GE_void(R), (T6)(GE_int32(64)), ge1251ov4289);
	T150f38(GE_void(R), (T6)(GE_int32(65)), ge1251ov4290);
	T150f38(GE_void(R), (T6)(GE_int32(66)), ge1251ov4291);
	T150f38(GE_void(R), (T6)(GE_int32(67)), ge1251ov4292);
	T150f38(GE_void(R), (T6)(GE_int32(68)), ge1251ov4293);
	T150f38(GE_void(R), (T6)(GE_int32(69)), ge1251ov4294);
	T150f38(GE_void(R), (T6)(GE_int32(70)), ge1251ov4295);
	T150f38(GE_void(R), (T6)(GE_int32(71)), ge1251ov4296);
	T150f38(GE_void(R), (T6)(GE_int32(72)), ge1251ov4297);
	T150f38(GE_void(R), (T6)(GE_int32(73)), ge1251ov4298);
	T150f38(GE_void(R), (T6)(GE_int32(74)), ge1251ov4299);
	T150f38(GE_void(R), (T6)(GE_int32(75)), ge1251ov4300);
	T150f38(GE_void(R), (T6)(GE_int32(76)), ge1251ov4301);
	T150f38(GE_void(R), (T6)(GE_int32(77)), ge1251ov4302);
	T150f38(GE_void(R), (T6)(GE_int32(78)), ge1251ov4303);
	T150f38(GE_void(R), (T6)(GE_int32(79)), ge1251ov4304);
	T150f38(GE_void(R), (T6)(GE_int32(80)), ge1251ov4305);
	T150f38(GE_void(R), (T6)(GE_int32(81)), ge1251ov4306);
	T150f38(GE_void(R), (T6)(GE_int32(82)), ge1251ov4307);
	T150f38(GE_void(R), (T6)(GE_int32(83)), ge1251ov4308);
	T150f38(GE_void(R), (T6)(GE_int32(84)), ge1251ov4309);
	T150f38(GE_void(R), (T6)(GE_int32(85)), ge1251ov4310);
	T150f38(GE_void(R), (T6)(GE_int32(86)), ge1251ov4311);
	T150f38(GE_void(R), (T6)(GE_int32(87)), ge1251ov4312);
	T150f38(GE_void(R), (T6)(GE_int32(88)), ge1251ov4313);
	T150f38(GE_void(R), (T6)(GE_int32(89)), ge1251ov4314);
	T150f38(GE_void(R), (T6)(GE_int32(90)), ge1251ov4315);
	T150f38(GE_void(R), (T6)(GE_int32(91)), ge1251ov4316);
	T150f38(GE_void(R), (T6)(GE_int32(92)), ge1251ov4317);
	T150f38(GE_void(R), (T6)(GE_int32(93)), ge1251ov4318);
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.string_equality_tester */
T0* T77f13(T0* C)
{
	T0* R = 0;
	if (ge187os1792) {
		return ge187ov1792;
	} else {
		ge187os1792 = '\1';
		ge187ov1792 = R;
	}
	R = T25c3();
	ge187ov1792 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_value */
T0* T77f28(T0* C)
{
	T0* R = 0;
	if (ge1279os2494) {
		return ge1279ov2494;
	} else {
		ge1279os2494 = '\1';
		ge1279ov2494 = R;
	}
	R = GE_ms8("value", 5);
	ge1279ov2494 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_option */
T0* T77f25(T0* C)
{
	T0* R = 0;
	if (ge1279os2501) {
		return ge1279ov2501;
	} else {
		ge1279os2501 = '\1';
		ge1279ov2501 = R;
	}
	R = GE_ms8("option", 6);
	ge1279ov2501 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_mount */
T0* T77f24(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	t1 = (T77f139(C));
	t2 = (T91f15(GE_void(a1), t1));
	if (t2) {
		t1 = (T77f139(C));
		t1 = (T91f18(GE_void(a1), t1));
		l1 = (((T146*)(GE_void(t1)))->a3);
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			t1 = (T77f145(C));
			t2 = (T91f15(GE_void(a1), t1));
			if (t2) {
				t1 = (T77f145(C));
				t1 = (T91f18(GE_void(a1), t1));
				l3 = (((T146*)(GE_void(t1)))->a3);
			}
			T99f52(GE_void(((T77*)(C))->a10), l1);
			t2 = (T99f23(GE_void(((T77*)(C))->a10)));
			if (t2) {
				l2 = (T99f24(GE_void(((T77*)(C))->a10)));
			} else {
				l2 = (T89f5(GE_void(((T77*)(C))->a2)));
				T99f53(GE_void(((T77*)(C))->a10), l2, l1);
				t2 = ((T1)(!(((T77*)(C))->a3)));
				if (t2) {
					t3 = ((T1)(!(((T77*)(C))->a5)));
					if (!(t3)) {
						t3 = (((((T0*)(GE_void(l1)))->id==17)?T17f30(l1, GE_ms8("${VE_Lib}", 9)):T233f50(l1, GE_ms8("${VE_Lib}", 9))));
						t2 = ((T1)(!(t3)));
					} else {
						t2 = EIF_TRUE;
					}
				}
				if (t2) {
					t1 = (T77f147(C));
					l4 = (T132f2(GE_void(t1), l1));
					l5 = T79c36(l4);
					T79f38(GE_void(l5));
					t2 = (T79f11(GE_void(l5)));
					if (t2) {
						T82f255(GE_void(((T77*)(C))->a4), l2, l5, a3);
						T79f39(GE_void(l5));
					} else {
						T28f16(GE_void(((T77*)(C))->a11), l1);
					}
				}
			}
			t1 = (T92f2(GE_void(a2), a1));
			R = (T89f7(GE_void(((T77*)(C))->a2), l1, l2, t1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				T119f11(GE_void(R), l3);
			}
		}
	}
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.execution_environment */
T0* T77f147(T0* C)
{
	T0* R = 0;
	if (ge170os1795) {
		return ge170ov1795;
	} else {
		ge170os1795 = '\1';
		ge170ov1795 = R;
	}
	R = T132c5();
	ge170ov1795 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_prefix */
T0* T77f145(T0* C)
{
	T0* R = 0;
	if (ge1279os2499) {
		return ge1279ov2499;
	} else {
		ge1279os2499 = '\1';
		ge1279ov2499 = R;
	}
	R = GE_ms8("prefix", 6);
	ge1279ov2499 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_mount */
T0* T77f23(T0* C)
{
	T0* R = 0;
	if (ge1279os2497) {
		return ge1279ov2497;
	} else {
		ge1279os2497 = '\1';
		ge1279ov2497 = R;
	}
	R = GE_ms8("mount", 5);
	ge1279ov2497 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_cluster */
T0* T77f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T0* l12 = 0;
	T0* l13 = 0;
	t1 = (T77f15(C));
	t2 = (T91f15(GE_void(a1), t1));
	if (t2) {
		t1 = (T77f15(C));
		t1 = (T91f18(GE_void(a1), t1));
		l1 = (((T146*)(GE_void(t1)))->a3);
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			t3 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T233*)(l1))->a1));
			t2 = (T6f4(&t3, (T6)(GE_int32(0))));
			if (t2) {
				t1 = (T77f139(C));
				t2 = (T91f15(GE_void(a1), t1));
				if (t2) {
					t1 = (T77f139(C));
					t1 = (T91f18(GE_void(a1), t1));
					l2 = (((T146*)(GE_void(t1)))->a3);
				}
				R = (T89f6(GE_void(((T77*)(C))->a2), l1, l2, a4));
				t1 = (T77f143(C));
				t2 = (T91f15(GE_void(a1), t1));
				if (t2) {
					t1 = (T77f143(C));
					t4 = (T92f2(GE_void(a3), a1));
					T28f35(GE_void(((T77*)(C))->a11), a1, t1, GE_ms8("<option name=\"abstract\" value=\"true/false\"/>", 44), t4);
					t1 = (T77f143(C));
					t1 = (T91f18(GE_void(a1), t1));
					l3 = (((T146*)(GE_void(t1)))->a3);
					t2 = ((l3)!=(EIF_VOID));
					if (t2) {
						t2 = (T77f122(C, l3));
						if (t2) {
							t2 = ((l7)==(EIF_VOID));
							if (t2) {
								l7 = (T89f4(GE_void(((T77*)(C))->a2)));
							}
							T111f377(GE_void(l7), EIF_TRUE);
						} else {
							t2 = (T77f123(C, l3));
							if (t2) {
								t2 = ((l7)==(EIF_VOID));
								if (t2) {
									l7 = (T89f4(GE_void(((T77*)(C))->a2)));
								}
								T111f377(GE_void(l7), EIF_FALSE);
							}
						}
					}
				}
				t1 = (T77f144(C));
				t2 = (T91f15(GE_void(a1), t1));
				if (t2) {
					t1 = (T77f144(C));
					t1 = (T91f18(GE_void(a1), t1));
					l3 = (((T146*)(GE_void(t1)))->a3);
					t2 = ((l3)!=(EIF_VOID));
					if (t2) {
						t2 = (T77f122(C, l3));
						if (t2) {
							T117f32(GE_void(R), EIF_TRUE);
						} else {
							t2 = (T77f123(C, l3));
							if (t2) {
								T117f32(GE_void(R), EIF_FALSE);
							}
						}
					}
				}
				l12 = a2;
				t1 = (T77f145(C));
				t2 = (T91f15(GE_void(a1), t1));
				if (t2) {
					t1 = (T77f145(C));
					t1 = (T91f18(GE_void(a1), t1));
					l12 = (((T146*)(GE_void(t1)))->a3);
				}
				T117f33(GE_void(R), l12);
				l4 = (T91f21(GE_void(a1)));
				T147f10(GE_void(l4));
				while (1) {
					t2 = (((T147*)(GE_void(l4)))->a1);
					if (t2) {
						break;
					}
					t1 = (T147f8(GE_void(l4)));
					if ((t1)==EIF_VOID) {
						l5 = EIF_VOID;
					} else {
						switch (((T0*)(t1))->id) {
						case 91:
							l5 = t1;
							break;
						default:
							l5 = EIF_VOID;
						}
					}
					t2 = ((l5)!=(EIF_VOID));
					if (t2) {
						t1 = (T77f19(C));
						t4 = (((T91*)(GE_void(l5)))->a2);
						t5 = (T77f20(C));
						t2 = (T47f1(GE_void(t1), t4, t5));
						if (t2) {
							l6 = (T77f22(C, l5, l12, a3, a4));
							t2 = ((l6)!=(EIF_VOID));
							if (t2) {
								t2 = ((l9)==(EIF_VOID));
								if (t2) {
									l9 = (T89f2(GE_void(((T77*)(C))->a2), l6));
								} else {
									T109f6(GE_void(l9), l6);
								}
							}
						} else {
							t1 = (T77f19(C));
							t4 = (((T91*)(GE_void(l5)))->a2);
							t5 = (T77f23(C));
							t2 = (T47f1(GE_void(t1), t4, t5));
							if (t2) {
								t1 = (((T143*)(GE_void(a4)))->a1);
								l10 = (T77f24(C, l5, a3, t1));
								t2 = ((l10)!=(EIF_VOID));
								if (t2) {
									t2 = ((l11)==(EIF_VOID));
									if (t2) {
										l11 = (T89f3(GE_void(((T77*)(C))->a2)));
									}
									t1 = (((T119*)(GE_void(l10)))->a1);
									l13 = (T110f2(GE_void(l11), t1));
									t2 = ((l13)!=(EIF_VOID));
									if (t2) {
										t2 = (T119f7(GE_void(l10), l13));
										t2 = ((T1)(!(t2)));
										if (t2) {
											T28f20(GE_void(((T77*)(C))->a11), l10, l13);
										}
									} else {
										T110f6(GE_void(l11), l10);
									}
								}
							} else {
								t1 = (T77f19(C));
								t4 = (((T91*)(GE_void(l5)))->a2);
								t5 = (T77f25(C));
								t2 = (T47f1(GE_void(t1), t4, t5));
								if (t2) {
									t2 = ((l7)!=(EIF_VOID));
									if (t2) {
										T77f254(C, l7, l5, a3);
									} else {
										l7 = (T77f26(C, l5, a3));
									}
								} else {
									t1 = (T77f19(C));
									t4 = (((T91*)(GE_void(l5)))->a2);
									t5 = (T77f17(C));
									t2 = (T47f1(GE_void(t1), t4, t5));
									if (t2) {
										l8 = (T77f146(C, l5, a3));
										t2 = ((l8)!=(EIF_VOID));
										if (t2) {
											T117f34(GE_void(R), l8);
										}
									} else {
										t1 = (T77f19(C));
										t4 = (((T91*)(GE_void(l5)))->a2);
										t5 = (T77f27(C));
										t2 = (T47f1(GE_void(t1), t4, t5));
										if (t2) {
											t2 = ((l7)==(EIF_VOID));
											if (t2) {
												l7 = (T89f4(GE_void(((T77*)(C))->a2)));
											}
											T77f255(C, l7, R, l5, a3);
										}
									}
								}
							}
						}
					}
					T147f11(GE_void(l4));
				}
				t2 = ((l7)!=(EIF_VOID));
				if (t2) {
					t2 = (T111f204(GE_void(l7)));
					if (t2) {
						t2 = (T111f206(GE_void(l7)));
						T117f35(GE_void(R), t2);
					}
					t2 = (T111f208(GE_void(l7)));
					if (t2) {
						t2 = (T111f210(GE_void(l7)));
						T117f36(GE_void(R), t2);
					}
					t2 = (T111f212(GE_void(l7)));
					if (t2) {
						t2 = (T111f214(GE_void(l7)));
						T117f37(GE_void(R), t2);
					}
				}
				T117f38(GE_void(R), l7);
				T117f39(GE_void(R), l9);
				T117f40(GE_void(R), l11);
			}
		}
	}
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_class */
T0* T77f146(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	t1 = (T77f15(C));
	t2 = (T91f15(GE_void(a1), t1));
	if (t2) {
		t1 = (T77f15(C));
		t1 = (T91f18(GE_void(a1), t1));
		l1 = (((T146*)(GE_void(t1)))->a3);
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			t3 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T233*)(l1))->a1));
			t2 = (T6f4(&t3, (T6)(GE_int32(0))));
			if (t2) {
				l2 = (T89f4(GE_void(((T77*)(C))->a2)));
				R = (T89f8(GE_void(((T77*)(C))->a2), l1, l2));
				l3 = (T91f21(GE_void(a1)));
				T147f10(GE_void(l3));
				while (1) {
					t2 = (((T147*)(GE_void(l3)))->a1);
					if (t2) {
						break;
					}
					t1 = (T147f8(GE_void(l3)));
					if ((t1)==EIF_VOID) {
						l4 = EIF_VOID;
					} else {
						switch (((T0*)(t1))->id) {
						case 91:
							l4 = t1;
							break;
						default:
							l4 = EIF_VOID;
						}
					}
					t2 = ((l4)!=(EIF_VOID));
					if (t2) {
						t1 = (T77f19(C));
						t4 = (((T91*)(GE_void(l4)))->a2);
						t5 = (T77f25(C));
						t2 = (T47f1(GE_void(t1), t4, t5));
						if (t2) {
							T77f254(C, l2, l4, a2);
						} else {
							t1 = (T77f19(C));
							t4 = (((T91*)(GE_void(l4)))->a2);
							t5 = (T77f244(C));
							t2 = (T47f1(GE_void(t1), t4, t5));
							if (t2) {
								l5 = (T77f246(C, l4, a2));
								t2 = ((l5)!=(EIF_VOID));
								if (t2) {
									T122f5(GE_void(R), l5);
								}
							}
						}
					}
					T147f11(GE_void(l3));
				}
			}
		}
	}
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_feature */
T0* T77f246(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T77f15(C));
	t2 = (T91f15(GE_void(a1), t1));
	if (t2) {
		t1 = (T77f15(C));
		t1 = (T91f18(GE_void(a1), t1));
		l1 = (((T146*)(GE_void(t1)))->a3);
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			t3 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T233*)(l1))->a1));
			t2 = (T6f4(&t3, (T6)(GE_int32(0))));
			if (t2) {
				l2 = (T89f4(GE_void(((T77*)(C))->a2)));
				R = (T89f9(GE_void(((T77*)(C))->a2), l1, l2));
				l3 = (T91f21(GE_void(a1)));
				T147f10(GE_void(l3));
				while (1) {
					t2 = (((T147*)(GE_void(l3)))->a1);
					if (t2) {
						break;
					}
					t1 = (T147f8(GE_void(l3)));
					if ((t1)==EIF_VOID) {
						l4 = EIF_VOID;
					} else {
						switch (((T0*)(t1))->id) {
						case 91:
							l4 = t1;
							break;
						default:
							l4 = EIF_VOID;
						}
					}
					t2 = ((l4)!=(EIF_VOID));
					if (t2) {
						t1 = (T77f19(C));
						t4 = (((T91*)(GE_void(l4)))->a2);
						t5 = (T77f25(C));
						t2 = (T47f1(GE_void(t1), t4, t5));
						if (t2) {
							T77f254(C, l2, l4, a2);
						}
					}
					T147f11(GE_void(l3));
				}
			}
		}
	}
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_relative */
T0* T77f144(T0* C)
{
	T0* R = 0;
	if (ge1279os2496) {
		return ge1279ov2496;
	} else {
		ge1279os2496 = '\1';
		ge1279ov2496 = R;
	}
	R = GE_ms8("relative", 8);
	ge1279ov2496 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_abstract */
T0* T77f143(T0* C)
{
	T0* R = 0;
	if (ge1279os2495) {
		return ge1279ov2495;
	} else {
		ge1279os2495 = '\1';
		ge1279ov2495 = R;
	}
	R = GE_ms8("abstract", 8);
	ge1279ov2495 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_cluster */
T0* T77f20(T0* C)
{
	T0* R = 0;
	if (ge1279os2492) {
		return ge1279ov2492;
	} else {
		ge1279os2492 = '\1';
		ge1279ov2492 = R;
	}
	R = GE_ms8("cluster", 7);
	ge1279ov2492 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.string_ */
T0* T77f19(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_creation */
T0* T77f18(T0* C)
{
	T0* R = 0;
	if (ge1279os2490) {
		return ge1279ov2490;
	} else {
		ge1279os2490 = '\1';
		ge1279ov2490 = R;
	}
	R = GE_ms8("creation", 8);
	ge1279ov2490 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_class */
T0* T77f17(T0* C)
{
	T0* R = 0;
	if (ge1279os2489) {
		return ge1279ov2489;
	} else {
		ge1279os2489 = '\1';
		ge1279ov2489 = R;
	}
	R = GE_ms8("class", 5);
	ge1279ov2489 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_root */
T0* T77f16(T0* C)
{
	T0* R = 0;
	if (ge1279os2488) {
		return ge1279ov2488;
	} else {
		ge1279os2488 = '\1';
		ge1279ov2488 = R;
	}
	R = GE_ms8("root", 4);
	ge1279ov2488 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_name */
T0* T77f15(T0* C)
{
	T0* R = 0;
	if (ge1279os2493) {
		return ge1279ov2493;
	} else {
		ge1279os2493 = '\1';
		ge1279ov2493 = R;
	}
	R = GE_ms8("name", 4);
	ge1279ov2493 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.tokens */
T0* T77f14(T0* C)
{
	T0* R = 0;
	if (ge952os4442) {
		return ge952ov4442;
	} else {
		ge952os4442 = '\1';
		ge952ov4442 = R;
	}
	R = T142c149();
	ge952ov4442 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.set_ve */
void T77f250(T0* C, T1 a1)
{
	T1 t1;
	((T77*)(C))->a5 = a1;
	t1 = (((T82*)(GE_void(((T77*)(C))->a4)))->a3);
	t1 = (((((t1) != (a1)))));
	if (t1) {
		T82f248(GE_void(((T77*)(C))->a4), a1);
	}
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.set_shallow */
void T77f249(T0* C, T1 a1)
{
	T1 t1;
	((T77*)(C))->a3 = a1;
	t1 = (((T82*)(GE_void(((T77*)(C))->a4)))->a2);
	t1 = (((((t1) != (a1)))));
	if (t1) {
		T82f247(GE_void(((T77*)(C))->a4), a1);
	}
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.make_with_variables */
T0* T77c248(T0* a1, T0* a2)
{
	T0* C;
	C = GE_new77(EIF_TRUE);
	((T77*)(C))->a2 = T89c10();
	T77f252(C, a1, ((T77*)(C))->a2, a2);
	return C;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.make_with_variables_and_factory */
void T77f252(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	T0* l1 = 0;
	((T77*)(C))->a11 = a3;
	((T77*)(C))->a2 = a2;
	((T77*)(C))->a10 = T99c37((T6)(GE_int32(10)));
	t1 = (T77f13(C));
	T99f39(GE_void(((T77*)(C))->a10), t1);
	((T77*)(C))->a4 = EIF_VOID;
	t2 = ((((T77*)(C))->a4)==(EIF_VOID));
	if (t2) {
		((T77*)(C))->a4 = T82c250(a1, a2, a3);
		T82f251(GE_void(((T77*)(C))->a4), ((T77*)(C))->a10);
	}
	((T77*)(C))->a9 = T98c10(a1, ((T77*)(C))->a11);
	((T77*)(C))->a8 = T97c30(a3);
	l1 = T100c3();
	t2 = (T100f1(GE_void(l1)));
	if (t2) {
		((T77*)(C))->a6 = (T100f2(GE_void(l1)));
	} else {
		((T77*)(C))->a6 = T101c202();
	}
	T101f204(GE_void(((T77*)(C))->a6));
	((T77*)(C))->a7 = T94c10();
	t1 = (((T94*)(GE_void(((T77*)(C))->a7)))->a3);
	T101f205(GE_void(((T77*)(C))->a6), t1);
	t1 = (((T94*)(GE_void(((T77*)(C))->a7)))->a2);
	T96f10(GE_void(t1), ((T77*)(C))->a6);
}

/* GEXACE_VALIDATE_COMMAND.set_xace_filename */
void T41f8(T0* C, T0* a1)
{
	((T41*)(C))->a3 = a1;
}

/* GEXACE_LIBRARY_COMMAND.set_xace_filename */
void T40f14(T0* C, T0* a1)
{
	((T40*)(C))->a5 = a1;
}

/* GEXACE_SYSTEM_COMMAND.set_xace_filename */
void T36f14(T0* C, T0* a1)
{
	((T36*)(C))->a5 = a1;
}

/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
T0* T210f57(T0* C)
{
	T0* R = 0;
	R = T168c7(((T210*)(C))->a8, ((T210*)(C))->a17, ((T210*)(C))->a16, ((T210*)(C))->a15);
	return R;
}

/* XM_DEFAULT_POSITION.make */
T0* T168c7(T0* a1, T6 a2, T6 a3, T6 a4)
{
	T0* C;
	C = GE_new168(EIF_TRUE);
	((T168*)(C))->a1 = a1;
	((T168*)(C))->a4 = a2;
	((T168*)(C))->a3 = a3;
	((T168*)(C))->a2 = a4;
	return C;
}

/* XM_EIFFEL_SCANNER_DTD.error_position */
T0* T208f55(T0* C)
{
	T0* R = 0;
	R = T168c7(((T208*)(C))->a3, ((T208*)(C))->a4, ((T208*)(C))->a5, ((T208*)(C))->a6);
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.error_position */
T0* T204f56(T0* C)
{
	T0* R = 0;
	R = T168c7(((T204*)(C))->a8, ((T204*)(C))->a17, ((T204*)(C))->a16, ((T204*)(C))->a15);
	return R;
}

/* XM_EIFFEL_SCANNER.error_position */
T0* T167f63(T0* C)
{
	T0* R = 0;
	R = T168c7(((T167*)(C))->a3, ((T167*)(C))->a4, ((T167*)(C))->a5, ((T167*)(C))->a6);
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
T1 T210f60(T0* C)
{
	T1 R = 0;
	R = (((((((T210*)(C))->a43) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.end_of_file */
T1 T208f61(T0* C)
{
	T1 R = 0;
	R = (((((((T208*)(C))->a1) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.end_of_file */
T1 T204f59(T0* C)
{
	T1 R = 0;
	R = (((((((T204*)(C))->a41) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_SCANNER.end_of_file */
T1 T167f65(T0* C)
{
	T1 R = 0;
	R = (((((((T167*)(C))->a1) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
T1 T210f61(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T235f9(GE_void(((T210*)(C))->a45), a1));
	if (t1) {
		R = (T235f16(GE_void(((T210*)(C))->a45), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
T1 T235f16(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = (((((((T235*)(C))->a2) == ((T6)(GE_int32(6)))))));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T235f17(C));
		t1 = (T47f11(GE_void(t2), a1, ge1446ov10125));
		if (!(t1)) {
			t2 = (T235f17(C));
			t1 = (T47f11(GE_void(t2), a1, ge1446ov10124));
		}
		if (t1) {
			t1 = (((((((T235*)(C))->a2) == ((T6)(GE_int32(2)))))));
			if (!(t1)) {
				t1 = (((((((T235*)(C))->a2) == ((T6)(GE_int32(1)))))));
			}
			if (!(t1)) {
				R = (((((((T235*)(C))->a2) == ((T6)(GE_int32(3)))))));
			} else {
				R = EIF_TRUE;
			}
		} else {
			t2 = (T235f17(C));
			t1 = (T47f11(GE_void(t2), a1, ge1446ov10126));
			if (t1) {
				t1 = (((((((T235*)(C))->a2) == ((T6)(GE_int32(2)))))));
				if (!(t1)) {
					R = (((((((T235*)(C))->a2) == ((T6)(GE_int32(1)))))));
				} else {
					R = EIF_TRUE;
				}
			} else {
				t2 = (T235f17(C));
				t1 = (T47f11(GE_void(t2), a1, ge1446ov10127));
				if (t1) {
					t1 = (((((((T235*)(C))->a2) == ((T6)(GE_int32(4)))))));
					if (!(t1)) {
						R = (((((((T235*)(C))->a2) == ((T6)(GE_int32(5)))))));
					} else {
						R = EIF_TRUE;
					}
				}
			}
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
T1 T235f9(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T235f17(C));
		t1 = (T47f11(GE_void(t2), a1, ge1446ov10125));
		if (!(t1)) {
			t2 = (T235f17(C));
			t1 = (T47f11(GE_void(t2), a1, ge1446ov10124));
		}
		if (!(t1)) {
			t2 = (T235f17(C));
			t1 = (T47f11(GE_void(t2), a1, ge1446ov10126));
		}
		if (!(t1)) {
			t2 = (T235f17(C));
			R = (T47f11(GE_void(t2), a1, ge1446ov10127));
		} else {
			R = EIF_TRUE;
		}
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
T1 T208f48(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T235f9(GE_void(((T208*)(C))->a7), a1));
	if (t1) {
		R = (T235f16(GE_void(((T208*)(C))->a7), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
T1 T204f60(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T235f9(GE_void(((T204*)(C))->a43), a1));
	if (t1) {
		R = (T235f16(GE_void(((T204*)(C))->a43), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_SCANNER.is_applicable_encoding */
T1 T167f66(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T235f9(GE_void(((T167*)(C))->a7), a1));
	if (t1) {
		R = (T235f16(GE_void(((T167*)(C))->a7), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
T6 T210f62(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T210*)(C))->a11)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.start_condition */
T6 T208f50(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T208*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.start_condition */
T6 T204f61(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T204*)(C))->a11)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER.start_condition */
T6 T167f43(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T167*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* ET_XACE_ECF_GENERATOR.default_system_output_filename */
unsigned char ge1275os2681 = '\0';
T0* ge1275ov2681;
T0* T45f5(T0* C)
{
	T0* R = 0;
	if (ge1275os2681) {
		return ge1275ov2681;
	} else {
		ge1275os2681 = '\1';
		ge1275ov2681 = R;
	}
	R = (T17f19(GE_void(((T45*)(C))->a1), GE_ms8(".ecf", 4)));
	ge1275ov2681 = R;
	return R;
}

/* ET_XACE_ACE_GENERATOR.default_system_output_filename */
unsigned char ge1274os2681 = '\0';
T0* ge1274ov2681;
T0* T44f5(T0* C)
{
	T0* R = 0;
	if (ge1274os2681) {
		return ge1274ov2681;
	} else {
		ge1274os2681 = '\1';
		ge1274ov2681 = R;
	}
	R = (T17f19(GE_void(((T44*)(C))->a1), GE_ms8(".ace", 4)));
	ge1274ov2681 = R;
	return R;
}

/* ET_XACE_XACE_GENERATOR.default_system_output_filename */
unsigned char ge1277os2681 = '\0';
T0* ge1277ov2681;
T0* T43f5(T0* C)
{
	T0* R = 0;
	if (ge1277os2681) {
		return ge1277ov2681;
	} else {
		ge1277os2681 = '\1';
		ge1277ov2681 = R;
	}
	R = (T17f19(GE_void(((T43*)(C))->a1), GE_ms8(".xace", 5)));
	ge1277ov2681 = R;
	return R;
}

/* ET_XACE_ECF_GENERATOR.default_library_output_filename */
unsigned char ge1275os2682 = '\0';
T0* ge1275ov2682;
T0* T45f6(T0* C)
{
	T0* R = 0;
	if (ge1275os2682) {
		return ge1275ov2682;
	} else {
		ge1275os2682 = '\1';
		ge1275ov2682 = R;
	}
	R = (T17f19(GE_void(((T45*)(C))->a1), GE_ms8(".ecf", 4)));
	ge1275ov2682 = R;
	return R;
}

/* ET_XACE_ACE_GENERATOR.default_library_output_filename */
unsigned char ge1274os2682 = '\0';
T0* ge1274ov2682;
T0* T44f6(T0* C)
{
	T0* R = 0;
	if (ge1274os2682) {
		return ge1274ov2682;
	} else {
		ge1274os2682 = '\1';
		ge1274ov2682 = R;
	}
	R = (T17f19(GE_void(((T44*)(C))->a1), GE_ms8(".ace", 4)));
	ge1274ov2682 = R;
	return R;
}

/* ET_XACE_XACE_GENERATOR.default_library_output_filename */
unsigned char ge1277os2682 = '\0';
T0* ge1277ov2682;
T0* T43f6(T0* C)
{
	T0* R = 0;
	if (ge1277os2682) {
		return ge1277ov2682;
	} else {
		ge1277os2682 = '\1';
		ge1277ov2682 = R;
	}
	R = (T17f19(GE_void(((T43*)(C))->a1), GE_ms8(".xace", 5)));
	ge1277ov2682 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
T0* T324f5(T0* C)
{
	T0* R = 0;
	R = (T324f3(C, ge1260ov2659));
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
T0* T324f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T324f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T324f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T324f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T324f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T324*)(C))->a1), l3));
						if (t2) {
							t1 = (T324f4(C));
							t5 = (T63f5(GE_void(((T324*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T324f4(C));
								t5 = (T324f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T324f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T324f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.arguments */
T0* T324f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ARRAY [STRING_8].valid_index */
T1 T63f4(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T6f6(&(((T63*)(C))->a2), a1));
	if (t1) {
		R = (T6f6(&a1, ((T63*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
T0* T324f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T323f5(T0* C)
{
	T0* R = 0;
	R = (T323f3(C, ge1254ov2659));
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T323f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T323f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T323f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T323f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T323f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T323*)(C))->a1), l3));
						if (t2) {
							t1 = (T323f4(C));
							t5 = (T63f5(GE_void(((T323*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T323f4(C));
								t5 = (T323f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T323f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T323f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.arguments */
T0* T323f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T323f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
T0* T223f5(T0* C)
{
	T0* R = 0;
	R = (T223f3(C, ge1270ov2659));
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
T0* T223f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T223f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T223f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T223f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T223f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T223*)(C))->a1), l3));
						if (t2) {
							t1 = (T223f4(C));
							t5 = (T63f5(GE_void(((T223*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T223f4(C));
								t5 = (T223f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T223f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T223f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.arguments */
T0* T223f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
T0* T223f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
T0* T222f5(T0* C)
{
	T0* R = 0;
	R = (T222f3(C, ge1267ov2659));
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
T0* T222f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T222f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T222f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T222f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T222f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T222*)(C))->a1), l3));
						if (t2) {
							t1 = (T222f4(C));
							t5 = (T63f5(GE_void(((T222*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T222f4(C));
								t5 = (T222f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T222f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T222f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.arguments */
T0* T222f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
T0* T222f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
T0* T221f5(T0* C)
{
	T0* R = 0;
	R = (T221f3(C, ge1269ov2659));
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
T0* T221f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T221f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T221f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T221f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T221f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T221*)(C))->a1), l3));
						if (t2) {
							t1 = (T221f4(C));
							t5 = (T63f5(GE_void(((T221*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T221f4(C));
								t5 = (T221f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T221f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T221f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.arguments */
T0* T221f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
T0* T221f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
T0* T220f5(T0* C)
{
	T0* R = 0;
	R = (T220f3(C, ge1266ov2659));
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
T0* T220f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T220f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T220f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T220f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T220f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T220*)(C))->a1), l3));
						if (t2) {
							t1 = (T220f4(C));
							t5 = (T63f5(GE_void(((T220*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T220f4(C));
								t5 = (T220f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T220f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T220f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.arguments */
T0* T220f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
T0* T220f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
T0* T219f5(T0* C)
{
	T0* R = 0;
	R = (T219f3(C, ge1262ov2659));
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.message */
T0* T219f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T219f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T219f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T219f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T219f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T219*)(C))->a1), l3));
						if (t2) {
							t1 = (T219f4(C));
							t5 = (T63f5(GE_void(((T219*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T219f4(C));
								t5 = (T219f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T219f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T219f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
T0* T219f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
T0* T219f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
T0* T218f5(T0* C)
{
	T0* R = 0;
	R = (T218f3(C, ge1261ov2659));
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
T0* T218f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T218f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T218f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T218f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T218f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T218*)(C))->a1), l3));
						if (t2) {
							t1 = (T218f4(C));
							t5 = (T63f5(GE_void(((T218*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T218f4(C));
								t5 = (T218f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T218f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T218f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.arguments */
T0* T218f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
T0* T218f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
T0* T217f5(T0* C)
{
	T0* R = 0;
	R = (T217f3(C, ge1273ov2659));
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
T0* T217f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T217f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T217f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T217f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T217f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T217*)(C))->a1), l3));
						if (t2) {
							t1 = (T217f4(C));
							t5 = (T63f5(GE_void(((T217*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T217f4(C));
								t5 = (T217f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T217f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T217f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
T0* T217f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
T0* T217f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T216f5(T0* C)
{
	T0* R = 0;
	R = (T216f3(C, ge1257ov2659));
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T216f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T216f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T216f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T216f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T216f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T216*)(C))->a1), l3));
						if (t2) {
							t1 = (T216f4(C));
							t5 = (T63f5(GE_void(((T216*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T216f4(C));
								t5 = (T216f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T216f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T216f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.arguments */
T0* T216f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T216f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
T0* T215f5(T0* C)
{
	T0* R = 0;
	R = (T215f3(C, ge1268ov2659));
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
T0* T215f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T215f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T215f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T215f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T215f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T215*)(C))->a1), l3));
						if (t2) {
							t1 = (T215f4(C));
							t5 = (T63f5(GE_void(((T215*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T215f4(C));
								t5 = (T215f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T215f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T215f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.arguments */
T0* T215f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
T0* T215f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
T0* T214f5(T0* C)
{
	T0* R = 0;
	R = (T214f3(C, ge1272ov2659));
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
T0* T214f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T214f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T214f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T214f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T214f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T214*)(C))->a1), l3));
						if (t2) {
							t1 = (T214f4(C));
							t5 = (T63f5(GE_void(((T214*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T214f4(C));
								t5 = (T214f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T214f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T214f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.arguments */
T0* T214f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
T0* T213f5(T0* C)
{
	T0* R = 0;
	R = (T213f3(C, ge1264ov2659));
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
T0* T213f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T213f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T213f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T213f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T213f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T213*)(C))->a1), l3));
						if (t2) {
							t1 = (T213f4(C));
							t5 = (T63f5(GE_void(((T213*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T213f4(C));
								t5 = (T213f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T213f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T213f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.arguments */
T0* T213f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
T0* T213f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
T0* T212f5(T0* C)
{
	T0* R = 0;
	R = (T212f3(C, ge1255ov2659));
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
T0* T212f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T212f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T212f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T212f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T212f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T212*)(C))->a1), l3));
						if (t2) {
							t1 = (T212f4(C));
							t5 = (T63f5(GE_void(((T212*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T212f4(C));
								t5 = (T212f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T212f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T212f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.arguments */
T0* T212f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
T0* T212f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
T0* T211f5(T0* C)
{
	T0* R = 0;
	R = (T211f3(C, ge1263ov2659));
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
T0* T211f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T211f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T211f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T211f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T211f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T211*)(C))->a1), l3));
						if (t2) {
							t1 = (T211f4(C));
							t5 = (T63f5(GE_void(((T211*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T211f4(C));
								t5 = (T211f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T211f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T211f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.arguments */
T0* T211f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
T0* T211f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.default_message */
T0* T108f5(T0* C)
{
	T0* R = 0;
	R = (T108f3(C, ge1265ov2659));
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.message */
T0* T108f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T108f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T108f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T108f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T108f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T108*)(C))->a1), l3));
						if (t2) {
							t1 = (T108f4(C));
							t5 = (T63f5(GE_void(((T108*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T108f4(C));
								t5 = (T108f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T108f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T108f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.arguments */
T0* T108f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.string_ */
T0* T108f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T107f5(T0* C)
{
	T0* R = 0;
	R = (T107f3(C, ge1294ov2659));
	return R;
}

/* UT_MESSAGE.message */
T0* T107f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T107f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T107f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T107f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T107f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T107*)(C))->a1), l3));
						if (t2) {
							t1 = (T107f4(C));
							t5 = (T63f5(GE_void(((T107*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T107f4(C));
								t5 = (T107f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T107f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T107f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_MESSAGE.arguments */
T0* T107f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T107f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T87f5(T0* C)
{
	T0* R = 0;
	R = (T87f3(C, ge1291ov2659));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T87f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T87f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T87f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T87f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T87f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T87*)(C))->a1), l3));
						if (t2) {
							t1 = (T87f4(C));
							t5 = (T63f5(GE_void(((T87*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T87f4(C));
								t5 = (T87f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T87f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T87f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
T0* T87f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T87f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T86f5(T0* C)
{
	T0* R = 0;
	R = (T86f3(C, ge1290ov2659));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T86f3(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T86f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T86f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T86f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T86f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T86*)(C))->a1), l3));
						if (t2) {
							t1 = (T86f4(C));
							t5 = (T63f5(GE_void(((T86*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T86f4(C));
								t5 = (T86f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T86f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T86f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.arguments */
T0* T86f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T86f4(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

/* UT_USAGE_MESSAGE.default_message */
T0* T34f2(T0* C)
{
	T0* R = 0;
	R = (T34f4(C, ge1300ov2659));
	return R;
}

/* UT_USAGE_MESSAGE.message */
T0* T34f4(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T34f5(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T233f55(R, l5);
				}
			} else {
				t1 = (T34f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T233f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T233f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T34f5(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T233f55(l1, l5);
									}
								} else {
									t1 = (T34f5(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f36(l1, l5);
								} else {
									T233f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T233f27(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T233f28(l1)));
						t2 = (T63f4(GE_void(((T34*)(C))->a1), l3));
						if (t2) {
							t1 = (T34f5(C));
							t5 = (T63f5(GE_void(((T34*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T34f5(C));
								t5 = (T34f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T233f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T233f55(R, (T2)('{'));
									}
								}
								t1 = (T34f5(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T233f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T233f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T233f55(R, (T2)('{'));
							}
						}
						t1 = (T34f5(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T233f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_USAGE_MESSAGE.arguments */
T0* T34f6(T0* C)
{
	T0* R = 0;
	if (ge167os1785) {
		return ge167ov1785;
	} else {
		ge167os1785 = '\1';
		ge167ov1785 = R;
	}
	R = T23c4();
	ge167ov1785 = R;
	return R;
}

/* UT_USAGE_MESSAGE.string_ */
T0* T34f5(T0* C)
{
	T0* R = 0;
	if (ge92os1786) {
		return ge92ov1786;
	} else {
		ge92os1786 = '\1';
		ge92ov1786 = R;
	}
	R = T47c14();
	ge92ov1786 = R;
	return R;
}

T0* GE_ma230(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new51(c, EIF_FALSE);
	*(T51*)t1 = GE_default51;
	((T51*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T6 *i = ((T51*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = GE_new230(EIF_TRUE);
	((T230*)(R))->a1 = t1;
	((T230*)(R))->a2 = 1;
	((T230*)(R))->a3 = c;
	return R;
}

T0* GE_ma63(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new50(c, EIF_FALSE);
	*(T50*)t1 = GE_default50;
	((T50*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T50*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new63(EIF_TRUE);
	((T63*)(R))->a1 = t1;
	((T63*)(R))->a2 = 1;
	((T63*)(R))->a3 = c;
	return R;
}

T0* GE_ma157(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new156(c, EIF_FALSE);
	*(T156*)t1 = GE_default156;
	((T156*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T156*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new157(EIF_TRUE);
	((T157*)(R))->a1 = t1;
	((T157*)(R))->a2 = 1;
	((T157*)(R))->a3 = c;
	return R;
}

T0* ge139ov3023;
T0* ge99ov2953;
T0* ge52ov2121;
T0* ge52ov2122;
T0* ge188ov3970;
T0* ge198ov10117;
T0* ge1455ov9383;
T0* ge1455ov9384;
T0* ge125ov4775;
T0* ge1446ov10125;
T0* ge1446ov10127;
T0* ge1398ov5405;
T0* ge1379ov9228;
T0* ge1379ov9227;
T0* ge1251ov4421;
T0* ge1251ov4434;
T0* ge1251ov4436;
T0* ge1251ov4413;
T0* ge1251ov4439;
T0* ge1251ov4423;
T0* ge1251ov4417;
T0* ge1251ov4428;
T0* ge1251ov4430;
T0* ge1251ov4429;
T0* ge144ov7554;
T0* ge1251ov4425;
T0* ge1251ov4414;
T0* ge1251ov4420;
T0* ge1251ov4435;
T0* ge1251ov4422;
T0* ge1251ov4424;
T0* ge232ov3023;
T0* ge1251ov4426;
T0* ge1251ov4415;
T0* ge1251ov4427;
T0* ge1441ov5628;
T0* ge1441ov5627;
T0* ge1282ov4225;
T0* ge1251ov4438;
T0* ge1251ov4419;
T0* ge1251ov4433;
T0* ge1251ov4432;
T0* ge1251ov4437;
T0* ge1251ov4416;
T0* ge1251ov4431;
T0* ge1251ov4418;
T0* ge1251ov4441;
T0* ge1282ov4224;
T0* ge1282ov4223;
T0* ge1251ov4226;
T0* ge1251ov4227;
T0* ge1251ov4228;
T0* ge1251ov4229;
T0* ge1251ov4230;
T0* ge1251ov4231;
T0* ge1251ov4232;
T0* ge1251ov4233;
T0* ge1251ov4234;
T0* ge1251ov4235;
T0* ge1251ov4236;
T0* ge1251ov4237;
T0* ge1251ov4238;
T0* ge1251ov4239;
T0* ge1251ov4240;
T0* ge1251ov4241;
T0* ge1251ov4242;
T0* ge1251ov4243;
T0* ge1251ov4244;
T0* ge1251ov4245;
T0* ge1251ov4246;
T0* ge1251ov4247;
T0* ge1251ov4248;
T0* ge1251ov4249;
T0* ge1251ov4250;
T0* ge1251ov4251;
T0* ge1251ov4252;
T0* ge1251ov4253;
T0* ge1251ov4254;
T0* ge1251ov4255;
T0* ge1251ov4256;
T0* ge1251ov4257;
T0* ge1251ov4258;
T0* ge1251ov4259;
T0* ge1251ov4260;
T0* ge1251ov4261;
T0* ge1251ov4262;
T0* ge1251ov4263;
T0* ge1251ov4264;
T0* ge1251ov4265;
T0* ge1251ov4266;
T0* ge1251ov4267;
T0* ge1251ov4268;
T0* ge1251ov4269;
T0* ge1251ov4270;
T0* ge1251ov4271;
T0* ge1251ov4272;
T0* ge1251ov4273;
T0* ge1251ov4274;
T0* ge1251ov4275;
T0* ge1251ov4276;
T0* ge1251ov4277;
T0* ge1251ov4278;
T0* ge1251ov4279;
T0* ge1251ov4280;
T0* ge1251ov4281;
T0* ge1251ov4282;
T0* ge1251ov4283;
T0* ge1251ov4284;
T0* ge1251ov4285;
T0* ge1251ov4286;
T0* ge1251ov4287;
T0* ge1251ov4288;
T0* ge1251ov4289;
T0* ge1251ov4290;
T0* ge1251ov4291;
T0* ge1251ov4292;
T0* ge1251ov4293;
T0* ge1251ov4294;
T0* ge1251ov4295;
T0* ge1251ov4296;
T0* ge1251ov4297;
T0* ge1251ov4298;
T0* ge1251ov4299;
T0* ge1251ov4300;
T0* ge1251ov4301;
T0* ge1251ov4302;
T0* ge1251ov4303;
T0* ge1251ov4304;
T0* ge1251ov4305;
T0* ge1251ov4306;
T0* ge1251ov4307;
T0* ge1251ov4308;
T0* ge1251ov4309;
T0* ge1251ov4310;
T0* ge1251ov4311;
T0* ge1251ov4312;
T0* ge1251ov4313;
T0* ge1251ov4314;
T0* ge1251ov4315;
T0* ge1251ov4316;
T0* ge1251ov4317;
T0* ge1251ov4318;
T0* ge129ov3023;
T0* ge1241ov6547;
T0* ge957ov8392;
T0* ge957ov8141;
T0* ge957ov8133;
T0* ge957ov8389;
T0* ge957ov8128;
T0* ge957ov8383;
T0* ge957ov8118;
T0* ge957ov8378;
T0* ge957ov8111;
T0* ge957ov8377;
T0* ge957ov8107;
T0* ge957ov8374;
T0* ge957ov8104;
T0* ge957ov8140;
T0* ge957ov8139;
T0* ge957ov8138;
T0* ge957ov8137;
T0* ge957ov8303;
T0* ge957ov8290;
T0* ge957ov8136;
T0* ge957ov8135;
T0* ge957ov8134;
T0* ge957ov8132;
T0* ge957ov8131;
T0* ge957ov8391;
T0* ge957ov8130;
T0* ge957ov8390;
T0* ge957ov8129;
T0* ge957ov8127;
T0* ge957ov8126;
T0* ge957ov8388;
T0* ge957ov8125;
T0* ge957ov8124;
T0* ge957ov8123;
T0* ge957ov8387;
T0* ge957ov8122;
T0* ge957ov8386;
T0* ge957ov8121;
T0* ge957ov8385;
T0* ge957ov8120;
T0* ge957ov8384;
T0* ge957ov8119;
T0* ge957ov8117;
T0* ge957ov8382;
T0* ge957ov8115;
T0* ge957ov8381;
T0* ge957ov8114;
T0* ge957ov8380;
T0* ge957ov8113;
T0* ge957ov8379;
T0* ge957ov8112;
T0* ge957ov8110;
T0* ge957ov8109;
T0* ge957ov8108;
T0* ge957ov8376;
T0* ge957ov8106;
T0* ge957ov8375;
T0* ge957ov8105;
T0* ge957ov8373;
T0* ge957ov8103;
T0* ge957ov8102;
T0* ge957ov8100;
T0* ge957ov8099;
T0* ge957ov8280;
T0* ge957ov8101;
T0* ge1247ov5380;
T0* ge1448ov6254;
T0* ge1448ov6216;
T0* ge1448ov6214;
T0* ge1448ov6255;
T0* ge1448ov6227;
T0* ge1448ov6226;
T0* ge1448ov6237;
T0* ge1448ov6231;
T0* ge1448ov6230;
T0* ge1448ov6229;
T0* ge1448ov6235;
T0* ge1448ov6234;
T0* ge1448ov6236;
T0* ge1448ov6213;
T0* ge1448ov6239;
T0* ge1448ov6248;
T0* ge1451ov5977;
T0* ge1451ov5975;
T0* ge1451ov5976;
T0* ge1448ov6249;
T0* ge1448ov6250;
T0* ge1448ov6253;
T0* ge1448ov6251;
T0* ge1448ov6252;
T0* ge1448ov6246;
T0* ge1444ov9832;
T0* ge1444ov9833;
T0* ge1448ov6219;
T0* ge1448ov6242;
T0* ge1448ov6262;
T0* ge1448ov6263;
T0* ge1448ov6264;
T0* ge1448ov6257;
T0* ge1448ov6240;
T0* ge1448ov6241;
T0* ge1448ov6243;
T0* ge1448ov6247;
T0* ge121ov4795;
T0* ge1446ov10124;
T0* ge1446ov10126;
T0* ge1260ov2659;
T0* ge1254ov2659;
T0* ge1270ov2659;
T0* ge1267ov2659;
T0* ge1269ov2659;
T0* ge1266ov2659;
T0* ge1262ov2659;
T0* ge1261ov2659;
T0* ge1273ov2659;
T0* ge1257ov2659;
T0* ge1268ov2659;
T0* ge1272ov2659;
T0* ge1264ov2659;
T0* ge1255ov2659;
T0* ge1263ov2659;
T0* ge1265ov2659;
T0* ge1294ov2659;
T0* ge1291ov2659;
T0* ge1290ov2659;
T0* ge1300ov2659;

void GE_const_init()
{
	ge139ov3023 = (GE_ms8("\n", 1));
	ge99ov2953 = (GE_ms8("", 0));
	ge52ov2121 = (GE_ms8("system.xace", 11));
	ge52ov2122 = (GE_ms8("library.xace", 12));
	ge188ov3970 = (GE_ms8("", 0));
	ge198ov10117 = (GE_ms8("", 0));
	ge1455ov9383 = (GE_ms8(" ", 1));
	ge1455ov9384 = (GE_ms8("  ", 2));
	ge125ov4775 = (GE_ms8("", 0));
	ge1446ov10125 = (GE_ms8("iso-8859-1", 10));
	ge1446ov10127 = (GE_ms8("utf-16", 6));
	ge1398ov5405 = (GE_ms8("root", 4));
	ge1379ov9228 = (GE_ms8("Namespace declared twice", 24));
	ge1379ov9227 = (GE_ms8("Undeclared namespace error", 26));
	ge1251ov4421 = (GE_ms8("default", 7));
	ge1251ov4434 = (GE_ms8("none", 4));
	ge1251ov4436 = (GE_ms8("require", 7));
	ge1251ov4413 = (GE_ms8("all", 3));
	ge1251ov4439 = (GE_ms8("supplier_precondition", 21));
	ge1251ov4423 = (GE_ms8("ensure", 6));
	ge1251ov4417 = (GE_ms8("check", 5));
	ge1251ov4428 = (GE_ms8("invariant", 9));
	ge1251ov4430 = (GE_ms8("loop_variant", 12));
	ge1251ov4429 = (GE_ms8("loop_invariant", 14));
	ge144ov7554 = (GE_ms8(".", 1));
	ge1251ov4425 = (GE_ms8("feature", 7));
	ge1251ov4414 = (GE_ms8("array", 5));
	ge1251ov4420 = (GE_ms8("constant", 8));
	ge1251ov4435 = (GE_ms8("once", 4));
	ge1251ov4422 = (GE_ms8("dll", 3));
	ge1251ov4424 = (GE_ms8("exe", 3));
	ge232ov3023 = (GE_ms8("\n", 1));
	ge1251ov4426 = (GE_ms8("generate", 8));
	ge1251ov4415 = (GE_ms8("auto", 4));
	ge1251ov4427 = (GE_ms8("internal", 8));
	ge1441ov5628 = (GE_ms8("undefined", 9));
	ge1441ov5627 = (GE_ms8("(TRUNCATED)", 11));
	ge1282ov4225 = (GE_ms8("", 0));
	ge1251ov4438 = (GE_ms8("style", 5));
	ge1251ov4419 = (GE_ms8("com", 3));
	ge1251ov4433 = (GE_ms8("no_main", 7));
	ge1251ov4432 = (GE_ms8("microsoft", 9));
	ge1251ov4437 = (GE_ms8("sequential", 10));
	ge1251ov4416 = (GE_ms8("boehm", 5));
	ge1251ov4431 = (GE_ms8("low_level", 9));
	ge1251ov4418 = (GE_ms8("class", 5));
	ge1251ov4441 = (GE_ms8("winapi", 6));
	ge1282ov4224 = (GE_ms8("false", 5));
	ge1282ov4223 = (GE_ms8("true", 4));
	ge1251ov4226 = (GE_ms8("abstract", 8));
	ge1251ov4227 = (GE_ms8("address_expression", 18));
	ge1251ov4228 = (GE_ms8("arguments", 9));
	ge1251ov4229 = (GE_ms8("array_optimization", 18));
	ge1251ov4230 = (GE_ms8("assembly", 8));
	ge1251ov4231 = (GE_ms8("assertion", 9));
	ge1251ov4232 = (GE_ms8("automatic_backup", 16));
	ge1251ov4233 = (GE_ms8("callback", 8));
	ge1251ov4234 = (GE_ms8("case_insensitive", 16));
	ge1251ov4235 = (GE_ms8("check_generic_creation_constraint", 33));
	ge1251ov4236 = (GE_ms8("check_vape", 10));
	ge1251ov4237 = (GE_ms8("clean", 5));
	ge1251ov4238 = (GE_ms8("cls_compliant", 13));
	ge1251ov4239 = (GE_ms8("component", 9));
	ge1251ov4240 = (GE_ms8("console_application", 19));
	ge1251ov4241 = (GE_ms8("create_keyword_extension", 24));
	ge1251ov4242 = (GE_ms8("culture", 7));
	ge1251ov4243 = (GE_ms8("c_compiler_options", 18));
	ge1251ov4244 = (GE_ms8("dead_code_removal", 17));
	ge1251ov4245 = (GE_ms8("debug", 5));
	ge1251ov4246 = (GE_ms8("debug_tag", 9));
	ge1251ov4247 = (GE_ms8("debugger", 8));
	ge1251ov4248 = (GE_ms8("document", 8));
	ge1251ov4249 = (GE_ms8("dotnet_naming_convention", 24));
	ge1251ov4250 = (GE_ms8("dynamic_runtime", 15));
	ge1251ov4251 = (GE_ms8("ecf_library", 11));
	ge1251ov4252 = (GE_ms8("enforce_unique_class_names", 26));
	ge1251ov4253 = (GE_ms8("exception_trace", 15));
	ge1251ov4254 = (GE_ms8("exclude", 7));
	ge1251ov4255 = (GE_ms8("export", 6));
	ge1251ov4256 = (GE_ms8("external_runtime", 16));
	ge1251ov4257 = (GE_ms8("finalize", 8));
	ge1251ov4258 = (GE_ms8("flat_fst_optimization", 21));
	ge1251ov4259 = (GE_ms8("force_32bits", 12));
	ge1251ov4260 = (GE_ms8("fst_expansion_factor", 20));
	ge1251ov4261 = (GE_ms8("fst_optimization", 16));
	ge1251ov4262 = (GE_ms8("full_class_checking", 19));
	ge1251ov4263 = (GE_ms8("garbage_collector", 17));
	ge1251ov4264 = (GE_ms8("gc_info", 7));
	ge1251ov4265 = (GE_ms8("heap_size", 9));
	ge1251ov4266 = (GE_ms8("header", 6));
	ge1251ov4267 = (GE_ms8("high_memory_compiler", 20));
	ge1251ov4268 = (GE_ms8("il_verifiable", 13));
	ge1251ov4269 = (GE_ms8("include", 7));
	ge1251ov4270 = (GE_ms8("inlining", 8));
	ge1251ov4271 = (GE_ms8("inlining_size", 13));
	ge1251ov4272 = (GE_ms8("jumps_optimization", 18));
	ge1251ov4273 = (GE_ms8("layout", 6));
	ge1251ov4274 = (GE_ms8("layout_optimization", 19));
	ge1251ov4275 = (GE_ms8("leaves_optimization", 19));
	ge1251ov4276 = (GE_ms8("line_generation", 15));
	ge1251ov4277 = (GE_ms8("link", 4));
	ge1251ov4278 = (GE_ms8("linker", 6));
	ge1251ov4279 = (GE_ms8("linux_fpu_double_precision", 26));
	ge1251ov4280 = (GE_ms8("manifest_string_trace", 21));
	ge1251ov4281 = (GE_ms8("map", 3));
	ge1251ov4282 = (GE_ms8("metadata_cache_path", 19));
	ge1251ov4283 = (GE_ms8("msil_assembly_compatibility", 27));
	ge1251ov4284 = (GE_ms8("msil_classes_per_module", 23));
	ge1251ov4285 = (GE_ms8("msil_clr_version", 16));
	ge1251ov4286 = (GE_ms8("msil_culture", 12));
	ge1251ov4287 = (GE_ms8("msil_generation", 15));
	ge1251ov4288 = (GE_ms8("msil_generation_version", 23));
	ge1251ov4289 = (GE_ms8("msil_key_file_name", 18));
	ge1251ov4290 = (GE_ms8("msil_use_optimized_precompile", 29));
	ge1251ov4291 = (GE_ms8("multithreaded", 13));
	ge1251ov4292 = (GE_ms8("namespace", 9));
	ge1251ov4293 = (GE_ms8("no_default_lib", 14));
	ge1251ov4294 = (GE_ms8("old_verbatim_strings", 20));
	ge1251ov4295 = (GE_ms8("override_cluster", 16));
	ge1251ov4296 = (GE_ms8("portable_code_generation", 24));
	ge1251ov4297 = (GE_ms8("precompiled", 11));
	ge1251ov4298 = (GE_ms8("prefix", 6));
	ge1251ov4299 = (GE_ms8("profile", 7));
	ge1251ov4300 = (GE_ms8("public_key_token", 16));
	ge1251ov4301 = (GE_ms8("read_only", 9));
	ge1251ov4302 = (GE_ms8("recursive", 9));
	ge1251ov4303 = (GE_ms8("reloads_optimization", 20));
	ge1251ov4304 = (GE_ms8("shared_library_definition", 25));
	ge1251ov4305 = (GE_ms8("split", 5));
	ge1251ov4306 = (GE_ms8("stack_size", 10));
	ge1251ov4307 = (GE_ms8("storable", 8));
	ge1251ov4308 = (GE_ms8("storable_filename", 17));
	ge1251ov4309 = (GE_ms8("strip", 5));
	ge1251ov4310 = (GE_ms8("target", 6));
	ge1251ov4311 = (GE_ms8("trace", 5));
	ge1251ov4312 = (GE_ms8("use_cluster_name_as_namespace", 29));
	ge1251ov4313 = (GE_ms8("use_full_cluster_name_as_namespace", 34));
	ge1251ov4314 = (GE_ms8("verbose", 7));
	ge1251ov4315 = (GE_ms8("version", 7));
	ge1251ov4316 = (GE_ms8("visible_filename", 16));
	ge1251ov4317 = (GE_ms8("warning", 7));
	ge1251ov4318 = (GE_ms8("wedit", 5));
	ge129ov3023 = (GE_ms8("\n", 1));
	ge1241ov6547 = (GE_ms8("", 0));
	ge957ov8392 = (GE_ms8("WIDE_CHARACTER_REF", 18));
	ge957ov8141 = (GE_ms8("WIDE_CHARACTER", 14));
	ge957ov8133 = (GE_ms8("STRING", 6));
	ge957ov8389 = (GE_ms8("REAL_REF", 8));
	ge957ov8128 = (GE_ms8("REAL", 4));
	ge957ov8383 = (GE_ms8("NATURAL_REF", 11));
	ge957ov8118 = (GE_ms8("NATURAL", 7));
	ge957ov8378 = (GE_ms8("INTEGER_REF", 11));
	ge957ov8111 = (GE_ms8("INTEGER", 7));
	ge957ov8377 = (GE_ms8("DOUBLE_REF", 10));
	ge957ov8107 = (GE_ms8("DOUBLE", 6));
	ge957ov8374 = (GE_ms8("CHARACTER_REF", 13));
	ge957ov8104 = (GE_ms8("CHARACTER", 9));
	ge957ov8140 = (GE_ms8("TYPED_POINTER", 13));
	ge957ov8139 = (GE_ms8("TYPE", 4));
	ge957ov8138 = (GE_ms8("TUPLE", 5));
	ge957ov8137 = (GE_ms8("SYSTEM_STRING", 13));
	ge957ov8303 = (GE_ms8("inherit", 7));
	ge957ov8290 = (GE_ms8("end", 3));
	ge957ov8136 = (GE_ms8("SYSTEM_OBJECT", 13));
	ge957ov8135 = (GE_ms8("STRING_32", 9));
	ge957ov8134 = (GE_ms8("STRING_8", 8));
	ge957ov8132 = (GE_ms8("SPECIAL", 7));
	ge957ov8131 = (GE_ms8("ROUTINE", 7));
	ge957ov8391 = (GE_ms8("REAL_64_REF", 11));
	ge957ov8130 = (GE_ms8("REAL_64", 7));
	ge957ov8390 = (GE_ms8("REAL_32_REF", 11));
	ge957ov8129 = (GE_ms8("REAL_32", 7));
	ge957ov8127 = (GE_ms8("PROCEDURE", 9));
	ge957ov8126 = (GE_ms8("PREDICATE", 9));
	ge957ov8388 = (GE_ms8("POINTER_REF", 11));
	ge957ov8125 = (GE_ms8("POINTER", 7));
	ge957ov8124 = (GE_ms8("PLATFORM", 8));
	ge957ov8123 = (GE_ms8("NONE", 4));
	ge957ov8387 = (GE_ms8("NATURAL_64_REF", 14));
	ge957ov8122 = (GE_ms8("NATURAL_64", 10));
	ge957ov8386 = (GE_ms8("NATURAL_32_REF", 14));
	ge957ov8121 = (GE_ms8("NATURAL_32", 10));
	ge957ov8385 = (GE_ms8("NATURAL_16_REF", 14));
	ge957ov8120 = (GE_ms8("NATURAL_16", 10));
	ge957ov8384 = (GE_ms8("NATURAL_8_REF", 13));
	ge957ov8119 = (GE_ms8("NATURAL_8", 9));
	ge957ov8117 = (GE_ms8("NATIVE_ARRAY", 12));
	ge957ov8382 = (GE_ms8("INTEGER_64_REF", 14));
	ge957ov8115 = (GE_ms8("INTEGER_64", 10));
	ge957ov8381 = (GE_ms8("INTEGER_32_REF", 14));
	ge957ov8114 = (GE_ms8("INTEGER_32", 10));
	ge957ov8380 = (GE_ms8("INTEGER_16_REF", 14));
	ge957ov8113 = (GE_ms8("INTEGER_16", 10));
	ge957ov8379 = (GE_ms8("INTEGER_8_REF", 13));
	ge957ov8112 = (GE_ms8("INTEGER_8", 9));
	ge957ov8110 = (GE_ms8("IDENTIFIED_ROUTINES", 19));
	ge957ov8109 = (GE_ms8("FUNCTION", 8));
	ge957ov8108 = (GE_ms8("DISPOSABLE", 10));
	ge957ov8376 = (GE_ms8("CHARACTER_32_REF", 16));
	ge957ov8106 = (GE_ms8("CHARACTER_32", 12));
	ge957ov8375 = (GE_ms8("CHARACTER_8_REF", 15));
	ge957ov8105 = (GE_ms8("CHARACTER_8", 11));
	ge957ov8373 = (GE_ms8("BOOLEAN_REF", 11));
	ge957ov8103 = (GE_ms8("BOOLEAN", 7));
	ge957ov8102 = (GE_ms8("BIT", 3));
	ge957ov8100 = (GE_ms8("ARGUMENTS", 9));
	ge957ov8099 = (GE_ms8("ANY", 3));
	ge957ov8280 = (GE_ms8("class", 5));
	ge957ov8101 = (GE_ms8("ARRAY", 5));
	ge1247ov5380 = (GE_ms8("", 0));
	ge1448ov6254 = (GE_ms8("PE reference only allowed in DTD", 32));
	ge1448ov6216 = (GE_ms8("< not allowed in attribute value", 32));
	ge1448ov6214 = (GE_ms8("-- not allowed in comment", 25));
	ge1448ov6255 = (GE_ms8("xml prefix reserved in processing instruction", 45));
	ge1448ov6227 = (GE_ms8("Misformed XML Declaration", 25));
	ge1448ov6226 = (GE_ms8("Misplaced markup declaration", 28));
	ge1448ov6237 = (GE_ms8("End tag does not match start tag", 32));
	ge1448ov6231 = (GE_ms8("Missing element end tag", 23));
	ge1448ov6230 = (GE_ms8("Error in element content", 24));
	ge1448ov6229 = (GE_ms8("Misformed start tag", 19));
	ge1448ov6235 = (GE_ms8("Attribute declared twice", 24));
	ge1448ov6234 = (GE_ms8("Misformed attribute in tag", 26));
	ge1448ov6236 = (GE_ms8("Error in end tag", 16));
	ge1448ov6213 = (GE_ms8("]]> not allowed in content", 26));
	ge1448ov6239 = (GE_ms8("Error in XML declaration", 24));
	ge1448ov6248 = (GE_ms8("Misformed element type declaration", 34));
	ge1451ov5977 = (GE_ms8("*", 1));
	ge1451ov5975 = (GE_ms8("+", 1));
	ge1451ov5976 = (GE_ms8("\?", 1));
	ge1448ov6249 = (GE_ms8("Misformed attribute list declaration", 36));
	ge1448ov6250 = (GE_ms8("Misformed attribute definition declaration", 42));
	ge1448ov6253 = (GE_ms8("Misformed conditional section", 29));
	ge1448ov6251 = (GE_ms8("Misformed entity declaration", 28));
	ge1448ov6252 = (GE_ms8("Misformed entity notation", 25));
	ge1448ov6246 = (GE_ms8("Parser is not configured to support external DTDs", 49));
	ge1444ov9832 = (GE_ms8("1.0", 3));
	ge1444ov9833 = (GE_ms8("utf-8", 5));
	ge1448ov6219 = (GE_ms8("unsupported character encoding", 30));
	ge1448ov6242 = (GE_ms8("External reference in quoted value", 34));
	ge1448ov6262 = (GE_ms8("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1448ov6263 = (GE_ms8("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1448ov6264 = (GE_ms8("Invalid UTF8 character sequence", 31));
	ge1448ov6257 = (GE_ms8("Name misformed", 14));
	ge1448ov6240 = (GE_ms8("Literal entity expected in attribute", 36));
	ge1448ov6241 = (GE_ms8("Entity is not defined", 21));
	ge1448ov6243 = (GE_ms8("Entity cannot be recursively included", 37));
	ge1448ov6247 = (GE_ms8("Undefined PE entity", 19));
	ge121ov4795 = (GE_ms8("empty_name", 10));
	ge1446ov10124 = (GE_ms8("us-ascii", 8));
	ge1446ov10126 = (GE_ms8("utf-8", 5));
	ge1260ov2659 = (GE_ms8("found invalid expression \'$1\' at $2", 35));
	ge1254ov2659 = (GE_ms8("attribute \'$2\' of element <$1> at $4 is obsolete, use element $3 instead", 72));
	ge1270ov2659 = (GE_ms8("option name \'$1\' in option-element is unknown $2", 48));
	ge1267ov2659 = (GE_ms8("<exclude> at $1 is obsolete, use \'if\'/\'unless\' attributes instead", 65));
	ge1269ov2659 = (GE_ms8("found unknown element \'$2\' in element \'$1\' $3", 45));
	ge1266ov2659 = (GE_ms8("<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead", 97));
	ge1262ov2659 = (GE_ms8("element \'$1\' must have child-element \'$2\' $3", 44));
	ge1261ov2659 = (GE_ms8("element \'$1\' must have attribute \'$2\' $3", 40));
	ge1273ov2659 = (GE_ms8("Xace document must have a \'$1\' root-element $2", 46));
	ge1257ov2659 = (GE_ms8("element <$1> at $3 is obsolete, use element $2 instead", 54));
	ge1268ov2659 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a positive integer value $4", 70));
	ge1272ov2659 = (GE_ms8("attribute \'$2\' in element \'$1\' should have one of the following values: $4 $5", 77));
	ge1264ov2659 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a non-empty value $3", 63));
	ge1255ov2659 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a boolean value $4", 61));
	ge1263ov2659 = (GE_ms8("Library \'$1\' mounted with incompatible prefixes \'$2\' and \'$3\' in $4 and $5", 74));
	ge1265ov2659 = (GE_ms8("\'$1\' is not an Xace file", 24));
	ge1294ov2659 = (GE_ms8("$1", 2));
	ge1291ov2659 = (GE_ms8("$0: cannot write to \'$1\'", 24));
	ge1290ov2659 = (GE_ms8("$0: cannot read \'$1\'", 20));
	ge1300ov2659 = (GE_ms8("usage: $0 $1", 12));
}

EIF_TYPE GE_types[448] = {
{0, 0, EIF_FALSE, 0},
{0, 1, EIF_FALSE, 0},
{0, 2, EIF_FALSE, 0},
{0, 3, EIF_FALSE, 0},
{0, 4, EIF_FALSE, 0},
{0, 5, EIF_FALSE, 0},
{0, 6, EIF_FALSE, 0},
{0, 7, EIF_FALSE, 0},
{0, 8, EIF_FALSE, 0},
{0, 9, EIF_FALSE, 0},
{0, 10, EIF_FALSE, 0},
{0, 11, EIF_FALSE, 0},
{0, 12, EIF_FALSE, 0},
{0, 13, EIF_FALSE, 0},
{0, 14, EIF_FALSE, 0},
{0, 15, EIF_TRUE, 0},
{0, 16, EIF_TRUE, 0},
{0, 17, EIF_FALSE, 0},
{0, 18, EIF_FALSE, 0},
{0, 19, EIF_FALSE, 0},
{0, 20, EIF_FALSE, 0},
{0, 21, EIF_FALSE, 0},
{0, 22, EIF_FALSE, 0},
{0, 23, EIF_FALSE, 0},
{0, 24, EIF_FALSE, 0},
{0, 25, EIF_FALSE, 0},
{0, 26, EIF_FALSE, 0},
{0, 27, EIF_FALSE, 0},
{0, 28, EIF_FALSE, 0},
{0, 29, EIF_FALSE, 0},
{0, 30, EIF_FALSE, 0},
{0, 31, EIF_FALSE, 0},
{0, 32, EIF_FALSE, 0},
{0, 33, EIF_FALSE, 0},
{0, 34, EIF_FALSE, 0},
{0, 35, EIF_FALSE, 0},
{0, 36, EIF_FALSE, 0},
{0, 37, EIF_FALSE, 0},
{0, 38, EIF_FALSE, 0},
{0, 39, EIF_FALSE, 0},
{0, 40, EIF_FALSE, 0},
{0, 41, EIF_FALSE, 0},
{0, 42, EIF_FALSE, 0},
{0, 43, EIF_FALSE, 0},
{0, 44, EIF_FALSE, 0},
{0, 45, EIF_FALSE, 0},
{0, 46, EIF_FALSE, 0},
{0, 47, EIF_FALSE, 0},
{0, 48, EIF_FALSE, 0},
{0, 49, EIF_FALSE, 0},
{0, 50, EIF_TRUE, 0},
{0, 51, EIF_TRUE, 0},
{0, 52, EIF_FALSE, 0},
{0, 53, EIF_FALSE, 0},
{0, 54, EIF_FALSE, 0},
{0, 55, EIF_FALSE, 0},
{0, 56, EIF_FALSE, 0},
{0, 57, EIF_FALSE, 0},
{0, 58, EIF_FALSE, 0},
{0, 59, EIF_FALSE, 0},
{0, 60, EIF_FALSE, 0},
{0, 61, EIF_FALSE, 0},
{0, 62, EIF_FALSE, 0},
{0, 63, EIF_FALSE, 0},
{0, 64, EIF_FALSE, 0},
{0, 65, EIF_FALSE, 0},
{0, 66, EIF_FALSE, 0},
{0, 67, EIF_FALSE, 0},
{0, 68, EIF_FALSE, 0},
{0, 69, EIF_FALSE, 0},
{0, 70, EIF_FALSE, 0},
{0, 71, EIF_FALSE, 0},
{0, 72, EIF_FALSE, 0},
{0, 73, EIF_FALSE, 0},
{0, 74, EIF_FALSE, 0},
{0, 75, EIF_FALSE, 0},
{0, 76, EIF_FALSE, 0},
{0, 77, EIF_FALSE, 0},
{0, 78, EIF_FALSE, 0},
{0, 79, EIF_FALSE, &T79f37},
{0, 80, EIF_FALSE, 0},
{0, 81, EIF_FALSE, &T81f21},
{0, 82, EIF_FALSE, 0},
{0, 83, EIF_FALSE, 0},
{0, 84, EIF_FALSE, 0},
{0, 85, EIF_FALSE, 0},
{0, 86, EIF_FALSE, 0},
{0, 87, EIF_FALSE, 0},
{0, 88, EIF_FALSE, 0},
{0, 89, EIF_FALSE, 0},
{0, 90, EIF_FALSE, 0},
{0, 91, EIF_FALSE, 0},
{0, 92, EIF_FALSE, 0},
{0, 93, EIF_FALSE, 0},
{0, 94, EIF_FALSE, 0},
{0, 95, EIF_FALSE, 0},
{0, 96, EIF_FALSE, 0},
{0, 97, EIF_FALSE, 0},
{0, 98, EIF_FALSE, 0},
{0, 99, EIF_FALSE, 0},
{0, 100, EIF_FALSE, 0},
{0, 101, EIF_FALSE, 0},
{0, 102, EIF_FALSE, 0},
{0, 103, EIF_FALSE, 0},
{0, 104, EIF_FALSE, 0},
{0, 105, EIF_FALSE, 0},
{0, 106, EIF_TRUE, 0},
{0, 107, EIF_FALSE, 0},
{0, 108, EIF_FALSE, 0},
{0, 109, EIF_FALSE, 0},
{0, 110, EIF_FALSE, 0},
{0, 111, EIF_FALSE, 0},
{0, 112, EIF_FALSE, 0},
{0, 113, EIF_FALSE, 0},
{0, 114, EIF_FALSE, 0},
{0, 115, EIF_FALSE, 0},
{0, 116, EIF_FALSE, 0},
{0, 117, EIF_FALSE, 0},
{0, 118, EIF_FALSE, 0},
{0, 119, EIF_FALSE, 0},
{0, 120, EIF_FALSE, 0},
{0, 121, EIF_FALSE, 0},
{0, 122, EIF_FALSE, 0},
{0, 123, EIF_FALSE, 0},
{0, 124, EIF_FALSE, 0},
{0, 125, EIF_FALSE, 0},
{0, 126, EIF_FALSE, 0},
{0, 127, EIF_FALSE, 0},
{0, 128, EIF_FALSE, 0},
{0, 129, EIF_FALSE, 0},
{0, 130, EIF_FALSE, 0},
{0, 131, EIF_FALSE, 0},
{0, 132, EIF_FALSE, 0},
{0, 133, EIF_FALSE, 0},
{0, 134, EIF_FALSE, 0},
{0, 135, EIF_FALSE, 0},
{0, 136, EIF_FALSE, 0},
{0, 137, EIF_FALSE, 0},
{0, 138, EIF_FALSE, 0},
{0, 139, EIF_FALSE, 0},
{0, 140, EIF_FALSE, 0},
{0, 141, EIF_FALSE, 0},
{0, 142, EIF_FALSE, 0},
{0, 143, EIF_FALSE, 0},
{0, 144, EIF_FALSE, 0},
{0, 145, EIF_FALSE, 0},
{0, 146, EIF_FALSE, 0},
{0, 147, EIF_FALSE, 0},
{0, 148, EIF_FALSE, 0},
{0, 149, EIF_FALSE, 0},
{0, 150, EIF_FALSE, 0},
{0, 151, EIF_FALSE, 0},
{0, 152, EIF_FALSE, 0},
{0, 153, EIF_FALSE, 0},
{0, 154, EIF_TRUE, 0},
{0, 155, EIF_FALSE, 0},
{0, 156, EIF_TRUE, 0},
{0, 157, EIF_FALSE, 0},
{0, 158, EIF_FALSE, 0},
{0, 159, EIF_FALSE, 0},
{0, 160, EIF_FALSE, 0},
{0, 161, EIF_FALSE, 0},
{0, 162, EIF_FALSE, 0},
{0, 163, EIF_FALSE, 0},
{0, 164, EIF_FALSE, 0},
{0, 165, EIF_TRUE, 0},
{0, 166, EIF_FALSE, 0},
{0, 167, EIF_FALSE, 0},
{0, 168, EIF_FALSE, 0},
{0, 169, EIF_FALSE, 0},
{0, 170, EIF_FALSE, 0},
{0, 171, EIF_FALSE, 0},
{0, 172, EIF_FALSE, 0},
{0, 173, EIF_FALSE, 0},
{0, 174, EIF_FALSE, 0},
{0, 175, EIF_TRUE, 0},
{0, 176, EIF_FALSE, 0},
{0, 177, EIF_FALSE, 0},
{0, 178, EIF_FALSE, 0},
{0, 179, EIF_FALSE, 0},
{0, 180, EIF_FALSE, 0},
{0, 181, EIF_FALSE, 0},
{0, 182, EIF_FALSE, 0},
{0, 183, EIF_FALSE, 0},
{0, 184, EIF_FALSE, 0},
{0, 185, EIF_TRUE, 0},
{0, 186, EIF_FALSE, 0},
{0, 187, EIF_TRUE, 0},
{0, 188, EIF_FALSE, 0},
{0, 189, EIF_TRUE, 0},
{0, 190, EIF_TRUE, 0},
{0, 191, EIF_FALSE, 0},
{0, 192, EIF_TRUE, 0},
{0, 193, EIF_FALSE, 0},
{0, 194, EIF_TRUE, 0},
{0, 195, EIF_FALSE, 0},
{0, 196, EIF_FALSE, 0},
{0, 197, EIF_TRUE, 0},
{0, 198, EIF_FALSE, 0},
{0, 199, EIF_TRUE, 0},
{0, 200, EIF_FALSE, 0},
{0, 201, EIF_FALSE, 0},
{0, 202, EIF_TRUE, 0},
{0, 203, EIF_FALSE, 0},
{0, 204, EIF_FALSE, 0},
{0, 205, EIF_FALSE, 0},
{0, 206, EIF_FALSE, 0},
{0, 207, EIF_FALSE, 0},
{0, 208, EIF_FALSE, 0},
{0, 209, EIF_FALSE, 0},
{0, 210, EIF_FALSE, 0},
{0, 211, EIF_FALSE, 0},
{0, 212, EIF_FALSE, 0},
{0, 213, EIF_FALSE, 0},
{0, 214, EIF_FALSE, 0},
{0, 215, EIF_FALSE, 0},
{0, 216, EIF_FALSE, 0},
{0, 217, EIF_FALSE, 0},
{0, 218, EIF_FALSE, 0},
{0, 219, EIF_FALSE, 0},
{0, 220, EIF_FALSE, 0},
{0, 221, EIF_FALSE, 0},
{0, 222, EIF_FALSE, 0},
{0, 223, EIF_FALSE, 0},
{0, 224, EIF_FALSE, 0},
{0, 225, EIF_FALSE, 0},
{0, 226, EIF_FALSE, 0},
{0, 227, EIF_FALSE, 0},
{0, 228, EIF_FALSE, 0},
{0, 229, EIF_FALSE, 0},
{0, 230, EIF_FALSE, 0},
{0, 231, EIF_FALSE, 0},
{0, 232, EIF_FALSE, 0},
{0, 233, EIF_FALSE, 0},
{0, 234, EIF_FALSE, 0},
{0, 235, EIF_FALSE, 0},
{0, 236, EIF_FALSE, 0},
{0, 237, EIF_FALSE, 0},
{0, 238, EIF_FALSE, 0},
{0, 239, EIF_TRUE, 0},
{0, 240, EIF_FALSE, 0},
{0, 241, EIF_FALSE, 0},
{0, 242, EIF_TRUE, 0},
{0, 243, EIF_FALSE, 0},
{0, 244, EIF_FALSE, 0},
{0, 245, EIF_FALSE, 0},
{0, 246, EIF_FALSE, 0},
{0, 247, EIF_FALSE, 0},
{0, 248, EIF_FALSE, 0},
{0, 249, EIF_FALSE, 0},
{0, 250, EIF_FALSE, 0},
{0, 251, EIF_FALSE, 0},
{0, 252, EIF_FALSE, 0},
{0, 253, EIF_FALSE, 0},
{0, 254, EIF_FALSE, 0},
{0, 255, EIF_FALSE, 0},
{0, 256, EIF_FALSE, 0},
{0, 257, EIF_FALSE, 0},
{0, 258, EIF_FALSE, 0},
{0, 259, EIF_FALSE, 0},
{0, 260, EIF_FALSE, 0},
{0, 261, EIF_FALSE, 0},
{0, 262, EIF_FALSE, 0},
{0, 263, EIF_FALSE, 0},
{0, 264, EIF_FALSE, 0},
{0, 265, EIF_FALSE, 0},
{0, 266, EIF_FALSE, 0},
{0, 267, EIF_FALSE, 0},
{0, 268, EIF_FALSE, 0},
{0, 269, EIF_FALSE, 0},
{0, 270, EIF_FALSE, 0},
{0, 271, EIF_FALSE, 0},
{0, 272, EIF_FALSE, 0},
{0, 273, EIF_FALSE, 0},
{0, 274, EIF_FALSE, 0},
{0, 275, EIF_FALSE, 0},
{0, 276, EIF_FALSE, 0},
{0, 277, EIF_FALSE, 0},
{0, 278, EIF_FALSE, 0},
{0, 279, EIF_FALSE, 0},
{0, 280, EIF_FALSE, 0},
{0, 281, EIF_FALSE, 0},
{0, 282, EIF_FALSE, 0},
{0, 283, EIF_FALSE, 0},
{0, 284, EIF_FALSE, 0},
{0, 285, EIF_FALSE, 0},
{0, 286, EIF_FALSE, 0},
{0, 287, EIF_FALSE, 0},
{0, 288, EIF_FALSE, 0},
{0, 289, EIF_FALSE, 0},
{0, 290, EIF_FALSE, 0},
{0, 291, EIF_FALSE, 0},
{0, 292, EIF_FALSE, 0},
{0, 293, EIF_FALSE, 0},
{0, 294, EIF_FALSE, 0},
{0, 295, EIF_FALSE, 0},
{0, 296, EIF_FALSE, 0},
{0, 297, EIF_FALSE, 0},
{0, 298, EIF_FALSE, 0},
{0, 299, EIF_FALSE, 0},
{0, 300, EIF_TRUE, 0},
{0, 301, EIF_FALSE, 0},
{0, 302, EIF_FALSE, 0},
{0, 303, EIF_FALSE, 0},
{0, 304, EIF_FALSE, 0},
{0, 305, EIF_FALSE, 0},
{0, 306, EIF_FALSE, 0},
{0, 307, EIF_FALSE, 0},
{0, 308, EIF_FALSE, 0},
{0, 309, EIF_FALSE, 0},
{0, 310, EIF_FALSE, 0},
{0, 311, EIF_FALSE, 0},
{0, 312, EIF_FALSE, 0},
{0, 313, EIF_FALSE, 0},
{0, 314, EIF_FALSE, 0},
{0, 315, EIF_FALSE, 0},
{0, 316, EIF_FALSE, 0},
{0, 317, EIF_FALSE, 0},
{0, 318, EIF_FALSE, 0},
{0, 319, EIF_FALSE, 0},
{0, 320, EIF_FALSE, 0},
{0, 321, EIF_FALSE, 0},
{0, 322, EIF_FALSE, 0},
{0, 323, EIF_FALSE, 0},
{0, 324, EIF_FALSE, 0},
{0, 325, EIF_FALSE, 0},
{0, 326, EIF_FALSE, 0},
{0, 327, EIF_FALSE, 0},
{0, 328, EIF_FALSE, 0},
{0, 329, EIF_FALSE, 0},
{0, 330, EIF_FALSE, 0},
{0, 331, EIF_FALSE, 0},
{0, 332, EIF_FALSE, 0},
{0, 333, EIF_FALSE, 0},
{0, 334, EIF_FALSE, 0},
{0, 335, EIF_FALSE, 0},
{0, 336, EIF_FALSE, 0},
{0, 337, EIF_FALSE, 0},
{0, 338, EIF_FALSE, 0},
{0, 339, EIF_FALSE, 0},
{0, 340, EIF_FALSE, 0},
{0, 341, EIF_TRUE, 0},
{0, 342, EIF_TRUE, 0},
{0, 343, EIF_FALSE, 0},
{0, 344, EIF_FALSE, 0},
{0, 345, EIF_FALSE, 0},
{0, 346, EIF_FALSE, 0},
{0, 347, EIF_FALSE, 0},
{0, 348, EIF_FALSE, 0},
{0, 349, EIF_TRUE, 0},
{0, 350, EIF_FALSE, 0},
{0, 351, EIF_FALSE, 0},
{0, 352, EIF_FALSE, 0},
{0, 353, EIF_TRUE, 0},
{0, 354, EIF_FALSE, 0},
{0, 355, EIF_TRUE, 0},
{0, 356, EIF_FALSE, 0},
{0, 357, EIF_FALSE, 0},
{0, 358, EIF_FALSE, 0},
{0, 359, EIF_FALSE, 0},
{0, 360, EIF_FALSE, 0},
{0, 361, EIF_FALSE, 0},
{0, 362, EIF_FALSE, 0},
{0, 363, EIF_FALSE, 0},
{0, 364, EIF_FALSE, 0},
{0, 365, EIF_FALSE, 0},
{0, 366, EIF_FALSE, 0},
{0, 367, EIF_FALSE, 0},
{0, 368, EIF_FALSE, 0},
{0, 369, EIF_FALSE, 0},
{0, 370, EIF_FALSE, 0},
{0, 371, EIF_FALSE, 0},
{0, 372, EIF_FALSE, 0},
{0, 373, EIF_FALSE, 0},
{0, 374, EIF_FALSE, 0},
{0, 375, EIF_FALSE, 0},
{0, 376, EIF_FALSE, 0},
{0, 377, EIF_FALSE, 0},
{0, 378, EIF_FALSE, 0},
{0, 379, EIF_FALSE, 0},
{0, 380, EIF_FALSE, 0},
{0, 381, EIF_FALSE, 0},
{0, 382, EIF_FALSE, 0},
{0, 383, EIF_FALSE, 0},
{0, 384, EIF_FALSE, 0},
{0, 385, EIF_TRUE, 0},
{0, 386, EIF_TRUE, 0},
{0, 387, EIF_FALSE, 0},
{0, 388, EIF_FALSE, 0},
{0, 389, EIF_FALSE, 0},
{0, 390, EIF_FALSE, 0},
{0, 391, EIF_TRUE, 0},
{0, 392, EIF_FALSE, 0},
{0, 393, EIF_FALSE, 0},
{0, 394, EIF_TRUE, 0},
{0, 395, EIF_FALSE, 0},
{0, 396, EIF_FALSE, 0},
{0, 397, EIF_FALSE, 0},
{0, 398, EIF_TRUE, 0},
{0, 399, EIF_FALSE, 0},
{0, 400, EIF_FALSE, 0},
{0, 401, EIF_FALSE, 0},
{0, 402, EIF_FALSE, 0},
{0, 403, EIF_FALSE, 0},
{0, 404, EIF_FALSE, 0},
{0, 405, EIF_FALSE, 0},
{0, 406, EIF_FALSE, 0},
{0, 407, EIF_TRUE, 0},
{0, 408, EIF_FALSE, 0},
{0, 409, EIF_FALSE, 0},
{0, 410, EIF_FALSE, 0},
{0, 411, EIF_FALSE, 0},
{0, 412, EIF_FALSE, 0},
{0, 413, EIF_FALSE, 0},
{0, 414, EIF_FALSE, 0},
{0, 415, EIF_FALSE, 0},
{0, 416, EIF_FALSE, 0},
{0, 417, EIF_FALSE, 0},
{0, 418, EIF_FALSE, 0},
{0, 419, EIF_FALSE, 0},
{0, 420, EIF_FALSE, 0},
{0, 421, EIF_FALSE, 0},
{0, 422, EIF_FALSE, &T422f8},
{0, 423, EIF_TRUE, 0},
{0, 424, EIF_FALSE, 0},
{0, 425, EIF_FALSE, 0},
{0, 426, EIF_FALSE, 0},
{0, 427, EIF_FALSE, 0},
{0, 428, EIF_FALSE, 0},
{0, 429, EIF_FALSE, 0},
{0, 430, EIF_FALSE, 0},
{0, 431, EIF_FALSE, 0},
{0, 432, EIF_TRUE, 0},
{0, 433, EIF_FALSE, 0},
{0, 434, EIF_FALSE, 0},
{0, 435, EIF_TRUE, 0},
{0, 436, EIF_FALSE, 0},
{0, 437, EIF_FALSE, 0},
{0, 438, EIF_TRUE, 0},
{0, 439, EIF_FALSE, 0},
{0, 440, EIF_FALSE, 0},
{0, 441, EIF_FALSE, 0},
{0, 442, EIF_FALSE, 0},
{0, 443, EIF_FALSE, 0},
{0, 444, EIF_FALSE, 0},
{0, 445, EIF_FALSE, 0},
{0, 446, EIF_FALSE, 0},
{0, 447, EIF_FALSE, 0}
};

int main(int argc, char** argv)
{
	T0* t1;
	GE_argc = argc;
	GE_argv = argv;
	GE_last_rescue = 0;
	GE_init_gc();
	GE_const_init();
#ifdef EIF_WINDOWS
	eif_hInstance = GetModuleHandle(NULL);
#endif
	t1 = T21c20();
	return 0;
}


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class ARGUMENTS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_ARGUMENTS_C
#define GE_ARGUMENTS_C

#ifdef __cplusplus
extern "C" {
#endif

int GE_argc;
char** GE_argv;

	/* Clean up function */
typedef void (* EIF_CLEANUP)(EIF_BOOLEAN);
void eif_register_cleanup(EIF_CLEANUP f){
	/* TODO: Needed to compile some code at AXAR */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_register_cleanup' in 'ge_arguments.h' not implemented\n");
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class EXCEPTION"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EXCEPTION_C
#define GE_EXCEPTION_C

#ifdef __cplusplus
extern "C" {
#endif

/*
	Context of last feature entered containing a rescue clause.
	Warning: this is not thread-safe.
*/
GE_rescue* GE_last_rescue;

/*
	Raise an exception with code 'code'.
*/
void GE_raise(int code)
{
	GE_rescue* r = GE_last_rescue;
	if (r != 0) {
		GE_last_rescue = r->previous;
		GE_longjmp(r->jb, code);
	}
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "Unhandled exception\n");
	exit(1);
}

/*
	Check whether the type id of 'obj' is not in 'type_ids'.
	If it is, then raise a CAT-call exception. Don't do anything if 'obj' is Void.
	'nb' is the number of ids in 'type_ids' and is expected to be >0.
	'type_ids' is sorted in increasing order.
	Return 'obj'.
*/
EIF_REFERENCE GE_check_catcall(EIF_REFERENCE obj, int type_ids[], int nb)
{
	if (obj) {
		int type_id = obj->id;
		if (type_id < type_ids[0]) {
			/* Done */
		} else if (type_id > type_ids[nb-1]) {
			/* Done */
		} else {
			int i;
			for (i = 0; i < nb; i++) {
				if (type_id == type_ids[i]) {
#ifdef EIF_WINDOWS
					GE_show_console();
#endif
					fprintf(stderr, "CAT-call error!\n");
#ifdef EIF_DEBUG
					{
						char c;
						fprintf(stderr, "Press Enter...\n");
						scanf("%c", &c);
					}
#endif
					GE_raise(24);
					break;
				} else if (type_id < type_ids[i]) {
						/* type-ids are sorted in increasing order. */
					break;
				}
			}
		}
	}
	return (obj);
}

/*
	Check whether 'obj' is Void.
	If it is, then raise a call-on-void-target exception.
	Return 'obj'
*/
EIF_REFERENCE GE_check_void(EIF_REFERENCE obj)
{
	if (!obj) {
#ifdef EIF_WINDOWS
		GE_show_console();
#endif
		fprintf(stderr, "Call on Void target!\n");
#ifdef EIF_DEBUG
		{
			char c;
			fprintf(stderr, "Press Enter...\n");
			scanf("%c", &c);
		}
#endif
		GE_raise(1);
	}
	return (obj);
}

/*
	Check whether 'ptr' is a null pointer.
	If it is, then raise a no-more-memory exception.
	Return 'ptr'
*/
void* GE_check_null(void* ptr)
{
	if (!ptr) {
#ifdef EIF_WINDOWS
		GE_show_console();
#endif
		fprintf(stderr, "No more memory!\n");
#ifdef EIF_DEBUG
		{
			char c;
			fprintf(stderr, "Press Enter...\n");
			scanf("%c", &c);
		}
#endif
		GE_raise(2);
	}
	return (ptr);
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_CONSOLE_C
#define GE_CONSOLE_C

#ifdef EIF_WINDOWS
#include <stdio.h>
#include <windows.h>
#include <io.h>
#include <fcntl.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

static EIF_BOOLEAN GE_console_allocated = EIF_FALSE;

/*
	Create a new DOS console if needed (i.e. in case of a Windows application).
*/
void GE_show_console(void)
{
	if (!GE_console_allocated) {
		HANDLE hconin, hconout, hconerr;
		CONSOLE_SCREEN_BUFFER_INFO csbi;
		BOOL bLaunched;
		BOOL bSuccess;
		int hCrt;
#ifndef EIF_BORLAND
		FILE *hf;
extern FILE * _fdopen(int, const char *); /* Needed for lcc-win32 */
#endif

		bSuccess = AllocConsole();
			/* Get all Std handles and raise an IO exception if we fail getting one. */
		hconout = GetStdHandle(STD_OUTPUT_HANDLE);
		if (hconout == INVALID_HANDLE_VALUE) {
			GE_raise(24);
		}
		hconerr = GetStdHandle(STD_ERROR_HANDLE);
		if (hconerr == INVALID_HANDLE_VALUE) {
			GE_raise(24);
		}
		hconin = GetStdHandle(STD_INPUT_HANDLE);
		if (hconin == INVALID_HANDLE_VALUE) {
			GE_raise(24);
		}
		if (bSuccess) {
				/*
					Console was manually created, we are most likely in
					a Windows application that tries to output something.
					Therefore we need to correctly associated all standard
					handles `stdin', `stdout' and `stderr' to the new created console.
					Code was taken from http://codeguru.earthweb.com/console/Console.html
					But also checkout Microsoft support web site:
					http://support.microsoft.com/default.aspx?scid=kb;EN-US;q105305
					Note: For Borland, the above trick does not work, one has to
					duplicate the handle, unfortunately the solution does not work
					with Microsoft which explains the ifdef statement.
				*/
			hCrt = _open_osfhandle((intptr_t) hconout, _O_TEXT);
#ifdef EIF_BORLAND
			dup2(hCrt, _fileno(stdout));
#else
			hf = _fdopen (hCrt, "w");
			*stdout = *hf;
#endif
			setvbuf(stdout, NULL, _IONBF, 0);
			hCrt = _open_osfhandle((intptr_t) hconerr, _O_TEXT);
#ifdef EIF_BORLAND
			dup2(hCrt, _fileno(stderr));
#else
			hf = _fdopen(hCrt, "w");
			*stderr = *hf;
#endif
			setvbuf(stderr, NULL, _IONBF, 0);
			hCrt = _open_osfhandle((intptr_t) hconin, _O_TEXT | _O_RDONLY);
#ifdef EIF_BORLAND
			dup2(hCrt, _fileno(stdin));
#else
			hf = _fdopen(hCrt, "r");
			*stdin = *hf;
#endif
		}
			/*
				We are computing the cursor position to figure out, if the application
				has been launched from a DOS console or from the Windows Shell.
			*/
		GetConsoleScreenBufferInfo(hconout, &csbi);
		bLaunched = ((csbi.dwCursorPosition.X == 0) && (csbi.dwCursorPosition.Y == 0));
		if ((csbi.dwSize.X <= 0) || (csbi.dwSize.Y <= 0))
			bLaunched = FALSE;
/*
		if (bLaunched == TRUE)
			eif_register_cleanup (eif_console_cleanup);
*/

		GE_console_allocated = EIF_TRUE;
	}
}

#endif

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement the program initialization"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_MAIN_C
#define GE_MAIN_C

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

/*
	Main entry point when compiling a Windows application.
	See:
		http://en.wikipedia.org/wiki/WinMain
		http://msdn2.microsoft.com/en-us/library/ms633559.aspx
*/
extern int main(int argc, char** argv);
extern void GE_get_argcargv(char* cmd, int* argc, char*** argvp);
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	int code;
	int argc;
	char** argv;
	char* cmd;
	cmd = strdup(GetCommandLineA());
	GE_get_argcargv(cmd, &argc, &argv);
	code = main(argc, argv);
	free(cmd);
	free(argv);
	return code;
}

/*
	Break the shell command held in 'cmd', putting each shell word
	in a separate array entry, hence building an argument
	suitable for the 'main'. Note that 'cmd' will be altered
	and 'argvp' will point to some chunks of it.
*/
void GE_get_argcargv(char* cmd, int* argc, char*** argvp)
{
	int quoted = 0; /* parsing inside a quoted string? */
	int nbs; /* number of backspaces */
	int i;
	char *p = NULL, *pe = NULL; /* pointers in `cmd' */
	char *qb = NULL, *q = NULL; /* pointers in arguments */

	*argc = 0;
	/* Remove leading and trailing white spaces */
	for (p = cmd; *p == ' ' || *p == '\t'; p++)
		; /* empty */
	for (pe = p + strlen(p) - 1; pe >= p && (*pe == ' ' || *pe == '\t'); pe--)
		; /* empty */
	if (p <= pe) {
		*argc = *argc + 1; /* at least one argument */
		qb = q = malloc(pe - p + 2);
		if (!qb) {
			return;
		}
		do {
			switch(*p) {
				case ' ':
				case '\t':
					if (quoted) {
						do {
							*q++ = *p++; 
						} while(*p == ' ' || *p == '\t');
					} else {
						do {
							p++;
						} while(*p == ' ' || *p == '\t');
						*q++ = '\0';
						*argc = *argc + 1;
					}
					break;
				case '\"':
					quoted = ! quoted;
					p++;
					break;
				case '\\':
					for (nbs = 0; *p == '\\'; nbs++)
						*q++ = *p++;
					if (*p == '\"') {
						if (nbs % 2) { /* odd number of backslashes */
							q -= (nbs + 1) / 2;
							*q++ = *p++;
						} else { /* even number of backslashes */
							quoted = ! quoted;
							q -= nbs / 2;
							p++;
						}
					}
					break;
				default:
					*q++ = *p++;
			}
		} while (p <= pe);
		*q++ = '\0';
	}

	if (!argvp) {
		free(qb);
		return;
	}

	*argvp = (char**)malloc((*argc+1)*sizeof(char*));
	if (!(*argvp)) {
		free(qb);
		return;
	}

	for (i = 0; i < *argc; i++) {
		(*argvp)[i] = qb;
		qb += strlen(qb) + 1;
	}
	(*argvp)[i] = (char *)0;
}

#endif

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to access garbage collector facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_GC_C
#define GE_GC_C

#ifdef EIF_BOEHM_GC
/*
 * Call dispose routine `disp' on object `C'.
 */
void GE_boehm_dispose(void* C, void* disp) {
#ifdef EIF_EXCEPTION_TRACE
	((GE_types[((EIF_REFERENCE)C)->id]).dispose)(0,(EIF_REFERENCE)C);
#else
	((GE_types[((EIF_REFERENCE)C)->id]).dispose)((EIF_REFERENCE)C);
#endif
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_C
#define EIF_EXCEPT_C

#ifdef __cplusplus
extern "C" {
#endif

void eraise(char* name, long code) {
	GE_raise((int)code);
}

void esdie(int code) {
	exit(code);
}

EIF_REFERENCE eename(long except) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eename' in 'eif_except.h' not implemented\n");
	return EIF_VOID;
}

char* eeltag(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeltag' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eelrout(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eelrout' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eelclass(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eelclass' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

long eelcode(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eelcode' in 'eif_except.h' not implemented\n");
	return 0;
}

EIF_REFERENCE stack_trace_string(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'stack_trace_string' in 'eif_except.h' not implemented\n");
	return EIF_VOID;
}

char* eeotag(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeotag' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

long eeocode(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeocode' in 'eif_except.h' not implemented\n");
	return 0;
}

char* eeorout(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeorout' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eeoclass(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeoclass' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

void eecatch(long code) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eecatch' in 'eif_except.h' not implemented\n");
}

void eeignore(long code) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeignore' in 'eif_except.h' not implemented\n");
}

void eetrace(char b) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eetrace' in 'eif_except.h' not implemented\n");
}

#ifdef EIF_WINDOWS
void set_windows_exception_filter() {
	/* TODO: Needed to compile some code at AXAR */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'set_windows_exception_filter' in 'eif_except.h' not implemented\n");
}
#endif

/*
 * Raise an Eiffel exception of the given code with no associated tag.
 */
void xraise(int code) {
	eraise(NULL, (long)code);
}

/*
 * Raise 'Operating system error' exception.
 */
void esys(void) {
	if (errno == 0) {
			/* External event */
		xraise(EN_EXT);
	} else {
			/* Operating system error */
		xraise(EN_SYS);
	}
}

/*
 * As a special case, an I/O error is raised when a system call which is
 * I/O bound fails.
 */
void eise_io(char *tag) {
	eraise(tag, EN_ISE_IO);		/* I/O error */
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_FILE_C
#define EIF_FILE_C

/* HAS_CHOWN:
 *	This symbol, if defined, indicates that the chown routine is
 *	available.
 */
#ifndef EIF_WINDOWS
#define HAS_CHOWN
#endif

/* HAS_GETEUID:
 *	This symbol, if defined, indicates that the geteuid system call is
 *	available
 */
#ifndef EIF_WINDOWS
#define  HAS_GETEUID
#endif

/* HAS_GETGRGID:
 *	This symbol, if defined, indicates that the getgrgid system call is
 *	available
 */
#ifndef EIF_WINDOWS
#define  HAS_GETGRGID
#endif

/* HAS_GETGROUPS:
 *	This symbol, if defined, indicates that the getgroups() routine is
 *	available to get the list of process groups.  If unavailable, multiple
 *	groups are probably not supported.
 */
#ifndef EIF_WINDOWS
#define HAS_GETGROUPS
#define Groups_t gid_t	/* Type for 2nd arg to getgroups() */
#endif

/* HAS_GETPWUID:
 *	This symbol, if defined, indicates that the getpwuid system call is
 *	available
 */
#ifndef EIF_WINDOWS
#define  HAS_GETPWUID
#endif

/* HAS_LINK:
 *	This symbol, if defined, indicates that the link routine is
 *	available to create hard links.
 */
#ifndef EIF_WINDOWS
#define HAS_LINK
#endif

/* HAS_LSTAT:
 *	This symbol, if defined, indicates that the lstat routine is
 *	available to do file stats on symbolic links.
 */
#ifndef EIF_WINDOWS
#define HAS_LSTAT
#endif


#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#ifdef EIF_WINDOWS
#if defined (__BORLANDC__) && (__BORLANDC__ < 0x600) /* Borland before 6.0 */
#include <utime.h>
#else
#include <sys/utime.h>
extern int utime(const char *, struct utimbuf *); /* Needed for lcc-win32 */
#endif
#include <io.h> /* for access, chmod */
#include <direct.h> /* for (ch|mk|rm)dir */
#else
#include <utime.h>
#include <unistd.h>
#include <pwd.h>
#include <grp.h>
#endif

#ifndef NAME_MAX
#define NAME_MAX 10 /* Maximum length for user/group name */
#endif

#ifndef S_IRUSR
#define S_IRUSR 0000400
#endif
#ifndef S_IWUSR
#define S_IWUSR 0000200
#endif
#ifndef S_IXUSR
#define S_IXUSR 0000100
#endif
#ifndef S_IRGRP
#define S_IRGRP 0000040
#endif
#ifndef S_IWGRP
#define S_IWGRP 0000020
#endif
#ifndef S_IXGRP
#define S_IXGRP 0000010
#endif
#ifndef S_IROTH
#define S_IROTH 0000004
#endif
#ifndef S_IWOTH
#define S_IWOTH 0000002
#endif
#ifndef S_IXOTH
#define S_IXOTH 0000001
#endif
#ifndef S_IFDIR
#define S_IFDIR 0040000
#endif
#ifndef S_IFCHR
#define S_IFCHR 0020000
#endif
#ifndef S_IFBLK
#define S_IFBLK 0060000
#endif
#ifndef S_IFREG
#define S_IFREG 0100000
#endif
#ifndef S_IFIFO
#define S_IFIFO 0010000
#endif
#ifndef S_IFLNK
#define S_IFLNK 0120000
#endif
#ifndef S_IFSOCK
#define S_IFSOCK 0140000
#endif

/* The following access constants seems to be universally accepeted. And
 * anyway, it's only after BSD 4.1 that the symbolic constants appeared.
 */
#ifndef R_OK
#define R_OK 4
#define W_OK 2
#define X_OK 1
#define F_OK 0
#endif

/* Keep only permission mode */
#ifndef ST_MODE
#define ST_MODE 0x0fff
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Create directory `dirname'.
 */
void file_mkdir(char* dirname) {
	errno = 0;
#ifdef EIF_WINDOWS
	if (mkdir(dirname) == -1) {
#else
	if (mkdir(dirname, 0777) == -1) {
#endif
		esys(); /* Raise exception */
	}
}

/*
 * Rename file `from' into `to'.
 */
void file_rename(char* from, char* to) {
	for (;;) {
#ifdef EIF_WINDOWS
		if (file_exists(to)) {
				/* To have the same behavior as Unix, we need to remove the destination file if it exists.
				 * Of course we can do this only if `from' and `to' do not represent the same file.
				 * To check this, we use `CreateFile' to open both file, and then using the information
				 * returned by `GetFileInformationByHandle' we can check whether or not they are indeed
				 * the same. */
			BY_HANDLE_FILE_INFORMATION l_to_info, l_from_info;
			HANDLE l_from_file = CreateFile (from, GENERIC_READ, FILE_SHARE_READ, NULL,
				OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
			HANDLE l_to_file = CreateFile (to, GENERIC_READ, FILE_SHARE_READ, NULL,
					OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);

			if ((l_from_file == INVALID_HANDLE_VALUE) || (l_to_file == INVALID_HANDLE_VALUE)) {
					/* We do not need the handles anymore, simply close them. Since Microsoft
					 * API accepts INVALID_HANDLE_VALUE we don't check the validity of arguments. */
				CloseHandle(l_from_file);
				CloseHandle(l_to_file);

					/* For some reasons we cannot open the file. This should not happen, maybe the OS has
					 * removed `from' or `to'. In that case, we simply try to remove destination as we were
					 * doing in former revision of `file_rename'. */
				remove (to);
			} else {
				BOOL success = GetFileInformationByHandle (l_from_file, &l_from_info);
				success = success && GetFileInformationByHandle (l_to_file, &l_to_info);
					/* We do not need the handles anymore, simply close them. */
				CloseHandle(l_from_file);
				CloseHandle(l_to_file);
				if (success) {
						/* Check that `from' and `to' do not represent the same file. */
					if
						((l_from_info.dwVolumeSerialNumber != l_to_info.dwVolumeSerialNumber) ||
						(l_from_info.nFileIndexLow != l_to_info.nFileIndexLow) ||
						(l_from_info.nFileIndexHigh != l_to_info.nFileIndexHigh))
					{
						remove (to);
					} else {
							/* Files are identical, nothing to be done apart from */
						break;
					}
				} else {
						/* An error occurred while retrieving the information about `from' and `to'. Like
						 * for the case where `l_from_file' and `l_to_file' are invalid, we try to remove
						 * the file. */
					remove (to);
				}
			}
		}
#endif
		errno = 0;
		if (rename(from, to) == -1) {
			esys(); /* Raise exception */
		}
		break;
	}
}

/*
 * Link file `from' into `to'.
 */
void file_link(char *from, char *to) {
#ifdef HAS_LINK
	errno = 0;
	if (link(from, to) == -1) {
		esys(); /* Raise exception */
	}
#endif
}

/*
 * Delete file or directory `name'.
 */
void file_unlink(char *name) {
	struct stat buf;
	file_stat(name, &buf);
	errno = 0;
	if (buf.st_mode & S_IFDIR) {
		if (rmdir(name) == -1) {
			esys(); /* Raise exception */
		}
	} else {
		if (remove(name) == -1) {
			esys(); /* Raise exception */
		}
	}
}

static char* file_open_mode(int how) {
/* Under Windows we add the mode "N". This is to make sure that
 * files created in Eiffel are not inheritable by default as otherwise
 * it makes things too complicated for the end user when spawning
 * child processes in multithreaded mode.
 * This follows the change in EiffelStudio svn#73874.
 */
	switch (how) {
	case 0: 
#ifdef EIF_WINDOWS
		return "rtN";
#else
		return "r";
#endif
	case 1:
#ifdef EIF_WINDOWS
		return "wtN";
#else
		return "w";
#endif
	case 2:
#ifdef EIF_WINDOWS
		return "atN";
#else
		return "a";
#endif
	case 3:
#ifdef EIF_WINDOWS
		return "rt+N";
#else
		return "r+";
#endif
	case 4:
#ifdef EIF_WINDOWS
		return "wt+N";
#else
		return "w+";
#endif
	case 5:
#ifdef EIF_WINDOWS
		return "at+N";
#else
		return "a+";
#endif
	case 10: 
#ifdef EIF_WINDOWS
		return "rbN";
#else
		return "r";
#endif
	case 11:
#ifdef EIF_WINDOWS
		return "wbN";
#else
		return "w";
#endif
	case 12:
#ifdef EIF_WINDOWS
		return "abN";
#else
		return "a";
#endif
	case 13:
#ifdef EIF_WINDOWS
		return "rb+N";
#else
		return "r+";
#endif
	case 14:
#ifdef EIF_WINDOWS
		return "wb+N";
#else
		return "w+";
#endif
	case 15:
#ifdef EIF_WINDOWS
		return "ab+N";
#else
		return "a+";
#endif
	default:
#ifdef EIF_WINDOWS
		return "rtN";
#else
		return "r";
#endif
	}
}

/*
 * Open file `name' with the corresponding type `how'.
 */
EIF_POINTER file_open(char *name, int how) {
	FILE *fp;
	errno = 0;
	fp = (FILE *)fopen(name, file_open_mode(how));
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Open file `fd' with the corresponding type `how'.
 */
EIF_POINTER file_dopen(int fd, int how) {
	FILE *fp;
	errno = 0;
	fp = (FILE *)fdopen(fd, file_open_mode(how));
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
EIF_POINTER file_reopen(char *name, int how, FILE *old) {
	FILE *fp;
	errno = 0;
	fp = (FILE *)freopen(name, file_open_mode(how), old);
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Close the file.
 */
void file_close(FILE *fp) {
	errno = 0;
	if (fclose(fp) != 0) {
		esys(); /* Close failed, raise exception */
	}
}

/*
 * Flush data held in stdio buffer.
 */
void file_flush(FILE *fp) {
	errno = 0;
	if (fflush(fp) != 0) {
	    esys(); /* Flush failed, raise exception */
	}
}

/*
 * Return the associated file descriptor.
 */
EIF_INTEGER file_fd(FILE *f) {
	if (f == (FILE *)0) {
		eraise("invalid file pointer", EN_EXT);
	}
	return (EIF_INTEGER)fileno(f);
}

/*
 * Get a character from `f'.
 */
EIF_CHARACTER file_gc(FILE *f) {
	int c;
	errno = 0;
	c = getc(f);
	if (c == EOF && ferror(f)) {
		eise_io("FILE: unable to read CHARACTER value.");
	}
	return (EIF_CHARACTER)c;
}

/*
 * Get a string from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters.
 */
EIF_INTEGER file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;
	int c = '\0';
	EIF_INTEGER read;

	amount = bound - start;
	s += start;
	errno = 0;
	read = 0;
	while (amount-- > 0) {
		if ((c = getc(f)) == '\n' || c == EOF)
			break;
		*s++ = c;
		read++;
	}
	if (c == EOF && ferror(f)) {
			/* An I/O error occurred */
			/* Raise exception */
		eise_io("FILE: unable to read current line.");
	}
	if (c == EOF || c == '\n')
#ifdef EIF_WINDOWS
		if ((read > 0) && (*(s-1) == '\r'))
			return read - 1;
		else
			return read;
#else
		return read;
#endif
	if (amount == -1)
		return (read + 1);
	return bound - start + 1;
}

/*
 * Read min (bound, remaining bytes in file) characters into `s' and
 * return the number of characters read.
 */
EIF_INTEGER file_gss(FILE* f, char* s, EIF_INTEGER bound) {
	EIF_INTEGER amount;
	amount = (EIF_INTEGER)fread((void*)s, (size_t)1, (size_t)bound, f);
	if (ferror(f)) {
			/* An I/O error occurred */
			/* Raise exception */
		eise_io("FILE: unable to read stream.");
	}
	return amount;
}

/*
 * Get a word from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters. Any leading
 * spaces are skipped.
 */
EIF_INTEGER file_gw(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;
	int c = 0;

	amount = bound - start;
	s += start;
	errno = 0;
	if (start == 0) {
		while ((c = getc(f)) != EOF) {
			if (!isspace(c)) {
				break;
			}
		}
		if (c == EOF) {
			if (ferror(f)) {
					/* An I/O error occurred */
					/* Raise exception */
				eise_io("FILE: unable to read word.");
			}
				/* Reached EOF before word */
			return (EIF_INTEGER) 0;
		} else if (EOF == ungetc(c, f)) {
			eise_io("FILE: unable to read word.");
		}
	}
	while (amount-- > 0) {
		c = getc(f);
		if (c == EOF) {
			if (ferror(f)) {
					/* An I/O error occurred */
					/* Raise exception */
				eise_io("FILE: unable to read word.");
			}
			break;
		} else if (isspace(c)) {
			if (EOF == ungetc(c, f)) {
				eise_io("FILE: unable to read word.");
			}
			break;
		}
		*s++ = c;
	}
	if (c == EOF || isspace(c)) {
		return bound - start - amount - 1;
	}
	return bound - start + 1;
}

/*
 * Look ahead one character. If EOF, return 0.
 */
EIF_CHARACTER file_lh(FILE *f) {
	int c;

	errno = 0;
	c = getc(f);
	if (c == EOF) {
		if (ferror(f)) {
			eise_io("FILE: error when reading a character ahead.");
		}
	} else if (EOF == ungetc(c, f)) {
		eise_io("FILE: error when reading a character ahead.");
	}
	return (EIF_CHARACTER) (c == EOF ? (char) 0 : (char) c);
}

/*
 * Size of file `fp'.
 */
EIF_INTEGER eif_file_size(FILE *fp) {
	struct stat buf;

	errno = 0;
	if (fflush (fp) != 0) {
		esys();
	}
	if (fstat(fileno(fp), &buf) == -1) {
		esys();
		return (EIF_INTEGER)0;
	} else {
		return (EIF_INTEGER)(buf.st_size);
	}
}

/*
 * Read upto next input line.
 */
void file_tnil(FILE *f) {
	int c;

	errno = 0;
	while ((c = getc(f)) != '\n' && c != EOF)
		;
	if (c == EOF && ferror(f))
		eise_io("FILE: error during reading the end of the file.");
}

/*
 * Current position within file.
 */
EIF_INTEGER file_tell(FILE *f) {

	if (f == (FILE *) 0) {
		eraise("invalid file pointer", EN_EXT);
	}
	return (EIF_INTEGER)ftell(f);
}

/*
 * Touch file `name' by setting both access and modification time to the
 * current time stamp. This external function exists only because there
 * is no way within UNIX_FILE to get the current time stamp. Otherwise,
 * we could simply call file_utime.
 */
void file_touch(char *name) {
	file_utime(name, time((time_t *) 0), 2);
}

/*
 * Modify the modification and/or the access time stored in the file's
 * inode. The 'how' parameter tells which attributes should be set.
 */
void file_utime(char *name, time_t stamp, int how) {
	struct utimbuf tp;
	struct stat buf;

	if (how < 2) {
		file_stat(name, &buf);
		switch (how) {
		case 0: /* Change only access time */
			tp.actime = stamp;
			tp.modtime = buf.st_mtime;
			break;
		case 1: /* Change only modification time */
			tp.actime = buf.st_atime;
			tp.modtime = stamp;
			break;
		}
	} else {
		tp.actime = tp.modtime = stamp; /* Change both access and modification times */
	}
	errno = 0;
	if (utime(name, &tp) == -1) {
			/* Raise exception */
		esys();
	}
}

/*
 * This is an encapsulation of the stat() system call. The routine either
 * succeeds and returns or fails and raises the appropriate exception.
 */
void file_stat(char *path, struct stat *buf) {
	int status;			/* System call status */
	errno = 0;
#ifdef HAS_LSTAT
	status = lstat(path, buf);
	if (status == 0) {
		/* We found a file, not let's check if it is not a symbolic link,
		 * if it is the case, we need to call `stat' to make sure the link
		 * is valid. It is going to slow down current call by stating twice
		 * the info, but this case is quite rare and there is a benefit
		 * in using `lstat' over `stat' the first time as more than 90%
		 * of the files we stat are not symlink. */
		if ((buf->st_mode & S_IFLNK) == S_IFLNK) {
			status = stat(path, buf);
		}
	}
#else
	status = stat(path, buf);		/* Get file statistics */
#endif
	if (status == -1) {
			/* Raise exception */
		esys();
	}
}

/*
 * Change permissions of file `name', using an interface like chmod(1).
 * The flag is true if permissions are to be added, 0 to remove them.
 */
void file_perm(char *name, char *who, char *what, int flag) {
	int fmode;
	struct stat buf;

	file_stat(name, &buf);
	fmode = (int)buf.st_mode;
	switch (*who) {
	case 'u':
		while (*what)
			switch (*what++) {
#ifdef EIF_WINDOWS
			case 's':
				break;
			case 'r':
				break;
			case 'w':
				break;
			case 'x':
				break;
#else
			case 's':
				if (flag)
					fmode |= S_ISUID;
				else
					fmode &= ~S_ISUID;
				break;
			case 'r':
				if (flag)
					fmode |= S_IRUSR;
				else
					fmode &= ~S_IRUSR;
				break;
			case 'w':
				if (flag)
					fmode |= S_IWUSR;
				else
					fmode &= ~S_IWUSR;
				break;
			case 'x':
				if (flag)
					fmode |= S_IXUSR;
				else
					fmode &= ~S_IXUSR;
				break;
#endif
			default:
				eraise("invalid user permission", EN_EXT);
			}
		break;
	case 'g':
		while (*what)
			switch (*what++) {
			case 's':
#ifdef EIF_WINDOWS
#else
				if (flag)
					fmode |= S_ISGID;
				else
					fmode &= ~S_ISGID;
#endif
				break;
			case 'r':
				if (flag)
					fmode |= S_IRGRP;
				else
					fmode &= ~S_IRGRP;
				break;
			case 'w':
				if (flag)
					fmode |= S_IWGRP;
				else
					fmode &= ~S_IWGRP;
				break;
			case 'x':
				if (flag)
					fmode |= S_IXGRP;
				else
					fmode &= ~S_IXGRP;
				break;
			default:
				eraise("invalid group permission", EN_EXT);
			}
		break;
	case 'o':
		while (*what)
			switch (*what++) {
			case 't':
#ifdef EIF_WINDOWS
#else
				if (flag)
					fmode |= S_ISVTX;
				else
					fmode &= ~S_ISVTX;
#endif
				break;
			case 'r':
				if (flag)
					fmode |= S_IROTH;
				else
					fmode &= ~S_IROTH;
				break;
			case 'w':
				if (flag)
					fmode |= S_IWOTH;
				else
					fmode &= ~S_IWOTH;
				break;
			case 'x':
				if (flag)
					fmode |= S_IXOTH;
				else
					fmode &= ~S_IXOTH;
				break;
			default:
				eraise("invalid other permission", EN_EXT);
			}
		break;
	default:
		eraise("invalid permission target", EN_EXT);
	}
    file_chmod(name, fmode);
}

/*
 * Change permission mode on file `path'.
 */
void file_chmod(char *path, int mode) {
	errno = 0;
	if (chmod(path, mode) == -1) {
		esys();
	}
}

/*
 * Change the owner of the file to `uid'.
 */
void file_chown(char *name, int uid) {
#ifdef HAS_CHOWN
	int gid;
	struct stat buf;
	
	file_stat(name, &buf);
	gid = buf.st_gid;
	errno = 0;
	if (chown(name, uid, gid) == -1) {
		esys();
	}
#endif
}

/*
 * Change the group of the file to `gid'.
 */
void file_chgrp(char *name, int gid) {
#ifdef HAS_CHOWN
	int uid;
	struct stat buf;
	
	file_stat(name, &buf);
	uid = buf.st_uid;
	errno = 0;
	if (chown(name, uid, gid) == -1) {
		esys();
	}
#endif
}

/*
 * Put new_line onto `f'.
 */
void file_tnwl(FILE *f) {
	errno = 0;
	if (putc('\n', f) == EOF) {
		eise_io("FILE: unable to write new line.");
	}
}

/*
 * Append a copy of `other' to `f'.
 */
void file_append(FILE *f, FILE *other, EIF_INTEGER l) {
	size_t amount;
	char buffer[512];
	int bufsize = 512;

	errno = 0;
	if (fseek(other, 0, SEEK_SET) != 0) {
		esys();
	}
	if (fseek(f, 0, SEEK_END) != 0) {
		esys();
	}
	while (l > 0) {
		amount = l;
		if (l < bufsize)
			amount = l;
		else
			amount = bufsize;
		if (amount != fread(buffer, sizeof(char), amount, other)) {
			eise_io("FILE: unable to read appended file.");
			break;
		}
		l -= amount;
		if (amount != fwrite(buffer, sizeof(char), amount, f)) {
			eise_io("FILE: unable to write appended file.");
			break;
		}
	}
}

/*
 * Write string `str' on `f'.
 */
void file_ps(FILE *f, char *str, EIF_INTEGER len) {
	errno = 0;
	if (len == 0) {
		/* Nothing to be done. */
	} else if (fwrite(str, sizeof(char) * len, 1, f) != 1) {
		eise_io("FILE: unable to write STRING object.");
	}
}

/*
 * Write character `c' on `f'.
 */
void file_pc(FILE *f, char c) {
	errno = 0;
	if (putc(c, f) == EOF) {
		eise_io("FILE: unable to write CHARACTER value.");
	}
}

/*
 * Go to absolute position `pos' counted from start.
 */
void file_go(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, pos, SEEK_SET) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * Go to absolute position `pos' counted from end.
 */
void file_recede(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, -pos, SEEK_END) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * Go to absolute position `pos' counted from current position.
 */
void file_move(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, pos, SEEK_CUR) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * End of file.
 */
EIF_BOOLEAN file_feof(FILE *fp) {
	return (EIF_BOOLEAN)(feof(fp) != 0);
}

/*
 * Test whether file exists or not. If `name' represents a symbolic link,
 * it will check that pointed file does exist.
 */
EIF_BOOLEAN file_exists(char *name) {
	int status;					/* System call status */
	struct stat buf;
#ifdef HAS_LSTAT
	status = lstat(name, &buf);	/* Attempt to stat file */
	if (status == 0) {
		/* We found a file, not let's check if it is not a symbolic link,
		 * if it is the case, we need to call `stat' to make sure the link
		 * is valid. */
		if ((buf.st_mode & S_IFLNK) == S_IFLNK) {
			status = stat(name, &buf);
		}
	}
#else
	status = stat (name, &buf);
#endif
	return ((status == -1) ? EIF_FALSE : EIF_TRUE);
}

/*
 * Test whether file exists or not without following the symbolic link
 * if `name' represents one.
 */
EIF_BOOLEAN file_path_exists(char *name) {
	struct stat buf;
#ifdef HAS_LSTAT
	return ((lstat(name, &buf) == -1) ? EIF_FALSE : EIF_TRUE);
#else
	return ((stat(name, &buf) == -1) ? EIF_FALSE : EIF_TRUE);
#endif
}

/*
 * Check whether access permission `op' are possible on file `name' using
 * real UID and real GID. This is probably only useful to setuid or setgid
 * programs.
 */
EIF_BOOLEAN file_access(char *name, EIF_INTEGER op) {
	switch (op) {
	case 0: /* Does file exist? */
		return (EIF_BOOLEAN) ((access(name, F_OK) != -1) ? EIF_TRUE : EIF_FALSE);
	case 1: /* Test for search permission */
		return (EIF_BOOLEAN) ((access(name, X_OK) != -1) ? EIF_TRUE : EIF_FALSE);
	case 2: /* Test for write permission */
		return (EIF_BOOLEAN) ((access(name, W_OK) != -1) ? EIF_TRUE : EIF_FALSE);
	case 3: /* Test for read permission */
		return (EIF_BOOLEAN) ((access(name, R_OK) != -1) ? EIF_TRUE : EIF_FALSE);
	default:
		return EIF_FALSE;
	}
}

/*
 * Check whether the file `path' may be created: we need write permissions
 * in the parent directory and there must not be any file bearing that name
 * with no write permissions...
 */
EIF_BOOLEAN file_creatable(char *path, EIF_INTEGER length) {
	struct stat buf;
	char *temp = NULL;
	char *ptr;
	size_t n;

#ifdef EIF_WINDOWS
	ptr = strrchr(path, '\\');
#else
	ptr = strrchr(path, '/');
#endif
	if (ptr != (char *) 0) {
		n = ptr - path;
#ifdef EIF_WINDOWS
		if ((ptr == path) || (*(ptr-1) == ':'))
				/* path is of the form a:\bbb or \bbb, parent is a:\ or \ */
			n = n + 1;
#endif
		temp = (char*)malloc(n + 1);
		strncpy(temp, path, n);
		temp[n] = '\0';
	} else {
		temp = (char*)malloc(2);
		temp[0] = '.';
		temp[1] = '\0';
	}

		/* Does the parent exist? */
	if (!file_exists(temp)) {
		free(temp);
		return EIF_FALSE;
	}

	file_stat(temp, &buf);
	free(temp);

	if (buf.st_mode & S_IFDIR)	/* Is parent a directory? */
		if (file_eaccess(&buf, 1)) {	/* Check for write permissions */
				/* Check if a non writable file `path' exists */
			if (file_exists(path)) {
				file_stat(path, &buf);
				if (buf.st_mode & S_IFDIR)
					return EIF_FALSE;	/* is a directory */
				return (file_eaccess(&buf, 1)); /* Check for write permissions to re create it */
			}

			return EIF_TRUE;
		}

	return EIF_FALSE;
}

/*
 * Swallow next character if it is a new line.
 */
static void swallow_nl(FILE *f) {
	if (f != stdin) {
			/* getc() cannot be used as it doesn't set the EOF flag */
		fscanf (f, "\n");
	} else {
		int c;
		errno = 0;
		c = getc(f);
		if (c == EOF && ferror(f)) {
			eise_io("FILE: error during reading the end of the file.");
		} else if (c != '\n' && EOF == ungetc(c, f)) {
			eise_io("FILE: End of file.");
		}
	}
}

/*
 * Get an integer from `f'.
 */
EIF_INTEGER file_gi(FILE *f) {
	EIF_INTEGER i;     

	errno = 0;
	if (fscanf(f, "%d", &i) < 0) {
		eise_io("FILE: unable to read INTEGER value.");
	}
	swallow_nl(f);
	return i;
}

/*
 * Get a real from `f'.
 */
EIF_REAL_32 file_gr(FILE *f) {
	EIF_REAL_32 r;     
	errno = 0;
	if (fscanf(f, "%f", &r) < 0) {
		eise_io("FILE: unable to read REAL value.");
	}
	swallow_nl(f);
	return r;
}

/*
 * Get a double from `f'.
 */
EIF_REAL_64 file_gd(FILE *f) {
	EIF_REAL_64 d;     
	errno = 0;
	if (fscanf(f, "%lf", &d) < 0) {
		eise_io("FILE: unable to read DOUBLE value.");
	}
	swallow_nl(f);
	return d;
}

/*
 * Write `number' on `f'.
 */
void file_pi(FILE *f, EIF_INTEGER number) {
	errno = 0;
	if (fprintf(f, "%d", number) < 0) {
		eise_io("FILE: unable to write INTEGER value.");
	}
}

/*
 * Write `number' on `f'.
 */
void file_pr(FILE *f, EIF_REAL_32 number) {
	errno = 0;
    if (0 > fprintf (f, "%g", number) < 0) {
		eise_io("FILE: unable to write REAL value.");
	}
}

/*
 * Write double `val' onto `f'.
 */
void file_pd(FILE *f, EIF_REAL_64 val) {
	errno = 0;
	if (fprintf(f, "%.17g", val) < 0) {
		eise_io("FILE: unable to write DOUBLE value.");
	}
}

/*
 * Size of the stat structure. This is used by the Eiffel side to create
 * the area (special object) which will play the role of a stat buffer
 * structure.
 */
EIF_INTEGER stat_size(void) {
	return (EIF_INTEGER)sizeof(struct stat);
}

#ifdef HAS_GETGROUPS
/*
 * Does the list of groups the user belongs to include `gid'?
 */
static EIF_BOOLEAN eif_group_in_list(int gid) {
	Groups_t *group_list;
	int i, nb_groups, nb_groups_max;

	nb_groups_max = getgroups(0, (Groups_t *)0);
	if (nb_groups_max <= 0) {
		return EIF_FALSE;
	} else {
		group_list = (Groups_t *)malloc(nb_groups_max * sizeof(Groups_t));
		if (group_list == (Groups_t *)0) {
			xraise(EN_IO);
			return EIF_FALSE;
		} else if ((nb_groups = getgroups(nb_groups_max, group_list)) == -1) {
			free(group_list);
			xraise(EN_IO);
			return EIF_FALSE;
		} else {
			for (i=0; i< nb_groups; i++)
				if (group_list[i] == gid) {
					free(group_list);
					return EIF_TRUE;
				}
			free(group_list);
			return EIF_FALSE;
		}
	}
}
#endif

/*
 * Check file permissions using effective UID and effective GID. The
 * current permission mode is held in the st_mode field of the stat()
 * buffer structure `buf'.
 */
EIF_BOOLEAN file_eaccess(struct stat *buf, int op) {
	int mode = buf->st_mode & ST_MODE;	/* Current mode */
#ifdef HAS_GETEUID
	int uid = buf->st_uid;				/* File owner */
	int gid = buf->st_gid;				/* File group */
	int euid, egid;						/* Effective user and group */
#endif

    switch (op) {
	case 0: /* Is file readable */
#ifdef EIF_WINDOWS
	return ((mode && S_IREAD) ? EIF_TRUE : EIF_FALSE);
#elif defined HAS_GETEUID
		euid = geteuid();
		egid = getegid();

		if (euid == 0)
			return EIF_TRUE;
		else if (uid == euid)
			return ((mode & S_IRUSR) ? EIF_TRUE : EIF_FALSE);
		else if (gid == egid)
			return ((mode & S_IRGRP) ? EIF_TRUE : EIF_FALSE);
#ifdef HAS_GETGROUPS
		else if (eif_group_in_list(gid))
			return ((mode & S_IRGRP) ? EIF_TRUE : EIF_FALSE);
#endif
		else
#endif
			return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
	case 1: /* Is file writable */
#ifdef EIF_WINDOWS
		return ((mode & S_IWRITE) ? EIF_TRUE : EIF_FALSE);
#elif defined HAS_GETEUID
		euid = geteuid();
		egid = getegid();

		if (euid == 0)
			return EIF_TRUE;
		else if (uid == euid)
			return ((mode & S_IWUSR) ? EIF_TRUE : EIF_FALSE);
		else if (gid == egid)
			return ((mode & S_IWGRP) ? EIF_TRUE : EIF_FALSE);
#ifdef HAS_GETGROUPS
		else if (eif_group_in_list(gid))
			return ((mode & S_IWGRP) ? EIF_TRUE : EIF_FALSE);
#endif
		else
#endif
			return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
	case 2: /* Is file executable */
#ifdef EIF_WINDOWS
		return EIF_TRUE;
#elif defined HAS_GETEUID
		euid = geteuid();
		egid = getegid();

		if (euid == 0)
			return EIF_TRUE;
		else if (uid == euid)
			return ((mode & S_IXUSR) ? EIF_TRUE : EIF_FALSE);
		else if (gid == egid)
			return ((mode & S_IXGRP) ? EIF_TRUE : EIF_FALSE);
#ifdef HAS_GETGROUPS
		else if (eif_group_in_list(gid))
			return ((mode & S_IXGRP) ? EIF_TRUE : EIF_FALSE);
#endif
		else
#endif
			return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
	case 3: /* Is file setuid */
#ifdef EIF_WINDOWS
		return EIF_FALSE;
#else
		return ((mode & S_ISUID) ? EIF_TRUE : EIF_FALSE);
#endif
	case 4: /* Is file setgid */
#ifdef EIF_WINDOWS
		return EIF_FALSE;
#else
		return ((mode & S_ISGID) ? EIF_TRUE : EIF_FALSE);
#endif
	case 5: /* Is file sticky */
#ifdef EIF_WINDOWS
		return EIF_FALSE;
#else
		return ((mode & S_ISVTX) ? EIF_TRUE : EIF_FALSE);
#endif
	case 6: /* Is file owned by effective UID */
#ifdef HAS_GETEUID
		return ((uid == geteuid()) ? EIF_TRUE : EIF_FALSE);
#else
		return EIF_TRUE;
#endif
	case 7: /* Is file owned by real UID */
#ifdef HAS_GETEUID
		return ((uid == getuid()) ? EIF_TRUE : EIF_FALSE);
#else
		return EIF_TRUE;
#endif
	default:
		return EIF_FALSE;
	}
}

/*
 * Perform the field dereferencing from the appropriate stat structure,
 * which Eiffel cannot do directly.
 */
EIF_INTEGER file_info(struct stat *buf, int op) {
	switch (op) {
	case 0:	/* File permission mode */
		return (EIF_INTEGER)(buf->st_mode & ST_MODE);
	case 1:	/* Inode number */
		return (EIF_INTEGER)buf->st_ino;
	case 2:	/* Device inode resides on */
		return (EIF_INTEGER)buf->st_dev;
	case 3:	/* Device type */
		return (EIF_INTEGER)buf->st_rdev;
	case 4:	/* UID of file */
		return (EIF_INTEGER)buf->st_uid;
	case 5:	/* GID of file */
		return (EIF_INTEGER)buf->st_gid;
	case 6:	/* Size of file, in bytes */
		return (EIF_INTEGER)buf->st_size;
	case 7:	/* Last modification time on file */
		return (EIF_INTEGER)buf->st_mtime;
	case 8:	/* Last access made on file */
		return (EIF_INTEGER)buf->st_atime;
	case 9:	/* Last status change */
		return (EIF_INTEGER)buf->st_ctime;
	case 10: /* Number of links */
		return (EIF_INTEGER)buf->st_nlink;
	case 11: /* File type */
		return (EIF_INTEGER)(buf->st_mode & ~ST_MODE);
	case 12: /* Is file a directory */
		return (EIF_INTEGER)(buf->st_mode & S_IFDIR);
	case 13: /* Is file a regular (plain) one */
		if (buf->st_mode & S_IFREG || 0 == (buf->st_mode & ~ST_MODE))
			return (EIF_INTEGER)S_IFREG;
		else
			return (EIF_INTEGER)0;
	case 14: /* Is file a device */
		if (buf->st_mode & S_IFCHR)
			return (EIF_INTEGER)S_IFCHR;
		else if (buf->st_mode & S_IFBLK)
			return (EIF_INTEGER)S_IFBLK;
		else
			return (EIF_INTEGER)0;
	case 15: /* Is file a character device */
		return (EIF_INTEGER)(buf->st_mode & S_IFCHR);
	case 16: /* Is file a block device */
		return (EIF_INTEGER)(buf->st_mode & S_IFBLK);
	case 17: /* Is file a FIFO */
		return (EIF_INTEGER)(buf->st_mode & S_IFIFO);
	case 18: /* Is file a symbolic link */
		return (EIF_INTEGER)((buf->st_mode & S_IFLNK) == S_IFLNK);
	case 19: /* Is file a socket */
		return (EIF_INTEGER)(buf->st_mode & S_IFSOCK);
	default:
		return (EIF_INTEGER)0;
    }
}

/*
 * Return the Eiffel string filled in with the name associated with `uid'
 * if found in /etc/passwd. Otherwise, return fill it in with the numeric
 * value.
 */
EIF_REFERENCE file_owner(int uid) {
	char buf[NAME_MAX];
	char* str;
#ifdef HAS_GETPWUID
	struct passwd *pp;

	pp = getpwuid(uid);
	if (pp == (struct passwd *)0) {
		snprintf(buf, NAME_MAX, "%d", uid);
		str = buf;
	} else {
		str = pp->pw_name;
	}
#else
	snprintf(buf, NAME_MAX, "%d", uid);
	str = buf;
#endif
	return GE_ms8(str, strlen(str));
}

/*
 * Return the Eiffel string filled in with the name associated with `gid'
 * if found in /etc/group. Otherwise, return fill it in with the numeric
 * value.
 */
EIF_REFERENCE file_group(int gid) {
	char buf[NAME_MAX];
	char* str;
#ifdef HAS_GETGRGID
	struct group *gp;

	gp = getgrgid(gid);
	if (gp == (struct group *)0) {
		snprintf(buf, NAME_MAX, "%d", gid);
		str = buf;
	} else {
		str = gp->gr_name;
	}
#else
	snprintf(buf, NAME_MAX, "%d", gid);
	str = buf;
#endif
	return GE_ms8(str, strlen(str));
}

/*
 * Get an integer from `f'.
 */
EIF_INTEGER file_gib(FILE* f) {
	EIF_INTEGER i;     
	errno = 0;
	if (fread (&i, sizeof (EIF_INTEGER), 1, f) != 1) {
		eise_io("FILE: unable to read INTEGER value.");
	}
	return i;
}

/*
 * Get a real from `f'.
 */
EIF_REAL_32 file_grb(FILE* f) {
	EIF_REAL_32 r;     
	errno = 0;
	if (fread (&r, sizeof (EIF_REAL_32), 1, f) != 1) {
		eise_io("FILE: unable to read REAL value.");
	}
	return r;
}

/*
 * Get a double from `f'.
 */
EIF_REAL_64 file_gdb(FILE* f) {
	EIF_REAL_64 d;     
	errno = 0;
	if (fread (&d, sizeof(EIF_REAL_64), 1, f) != 1) {
		eise_io("FILE: unable to read DOUBLE value.");
	}
	return d;
}

/*
 * Open file `name' with the corresponding type `how'.
 */
EIF_POINTER file_binary_open(char* name, int how) {
	FILE *fp;
	errno = 0;
	if (how < 10) {
		fp = (FILE *)fopen(name, file_open_mode(how + 10));
	} else {
		fp = (FILE *)fopen(name, file_open_mode(how));
	}
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;

}

/*
 * Open file `fd' with the corresponding type `how'.
 */
EIF_POINTER file_binary_dopen(int fd, int how) {
	FILE *fp;
	errno = 0;
	if (how < 10) {
		fp = (FILE *)fdopen(fd, file_open_mode(how + 10));
	} else {
		fp = (FILE *)fdopen(fd, file_open_mode(how));
	}
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
EIF_POINTER file_binary_reopen(char* name, int how, FILE* old) {
	FILE *fp;
	errno = 0;
	if (how < 10) {
		fp = (FILE *)freopen(name, file_open_mode(how + 10), old);
	 } else {
		fp = (FILE *)freopen(name, file_open_mode(how), old);
	}
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Write `number' on `f'.
 */
void file_pib(FILE* f, EIF_INTEGER number) {
	errno = 0;
	if (fwrite(&number, sizeof(EIF_INTEGER),1, f) != 1) {
		eise_io("FILE: unable to write INTEGER value.");
	}
}

/*
 * Write `number' on `f'.
 */
void file_prb(FILE* f, EIF_REAL_32 number) {
	errno = 0;
    if (fwrite(&number, sizeof(EIF_REAL_32),1, f) != 1) {
		eise_io("FILE: unable to write REAL value.");
	}
}

/*
 * Write double `val' onto `f'.
 */
void file_pdb(FILE* f, EIF_REAL_64 val) {
	errno = 0;
	if (fwrite (&val, sizeof(EIF_REAL_64), 1, f) != 1) {
		eise_io("FILE: unable to write DOUBLE value.");
	}
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CONSOLE_C
#define EIF_CONSOLE_C

#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

#define eif_show_console GE_show_console

EIF_POINTER console_def(EIF_INTEGER file) {
	switch (file) {
	case 0:
		return (EIF_POINTER)stdin;
	case 1:
		setvbuf(stdout, NULL, _IONBF, 0);
		return (EIF_POINTER)stdout;
	case 2:
		setvbuf (stderr, NULL, _IONBF, 0);
		return (EIF_POINTER)stderr;
	default:
		return NULL;
	}
}

EIF_BOOLEAN console_eof(FILE* fp) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_feof(fp);
}

EIF_CHARACTER console_separator(FILE *f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_lh(f);
}

void console_ps(FILE* f, char* str, EIF_INTEGER len) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_ps(f, str, len);
}

void console_pr(FILE* f, EIF_REAL_32 number) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_pr(f, number);
}

void console_pc(FILE* f, EIF_CHARACTER c) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_pc(f, c);
}

void console_pd(FILE* f, EIF_REAL_64 val) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_pd(f, val);
}

void console_pi(FILE* f, EIF_INTEGER number) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_pi(f, number);
}

void console_tnwl(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	console_pc(f,'\n');
}

EIF_CHARACTER console_readchar(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gc(f);
}

EIF_REAL_32 console_readreal(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gr(f);
}

EIF_INTEGER console_readint(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gi(f);
}

EIF_REAL_64 console_readdouble(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gd(f);
}

EIF_INTEGER console_readword(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gw(f, s, bound, start);
}

EIF_INTEGER console_readline(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gs(f, s, bound, start);
}

void console_next_line(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_tnil(f);
}

EIF_INTEGER console_readstream(FILE* f, char* s, EIF_INTEGER bound) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gss(f, s, bound);
}

void console_file_close (FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_close(f);
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_DIR_C
#define EIF_DIR_C

#ifdef WIN32
#ifdef __cplusplus
extern "C" {
#endif
typedef struct {
	HANDLE handle;
	WIN32_FIND_DATA data;
	char *pattern;
} GE_directory;
#ifdef __cplusplus
}
#endif
#include <io.h> /* for 'access' */
#include <direct.h> /* (ch|rm)dir */
#else
#include <dirent.h>
#include <unistd.h>
#endif
#include <sys/stat.h>
#include <string.h>

#ifndef PATH_MAX
#define PATH_MAX 1024 /* Maximum length of full path name */
#endif

#ifndef S_IRUSR
#define S_IRUSR 0000400
#endif
#ifndef S_IWUSR
#define S_IWUSR 0000200
#endif
#ifndef S_IXUSR
#define S_IXUSR 0000100
#endif
#ifndef S_IRGRP
#define S_IRGRP 0000040
#endif
#ifndef S_IWGRP
#define S_IWGRP 0000020
#endif
#ifndef S_IXGRP
#define S_IXGRP 0000010
#endif
#ifndef S_IROTH
#define S_IROTH 0000004
#endif
#ifndef S_IWOTH
#define S_IWOTH 0000002
#endif
#ifndef S_IXOTH
#define S_IXOTH 0000001
#endif
#ifndef S_IFDIR
#define S_IFDIR 0040000
#endif
#ifndef S_IFCHR
#define S_IFCHR 0020000
#endif
#ifndef S_IFBLK
#define S_IFBLK 0060000
#endif
#ifndef S_IFREG
#define S_IFREG 0100000
#endif
#ifndef S_IFIFO
#define S_IFIFO 0010000
#endif
#ifndef S_IFLNK
#define S_IFLNK 0120000
#endif
#ifndef S_IFSOCK
#define S_IFSOCK 0140000
#endif

/* Keep only permission mode */
#ifndef ST_MODE
#define ST_MODE 0x0fff
#endif

#ifdef __cplusplus
extern "C" {
#endif

void* dir_open(char* dirname) {
#ifdef WIN32
	int len = strlen((char*)dirname);
	char* pattern = (char*)malloc(len + 5);
	GE_directory* result = (GE_directory*)malloc(sizeof(GE_directory));

	pattern = strncpy(pattern, (char*)dirname, len);
	if (pattern[len - 1] != '\\')
		pattern[len++] = '\\';
	pattern[len++] = '*';
	pattern[len++] = '.';
	pattern[len++] = '*';
	pattern[len++] = '\0';
	result->pattern = pattern;
	result->handle = 0;
	return result;
#else
	return (opendir(((char*)dirname)));
#endif
}

EIF_REFERENCE dir_next(void* dir) {
#ifdef WIN32
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		if (FindNextFileA(h, &(GE_dir->data))) {
			char* s = GE_dir->data.cFileName;
			return GE_ms8(s,strlen(s));
		} else {
			return EIF_VOID;
		}
	} else {
		h = FindFirstFileA(GE_dir->pattern, &(GE_dir->data));
		if (h == INVALID_HANDLE_VALUE) {
			return EIF_VOID;
		} else {
			char* s = GE_dir->data.cFileName;
			GE_dir->handle = h;
			return GE_ms8(s,strlen(s));
		}
	}
#else
	struct dirent* p = readdir((DIR*)dir);
	if (p) {
		char* s = p->d_name;
		return GE_ms8(s,strlen(s));
	} else {
		return EIF_VOID;
	}
#endif
}

void dir_rewind(void* dir) {
#ifdef WIN32
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		FindClose(h);
	}
	GE_dir->handle = 0;
#else
	DIR* GE_dir = (DIR*)dir;
	rewinddir(GE_dir);
#endif
}

void dir_close(void* dir) {
#ifdef WIN32
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		FindClose(h);
	}
	free(GE_dir->pattern);
	free(GE_dir);
#else
	closedir((DIR*)dir);
#endif
}

EIF_BOOLEAN eif_dir_exists(char* dirname) {
	struct stat buf;

	if (stat(dirname, &buf) == -1) {
		return EIF_FALSE;
	} else {
		return ((buf.st_mode & S_IFDIR) ? EIF_TRUE : EIF_FALSE);
	}
}

EIF_BOOLEAN eif_dir_is_readable(char* dirname) {
#ifdef WIN32
	return (EIF_BOOLEAN)(access(dirname, 04) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	struct stat buf;

	stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
	uid = buf.st_uid;
	gid = buf.st_gid;
	euid = geteuid();
	egid = getegid();
	if (euid == 0)
		return EIF_TRUE;
	else if (uid == euid)
		return ((mode & S_IRUSR) ? EIF_TRUE : EIF_FALSE);
	else if (gid == egid)
		return ((mode & S_IRGRP) ? EIF_TRUE : EIF_FALSE);
	else
		return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_executable(char* dirname) {
#ifdef WIN32
	return (EIF_BOOLEAN) (access (dirname, 0) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	struct stat buf;

	stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
	uid = buf.st_uid;
	gid = buf.st_gid;
	euid = geteuid();
	egid = getegid();
	if (euid == 0)
		return EIF_TRUE;
	else if (uid == euid)
		return ((mode & S_IXUSR) ? EIF_TRUE : EIF_FALSE);
	else if (gid == egid)
		return ((mode & S_IXGRP) ? EIF_TRUE : EIF_FALSE);
	else
		return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_writable(char* dirname) {
#ifdef WIN32
	return (EIF_BOOLEAN) (access (dirname, 02) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	struct stat buf;

	stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
	uid = buf.st_uid;
	gid = buf.st_gid;
	euid = geteuid();
	egid = getegid();
	if (euid == 0)
		return EIF_TRUE;
	else if (uid == euid)
		return ((mode & S_IWUSR) ? EIF_TRUE : EIF_FALSE);
	else if (gid == egid)
		return ((mode & S_IWGRP) ? EIF_TRUE : EIF_FALSE);
	else
		return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

void eif_dir_delete(char* dirname) {
	rmdir(dirname);
}

EIF_CHARACTER eif_dir_separator(void) {
#ifdef WIN32
	return (EIF_CHARACTER)'\\';
#else
	return (EIF_CHARACTER)'/';
#endif
}

EIF_REFERENCE dir_current(void) {
	char* s;
	EIF_REFERENCE result;

	s = (char*)getcwd(NULL, PATH_MAX);
	result = GE_ms8(s, strlen(s));
	free(s);
	return result;
}

EIF_INTEGER eif_chdir(char* path) {
	return chdir(path);
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement the main function"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MAIN_C
#define EIF_MAIN_C

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

/*
	Used in WEL.
*/
HINSTANCE eif_hInstance;

#endif

/*
	Used by the ISE runtime to figure out whether the application
	was launched from EiffelStudio in workbench mode or not.
*/
int debug_mode = 0; /* Assume not in debug mode */

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
