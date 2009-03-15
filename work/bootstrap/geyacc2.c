#include "geyacc.h"

#ifdef __cplusplus
extern "C" {
#endif

/* DS_SPARSE_TABLE_KEYS [PR_TOKEN, STRING_8].new_cursor */
T0* T248f4(T0* C)
{
	T0* R = 0;
	R = T303c3(C);
	return R;
}

/* DS_SPARSE_TABLE_KEYS_CURSOR [PR_TOKEN, STRING_8].make */
T0* T303c3(T0* a1)
{
	T0* C;
	T0* t1;
	C = GE_new303(EIF_TRUE);
	((T303*)(C))->a1 = a1;
	t1 = (((T248*)(GE_void(((T303*)(C))->a1)))->a1);
	((T303*)(C))->a2 = (T126f32(GE_void(t1)));
	return C;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING_8].new_cursor */
T0* T126f32(T0* C)
{
	T0* R = 0;
	R = T250c3(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING_8].make */
T0* T250c3(T0* a1)
{
	T0* C;
	C = GE_new250(EIF_TRUE);
	((T250*)(C))->a1 = a1;
	((T250*)(C))->a2 = ((T6)(GE_int32(-1)));
	return C;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_sparse_container */
void T126f50(T0* C, T6 a1)
{
	T6 t1;
	((T126*)(C))->a6 = a1;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T126f55(C, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T126f56(C, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T126f57(C, t1);
	((T126*)(C))->a10 = (T126f26(C, a1));
	t1 = ((T6)((((T126*)(C))->a10)+((T6)(GE_int32(1)))));
	T126f58(C, t1);
	((T126*)(C))->a9 = (T6)(GE_int32(0));
	((T126*)(C))->a8 = (T6)(GE_int32(0));
	((T126*)(C))->a1 = (T6)(GE_int32(0));
	T126f44(C);
	((T126*)(C))->a17 = (T126f32(C));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_slots */
void T126f58(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T126f33(C));
	((T126*)(C))->a15 = (T131f1(GE_void(t1), a1));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_clashes */
void T126f57(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T126f33(C));
	((T126*)(C))->a14 = (T131f1(GE_void(t1), a1));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_key_storage */
void T126f56(T0* C, T6 a1)
{
	((T126*)(C))->a19 = T135c3();
	((T126*)(C))->a16 = (T135f1(GE_void(((T126*)(C))->a19), a1));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING_8].make_item_storage */
void T126f55(T0* C, T6 a1)
{
	((T126*)(C))->a18 = T148c3();
	((T126*)(C))->a3 = (T148f1(GE_void(((T126*)(C))->a18), a1));
}

/* PR_GRAMMAR.make */
T0* T29c19(void)
{
	T0* C;
	C = GE_new29(EIF_TRUE);
	((T29*)(C))->a5 = T98c19((T6)(GE_int32(100)));
	((T29*)(C))->a4 = T91c20((T6)(GE_int32(300)));
	((T29*)(C))->a7 = T112c13((T6)(GE_int32(300)));
	((T29*)(C))->a1 = T71c21((T6)(GE_int32(500)));
	((T29*)(C))->a6 = T111c10((T6)(GE_int32(1)));
	return C;
}

/* PR_ACTION_FACTORY.make */
T0* T125c2(void)
{
	T0* C;
	C = GE_new125(EIF_TRUE);
	return C;
}

/* PR_YACC_PARSER.make_parser_skeleton */
void T50f295(T0* C)
{
	T0* t1;
	t1 = (T50f112(C));
	((T50*)(C))->a12 = (T131f1(GE_void(t1), (T6)(GE_int32(200))));
	T50f299(C);
	T50f300(C);
}

/* PR_YACC_PARSER.yy_build_parser_tables */
void T50f300(T0* C)
{
	((T50*)(C))->a37 = (T50f178(C));
	((T50*)(C))->a26 = (T50f189(C));
	((T50*)(C))->a39 = (T50f110(C));
	((T50*)(C))->a40 = (T50f113(C));
	((T50*)(C))->a38 = (T50f116(C));
	((T50*)(C))->a31 = (T50f118(C));
	((T50*)(C))->a35 = (T50f119(C));
	((T50*)(C))->a28 = (T50f120(C));
	((T50*)(C))->a30 = (T50f126(C));
	((T50*)(C))->a29 = (T50f129(C));
}

/* PR_YACC_PARSER.yycheck_template */
unsigned char ge206os3770 = '\0';
T0* ge206ov3770;
T0* T50f129(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge206os3770) {
		return ge206ov3770;
	} else {
		ge206os3770 = '\1';
		ge206ov3770 = R;
	}
	l1 = T102c7((T6)(GE_int32(0)), (T6)(GE_int32(1034)));
	T50f368(C, l1);
	T50f369(C, l1);
	R = (T50f275(C, l1));
	ge206ov3770 = R;
	return R;
}

/* PR_YACC_PARSER.yyfixed_array */
T0* T50f275(T0* C, T0* a1)
{
	T0* t1;
	T0* R = 0;
	t1 = (T50f112(C));
	R = (T131f3(GE_void(t1), a1));
	return R;
}

/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
T0* T131f3(T0* C, T0* a1)
{
	T0* R = 0;
	R = (((T102*)(GE_void(a1)))->a1);
	return R;
}

/* PR_YACC_PARSER.yycheck_template_2 */
void T50f369(T0* C, T0* a1)
{
	T0* t1;
	t1 = GE_ma102((T6)36,(T6)36,
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(2147483647)));
	T50f380(C, a1, t1, (T6)(GE_int32(1)), (T6)(GE_int32(35)), (T6)(GE_int32(1000)));
}

/* PR_YACC_PARSER.yyarray_subcopy */
void T50f380(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5)
{
	T0* t1;
	t1 = (T50f290(C));
	T109f4(GE_void(t1), a1, a2, a3, a4, a5);
}

/* PR_YACC_PARSER.integer_array_ */
T0* T50f290(T0* C)
{
	T0* R = 0;
	if (ge267os1835) {
		return ge267ov1835;
	} else {
		ge267os1835 = '\1';
		ge267ov1835 = R;
	}
	R = T109c2();
	ge267ov1835 = R;
	return R;
}

/* PR_YACC_PARSER.yycheck_template_1 */
void T50f368(T0* C, T0* a1)
{
	T0* t1;
	t1 = GE_ma102((T6)1001,(T6)1001,
(T6)(GE_int32(47)),
(T6)(GE_int32(69)),
(T6)(GE_int32(18)),
(T6)(GE_int32(22)),
(T6)(GE_int32(0)),
(T6)(GE_int32(49)),
(T6)(GE_int32(18)),
(T6)(GE_int32(54)),
(T6)(GE_int32(18)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(6)),
(T6)(GE_int32(165)),
(T6)(GE_int32(166)),
(T6)(GE_int32(58)),
(T6)(GE_int32(168)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(18)),
(T6)(GE_int32(172)),
(T6)(GE_int32(50)),
(T6)(GE_int32(50)),
(T6)(GE_int32(14)),
(T6)(GE_int32(53)),
(T6)(GE_int32(71)),
(T6)(GE_int32(53)),
(T6)(GE_int32(53)),
(T6)(GE_int32(57)),
(T6)(GE_int32(57)),
(T6)(GE_int32(57)),
(T6)(GE_int32(57)),
(T6)(GE_int32(47)),
(T6)(GE_int32(100)),
(T6)(GE_int32(52)),
(T6)(GE_int32(102)),
(T6)(GE_int32(47)),
(T6)(GE_int32(53)),
(T6)(GE_int32(47)),
(T6)(GE_int32(0)),
(T6)(GE_int32(15)),
(T6)(GE_int32(57)),
(T6)(GE_int32(194)),
(T6)(GE_int32(195)),
(T6)(GE_int32(196)),
(T6)(GE_int32(57)),
(T6)(GE_int32(60)),
(T6)(GE_int32(57)),
(T6)(GE_int32(47)),
(T6)(GE_int32(95)),
(T6)(GE_int32(41)),
(T6)(GE_int32(47)),
(T6)(GE_int32(98)),
(T6)(GE_int32(18)),
(T6)(GE_int32(52)),
(T6)(GE_int32(48)),
(T6)(GE_int32(57)),
(T6)(GE_int32(51)),
(T6)(GE_int32(52)),
(T6)(GE_int32(53)),
(T6)(GE_int32(18)),
(T6)(GE_int32(58)),
(T6)(GE_int32(3)),
(T6)(GE_int32(4)),
(T6)(GE_int32(5)),
(T6)(GE_int32(6)),
(T6)(GE_int32(7)),
(T6)(GE_int32(134)),
(T6)(GE_int32(9)),
(T6)(GE_int32(10)),
(T6)(GE_int32(11)),
(T6)(GE_int32(54)),
(T6)(GE_int32(13)),
(T6)(GE_int32(54)),
(T6)(GE_int32(59)),
(T6)(GE_int32(57)),
(T6)(GE_int32(143)),
(T6)(GE_int32(57)),
(T6)(GE_int32(18)),
(T6)(GE_int32(18)),
(T6)(GE_int32(53)),
(T6)(GE_int32(53)),
(T6)(GE_int32(76)),
(T6)(GE_int32(77)),
(T6)(GE_int32(52)),
(T6)(GE_int32(165)),
(T6)(GE_int32(166)),
(T6)(GE_int32(81)),
(T6)(GE_int32(168)),
(T6)(GE_int32(169)),
(T6)(GE_int32(40)),
(T6)(GE_int32(85)),
(T6)(GE_int32(21)),
(T6)(GE_int32(173)),
(T6)(GE_int32(174)),
(T6)(GE_int32(175)),
(T6)(GE_int32(90)),
(T6)(GE_int32(53)),
(T6)(GE_int32(53)),
(T6)(GE_int32(145)),
(T6)(GE_int32(94)),
(T6)(GE_int32(147)),
(T6)(GE_int32(16)),
(T6)(GE_int32(50)),
(T6)(GE_int32(47)),
(T6)(GE_int32(51)),
(T6)(GE_int32(51)),
(T6)(GE_int32(44)),
(T6)(GE_int32(125)),
(T6)(GE_int32(85)),
(T6)(GE_int32(77)),
(T6)(GE_int32(105)),
(T6)(GE_int32(102)),
(T6)(GE_int32(105)),
(T6)(GE_int32(119)),
(T6)(GE_int32(81)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(165)),
(T6)(GE_int32(166)),
(T6)(GE_int32(167)),
(T6)(GE_int32(168)),
(T6)(GE_int32(169)),
(T6)(GE_int32(118)),
(T6)(GE_int32(119)),
(T6)(GE_int32(172)),
(T6)(GE_int32(173)),
(T6)(GE_int32(174)),
(T6)(GE_int32(175)),
(T6)(GE_int32(167)),
(T6)(GE_int32(167)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(130)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(194)),
(T6)(GE_int32(195)),
(T6)(GE_int32(196)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(57)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(57)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(57)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(57)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(57)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(54)),
(T6)(GE_int32(55)),
(T6)(GE_int32(56)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(54)),
(T6)(GE_int32(55)),
(T6)(GE_int32(56)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(54)),
(T6)(GE_int32(55)),
(T6)(GE_int32(56)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(54)),
(T6)(GE_int32(55)),
(T6)(GE_int32(56)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(55)),
(T6)(GE_int32(56)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(55)),
(T6)(GE_int32(56)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(8)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(55)),
(T6)(GE_int32(56)),
(T6)(GE_int32(14)),
(T6)(GE_int32(15)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(18)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(11)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(-1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(2147483647)));
	T50f380(C, a1, t1, (T6)(GE_int32(1)), (T6)(GE_int32(1000)), (T6)(GE_int32(0)));
}

/* PR_YACC_PARSER.yytable_template */
unsigned char ge206os3767 = '\0';
T0* ge206ov3767;
T0* T50f126(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge206os3767) {
		return ge206ov3767;
	} else {
		ge206os3767 = '\1';
		ge206ov3767 = R;
	}
	l1 = T102c7((T6)(GE_int32(0)), (T6)(GE_int32(1034)));
	T50f366(C, l1);
	T50f367(C, l1);
	R = (T50f275(C, l1));
	ge206ov3767 = R;
	return R;
}

/* PR_YACC_PARSER.yytable_template_2 */
void T50f367(T0* C, T0* a1)
{
	T0* t1;
	t1 = GE_ma102((T6)36,(T6)36,
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(-62)),
(T6)(GE_int32(2147483647)));
	T50f380(C, a1, t1, (T6)(GE_int32(1)), (T6)(GE_int32(35)), (T6)(GE_int32(1000)));
}

/* PR_YACC_PARSER.yytable_template_1 */
void T50f366(T0* C, T0* a1)
{
	T0* t1;
	t1 = GE_ma102((T6)1001,(T6)1001,
(T6)(GE_int32(70)),
(T6)(GE_int32(99)),
(T6)(GE_int32(159)),
(T6)(GE_int32(118)),
(T6)(GE_int32(200)),
(T6)(GE_int32(124)),
(T6)(GE_int32(116)),
(T6)(GE_int32(70)),
(T6)(GE_int32(113)),
(T6)(GE_int32(75)),
(T6)(GE_int32(74)),
(T6)(GE_int32(49)),
(T6)(GE_int32(182)),
(T6)(GE_int32(184)),
(T6)(GE_int32(123)),
(T6)(GE_int32(187)),
(T6)(GE_int32(75)),
(T6)(GE_int32(89)),
(T6)(GE_int32(110)),
(T6)(GE_int32(192)),
(T6)(GE_int32(167)),
(T6)(GE_int32(167)),
(T6)(GE_int32(151)),
(T6)(GE_int32(98)),
(T6)(GE_int32(101)),
(T6)(GE_int32(98)),
(T6)(GE_int32(95)),
(T6)(GE_int32(166)),
(T6)(GE_int32(195)),
(T6)(GE_int32(174)),
(T6)(GE_int32(173)),
(T6)(GE_int32(158)),
(T6)(GE_int32(146)),
(T6)(GE_int32(117)),
(T6)(GE_int32(148)),
(T6)(GE_int32(115)),
(T6)(GE_int32(95)),
(T6)(GE_int32(112)),
(T6)(GE_int32(199)),
(T6)(GE_int32(197)),
(T6)(GE_int32(165)),
(T6)(GE_int32(182)),
(T6)(GE_int32(184)),
(T6)(GE_int32(187)),
(T6)(GE_int32(196)),
(T6)(GE_int32(193)),
(T6)(GE_int32(194)),
(T6)(GE_int32(109)),
(T6)(GE_int32(135)),
(T6)(GE_int32(150)),
(T6)(GE_int32(180)),
(T6)(GE_int32(144)),
(T6)(GE_int32(179)),
(T6)(GE_int32(178)),
(T6)(GE_int32(126)),
(T6)(GE_int32(175)),
(T6)(GE_int32(79)),
(T6)(GE_int32(83)),
(T6)(GE_int32(87)),
(T6)(GE_int32(155)),
(T6)(GE_int32(172)),
(T6)(GE_int32(11)),
(T6)(GE_int32(10)),
(T6)(GE_int32(9)),
(T6)(GE_int32(8)),
(T6)(GE_int32(7)),
(T6)(GE_int32(99)),
(T6)(GE_int32(6)),
(T6)(GE_int32(5)),
(T6)(GE_int32(4)),
(T6)(GE_int32(171)),
(T6)(GE_int32(3)),
(T6)(GE_int32(170)),
(T6)(GE_int32(161)),
(T6)(GE_int32(169)),
(T6)(GE_int32(99)),
(T6)(GE_int32(168)),
(T6)(GE_int32(154)),
(T6)(GE_int32(153)),
(T6)(GE_int32(147)),
(T6)(GE_int32(145)),
(T6)(GE_int32(106)),
(T6)(GE_int32(79)),
(T6)(GE_int32(104)),
(T6)(GE_int32(181)),
(T6)(GE_int32(183)),
(T6)(GE_int32(83)),
(T6)(GE_int32(186)),
(T6)(GE_int32(188)),
(T6)(GE_int32(103)),
(T6)(GE_int32(87)),
(T6)(GE_int32(102)),
(T6)(GE_int32(181)),
(T6)(GE_int32(183)),
(T6)(GE_int32(186)),
(T6)(GE_int32(121)),
(T6)(GE_int32(98)),
(T6)(GE_int32(95)),
(T6)(GE_int32(144)),
(T6)(GE_int32(131)),
(T6)(GE_int32(135)),
(T6)(GE_int32(91)),
(T6)(GE_int32(59)),
(T6)(GE_int32(50)),
(T6)(GE_int32(54)),
(T6)(GE_int32(47)),
(T6)(GE_int32(58)),
(T6)(GE_int32(160)),
(T6)(GE_int32(114)),
(T6)(GE_int32(108)),
(T6)(GE_int32(106)),
(T6)(GE_int32(149)),
(T6)(GE_int32(152)),
(T6)(GE_int32(157)),
(T6)(GE_int32(111)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(135)),
(T6)(GE_int32(135)),
(T6)(GE_int32(70)),
(T6)(GE_int32(135)),
(T6)(GE_int32(144)),
(T6)(GE_int32(156)),
(T6)(GE_int32(121)),
(T6)(GE_int32(191)),
(T6)(GE_int32(144)),
(T6)(GE_int32(144)),
(T6)(GE_int32(144)),
(T6)(GE_int32(75)),
(T6)(GE_int32(185)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(163)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(191)),
(T6)(GE_int32(191)),
(T6)(GE_int32(191)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(120)),
(T6)(GE_int32(0)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(86)),
(T6)(GE_int32(119)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(82)),
(T6)(GE_int32(85)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(78)),
(T6)(GE_int32(81)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(77)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(134)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(133)),
(T6)(GE_int32(105)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(67)),
(T6)(GE_int32(66)),
(T6)(GE_int32(65)),
(T6)(GE_int32(64)),
(T6)(GE_int32(63)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(143)),
(T6)(GE_int32(0)),
(T6)(GE_int32(177)),
(T6)(GE_int32(62)),
(T6)(GE_int32(61)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(142)),
(T6)(GE_int32(0)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(67)),
(T6)(GE_int32(66)),
(T6)(GE_int32(65)),
(T6)(GE_int32(64)),
(T6)(GE_int32(63)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(143)),
(T6)(GE_int32(0)),
(T6)(GE_int32(176)),
(T6)(GE_int32(62)),
(T6)(GE_int32(61)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(142)),
(T6)(GE_int32(0)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(67)),
(T6)(GE_int32(66)),
(T6)(GE_int32(65)),
(T6)(GE_int32(64)),
(T6)(GE_int32(63)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(134)),
(T6)(GE_int32(0)),
(T6)(GE_int32(141)),
(T6)(GE_int32(62)),
(T6)(GE_int32(61)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(133)),
(T6)(GE_int32(0)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(67)),
(T6)(GE_int32(66)),
(T6)(GE_int32(65)),
(T6)(GE_int32(64)),
(T6)(GE_int32(63)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(143)),
(T6)(GE_int32(0)),
(T6)(GE_int32(132)),
(T6)(GE_int32(62)),
(T6)(GE_int32(61)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(142)),
(T6)(GE_int32(0)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(67)),
(T6)(GE_int32(66)),
(T6)(GE_int32(65)),
(T6)(GE_int32(64)),
(T6)(GE_int32(63)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(134)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(62)),
(T6)(GE_int32(61)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(133)),
(T6)(GE_int32(0)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(67)),
(T6)(GE_int32(66)),
(T6)(GE_int32(65)),
(T6)(GE_int32(64)),
(T6)(GE_int32(63)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(69)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(62)),
(T6)(GE_int32(61)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(68)),
(T6)(GE_int32(0)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(67)),
(T6)(GE_int32(66)),
(T6)(GE_int32(65)),
(T6)(GE_int32(64)),
(T6)(GE_int32(63)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(130)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(62)),
(T6)(GE_int32(61)),
(T6)(GE_int32(41)),
(T6)(GE_int32(129)),
(T6)(GE_int32(0)),
(T6)(GE_int32(128)),
(T6)(GE_int32(127)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(56)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(162)),
(T6)(GE_int32(0)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(120)),
(T6)(GE_int32(0)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(86)),
(T6)(GE_int32(0)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(82)),
(T6)(GE_int32(0)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(78)),
(T6)(GE_int32(0)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(41)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(190)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(189)),
(T6)(GE_int32(0)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(100)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(30)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(27)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(23)),
(T6)(GE_int32(22)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-59)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-60)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(-61)),
(T6)(GE_int32(2147483647)));
	T50f380(C, a1, t1, (T6)(GE_int32(1)), (T6)(GE_int32(1000)), (T6)(GE_int32(0)));
}

/* PR_YACC_PARSER.yypgoto_template */
unsigned char ge206os3766 = '\0';
T0* ge206ov3766;
T0* T50f120(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge206os3766) {
		return ge206ov3766;
	} else {
		ge206os3766 = '\1';
		ge206ov3766 = R;
	}
	t1 = GE_ma102((T6)39,(T6)39,
(T6)(GE_int32(5)),
(T6)(GE_int32(-47)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-6)),
(T6)(GE_int32(23)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(-37)),
(T6)(GE_int32(-38)),
(T6)(GE_int32(-81)),
(T6)(GE_int32(-68)),
(T6)(GE_int32(-153)),
(T6)(GE_int32(9)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(7)),
(T6)(GE_int32(62)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-18)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(2147483647)));
	R = (T50f275(C, t1));
	ge206ov3766 = R;
	return R;
}

/* PR_YACC_PARSER.yypact_template */
unsigned char ge206os3765 = '\0';
T0* ge206ov3765;
T0* T50f119(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge206os3765) {
		return ge206ov3765;
	} else {
		ge206os3765 = '\1';
		ge206ov3765 = R;
	}
	t1 = GE_ma102((T6)202,(T6)202,
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(58)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(832)),
(T6)(GE_int32(54)),
(T6)(GE_int32(832)),
(T6)(GE_int32(56)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(53)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(634)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(52)),
(T6)(GE_int32(555)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(253)),
(T6)(GE_int32(214)),
(T6)(GE_int32(175)),
(T6)(GE_int32(555)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(85)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(995)),
(T6)(GE_int32(969)),
(T6)(GE_int32(943)),
(T6)(GE_int32(917)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(44)),
(T6)(GE_int32(43)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(891)),
(T6)(GE_int32(70)),
(T6)(GE_int32(49)),
(T6)(GE_int32(31)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(292)),
(T6)(GE_int32(799)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(0)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(766)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-10)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(733)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-12)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-19)),
(T6)(GE_int32(136)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-44)),
(T6)(GE_int32(6)),
(T6)(GE_int32(598)),
(T6)(GE_int32(441)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(403)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(27)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(26)),
(T6)(GE_int32(8)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(832)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(60)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(59)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(41)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(832)),
(T6)(GE_int32(700)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-16)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(14)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(667)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-17)),
(T6)(GE_int32(-30)),
(T6)(GE_int32(19)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(17)),
(T6)(GE_int32(18)),
(T6)(GE_int32(16)),
(T6)(GE_int32(2)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-27)),
(T6)(GE_int32(-28)),
(T6)(GE_int32(-2)),
(T6)(GE_int32(365)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(327)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(1)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(34)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(6)),
(T6)(GE_int32(3)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(517)),
(T6)(GE_int32(517)),
(T6)(GE_int32(555)),
(T6)(GE_int32(517)),
(T6)(GE_int32(479)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(865)),
(T6)(GE_int32(479)),
(T6)(GE_int32(479)),
(T6)(GE_int32(479)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-15)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-11)),
(T6)(GE_int32(-29)),
(T6)(GE_int32(-13)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(24)),
(T6)(GE_int32(865)),
(T6)(GE_int32(865)),
(T6)(GE_int32(865)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(38)),
(T6)(GE_int32(4)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(2147483647)));
	R = (T50f275(C, t1));
	ge206ov3765 = R;
	return R;
}

/* PR_YACC_PARSER.yydefgoto_template */
unsigned char ge206os3764 = '\0';
T0* ge206ov3764;
T0* T50f118(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge206os3764) {
		return ge206ov3764;
	} else {
		ge206os3764 = '\1';
		ge206ov3764 = R;
	}
	t1 = GE_ma102((T6)39,(T6)39,
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(71)),
(T6)(GE_int32(72)),
(T6)(GE_int32(73)),
(T6)(GE_int32(164)),
(T6)(GE_int32(122)),
(T6)(GE_int32(88)),
(T6)(GE_int32(84)),
(T6)(GE_int32(80)),
(T6)(GE_int32(136)),
(T6)(GE_int32(137)),
(T6)(GE_int32(138)),
(T6)(GE_int32(96)),
(T6)(GE_int32(139)),
(T6)(GE_int32(97)),
(T6)(GE_int32(140)),
(T6)(GE_int32(198)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(44)),
(T6)(GE_int32(57)),
(T6)(GE_int32(12)),
(T6)(GE_int32(55)),
(T6)(GE_int32(90)),
(T6)(GE_int32(48)),
(T6)(GE_int32(76)),
(T6)(GE_int32(53)),
(T6)(GE_int32(52)),
(T6)(GE_int32(51)),
(T6)(GE_int32(107)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(60)),
(T6)(GE_int32(92)),
(T6)(GE_int32(93)),
(T6)(GE_int32(125)),
(T6)(GE_int32(94)),
(T6)(GE_int32(2147483647)));
	R = (T50f275(C, t1));
	ge206ov3764 = R;
	return R;
}

/* PR_YACC_PARSER.yydefact_template */
unsigned char ge206os3763 = '\0';
T0* ge206ov3763;
T0* T50f116(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge206os3763) {
		return ge206ov3763;
	} else {
		ge206os3763 = '\1';
		ge206ov3763 = R;
	}
	t1 = GE_ma102((T6)202,(T6)202,
(T6)(GE_int32(2)),
(T6)(GE_int32(3)),
(T6)(GE_int32(0)),
(T6)(GE_int32(5)),
(T6)(GE_int32(118)),
(T6)(GE_int32(16)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(106)),
(T6)(GE_int32(98)),
(T6)(GE_int32(90)),
(T6)(GE_int32(13)),
(T6)(GE_int32(4)),
(T6)(GE_int32(149)),
(T6)(GE_int32(148)),
(T6)(GE_int32(147)),
(T6)(GE_int32(146)),
(T6)(GE_int32(145)),
(T6)(GE_int32(144)),
(T6)(GE_int32(143)),
(T6)(GE_int32(50)),
(T6)(GE_int32(49)),
(T6)(GE_int32(48)),
(T6)(GE_int32(54)),
(T6)(GE_int32(53)),
(T6)(GE_int32(52)),
(T6)(GE_int32(51)),
(T6)(GE_int32(46)),
(T6)(GE_int32(45)),
(T6)(GE_int32(44)),
(T6)(GE_int32(43)),
(T6)(GE_int32(42)),
(T6)(GE_int32(41)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(150)),
(T6)(GE_int32(142)),
(T6)(GE_int32(55)),
(T6)(GE_int32(47)),
(T6)(GE_int32(140)),
(T6)(GE_int32(122)),
(T6)(GE_int32(141)),
(T6)(GE_int32(137)),
(T6)(GE_int32(119)),
(T6)(GE_int32(0)),
(T6)(GE_int32(63)),
(T6)(GE_int32(114)),
(T6)(GE_int32(11)),
(T6)(GE_int32(12)),
(T6)(GE_int32(10)),
(T6)(GE_int32(9)),
(T6)(GE_int32(8)),
(T6)(GE_int32(63)),
(T6)(GE_int32(82)),
(T6)(GE_int32(138)),
(T6)(GE_int32(1)),
(T6)(GE_int32(120)),
(T6)(GE_int32(123)),
(T6)(GE_int32(128)),
(T6)(GE_int32(68)),
(T6)(GE_int32(67)),
(T6)(GE_int32(66)),
(T6)(GE_int32(65)),
(T6)(GE_int32(58)),
(T6)(GE_int32(57)),
(T6)(GE_int32(56)),
(T6)(GE_int32(20)),
(T6)(GE_int32(18)),
(T6)(GE_int32(19)),
(T6)(GE_int32(0)),
(T6)(GE_int32(64)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(21)),
(T6)(GE_int32(7)),
(T6)(GE_int32(0)),
(T6)(GE_int32(113)),
(T6)(GE_int32(109)),
(T6)(GE_int32(107)),
(T6)(GE_int32(0)),
(T6)(GE_int32(105)),
(T6)(GE_int32(101)),
(T6)(GE_int32(99)),
(T6)(GE_int32(0)),
(T6)(GE_int32(97)),
(T6)(GE_int32(93)),
(T6)(GE_int32(91)),
(T6)(GE_int32(0)),
(T6)(GE_int32(6)),
(T6)(GE_int32(139)),
(T6)(GE_int32(0)),
(T6)(GE_int32(124)),
(T6)(GE_int32(126)),
(T6)(GE_int32(63)),
(T6)(GE_int32(32)),
(T6)(GE_int32(34)),
(T6)(GE_int32(63)),
(T6)(GE_int32(27)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(28)),
(T6)(GE_int32(0)),
(T6)(GE_int32(17)),
(T6)(GE_int32(0)),
(T6)(GE_int32(117)),
(T6)(GE_int32(115)),
(T6)(GE_int32(108)),
(T6)(GE_int32(110)),
(T6)(GE_int32(111)),
(T6)(GE_int32(100)),
(T6)(GE_int32(102)),
(T6)(GE_int32(103)),
(T6)(GE_int32(92)),
(T6)(GE_int32(94)),
(T6)(GE_int32(95)),
(T6)(GE_int32(14)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(89)),
(T6)(GE_int32(85)),
(T6)(GE_int32(83)),
(T6)(GE_int32(121)),
(T6)(GE_int32(136)),
(T6)(GE_int32(128)),
(T6)(GE_int32(0)),
(T6)(GE_int32(131)),
(T6)(GE_int32(130)),
(T6)(GE_int32(132)),
(T6)(GE_int32(0)),
(T6)(GE_int32(129)),
(T6)(GE_int32(30)),
(T6)(GE_int32(20)),
(T6)(GE_int32(18)),
(T6)(GE_int32(19)),
(T6)(GE_int32(70)),
(T6)(GE_int32(21)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(76)),
(T6)(GE_int32(25)),
(T6)(GE_int32(20)),
(T6)(GE_int32(18)),
(T6)(GE_int32(19)),
(T6)(GE_int32(63)),
(T6)(GE_int32(26)),
(T6)(GE_int32(63)),
(T6)(GE_int32(31)),
(T6)(GE_int32(33)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(116)),
(T6)(GE_int32(112)),
(T6)(GE_int32(104)),
(T6)(GE_int32(96)),
(T6)(GE_int32(0)),
(T6)(GE_int32(84)),
(T6)(GE_int32(86)),
(T6)(GE_int32(87)),
(T6)(GE_int32(125)),
(T6)(GE_int32(0)),
(T6)(GE_int32(135)),
(T6)(GE_int32(134)),
(T6)(GE_int32(133)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(69)),
(T6)(GE_int32(75)),
(T6)(GE_int32(0)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(24)),
(T6)(GE_int32(29)),
(T6)(GE_int32(15)),
(T6)(GE_int32(88)),
(T6)(GE_int32(0)),
(T6)(GE_int32(74)),
(T6)(GE_int32(80)),
(T6)(GE_int32(72)),
(T6)(GE_int32(78)),
(T6)(GE_int32(81)),
(T6)(GE_int32(73)),
(T6)(GE_int32(79)),
(T6)(GE_int32(71)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(77)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(127)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(2147483647)));
	R = (T50f275(C, t1));
	ge206ov3763 = R;
	return R;
}

/* PR_YACC_PARSER.yytypes2_template */
unsigned char ge206os3762 = '\0';
T0* ge206ov3762;
T0* T50f113(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge206os3762) {
		return ge206ov3762;
	} else {
		ge206os3762 = '\1';
		ge206ov3762 = R;
	}
	t1 = GE_ma102((T6)62,(T6)62,
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2147483647)));
	R = (T50f275(C, t1));
	ge206ov3762 = R;
	return R;
}

/* PR_YACC_PARSER.yytypes1_template */
unsigned char ge206os3761 = '\0';
T0* ge206ov3761;
T0* T50f110(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge206os3761) {
		return ge206ov3761;
	} else {
		ge206os3761 = '\1';
		ge206ov3761 = R;
	}
	t1 = GE_ma102((T6)202,(T6)202,
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(3)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(3)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(5)),
(T6)(GE_int32(5)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(4)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(4)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(4)),
(T6)(GE_int32(5)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(6)),
(T6)(GE_int32(8)),
(T6)(GE_int32(1)),
(T6)(GE_int32(6)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(4)),
(T6)(GE_int32(3)),
(T6)(GE_int32(2)),
(T6)(GE_int32(4)),
(T6)(GE_int32(3)),
(T6)(GE_int32(2)),
(T6)(GE_int32(4)),
(T6)(GE_int32(3)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(4)),
(T6)(GE_int32(1)),
(T6)(GE_int32(3)),
(T6)(GE_int32(1)),
(T6)(GE_int32(3)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(5)),
(T6)(GE_int32(5)),
(T6)(GE_int32(6)),
(T6)(GE_int32(8)),
(T6)(GE_int32(7)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(6)),
(T6)(GE_int32(1)),
(T6)(GE_int32(6)),
(T6)(GE_int32(8)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(4)),
(T6)(GE_int32(3)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(4)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(3)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(3)),
(T6)(GE_int32(6)),
(T6)(GE_int32(8)),
(T6)(GE_int32(6)),
(T6)(GE_int32(8)),
(T6)(GE_int32(5)),
(T6)(GE_int32(6)),
(T6)(GE_int32(8)),
(T6)(GE_int32(6)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(8)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2147483647)));
	R = (T50f275(C, t1));
	ge206ov3761 = R;
	return R;
}

/* PR_YACC_PARSER.yyr1_template */
unsigned char ge206os3760 = '\0';
T0* ge206ov3760;
T0* T50f189(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge206os3760) {
		return ge206ov3760;
	} else {
		ge206os3760 = '\1';
		ge206ov3760 = R;
	}
	t1 = GE_ma102((T6)152,(T6)152,
(T6)(GE_int32(0)),
(T6)(GE_int32(78)),
(T6)(GE_int32(80)),
(T6)(GE_int32(79)),
(T6)(GE_int32(79)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(86)),
(T6)(GE_int32(86)),
(T6)(GE_int32(71)),
(T6)(GE_int32(71)),
(T6)(GE_int32(71)),
(T6)(GE_int32(71)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(62)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(63)),
(T6)(GE_int32(65)),
(T6)(GE_int32(65)),
(T6)(GE_int32(64)),
(T6)(GE_int32(64)),
(T6)(GE_int32(64)),
(T6)(GE_int32(64)),
(T6)(GE_int32(74)),
(T6)(GE_int32(73)),
(T6)(GE_int32(73)),
(T6)(GE_int32(73)),
(T6)(GE_int32(73)),
(T6)(GE_int32(73)),
(T6)(GE_int32(76)),
(T6)(GE_int32(75)),
(T6)(GE_int32(75)),
(T6)(GE_int32(75)),
(T6)(GE_int32(75)),
(T6)(GE_int32(75)),
(T6)(GE_int32(77)),
(T6)(GE_int32(85)),
(T6)(GE_int32(85)),
(T6)(GE_int32(85)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(88)),
(T6)(GE_int32(88)),
(T6)(GE_int32(88)),
(T6)(GE_int32(68)),
(T6)(GE_int32(68)),
(T6)(GE_int32(68)),
(T6)(GE_int32(68)),
(T6)(GE_int32(68)),
(T6)(GE_int32(89)),
(T6)(GE_int32(89)),
(T6)(GE_int32(89)),
(T6)(GE_int32(69)),
(T6)(GE_int32(69)),
(T6)(GE_int32(69)),
(T6)(GE_int32(69)),
(T6)(GE_int32(69)),
(T6)(GE_int32(90)),
(T6)(GE_int32(90)),
(T6)(GE_int32(90)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(87)),
(T6)(GE_int32(87)),
(T6)(GE_int32(87)),
(T6)(GE_int32(91)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(92)),
(T6)(GE_int32(93)),
(T6)(GE_int32(94)),
(T6)(GE_int32(95)),
(T6)(GE_int32(95)),
(T6)(GE_int32(96)),
(T6)(GE_int32(96)),
(T6)(GE_int32(98)),
(T6)(GE_int32(98)),
(T6)(GE_int32(98)),
(T6)(GE_int32(98)),
(T6)(GE_int32(98)),
(T6)(GE_int32(98)),
(T6)(GE_int32(66)),
(T6)(GE_int32(66)),
(T6)(GE_int32(97)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(61)),
(T6)(GE_int32(61)),
(T6)(GE_int32(61)),
(T6)(GE_int32(61)),
(T6)(GE_int32(61)),
(T6)(GE_int32(61)),
(T6)(GE_int32(61)),
(T6)(GE_int32(61)),
(T6)(GE_int32(61)),
(T6)(GE_int32(61)),
(T6)(GE_int32(61)),
(T6)(GE_int32(2147483647)));
	R = (T50f275(C, t1));
	ge206ov3760 = R;
	return R;
}

/* PR_YACC_PARSER.yytranslate_template */
unsigned char ge206os3759 = '\0';
T0* ge206ov3759;
T0* T50f178(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge206os3759) {
		return ge206ov3759;
	} else {
		ge206os3759 = '\1';
		ge206ov3759 = R;
	}
	t1 = GE_ma102((T6)305,(T6)305,
(T6)(GE_int32(0)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(55)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(59)),
(T6)(GE_int32(60)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(57)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(50)),
(T6)(GE_int32(58)),
(T6)(GE_int32(51)),
(T6)(GE_int32(2)),
(T6)(GE_int32(52)),
(T6)(GE_int32(56)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(53)),
(T6)(GE_int32(2)),
(T6)(GE_int32(54)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(49)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(3)),
(T6)(GE_int32(4)),
(T6)(GE_int32(5)),
(T6)(GE_int32(6)),
(T6)(GE_int32(7)),
(T6)(GE_int32(8)),
(T6)(GE_int32(9)),
(T6)(GE_int32(10)),
(T6)(GE_int32(11)),
(T6)(GE_int32(12)),
(T6)(GE_int32(13)),
(T6)(GE_int32(14)),
(T6)(GE_int32(15)),
(T6)(GE_int32(16)),
(T6)(GE_int32(17)),
(T6)(GE_int32(18)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(47)),
(T6)(GE_int32(48)),
(T6)(GE_int32(2147483647)));
	R = (T50f275(C, t1));
	ge206ov3759 = R;
	return R;
}

/* PR_YACC_PARSER.yy_create_value_stacks */
void T50f299(T0* C)
{
}

/* PR_YACC_PARSER.make_yacc_scanner */
void T50f294(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T50f133(C));
	T50f298(C, t1);
	((T50*)(C))->a9 = a1;
	((T50*)(C))->a10 = T17c30((T6)(GE_int32(256)));
	((T50*)(C))->a1 = EIF_TRUE;
	((T50*)(C))->a11 = (T6)(GE_int32(1));
}

/* PR_YACC_PARSER.make_with_buffer */
void T50f298(T0* C, T0* a1)
{
	((T50*)(C))->a13 = a1;
	T50f312(C);
	T50f301(C);
}

/* PR_YACC_PARSER.yy_initialize */
void T50f312(T0* C)
{
	T0* t1;
	T0* t2;
	T6 t3;
	T50f340(C);
	((T50*)(C))->a55 = (T6)(GE_int32(1));
	((T50*)(C))->a16 = (T6)(GE_int32(1));
	((T50*)(C))->a17 = (T6)(GE_int32(1));
	((T50*)(C))->a15 = (T6)(GE_int32(1));
	((T50*)(C))->a52 = (T6)(GE_int32(1));
	((T50*)(C))->a53 = (T6)(GE_int32(1));
	((T50*)(C))->a54 = (T6)(GE_int32(1));
	if (EIF_FALSE) {
		t1 = (T50f112(C));
		t2 = (((((T0*)(GE_void(((T50*)(C))->a13)))->id==130)?((T130*)(((T50*)(C))->a13))->a1:((T129*)(((T50*)(C))->a13))->a1));
		t3 = (T283f3(GE_void(t2)));
		t3 = ((T6)((t3)+((T6)(GE_int32(1)))));
		((T50*)(C))->a56 = (T131f1(GE_void(t1), t3));
	}
}

/* PR_YACC_PARSER.yy_build_tables */
void T50f340(T0* C)
{
	((T50*)(C))->a67 = (T50f266(C));
	((T50*)(C))->a63 = (T50f267(C));
	((T50*)(C))->a64 = (T50f268(C));
	((T50*)(C))->a65 = (T50f269(C));
	((T50*)(C))->a58 = (T50f270(C));
	((T50*)(C))->a66 = (T50f271(C));
	((T50*)(C))->a60 = (T50f272(C));
}

/* PR_YACC_PARSER.yy_accept_template */
unsigned char ge208os4325 = '\0';
T0* ge208ov4325;
T0* T50f272(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge208os4325) {
		return ge208ov4325;
	} else {
		ge208os4325 = '\1';
		ge208ov4325 = R;
	}
	t1 = GE_ma102((T6)287,(T6)287,
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(74)),
(T6)(GE_int32(74)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(74)),
(T6)(GE_int32(74)),
(T6)(GE_int32(87)),
(T6)(GE_int32(85)),
(T6)(GE_int32(17)),
(T6)(GE_int32(18)),
(T6)(GE_int32(85)),
(T6)(GE_int32(16)),
(T6)(GE_int32(85)),
(T6)(GE_int32(8)),
(T6)(GE_int32(85)),
(T6)(GE_int32(48)),
(T6)(GE_int32(9)),
(T6)(GE_int32(10)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(11)),
(T6)(GE_int32(12)),
(T6)(GE_int32(85)),
(T6)(GE_int32(53)),
(T6)(GE_int32(55)),
(T6)(GE_int32(57)),
(T6)(GE_int32(54)),
(T6)(GE_int32(59)),
(T6)(GE_int32(67)),
(T6)(GE_int32(72)),
(T6)(GE_int32(71)),
(T6)(GE_int32(71)),
(T6)(GE_int32(71)),
(T6)(GE_int32(71)),
(T6)(GE_int32(74)),
(T6)(GE_int32(79)),
(T6)(GE_int32(78)),
(T6)(GE_int32(78)),
(T6)(GE_int32(78)),
(T6)(GE_int32(78)),
(T6)(GE_int32(83)),
(T6)(GE_int32(84)),
(T6)(GE_int32(60)),
(T6)(GE_int32(61)),
(T6)(GE_int32(62)),
(T6)(GE_int32(63)),
(T6)(GE_int32(85)),
(T6)(GE_int32(64)),
(T6)(GE_int32(66)),
(T6)(GE_int32(17)),
(T6)(GE_int32(0)),
(T6)(GE_int32(50)),
(T6)(GE_int32(15)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(14)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(17)),
(T6)(GE_int32(48)),
(T6)(GE_int32(47)),
(T6)(GE_int32(46)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(58)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(57)),
(T6)(GE_int32(56)),
(T6)(GE_int32(59)),
(T6)(GE_int32(67)),
(T6)(GE_int32(0)),
(T6)(GE_int32(68)),
(T6)(GE_int32(68)),
(T6)(GE_int32(73)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(70)),
(T6)(GE_int32(74)),
(T6)(GE_int32(79)),
(T6)(GE_int32(0)),
(T6)(GE_int32(75)),
(T6)(GE_int32(75)),
(T6)(GE_int32(80)),
(T6)(GE_int32(0)),
(T6)(GE_int32(81)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(77)),
(T6)(GE_int32(60)),
(T6)(GE_int32(60)),
(T6)(GE_int32(64)),
(T6)(GE_int32(66)),
(T6)(GE_int32(65)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(13)),
(T6)(GE_int32(49)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(69)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(82)),
(T6)(GE_int32(76)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(39)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(30)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(2)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(5)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(38)),
(T6)(GE_int32(0)),
(T6)(GE_int32(51)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(3)),
(T6)(GE_int32(6)),
(T6)(GE_int32(1)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(33)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(52)),
(T6)(GE_int32(7)),
(T6)(GE_int32(0)),
(T6)(GE_int32(47)),
(T6)(GE_int32(29)),
(T6)(GE_int32(47)),
(T6)(GE_int32(40)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(19)),
(T6)(GE_int32(24)),
(T6)(GE_int32(37)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(0)),
(T6)(GE_int32(44)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(41)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(43)),
(T6)(GE_int32(4)),
(T6)(GE_int32(34)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(20)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(25)),
(T6)(GE_int32(42)),
(T6)(GE_int32(47)),
(T6)(GE_int32(45)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(47)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(0)),
(T6)(GE_int32(2147483647)));
	R = (T50f288(C, t1));
	ge208ov4325 = R;
	return R;
}

/* PR_YACC_PARSER.yy_fixed_array */
T0* T50f288(T0* C, T0* a1)
{
	T0* t1;
	T0* R = 0;
	t1 = (T50f112(C));
	R = (T131f3(GE_void(t1), a1));
	return R;
}

/* PR_YACC_PARSER.yy_meta_template */
unsigned char ge208os4324 = '\0';
T0* ge208ov4324;
T0* T50f271(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge208os4324) {
		return ge208ov4324;
	} else {
		ge208os4324 = '\1';
		ge208ov4324 = R;
	}
	t1 = GE_ma102((T6)55,(T6)55,
(T6)(GE_int32(0)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(3)),
(T6)(GE_int32(4)),
(T6)(GE_int32(5)),
(T6)(GE_int32(6)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(7)),
(T6)(GE_int32(1)),
(T6)(GE_int32(8)),
(T6)(GE_int32(8)),
(T6)(GE_int32(9)),
(T6)(GE_int32(10)),
(T6)(GE_int32(11)),
(T6)(GE_int32(12)),
(T6)(GE_int32(13)),
(T6)(GE_int32(14)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(15)),
(T6)(GE_int32(15)),
(T6)(GE_int32(15)),
(T6)(GE_int32(15)),
(T6)(GE_int32(15)),
(T6)(GE_int32(15)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(17)),
(T6)(GE_int32(18)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(1)),
(T6)(GE_int32(25)),
(T6)(GE_int32(2147483647)));
	R = (T50f288(C, t1));
	ge208ov4324 = R;
	return R;
}

/* PR_YACC_PARSER.yy_ec_template */
unsigned char ge208os4323 = '\0';
T0* ge208ov4323;
T0* T50f270(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge208os4323) {
		return ge208ov4323;
	} else {
		ge208os4323 = '\1';
		ge208ov4323 = R;
	}
	t1 = GE_ma102((T6)258,(T6)258,
(T6)(GE_int32(0)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(3)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(4)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(5)),
(T6)(GE_int32(1)),
(T6)(GE_int32(6)),
(T6)(GE_int32(7)),
(T6)(GE_int32(1)),
(T6)(GE_int32(8)),
(T6)(GE_int32(9)),
(T6)(GE_int32(10)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(11)),
(T6)(GE_int32(12)),
(T6)(GE_int32(1)),
(T6)(GE_int32(13)),
(T6)(GE_int32(14)),
(T6)(GE_int32(15)),
(T6)(GE_int32(16)),
(T6)(GE_int32(17)),
(T6)(GE_int32(18)),
(T6)(GE_int32(14)),
(T6)(GE_int32(19)),
(T6)(GE_int32(14)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(1)),
(T6)(GE_int32(25)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(35)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(35)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(35)),
(T6)(GE_int32(35)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(35)),
(T6)(GE_int32(47)),
(T6)(GE_int32(48)),
(T6)(GE_int32(49)),
(T6)(GE_int32(1)),
(T6)(GE_int32(50)),
(T6)(GE_int32(1)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(35)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(40)),
(T6)(GE_int32(35)),
(T6)(GE_int32(41)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(35)),
(T6)(GE_int32(35)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(35)),
(T6)(GE_int32(51)),
(T6)(GE_int32(52)),
(T6)(GE_int32(53)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2147483647)));
	R = (T50f288(C, t1));
	ge208ov4323 = R;
	return R;
}

/* PR_YACC_PARSER.yy_def_template */
unsigned char ge208os4322 = '\0';
T0* ge208ov4322;
T0* T50f269(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge208os4322) {
		return ge208ov4322;
	} else {
		ge208os4322 = '\1';
		ge208ov4322 = R;
	}
	t1 = GE_ma102((T6)315,(T6)315,
(T6)(GE_int32(0)),
(T6)(GE_int32(285)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(290)),
(T6)(GE_int32(285)),
(T6)(GE_int32(291)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(292)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(294)),
(T6)(GE_int32(295)),
(T6)(GE_int32(285)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(297)),
(T6)(GE_int32(285)),
(T6)(GE_int32(298)),
(T6)(GE_int32(285)),
(T6)(GE_int32(299)),
(T6)(GE_int32(300)),
(T6)(GE_int32(301)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(302)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(290)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(291)),
(T6)(GE_int32(303)),
(T6)(GE_int32(292)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(294)),
(T6)(GE_int32(295)),
(T6)(GE_int32(296)),
(T6)(GE_int32(285)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(285)),
(T6)(GE_int32(297)),
(T6)(GE_int32(304)),
(T6)(GE_int32(298)),
(T6)(GE_int32(285)),
(T6)(GE_int32(299)),
(T6)(GE_int32(285)),
(T6)(GE_int32(299)),
(T6)(GE_int32(285)),
(T6)(GE_int32(305)),
(T6)(GE_int32(300)),
(T6)(GE_int32(285)),
(T6)(GE_int32(301)),
(T6)(GE_int32(306)),
(T6)(GE_int32(285)),
(T6)(GE_int32(307)),
(T6)(GE_int32(302)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(308)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(309)),
(T6)(GE_int32(285)),
(T6)(GE_int32(310)),
(T6)(GE_int32(311)),
(T6)(GE_int32(305)),
(T6)(GE_int32(285)),
(T6)(GE_int32(312)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(313)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(309)),
(T6)(GE_int32(310)),
(T6)(GE_int32(311)),
(T6)(GE_int32(312)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(285)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(285)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(0)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(2147483647)));
	R = (T50f288(C, t1));
	ge208ov4322 = R;
	return R;
}

/* PR_YACC_PARSER.yy_base_template */
unsigned char ge208os4321 = '\0';
T0* ge208ov4321;
T0* T50f268(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge208os4321) {
		return ge208ov4321;
	} else {
		ge208os4321 = '\1';
		ge208ov4321 = R;
	}
	t1 = GE_ma102((T6)315,(T6)315,
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(47)),
(T6)(GE_int32(93)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(52)),
(T6)(GE_int32(70)),
(T6)(GE_int32(143)),
(T6)(GE_int32(194)),
(T6)(GE_int32(246)),
(T6)(GE_int32(296)),
(T6)(GE_int32(345)),
(T6)(GE_int32(396)),
(T6)(GE_int32(431)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(59)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(425)),
(T6)(GE_int32(443)),
(T6)(GE_int32(381)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(416)),
(T6)(GE_int32(0)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(23)),
(T6)(GE_int32(388)),
(T6)(GE_int32(23)),
(T6)(GE_int32(44)),
(T6)(GE_int32(381)),
(T6)(GE_int32(0)),
(T6)(GE_int32(387)),
(T6)(GE_int32(390)),
(T6)(GE_int32(397)),
(T6)(GE_int32(383)),
(T6)(GE_int32(391)),
(T6)(GE_int32(390)),
(T6)(GE_int32(375)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(55)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(77)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(79)),
(T6)(GE_int32(82)),
(T6)(GE_int32(411)),
(T6)(GE_int32(405)),
(T6)(GE_int32(0)),
(T6)(GE_int32(413)),
(T6)(GE_int32(83)),
(T6)(GE_int32(85)),
(T6)(GE_int32(408)),
(T6)(GE_int32(402)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(99)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(401)),
(T6)(GE_int32(0)),
(T6)(GE_int32(103)),
(T6)(GE_int32(106)),
(T6)(GE_int32(407)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(366)),
(T6)(GE_int32(380)),
(T6)(GE_int32(370)),
(T6)(GE_int32(373)),
(T6)(GE_int32(363)),
(T6)(GE_int32(63)),
(T6)(GE_int32(109)),
(T6)(GE_int32(397)),
(T6)(GE_int32(487)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(357)),
(T6)(GE_int32(358)),
(T6)(GE_int32(369)),
(T6)(GE_int32(353)),
(T6)(GE_int32(350)),
(T6)(GE_int32(348)),
(T6)(GE_int32(351)),
(T6)(GE_int32(347)),
(T6)(GE_int32(353)),
(T6)(GE_int32(345)),
(T6)(GE_int32(353)),
(T6)(GE_int32(88)),
(T6)(GE_int32(346)),
(T6)(GE_int32(345)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(343)),
(T6)(GE_int32(342)),
(T6)(GE_int32(118)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(118)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(120)),
(T6)(GE_int32(121)),
(T6)(GE_int32(374)),
(T6)(GE_int32(119)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(378)),
(T6)(GE_int32(124)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(126)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(0)),
(T6)(GE_int32(131)),
(T6)(GE_int32(372)),
(T6)(GE_int32(128)),
(T6)(GE_int32(0)),
(T6)(GE_int32(150)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(154)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(339)),
(T6)(GE_int32(347)),
(T6)(GE_int32(339)),
(T6)(GE_int32(344)),
(T6)(GE_int32(349)),
(T6)(GE_int32(338)),
(T6)(GE_int32(333)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(145)),
(T6)(GE_int32(364)),
(T6)(GE_int32(345)),
(T6)(GE_int32(333)),
(T6)(GE_int32(328)),
(T6)(GE_int32(327)),
(T6)(GE_int32(341)),
(T6)(GE_int32(339)),
(T6)(GE_int32(339)),
(T6)(GE_int32(334)),
(T6)(GE_int32(333)),
(T6)(GE_int32(318)),
(T6)(GE_int32(323)),
(T6)(GE_int32(323)),
(T6)(GE_int32(329)),
(T6)(GE_int32(332)),
(T6)(GE_int32(319)),
(T6)(GE_int32(314)),
(T6)(GE_int32(324)),
(T6)(GE_int32(0)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(0)),
(T6)(GE_int32(319)),
(T6)(GE_int32(303)),
(T6)(GE_int32(319)),
(T6)(GE_int32(311)),
(T6)(GE_int32(302)),
(T6)(GE_int32(312)),
(T6)(GE_int32(311)),
(T6)(GE_int32(157)),
(T6)(GE_int32(332)),
(T6)(GE_int32(311)),
(T6)(GE_int32(308)),
(T6)(GE_int32(311)),
(T6)(GE_int32(306)),
(T6)(GE_int32(307)),
(T6)(GE_int32(297)),
(T6)(GE_int32(295)),
(T6)(GE_int32(300)),
(T6)(GE_int32(0)),
(T6)(GE_int32(290)),
(T6)(GE_int32(287)),
(T6)(GE_int32(279)),
(T6)(GE_int32(287)),
(T6)(GE_int32(286)),
(T6)(GE_int32(296)),
(T6)(GE_int32(286)),
(T6)(GE_int32(296)),
(T6)(GE_int32(310)),
(T6)(GE_int32(309)),
(T6)(GE_int32(308)),
(T6)(GE_int32(307)),
(T6)(GE_int32(291)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(276)),
(T6)(GE_int32(266)),
(T6)(GE_int32(264)),
(T6)(GE_int32(266)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(270)),
(T6)(GE_int32(276)),
(T6)(GE_int32(273)),
(T6)(GE_int32(258)),
(T6)(GE_int32(262)),
(T6)(GE_int32(264)),
(T6)(GE_int32(264)),
(T6)(GE_int32(262)),
(T6)(GE_int32(265)),
(T6)(GE_int32(260)),
(T6)(GE_int32(149)),
(T6)(GE_int32(259)),
(T6)(GE_int32(262)),
(T6)(GE_int32(0)),
(T6)(GE_int32(246)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(243)),
(T6)(GE_int32(243)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(254)),
(T6)(GE_int32(245)),
(T6)(GE_int32(239)),
(T6)(GE_int32(216)),
(T6)(GE_int32(231)),
(T6)(GE_int32(0)),
(T6)(GE_int32(224)),
(T6)(GE_int32(212)),
(T6)(GE_int32(215)),
(T6)(GE_int32(210)),
(T6)(GE_int32(230)),
(T6)(GE_int32(226)),
(T6)(GE_int32(205)),
(T6)(GE_int32(199)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(166)),
(T6)(GE_int32(175)),
(T6)(GE_int32(0)),
(T6)(GE_int32(173)),
(T6)(GE_int32(0)),
(T6)(GE_int32(171)),
(T6)(GE_int32(166)),
(T6)(GE_int32(143)),
(T6)(GE_int32(142)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(163)),
(T6)(GE_int32(160)),
(T6)(GE_int32(161)),
(T6)(GE_int32(0)),
(T6)(GE_int32(145)),
(T6)(GE_int32(147)),
(T6)(GE_int32(0)),
(T6)(GE_int32(162)),
(T6)(GE_int32(168)),
(T6)(GE_int32(150)),
(T6)(GE_int32(0)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(128)),
(T6)(GE_int32(139)),
(T6)(GE_int32(128)),
(T6)(GE_int32(122)),
(T6)(GE_int32(116)),
(T6)(GE_int32(0)),
(T6)(GE_int32(74)),
(T6)(GE_int32(76)),
(T6)(GE_int32(58)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(150)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(52)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(1003)),
(T6)(GE_int32(532)),
(T6)(GE_int32(557)),
(T6)(GE_int32(582)),
(T6)(GE_int32(607)),
(T6)(GE_int32(632)),
(T6)(GE_int32(657)),
(T6)(GE_int32(199)),
(T6)(GE_int32(675)),
(T6)(GE_int32(698)),
(T6)(GE_int32(723)),
(T6)(GE_int32(748)),
(T6)(GE_int32(773)),
(T6)(GE_int32(798)),
(T6)(GE_int32(821)),
(T6)(GE_int32(843)),
(T6)(GE_int32(857)),
(T6)(GE_int32(206)),
(T6)(GE_int32(882)),
(T6)(GE_int32(907)),
(T6)(GE_int32(213)),
(T6)(GE_int32(932)),
(T6)(GE_int32(957)),
(T6)(GE_int32(977)),
(T6)(GE_int32(220)),
(T6)(GE_int32(227)),
(T6)(GE_int32(260)),
(T6)(GE_int32(267)),
(T6)(GE_int32(987)),
(T6)(GE_int32(2147483647)));
	R = (T50f288(C, t1));
	ge208ov4321 = R;
	return R;
}

/* PR_YACC_PARSER.yy_chk_template */
unsigned char ge208os4318 = '\0';
T0* ge208ov4318;
T0* T50f267(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge208os4318) {
		return ge208ov4318;
	} else {
		ge208os4318 = '\1';
		ge208ov4318 = R;
	}
	l1 = T102c7((T6)(GE_int32(0)), (T6)(GE_int32(1056)));
	T50f378(C, l1);
	T50f379(C, l1);
	R = (T50f288(C, l1));
	ge208ov4318 = R;
	return R;
}

/* PR_YACC_PARSER.yy_chk_template_2 */
void T50f379(T0* C, T0* a1)
{
	T0* t1;
	t1 = GE_ma102((T6)58,(T6)58,
(T6)(GE_int32(313)),
(T6)(GE_int32(313)),
(T6)(GE_int32(313)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(2147483647)));
	T50f382(C, a1, t1, (T6)(GE_int32(1)), (T6)(GE_int32(57)), (T6)(GE_int32(1000)));
}

/* PR_YACC_PARSER.yy_array_subcopy */
void T50f382(T0* C, T0* a1, T0* a2, T6 a3, T6 a4, T6 a5)
{
	T0* t1;
	t1 = (T50f290(C));
	T109f4(GE_void(t1), a1, a2, a3, a4, a5);
}

/* PR_YACC_PARSER.yy_chk_template_1 */
void T50f378(T0* C, T0* a1)
{
	T0* t1;
	t1 = GE_ma102((T6)1001,(T6)1001,
(T6)(GE_int32(0)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(3)),
(T6)(GE_int32(7)),
(T6)(GE_int32(29)),
(T6)(GE_int32(7)),
(T6)(GE_int32(3)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(17)),
(T6)(GE_int32(42)),
(T6)(GE_int32(17)),
(T6)(GE_int32(7)),
(T6)(GE_int32(27)),
(T6)(GE_int32(27)),
(T6)(GE_int32(29)),
(T6)(GE_int32(282)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(8)),
(T6)(GE_int32(30)),
(T6)(GE_int32(8)),
(T6)(GE_int32(271)),
(T6)(GE_int32(8)),
(T6)(GE_int32(8)),
(T6)(GE_int32(45)),
(T6)(GE_int32(45)),
(T6)(GE_int32(45)),
(T6)(GE_int32(8)),
(T6)(GE_int32(30)),
(T6)(GE_int32(50)),
(T6)(GE_int32(42)),
(T6)(GE_int32(50)),
(T6)(GE_int32(51)),
(T6)(GE_int32(56)),
(T6)(GE_int32(51)),
(T6)(GE_int32(56)),
(T6)(GE_int32(57)),
(T6)(GE_int32(270)),
(T6)(GE_int32(269)),
(T6)(GE_int32(3)),
(T6)(GE_int32(42)),
(T6)(GE_int32(3)),
(T6)(GE_int32(57)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(4)),
(T6)(GE_int32(62)),
(T6)(GE_int32(78)),
(T6)(GE_int32(62)),
(T6)(GE_int32(4)),
(T6)(GE_int32(68)),
(T6)(GE_int32(68)),
(T6)(GE_int32(68)),
(T6)(GE_int32(69)),
(T6)(GE_int32(78)),
(T6)(GE_int32(69)),
(T6)(GE_int32(79)),
(T6)(GE_int32(79)),
(T6)(GE_int32(79)),
(T6)(GE_int32(97)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(97)),
(T6)(GE_int32(103)),
(T6)(GE_int32(103)),
(T6)(GE_int32(103)),
(T6)(GE_int32(107)),
(T6)(GE_int32(109)),
(T6)(GE_int32(107)),
(T6)(GE_int32(110)),
(T6)(GE_int32(112)),
(T6)(GE_int32(110)),
(T6)(GE_int32(116)),
(T6)(GE_int32(118)),
(T6)(GE_int32(116)),
(T6)(GE_int32(112)),
(T6)(GE_int32(109)),
(T6)(GE_int32(267)),
(T6)(GE_int32(51)),
(T6)(GE_int32(123)),
(T6)(GE_int32(121)),
(T6)(GE_int32(266)),
(T6)(GE_int32(118)),
(T6)(GE_int32(4)),
(T6)(GE_int32(123)),
(T6)(GE_int32(4)),
(T6)(GE_int32(121)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(9)),
(T6)(GE_int32(265)),
(T6)(GE_int32(9)),
(T6)(GE_int32(9)),
(T6)(GE_int32(9)),
(T6)(GE_int32(9)),
(T6)(GE_int32(125)),
(T6)(GE_int32(139)),
(T6)(GE_int32(125)),
(T6)(GE_int32(9)),
(T6)(GE_int32(128)),
(T6)(GE_int32(128)),
(T6)(GE_int32(128)),
(T6)(GE_int32(139)),
(T6)(GE_int32(139)),
(T6)(GE_int32(139)),
(T6)(GE_int32(139)),
(T6)(GE_int32(139)),
(T6)(GE_int32(139)),
(T6)(GE_int32(172)),
(T6)(GE_int32(212)),
(T6)(GE_int32(274)),
(T6)(GE_int32(212)),
(T6)(GE_int32(264)),
(T6)(GE_int32(274)),
(T6)(GE_int32(172)),
(T6)(GE_int32(172)),
(T6)(GE_int32(172)),
(T6)(GE_int32(172)),
(T6)(GE_int32(172)),
(T6)(GE_int32(172)),
(T6)(GE_int32(258)),
(T6)(GE_int32(263)),
(T6)(GE_int32(258)),
(T6)(GE_int32(260)),
(T6)(GE_int32(258)),
(T6)(GE_int32(258)),
(T6)(GE_int32(259)),
(T6)(GE_int32(256)),
(T6)(GE_int32(259)),
(T6)(GE_int32(255)),
(T6)(GE_int32(259)),
(T6)(GE_int32(259)),
(T6)(GE_int32(253)),
(T6)(GE_int32(252)),
(T6)(GE_int32(251)),
(T6)(GE_int32(247)),
(T6)(GE_int32(246)),
(T6)(GE_int32(9)),
(T6)(GE_int32(245)),
(T6)(GE_int32(9)),
(T6)(GE_int32(10)),
(T6)(GE_int32(244)),
(T6)(GE_int32(10)),
(T6)(GE_int32(10)),
(T6)(GE_int32(10)),
(T6)(GE_int32(10)),
(T6)(GE_int32(242)),
(T6)(GE_int32(240)),
(T6)(GE_int32(239)),
(T6)(GE_int32(10)),
(T6)(GE_int32(292)),
(T6)(GE_int32(292)),
(T6)(GE_int32(292)),
(T6)(GE_int32(292)),
(T6)(GE_int32(292)),
(T6)(GE_int32(292)),
(T6)(GE_int32(292)),
(T6)(GE_int32(302)),
(T6)(GE_int32(302)),
(T6)(GE_int32(302)),
(T6)(GE_int32(302)),
(T6)(GE_int32(302)),
(T6)(GE_int32(302)),
(T6)(GE_int32(302)),
(T6)(GE_int32(305)),
(T6)(GE_int32(305)),
(T6)(GE_int32(305)),
(T6)(GE_int32(305)),
(T6)(GE_int32(305)),
(T6)(GE_int32(305)),
(T6)(GE_int32(305)),
(T6)(GE_int32(309)),
(T6)(GE_int32(309)),
(T6)(GE_int32(309)),
(T6)(GE_int32(309)),
(T6)(GE_int32(309)),
(T6)(GE_int32(309)),
(T6)(GE_int32(309)),
(T6)(GE_int32(310)),
(T6)(GE_int32(310)),
(T6)(GE_int32(310)),
(T6)(GE_int32(310)),
(T6)(GE_int32(310)),
(T6)(GE_int32(310)),
(T6)(GE_int32(310)),
(T6)(GE_int32(236)),
(T6)(GE_int32(235)),
(T6)(GE_int32(234)),
(T6)(GE_int32(10)),
(T6)(GE_int32(233)),
(T6)(GE_int32(10)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(232)),
(T6)(GE_int32(231)),
(T6)(GE_int32(230)),
(T6)(GE_int32(229)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(227)),
(T6)(GE_int32(11)),
(T6)(GE_int32(226)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(311)),
(T6)(GE_int32(311)),
(T6)(GE_int32(311)),
(T6)(GE_int32(311)),
(T6)(GE_int32(311)),
(T6)(GE_int32(311)),
(T6)(GE_int32(311)),
(T6)(GE_int32(312)),
(T6)(GE_int32(312)),
(T6)(GE_int32(312)),
(T6)(GE_int32(312)),
(T6)(GE_int32(312)),
(T6)(GE_int32(312)),
(T6)(GE_int32(312)),
(T6)(GE_int32(225)),
(T6)(GE_int32(224)),
(T6)(GE_int32(223)),
(T6)(GE_int32(219)),
(T6)(GE_int32(218)),
(T6)(GE_int32(216)),
(T6)(GE_int32(214)),
(T6)(GE_int32(213)),
(T6)(GE_int32(211)),
(T6)(GE_int32(210)),
(T6)(GE_int32(209)),
(T6)(GE_int32(208)),
(T6)(GE_int32(207)),
(T6)(GE_int32(206)),
(T6)(GE_int32(205)),
(T6)(GE_int32(11)),
(T6)(GE_int32(12)),
(T6)(GE_int32(12)),
(T6)(GE_int32(12)),
(T6)(GE_int32(204)),
(T6)(GE_int32(203)),
(T6)(GE_int32(202)),
(T6)(GE_int32(200)),
(T6)(GE_int32(12)),
(T6)(GE_int32(12)),
(T6)(GE_int32(199)),
(T6)(GE_int32(12)),
(T6)(GE_int32(198)),
(T6)(GE_int32(12)),
(T6)(GE_int32(12)),
(T6)(GE_int32(12)),
(T6)(GE_int32(12)),
(T6)(GE_int32(12)),
(T6)(GE_int32(12)),
(T6)(GE_int32(12)),
(T6)(GE_int32(12)),
(T6)(GE_int32(197)),
(T6)(GE_int32(195)),
(T6)(GE_int32(194)),
(T6)(GE_int32(193)),
(T6)(GE_int32(192)),
(T6)(GE_int32(191)),
(T6)(GE_int32(190)),
(T6)(GE_int32(189)),
(T6)(GE_int32(188)),
(T6)(GE_int32(187)),
(T6)(GE_int32(186)),
(T6)(GE_int32(185)),
(T6)(GE_int32(184)),
(T6)(GE_int32(183)),
(T6)(GE_int32(181)),
(T6)(GE_int32(180)),
(T6)(GE_int32(179)),
(T6)(GE_int32(178)),
(T6)(GE_int32(177)),
(T6)(GE_int32(176)),
(T6)(GE_int32(175)),
(T6)(GE_int32(174)),
(T6)(GE_int32(173)),
(T6)(GE_int32(171)),
(T6)(GE_int32(170)),
(T6)(GE_int32(169)),
(T6)(GE_int32(168)),
(T6)(GE_int32(167)),
(T6)(GE_int32(166)),
(T6)(GE_int32(12)),
(T6)(GE_int32(13)),
(T6)(GE_int32(165)),
(T6)(GE_int32(13)),
(T6)(GE_int32(13)),
(T6)(GE_int32(13)),
(T6)(GE_int32(13)),
(T6)(GE_int32(157)),
(T6)(GE_int32(156)),
(T6)(GE_int32(155)),
(T6)(GE_int32(13)),
(T6)(GE_int32(154)),
(T6)(GE_int32(153)),
(T6)(GE_int32(152)),
(T6)(GE_int32(151)),
(T6)(GE_int32(150)),
(T6)(GE_int32(149)),
(T6)(GE_int32(148)),
(T6)(GE_int32(147)),
(T6)(GE_int32(146)),
(T6)(GE_int32(145)),
(T6)(GE_int32(144)),
(T6)(GE_int32(143)),
(T6)(GE_int32(142)),
(T6)(GE_int32(141)),
(T6)(GE_int32(140)),
(T6)(GE_int32(136)),
(T6)(GE_int32(135)),
(T6)(GE_int32(134)),
(T6)(GE_int32(133)),
(T6)(GE_int32(132)),
(T6)(GE_int32(131)),
(T6)(GE_int32(130)),
(T6)(GE_int32(122)),
(T6)(GE_int32(115)),
(T6)(GE_int32(111)),
(T6)(GE_int32(102)),
(T6)(GE_int32(101)),
(T6)(GE_int32(99)),
(T6)(GE_int32(98)),
(T6)(GE_int32(96)),
(T6)(GE_int32(95)),
(T6)(GE_int32(94)),
(T6)(GE_int32(93)),
(T6)(GE_int32(92)),
(T6)(GE_int32(91)),
(T6)(GE_int32(90)),
(T6)(GE_int32(89)),
(T6)(GE_int32(88)),
(T6)(GE_int32(13)),
(T6)(GE_int32(87)),
(T6)(GE_int32(13)),
(T6)(GE_int32(14)),
(T6)(GE_int32(86)),
(T6)(GE_int32(14)),
(T6)(GE_int32(14)),
(T6)(GE_int32(14)),
(T6)(GE_int32(14)),
(T6)(GE_int32(80)),
(T6)(GE_int32(77)),
(T6)(GE_int32(76)),
(T6)(GE_int32(14)),
(T6)(GE_int32(75)),
(T6)(GE_int32(74)),
(T6)(GE_int32(73)),
(T6)(GE_int32(70)),
(T6)(GE_int32(66)),
(T6)(GE_int32(59)),
(T6)(GE_int32(58)),
(T6)(GE_int32(55)),
(T6)(GE_int32(53)),
(T6)(GE_int32(52)),
(T6)(GE_int32(39)),
(T6)(GE_int32(38)),
(T6)(GE_int32(37)),
(T6)(GE_int32(36)),
(T6)(GE_int32(35)),
(T6)(GE_int32(34)),
(T6)(GE_int32(33)),
(T6)(GE_int32(31)),
(T6)(GE_int32(28)),
(T6)(GE_int32(23)),
(T6)(GE_int32(21)),
(T6)(GE_int32(19)),
(T6)(GE_int32(15)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(14)),
(T6)(GE_int32(0)),
(T6)(GE_int32(14)),
(T6)(GE_int32(20)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(20)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(20)),
(T6)(GE_int32(20)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(20)),
(T6)(GE_int32(20)),
(T6)(GE_int32(20)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(20)),
(T6)(GE_int32(81)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(81)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(286)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(287)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(288)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(289)),
(T6)(GE_int32(290)),
(T6)(GE_int32(0)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(290)),
(T6)(GE_int32(291)),
(T6)(GE_int32(0)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(0)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(291)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(293)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(294)),
(T6)(GE_int32(295)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(295)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(295)),
(T6)(GE_int32(296)),
(T6)(GE_int32(0)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(296)),
(T6)(GE_int32(297)),
(T6)(GE_int32(0)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(0)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(297)),
(T6)(GE_int32(298)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(298)),
(T6)(GE_int32(299)),
(T6)(GE_int32(0)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(299)),
(T6)(GE_int32(300)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(300)),
(T6)(GE_int32(300)),
(T6)(GE_int32(300)),
(T6)(GE_int32(300)),
(T6)(GE_int32(300)),
(T6)(GE_int32(300)),
(T6)(GE_int32(300)),
(T6)(GE_int32(300)),
(T6)(GE_int32(301)),
(T6)(GE_int32(0)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(0)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(301)),
(T6)(GE_int32(303)),
(T6)(GE_int32(0)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(303)),
(T6)(GE_int32(304)),
(T6)(GE_int32(0)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(304)),
(T6)(GE_int32(306)),
(T6)(GE_int32(0)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(306)),
(T6)(GE_int32(307)),
(T6)(GE_int32(0)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(307)),
(T6)(GE_int32(308)),
(T6)(GE_int32(0)),
(T6)(GE_int32(308)),
(T6)(GE_int32(308)),
(T6)(GE_int32(308)),
(T6)(GE_int32(308)),
(T6)(GE_int32(308)),
(T6)(GE_int32(308)),
(T6)(GE_int32(308)),
(T6)(GE_int32(308)),
(T6)(GE_int32(313)),
(T6)(GE_int32(0)),
(T6)(GE_int32(313)),
(T6)(GE_int32(313)),
(T6)(GE_int32(313)),
(T6)(GE_int32(313)),
(T6)(GE_int32(313)),
(T6)(GE_int32(2147483647)));
	T50f382(C, a1, t1, (T6)(GE_int32(1)), (T6)(GE_int32(1000)), (T6)(GE_int32(0)));
}

/* PR_YACC_PARSER.yy_nxt_template */
unsigned char ge208os4315 = '\0';
T0* ge208ov4315;
T0* T50f266(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge208os4315) {
		return ge208ov4315;
	} else {
		ge208os4315 = '\1';
		ge208ov4315 = R;
	}
	l1 = T102c7((T6)(GE_int32(0)), (T6)(GE_int32(1056)));
	T50f376(C, l1);
	T50f377(C, l1);
	R = (T50f288(C, l1));
	ge208ov4315 = R;
	return R;
}

/* PR_YACC_PARSER.yy_nxt_template_2 */
void T50f377(T0* C, T0* a1)
{
	T0* t1;
	t1 = GE_ma102((T6)58,(T6)58,
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(15)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(2147483647)));
	T50f382(C, a1, t1, (T6)(GE_int32(1)), (T6)(GE_int32(57)), (T6)(GE_int32(1000)));
}

/* PR_YACC_PARSER.yy_nxt_template_1 */
void T50f376(T0* C, T0* a1)
{
	T0* t1;
	t1 = GE_ma102((T6)1001,(T6)1001,
(T6)(GE_int32(0)),
(T6)(GE_int32(16)),
(T6)(GE_int32(17)),
(T6)(GE_int32(18)),
(T6)(GE_int32(17)),
(T6)(GE_int32(19)),
(T6)(GE_int32(16)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(16)),
(T6)(GE_int32(24)),
(T6)(GE_int32(24)),
(T6)(GE_int32(24)),
(T6)(GE_int32(24)),
(T6)(GE_int32(24)),
(T6)(GE_int32(24)),
(T6)(GE_int32(24)),
(T6)(GE_int32(24)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(25)),
(T6)(GE_int32(26)),
(T6)(GE_int32(27)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(32)),
(T6)(GE_int32(32)),
(T6)(GE_int32(32)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(32)),
(T6)(GE_int32(34)),
(T6)(GE_int32(35)),
(T6)(GE_int32(32)),
(T6)(GE_int32(36)),
(T6)(GE_int32(37)),
(T6)(GE_int32(38)),
(T6)(GE_int32(39)),
(T6)(GE_int32(32)),
(T6)(GE_int32(32)),
(T6)(GE_int32(32)),
(T6)(GE_int32(40)),
(T6)(GE_int32(16)),
(T6)(GE_int32(41)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(42)),
(T6)(GE_int32(49)),
(T6)(GE_int32(88)),
(T6)(GE_int32(50)),
(T6)(GE_int32(16)),
(T6)(GE_int32(51)),
(T6)(GE_int32(52)),
(T6)(GE_int32(69)),
(T6)(GE_int32(100)),
(T6)(GE_int32(69)),
(T6)(GE_int32(53)),
(T6)(GE_int32(85)),
(T6)(GE_int32(86)),
(T6)(GE_int32(89)),
(T6)(GE_int32(284)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(49)),
(T6)(GE_int32(90)),
(T6)(GE_int32(50)),
(T6)(GE_int32(281)),
(T6)(GE_int32(51)),
(T6)(GE_int32(52)),
(T6)(GE_int32(103)),
(T6)(GE_int32(104)),
(T6)(GE_int32(103)),
(T6)(GE_int32(53)),
(T6)(GE_int32(91)),
(T6)(GE_int32(108)),
(T6)(GE_int32(101)),
(T6)(GE_int32(109)),
(T6)(GE_int32(108)),
(T6)(GE_int32(117)),
(T6)(GE_int32(109)),
(T6)(GE_int32(118)),
(T6)(GE_int32(119)),
(T6)(GE_int32(280)),
(T6)(GE_int32(279)),
(T6)(GE_int32(16)),
(T6)(GE_int32(102)),
(T6)(GE_int32(16)),
(T6)(GE_int32(120)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(42)),
(T6)(GE_int32(125)),
(T6)(GE_int32(135)),
(T6)(GE_int32(125)),
(T6)(GE_int32(16)),
(T6)(GE_int32(128)),
(T6)(GE_int32(129)),
(T6)(GE_int32(128)),
(T6)(GE_int32(69)),
(T6)(GE_int32(136)),
(T6)(GE_int32(69)),
(T6)(GE_int32(79)),
(T6)(GE_int32(137)),
(T6)(GE_int32(79)),
(T6)(GE_int32(152)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(153)),
(T6)(GE_int32(103)),
(T6)(GE_int32(104)),
(T6)(GE_int32(103)),
(T6)(GE_int32(108)),
(T6)(GE_int32(285)),
(T6)(GE_int32(109)),
(T6)(GE_int32(108)),
(T6)(GE_int32(111)),
(T6)(GE_int32(109)),
(T6)(GE_int32(117)),
(T6)(GE_int32(285)),
(T6)(GE_int32(118)),
(T6)(GE_int32(160)),
(T6)(GE_int32(158)),
(T6)(GE_int32(278)),
(T6)(GE_int32(110)),
(T6)(GE_int32(122)),
(T6)(GE_int32(285)),
(T6)(GE_int32(277)),
(T6)(GE_int32(161)),
(T6)(GE_int32(16)),
(T6)(GE_int32(164)),
(T6)(GE_int32(16)),
(T6)(GE_int32(285)),
(T6)(GE_int32(45)),
(T6)(GE_int32(46)),
(T6)(GE_int32(55)),
(T6)(GE_int32(276)),
(T6)(GE_int32(56)),
(T6)(GE_int32(57)),
(T6)(GE_int32(56)),
(T6)(GE_int32(58)),
(T6)(GE_int32(125)),
(T6)(GE_int32(138)),
(T6)(GE_int32(125)),
(T6)(GE_int32(59)),
(T6)(GE_int32(128)),
(T6)(GE_int32(129)),
(T6)(GE_int32(128)),
(T6)(GE_int32(172)),
(T6)(GE_int32(172)),
(T6)(GE_int32(172)),
(T6)(GE_int32(172)),
(T6)(GE_int32(172)),
(T6)(GE_int32(172)),
(T6)(GE_int32(138)),
(T6)(GE_int32(233)),
(T6)(GE_int32(282)),
(T6)(GE_int32(234)),
(T6)(GE_int32(275)),
(T6)(GE_int32(283)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(265)),
(T6)(GE_int32(274)),
(T6)(GE_int32(266)),
(T6)(GE_int32(273)),
(T6)(GE_int32(267)),
(T6)(GE_int32(268)),
(T6)(GE_int32(269)),
(T6)(GE_int32(264)),
(T6)(GE_int32(270)),
(T6)(GE_int32(263)),
(T6)(GE_int32(271)),
(T6)(GE_int32(272)),
(T6)(GE_int32(262)),
(T6)(GE_int32(261)),
(T6)(GE_int32(260)),
(T6)(GE_int32(259)),
(T6)(GE_int32(258)),
(T6)(GE_int32(60)),
(T6)(GE_int32(257)),
(T6)(GE_int32(61)),
(T6)(GE_int32(55)),
(T6)(GE_int32(256)),
(T6)(GE_int32(56)),
(T6)(GE_int32(57)),
(T6)(GE_int32(56)),
(T6)(GE_int32(58)),
(T6)(GE_int32(255)),
(T6)(GE_int32(254)),
(T6)(GE_int32(253)),
(T6)(GE_int32(59)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(83)),
(T6)(GE_int32(127)),
(T6)(GE_int32(127)),
(T6)(GE_int32(127)),
(T6)(GE_int32(127)),
(T6)(GE_int32(127)),
(T6)(GE_int32(127)),
(T6)(GE_int32(127)),
(T6)(GE_int32(162)),
(T6)(GE_int32(162)),
(T6)(GE_int32(162)),
(T6)(GE_int32(162)),
(T6)(GE_int32(162)),
(T6)(GE_int32(162)),
(T6)(GE_int32(162)),
(T6)(GE_int32(191)),
(T6)(GE_int32(191)),
(T6)(GE_int32(191)),
(T6)(GE_int32(191)),
(T6)(GE_int32(191)),
(T6)(GE_int32(191)),
(T6)(GE_int32(191)),
(T6)(GE_int32(192)),
(T6)(GE_int32(192)),
(T6)(GE_int32(192)),
(T6)(GE_int32(192)),
(T6)(GE_int32(192)),
(T6)(GE_int32(192)),
(T6)(GE_int32(192)),
(T6)(GE_int32(252)),
(T6)(GE_int32(251)),
(T6)(GE_int32(250)),
(T6)(GE_int32(60)),
(T6)(GE_int32(249)),
(T6)(GE_int32(61)),
(T6)(GE_int32(62)),
(T6)(GE_int32(63)),
(T6)(GE_int32(62)),
(T6)(GE_int32(248)),
(T6)(GE_int32(247)),
(T6)(GE_int32(246)),
(T6)(GE_int32(245)),
(T6)(GE_int32(64)),
(T6)(GE_int32(65)),
(T6)(GE_int32(244)),
(T6)(GE_int32(66)),
(T6)(GE_int32(243)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(193)),
(T6)(GE_int32(193)),
(T6)(GE_int32(193)),
(T6)(GE_int32(193)),
(T6)(GE_int32(193)),
(T6)(GE_int32(193)),
(T6)(GE_int32(193)),
(T6)(GE_int32(194)),
(T6)(GE_int32(194)),
(T6)(GE_int32(194)),
(T6)(GE_int32(194)),
(T6)(GE_int32(194)),
(T6)(GE_int32(194)),
(T6)(GE_int32(194)),
(T6)(GE_int32(242)),
(T6)(GE_int32(241)),
(T6)(GE_int32(240)),
(T6)(GE_int32(239)),
(T6)(GE_int32(238)),
(T6)(GE_int32(237)),
(T6)(GE_int32(236)),
(T6)(GE_int32(235)),
(T6)(GE_int32(232)),
(T6)(GE_int32(231)),
(T6)(GE_int32(230)),
(T6)(GE_int32(229)),
(T6)(GE_int32(228)),
(T6)(GE_int32(227)),
(T6)(GE_int32(226)),
(T6)(GE_int32(68)),
(T6)(GE_int32(62)),
(T6)(GE_int32(63)),
(T6)(GE_int32(62)),
(T6)(GE_int32(225)),
(T6)(GE_int32(224)),
(T6)(GE_int32(223)),
(T6)(GE_int32(222)),
(T6)(GE_int32(64)),
(T6)(GE_int32(65)),
(T6)(GE_int32(221)),
(T6)(GE_int32(66)),
(T6)(GE_int32(220)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(67)),
(T6)(GE_int32(219)),
(T6)(GE_int32(218)),
(T6)(GE_int32(122)),
(T6)(GE_int32(116)),
(T6)(GE_int32(111)),
(T6)(GE_int32(107)),
(T6)(GE_int32(217)),
(T6)(GE_int32(216)),
(T6)(GE_int32(215)),
(T6)(GE_int32(214)),
(T6)(GE_int32(213)),
(T6)(GE_int32(212)),
(T6)(GE_int32(211)),
(T6)(GE_int32(210)),
(T6)(GE_int32(209)),
(T6)(GE_int32(208)),
(T6)(GE_int32(207)),
(T6)(GE_int32(206)),
(T6)(GE_int32(205)),
(T6)(GE_int32(204)),
(T6)(GE_int32(203)),
(T6)(GE_int32(202)),
(T6)(GE_int32(138)),
(T6)(GE_int32(201)),
(T6)(GE_int32(200)),
(T6)(GE_int32(199)),
(T6)(GE_int32(198)),
(T6)(GE_int32(197)),
(T6)(GE_int32(196)),
(T6)(GE_int32(68)),
(T6)(GE_int32(55)),
(T6)(GE_int32(195)),
(T6)(GE_int32(56)),
(T6)(GE_int32(57)),
(T6)(GE_int32(56)),
(T6)(GE_int32(58)),
(T6)(GE_int32(190)),
(T6)(GE_int32(189)),
(T6)(GE_int32(188)),
(T6)(GE_int32(59)),
(T6)(GE_int32(187)),
(T6)(GE_int32(186)),
(T6)(GE_int32(185)),
(T6)(GE_int32(184)),
(T6)(GE_int32(183)),
(T6)(GE_int32(182)),
(T6)(GE_int32(181)),
(T6)(GE_int32(180)),
(T6)(GE_int32(179)),
(T6)(GE_int32(178)),
(T6)(GE_int32(177)),
(T6)(GE_int32(176)),
(T6)(GE_int32(175)),
(T6)(GE_int32(174)),
(T6)(GE_int32(138)),
(T6)(GE_int32(171)),
(T6)(GE_int32(170)),
(T6)(GE_int32(169)),
(T6)(GE_int32(168)),
(T6)(GE_int32(167)),
(T6)(GE_int32(166)),
(T6)(GE_int32(165)),
(T6)(GE_int32(163)),
(T6)(GE_int32(115)),
(T6)(GE_int32(159)),
(T6)(GE_int32(157)),
(T6)(GE_int32(156)),
(T6)(GE_int32(155)),
(T6)(GE_int32(154)),
(T6)(GE_int32(151)),
(T6)(GE_int32(150)),
(T6)(GE_int32(149)),
(T6)(GE_int32(148)),
(T6)(GE_int32(147)),
(T6)(GE_int32(146)),
(T6)(GE_int32(145)),
(T6)(GE_int32(144)),
(T6)(GE_int32(143)),
(T6)(GE_int32(60)),
(T6)(GE_int32(142)),
(T6)(GE_int32(61)),
(T6)(GE_int32(55)),
(T6)(GE_int32(141)),
(T6)(GE_int32(56)),
(T6)(GE_int32(57)),
(T6)(GE_int32(56)),
(T6)(GE_int32(58)),
(T6)(GE_int32(138)),
(T6)(GE_int32(134)),
(T6)(GE_int32(133)),
(T6)(GE_int32(59)),
(T6)(GE_int32(132)),
(T6)(GE_int32(131)),
(T6)(GE_int32(130)),
(T6)(GE_int32(71)),
(T6)(GE_int32(126)),
(T6)(GE_int32(124)),
(T6)(GE_int32(123)),
(T6)(GE_int32(115)),
(T6)(GE_int32(113)),
(T6)(GE_int32(112)),
(T6)(GE_int32(99)),
(T6)(GE_int32(98)),
(T6)(GE_int32(97)),
(T6)(GE_int32(96)),
(T6)(GE_int32(95)),
(T6)(GE_int32(94)),
(T6)(GE_int32(93)),
(T6)(GE_int32(92)),
(T6)(GE_int32(87)),
(T6)(GE_int32(82)),
(T6)(GE_int32(81)),
(T6)(GE_int32(71)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(60)),
(T6)(GE_int32(285)),
(T6)(GE_int32(61)),
(T6)(GE_int32(72)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(73)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(74)),
(T6)(GE_int32(75)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(76)),
(T6)(GE_int32(77)),
(T6)(GE_int32(78)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(79)),
(T6)(GE_int32(80)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(139)),
(T6)(GE_int32(139)),
(T6)(GE_int32(139)),
(T6)(GE_int32(139)),
(T6)(GE_int32(139)),
(T6)(GE_int32(139)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(140)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(47)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(48)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(54)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(70)),
(T6)(GE_int32(285)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(70)),
(T6)(GE_int32(80)),
(T6)(GE_int32(285)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(285)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(84)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(105)),
(T6)(GE_int32(106)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(106)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(106)),
(T6)(GE_int32(107)),
(T6)(GE_int32(285)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(107)),
(T6)(GE_int32(111)),
(T6)(GE_int32(285)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(285)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(111)),
(T6)(GE_int32(114)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(114)),
(T6)(GE_int32(116)),
(T6)(GE_int32(285)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(116)),
(T6)(GE_int32(121)),
(T6)(GE_int32(285)),
(T6)(GE_int32(285)),
(T6)(GE_int32(121)),
(T6)(GE_int32(121)),
(T6)(GE_int32(121)),
(T6)(GE_int32(121)),
(T6)(GE_int32(121)),
(T6)(GE_int32(121)),
(T6)(GE_int32(121)),
(T6)(GE_int32(121)),
(T6)(GE_int32(122)),
(T6)(GE_int32(285)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(285)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(122)),
(T6)(GE_int32(82)),
(T6)(GE_int32(285)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(113)),
(T6)(GE_int32(285)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(113)),
(T6)(GE_int32(124)),
(T6)(GE_int32(285)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(124)),
(T6)(GE_int32(126)),
(T6)(GE_int32(285)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(126)),
(T6)(GE_int32(173)),
(T6)(GE_int32(285)),
(T6)(GE_int32(173)),
(T6)(GE_int32(173)),
(T6)(GE_int32(173)),
(T6)(GE_int32(173)),
(T6)(GE_int32(173)),
(T6)(GE_int32(173)),
(T6)(GE_int32(173)),
(T6)(GE_int32(173)),
(T6)(GE_int32(80)),
(T6)(GE_int32(285)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(2147483647)));
	T50f382(C, a1, t1, (T6)(GE_int32(1)), (T6)(GE_int32(1000)), (T6)(GE_int32(0)));
}

/* PR_YACC_PARSER.empty_buffer */
unsigned char ge137os4149 = '\0';
T0* ge137ov4149;
T0* T50f133(T0* C)
{
	T0* R = 0;
	if (ge137os4149) {
		return ge137ov4149;
	} else {
		ge137os4149 = '\1';
		ge137ov4149 = R;
	}
	R = T130c12(GE_ms8("", 0));
	ge137ov4149 = R;
	return R;
}

/* YY_BUFFER.make */
T0* T130c12(T0* a1)
{
	T0* C;
	T6 t1;
	T0* l1 = 0;
	T6 l2 = 0;
	C = GE_new130(EIF_TRUE);
	t1 = (((T17*)(a1))->a2);
	l2 = ((T6)((t1)+((T6)(GE_int32(2)))));
	l1 = (T130f11(C, l2));
	T283f10(GE_void(l1), a1, (T6)(GE_int32(1)));
	t1 = ((T6)((l2)-((T6)(GE_int32(1)))));
	T283f7(GE_void(l1), (T2)('\000'), t1);
	T283f7(GE_void(l1), (T2)('\000'), l2);
	T130f16(C, l1);
	return C;
}

/* YY_BUFFER.make_from_buffer */
void T130f16(T0* C, T0* a1)
{
	T6 t1;
	t1 = (T283f3(GE_void(a1)));
	((T130*)(C))->a9 = ((T6)((t1)-((T6)(GE_int32(2)))));
	((T130*)(C))->a7 = ((T130*)(C))->a9;
	((T130*)(C))->a1 = a1;
	((T130*)(C))->a2 = (T6)(GE_int32(1));
	((T130*)(C))->a3 = (T6)(GE_int32(1));
	((T130*)(C))->a4 = (T6)(GE_int32(1));
	((T130*)(C))->a5 = (T6)(GE_int32(1));
	((T130*)(C))->a6 = EIF_TRUE;
}

/* KL_CHARACTER_BUFFER.fill_from_string */
void T283f10(T0* C, T0* a1, T6 a2)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	l1 = (((T17*)(a1))->a2);
	t1 = (T6f1((&l1), (T6)(GE_int32(0))));
	if (t1) {
		t2 = ((T6)((a2)+((T6)(GE_int32(1)))));
		T17f46(GE_void(((T283*)(C))->a2), a1, (T6)(GE_int32(1)), l1, t2);
	}
}

/* YY_BUFFER.new_default_buffer */
T0* T130f11(T0* C, T6 a1)
{
	T0* R = 0;
	R = T283c6(a1);
	return R;
}

/* GEYACC.read_command_line */
void T21f20(T0* C)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T1 t4;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T21f13(C));
	l2 = ((T6)(GE_argc - 1));
	l1 = (T6)(GE_int32(1));
	while (1) {
		t2 = (T6f1((&l1), l2));
		if (t2) {
			break;
		}
		t1 = (T21f13(C));
		l3 = (T27f2(GE_void(t1), l1));
		t2 = (T17f5(GE_void(l3), GE_ms8("--version", 9)));
		if (!(t2)) {
			t2 = (T17f5(GE_void(l3), GE_ms8("-V", 2)));
		}
		if (t2) {
			T21f22(C);
		} else {
			t2 = (T17f5(GE_void(l3), GE_ms8("--help", 6)));
			if (!(t2)) {
				t2 = (T17f5(GE_void(l3), GE_ms8("-h", 2)));
			}
			if (!(t2)) {
				t2 = (T17f5(GE_void(l3), GE_ms8("-\?", 2)));
			}
			if (t2) {
				T21f23(C);
			} else {
				t2 = (T17f5(GE_void(l3), GE_ms8("-t", 2)));
				if (!(t2)) {
					t2 = (T17f5(GE_void(l3), GE_ms8("-d", 2)));
				}
				if (t2) {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t2 = (T6f1((&l1), l2));
					if (t2) {
						T21f24(C);
					} else {
						t1 = (T21f13(C));
						t1 = (T27f2(GE_void(t1), l1));
						((T21*)(C))->a9 = (T17f6(t1));
						t2 = ((((T21*)(C))->a10)==(EIF_VOID));
						if (t2) {
							((T21*)(C))->a10 = (T17f10(GE_void(((T21*)(C))->a9)));
							T17f31(GE_void(((T21*)(C))->a10), ge51ov1741);
						}
					}
				} else {
					t3 = (((T17*)(GE_void(l3)))->a2);
					t2 = (T6f1(&t3, (T6)(GE_int32(9))));
					if (t2) {
						t1 = (T17f11(GE_void(l3), (T6)(GE_int32(1)), (T6)(GE_int32(9))));
						t2 = (T17f5(GE_void(t1), GE_ms8("--tokens=", 9)));
					}
					if (t2) {
						t3 = (((T17*)(GE_void(l3)))->a2);
						t1 = (T17f11(GE_void(l3), (T6)(GE_int32(10)), t3));
						((T21*)(C))->a9 = (T17f6(GE_void(t1)));
						t2 = ((((T21*)(C))->a10)==(EIF_VOID));
						if (t2) {
							((T21*)(C))->a10 = (T17f10(GE_void(((T21*)(C))->a9)));
							T17f31(GE_void(((T21*)(C))->a10), ge51ov1741);
						}
					} else {
						t3 = (((T17*)(GE_void(l3)))->a2);
						t2 = (T6f1(&t3, (T6)(GE_int32(10))));
						if (t2) {
							t1 = (T17f11(GE_void(l3), (T6)(GE_int32(1)), (T6)(GE_int32(10))));
							t2 = (T17f5(GE_void(t1), GE_ms8("--defines=", 10)));
						}
						if (t2) {
							t3 = (((T17*)(GE_void(l3)))->a2);
							t1 = (T17f11(GE_void(l3), (T6)(GE_int32(11)), t3));
							((T21*)(C))->a9 = (T17f6(GE_void(t1)));
							t2 = ((((T21*)(C))->a10)==(EIF_VOID));
							if (t2) {
								((T21*)(C))->a10 = (T17f10(GE_void(((T21*)(C))->a9)));
								T17f31(GE_void(((T21*)(C))->a10), ge51ov1741);
							}
						} else {
							t2 = (T17f5(GE_void(l3), GE_ms8("-k", 2)));
							if (t2) {
								l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
								t2 = (T6f1((&l1), l2));
								if (t2) {
									T21f24(C);
								} else {
									t1 = (T21f13(C));
									((T21*)(C))->a10 = (T27f2(GE_void(t1), l1));
								}
							} else {
								t3 = (((T17*)(GE_void(l3)))->a2);
								t2 = (T6f1(&t3, (T6)(GE_int32(14))));
								if (t2) {
									t1 = (T17f11(GE_void(l3), (T6)(GE_int32(1)), (T6)(GE_int32(14))));
									t2 = (T17f5(GE_void(t1), GE_ms8("--tokens-file=", 14)));
								}
								if (t2) {
									t3 = (((T17*)(GE_void(l3)))->a2);
									((T21*)(C))->a10 = (T17f11(GE_void(l3), (T6)(GE_int32(15)), t3));
								} else {
									t2 = (T17f5(GE_void(l3), GE_ms8("-o", 2)));
									if (t2) {
										l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
										t2 = (T6f1((&l1), l2));
										if (t2) {
											T21f24(C);
										} else {
											t1 = (T21f13(C));
											((T21*)(C))->a6 = (T27f2(GE_void(t1), l1));
										}
									} else {
										t3 = (((T17*)(GE_void(l3)))->a2);
										t2 = (T6f1(&t3, (T6)(GE_int32(14))));
										if (t2) {
											t1 = (T17f11(GE_void(l3), (T6)(GE_int32(1)), (T6)(GE_int32(14))));
											t2 = (T17f5(GE_void(t1), GE_ms8("--output-file=", 14)));
										}
										if (t2) {
											t3 = (((T17*)(GE_void(l3)))->a2);
											((T21*)(C))->a6 = (T17f11(GE_void(l3), (T6)(GE_int32(15)), t3));
										} else {
											t2 = (T17f5(GE_void(l3), GE_ms8("-v", 2)));
											if (t2) {
												l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
												t2 = (T6f1((&l1), l2));
												if (t2) {
													T21f24(C);
												} else {
													t1 = (T21f13(C));
													((T21*)(C))->a7 = (T27f2(GE_void(t1), l1));
												}
											} else {
												t2 = (T17f5(GE_void(l3), GE_ms8("-x", 2)));
												if (t2) {
													((T21*)(C))->a11 = EIF_TRUE;
												} else {
													t3 = (((T17*)(GE_void(l3)))->a2);
													t2 = (T6f1(&t3, (T6)(GE_int32(10))));
													if (t2) {
														t1 = (T17f11(GE_void(l3), (T6)(GE_int32(1)), (T6)(GE_int32(10))));
														t2 = (T17f5(GE_void(t1), GE_ms8("--verbose=", 10)));
													}
													if (t2) {
														t3 = (((T17*)(GE_void(l3)))->a2);
														((T21*)(C))->a7 = (T17f11(GE_void(l3), (T6)(GE_int32(11)), t3));
													} else {
														t2 = (T17f5(GE_void(l3), GE_ms8("--old_typing", 12)));
														if (t2) {
															((T21*)(C))->a2 = EIF_TRUE;
														} else {
															t2 = (T17f5(GE_void(l3), GE_ms8("--new_typing", 12)));
															if (t2) {
																((T21*)(C))->a2 = EIF_FALSE;
															} else {
																t3 = (((T17*)(GE_void(l3)))->a2);
																t2 = (T6f1(&t3, (T6)(GE_int32(6))));
																if (t2) {
																	t1 = (T17f11(GE_void(l3), (T6)(GE_int32(1)), (T6)(GE_int32(6))));
																	t2 = (T17f5(GE_void(t1), GE_ms8("--doc=", 6)));
																}
																if (t2) {
																	t3 = (((T17*)(GE_void(l3)))->a2);
																	((T21*)(C))->a5 = (T17f11(GE_void(l3), (T6)(GE_int32(7)), t3));
																	t2 = (T17f5(GE_void(((T21*)(C))->a5), GE_ms8("html", 4)));
																	t2 = ((T1)(!(t2)));
																	if (t2) {
																		t4 = (T17f5(GE_void(((T21*)(C))->a5), GE_ms8("xml", 3)));
																		t2 = ((T1)(!(t4)));
																	}
																	if (t2) {
																		T21f24(C);
																	}
																} else {
																	t3 = (((T17*)(GE_void(l3)))->a2);
																	t2 = (T6f1(&t3, (T6)(GE_int32(9))));
																	if (t2) {
																		t1 = (T17f11(GE_void(l3), (T6)(GE_int32(1)), (T6)(GE_int32(9))));
																		t2 = (T17f5(GE_void(t1), GE_ms8("--pragma=", 9)));
																	}
																	if (t2) {
																		t3 = (((T17*)(GE_void(l3)))->a2);
																		l4 = (T17f11(GE_void(l3), (T6)(GE_int32(10)), t3));
																		t2 = (T17f5(GE_void(l4), GE_ms8("line", 4)));
																		if (t2) {
																			((T21*)(C))->a3 = EIF_TRUE;
																		} else {
																			t2 = (T17f5(GE_void(l4), GE_ms8("noline", 6)));
																			if (t2) {
																				((T21*)(C))->a3 = EIF_FALSE;
																			} else {
																				T21f24(C);
																			}
																		}
																	} else {
																		t2 = (((((l1) == (l2)))));
																		if (t2) {
																			((T21*)(C))->a8 = l3;
																		} else {
																			T21f24(C);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t2 = ((((T21*)(C))->a8)==(EIF_VOID));
	if (t2) {
		T21f24(C);
	}
}

/* GEYACC.report_usage_error */
void T21f24(T0* C)
{
	T0* t1;
	t1 = (T21f17(C));
	T28f7(GE_void(((T21*)(C))->a1), t1);
	t1 = (T21f15(C));
	T34f2(GE_void(t1), (T6)(GE_int32(1)));
}

/* GEYACC.usage_message */
unsigned char ge51os1745 = '\0';
T0* ge51ov1745;
T0* T21f17(T0* C)
{
	T0* R = 0;
	if (ge51os1745) {
		return ge51ov1745;
	} else {
		ge51os1745 = '\1';
		ge51ov1745 = R;
	}
	R = T56c7(GE_ms8("[--version][--help][-hxV\?][--(new|old)_typing]\n\t[--pragma=[no]line][--doc=(html|xml)][-t classname]\n\t[-k filename][-v filename][-o filename] filename", 149));
	ge51ov1745 = R;
	return R;
}

/* UT_USAGE_MESSAGE.make */
T0* T56c7(T0* a1)
{
	T0* C;
	C = GE_new56(EIF_TRUE);
	((T56*)(C))->a1 = T123c6((T6)(GE_int32(1)), (T6)(GE_int32(1)));
	T123f7(GE_void(((T56*)(C))->a1), a1, (T6)(GE_int32(1)));
	return C;
}

/* GEYACC.report_usage_message */
void T21f23(T0* C)
{
	T0* t1;
	t1 = (T21f17(C));
	T28f8(GE_void(((T21*)(C))->a1), t1);
	t1 = (T21f15(C));
	T34f2(GE_void(t1), (T6)(GE_int32(0)));
}

/* UT_ERROR_HANDLER.report_info */
void T28f8(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T28f5(C, a1));
	T28f11(C, t1);
}

/* UT_ERROR_HANDLER.report_info_message */
void T28f11(T0* C, T0* a1)
{
	T36f11(GE_void(((T28*)(C))->a3), a1);
}

/* GEYACC.report_version_number */
void T21f22(T0* C)
{
	T0* t1;
	T0* l1 = 0;
	l1 = T55c7(ge336ov1747);
	T28f8(GE_void(((T21*)(C))->a1), l1);
	t1 = (T21f15(C));
	T34f2(GE_void(t1), (T6)(GE_int32(0)));
}

/* UT_VERSION_NUMBER.make */
T0* T55c7(T0* a1)
{
	T0* C;
	C = GE_new55(EIF_TRUE);
	((T55*)(C))->a1 = T123c6((T6)(GE_int32(1)), (T6)(GE_int32(1)));
	T123f7(GE_void(((T55*)(C))->a1), a1, (T6)(GE_int32(1)));
	return C;
}

/* KL_ARGUMENTS.argument */
T0* T27f2(T0* C, T6 a1)
{
	T0* R = 0;
	char* s = GE_argv[a1];
	R = GE_ms8(s,strlen(s));
	return R;
}

/* UT_ERROR_HANDLER.make_standard */
T0* T28c6(void)
{
	T0* C;
	T0* t1;
	C = GE_new28(EIF_TRUE);
	t1 = (T28f4(C));
	((T28*)(C))->a1 = (T35f3(GE_void(t1)));
	t1 = (T28f4(C));
	((T28*)(C))->a2 = (T35f3(GE_void(t1)));
	t1 = (T28f4(C));
	((T28*)(C))->a3 = (T35f1(GE_void(t1)));
	return C;
}

/* UT_ERROR_HANDLER.std */
T0* T28f4(T0* C)
{
	T0* R = 0;
	if (ge311os1750) {
		return ge311ov1750;
	} else {
		ge311os1750 = '\1';
		ge311ov1750 = R;
	}
	R = T35c4();
	ge311ov1750 = R;
	return R;
}

/* KL_ARGUMENTS.set_program_name */
void T27f5(T0* C, T0* a1)
{
	((T27*)(C))->a1 = a1;
}

/* GEYACC.arguments */
unsigned char ge344os1749 = '\0';
T0* ge344ov1749;
T0* T21f13(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* KL_ARGUMENTS.make */
T0* T27c4(void)
{
	T0* C;
	C = GE_new27(EIF_TRUE);
	((T27*)(C))->a1 = (T27f2(C, (T6)(GE_int32(0))));
	return C;
}

/* GEYACC.resurrect_code */
void T21f19(T0* C)
{
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
	l1 = T37c1();
	l2 = T38c1();
	l3 = T39c1();
	l4 = T40c1();
	l5 = T41c2();
	l6 = T42c2();
	l7 = T43c1();
	l8 = T44c1();
	l9 = T45c1();
	l10 = T46c1();
	l11 = T47c1();
	l12 = T48c1();
	l13 = T49c1();
}

/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]].default_create */
T0* T49c1(void)
{
	T0* C;
	C = GE_new49(EIF_TRUE);
	return C;
}

/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]].default_create */
T0* T48c1(void)
{
	T0* C;
	C = GE_new48(EIF_TRUE);
	return C;
}

/* KL_EQUALITY_TESTER [PR_CONFLICT].default_create */
T0* T47c1(void)
{
	T0* C;
	C = GE_new47(EIF_TRUE);
	return C;
}

/* KL_EQUALITY_TESTER [PR_PORTION].default_create */
T0* T46c1(void)
{
	T0* C;
	C = GE_new46(EIF_TRUE);
	return C;
}

/* KL_EQUALITY_TESTER [PR_STATE].default_create */
T0* T45c1(void)
{
	T0* C;
	C = GE_new45(EIF_TRUE);
	return C;
}

/* KL_EQUALITY_TESTER [PR_REDUCTION].default_create */
T0* T44c1(void)
{
	T0* C;
	C = GE_new44(EIF_TRUE);
	return C;
}

/* KL_EQUALITY_TESTER [PR_TRANSITION].default_create */
T0* T43c1(void)
{
	T0* C;
	C = GE_new43(EIF_TRUE);
	return C;
}

/* KL_EQUALITY_TESTER [PR_TYPE].default_create */
T0* T40c1(void)
{
	T0* C;
	C = GE_new40(EIF_TRUE);
	return C;
}

/* KL_EQUALITY_TESTER [PR_VARIABLE].default_create */
T0* T39c1(void)
{
	T0* C;
	C = GE_new39(EIF_TRUE);
	return C;
}

/* KL_EQUALITY_TESTER [PR_TOKEN].default_create */
T0* T38c1(void)
{
	T0* C;
	C = GE_new38(EIF_TRUE);
	return C;
}

/* KL_EQUALITY_TESTER [PR_RULE].default_create */
T0* T37c1(void)
{
	T0* C;
	C = GE_new37(EIF_TRUE);
	return C;
}

/* KL_TEXT_INPUT_FILE.dispose */
void T51f37(T0* C)
{
	T1 t1;
	t1 = (T51f11(C));
	t1 = ((T1)(!(t1)));
	if (t1) {
		T51f41(C);
	}
}

/* KL_TEXT_OUTPUT_FILE.dispose */
void T24f21(T0* C)
{
	T1 t1;
	t1 = (T24f11(C));
	t1 = ((T1)(!(t1)));
	if (t1) {
		T24f30(C);
	}
}

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.default_message */
T0* T190f5(T0* C)
{
	T0* R = 0;
	R = (T190f3(C, ge161ov2618));
	return R;
}

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.message */
T0* T190f3(T0* C, T0* a1)
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
	t1 = (T190f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T190f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T190f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T190f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T190*)(C))->a1), l3));
						if (t2) {
							t1 = (T190f4(C));
							t5 = (T123f5(GE_void(((T190*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T190f4(C));
								t5 = (T190f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T190f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T190f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.arguments */
T0* T190f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* KL_STRING_ROUTINES.appended_string */
T0* T118f6(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	l1 = EIF_VOID;
	t1 = (EIF_FALSE);
	if (t1) {
		(GE_void(l1), a2);
		R = l1;
	} else {
		l1 = EIF_VOID;
		t1 = (EIF_FALSE);
		if (t1) {
			R = (T118f12(C, a1, a2));
		} else {
			T17f31(GE_void(a1), a2);
			R = a1;
		}
	}
	return R;
}

/* KL_STRING_ROUTINES.concat */
T0* T118f12(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	l1 = EIF_VOID;
	t1 = (EIF_FALSE);
	if (t1) {
		R = ((GE_void(l1), a2, (T0*)0));
	} else {
		l1 = EIF_VOID;
		t1 = (EIF_FALSE);
		if (t1) {
			R = ((GE_void(l1), a1, (T0*)0));
		} else {
			R = (T17f21(GE_void(a1), a2));
		}
	}
	return R;
}

/* STRING_8.plus */
T0* T17f21(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T17*)(GE_void(a1)))->a2);
	t1 = ((T6)((((T17*)(C))->a2)+(t1)));
	R = (T17f7(C, t1));
	T17f40(GE_void(R), C);
	T17f40(GE_void(R), a1);
	return R;
}

/* ARRAY [STRING_8].item */
T0* T123f5(T0* C, T6 a1)
{
	T6 t1;
	T0* R = 0;
	t1 = ((T6)((a1)-(((T123*)(C))->a2)));
	R = (((T122*)(GE_void(((T123*)(C))->a1)))->z2[t1]);
	return R;
}

/* ARRAY [STRING_8].valid_index */
T1 T123f4(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T6f12(&(((T123*)(C))->a2), a1));
	if (t1) {
		R = (T6f12(&a1, ((T123*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* KL_STRING_ROUTINES.append_substring_to_string */
void T118f14(T0* C, T0* a1, T0* a2, T6 a3, T6 a4)
{
	T1 t1;
	T2 t2;
	T0* l1 = 0;
	T6 l2 = 0;
	l1 = EIF_VOID;
	t1 = (EIF_FALSE);
	if (t1) {
		(GE_void(l1), a2, a3, a4);
	} else {
		l2 = a3;
		while (1) {
			t1 = (T6f1((&l2), a4));
			if (t1) {
				break;
			}
			t2 = (T17f14(a2, l2));
			T17f33(GE_void(a1), t2);
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
	}
}

/* KL_STRING_ROUTINES.appended_substring */
T0* T118f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4)
{
	T1 t1;
	T6 t2;
	T2 t3;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	l1 = EIF_VOID;
	t1 = (EIF_FALSE);
	if (t1) {
		(GE_void(l1), a2, a3, a4);
		R = l1;
	} else {
		l1 = EIF_VOID;
		t1 = (EIF_FALSE);
		if (t1) {
			t2 = (((T17*)(GE_void(a1)))->a2);
			t2 = ((T6)((t2)+(a4)));
			t2 = ((T6)((t2)-(a3)));
			t2 = ((T6)((t2)+((T6)(GE_int32(1)))));
			l1 = ((GE_void(l1), t2, (T0*)0));
			(GE_void(l1), a1);
			(GE_void(l1), a2, a3, a4);
			R = l1;
		} else {
			l2 = a3;
			while (1) {
				t1 = (T6f1((&l2), a4));
				if (t1) {
					break;
				}
				t3 = (T17f14(a2, l2));
				T17f33(GE_void(a1), t3);
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			R = a1;
		}
	}
	return R;
}

/* KL_STRING_ROUTINES.new_empty_string */
T0* T118f4(T0* C, T0* a1, T6 a2)
{
	T0* t1;
	T1 t2;
	T0* R = 0;
	T0* l1 = 0;
	t1 = (T118f7(C));
	t2 = (T199f1(GE_void(t1), a1, ge278ov5505));
	if (t2) {
		R = T17c30(a2);
	} else {
		l1 = EIF_VOID;
		t2 = (EIF_FALSE);
		if (t2) {
			R = ((GE_void(l1), a2, (T0*)0));
		} else {
			R = (T118f11(C, a1));
			T17f32(GE_void(R));
		}
	}
	return R;
}

/* KL_STRING_ROUTINES.cloned_string */
T0* T118f11(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T17f9(a1));
	return R;
}

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.string_ */
T0* T190f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_UNDEFINED_STRING_TOKEN_ERROR.default_message */
T0* T189f5(T0* C)
{
	T0* R = 0;
	R = (T189f3(C, ge173ov2618));
	return R;
}

/* PR_UNDEFINED_STRING_TOKEN_ERROR.message */
T0* T189f3(T0* C, T0* a1)
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
	t1 = (T189f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T189f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T189f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T189f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T189*)(C))->a1), l3));
						if (t2) {
							t1 = (T189f4(C));
							t5 = (T123f5(GE_void(((T189*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T189f4(C));
								t5 = (T189f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T189f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T189f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_UNDEFINED_STRING_TOKEN_ERROR.arguments */
T0* T189f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_UNDEFINED_STRING_TOKEN_ERROR.string_ */
T0* T189f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_VARIABLE_DECLARED_TWICE_ERROR.default_message */
T0* T188f5(T0* C)
{
	T0* R = 0;
	R = (T188f3(C, ge176ov2618));
	return R;
}

/* PR_VARIABLE_DECLARED_TWICE_ERROR.message */
T0* T188f3(T0* C, T0* a1)
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
	t1 = (T188f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T188f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T188f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T188f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T188*)(C))->a1), l3));
						if (t2) {
							t1 = (T188f4(C));
							t5 = (T123f5(GE_void(((T188*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T188f4(C));
								t5 = (T188f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T188f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T188f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_VARIABLE_DECLARED_TWICE_ERROR.arguments */
T0* T188f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_VARIABLE_DECLARED_TWICE_ERROR.string_ */
T0* T188f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_SYMBOL_DECLARED_TOKEN_ERROR.default_message */
T0* T187f5(T0* C)
{
	T0* R = 0;
	R = (T187f3(C, ge167ov2618));
	return R;
}

/* PR_SYMBOL_DECLARED_TOKEN_ERROR.message */
T0* T187f3(T0* C, T0* a1)
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
	t1 = (T187f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T187f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T187f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T187f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T187*)(C))->a1), l3));
						if (t2) {
							t1 = (T187f4(C));
							t5 = (T123f5(GE_void(((T187*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T187f4(C));
								t5 = (T187f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T187f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T187f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_SYMBOL_DECLARED_TOKEN_ERROR.arguments */
T0* T187f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_SYMBOL_DECLARED_TOKEN_ERROR.string_ */
T0* T187f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_TOKEN_DECLARED_TWICE_ERROR.default_message */
T0* T186f5(T0* C)
{
	T0* R = 0;
	R = (T186f3(C, ge169ov2618));
	return R;
}

/* PR_TOKEN_DECLARED_TWICE_ERROR.message */
T0* T186f3(T0* C, T0* a1)
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
	t1 = (T186f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T186f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T186f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T186f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T186*)(C))->a1), l3));
						if (t2) {
							t1 = (T186f4(C));
							t5 = (T123f5(GE_void(((T186*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T186f4(C));
								t5 = (T186f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T186f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T186f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_TOKEN_DECLARED_TWICE_ERROR.arguments */
T0* T186f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_TOKEN_DECLARED_TWICE_ERROR.string_ */
T0* T186f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.default_message */
T0* T185f5(T0* C)
{
	T0* R = 0;
	R = (T185f3(C, ge168ov2618));
	return R;
}

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.message */
T0* T185f3(T0* C, T0* a1)
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
	t1 = (T185f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T185f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T185f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T185f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T185*)(C))->a1), l3));
						if (t2) {
							t1 = (T185f4(C));
							t5 = (T123f5(GE_void(((T185*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T185f4(C));
								t5 = (T185f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T185f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T185f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.arguments */
T0* T185f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.string_ */
T0* T185f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_INVALID_DOLLAR_N_ERROR.default_message */
T0* T176f5(T0* C)
{
	T0* R = 0;
	R = (T176f3(C, ge152ov2618));
	return R;
}

/* PR_INVALID_DOLLAR_N_ERROR.message */
T0* T176f3(T0* C, T0* a1)
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
	t1 = (T176f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T176f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T176f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T176f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T176*)(C))->a1), l3));
						if (t2) {
							t1 = (T176f4(C));
							t5 = (T123f5(GE_void(((T176*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T176f4(C));
								t5 = (T176f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T176f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T176f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_INVALID_DOLLAR_N_ERROR.arguments */
T0* T176f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_INVALID_DOLLAR_N_ERROR.string_ */
T0* T176f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_DANGEROUS_DOLLAR_N_ERROR.default_message */
T0* T175f5(T0* C)
{
	T0* R = 0;
	R = (T175f3(C, ge149ov2618));
	return R;
}

/* PR_DANGEROUS_DOLLAR_N_ERROR.message */
T0* T175f3(T0* C, T0* a1)
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
	t1 = (T175f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T175f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T175f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T175f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T175*)(C))->a1), l3));
						if (t2) {
							t1 = (T175f4(C));
							t5 = (T123f5(GE_void(((T175*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T175f4(C));
								t5 = (T175f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T175f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T175f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_DANGEROUS_DOLLAR_N_ERROR.arguments */
T0* T175f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_DANGEROUS_DOLLAR_N_ERROR.string_ */
T0* T175f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.default_message */
T0* T174f5(T0* C)
{
	T0* R = 0;
	R = (T174f3(C, ge166ov2618));
	return R;
}

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.message */
T0* T174f3(T0* C, T0* a1)
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
	t1 = (T174f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T174f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T174f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T174f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T174*)(C))->a1), l3));
						if (t2) {
							t1 = (T174f4(C));
							t5 = (T123f5(GE_void(((T174*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T174f4(C));
								t5 = (T174f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T174f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T174f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.arguments */
T0* T174f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.string_ */
T0* T174f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_TWO_STRINGS_TOKEN_ERROR.default_message */
T0* T173f5(T0* C)
{
	T0* R = 0;
	R = (T173f3(C, ge171ov2618));
	return R;
}

/* PR_TWO_STRINGS_TOKEN_ERROR.message */
T0* T173f3(T0* C, T0* a1)
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
	t1 = (T173f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T173f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T173f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T173f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T173*)(C))->a1), l3));
						if (t2) {
							t1 = (T173f4(C));
							t5 = (T123f5(GE_void(((T173*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T173f4(C));
								t5 = (T173f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T173f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T173f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_TWO_STRINGS_TOKEN_ERROR.arguments */
T0* T173f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_TWO_STRINGS_TOKEN_ERROR.string_ */
T0* T173f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.default_message */
T0* T172f5(T0* C)
{
	T0* R = 0;
	R = (T172f3(C, ge172ov2618));
	return R;
}

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.message */
T0* T172f3(T0* C, T0* a1)
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
	t1 = (T172f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T172f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T172f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T172f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T172*)(C))->a1), l3));
						if (t2) {
							t1 = (T172f4(C));
							t5 = (T123f5(GE_void(((T172*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T172f4(C));
								t5 = (T172f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T172f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T172f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.arguments */
T0* T172f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.string_ */
T0* T172f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_ALIAS_NAME_DEFINED_TWICE_ERROR.default_message */
T0* T171f5(T0* C)
{
	T0* R = 0;
	R = (T171f3(C, ge146ov2618));
	return R;
}

/* PR_ALIAS_NAME_DEFINED_TWICE_ERROR.message */
T0* T171f3(T0* C, T0* a1)
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
	t1 = (T171f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T171f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T171f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T171f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T171*)(C))->a1), l3));
						if (t2) {
							t1 = (T171f4(C));
							t5 = (T123f5(GE_void(((T171*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T171f4(C));
								t5 = (T171f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T171f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T171f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_ALIAS_NAME_DEFINED_TWICE_ERROR.arguments */
T0* T171f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_ALIAS_NAME_DEFINED_TWICE_ERROR.string_ */
T0* T171f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_ALIAS_NAME_NOT_DEFINED_ERROR.default_message */
T0* T170f5(T0* C)
{
	T0* R = 0;
	R = (T170f3(C, ge147ov2618));
	return R;
}

/* PR_ALIAS_NAME_NOT_DEFINED_ERROR.message */
T0* T170f3(T0* C, T0* a1)
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
	t1 = (T170f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T170f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T170f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T170f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T170*)(C))->a1), l3));
						if (t2) {
							t1 = (T170f4(C));
							t5 = (T123f5(GE_void(((T170*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T170f4(C));
								t5 = (T170f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T170f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T170f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_ALIAS_NAME_NOT_DEFINED_ERROR.arguments */
T0* T170f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_ALIAS_NAME_NOT_DEFINED_ERROR.string_ */
T0* T170f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_LAST_VALUE_NAME_USED_TWICE_ERROR.default_message */
T0* T169f5(T0* C)
{
	T0* R = 0;
	R = (T169f3(C, ge155ov2618));
	return R;
}

/* PR_LAST_VALUE_NAME_USED_TWICE_ERROR.message */
T0* T169f3(T0* C, T0* a1)
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
	t1 = (T169f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T169f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T169f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T169f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T169*)(C))->a1), l3));
						if (t2) {
							t1 = (T169f4(C));
							t5 = (T123f5(GE_void(((T169*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T169f4(C));
								t5 = (T169f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T169f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T169f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_LAST_VALUE_NAME_USED_TWICE_ERROR.arguments */
T0* T169f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_LAST_VALUE_NAME_USED_TWICE_ERROR.string_ */
T0* T169f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_ALIAS_NAME_UNDEFINED_ERROR.default_message */
T0* T168f5(T0* C)
{
	T0* R = 0;
	R = (T168f3(C, ge148ov2618));
	return R;
}

/* PR_ALIAS_NAME_UNDEFINED_ERROR.message */
T0* T168f3(T0* C, T0* a1)
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
	t1 = (T168f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T168f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T168f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T168f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T168*)(C))->a1), l3));
						if (t2) {
							t1 = (T168f4(C));
							t5 = (T123f5(GE_void(((T168*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T168f4(C));
								t5 = (T168f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T168f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T168f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_ALIAS_NAME_UNDEFINED_ERROR.arguments */
T0* T168f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_ALIAS_NAME_UNDEFINED_ERROR.string_ */
T0* T168f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_UNDEFINED_SYMBOL_ERROR.default_message */
T0* T167f5(T0* C)
{
	T0* R = 0;
	R = (T167f3(C, ge174ov2618));
	return R;
}

/* PR_UNDEFINED_SYMBOL_ERROR.message */
T0* T167f3(T0* C, T0* a1)
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
	t1 = (T167f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T167f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T167f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T167f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T167*)(C))->a1), l3));
						if (t2) {
							t1 = (T167f4(C));
							t5 = (T123f5(GE_void(((T167*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T167f4(C));
								t5 = (T167f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T167f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T167f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_UNDEFINED_SYMBOL_ERROR.arguments */
T0* T167f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_UNDEFINED_SYMBOL_ERROR.string_ */
T0* T167f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_TOKEN_ID_USED_TWICE_ERROR.default_message */
T0* T166f5(T0* C)
{
	T0* R = 0;
	R = (T166f3(C, ge170ov2618));
	return R;
}

/* PR_TOKEN_ID_USED_TWICE_ERROR.message */
T0* T166f3(T0* C, T0* a1)
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
	t1 = (T166f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T166f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T166f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T166f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T166*)(C))->a1), l3));
						if (t2) {
							t1 = (T166f4(C));
							t5 = (T123f5(GE_void(((T166*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T166f4(C));
								t5 = (T166f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T166f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T166f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_TOKEN_ID_USED_TWICE_ERROR.arguments */
T0* T166f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_TOKEN_ID_USED_TWICE_ERROR.string_ */
T0* T166f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_UNKNOWN_START_SYMBOL_ERROR.default_message */
T0* T165f5(T0* C)
{
	T0* R = 0;
	R = (T165f3(C, ge175ov2618));
	return R;
}

/* PR_UNKNOWN_START_SYMBOL_ERROR.message */
T0* T165f3(T0* C, T0* a1)
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
	t1 = (T165f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T165f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T165f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T165f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T165*)(C))->a1), l3));
						if (t2) {
							t1 = (T165f4(C));
							t5 = (T123f5(GE_void(((T165*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T165f4(C));
								t5 = (T165f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T165f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T165f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_UNKNOWN_START_SYMBOL_ERROR.arguments */
T0* T165f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_UNKNOWN_START_SYMBOL_ERROR.string_ */
T0* T165f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_START_SYMBOL_TOKEN_ERROR.default_message */
T0* T164f5(T0* C)
{
	T0* R = 0;
	R = (T164f3(C, ge165ov2618));
	return R;
}

/* PR_START_SYMBOL_TOKEN_ERROR.message */
T0* T164f3(T0* C, T0* a1)
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
	t1 = (T164f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T164f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T164f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T164f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T164*)(C))->a1), l3));
						if (t2) {
							t1 = (T164f4(C));
							t5 = (T123f5(GE_void(((T164*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T164f4(C));
								t5 = (T164f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T164f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T164f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_START_SYMBOL_TOKEN_ERROR.arguments */
T0* T164f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_START_SYMBOL_TOKEN_ERROR.string_ */
T0* T164f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_INTEGER_TOO_LARGE_ERROR.default_message */
T0* T163f5(T0* C)
{
	T0* R = 0;
	R = (T163f3(C, ge150ov2618));
	return R;
}

/* PR_INTEGER_TOO_LARGE_ERROR.message */
T0* T163f3(T0* C, T0* a1)
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
	t1 = (T163f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T163f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T163f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T163f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T163*)(C))->a1), l3));
						if (t2) {
							t1 = (T163f4(C));
							t5 = (T123f5(GE_void(((T163*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T163f4(C));
								t5 = (T163f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T163f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T163f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_INTEGER_TOO_LARGE_ERROR.arguments */
T0* T163f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_INTEGER_TOO_LARGE_ERROR.string_ */
T0* T163f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_INVALID_DOLLAR_DOLLAR_ERROR.default_message */
T0* T162f5(T0* C)
{
	T0* R = 0;
	R = (T162f3(C, ge151ov2618));
	return R;
}

/* PR_INVALID_DOLLAR_DOLLAR_ERROR.message */
T0* T162f3(T0* C, T0* a1)
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
	t1 = (T162f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T162f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T162f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T162f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T162*)(C))->a1), l3));
						if (t2) {
							t1 = (T162f4(C));
							t5 = (T123f5(GE_void(((T162*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T162f4(C));
								t5 = (T162f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T162f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T162f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_INVALID_DOLLAR_DOLLAR_ERROR.arguments */
T0* T162f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_INVALID_DOLLAR_DOLLAR_ERROR.string_ */
T0* T162f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_INVALID_STRING_TOKEN_ERROR.default_message */
T0* T161f5(T0* C)
{
	T0* R = 0;
	R = (T161f3(C, ge154ov2618));
	return R;
}

/* PR_INVALID_STRING_TOKEN_ERROR.message */
T0* T161f3(T0* C, T0* a1)
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
	t1 = (T161f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T161f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T161f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T161f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T161*)(C))->a1), l3));
						if (t2) {
							t1 = (T161f4(C));
							t5 = (T123f5(GE_void(((T161*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T161f4(C));
								t5 = (T161f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T161f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T161f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_INVALID_STRING_TOKEN_ERROR.arguments */
T0* T161f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_INVALID_STRING_TOKEN_ERROR.string_ */
T0* T161f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_NULL_INTEGER_ERROR.default_message */
T0* T160f5(T0* C)
{
	T0* R = 0;
	R = (T160f3(C, ge160ov2618));
	return R;
}

/* PR_NULL_INTEGER_ERROR.message */
T0* T160f3(T0* C, T0* a1)
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
	t1 = (T160f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T160f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T160f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T160f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T160*)(C))->a1), l3));
						if (t2) {
							t1 = (T160f4(C));
							t5 = (T123f5(GE_void(((T160*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T160f4(C));
								t5 = (T160f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T160f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T160f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_NULL_INTEGER_ERROR.arguments */
T0* T160f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_NULL_INTEGER_ERROR.string_ */
T0* T160f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_MISSING_CHARACTERS_ERROR.default_message */
T0* T159f5(T0* C)
{
	T0* R = 0;
	R = (T159f3(C, ge157ov2618));
	return R;
}

/* PR_MISSING_CHARACTERS_ERROR.message */
T0* T159f3(T0* C, T0* a1)
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
	t1 = (T159f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T159f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T159f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T159f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T159*)(C))->a1), l3));
						if (t2) {
							t1 = (T159f4(C));
							t5 = (T123f5(GE_void(((T159*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T159f4(C));
								t5 = (T159f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T159f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T159f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_MISSING_CHARACTERS_ERROR.arguments */
T0* T159f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_MISSING_CHARACTERS_ERROR.string_ */
T0* T159f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_PREC_NOT_TOKEN_ERROR.default_message */
T0* T158f5(T0* C)
{
	T0* R = 0;
	R = (T158f3(C, ge162ov2618));
	return R;
}

/* PR_PREC_NOT_TOKEN_ERROR.message */
T0* T158f3(T0* C, T0* a1)
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
	t1 = (T158f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T158f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T158f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T158f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T158*)(C))->a1), l3));
						if (t2) {
							t1 = (T158f4(C));
							t5 = (T123f5(GE_void(((T158*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T158f4(C));
								t5 = (T158f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T158f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T158f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_PREC_NOT_TOKEN_ERROR.arguments */
T0* T158f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_PREC_NOT_TOKEN_ERROR.string_ */
T0* T158f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_PREC_SPECIFIED_TWICE_ERROR.default_message */
T0* T157f5(T0* C)
{
	T0* R = 0;
	R = (T157f3(C, ge163ov2618));
	return R;
}

/* PR_PREC_SPECIFIED_TWICE_ERROR.message */
T0* T157f3(T0* C, T0* a1)
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
	t1 = (T157f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T157f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T157f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T157f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T157*)(C))->a1), l3));
						if (t2) {
							t1 = (T157f4(C));
							t5 = (T123f5(GE_void(((T157*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T157f4(C));
								t5 = (T157f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T157f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T157f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_PREC_SPECIFIED_TWICE_ERROR.arguments */
T0* T157f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_PREC_SPECIFIED_TWICE_ERROR.string_ */
T0* T157f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_INVALID_ERROR_N_ERROR.default_message */
T0* T156f5(T0* C)
{
	T0* R = 0;
	R = (T156f3(C, ge153ov2618));
	return R;
}

/* PR_INVALID_ERROR_N_ERROR.message */
T0* T156f3(T0* C, T0* a1)
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
	t1 = (T156f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T156f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T156f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T156f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T156*)(C))->a1), l3));
						if (t2) {
							t1 = (T156f4(C));
							t5 = (T123f5(GE_void(((T156*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T156f4(C));
								t5 = (T156f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T156f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T156f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_INVALID_ERROR_N_ERROR.arguments */
T0* T156f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_INVALID_ERROR_N_ERROR.string_ */
T0* T156f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_RULE_DECLARED_TWICE_ERROR.default_message */
T0* T155f5(T0* C)
{
	T0* R = 0;
	R = (T155f3(C, ge164ov2618));
	return R;
}

/* PR_RULE_DECLARED_TWICE_ERROR.message */
T0* T155f3(T0* C, T0* a1)
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
	t1 = (T155f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T155f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T155f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T155f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T155*)(C))->a1), l3));
						if (t2) {
							t1 = (T155f4(C));
							t5 = (T123f5(GE_void(((T155*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T155f4(C));
								t5 = (T155f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T155f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T155f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_RULE_DECLARED_TWICE_ERROR.arguments */
T0* T155f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_RULE_DECLARED_TWICE_ERROR.string_ */
T0* T155f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_LHS_SYMBOL_TOKEN_ERROR.default_message */
T0* T154f5(T0* C)
{
	T0* R = 0;
	R = (T154f3(C, ge156ov2618));
	return R;
}

/* PR_LHS_SYMBOL_TOKEN_ERROR.message */
T0* T154f3(T0* C, T0* a1)
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
	t1 = (T154f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T154f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T154f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T154f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T154*)(C))->a1), l3));
						if (t2) {
							t1 = (T154f4(C));
							t5 = (T123f5(GE_void(((T154*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T154f4(C));
								t5 = (T154f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T154f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T154f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_LHS_SYMBOL_TOKEN_ERROR.arguments */
T0* T154f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_LHS_SYMBOL_TOKEN_ERROR.string_ */
T0* T154f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_NO_RULES_ERROR.default_message */
T0* T153f5(T0* C)
{
	T0* R = 0;
	R = (T153f3(C, ge159ov2618));
	return R;
}

/* PR_NO_RULES_ERROR.message */
T0* T153f3(T0* C, T0* a1)
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
	t1 = (T153f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T153f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T153f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T153f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T153*)(C))->a1), l3));
						if (t2) {
							t1 = (T153f4(C));
							t5 = (T123f5(GE_void(((T153*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T153f4(C));
								t5 = (T153f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T153f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T153f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_NO_RULES_ERROR.arguments */
T0* T153f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_NO_RULES_ERROR.string_ */
T0* T153f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* PR_MULTIPLE_START_DECLARATIONS_ERROR.default_message */
T0* T152f5(T0* C)
{
	T0* R = 0;
	R = (T152f3(C, ge158ov2618));
	return R;
}

/* PR_MULTIPLE_START_DECLARATIONS_ERROR.message */
T0* T152f3(T0* C, T0* a1)
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
	t1 = (T152f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T152f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T152f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T152f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T152*)(C))->a1), l3));
						if (t2) {
							t1 = (T152f4(C));
							t5 = (T123f5(GE_void(((T152*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T152f4(C));
								t5 = (T152f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T152f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T152f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* PR_MULTIPLE_START_DECLARATIONS_ERROR.arguments */
T0* T152f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* PR_MULTIPLE_START_DECLARATIONS_ERROR.string_ */
T0* T152f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T150f5(T0* C)
{
	T0* R = 0;
	R = (T150f3(C, ge217ov2618));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T150f3(T0* C, T0* a1)
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
	t1 = (T150f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T150f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T150f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T150f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T150*)(C))->a1), l3));
						if (t2) {
							t1 = (T150f4(C));
							t5 = (T123f5(GE_void(((T150*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T150f4(C));
								t5 = (T150f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T150f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T150f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_SYNTAX_ERROR.arguments */
T0* T150f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T150f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T62f5(T0* C)
{
	T0* R = 0;
	R = (T62f3(C, ge215ov2618));
	return R;
}

/* UT_MESSAGE.message */
T0* T62f3(T0* C, T0* a1)
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
	t1 = (T62f4(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T62f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T62f4(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T62f4(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T62*)(C))->a1), l3));
						if (t2) {
							t1 = (T62f4(C));
							t5 = (T123f5(GE_void(((T62*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T62f4(C));
								t5 = (T62f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T62f4(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T62f4(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_MESSAGE.arguments */
T0* T62f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T62f4(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* UT_USAGE_MESSAGE.default_message */
T0* T56f2(T0* C)
{
	T0* R = 0;
	R = (T56f4(C, ge221ov2618));
	return R;
}

/* UT_USAGE_MESSAGE.message */
T0* T56f4(T0* C, T0* a1)
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
	t1 = (T56f5(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T56f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T56f5(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T56f5(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T56*)(C))->a1), l3));
						if (t2) {
							t1 = (T56f5(C));
							t5 = (T123f5(GE_void(((T56*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T56f5(C));
								t5 = (T56f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T56f5(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T56f5(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_USAGE_MESSAGE.arguments */
T0* T56f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* UT_USAGE_MESSAGE.string_ */
T0* T56f5(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T55f2(T0* C)
{
	T0* R = 0;
	R = (T55f4(C, ge222ov2618));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T55f4(T0* C, T0* a1)
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
	t1 = (T55f5(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T55f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T55f5(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T55f5(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T55*)(C))->a1), l3));
						if (t2) {
							t1 = (T55f5(C));
							t5 = (T123f5(GE_void(((T55*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T55f5(C));
								t5 = (T55f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T55f5(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T55f5(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_VERSION_NUMBER.arguments */
T0* T55f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T55f5(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T52f2(T0* C)
{
	T0* R = 0;
	R = (T52f4(C, ge211ov2618));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T52f4(T0* C, T0* a1)
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
	t1 = (T52f5(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T52f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T52f5(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T52f5(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T52*)(C))->a1), l3));
						if (t2) {
							t1 = (T52f5(C));
							t5 = (T123f5(GE_void(((T52*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T52f5(C));
								t5 = (T52f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T52f5(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T52f5(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.arguments */
T0* T52f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T52f5(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T25f2(T0* C)
{
	T0* R = 0;
	R = (T25f4(C, ge212ov2618));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T25f4(T0* C, T0* a1)
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
	t1 = (T25f5(C));
	R = (T118f4(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f14(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				T17f33(GE_void(R), l5);
			} else {
				t1 = (T25f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T118f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				T17f33(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f14(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					T17f33(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T25f5(C));
					l1 = (T118f4(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									T17f33(GE_void(l1), l5);
								} else {
									t1 = (T25f5(C));
									T118f14(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f14(a1, l2));
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
								T17f33(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17f15(GE_void(l1)));
					if (t2) {
						l3 = (T17f16(GE_void(l1)));
						t2 = (T123f4(GE_void(((T25*)(C))->a1), l3));
						if (t2) {
							t1 = (T25f5(C));
							t5 = (T123f5(GE_void(((T25*)(C))->a1), l3));
							R = (T118f6(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T25f5(C));
								t5 = (T25f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T118f6(GE_void(t1), R, t5));
							} else {
								T17f33(GE_void(R), (T2)('$'));
								if (l7) {
									T17f33(GE_void(R), (T2)('{'));
								}
								t1 = (T25f5(C));
								R = (T118f6(GE_void(t1), R, l1));
								if (l8) {
									T17f33(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f33(GE_void(R), (T2)('$'));
						if (l7) {
							T17f33(GE_void(R), (T2)('{'));
						}
						t1 = (T25f5(C));
						R = (T118f6(GE_void(t1), R, l1));
						if (l8) {
							T17f33(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
T0* T25f6(T0* C)
{
	T0* R = 0;
	if (ge344os1749) {
		return ge344ov1749;
	} else {
		ge344os1749 = '\1';
		ge344ov1749 = R;
	}
	R = T27c4();
	ge344ov1749 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T25f5(T0* C)
{
	T0* R = 0;
	if (ge273os1751) {
		return ge273ov1751;
	} else {
		ge273os1751 = '\1';
		ge273ov1751 = R;
	}
	R = T118c13();
	ge273ov1751 = R;
	return R;
}

T0* GE_ma102(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new101(c, EIF_FALSE);
	*(T101*)t1 = GE_default101;
	((T101*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T6 *i = ((T101*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = GE_new102(EIF_TRUE);
	((T102*)(R))->a1 = t1;
	((T102*)(R))->a2 = 1;
	((T102*)(R))->a3 = c;
	return R;
}

T0* ge336ov1747;
T0* ge185ov1815;
T0* ge223ov5516;
T0* ge223ov5515;
T0* ge223ov5514;
T0* ge223ov5513;
T0* ge278ov5505;
T0* ge316ov1892;
T0* ge409ov1892;
T0* ge185ov1817;
T0* ge314ov1892;
T0* ge300ov1922;
T0* ge207ov3894;
T0* ge315ov4863;
T0* ge302ov4576;
T0* ge51ov1741;
T0* ge161ov2618;
T0* ge173ov2618;
T0* ge176ov2618;
T0* ge167ov2618;
T0* ge169ov2618;
T0* ge168ov2618;
T0* ge152ov2618;
T0* ge149ov2618;
T0* ge166ov2618;
T0* ge171ov2618;
T0* ge172ov2618;
T0* ge146ov2618;
T0* ge147ov2618;
T0* ge155ov2618;
T0* ge148ov2618;
T0* ge174ov2618;
T0* ge170ov2618;
T0* ge175ov2618;
T0* ge165ov2618;
T0* ge150ov2618;
T0* ge151ov2618;
T0* ge154ov2618;
T0* ge160ov2618;
T0* ge157ov2618;
T0* ge162ov2618;
T0* ge163ov2618;
T0* ge153ov2618;
T0* ge164ov2618;
T0* ge156ov2618;
T0* ge159ov2618;
T0* ge158ov2618;
T0* ge217ov2618;
T0* ge215ov2618;
T0* ge221ov2618;
T0* ge222ov2618;
T0* ge211ov2618;
T0* ge212ov2618;

void GE_const_init()
{
	ge336ov1747 = (GE_ms8("3.9", 3));
	ge185ov1815 = (GE_ms8("\t\t\t", 3));
	ge223ov5516 = (GE_ms8("\t\t\t", 3));
	ge223ov5515 = (GE_ms8("    ", 4));
	ge223ov5514 = (GE_ms8("   ", 3));
	ge223ov5513 = (GE_ms8("  ", 2));
	ge278ov5505 = (GE_ms8("", 0));
	ge316ov1892 = (GE_ms8("\n", 1));
	ge409ov1892 = (GE_ms8("\n", 1));
	ge185ov1817 = (GE_ms8("standard input", 14));
	ge314ov1892 = (GE_ms8("\n", 1));
	ge300ov1922 = (GE_ms8("empty_name", 10));
	ge207ov3894 = (GE_ms8("like current", 12));
	ge315ov4863 = (GE_ms8("", 0));
	ge302ov4576 = (GE_ms8("", 0));
	ge51ov1741 = (GE_ms8(".e", 2));
	ge161ov2618 = (GE_ms8("\"$1\", line $2: precedence of $3 defined twice", 45));
	ge173ov2618 = (GE_ms8("\"$1\", line $2: undefined literal string token $3", 48));
	ge176ov2618 = (GE_ms8("\"$1\", line $2: nonterminal $3 declared twice", 44));
	ge167ov2618 = (GE_ms8("\"$1\", line $2: symbol $3 is already declared as a token", 55));
	ge169ov2618 = (GE_ms8("\"$1\", line $2: token $3 declared twice", 38));
	ge168ov2618 = (GE_ms8("\"$1\", line $2: symbol $3 is already declared as a nonterminal", 61));
	ge152ov2618 = (GE_ms8("\"$1\", line $2: invalid use of $$$3 in semantic action", 53));
	ge149ov2618 = (GE_ms8("Warning, \"$1\", line $2: dangerous use of $$$3 in semantic action", 64));
	ge166ov2618 = (GE_ms8("\"$1\", line $2: literal string $3 defined twice with $4 and $5", 61));
	ge171ov2618 = (GE_ms8("\"$1\", line $2: token $3 associated with two literal strings $4 and $5", 69));
	ge172ov2618 = (GE_ms8("\"$1\", line $2: token $3 has two different ids $4 and $5", 55));
	ge146ov2618 = (GE_ms8("\"$1\", line $2: each \045token declaration with type \'$3\' should have the same alias name which has already been defined as \'$4\'", 124));
	ge147ov2618 = (GE_ms8("\"$1\", line $2: alias name \'$4\' for type \'$3\' should have been defined in previous \045token declarations with that type", 116));
	ge155ov2618 = (GE_ms8("\"$1\", line $2: \'$3\' is the name of the variable used to pass values for tokens both of type \'$4\' and \'$5\'", 105));
	ge148ov2618 = (GE_ms8("\"$1\", line $2: alias name \'$4\' for type \'$3\' should be repeated in each \045token declaration with that type", 105));
	ge174ov2618 = (GE_ms8("\"$1\": undefined symbol $2", 25));
	ge170ov2618 = (GE_ms8("Warning, \"$1\": tokens $2 and $3 both assigned number $4", 55));
	ge175ov2618 = (GE_ms8("\"$1\", line $2: unknown start symbol $3", 38));
	ge165ov2618 = (GE_ms8("\"$1\", line $2: start symbol $3 is a token", 41));
	ge150ov2618 = (GE_ms8("\"$1\", line $2: integer $3 too large (implementation limitation)", 63));
	ge151ov2618 = (GE_ms8("\"$1\", line $2: invalid use of $$$$ in error action", 50));
	ge154ov2618 = (GE_ms8("\"$1\", line $2: literal string tokens must have a least two characters ($3)", 74));
	ge160ov2618 = (GE_ms8("\"$1\", line $2: integer cannot be null", 37));
	ge157ov2618 = (GE_ms8("\"$1\", line $2: missing $3", 25));
	ge162ov2618 = (GE_ms8("\"$1\", line $2: symbol $3 after \045prec is not a token", 51));
	ge163ov2618 = (GE_ms8("\"$1\", line $2: \045prec specified twice", 36));
	ge153ov2618 = (GE_ms8("\"$1\", line $2: invalid use of \045error($3) in rule", 48));
	ge164ov2618 = (GE_ms8("Warning, \"$1\", line $2: rule $3 declared twice", 46));
	ge156ov2618 = (GE_ms8("\"$1\", line $2: left-hand-side symbol $3 is a token", 50));
	ge159ov2618 = (GE_ms8("\"$1\": no rules in input grammar", 31));
	ge158ov2618 = (GE_ms8("\"$1\", line $2: multiple \045start declarations", 43));
	ge217ov2618 = (GE_ms8("Syntax error in \"$1\" at line $2", 31));
	ge215ov2618 = (GE_ms8("$1", 2));
	ge221ov2618 = (GE_ms8("usage: $0 $1", 12));
	ge222ov2618 = (GE_ms8("$0 version $1", 13));
	ge211ov2618 = (GE_ms8("$0: cannot read \'$1\'", 20));
	ge212ov2618 = (GE_ms8("$0: cannot write to \'$1\'", 24));
}

EIF_TYPE GE_types[327] = {
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
{0, 24, EIF_FALSE, &T24f21},
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
{0, 50, EIF_FALSE, 0},
{0, 51, EIF_FALSE, &T51f37},
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
{0, 79, EIF_FALSE, 0},
{0, 80, EIF_FALSE, 0},
{0, 81, EIF_FALSE, 0},
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
{0, 96, EIF_TRUE, 0},
{0, 97, EIF_FALSE, 0},
{0, 98, EIF_FALSE, 0},
{0, 99, EIF_FALSE, 0},
{0, 100, EIF_FALSE, 0},
{0, 101, EIF_TRUE, 0},
{0, 102, EIF_FALSE, 0},
{0, 103, EIF_FALSE, 0},
{0, 104, EIF_FALSE, 0},
{0, 105, EIF_FALSE, 0},
{0, 106, EIF_FALSE, 0},
{0, 107, EIF_FALSE, 0},
{0, 108, EIF_FALSE, 0},
{0, 109, EIF_FALSE, 0},
{0, 110, EIF_FALSE, 0},
{0, 111, EIF_FALSE, 0},
{0, 112, EIF_FALSE, 0},
{0, 113, EIF_FALSE, 0},
{0, 114, EIF_FALSE, 0},
{0, 115, EIF_FALSE, 0},
{0, 116, EIF_TRUE, 0},
{0, 117, EIF_FALSE, 0},
{0, 118, EIF_FALSE, 0},
{0, 119, EIF_FALSE, 0},
{0, 120, EIF_FALSE, 0},
{0, 121, EIF_FALSE, 0},
{0, 122, EIF_TRUE, 0},
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
{0, 133, EIF_TRUE, 0},
{0, 134, EIF_FALSE, 0},
{0, 135, EIF_FALSE, 0},
{0, 136, EIF_FALSE, 0},
{0, 137, EIF_FALSE, 0},
{0, 138, EIF_FALSE, 0},
{0, 139, EIF_TRUE, 0},
{0, 140, EIF_FALSE, 0},
{0, 141, EIF_TRUE, 0},
{0, 142, EIF_TRUE, 0},
{0, 143, EIF_FALSE, 0},
{0, 144, EIF_TRUE, 0},
{0, 145, EIF_FALSE, 0},
{0, 146, EIF_FALSE, 0},
{0, 147, EIF_TRUE, 0},
{0, 148, EIF_FALSE, 0},
{0, 149, EIF_FALSE, 0},
{0, 150, EIF_FALSE, 0},
{0, 151, EIF_FALSE, 0},
{0, 152, EIF_FALSE, 0},
{0, 153, EIF_FALSE, 0},
{0, 154, EIF_FALSE, 0},
{0, 155, EIF_FALSE, 0},
{0, 156, EIF_FALSE, 0},
{0, 157, EIF_FALSE, 0},
{0, 158, EIF_FALSE, 0},
{0, 159, EIF_FALSE, 0},
{0, 160, EIF_FALSE, 0},
{0, 161, EIF_FALSE, 0},
{0, 162, EIF_FALSE, 0},
{0, 163, EIF_FALSE, 0},
{0, 164, EIF_FALSE, 0},
{0, 165, EIF_FALSE, 0},
{0, 166, EIF_FALSE, 0},
{0, 167, EIF_FALSE, 0},
{0, 168, EIF_FALSE, 0},
{0, 169, EIF_FALSE, 0},
{0, 170, EIF_FALSE, 0},
{0, 171, EIF_FALSE, 0},
{0, 172, EIF_FALSE, 0},
{0, 173, EIF_FALSE, 0},
{0, 174, EIF_FALSE, 0},
{0, 175, EIF_FALSE, 0},
{0, 176, EIF_FALSE, 0},
{0, 177, EIF_FALSE, 0},
{0, 178, EIF_FALSE, 0},
{0, 179, EIF_FALSE, 0},
{0, 180, EIF_FALSE, 0},
{0, 181, EIF_FALSE, 0},
{0, 182, EIF_FALSE, 0},
{0, 183, EIF_FALSE, 0},
{0, 184, EIF_FALSE, 0},
{0, 185, EIF_FALSE, 0},
{0, 186, EIF_FALSE, 0},
{0, 187, EIF_FALSE, 0},
{0, 188, EIF_FALSE, 0},
{0, 189, EIF_FALSE, 0},
{0, 190, EIF_FALSE, 0},
{0, 191, EIF_FALSE, 0},
{0, 192, EIF_FALSE, 0},
{0, 193, EIF_FALSE, 0},
{0, 194, EIF_TRUE, 0},
{0, 195, EIF_FALSE, 0},
{0, 196, EIF_FALSE, 0},
{0, 197, EIF_FALSE, 0},
{0, 198, EIF_FALSE, 0},
{0, 199, EIF_FALSE, 0},
{0, 200, EIF_FALSE, 0},
{0, 201, EIF_FALSE, 0},
{0, 202, EIF_TRUE, 0},
{0, 203, EIF_FALSE, 0},
{0, 204, EIF_FALSE, 0},
{0, 205, EIF_FALSE, 0},
{0, 206, EIF_TRUE, 0},
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
{0, 218, EIF_TRUE, 0},
{0, 219, EIF_FALSE, 0},
{0, 220, EIF_FALSE, 0},
{0, 221, EIF_FALSE, 0},
{0, 222, EIF_TRUE, 0},
{0, 223, EIF_FALSE, 0},
{0, 224, EIF_TRUE, 0},
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
{0, 238, EIF_TRUE, 0},
{0, 239, EIF_FALSE, 0},
{0, 240, EIF_FALSE, 0},
{0, 241, EIF_FALSE, 0},
{0, 242, EIF_FALSE, 0},
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
{0, 267, EIF_TRUE, 0},
{0, 268, EIF_FALSE, 0},
{0, 269, EIF_TRUE, 0},
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
{0, 284, EIF_TRUE, 0},
{0, 285, EIF_FALSE, 0},
{0, 286, EIF_FALSE, 0},
{0, 287, EIF_FALSE, 0},
{0, 288, EIF_FALSE, 0},
{0, 289, EIF_FALSE, 0},
{0, 290, EIF_FALSE, 0},
{0, 291, EIF_FALSE, 0},
{0, 292, EIF_FALSE, 0},
{0, 293, EIF_TRUE, 0},
{0, 294, EIF_FALSE, 0},
{0, 295, EIF_FALSE, 0},
{0, 296, EIF_FALSE, 0},
{0, 297, EIF_FALSE, 0},
{0, 298, EIF_TRUE, 0},
{0, 299, EIF_FALSE, 0},
{0, 300, EIF_FALSE, 0},
{0, 301, EIF_TRUE, 0},
{0, 302, EIF_TRUE, 0},
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
{0, 322, EIF_TRUE, 0},
{0, 323, EIF_FALSE, 0},
{0, 324, EIF_FALSE, 0},
{0, 325, EIF_FALSE, 0},
{0, 326, EIF_FALSE, 0}
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
	t1 = T21c18();
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
